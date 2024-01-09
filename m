Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACFE828923
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664701.1034816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBh-0000Dt-MF; Tue, 09 Jan 2024 15:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664701.1034816; Tue, 09 Jan 2024 15:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBh-00006a-HY; Tue, 09 Jan 2024 15:38:45 +0000
Received: by outflank-mailman (input) for mailman id 664701;
 Tue, 09 Jan 2024 15:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBg-00081N-EV
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:44 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2925d36a-af05-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 16:38:39 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso34966265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:39 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:38 -0800 (PST)
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
X-Inumbo-ID: 2925d36a-af05-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814719; x=1705419519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vekzOGyuCFWtV816mclTU6Ph4tvS+J39NwObNUzzNQ=;
        b=Vznmdc/f+8FzGv9bS+czQpR739zUFc6cY2xc9JE2Qlwd8J5vzzC2n5K/9x6auCVKSU
         b+cp2ZOysuU7SpCDhLj7g9MPZ72V6W3LYv2YM/egR3FXZcdqb3c1CbXQLCcsK8BoxTsE
         iSWxSPCMjYhGjj5aKzZsaVuJfb0InA3DLcsQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814719; x=1705419519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vekzOGyuCFWtV816mclTU6Ph4tvS+J39NwObNUzzNQ=;
        b=avMShVhNGq0elVtLCo7GM8FrAe4lpY3eruqygJrTcZCMAI1rUSWuqx10xwX9rnaPGc
         hsrGX02kttmzRKrnEJOKPIsfx34Jbh/zjFcjSOuxG4xNmmPncj7iyNVTlZQ6CLaSq4dC
         79d97+eh8+cLyQx6eVNAZ8e/BHAvyIuqYQARNuH55eH1ljGSRfA8omp3CD5VBMF7/csp
         mVS4URrrV1nXEAKS2Fr2Djsw9SlcrhX7Jbnee8RZZihC5iUv2KtUxtsRN6URW/9xm8Hg
         dUwL8dEKwns7MUoWe71izzlbuydVsTdRLNx5KVLYvlZtuDsXPGHTPiCVTvOHMEgqmy8u
         rsoQ==
X-Gm-Message-State: AOJu0YyDYvtcD+wjW4zrMMXQ/J8In5ZrJ6EsN+Blsoag+Vn9Va1IbAGL
	6QgLxYqKTuK/6cQG13VZT+byYQILhTpuGbtVEVIBCgDBt1E=
X-Google-Smtp-Source: AGHT+IEh7rzbL9Lly24TxSX61UeTCnlZUVbb1o74vb7WqVjOil6yYqRFNSWFAneD0U3IVjVK4jfZXQ==
X-Received: by 2002:a05:600c:4f10:b0:40e:39dd:b319 with SMTP id l16-20020a05600c4f1000b0040e39ddb319mr2857663wmq.123.1704814718883;
        Tue, 09 Jan 2024 07:38:38 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/6] x86: Expose consistent topology to guests
Date: Tue,  9 Jan 2024 15:38:28 +0000
Message-Id: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
  xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
  tools/xc: Add xc_cpu_policy to the public xenctrl.h header
  xen/x86: Refactor xen/lib/x86 so it can be linked in hvmloader
  tools/hvmloader: Use cpu_policy to determine APIC IDs
  xen/x86: Derive topologically correct x2APIC IDs from the policy
  xen/x86: Add topology generator

 tools/firmware/hvmloader/Makefile        |   7 ++
 tools/firmware/hvmloader/config.h        |   5 +-
 tools/firmware/hvmloader/hvmloader.c     |   6 +
 tools/firmware/hvmloader/util.c          |   3 +-
 tools/include/xenguest.h                 |  23 +++-
 tools/libacpi/build.c                    |  27 ++++-
 tools/libacpi/libacpi.h                  |   5 +-
 tools/libs/guest/xg_cpuid_x86.c          | 144 ++++++++++++++---------
 tools/libs/guest/xg_private.h            |  10 --
 tools/libs/light/libxl_x86_acpi.c        |  21 +++-
 tools/tests/cpu-policy/test-cpu-policy.c | 128 ++++++++++++++++++++
 xen/arch/x86/cpu-policy.c                |   6 +-
 xen/arch/x86/cpuid.c                     |  20 +---
 xen/arch/x86/domain.c                    |   3 +
 xen/arch/x86/hvm/vlapic.c                |  27 ++++-
 xen/arch/x86/include/asm/hvm/vlapic.h    |   2 +
 xen/include/public/arch-x86/hvm/save.h   |   2 +
 xen/include/xen/lib/x86/cpu-policy.h     |  16 +++
 xen/lib/x86/cpuid.c                      |  12 +-
 xen/lib/x86/policy.c                     |  74 ++++++++++++
 xen/lib/x86/private.h                    |   8 +-
 21 files changed, 442 insertions(+), 107 deletions(-)

-- 
2.34.1


