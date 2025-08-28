Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACBB3A36A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099102.1453016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureAr-000377-4X; Thu, 28 Aug 2025 15:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099102.1453016; Thu, 28 Aug 2025 15:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureAr-00035G-1M; Thu, 28 Aug 2025 15:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1099102;
 Thu, 28 Aug 2025 15:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureAp-00035A-Lo
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:04:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ec08b8-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:04:21 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b7722ea37so3400495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:04:21 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:04:16 -0700 (PDT)
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
X-Inumbo-ID: 46ec08b8-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393460; x=1756998260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXugFQ1kN97ZDaQOJM1fKNzcNCNTk1kE4o03Nu2zqzc=;
        b=gyVlIvn0ZbMY+MNtcD7FmEIUAlVXO0+pyDG8tjoaH0ZSAos+Ek35ETqn9raQXcxlay
         c4CU1i0AUxPmAEfoeXUfilXGYuaNU22nhScE3n0ZHb0PLn4uFaYu8+gLujaPbadSipEt
         CCFD56kUq4RPSo5WwtdjmA+68enuyo3f8U1CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393460; x=1756998260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXugFQ1kN97ZDaQOJM1fKNzcNCNTk1kE4o03Nu2zqzc=;
        b=KBvFX2r8iqZHqByLutUbTYO8Zu/ShLzkXwsIXtn7B6qAgedGK8/Zxnortsz8nfCUWF
         PUwG01NPPkzemS4+f5yjAaRsyYuTzmJIqPX/IvhxGk4nQw1R9vyqzcNVGHUyg8K46m9N
         kBTezOusJL1Ib5E2JAMMo8+iSqY05dk/TVne7WkKDwGPYrUH604NRjJnkKO0/+AlU5p7
         +kByTA5deDAwTveYFlgvwYIrNGvFgvrG7FUPzJs26tsTQh7WzRHPu/2MSOF2USK1dYnK
         4VJLzn6wKFYo+IFrHcG+BCqrlWudVyX5bP/q6rWImb82fCf4uswO9ApiTlNhwgbOeexM
         UgaA==
X-Gm-Message-State: AOJu0YxAIELLfZUCr3KS28fEs9HfL1G7drYIttejov0X15WPycX8Q7V8
	9xTKHb7OKjuPmAvaLiSPxb0QqAvcEXei9D3uBXfbeEL5v7+O/df9uoQ8Yl89+AHfguYyMTM4WoD
	xhU4U
X-Gm-Gg: ASbGnctvAAS0Czvw2ovXwLZeHw1rgPFHb9lssSwSXsWyTTfwieUWfsIWoBCHU1sv8HR
	xhzSYKnXXneOUqEWlQMd4jRBti5Dz2qfZb4dVM+M+8mJJXmI/OSdKqiTanmM+i+RkLMc09neEW8
	C2KOULsE9DOkwGDCXRs4Fipt+BDNAPWTBaTUnVTlx9Pi8qL1Ye0NhlYpdbOsgQ9pAzlDQPFQ5/S
	PxaRpWsNLJswDjLC3RH/S2/IrUQ50XmHneOZ/irnncQ0tVg8z4Za3uFAFY85mK8CZORA8f1dShn
	uFlWYGvNW1DNjJkD+Ve0Sb7mZknyNCftSFPMb/WAU3vAp1F+ab9z0J7ttGDJpwaP3RapJ35SkVy
	xX58E6oqITmK0o74Qsrt8uhknXYFOpA3GQVSWWRV48x3IikZhJZ1Cn9ngpw0583ggwxFincBkBW
	64ceNaxxybDtTgQeYCuw4Fcw==
X-Google-Smtp-Source: AGHT+IGsdXrb+peDgu2F84j2mNK+m626Mp3bowMqBIz3fylH0WxOThKixTC1tLEmUUzT9WmOt42mGQ==
X-Received: by 2002:a05:600c:a593:b0:45b:7580:6f34 with SMTP id 5b1f17b1804b1-45b75807d02mr26847625e9.12.1756393460388;
        Thu, 28 Aug 2025 08:04:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/23] x86: FRED support
