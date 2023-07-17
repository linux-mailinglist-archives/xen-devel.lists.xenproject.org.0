Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F77566AB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564649.882235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPG-0001wI-PE; Mon, 17 Jul 2023 14:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564649.882235; Mon, 17 Jul 2023 14:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPG-0001u0-LQ; Mon, 17 Jul 2023 14:40:58 +0000
Received: by outflank-mailman (input) for mailman id 564649;
 Mon, 17 Jul 2023 14:40:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PMI=DD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLPPE-0001ez-Ns
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:40:56 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0ed431-24af-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:40:54 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so7148089e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 07:40:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b004fa52552c7csm2836284lfq.151.2023.07.17.07.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:40:53 -0700 (PDT)
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
X-Inumbo-ID: ef0ed431-24af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689604854; x=1692196854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBlRt/eLkcOx9/rMqbNC3rpBXs9fe5vg/Iz41dVCAXo=;
        b=R0OJOGSGMRA3L5xJ+g+VuuKu0HRCRpEVVse9yDLzxhrQiukS0imsKDGd/jfQ1bHFc6
         jxN/rG68t6fjg/txNQ9fbijDiq+As73FaRMH4sIaDfCQy5PwswRv6/Cy5R9Z+dI7+1qr
         9psyTc2Rq0in8QUM0S1X9yl4t8bI0lgpwhQv1y3bfdc8zByUwq+0Pzp2e696rpGnXY7h
         4VDlkbXpTFdfF/GDiZsP7TieFlQXWcHJIjCbXx1j09t468vnjafCLxXTcar57/ru/W0n
         Uca+GnxPV4qAQ9jTyLtXxLPHyR2mV3xC8zRAAfMd0sLvwruR0OVx5bMiyajnPBrMWZ8p
         /CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689604854; x=1692196854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBlRt/eLkcOx9/rMqbNC3rpBXs9fe5vg/Iz41dVCAXo=;
        b=lySPXmPM55/4kUb+xr2GoTpz9uiHQFHS3/+xY2gCypLTGTb/anvbmWN0tRnTdaC+A0
         OrP+K+bvy1a7HehovjX5eoqpYhlVeFxkWxFfEsl0NzlnYn10EG/TgAXYz9FNer+4QwB+
         d7JMNf0JQTOI/g+aVXLqlT4aILfzKrM3mI+fyS0uoJQKl/zPqESUuBruV+TsmbJU1RDi
         l9KOkJRJ9P0/hZsMUouBx5YOUBUEcnURrRhtLJricceZW/fWU/Dc4yynjk6VlmhHvSIf
         IDbLIzO/vk/3lYf39A8I3jwkFvmGXXrZmjQJDdpTPjK3UCdHLw1T54VpgMeupJFRtbz3
         4ibg==
X-Gm-Message-State: ABy/qLb3k1B5SBHpt2z5/vEp6VXLm65q/JkHZigdviNgyTnWCKr0nfD6
	jfqoWt5Cb+atcEPfix+y6rI696UUWviP+Key
X-Google-Smtp-Source: APBJJlGGmL52hKjGshCyBxap3Fa+CABXdk1a/uTuedrch+jlr9tf8MywdLBMlbuZBkudVs+Ko0NWNA==
X-Received: by 2002:a05:6512:39cb:b0:4fd:c884:51fc with SMTP id k11-20020a05651239cb00b004fdc88451fcmr235633lfu.58.1689604853382;
        Mon, 17 Jul 2023 07:40:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 0/3] xen/riscv: introduce identity mapping
Date: Mon, 17 Jul 2023 17:40:47 +0300
Message-ID: <cover.1689604562.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (3):
  xen/riscv: add SPDX tag to config.h
  xen/riscv: introduce function for physical offset calculation
  xen/riscv: introduce identity mapping

 xen/arch/riscv/include/asm/config.h |   2 +
 xen/arch/riscv/include/asm/mm.h     |   5 +-
 xen/arch/riscv/mm.c                 | 116 ++++++++++++++++++----------
 xen/arch/riscv/riscv64/head.S       |  36 +++++++++
 xen/arch/riscv/setup.c              |  14 +---
 xen/arch/riscv/xen.lds.S            |   4 +
 6 files changed, 125 insertions(+), 52 deletions(-)

-- 
2.41.0


