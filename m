Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F14A61780
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914865.1320483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mr-0003LY-S1; Fri, 14 Mar 2025 17:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914865.1320483; Fri, 14 Mar 2025 17:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mr-0003IQ-Or; Fri, 14 Mar 2025 17:25:33 +0000
Received: by outflank-mailman (input) for mailman id 914865;
 Fri, 14 Mar 2025 17:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8mq-0003IK-1W
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:32 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5452c2c5-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so369682066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:31 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:29 -0700 (PDT)
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
X-Inumbo-ID: 5452c2c5-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973130; x=1742577930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjvqXYyEEnHbKJZz92/fZWoNj/3Jm20gx4F4RpsQxSE=;
        b=L5UZ8tzKDZ+mN9idQp4Qgsv9DxcbCIM8tfrny+UOJPJxvYJgWD/f4OkP8o+NZxJYrZ
         U2pnULhtcE6tYqBTTcijiEFkeIKUeL0Q9zRk9aXsWcXKvsF5Czq85/voUnSrtceArf00
         IQMDSH6c45qMyKxEo0PVd/CXA7M17UUjGifEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973130; x=1742577930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjvqXYyEEnHbKJZz92/fZWoNj/3Jm20gx4F4RpsQxSE=;
        b=vtwz8ApBCFNAbHA4w52aFhBaSE72do+3dLobnePKBTpBGgG0hSzDELqgyaNX0IprIj
         omxIiQZ505fAYHF0ceCEKaoVK6wW6QMvDlrfajcEWKcQnTm/tvqvrCGKGxjo6yXoSOQZ
         m1iBk3ytqpOybakX9J/OQ0nbd1wiIfZ5h2c1NZKmYUQ1IQrRXBAeMI2Q96n2butc7DFx
         FIkFHy0Kd6hTpTsN0pTeqzqx+0f32ou+b/AfqVErZJbj3VjIaa1ii7saQlxrWyeWMbuP
         F6c1h81RG5U6gtj1dcV6mrluRaPcDM9o6EhEsTKqwIuljvFWF1OIA6A1nirLXNIEAXlC
         uatw==
X-Gm-Message-State: AOJu0Yyha8Ox5KWe2ytUkcwpdjRtSxmbpDXSSQgMaw/HGwefAmSlesfu
	ky1G/tNyLYsYlM0/jj4ck0vIeAATVevtzl3fpCGNJ5urHTSlwt5Jra2tE2WO/nPb51ca84sN4gN
	o
X-Gm-Gg: ASbGncuuPr4I62Fwq+U9lgMXTqKGD8v092nhe/LjB6Wlxez10aqrBgo7u9sxS09xO5W
	q93FXCz634wrOlfmcHuyFGR7/zfU2djArTDRURlG1zzvTogvqaC6FLzjGgsgpkGZQaWyxmGOcKh
	O7w/5i4CjHn1qv5ogcu2RHoXm8s+2Uak0KBlPaAY+jtr40Ilu0RG5p/ukcfPNBryz8l0V8SpiIe
	VA4a88IXDQUXlvVfc5rmsfnpJnz+QYJLwgA9T3QlnEbVCelGDAu8PEVMEIIuGzdsfxj/lGQPOsD
	oNDOWA0dUjDpSNFhzSItdzHkpDwuQf3MBDiSKy0raKMj99Fn4yKPrEPxTN0lItmI5Fc=
X-Google-Smtp-Source: AGHT+IH8a5jyo/RjLx/Yw5KHGQgXGW2HCEPTx08EbGJYgU3PiwVAhczDrObRz9K7szwRs9VBurjQSw==
X-Received: by 2002:a17:907:da3:b0:ac2:7c68:b3fe with SMTP id a640c23a62f3a-ac3301771demr481681966b.15.1741973130243;
        Fri, 14 Mar 2025 10:25:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Juergen Gross <jgross@suse.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 00/11] Add support for exact-node memory claims
Date: Fri, 14 Mar 2025 17:24:51 +0000
Message-ID: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen toolstack supports claiming memory ahead of allocating it with the
intent of assisting bootstorms of massive VMs. This works ok for general VMs,
but falls appart miserably whenever the toolstack attempts to force placement
of specific NUMA nodes.

This series extends the in-hypervisor claim infrastructure to support per-node
claims, and propagates the knob all the way to xl.cfg.

A worthy future goal is the support of multi-node claims per domain, but the
objective of this series is far more modest and merely intends to enable
claiming memory on a single node for specific domains. This solves a
real-world use case of bundling many small VMs in a single NUMA machine.

The feature specifically allows combining domains with exact-node claims,
general claims and no claims at all in a consistent fashion.

Alejandro Vallejo (11):
  xen/memory: Mask XENMEMF_node() to 8 bits
  xen/page_alloc: Remove `claim` from domain_set_outstanding_pages()
  xen/page_alloc: Add static per-node counts of free pages
  xen: Add node argument to
    domain_{adjust_tot_pages,set_outstanding_pages}()
  xen: Create per-node outstanding claims
  xen/page_alloc: Hook per-node claims to alloc_heap_pages()
  xen/page_alloc: Set node affinity when claiming pages from an exact
    node
  xen/memory: Enable parsing NUMA node argument in XENMEM_claim_pages
  tools/xc: Add `node` argument to xc_domain_claim_pages()
  tools/xl: Expose a "claim_on_node" setting in xl.cfg
  docs/man: Document the new claim_on_node option

 docs/man/xl-numa-placement.7.pod     |   8 ++
 docs/man/xl.1.pod.in                 |   2 +-
 docs/man/xl.cfg.5.pod.in             |  14 +++
 tools/golang/xenlight/helpers.gen.go |   2 +
 tools/golang/xenlight/types.gen.go   |   1 +
 tools/include/xenctrl.h              |   1 +
 tools/include/xenguest.h             |   7 ++
 tools/libs/ctrl/xc_domain.c          |  13 ++-
 tools/libs/guest/xg_dom_core.c       |   1 +
 tools/libs/guest/xg_dom_x86.c        |  22 ++---
 tools/libs/light/libxl_dom.c         |   2 +
 tools/libs/light/libxl_types.idl     |   3 +-
 tools/xl/xl_parse.c                  |  11 +++
 xen/arch/x86/mm.c                    |   3 +-
 xen/arch/x86/mm/mem_sharing.c        |   4 +-
 xen/common/domain.c                  |   2 +-
 xen/common/grant_table.c             |   4 +-
 xen/common/memory.c                  |  25 +++++-
 xen/common/page_alloc.c              | 125 ++++++++++++++++++++++-----
 xen/include/public/memory.h          |   5 +-
 xen/include/xen/mm.h                 |   6 +-
 xen/include/xen/sched.h              |   3 +
 22 files changed, 216 insertions(+), 48 deletions(-)

-- 
2.48.1


