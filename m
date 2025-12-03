Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2CC9EB8B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176638.1501085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQk9v-0003bV-37; Wed, 03 Dec 2025 10:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176638.1501085; Wed, 03 Dec 2025 10:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQk9u-0003YS-WB; Wed, 03 Dec 2025 10:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1176638;
 Wed, 03 Dec 2025 10:32:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQk9t-0003YK-S5
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:32:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQk9q-004n8m-0O;
 Wed, 03 Dec 2025 10:32:26 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQk9p-009JQh-10;
 Wed, 03 Dec 2025 10:32:25 +0000
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
	bh=trY5er7axf4nOSIFkCEsTXU/opY8dtHV/iEq2PIEpV4=; b=ZEICtCDFME5zXb6pEHYhpWecTh
	fuR1efpte/BPoGqp/fc46VT57kY54/p2gtQzbuyJYp8ZIn5QQN1pbbpOZ/q6FVm1/4B4HzuG+7uCX
	vsAfyAePMDszL27zGoAbEHeUtubZzeBGzcz002y9t8TSAR7M54lHdaurTPaqMw+S2kdo=;
Message-ID: <2d07bef7-a7a1-4458-9da6-43bf2956d7d8@xen.org>
Date: Wed, 3 Dec 2025 10:32:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Milan Djokic <milan_djokic@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
 <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
 <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
 <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
 <c776c308-cda6-412f-b03c-a4b691b69d33@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <c776c308-cda6-412f-b03c-a4b691b69d33@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/12/2025 22:08, Milan Djokic wrote:
> Hi Julien,
> 
> On 11/27/25 11:22, Julien Grall wrote:
>>> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and
>>> pIOMMU. Considering single vIOMMU model limitation pointed out by
>>> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the
>>> only proper solution.
>>
>> I am not sure to fully understand. My assumption with the single vIOMMU
>> is you have a virtual SID that would be mapped to a (pIOMMU, physical
>> SID). 
> 
> In the original single vIOMMU implementation, vSID was also equal to 
> pSID, we didn't have SW mapping layer between them. Once SID overlap 
> issue was discovered with this model, I have switched to vIOMMU-per- 
> pIOMMU model. Alternative was to introduce a SW mapping layer and stick 
> with a single vIOMMU model. Imo, vSID->pSID mapping layer would 
> overcomplicate the design, especially for PCI RC streamIDs handling.
> On the other hand, if even a multi-vIOMMU model introduces problems that 
> I am not aware of yet, adding a complex mapping layer would be the only 
> viable solution.
> 
>  > Does this means in your solution you will end up with multiple
>  > vPCI as well and then map pBDF == vBDF? (this because the SID have to be
>  > fixed at boot)
>  >
> 
> The important thing which I haven't mentioned here is that our focus is 
> on non-PCI devices for this feature atm. If I'm not mistaken, arm PCI 
> passthrough is still work in progress, so our plan was to implement full 
> vIOMMU PCI support in the future, once PCI passthrough support is 
> complete for arm. Of course, we need to make sure that vIOMMU design 
> provides a suitable infrastructure for PCI.
> To answer your question, yes we will have multiple vPCI nodes with this 
> model, establishing 1-1 vSID-pSID mapping (same iommu-map range between 
> pPCI-vPCI).
> For pBDF to vBDF 1-1 mapping, I'm not sure if this is necessary. My 
> understanding is that vBDF->pBDF mapping does not affect vSID->pSID 
> mapping. Am I wrong here?

 From my understanding, the mapping between a vBDF and vSID is setup at 
domain creation (as this is described in ACPI/Device-Tree). As PCI 
devices can be hotplug, if you want to enforce vSID == pSID, then you 
indirectly need to enforce vBDF == pBDF.

[...]

>>> - **Runtime Configuration**: Introduces a `viommu` boot parameter for
>>> dynamic enablement.
>>>
>>> Separate vIOMMU device is exposed to guest for every physical IOMMU in
>>> the system.
>>> vIOMMU feature is designed in a way to provide a generic vIOMMU
>>> framework and a backend implementation
>>> for target IOMMU as separate components.
>>> Backend implementation contains specific IOMMU structure and commands
>>> handling (only SMMUv3 currently supported).
>>> This structure allows potential reuse of stage-1 feature for other IOMMU
>>> types.
>>>
>>> Security Considerations
>>> =======================
>>>
>>> **viommu security benefits:**
>>>
>>> - Stage-1 translation ensures guest devices cannot perform unauthorized
>>> DMA (device I/O address mapping managed by guest).
>>> - Emulated IOMMU removes guest direct dependency on IOMMU hardware,
>>> while maintaining domains isolation.
>>
>> Sorry, I don't follow this argument. Are you saying that it would be
>> possible to emulate a SMMUv3 vIOMMU on top of the IPMMU?
>>
> 
> No, this would not work. Emulated IOMMU has to match with the pIOMMU type.
> The argument only points out that we are emulating IOMMU, so the guest 
> does not need direct HW interface for IOMMU functions.

