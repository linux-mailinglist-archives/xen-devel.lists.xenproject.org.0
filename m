Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLrHFXs0xGkAxQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:16:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC932B1A1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262988.1555252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Thx-0006M5-1E; Wed, 25 Mar 2026 19:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262988.1555252; Wed, 25 Mar 2026 19:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Thw-0006JK-Uf; Wed, 25 Mar 2026 19:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1262988;
 Wed, 25 Mar 2026 19:15:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Thv-0006JC-A2
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 19:15:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Thu-00FRDC-MJ
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 20:15:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c4346a-e002-0a2a0a5209dd-0a2a450ac478-30
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 20:15:58 +0100
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c4346e-1772-0a2a450a0019-d155d034cd3b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 20:15:58 +0100
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-66a395905a4so226045a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:15:58 -0700 (PDT)
Received: from [192.168.50.2] ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66ad5e3bb1csm145357a12.4.2026.03.25.12.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 12:15:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466158; x=1775070958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKyqcIJHHq+wA2L0yU3rOfeA0IeFgUSxGGXLM8ujDpw=;
        b=c97jOeLNwRS0zMISpVgZRhjuCVbdtDbssztnnfb4ed0+Evkx/FPfF59BHEVpcXgVTQ
         rX4hKctZHRlhRvl73lsB7OELSTCOm4SMIcj9P+UXH67M1gL1qW0x9PzFEsiU2mpgqb7h
         Hl8ZdxB6IPxXGYrW1fUPcMXuGBKMuhdpJlMHixB3w7i49aXcwUjpqr52WIryzGpMcwjt
         qL+8rpWKdMtHkDIFBBzhQgNIGTn0VKk4uKQ7FLdKK/JBtucRAvCb4yM7mxP7sTjPl+81
         bRDNasg76+zQ9Fwn6/fHg6AzfJVGh2+TrOvBkp8ThIRmR944MkFH8wT5p3mUxQsC2hUr
         t8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466158; x=1775070958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKyqcIJHHq+wA2L0yU3rOfeA0IeFgUSxGGXLM8ujDpw=;
        b=US9SWxnUTl2yS+l7ycv/zcYr4MwKKq2YTTLN2hVMes9voh5JHrvaqP7HpjpllnZgf/
         QRrhBQdBb6nNIyt5FPyEGDvFuDwLmP2uDUpe0WVhBBj0P6N9+1SK71ZDoYixL4WnsP2J
         wTo8wYjtQ0129bAbB3W5I3Qk+G7HvN1NZyHdYVoUQZsnUI/QoAfMDS18gTT/ERsmk5C7
         0kIRwut1pT9ye1d3ILgWc5sQsWMN8Ta2p58ROih2IARFU5PI8VDD52CrfWgBGAGgQT2R
         RT8F0U6MZysZK01tys/VagAq4MnmsXwwih35Q7w9xhGT1k854IAxCTnL1o9TKazx809I
         Ub5w==
X-Forwarded-Encrypted: i=1; AJvYcCUhRMHv1U95uJOdTpoJyGnxn16ADYqH5D0glnFxYDQ7UGGZRPwsoZesIhnPZbRMEv3tAnGL5FgEmJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7FexDMk0KD4w/cRs33rTrNh4B0A0V/iH+qowt2NUUWbj4e669
	W3oM3NwdJETcwEoEIDSsnuXc6XgFg/pk18wkak9o7ORxssooIPeUp0aQUa3Jcg==
