Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16B2945B8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9801.25916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YO-0008Pg-VJ; Wed, 21 Oct 2020 00:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9801.25916; Wed, 21 Oct 2020 00:00:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YO-0008OJ-KI; Wed, 21 Oct 2020 00:00:32 +0000
Received: by outflank-mailman (input) for mailman id 9801;
 Wed, 21 Oct 2020 00:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YM-0007xs-4E
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8554e9df-0934-4c6d-bbff-85f9cf6d6015;
 Wed, 21 Oct 2020 00:00:17 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB2D422456;
 Wed, 21 Oct 2020 00:00:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YM-0007xs-4E
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:30 +0000
X-Inumbo-ID: 8554e9df-0934-4c6d-bbff-85f9cf6d6015
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8554e9df-0934-4c6d-bbff-85f9cf6d6015;
	Wed, 21 Oct 2020 00:00:17 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BB2D422456;
	Wed, 21 Oct 2020 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238417;
	bh=FBjcGWAj+YnmSwU5NH4MugavkY7ULNZqmOgxz/8AjMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJ8nE7nmg0R8bp2UE3eF9iTeyPeZGBY7QS8au/ZP4etB/s3I+4VBscy1Lv5K1du+M
	 g1rIUsKiqPLYzkzGYH65C/al2KaJplssCLQGh3BbE4uXqst82392N+/fizDmdpovRD
	 Ikutmgt+D/FIFkaMUAPIfcGLBBXtKrewjoIZLfdA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 07/14] kernel-doc: public/hypfs.h
Date: Tue, 20 Oct 2020 17:00:04 -0700
Message-Id: <20201021000011.15351-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hypfs.h | 72 ++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/xen/include/public/hypfs.h b/xen/include/public/hypfs.h
index 2b7a66d68d..62a33a1646 100644
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
@@ -49,17 +58,23 @@ struct xen_hypfs_direntry {
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
 typedef struct xen_hypfs_direntry xen_hypfs_direntry_t;
 
+/**
+ * struct xen_hypfs_dirlistentry
+ */
 struct xen_hypfs_dirlistentry {
     xen_hypfs_direntry_t e;
-    /* Offset in bytes to next entry (0 == this is the last entry). */
+    /** @off_next: Offset in bytes to next entry (0 == this is the last entry). */
     uint16_t off_next;
-    /* Zero terminated entry name, possibly with some padding for alignment. */
+    /** @name: Zero terminated entry name, possibly with some padding for alignment. */
     char name[XEN_FLEX_ARRAY_DIM];
 };
 
@@ -67,21 +82,22 @@ struct xen_hypfs_dirlistentry {
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
@@ -96,19 +112,20 @@ struct xen_hypfs_dirlistentry {
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
@@ -116,14 +133,15 @@ struct xen_hypfs_dirlistentry {
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


