Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60642F49D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210644.367634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkb-0003cb-Vb; Fri, 15 Oct 2021 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210644.367634; Fri, 15 Oct 2021 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkb-0003Zh-QT; Fri, 15 Oct 2021 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 210644;
 Fri, 15 Oct 2021 13:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbNka-00020z-7U
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:59:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3be2732e-6ea7-4ff9-a604-330bc3adcd15;
 Fri, 15 Oct 2021 13:59:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4403014BF;
 Fri, 15 Oct 2021 06:59:44 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9A03F694;
 Fri, 15 Oct 2021 06:59:43 -0700 (PDT)
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
X-Inumbo-ID: 3be2732e-6ea7-4ff9-a604-330bc3adcd15
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Michal Orzel <michal.orzel@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 4/5] tools/libxl_arm: Modify libxl__prepare_dtb...
Date: Fri, 15 Oct 2021 14:59:21 +0100
Message-Id: <a016279b31ad0b0801bb8cd36c0b84c95db0bd09.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Orzel <michal.orzel@arm.com>

... to take a second argument of type libxl_domain_config*
rather than libxl_domain_build_info*.

This change will be needed to get access from
libxl__prepare_dtb to "num_pcidevs" field of
libxl_domain_config to check whether to create
a vPCI DT node or not.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Suggested-by: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_arm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index d5771f98dd..fdae129605 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -878,7 +878,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
 
 #define FDT_MAX_SIZE (1<<20)
 
-static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_build_info *info,
+static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                               libxl__domain_build_state *state,
                               struct xc_dom_image *dom)
 {
@@ -887,6 +887,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_build_info *info,
     int rc, res;
     size_t fdt_size = 0;
     int pfdt_size = 0;
+    libxl_domain_build_info *const info = &d_config->b_info;
 
     const libxl_version_info *vers;
     const struct arch_info *ainfo;
@@ -1042,7 +1043,7 @@ int libxl__arch_domain_init_hw_description(libxl__gc *gc,
     if (rc)
         return rc;
 
-    rc = libxl__prepare_dtb(gc, info, state, dom);
+    rc = libxl__prepare_dtb(gc, d_config, state, dom);
     if (rc) goto out;
 
     if (!libxl_defbool_val(info->acpi)) {
-- 
2.25.1


