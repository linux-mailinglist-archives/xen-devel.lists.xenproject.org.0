Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B261566DF8C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479423.743290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPn-0001DS-Vx; Tue, 17 Jan 2023 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479423.743290; Tue, 17 Jan 2023 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPn-00016A-Qd; Tue, 17 Jan 2023 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 479423;
 Tue, 17 Jan 2023 13:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPm-0000F6-BF
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 690f5070-966e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 14:54:07 +0100 (CET)
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
X-Inumbo-ID: 690f5070-966e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Y1TsN24+gK5qG+xfcJUIrL6CpEgkX3sOFO8L70/aQgA=;
  b=hNTHdCOFdmvtUWckZytsRnkkPZjbPUc+qHVYX+2H53MevMwrKSK/8Gx5
   sm1YKNNa5XafUce9DiY2pDJGiSUu0+2/KiXC7s4wZlFO8Lunh1BAkW37O
   U4No19jjl1HzOE+KhdSOeV5x8GL5+6Inwu1rsdNFkFShIHlJYfox+hteW
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898368
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wHfkaqBUJcICiBVW/yLjw5YqxClBgxIJ4kV8jS/XYbTApDNw3jVRm
 GNMX2qAOqyCYmX1eIx0Ot/g9x9TvcCByNY3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4P11JTFo1
 dIjeCFRbjGbveea37SeVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4XaFJUOwBbwS
 mTu1Ef5DjYrbvil+QHeyU2Ppc+UswjFYddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwA2E1Kf8+QuSAWkACDlbZ7QOtsAsQicx/
 kSUhN6vDjtq2IB5UlrEqO3S92nrf3FIcylbP3RsoRY5D8fLupoxqkLpbvhYQL/pjvztIzTc3
 Davs31r71kMtvLnx5lX7Hie3W3398KTFlFljunEdjn7t10kPeZJc6TtsAGGtqgYce51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8Axkkfi+Fyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CauEP4YWMskoJVTvEMRSiam4hjCFraTRuftnZ
 cfznTiEUB729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSNqVcCs9ZIJLLDrz8gPMDhJNsI9CIgJI+RN95m5XM+Up
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:nXztU63mx44FWTcRMYJqsAqjBHQkLtp133Aq2lEZdPU0SKGlfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgF1+rfKlXbcBEWndQtt5
 uIHZIfNDXxZ2IK8PrS0U2DPPsLhPO818mT9IDjJ3UGd3AXV0m3hT0JdTpyESdNNXd77YJSLu
 v72iLezQDQA0j+aK6AdwA4t7iqnayyqHr+CyR2fCIa1A==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898368"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 2/6] tools: Introduce a non-truncating xc_xenver_extraversion()
Date: Tue, 17 Jan 2023 13:53:32 +0000
Message-ID: <20230117135336.11662-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

... which uses XENVER_extraversion2.

In order to do sensibly, use manual hypercall buffer handling.  Not only does
this avoid an extra bounce buffer (we need to strip the xen_varbuf_t header
anyway), it's also shorter and easlier to follow.

Update libxl and the ocaml stubs to match.  No API/ABI change in either.

With this change made, `xl info` can now correctly access a >15 char
extraversion:

  # xl info xen_version
  4.18-unstable+REALLY LONG EXTRAVERSION

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Note: There is a marginal risk for a memory leak in the ocaml bindings, but
it turns out we have the same bug elsewhere and fixing that is going to be
rather complicated.
---
 tools/include/xenctrl.h             |  6 +++
 tools/libs/ctrl/xc_version.c        | 75 +++++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl.c            |  4 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c |  9 +++--
 4 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3d5..1e88d49371a4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1604,6 +1604,12 @@ long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len);
 
 int xc_version(xc_interface *xch, int cmd, void *arg);
 
