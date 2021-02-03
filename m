Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089230D248
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 05:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80799.147979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l79MW-0006Rr-6n; Wed, 03 Feb 2021 04:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80799.147979; Wed, 03 Feb 2021 04:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l79MW-0006RU-2X; Wed, 03 Feb 2021 04:01:52 +0000
Received: by outflank-mailman (input) for mailman id 80799;
 Wed, 03 Feb 2021 04:01:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1O+=HF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l79MU-0006RP-6f
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 04:01:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8f78852-189c-454d-b59e-d2992d4cbd2d;
 Wed, 03 Feb 2021 04:01:48 +0000 (UTC)
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
X-Inumbo-ID: c8f78852-189c-454d-b59e-d2992d4cbd2d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612324908;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=xn/6xO8m4ShHK03f/t/BD4tc59kJO62bHplznEoYNZo=;
  b=EF9x/yez1HG34Vg/KRPRtBxkiokx0brURgHqtRHeUKfLODoqgvW8Y06q
   UjArvSmZh0gMEn/8S83nNbjLR7gi43BR/o5oBt35LKdRHF2xWTkffumU/
   mAKoaraPAZ8s7crzaBdA/Ejiu5cMBfHs3UlOC/7mV0ErkW6KCWzsd9iTh
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qtrqTeT6IsDhu2KYKR6HMfg0X5okI/fJ93wJedDLVjcoqqLidFa/AkOHVMAG2RXNrWZgEGrDZy
 EFqxU1LveUtZHH7h1iTmkuHNl6epr9XCGC56wPq+Vw2DHvL6ZKbL8zJR0ike8ThLlK1zHgeG/G
 9B0uUWCLZaEYS9Jb3UNXE/PxdRVe6mpjJtXgyI6z7dP9C8jyeord7n1iX8+SoH9Ge9oUv61uTr
 IU4xvZzhMCrSpFcStquBElrYQYmqZ6r7domu6/FOQ3Wuh/o8txjrg3JMMbrPkems7I+qfkgsup
 iiw=
X-SBRS: 4.0
X-MesageID: 36808232
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,397,1602561600"; 
   d="scan'208";a="36808232"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<tamas.k.lengyel@gmail.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH] tools/libxl: only set viridian flags on new domains
Date: Wed, 3 Feb 2021 04:01:29 +0000
Message-ID: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Domains migrating or restoring should have viridian HVM param key in
the migration stream already and setting that twice results in Xen
returing -EEXIST on the second attempt later (during migration stream parsing)
in case the values don't match. That causes migration/restore operation
to fail at destination side.

That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
extending default viridian feature set making the values from the previous
migration streams and those set at domain construction different.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/libs/light/libxl_arch.h |  6 ++++--
 tools/libs/light/libxl_arm.c  |  4 +++-
 tools/libs/light/libxl_dom.c  |  2 +-
 tools/libs/light/libxl_x86.c  | 11 ++++++++---
 4 files changed, 16 insertions(+), 7 deletions(-)

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
index 91a9fc7..58187ed 100644
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
@@ -466,7 +468,10 @@ int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
         (ret = hvm_set_conf_params(gc, domid, info)) != 0)
         goto out;
 
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
+    /* Viridian flags are already a part of the migration stream so set
+     * them here only for brand new domains. */
+    if (!state->restore &&
+        info->type == LIBXL_DOMAIN_TYPE_HVM &&
         (ret = hvm_set_viridian_features(gc, domid, info)) != 0)
         goto out;
 
-- 
2.7.4


