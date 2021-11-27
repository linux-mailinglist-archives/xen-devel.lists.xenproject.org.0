Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275E24600BD
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234016.406176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rh-0004L0-96; Sat, 27 Nov 2021 17:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234016.406176; Sat, 27 Nov 2021 17:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rh-0004J7-4i; Sat, 27 Nov 2021 17:51:57 +0000
Received: by outflank-mailman (input) for mailman id 234016;
 Sat, 27 Nov 2021 17:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rf-0004Ih-IK
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:55 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ce165e-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:51:54 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id j18so12205628ljc.12
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:52 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:51 -0800 (PST)
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
X-Inumbo-ID: b3ce165e-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VT6V23qiWa99TjZigs2WUA76yUm7r4YP7cMN5cAJmM0=;
        b=EnSx8l4TGMUV5Rr/IX+PBCfbrrPad7MMBzOa+mB3kQsAVpKhXPI1d6QqsXd5kwTnp+
         Bgn8vZhyqT0YGztKm6deEp9+CllUCe7YoS8z65KC43+yx3zBJXvS/8v5ksYtsiiFOlUr
         fMTM6SmJihTGt4hBSIEdwbYNnaorIKMf5Fb8OGn3E0eQKRc30EPDO5qqT/4kC96C+/ZR
         dHwGobufXvcPXoj6FU0KdF5H3EizHZe+Iqxm+O53M01fxBP3XN0cqAJzQhpYVQ3NgOyB
         vorjvrZJ7TA2LGTiRjAKTpNZjsYGw6s49S193FHu2DqakbkE/b12Ky6DYw0W6QCfz3/H
         BYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VT6V23qiWa99TjZigs2WUA76yUm7r4YP7cMN5cAJmM0=;
        b=UscVmKkWuzOcb3nJDyKtSV9elYwbLXYIVhZB2FB/+OJQ5mX20vsHKQxhFugZrW2s+/
         HNSeA0WIcC/EdEbn4D5WJszR2ozJMu2GkxxSsT9oJ3HXRx3a847UtkDY8S3SI/eKVtB7
         XG9xNXV/2eM/DiBZE6Tic5Hmq5rHdKpSCwSjcA1jdP9Scz6ZxlB/urPy/EgEzf+55PPs
         kFKD98hi+CC9LKxr3QrPF8AcM4T0Tpfw2EgcTAUdyIOGPj8qyO9rM8mn2+gWWDVkjjIB
         w6aOUAFDQ33/PXkVKIrutiDD4fjhS1YAKH8qx2rsi73RvBBbt7icn5mHPKh77UO9fcRL
         fFyg==
X-Gm-Message-State: AOAM532WU3SzlR75C2UKI3iAvB3QGKvLB/ndNBYnZLgAxk0WLnFitEft
	o6OXAykSIC4TzV84z/NAKeazZ3/VrvI=
X-Google-Smtp-Source: ABdhPJxIImBGYJizoePTW7uJnxvOjSPnaEm5Sw0ErZOBBUZ1BPLQnPMuz3MOMXVoI/laNGfgIfIT+A==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr38730021ljb.214.1638035511606;
        Sat, 27 Nov 2021 09:51:51 -0800 (PST)
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
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other misc changes
Date: Sat, 27 Nov 2021 19:51:35 +0200
Message-Id: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Communication
Gateway and is one of the first products in Renesas’ 4th-generation R-Car Family.

The integrated IOMMU HW is also VMSA-compatible and supports stage 2 translation
table format, therefore can be used with current R-Car Gen3 driver with slight
modifications.

In the context of Xen driver the main differences between Gen3 and S4 are
the following:
 - HW capacity was enlarged to support up to 16 IPMMU contexts (sets of page table)
   and up to 64 micro-TLBs per IPMMU device
 - the memory mapped registers have different bases and offset

The first part (commits #1-6) is a non-verbatim port of Linux upstream commits
needed to add support for S4 series easily (prereq work).
The second part (commits #7-8) is based on the code from the Renesas BSP and
actually introduces support for R-Car S4 IPMMU.
The third part (commits #9-10) is misc changes I have locally.

The patch series is based on 4.16.0-rc4 branch and also available at [1].

Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas Spider
board with S4 SoC.

[1] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml1

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
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 278 +++++++++++++++++++------------
 xen/drivers/passthrough/arm/smmu-v3.c    |  10 --
 xen/drivers/passthrough/arm/smmu.c       |  10 --
 5 files changed, 178 insertions(+), 133 deletions(-)

-- 
2.7.4


