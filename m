Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705B9A6E90
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823733.1237788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc0-0007HC-VB; Mon, 21 Oct 2024 15:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823733.1237788; Mon, 21 Oct 2024 15:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc0-0007BL-O7; Mon, 21 Oct 2024 15:46:28 +0000
Received: by outflank-mailman (input) for mailman id 823733;
 Mon, 21 Oct 2024 15:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2ubz-0006wR-0e
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0e3e2e9-8fc3-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:46:25 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso679844466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:25 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:24 -0700 (PDT)
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
X-Inumbo-ID: a0e3e2e9-8fc3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525584; x=1730130384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5B5PBoQqeHRKR1XhKv6Vo5Hv+PtFd3V27vrqsynASyo=;
        b=YUp2sDK27kKw7NCaFRU3BK3sI5kSuLxBFA9mGBebdbHnowNEO54uZjE2bL9MjwaUUI
         s9o/oh/mbxf415h+tyN9HLIr8HJ/zBMvd5t5QljESiyPPhoi24HCjfzfkKRZATPjSYyq
         ArBSEOQp6CyBcdCK5tmjMERgOvCBmODJgxcpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525584; x=1730130384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B5PBoQqeHRKR1XhKv6Vo5Hv+PtFd3V27vrqsynASyo=;
        b=WKPhTW69LjMwZvTB4qV4k1Iu8kYgB4FejIARDILIophFqoVD/SPQ5k4HAi0WDjexha
         JEyLjy+3ZFwD+giWnssIv+F4WA7R7+Rz1iAK2ALj70QuCrXjbEADDUrRQyQRT2OlMuqe
         Nml7o69wKR27SEp3Frp5PyNxtjGswOheoj8ZYIuUtXOu4Iblf/rv0+MMRKUwwWDOs88n
         QUOb5K3GWJpfJb7jkQE9j9bkIJ4S5VZJQ36N3MbUM1IlXci4sC76F64uewX640ufFQp0
         gml71uUlpGLIfvS3N5onywXk2PaOB5BAaGP2YLXxECEEkcFpvG/321tEbtOIeUrUL5XZ
         4hpQ==
X-Gm-Message-State: AOJu0YzcTsmqJV0ioqjWh7NLpC/Bd+FAOV+Z8p5KaxhvsM8DgN9lPzv8
	K28o5o4hO6ScU8/mkGQkTsh3ofZPfq5XuyouXrtu9i0qFMtQs+ST6b5craCNs8zjaEU6AAntsbn
	Y
X-Google-Smtp-Source: AGHT+IF+JCOiVC4fd7XiDGOfaV8WDxj+tAE7Om1/oNXTfBv0GO/pofYATwd7v/kPNGfmsNDvABFGZA==
X-Received: by 2002:a17:907:7ea8:b0:a9a:423:3278 with SMTP id a640c23a62f3a-a9a69c9883emr1068329066b.49.1729525584344;
        Mon, 21 Oct 2024 08:46:24 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 00/10] x86: Expose consistent topology to guests
Date: Mon, 21 Oct 2024 16:45:50 +0100
Message-ID: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current topology handling is close to non-existent. As things stand, APIC IDs
are allocated through the apic_id=vcpu_id*2 relation without giving any hints
to the OS on how to parse the x2APIC ID of a given CPU and assuming the guest
will assume 2 threads per core.

This series involves bringing x2APIC IDs into the migration stream, so older
guests keep operating as they used to and enhancing Xen+toolstack so new guests
get topology information consistent with their x2APIC IDs. As a side effect of
this, x2APIC IDs are now packed and don't have (unless under a pathological
case) gaps.

Further work ought to allow combining this topology configurations with
gang-scheduling of guest hyperthreads into affine physical hyperthreads. For
the time being it purposefully keeps the configuration of "1 socket" + "1
thread per core" + "1 core per vCPU".

===

Other minor changes highlighted in each individual patch.

Hypervisor prerequisites:

  patch  1: lib/x86: Bump max basic leaf in {pv,hvm}_max_policy
    * Conceptually similar to v6/patch1 ("Relax checks about policy
      compatibility"), but operates on the max policies instead.
  patch  2: xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  patch  3: xen/x86: Add supporting code for uploading LAPIC contexts during
           domain create

hvmloader prerequisites

  patch  4: tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves

Toolstack prerequisites:

  patch  5: tools/libacpi: Use LUT of APIC IDs rather than function pointer
  patch  6: tools/libguest: Always set vCPU context in vcpu_hvm()

No functional changes:

  patch  7: xen/lib: Add topology generator for x86
    * Tweaked the behaviour of the cache leaves on overflow and added stronger
      checks.
  patch  8: xen/x86: Derive topologically correct x2APIC IDs from the policy

Final toolstack/xen stitching:

  patch  9: tools/libguest: Set distinct x2APIC IDs for each vCPU
  patch 10: xen/x86: Synthesise domain topologies

v6: https://lore.kernel.org/xen-devel/20241001123807.605-1-alejandro.vallejo@cloud.com
v5: https://lore.kernel.org/xen-devel/20240808134251.29995-1-alejandro.vallejo@cloud.com/
v4: https://lore.kernel.org/xen-devel/cover.1719416329.git.alejandro.vallejo@cloud.com/
v3: https://lore.kernel.org/xen-devel/cover.1716976271.git.alejandro.vallejo@cloud.com/
v2: https://lore.kernel.org/xen-devel/cover.1715102098.git.alejandro.vallejo@cloud.com/
v1: https://lore.kernel.org/xen-devel/20240109153834.4192-1-alejandro.vallejo@cloud.com/


Alejandro Vallejo (10):
  lib/x86: Bump max basic leaf in {pv,hvm}_max_policy
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  xen/x86: Add supporting code for uploading LAPIC contexts during
    domain create
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  tools/libacpi: Use LUT of APIC IDs rather than function pointer
  tools/libguest: Always set vCPU context in vcpu_hvm()
  xen/lib: Add topology generator for x86
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  tools/libguest: Set distinct x2APIC IDs for each vCPU
  tools/x86: Synthesise domain topologies

 tools/firmware/hvmloader/config.h        |   5 +-
 tools/firmware/hvmloader/hvmloader.c     |   6 +-
 tools/firmware/hvmloader/mp_tables.c     |   4 +-
 tools/firmware/hvmloader/smp.c           |  57 +++++--
 tools/firmware/hvmloader/util.c          |   7 +-
 tools/include/xen-tools/common-macros.h  |   5 +
 tools/include/xenguest.h                 |   8 +
 tools/libacpi/build.c                    |   6 +-
 tools/libacpi/libacpi.h                  |   2 +-
 tools/libs/guest/xg_cpuid_x86.c          |  29 +++-
 tools/libs/guest/xg_dom_x86.c            |  93 +++++++----
 tools/libs/light/libxl_dom.c             |  25 +++
 tools/libs/light/libxl_x86_acpi.c        |   7 +-
 tools/tests/cpu-policy/test-cpu-policy.c | 201 +++++++++++++++++++++++
 xen/arch/x86/cpu-policy.c                |  15 +-
 xen/arch/x86/cpuid.c                     |  18 +-
 xen/arch/x86/hvm/vlapic.c                |  42 ++++-
 xen/arch/x86/include/asm/hvm/vlapic.h    |   1 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  27 +++
 xen/lib/x86/policy.c                     | 169 +++++++++++++++++++
 xen/lib/x86/private.h                    |   4 +
 22 files changed, 649 insertions(+), 84 deletions(-)


base-commit: 081683ea578da56dd20b9dc22a64d03c893b47ba
-- 
2.47.0


