Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312DC31685E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83608.155998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pwx-00085Y-2F; Wed, 10 Feb 2021 13:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83608.155998; Wed, 10 Feb 2021 13:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pww-000856-Tu; Wed, 10 Feb 2021 13:54:34 +0000
Received: by outflank-mailman (input) for mailman id 83608;
 Wed, 10 Feb 2021 13:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9pwv-00084y-Gq
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 13:54:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d961a3b7-a242-4333-8dcf-34e00102ec04;
 Wed, 10 Feb 2021 13:54:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 482CCACBF;
 Wed, 10 Feb 2021 13:54:31 +0000 (UTC)
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
X-Inumbo-ID: d961a3b7-a242-4333-8dcf-34e00102ec04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612965271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oRBAvtl+Q8sPQoGsn5VbLvJ8fGKg4gthf78AOEzXqc=;
	b=nmQYRLnydaDmCXpsHAu8TWA4ondGQKrLbg3m48BMZ9hiFT1pj1ajQPj8twoW9z5/BvaW+K
	YYetU0ke3RZl5i7g8IQXQV8HyQcNwF+x0xUVvRq/NbJQTNPJIiR0IBOIJyPEoPAagDkAEb
	V8bVSHNnTzfWltlZizJpDtq4YbuBDUQ=
Subject: Re: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
 <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2eed5630-3e23-3005-245e-989893fc8476@suse.com>
Date: Wed, 10 Feb 2021 14:54:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 13:28, Andrew Cooper wrote:
> On 10/02/2021 09:57, Jan Beulich wrote:
>> When invoked by compat mode, mode_64bit() will be false at the start of
>> emulation. The logic after complete_insn, however, needs to consider the
>> mode switched into, in particular to avoid truncating RIP.
>>
>> Inspired by / paralleling and extending Linux commit 943dea8af21b ("KVM:
>> x86: Update emulator context mode if SYSENTER xfers to 64-bit mode").
>>
>> While there, tighten a related assertion in x86_emulate_wrapper() - we
>> want to be sure to not switch into an impossible mode when the code gets
>> built for 32-bit only (as is possible for the test harness).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In principle we could drop SYSENTER's ctxt->lma dependency when setting
>> _regs.r(ip). I wasn't certain whether leaving it as is serves as kind of
>> documentation ...
>>
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -6127,6 +6127,10 @@ x86_emulate(
>>               (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) )
>>              goto done;
>>  
>> +        if ( ctxt->lma )
>> +            /* In particular mode_64bit() needs to return true from here on. */
>> +            ctxt->addr_size = ctxt->sp_size = 64;
> 
> I think this is fine as presented, but don't we want the logical
> opposite for SYSRET/SYSEXIT ?
> 
> We truncate rip suitably already,

This is why I left them alone, i.e. ...

> but don't know what other checks may appear in the future.

... I thought we would deal with this if and when such checks
would appear. Just like considered in the post-description
remark, we could drop the conditional part from sysexit's
setting of _regs.r(ip), and _then_ we would indeed need a
respective change there, for the truncation to happen at
complete_insn:.

Jan

