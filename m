Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A44D0C5C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 01:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286499.486050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRNGB-0006Pi-Cd; Mon, 07 Mar 2022 23:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286499.486050; Mon, 07 Mar 2022 23:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRNGB-0006MR-97; Mon, 07 Mar 2022 23:59:27 +0000
Received: by outflank-mailman (input) for mailman id 286499;
 Mon, 07 Mar 2022 23:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRNG9-0006ML-Lu
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 23:59:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRNG8-00089H-TB; Mon, 07 Mar 2022 23:59:24 +0000
Received: from [81.187.162.82] (helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRNG8-0006uW-Md; Mon, 07 Mar 2022 23:59:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=BWsMzbvRIxFE82a/I4uJEqqoAmkTlXHXC5TG/mv+mbY=; b=FFgciRrOWKErsHaxA0nTuHKuJU
	ss5X+pXeug0Ung+75gYE81LAZwod5tOJSOnTOPXD31u7tC6Ba1AdllI8SuQgWyxOIcnMUf6M4jb05
	dQrE0F5i6VyTq6V8PRjUJlWAqwSSXDDGiNdhz9M/UW+3d7GQN6CTZlxLdywukGKO/TFY=;
Message-ID: <6c4e63e4-4f9f-68f4-5e4e-f69cf6567e1a@xen.org>
Date: Mon, 7 Mar 2022 23:59:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
 <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
 <5d5b0fc1-6f47-dfc0-dca3-5d60483a6eae@xilinx.com>
 <3e9d5d0c-f68f-004e-06b7-c4f0452f1e64@xen.org>
 <124726df-eafe-014a-ea9a-f97e0921eccc@xilinx.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
In-Reply-To: <124726df-eafe-014a-ea9a-f97e0921eccc@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/03/2022 22:23, Ayan Kumar Halder wrote:
> 
> On 07/03/2022 19:37, Julien Grall wrote:
>>
>>
>> On 07/03/2022 14:27, Ayan Kumar Halder wrote:
>>> Hi Julien,
>>
>> Hi Ayan,
> 
> Hi Julien,
> 
> I need a bit of clarification to understand this.
> 
>>
>>>
>>> One clarification.
>>>
>>> On 04/03/2022 10:39, Julien Grall wrote:
>>>> Hi Ayan,
>>>>
>>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>>> If the abort was caused due to access to stage1 translation table, Xen
>>>>> will assume that the stage1 translation table is in the non MMIO 
>>>>> region.
>>
>> Reading this commit message again. I think you want to explain why we 
>> want to do that because, from my understanding, this is technically 
>> not forbidden by the Arm Arm.
>>
>> From the previous discussion, we want to do this because we can't 
>> easily handle such fault on emulated region (we have no away to the 
>> walker the value read).
> 
> Sorry, Can you explain this a bit more ? Do you mean that if the page 
> table is located in the emulated region, map_domain_page() (called from 
> p2m_next_level()) will fail.

For data abort with valid syndrome, you will have a register to write 
back the value read. When the data abort has s1ptw == 1, AFAICT, we have 
no information how to return the value.

> 
> But for emulated region, shouldn't pages be already mapped for Xen to 
> access them ?

I am not sure which "pages" you are referring to here. The 
implementation of emulated regions is left to the discretion of Xen. 
This may be reading/writing to a buffer allocated by Xen or return a 
fixed value.

> 
>>
>>>>> It will try to resolve the translation fault. If it succeeds, it will
>>>>> return to the guest to retry the instruction. If not, then it means
>>>>> that the table is in MMIO region which is not expected by Xen. Thus,
>>>>> Xen will forward the abort to the guest.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>>>> ---
>>>>>
>>>>> Changelog :-
>>>>>
>>>>> v1..v8 - NA
>>>>>
>>>>> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: 
>>>>> Support
>>>>> instructions (for which ISS is not..." into a separate patch of its 
>>>>> own.
>>>>> The reason being this is an existing bug in the codebase.
>>>>>
>>>>>   xen/arch/arm/io.c    | 11 +++++++++++
>>>>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>>>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>>> index bea69ffb08..ebcb8ed548 100644
>>>>> --- a/xen/arch/arm/io.c
>>>>> +++ b/xen/arch/arm/io.c
>>>>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct 
>>>>> cpu_user_regs *regs,
>>>>>           return;
>>>>>       }
>>>>>   +    /*
>>>>> +     * At this point, we know that the stage1 translation table is 
>>>>> in the MMIO
>>>>> +     * region. This is not expected by Xen and thus it forwards 
>>>>> the abort to the
>>>>
>>>> We don't know that. We only know that there are no corresponding 
>>>> valid mapping in the P2M. So the address may be part of an emulated 
>>>> MMIO region or invalid.
>>>>
>>>> For both cases, we will want to send an abort.
>>>>
>>>> Furthermore, I would say "emulated MMIO region" rather than MMIO 
>>>> region because the P2M can also contain MMIO mapping (we usually 
>>>> call then "direct MMIO").
>>>
>>> Can I say MMIO region (to indicate both emulated and direct) ? The 
>>> reason being the assumption that stage1 page tables cannot be in the 
>>> MMIO region. And thus, when check_p2m() is invoked, we do not invoke 
>>> try_map_mmio(gaddr_to_gfn(gpa).
>>>
>>> See this snippet :-
>>>
>>>              if ( xabt.s1ptw )
>>>                  check_mmio_region = false;
>>
>> Thinking a bit more of this. I would actually drop this check. We 
>> don't need to decode the instruction, so I don't think there are much 
>> benefits here to restrict access for direct MMIO. Did I miss anything?
>>
> Can Linux or any OS keep its page tables in the direct MMIO space ? If 
> yes, then try_map_mmio() needs to be invoked to map the region, so that 
> OS can access it. If not, then Xen needs to return abort because the OS 
> may be behaving maliciously.

I think what matters is whether the Arm Arm would or would not allow it. 
 From what I can tell there are no such restriction. So we would need to 
be cautious to restrict it further than necessary.

> 
> My understanding from previous discussion was that it does not make 
> sense for linux or any OS to keep its page tables in any MMIO region 
> (emulated or direct). Please correct me if mistaken.

At the moment, none of the regions emulated by Xen could be used for 
page-tables. I am also not sure how we should handle such access if they 
arise. So it is more convenient to simply forbid them.

Regarding direct MMIO, see above. Correct me if I am wrong, but it 
should not be a problem for Xen to deal with them. So while I agree this 
doesn't seem to make sense, the restriction seems unnecessary.

Cheers,

-- 
Julien Grall

