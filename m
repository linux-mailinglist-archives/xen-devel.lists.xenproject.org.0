Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F44147F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192565.343073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0Zb-0008JX-QF; Wed, 22 Sep 2021 11:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192565.343073; Wed, 22 Sep 2021 11:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0Zb-0008Gz-Ms; Wed, 22 Sep 2021 11:37:59 +0000
Received: by outflank-mailman (input) for mailman id 192565;
 Wed, 22 Sep 2021 11:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0Za-0008Gc-Bt
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:37:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2e26ecf1-1f2d-4167-9210-37c43a669938;
 Wed, 22 Sep 2021 11:37:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F11011B3;
 Wed, 22 Sep 2021 04:37:57 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39D573F719;
 Wed, 22 Sep 2021 04:37:56 -0700 (PDT)
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
X-Inumbo-ID: 2e26ecf1-1f2d-4167-9210-37c43a669938
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 07/17] xen/device-tree: Add dt_property_read_u32_array helper
Date: Wed, 22 Sep 2021 12:34:53 +0100
Message-Id: <852610e258d4c36888b68771061afdc0df95e401.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3fc

Import the Linux helper of_property_read_u32_array. This function find
and read an array of 32 bit integers from a property.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2: Patch introduced in v2
---
 xen/include/xen/device_tree.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1693fb8e8c..497144b8a7 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -366,7 +366,6 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
 bool_t dt_property_read_u64(const struct dt_device_node *np,
                             const char *name, u64 *out_value);
 
-
 /**
  * dt_property_read_variable_u32_array - Find and read an array of 32 bit
  * integers from a property, with bounds on the minimum and maximum array size.
@@ -392,6 +391,36 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
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


