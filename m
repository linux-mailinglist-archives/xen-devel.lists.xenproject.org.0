Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEC5A2801
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393752.632875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYnx-00015a-8r; Fri, 26 Aug 2022 12:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393752.632875; Fri, 26 Aug 2022 12:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYnx-00013S-64; Fri, 26 Aug 2022 12:51:21 +0000
Received: by outflank-mailman (input) for mailman id 393752;
 Fri, 26 Aug 2022 12:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYnv-00013M-PJ
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:20 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c67fd842-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:17 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id fy31so2560692ejc.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:17 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:15 -0700 (PDT)
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
X-Inumbo-ID: c67fd842-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=w7anbcV2QZVfbnCBeif33zndmcQWCVi7jrhRxxDTd2w=;
        b=28VylTgOU+Mpmo+Hb/iPi/LwRDDdA2OhFuBEUQNte0g05tF63c+5EpqiXwQXgjAIdT
         IXeVcezUY1Cw+v/UDJrmgtVr9ABwxbdBLPDLnLwj3fkRPAdYEDw0S4T0wl6Dsy+l3aO4
         vAVZtfUdG4kfdVV69utj3pIaIjSe/PhGkWC8/uo0bVeDS7eeh9wi3fvzXHdIioV4HiMx
         J71uag3QesnZ4B/gVPD+vmfB8lDs7BQyW0b50VQvOcX8wJ9CKRwTj1HzyCXYx/fSyymW
         cHEHu96DxLUAa17+DYLCzRPefj2SiQSH4vjAYp9GYjIHWe5sQmvkIxUXkdhfj4Lz8oUs
         8p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=w7anbcV2QZVfbnCBeif33zndmcQWCVi7jrhRxxDTd2w=;
        b=N7rAcsFvfajRqrHOpQEGRkxCBYMEmDZOOa8wBz0+vlnDQJ13exRZiNTwNDuuw2BFh7
         hEw9yszNhY6vXfpg3NJH+1JNSWyK+iBe3cbjFKgxBj7MuLGON+kp1MX6ddLEO5+UCKWK
         ZyBqxZ5gq91EiQ9YeDhMb3MC7RCH8xoDNf3gxMszVHMeNIC1nsFDhtJgfzDzPfXyZI0b
         Pi19fYa3HnX4XPTDMGNcpygMkjcrbrVX+qJGgnW8GaHP920axUEMPPgOL8ez+Qz6Srmu
         DaGcwSIGC4/R1XxRwq5DveelF9uwWD7k9AlNIroCL6CQ+9pNz+Nn1XOVkUO/uWe0CJ1y
         Uacg==
X-Gm-Message-State: ACgBeo1nL1RK4TV1L4lFdsvB4QrM8R1tf4ljw4mbd1+l3JB4c0yZzlmR
	+6mLtAoCKjtP/krC6SbQ7LeljyxzRYVVzA==
X-Google-Smtp-Source: AA6agR6Q4jLj1soCau8I2FiNjMEeWkJM8yAsxOwp9jUGBOFIO7FMXZuAttZXA6htMGAxjkrYNHoEDA==
X-Received: by 2002:a17:906:7950:b0:73d:6cda:939e with SMTP id l16-20020a170906795000b0073d6cda939emr5507492ejo.148.1661518276056;
        Fri, 26 Aug 2022 05:51:16 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH 00/12] Arm cache coloring
Date: Fri, 26 Aug 2022 14:50:59 +0200
Message-Id: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
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
The solution has been tested in several scenarios, including Xilinx Zynq
MPSoCs.

Overview of implementation and commits structure
------------------------------------------------

- [1-3] Coloring initialization, cache layout auto-probing and coloring
  data for domains are added.
- [4-5] xl and Device Tree support for coloring is addedd.
- [6-7] A new page allocator for domain memory that implement the cache
  coloring mechanism is introduced.
- [8-12] Coloring support is added for Xen .text region.

Changes in v2
-------------

Lot of things changed between the two versions, mainly I tried to follow
all the comments left by the maintainers after the previous version review.
Here is a brief list of the major points (even if, imho, it's easier to
repeat all the review process):

 - One of the easiest change to spot is the reduced number of patches in the
   series. A lot of problems of bad splitting of commits where present before
   (documentation only in last commits, functionalities firstly introduced
   and later used in other commits, etc).
 - Definition of LLC (Last Level Cache) as the place where coloring applies
   should be more consistent throughout all the series (documentation and
   cache layout auto-probing code).
 - Kconfig option to let configure the maximum number of cache colors.
 - Only one kind of syntax to specify color configurations.
 - Only arrays to store colors (no more need for bitmaps).
 - No more limitations on the max number of colors (previously, because of
   a static assert failure, it was limited to 64).
 - Kconfig option to let configure the buddy allocator reserved size.
 - Removed the duplicated version of setup_pagetables.
 - No more need to expose vm_alloc function as non-static.

