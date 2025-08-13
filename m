Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3984B24942
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079822.1440502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAK7-0008KM-OI; Wed, 13 Aug 2025 12:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079822.1440502; Wed, 13 Aug 2025 12:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAK7-0008Hu-LS; Wed, 13 Aug 2025 12:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1079822;
 Wed, 13 Aug 2025 12:11:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1umAK5-0008Ho-Tv
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:11:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1umAK3-003Lxi-31;
 Wed, 13 Aug 2025 12:11:16 +0000
Received: from [2a02:8012:3a1:0:58a4:4542:aa8b:5a81]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1umAK3-002P2u-2e;
 Wed, 13 Aug 2025 12:11:15 +0000
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
	bh=m9Ss3wLK1+Z4+aprCoYp4mN2OhDzKmFAJEWOd2AHKbA=; b=Qx9kL4VkwxLuX0rY4VdIyobaPd
	8rwcsrw6dnjb+lZPYu54BuHSNF8VPHhaDAwiJHHFwWlVsl6IUcfCWetYlygAfOrvF9LZojmmYyB7/
	KsNapgj194zFGa70qpxv+i+1fIn3saaj4OZExo2QFxutNcGD4H0u/9Lb8mirg29V4ThM=;
Message-ID: <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
Date: Wed, 13 Aug 2025 13:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2025 11:04, Milan Djokic wrote:
> Hello Julien,

Hi Milan,

> 
> We have prepared a design document and it will be part of the updated 
> patch series (added in docs/design). I'll also extend cover letter with 
> details on implementation structure to make review easier.

I would suggest to just iterate on the design document for now.

> Following is the design document content which will be provided in 
> updated patch series:
> 
> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
> ==========================================================
> 
> Author: Milan Djokic <milan_djokic@epam.com>
> Date:   2025-08-07
> Status: Draft
> 
> Introduction
> ------------
> 
> The SMMUv3 supports two stages of translation. Each stage of translation
> can be independently enabled. An incoming address is logically
> translated from VA to IPA in stage 1, then the IPA is input to stage 2
> which translates the IPA to the output PA. Stage 1 translation support
> is required to provide isolation between different devices within the OS.
> 
> Xen already supports Stage 2 translation but there is no support for
> Stage 1 translation. This design proposal outlines the introduction of
> Stage-1 SMMUv3 support in Xen for ARM guests.
> 
> Motivation
> ----------
> 
> ARM systems utilizing SMMUv3 require Stage-1 address translation to
> ensure correct and secure DMA behavior inside guests.

Can you clarify what you mean by "correct"? DMA would still work without 
stage-1.
> 
> This feature enables:
> - Stage-1 translation in guest domain
> - Safe device passthrough under secure memory translation
> 
> Design Overview
> ---------------
> 
> These changes provide emulated SMMUv3 support:
> 
> - SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
>    SMMUv3 driver
> - vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling

So what are you planning to expose to a guest? Is it one vIOMMU per 
pIOMMU? Or a single one?

Have you considered the pros/cons for both?
> - Register/Command Emulation: SMMUv3 register emulation and command
>    queue handling

For each pSMMU, we have a single command queue that will receive command 
from all the guests. How do you plan to prevent a guest hogging the 
command queue?

In addition to that, AFAIU, the size of the virtual command queue is 
fixed by the guest rather than Xen. If a guest is filling up the queue 
with commands before notifying Xen, how do you plan to ensure we don't 
spend too much time in Xen (which is not preemptible)?

Lastly, what do you plan to expose? Is it a full vIOMMU (including event 
forwarding)?

> - Device Tree Extensions: adds iommus and virtual SMMUv3 nodes to
>    device trees for dom0 and dom0less scenarios
> - Runtime Configuration: introduces a 'viommu' boot parameter for
>    dynamic enablement
> 
> Security Considerations
> ------------------------
> 
> viommu security benefits:
> - Stage-1 translation ensures guest devices cannot perform unauthorized
>    DMA
> - Emulated SMMUv3 for domains removes dependency on host hardware while
>    maintaining isolation

I don't understand this sentence.

