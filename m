Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBC87CBBA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693747.1082204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Ho-0000ch-IE; Fri, 15 Mar 2024 10:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693747.1082204; Fri, 15 Mar 2024 10:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Ho-0000af-Fa; Fri, 15 Mar 2024 10:59:40 +0000
Received: by outflank-mailman (input) for mailman id 693747;
 Fri, 15 Mar 2024 10:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hn-0000aQ-04
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:39 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d66fc1c-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:37 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a468226e135so74733566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:37 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:36 -0700 (PDT)
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
X-Inumbo-ID: 1d66fc1c-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500376; x=1711105176; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rCKwXe47zdPxf3eu90GCtkMGXFP7tCC1kpyZ9XRJHM=;
        b=RLj9VxmDkRbZHKu3sXWrg8SXv4EMPGtTrFzjmA90MRE61bZGRF7rY0UPBaXRpkkzGJ
         oZGAYS/LamYB7uthNjETh6x/lF0Afla+Xsfp5pn1I3e/1pkwDxNq315M6cXna2g6VGVa
         LiU6ymY183zB2/xUfxUBCytmpX7PpuNrT0TnAw9qYwGVgJ3ymRkoT5QWl6zP7B/b/WXI
         pCt7gnur6ZgnMXSnEgSWmq3+YPVtypAzEWOGKu/BS5AxGqb2JeJvlmEeo43Ffmzdyy8C
         jN6XpHFhtsuXIEZEiBRdmdv1CbidnszoXEFrw1qYg4LJ+RinY6gWLOcyOFnJVkcUOjt2
         8AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500376; x=1711105176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rCKwXe47zdPxf3eu90GCtkMGXFP7tCC1kpyZ9XRJHM=;
        b=gnzKiKtV6OSGqEPPgbB/Uy3UM1G2irsmwLldysvgIc7xwSEXj54B2wvpYIOrxaorhW
         Drq6XSXr0WzcFa1K09PYLM358FIQuS4CcKCgPJVIBa57i0NetQTvyqigMKae7Hr3RXL7
         Rd1KurTLJxn75AbOaJvnC7Py++r8BnROYyN6X7t6lBIJo9AOh697PDUWE5wHAXs5y4mL
         eNQxBMF99unHBxoo4e9IX27sMshlXZfhzL2Za1ZBqMwg99gDOzwQLCfwO7Ki9Lg7TNgO
         oeRSkPE4WxBg73ixM2t0YgJsakOveh08jDZ1GWB7z8qvaOQQne9jDJrbuL+3WiQ6MMG0
         glQg==
X-Gm-Message-State: AOJu0YzMQINtMHO9bMnFJm1ythvZjU6VBDLglZzSPyNWPT8u7Dutfs3Y
	eg97355W0dPyYmGAFoE/1IAYdHjhRTHaERoK/sVx1p98xNy5YM0ze8m0XFeqmCupd/BULU3+mHg
	4w3E=
X-Google-Smtp-Source: AGHT+IEeWS16YrFMYdPbrZbKXVbRq2wvHOC5Obn8jrlOL6J0MKm0DIXRyIFrJdaI0X1uF5iO5pd2RQ==
X-Received: by 2002:a17:906:5d7:b0:a45:f6fa:8c20 with SMTP id t23-20020a17090605d700b00a45f6fa8c20mr3186789ejt.14.1710500376488;
        Fri, 15 Mar 2024 03:59:36 -0700 (PDT)
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
Subject: [PATCH v7 00/14] Arm cache coloring
Date: Fri, 15 Mar 2024 11:58:48 +0100
Message-Id: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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

Carlo Nonato (13):
  xen/common: add cache coloring common code
  xen/arm: add initial support for LLC coloring on arm64
  xen/arm: permit non direct-mapped Dom0 construction
  xen/arm: add Dom0 cache coloring support
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/page_alloc: introduce preserved page flags macro
  xen/page_alloc: introduce page flag to stop buddy merging
  xen: add cache coloring allocator for domains
  xen/arm: use domain memory to allocate p2m page tables
  xen/arm: make consider_modules() available for xen relocation
  xen/arm: add cache coloring support for Xen

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 SUPPORT.md                              |   7 +
 docs/man/xl.cfg.5.pod.in                |  10 +
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/cache-coloring.rst            | 255 +++++++++++++++++
 docs/misc/xen-command-line.pandoc       |  70 +++++
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  35 +++
 tools/libs/light/libxl_create.c         |   9 +
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/Kconfig                        |  28 ++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  30 +-
 xen/arch/arm/arm32/mmu/mm.c             |  93 +-----
 xen/arch/arm/arm64/mmu/head.S           |  58 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  28 +-
 xen/arch/arm/dom0less-build.c           |  59 ++--
 xen/arch/arm/domain_build.c             | 109 ++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/processor.h    |  16 ++
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 136 +++++++++
 xen/arch/arm/mmu/p2m.c                  |   4 +-
 xen/arch/arm/mmu/setup.c                | 199 ++++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |   3 +
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |   8 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 360 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 210 +++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  64 +++++
 xen/include/xen/sched.h                 |   5 +
 39 files changed, 1721 insertions(+), 175 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.34.1


