Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA57C8DBBD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 11:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173728.1498735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZ92-0003UQ-9G; Thu, 27 Nov 2025 10:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173728.1498735; Thu, 27 Nov 2025 10:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZ92-0003Ry-6k; Thu, 27 Nov 2025 10:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1173728;
 Thu, 27 Nov 2025 10:22:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vOZ91-0003Rs-H6
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 10:22:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vOZ8x-00B7Vh-2i;
 Thu, 27 Nov 2025 10:22:31 +0000
Received: from [15.248.2.232] (helo=[10.24.66.108])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vOZ8x-00Gay6-1T;
 Thu, 27 Nov 2025 10:22:31 +0000
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
	bh=efbYn/p8219u1PtxitkxwIkRMxr8OE5y+OApTyckzwo=; b=SrxoQjyIP2KnrBbAGcEOnJlh3w
	1vTVW+dLs4BC64VshcXGBZVhSp5NJrmOsoqku4evyo9vV62KatVM6hLsLbnIrZuSxXOTGsiC0efPB
	Z2F1lZ3gbNMt4W97uriKW3ipvHqidBHtTnrIudCgCqLnVHRBmFFSwHNw73PVh23PYFkw=;
Message-ID: <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
Date: Thu, 27 Nov 2025 10:22:28 +0000
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
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/11/2025 13:16, Milan Djokic wrote:
> Hello Volodymyr, Julien

Hi Milan,

Thanks for the new update. For the future, can you trim your reply?

> Sorry for the delayed follow-up on this topic.
> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and 
> pIOMMU. Considering single vIOMMU model limitation pointed out by 
> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the 
> only proper solution.

I am not sure to fully understand. My assumption with the single vIOMMU 
is you have a virtual SID that would be mapped to a (pIOMMU, physical 
SID). Does this means in your solution you will end up with multiple 
vPCI as well and then map pBDF == vBDF? (this because the SID have to be 
fixed at boot)

> Following is the updated design document.
> I have added additional details to the design and performance impact 
> sections, and also indicated future improvements. Security 
> considerations section is unchanged apart from some minor details 
> according to review comments.
> Let me know what do you think about updated design. Once approved, I 
> will send the updated vIOMMU patch series.
> 
> 
> ==========================================================
> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
> ==========================================================
> 
> :Author:     Milan Djokic <milan_djokic@epam.com>
> :Date:       2025-11-03
> :Status:     Draft
> 
> Introduction
> ============
> 
> The SMMUv3 supports two stages of translation. Each stage of translation 
> can be
> independently enabled. An incoming address is logically translated from 
> VA to
> IPA in stage 1, then the IPA is input to stage 2 which translates the 
> IPA to
> the output PA. Stage 1 translation support is required to provide 
> isolation between different
> devices within OS. XEN already supports Stage 2 translation but there is no
> support for Stage 1 translation.
> This design proposal outlines the introduction of Stage-1 SMMUv3 support 
> in Xen for ARM guests.
> 
> Motivation
> ==========
> 
> ARM systems utilizing SMMUv3 require stage-1 address translation to 
> ensure secure DMA and
> guest managed I/O memory mappings.
> With stage-1 enabed, guest manages IOVA to IPA mappings through its own 
> IOMMU driver.
> 
> This feature enables:
> 
> - Stage-1 translation in guest domain
> - Safe device passthrough with per-device address translation table

I find this misleading. Even without this feature, device passthrough is 
still safe in the sense a device will be isolated (assuming all the DMA 
goes through the IOMMU) and will not be able to DMA outside of the guest 
memory. What the stage-1 is doing is providing an extra layer to control 
what each device can see. This is useful if you don't trust your devices 
or you want to assign a device to userspace (e.g. for DPDK).

> 
> Design Overview
> ===============
> 
> These changes provide emulated SMMUv3 support:

If my understanding is correct, there are all some implications in how 
we create the PCI topology. It would be good to spell them out.

> 
> - **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support 
> in SMMUv3 driver.
> - **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1 
> handling.
> - **Register/Command Emulation**: SMMUv3 register emulation and command 
> queue handling.
> - **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to 
> device trees for dom0 and dom0less scenarios.

What about ACPI?

