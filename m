Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1A3F18BC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168616.307853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgnh-0003Pa-K7; Thu, 19 Aug 2021 12:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168616.307853; Thu, 19 Aug 2021 12:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgnh-0003Nn-GE; Thu, 19 Aug 2021 12:05:37 +0000
Received: by outflank-mailman (input) for mailman id 168616;
 Thu, 19 Aug 2021 12:05:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgng-0003MP-6D
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:05:36 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f3b74f15-2acf-4137-b983-af5b37feea4e;
 Thu, 19 Aug 2021 12:05:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C077431B;
 Thu, 19 Aug 2021 05:05:34 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F41733F70D;
 Thu, 19 Aug 2021 05:05:33 -0700 (PDT)
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
X-Inumbo-ID: f3b74f15-2acf-4137-b983-af5b37feea4e
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with ACPI && HAS_PCI
Date: Thu, 19 Aug 2021 13:02:43 +0100
Message-Id: <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
architecture. Move the code under CONFIG_X86 flag to gate the code for
ARM.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 67f5686ab6..c23c8cb06b 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1150,7 +1150,7 @@ void __hwdom_init setup_hwdom_pci_devices(
     pcidevs_unlock();
 }
 
-#ifdef CONFIG_ACPI
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 #include <acpi/acpi.h>
 #include <acpi/apei.h>
 
-- 
2.17.1


