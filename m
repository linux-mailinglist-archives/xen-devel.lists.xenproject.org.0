Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDA6B47C60
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114122.1461276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI35-0008EJ-QZ; Sun, 07 Sep 2025 16:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114122.1461276; Sun, 07 Sep 2025 16:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI35-0008Bu-NW; Sun, 07 Sep 2025 16:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1114122;
 Sun, 07 Sep 2025 16:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI34-0008Bo-Nn
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:15:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcd7729c-8c05-11f0-9d13-b5c5bf9af7f9;
 Sun, 07 Sep 2025 18:15:25 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afeec747e60so683260166b.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:15:25 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:15:24 -0700 (PDT)
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
X-Inumbo-ID: dcd7729c-8c05-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261725; x=1757866525; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ezfHQkZRgwNN2gzCEv+A/jxev3TmSiaVQoYBLd7h10=;
        b=FTlmOSDXzt4ldWlKu+LaekPrneSIWzgehubBg0f42exHUymL/W3nflMmVUZWuw2adX
         1Q6i1NyfnmdqQLl0Po6IhV4hFjiJ5BTWzvQBwBsAbvaRFVKjUmV4d7hUg4Wb9kABNetT
         LeZWuMT3e5BI0v4rVthH62+oa1QT6lgksg/Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261725; x=1757866525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ezfHQkZRgwNN2gzCEv+A/jxev3TmSiaVQoYBLd7h10=;
        b=M/sP46RShGOs+oKrFEu5n4clip9Vm798krH0ZPqXloH+l2TvZEpriktUQD2sZ/1iLA
         m9SEZHrdmoJrba+q1TiPUmaHvxNh/td2Jv6TwZFT7ks3g+2v6IRY4iYsE/WOVA16s21c
         MbQjqYXiqENch3kDY81BDz7bf6mL419p8ZXiGxjnZ0VQ13bhpW+woBL9E56NVbh0O48n
         7QQu3L0WeX+siF557Ej4NpKYmoi9EP6KAR+1eKxe3B387yPsPYhx4uk+OHPKTjDoFnrE
         lf2TgfWm8N4oSj0LezeIkiSkq9ou62BjjTFERRV9b0cu0k9aUaKjJp9kBJ6xoXqQTp52
         xWIA==
X-Gm-Message-State: AOJu0Yz17Gw3o6gXoiKeh2bwaivssGkCTmUXBxicR3ZKW6C7nagsrSxj
	r1WntB7rpirhKI8wFLHbXQZ1aMtVI+PHX1ni0viRQSp0xIkLksOqOpkaHlSuCKZiZt1nPQGo0Rr
	C48bp620=
X-Gm-Gg: ASbGncvDau3SljdIKS0eJ+C/U1jpsWoCdEhFiuwo8o40f8+hHsCn9gIwzUmBoljv/ui
	lk0hVzHyARTI9RG1C8/qqltmi0B9XK/gveOSnzpdRA8fgSnhdmky0ZmSVDbcfIf8p8o4VlIdeFK
	IQmtW3d8wJHodNTs7/zpOaPCl6lcB1/leqfZi0vXEiT2EKWUq4mzP2klHOsN49MyN6eTqwVycPw
	Ku/4IOx54A7Ra4EQ1e6Q6GkAKmbJtZcV7tbdGnoHLjxQ55V0dVRwq0pOlCcIB5wdOIxPhrzgQMG
	wxefyDNLaXX9bgsXiX8nBY5VVCKp42qiowAFy1/NFjxY9jMvlIp1veclQMrMgxPLU9zxPYFCOmH
	Gd2/PTqE6Am5lMbF8AjGbd8beeKS+f0YbO/ejjugs/HjCn/McGhUDvmq0ye+2pAkiUNi8kGNl7m
	3RJAd0BLXXyG8O
X-Google-Smtp-Source: AGHT+IFK1Pe3+ZYgImGiwkHHpHKoJBnz9eqq7tqStkhMp5Zv+TvNnMxmS4N/sanA+hcxJlqlDcJlRA==
X-Received: by 2002:a17:907:983:b0:b04:8420:b6ef with SMTP id a640c23a62f3a-b04b16d713bmr515034466b.61.1757261724844;
        Sun, 07 Sep 2025 09:15:24 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v3 0/7] NUMA: Add per-node domain-memory claims