Date: Thu, 28 Aug 2025 16:03:46 +0100
Message-Id: <20250828150409.901315-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is now everything to get to tech preview, except for the caveat that it's
still not been tried on real hardware yet, so is staying experimental for now.

The first few patches have been seen before but the latter half of the series
is new, adding support for running PV guests when Xen is using FRED.  Some
work here has influenced earlier patches.

See patches for details.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2009286102

This series is still based on the MSR cleaup series posted previously.

Andrew Cooper (23):
  x86: FRED enumerations
  x86/traps: Extend struct cpu_user_regs/cpu_info with FRED fields
  x86/traps: Introduce opt_fred
  x86/boot: Adjust CR4 handling around percpu_early_traps_init()
  x86/S3: Switch to using RSTORSSP to recover SSP on resume
  x86/traps: Set MSR_PL0_SSP in load_system_tables()
  x86/boot: Use RSTORSSP to establish SSP
  x86/traps: Alter switch_stack_and_jump() for FRED mode
  x86/traps: Skip Supervisor Shadow Stack tokens in FRED mode
  x86/traps: Make an IDT-specific #DB helper
  x86/traps: Make an IDT-specific #PF helper
  x86/fsgsbase: Make gskern accesses safe under FRED
  x86/traps: Introduce FRED entrypoints
  x86/traps: Enable FRED when requested
  x86/pv: Deduplicate is_canonical_address() in do_set_segment_base()
  x86/entry: Alter how IRET faults are recognised
  x86/entry: Drop the pre exception table infrastructure
  x86/entry: Rework the comment about SYSCALL and DF
  x86/pv: Adjust GS handling for FRED mode
  x86/pv: Exception handling in FRED mode
  x86/pv: ERETU error handling
  x86/pv: System call handling in FRED mode
  x86/pv: Adjust eflags handling for FRED mode

 docs/misc/xen-command-line.pandoc           |  10 +
 xen/arch/x86/acpi/wakeup_prot.S             |  52 +-
 xen/arch/x86/boot/x86_64.S                  |  48 +-
 xen/arch/x86/domain.c                       |  26 +-
 xen/arch/x86/extable.c                      |  14 -
 xen/arch/x86/hvm/domain.c                   |   4 +-
 xen/arch/x86/include/asm/asm-defns.h        |   8 +
 xen/arch/x86/include/asm/asm_defns.h        |  76 ++-
 xen/arch/x86/include/asm/cpu-user-regs.h    |  71 ++-
 xen/arch/x86/include/asm/cpufeature.h       |   3 +
 xen/arch/x86/include/asm/cpufeatures.h      |   2 +-
 xen/arch/x86/include/asm/current.h          |   9 +-
 xen/arch/x86/include/asm/domain.h           |   5 +
 xen/arch/x86/include/asm/fsgsbase.h         |   8 +-
 xen/arch/x86/include/asm/hypercall.h        |   5 +
 xen/arch/x86/include/asm/msr-index.h        |  11 +
 xen/arch/x86/include/asm/traps.h            |   6 +
 xen/arch/x86/include/asm/uaccess.h          |   2 -
 xen/arch/x86/include/asm/x86-defns.h        |   8 +
 xen/arch/x86/mm.c                           |  12 +-
 xen/arch/x86/pv/dom0_build.c                |   2 +-
 xen/arch/x86/pv/domain.c                    |  22 +-
 xen/arch/x86/pv/iret.c                      |   8 +-
 xen/arch/x86/pv/misc-hypercalls.c           |  42 +-
 xen/arch/x86/pv/traps.c                     |  33 ++
 xen/arch/x86/setup.c                        |  35 +-
 xen/arch/x86/traps-setup.c                  | 127 ++++-
 xen/arch/x86/traps.c                        | 511 ++++++++++++++++++--
 xen/arch/x86/x86_64/Makefile                |   1 +
 xen/arch/x86/x86_64/compat/entry.S          |   3 +-
 xen/arch/x86/x86_64/entry-fred.S            |  57 +++
 xen/arch/x86/x86_64/entry.S                 |  46 +-
 xen/arch/x86/xen.lds.S                      |   5 -
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 34 files changed, 1106 insertions(+), 169 deletions(-)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

-- 
2.39.5


