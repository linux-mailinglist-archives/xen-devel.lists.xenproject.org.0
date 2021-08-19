Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0863D3F18C5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168661.307930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgps-0007fJ-P5; Thu, 19 Aug 2021 12:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168661.307930; Thu, 19 Aug 2021 12:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgps-0007cp-Ke; Thu, 19 Aug 2021 12:07:52 +0000
Received: by outflank-mailman (input) for mailman id 168661;
 Thu, 19 Aug 2021 12:07:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgpr-0007cb-OH
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:07:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c59c1134-6d59-4ab3-94a4-2c3029f94130;
 Thu, 19 Aug 2021 12:07:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE0831B;
 Thu, 19 Aug 2021 05:07:50 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53BD83F70D;
 Thu, 19 Aug 2021 05:07:49 -0700 (PDT)
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
X-Inumbo-ID: c59c1134-6d59-4ab3-94a4-2c3029f94130
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
Date: Thu, 19 Aug 2021 13:02:49 +0100
Message-Id: <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

Add cmdline boot option "pci=on" to enable/disable the PCI init during
boot.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/pci/pci.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index d1c9cf997d..dc63bbc2a2 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -62,8 +62,38 @@ static void __init acpi_pci_init(void)
 static inline void __init acpi_pci_init(void) { }
 #endif
 
+static bool __initdata param_pci_enable;
+
+static int __init parse_pci_param(const char *arg)
+{
+    if ( !arg )
+    {
+        param_pci_enable = false;
+        return 0;
+    }
+
+    switch ( parse_bool(arg, NULL) )
+    {
+    case 0:
+        param_pci_enable = false;
+        return 0;
+    case 1:
+        param_pci_enable = true;
+        return 0;
+    }
+
+    return -EINVAL;
+}
+custom_param("pci", parse_pci_param);
+
 static int __init pci_init(void)
 {
+    /*
+     * Enable PCI when has been enabled explicitly (pci=on)
+     */
+    if ( !param_pci_enable)
+        return 0;
+
     if ( acpi_disabled )
         dt_pci_init();
     else
-- 
2.17.1