Date: Sun,  7 Sep 2025 18:15:15 +0200
Message-ID: <cover.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XEN_DOMCTL_claim_memory - New Hypercall to claim memory for a domain
to improve NUMA awareness when allocating its system memory.

In tests with AMD Genoa, we achived 22% higer VM density compared
to spreading memory across all NUMA nodes for the same Speedometer
web application benchmark score, so this can enable significant
savings for server hosting (more details below).

The author of v1 is Alejandro Vallejo (he moved to AMD since).
Six months have passed, and the last review comment that I found
for it was 2 months ago.

General introduction:
---------------------

Xen supports claiming an amount of memory for a domain ahead of
allocating it to ensure that it is available for allocation.

On NUMA hosts, the same assurance is needed on a per-NUMA-node basis
to ensure optimal placement of domain memory on the correct NUMA node:

Performance test results:
-------------------------

Using "bootstorm" tests, when large VMs are booted in parallel.
Unless carefully planned, memory may be allocated on remote NUMA nodes.
It increases the memory latency experienced by applications and
degrades their performance.

NUMA claims allow for ensuring that all memory for a domain can be
allocated on the claimed NUMA node. We achieved a 15% improvement
in Speedometer performance tests and a 22% increase in VMs on AMD
Genoa while maintaining the same Speedometer score compared to
spreading the system memory of the domains across all NUMA nodes.

One out of 5 to 7 servers is not needed and could serve extra capacity.
Server and server room upgrades can be delayed, and money paid
for hosting and/or running servers can be saved.

Principle of operation:
-----------------------

Besides the NUMA node claim, host-wide exist already
and are implemented in libxl and libxenguest as well:

1. Call domain_create(); the claim is associated with this domain only.

2. Claim the needed amount of memory

   domain_set_outstanding_pages():

   - Sets d->outstanding_claims to the claimed memory
     (and with this series, also sets d->claim_node to the node)

   - Adds the new claim to per_node(outstanding_claims), with this series
   - Adds the new claim to the host-wide outstanding_claims
  
   - This prevents get_free_buddy() from allocating from NUMA nodes.
     When the amount of unclaimed memory is lower than the given request
     unless the memory is allocated for a domain with sufficient claim

3. Allocate for the domain

   alloc_heap_pages() and get_free_buddy():

   - If d->outstanding_claims is sufficient for the allocation
     (and with this series, d->claim_node matches the node the alloc from).
     Then, the allocation may continue on the node.

     domain_adjust_tot_pages() consumes part of the allocated amount:

     - Reduces d->outstanding_claims
     - Reduces per_node(outstanding_claims), with this series
     - Reduces the host-wide "outstanding_claims" variable
  
4. Cancel a possible leftover claim
5. Finish building the domain and unpause it to let it boot

We will implement multi-node claims as well, and I updated the design
to be more flexible to prepare for multi-node claims. This new hypercall
API supports multi-node claims, but the internal changes needed are
beyond what is feasible for this implementation to introduce node claims.

Overview the changes since v1:
------------------------------

Following the review's suggestion, patches should be consolidated
by the functionality they implement and not split into preparatory
changes without any function.

I agree with this change:

It makes the progression of the patches more logical to follow
as each patch serves a tangible purpose. Yes, this makes comparing
previous review comments more difficult, but the benefit of a more
consolidated series outweighs that of course.

I used Patchew (links below) to find any review comments as as some
comments were only posted 2 months ago, while the series was posted
6 months ago.

Having undergone this refactor, it may be more appropriate
to consider this submission for warranting fresh review.

More details on the changes in commits:
---------------------------------------

- #1 is new: Implemented the suggestion from review for per_node()
- #2 was new as v2#1 (moved it as here as #1 is more important)
- #3 has only minor adjustments from review and do use per_node()
- #4, has many changes and expanded comments to answer
      and explain questions that were raised while reviewing it.
      A small hunk from it was moved to #6, as it forms the basis
      of the rewritten 6/7.
