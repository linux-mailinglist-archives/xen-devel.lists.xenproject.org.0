Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE209F51A9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859572.1271690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb1w-0006Ci-Hb; Tue, 17 Dec 2024 17:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859572.1271690; Tue, 17 Dec 2024 17:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb1w-0006BB-Eh; Tue, 17 Dec 2024 17:06:44 +0000
Received: by outflank-mailman (input) for mailman id 859572;
 Tue, 17 Dec 2024 17:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb1u-0006B0-Ry
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4907b7d2-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:41 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso867686966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:41 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:40 -0800 (PST)
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
X-Inumbo-ID: 4907b7d2-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455201; x=1735060001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOKqlNthTDOE+oYLNQY9UFtYi227lhBRw4zHWIQH4gU=;
        b=P4N7lEI8Z2fLldaMvZaPfVWWO9XKTdc1SedGircjij5NNldgu9nAd2gPYOurHP5yXU
         Swdwr4kMpnal85rDsKJzyJb8GOBZWGVEcQXzuakJ/iTt2cJaIpoXwrKLLZH5Y0Apom40
         Ixaa/wu4uBSkdMdWajDFtsbhzPET9ai9mkKFFhWeW/t6Spx76x1IsmLwe+woIXJNUdc6
         r51yeH1Piwr84LQfxIRZpfDUhIi4kglC7nBYRRTO8uY/l5OvnEsQbtjkL3UpVL4zSB6b
         xa3SewqZYvroDOmKXDaEUUcMpIHpffskiKQm73+fkR8a3dUxKA9JnMP4i/HjH/HONwVs
         jcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455201; x=1735060001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOKqlNthTDOE+oYLNQY9UFtYi227lhBRw4zHWIQH4gU=;
        b=ZBsoFgU6Uu9dvppt5AbehgpR7NL2zOctqkS4zKR+hIp5lvz44pZjBtc+U3ymRY8Rjx
         gV9U3M1omgeoYRkTzc1Zy7wQ+Fr60jf5EvJKpoYeV3wOtEQ0zY6/3eqJ5X64Gb/1MkHV
         XgU81AUfGGZ35pLfbz2xp2Mlcm4wD2/CoruJgcQRzAETj9giEvqkWFhUkVyyoFvWGFtl
         N7DoM2iLWaw3jBRExpu5CLjG4hVm0mQ/K4wyis/F2Az9bQDB/uQ24PSo4GSBPSjCvs5m
         y+ur4S2Ptt7BYN1gTEGNF1CbWTSigYnWZZ7yuuTcODLsa1Ao+pJVbAu1J1IoSxS3ZBj4
         HiIA==
X-Gm-Message-State: AOJu0YxXI2/FmhnOZxvaYN4UOTwk9mzRd52d7EygYQkln0iUp0/i1t5K
	fRO+j+n5htWGH94TIbWYdWKerd5fEUrJeZAG8IhsKkNEzoq91tAnNc0m9q7yBNYZXOB3/7UdsvJ
	Fnpk=
X-Gm-Gg: ASbGncvYBbAubGUw2MOkfK0ga2MacKA/Y/GfENja3BN/MBaX69aFtXmRRTIa3QcMl3u
	f5J+iTOjNZ3fD2NeCDP4IY/UWSWuj+bp0uCvmr0IUW1ZhLk9+qvFLNMxWbDn9DnAYNYfUhjqZmp
	m5x8qmcsLqroDV3SZWiShmVdSRRz+T4SnQOU0inKK08uDWCt+LKC/Ezz2miFajtPOc/3UyIk24z
	171/tfEqULwjf3Ybnh9Xs8N2f8fv36KgqFCAW1f31jwgkaByiMRldEm5OJ+zHQHncza9dB4OJ8F
	TPtIARIwfCg6keJpqZyhCPmR5qK5pFGDtJe6M73A58d9IxC+qBCM0Unhe4A=
X-Google-Smtp-Source: AGHT+IF3l4DsQWO7H9atQie2iK8cRV2i2eoJ2expI+32jW/kzjlCeDV1gnv66hit9cxWWrN8lExIxw==
X-Received: by 2002:a17:907:3e9f:b0:aa6:8a1b:8b7c with SMTP id a640c23a62f3a-aab778be690mr1609501666b.2.1734455200579;
        Tue, 17 Dec 2024 09:06:40 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v13 00/12] Arm cache coloring
Date: Tue, 17 Dec 2024 18:06:25 +0100
Message-ID: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared caches in multi-core CPU architectures represent a problem for
predictability of memory access latency. This jeopardizes applicability
of many Arm platform in real-time critical and mixed-criticality
scenarios. We introduce support for cache partitioning with page
coloring, a transparent software technique that enables isolation
between domains and Xen, and thus avoids cache interference.

When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
the user to define assignments of cache partitions ids, called colors,
where assigning different colors guarantees no mutual eviction on cache
will ever happen. This instructs the Xen memory allocator to provide
the i-th color assignee only with pages that maps to color i, i.e. that
are indexed in the i-th cache partition.

The proposed implementation supports the dom0less feature.
The proposed implementation doesn't support the static-mem feature.
The solution has been tested in several scenarios, including Xilinx Zynq
MPSoCs.

Carlo Nonato (11):
  xen/common: add cache coloring common code
  xen/arm: add initial support for LLC coloring on arm64
  xen/arm: permit non direct-mapped Dom0 construction
  xen/arm: add Dom0 cache coloring support
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/page_alloc: introduce preserved page flags macro
  xen: add cache coloring allocator for domains
  xen/arm: make consider_modules() available for xen relocation
  xen/arm: add cache coloring support for Xen image

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 SUPPORT.md                              |   7 +
 docs/index.rst                          |   1 +
 docs/man/xl.cfg.5.pod.in                |   6 +
 docs/misc/arm/device-tree/booting.txt   |   5 +
 docs/misc/cache-coloring.rst            | 248 +++++++++++++++
 docs/misc/xen-command-line.pandoc       |  72 +++++
 tools/golang/xenlight/helpers.gen.go    |  16 +
 tools/golang/xenlight/types.gen.go      |   1 +
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  34 ++
 tools/libs/light/libxl_create.c         |  18 ++
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  26 +-
 xen/arch/arm/arm32/mmu/mm.c             |  95 +-----
 xen/arch/arm/arm64/mmu/head.S           |  58 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  34 ++
 xen/arch/arm/dom0less-build.c           |  60 +---
 xen/arch/arm/domain_build.c             | 165 +++++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/mmu/mm.h       |   1 +
 xen/arch/arm/include/asm/processor.h    |  15 +
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 142 +++++++++
 xen/arch/arm/mmu/setup.c                | 201 +++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |  29 ++
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  10 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 393 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 200 +++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  65 ++++
 xen/include/xen/sched.h                 |   5 +
 xen/include/xen/xmalloc.h               |  12 +
 42 files changed, 1846 insertions(+), 169 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.43.0


