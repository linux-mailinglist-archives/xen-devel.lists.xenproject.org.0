Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC83168F5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83620.156057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qKb-00028z-5q; Wed, 10 Feb 2021 14:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83620.156057; Wed, 10 Feb 2021 14:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qKb-00028d-2f; Wed, 10 Feb 2021 14:19:01 +0000
Received: by outflank-mailman (input) for mailman id 83620;
 Wed, 10 Feb 2021 14:19:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9qKa-00028Y-A9
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:19:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba50ed03-d14e-4779-846b-a9a9a5f456e2;
 Wed, 10 Feb 2021 14:18:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BFDFAC97;
 Wed, 10 Feb 2021 14:18:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ba50ed03-d14e-4779-846b-a9a9a5f456e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612966738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5W6aM15Fq4rJcOiUrhfLnfzkJvWfXae7DM4qOUMMC1A=;
	b=fqYiqRvijDI/AmSr2xK79l0iindQ0hAb9RfszroOmsU1M9Mxb+WXFAzjE11JNsihL7FAaJ
	tQyiE1nOQW8xB2M5BgKeoOr+Us+A06cUW7ABoje7v73vOvQ5MARqOYmTya4h86rUqJiIvY
	lzUe53yEZNrLuZ3BaOjyYIu3GRGnNXc=
Subject: Re: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
 <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
 <2eed5630-3e23-3005-245e-989893fc8476@suse.com>
 <bf31a01e-4a32-5938-c158-38923100355d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77fda392-6f6a-c8b0-f1ea-15b917245f5e@suse.com>
Date: Wed, 10 Feb 2021 15:18:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bf31a01e-4a32-5938-c158-38923100355d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 15:02, Andrew Cooper wrote:
> On 10/02/2021 13:54, Jan Beulich wrote:
>> On 10.02.2021 13:28, Andrew Cooper wrote:
>>> On 10/02/2021 09:57, Jan Beulich wrote:
>>>> When invoked by compat mode, mode_64bit() will be false at the start of
>>>> emulation. The logic after complete_insn, however, needs to consider the
>>>> mode switched into, in particular to avoid truncating RIP.
>>>>
>>>> Inspired by / paralleling and extending Linux commit 943dea8af21b ("KVM:
>>>> x86: Update emulator context mode if SYSENTER xfers to 64-bit mode").
>>>>
>>>> While there, tighten a related assertion in x86_emulate_wrapper() - we
>>>> want to be sure to not switch into an impossible mode when the code gets
>>>> built for 32-bit only (as is possible for the test harness).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> In principle we could drop SYSENTER's ctxt->lma dependency when setting
>>>> _regs.r(ip). I wasn't certain whether leaving it as is serves as kind of
>>>> documentation ...
>>>>
>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -6127,6 +6127,10 @@ x86_emulate(
>>>>               (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) )
>>>>              goto done;
>>>>  
>>>> +        if ( ctxt->lma )
>>>> +            /* In particular mode_64bit() needs to return true from here on. */
>>>> +            ctxt->addr_size = ctxt->sp_size = 64;
>>> I think this is fine as presented, but don't we want the logical
>>> opposite for SYSRET/SYSEXIT ?
>>>
>>> We truncate rip suitably already,
>> This is why I left them alone, i.e. ...
>>
>>> but don't know what other checks may appear in the future.
>> ... I thought we would deal with this if and when such checks
>> would appear.
> 
> Ok.  Reviewed-by: Andrew Cooper <andrew.cooper3@citirix.com>

Thanks.

>> Just like considered in the post-description
>> remark, we could drop the conditional part from sysexit's
>> setting of _regs.r(ip), and _then_ we would indeed need a
>> respective change there, for the truncation to happen at
>> complete_insn:.
> 
> I think it would look odd changing just rip and not rsp truncation.

Yes, this was another consideration of mine as well. But it
is a fact that we treat rip and rsp differently in this
regard. Perhaps generated code overall could benefit from
treating rsp more like rip, but this would need careful
looking at all the involved pieces - especially in cases
where the updated stack pointer gets further used we may
not be able to defer the truncation to complete_insn:.

Jan

