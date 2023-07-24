Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D075EF50
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568524.887906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5X-0005Vc-NS; Mon, 24 Jul 2023 09:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568524.887906; Mon, 24 Jul 2023 09:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5X-0005Sq-K0; Mon, 24 Jul 2023 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 568524;
 Mon, 24 Jul 2023 09:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNs5W-0005Se-FQ
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:42:46 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 713d5922-2a06-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:42:45 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5222a38c0a0so1680394a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:42:45 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c04a000000b0050488d1d376sm6020958edo.0.2023.07.24.02.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:42:44 -0700 (PDT)
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
X-Inumbo-ID: 713d5922-2a06-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690191764; x=1690796564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atMf0boHnIDUMnp3fd3QiPuot2gD1j1rH3B7h89Bipc=;
        b=iwMKx/KGXjSviZGRRPpo0T2dfiq7xFRcJNagfm/AS9csAKWjxwWDTwoYO5yICdW17H
         9odFJltVKDZohCuOFBDegmpfbqMWM+UJ8LWfivC/mkbeJe7drsIziYqOQbFtONRc54fl
         j0Jj52guPteiBQeFnQwpowOnzoq5euaHPeoamG2TXCUqJzBpX1ml4TYUVHFSN0LogmO4
         c9NZL8umyAZYYNABOzLa5xnPeM99HO7aL881WlDVCYz6VZY65+8JLsrw/mL57kjwBFFM
         Q28RSAKDrIG+heHUsOQZmdz88CJYTo+OKqLkrcw9SswlucUoqfTvEyH3t2HqoIJ+GAUy
         VYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191764; x=1690796564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atMf0boHnIDUMnp3fd3QiPuot2gD1j1rH3B7h89Bipc=;
        b=Y/wp1rZZsOYlU/5VVWrckYnKfS6Wny788MY80afHqsLXv6HY6/V84QZi1xk5gRsnc9
         t3Po5DSmNWKhUYn0OIXKkACjm0VPtq2pfE+3pgAm0BKefSU5HCpX49Qc4s1JDGeXAMMs
         8y4KNsYjXRSUznX9xN2XkJc5X0imCtQvwy0Am5KwotlmvRD4X+s/FhWy6awTXyLS5kL8
         IwIn/nZypd9xqkzVJLkghB1lLBr7WgvPqEyIJYxy6oAW1cjHBMYN7/kJlDmTp63DKBYY
         XcAnicqpHhYyKcH60ojQY9ms2497qRBpUX0n6M5Rd8VO7cKMSKFdURAwyA+IauyLAJLw
         6LFQ==
X-Gm-Message-State: ABy/qLaGU5gu2WTyA1wJOqOnvzZtn5NXuRcTKFKwrvqazuciJFDU3c8L
	IAihuIQ5dyYIJZogKfdWpSpeJn1H1PM=
X-Google-Smtp-Source: APBJJlEmmBTAw9xXG5+Uo5eKgCwAM77yuHXVFShWrBTPwZJ/XPIV4auwJZNmXa/KaXBxf+Go5s9r1w==
X-Received: by 2002:a05:6402:742:b0:522:1dcb:c355 with SMTP id p2-20020a056402074200b005221dcbc355mr5191692edy.16.1690191764407;
        Mon, 24 Jul 2023 02:42:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 0/2] xen/riscv: introduce identity mapping
Date: Mon, 24 Jul 2023 12:42:39 +0300
Message-ID: <cover.1690191480.git.oleksii.kurochko@gmail.com>
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

 xen/arch/riscv/include/asm/mm.h |   5 +-
 xen/arch/riscv/mm.c             | 119 +++++++++++++++++++++-----------
 xen/arch/riscv/riscv64/head.S   |  35 ++++++++++
 xen/arch/riscv/setup.c          |  14 +---
 xen/arch/riscv/xen.lds.S        |   4 ++
 5 files changed, 123 insertions(+), 54 deletions(-)

-- 
2.41.0


