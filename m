Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CB3A673F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141430.261244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm98-000883-FJ; Mon, 14 Jun 2021 12:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141430.261244; Mon, 14 Jun 2021 12:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm98-00084s-Bd; Mon, 14 Jun 2021 12:56:54 +0000
Received: by outflank-mailman (input) for mailman id 141430;
 Mon, 14 Jun 2021 12:56:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsm97-00084m-6t
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:56:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsm97-0004TQ-2r; Mon, 14 Jun 2021 12:56:53 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsm96-0001mV-R0; Mon, 14 Jun 2021 12:56:53 +0000
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
	bh=XCbiOCDvlqziCIM+eMWN9Mc+pioEDSMSh5sz9jv2GW0=; b=J95Je1q+TddQhwFzfqzuTnn62V
	mV3fqq+758Nts6XzUcofJz8WnzKgatJf++NVA54f3F2oeDnHhC9j1qifjSuOCqm1nDOKxrf0wiWB1
	06YfUdNRkssUFoVnQmD+Vwj7BU5KSgzVdygmxbw9Ku7EXZdH1hzn6hUJpKob2JSbN+Ds=;
Subject: Re: [PATCH] Arm: avoid .init.data to be marked as executable
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
 <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
 <8c5ec03f-5ea1-99f8-a521-3552d0015ac4@suse.com>
 <1b44cb6d-dda6-5297-893b-a53fe7d123d9@xen.org>
 <919ddc45-c6a4-20b3-e1ab-7a16fe1c48d2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e08a7113-672c-81fc-ff7b-5f58bdf52bb7@xen.org>
Date: Mon, 14 Jun 2021 14:56:50 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <919ddc45-c6a4-20b3-e1ab-7a16fe1c48d2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/06/2021 14:17, Jan Beulich wrote:
> On 14.06.2021 12:32, Julien Grall wrote:
>>
>>
>> On 14/06/2021 12:02, Jan Beulich wrote:
>>> On 14.06.2021 11:41, Julien Grall wrote:
>>>> On 11/06/2021 11:39, Jan Beulich wrote:
>>>>> This confuses disassemblers, at the very least. Move
>>>>> .altinstr_replacement to .init.text,
>>>>
>>>> The alternative code was borrowed from Linux. The code has now changed
>>>> to cater very large kernel. They used to keep the .altinstr_replacement
>>>> and altinstructions close to each other (albeit they were both in
>>>> .init.text).
>>>>
>>>> I am not entirely why, but I am a bit worry to separate them. What sort
>>>> of test did you do?
>>>
>>> Well, just build tests, on the assumption that relocation overflows
>>> would be reported by the linker if the sections ended up too far
>>> apart.
>>
>> Hmmm, fair point. They should also not be further than the original
>> instruction. So there ought to be fine.
>>
>>>
>>>>> dropping the redundant ALIGN().
>>>>>
>>>>> Also, to have .altinstr_replacement have consistent attributes in the
>>>>> object files, add "x" to the one instance where it was missing. >
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> I'm uncertain whether having .altinstr_replacement inside or outside the
>>>>> [_sinittext,_einittext) region is better; I simply followed what we have
>>>>> on the x86 side right now.
>>>>
>>>> This means the altinstructions will be marked executable in the
>>>> page-table. They technically should not be executable, so I would move
>>>> them outside _einittext and make sure the section is aligned to a PAGE_SIZE.
>>>
>>> Hmm, are you saying you bother getting attributes right for .init.*
>>> in the page tables? I ask because we don't on x86, and because it
>>> would seem wasteful to me to pad to PAGE_SIZE just for this. But
>>> you're the maintainer, i.e. I'm merely double checking ...
>>
>> So this is a defense in depth. Your assumption is .init.text is going to
>> disappear after boot. However, if there is a bug that would leave
>> .init.text present then this may add more attack surface. So I think it
>> is a good practice to keep the permission correct.
>>
>> However... looking the alternative code again, there is another reason
>> to move this change out of the range _sinitext - _einittext. The
>> function branch_insn_requires_update() will forbid branch target in
>> another alternative instructions.
>>
>> This is first checking that the target is part of an active text. With
>> this change, this will return true because alternative instruction
>> replacement will be between _sinittext and _einittext.
>>
>> So .altinstructions_replacement must outside of the region [_stinittext,
>> _einittext[.
> 
> I see. But I'm not sure about the defense-in-depth aspect: By putting
> it outside [_sinittext,_einittext) it'll get mapped r/w, while I think
> you were implying that it would become r/o. Not even .init.rodata gets
> mapped r/o.

Yes it is no r/o and that should be fixed at some point. However, I feel 
that r/w is better than allowing execution because some the instructions 
can lead to a DoS if executed on platform not supporting them.

But that's a matter of opinion and I think this confused the messaging here.

> 
> As a result I'm not convinced yet that you really want me to make the
> change.

I wrote "must", so I am not sure what else I could say to convince you 
that I really want to make this change...

To re-iterate, this code will break runtime check in the alternative 
patching code. So the .altinstruction_replacement **should** be placed 
after _einittext.

Cheers,

-- 
Julien Grall

