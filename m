Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5624333BB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212953.371018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYm-00005K-5a; Tue, 19 Oct 2021 10:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212953.371018; Tue, 19 Oct 2021 10:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYm-0008Th-0K; Tue, 19 Oct 2021 10:41:32 +0000
Received: by outflank-mailman (input) for mailman id 212953;
 Tue, 19 Oct 2021 10:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mcmYj-0008TS-ON
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:41:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e14144a-30c9-11ec-830c-12813bfff9fa;
 Tue, 19 Oct 2021 10:41:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF208ED1;
 Tue, 19 Oct 2021 03:41:28 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E00A33F70D;
 Tue, 19 Oct 2021 03:41:27 -0700 (PDT)
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
X-Inumbo-ID: 1e14144a-30c9-11ec-830c-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	sstabellini@kernel.org,
	Oleksandr_Andrushchenko@epam.com,
	jbeulich@suse.com,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 1/3] xen/arm: call vpci_add_handlers on x86
Date: Tue, 19 Oct 2021 11:40:33 +0100
Message-Id: <24f88973257b7038511a0ca49a992d38b295c26f.1634639117.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634639117.git.bertrand.marquis@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen might not be able to discover at boot time all devices or some devices
might appear after specific actions from dom0.
In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
PCI devices to Xen.
As those devices where not known from Xen before, the vpci handlers must
be properly installed during pci_device_add for x86 PVH Dom0, in the
same way as what is done currently on arm (where Xen does not detect PCI
devices but relies on Dom0 to declare them all the time).

So this patch is removing the ifdef protecting the call to
vpci_add_handlers and the comment which was arm specific.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/drivers/passthrough/pci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 35e0190796..d7e09448d1 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -756,11 +756,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     if ( !pdev->domain )
     {
         pdev->domain = hardware_domain;
-#ifdef CONFIG_ARM
-        /*
-         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
-         * when Dom0 inform XEN to add the PCI devices in XEN.
-         */
         ret = vpci_add_handlers(pdev);
         if ( ret )
         {
@@ -768,7 +763,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             pdev->domain = NULL;
             goto out;
         }
-#endif
         ret = iommu_add_device(pdev);
         if ( ret )
         {
-- 
2.25.1


