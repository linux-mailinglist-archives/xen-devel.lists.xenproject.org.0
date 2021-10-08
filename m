Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233D426459
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204328.359463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYir8-0007fP-84; Fri, 08 Oct 2021 05:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204328.359463; Fri, 08 Oct 2021 05:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYir8-0007cG-2n; Fri, 08 Oct 2021 05:55:42 +0000
Received: by outflank-mailman (input) for mailman id 204328;
 Fri, 08 Oct 2021 05:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYir6-0007cA-SH
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:55:40 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9101059a-f8f1-44a8-a5f6-33a06cc19648;
 Fri, 08 Oct 2021 05:55:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t9so33576715lfd.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:39 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:37 -0700 (PDT)
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
X-Inumbo-ID: 9101059a-f8f1-44a8-a5f6-33a06cc19648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VysqxQApJGno/WIkIxWmmKVDKvdviGneK1iv6SsMayM=;
        b=acvElKnNqP0avJnh0bgC/ZPIGwkgWeQx644wQ+xYjVcIThzM7/7GmFBqVIUMpCEptO
         742IWZZrnFwdGrC+twKQ3ppZwDJKBlcd3JxdSThM1CheELOpZIrH3fF9R3nWHqj6z791
         P928bPebowEIeyFLRNKZrHT716VY+Ng36CroilYUfEvxJYsemC3gRMQCpwhf8jWxElWz
         JUkJe1+9/DHINfhmxOPtEjZVfhMO82USwqw9SkQj2K+4b3jmlYQpVkq1Ruoh4+cvBu6g
         PRTfKVQUkF765S1Rtspj92BmzqMulElaGWZYtJMW3jV9pH5NU4FYaWAxhBq4VDwqus1N
         Fc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VysqxQApJGno/WIkIxWmmKVDKvdviGneK1iv6SsMayM=;
        b=4OOML4qdr9W/lHzj4R9ZrlCv4E7bQ3N1zxHYcIwwF0cN7jo2UHrveMr1ibQRrHJTHL
         FbPT4Iy7JSnFudk+KlM7j+8rqOOlk65iHE5MHVModx7ODynmSNbUZCMIkrNZQOay1c8K
         aWDX27LPD1J0sWaMsDi6tqFagsQoPr2UtNQzXLJRzzykFmV8py3qRcIxAVv4iE2qFEg7
         /lIUMpdlDazF4mxAsKkkP32CqRc6JCyslQ8fbqEAmbeF5K8QBK3KI9IJ06ckgrEgJ1lG
         hJ5Q7Ba9/o+sS8MU0EUkel2u1cexzRjDq5TS8uOPapSx5nVeHapbFrzO8QZFFBMD2/MX
         qfww==
X-Gm-Message-State: AOAM5320JLjM3Zc48NNbNy0MPV3a8CnkZ2761uPH8FlbkE6h7OWi4kdJ
	lnFP4FsYMQ82mQBEqDA3YztXRmT2Qps=
X-Google-Smtp-Source: ABdhPJw5JgZNGwFi7iN743DxVBkkChQmgar0GiVWcT4Du15n0QJT+jgbrKZnuNV5RdjqReji186gDQ==
X-Received: by 2002:a05:6512:3f18:: with SMTP id y24mr8780631lfa.263.1633672538234;
        Thu, 07 Oct 2021 22:55:38 -0700 (PDT)
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
Subject: [PATCH v5 00/10] PCI devices passthrough on Arm, part 2
Date: Fri,  8 Oct 2021 08:55:25 +0300
Message-Id: <20211008055535.337436-1-andr2000@gmail.com>
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

Oleksandr Andrushchenko (9):
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
 xen/arch/arm/domain_build.c        | 57 ++++++++++--------
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
 xen/include/asm-arm/device.h       |  4 +-
 xen/include/asm-arm/pci.h          | 30 ++++++++++
 xen/include/asm-arm/setup.h        | 13 +++++
 xen/include/asm-x86/pci.h          |  2 +
 xen/include/xen/device_tree.h      |  2 +
 20 files changed, 292 insertions(+), 38 deletions(-)

-- 
2.25.1


