Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946583A6070
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 12:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141315.261070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjt9-0003dx-0B; Mon, 14 Jun 2021 10:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141315.261070; Mon, 14 Jun 2021 10:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjt8-0003bP-TB; Mon, 14 Jun 2021 10:32:14 +0000
Received: by outflank-mailman (input) for mailman id 141315;
 Mon, 14 Jun 2021 10:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsjt7-0003bJ-GM
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 10:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjt7-00023F-Dr; Mon, 14 Jun 2021 10:32:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjt7-00072b-5Z; Mon, 14 Jun 2021 10:32:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7tb+ir/w2XyLVfPLCnYc7gmNkMd9IzM6R3qoDRIapnQ=; b=03nf4i/S/lySbAGpxRnBdIMWs5
	HZqHii9rBmHx2TGYzB5whe3gkHQt7ug5h3qFM9U93LTu/oUMMjLYR6eFrvsE6nwvUDcI115mogF8V
	1d2A4+tog+SzBzmBnlFZVne0VXYFRF84b4ub9coY1MMSKia5m4c43SFvrmqdJWClGf3k=;
Subject: Re: [PATCH] Arm: avoid .init.data to be marked as executable
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
 <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
 <8c5ec03f-5ea1-99f8-a521-3552d0015ac4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b44cb6d-dda6-5297-893b-a53fe7d123d9@xen.org>
Date: Mon, 14 Jun 2021 12:32:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8c5ec03f-5ea1-99f8-a521-3552d0015ac4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/06/2021 12:02, Jan Beulich wrote:
> On 14.06.2021 11:41, Julien Grall wrote:
>> On 11/06/2021 11:39, Jan Beulich wrote:
>>> This confuses disassemblers, at the very least. Move
>>> .altinstr_replacement to .init.text,
>>
>> The alternative code was borrowed from Linux. The code has now changed
>> to cater very large kernel. They used to keep the .altinstr_replacement
>> and altinstructions close to each other (albeit they were both in
>> .init.text).
>>
>> I am not entirely why, but I am a bit worry to separate them. What sort
>> of test did you do?
> 
> Well, just build tests, on the assumption that relocation overflows
> would be reported by the linker if the sections ended up too far
> apart.

Hmmm, fair point. They should also not be further than the original 
instruction. So there ought to be fine.

> 
>>> dropping the redundant ALIGN().
>>>
>>> Also, to have .altinstr_replacement have consistent attributes in the
>>> object files, add "x" to the one instance where it was missing. >
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I'm uncertain whether having .altinstr_replacement inside or outside the
>>> [_sinittext,_einittext) region is better; I simply followed what we have
>>> on the x86 side right now.
>>
>> This means the altinstructions will be marked executable in the
>> page-table. They technically should not be executable, so I would move
>> them outside _einittext and make sure the section is aligned to a PAGE_SIZE.
> 
> Hmm, are you saying you bother getting attributes right for .init.*
> in the page tables? I ask because we don't on x86, and because it
> would seem wasteful to me to pad to PAGE_SIZE just for this. But
> you're the maintainer, i.e. I'm merely double checking ...

So this is a defense in depth. Your assumption is .init.text is going to 
disappear after boot. However, if there is a bug that would leave 
.init.text present then this may add more attack surface. So I think it 
is a good practice to keep the permission correct.

However... looking the alternative code again, there is another reason 
to move this change out of the range _sinitext - _einittext. The 
function branch_insn_requires_update() will forbid branch target in 
another alternative instructions.

This is first checking that the target is part of an active text. With 
this change, this will return true because alternative instruction 
replacement will be between _sinittext and _einittext.

So .altinstructions_replacement must outside of the region [_stinittext, 
_einittext[.

Cheers,

-- 
Julien Grall

