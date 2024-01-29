Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D3840EE9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673062.1047224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI2-00065C-5P; Mon, 29 Jan 2024 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673062.1047224; Mon, 29 Jan 2024 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI2-0005ys-22; Mon, 29 Jan 2024 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 673062;
 Mon, 29 Jan 2024 17:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI0-0005vb-Ok
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:20 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8873b31f-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:17 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a9008c185so5169476a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:17 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:16 -0800 (PST)
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
X-Inumbo-ID: 8873b31f-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548757; x=1707153557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXTDORbontv1SP7UM3nFDVIk1NxjAuDsyT6O7qMNlys=;
        b=zHCVR0eMFb9MbgDCEmwvOr4ZUc3tbvvDyi0PU8lrm5lCr7FndnCvYke118USEdEGF/
         u+9yKRIp+y124yqENaux2RMryFZkdzH56Vy6uxH8mH8JiE0kM6f5yoPDeiNtQ8X1a15m
         xdwxXBW9EX7NNrvUl2iuUSJF5vB4OD0J/fHeV3sCs87Gori9dw0Q+Kj8BG01NBarq8Wt
         GGMr81VSAnNj4S7L91AmgELsa9z6vMXFJs0O1xEfrShDhlpSaFMsGZaKJK5x4gO8ctnp
         Yyy8lpfRrwqfXmujm1MPVJsFm1ImMeGkng+BSukMmiQCNc3iSjW7YEm1kAgDMIng2DV4
         KSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548757; x=1707153557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXTDORbontv1SP7UM3nFDVIk1NxjAuDsyT6O7qMNlys=;
        b=FNSdyMjLOaPIkFXq+XA1lXEHNHttekqAxrBBxNnZI19nbHwlSiJcy94OG6ZZy8ppBy
         BjBHkyCQguQknqBDpRYg+Pb8aaY+tWpvu9r6Itb3hOLvvesG3ikJdTNNpnEip5DHQidW
         YJj1jy4k9/ifG5HjWCqEUzt7JvOdgpOXSIl8rTOJBbUm3BzB25W1eYNZtvNzJ3OjCI02
         Gc2eNJPehrkobl68lYOOEaI8jjDWsIOTLJsm2idKjEojE7WCRlgd0Vh4MU7A4zuy5NET
         S+j1P0EDIXzkHcXXEglEhNEyLWPFpX/O4R78p7S73DEqOZer/a1unDPNLL2/hryK0WGc
         NKPw==
X-Gm-Message-State: AOJu0YzakNqOglIMZDDKGVK1R+eANwCw/S20N+z5tEtO3WmseUbc3xNp
	RkDJ+uaharUI6F/kpXMV+B8ndjgocvgAmfBzDThbTwjeOi6f54oBnZ0Fj/zgGcsQ6IzGNlX2L7R
	Dg2s=
X-Google-Smtp-Source: AGHT+IGpB5pG4dAwNcyg1K43OgmLop42tNjcfXBnbJpIBnCGCGInJRfqkxV4Ieo7Nx6RgopZY0Gwfg==
X-Received: by 2002:a05:6402:14ce:b0:55f:3343:7c04 with SMTP id f14-20020a05640214ce00b0055f33437c04mr30413edx.1.1706548757156;
        Mon, 29 Jan 2024 09:19:17 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
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
Subject: [PATCH v6 00/15] Arm cache coloring
Date: Mon, 29 Jan 2024 18:17:56 +0100
Message-Id: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
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

Open points:
- Michal found some problem here
https://patchew.org/Xen/20230123154735.74832-1-carlo.nonato@minervasys.tech/20230123154735.74832-4-carlo.nonato@minervasys.tech/#a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com
  but I havent fully understood it. In the meantime I want to advance with v6,
  so I hope we can continue the discussion here.
- Default configuration. After a few tries with a domain default configuration
  that included all colors not already in use by Xen, I went back with having
  all available colors indiscriminately. The problem is that if Xen has all the
  colors then domains can't be created with the default configuration.
  In general we don't want to impose any rule on the user so, the original
  default is preferred since it allows users to try coloring without too much
  headache, even if this means that they are using a suboptimal configuration
  that includes shared colors.
- I don't know how to split #14 in smaller patches. I hope also not to have
  misunderstood any comment there.

Carlo Nonato (14):
  xen/common: add cache coloring common code
  xen/arm: add initial support for LLC coloring on arm64
  xen/arm: permit non direct-mapped Dom0 construction
  xen/arm: add Dom0 cache coloring support
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/page_alloc: introduce init_free_page_fields() helper
  xen/page_alloc: introduce preserved page flags macro
  xen: add cache coloring allocator for domains
  xen/arm: use domain memory to allocate p2m page tables
  xen/arm: make consider_modules() available for xen relocation
  xen/arm: add cache coloring support for Xen
  support: add cache coloring arm64 experimental feature

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 SUPPORT.md                              |   7 +
 docs/man/xl.cfg.5.pod.in                |  10 +
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/cache-coloring.rst            | 210 ++++++++++++++
 docs/misc/xen-command-line.pandoc       |  60 ++++
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  34 +++
 tools/libs/light/libxl_create.c         |   9 +
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/Kconfig                        |  25 ++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  30 +-
 xen/arch/arm/arm32/mmu/mm.c             |  93 +------
 xen/arch/arm/arm64/mmu/head.S           |  57 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  28 +-
 xen/arch/arm/dom0less-build.c           |  60 ++--
 xen/arch/arm/domain_build.c             |  60 +++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/processor.h    |  16 ++
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 134 +++++++++
 xen/arch/arm/mmu/p2m.c                  |   4 +-
 xen/arch/arm/mmu/setup.c                |  97 ++++++-
 xen/arch/arm/setup.c                    | 100 ++++++-
 xen/common/Kconfig                      |   3 +
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  11 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 350 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 214 ++++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  62 +++++
 xen/include/xen/sched.h                 |   5 +
 39 files changed, 1593 insertions(+), 173 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.34.1


