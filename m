Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CC1F0924
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jun 2020 02:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhjMI-0003us-6L; Sun, 07 Jun 2020 00:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhjMH-0003un-70
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 00:40:17 +0000
X-Inumbo-ID: 72a9aa16-a857-11ea-b15b-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72a9aa16-a857-11ea-b15b-12813bfff9fa;
 Sun, 07 Jun 2020 00:40:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D621977B;
 Sat,  6 Jun 2020 20:40:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 06 Jun 2020 20:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eqSD4o
 bu7qKvtP6n/EZrCfXrPcI0RDHd2BksWe5YKYg=; b=XDZzzjBXCmMJ04c9d3yiVc
 KOGdyxQ4rCDnMT1QdyD0XiqEOouOcE3TaNZw+XyfcN/foixooUOYKulnPI+Xk3V+
 +AhvqShuBztH64UzEZBFzLRnvOpXOpxtqU5cLJOJIACUkV3PN98NYu1YxUPcDq+W
 5HWZd2+qmM2J+sfm1rS4N7MkVJTvlfsVDL60k3OKkF6W+70waNOyozRmpvklhvFX
 QhSkb0TDQTOXuwputzFLREevcZJVqTcWHDDLBLOUlYxXyf7NWhhxQgwlOPfhw0v9
 MvkLjaQeAi7IN4br/Rtz73kqKoQfeE4uCMyI1B4hlFgToeCCyOSR/Vo5m+WKbL8A
 ==
X-ME-Sender: <xms:azfcXiBTSqf0uhWAjJsbA5o0oPWrgqY1L5C_KFLfhloKLybYAl_Grw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegjedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdef
 fedtvefhtdetgeetteeuudefjeeijeetkeeiiedvudelueekieelfeehgfenucffohhmrg
 hinhepphhougdrihhnnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:azfcXshAyqry0elcbLDJdXqGmAqoPUhHgPp7-VTWFLoXqzxUI2-OnA>
 <xmx:azfcXlmdEY4fklKUqoOXEWf8n7yecZSL5ukvbkQ3bhyfDYY2NV1hjg>
 <xmx:azfcXgxhzdHhzG0g3S8wwZP0EipFWEEUYHyeSQ3TBlPo_y2LQ5u6zw>
 <xmx:azfcXo6sKW5J3GLx1vPorccuEMSMPN2BOMKrtQKoVHoUIs5O2F2cNQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84BA0328005A;
 Sat,  6 Jun 2020 20:40:10 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] libxl: automatically enable gfx_passthru if IGD is assigned
Date: Sun,  7 Jun 2020 02:39:57 +0200
Message-Id: <20200607003957.443603-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The gfx_passthru option needs to be enabled whenever IGD is assigned,
otherwise qemu refuses to start. Similarly, if gfx_passthru is enabled,
IGD needs to be assigned, otherwise libxl refuses to start the guest.
This means the gfx_passthru is fully redundant to assigning IGD (besides
enabling various non-bootable configurations).
Change the default value to follow IGD assignment state. For that, use
existing libxl__detect_gfx_passthru_kind (move from libxl_dm.c to
libxl_create.c).

While the option is designed with various GFX in mind, only IGD ever got
a special treatment. PCI passthrough of other GFX devices (some AMD and
Nvidia at least) works just fine without setting gfx_passthru at all.

This change simplifies configuration, but also fixes IGD passthrough
when using libvirt (which doesn't expose gfx_passthru option).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/man/xl.cfg.5.pod.in   |  3 +++
 tools/libxl/libxl_create.c | 27 ++++++++++++++++++++++++++-
 tools/libxl/libxl_dm.c     | 20 +-------------------
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1f..32228c1361 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1250,6 +1250,9 @@ Intel Graphics Device.
 
 =back
 
+By default, this option is enabled if Intel Graphics Device is assigned to the
+VM.
+
 Note that some graphics cards (AMD/ATI cards, for example) do not
 necessarily require the B<gfx_passthru> option, so you can use the normal Xen
 PCI passthrough to assign the graphics card as a secondary graphics
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 75862dc6ed..7aca51cb9c 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -72,6 +72,22 @@ void libxl__rdm_setdefault(libxl__gc *gc, libxl_domain_build_info *b_info)
                             LIBXL_RDM_MEM_BOUNDARY_MEMKB_DEFAULT;
 }
 
