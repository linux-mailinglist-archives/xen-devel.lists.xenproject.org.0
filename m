Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450059AFEDE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825704.1239993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gxz-0005YQ-1Q; Fri, 25 Oct 2024 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825704.1239993; Fri, 25 Oct 2024 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gxy-0005WS-TL; Fri, 25 Oct 2024 09:50:46 +0000
Received: by outflank-mailman (input) for mailman id 825704;
 Fri, 25 Oct 2024 09:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4Gxx-0005WM-PJ
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:50:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a6f3f57-92b6-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 11:50:44 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9709c9b0cso2486630a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:50:44 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:43 -0700 (PDT)
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
X-Inumbo-ID: 9a6f3f57-92b6-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849844; x=1730454644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke/yS6So1QM0AcCFZ2Tb1fxlmH3VGK/VDCVyweqhKNE=;
        b=S+JKHbVzszPHV8rYhZAjF1tNLuTvZ5lGap7E9x9OVghqHd6t0mICGCJVcfwYEAg+D4
         dio8X3RmsuYEr1U54vdIsW7uwmaB+ZJQRRnOFKgTqdZfUx62Q7Ttu6SaeGLWaFEcH688
         1GXygYbUAcd8a0RgyrC5B6cpcfMk81L175hDxU+DKFHBuVM2duYjAcEoprpukTWv1uDk
         R0GFeyu2U7glJTxSrkGzHyZ/D2EDShLCZQpZ7xWHD0AWj0tHGhYjutPqC4mWQ3QNNg2J
         DHSu5A75yE3w6N5mVRGqbonUKnXZvrzC/5ljia8ET7dtiE1wex1cw4qmhrjMab6WMnSz
         /5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849844; x=1730454644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke/yS6So1QM0AcCFZ2Tb1fxlmH3VGK/VDCVyweqhKNE=;
        b=BKong60wetRz6RsTG7kGB5P05g8FD1Di2YFRCbNBQRKgWcQxIWn/R43DgWP1y2GBbb
         HfMpsF2eTNhQpRsa3Rw1DYVpn7ryWrCbINDKRNqEf9dNmJayCxH8l4/QsaD8U+wGVZrv
         EWsbdLP7nN9E20WL6mJEDAKPAKeCTfzaNelf2ypBCFREbvMY0Xsq4lPegRJ1WmMOexiq
         TuSRQdEJ6ldjamTyiXqtBHbqS06dCchI6ssiO2JZsjerRkdqEwS/cj0GgoIj7/bBR4Zb
         iuRW3h7jGKRvk+Yr6qAUr7uBDUhP5f8a/+mL429Qpje5M45EWYGppk8v7XoLQy0g0w0c
         anXQ==
X-Gm-Message-State: AOJu0Yw5PxQPijJM2hdXF/kyGuAGu57bmhDCnISYHYrza1mNCo2gXI9t
	KeiBMsAaGMoEc4pH2N02kq1LdIIhDl9Q9n4L5SAgdxXyTLOnDiHs5vx1jkkE0+5Kv/H7s420aj3
	RbeQ=
X-Google-Smtp-Source: AGHT+IHRJzha8WgD21edp2ffGdFT4OLhu6dKa7F32lU1cjOanpF+c0FLTWyH5RUZP75xSmySbWe1jw==
X-Received: by 2002:a05:6402:26d4:b0:5c5:c4b9:e68f with SMTP id 4fb4d7f45d1cf-5cb8ac36d9cmr7784490a12.5.1729849843544;
        Fri, 25 Oct 2024 02:50:43 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v9 00/13] Arm cache coloring
Date: Fri, 25 Oct 2024 11:50:01 +0200
Message-ID: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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

Carlo Nonato (12):
  xen/common: add cache coloring common code
  xen/arm: add initial support for LLC coloring on arm64
  xen/arm: permit non direct-mapped Dom0 construction
  xen/arm: add Dom0 cache coloring support
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/page_alloc: introduce preserved page flags macro
  xen: add cache coloring allocator for domains
  xen/arm: use domain memory to allocate p2m page tables
  xen/arm: make consider_modules() available for xen relocation
  xen/arm: add cache coloring support for Xen

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 SUPPORT.md                              |   7 +
 docs/man/xl.cfg.5.pod.in                |   6 +
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/cache-coloring.rst            | 246 +++++++++++++++
 docs/misc/xen-command-line.pandoc       |  70 +++++
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  35 +++
 tools/libs/light/libxl_create.c         |  18 ++
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  30 +-
 xen/arch/arm/arm32/mmu/mm.c             |  95 +-----
 xen/arch/arm/arm64/mmu/head.S           |  58 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  28 +-
 xen/arch/arm/dom0less-build.c           |  60 +---
 xen/arch/arm/domain_build.c             | 106 ++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/processor.h    |  16 +
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 140 +++++++++
 xen/arch/arm/mmu/p2m.c                  |   4 +-
 xen/arch/arm/mmu/setup.c                | 195 +++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |  30 ++
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  10 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 378 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 208 ++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  63 ++++
 xen/include/xen/sched.h                 |   5 +
 xen/include/xen/xmalloc.h               |  12 +
 39 files changed, 1746 insertions(+), 174 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.43.0


