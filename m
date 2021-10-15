Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A642F49A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210641.367622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkW-00034M-Jl; Fri, 15 Oct 2021 13:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210641.367622; Fri, 15 Oct 2021 13:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNkW-000313-F5; Fri, 15 Oct 2021 13:59:52 +0000
Received: by outflank-mailman (input) for mailman id 210641;
 Fri, 15 Oct 2021 13:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbNkV-00020z-7I
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:59:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2d922a5b-17a9-464d-bd3e-0963b84be3d7;
 Fri, 15 Oct 2021 13:59:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AAB4147A;
 Fri, 15 Oct 2021 06:59:43 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 452D23F694;
 Fri, 15 Oct 2021 06:59:42 -0700 (PDT)
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
X-Inumbo-ID: 2d922a5b-17a9-464d-bd3e-0963b84be3d7
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Michal Orzel <michal.orzel@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 3/5] tools/libxl: Modify libxl__arch_domain_init_hw_description...
Date: Fri, 15 Oct 2021 14:59:20 +0100
Message-Id: <a8cbb1887c1419625dd01d5360a1ff0aaee21b55.1634305870.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634305870.git.bertrand.marquis@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Orzel <michal.orzel@arm.com>

... to take a second argument of type libxl_domain_config*
rather than libxl_domain_build_info*.

We need to pass the whole libxl_domain_config
structure as this will be needed later on to modify
the libxl__prepare_dtb function to also take
libxl_domain_config.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Suggested-by: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_arch.h | 2 +-
 tools/libs/light/libxl_arm.c  | 3 ++-
 tools/libs/light/libxl_dom.c  | 2 +-
 tools/libs/light/libxl_x86.c  | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 8527fc5c6c..1522ecb97f 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -38,7 +38,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
 /* setup arch specific hardware description, i.e. DTB on ARM */
 _hidden
 int libxl__arch_domain_init_hw_description(libxl__gc *gc,
-                                           libxl_domain_build_info *info,
+                                           libxl_domain_config *d_config,
                                            libxl__domain_build_state *state,
                                            struct xc_dom_image *dom);
 /* finalize arch specific hardware description. */
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a7801558cf..d5771f98dd 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1016,12 +1016,13 @@ out:
 }
 
 int libxl__arch_domain_init_hw_description(libxl__gc *gc,
-                                           libxl_domain_build_info *info,
+                                           libxl_domain_config *d_config,
                                            libxl__domain_build_state *state,
                                            struct xc_dom_image *dom)
 {
     int rc;
     uint64_t val;
+    libxl_domain_build_info *const info = &d_config->b_info;
 
     if (info->type != LIBXL_DOMAIN_TYPE_PVH) {
         LOG(ERROR, "Unsupported Arm guest type %s",
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index e9f58ee4b2..fe9f760f71 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -571,7 +571,7 @@ static int libxl__build_dom(libxl__gc *gc, uint32_t domid,
         LOG(ERROR, "xc_dom_parse_image failed");
         goto out;
     }
-    if ( (ret = libxl__arch_domain_init_hw_description(gc, info, state, dom)) != 0 ) {
+    if ( (ret = libxl__arch_domain_init_hw_description(gc, d_config, state, dom)) != 0 ) {
         LOGE(ERROR, "libxl__arch_domain_init_hw_description failed");
         goto out;
     }
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 6083878315..1feadebb18 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -568,7 +568,7 @@ int libxl__arch_extra_memory(libxl__gc *gc,
 }
 
 int libxl__arch_domain_init_hw_description(libxl__gc *gc,
-                                           libxl_domain_build_info *info,
+                                           libxl_domain_config *d_config,
                                            libxl__domain_build_state *state,
                                            struct xc_dom_image *dom)
 {
-- 
2.25.1


