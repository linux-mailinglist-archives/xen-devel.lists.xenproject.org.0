Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735038B9F04
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715945.1117925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zif-0006Oy-3Y; Thu, 02 May 2024 16:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715945.1117925; Thu, 02 May 2024 16:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zif-0006Ll-0U; Thu, 02 May 2024 16:55:41 +0000
Received: by outflank-mailman (input) for mailman id 715945;
 Thu, 02 May 2024 16:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zid-0006Lf-Pk
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:39 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd13bc1d-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:38 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a55bf737cecso1010509166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:38 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:37 -0700 (PDT)
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
X-Inumbo-ID: cd13bc1d-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668937; x=1715273737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gkpKCmCscYcHI5K9J1ZWC0k2m8hrdGMWQYAyGZgqIU=;
        b=2HtycorCH4hcj0oLKQAjM7A8n7dJc1XvB2iszUDXTbpyCSAK9UndkQfKTU/uyJ5ug5
         mSrB1IcR4pau5BUT9OANta0dWtjx4K9GRsOaw5sM53clB0p32IkWlt5JIMUnR1HMNFQ1
         5k98fwq2rHSdcCsi9wF2kTxT24d+VVzAJUylX+8oczucOeDGj0zpZCDzIhC3EOBeEFyd
         ftk19A/WP4gni3k5teZhJE+oxqTQRoICWCPp/MtNI2mQ96lZPKJXEhKfCfQBoHLIDzQ3
         6mSHYvIPHjxpray8goWKgI+9EafgXJl1NCdo/Kfzurv3vpe3r/P4RXx6/oWiXT3qxWeg
         8FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668937; x=1715273737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gkpKCmCscYcHI5K9J1ZWC0k2m8hrdGMWQYAyGZgqIU=;
        b=a0EsJxtbixR+2B6f5OIUl5CwjHJAmQSSlRn3fc/ryMOLWxmGKUZfiKpxzMO4/vqYAa
         hbcnd83JDWN5nAv4cj3jY0Kf7AThYOQS9ewADvRBQlNynA5LIza/5+kt8gyHBj0cH9Ba
         va6OXokFGYgj04oUjkOzBGXc+5fY0SmYOnheXqpxU3VrZlDMbRzY3skAbgUkPxMZwJGo
         0s2smHoauf6Qtt7GBUeMyzCRdhUbsDJ+PPK6SHbyVbEala1xBIejKqNSj8nQH8RzZqUj
         M115/3LEN7FhfG77CNA09ezgS0BRT0mA9ohVWPedF6jeZo3nExDSjhtWvnlNutcgt3u4
         HYNA==
X-Gm-Message-State: AOJu0YySOlX5z9SZFFC87DUrwTzlsNEHEuDlVTGg+xyt4xhEpNNiQ9m1
	DSOcWgDDyqReFSYG9OKVIInHwD9FqMoKhVbqiqg+dw6xFvFbbX56L0LWoqi7UreDHZewsN+ODzQ
	r
X-Google-Smtp-Source: AGHT+IF2ygDwkCaFzAIPf+pJIDcPHgiTFNxHs9rVsRZhxQkDr56yF0mglY0KehVMayvtxae9mTD2hg==
X-Received: by 2002:a17:906:f1c8:b0:a58:9c9b:61ad with SMTP id gx8-20020a170906f1c800b00a589c9b61admr68340ejb.43.1714668937383;
        Thu, 02 May 2024 09:55:37 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 00/13] Arm cache coloring
Date: Thu,  2 May 2024 18:55:20 +0200
Message-Id: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
 docs/man/xl.cfg.5.pod.in                |  10 +
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/cache-coloring.rst            | 246 +++++++++++++++
 docs/misc/xen-command-line.pandoc       |  70 +++++
 tools/include/libxl.h                   |   5 +
 tools/include/xenctrl.h                 |   9 +
 tools/libs/ctrl/xc_domain.c             |  35 +++
 tools/libs/light/libxl_create.c         |  13 +
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  30 +-
 xen/arch/arm/arm32/mmu/mm.c             | 115 +------
 xen/arch/arm/arm64/mmu/head.S           |  58 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  28 +-
 xen/arch/arm/dom0less-build.c           |  60 +---
 xen/arch/arm/domain_build.c             | 107 ++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/processor.h    |  16 +
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 140 +++++++++
 xen/arch/arm/mmu/p2m.c                  |   4 +-
 xen/arch/arm/mmu/setup.c                | 221 +++++++++++++-
 xen/arch/arm/setup.c                    |  13 +-
 xen/common/Kconfig                      |  30 ++
 xen/common/Makefile                     |   1 +
 xen/common/domain.c                     |   3 +
 xen/common/domctl.c                     |  10 +
 xen/common/keyhandler.c                 |   3 +
 xen/common/llc-coloring.c               | 379 ++++++++++++++++++++++++
 xen/common/page_alloc.c                 | 204 ++++++++++++-
 xen/include/public/domctl.h             |   9 +
 xen/include/xen/llc-coloring.h          |  63 ++++
 xen/include/xen/sched.h                 |   5 +
 xen/include/xen/xmalloc.h               |  12 +
 39 files changed, 1768 insertions(+), 195 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.34.1


