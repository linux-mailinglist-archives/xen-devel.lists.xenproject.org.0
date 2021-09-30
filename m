Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6141D439
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199393.353418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqG3-0004DR-IU; Thu, 30 Sep 2021 07:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199393.353418; Thu, 30 Sep 2021 07:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqG3-0004B9-FL; Thu, 30 Sep 2021 07:13:31 +0000
Received: by outflank-mailman (input) for mailman id 199393;
 Thu, 30 Sep 2021 07:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqG2-0004B3-AO
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:30 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6ce97bb-51ee-4b26-b5eb-7974bd2019d0;
 Thu, 30 Sep 2021 07:13:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i19so18305371lfu.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:29 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:27 -0700 (PDT)
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
X-Inumbo-ID: b6ce97bb-51ee-4b26-b5eb-7974bd2019d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JxEMJjjs3uh8Q+DakT3e0prA56g9kYxCO6qvYOCBJaA=;
        b=Q0yoOXzdg30oSNTyERMKnmfTSOJ6kir/Ngr17hbIHGVobzKKZO7yTEJ8hgAO2yB1f1
         JZnlGL2KhhbufQgdtm/wSAC27EdMTCvKFlC0R0fjHCH/vh/B8kKq8O9/QGXyD+zJ4f21
         tXjuZuS0XLigO3AwVldv9djiPMrvzewCOqXAiOojy3bcEA3C6MjVR5mDRVZaovlRtQEK
         IDsYtIrc/EfutqQOn89GqST/Emxerh8ZC1Z+xoQh2iRE4ALSDn1omFpsEHgkyUj8/crT
         2tryb2YurHWdPASbz+ahnrx5y12GZWrRvCMNL6khrDaaDBYieln/eN0ftVgmQAChG0Cj
         GCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JxEMJjjs3uh8Q+DakT3e0prA56g9kYxCO6qvYOCBJaA=;
        b=t/rg/Y9R+EepXG0LdA58Zm+6X5QWe7y9ZMcaUmXdyYbAejXa5GAEVj7ozd3QSCONtO
         ni/HuIO4r5rWmhU7H4FP6thxZmB6nTc25zuSuowG/xg7mpqO4R91Q7/ldjhw1BrmMppK
         cpjhdGm99cd7k8R3eSWGCn26F6Ot3cUEq7QNgBwkOGVgzAKa7cORs+qdvTG1gixlwOBL
         2+a2qYwnIbbgu2p8btEjFHJ2gvTppM73kYcS1hGiND28gHkZNP02WivEId24jJlKk/0K
         mV7ZSbhhEDO38tjEJ4Iu2XFXKFvIfVcVzpvc3p57tyZHEV5uNBM1wZLN099zKxW100N4
         zBUw==
X-Gm-Message-State: AOAM532HLauQCWMeY5r19MyzuYwLlhfJJ2hcgSiPusjCBzCoD+187GV3
	A+bCTE4YriBdtI/wJhY2NzSdwy2amGY=
X-Google-Smtp-Source: ABdhPJzwP93rdaCp9KnZbHtdQSZDvGJd95LI8oOVmP4BphHADrjZlyAILhNcxf60vYuUZwXEq3cDKA==
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr4428851lfu.558.1632986007881;
        Thu, 30 Sep 2021 00:13:27 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v3 00/11] PCI devices passthrough on Arm, part 2
Date: Thu, 30 Sep 2021 10:13:15 +0300
Message-Id: <20210930071326.857390-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

This is an assorted series of patches which aim is to make some further
basis for PCI passthrough on Arm support. The series continues the work
published earlier by Arm [1] and adds new helpers and clears the way for
vPCI changes which will follow.

RFC is at [2], [3]. Design presentation can be found at [4].

I have dropped some r-b's from Stefano as I touched some patches after
the review: most of those are minor cleanups, but still.

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=554415
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf


Oleksandr Andrushchenko (10):
  xen/arm: Fix dev_is_dt macro definition
  xen/arm: Add new device type for PCI
  xen/arm: Introduce pci_find_host_bridge_node helper
  xen/device-tree: Make dt_find_node_by_phandle global
  xen/arm: Mark device as PCI while creating one
  libxl: Allow removing PCI devices for all types of domains
  libxl: Only map legacy PCI IRQs if they are supported
  xen/arm: Setup MMIO range trap handlers for hardware domain
  xen/arm: Do not map PCI ECAM and MMIO space to Domain-0's p2m
  xen/arm: Process pending vPCI map/unmap operations

Oleksandr Tyshchenko (1):
  xen/domain: Call pci_release_devices() when releasing domain resources

 tools/libs/light/Makefile          |  4 ++
 tools/libs/light/libxl_pci.c       | 15 ++++-
 xen/arch/arm/domain.c              | 11 +++-
 xen/arch/arm/domain_build.c        | 45 ++++++++-------
 xen/arch/arm/pci/ecam.c            | 14 +++++
 xen/arch/arm/pci/pci-host-common.c | 93 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
 xen/arch/arm/pci/pci.c             | 12 ++++
 xen/arch/arm/traps.c               | 13 +++++
 xen/arch/arm/vpci.c                | 33 +++++++++++
 xen/arch/arm/vpci.h                |  6 ++
 xen/arch/x86/hvm/hvm.c             |  6 ++
 xen/common/device_tree.c           |  2 +-
 xen/common/ioreq.c                 |  9 ---
 xen/drivers/passthrough/pci.c      |  2 +
 xen/include/asm-arm/device.h       |  6 +-
 xen/include/asm-arm/pci.h          | 28 +++++++++
 xen/include/asm-arm/setup.h        | 13 +++++
 xen/include/asm-x86/pci.h          |  2 +
 xen/include/xen/device_tree.h      |  2 +
 20 files changed, 280 insertions(+), 37 deletions(-)

-- 
2.25.1


