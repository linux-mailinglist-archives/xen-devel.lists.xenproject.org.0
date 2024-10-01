Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06198BC4C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808066.1219860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9C-0002yp-OJ; Tue, 01 Oct 2024 12:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808066.1219860; Tue, 01 Oct 2024 12:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9C-0002vq-LX; Tue, 01 Oct 2024 12:38:34 +0000
Received: by outflank-mailman (input) for mailman id 808066;
 Tue, 01 Oct 2024 12:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9B-0002va-CX
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:33 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b62fee-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:31 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so3118499e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:31 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:29 -0700 (PDT)
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
X-Inumbo-ID: 10b62fee-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786310; x=1728391110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8I9vUyTCDxKTgbtQS46FbfAQY00LnIcMBSmmBqvIyVY=;
        b=e2Z7T0gk5do8F7INwq+nCXCsNsnUDJVCcWEG7lQ32Y0XULh/sYC3X2G4xq5jdk+eWt
         bC20cg6oaFCOOugZQ+aIGV0TCS8UeKrz2ZCuAnkOV38tlXBXJydnt9AWGFMFNnG+mAWd
         MyYgRoVALaxexg486gTr1P81A4WV2n/171PgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786310; x=1728391110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I9vUyTCDxKTgbtQS46FbfAQY00LnIcMBSmmBqvIyVY=;
        b=wrz3eq+l7v2IQB4kiqU0INkinvSlOO/qgIlP3hYHphAu8AeFT+PFxHxy6Lxompys2w
         rLBlI2jBmsCjza3qHwfhzhGbts4W46Lk4i9bKbyX1MM6KAkMQOBzRNYbtqr2kyh8LXI7
         R2CzLyMgtKvw+pTMDjs/E0AZAqJacrk2K8qoqyj1waOTJb8YlIzDOeUz4E16KBt0F6gf
         jpeRkADcZ2Y6KZVNLZUw8G4XR4IZvUanO2F/iG8HHNzqP9svXOCJAI0JZfshdhXnsSbg
         C2hcfyTTYFGlIrX9jr76RJ8xPy3tKlx7Sw3jojxfkk54rwXXVzmQL3+i9xxFuDWeNShB
         0NuA==
X-Gm-Message-State: AOJu0YzuZVFpfKDkQKs8IpuUUx1cdof07O8cndfCUQCrjJxHSkYkJd9D
	WY4Hm5rYaYZI5V1Nt/p+5Bzvvilp/xRowl9kzgsxdCX3POmWqN3KvLLNUF0aIih5aRBl+imv1nx
	M9rQ=
X-Google-Smtp-Source: AGHT+IGNh8YiqZHSmXP3SfZkvWfUZMCy3tQ19UeQ739eGYUvmnyI9eLXyq0bUf23ifScRMo8J0LKIQ==
X-Received: by 2002:a05:6512:3d93:b0:530:abec:9a23 with SMTP id 2adb3069b0e04-5389fc3b407mr8096417e87.17.1727786310063;
        Tue, 01 Oct 2024 05:38:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 00/11] x86: Expose consistent topology to guests
Date: Tue,  1 Oct 2024 13:37:56 +0100
Message-ID: <20241001123807.605-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(original cover letter at the bottom)

The series wasn't taking proper precautions to not break PVH. In particular,
because new APIC IDs break with the old convention, PVH is not something that
can be left for later as it otherwise suffers a mismatch between APIC IDs in
the vLAPICs and the MADT table.

This version is a rebased v5 with the additional fixes of:
  1. PVH should now work, because libacpi was refactored to stop taking a
     function pointer and start taking a LUT for the cpu->apic_id mapping.
  2. Expose leaf 0xb to guests even on hosts that don't themselves do so.
     (e.g: AMD Lisbon). Otherwise all such hosts are unable to create
     guests with this patch series on, and there's no good reason not to do so.

Hypervisor prerequisites:

  patch 1: lib/x86: Relax checks about policy compatibility
    * new patch to properly operate (after this series) on older AMD hardware. 
  patch 2: x86/vlapic: Move lapic migration checks to the check hooks
    * Same as in v5
  patch 3: xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
    * Same as in v5.
  patch 4: xen/x86: Add supporting code for uploading LAPIC contexts during
           domain create
    * Same as in v5.

hvmloader prerequisites

  patch 5: tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
    * Same as in v5.

Toolstack prerequisites:

  patch 6: tools/libacpi: Use LUT of APIC IDs rather than function pointer
    * new patch to enable proper topology reporting to PVH guests.
  patch 7: tools/libguest: Always set vCPU context in vcpu_hvm()
    * Same as in v5.

No functional changes:

  patch 8: xen/lib: Add topology generator for x86
    * Same as in v5.
  patch 9: xen/x86: Derive topologically correct x2APIC IDs from the policy
    * Same as in v5.

Final toolstack/xen stitching:

  patch 10: tools/libguest: Set distinct x2APIC IDs for each vCPU
    * Unlikely in v5, this patch takes the APIC IDs from a LUT stored in
      the xc_dom_image structure.
  patch 11: xen/x86: Synthesise domain topologies
    * Same as v5.

====================================================================

v5: https://lore.kernel.org/xen-devel/20240808134251.29995-1-alejandro.vallejo@cloud.com/
v4 -> v5:

Largely unchanged and resent for review after the 4.20 dev cycle started.

  * Addressed Andrew's nits in v4/patch1
  * Addressed Jan's concern with MTRR overrides in v4/patch6 by keeping the
    same MTRR data in the vCPU contexts for HVM domain creations.

