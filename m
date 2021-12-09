Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4646E335
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242714.419763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrn-0006uS-CE; Thu, 09 Dec 2021 07:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242714.419763; Thu, 09 Dec 2021 07:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrn-0006rU-9C; Thu, 09 Dec 2021 07:29:23 +0000
Received: by outflank-mailman (input) for mailman id 242714;
 Thu, 09 Dec 2021 07:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5bTN=Q2=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvDrm-0006rO-AU
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:29:22 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e8389a-58c1-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 08:29:21 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id i63so7603961lji.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 23:29:21 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f13sm445069lfe.297.2021.12.08.23.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:29:19 -0800 (PST)
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
X-Inumbo-ID: b9e8389a-58c1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71jnf3En8LBFx/Mef4yf4b2O8F4/RnDy3EDB+YBJx/w=;
        b=SMBybiqofbMs4uiT2mldWlze+jvmjC2yl52/MxGjk4NyT+Imh2v0CtMoDpRwq/RqgZ
         psz3Kg9u+ArhWH4xUnxSObdTBoBK7rEBbD3kMIQ36g5htdt1pBqr9KLW4B2wueKDWq+K
         8o2/V3Ggn1jjB2w0p0skJtX6yx8Gv9EZNIAjRbnc4fjoLejVTtGj0jH2U+aT+Oz7v+53
         br2ANBZieUhmad+8dZSH+5rPu4ghmCHQVcji6byCBKVaFSAQk8xKBVc0NlhK9dS3BmQC
         oyfdtJboQ/856Bu0BkBCcJWXsLsWsGl2ksNxNW4TA/2pFHz3dKzC8dYm2wDzXXR22NtO
         /6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71jnf3En8LBFx/Mef4yf4b2O8F4/RnDy3EDB+YBJx/w=;
        b=TlxGXHLYgWkhYsW45r+s7RWSvUFOoHmHa3qCXEIIaQHFZN/8jijw2CagVgC8mkX6QU
         hUBka2to9hceZDkMuWRBBiSxjb6k6dCOY/Z3L8t90Br2Xta7ZD9DhmMB1uq+aqoN5Smw
         QwLIHmeI6ykXfnA44u750ja4+qX9leL0kR2vGF2VQvDbqBK8hYpZFaCtusJYqOwaG0rl
         ztX1IvPX0LyWy0NLcHS0mOwCxlw2H5+rHQpI7DWZSFMaD36wlr28VyERrkHn7stWb19X
         5ZIrtkz3OW2cWU5U7zDYeczPQ9BiAhGlHQca/uRoUw66EehqK50+96qdmCkqTcqgPKPh
         RMWg==
X-Gm-Message-State: AOAM533xdorIh7uaRUGQ6hgkf2TYdujc7+KMArghn9sgIdC37LL2BGkm
	7G2a9wAWceoRvVnGOzyVbFBSKOYIjMwJmw==
X-Google-Smtp-Source: ABdhPJzXKTAVRsqmGQ3QvIJ4KNgTMRLe5PkFOuhVD/atU6CNXHYal7E+fvMGdNQvIYupefRmI7jx1g==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr4592336ljf.257.1639034960580;
        Wed, 08 Dec 2021 23:29:20 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v8 0/4] PCI devices passthrough on Arm, part 2
Date: Thu,  9 Dec 2021 09:29:14 +0200
Message-Id: <20211209072918.460902-1-andr2000@gmail.com>
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

This series contains all the patches which are left un-committed yet.

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf

Oleksandr Andrushchenko (4):
  xen/arm: add pci-domain for disabled devices
  xen/arm: setup MMIO range trap handlers for hardware domain
  xen/arm: account IO handler for emulated PCI host bridge
  xen/arm: do not map PCI ECAM and MMIO space to Domain-0's p2m

 xen/arch/arm/domain.c              |   2 +
 xen/arch/arm/domain_build.c        | 132 ++++++++++++++++++++---------
 xen/arch/arm/pci/ecam.c            |  14 +++
 xen/arch/arm/pci/pci-host-common.c |  77 ++++++++++++++++-
 xen/arch/arm/pci/pci-host-zynqmp.c |   1 +
 xen/arch/arm/vpci.c                |  85 ++++++++++++++++---
 xen/arch/arm/vpci.h                |   6 ++
 xen/include/asm-arm/pci.h          |  22 +++++
 xen/include/asm-arm/setup.h        |  13 +++
 9 files changed, 298 insertions(+), 54 deletions(-)

-- 
2.25.1


