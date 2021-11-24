Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9341A45B60D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230143.397875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC0-00067R-7v; Wed, 24 Nov 2021 07:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230143.397875; Wed, 24 Nov 2021 07:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC0-00064B-4o; Wed, 24 Nov 2021 07:59:48 +0000
Received: by outflank-mailman (input) for mailman id 230143;
 Wed, 24 Nov 2021 07:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnBy-000641-Jr
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:46 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1a34e9-4cfc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:59:45 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id t11so3622209ljh.6
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:45 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:44 -0800 (PST)
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
X-Inumbo-ID: 7d1a34e9-4cfc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ey/iEZjdG4Lke2qF+bL5ScgZc5iePgpWDmMUJiz2lTA=;
        b=eujJ2bAxgjH4iTCs6zjyA9ZJvawIzJMSLvsELa/tF/5MaaZU4/y+e1/3b5ZZYnABVg
         d2FCkztTw4qVJEOr2BgkqsZUspoKSM68mlq3pmBray+pvlDd/4Z/t7uTChalvEhZBI41
         Oud1GGIuDpYCxoEhgwGAPZ8OcWIIGiza9hyA8M8rE1xsRKwolRvElLv/sHNKd5FztnnM
         lVmT+XLSwWbjBvvAM8QhqrSb37x4HnnzDHyRu8exRUN/oDDnill5azf6chRnYJxyYVtr
         g1B3zehI8s8xzB9bEkAY+9O99P8Up+zcymEgkHCuGZFtGDVtHWZVh6Qiqa407yq5RHqH
         JB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ey/iEZjdG4Lke2qF+bL5ScgZc5iePgpWDmMUJiz2lTA=;
        b=qfXYkcVuP3IrxiiPXzS2ZXxL/APbDVleLx1OjgIVZQHiBf/wWVybO7enY+XStUEGiH
         sFA7VZETFrD+6aAnqUBXsWv9tYIalUl6sprC999Douz226qhKDp58cHD6XVmPmrUQZWA
         gqTTUOZGr4ZMP108B1alTSZT23T6w8zDg/lwmpi8oYkq+UhALTcYHavpzZPb2HS1ZgMw
         5OJtVIGoAB4YJQ8xW6d7xnMn78laezecVO/+n5J+vqEI5kCpJgphSh/WQFU3icXWlYY7
         txMzbGbMALIX4f+K44VAqIj+3ikJRr2tGv1rabW8ytDlPkcVrT1NjFpHIsg2OEcmEKlb
         pCJg==
X-Gm-Message-State: AOAM530oDbtCYw53zsL70yB44FRk3kS1xz0gyIQmmvMIWJW+Q5zkmqEm
	aF4iJQ1zjntKbeZu4IPohmfOLzZPz4PZ+Q==
X-Google-Smtp-Source: ABdhPJxY1BTk6/60XMVdQAY3sadfqBCqk+53e/NR27fRMpmfcnzFflyANLDgiUyCiNAESBdq+uXgog==
X-Received: by 2002:a2e:a688:: with SMTP id q8mr13268512lje.349.1637740785027;
        Tue, 23 Nov 2021 23:59:45 -0800 (PST)
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
Subject: [PATCH v7 0/7] PCI devices passthrough on Arm, part 2
Date: Wed, 24 Nov 2021 09:59:35 +0200
Message-Id: <20211124075942.2645445-1-andr2000@gmail.com>
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

I have removed patch
[PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled devices
as it seems that this needs more time for decision on how to achive
that.

I have also added a new patch
[PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host bridge
with a tiny latent bug fix.

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf

Oleksandr Andrushchenko (7):
  xen/arm: rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE
  xen/arm: add pci-domain for disabled devices
  xen/arm: setup MMIO range trap handlers for hardware domain
  xen/arm: account IO handler for emulated PCI host bridge
  xen/arm: do not map PCI ECAM and MMIO space to Domain-0's p2m
  xen/arm: process pending vPCI map/unmap operations
  xen/arm: do not use void pointer in pci_host_common_probe

 xen/arch/arm/domain.c               |   2 +
 xen/arch/arm/domain_build.c         | 132 +++++++++++++++++++---------
 xen/arch/arm/pci/ecam.c             |  18 +++-
 xen/arch/arm/pci/pci-host-common.c  |  81 +++++++++++++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |   3 +-
 xen/arch/arm/pci/pci.c              |   2 +-
 xen/arch/arm/traps.c                |  13 +++
 xen/arch/arm/vpci.c                 |  80 +++++++++++++++--
 xen/arch/arm/vpci.h                 |   6 ++
 xen/arch/x86/hvm/hvm.c              |   6 ++
 xen/common/ioreq.c                  |   9 --
 xen/include/asm-arm/device.h        |   2 +-
 xen/include/asm-arm/pci.h           |  27 +++++-
 xen/include/asm-arm/setup.h         |  13 +++
 15 files changed, 323 insertions(+), 73 deletions(-)

-- 
2.25.1


