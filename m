Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A6AFD10B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 18:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036903.1409394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBDC-0004cc-UV; Tue, 08 Jul 2025 16:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036903.1409394; Tue, 08 Jul 2025 16:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBDC-0004bB-RI; Tue, 08 Jul 2025 16:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1036903;
 Tue, 08 Jul 2025 16:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0DE=ZV=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uZBDB-0004b5-Ab
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 16:30:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d8cbee28-5c18-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 18:30:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 218A5153B;
 Tue,  8 Jul 2025 09:30:11 -0700 (PDT)
Received: from PWQ0QT7DJ1.cambridge.arm.com (unknown [10.57.69.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F063F694;
 Tue,  8 Jul 2025 09:30:20 -0700 (PDT)
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
X-Inumbo-ID: d8cbee28-5c18-11f0-b894-0df219b8e170
Date: Tue, 8 Jul 2025 17:30:18 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, luca.fancellu@arm.com, 
	ayankuma@amd.com
Subject: RFC: Proposal for supporting EL1 MPU region context switch in Xen
Message-ID: <sx7fysbgi6fwrza24lq2xkyvnz254756cptucxqfokwrd7pxs7@k3swbmqmfvel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

# Proposal for supporting EL1 MPU region context switch in Xen

This proposal will introduce the proposed design for supporting EL1 MPU region
context switch for guests.

## Purpose

We would like to be able to support the PMSAv8-64 translation regime at EL1 for
Xen guests. We would also like to configure the number of supported MPU regions
on a per-guest basis.

## Interface:

We propose to add a new device tree property `mpu`, which specifies the number
of MPU memory regions that a guest is allowed to use and governs whether the
EL1 MPU and the PMSAv8-64 translation regime are enabled at EL1 for a guest.

The property is specified as follows:

- mpu
    Optional. A 32-bit integer specifying the value returned by accesses to
    MPUIR_EL1.REGION (or MPUIR.REGION on AArch32). This property also governs
    whether the EL1 MPU and the PMSAv8-64 translation regime are enabled at EL1.

    Behavior:

    - `mpu = <0>;`
      Disables the EL1 MPU and the PMSAv8-64 translation regime at EL1. This is
      also the default behavior if the `mpu` property is omitted.

    - `mpu;` (property present with no value)
      Enables the EL1 MPU and the PMSAv8-64 translation regime at EL1. The value
      returned by accesses to MPUIR_EL1.REGION (or MPUIR.REGION on AArch32) will
      match the actual hardware register value.

    - `mpu = <N>;` (N > 0)
      Enables the EL1 MPU and the PMSAv8-64 translation regime at EL1. The value
      returned by accesses to MPUIR_EL1.REGION (or MPUIR.REGION on AArch32) is
      set to N. This value must not exceed the actual hardware-supported number
      of regions.

    Domain creation will fail and the system will halt if:

    - A non-zero value is specified but exceeds the hardware-supported number of
      MPU regions.

    - A non-zero value is specified but the kernel is not built with
      `CONFIG_MPU`.

A new field - `nr_mpu_regions` - will be added to the arm-specific
`struct arch_domain` in xen/arch/arm/include/asm/domain.h to store the value of
the `mpu` device tree property. The field has type uint8_t.

## Trapping and Emulation:

In order to control the number of regions supported by the EL1 MPU we must trap
accesses to MPUIR_EL1. Additionally, to prevent accesses to or modification of
MPU regions outside of the range of the configured number of supported regions
we must also trap accesses to PRENR_EL1, PRSELR_EL1, PRBAR_EL1, PRBAR<n>_EL1,
PRLAR_EL1, PRLAR<n>_EL1 (AArch64) and PRSELR, PRBAR, PRBAR<n>, PRLAR, PRLAR<n>
(AArch32).

### Trapping accesses to MPUIR_EL1 (AArch64) and MPUIR (AArch32):

Access to MPUIR_EL1/MPUIR will be trapped and emulated, returning the value of
the `nr_mpu_regions` field.

- On AArch64: if HCR_EL2.TID1 == 1, EL1 accesses to MPUIR_EL1, REVIDR_EL1,
  AIDR_EL1 are trapped to EL2 [^1]. We will emulate these as follows:

    - MPUIR_EL1: return value of `nr_mpu_regions` field
    - REVIDR_EL1: Unmodified value read from hardware
    - AIDR_EL1: Unmodified value read from hardware

- On AArch32: if HCR.TID1 == 1, EL1 accesses to MPUIR, TCMTR, TLBTR, REVIDR,
  AIDR are trapped to Hyp mode [^2].

    - MPUIR: return value of `nr_mpu_regions` field
    - TCMTR: Unmodified value read from hardware
    - TLBTR: Unmodified value read from hardware
    - REVIDR: Unmodified value read from hardware
    - AIDR: Unmodified value read from hardware

### Trapping accesses to virtual memory control registers

Accesses to the PMSAv8-64 virtual memory control registers from EL1 must also be
trapped to EL2, to prevent modification of MPU regions outside of the range of
the configured number of supported regions.

- On AArch64: if HCR_EL2.TVM == 1, EL1 write accesses to virtual memory control
  registers are trapped to EL2 [^1]. We will emulate these as follows:
    - SCTLR_EL1: Unmodified value written to hardware
	- TTBR0_EL: Unmodified value written to hardware
	- TTBR1_EL: Unmodified value written to hardware
	- TCR_EL1: Unmodified value written to hardware
	- ESR_EL1: Unmodified value written to hardware
	- FAR_EL1: Unmodified value written to hardware
	- AFSR0_EL1: Unmodified value written to hardware
	- AFSR1_EL1: Unmodified value written to hardware
	- MAIR_EL1: Unmodified value written to hardware
	- AMAIR_EL1: Unmodified value written to hardware
	- CONTEXTIDR_EL1: Unmodified value written to hardware
    - PRENR_EL1: If value has any set bits in positions corresponding to MPU
      regions >= `nr_mpu_regions`, i.e. `value & ~((1U << nr_mpu_regions) - 1)`
      is non-zero, the write is ignored. Otherwise, the unmodified value is
      written to hardware.
    - PRSELR_EL1: If value >= `nr_mpu_regions` the write causes a guest crash.
      This deviates from the TRM, which states that the value of the register
      becomes UNKNOWN. Otherwise, the unmodified value is written to hardware.
	- PRBAR_EL1: Unmodified value written to hardware.
	- PRBAR<n>_EL1: If `n` is such that the value of `PRSELR_EL1.REGION<7:4>:n`
      >= `nr_mpu_regions` the write causes a guest crash. This deviates from the
      TRM, which states that invalid writes make all PRBAR_EL1 registers value
      UNKNOWN. Otherwise the unmodified value is written to hardware.
	- PRLAR_EL1: Unmodified value written to hardware.
	- PRLAR<n>_EL1: If `n` is such that the value of `PRSELR_EL1.REGION<7:4>:n`
      >= `nr_mpu_regions` the write causes a guest crash. This deviates from the
      TRM, which states that invalid writes make all PRBAR_EL1 registers value
      UNKNOWN. Otherwise the unmodified value is written to hardware.

- On AArch64: if HCR_EL2.TRVM == 1, EL1 read accesses to virtual memory control
  registers are trapped to EL2 [^1]. We will emulate these as follows:
    - SCTLR_EL1: Unmodified value read from hardware
	- TTBR0_EL: Unmodified value read from hardware
	- TTBR1_EL: Unmodified value read from hardware
	- TCR_EL1: Unmodified value read from hardware
	- ESR_EL1: Unmodified value read from hardware
	- FAR_EL1: Unmodified value read from hardware
	- AFSR0_EL1: Unmodified value read from hardware
	- AFSR1_EL1: Unmodified value read from hardware
	- MAIR_EL1: Unmodified value read from hardware
	- AMAIR_EL1: Unmodified value read from hardware
	- CONTEXTIDR_EL1: Unmodified value read from hardware
    - PRENR_EL1: Unmodified value read from hardware
    - PRSELR_EL1: Unmodified value read from hardware
	- PRBAR_EL1: Unmodified value read from hardware.
	- PRBAR<n>_EL1: If `n` is such that the value of `PRSELR_EL1.REGION<7:4>:n`
      >= `nr_mpu_regions` the read causes a guest crash. This deviates from the
      TRM which states that invalid reads return an UNKNOWN value. Otherwise the
      unmodified value is read from hardware.
	- PRLAR_EL1: Unmodified value read from hardware.
	- PRLAR<n>_EL1: If `n` is such that the value of `PRSELR_EL1.REGION<7:4>:n`
      >= `nr_mpu_regions` the read causes a guest crash. This deviates from the
      TRM which states that invalid reads return an UNKNOWN value. Otherwise the
      unmodified value is read from hardware.

- On AArch32: if HCR.TVM == 1, EL1 write accesses to memory control registers
  are trapped to Hyp mode [^2]. We will emulate these as follows:
    - SCTLR: Unmodified value written to hardware
	- DFSR: Unmodified value written to hardware
	- IFSR: Unmodified value written to hardware
	- DFAR: Unmodified value written to hardware
	- IFAR: Unmodified value written to hardware
	- ADFSR: Unmodified value written to hardware
	- AIFSR: Unmodified value written to hardware
	- PRRR: Unmodified value written to hardware
	- NMRR: Unmodified value written to hardware
	- MAIR0: Unmodified value written to hardware
	- MAIR1: Unmodified value written to hardware
	- AMAIR0: Unmodified value written to hardware
	- AMAIR1: Unmodified value written to hardware
	- CONTEXTIDR: Unmodified value written to hardware
    - PRSELR: If value >= `nr_mpu_regions` the write causes a guest crash.
      Otherwise, the unmodified value is written to hardware.
	- PRBAR: Unmodified value written to hardware
	- PRBAR<n>: If `n` >= `nr_mpu_regions` the write causes a guest crash.
      Otherwise the unmodified value is written to hardware.
	- PRLAR: Unmodified value written to hardware
	- PRLAR<n>: If `n` >= `nr_mpu_regions` the write causes a guest crash.
      Otherwise the unmodified value is written to hardware.

- On AArch32: if HCR.TRVM == 1, EL1 read accesses to memory control registers
  are trapped to Hyp mode [^2]. We will emulate these as follows:
    - SCTLR: Unmodified value read from hardware
	- DFSR: Unmodified value read from hardware
	- IFSR: Unmodified value read from hardware
	- DFAR: Unmodified value read from hardware
	- IFAR: Unmodified value read from hardware
	- ADFSR: Unmodified value read from hardware
	- AIFSR: Unmodified value read from hardware
	- PRRR: Unmodified value read from hardware
	- NMRR: Unmodified value read from hardware
	- MAIR0: Unmodified value read from hardware
	- MAIR1: Unmodified value read from hardware
	- AMAIR0: Unmodified value read from hardware
	- AMAIR1: Unmodified value read from hardware
	- CONTEXTIDR: Unmodified value read from hardware

    - PRSELR: Unmodified value read from hardware
	- PRBAR: Unmodified value read from hardware.
	- PRBAR<n>: If `n` >= `nr_mpu_regions` the read causes a guest crash.
      Otherwise the unmodified value is read from hardware.
	- PRLAR: Unmodified value read from hardware
	- PRLAR<n>: If `n` >= `nr_mpu_regions` the read causes a guest crash.
      Otherwise the unmodified value is read from hardware.

On context switch, we need to ensure that:
- PRSELR_EL1 (AArch64) and PRSELR (AArch32) is saved/restored
- Base and Limit registers for all MPU regions up to the number of regions
  supported by the guest, i.e. regions [0, nr_mpu_regions-1] are saved/restored.
  It is not necessary to zero the MPU memory regions outside of this range, as
  these are rendered inaccessible to a guest via trapping and emulation of the
  virtual memory control registers.

## Interaction with existing handling of Set/Way operations

In order to handle Set/Way operations the following policy is used [^3]:

- If we trap a S/W operation, we enable VM trapping (HCR_EL2.TVM/HCR.TVM == 1)
  to detect caches being turned on/off, and do a full clean.
- Once the caches are enabled, we disable VM trapping (HCR_EL2.TVM/HCR.TVM == 0)

This causes an issue, because VM control register trapping will be switched off
any time caches change state from disabled to enabled. We propose to address
this by not disabling VM control register trapping once caches are enabled for
PMSAv8-64 guests.

## Considerations:

- If we zero the non-accessible Base/Limit registers on context switch then we
  could avoid trapping read accesses to virtual memory control registers. The
  trade-off here would be additional overhead on context switch due to zeroing
  the maximum number of architecturally supported MPU regions (255).

[^1] https://developer.arm.com/documentation/ddi0487/latest (G1.3.3)
[^2] https://developer.arm.com/documentation/ddi0487/latest (E2.1.5)
[^3] https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c#L404-L431
---
Cheers,
Hari

