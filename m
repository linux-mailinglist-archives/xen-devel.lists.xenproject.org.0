Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13789F1215
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856846.1269368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wg-0003z6-Qp; Fri, 13 Dec 2024 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856846.1269368; Fri, 13 Dec 2024 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wg-0003wX-Nz; Fri, 13 Dec 2024 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 856846;
 Fri, 13 Dec 2024 16:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8We-0003wJ-QD
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4540136b-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:22 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3f249f3b2so2466322a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:22 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:21 -0800 (PST)
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
X-Inumbo-ID: 4540136b-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107302; x=1734712102; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFJsugpqRu+wkYb+hKtB3kv+BczMORwJDo3dzgPHCwI=;
        b=XQb4yEVCZsbKb1usGLDmZ8Qv7QDz8OfnGnNw+30YAb6ligMvWncBuyb0wAbWEGP8oD
         DM58WV98nA1Q7OjTgwjOvE1L64ei0UEvc7cPWNAS91C5cEfu7+BWNegUk2eZo8iMnAqM
         7f0GJFT3Ec1h2C7VXowm9kn0MPi/PFDD5W4x7EenBpEH2ao+A86yYxykeKiOpgGvnH6X
         +4UMfHxx096wv7weFktPvgPsEaq3kFtRtX5rIK1VlDXL2SzpbQItW8ChIflw+87n6IKk
         ADSZ1A8DJeWbxZSePNb4QIaYBiI1X8/5d82ePODsmmfx4FlKkTzlzm0/GYhGaHw2zLid
         onOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107302; x=1734712102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFJsugpqRu+wkYb+hKtB3kv+BczMORwJDo3dzgPHCwI=;
        b=U2K0RbJnEr340MTZ9eeASIgspZWfNIRSMgwwLJLjVSu+MVaWn7dxZg3CNNEumzdWzL
         rrdRUgDfVnATsF9neWluFYV4usjAnuLo+dvSY+ZC/GRFFq5BvxwRQt3QWShyAZ2xfjVq
         c0E+yf7pvxx5Dpp+JYjwC26Ucg6/nTPoSdiTAfOke3wIozqIpzX8ydzyWVx3shTXWe2y
         MQIJYfPaw29CH4QnVJLQXJoINJVdgq71gNZq/XZiizU6A0qQNMlLy9PBDSOdb9N73Zgy
         HT8aN31pLW6cONaps4mOy4rSE+eC15thjSrr4rGGakVmUz3eLDJ4Rxw/nsawD9rzQBsU
         2HkA==
X-Gm-Message-State: AOJu0YwueJvXFBlW+Oz/XsIDzBZ/N58TOWjSqzEFhQy7Sb17TSnkxqfk
	xU+glZjRixl2Bfw0OKa9K1ZxBYQ9qZ94fktPZOpVoJ+YLMRzs8IKGKx6agLQ2y8r2Hr0wEDZXUw
	TJhY=
X-Gm-Gg: ASbGncuohgjUWxU0OCVKpJn+Kjl+zJzlLj37EstBkfmhBHGlIyUuZdQFvDAxNfp9OOO
	/FwrFRE8bKQ0h7JjkJWWjqbWfGI0bW2S2u+40f8CGTLrGpXORu2LbWPCXcalmjHVd/luTtQOg6r
	b13CRDd7bKsvrTf9doUi7cP2p6eaqkDPWGXy9Fi5hVT7SbgC5uqcTuxlD0CsjQwRNwOlrLxPnso
	Gy4f+zo+wBXEb7trUpHzo3gKcPz+fNuNLn5xwv2eSL2cyLf5uS2Prf/9bfs9x2e+OswZoeGAnKx
	/YMHLcBpHVxwOVxw
X-Google-Smtp-Source: AGHT+IFNLnZwB7igfihHtVdilMmPwYv0HKls6IekFrpik0Gl7X0sLu5xTzw1mWzCOaX8/tq9uUqx5Q==
X-Received: by 2002:a05:6402:354b:b0:5d0:c7a7:ac13 with SMTP id 4fb4d7f45d1cf-5d63c409146mr7688886a12.34.1734107301860;
        Fri, 13 Dec 2024 08:28:21 -0800 (PST)
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
Subject: [PATCH v12 00/12] Arm cache coloring
Date: Fri, 13 Dec 2024 17:28:03 +0100
Message-ID: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
 tools/libs/ctrl/xc_domain.c             |  34 ++
 tools/libs/light/libxl_create.c         |  18 ++
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |  26 +-
 xen/arch/arm/arm32/mmu/mm.c             |  95 +-----
 xen/arch/arm/arm64/mmu/head.S           |  58 +++-
 xen/arch/arm/arm64/mmu/mm.c             |  29 ++
 xen/arch/arm/dom0less-build.c           |  60 +---
 xen/arch/arm/domain_build.c             | 173 ++++++++++-
 xen/arch/arm/include/asm/domain_build.h |   4 +
 xen/arch/arm/include/asm/mm.h           |   5 +
 xen/arch/arm/include/asm/mmu/layout.h   |   3 +
 xen/arch/arm/include/asm/mmu/mm.h       |   1 +
 xen/arch/arm/include/asm/processor.h    |  15 +
 xen/arch/arm/include/asm/setup.h        |   3 +
 xen/arch/arm/llc-coloring.c             | 142 +++++++++
 xen/arch/arm/mmu/setup.c                | 197 +++++++++++-
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
 42 files changed, 1843 insertions(+), 172 deletions(-)
 create mode 100644 docs/misc/cache-coloring.rst
 create mode 100644 xen/arch/arm/llc-coloring.c
 create mode 100644 xen/common/llc-coloring.c
 create mode 100644 xen/include/xen/llc-coloring.h

-- 
2.43.0


