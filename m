Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB651A8C5D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 22:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOS5h-0006fi-VC; Tue, 14 Apr 2020 20:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOS5g-0006fd-TC
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 20:23:28 +0000
X-Inumbo-ID: cc884a9a-7e8d-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc884a9a-7e8d-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586895807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=dDpooWvCvCdfVU+Csr7I2hSG58ilkPwM/JN7uGWPjoQ=;
 b=d2nCyzE1gfQx7bJjF93JEpbD5sONp/PGP2Ck7mQchoVLyU6NoTuarhnB
 4K3HTBlipwJSrHh6GvoRkXkYmzwgMw+D2/DPot69jSls97X0U3U48zpAY
 fxLjuYiu1MyccNgko/6W4JFs8lHXJ6MWToVx1bO8GMkVkGosmufRRiTT8 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uk328W3r5ZgYEZRkXbA2nHU8HUAqJFrULWd69v7HEoqsChQ86WEflmlLIqbhPivhWBnACvuaCJ
 Nl0JZ6PPJ9Xvmy5w0aVHjFU6n4IZjHd3cCtHjaEweK0871wZji9qaQHLPTfN1wDqHgHvpLueRQ
 56KvVW/ks3Yhr7Ced9d4mUSJGA2aGLLaKwIC210T3mDadDVS5qYXD3snvIGP70NUjtf2lX8vDH
 BDDM8UTOKdowizAbEC6zijamjZicnpuBj5Ue4GNw+2xJY8AquAFt48fmW3RYzFwZnogtXJRLpn
 7X0=
X-SBRS: 2.7
X-MesageID: 15995059
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,384,1580792400"; d="scan'208";a="15995059"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 10/17] tools/libxl: Plumb a restore boolean into
 libxl__domain_build_state
Date: Tue, 14 Apr 2020 21:23:21 +0100
Message-ID: <20200414202321.17580-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-11-andrew.cooper3@citrix.com>
References: <20200127143444.25538-11-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To fix CPUID handling, libxl__build_pre() is going to have to distinguish
between a brand new VM vs one which is being migrated-in/resumed.

Transcribe dcs->restore_fd into dbs->restore in initiate_domain_create()
only (specifically avoiding the stubdom state in libxl__spawn_stub_dm()).

While tweaking initiate_domain_create(), make a new dbs alias and simplify
later code, and drop the local restore_fd alias as the new dbs->restore is
more intuitive in context.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * New.  This is c/s aacc1430064 "tools/libxl: Plumb domain_create_state down
   into libxl__build_pre()" take-2, without any collateral damage to stubdoms.
v3:
 * Extend libxl__domain_build_state instead of adding a new parameter to
   libxl__build_pre().
---
 tools/libxl/libxl_create.c   | 14 +++++++-------
 tools/libxl/libxl_internal.h |  4 ++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e7cb2dbc2b..5a043df15f 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1181,18 +1181,18 @@ static void initiate_domain_create(libxl__egc *egc,
 
     /* convenience aliases */
     libxl_domain_config *const d_config = dcs->guest_config;
-    const int restore_fd = dcs->restore_fd;
+    libxl__domain_build_state *dbs = &dcs->build_state;
 
     libxl__xswait_init(&dcs->console_xswait);
 
     domid = dcs->domid;
-    libxl__domain_build_state_init(&dcs->build_state);
+    libxl__domain_build_state_init(dbs);
+    dbs->restore = dcs->restore_fd >= 0;
 
     ret = libxl__domain_config_setdefault(gc,d_config,domid);
     if (ret) goto error_out;
 
-    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
-                             dcs->soft_reset);
+    ret = libxl__domain_make(gc, d_config, dbs, &domid, dcs->soft_reset);
     if (ret) {
         LOGD(ERROR, domid, "cannot make domain: %d", ret);
         dcs->guest_domid = domid;
@@ -1236,7 +1236,7 @@ static void initiate_domain_create(libxl__egc *egc,
     if (ret)
         goto error_out;
 
-    if (restore_fd >= 0 || dcs->soft_reset) {
+    if (dbs->restore || dcs->soft_reset) {
         LOGD(DEBUG, domid, "restoring, not running bootloader");
         domcreate_bootloader_done(egc, &dcs->bl, 0);
     } else  {
@@ -1247,8 +1247,8 @@ static void initiate_domain_create(libxl__egc *egc,
         dcs->bl.disk = bootdisk;
         dcs->bl.domid = dcs->guest_domid;
 
-        dcs->bl.kernel = &dcs->build_state.pv_kernel;
-        dcs->bl.ramdisk = &dcs->build_state.pv_ramdisk;
+        dcs->bl.kernel = &dbs->pv_kernel;
+        dcs->bl.ramdisk = &dbs->pv_ramdisk;
 
         libxl__bootloader_run(egc, &dcs->bl);
     }
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 5f39e44cb9..e5effd2ad1 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -1397,6 +1397,10 @@ typedef struct {
 
     /* ARM only to deal with broken firmware */
     uint32_t clock_frequency;
+
+    /* Whether this domain is being migrated/restored, or booting fresh.  Only
+     * applicable to the primary domain, not support domains (e.g. stub QEMU). */
+    bool restore;
 } libxl__domain_build_state;
 
 _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
-- 
2.11.0


