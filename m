Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D088B66DF8B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479426.743316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPq-0001ud-LB; Tue, 17 Jan 2023 13:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479426.743316; Tue, 17 Jan 2023 13:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPq-0001rO-Fv; Tue, 17 Jan 2023 13:54:18 +0000
Received: by outflank-mailman (input) for mailman id 479426;
 Tue, 17 Jan 2023 13:54:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPp-0000XC-0l
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d1a7f45-966e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 14:54:14 +0100 (CET)
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
X-Inumbo-ID: 6d1a7f45-966e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZeZpvUYtzSln2z+je77HpdVO31fBudqozIWZgnYM4bM=;
  b=fyZo0hd8H4zT9vNvABqWnUP+qlDrMJBpinIK6YhrTbQPpb2EkRpUK2LU
   /uZW3sbC40/NXHm8HJz3koONVHv/5bWnjX2uJgcply1gQ1yC2WAy6Faa9
   5G/eGdftyAeooAyNQwCjPmvMPWFcLoycTAkNGM3n+9Opr1u2/ANZflMI2
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898372
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Jw6Dq6BIcP9mURVW/1Hjw5YqxClBgxIJ4kV8jS/XYbTApD4q3jBWz
 2IaX2GDPfnZYjH8ed0iPI3j8kIHvJHUnNY2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4P11JTFo1
 dIjeCFRbjGbveea37SeVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4XaFJUOwRzwS
 mTu40X9LRoXMcalzSve0FG0vu/rhQzHYddHfFG/3qEz2wDCroAJMzUUWkG8uuKRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8/AKxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp6efOIZ6AyluKhSmpOwxFC08sXn8VEQsk++PmjJ41qw2aG76PD5WJYs3J9SDYm
 m7V93lk3e1M3abnxI3gowmZ3mvESozhC1dsu16JBj/NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N702wQH82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiTxPf4rO9LgUpVxpUQFKTgCfqmEBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9EuYLHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPRmkUPCrOgPHOJmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQz5J5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:uzWFFq3bOauASq+PY8E6YwqjBHQkLtp133Aq2lEZdPU0SKGlfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgF1+rfKlXbcBEWndQtt5
 uIHZIfNDXxZ2IK8PrS0U2DPPsLhPO818mT9IDjJ3UGd3AXV0m3hT0JdTpyESdNNXd77YJSLu
 v72iLezQDQA0j+aK6AdwA4t7iqnayyqHr+CyR2fCIa1A==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898372"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/6] tools: Introduce a xc_xenver_buildid() wrapper
Date: Tue, 17 Jan 2023 13:53:36 +0000
Message-ID: <20230117135336.11662-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

... which converts binary content to hex automatically.

Update libxl to match.  No API/ABI change.

This removes a latent bug for cases when the buildid is longer than 4092
bytes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h      |  1 +
 tools/libs/ctrl/xc_version.c | 33 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl.c     | 44 +-------------------------------------------
 3 files changed, 35 insertions(+), 43 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index fd80a509197d..48296930b892 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1612,6 +1612,7 @@ char *xc_xenver_extraversion(xc_interface *xch);
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
index 3f906a47148b..5512f444aca2 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -545,38 +545,6 @@ libxl_numainfo *libxl_get_numainfo(libxl_ctx *ctx, int *nr)
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
@@ -586,7 +554,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
         xen_build_id_t build_id;
     } u;
     long xen_version;
-    int r;
     libxl_version_info *info = &ctx->version_info;
 
     if (info->xen_version_extra != NULL)
@@ -613,17 +580,8 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
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
2.11.0


