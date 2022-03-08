Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575F4D1F38
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 18:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287282.487206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdnb-00070q-Nq; Tue, 08 Mar 2022 17:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287282.487206; Tue, 08 Mar 2022 17:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdnb-0006yx-K3; Tue, 08 Mar 2022 17:39:03 +0000
Received: by outflank-mailman (input) for mailman id 287282;
 Tue, 08 Mar 2022 17:39:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRdna-0006yY-5r
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 17:39:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRdnZ-0006EC-Ho; Tue, 08 Mar 2022 17:39:01 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.172.145]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRdnZ-00009m-BD; Tue, 08 Mar 2022 17:39:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2reJbuTMJC4TlKJOP1pbyvyl/X11GzIAYnQf0fvyJMw=; b=IMnrltiE/oImxQywwGV5FnDeWV
	cVFyBtZxGlptDXKX7tjfCab+4+EgV8AWecuAOYWAOqcp53YKD8lYOS6wFxWWLpY3uW58Km0URwzA9
	CEDXqM1E2l+887p75YQFulZObMSc5/AA82HrJXB7B3pE98xQcL7BwtcRQkzAaTg7nQ5o=;
Message-ID: <bdebfad7-23f0-b0a9-4e70-7e84ebb88b53@xen.org>
Date: Tue, 8 Mar 2022 17:38:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
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
 <6c4e63e4-4f9f-68f4-5e4e-f69cf6567e1a@xen.org>
 <b6e2a7eb-9d14-077d-c2d9-04528ffaa53a@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b6e2a7eb-9d14-077d-c2d9-04528ffaa53a@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/03/2022 11:22, Ayan Kumar Halder wrote:
> Hi Julien,
> 
> On 07/03/2022 23:59, Julien Grall wrote:
>> Hi,
>>
>> On 07/03/2022 22:23, Ayan Kumar Halder wrote:
>>>
>>> On 07/03/2022 19:37, Julien Grall wrote:
>>>>
>>>>
>>>> On 07/03/2022 14:27, Ayan Kumar Halder wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Ayan,
>>>
>>> Hi Julien,
>>>
>>> I need a bit of clarification to understand this.
>>>
>>>>
>>>>>
>>>>> One clarification.
>>>>>
>>>>> On 04/03/2022 10:39, Julien Grall wrote:
>>>>>> Hi Ayan,
>>>>>>
>>>>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>>>>> If the abort was caused due to access to stage1 translation 
>>>>>>> table, Xen
>>>>>>> will assume that the stage1 translation table is in the non MMIO 
>>>>>>> region.
>>>>
>>>> Reading this commit message again. I think you want to explain why 
>>>> we want to do that because, from my understanding, this is 
>>>> technically not forbidden by the Arm Arm.
>>>>
>>>> From the previous discussion, we want to do this because we can't 
>>>> easily handle such fault on emulated region (we have no away to the 
>>>> walker the value read).
>>>
>>> Sorry, Can you explain this a bit more ? Do you mean that if the page 
>>> table is located in the emulated region, map_domain_page() (called 
>>> from p2m_next_level()) will fail.
>>
>> For data abort with valid syndrome, you will have a register to write 
>> back the value read. When the data abort has s1ptw == 1, AFAICT, we 
>> have no information how to return the value.
> 
> Do you mean that for s1ptw, we get an intermediate physical address ?
> 
>      if ( hpfar_is_valid(xabt.s1ptw, fsc) )
>          gpa = get_faulting_ipa(gva);

No. That's not relevant here. We always need a IPA in order to deal with 
the fault.

> 
> If the IPA corresponds to an emulated region, then Xen can read the 
> emulated address, but can't return the value to the guest OS.
That wouldn't be the guest OS. But the page-table walker in the CPU.

>>> Can Linux or any OS keep its page tables in the direct MMIO space ? 
>>> If yes, then try_map_mmio() needs to be invoked to map the region, so 
>>> that OS can access it. If not, then Xen needs to return abort because 
>>> the OS may be behaving maliciously.
>>
>> I think what matters is whether the Arm Arm would or would not allow 
>> it. From what I can tell there are no such restriction. So we would 
>> need to be cautious to restrict it further than necessary.
>>
>>>
>>> My understanding from previous discussion was that it does not make 
>>> sense for linux or any OS to keep its page tables in any MMIO region 
>>> (emulated or direct). Please correct me if mistaken.
>>
>> At the moment, none of the regions emulated by Xen could be used for 
>> page-tables. I am also not sure how we should handle such access if 
>> they arise. So it is more convenient to simply forbid them.
>>
>> Regarding direct MMIO, see above. Correct me if I am wrong, but it 
>> should not be a problem for Xen to deal with them. So while I agree 
>> this doesn't seem to make sense, the restriction seems unnecessary.
> 
> So the behavior will be :-
> 
> 1. If the stage1 translation table is in the non MMIO region or 'direct 
> mapped' MMIO region, then invoke p2m_resolve_translation_fault() and 
> try_map_mmio() to resolve the fault. If it succeeds, then return to the 
> guest to retry.

When 1. happens we don't know yet if the stage1 will be a non MMIO 
region or 'direct mapped'. Instead, we only know that the ISS syndrome 
is invalid.

If it is a prefetch abort or the syndrome is invalid, then we should 
call check_p2m().

> 
> 2. If the previous step fails and for any other scenario (ie stage1 
> translation table is in emulated MMIO region or the address is invalid), 
> return the abort to the guest.

If check_p2m() didn't success and it is a fault on stage-1 walk, then we 
should send an abort.

Cheers,

-- 
Julien Grall