> - **Runtime Configuration**: Introduces a `viommu` boot parameter for 
> dynamic enablement.
> 
> Separate vIOMMU device is exposed to guest for every physical IOMMU in 
> the system.
> vIOMMU feature is designed in a way to provide a generic vIOMMU 
> framework and a backend implementation
> for target IOMMU as separate components.
> Backend implementation contains specific IOMMU structure and commands 
> handling (only SMMUv3 currently supported).
> This structure allows potential reuse of stage-1 feature for other IOMMU 
> types.
> 
> Security Considerations
> =======================
> 
> **viommu security benefits:**
> 
> - Stage-1 translation ensures guest devices cannot perform unauthorized 
> DMA (device I/O address mapping managed by guest).
> - Emulated IOMMU removes guest direct dependency on IOMMU hardware, 
> while maintaining domains isolation.

Sorry, I don't follow this argument. Are you saying that it would be 
possible to emulate a SMMUv3 vIOMMU on top of the IPMMU?

> 1. Observation:
> ---------------
> Support for Stage-1 translation in SMMUv3 introduces new data structures 
> (`s1_cfg` alongside `s2_cfg`)
> and logic to write both Stage-1 and Stage-2 entries in the Stream Table 
> Entry (STE), including an `abort`
> field to handle partial configuration states.
> 
> **Risk:**
> Without proper handling, a partially applied Stage-1 configuration might 
> leave guest DMA mappings in an
> inconsistent state, potentially enabling unauthorized access or causing 
> cross-domain interference.

How so? Even if you misconfigure the S1, the S2 would still be properly 
configured (you just mention partially applied stage-1).

> 
> **Mitigation:** *(Handled by design)*
> This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to 
> STE and manages the `abort` field-only
> considering Stage-1 configuration if fully attached. This ensures 
> incomplete or invalid guest configurations
> are safely ignored by the hypervisor.

Can you clarify what you mean by invalid guest configurations?

> 
> 2. Observation:
> ---------------
> Guests can now invalidate Stage-1 caches; invalidation needs forwarding 
> to SMMUv3 hardware to maintain coherence.
> 
> **Risk:**
> Failing to propagate cache invalidation could allow stale mappings, 
> enabling access to old mappings and possibly
> data leakage or misrouting.

You are referring to data leakage/misrouting between two devices own by 
the same guest, right? Xen would still be in charge of flush when the 
stage-2 is updated.

> 
> **Mitigation:** *(Handled by design)*
> This feature ensures that guest-initiated invalidations are correctly 
> forwarded to the hardware,
> preserving IOMMU coherency.

How is this a mitigation? You have to properly handle commands. If you 
don't properly handle them, then yes it will break.

> 
> 4. Observation:
> ---------------
> The code includes transformations to handle nested translation versus 
> standard modes and uses guest-configured
> command queues (e.g., `CMD_CFGI_STE`) and event notifications.
> 
> **Risk:**
> Malicious or malformed queue commands from guests could bypass 
> validation, manipulate SMMUv3 state,
> or cause system instability.
> 
> **Mitigation:** *(Handled by design)*
> Built-in validation of command queue entries and sanitization mechanisms 
> ensure only permitted configurations
> are applied.

This is true as long as we didn't make an mistake in the configurations ;).


> This is supported via additions in `vsmmuv3` and `cmdqueue` 
> handling code.
> 
> 5. Observation:
> ---------------
> Device Tree modifications enable device assignment and configuration 
> through guest DT fragments (e.g., `iommus`)
> are added via `libxl`.
> 
> **Risk:**
> Erroneous or malicious Device Tree injection could result in device 
> misbinding or guest access to unauthorized
> hardware.