v4: https://lore.kernel.org/xen-devel/cover.1719416329.git.alejandro.vallejo@cloud.com/
v3 -> v4:

  * Fixed cpuid() bug in hvmloader, causing UB in v3
  * Fixed a bogus assert in hvmloader, also causing a crash in v3
  * Used HVM contexts rather than sync'd algos between Xen and toolstack in
    order to initialise the per-vCPU LAPIC state.
  * Formatting asjustments.

v3: https://lore.kernel.org/xen-devel/cover.1716976271.git.alejandro.vallejo@cloud.com/
v2 -> v3:

  (v2/patch2 and v2/patch4 are already committed)

  * Moved the vlapic check hook addition to v3/patch1
    * And created a check hook for the architectural state too for consistency.
  * Fixed migrations from Xen <= 4.13 by reconstructing the previous topology.
  * Correctly set the APIC ID after a policy change when vlapic is already in
    x2APIC mode.
  * Removed bogus assumption introduced in v1 and v2 on hvmloader about which
    8bit APIC IDs represent ids > 254. (it's "id % 0xff", not "min(id, 0xff)".
        * Used an x2apic flag check instead.
  * Various formatting adjustments.

v2: https://lore.kernel.org/xen-devel/cover.1715102098.git.alejandro.vallejo@cloud.com/
v1 -> v2:

  * v1/patch 4 replaced by a different strategy (See patches 4 and 5 in v2):
      * Have hvmloader populate MADT with the real APIC IDs as read by the APs
        themselves rather than giving it knowledge on how to derive them.
  * Removed patches 2 and 3 in v1, as no longer relevant.
  * Split v1/patch6 in two parts ((a) creating the generator and (b) plugging it
    in) and use the generator in the unit tests of the vcpuid->apicid mapping
    function. Becomes patches 6 and 8 in v2.

  Patch 1: Same as v1/patch1.
  Patch 2: Header dependency cleanup in preparation for patch3.
  Patch 3: Adds vlapic_hidden check for the newly introduced reserved area.
  Patch 4: [hvmloader] Replaces INIT+SIPI+SIPI sequences with hypercalls.
  Patch 5: [hvmloader] Retrieve the per-CPU APIC IDs from the APs themselves.
  Patch 6: Split from v1/patch6.
  Patch 7: Logically matching v1/patch5, but using v2/patch6 for testing.
  Patch 8: Split from v1/patch6.

v1: https://lore.kernel.org/xen-devel/20240109153834.4192-1-alejandro.vallejo@cloud.com/
=== Original cover letter ===

Current topology handling is close to non-existent. As things stand, APIC
IDs are allocated through the apic_id=vcpu_id*2 relation without giving any
hints to the OS on how to parse the x2APIC ID of a given CPU and assuming
the guest will assume 2 threads per core.

This series involves bringing x2APIC IDs into the migration stream, so
older guests keep operating as they used to and enhancing Xen+toolstack so
new guests get topology information consistent with their x2APIC IDs. As a
side effect of this, x2APIC IDs are now packed and don't have (unless under
a pathological case) gaps.

Further work ought to allow combining this topology configurations with
gang-scheduling of guest hyperthreads into affine physical hyperthreads.
For the time being it purposefully keeps the configuration of "1 socket" +
"1 thread per core" + "1 core per vCPU".

Patch 1: Includes x2APIC IDs in the migration stream. This allows Xen to
         reconstruct the right x2APIC IDs on migrated-in guests, and
         future-proofs itself in the face of x2APIC ID derivation changes.
Patch 2: Minor refactor to expose xc_cpu_policy in libxl
Patch 3: Refactors xen/lib/x86 to work on non-Xen freestanding environments
         (e.g: hvmloader)
Patch 4: Remove old assumptions about vcpu_id<->apic_id relationship in hvmloader
Patch 5: Add logic to derive x2APIC IDs given a CPU policy and vCPU IDs
Patch 6: Includes a simple topology generator for toolstack so new guests
         have topologically consistent information in CPUID

===================================================================
v6:

Alejandro Vallejo (11):
  lib/x86: Relax checks about policy compatibility
  x86/vlapic: Move lapic migration checks to the check hooks
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  xen/x86: Add supporting code for uploading LAPIC contexts during
    domain create
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  tools/libacpi: Use LUT of APIC IDs rather than function pointer
  tools/libguest: Always set vCPU context in vcpu_hvm()
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  tools/libguest: Set distinct x2APIC IDs for each vCPU
  xen/x86: Synthesise domain topologies

 tools/firmware/hvmloader/config.h        |   5 +-
 tools/firmware/hvmloader/hvmloader.c     |   6 +-
 tools/firmware/hvmloader/mp_tables.c     |   4 +-
 tools/firmware/hvmloader/smp.c           |  54 ++++--
 tools/firmware/hvmloader/util.c          |   7 +-
 tools/include/xen-tools/common-macros.h  |   5 +
 tools/include/xenguest.h                 |   8 +
 tools/libacpi/build.c                    |   6 +-
 tools/libacpi/libacpi.h                  |   2 +-
 tools/libs/guest/xg_cpuid_x86.c          |  29 +++-
 tools/libs/guest/xg_dom_x86.c            |  93 ++++++----
 tools/libs/light/libxl_dom.c             |  25 +++
 tools/libs/light/libxl_x86_acpi.c        |   7 +-
 tools/tests/cpu-policy/test-cpu-policy.c | 207 ++++++++++++++++++++++-
 xen/arch/x86/cpu-policy.c                |   9 +-
 xen/arch/x86/cpuid.c                     |  14 +-
 xen/arch/x86/hvm/vlapic.c                | 126 ++++++++++----
 xen/arch/x86/include/asm/hvm/vlapic.h    |   1 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 +++
 xen/lib/x86/policy.c                     | 175 ++++++++++++++++++-
 xen/lib/x86/private.h                    |   4 +
 22 files changed, 704 insertions(+), 112 deletions(-)

-- 
2.46.0


