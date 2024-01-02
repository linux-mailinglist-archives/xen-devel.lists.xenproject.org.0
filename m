Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B984821928
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660559.1030038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR7-000628-Tu; Tue, 02 Jan 2024 09:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660559.1030038; Tue, 02 Jan 2024 09:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR7-00060T-QT; Tue, 02 Jan 2024 09:51:49 +0000
Received: by outflank-mailman (input) for mailman id 660559;
 Tue, 02 Jan 2024 09:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbR6-00060C-Cd
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 898aadf1-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:44 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a2343c31c4bso1029653166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:44 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:43 -0800 (PST)
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
X-Inumbo-ID: 898aadf1-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189103; x=1704793903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=beeGC4zsHWhix8z9+UTegvQD7zyehBOaMLb6lMZd4h0=;
        b=ScFGNVRFD+QEHsy+3uBdFkoarlQxzfjEjHWNKd509cKufCuDx8vDjb5QecpAlh7fCZ
         gIrp825vFtFtpV9bp3nAr84rFa3+8m3bgg+nv1OiD2M1/vi4Kx3c2dPTBB+CzSQJwX5f
         g9PaFprpEwF4NPUU/sVAdaP8vRS+J4Ri9pM/OG7sE+ZJDQd+Z6Q1YdF9WAQaCFQgBHTd
         EcIZrskphQo8xF4FQtc5PRIvkjFsFa3CYkJ8udaqYc25nKvVTbijWgtSc2tKmNnRm6ao
         lUpw7AulTfYq9cse/x4nLX+Z8OUYb4Zs8jgMCajKeQ4ytTtSlkRNXtLqnwKaieepJ3qG
         Yyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189103; x=1704793903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beeGC4zsHWhix8z9+UTegvQD7zyehBOaMLb6lMZd4h0=;
        b=oOS9VxmOfOraS55t+DIJ5YVRPttQ5oAUhHLF/Fho08soKA0LIucnQyUp3NbHJ1NlzG
         pPwQpDAByRZDImW6SEretziujduEhAOgcFwmvzbdY33rUK1o/lZ6aGTzm9hu83AeVwr5
         M00CLIcYB0bCvMPFNSw+nERH3KtcaiD20AcewcruuSy1OMzic2sNkT/5KyMXalnd4Sw2
         oa+wQ1+3MSG+/N4waAWtuCA1R6e4LrYJbO30WOEPfJxISPJpXavm0jGjsEQuSidruxhV
         4ThL4iGx0EZl0vBhWmUUkBPUVk5S5FUDtupgzstdfAf/+R/P798v6dt1SAEIhG7IIM39
         bFRg==
X-Gm-Message-State: AOJu0YzUsqX6J2WokpL4AmiQZ+vXoDFl2zw9QzEsFxbjpZA8HozGCU3o
	ym7CfYC40xedUYR1FFvCAQax9TLuJB3PcCdS06gV0KgZTOw=
X-Google-Smtp-Source: AGHT+IFBeOlKj/wqrRUDDlGS4B5/Oh/4prEYxZjEKVhij9gmAKGfR7wZKQFvlI3x0eq+AD9Ow2FleA==
X-Received: by 2002:a17:907:12d5:b0:a27:c65b:67ed with SMTP id vp21-20020a17090712d500b00a27c65b67edmr883137ejb.26.1704189103396;
        Tue, 02 Jan 2024 01:51:43 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 00/13] Arm cache coloring
Date: Tue,  2 Jan 2024 10:51:25 +0100
Message-Id: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
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

In this patch series there are two major unacceptable workarounds for which
I want to ask you for comments:
 - #3: allocate_memory() has been moved in dom0less_build.c, so I just copied
 it back to make it compile.
 - #13: consider_modules() has been moved to arm32 only. Again I just copied it.

Carlo Nonato (12):
  xen/common: add cache coloring common code
  xen/arm: add cache coloring initialization
  xen/arm: add Dom0 cache coloring support
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/page_alloc: introduce init_free_page_fields() helper
  xen/page_alloc: introduce preserved page flags macro
  xen: add cache coloring allocator for domains
  xen/arm: use domain memory to allocate p2m page tables
  Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
  xen/arm: add cache coloring support for Xen

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 docs/man/xl.cfg.5.pod.in                |  10 +
 docs/misc/arm/cache-coloring.rst        | 209 ++++++++++++
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/xen-command-line.pandoc       |  61 ++++
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  34 ++
 tools/libs/light/libxl_create.c         |   9 +
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/Kconfig                        |  28 ++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |   9 +-
 xen/arch/arm/arm64/mmu/head.S           |  48 +++
 xen/arch/arm/arm64/mmu/mm.c             |  26 +-
 xen/arch/arm/dom0less-build.c           |  19 ++
 xen/arch/arm/domain_build.c             |  60 +++-
 xen/arch/arm/include/asm/llc-coloring.h |  46 +++
 xen/arch/arm/include/asm/mm.h           |  12 +-
 xen/arch/arm/include/asm/mmu/layout.h   |   2 +
 xen/arch/arm/include/asm/processor.h    |  16 +
 xen/arch/arm/llc-coloring.c             | 409 ++++++++++++++++++++++++
 xen/arch/arm/mmu/p2m.c                  |   4 +-
 xen/arch/arm/mmu/setup.c                |  83 ++++-
 xen/arch/arm/mmu/smpboot.c              |  11 +-
 xen/arch/arm/psci.c                     |   9 +-
 xen/arch/arm/setup.c                    | 172 +++++++++-
 xen/arch/arm/smpboot.c                  |   9 +-
 xen/common/Kconfig                      |   3 +
 xen/common/domain.c                     |   4 +
 xen/common/domctl.c                     |  11 +
 xen/common/keyhandler.c                 |   4 +
 xen/common/page_alloc.c                 | 217 ++++++++++++-
 xen/include/public/domctl.h             |  10 +-
 xen/include/xen/llc-coloring.h          |  53 +++
 xen/include/xen/sched.h                 |   5 +
 37 files changed, 1610 insertions(+), 42 deletions(-)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/include/asm/llc-coloring.h
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.34.1


