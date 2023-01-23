Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73522678062
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483022.748903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3Q-0000AO-5x; Mon, 23 Jan 2023 15:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483022.748903; Mon, 23 Jan 2023 15:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3Q-00006d-39; Mon, 23 Jan 2023 15:48:16 +0000
Received: by outflank-mailman (input) for mailman id 483022;
 Mon, 23 Jan 2023 15:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3O-00006V-Px
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58290116-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:48:13 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id vw16so31589989ejc.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:13 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:12 -0800 (PST)
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
X-Inumbo-ID: 58290116-9b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnCu0SRK9ePUEiQ5se2maNj9MJnvtp+AnY7rFaTM0NU=;
        b=RfE825bgUL5pu+8RaEIQzsXF6qfkeYR5t0zobns4fssro3Z1cXfeRaQaNu46IEwx4f
         00s/od1H/H/5fFXkoi0VmXrScUJ+9fZGAZN37Pe135rsqXJSo8sMDRQMSWIZDOqtWv5C
         rlipSA4xo06BTUAJBWB2zOicl4Rtl9CQmzRhELBm/lqdK105r0EWd342QjCsOKVs23Y+
         6wb3oNfyefmFXjb9swVo//0ESoF28LTyY9xbwQD5/e5gDAsQHsGGdbspPf6XHtT8l28z
         u+HUoAvtbXdkIgtvywhUqhPnNgBsKFJzwXiHHAsjUozPA169BgKNmqTjtriRF6uFrIRP
         m+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnCu0SRK9ePUEiQ5se2maNj9MJnvtp+AnY7rFaTM0NU=;
        b=gr+wvF9ZEcFMOO4cbVbFPJtgu11vPUp3Kdv91UxILfiwSbTiLEEcqLvjpCm394yNIL
         VqFewacgXsnawYRq41SYjkg+t0W9hydIEWE849IsS3g+A/VaAZAxzAdi5akweuTX/938
         VGhDlbaXarm3Bmz+AFsFFf74kp8PIiu+dnc5t5TH5q7pib6wMjf8m2ZzQTH0g0Xi9u7+
         3jAapXFQCQrKn3UDEx9ZOYxuqXsxsvfmPf917krW8DbkAsXLcnku1HE4XslhjFjFK+T2
         oBbGZ13XPZ8LF2qhLg4502c6OMZXA+rkiLWn/bQjoIvleYdDJM5BPbFBJSv9MXGXtQZC
         vgmQ==
X-Gm-Message-State: AFqh2krmKe3BOMRVPuuO7hVDaDRGmlbOASJ6c94HiEl/C8jA7M9Xs2K/
	liRLELNPM0oO6ouSAmcMNrZGRwW84UbOWoqk
X-Google-Smtp-Source: AMrXdXsSFqadTi1APyOj8rwia3op6YXUtg2N97abRBOHc/N2/EDl3Wl8iUnkDngI+T+ggcWAyqEGiA==
X-Received: by 2002:a17:906:37ca:b0:871:14fc:a299 with SMTP id o10-20020a17090637ca00b0087114fca299mr28246844ejc.1.1674488892797;
        Mon, 23 Jan 2023 07:48:12 -0800 (PST)
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 00/11] Arm cache coloring
Date: Mon, 23 Jan 2023 16:47:24 +0100
Message-Id: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
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

v4 global changes:
- added "llc" acronym (Last Level Cache) in multiple places in code
  (e.g. coloring.{c|h} -> llc_coloring.{c|h}) to better describe the
  feature and to remove ambiguity with too generic "colors". "llc" is also
  shorter than "cache"
- reordered again patches since code is now splitted in common + arch

Carlo Nonato (8):
  xen/common: add cache coloring common code
  xen/arm: add cache coloring initialization
  xen: extend domctl interface for cache coloring
  tools: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/arm: use colored allocator for p2m page tables
  Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
  xen/arm: add cache coloring support for Xen

Luca Miccio (3):
  xen/arm: add Dom0 cache coloring support
  xen: add cache coloring allocator for domains
  xen/arm: add Xen cache colors command line parameter

 docs/man/xl.cfg.5.pod.in                |  10 +
 docs/misc/arm/cache-coloring.rst        | 223 +++++++++++++
 docs/misc/arm/device-tree/booting.txt   |   4 +
 docs/misc/xen-command-line.pandoc       |  61 ++++
 tools/libs/ctrl/xc_domain.c             |  17 +
 tools/libs/light/libxl_create.c         |   2 +
 tools/libs/light/libxl_types.idl        |   1 +
 tools/xl/xl_parse.c                     |  38 ++-
 xen/arch/Kconfig                        |  29 ++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/Makefile                   |   1 +
 xen/arch/arm/alternative.c              |   9 +-
 xen/arch/arm/arm64/head.S               |  50 +++
 xen/arch/arm/arm64/mm.c                 |  26 +-
 xen/arch/arm/domain_build.c             |  35 ++-
 xen/arch/arm/include/asm/config.h       |   4 +-
 xen/arch/arm/include/asm/llc_coloring.h |  65 ++++
 xen/arch/arm/include/asm/mm.h           |  10 +-
 xen/arch/arm/include/asm/processor.h    |  16 +
 xen/arch/arm/llc_coloring.c             | 397 ++++++++++++++++++++++++
 xen/arch/arm/mm.c                       |  95 +++++-
 xen/arch/arm/p2m.c                      |  11 +-
 xen/arch/arm/psci.c                     |   9 +-
 xen/arch/arm/setup.c                    |  82 ++++-
 xen/arch/arm/smpboot.c                  |   9 +-
 xen/arch/arm/xen.lds.S                  |   2 +-
 xen/common/Kconfig                      |   3 +
 xen/common/domain.c                     |  23 +-
 xen/common/domctl.c                     |  12 +-
 xen/common/keyhandler.c                 |   4 +
 xen/common/page_alloc.c                 | 247 +++++++++++++--
 xen/include/public/domctl.h             |   6 +-
 xen/include/xen/llc_coloring.h          |  63 ++++
 xen/include/xen/mm.h                    |  33 ++
 xen/include/xen/sched.h                 |   9 +
 35 files changed, 1552 insertions(+), 55 deletions(-)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/include/asm/llc_coloring.h
 create mode 100644 xen/arch/arm/llc_coloring.c
 create mode 100644 xen/include/xen/llc_coloring.h

-- 
2.34.1


