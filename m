Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D45B28D5A
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084442.1443587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unExY-0005wR-4P; Sat, 16 Aug 2025 11:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084442.1443587; Sat, 16 Aug 2025 11:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unExX-0005tQ-UC; Sat, 16 Aug 2025 11:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1084442;
 Sat, 16 Aug 2025 11:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unExW-0005tK-7w
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:20:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9b560af-7a92-11f0-b898-0df219b8e170;
 Sat, 16 Aug 2025 13:20:12 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b0becf5so12543965e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:20:12 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:20:10 -0700 (PDT)
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
X-Inumbo-ID: f9b560af-7a92-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343211; x=1755948011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8NrHUv/BZP21PfU22f6r7e6G7TP0L/hOZLojm9nBfI=;
        b=PM1YrptOkJhYTZb7+t4XARnci1vOwSfKVpHcKrm28FhUw8Aly9pd9zRHoIbrk25PYE
         7uTIS23Fzcrk3I+2su7qEPrPPdHMfDsGTNruG+2pVs1BrPdT2FmuEo1CliSbYRPSHUHA
         LB0kNZsJAn8D06Z9hz/VZqQOyN41cQxLNWwMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343211; x=1755948011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8NrHUv/BZP21PfU22f6r7e6G7TP0L/hOZLojm9nBfI=;
        b=QCFYE2IuM3wYa3rZdFp33xeyhwUaiKp0v0SG2iRv7wlpPrNjfxSbGqXWyckwgHZMv5
         CPZt6IYW5X1Sh5/LRbxl8ML2s8RZnu11dp5QEHXkxUPXXtlXRwphhyCZVjZi9dD+7+9X
         5JA+aDuBArL2S3EmGBz3WZELTuufmyBvot68cMSSRqEB6D9CMR/+PWguo3qdlIawGppw
         MLWIQj07RlLBR9D3SPDJk06+AjAqwz66F/hqzMWd5fAEX6/MBeiRBMxaOnjADAHcyRf4
         hz32yvtOcrFMzr2TYAVF4ViWtPaC+uZuXVVfAk40oqh+xc7boxWNk09Vmy+zR3PKFl+x
         cvQw==
X-Gm-Message-State: AOJu0YzTIau6+oawaxZjEmlnlajpH+V1ZgoTS24G7JY0t9bXZKpf4M77
	JWZF64DtAZJ2sK9gbtHAaW9FwhLKxNgcQNDujL62KoARxtFqpOS8nIEHKueyQMTveIzRruhsz4x
	e/GiCVxs=
X-Gm-Gg: ASbGncuSrsL+13MN+O3Ik8Q6CKkZMMSJePH6azXSSDYaYebdf4adBLVQN7zkokPQ1lZ
	maTcqNds6iENSpDHx0MBkxpXAt8CAGuUFQr3p6kKkLXZohHww1Bp+A88/ppMcjNQZWLz2HbtYc/
	PD43M/WgjsnftcOZTyDYgbYkY8P2xfRtssiVFK7qcrIkgeT3fB8zH+8OPaEwFVgL4I8vQcVGYRP
	bYnPkC3q+cq3mqxqXRfq2M1hlZoy4SZoaHApnddr2ieAsMQji1hCQG1hDWLSj/1KUhE9FzAYs+m
	xIGomAnTbuvuwAhGBo5Ogg5TnePkXJBHh1Du5/0moPlRftmUhiSNV9Yz+1lEivSysoyZbSZqB5m
	TYbeagQKWls6M9epRC8JsrlZu+JeQp6wLdowkkt4Up/LSmoV4X2v2jbs=
X-Google-Smtp-Source: AGHT+IFX564gLQPEOUgvLYI74WyqS4tKzgJfE9H32sZKtKBWH3G9XY/WuERP5uJM9AejRRboqoqZ2A==
X-Received: by 2002:a05:600c:3149:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45a218676b5mr51582025e9.30.1755343211384;
        Sat, 16 Aug 2025 04:20:11 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 0/7] xen/page_alloc: Add NUMA-node specific memory claims
Date: Sat, 16 Aug 2025 13:19:26 +0200
Message-ID: <cover.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen supports claiming an amount of memory ahead of allocating it to
ensure that the memory for the domain is available for allocation.

On NUMA hosts, the same assurance is needed on a per-NUMA-node basis
to ensure optimal placement of domain memory on the correct NUMA node:

Add per-NUMA-node claims and add a new Hypercall to claim memory for
a domain using XEN_DOMCTL_claim_memory and xc_domain_claim_memory().

As we will implement multi-node claims as well, we updated the design
to be flexible for multi-node claims, so that a 2nd series can build
upon it without changing the hypercall API.

Bernhard Kaindl (6):
  xen/page_alloc: Simplify domain_adjust_tot_pages for future changes
  xen: New API to claim memory for a domain using XEN_DOMCTL_claim_memory

Alejandro Vallejo (1):
  xen/page_alloc: Remove `claim` from domain_set_outstanding_pages()

Alejandro Vallejo and Bernhard Kaindl (5):
  xen/page_alloc: Add static per-NUMA-node counts of free pages
  xen: Add node argument to
    domain_{adjust_tot_pages,set_outstanding_pages}()
  xen/page_alloc.c: Create per-node outstanding claims
  xen/page_alloc: Check per-node claims in alloc_heap_pages()

 tools/flask/policy/modules/dom0.te  |   1 +
 tools/flask/policy/modules/xen.if   |   1 +
 tools/include/xenctrl.h             |   4 +
 tools/libs/ctrl/xc_domain.c         |  42 ++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |   9 ++
 tools/ocaml/libs/xc/xenctrl.mli     |   9 ++
 tools/ocaml/libs/xc/xenctrl_stubs.c |  21 ++++
 xen/arch/x86/mm.c                   |   3 +-
 xen/arch/x86/mm/mem_sharing.c       |   4 +-
 xen/common/domain.c                 |  32 +++++-
 xen/common/domctl.c                 |   8 ++
 xen/common/grant_table.c            |   4 +-
 xen/common/memory.c                 |   6 +-
 xen/common/page_alloc.c             | 154 ++++++++++++++++++++++------
 xen/include/public/domctl.h         |  17 +++
 xen/include/xen/domain.h            |   2 +
 xen/include/xen/mm.h                |   6 +-
 xen/include/xen/sched.h             |   1 +
 xen/xsm/flask/hooks.c               |   3 +
 xen/xsm/flask/policy/access_vectors |   2 +
 20 files changed, 285 insertions(+), 44 deletions(-)

-- 
2.43.0