X-Gm-Gg: ATEYQzxcxtBVKtzSyxKKA6WmgqM0hq/iyZyRNg1MjIs/aIHzS8EXikXtAgX0ziWr/Rx
	ItlpYvdtb7ZYsiu3j9VPTRGKN1necqR0wCHilu87qmyf1G7WQ8rnZ1ZPq4F8k6aBtcg/nQ3obP4
	gF4fcZI/WOWViNc2jsyYi3rE965hHxSsG30BW+fPwV/goeZU+PJmNfAOkIwqW1dACIGHkiCVGJ8
	PFSQyEMV6ugXOw74CHqixkHVLYN9n+SQHhSChFSQaiT2/fbnPcinz5KbEmH+7BrSdN47yeWWSu5
	6RXJOsfRYIl81o/g5bT3Rw/5MgRyN1eOezO4DXeo5lWq+Ht7Nsw9dXKVvoIvVxmxc2iMt2lSVJa
	JqNRQOAlL7TjsyAqo05dr/jHyhrFan5IG/0pmPNXwKHpgx/ujfLDVrTmvhb4PUSd1p8BbPBzzbO
	QGAC1MJxg7sdWPFwZslbQbSogR8g==
X-Received: by 2002:a05:6402:34cf:b0:66a:16ed:46cb with SMTP id 4fb4d7f45d1cf-66a826e284fmr3010063a12.26.1774466157795;
        Wed, 25 Mar 2026 12:15:57 -0700 (PDT)
Message-ID: <93be90c5-8ea9-40f2-89f2-1da4f998eb0d@gmail.com>
Date: Wed, 25 Mar 2026 21:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] doc/arm: vIOMMU design document
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <49d070a544492530d8c861fec03c90ea136c989e.1774305918.git.milan_djokic@epam.com>
Content-Language: en-US
From: Mykola Kvach <xakep.amatop@gmail.com>
In-Reply-To: <49d070a544492530d8c861fec03c90ea136c989e.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774466158-BD689900-A4821F55/0/0
X-purgate-type: clean
X-purgate-size: 16317
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9BEC932B1A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch seems to be missing both the Signed-off-by tag and the commit
message body.

