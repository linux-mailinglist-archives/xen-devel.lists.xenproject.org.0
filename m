Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D548D394C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732082.1137907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKM9-0000Hs-6J; Wed, 29 May 2024 14:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732082.1137907; Wed, 29 May 2024 14:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKM9-0000F5-3c; Wed, 29 May 2024 14:32:45 +0000
Received: by outflank-mailman (input) for mailman id 732082;
 Wed, 29 May 2024 14:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKM7-0000Ev-6T
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eaa57e2-1dc8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:32:42 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a034697fbso1230661a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:41 -0700 (PDT)
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
X-Inumbo-ID: 4eaa57e2-1dc8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993161; x=1717597961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9C8upn0+uPtzReijnF8q6aOxyYqZqHWB7OMGoHj4hy0=;
        b=LW4EvxFXPMO3E/5VReeEOIAXi5C5d+gXzoh7G9oKYM3pRDTOG7tKTIB5NCeBHaQWxH
         oPelFBuqApzHI/m/SA/sbNZVoZA/wSzC0gr3ticgaST8u9AjlVX0291c9vhS00lyTaPv
         HK8s9A+B8m+pWl7xX5xMjFpYBdUJ4uwrp3+a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993161; x=1717597961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9C8upn0+uPtzReijnF8q6aOxyYqZqHWB7OMGoHj4hy0=;
        b=m/TlDy4BrQYyl9ZAD5LsGUjD4K4NIuoH533oRwvlvT0OAYqojN5RMrDNUvZ1zXCDit
         yawvSBflFH3EPcKKF9bhCgxrh+NH60l2ij0fZy+6rThy+sZ4Fkw+7BgGknblVQOR74fJ
         8CpSPb2HeghVAPqx7mDczOwU7IHiDnYsBKvJQzbCCJvR5s/w7sdqmClkObWGgSgIAWi9
         r7sVHJKiZsWZY0rEWFc4laPptfl98Vbq1S+gKppy6WqP+okqYF0Z2WY22Bme2ZDGr/h3
         PxsuiyePj7NfHK16upOp03c65YcL4oWOEDL1kPr0HybY35sf8gEfSN385rJ1yLEw13vt
         v/SQ==
X-Gm-Message-State: AOJu0YxaT9O2z2eWV7MW4L9qw+9oqz5XHbwgIDC1s3VNJScdh3OjC3RA
	pemm3UGoqeqdZV0iyoQ1Rjo4eYpPgD5u6cgrEHgCiF1REXAtO6IlG+BSn0eY2deGdsfphOJCX0t
	6
X-Google-Smtp-Source: AGHT+IEuF2nSH4c+npKYbSL026MzljXIKW9ismFoMwursBiPX1MK1SBRR3VOxnvzSvaSBhHniKsB/g==
X-Received: by 2002:a17:906:3614:b0:a62:8116:cb59 with SMTP id a640c23a62f3a-a628116cbf3mr894840166b.30.1716993161417;
        Wed, 29 May 2024 07:32:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/6] x86: Expose consistent topology to guests
Date: Wed, 29 May 2024 15:32:29 +0100
Message-Id: <cover.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


Alejandro Vallejo (6):
  x86/vlapic: Move lapic migration checks to the check hooks
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  xen/x86: Synthesise domain topologies

 tools/firmware/hvmloader/config.h        |   6 +-
 tools/firmware/hvmloader/hvmloader.c     |   4 +-
 tools/firmware/hvmloader/smp.c           |  54 ++++--
 tools/include/xen-tools/common-macros.h  |   5 +
 tools/libs/guest/xg_cpuid_x86.c          |  24 ++-
 tools/tests/cpu-policy/test-cpu-policy.c | 201 +++++++++++++++++++++++
 xen/arch/x86/cpu-policy.c                |   9 +-
 xen/arch/x86/cpuid.c                     |  14 +-
 xen/arch/x86/hvm/vlapic.c                | 122 ++++++++++----
 xen/arch/x86/include/asm/hvm/hvm.h       |   2 +
 xen/arch/x86/include/asm/hvm/vlapic.h    |   2 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 +++
 xen/lib/x86/policy.c                     | 167 +++++++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 15 files changed, 587 insertions(+), 56 deletions(-)

-- 
2.34.1