Open points and possible problems
---------------------------------

- The way xl passes user space memory to Xen it's adapted from various 
  points of the xl code itself (e.g. xc_domain_node_setaffinity) and it
  works, but it really needs attention from expert maintainers since 
  I'm not completely sure this is the correct way of doing things.
- We still need to bring back the relocation feature (part of) in order
  to move Xen memory to a colored space where the hypervisor could be
  isolated from VMs interference (see the revert commit #10 and the
  get_xen_paddr function in #12).
- Revert commits #8 and #9 are needed because coloring has the command
  line parsing as a prerequisite for its initialization and
  setup_pagetables must be called after it in order to color the Xen
  mapping. The DTB mapping is then added to the boot page tables instead
  of the Xen ones. Probably the way this is done is a bit simplistic.
  Looking forward for comments on the subject.
- A temporary mapping of the old Xen code (old here means non-colored)
  is used to reach variables in the old physical space so that secondary
  CPUs can boot. There were some comments in the previous version on that
  because the mapping is available for all the CPUs while only CPU0 is
  the one supposed to access it. I'm not sure how to temporarily mapping
  things only for the master CPU.
- A lot of #ifdef for cache coloring are introduced because I prefer to
  define functions only if they are actually needed. Let me know if you
  prefer a different approach.
- Julien posted an RFC to address a problem with the switch_ttbr function.
  For the moment I haven't considered it since it's still a work in progress.

Acknowledgements
----------------

This work is sponsored by Xilinx Inc., and supported by University of
Modena and Reggio Emilia and Minerva Systems.


Carlo Nonato (10):
  xen/arm: add cache coloring initialization
  xen/arm: add cache coloring initialization for domains
  xen/arm: dump cache colors in domain info debug-key
  tools/xl: add support for cache coloring configuration
  xen/arm: add support for cache coloring configuration via device-tree
  xen/common: add cache coloring allocator for domains
  xen/common: add colored heap info debug-key
  Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
  xen/arm: add Xen cache colors command line parameter
  xen/arm: add cache coloring support for Xen

Luca Miccio (2):
  Revert "xen/arm: setup: Add Xen as boot module before printing all
    boot modules"
  Revert "xen/arm: mm: Initialize page-tables earlier"

 docs/man/xl.cfg.5.pod.in              |  10 +
 docs/misc/arm/cache-coloring.rst      | 201 ++++++++++++++
 docs/misc/arm/device-tree/booting.txt |   4 +
 docs/misc/xen-command-line.pandoc     |  45 ++++
 tools/libs/light/libxl_create.c       |  12 +
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_parse.c                   |  52 +++-
 xen/arch/arm/Kconfig                  |  28 ++
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/alternative.c            |   5 +
 xen/arch/arm/coloring.c               | 367 ++++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |  14 +
 xen/arch/arm/domain_build.c           |  22 +-
 xen/arch/arm/include/asm/coloring.h   |  60 +++++
 xen/arch/arm/include/asm/config.h     |   4 +-
 xen/arch/arm/include/asm/domain.h     |   4 +
 xen/arch/arm/include/asm/mm.h         |  22 +-
 xen/arch/arm/include/asm/processor.h  |  16 ++
 xen/arch/arm/mm.c                     | 144 ++++++++--
 xen/arch/arm/psci.c                   |   4 +-
 xen/arch/arm/setup.c                  |  90 ++++++-
 xen/arch/arm/smpboot.c                |   3 +-
 xen/arch/arm/xen.lds.S                |   2 +-
 xen/common/page_alloc.c               | 237 ++++++++++++++++-
 xen/common/vmap.c                     |  25 ++
 xen/include/public/arch-arm.h         |   8 +
 xen/include/xen/vmap.h                |   4 +
 27 files changed, 1333 insertions(+), 52 deletions(-)
 create mode 100644 docs/misc/arm/cache-coloring.rst
 create mode 100644 xen/arch/arm/coloring.c
 create mode 100644 xen/arch/arm/include/asm/coloring.h

-- 
2.34.1


