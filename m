Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A376B77D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574250.899524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqOt-0007Y4-4E; Tue, 01 Aug 2023 14:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574250.899524; Tue, 01 Aug 2023 14:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqOt-0007V0-1S; Tue, 01 Aug 2023 14:31:03 +0000
Received: by outflank-mailman (input) for mailman id 574250;
 Tue, 01 Aug 2023 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpAT=DS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qQqOr-0007Uu-Ry
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:31:01 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a5b33a-3078-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:30:59 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso5058654e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 07:30:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q28-20020ac24a7c000000b004fbac025223sm2568051lfp.22.2023.08.01.07.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 07:30:55 -0700 (PDT)
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
X-Inumbo-ID: 08a5b33a-3078-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690900259; x=1691505059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DphTfRycXy0USz4kNo5pnBYhh0AwrgYUK+qSbwAz5Wo=;
        b=dPokXKpRWLy+t7BlH3OfFOZXgq1LwTRBcXqicB6tWiHtEJm/3L6bv4IccL0pH1eO0x
         b7i6pH9cIxjSb3YukDP6XYbHWDYBHQs/cmTcJ8UvWsGOvxO24VX19dmnMHDMpTSXfCZU
         Mj7qrjGhPWTMbstW84c1T5hAjtAYF0/YrZcC97Fye+JiRO12LmSlzlP2vaiO/ec3SYtC
         FxBknJlr/NmF7vp6XRV8NExesbrX5sOeQseseEK3d4x2VTSjO4nQh2c0BPFZTnNqEtka
         68faSd3oKOQfwdCXxpIvaUo5t2ST6HkhGU1/jSNAijLa1MOFhHov6RXLgGUhG9LZnIj3
         vF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690900259; x=1691505059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DphTfRycXy0USz4kNo5pnBYhh0AwrgYUK+qSbwAz5Wo=;
        b=ZYrfO7aBTJRQyI0QaK3d+XJ3EbnMe6d/QRcRkVqHnVY/kr9r2R6SGa/DzDGl+K9qvB
         itoWcAGsRYiP8H32uoC8pObueV1C6jPxXNykpqN6kny7oO+JOFneA3mf180FZF8OdDjk
         kvuo3RFRarXh9+G3EGJZDm7WZPbXf1iyq05XdCMmvhna2S4dOoeAKpiCi9/rkOZ29Nc+
         Gtlux+rP7le6vbguyKC/6OyspMZOty/+XdYoMhg4Dis9FsB47K2059+C3qi2uIR9MNQn
         VCoFya2ZLnjgkwkGUOmvvbr3RFBavSoMvq4nf+r3oYqbPC9pizGfSwc0mqyf8nUhYm+I
         WHHQ==
X-Gm-Message-State: ABy/qLZrRWfKPrxlPUdVWETjPZee8OcAkvGbqsJq4DFRhsrWrWov0q8N
	1sKzVCInR56+X0BgNLwwEh3aVLtN3vk=
X-Google-Smtp-Source: APBJJlE7LbUx9Yu5LJbLc0bJ3jJKrRbps3MEvTpQJ5vfGEUwaOxXCE0oHmc0cvm3DC7M3Zg1sXIOlA==
X-Received: by 2002:a19:9119:0:b0:4fe:3364:6c20 with SMTP id t25-20020a199119000000b004fe33646c20mr2033117lfd.16.1690900258405;
        Tue, 01 Aug 2023 07:30:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 0/2] xen/riscv: introduce identity mapping
Date: Tue,  1 Aug 2023 17:30:48 +0300
Message-ID: <cover.1690899325.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
  - Update calc_phys_offset() after rebase.
  - Refactor turn_on_mmu() and a way how an argument of turn_on_mmu() is
    calculated.
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
 xen/arch/riscv/mm.c                 | 109 +++++++++++++++++-----------
 xen/arch/riscv/riscv64/head.S       |  44 +++++++++++
 xen/arch/riscv/setup.c              |  14 +---
 xen/arch/riscv/xen.lds.S            |  11 +++
 6 files changed, 130 insertions(+), 57 deletions(-)

-- 
2.41.0


