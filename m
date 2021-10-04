Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1042111D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201466.355962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhD-0008SM-Ld; Mon, 04 Oct 2021 14:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201466.355962; Mon, 04 Oct 2021 14:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhD-0008QM-IR; Mon, 04 Oct 2021 14:11:59 +0000
Received: by outflank-mailman (input) for mailman id 201466;
 Mon, 04 Oct 2021 14:11:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhC-0008QG-HW
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:11:58 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7119be3-e1ee-4df1-9ab7-77b6af9936dd;
 Mon, 04 Oct 2021 14:11:57 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so72225018lfr.10
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:11:57 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:11:53 -0700 (PDT)
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
X-Inumbo-ID: e7119be3-e1ee-4df1-9ab7-77b6af9936dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WsOpifpsOxtx/89eDSKv6jrXALsdW46waxc0qV6yaCU=;
        b=Vj0nRmiwciVoHjPaOjjFiSgbrkxgBNS56qAtBB70b36pVaaHK146k9SUlNZIipqr5W
         4yQgaJddnnlF8sVCGPLfARgISDtwIiTm2Dj8Py3IzJ0OhJIZXafvSRXlwR6rxl+ZwvlW
         uxFXPbBBWhYbz0EcUPiDmm+EV82IKhhXTtbPAzoS7pV+C8o9CZELr5HcA+8MJy466HyX
         rXJ6ZlpvmkWNzzqKFh8VHbxfdTwo02XkE42XnH84R6DQzUavaEVIInPLU64g/zq4zLuG
         s8OHWqDbJ3ysOtNUVl6Jb788Ncm5zliP/6cZUfMM1pqXIPcBo7D7H6QEvZ28bJ5BnGJi
         N6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WsOpifpsOxtx/89eDSKv6jrXALsdW46waxc0qV6yaCU=;
        b=LyXMyyIq1VWor7M0xCGcxiVmBIWvInajzd9uSflE9pgft2nG/JF2SngDV1XEBB7uWA
         9h7nIcxYe4GdXJNWYgqP3yLPysnjeG6WiIpgU8c49jReQV6b1Ef5VuBbyWvCK/fbG3d+
         t4hdfwWkC6rs/0R4FdcLuqHwx11MFkXRJV6RQSu88OOGndOerqhf3k/rH9IaUNMDpbo2
         e06kc7Gz9UBTKKeamylzsAHKHYBlheku5UHYVy6l2cEuXjATub2yHCkgNj1srVGwXo6R
         MKr3nDO300Q38SFQMq3crwdDiSqaobTDxrg+yaISEHOo6LLeMPSDjTgCaUGuSeQwy6lJ
         r0gA==
X-Gm-Message-State: AOAM5315mCeSHk5Mzd8znBPYEres3iTY2XqcFe1zfGPRfS1eCXKWTige
	UYCZwLdgrKm2Ook55UOOgX2Ixug26To=
X-Google-Smtp-Source: ABdhPJwB/a1zy6Ef/4Lj6tH2TNIceuwzXWD04m55Gg0d9hbchYpf9rv8pc8D40AzumYOBkn9a5ylRg==
X-Received: by 2002:ac2:5c0f:: with SMTP id r15mr2380137lfp.564.1633356713814;
        Mon, 04 Oct 2021 07:11:53 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 00/11] PCI devices passthrough on Arm, part 2
Date: Mon,  4 Oct 2021 17:11:40 +0300
Message-Id: <20211004141151.132231-1-andr2000@gmail.com>
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

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=557111
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
 xen/arch/arm/domain_build.c        | 50 ++++++++--------
 xen/arch/arm/pci/ecam.c            | 14 +++++
 xen/arch/arm/pci/pci-host-common.c | 93 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
 xen/arch/arm/pci/pci.c             | 12 ++++
 xen/arch/arm/traps.c               | 13 +++++
 xen/arch/arm/vpci.c                | 34 +++++++++++
 xen/arch/arm/vpci.h                |  6 ++
 xen/arch/x86/hvm/hvm.c             |  6 ++
 xen/common/device_tree.c           |  2 +-
 xen/common/ioreq.c                 |  9 ---
 xen/drivers/passthrough/pci.c      |  2 +
 xen/include/asm-arm/device.h       |  6 +-
 xen/include/asm-arm/pci.h          | 30 ++++++++++
 xen/include/asm-arm/setup.h        | 13 +++++
 xen/include/asm-x86/pci.h          |  2 +
 xen/include/xen/device_tree.h      |  2 +
 20 files changed, 286 insertions(+), 39 deletions(-)

-- 
2.25.1


