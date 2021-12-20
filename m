Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D947B4F0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249992.430483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005Kt-6y; Mon, 20 Dec 2021 21:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249992.430483; Mon, 20 Dec 2021 21:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005IX-2s; Mon, 20 Dec 2021 21:16:19 +0000
Received: by outflank-mailman (input) for mailman id 249992;
 Mon, 20 Dec 2021 21:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ12-0005IB-MZ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:16 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c50902-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:15 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id g26so8788848lfv.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:15 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:14 -0800 (PST)
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
X-Inumbo-ID: 10c50902-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5Q/RJPdWh4bqdcFuIxinpJzK9wtUT2GDpjgf/iTPpg=;
        b=E9vW99Y32bkWLVqZmQ9NdpzkoCrOi03+Qwqa00Db3aBzO9e8ZYb91fhnjItOAqC2fv
         eoMkrNaqYxfNKge378AeVZi8JPGneZUQ5Y5mIcGwZvg3aBEdp8htJIO3mbuVaJEr2iJu
         Z5GXL+bbqIct1IvvLZTFCILaQLaw6OLbb8B9igd0x+M2a2wCiDvV/rnrzoqiRp8UYY+6
         dKwy4Z8H4aLKIKgvh8to/t1WKD6SpiPRohNB9NwF6iB25jMqkppPna8Fy5b114j6Dm7e
         mIJ4OuEZrv772a1Pfx5XpgW2w1hP1MsFZB4GAO7GCvSA6OIMcO4buGRC4JttjAhs+qLl
         xocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5Q/RJPdWh4bqdcFuIxinpJzK9wtUT2GDpjgf/iTPpg=;
        b=NlNLNDWgQtClSoRp0o4R9WXyqgPlTFfsIuWezilToGwbUE2pADO5bbQv50KNwvEDza
         jv9eoaAtTKAXdFRmeLttI2C2r/PnuKYqiIhvctE1DeNhvOorslbdrqjOrpyfXr7/w0BX
         n7CC35V7j/Asn+ejOvphBBKDeDST4mJwV1Bl0TzkxS6XL+Wl4IolsHjbrN1NEjvYWM5b
         d2UjgFIUNl022CBk/XuZVXVTg6toOe4bULtLaswVSl7dAGDWD6qEttyDcbpVKQakabRM
         EdaKLU0dc5xH9ghzq7+F7MG6r2+j0dPfvEn67jyCvaAJaKO+uwTTwiDNQ/ycpjTC54dg
         9JZQ==
X-Gm-Message-State: AOAM531UknhfJVe12gb5Na6wzsvbtRG6RjGa+i7kYTBSYRn8BX2MSzy/
	/ZmN9SXNytF3sblFpe3Y1qx61KB/sxY=
X-Google-Smtp-Source: ABdhPJw589wFRXA12CoYbgrgbr52n6Y7D7X9JfaFVgt5iK3d/rDLsSnX8r2/aXzU70vF8mYTf203Rw==
X-Received: by 2002:a05:6512:b81:: with SMTP id b1mr15523800lfv.301.1640034974578;
        Mon, 20 Dec 2021 13:16:14 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 00/10] Add support for Renesas R-Car S4 IPMMU and other misc changes
Date: Mon, 20 Dec 2021 23:15:47 +0200
Message-Id: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

You can find the V1 patch series at [1].

The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Communication
Gateway and is one of the first products in Renesas’ 4th-generation R-Car Family.

The integrated IOMMU HW is also VMSA-compatible and supports stage 2 translation
table format, therefore can be used with current R-Car Gen3 driver with slight
modifications.

In the context of Xen driver the main differences between Gen3 and Gen4 are
the following:
 - HW capacity was enlarged to support up to 16 IPMMU contexts (sets of page table)
   and up to 64 micro-TLBs per IPMMU device
 - the memory mapped registers have different bases and offset

The first part (commits #1-6) is a non-verbatim port of Linux upstream commits
needed to add support for S4 series easily (prereq work).
The second part (commits #7-8) is based on the code from the Renesas BSP and
actually introduces support for R-Car S4 IPMMU.
The third part (commits #9-10) is misc changes I have locally.

The patch series is based on the latest staging branch 
"f3999bc2e099 arm/efi: Handle Xen bootargs from both xen.cfg and DT"
and also available at [2].

Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas Spider
board with S4 SoC (Gen4).

[1] https://lore.kernel.org/all/1638035505-16931-1-git-send-email-olekstysh@gmail.com/
[2] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml2


Oleksandr Tyshchenko (10):
  iommu/ipmmu-vmsa: Remove all unused register definitions
  iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
  iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
  iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
  iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
    macro
  iommu/ipmmu-vmsa: Add utlb_offset_base
  iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
  iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
  iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
  iommu/arm: Remove code duplication in all IOMMU drivers

 xen/drivers/passthrough/Kconfig          |   6 +-
 xen/drivers/passthrough/arm/iommu.c      |   7 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 267 ++++++++++++++++++-------------
 xen/drivers/passthrough/arm/smmu-v3.c    |  10 --
 xen/drivers/passthrough/arm/smmu.c       |  10 --
 5 files changed, 167 insertions(+), 133 deletions(-)

-- 
2.7.4


