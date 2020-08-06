Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50823E4D2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:50:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pe3-0004XM-SB; Thu, 06 Aug 2020 23:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pe2-0004FC-Ko
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:58 +0000
X-Inumbo-ID: 6954ef09-0bf3-4d94-8bf6-5350f103198a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6954ef09-0bf3-4d94-8bf6-5350f103198a;
 Thu, 06 Aug 2020 23:49:42 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AFCE22D01;
 Thu,  6 Aug 2020 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757782;
 bh=48yV9TkD2TZYv7cImPdyFJp0Stqs2SUX0/t0o7IpwKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHiMGuXBeLAKKHmdrUk+S7Ht1wpP8C/POC2Dho1OP8zsVoEN1ZYVochY6hArtHNQB
 hT7q3b7v6MJAiRoIM8G+is0tima6EAUMURtyIs6MhRxg0J5Cw2b5SJptPY1ujdsMZA
 RdCXvOZ6apA5UMcSmeJ4eh+F1abVe7Tirbu13CUg=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 11/14] kernel-doc: public/version.h
Date: Thu,  6 Aug 2020 16:49:30 -0700
Message-Id: <20200806234933.16448-11-sstabellini@kernel.org>
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
 xen/include/public/version.h | 74 +++++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 17a81e23cd..9a7d8d26dd 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -30,19 +30,33 @@
 
 #include "xen.h"
 
-/* NB. All ops return zero on success, except XENVER_{version,pagesize}
- * XENVER_{version,pagesize,build_id} */
+/**
+ * DOC: XENVER_*
+ *
+ * NB. All ops return zero on success, except for:
+ *
+ * - XENVER_{version,pagesize}
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
@@ -51,52 +65,84 @@ struct xen_compile_info {
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


