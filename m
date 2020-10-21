Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CB2945B9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9808.25975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YZ-0000MK-8H; Wed, 21 Oct 2020 00:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9808.25975; Wed, 21 Oct 2020 00:00:43 +0000
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
	id 1kV1YZ-0000KF-1k; Wed, 21 Oct 2020 00:00:43 +0000
Received: by outflank-mailman (input) for mailman id 9808;
 Wed, 21 Oct 2020 00:00:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YW-0007y0-Oa
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 594c8c1c-e70f-4bd0-b6c6-0fac37da93a2;
 Wed, 21 Oct 2020 00:00:20 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A514223C6;
 Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YW-0007y0-Oa
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:40 +0000
X-Inumbo-ID: 594c8c1c-e70f-4bd0-b6c6-0fac37da93a2
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 594c8c1c-e70f-4bd0-b6c6-0fac37da93a2;
	Wed, 21 Oct 2020 00:00:20 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4A514223C6;
	Wed, 21 Oct 2020 00:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238419;
	bh=6u2KSXtfrsaVwSC07uOvcRnYvoWFFX+5NVhxF6ZAfeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uI445BEQ3WXlCwAp+fCf9meuqPiAQpURQ2fhdw9F2H1qOeAw5boeDg0tiXYXBFPr3
	 esoYaMG5hYToRovIhOkIB9BUCkyvGzVXgjvxwbc77B5ioQ50g4iKotEOJQx3bw7Oys
	 a0NOiUZlKb0xghZEcWyVaOYjlpcI7BRnSHTJNmdQ=
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
Subject: [PATCH v2 11/14] kernel-doc: public/version.h
Date: Tue, 20 Oct 2020 17:00:08 -0700
Message-Id: <20201021000011.15351-11-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- remove "- XENVER_{version,pagesize}"
---
 xen/include/public/version.h | 73 +++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 17a81e23cd..47bb04961e 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -30,19 +30,32 @@
 
 #include "xen.h"
 
-/* NB. All ops return zero on success, except XENVER_{version,pagesize}
- * XENVER_{version,pagesize,build_id} */
+/**
+ * DOC: XENVER_*
+ *
+ * NB. All ops return zero on success, except for:
+ *
+ * - XENVER_{version,pagesize,build_id}
+ */
 
-/* arg == NULL; returns major:minor (16:16). */
+/**
+ * DOC: XENVER_version
+ * @arg == NULL; returns major:minor (16:16).
+ */
 #define XENVER_version      0
 
-/* arg == xen_extraversion_t. */
+/**
+ * DOC: XENVER_extraversion
+ * @arg == xen_extraversion_t.
+ */
 #define XENVER_extraversion 1
 typedef char xen_extraversion_t[16];
 #define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
 
-/* arg == xen_compile_info_t. */
 #define XENVER_compile_info 2
+/**
+ * struct xen_compile_info - XENVER_compile_info
+ */
 struct xen_compile_info {
     char compiler[64];
     char compile_by[16];
@@ -51,52 +64,84 @@ struct xen_compile_info {
 };
 typedef struct xen_compile_info xen_compile_info_t;
 
+/**
+ * DOC: XENVER_capabilities
+ * @arg: xen_capabilities_info_t
+ */
 #define XENVER_capabilities 3
 typedef char xen_capabilities_info_t[1024];
 #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
 
+/**
+ * DOC: XENVER_changeset
+ * @arg: xen_changeset_info_t
+ */
 #define XENVER_changeset 4
 typedef char xen_changeset_info_t[64];
 #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
 
 #define XENVER_platform_parameters 5
+/**
+ * struct xen_platform_parameters - XENVER_platform_parameters
+ */
 struct xen_platform_parameters {
     xen_ulong_t virt_start;
 };
 typedef struct xen_platform_parameters xen_platform_parameters_t;
 
 #define XENVER_get_features 6
+/**
+ * struct xen_feature_info - XENVER_get_features
+ */
 struct xen_feature_info {
-    unsigned int submap_idx;    /* IN: which 32-bit submap to return */
-    uint32_t     submap;        /* OUT: 32-bit submap */
+    /** @submap_idx: IN: which 32-bit submap to return */
+    unsigned int submap_idx;
+    /** @submap: OUT: 32-bit submap */
+    uint32_t     submap;
 };
 typedef struct xen_feature_info xen_feature_info_t;
 
-/* Declares the features reported by XENVER_get_features. */
+/**
+ * DOC: features.h
+ * Declares the features reported by XENVER_get_features.
+ */
 #include "features.h"
 
-/* arg == NULL; returns host memory page size. */
+/**
+ * DOC: XENVER_pagesize
+ * @arg == NULL; returns host memory page size.
+ */
 #define XENVER_pagesize 7
 
-/* arg == xen_domain_handle_t.
+/**
+ * DOC: XENVER_guest_handle
+ *
+ * @arg == xen_domain_handle_t.
  *
  * The toolstack fills it out for guest consumption. It is intended to hold
  * the UUID of the guest.
  */
 #define XENVER_guest_handle 8
 
+/**
+ * DOC: XENVER_commandline
+ * @arg: xen_commandline_t
+ */
 #define XENVER_commandline 9
 typedef char xen_commandline_t[1024];
 
-/*
+#define XENVER_build_id 10
+/**
+ * struct xen_build_id - XENVER_build_id
+ *
  * Return value is the number of bytes written, or XEN_Exx on error.
  * Calling with empty parameter returns the size of build_id.
  */
-#define XENVER_build_id 10
 struct xen_build_id {
-        uint32_t        len; /* IN: size of buf[]. */
+        /** @len: IN: size of buf[]. */
+        uint32_t        len;
+        /** @buf: OUT: Variable length buffer with build_id. */
         unsigned char   buf[XEN_FLEX_ARRAY_DIM];
-                             /* OUT: Variable length buffer with build_id. */
 };
 typedef struct xen_build_id xen_build_id_t;
 
-- 
2.17.1


