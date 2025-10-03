Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC27BB85A0
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136889.1473320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oep-00054z-G5; Fri, 03 Oct 2025 22:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136889.1473320; Fri, 03 Oct 2025 22:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oep-00051Z-8X; Fri, 03 Oct 2025 22:53:47 +0000
Received: by outflank-mailman (input) for mailman id 1136889;
 Fri, 03 Oct 2025 22:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oeo-0004mK-0A
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:46 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda653e9-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:40 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso2232836f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:40 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:38 -0700 (PDT)
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
X-Inumbo-ID: cda653e9-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532019; x=1760136819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXbXCT//JpG4DZDNCPX8AIKG+4YnmRnZVf3VPs504Jw=;
        b=C+SQgQBzVUOQmYPJa4uaWotQ77ROJC6T8/WIn5l7OrTzjV30uVUZSi7s7TagUffBTJ
         QZUN6PVGTONfe6mbKMP32pT4uyC6ArAiyrph2Ka9vRfSIdLOLNxm2Vc9ILa91PfMhUhN
         fTn7ISD9dvPVyO3Cz3JRB/1niRv6UspIVH9Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532019; x=1760136819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXbXCT//JpG4DZDNCPX8AIKG+4YnmRnZVf3VPs504Jw=;
        b=C5STH1uH37gaL9l9A2+RuWQ4hKkJN8ybukiVKLDUznHupvaT6l3yp13yem1vHJfPBf
         LgjZ2C1rQm+WGzHp1UyUVFTimQpv66P0hESZLGt9bu/TkBJ3yrwyhxtfN7yUwoXbGNMJ
         KbTgZHnMub/qSReud84f+ng0/hgJGzZoqsuJ7pJdVBF8klOXPYSBVHuqXZPLA8veIr/0
         M1aJzpoHEfkBUoZ0q6+UPT2yufweN5QLC/TFEJ2iP39BO5xUOYNrh6/z7AIRvC3HNVGg
         QSS0AxX5ATmqaHWFQJ1oyd7bw7IqFdHLcloqVshGVqyyNcqeh7ITNO3nvRrRlrVIe84Y
         6GjQ==
X-Gm-Message-State: AOJu0Yz4GkfE4IYl0whBzgAlL7ImHI1fQwLgjdHtiRxC55Z5ifAYV6dH
	ektF4wE6mmjtOvBZRWYxMZMxwv5PwwOAKmwfJQCAEWKgZUKIw1uawSQ0Sw6Us0OOKG4gEVG7XUm
	Zpau6p1oWg3t8
X-Gm-Gg: ASbGnct2DaNQbOk5OP3XcnEF5eWejA37c3hFKAVwro3hzaCq6Tm+IiZfePimq+sbu4z
	cC3oYYExht3fEWFHB0b2sxg89Jvu5gEW/lgv8VX1NBHrRhJpZ5ajXg4PEtPQVNx0H0IISYOpgwF
	8HCIaPJYpAGsMdv3SYDELMT5u+kNYWSugFCvYoH/02EmnHvPvZvrS2OhlwIzQnjohEXY/KH14CR
	odJ2SXRAzwbCGGvwcIdhBVpI0HDJiN3FlVkcCR0vdg7/Dzox7RJcyvisWYdM1nQ3OsXF2mRDPyO
	EQBCZV4P+jClE5B9nd0blmjXLrLRw01KMd4Sz8WLokGPql2y/vXcD4lKsXHszq39+thon7clbW0
	h0LM9GkceI+CL16A+gOAAAtYY+kwp+IWZ+UL4Ux/xlRhFsMhaJ07Nwr0mKtB7D9UjA0cKRER46p
	vIYM51atJp2kKJJFMA7PHW
X-Google-Smtp-Source: AGHT+IHt8Y4HD2gfh9eO9TrrCqFYjk+ME/K7TqWH5HSyVumtZcyTfGz24NEEQEDC10OjEBbB9aypcg==
X-Received: by 2002:a05:6000:2890:b0:3ea:63d:44a8 with SMTP id ffacd0b85a97d-42566c38bdbmr3356568f8f.15.1759532019102;
        Fri, 03 Oct 2025 15:53:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 for-4.21 00/22] x86: FRED support
