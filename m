Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046684D07D1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 20:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286402.485908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRJAr-0007LQ-1f; Mon, 07 Mar 2022 19:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286402.485908; Mon, 07 Mar 2022 19:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRJAq-0007Iq-U4; Mon, 07 Mar 2022 19:37:40 +0000
Received: by outflank-mailman (input) for mailman id 286402;
 Mon, 07 Mar 2022 19:37:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRJAo-0007Ik-WD
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 19:37:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRJAo-0003eC-DH; Mon, 07 Mar 2022 19:37:38 +0000
Received: from [54.239.6.188] (helo=[192.168.26.124])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRJAo-0007EX-62; Mon, 07 Mar 2022 19:37:38 +0000
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
	bh=lZijzCYgRh/tOJrITnMm393PPK5xLRsNmUwnbfI8ZeU=; b=oq2Ea5bTosPz31ya+o23bHt3UV
	6tRby0ZMBDhlSWVJ6VMDwbxrm2DOG+NAs0/Fkvp/CO2O9qYkw9rxw8AM+M1McQvmGnUAyw30gzlML
	/cEomXBVjoO6AVFUuYp6VmZyXVYK1lr+PxBOhe8dg16KW8QcFnjAzsqFSpdtK2/O53EY=;
Message-ID: <3e9d5d0c-f68f-004e-06b7-c4f0452f1e64@xen.org>
Date: Mon, 7 Mar 2022 19:37:35 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <5d5b0fc1-6f47-dfc0-dca3-5d60483a6eae@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/03/2022 14:27, Ayan Kumar Halder wrote:
> Hi Julien,

Hi Ayan,

> 
> One clarification.
> 
> On 04/03/2022 10:39, Julien Grall wrote:
>> Hi Ayan,
>>
>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>> If the abort was caused due to access to stage1 translation table, Xen
>>> will assume that the stage1 translation table is in the non MMIO region.

Reading this commit message again. I think you want to explain why we 
want to do that because, from my understanding, this is technically not 
forbidden by the Arm Arm.

 From the previous discussion, we want to do this because we can't 
easily handle such fault on emulated region (we have no away to the 
walker the value read).

>>> It will try to resolve the translation fault. If it succeeds, it will
>>> return to the guest to retry the instruction. If not, then it means
>>> that the table is in MMIO region which is not expected by Xen. Thus,
>>> Xen will forward the abort to the guest.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>> ---
>>>
>>> Changelog :-
>>>
>>> v1..v8 - NA
>>>
>>> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
>>> instructions (for which ISS is not..." into a separate patch of its own.
>>> The reason being this is an existing bug in the codebase.
>>>
>>>   xen/arch/arm/io.c    | 11 +++++++++++
>>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>> index bea69ffb08..ebcb8ed548 100644
>>> --- a/xen/arch/arm/io.c
>>> +++ b/xen/arch/arm/io.c
>>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct 
>>> cpu_user_regs *regs,
>>>           return;
>>>       }
>>>   +    /*
>>> +     * At this point, we know that the stage1 translation table is 
>>> in the MMIO
>>> +     * region. This is not expected by Xen and thus it forwards the 
>>> abort to the
>>
>> We don't know that. We only know that there are no corresponding valid 
>> mapping in the P2M. So the address may be part of an emulated MMIO 
>> region or invalid.
>>
>> For both cases, we will want to send an abort.
>>
>> Furthermore, I would say "emulated MMIO region" rather than MMIO 
>> region because the P2M can also contain MMIO mapping (we usually call 
>> then "direct MMIO").
> 
> Can I say MMIO region (to indicate both emulated and direct) ? The 
> reason being the assumption that stage1 page tables cannot be in the 
> MMIO region. And thus, when check_p2m() is invoked, we do not invoke 
> try_map_mmio(gaddr_to_gfn(gpa).
> 
> See this snippet :-
> 
>              if ( xabt.s1ptw )
>                  check_mmio_region = false;

Thinking a bit more of this. I would actually drop this check. We don't 
need to decode the instruction, so I don't think there are much benefits 
here to restrict access for direct MMIO. Did I miss anything?

Cheers,

-- 
Julien Grall