The DT fragment are not security support and will never be at least 
until you have can a libfdt that is able to detect malformed Device-Tree 
(I haven't checked if this has changed recently).

> 
> **Mitigation:**
> 
> - `libxl` perform checks of guest configuration and parse only 
> predefined dt fragments and nodes, reducing risk.
> - The system integrator must ensure correct resource mapping in the 
> guest Device Tree (DT) fragments.
 > > 6. Observation:
> ---------------
> Introducing optional per-guest enabled features (`viommu` argument in xl 
> guest config) means some guests
> may opt-out.
> 
> **Risk:**
> Differences between guests with and without `viommu` may cause 
> unexpected behavior or privilege drift.

I don't understand this risk. Can you clarify?

> 
> **Mitigation:**
> Verify that downgrade paths are safe and well-isolated; ensure missing 
> support doesn't cause security issues.
> Additional audits on emulation paths and domains interference need to be 
> performed in a multi-guest environment.
> 
> 7. Observation:
> ---------------

This observation with 7, 8 and 9 are the most important observations but 
it seems to be missing some details on how this will be implemented. I 
will try to provide some questions that should help filling the gaps.

> Guests have the ability to issue Stage-1 IOMMU commands like cache 
> invalidation, stream table entries
> configuration, etc. An adversarial guest may issue a high volume of 
> commands in rapid succession.
> 
> **Risk:**
> Excessive commands requests can cause high hypervisor CPU consumption 
> and disrupt scheduling,
> leading to degraded system responsiveness and potential denial-of- 
> service scenarios.
> 
> **Mitigation:**
> 
> - Xen scheduler limits guest vCPU execution time, securing basic guest 
> rate-limiting.

This really depends on your scheduler. Some scheduler (e.g. NULL) will 
not do any scheduling at all. Furthermore, the scheduler only preempt 
EL1/EL0. It doesn't preempt EL2, so any long running operation need 
manual preemption. Therefore, I wouldn't consider this as a mitigation.

> - Batch multiple commands of same type to reduce overhead on the virtual 
> SMMUv3 hardware emulation.

The guest can send commands in any order. So can you expand how this 
would work? Maybe with some example.

> - Implement vIOMMU commands execution restart and continuation support

This needs a bit more details. How will you decide whether to restart 
and what would be the action? (I guess it will be re-executing the 
instruction to write to the CWRITER).

> 
> 8. Observation:
> ---------------
> Some guest commands issued towards vIOMMU are propagated to pIOMMU 
> command queue (e.g. TLB invalidate).
> 
> **Risk:**
> Excessive commands requests from abusive guest can cause flooding of 
> physical IOMMU command queue,
> leading to degraded pIOMMU responsivness on commands issued from other 
> guests.
> 
> **Mitigation:**
> 
> - Xen credit scheduler limits guest vCPU execution time, securing basic 
> guest rate-limiting.

Same as above. This mitigation cannot be used.


> - Batch commands which should be propagated towards pIOMMU cmd queue and 
> enable support for batch
>    execution pause/continuation

Can this be expanded?

> - If possible, implement domain penalization by adding a per-domain cost 
> counter for vIOMMU/pIOMMU usage.

Can this be expanded?

> 
> 9. Observation:
> ---------------
> vIOMMU feature includes event queue used for forwarding IOMMU events to 
> guest
> (e.g. translation faults, invalid stream IDs, permission errors).
> A malicious guest can misconfigure its SMMU state or intentionally 
> trigger faults with high frequency.
> 
> **Risk:**
> Occurance of IOMMU events with high frequency can cause Xen to flood the 

s/occurance/occurrence/

> event queue and disrupt scheduling with
> high hypervisor CPU load for events handling.
> 
> **Mitigation:**
> 
> - Implement fail-safe state by disabling events forwarding when faults 
> are occured with high frequency and
>    not processed by guest.

I am not sure to understand how this would work. Can you expand?

> - Batch multiple events of same type to reduce overhead on the virtual 
> SMMUv3 hardware emulation.

Ditto.

> - Consider disabling event queue for untrusted guests

My understanding is there is only a single physical event queue. Xen 
would be responsible to handle the events in the queue and forward to 
the respective guests. If so, it is not clear what you mean by "disable 
event queue".

> 
> Performance Impact
> ==================
> 
> With iommu stage-1 and nested translation inclusion, performance 
> overhead is introduced comparing to existing,
> stage-2 only usage in Xen. Once mappings are established, translations 
> should not introduce significant overhead.
> Emulated paths may introduce moderate overhead, primarily affecting 
> device initialization and event handling.
> Performance impact highly depends on target CPU capabilities.
> Testing is performed on QEMU virt and Renesas R-Car (QEMU emulated) 
> platforms.

I am afraid QEMU is not a reliable platform to do performance testing. 
Don't you have a real HW with vIOMMU support?

[...]

> References
> ==========
> 
> - Original feature implemented by Rahul Singh:
> 
> https://patchwork.kernel.org/project/xen-devel/cover/ 
> cover.1669888522.git.rahul.singh@arm.com/
> - SMMUv3 architecture documentation
> - Existing vIOMMU code patterns

I am not sure what this is referring to?

Cheers,

-- 
Julien Grall


