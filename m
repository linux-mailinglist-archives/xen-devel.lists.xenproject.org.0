Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17BB1EF70
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075021.1437486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcd-0006Zy-96; Fri, 08 Aug 2025 20:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075021.1437486; Fri, 08 Aug 2025 20:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcd-0006W1-3P; Fri, 08 Aug 2025 20:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1075021;
 Fri, 08 Aug 2025 20:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcb-0005tJ-TT
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:25 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 865873cd-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:20 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso16335155e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:20 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:18 -0700 (PDT)
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
X-Inumbo-ID: 865873cd-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684599; x=1755289399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXB3evWZT2QzGQ/J5BzSyaQ1jIiR7GXFqd50zzqLOmQ=;
        b=bMrI3an2I3UqEGkn2ZNgxp+lFXuwJyYHez+8hjPuUSuROd/VkSmWiyyHFwuGDWMbGo
         gS3kcQxx5jt3Fe5XqAIoITakSQClYDVZDpaPl8albzmrzsOj3mt2MNEw4jEtZh+7fG2G
         Laf1u0Y31p6S2ce8BM1ij0WYYJuUEqR6icss8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684599; x=1755289399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXB3evWZT2QzGQ/J5BzSyaQ1jIiR7GXFqd50zzqLOmQ=;
        b=JIn1qpDs7In/CVvd45n8H0yxm9LDGazbFq3nIhbWyKg1ApOgxFTizk1s4yRotMDoI9
         v3ZMxytsRnOs6LTFu6KVK6fiobRNDHjE+/yVJFzTFoMu8XVULUwUC3pB49YKkiAwizjq
         plAnB5TQ1aPe4P3VqAxksiLnqO0FJXUvO6TuPDc7ecrx1sEay03wIc1rbXkc19Bp6zM6
         Sn/SxdC6UYXW4kP0gHyqbajz1oexybRqRHveD5uTSe3pH5TLxkepmtqbC/rKqYHldU+e
         S3BFXjsyxF1mIko/aMNmXoRJB3S3Taaw1EUcxqhErgmpfv/OHtUeoliInaOKVh2Lff7o
         +X2w==
X-Gm-Message-State: AOJu0YwjFMrS9Jz2FA+XsTtxnTWOJxhpLE5bV9jGyU+m+bNoqYAZQcJa
	Ku0LNs87dcPxzKZRVffw8ENjCbGmR2J1iymibGjTuuVIbWe5yyM+M3EHpaq7mJnVVxF4TQWM3UD
	Lwaf6JRxinQ==
X-Gm-Gg: ASbGnct0WKbTWrylgMeDR67QJzAvrO67uJ9eo5CcAWQY8LnZWuNtQTbNam+YT3UvpLf
	wDQnihqtYUkwN8PYydKflCePuG6aQjcsQyx/gdL/JCQRBTMuDbWvpFZtJIRU6OPQ1L/BWo2GO7w
	qWvUiFSXQVpdMRSz8fv2+Zi7vbavs4/goJcIk0KrFNvdj1koD7mEEidjo3xjZzwckdrE6YXlnfb
	Vryth91t9g6QvmH7goDmDE8CqlZkq7vpKKszAt8GSUAvcdnI1fE20z538gzRSm23vzrHgcFERNl
	CHgms1PkHmURci3Wn16Dg8LsxaTchSCFmuPRJoxOPXan7Xubh1/pR+kkLxPEn0nBvqddChsSBTp
	KemAE74oXLHn4zSPohaU+bdjy70nCiSDfwEz5bipHMkX0XlQbu621JA+U2/vZPnfj4XHymGoIVQ
	Oi
X-Google-Smtp-Source: AGHT+IEWfXGmnWSAfrcKcA8kPPSp8RIjb9u20ShqxnvVUVZlpICEvaGami8eRfr1Y30jsJWCYUzvIg==
X-Received: by 2002:a05:600c:46c7:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-459f4f048d7mr37200675e9.22.1754684599342;
        Fri, 08 Aug 2025 13:23:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 00/22] x86: FRED support, part 1 (stacks and exceptions)
Date: Fri,  8 Aug 2025 21:22:52 +0100
Message-Id: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches 1-12 are cleanup and rearrangement in order to fit FRED in more
nicely.

