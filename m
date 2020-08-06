Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACA23E4C8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdo-0004Hl-48; Thu, 06 Aug 2020 23:49:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdm-0004FE-9P
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:42 +0000
X-Inumbo-ID: de950a77-4645-4183-8609-e3c81e6c3e77
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de950a77-4645-4183-8609-e3c81e6c3e77;
 Thu, 06 Aug 2020 23:49:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 237ED22D07;
 Thu,  6 Aug 2020 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757780;
 bh=vVWvxFFs7Yr6hpfuyCAosWa4IVXyicJJf2O/VvYAi0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=If5S1EL3ji2mtq9qiY+h/4Ky85NXw1uNXd49fNwqCoCfcO+LgaxgCglvB1jOoxYIJ
 Zifs7DLec76pfR57z+Jjk/KwrYyeo2YscTgcMp6/zsZtCi+RJp4J+Tiyb/fEF+dtAs
 +9EFJ3NggIJuEl8E7YY3X1GPDaf66lYOZEKdiYWI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 07/14] kernel-doc: public/hypfs.h
Date: Thu,  6 Aug 2020 16:49:26 -0700
Message-Id: <20200806234933.16448-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hypfs.h | 72 ++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/xen/include/public/hypfs.h b/xen/include/public/hypfs.h
index 63a5df1629..ef33aee4ce 100644
--- a/xen/include/public/hypfs.h
+++ b/xen/include/public/hypfs.h
@@ -32,12 +32,21 @@
  * Definitions for the __HYPERVISOR_hypfs_op hypercall.
  */
 
-/* Highest version number of the hypfs interface currently defined. */
+/**
+ * DOC: XEN_HYPFS_VERSION
+ * Highest version number of the hypfs interface currently defined.
+ */
 #define XEN_HYPFS_VERSION      1
 
-/* Maximum length of a path in the filesystem. */
+/**
+ * DOC: XEN_HYPFS_MAX_PATHLEN
+ * Maximum length of a path in the filesystem.
+ */
 #define XEN_HYPFS_MAX_PATHLEN  1024
 
+/**
+ * struct xen_hypfs_direntry
+ */
 struct xen_hypfs_direntry {
     uint8_t type;
 #define XEN_HYPFS_TYPE_DIR     0
@@ -49,16 +58,22 @@ struct xen_hypfs_direntry {
     uint8_t encoding;
 #define XEN_HYPFS_ENC_PLAIN    0
 #define XEN_HYPFS_ENC_GZIP     1
-    uint16_t pad;              /* Returned as 0. */
-    uint32_t content_len;      /* Current length of data. */
-    uint32_t max_write_len;    /* Max. length for writes (0 if read-only). */
+    /** @pad: Returned as 0. */
+    uint16_t pad;
+    /** @content_len: Current length of data. */
+    uint32_t content_len;
+    /** @max_write_len: Max. length for writes (0 if read-only). */
+    uint32_t max_write_len;
 };
 
+/**
+ * struct xen_hypfs_dirlistentry
+ */
 struct xen_hypfs_dirlistentry {
     struct xen_hypfs_direntry e;
-    /* Offset in bytes to next entry (0 == this is the last entry). */
+    /** @off_next: Offset in bytes to next entry (0 == this is the last entry). */
     uint16_t off_next;
-    /* Zero terminated entry name, possibly with some padding for alignment. */
+    /** @name: Zero terminated entry name, possibly with some padding for alignment. */
     char name[XEN_FLEX_ARRAY_DIM];
 };
 
@@ -66,21 +81,22 @@ struct xen_hypfs_dirlistentry {
  * Hypercall operations.
  */
 
-/*
- * XEN_HYPFS_OP_get_version
+/**
+ * DOC: XEN_HYPFS_OP_get_version
  *
  * Read highest interface version supported by the hypervisor.
  *
  * arg1 - arg4: all 0/NULL
  *
  * Possible return values:
- * >0: highest supported interface version
- * <0: negative Xen errno value
+ *
+ * - >0: highest supported interface version
+ * - <0: negative Xen errno value
  */
 #define XEN_HYPFS_OP_get_version     0
 
-/*
- * XEN_HYPFS_OP_read
+/**
+ * DOC: XEN_HYPFS_OP_read
  *
  * Read a filesystem entry.
  *
@@ -95,19 +111,20 @@ struct xen_hypfs_dirlistentry {
  * The contents of a directory are multiple struct xen_hypfs_dirlistentry
  * items.
  *
- * arg1: XEN_GUEST_HANDLE(path name)
- * arg2: length of path name (including trailing zero byte)
- * arg3: XEN_GUEST_HANDLE(data buffer written by hypervisor)
- * arg4: data buffer size
+ * - arg1: XEN_GUEST_HANDLE(path name)
+ * - arg2: length of path name (including trailing zero byte)
+ * - arg3: XEN_GUEST_HANDLE(data buffer written by hypervisor)
+ * - arg4: data buffer size
  *
  * Possible return values:
- * 0: success
- * <0 : negative Xen errno value
+ *
+ * - 0: success
+ * - <0 : negative Xen errno value
  */
 #define XEN_HYPFS_OP_read              1
 
-/*
- * XEN_HYPFS_OP_write_contents
+/**
+ * DOC: XEN_HYPFS_OP_write_contents
  *
  * Write contents of a filesystem entry.
  *
@@ -115,14 +132,15 @@ struct xen_hypfs_dirlistentry {
  * The data type and encoding can't be changed. The size can be changed only
  * for blobs and strings.
  *
- * arg1: XEN_GUEST_HANDLE(path name)
- * arg2: length of path name (including trailing zero byte)
- * arg3: XEN_GUEST_HANDLE(content buffer read by hypervisor)
- * arg4: content buffer size
+ * - arg1: XEN_GUEST_HANDLE(path name)
+ * - arg2: length of path name (including trailing zero byte)
+ * - arg3: XEN_GUEST_HANDLE(content buffer read by hypervisor)
+ * - arg4: content buffer size
  *
  * Possible return values:
- * 0: success
- * <0 : negative Xen errno value
+ *
+ * - 0: success
+ * - <0: negative Xen errno value
  */
 #define XEN_HYPFS_OP_write_contents    2
 
-- 
2.17.1


