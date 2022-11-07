Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D885E61F23B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 12:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439351.693410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0i6-0006S4-4P; Mon, 07 Nov 2022 11:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439351.693410; Mon, 07 Nov 2022 11:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0i6-0006PJ-1L; Mon, 07 Nov 2022 11:54:38 +0000
Received: by outflank-mailman (input) for mailman id 439351;
 Mon, 07 Nov 2022 11:54:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os0i4-0006P9-D6
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 11:54:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os0i3-0005Fl-VW; Mon, 07 Nov 2022 11:54:35 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os0i3-00088b-NP; Mon, 07 Nov 2022 11:54:35 +0000
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
	bh=qoXgA//QWzlLMIhbTutfZd8aVjPHlcYkrxUcyHqp0Eg=; b=v62//OU0tgYqSDeAkJukkce9F3
	OXyUHqnhR/xUgT1Y9o5qlICPZWm8Fed+IrVcnRuEonSyIl9986AUspAt/RQjtQlk46PXViThzrWQZ
	emy9OOSM2fQ+awrAs+jRqSv/nBesBHv09wlhSbtdzFVXXyASdvfjDTBITNMIys3rxwb8=;
Message-ID: <8bb1c421-2dc5-cdbc-94f7-6ea09f2d64fc@xen.org>
Date: Mon, 7 Nov 2022 11:54:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-5-ayankuma@amd.com>
 <5d369b95-f412-67b2-5c34-3cd317128ec3@xen.org>
 <a10978a2-2887-5819-f5c6-3ebf56c32d19@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a10978a2-2887-5819-f5c6-3ebf56c32d19@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 07/11/2022 11:33, Ayan Kumar Halder wrote:
> 
> On 06/11/2022 18:04, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> I need a clarification.
> 
>>
>> In the title you are using AArch32 but below you are using...
>>
>> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>>> v->arch.vmpidr is assigned to uint64_t variable. This is to enable 
>>> left shifts
>>> for Aarch32 so that one can extract affinity bits.
>>
>> ... Aarch32. The naming also seem to be inconsistent across your 
>> series. AFAIU, it should be AArch32. So please look at all your 
>> commits and make sure you use the same everywhere.
> Ack
>>
>>> This is then assigned to 'typer' so that the affinity bits form the 
>>> upper 32 bits.
>>>
>>> Refer Arm IHI 0069H ID020922,
>>> The upper 32 bits of GICR_TYPER represent the affinity
>>> whereas the lower 32 bits represent the other bits (eg processor
>>> number, etc).
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>
>>> Changes from :-
>>> 1. v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
>>> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
>>>
>>>   xen/arch/arm/vgic-v3.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>> index 3f4509dcd3..e5e6f2c573 100644
>>> --- a/xen/arch/arm/vgic-v3.c
>>> +++ b/xen/arch/arm/vgic-v3.c
>>> @@ -191,13 +191,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct 
>>> vcpu *v, mmio_info_t *info,
>>>       case VREG64(GICR_TYPER):
>>>       {
>>>           uint64_t typer, aff;
>>> +        uint64_t vmpidr = v->arch.vmpidr;
>>>             if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
>>> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
>>> +        aff = (MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
>>
>> Shouldn't we #ifdef this level for 32-bit? Or maybe check if the 
>> domain is 64-bit so we are using consistently regardless of the 
>> hypervisor bitness.
> 
> We have typecasted "v->arch.vmpidr" (which is 32bit for AArch32 and 
> 64bit for AArch64)  to vmpidr (uint64_t).
> 
> So, we don't need to have any #ifdef for AArch32 or AArch64.

This is not related to the typecast. This is more that fact that 
affinity level 3 doesn't exist for 32-bit guest. For instance vpsci.c 
will protect level 3 with an #ifdef.

Cheers,

-- 
Julien Grall

