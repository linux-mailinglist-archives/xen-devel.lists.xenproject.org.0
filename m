Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47C3FFC16
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177835.323547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4e1-0006nd-Dn; Fri, 03 Sep 2021 08:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177835.323547; Fri, 03 Sep 2021 08:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4e1-0006kW-AV; Fri, 03 Sep 2021 08:33:53 +0000
Received: by outflank-mailman (input) for mailman id 177835;
 Fri, 03 Sep 2021 08:33:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4dz-0006kQ-Jc
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:33:51 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3764bfc1-031b-4d72-96d0-123a32cca3d1;
 Fri, 03 Sep 2021 08:33:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j13so6893466edv.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:50 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:48 -0700 (PDT)
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
X-Inumbo-ID: 3764bfc1-031b-4d72-96d0-123a32cca3d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XT9IurSUZ2x5a+pdMA7R9m7eqgBNcFs0ABtEwva/rOk=;
        b=KH3T7H6XUTIO6kln10N/XlkP8zdINoBf8lwUi0XQJKd3eTct3CAeswZD1DLkoz411o
         HUui7uH/2IXPivd79xANiGs9dP1FXSRRH6o6HsQ+TGuJ1+wD/UP64P73vzqEovMOD2C2
         hyvQaXvyOA9fPsQOtEk69TV4XFur7vWkxPP50YZjReOl7udubtCsEtEx5rmon0ofhDVW
         qM3QQkgy3BS2RXc5yRPfi/5bUfBCI5mi0RMyXAfKaQ1lmxWDoUVkoIEbOeB5MZb6IxNi
         0idRKSrO3nWli6QKp4FxTiIg5+vmqcyzi6Ly8ksc5KOFpTlKK5o05svXNQpHVDStaCUE
         ynKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XT9IurSUZ2x5a+pdMA7R9m7eqgBNcFs0ABtEwva/rOk=;
        b=WtVYx+mcZyc2lCj5KSAt8RZ1LucXX/DjXvq0K7MUtWrg6Iuzj5nDH2C464hBnitVWz
         FVWkcpZakU6dH7mMJsbHpGEVj7LCGEFU6Jq+CjqWbN5BUvUlTJ18Z1qTRi9jZ0W22unM
         0KOgLcPD7Noenn8UwDMrj5aoSeAwWA3QgV7VJRHOQSrwtTVXVu4pB8OH08z1ivmCuKVk
         EpsGg66GmHORg0aP15GWU/dlaD09PwjypjV7XcS5ZQJnHzuNyAUuQSMLMIRm3Z7REkfk
         I5eFTKi2jMrBpPmmlhhHcoOkjSYA1EZeKt6vXd6KL2+f2r/olJpX+AoYcrOFdMZpeHfD
         DWOw==
X-Gm-Message-State: AOAM531ISQXsqbWGA4UlIZgZ99+cld125r0qpy2Pc/A8GlqPjLvKC5ta
	A/49a+E+VMOrwYaF1dxtz0CdNVTJdGE=
X-Google-Smtp-Source: ABdhPJwOTG2NN7AeYtisr6AO0pYLJ2YbABVf7/DstvKMpb2rCJEQH5vNugO7k5U5hKNMG3xdF37o5w==
X-Received: by 2002:a05:6402:84e:: with SMTP id b14mr2731110edz.260.1630658029127;
        Fri, 03 Sep 2021 01:33:49 -0700 (PDT)
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
Subject: [PATCH 00/11] PCI devices passthrough on Arm, part 2
Date: Fri,  3 Sep 2021 11:33:36 +0300
Message-Id: <20210903083347.131786-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

This is an assorted series of patches which aim is to make some further
basis for PCI passthrough on Arm support. The series continues the work
published earlier by Arm [1] and adds new helpers and clears the way for
vPCI changes which will follow.

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/cover/cover.1629366665.git.rahul.singh@arm.com/

Oleksandr Andrushchenko (10):
  xen/arm: Add new device type for PCI
  xen/arm: Add dev_to_pci helper
  xen/arm: Introduce pci_find_host_bridge_node helper
  xen/device-tree: Make dt_find_node_by_phandle global
  xen/arm: Mark device as PCI while creating one
  libxl: Allow removing PCI devices for all types of domains
  libxl: Only map legacy PCI IRQs if they are supported
  xen/arm: Setup MMIO range trap handlers for hardware domain
  xen/arm: Do not map PCI ECAM space to Domain-0's p2m
  xen/arm: Process pending vPCI map/unmap operations

Oleksandr Tyshchenko (1):
  xen/domain: Call pci_release_devices() when releasing domain resources

 tools/libs/light/Makefile          |  4 +++
 tools/libs/light/libxl_pci.c       | 15 ++++++--
 xen/arch/arm/domain.c              |  9 ++++-
 xen/arch/arm/domain_build.c        |  3 ++
 xen/arch/arm/pci/ecam.c            | 28 +++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 55 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci.c             | 10 ++++++
 xen/arch/arm/traps.c               |  6 ++++
 xen/arch/arm/vpci.c                | 13 +++++++
 xen/common/device_tree.c           |  2 +-
 xen/drivers/passthrough/pci.c      |  3 ++
 xen/include/asm-arm/device.h       |  6 ++--
 xen/include/asm-arm/pci.h          | 30 +++++++++++++++-
 xen/include/xen/device_tree.h      |  2 ++
 14 files changed, 178 insertions(+), 8 deletions(-)

-- 
2.25.1


