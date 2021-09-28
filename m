Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B1B41B5CC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198210.351589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHi3-0007bW-4F; Tue, 28 Sep 2021 18:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198210.351589; Tue, 28 Sep 2021 18:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHi2-0007Zl-Vp; Tue, 28 Sep 2021 18:20:06 +0000
Received: by outflank-mailman (input) for mailman id 198210;
 Tue, 28 Sep 2021 18:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHi1-0006l6-HU
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:20:05 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ae47c80b-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:19:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 734E46D;
 Tue, 28 Sep 2021 11:19:56 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E1703F793;
 Tue, 28 Sep 2021 11:19:55 -0700 (PDT)
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
X-Inumbo-ID: ae47c80b-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with ACPI && HAS_PCI
Date: Tue, 28 Sep 2021 19:18:12 +0100
Message-Id: <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

prelink.o: In function `pcie_aer_get_firmware_first’:
drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_parse'

Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
architecture. APEI not supported on ARM yet move the code under
CONFIG_X86 flag to gate the code for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Change in v3: Added Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v2: Add in code comment "APEI not supported on ARM yet"
---
 xen/drivers/passthrough/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 8996403161..d774a6154e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1150,7 +1150,8 @@ void __hwdom_init setup_hwdom_pci_devices(
     pcidevs_unlock();
 }
 
-#ifdef CONFIG_ACPI
+/* APEI not supported on ARM yet. */
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 #include <acpi/acpi.h>
 #include <acpi/apei.h>
 
-- 
2.17.1


