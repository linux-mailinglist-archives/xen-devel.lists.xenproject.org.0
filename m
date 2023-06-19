Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE77358B4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551089.860412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1x-0000yz-Ms; Mon, 19 Jun 2023 13:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551089.860412; Mon, 19 Jun 2023 13:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1x-0000wR-JQ; Mon, 19 Jun 2023 13:34:53 +0000
Received: by outflank-mailman (input) for mailman id 551089;
 Mon, 19 Jun 2023 13:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF1w-0000wG-DY
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:52 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1152fa1f-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:51 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so1415838e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:49 -0700 (PDT)
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
X-Inumbo-ID: 1152fa1f-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181690; x=1689773690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu7fO1ZtUkyuZKkIlVGX4BqB+SbgpnWwL0oPy3HvOJ8=;
        b=BBhxKxmFj7+/dNMThwgIPQRUQMStVa6T9t14QMQa8S3fEd/0VBKShcoiYDIWOUvs25
         KKwPBS8CvFIqs4vMLHIaUS2bFZlGlPN5tfRqLf3h6TjjbdPp0Hf+M+nbockLqC93nc1v
         WS4Ghdvrja/79d4cNxyKc4Pt4WwbP2SHTdH+X2VrPWxjMWjaWrBrHFLyB5tp9zLwP9io
         ZabgztGuwI1UqwZYCLrZNNmtmCPm6C9B4XM2ZqeXo/GKtvchM/FJGGoailErj/IIC1nF
         cagvuEE2z7Jk0QLhH9LjUw0HLVWCOoWIkXpbdDHyyU096ThyYofmD6FhNKzpWWl/CLGL
         vRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181690; x=1689773690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu7fO1ZtUkyuZKkIlVGX4BqB+SbgpnWwL0oPy3HvOJ8=;
        b=cL7fu9FhVFMshvM+8Mz144wad/6oaSG/DluKHmUYZ3w/SaREx5TEhQvKUNMvynCKtA
         WZ/nxcaeZGwS5dPQcKZAzmZNQGzU8W72DJRT+Gwj2Rp9zRjU615thfMM2JqJJRAdiIUh
         9fPoAOWnU7oI3+6+KyYLYHmLJwu+/Bv2K590zmHmBZzPdMeLBBIgYeUj4ZoZwjl91t/t
         BCHPq0mGhWvlDQI+TshpdK48HVIAiPUVubeSlX3ZFAk/RtB2uf5JLv7VXXRMK30TaMQa
         xYFJp9Os733YUXUzEicyg3a79V6DO2XmpE3rvxulvoYuXjUQltBSjeyNi6Qvzw3PEqZL
         MPtw==
X-Gm-Message-State: AC+VfDzOtAvhBnaVABozoi2QPUt6J2DYC+shzM5PDnQZKzp6sG+SCjSA
	LGSC6qPxz5u//8nNID/AQCBNbqvqTmA=
X-Google-Smtp-Source: ACHHUZ5Xzd4NAKdGmb/+KnbZkBkIY4xf2wPnLW/slaGUuoI2okbCFqQF6E/wzR2FKjjl2VK+fFVzjQ==
X-Received: by 2002:a05:6512:1308:b0:4eb:4258:bf62 with SMTP id x8-20020a056512130800b004eb4258bf62mr5704548lfu.8.1687181690275;
        Mon, 19 Jun 2023 06:34:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 0/6] xen/riscv: introduce identity mapping
Date: Mon, 19 Jun 2023 16:34:41 +0300
Message-Id: <cover.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
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

One more thing that was done is:
  * Added SPDX tags.
  * move extern of cpu0_boot_stack to a header.

The reason for this patch series can be found here:
https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/

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

Oleksii Kurochko (6):
  xen/riscv: add .sbss section to .bss
  xen/riscv: introduce reset_stack() function
  xen/riscv: introduce function for physical offset calculation
  xen/riscv: introduce identity mapping
  xen/riscv: add SPDX tags
  xen/riscv: move extern of cpu0_boot_stack to header

 xen/arch/riscv/include/asm/config.h       |   2 +
 xen/arch/riscv/include/asm/current.h      |   2 +
 xen/arch/riscv/include/asm/early_printk.h |   2 +
 xen/arch/riscv/include/asm/mm.h           |   9 +-
 xen/arch/riscv/include/asm/page-bits.h    |   2 +
 xen/arch/riscv/include/asm/page.h         |   2 +
 xen/arch/riscv/include/asm/traps.h        |   2 +
 xen/arch/riscv/include/asm/types.h        |   2 +
 xen/arch/riscv/mm.c                       | 104 +++++++++++++---------
 xen/arch/riscv/riscv64/head.S             |  46 +++++++++-
 xen/arch/riscv/setup.c                    |  16 +---
 xen/arch/riscv/xen.lds.S                  |   2 +-
 12 files changed, 136 insertions(+), 55 deletions(-)

-- 
2.40.1


