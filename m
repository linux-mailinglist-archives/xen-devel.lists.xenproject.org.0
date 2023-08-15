Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B077D4D8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584054.914490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fv-0005bM-B3; Tue, 15 Aug 2023 21:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584054.914490; Tue, 15 Aug 2023 21:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fv-0005Ts-1K; Tue, 15 Aug 2023 21:07:11 +0000
Received: by outflank-mailman (input) for mailman id 584054;
 Tue, 15 Aug 2023 21:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fs-0004qk-Ko
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b6284e-3baf-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 23:07:06 +0200 (CEST)
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
X-Inumbo-ID: b0b6284e-3baf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRvwwNb8arl9aVga2t5ciWeg5th+ph8XwiUFmV/rbr4=;
  b=c2mXirnT7wS3v93MUQUCojRHB+eWnY8BVvFiblvC0AvdxwvMRfcNn3h/
   AlaCa1XbyTIoIDzB//IfFvDKsXbBVgze4kdITBQ76vbh1NRnx7J18YORG
   LWUCSmL1BO5Ogld3vb8MIWtIODTZLj0btFr4wHyCoW34zQuJSCa87XkHw
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119453631
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vUCRTayYtdJSHQzhxgV6t+cgxirEfRIJ4+MujC+fZmUNrF6WrkUAy
 WAaXmmGO/aLNmf0eIogbt/jpEtXv5TTzN9kHgJt/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPK0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSJO0
 vkqLGEAVznZubyZm6qaZ7l8gMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMzxrF/
 TydpgwVBDkLc9DE0jGPq0mNm+rKsx3nX7tJEKOno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcL84QmDAXMfZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9bm8lYB0AHAY8yoPd/q5oljPiHsZlH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT+FWyzyGskTKuMDirjUWawC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJVXepn0yNBHAhjCFfK0QfUYXY
 8vzTCpRJSxCVfQPIMSeFo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrXef1c6QDt/VKe5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:M/qVTqnTOGIf9KV4PNn0UvBAmGHpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-Talos-CUID: 9a23:wAYWDmApH8Ma4qj6E2pn00smHpEoS1SH8in/eFeZJDZ5TrLAHA==
X-Talos-MUID: 9a23:6GBvnguAF02CcPc2gM2nlXZub9xj6f2VKV0IlLs4p869bihuJGLI
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119453631"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v3 09/10] tools: Introduce a non-truncating xc_xenver_cmdline()
Date: Tue, 15 Aug 2023 22:06:49 +0100
Message-ID: <20230815210650.2735671-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update libxl to match.  No API/ABI change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h      | 1 +
 tools/libs/ctrl/xc_version.c | 5 +++++
 tools/libs/light/libxl.c     | 4 +---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0400d65acaed..1b6f2ac508e0 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1600,6 +1600,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
 char *xc_xenver_extraversion(xc_interface *xch);
 char *xc_xenver_capabilities(xc_interface *xch);
 char *xc_xenver_changeset(xc_interface *xch);
+char *xc_xenver_commandline(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 9f2cae03dba8..02f6e9551b57 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -166,3 +166,8 @@ char *xc_xenver_changeset(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_changeset2);
 }
+
+char *xc_xenver_commandline(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_commandline2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 9a3532ce139a..04f037f3c199 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -584,7 +584,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     union {
         xen_compile_info_t xen_cc;
         xen_platform_parameters_t p_parms;
-        xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
     } u;
     long xen_version;
@@ -614,8 +613,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 
     info->pagesize = xc_version(ctx->xch, XENVER_pagesize, NULL);
 
-    xc_version(ctx->xch, XENVER_commandline, &u.xen_commandline);
-    info->commandline = libxl__strdup(NOGC, u.xen_commandline);
+    info->commandline = xc_xenver_commandline(ctx->xch);
 
     u.build_id.len = sizeof(u) - sizeof(u.build_id);
     r = libxl__xc_version_wrap(gc, info, &u.build_id);
-- 
2.30.2