- #6 was refactored with new code from v2 to fix an issue.
- #7 is unchanged after adding it in v2 as the new hypercall.

Where the old code moved:

- v1#1 is removed as the review said to remove it.
  (The #define was moved to where it is used)
- v1#2 is merged into #4 to consolidate the patches for the same code.
- v1#3 is split into #4 and #5 as per the review suggestion to move code.
- v1#4 received the parts of #5 related to staking NUMA claims.
- v1#5 was split into #3 and #4 and got the changes for adjust_tot_pages()
- v1#6 was refactored with code to fix an issue to protect the claims
- v1#7 is removed as setting the d->node_affinity
  caused Xen panics due to a locking issue (diagnosed by Roger).
  Setting d->node_affinity does not claim pages that should not have been included in the submitted series.
- v1#8 is removed as I switched to the new hypercall requested by Roger.
- v1#9-11 are removed for the same reason:

  For NUMA-node claims, we no longer pass a single NUMA node
  when we want to consume the claimed memory. Instead,
  d->node_affinity mask is already used when allocating
  by get_free_buddy(). Likewise, there is also no further
  use for claim_on_node in xl.cfg

I hope that this gives a good overview of the changes.
These are the Patchew links I used to check for review comments:

v1: https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
v2: https://patchew.org/Xen/cover.1755341947.git.bernhard.kaindl@cloud.com/

Personal message:
-----------------

As I haven't posted any "hello" message yet, I think it is necessary that
I also write about myself: I worked on the Linux kernel and other things
like the SLES for S/390 and zSeries (IBM mainframe) for S.u.S.E.
Afterwards, I ported Linux (including the kernel and bootloaders) to a tested,
certified and assessed safety infrastructure that ensures your safety when
travelling by rail on tracks with track-side infrastructure built by one of
the two largest rail infrastructure companies worldwide.


Bernhard Kaindl (7):
  xen/numa: Add per_node() variables paralleling per_cpu() variables
  xen/page_alloc: Simplify domain_adjust_tot_pages() further
  xen/page_alloc: Add and track per_node(avail_pages)
  xen/page_alloc: Add staking a NUMA node claim for a domain
  xen/page_alloc: Pass node to adjust_tot_pages and check it
  xen/page_alloc: Protect claimed memory against other allocations
  xen: New hypercall to claim memory using XEN_DOMCTL_claim_memory

 tools/flask/policy/modules/dom0.te  |   1 +
 tools/flask/policy/modules/xen.if   |   1 +
 tools/include/xenctrl.h             |   4 +
 tools/libs/ctrl/xc_domain.c         |  42 +++++++
 tools/ocaml/libs/xc/xenctrl.ml      |   9 ++
 tools/ocaml/libs/xc/xenctrl.mli     |   9 ++
 tools/ocaml/libs/xc/xenctrl_stubs.c |  21 ++++
 xen/arch/arm/xen.lds.S              |   1 +
 xen/arch/ppc/xen.lds.S              |   1 +
 xen/arch/riscv/xen.lds.S            |   1 +
 xen/arch/x86/mm.c                   |   3 +-
 xen/arch/x86/mm/mem_sharing.c       |   4 +-
 xen/arch/x86/xen.lds.S              |   1 +
 xen/common/domain.c                 |  31 +++++-
 xen/common/domctl.c                 |   8 ++
 xen/common/grant_table.c            |   4 +-
 xen/common/memory.c                 |  18 ++-
 xen/common/numa.c                   |  53 ++++++++-
 xen/common/page_alloc.c             | 163 ++++++++++++++++++++--------
 xen/include/public/domctl.h         |  17 +++
 xen/include/xen/domain.h            |   2 +
 xen/include/xen/mm.h                |   5 +-
 xen/include/xen/numa.h              |  15 +++
 xen/include/xen/sched.h             |   1 +
 xen/include/xen/xen.lds.h           |   8 ++
 xen/xsm/flask/hooks.c               |   3 +
 xen/xsm/flask/policy/access_vectors |   2 +
 27 files changed, 370 insertions(+), 58 deletions(-)

-- 
2.43.0