Patches 13-22 are the start of FRED support, setting up the stacks and
exception handling.

By the end of this series, Xen can run a PVH dom0 (if NMIs aren't in use -
VT-x has a really nasty corner case here), or can get to the point of
launching a PV dom0.  Running a PV dom0 is going to take a similar quantity of
work.

All deveopment work has been done with Intel SIMICS.  I don't yet have real
hardware to test on.

The Gitlab CI AlderLake box, sporting both Shadow Stacks and S3 has been
working overtime checking that S3 works on every relevant patch boundary.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1974989391


Andrew Cooper (22):
  x86/msr: Rename MSR_INTERRUPT_SSP_TABLE to MSR_ISST
  x86/msr: Rename wrmsr_ns() to wrmsrns(), and take 64bit value
  x86/traps: Drop incorrect BUILD_BUG_ON() and comment in load_system_tables()
  x86/idt: Minor improvements to _update_gate_addr_lower()
  x86/traps: Rename early_traps_init() to bsp_early_traps_init()
  x86/traps: Introduce bsp_traps_reinit()
  x86/spec-ctrl: Rework init_shadow_spec_ctrl_state() to take an info pointer
  x86/traps: Introduce ap_early_traps_init() and set up exception handling earlier
  x86/traps: Move load_system_tables() into traps-setup.c
  x86/traps: Move subarch_percpu_traps_init() into traps-setup.c
  x86/traps: Fold x86_64/traps.c into traps.c
  x86/traps: Unexport show_code() and show_stack_overflow()
  x86: FRED enumerations
  x86/traps: Extend struct cpu_user_regs/cpu_info with FRED fields
  x86/traps: Introduce opt_fred
  x86/boot: Adjust CR4 handling around ap_early_traps_init()
  x86/S3: Switch to using RSTORSSP to recover SSP on resume
  x86/traps: Set MSR_PL0_SSP in load_system_tables()
  x86/boot: Use RSTORSSP to establish SSP
  x86/traps: Alter switch_stack_and_jump() for FRED mode
  x86/traps: Introduce FRED entrypoints
  x86/traps: Enable FRED when requested

 docs/misc/xen-command-line.pandoc           |  10 +
 xen/arch/x86/Kconfig                        |   4 +
 xen/arch/x86/acpi/wakeup_prot.S             |  57 +--
 xen/arch/x86/boot/x86_64.S                  |  53 ++-
 xen/arch/x86/cpu/common.c                   | 120 ------
 xen/arch/x86/include/asm/asm-defns.h        |   9 +
 xen/arch/x86/include/asm/asm_defns.h        |  65 +++
 xen/arch/x86/include/asm/cpu-user-regs.h    |  71 +++-
 xen/arch/x86/include/asm/cpufeature.h       |   3 +
 xen/arch/x86/include/asm/current.h          |  14 +-
 xen/arch/x86/include/asm/idt.h              |  13 +-
 xen/arch/x86/include/asm/msr-index.h        |  13 +-
 xen/arch/x86/include/asm/msr.h              |  12 +-
 xen/arch/x86/include/asm/processor.h        |   2 -
 xen/arch/x86/include/asm/prot-key.h         |   4 +-
 xen/arch/x86/include/asm/spec_ctrl.h        |   4 +-
 xen/arch/x86/include/asm/system.h           |   3 -
 xen/arch/x86/include/asm/traps.h            |   7 +-
 xen/arch/x86/include/asm/x86-defns.h        |   1 +
 xen/arch/x86/msr.c                          |   4 +-
 xen/arch/x86/setup.c                        |  37 +-
 xen/arch/x86/smpboot.c                      |  17 +-
 xen/arch/x86/spec_ctrl.c                    |   2 +-
 xen/arch/x86/traps-setup.c                  | 358 +++++++++++++++-
 xen/arch/x86/traps.c                        | 448 +++++++++++++++++++-
 xen/arch/x86/x86_64/Makefile                |   2 +-
 xen/arch/x86/x86_64/entry-fred.S            |  35 ++
 xen/arch/x86/x86_64/traps.c                 | 414 ------------------
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 xen/include/xen/macros.h                    |   2 +
 30 files changed, 1142 insertions(+), 645 deletions(-)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S
 delete mode 100644 xen/arch/x86/x86_64/traps.c

-- 
2.39.5