+static enum libxl_gfx_passthru_kind
+libxl__detect_gfx_passthru_kind(libxl__gc *gc,
+                                const libxl_domain_config *guest_config)
+{
+    const libxl_domain_build_info *b_info = &guest_config->b_info;
+
+    if (b_info->u.hvm.gfx_passthru_kind != LIBXL_GFX_PASSTHRU_KIND_DEFAULT)
+        return b_info->u.hvm.gfx_passthru_kind;
+
+    if (libxl__is_igd_vga_passthru(gc, guest_config)) {
+        return LIBXL_GFX_PASSTHRU_KIND_IGD;
+    }
+
+    return LIBXL_GFX_PASSTHRU_KIND_DEFAULT;
+}
+
 int libxl__domain_build_info_setdefault(libxl__gc *gc,
                                         libxl_domain_build_info *b_info)
 {
@@ -411,7 +427,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
 
         libxl_defbool_setdefault(&b_info->u.hvm.nographic, false);
 
-        libxl_defbool_setdefault(&b_info->u.hvm.gfx_passthru, false);
+        libxl_defbool_setdefault(&b_info->u.hvm.gfx_passthru,
+                b_info->u.hvm.gfx_passthru_kind != LIBXL_GFX_PASSTHRU_KIND_DEFAULT);
 
         libxl__rdm_setdefault(gc, b_info);
         break;
@@ -1177,6 +1194,14 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
             ? libxl__get_required_iommu_memory(d_config->b_info.max_memkb)
             : 0;
 
+    if (d_config->b_info.type == LIBXL_DOMAIN_TYPE_HVM) {
+        if (d_config->b_info.u.hvm.gfx_passthru_kind == LIBXL_GFX_PASSTHRU_KIND_DEFAULT) {
+            /* this may also keep LIBXL_GFX_PASSTHRU_KIND_DEFAULT */
+            d_config->b_info.u.hvm.gfx_passthru_kind =
+                libxl__detect_gfx_passthru_kind(gc, d_config);
+        }
+    }
+
     ret = libxl__domain_build_info_setdefault(gc, &d_config->b_info);
     if (ret) {
         LOGD(ERROR, domid, "Unable to set domain build info defaults");
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc5696b9..381be5e6ed 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -981,22 +981,6 @@ static char *dm_spice_options(libxl__gc *gc,
     return opt;
 }
 
-static enum libxl_gfx_passthru_kind
-libxl__detect_gfx_passthru_kind(libxl__gc *gc,
-                                const libxl_domain_config *guest_config)
-{
-    const libxl_domain_build_info *b_info = &guest_config->b_info;
-
-    if (b_info->u.hvm.gfx_passthru_kind != LIBXL_GFX_PASSTHRU_KIND_DEFAULT)
-        return b_info->u.hvm.gfx_passthru_kind;
-
-    if (libxl__is_igd_vga_passthru(gc, guest_config)) {
-        return LIBXL_GFX_PASSTHRU_KIND_IGD;
-    }
-
-    return LIBXL_GFX_PASSTHRU_KIND_DEFAULT;
-}
-
 /* colo mode */
 enum {
     LIBXL__COLO_NONE = 0,
@@ -1798,9 +1782,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
-            enum libxl_gfx_passthru_kind gfx_passthru_kind =
-                            libxl__detect_gfx_passthru_kind(gc, guest_config);
-            switch (gfx_passthru_kind) {
+            switch (b_info->u.hvm.gfx_passthru_kind) {
             case LIBXL_GFX_PASSTHRU_KIND_IGD:
                 machinearg = GCSPRINTF("%s,igd-passthru=on", machinearg);
                 break;
-- 
2.25.4


