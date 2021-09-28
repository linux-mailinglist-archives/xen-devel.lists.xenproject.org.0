Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2441B5D3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198245.351633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHjK-0001mS-BE; Tue, 28 Sep 2021 18:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198245.351633; Tue, 28 Sep 2021 18:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHjK-0001kZ-7M; Tue, 28 Sep 2021 18:21:26 +0000
Received: by outflank-mailman (input) for mailman id 198245;
 Tue, 28 Sep 2021 18:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHjJ-0001kM-3o
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:21:25 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e351fd90-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:21:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 249EB6D;
 Tue, 28 Sep 2021 11:21:24 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F6233F793;
 Tue, 28 Sep 2021 11:21:23 -0700 (PDT)
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
X-Inumbo-ID: e351fd90-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 07/17] xen/device-tree: Add dt_property_read_u32_array helper
Date: Tue, 28 Sep 2021 19:18:16 +0100
Message-Id: <89788e202bc91e2bc7f9c3c33eb91ab7478381ee.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3

Import the Linux helper of_property_read_u32_array. This function find
and read an array of 32 bit integers from a property.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3:
- Modify commit message to include upstream Linux commit-id not stable
  Linux commit-id
Change in v2: Patch introduced in v2
---
 xen/include/xen/device_tree.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1693fb8e8c..3ffe3eb3d2 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -392,6 +392,36 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
                                         const char *propname, u32 *out_values,
                                         size_t sz_min, size_t sz_max);
 
+/**
+ * dt_property_read_u32_array - Find and read an array of 32 bit integers
+ * from a property.
+ *
+ * @np:     device node from which the property value is to be read.
+ * @propname:   name of the property to be searched.
+ * @out_values: pointer to return value, modified only if return value is 0.
+ * @sz:     number of array elements to read
+ *
+ * Search for a property in a device node and read 32-bit value(s) from
+ * it.
+ *
+ * Return: 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_values is modified only if a valid u32 value can be decoded.
+ */
+static inline int dt_property_read_u32_array(const struct dt_device_node *np,
+                                             const char *propname,
+                                             u32 *out_values, size_t sz)
+{
+    int ret = dt_property_read_variable_u32_array(np, propname, out_values,
+                              sz, 0);
+    if ( ret >= 0 )
+        return 0;
+    else
+        return ret;
+}
+
 /**
  * dt_property_read_bool - Check if a property exists
  * @np: node to get the value
-- 
2.17.1


