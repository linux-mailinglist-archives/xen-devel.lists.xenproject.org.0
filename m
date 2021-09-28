Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A658C41B5D5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198249.351644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHje-0002LB-LI; Tue, 28 Sep 2021 18:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198249.351644; Tue, 28 Sep 2021 18:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHje-0002JC-Fs; Tue, 28 Sep 2021 18:21:46 +0000
Received: by outflank-mailman (input) for mailman id 198249;
 Tue, 28 Sep 2021 18:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHjd-0002Ii-4Q
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:21:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6ae4ebc5-0c61-4d20-af29-907f25ad8507;
 Tue, 28 Sep 2021 18:21:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB296D;
 Tue, 28 Sep 2021 11:21:43 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014CB3F793;
 Tue, 28 Sep 2021 11:21:42 -0700 (PDT)
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
X-Inumbo-ID: 6ae4ebc5-0c61-4d20-af29-907f25ad8507
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 08/17] xen/device-tree: Add dt_get_pci_domain_nr helper
Date: Tue, 28 Sep 2021 19:18:17 +0100
Message-Id: <f70ac215cd0c62d71231b8f61f12c1f8d801710e.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

Based Linux commit 41e5c0f81d3e676d671d96a0a1fafb27abfbd9d7

Import the Linux helper of_get_pci_domain_nr. This function will try to
obtain the host bridge domain number by finding a property called
"linux,pci-domain" of the given device node.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3:
- Modify commit message to include upstream Linux commit-id not stable
  Linux commit-id
- Remove return value as those are not valid for XEN
Change in v2: Patch introduced in v2
---
 xen/common/device_tree.c      | 12 ++++++++++++
 xen/include/xen/device_tree.h | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 53160d61f8..ea93da1725 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2183,6 +2183,18 @@ void __init dt_unflatten_host_device_tree(void)
     dt_alias_scan();
 }
 
+int dt_get_pci_domain_nr(struct dt_device_node *node)
+{
+    u32 domain;
+    int error;
+
+    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
+    if ( !error )
+        return -EINVAL;
+
+    return (u16)domain;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 3ffe3eb3d2..2297c59ce6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -832,6 +832,23 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
                                const char *list_name,
                                const char *cells_name);
 
+/**
+ * dt_get_pci_domain_nr - Find the host bridge domain number
+ *            of the given device node.
+ * @node: Device tree node with the domain information.
+ *
+ * This function will try to obtain the host bridge domain number by finding
+ * a property called "linux,pci-domain" of the given device node.
+ *
+ * Return:
+ * * > 0    - On success, an associated domain number.
+ * * -EINVAL    - The property "linux,pci-domain" does not exist.
+ *
+ * Returns the associated domain number from DT in the range [0-0xffff], or
+ * a negative value if the required property is not found.
+ */
+int dt_get_pci_domain_nr(struct dt_device_node *node);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.17.1