+/*
+ * Wrappers around XENVER_* subops.  Callers must pass the returned pointer to
+ * free().
+ */
+char *xc_xenver_extraversion(xc_interface *xch);
+
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
 /*
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 60e107dcee0b..2c14474feec5 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -81,3 +81,78 @@ int xc_version(xc_interface *xch, int cmd, void *arg)
 
     return rc;
 }
+
+/*
+ * Raw hypercall wrapper, letting us pass NULL and things which aren't of
+ * xc_hypercall_buffer_t *.
+ */
+static int do_xen_version_raw(xc_interface *xch, int cmd, void *hbuf)
+{
+    return xencall2(xch->xcall, __HYPERVISOR_xen_version,
+                    cmd, (unsigned long)hbuf);
+}
+
+/*
+ * Issues a xen_varbuf_t subop, using manual hypercall buffer handling to
+ * avoid unnecessary buffering.
+ *
+ * On failure, returns NULL.  errno probably useful.
+ * On success, returns a pointer which must be freed with xencall_free_buffer().
+ */
+static xen_varbuf_t *varbuf_op(xc_interface *xch, unsigned int subop)
+{
+    xen_varbuf_t *hbuf = NULL;
+    ssize_t sz;
+
+    sz = do_xen_version_raw(xch, subop, NULL);
+    if ( sz < 0 )
+        return NULL;
+
+    hbuf = xencall_alloc_buffer(xch->xcall, sizeof(*hbuf) + sz);
+    if ( !hbuf )
+        return NULL;
+
+    hbuf->len = sz;
+
+    sz = do_xen_version_raw(xch, subop, hbuf);
+    if ( sz < 0 )
+    {
+        xencall_free_buffer(xch->xcall, hbuf);
+        return NULL;
+    }
+
+    hbuf->len = sz;
+    return hbuf;
+}
+
+/*
+ * Wrap varbuf_op() to obtain a simple string.  Copy out of the hypercall
+ * buffer, stripping the xen_varbuf_t header and appending a NUL terminator.
+ *
+ * On failure, returns NULL, errno probably useful.
+ * On success, returns a pointer which must be free()'d.
+ */
+static char *varbuf_simple_string(xc_interface *xch, unsigned int subop)
+{
+    xen_varbuf_t *hbuf = varbuf_op(xch, subop);
+    char *res;
+
+    if ( !hbuf )
+        return NULL;
+
+    res = malloc(hbuf->len + 1);
+    if ( res )
+    {
+        memcpy(res, hbuf->buf, hbuf->len);
+        res[hbuf->len] = '\0';
+    }
+
+    xencall_free_buffer(xch->xcall, hbuf);
+
+    return res;
+}
+
+char *xc_xenver_extraversion(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_extraversion2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f69..3e16e568839c 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -581,7 +581,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 {
     GC_INIT(ctx);
     union {
-        xen_extraversion_t xen_extra;
         xen_compile_info_t xen_cc;
         xen_changeset_info_t xen_chgset;
         xen_capabilities_info_t xen_caps;
@@ -600,8 +599,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->xen_version_major = xen_version >> 16;
     info->xen_version_minor = xen_version & 0xFF;
 
-    xc_version(ctx->xch, XENVER_extraversion, &u.xen_extra);
-    info->xen_version_extra = libxl__strdup(NOGC, u.xen_extra);
+    info->xen_version_extra = xc_xenver_extraversion(ctx->xch);
 
     xc_version(ctx->xch, XENVER_compile_info, &u.xen_cc);
     info->compiler = libxl__strdup(NOGC, u.xen_cc.compiler);
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2fba9c5e94d6..f3ce12dd8683 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -929,9 +929,8 @@ CAMLprim value stub_xc_version_version(value xch)
 {
 	CAMLparam1(xch);
 	CAMLlocal1(result);
-	xen_extraversion_t extra;
+	char *extra;
 	long packed;
-	int retval;
 
 	caml_enter_blocking_section();
 	packed = xc_version(_H(xch), XENVER_version, NULL);
@@ -941,10 +940,10 @@ CAMLprim value stub_xc_version_version(value xch)
 		failwith_xc(_H(xch));
 
 	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), XENVER_extraversion, &extra);
+	extra = xc_xenver_extraversion(_H(xch));
 	caml_leave_blocking_section();
 
-	if (retval)
+	if (!extra)
 		failwith_xc(_H(xch));
 
 	result = caml_alloc_tuple(3);
@@ -953,6 +952,8 @@ CAMLprim value stub_xc_version_version(value xch)
 	Store_field(result, 1, Val_int(packed & 0xffff));
 	Store_field(result, 2, caml_copy_string(extra));
 
+	free(extra);
+
 	CAMLreturn(result);
 }
 
-- 
2.11.0


