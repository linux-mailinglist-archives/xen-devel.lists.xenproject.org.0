Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6693947A78
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772064.1182504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saw0i-0002jJ-3C; Mon, 05 Aug 2024 11:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772064.1182504; Mon, 05 Aug 2024 11:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saw0h-0002gd-WB; Mon, 05 Aug 2024 11:36:19 +0000
Received: by outflank-mailman (input) for mailman id 772064;
 Mon, 05 Aug 2024 11:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1saw0h-0002gX-A5
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:36:19 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4dc5b9-531e-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 13:36:18 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso145693781fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 04:36:18 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3d09sm447203566b.17.2024.08.05.04.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 04:36:16 -0700 (PDT)
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
X-Inumbo-ID: ee4dc5b9-531e-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722857778; x=1723462578; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipK8rpT6JL15t4PadxePzMqWe6QKOf6oB0X7YmhdJJk=;
        b=Sn3lGiRgZGH0gMzhPzgw2Hazya7ai7g5KubpvRuywA8gghaKPIGQtslz23sK9BnrOs
         juBqueZaqBjRPDw2Hbo8FYzHnaBARUhGbFreTSXZXzz/bE121KD6Txn9Y5LezB1wM0ux
         X+0hi/7rI54KmMCehhAhxeLH7sh8neROvjVriLkkUaec3NNp1VT1aOCp47wWBdw3iEPU
         dMRjucmYP4GPQwcn94NjeFkIChzkU7ogPjmILpUZ5gr08lC3XaImxAFNxK2TnBLYgiql
         twUXdoXqPw9z+n64E7Y1yIcXfpLcqOLBL2gES5VKyIWJI8LR+h3HoO26ZvtNFNCpT2xJ
         gZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722857778; x=1723462578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipK8rpT6JL15t4PadxePzMqWe6QKOf6oB0X7YmhdJJk=;
        b=P4nS4lpbKWuWUUrN5I4/1IjL8O3thvUjYuSV6vI6XnBHdUkwpKz9RBDwtcQTwIvCo2
         TwWygoQIQNuZ4XfMwo5Car0VWtSCP/UyflAlvAFvuocVbu1qct+36eeFZKx30TCjNxH/
         nmO6eStp5tKBSxjfECqGtT9LerlpHVjMRbLFqC3ewrOHoADc3GxnJbyA1Sqa+OURavkc
         fLZsXw3zviPeZaBev3fqYElItmjiVZo4hTaU/6Fn3Au/yxidxHeHdeF5EWADqRwfvj51
         lPETBucDruuCNtcmeeZHrFAOUUXhc9yaWVwzuD39rnL+mB1bydzk+PkUplcyYOcBsjcu
         0c5A==
X-Gm-Message-State: AOJu0YxZapNJTcQIS/NOv6+31+lvmn04IV9nvz5DTsfQ4lg/3dsWGfjS
	1zBxFIj26qW8dSvvXKAkIb5m2TH/ykXWGNnHdvg9sF0RS2YxD6fGvuQj0Q==
X-Google-Smtp-Source: AGHT+IG/EUrZB1s+boULShzWOU4O8V6niAQh8YhveqHwV/yM1gQwEiTi8omSnvtvpgAOJGA4wY152w==
X-Received: by 2002:a2e:b164:0:b0:2ef:226e:e150 with SMTP id 38308e7fff4ca-2f15ab2a5c0mr85483951fa.32.1722857777202;
        Mon, 05 Aug 2024 04:36:17 -0700 (PDT)
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 0/2] Common device tree stuff
Date: Mon,  5 Aug 2024 13:33:48 +0200
Message-ID: <cover.1722856894.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current patch series introduces the common device tree functions
between several architectures: Arm, PPC, RISC-V.

Originally these patches were a part of Shawn's patch series [1].
At that moment it was v4 version of this patches.

After RISC-V started to need this changes these patches have been
rebased on top of the current staging with addional updates after
rebase.
For some time, these patches from v5 to v7 version were the part of
the patch series [2] but not to block almost ready patches for merging
it was decided to move them to separate patch series.

[1]
https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/

[2]
https://lore.kernel.org/xen-devel/cover.1721834549.git.oleksii.kurochko@gmail.com/

Shawn Anastasio (2):
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common

 MAINTAINERS                             |    2 +
 xen/arch/arm/Makefile                   |    1 -
 xen/arch/arm/bootfdt.c                  |  622 -------
 xen/arch/arm/include/asm/setup.h        |  198 +-
 xen/arch/arm/include/asm/static-shmem.h |    9 -
 xen/arch/arm/setup.c                    |  432 -----
 xen/common/Makefile                     |    2 +-
 xen/common/device-tree/Makefile         |    3 +
 xen/common/device-tree/bootfdt.c        |  635 +++++++
 xen/common/device-tree/bootinfo.c       |  459 +++++
 xen/common/device-tree/device_tree.c    | 2253 +++++++++++++++++++++++
 xen/common/device_tree.c                | 2253 -----------------------
 xen/include/xen/bootfdt.h               |  209 +++
 13 files changed, 3563 insertions(+), 3515 deletions(-)
 delete mode 100644 xen/arch/arm/bootfdt.c
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootfdt.c
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/common/device-tree/device_tree.c
 delete mode 100644 xen/common/device_tree.c
 create mode 100644 xen/include/xen/bootfdt.h

-- 
2.45.2


