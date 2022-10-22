Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55577608E47
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428406.678474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmg-00026J-Gr; Sat, 22 Oct 2022 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428406.678474; Sat, 22 Oct 2022 15:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmg-00023E-DP; Sat, 22 Oct 2022 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 428406;
 Sat, 22 Oct 2022 15:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGme-000237-F1
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:36 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66fea70d-5221-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 17:51:34 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id z97so16335700ede.8
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:33 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:31 -0700 (PDT)
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
X-Inumbo-ID: 66fea70d-5221-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jVBSsJ9+eO182bhm4hzhFdzePeCxIyKg2P2EmAkMEE=;
        b=Yff+Fopw3K4BIyPa1RKnQFQW9HLtMY57AV80steTB6khTg/Urfb6tb4G27gpoZxDD+
         tmJUjT5SEHc9ZtP3xYUImF/GjP2XnAQrU01YN7met8BDVYqk+2SlQlbQ2QHExWKRx8cu
         eeTwnFHdvHYmOaTgMcz0cCiA7JvB0fRAFSuavtynMOP2btwoPO7YfPyZsiUZJgL/V2PP
         qOIhLFlEiweS4RvyYvbTKxnCfzS4uRmYj+oyHgVU/R4UsNs3OMTyQR9VM0fzMUZGE/xn
         iyw7WyxhufSO4w/zX5vGTTsiVGA6mbK9Yy4ytXvaefuhsP8dbrscoPbYyzex+erw8w+y
         6bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jVBSsJ9+eO182bhm4hzhFdzePeCxIyKg2P2EmAkMEE=;
        b=2JnWTplVuTu3fEf/lVXFQ5gmUD6kCKGletjLxeQ0w1E7lWa9cW1I9ZqoWZ6zt2+Oqw
         XH8PsSxFdv0qTu8b3rayhRrcqa+kt6MYBBJ74PfQg0laG1K86CAeO9aInTRradKOTXRQ
         9RrHOPzc73PFZbLHRMIQyFSCHdmVQFxcUjzN87FC1aPiX7mMTNwhtbkM150k4jz4sHpP
         kqfgCBWX86OYBNkBMOGvE85LRdTfNpAEbrGJ8JxJqyT32OiC/dFJbZxn41PEqaXhLPO2
         VAii2uX96Ls4ed6YCNBmplihokNYgBPMVJ8dtVM63sQ261nXNm1iAc8Tj8s2FpmPNLb+
         hISQ==
X-Gm-Message-State: ACrzQf11113UsPAhx0McRhmrf/cQ1iNBcDvZVNlv+V3wGS1JnPgB5yF+
	C6jqp98JCDtx/jkEaIuup40dBBDPxw4HHA==
X-Google-Smtp-Source: AMsMyM4XCclR/lk6sFXOuBZmMUvApnhtgJRznwMEP+4Z8SVBz7vc6VKTGcbyjAQQq8aSynPP71Ezjw==
X-Received: by 2002:a17:907:a4a:b0:77b:c1b2:479a with SMTP id be10-20020a1709070a4a00b0077bc1b2479amr17627956ejc.109.1666453892625;
        Sat, 22 Oct 2022 08:51:32 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/9] Arm cache coloring
Date: Sat, 22 Oct 2022 17:51:11 +0200
Message-Id: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
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

Commits structure:
- [1-3] Coloring initialization, cache layout auto-probing and coloring
  data for domains.
- [4-5] xl and Device Tree support for coloring.
- [6] New page allocator for domain memory that implement the cache
  coloring mechanism.
- [7-9] Coloring support for Xen.

Global changes in v3:
- fixed a compilation error because of a forgotten "\"
- replaced some #ifdef with if ( IS_ENABLED )
- other minor changes (docs, typos, variable types, style, etc.)
- better acknowledged Luca Miccio as the original author
- removed #8 since the bootmodule address and size can be replaced without
  the need of this particular revert
- removed #9 since it wasn't a clean revert and thanks to Julien things can
  be done in a smarter way sticking with map_pages_to_xen() (see new #9)

Open points:
- The allocator proposed in #6 works only with order-0 pages and inserts
  them in a sorted list using a linear search. This behavior can be slow if
  large amount of memory is given to it, so the user is warned in the
  documentation for that.
  In a following patch, that I'm going to send separately, a simple buddy
  allocator that indexes pages by color is presented. It can serve higher
  order pages and doesn't need the linear search. Unfortunately, it has
  some flaws that I will discuss there.
- I will address the latest v2 comments from Julien in v4

Acknowledgements
----------------

This work is sponsored by Xilinx Inc., and supported by University of
Modena and Reggio Emilia and Minerva Systems.

Carlo Nonato (6):
  xen/arm: add cache coloring initialization
  xen/arm: add cache coloring initialization for domains
  tools/xl: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
  xen/arm: add cache coloring support for Xen

Luca Miccio (3):
  xen/arm: dump cache colors in domain info debug-key
  xen/common: add cache coloring allocator for domains
  xen/arm: add Xen cache colors command line parameter

 docs/man/xl.cfg.5.pod.in              |  10 +
 docs/misc/arm/cache-coloring.rst      | 229 ++++++++++++++
 docs/misc/arm/device-tree/booting.txt |   4 +
 docs/misc/xen-command-line.pandoc     |  49 +++
 tools/libs/light/libxl_create.c       |  12 +
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_parse.c                   |  52 +++-
 xen/arch/arm/Kconfig                  |  34 +++
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/alternative.c            |   9 +-
 xen/arch/arm/arm64/head.S             |  48 +++
 xen/arch/arm/coloring.c               | 411 ++++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |   9 +
 xen/arch/arm/domain_build.c           |  26 +-
 xen/arch/arm/include/asm/coloring.h   |  91 ++++++
 xen/arch/arm/include/asm/config.h     |   4 +-
 xen/arch/arm/include/asm/domain.h     |   4 +
 xen/arch/arm/include/asm/mm.h         |  19 +-
 xen/arch/arm/include/asm/processor.h  |  16 +
 xen/arch/arm/mm.c                     |  95 +++++-
 xen/arch/arm/p2m.c                    |   7 +-
 xen/arch/arm/psci.c                   |   4 +-
 xen/arch/arm/setup.c                  |  81 ++++-
 xen/arch/arm/smpboot.c                |   3 +-
 xen/arch/arm/xen.lds.S                |   2 +-
 xen/common/Kconfig                    |   3 +
 xen/common/page_alloc.c               | 259 ++++++++++++++--
 xen/include/public/arch-arm.h         |   8 +
 xen/include/xen/mm.h                  |  43 +++
 29 files changed, 1487 insertions(+), 47 deletions(-)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/coloring.c
 create mode 100644 xen/arch/arm/include/asm/coloring.h

-- 
2.34.1


