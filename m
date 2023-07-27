Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8F76553D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571116.894176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Bx-0003HN-3J; Thu, 27 Jul 2023 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571116.894176; Thu, 27 Jul 2023 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Bw-0003Fi-Uk; Thu, 27 Jul 2023 13:38:08 +0000
Received: by outflank-mailman (input) for mailman id 571116;
 Thu, 27 Jul 2023 13:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SoSB=DN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qP1Bv-0003FR-2o
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:38:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b9c76f-2c82-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 15:38:05 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b74310566cso14335671fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 06:38:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 l3-20020a2e7003000000b002b6bb68c7eesm341955ljc.110.2023.07.27.06.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:38:04 -0700 (PDT)
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
X-Inumbo-ID: d0b9c76f-2c82-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690465085; x=1691069885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLFQhZ4MoAbWExoRt/lnHk9NUwKJAZKhGplxZIedqks=;
        b=Pz30w7YB/U0NqCbWmQZs4VKFJ0BGGhAKXUIQU7GQCsXuxk785cVcWSLD8B420Exp2F
         PRp8HgbQAtgdy1/nIGwi1qzbZssmkGP25BpKewPYpObtzWY9FWEePaz+71Eh0dLrb9no
         e3jWH01LbZnx+XfPuvFSG5XmrMsZhK/7/gi8F2+b+Qupm3975kmHNHfA1fOKkT2tGrmg
         QMc20rqYrio2IkwcV2p4j2wC3h1t14R9tnIh1ySp8MWrxQq8JZr0Ipd5/QkEQBxE3OCF
         zpqOEBo+6gXTL7g6KLSq0fTgrAC3Ig9jtTnjhUDjeUuCn7C1NS5AepgUVjuRsdkHXKiw
         pryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690465085; x=1691069885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLFQhZ4MoAbWExoRt/lnHk9NUwKJAZKhGplxZIedqks=;
        b=NzoFKuduDjjre7mCI1DSs9senYiSnEUOYLCOscm8Xggi8f55dVC68VCe1HzUhn8k/t
         wG/Fd4+3ZHyBEfjhpBFRMk0Ve96P0K5bSypTY6hXsnoaKg508ePl7VQZEbZTBVluXPhL
         sSzeBzUcyWMER4wVsC/pz785YN+iXcRJnDKMapwidlvcHILILaT2b2tCY/ZQhCfZVdp3
         S6bVdp25DbZDywhvbwsyppoGd/qazHVCFCCxJXnzc//wS6g1JatIN5Hrbuagm+MFS/1n
         OZiEZZFbTrP36h+xSjHk1KMSYAf0Xec6VBZWV/HUoWdak1IhvaoSQFs3qHKgzO43xcui
         507w==
X-Gm-Message-State: ABy/qLZuI8vjFr7EIZm224aIs5HQcsB1qEidZyg+hsrb6Hz3qV9ea0xe
	X6uKGn5+Qtlr9NMWwPhxuOaXMGNFHLU=
X-Google-Smtp-Source: APBJJlFlz9hmN+9UTBVRefnETh6kvkgFGGKA9VS6a2AS4Pj4gIDuHKB80DyWydOc+dBOKeVips9xDw==
X-Received: by 2002:a2e:8182:0:b0:2b9:54e1:6711 with SMTP id e2-20020a2e8182000000b002b954e16711mr1620128ljg.7.1690465084461;
        Thu, 27 Jul 2023 06:38:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 0/2] xen/riscv: introduce identity mapping
Date: Thu, 27 Jul 2023 16:37:59 +0300
Message-ID: <cover.1690464789.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces things necessary to implement identity mapping:
  1. Make identity mapping for the entire Xen.
  2. Enable MMU.
  3. Jump to the virtual address world
  4. Remove identity mapping.

Also current patch series introduces the calculation of physical offset before
MMU is enabled as access to physical offset will be calculated wrong after
MMU will be enabled because access to phys_off variable is PC-relative and
in the case when linker address != load address, it will cause MMU fault.

The reason for this patch series can be found here:
https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/
---
Changes in V5:
	- update the algo of identity mapping removing.
	- introduce IDENT_AREA_SIZE.
	- introduce turn_on_mmu() function to enable and switch from 1:1 mapping.
	- fix typo in PGTBL_INITIAL_COUNT define.
	- update the comment above PGTBL_INITIAL_COUNT.
	- update prototype of calc_phys_offset(). now it returns phys_offset.
	- declare phys_offset as static.
	- save returned value of calc_phys_offset to register s2.
---
Changes in V4:
  - drop patch 	[PATCH v3 1/3] xen/riscv: add SPDX tag to config.h as it was
    merged to staging
  - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h> was introduced where these macros are located now.
	- update definition of PGTBL_INITIAL_COUNT
	- update the commit message for patch 'xen/riscv: introduce identity mapping'
	- update the comments in head.S
  - update the algo of identity mapping removing 
---
Changes in V3:
 - Update the patch series message.
 - The following patches were merged to staging so droped from the patch series:
   * xen/riscv: add .sbss section to .bss
   * xen/riscv: introduce reset_stack() function
   * xen/riscv: move extern of cpu0_boot_stack to header
   * xen/riscv: add SPDX tags
 - move save/restore of a0/a1 registers from patch 4 to patch 2 ( numbers are
   from the previous patch series version )
 - add SPDX tag in config.h
 - update definition of PGTBL_INITIAL_COUNT taking into account identity mapping.
 - refactor remove_identity_mapping() function.
 - add explanatory comments in xen.lds.S and mm.c.
---
Changes in V2:
 - update the patch series message.
 - drop patches from the previous version of the patch series:
   * xen/riscv: add __ASSEMBLY__ guards". ( merged )
   * xen/riscv: make sure that identity mapping isn't bigger then page size
     ( entire Xen is 1:1 mapped so there is no need for the checks from the patch )
 - add .sbss.* and put it befor .bss* .
 - move out reset_stack() to .text section.
 - add '__ro_after_init' for phys_offset variable.
 - add '__init' for calc_phys_offset().
 - declaring variable phys_off as non static as it will be used in head.S.
 - update definition of PGTBL_INITIAL_COUNT and the comment above.
 - code style fixes.
 - remove id_addrs array becase entire Xen is mapped.
 - reverse condition for cycle inside remove_identity_mapping().
 - fix page table walk in remove_identity_mapping().
 - save hart_id and dtb_addr before call MMU related C functions
 - use phys_offset variable instead of doing calcultations to get phys offset
   in head.S file. ( it can be easily done as entire Xen is 1:1 mapped now )
 - declare enable_muu() as __init.
 - Update SPDX tags.
 - Add Review-By/Suggested-By for some patches.
 - code style fixes.

Oleksii Kurochko (2):
  xen/riscv: introduce function for physical offset calculation
  xen/riscv: introduce identity mapping

 xen/arch/riscv/include/asm/config.h |   2 +
 xen/arch/riscv/include/asm/mm.h     |   7 +-
 xen/arch/riscv/mm.c                 | 107 ++++++++++++++++------------
 xen/arch/riscv/riscv64/head.S       |  46 ++++++++++++
 xen/arch/riscv/setup.c              |  14 +---
 xen/arch/riscv/xen.lds.S            |  11 +++
 6 files changed, 130 insertions(+), 57 deletions(-)

-- 
2.41.0


