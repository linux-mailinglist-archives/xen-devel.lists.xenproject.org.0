Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047AF2D62CD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 18:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49591.87719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPIL-0006SE-4q; Thu, 10 Dec 2020 16:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49591.87719; Thu, 10 Dec 2020 16:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPIL-0006Rn-0S; Thu, 10 Dec 2020 16:59:57 +0000
Received: by outflank-mailman (input) for mailman id 49591;
 Thu, 10 Dec 2020 16:59:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLK9=FO=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1knPIJ-0006R7-Bb
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:59:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e03e9275-5d13-4ebf-ba32-7557c250fe9d;
 Thu, 10 Dec 2020 16:59:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6286E30E;
 Thu, 10 Dec 2020 08:59:51 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4173F66B;
 Thu, 10 Dec 2020 08:59:50 -0800 (PST)
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
X-Inumbo-ID: e03e9275-5d13-4ebf-ba32-7557c250fe9d
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 5/8] xen/device-tree: Add dt_property_match_string helper
Date: Thu, 10 Dec 2020 16:57:03 +0000
Message-Id: <2cf4c10d0ce81290af96e29ee364df87c06ef849.1607617848.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607617848.git.rahul.singh@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
In-Reply-To: <cover.1607617848.git.rahul.singh@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>

Import the Linux helper of_property_match_string. This function searches
a string list property and returns the index of a specific string value.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - This patch is introduce in this verison.

---
 xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index e107c6f89f..18825e333e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -208,6 +208,33 @@ int dt_property_read_string(const struct dt_device_node *np,
     return 0;
 }
 
+int dt_property_match_string(const struct dt_device_node *np,
+                             const char *propname, const char *string)
+{
+    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
+    size_t l;
+    int i;
+    const char *p, *end;
+
+    if ( !dtprop )
+        return -EINVAL;
+    if ( !dtprop->value )
+        return -ENODATA;
+
+    p = dtprop->value;
+    end = p + dtprop->length;
+
+    for ( i = 0; p < end; i++, p += l )
+    {
+        l = strnlen(p, end - p) + 1;
+        if ( p + l > end )
+            return -EILSEQ;
+        if ( strcmp(string, p) == 0 )
+            return i; /* Found it; return index */
+    }
+    return -ENODATA;
+}
+
 bool_t dt_device_is_compatible(const struct dt_device_node *device,
                                const char *compat)
 {
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index f2ad22b79c..b02696be94 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -400,6 +400,18 @@ static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
 int dt_property_read_string(const struct dt_device_node *np,
                             const char *propname, const char **out_string);
 
+/**
+ * dt_property_match_string() - Find string in a list and return index
+ * @np: pointer to node containing string list property
+ * @propname: string list property name
+ * @string: pointer to string to search for in string list
+ *
+ * This function searches a string list property and returns the index
+ * of a specific string value.
+ */
+int dt_property_match_string(const struct dt_device_node *np,
+                             const char *propname, const char *string);
+
 /**
  * Checks if the given "compat" string matches one of the strings in
  * the device's "compatible" property
-- 
2.17.1