On 24/03/2026 00:51, Milan Djokic wrote:
> ---
>   docs/designs/arm-viommu.rst | 390 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 390 insertions(+)
>   create mode 100644 docs/designs/arm-viommu.rst
> 
> diff --git a/docs/designs/arm-viommu.rst b/docs/designs/arm-viommu.rst
> new file mode 100644
> index 0000000000..0cf55d7108
> --- /dev/null
> +++ b/docs/designs/arm-viommu.rst
> @@ -0,0 +1,390 @@
> +==========================================================
> +Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
> +==========================================================
> +
> +:Author:     Milan Djokic <milan_djokic@epam.com>
> +:Date:       2026-02-13
> +:Status:     Draft
> +
> +Introduction
> +============
> +
> +The SMMUv3 supports two stages of translation. Each stage of translation
> +can be
> +independently enabled. An incoming address is logically translated from
> +VA to
> +IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
> +the output PA. Stage 1 translation support is required to provide
> +isolation between different
> +devices within OS. XEN already supports Stage 2 translation but there is no
> +support for Stage 1 translation.
> +This design proposal outlines the introduction of Stage-1 SMMUv3 support
> +in Xen for ARM guests.
> +
> +Motivation
> +==========
> +
> +ARM systems utilizing SMMUv3 require stage-1 address translation to
> +ensure secure DMA and
> +guest managed I/O memory mappings.
> +With stage-1 enabled, guest manages IOVA to IPA mappings through its own
> +IOMMU driver.
> +
> +This feature enables:
> +
> +- Stage-1 translation for the guest domain
> +- Device passthrough with per-device I/O address space
> +
> +Design Overview
> +===============
> +
> +These changes provide emulated SMMUv3 support:
> +
> +- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
> +  in SMMUv3 driver.
> +- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
> +  handling.
> +- **Register/Command Emulation**: SMMUv3 register emulation and command
> +  queue handling.
> +- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
> +  device trees for dom0 and dom0less scenarios.
> +- **Runtime Configuration**: Introduces a `viommu` boot parameter for
> +  dynamic enablement.
> +
> +A single vIOMMU device is exposed to the guest and mapped to one or more
> +physical IOMMUs through a Xen-managed translation layer.
> +The vIOMMU feature provides a generic framework together with a backend
> +implementation specific to the target IOMMU type. The backend is responsible
> +for implementing the hardware-specific data structures and command handling
> +logic (currently only SMMUv3 is supported).
> +
> +This modular design allows the stage-1 support to be reused
> +for other IOMMU architectures in the future.
> +
> +vIOMMU architecture
> +===================
> +
> +Responsibilities:
> +
> +Guest:
> + - Configures stage-1 via vIOMMU commands.
> + - Handles stage-1 faults received from Xen.
> +
> +Xen:
> + - Emulates the IOMMU interface (registers, commands, events).
> + - Provides vSID->pSID mappings.
> + - Programs stage-1/stage-2 configuration in the physical IOMMU.
> + - Propagate stage-1 faults to guest.
> +
> +vIOMMU commands and faults are transmitted between guest and Xen via
> +command and event queues (one command/event queue created per guest).
> +
> +vIOMMU command Flow:
> +
> +::
> +
> +    Guest:
> +        smmu_cmd(vSID, IOVA -> IPA)
> +
> +    Xen:
> +        trap MMIO read/write
> +        translate vSID->pSID
> +        store stage-1 state
> +        program pIOMMU for (pSID, IPA -> PA)
> +
> +All hardware programming of the physical IOMMU is performed exclusively by Xen.
> +
> +vIOMMU Stage-1 fault handling flow:
> +
> +::
> +
> +    Xen:
> +        receives stage-1 fault
> +        triggers vIOMMU callback
> +        injects virtual fault
> +
> +    Guest:
> +        receives and handles fault
> +
> +vSID Mapping Layer
> +------------------
> +
> +Each guest-visible Stream ID (vSID) is mapped by Xen to a physical Stream ID
> +(pSID). The mapping is maintained per-domain. The allocation policy guarantees
> +vSID uniqueness within a domain while allowing reuse of pSIDs for different
> +pIOMMUs.
> +
> +* Platform devices receive individually allocated vSIDs.
> +* PCI devices receive a contiguous vSID range derived from RID space.
> +
> +
> +Supported Device Model
> +======================
> +
> +Currently, the vIOMMU framework supports only devices described via the
> +Device Tree (DT) model. This includes platform devices and basic PCI
> +devices support instantiated through the vPCI DT node. ACPI-described
> +devices are not supported.
> +
> +Guest assigned platform devices are mapped via `iommus` property:
> +
> +::
> +
> +    <&pIOMMU pSID> -> <&vIOMMU vSID>
> +
> +PCI devices use RID-based mapping via the root complex `iommu-map`:
> +
> +::
> +
> +    <RID-base &viommu vSID-base length>
> +
> +PCI Topology Assumptions and Constraints:
> +
> +- RID space must be contiguous
> +- Pre-defined continuous pSID space (0-0x1000)
> +- No runtime PCI reconfiguration
> +- Single root complex assumed
> +- Mapping is fixed at guest DT construction
> +
> +Constraints for PCI devices will be addressed as part of the future work on
> +this feature.
> +
> +Security Considerations
> +=======================
> +
> +Stage-1 translation provides isolation between guest devices by
> +enforcing a per-device I/O address space, preventing unauthorized DMA.
> +With the introduction of emulated IOMMU, additional protection
> +mechanisms are required to minimize security risks.
> +
> +1. Observation:
> +---------------
> +Support for Stage-1 translation in SMMUv3 introduces new data structures
> +(`s1_cfg` alongside `s2_cfg`)
> +and logic to write both Stage-1 and Stage-2 entries in the Stream Table
> +Entry (STE), including an `abort`
> +field to handle partial configuration states.
> +
> +**Risk:**
> +Without proper handling, a partially applied configuration
> +might leave guest DMA mappings in an inconsistent state, potentially
> +enabling unauthorized access or causing cross-domain interference.
> +
> +**Mitigation:** *(Handled by design)*
> +This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
> +STE and manages the `abort` field - only considering
> +configuration if fully attached. This ensures  incomplete or invalid
> +device configurations are safely ignored by the hypervisor.
> +
> +2. Observation:
> +---------------
> +Guests can now invalidate Stage-1 caches; invalidation needs forwarding
> +to SMMUv3 hardware to maintain coherence.
> +
> +**Risk:**
> +Failing to propagate cache invalidation could allow stale mappings,
> +enabling access to old mappings and possibly
> +data leakage or misrouting between devices assigned to the same guest.
> +
> +**Mitigation:**
> +The guest must issue appropriate invalidation commands whenever
> +its stage-1 I/O mappings are modified to ensure that translation caches
> +remain coherent.
> +
> +3. Observation:
> +---------------
> +Introducing optional per-guest enabled features (`viommu` argument in xl
> +guest config) means some guests
> +may opt-out.
> +
> +**Risk:**
> +Guests without vIOMMU enabled (stage-2 only) could potentially dominate
> +access to the physical command and event queues, since they bypass the
> +emulation layer and processing is faster comparing to vIOMMU-enabled guests.
> +
> +**Mitigation:**
> +Audit the impact of emulation overhead effect on IOMMU processing fairness
> +in a multi-guest environment.
> +Consider enabling/disabling stage-1 on a system level, instead of per-domain.
> +
> +4. Observation:
> +---------------
> +Guests have the ability to issue Stage-1 IOMMU commands like cache
> +invalidation, stream table entries
> +configuration, etc. An adversarial guest may issue a high volume of
> +commands in rapid succession.
> +
> +**Risk:**
> +Excessive commands requests can cause high hypervisor CPU consumption
> +and disrupt scheduling,
> +leading to degraded system responsiveness and potential
> +denial-of-service scenarios.
> +
> +**Mitigation:**
> +
> +- Implement vIOMMU commands execution restart and continuation support:
> +
> +  - Introduce processing budget with only a limited amount of commands
> +    handled per invocation.
> +  - If additional commands remain pending after the budget is exhausted,
> +    defer further processing and resume it asynchronously, e.g. via a
> +    per-domain tasklet.
> +
> +- Batch multiple commands of same type to reduce emulation overhead:
> +
> +  - Inspect the command queue and group commands that can be processed
> +    together (e.g. multiple successive invalidation requests or STE
> +    updates for the same SID).
> +  - Execute the entire batch in one go, reducing repeated accesses to
> +    guest memory and emulation overhead per command.
> +  - This reduces CPU time spent in the vIOMMU command processing loop.
> +    The optimization is applicable only when consecutive commands of the
> +    same type operate on the same SID/context.
> +
> +5. Observation:
> +---------------
> +Some guest commands issued towards vIOMMU are propagated to pIOMMU
> +command queue (e.g. TLB invalidate).
> +
> +**Risk:**
> +Excessive commands requests from abusive guest can cause flooding of
> +physical IOMMU command queue,
> +leading to degraded pIOMMU responsiveness on commands issued from other
> +guests.
> +
> +**Mitigation:**
> +
> +- Batch commands that are propagated to the pIOMMU command queue and
> +  implement batch execution pause/continuation.
> +  Rely on the same mechanisms as in the previous observation
> +  (command continuation and batching of pIOMMU-related commands of the same
> +  type and context).
> +- If possible, implement domain penalization by adding a per-domain budget
> +  for vIOMMU/pIOMMU usage:
> +
> +  - Apply per-domain dynamic budgeting of allowed IOMMU commands to
> +    execute per invocation, reducing the budget for guests with
> +    excessive command requests over a longer period of time
> +  - Combine with command continuation mechanism
> +
> +6. Observation:
> +---------------
> +The vIOMMU feature includes an event queue used to forward IOMMU events
> +to the guest (e.g. translation faults, invalid Stream IDs, permission errors).
> +A malicious guest may misconfigure its IOMMU state or intentionally trigger
> +faults at a high rate.
> +
> +**Risk:**
> +Occurrence of IOMMU events with high frequency can cause Xen to flood the
> +event queue and disrupt scheduling with
> +high hypervisor CPU load for events handling.
> +
> +**Mitigation:**
> +
> +- Implement fail-safe state by disabling events forwarding when faults
> +  are occurred with high frequency and
> +  not processed by guest:
> +
> +  - Introduce a per-domain pending event counter.
> +  - Stop forwarding events to the guest once the number of unprocessed
> +    events reaches a predefined threshold.
> +
> +- Consider disabling the emulated event queue for untrusted guests.
> +- Note that this risk is more general and may also apply to stage-2-only
> +  guests. This section addresses mitigations in the emulated IOMMU layer
> +  only. Mitigation of physical event queue flooding should also be considered
> +  in the target pIOMMU driver.
> +
> +Performance Impact
> +==================
> +
> +With iommu stage-1 and nested translation inclusion, performance
> +overhead is introduced comparing to existing,
> +stage-2 only usage in Xen. Once mappings are established, translations
> +should not introduce significant overhead.
> +Emulated paths may introduce moderate overhead, primarily affecting
> +device initialization and event/command handling.
> +Testing is performed on Renesas R-Car platform.
> +Performance is mostly impacted by emulated vIOMMU operations, results
> +shown in the following table.
> +
> ++-------------------------------+---------------------------------+
> +| vIOMMU Operation              | Execution time in guest         |
> ++===============================+=================================+
> +| Reg read                      | median: 645ns, worst-case: 2us  |
> ++-------------------------------+---------------------------------+
> +| Reg write                     | median: 630ns, worst-case: 1us  |
> ++-------------------------------+---------------------------------+
> +| Invalidate TLB                | median: 2us, worst-case: 10us   |
> ++-------------------------------+---------------------------------+
> +| Invalidate STE                | median: 5us worst_case: 100us   |
> ++-------------------------------+---------------------------------+
> +
> +With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
> +and configure stage-1 mappings for the devices
> +attached to it.
> +Following table shows initialization stages which impact stage-1 enabled
> +guest boot time and compares it with
> +stage-1 disabled guest.
> +
> +NOTE: Device probe execution time varies depending on device complexity.
> +A USB host controller was selected as the test device in this case.
> +
> ++---------------------+-----------------------+------------------------+
> +| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
> ++=====================+=======================+========================+
> +| IOMMU Init          | ~10ms                 | /                      |
> ++---------------------+-----------------------+------------------------+
> +| Dev Attach / Mapping| ~100ms                | ~90ms                  |
> ++---------------------+-----------------------+------------------------+
> +
> +For devices configured with dynamic DMA mappings, DMA allocate/map/unmap
> +operations performance is
> +also impacted on stage-1 enabled guests.
> +Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio
> +write/read and TLB invalidations.
> +
> ++---------------+---------------------------+--------------------------+
> +| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
> ++===============+===========================+==========================+
> +| dma_alloc     | median: 20us, worst: 5ms  | median: 8us, worst: 60us |
> ++---------------+---------------------------+--------------------------+
> +| dma_free      | median: 500us, worst: 10ms| median: 6us, worst: 30us |
> ++---------------+---------------------------+--------------------------+
> +| dma_map       | median: 12us, worst: 60us | median: 3us, worst: 20us |
> ++---------------+---------------------------+--------------------------+
> +| dma_unmap     | median: 400us, worst: 5ms | median: 5us, worst: 20us |
> ++---------------+---------------------------+--------------------------+
> +
> +Testing
> +=======
> +
> +- QEMU-based ARM system tests for Stage-1 translation.
> +- Actual hardware validation to ensure compatibility with real SMMUv3
> +implementations.
> +- Unit/Functional tests validating correct translations (not implemented).
> +
> +Migration and Compatibility
> +===========================
> +
> +This optional feature defaults to disabled (`viommu=""`) for backward
> +compatibility.
> +
> +Future improvements
> +===================
> +
> +- Implement the proposed mitigations to address security risks that are
> +  not covered by the current design
> +  (events batching, commands execution continuation)
> +- PCI support
> +- Support for other IOMMU HW (Renesas, RISC-V, etc.)
> +
> +References
> +==========
> +
> +- Original feature implemented by Rahul Singh:
> +
> +https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
> +
> +- SMMUv3 architecture documentation
> +- Existing vIOMMU code patterns (KVM, QEMU)
> \ No newline at end of file