Sorry, but I am still missing how this is a security benefits.

[...]


>>>
>>> 2. Observation:
>>> ---------------
>>> Guests can now invalidate Stage-1 caches; invalidation needs forwarding
>>> to SMMUv3 hardware to maintain coherence.
>>>
>>> **Risk:**
>>> Failing to propagate cache invalidation could allow stale mappings,
>>> enabling access to old mappings and possibly
>>> data leakage or misrouting.
>>
>> You are referring to data leakage/misrouting between two devices own by
>> the same guest, right? Xen would still be in charge of flush when the
>> stage-2 is updated.
>>
> 
> Yes, this risk could affect only guests, not xen.

But it would affect a single guest right? IOW, it is not possible for 
guest A to leak data to guest B even if we don't properly invalidate 
stage-1. Correct?

> 
>>>
>>> **Mitigation:** *(Handled by design)*
>>> This feature ensures that guest-initiated invalidations are correctly
>>> forwarded to the hardware,
>>> preserving IOMMU coherency.
>>
>> How is this a mitigation? You have to properly handle commands. If you
>> don't properly handle them, then yes it will break.
>>
> 
> Not really a mitigation, will remove it. Guest is responsible for the 
> regular initiation of invalidation requests to mitigate this risk.
> 
>>>
>>> 4. Observation:
>>> ---------------
>>> The code includes transformations to handle nested translation versus
>>> standard modes and uses guest-configured
>>> command queues (e.g., `CMD_CFGI_STE`) and event notifications.
>>>
>>> **Risk:**
>>> Malicious or malformed queue commands from guests could bypass
>>> validation, manipulate SMMUv3 state,
>>> or cause system instability.
>>>
>>> **Mitigation:** *(Handled by design)*
>>> Built-in validation of command queue entries and sanitization mechanisms
>>> ensure only permitted configurations
>>> are applied.
>>
>> This is true as long as we didn't make an mistake in the 
>> configurations ;).
>>
> 
> Yes, but I don’t see anything we can do to prevent configuration mistakes.

There is nothing really preventing it. Same for ...
> 
>>
>>> This is supported via additions in `vsmmuv3` and `cmdqueue`
>>> handling code.
>>>
>>> 5. Observation:
>>> ---------------
>>> Device Tree modifications enable device assignment and configuration
>>> through guest DT fragments (e.g., `iommus`)
>>> are added via `libxl`.
>>>
>>> **Risk:**
>>> Erroneous or malicious Device Tree injection could result in device
>>> misbinding or guest access to unauthorized
>>> hardware.
>>
>> The DT fragment are not security support and will never be at least
>> until you have can a libfdt that is able to detect malformed Device-Tree
>> (I haven't checked if this has changed recently).
>>
> 
> But this should still be considered a risk? Similar to the previous 
> observation, system integrator should ensure that DT fragments are correct.

... this one. I agree they are risks, but they don't provide much input 
in the design of the vIOMMU.

I am a lot more concerned for the scheduling part because the resources 
are shared.

>> My understanding is there is only a single physical event queue. Xen
>> would be responsible to handle the events in the queue and forward to
>> the respective guests. If so, it is not clear what you mean by "disable
>> event queue".
>>
> 
> I was referring to emulated IOMMU event queue. The idea is to make it 
> optional for guests. When disabled, events won't be propagated to the 
> guest.

But Xen will still receive the events, correct? If so, how does it make 
it better?

> 
>>>
>>> Performance Impact
>>> ==================
>>>
>>> With iommu stage-1 and nested translation inclusion, performance
>>> overhead is introduced comparing to existing,
>>> stage-2 only usage in Xen. Once mappings are established, translations
>>> should not introduce significant overhead.
>>> Emulated paths may introduce moderate overhead, primarily affecting
>>> device initialization and event handling.
>>> Performance impact highly depends on target CPU capabilities.
>>> Testing is performed on QEMU virt and Renesas R-Car (QEMU emulated)
>>> platforms.
>>
>> I am afraid QEMU is not a reliable platform to do performance testing.
>> Don't you have a real HW with vIOMMU support?
>>
> 
> Yes, I will provide performance measurement for Renesas HW also.

FWIW, I don't need to know the performance right now. I am mostly 
pointing out that if you want to provide performance number, then they 
should really come from real HW rather than QEMU.

Cheers,

-- 
Julien Grall


