Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D39918756
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749268.1157299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVk-0005u1-LT; Wed, 26 Jun 2024 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749268.1157299; Wed, 26 Jun 2024 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVk-0005pa-Id; Wed, 26 Jun 2024 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 749268;
 Wed, 26 Jun 2024 16:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVi-0005pK-Am
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254ab659-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso678546a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:40 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:38 -0700 (PDT)
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
X-Inumbo-ID: 254ab659-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419319; x=1720024119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sPDoIaCTvRdlQs7YmztUDubOqOgrOE/wxzEsjyDTHY=;
        b=O13EYOjas9DsUkn7LnCD1plMulHOP1Y6UceohJzPBJXTvAM1DCBppCNfFogJw5vGWy
         WzGb9PgVl6KYGmvMSfrVZ0yw9a/nxDUlG9wxFczTrb9U9lpHQgC/GrmHXa+lqAFrDZhJ
         ppRPoWOrQ37SLnbgQ4dIi4Ugm5SftgrRTKhNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419319; x=1720024119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sPDoIaCTvRdlQs7YmztUDubOqOgrOE/wxzEsjyDTHY=;
        b=GkIK/trulqTudyyQA8LgkwMicX6psdr23MNDMmJmRp99miRiqG+mYZZzLPKdigG2Ui
         NSztQP9NHb+WB8Zdi1LPk77bzjdeH+p5aG0wqsl6XjrFg7z5m2ELKr7sKwi1mQZQvGjP
         RCR/IjOLMr9wB9qwP3S1g6TbfzKkz8KsxqJXfnITC0WI9UwTtvRi4i/23pP+keMMO6sT
         s5IUrWJOFPwDPUxGA3biIZ660ehiCyQ+AV1Ci85Fx91NDfmLTLOR5stwDYXKh/0FOOU+
         lt3uDTp5segLTHNRnEeXJ8hfpe9mCev6Q1DivR/f/sYpR439Mut9ZUxNdtmMncE4gxIn
         wMTA==
X-Gm-Message-State: AOJu0YxVuOJIpSDwuXl2cJHIBlHTu95d5gM6oyo63tDhmUSFLlkrLx77
	/3FXi2oeImiESZtZXKFY7puKZiy7y3C5MIgtEd/PhcO+hsUesqyTvEsJcHyCkkn2Xu/++HOzkrL
	SZeY=
X-Google-Smtp-Source: AGHT+IHyMx+5M3z3yyidBqq2z9sbM/AGyV/FJNl6iaXybtknLljbmVIQMgyT9fInQnv+i54o6/MXuA==
X-Received: by 2002:a17:906:bc89:b0:a6f:38:6968 with SMTP id a640c23a62f3a-a7245b64da3mr771698366b.32.1719419319121;
        Wed, 26 Jun 2024 09:28:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v4 00/10] x86: Expose consistent topology to guests
Date: Wed, 26 Jun 2024 17:28:27 +0100
Message-Id: <cover.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've added the patches most critical to get into 4.19 at the head. They are
pretty well reviewed already and shouldn't be very contentious anymore.

v3 -> v4:
  * Fixed cpuid() bug in hvmloader, causing UB in v3
  * Fixed a bogus assert in hvmloader, also causing a crash in v3
  * Used HVM contexts rather than sync'd algos between Xen and toolstack in
    order to initialise the per-vCPU LAPIC state.
  * Formatting asjustments.

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



*** BLURB HERE ***

Alejandro Vallejo (10):
  tools/hvmloader: Fix non-deterministic cpuid()
  x86/vlapic: Move lapic migration checks to the check hooks
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  xen/x86: Add supporting code for uploading LAPIC contexts during
    domain create
  tools/libguest: Make setting MTRR registers unconditional
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  xen/x86: Synthesise domain topologies
  tools/libguest: Set topologically correct x2APIC IDs for each vCPU

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
 xen/arch/x86/hvm/vlapic.c                | 127 ++++++++++----
 xen/arch/x86/include/asm/hvm/vlapic.h    |   1 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 +++
 xen/lib/x86/policy.c                     | 164 ++++++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 17 files changed, 687 insertions(+), 105 deletions(-)

-- 
2.34.1


