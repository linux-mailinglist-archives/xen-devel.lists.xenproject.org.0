Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719FB8BFD52
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718775.1121264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ga9-0002e6-Fy; Wed, 08 May 2024 12:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718775.1121264; Wed, 08 May 2024 12:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ga9-0002bf-CD; Wed, 08 May 2024 12:39:37 +0000
Received: by outflank-mailman (input) for mailman id 718775;
 Wed, 08 May 2024 12:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4ga7-0002b0-VI
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0627193c-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:34 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59b097b202so851510766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:34 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:30 -0700 (PDT)
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
X-Inumbo-ID: 0627193c-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171974; x=1715776774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4Y4JBEHdpXX8zg2matRsfDF2skYhfYeN6rMH7JX82k=;
        b=HOFpu4lL7HXEZ5VfTG1TqhuWGlqhdBfaZLuzFWNW0hhUkxDJsQ+QjdqZuEKqiy649V
         6JaB0vhAK7GmSxAuqxo8KHfcIFeOU93AwdeudSB3kgUbxlEjy3yzhYmvdBgKWgbm8b2d
         Bj7Z/N2zHm1WgjPM5yUhPLrMhazAHdczpOxDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171974; x=1715776774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4Y4JBEHdpXX8zg2matRsfDF2skYhfYeN6rMH7JX82k=;
        b=sDOBvp9KZZWtRw3ACSRby5puOjok6fRERHV39e3a2oGcyxno5MEJ3Rlng2AH7j77MP
         MfF7uuLRAzvDo+Hf5lcCyZObjB5UhLgGxfNr32C+bapzUr5XRIBFmMy6ATIZtQ4EgO0e
         mPkvkCRuTXqHjm8F9aP2AmGmAiv6yqPnRi1Uj7K4Tfj9u8t+H+w+0IQLeJI9tn9ve86U
         C30xkKpA6+Hj2UXBQZOEdHAvegpbFWECJgyjj8n0p+Akxvwaj8d1Wqo6ITWryGz3mYec
         qY58PjhxRKVQ2awq88Bqbzxu7MKzAtQRX3JwN56clM2JyISKwJ+RkWK0bFH/TDftHXOC
         0nGQ==
X-Gm-Message-State: AOJu0YwYfc5lsv4VS0yB9xuf2N78bkGYllnG/f0CQQrp3RuEfVpiCFWg
	bk3AeQhKIm3D25drf+gSgslfY767lfVKVyH3+reXi+4rkIWxfG+a1Fy5FXr6kIcbUwCEeCWv4yt
	2
X-Google-Smtp-Source: AGHT+IFMTaH+tzF18MqnLL27Qd4OMZTc17yFE7oZP7EcHVUHMtbeJ5YuFFtK2PJD1WxS08Vm5LJymQ==
X-Received: by 2002:a17:906:f818:b0:a59:be8a:bd71 with SMTP id a640c23a62f3a-a59fb920ea5mr151770266b.16.1715171971178;
        Wed, 08 May 2024 05:39:31 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/8] x86: Expose consistent topology to guests
Date: Wed,  8 May 2024 13:39:19 +0100
Message-Id: <cover.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Alejandro Vallejo (8):
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  xen/x86: Simplify header dependencies in x86/hvm
  x86/vlapic: Move lapic_load_hidden migration checks to the check hook
  tools/hvmloader: Wake APs with hypercalls and not with INIT+SIPI+SIPI
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  xen/x86: Synthesise domain topologies

 tools/firmware/hvmloader/config.h        |   6 +-
 tools/firmware/hvmloader/hvmloader.c     |   4 +-
 tools/firmware/hvmloader/smp.c           | 151 +++++++++---------
 tools/firmware/hvmloader/util.h          |   5 +
 tools/libs/guest/xg_cpuid_x86.c          |  62 ++------
 tools/tests/cpu-policy/test-cpu-policy.c | 191 +++++++++++++++++++++++
 xen/arch/x86/cpu-policy.c                |   9 +-
 xen/arch/x86/cpuid.c                     |  15 +-
 xen/arch/x86/hvm/irq.c                   |   6 +-
 xen/arch/x86/hvm/vlapic.c                |  75 +++++++--
 xen/arch/x86/include/asm/hvm/hvm.h       |   8 +
 xen/arch/x86/include/asm/hvm/vlapic.h    |   8 +-
 xen/arch/x86/include/asm/hvm/vpt.h       |   1 -
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 ++++
 xen/lib/x86/policy.c                     | 160 +++++++++++++++++++
 16 files changed, 562 insertions(+), 168 deletions(-)

-- 
2.34.1


