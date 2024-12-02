Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591E9E093B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846761.1261904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lh-0006yg-ST; Mon, 02 Dec 2024 16:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846761.1261904; Mon, 02 Dec 2024 16:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lh-0006xB-Of; Mon, 02 Dec 2024 16:59:29 +0000
Received: by outflank-mailman (input) for mailman id 846761;
 Mon, 02 Dec 2024 16:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lg-0006wq-5r
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8f8e1d8-b0ce-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 17:59:25 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa52bb7beceso522807766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:25 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:24 -0800 (PST)
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
X-Inumbo-ID: c8f8e1d8-b0ce-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158765; x=1733763565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rJsfH+V+Soptn6R7o1ALXaGMOegZkt3cFlTFnOfJ54=;
        b=OABK8SfX9IoNuQ6L2IdyJVvhMwZh1SfMNFJU9RpDtdWLqzKNHucC6kXnDLlW58USib
         Wxv6ryrc0ZndMXqqr23MGCv/WZ0eJEtCwludAo/5ehyj0dHUXvEx7LNxvqhYFZXWQSSg
         CeIowsg6w1L4g+46zpzNCGTCRPjKVITavBzSB85wrTF2jm4p3n4faDN16DBR1Pxfz9Df
         ZfvYf0413h1pW7qcntuBJ6aiLLR92Avpo1WLdUPBhSBELTAb+GT1Avi8uLnNEUSvq0x8
         DkAoAmokY2tWkOYqJD7firY6ZlRlQMTQhpG6SLtikrETXllDo2iT6Fz24jKrH/alHAsc
         RWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158765; x=1733763565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rJsfH+V+Soptn6R7o1ALXaGMOegZkt3cFlTFnOfJ54=;
        b=IQBQyaOvO8OX+ky7LV+OnIse/Vya9vQUAxLscZdG6Ru/Iin4XxHm066qPqRzKM+cyb
         C6pHwm8wJtmP/Jf2ytq/xdDG7mZrYRyFfaDNgX/8WF1PE+PEMkyyOsLPR4y73NnKX/1W
         bGnM73+olJc92GQQ2PizMQ+BFhCVqO9p8MquoUCNDm052tcpMlgiOEWB2ViY7HtixZEM
         VaPYC78W22TJi5ryXkiw89FLB+mlSeGkHvBA9RRBrTdI16HCTJ6iBmDBCWQ0VVnWPwCt
         4sesI83IVQLa7T3vv24U+MJifR62cR5/vTVry3aBZNYHV1AoneYTEOsd53V+SjkCc/Zn
         yfXQ==
X-Gm-Message-State: AOJu0Yyxa42YNzNTs7DIOow2Qj+E3/8uT5Xgtn/EMgTR4ba3EWDn7BG6
	23EVdWsD/wwnzxLuhHT9tYoNOVdL0KZweHfaDLQZXfgA596KU0KcchAw/CqR82mKIGbTd1H/O/W
	7
X-Gm-Gg: ASbGncvVI5Wuu3rAod6eOPunCYpUwf7VpHvfuoXKgVqEHSlGrNuJifJ8qCKUZdoAxKK
	2zl++H1EUZ3J6U6mNQvl2I19+iuVyMSKihyVocc9+vEkLNPbNyAap2zuRqP/VSvZDHbRI6uTqCX
	y+oWuNm/u2TRjk7N6KOce+NyTTMdRNF0AHnYpoAPe/CAE2HBYfV6mPZHzif6wXTopWVheq9ONnP
	mqWxV/fB3vX7/5HVcoWaXv7ptgg3wm2MaYn7rD0WNypcovU1OlncxDRhi2t9AAnRXzRj4zfgSSV
	DH+PTys6/0Mu/B+N67/KRB5GEFVI2stQ8ffpSUm52dpPf7VCs4JR
X-Google-Smtp-Source: AGHT+IFQI3QBUh10pKtPQ9/85JLzaWgm+DrhqsxXhrUseAfmCYZB3jvREbh8ySpOyIry13D8tyhFEA==
X-Received: by 2002:a17:906:3d2a:b0:aa5:3423:2dfe with SMTP id a640c23a62f3a-aa580f33384mr1969780166b.25.1733158764714;
        Mon, 02 Dec 2024 08:59:24 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v11 00/12] Arm cache coloring
Date: Mon,  2 Dec 2024 17:59:09 +0100
Message-ID: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
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
 docs/misc/xen-command-line.pandoc       |  70 +++++
 tools/golang/xenlight/helpers.gen.go    |  16 +
 tools/golang/xenlight/types.gen.go      |   1 +
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  34 +++
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
 xen/arch/arm/domain_build.c             | 107 ++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/processor.h    |  15 +
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 142 +++++++++
 xen/arch/arm/mmu/setup.c                | 193 +++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |  29 ++
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  10 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 388 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 209 ++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  64 ++++
 xen/include/xen/sched.h                 |   5 +
 xen/include/xen/xmalloc.h               |  12 +
 41 files changed, 1775 insertions(+), 172 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.43.0


