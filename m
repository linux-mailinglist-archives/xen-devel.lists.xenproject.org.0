Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88F4CDC02
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284404.483666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU4-00029d-6z; Fri, 04 Mar 2022 18:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284404.483666; Fri, 04 Mar 2022 18:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU4-00026v-0Y; Fri, 04 Mar 2022 18:16:56 +0000
Received: by outflank-mailman (input) for mailman id 284404;
 Fri, 04 Mar 2022 17:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC20-0005R4-JV
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:47:56 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384b1cee-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:47:54 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC1w-0008PA-Hf; Fri, 04 Mar 2022 18:47:53 +0100
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
X-Inumbo-ID: 384b1cee-9be3-11ec-8eba-a37418f5ba1a
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>
Subject: [PATCH 00/36] Arm cache coloring
Date: Fri,  4 Mar 2022 18:46:25 +0100
Message-Id: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared caches in multi-core CPU architectures represent a problem for
predictability of memory access latency.  This jeopardizes applicability
of many Arm platform in real-time critical and mixed-criticality
scenarios.  We introduce support for cache partitioning with page
coloring, a transparent software technique that enables isolation
between domains and Xen, and thus avoids cache interference.

When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
the user to define assignments of cache partitions ids, called colors,
where assigning different colors guarantees no mutual eviction on cache
will ever happen.  This instructs the Xen memory allocator to provide
the i-th color assignee only with pages that maps to color i, i.e. that
are indexed in the i-th cache partition.

The proposed implementation supports the dom0less experimental feature.
The solution has been tested in several scenarios, including Xilinx Zynq
MPSoCs.


Overview of implementation and commits structure
------------------------------------------------

- Coloring support is added for dom0 and domU by defining the core
  logic, as well as the hardware inspection functionalities used for
  getting needed coloring information [4-17].
- A new memory page allocator that implement the cache coloring
  mechanism is introduced.  The allocation algorithm follows the given
  coloring scheme specified for each domain, and maximizes contiguity in
  the page selection [18-21].
- Coloring support is added to Xen .text region [22-29], as well as to
  dom0less domains [30].
- Extensive documentation details the technique and gently explains
  usage [33-36].


Known limitations
-----------------

- We need to bring back [1-3] the relocation feature in order to move
  Xen memory to a colored space where the hypervisor could be isolated
  from VMs interference.
- When cache coloring is used, static memory assignment is disabled to
  avoid incompatibility. [31]
- Due to assert failure [32], the number of supported colors is
  currently limited at 64, which should be satisfactory for most chips.
  In particular, the problem lies in the cache coloring configuration
  data structure that belongs to each domain.  We are aware that this is
  not a clean solution but we hope that this could be discussed and
  solved within this pull request.


Acknowledgements
----------------

This work is sponsored by Xilinx Inc., and supported by University of
Modena and Reggio Emilia and Minerva Systems.

***

Luca Miccio (36):
  Revert "xen/arm: setup: Add Xen as boot module before printing all
    boot modules"
  Revert "xen/arm: mm: Initialize page-tables earlier"
  xen/arm: restore xen_paddr argument in setup_pagetables
  xen/arm: add parsing function for cache coloring configuration
  xen/arm: compute LLC way size by hardware inspection
  xen/arm: add coloring basic initialization
  xen/arm: add coloring data to domains
  xen/arm: add colored flag to page struct
  xen/arch: add default colors selection function
  xen/arch: check color selection function
  xen/include: define hypercall parameter for coloring
  xen/arm: initialize cache coloring data for Dom0/U
  xen/arm: A domain is not direct mapped when coloring is enabled
  xen/arch: add dump coloring info for domains
  tools: add support for cache coloring configuration
  xen/color alloc: implement color_from_page for ARM64
  xen/arm: add get_max_color function
  Alloc: introduce page_list_for_each_reverse
  xen/arch: introduce cache-coloring allocator
  xen/common: introduce buddy required reservation
  xen/common: add colored allocator initialization
  xen/arch: init cache coloring conf for Xen
  xen/arch: coloring: manually calculate Xen physical addresses
  xen/arm: enable consider_modules for coloring
  xen/arm: bring back get_xen_paddr
  xen/arm: add argument to remove_early_mappings
  xen/arch: add coloring support for Xen
  xen/arm: introduce xen_map_text_rw
  xen/arm: add dump function for coloring info
  xen/arm: add coloring support to dom0less
  Disable coloring if static memory support is selected
  xen/arm: reduce the number of supported colors
  doc, xen-command-line: introduce coloring options
  doc, xl.cfg: introduce coloring configuration option
  doc, device-tree: introduce 'colors' property
  doc, arm: add usage documentation for cache coloring support

 docs/man/xl.cfg.5.pod.in              |  14 +
 docs/misc/arm/cache_coloring.rst      | 191 +++++++++++
 docs/misc/arm/device-tree/booting.txt |   3 +
 docs/misc/xen-command-line.pandoc     |  51 ++-
 tools/libs/light/libxl_arm.c          |  11 +
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_parse.c                   |  59 +++-
 xen/arch/arm/Kconfig                  |   6 +
 xen/arch/arm/Makefile                 |   2 +-
 xen/arch/arm/alternative.c            |   8 +-
 xen/arch/arm/coloring.c               | 469 ++++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |  56 +++
 xen/arch/arm/domain_build.c           |  42 ++-
 xen/arch/arm/include/asm/coloring.h   |  98 ++++++
 xen/arch/arm/include/asm/mm.h         |  18 +-
 xen/arch/arm/mm.c                     | 245 +++++++++++++-
 xen/arch/arm/psci.c                   |   4 +-
 xen/arch/arm/setup.c                  |  94 +++++-
 xen/arch/arm/smpboot.c                |  19 +-
 xen/common/page_alloc.c               | 321 +++++++++++++++++-
 xen/common/vmap.c                     |   4 +-
 xen/include/public/arch-arm.h         |   8 +
 xen/include/xen/mm.h                  |   7 +
 xen/include/xen/sched.h               |   4 +
 xen/include/xen/vmap.h                |   2 +
 25 files changed, 1689 insertions(+), 48 deletions(-)
 create mode 100644 docs/misc/arm/cache_coloring.rst
 create mode 100644 xen/arch/arm/coloring.c
 create mode 100644 xen/arch/arm/include/asm/coloring.h

-- 
2.30.2


