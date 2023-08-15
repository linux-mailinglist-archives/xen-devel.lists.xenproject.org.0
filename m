Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6377D4E9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584082.914550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1In-00030P-RE; Tue, 15 Aug 2023 21:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584082.914550; Tue, 15 Aug 2023 21:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1In-0002wx-Mt; Tue, 15 Aug 2023 21:10:09 +0000
Received: by outflank-mailman (input) for mailman id 584082;
 Tue, 15 Aug 2023 21:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Gi-0004ge-8l
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:08:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce7e1033-3baf-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 23:07:57 +0200 (CEST)
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
X-Inumbo-ID: ce7e1033-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8yVo7cfHcdVvMYigQJV38THfj5k/BX4q6OsZV/UvUY=;
  b=XB2llFITgSdQlfp5mIjmtHOW/Ty+aHCCq/f6JXWkpFoFEROr4uR2W7oO
   rA0axXRyLl8k59gPxRPj4BHcTEp3QaZxeElhP+U+16rKlJm2pLHJc2UdT
   6sFB+KIBTdSfP17WUCzxhD4jgAf1z/p/jn0NsXd49if4ucUnRwngXnBIH
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118253182
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xrwR667zc0g9Rv6rPjDUEwxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 jYYWzyAM/bcYjfyed5+a4Tgo09UvMXTydIyTlE6+389Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 KUiBilRTBe6jOeR+u6mY7cxot04I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/I/
 D+dpjSjav0cHOK+2wCgyVmivPberwXKXb82C6Xl3Mc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0c/PBUqVFcn5ODopaYJ0g/mEItHCbW624id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ904DNJWfh0B3iM4ldjBO
 Ra7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHWpng0ORLBgDC0wCDAdJ3T3
 r/BLa6R4YsyU/w7nFJauc9MuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreVc7RT15UaGOmdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSavxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:oUZGOawzCm2LTCNUiixzKrPwE71zdoMgy1knxilNoNJuA7Wlfq
 GV7YwmPHrP4gr5N0tQ/OxoVJPwI080sKQFgrX5Xo3CYOCFghrNEGgK1+KLqAEIWRefygc379
 YGT0ERMqyXMbG4t6rHCcuDfurIDOPpzElgv4nj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AvtrZw2ofIYAw7USazpSy4njmUf18SFPEkFXXGkS?=
 =?us-ascii?q?9Llw1VZTLFHuJ46wxxg=3D=3D?=
X-Talos-MUID: 9a23:SWw4HQYyQ/3xMuBTiR7+vhRZH8lS+rWcLnEIrLEZo5SuDHkl
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118253182"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v3 10/10] tools: Introduce a xc_xenver_buildid() wrapper
Date: Tue, 15 Aug 2023 22:06:50 +0100
Message-ID: <20230815210650.2735671-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

... which converts binary content to hex automatically.

Update libxl to match.  No API/ABI change.

This removes a latent libxl bug for cases when the buildid is longer than 4092
bytes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h      |  1 +
 tools/libs/ctrl/xc_version.c | 33 +++++++++++++++++++++++++++
 tools/libs/light/libxl.c     | 44 +-----------------------------------
 3 files changed, 35 insertions(+), 43 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 1b6f2ac508e0..7f51cb43b931 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1601,6 +1601,7 @@ char *xc_xenver_extraversion(xc_interface *xch);
 char *xc_xenver_capabilities(xc_interface *xch);
 char *xc_xenver_changeset(xc_interface *xch);
 char *xc_xenver_commandline(xc_interface *xch);
+char *xc_xenver_buildid(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 02f6e9551b57..54d1b9296696 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -171,3 +171,36 @@ char *xc_xenver_commandline(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_commandline2);
 }
+
+static void str2hex(char *dst, const unsigned char *src, size_t n)
+{
+    static const unsigned char hex[] = "0123456789abcdef";
+
+    for ( ; n; n-- )
+    {
+        unsigned char c = *src++;
+
+        *dst++ = hex[c >> 4];
+        *dst++ = hex[c & 0xf];
+    }
+}
+
+char *xc_xenver_buildid(xc_interface *xch)
+{
+    xen_varbuf_t *hbuf = varbuf_op(xch, XENVER_build_id);
+    char *res;
+
+    if ( !hbuf )
+        return NULL;
+
+    res = malloc((hbuf->len * 2) + 1);
+    if ( res )
+    {
+        str2hex(res, hbuf->buf, hbuf->len);
+        res[hbuf->len * 2] = '\0';
+    }
+
+    xencall_free_buffer(xch->xcall, hbuf);
+
+    return res;
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 04f037f3c199..a1fe16274d86 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -546,38 +546,6 @@ libxl_numainfo *libxl_get_numainfo(libxl_ctx *ctx, int *nr)
     return ret;
 }
 
-static int libxl__xc_version_wrap(libxl__gc *gc, libxl_version_info *info,
-                                  xen_build_id_t *build)
-{
-    int r;
-
-    r = xc_version(CTX->xch, XENVER_build_id, build);
-    switch (r) {
-    case -EPERM:
-    case -ENODATA:
-    case 0:
-        info->build_id = libxl__strdup(NOGC, "");
-        break;
-
-    case -ENOBUFS:
-        break;
-
-    default:
-        if (r > 0) {
-            unsigned int i;
-
-            info->build_id = libxl__zalloc(NOGC, (r * 2) + 1);
-
-            for (i = 0; i < r ; i++)
-                snprintf(&info->build_id[i * 2], 3, "%02hhx", build->buf[i]);
-
-            r = 0;
-        }
-        break;
-    }
-    return r;
-}
-
 const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 {
     GC_INIT(ctx);
@@ -587,7 +555,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
         xen_build_id_t build_id;
     } u;
     long xen_version;
-    int r;
     libxl_version_info *info = &ctx->version_info;
 
     if (info->xen_version_extra != NULL)
@@ -614,17 +581,8 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->pagesize = xc_version(ctx->xch, XENVER_pagesize, NULL);
 
     info->commandline = xc_xenver_commandline(ctx->xch);
+    info->build_id = xc_xenver_buildid(ctx->xch);
 
-    u.build_id.len = sizeof(u) - sizeof(u.build_id);
-    r = libxl__xc_version_wrap(gc, info, &u.build_id);
-    if (r == -ENOBUFS) {
-            xen_build_id_t *build_id;
-
-            build_id = libxl__zalloc(gc, info->pagesize);
-            build_id->len = info->pagesize - sizeof(*build_id);
-            r = libxl__xc_version_wrap(gc, info, build_id);
-            if (r) LOGEV(ERROR, r, "getting build_id");
-    }
  out:
     GC_FREE;
     return info;
-- 
2.30.2