Date: Fri,  3 Oct 2025 23:53:12 +0100
Message-Id: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the combined MSR cleanup and FRED series.  Some patches of both v2's
have already been committed.

I have moved the MSR_IMM patch out.  It's not strictly needed for FRED, and
really needs to go behind Jan's patch to use mergable sections for
altinstructions which is definitely not making 4.21 at this point.

I almost got access to a piece of real hardware in time, but that fell through
at the last minute.

In terms of timing, I know we're getting very tight for 4.21, but there has
been an awful lot of disruption with travel and holidays recently.  Half the
patches are already acked/reviewed, but can't easily go in due to logical
dependencies (I suspect patches 15-17 could be committed right away as they're
pretty independent.)

Therefore I'd like to ask Oleksii whether the nominal release ack still
stands.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2079705485

Andrew Cooper (22):
  x86/msr: Change rdmsr() to have normal API
  x86/msr: Change wrmsr() to take a single parameter
  x86/fsgsbase: Split out __{rd,wr}gs_shadow() helpers
  x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
  x86/fsgsbase: Improve code generation in read_registers()
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
  x86/pv: Guest exception handling in FRED mode
  x86/pv: ERETU error handling
  x86/pv: System call handling in FRED mode
  x86: Clamp reserved bits in eflags more aggressively

 xen/arch/x86/acpi/cpufreq/powernow.c    |  12 +-
 xen/arch/x86/boot/x86_64.S              |  23 +-
 xen/arch/x86/cpu/amd.c                  |   8 +-
 xen/arch/x86/cpu/common.c               |  20 +-
 xen/arch/x86/cpu/intel.c                |  30 +-
 xen/arch/x86/domain.c                   |  34 +-
 xen/arch/x86/extable.c                  |  14 -
 xen/arch/x86/genapic/x2apic.c           |   5 +-
 xen/arch/x86/hvm/domain.c               |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  32 +-
 xen/arch/x86/hvm/vmx/vmx.c              |   4 +-
 xen/arch/x86/include/asm/asm_defns.h    |  76 +++-
 xen/arch/x86/include/asm/current.h      |   9 +-
 xen/arch/x86/include/asm/domain.h       |   2 +
 xen/arch/x86/include/asm/fsgsbase.h     |  66 +--
 xen/arch/x86/include/asm/hypercall.h    |   2 -
 xen/arch/x86/include/asm/msr.h          |  48 ++-
 xen/arch/x86/include/asm/prot-key.h     |   6 +-
 xen/arch/x86/include/asm/traps.h        |   2 +
 xen/arch/x86/include/asm/uaccess.h      |   2 -
 xen/arch/x86/include/asm/x86-defns.h    |   7 +
 xen/arch/x86/mm.c                       |  12 +-
 xen/arch/x86/nmi.c                      |  18 +-
 xen/arch/x86/oprofile/op_model_athlon.c |   2 +-
 xen/arch/x86/pv/dom0_build.c            |   2 +-
 xen/arch/x86/pv/domain.c                |  22 +-
 xen/arch/x86/pv/iret.c                  |   8 +-
 xen/arch/x86/pv/misc-hypercalls.c       |  42 +-
 xen/arch/x86/pv/traps.c                 |  39 ++
 xen/arch/x86/setup.c                    |  33 +-
 xen/arch/x86/traps-setup.c              |  83 +++-
 xen/arch/x86/traps.c                    | 519 ++++++++++++++++++++++--
 xen/arch/x86/tsx.c                      |  27 +-
 xen/arch/x86/x86_64/Makefile            |   1 +
 xen/arch/x86/x86_64/compat/entry.S      |   3 +-
 xen/arch/x86/x86_64/entry-fred.S        |  57 +++
 xen/arch/x86/x86_64/entry.S             |  46 ++-
 xen/arch/x86/xen.lds.S                  |   5 -
 38 files changed, 1076 insertions(+), 249 deletions(-)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

-- 
2.39.5


