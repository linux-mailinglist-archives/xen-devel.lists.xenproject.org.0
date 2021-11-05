Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D692445FAF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222019.384010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misn6-0000wJ-Fr; Fri, 05 Nov 2021 06:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222019.384010; Fri, 05 Nov 2021 06:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misn6-0000ul-Be; Fri, 05 Nov 2021 06:33:32 +0000
Received: by outflank-mailman (input) for mailman id 222019;
 Fri, 05 Nov 2021 06:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misn5-0000uf-GQ
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:31 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a94e84d-3e02-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:33:30 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id ee33so29816880edb.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:30 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:29 -0700 (PDT)
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
X-Inumbo-ID: 4a94e84d-3e02-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPTLs/th97uodahK+/rvaeKkUTbLWUfjUdtAkojp37I=;
        b=qJ/Zuah5p5AvtiYZmPziyBOYzAbiu34pi5DHbmJzKqlTrjr/QxVjFUx762nneVskhk
         sFi2RsDg8NyBhRU4yoeNdyS72nDutjXo8SP6bN+IoIQFEjn61SJrGNlwMneTOIVcebFz
         Z1Qmb8ajCBDDs9rmAJJOjCUDZsbx7YXqTToSKMWfwpddUAYMT1aQ2t+D883FIAanmgGj
         z6XWHW1oj3+ZT4faDBhzbxujh+zH8w/VRt+oxEpGdpg2sqY0FmimjQPllkppKtnl4sWg
         lRFjJo8WkkVBfVDd6jdIr/uVq7Oml3FgiWseEcGYLoIPigfbIDt4nC2eoi2dBWgeg5b3
         9kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPTLs/th97uodahK+/rvaeKkUTbLWUfjUdtAkojp37I=;
        b=wBmfatPxOTAp/MiqQed+byHVZ3gn2PmfFfEEtINl1DKS9MgkX8kyFqXxacjZBRnXJP
         9betglTQfjzg/ltFxympeN8IzQebiZOk+ySVFp44WH9R/ZZK56othHW9JbrI6xT5mK2L
         wHfWKd+sEHx9vGER1HnTXly8rWcnxxQixWUhGgAmwg7PDyrrpdQZPVUL9hzxbZ3YIg2f
         LVnxFEbtuHrCMVAu7MidgWIvjJmKSsuzaY6cxTmZmJ9/Ug4L2/1aBcmz7PlKIw6p62X3
         9uy+iJkBDqhIhLnzh2A4GFFRuFwbJK3ngp/ygNrbCcpQfmC4nIyfKr7Io2DIoFcY4Gno
         01tw==
X-Gm-Message-State: AOAM531+JGJBtxpQcYGK8y5lQbGeogDxr1OMyiMZ+qy4MByZxAKHD23u
	LxT5P+37M7OACtNOJkOz87Wngk9h9+zwtg==
X-Google-Smtp-Source: ABdhPJyJjgVbxwD/cJ0i6X2H3Ivu3dBormZVxdhDbafV70kVNekKnHNbfXf+CvN/V3XOKrs45pd+rQ==
X-Received: by 2002:a17:906:4f05:: with SMTP id t5mr18288750eju.68.1636094009824;
        Thu, 04 Nov 2021 23:33:29 -0700 (PDT)
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
Subject: [PATCH v6 0/7] PCI devices passthrough on Arm, part 2
Date: Fri,  5 Nov 2021 08:33:19 +0200
Message-Id: <20211105063326.939843-1-andr2000@gmail.com>
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

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf

Oleksandr Andrushchenko (7):
  xen/arm: rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE
  xen/arm: add pci-domain for disabled devices
  xen/arm: setup MMIO range trap handlers for hardware domain
  xen/arm: do not map PCI ECAM and MMIO space to Domain-0's p2m
  xen/arm: do not map IRQs and memory for disabled devices
  xen/arm: process pending vPCI map/unmap operations
  xen/arm: do not use void pointer in pci_host_common_probe

 xen/arch/arm/domain.c               |  2 +
 xen/arch/arm/domain_build.c         | 83 ++++++++++++++++++----------
 xen/arch/arm/pci/ecam.c             | 18 +++++-
 xen/arch/arm/pci/pci-host-common.c  | 85 +++++++++++++++++++++++++++--
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  3 +-
 xen/arch/arm/pci/pci.c              |  2 +-
 xen/arch/arm/traps.c                | 13 +++++
 xen/arch/arm/vpci.c                 | 66 +++++++++++++++++++---
 xen/arch/arm/vpci.h                 |  6 ++
 xen/arch/x86/hvm/hvm.c              |  6 ++
 xen/common/ioreq.c                  |  9 ---
 xen/include/asm-arm/device.h        |  2 +-
 xen/include/asm-arm/pci.h           | 28 +++++++++-
 xen/include/asm-arm/setup.h         | 13 +++++
 15 files changed, 278 insertions(+), 60 deletions(-)

-- 
2.25.1


