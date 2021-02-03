Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB330E3CC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 21:08:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81049.149023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OQy-00007t-9M; Wed, 03 Feb 2021 20:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81049.149023; Wed, 03 Feb 2021 20:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OQy-00007O-5b; Wed, 03 Feb 2021 20:07:28 +0000
Received: by outflank-mailman (input) for mailman id 81049;
 Wed, 03 Feb 2021 20:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1O+=HF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l7OQx-000079-5k
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 20:07:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e528a65-e106-4e81-ad5f-82f4218a94de;
 Wed, 03 Feb 2021 20:07:25 +0000 (UTC)
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
X-Inumbo-ID: 4e528a65-e106-4e81-ad5f-82f4218a94de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612382845;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=MITj/cWLh6YxfT29z0NOD+rmVZ8NCm5//wvOqP2KyUk=;
  b=IdnH1eTYWRSY+3VigfL5vEeidgy37RQz4URBXPlmdon6t3HNXZLz7pjJ
   pSw1u74ccz9TeLCuvcKrRwtou6h5rjJqyJT5ntTRg6k92RETZpcvCog6q
   AftfuNP1+RR86oQgd4wu6jJ/CJ2bwIvEeTYASxa727D1LAHskZHqjusB8
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hIP17ujBP+/tAu1gzbWzgP6zqDXD9V+CusUUyPvVzqJnLeOYF27W9t7XN/Ms/LrgPU7AqAoOw/
 okQCZmc7FoD0+0GAgq+8cqZ+lmzxvW/+qds4atbYWZQJyCyAjttAtKEIn/Je96nLiEqHeM+HUZ
 Blx/pTFLi+uWNkwSmdSmnm97XQLUhzwyH1d6hCfG9MG0yQqkS7oJTkrR+t/klFbCOO9by7bFIy
 gNPJXPtpceFWChJMSP1dgdYDPpJNy2w3Kcujl8bMWcAutJDdnTqty7Mt9NvMmUJwzdWpXeHdYh
 lRI=
X-SBRS: 4.0
X-MesageID: 37834476
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="37834476"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<tamas.k.lengyel@gmail.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 1/2] tools/libxl: pass libxl__domain_build_state to libxl__arch_domain_create
Date: Wed, 3 Feb 2021 20:07:03 +0000
Message-ID: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

No functional change.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
New patch in v2 as requested.
---
 tools/libs/light/libxl_arch.h | 6 ++++--
 tools/libs/light/libxl_arm.c  | 4 +++-
 tools/libs/light/libxl_dom.c  | 2 +-
 tools/libs/light/libxl_x86.c  | 6 ++++--
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 6a91775..c305d70 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -30,8 +30,10 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
 
 /* arch specific internal domain creation function */
 _hidden
-int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
-               uint32_t domid);
+int libxl__arch_domain_create(libxl__gc *gc,
+                              libxl_domain_config *d_config,
+                              libxl__domain_build_state *state,
+                              uint32_t domid);
 
 /* setup arch specific hardware description, i.e. DTB on ARM */
 _hidden
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 66e8a06..8c4eda3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -126,7 +126,9 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
     return 0;
 }
 
-int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
+int libxl__arch_domain_create(libxl__gc *gc,
+                              libxl_domain_config *d_config,
+                              ibxl__domain_build_state *state,
                               uint32_t domid)
 {
     return 0;
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 1916857..842a51c 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -378,7 +378,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     state->store_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->store_domid);
     state->console_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->console_domid);
 
-    rc = libxl__arch_domain_create(gc, d_config, domid);
+    rc = libxl__arch_domain_create(gc, d_config, state, domid);
 
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 91a9fc7..91169d1 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -453,8 +453,10 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
     return ret;
 }
 
-int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
-        uint32_t domid)
+int libxl__arch_domain_create(libxl__gc *gc,
+                              libxl_domain_config *d_config,
+                              libxl__domain_build_state *state,
+                              uint32_t domid)
 {
     const libxl_domain_build_info *info = &d_config->b_info;
     int ret = 0;
-- 
2.7.4


