Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBD9D27D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840121.1255905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz5-0007pv-Hy; Tue, 19 Nov 2024 14:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840121.1255905; Tue, 19 Nov 2024 14:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz5-0007nW-FK; Tue, 19 Nov 2024 14:13:39 +0000
Received: by outflank-mailman (input) for mailman id 840121;
 Tue, 19 Nov 2024 14:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz4-0007nQ-6j
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:38 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c80834-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:13:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa20c733e92so611562566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:33 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:32 -0800 (PST)
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
X-Inumbo-ID: 75c80834-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc1YzgwODM0LWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NjEzLjU1NDA1NCwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025613; x=1732630413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IFvfTjZE6wmZxfoRI0jv/bdIXJXzUe7p3S+8ifjEzU=;
        b=3WK8mNZdeghROw1E1/a5bGIwKJRSDpSjefheO5fFPiqI4exNifERYgOHdcwCUibrlh
         aSAZUtove/mLVNB6Xeh+kfgYWE127nWqAmu2f2ep4++3BdNuqWlyOrOc5jInZppdnHgw
         1cn67j6lvcS05rIleb3NQOjoOx00gDvw/jQhTjhQ4I9K4ykFtP3H1foc/SJ7J/xtlYlA
         QzcY/XylLj66ZVXMM7UUmvN62Ooc4AOdEM6gRrXkZXNlF81WdtPZytYdH3TDTNUaSND8
         tCNWSp2RCMWFKpBAvSVZvSJb6ARRiCmgIGQGkYdu4sbHlUwc8MruhKVFLGaL0RVUFQgG
         M+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025613; x=1732630413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IFvfTjZE6wmZxfoRI0jv/bdIXJXzUe7p3S+8ifjEzU=;
        b=Cx0MWo2oL+pNB3z92WdtAM6F4u/3jf1FE0W+FSZYdyqyD3ItBDsOemEyLTHEm8z62b
         kcOqBY/WTkjSUV6hNQmFUL6iRJMj9aVk3wUsHHvMFnVEsyM0T7aXyGma8J4U2xph2KTJ
         J9WPnyrjBUgttzhf+HIqrYbktMuuZgilk+f7fL1te8DxRNLkM0WKPZbaDITTCqFZRR/H
         cg3miinh4EtSZz9Y4d8MthzE7DXUEuLqtfJuXWl+ptangwF5mXjYn4TdBsI7OnLcacFm
         76inmubrYmyhybSMt/7K4QvEYkZn83MdqKWXOgIGkeJ6T4G5rL7TFTMDoDH0ZNBOgbCO
         Uj3g==
X-Gm-Message-State: AOJu0Yx4lIkebsr3609ZkLOI4iEql2QY7z9Apgw0SV6/BTgOL5Aivnnl
	KrviCWT5fAKIRSZ+meOLFTdXtSsmqwrJNP6z2H0Dgz5fL7nG2yQsN6XYQQ8ZQrjh8y1bJO/BSQJ
	x
X-Google-Smtp-Source: AGHT+IFi2huZ1vgA/wPm330M3kEiYKbl7sdhB2jGt1TIt8wrq818YdyBY1bFNvsdL01ImN3BRAQjPw==
X-Received: by 2002:a17:907:1b2a:b0:a9e:b281:a55d with SMTP id a640c23a62f3a-aa48354d7fdmr1804740366b.56.1732025612741;
        Tue, 19 Nov 2024 06:13:32 -0800 (PST)
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
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 00/12] Arm cache coloring
Date: Tue, 19 Nov 2024 15:13:17 +0100
Message-ID: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
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
  xen/arm: add cache coloring support for Xen

Luca Miccio (1):
  xen/arm: add Xen cache colors command line parameter

 SUPPORT.md                              |   7 +
 docs/index.rst                          |   1 +
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
 xen/arch/arm/llc-coloring.c             | 141 +++++++++
 xen/arch/arm/mmu/setup.c                | 195 +++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |  29 ++
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  10 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 382 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 208 ++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  64 ++++
 xen/include/xen/sched.h                 |   5 +
 xen/include/xen/xmalloc.h               |  12 +
 39 files changed, 1749 insertions(+), 173 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.43.0


