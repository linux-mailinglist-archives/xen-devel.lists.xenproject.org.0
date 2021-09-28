Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B312741B5D2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198235.351621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHio-00016n-1x; Tue, 28 Sep 2021 18:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198235.351621; Tue, 28 Sep 2021 18:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHin-00014d-UB; Tue, 28 Sep 2021 18:20:53 +0000
Received: by outflank-mailman (input) for mailman id 198235;
 Tue, 28 Sep 2021 18:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHim-00012z-4e
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:20:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cf4a5dd8-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:20:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 844996D;
 Tue, 28 Sep 2021 11:20:50 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F3F73F793;
 Tue, 28 Sep 2021 11:20:49 -0700 (PDT)
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
X-Inumbo-ID: cf4a5dd8-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 06/17] xen/device-tree: Add dt_property_read_variable_u32_array helper
Date: Tue, 28 Sep 2021 19:18:15 +0100
Message-Id: <9dba5f3457d9ead9084ac73297bf5a65e665a8d9.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3

Import the Linux helper of_property_read_variable_u32_array. This
function find and read an array of 32 bit integers from a property,
with bounds on the minimum and maximum array size.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3:
- Modify commit message to include upstream Linux commit-id not stable 
  Linux commit-id
Change in v2: Patch introduced in v2
---
 xen/common/device_tree.c      | 61 +++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h | 26 +++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 03d25a81ce..53160d61f8 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -208,6 +208,67 @@ int dt_property_read_string(const struct dt_device_node *np,
     return 0;
 }
 
+/**
+ * dt_find_property_value_of_size
+ *
+ * @np:     device node from which the property value is to be read.
+ * @propname:   name of the property to be searched.
+ * @min:    minimum allowed length of property value
+ * @max:    maximum allowed length of property value (0 means unlimited)
+ * @len:    if !=NULL, actual length is written to here
+ *
+ * Search for a property in a device node and valid the requested size.
+ *
+ * Return: The property value on success, -EINVAL if the property does not
+ * exist, -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data is too small or too large.
+ */
+static void *dt_find_property_value_of_size(const struct dt_device_node *np,
+                                            const char *propname, u32 min,
+                                            u32 max, size_t *len)
+{
+    const struct dt_property *prop = dt_find_property(np, propname, NULL);
+
+    if ( !prop )
+        return ERR_PTR(-EINVAL);
+    if ( !prop->value )
+        return ERR_PTR(-ENODATA);
+    if ( prop->length < min )
+        return ERR_PTR(-EOVERFLOW);
+    if ( max && prop->length > max )
+        return ERR_PTR(-EOVERFLOW);
+
+    if ( len )
+        *len = prop->length;
+
+    return prop->value;
+}
+
+int dt_property_read_variable_u32_array(const struct dt_device_node *np,
+                                        const char *propname, u32 *out_values,
+                                        size_t sz_min, size_t sz_max)
+{
+    size_t sz, count;
+    const __be32 *val = dt_find_property_value_of_size(np, propname,
+                        (sz_min * sizeof(*out_values)),
+                        (sz_max * sizeof(*out_values)),
+                        &sz);
+
+    if ( IS_ERR(val) )
+        return PTR_ERR(val);
+
+    if ( !sz_max )
+        sz = sz_min;
+    else
+        sz /= sizeof(*out_values);
+
+    count = sz;
+    while ( count-- )
+        *out_values++ = be32_to_cpup(val++);
+
+    return sz;
+}
+
 int dt_property_match_string(const struct dt_device_node *np,
                              const char *propname, const char *string)
 {
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index b02696be94..1693fb8e8c 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -366,6 +366,32 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
 bool_t dt_property_read_u64(const struct dt_device_node *np,
                             const char *name, u64 *out_value);
 
+
+/**
+ * dt_property_read_variable_u32_array - Find and read an array of 32 bit
+ * integers from a property, with bounds on the minimum and maximum array size.
+ *
+ * @np:     device node from which the property value is to be read.
+ * @propname:   name of the property to be searched.
+ * @out_values: pointer to return found values.
+ * @sz_min: minimum number of array elements to read
+ * @sz_max: maximum number of array elements to read, if zero there is no
+ *      upper limit on the number of elements in the dts entry but only
+ *      sz_min will be read.
+ *
+ * Search for a property in a device node and read 32-bit value(s) from
+ * it.
+ *
+ * Return: The number of elements read on success, -EINVAL if the property
+ * does not exist, -ENODATA if property does not have a value, and -EOVERFLOW
+ * if the property data is smaller than sz_min or longer than sz_max.
+ *
+ * The out_values is modified only if a valid u32 value can be decoded.
+ */
+int dt_property_read_variable_u32_array(const struct dt_device_node *np,
+                                        const char *propname, u32 *out_values,
+                                        size_t sz_min, size_t sz_max);
+
 /**
  * dt_property_read_bool - Check if a property exists
  * @np: node to get the value
-- 
2.17.1


