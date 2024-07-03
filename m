Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95B92595E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752889.1161125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxRy-0003nH-Nw; Wed, 03 Jul 2024 10:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752889.1161125; Wed, 03 Jul 2024 10:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxRy-0003lb-KG; Wed, 03 Jul 2024 10:42:58 +0000
Received: by outflank-mailman (input) for mailman id 752889;
 Wed, 03 Jul 2024 10:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxRx-0003lU-4t
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:42:57 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01dcb6da-3929-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 12:42:56 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a724958f118so639867866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:42:56 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm414590066b.78.2024.07.03.03.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:42:54 -0700 (PDT)
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
X-Inumbo-ID: 01dcb6da-3929-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003375; x=1720608175; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjcW/rouMpf5sb7CrnSsvYvO1gwUChDP6us7A12ze+E=;
        b=PlMcTA2cPKSQHP6Rj/00ZWVZCfuwhSJRQwXPeZg85MG0nitjEvSat/DAd+XG0KPNK+
         KbkaJPiq+FtjYiAzZYqu/oTaI3AsZr5B7QhZ9M2wdb9B7No4uokj+8DKw9pkx2sOizhm
         5ZspTKBdA740CFWGmb8rg1FiMNtqITAut4nNcBk77GPYFt8dIsI6DdU782SpUx1t88aJ
         r/KX73GbAnwSDfdbcyYkDplGgPN+0aMEXBP9p6U1WzMwE73nHp300eWSMMc3OjbWiqeP
         6H4mZWilHxQL7nM3Em5T9t7OiV8BI4SGcU7/dxzHIY1NDA9pYmY0tCzya1dt2zhgwd/+
         +1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003375; x=1720608175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjcW/rouMpf5sb7CrnSsvYvO1gwUChDP6us7A12ze+E=;
        b=bmHHU2b3IVgz38YatdndYKibZ4eSbEgj+iKsH2wcvD1XviwbkXrlLnrkYijo/dROuG
         p36SvrBX2sJ7mIOAHmsXImG1AsAEdY+YkqWpUJh8+yQ7JveJYvC4O8+mTuUugbVIPavs
         3YLTQ/5yj/ZXudixOC2aD+m9XoRW4rXyDdLz/bRydXj6SPdHOgOgGGi8VUdjd5rqRjKO
         YFrU8EZBhMQOt/axMJCX0bWx2Ql2dki5MWrbnLu8hUpjFOwfs1mozAThEXtO8Vp96hWX
         yt2OGMqeOB5UtNhNfHuvfu1wmIYzDUEmHNs6xgkBl6NguLrDf0dXgGEPfOM7Rwhz1Vb7
         T/Wg==
X-Gm-Message-State: AOJu0YyBJmXoNwh0IVc4vS1Guw4F8UKojby2InOHwITfXlg32Plp9QGc
	kXJ50OirIs21zYr8djcZaq4YS4yX9fWEnm00N87fXFKl8X86LIkVzl6CD5KR
X-Google-Smtp-Source: AGHT+IFvj6h6M1zt8SRfh8lzhOwp/IviwQgQXyhyc43gubK8p0S7nD+Q9B+U9KrgHB2nlG3vpbgpXw==
X-Received: by 2002:a17:907:7f15:b0:a6e:fb9b:6769 with SMTP id a640c23a62f3a-a75144de327mr937292866b.75.1720003374412;
        Wed, 03 Jul 2024 03:42:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH for 4.20 v1 0/5] RISCV device tree mapping
Date: Wed,  3 Jul 2024 12:42:46 +0200
Message-ID: <cover.1720002425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V.

Also, it introduces common stuff for working with fdt which is
based on the patches from [1]:
  [PATCH v4 2/6] xen/device-tree: Move Arm's setup.c bootinfo functions to common
  [PATCH v4 3/6] xen/common: Move Arm's bootfdt.c
All changes which were done on top of Shawn's patches please find in "Changes" section
of each patch.

[1] https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/

Oleksii Kurochko (3):
  xen/riscv: enable CONFIG_HAS_DEVICE_TREE
  xen/riscv: introduce device tree maping function
  xen/riscv: map FDT

Shawn Anastasio (2):
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common

 MAINTAINERS                         |   2 +
 xen/arch/arm/Makefile               |   1 -
 xen/arch/arm/bootfdt.c              | 622 ---------------------------
 xen/arch/arm/include/asm/setup.h    | 200 +--------
 xen/arch/arm/setup.c                | 432 -------------------
 xen/arch/riscv/Kconfig              |   1 +
 xen/arch/riscv/include/asm/config.h |   6 +
 xen/arch/riscv/include/asm/mm.h     |   2 +
 xen/arch/riscv/mm.c                 |  37 +-
 xen/arch/riscv/riscv64/head.S       |   3 +
 xen/arch/riscv/setup.c              |  21 +
 xen/common/Makefile                 |   1 +
 xen/common/device-tree/Makefile     |   2 +
 xen/common/device-tree/bootfdt.c    | 635 ++++++++++++++++++++++++++++
 xen/common/device-tree/bootinfo.c   | 459 ++++++++++++++++++++
 xen/include/xen/bootfdt.h           | 210 +++++++++
 16 files changed, 1375 insertions(+), 1259 deletions(-)
 delete mode 100644 xen/arch/arm/bootfdt.c
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootfdt.c
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/include/xen/bootfdt.h

-- 
2.45.2


