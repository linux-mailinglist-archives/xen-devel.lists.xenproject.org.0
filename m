Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07C4147ED
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192558.343062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0ZE-0007iA-I7; Wed, 22 Sep 2021 11:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192558.343062; Wed, 22 Sep 2021 11:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0ZE-0007df-Dn; Wed, 22 Sep 2021 11:37:36 +0000
Received: by outflank-mailman (input) for mailman id 192558;
 Wed, 22 Sep 2021 11:37:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0ZD-0007Zf-5P
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:37:35 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c222c13e-8bb5-4352-b475-868966b89b92;
 Wed, 22 Sep 2021 11:37:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B95711B3;
 Wed, 22 Sep 2021 04:37:33 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8664C3F719;
 Wed, 22 Sep 2021 04:37:32 -0700 (PDT)
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
X-Inumbo-ID: c222c13e-8bb5-4352-b475-868966b89b92
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 06/17] xen/device-tree: Add dt_property_read_variable_u32_array helper
Date: Wed, 22 Sep 2021 12:34:52 +0100
Message-Id: <35eb7ec429da3a9e1af626af4521c13c9683f8fd.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3fc

Import the Linux helper of_property_read_variable_u32_array. This
function find and read an array of 32 bit integers from a property,
with bounds on the minimum and maximum array size.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
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


