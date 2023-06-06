Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4E724D91
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544185.849773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm3-0002vR-Jb; Tue, 06 Jun 2023 19:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544185.849773; Tue, 06 Jun 2023 19:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm3-0002tl-Gn; Tue, 06 Jun 2023 19:55:23 +0000
Received: by outflank-mailman (input) for mailman id 544185;
 Tue, 06 Jun 2023 19:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm2-0002er-DG
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:22 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e4a760-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:20 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3bb395e69so8248842e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:18 -0700 (PDT)
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
X-Inumbo-ID: 10e4a760-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081319; x=1688673319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfn7sIE+CNXRBIEchH6s4LYuBRt7W2O5O+bU9eogZ74=;
        b=h/CYHpeXqTPq6RFrth593rV82N0KLDbZfhy8xMPlztCj8w++4cHOguUSTNaizP/QmB
         p+DGkWnvU8JygPnTMzX8M/zMEUqvGTV8ctWF3cyuMrkiZOEKWVPlw8kRX9Yr942GH4HA
         p883aMZ6GdhW/KmSYkWRtYnQxgL/jpyzgK8SixXUwSSXnOPbMmNQtVEPUjB2YHgTLeIq
         RduT/u3zv1AMr/M2hOPp05/0zJ3nD9Q5F8MYt1SmTSXdRgDdIgp5/QZ3AXsG8Z+1ar4l
         ZNo++ypyHykpeOs6qw6U+fyyWaJeh7/xkgaHT1QLXLCR8+h9os345ZEer/U2NgqUK9xA
         klZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081319; x=1688673319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfn7sIE+CNXRBIEchH6s4LYuBRt7W2O5O+bU9eogZ74=;
        b=DSKUzACkduF0AYvrP/h12wEdmZYjb4oud+u5YG9hZNWbpKLQGTxP9bU+39sBi2IGv8
         x+HDB6O4LlXXEldtB1wostgQ5OQ4I8PSNMsgqcrfRrvVxVnBXDXv3LikaMe0hcE2ggI8
         w4PgnkZT+KHm9U8Lzu4912MjMImlTQ++IZ2nGjTdmpe0AAEL73EM/wwo//lLJ3IoetHI
         VvSiXDAMWUVFPZAI5QDtpGJ+Tjbbf1/gT9gQvbnqvVm7SZ9C9/GNmcBsefbdPvNkCvKI
         JDPlMiTYu6BaRvT7ls/5aSmKsFqHo5U6PPiuI9ecWFbY6IFQpGxxBaB6hmFmzlVoKsOO
         JlmA==
X-Gm-Message-State: AC+VfDyxT1jDeyt6dZ5Lt+EX3qVfe3Y4SpnWQTgPXWMGUwJP92aa4uvK
	PBnd6WMjxTUw3kR9AmkRWVqoKgnJRtM=
X-Google-Smtp-Source: ACHHUZ45ydIyjEvh8qRu6MQ6I2QA71jROXJT6WdamQTnl45IF/MmeIFUfocpuW6Wxnz+/4njoY/FeA==
X-Received: by 2002:ac2:48ba:0:b0:4f6:20b1:ef95 with SMTP id u26-20020ac248ba000000b004f620b1ef95mr1183356lfg.37.1686081318938;
        Tue, 06 Jun 2023 12:55:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 0/8] xen/riscv: introduce identity mapping
Date: Tue,  6 Jun 2023 22:55:08 +0300
Message-Id: <cover.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces things necessary to implement identity mapping:
  1. Make identity mapping for _start and stack.
  2. Enable MMU.
  3. Jump to the virtual address world
  4. Remove identity mapping for _start and stack.

Also current patch series introduces the calculation of physical offset before
MMU is enabled as access to physical offset will be calculated wrong after
MMU will be enabled because access to phys_off variable is PC-relative and
in the case when linker address != load address, it will cause MMU fault.

One more thing that was done is:
  * Added SPDX tags.
  * Added __ASSEMBLY__ guards.
  * move extern of cpu0_boot_stack to a header.

The reason for this patch series can be found here:
https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/

Oleksii Kurochko (8):
  xen/riscv: make sure that identity mapping isn't bigger then page size
  xen/riscv: add .sbss section to .bss
  xen/riscv: introduce reset_stack() function
  xen/riscv: introduce function for physical offset calculation
  xen/riscv: introduce identity mapping
  xen/riscv: add SPDX tags
  xen/riscv: add __ASSEMBLY__ guards
  xen/riscv: move extern of cpu0_boot_stack to header

 xen/arch/riscv/include/asm/config.h       |   2 +
 xen/arch/riscv/include/asm/current.h      |   2 +
 xen/arch/riscv/include/asm/early_printk.h |   2 +
 xen/arch/riscv/include/asm/mm.h           |   9 +-
 xen/arch/riscv/include/asm/page-bits.h    |   2 +
 xen/arch/riscv/include/asm/page.h         |   6 ++
 xen/arch/riscv/include/asm/traps.h        |   2 +
 xen/arch/riscv/include/asm/types.h        |   2 +
 xen/arch/riscv/mm.c                       | 119 +++++++++++++++-------
 xen/arch/riscv/riscv64/head.S             |  40 +++++++-
 xen/arch/riscv/setup.c                    |  16 +--
 xen/arch/riscv/xen.lds.S                  |  11 +-
 12 files changed, 160 insertions(+), 53 deletions(-)

-- 
2.40.1


