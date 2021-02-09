Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB4315732
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 20:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83402.155126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Z4u-0002MA-0g; Tue, 09 Feb 2021 19:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83402.155126; Tue, 09 Feb 2021 19:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Z4t-0002Lk-Tm; Tue, 09 Feb 2021 19:53:39 +0000
Received: by outflank-mailman (input) for mailman id 83402;
 Tue, 09 Feb 2021 19:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9Z4s-0002Ld-BL
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 19:53:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8651265-d30a-43c8-a770-011d65eba556;
 Tue, 09 Feb 2021 19:53:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D73964E7D;
 Tue,  9 Feb 2021 19:53:36 +0000 (UTC)
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
X-Inumbo-ID: d8651265-d30a-43c8-a770-011d65eba556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612900416;
	bh=142UJrDAH4ZHWpdBmuC4nsTiOOGx3iM5WQFQL38gVa0=;
	h=From:To:Cc:Subject:Date:From;
	b=HEz7/geGw6O9fqLT4gvMqPbAF12Dzy46pM6FOOGyMbqaPrQjvG1aBgPHf8VQcvqaF
	 1L3ny1erEqFvmAnD9LOp0Itw/mchCe/nl1d1LIbYWy4EJNW8EHBX+GFz25YbXSOqo9
	 QXojnzLYCcr796mTQQUjHF8RVwZ4iYKkCPzkXRhbFk+OfW73bMYksvD+CTMtb7fRqB
	 10pYqxyfRIOFy6BAym53HyBIA68a0k6t9V7KY/qS1wwEhcYlaY3cOm0+cMw9e4BTOU
	 ObptFsV4/K61S8oc7Gtq886eAv38H5DdPrvQt5ZRZxJWoW0MuO5hHBfKFwU/qtC809
	 oMZ5ytC8WDMYA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	ehem+xen@m5p.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen: workaround missing device_type property in pci/pcie nodes
Date: Tue,  9 Feb 2021 11:53:34 -0800
Message-Id: <20210209195334.21206-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

PCI buses differ from default buses in a few important ways, so it is
important to detect them properly. Normally, PCI buses are expected to
have the following property:

    device_type = "pci"

In reality, it is not always the case. To handle PCI bus nodes that
don't have the device_type property, also consider the node name: if the
node name is "pcie" or "pci" then consider the bus as a PCI bus.

This commit is based on the Linux kernel commit
d1ac0002dd29 "of: address: Work around missing device_type property in
pcie nodes".

This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
on their device trees:

&pcie0 {
	pci@1,0 {
		#address-cells = <3>;
		#size-cells = <2>;
		ranges;

		reg = <0 0 0 0 0>;

		usb@1,0 {
				reg = <0x10000 0 0 0 0>;
				resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
		};
	};
};

The pci@1,0 node is a PCI bus. If we parse the node and its children as
a default bus, the reg property under usb@1,0 would have to be
interpreted as an address range mappable by the CPU, which is not the
case and would break.

Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- improve commit message

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 18825e333e..f1a96a3b90 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
  * PCI bus specific translator
  */
 
+static bool_t dt_node_is_pci(const struct dt_device_node *np)
+{
+    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
+
+    if (is_pci)
+        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
+
+    return is_pci;
+}
+
 static bool_t dt_bus_pci_match(const struct dt_device_node *np)
 {
     /*
      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
      * powermacs "ht" is hypertransport
+     *
+     * If none of the device_type match, and that the node name is
+     * "pcie" or "pci", accept the device as PCI (with a warning).
      */
     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
+        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
+        dt_node_is_pci(np);
 }
 
 static void dt_bus_pci_count_cells(const struct dt_device_node *np,