> 
> Observations and Potential Risks
> --------------------------------
> 
> 1. Observation:
> Support for Stage-1 translation introduces new data structures
> (s1_cfg and s2_cfg) and logic to write both Stage-1 and Stage-2 entries
> in the Stream Table Entry (STE), including an abort field for partial
> config states.
> 
> Risk:
> A partially applied Stage-1 configuration might leave guest DMA
> mappings in an inconsistent state, enabling unauthorized access or
> cross-domain interference.

I don't understand how a misconfigured stage-1 could lead to 
cross-domain interference. Can you clarify?

> 
> Mitigation (Handled by design):
> Both s1_cfg and s2_cfg are written atomically. The abort field ensures
> Stage-1 config is only used when fully applied. Incomplete configs are
> ignored by the hypervisor.
> 
> 2. Observation:
> Guests can now issue Stage-1 cache invalidations.
> 
> Risk:
> Failure to propagate invalidations could leave stale mappings, enabling
> data leakage or misrouting.

This is a risk from the guest PoV, right? IOW, this would not open up a 
security hole in Xen.

> 
> Mitigation (Handled by design):
> Guest invalidations are forwarded to the hardware to ensure IOMMU
> coherency.
> 
> 3. Observation:
> The feature introduces large functional changes including the vIOMMU
> framework, vsmmuv3 devices, command queues, event queues, domain
> handling, and Device Tree modifications.
> 
> Risk:
> Increased attack surface with risk of race conditions, malformed
> commands, or misconfiguration via the device tree.
> 
> Mitigation:
> - Improved sanity checks and error handling
> - Feature is marked as Tech Preview and self-contained to reduce risk
>    to unrelated code

Surely, you will want to use the code in production... No?

> 
> 4. Observation:
> The implementation supports nested and standard translation modes,
> using guest command queues (e.g. CMD_CFGI_STE) and events.
> 
> Risk:
> Malicious commands could bypass validation and corrupt SMMUv3 state or
> destabilize dom0.
> 
> Mitigation (Handled by design):
> Command queues are validated, and only permitted configuration changes
> are accepted. Handled in vsmmuv3 and cmdqueue logic.

I didn't mention anything in obversation 1 but now I have to say it... 
The observations you wrote are what I would expect to be handled in any 
submission to our code base. This is the bare minimum to have the code 
secure. But you don't seem to address the more subttle ones which are 
more related to scheduling issue (see some above). They require some 
design and discussion.

> 
> 5. Observation:
> Device Tree changes inject iommus and vsmmuv3 nodes via libxl.
> 
> Risk:
> Malicious or incorrect DT fragments could result in wrong device
> assignments or hardware access.
> 
> Mitigation:
> Only vetted and sanitized DT fragments are allowed. libxl limits what
> guests can inject.

Today, libxl doesn't do any sanitisation on the DT. In fact, this is 
pretty much impossible because libfdt expects trusted DT. Is this 
something you are planning to change?
> 
> 6. Observation:
> The feature is enabled per-guest via viommu setting.
> 
> Risk:
> Guests without viommu may behave differently, potentially causing
> confusion, privilege drift, or accidental exposure.
> 
> Mitigation:
> Ensure downgrade paths are safe. Perform isolation audits in
> multi-guest environments to ensure correct behavior.
> 
> Performance Impact
> ------------------
> 
> Hardware-managed translations are expected to have minimal overhead.
> Emulated vIOMMU may introduce some latency during initialization or
> event processing.

Latency to who? We still expect isolation between guests and a guest 
will not go over its time slice.

For the guest itself, the main performance impact will be TLB flushes 
because they are commands that will end up to be emulated by Xen. 
Depending on your Linux configuration (I haven't checked other), this 
will either happen every unmap operation or they will be batch. The 
performance of the latter will be the worse one.

Have you done any benchmark to confirm the impact? Just to note, I would 
not gate the work for virtual SMMUv3 based on the performance. I think 
it is ok to offer the support if the user want extra security and 
doesn't care about performance. But it would be good to outline them as 
I expect them to be pretty bad...

Cheers,

-- 
Julien Grall


