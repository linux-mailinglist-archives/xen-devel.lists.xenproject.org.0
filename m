Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED194BEAF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774174.1184673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Pw-0004L2-7c; Thu, 08 Aug 2024 13:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774174.1184673; Thu, 08 Aug 2024 13:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Pw-0004Fz-3J; Thu, 08 Aug 2024 13:43:00 +0000
Received: by outflank-mailman (input) for mailman id 774174;
 Thu, 08 Aug 2024 13:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Pv-0003nA-6e
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb51c58-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:42:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so1224365a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:57 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:55 -0700 (PDT)
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
X-Inumbo-ID: 1eb51c58-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124576; x=1723729376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb/fRv85bmmzcw32Yc/Ue08IVIw7Vq5Y7ll2+BR/9Uk=;
        b=e2+q+6yq0I+x/+XbsxmoIY52DJs6is4SitORHITuVIYoSn5OVZcd4pRp7Ai/idunia
         cSCKa1pSpCPgvPMipn0/usfl67B3kx80VhuYL+LRLRZoLgRMhMCog4U2nKxyLAOhHM6u
         20Z7ziTLpYPJjz5erbnozQl6CxnK1HUoFGrLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124576; x=1723729376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fb/fRv85bmmzcw32Yc/Ue08IVIw7Vq5Y7ll2+BR/9Uk=;
        b=P4UNcSR8ynGBc0OnpV+txKb4awDPciyu67EM6ckKJ4QoQQ6nzifd8yAcqGm6toj799
         harmZqK8zpQQK5u5x6SMt2X8UJpl42zk4C/LHQxFpuwjyXaG3/sFbWO9Vb8higYVFDTf
         rVlzgSThylcu15ntumSJKpqEPW9lTVbRncdCxRUSZnz9vrJVQez3p4f/VeVU0epDGMRC
         LzABH8Ay5bL5jFy3YIxpC0LAnGyJdLzGu2Bwj1kHk+NDwmLNReoCxIK5JZutWXgYWokh
         EQSre0yQ+QxgHJYTRyMMoOhZuu9B0Qj9/3NzALohSUW4SNxxBL1WixV42ncj2fHv2G08
         s/bQ==
X-Gm-Message-State: AOJu0Yz0qyZqzWPw4OL6LrNWnCvIXev/lpzkp8kux31/YZuD3PjhhVEr
	llNJv3FwiL2mGE4c8nA5+mlbIoi2xtZXHk2NY9RVnwwc6D782FIeUSLp2Uy7ks4QI5djjdcWBD6
	m
X-Google-Smtp-Source: AGHT+IHLtttzCdCkGNj2BX5U8XHopsFwEsu9dCSpnGXIcoWGN/M3EFkkYC6Wwmt0B7acelDAldbmPQ==
X-Received: by 2002:a17:907:efe8:b0:a7a:a3db:c7b3 with SMTP id a640c23a62f3a-a8090c7ea28mr126181866b.19.1723124576326;
        Thu, 08 Aug 2024 06:42:56 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 00/10] x86: Expose consistent topology to guests
Date: Thu,  8 Aug 2024 14:42:40 +0100
Message-ID: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Alejandro Vallejo (10):
  tools/hvmloader: Fix non-deterministic cpuid()
  x86/vlapic: Move lapic migration checks to the check hooks
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  xen/x86: Add supporting code for uploading LAPIC contexts during
    domain create
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  tools/libguest: Always set vCPU context in vcpu_hvm()
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  tools/libguest: Set distinct x2APIC IDs for each vCPU
  xen/x86: Synthesise domain topologies

 tools/firmware/hvmloader/config.h        |   6 +-
 tools/firmware/hvmloader/hvmloader.c     |   4 +-
 tools/firmware/hvmloader/smp.c           |  54 ++++--
 tools/firmware/hvmloader/util.c          |   9 -
 tools/firmware/hvmloader/util.h          |  27 ++-
 tools/include/xen-tools/common-macros.h  |   5 +
 tools/libs/guest/xg_cpuid_x86.c          |  24 ++-
 tools/libs/guest/xg_dom_x86.c            | 114 ++++++++-----
 tools/tests/cpu-policy/test-cpu-policy.c | 201 +++++++++++++++++++++++
 xen/arch/x86/cpu-policy.c                |   9 +-
 xen/arch/x86/cpuid.c                     |  14 +-
 xen/arch/x86/hvm/vlapic.c                | 123 ++++++++++----
 xen/arch/x86/include/asm/hvm/vlapic.h    |   1 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 +++
 xen/lib/x86/policy.c                     | 164 ++++++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 17 files changed, 683 insertions(+), 105 deletions(-)

-- 
2.45.2


