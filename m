Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446077D4D6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584050.914459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fr-0004xx-N4; Tue, 15 Aug 2023 21:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584050.914459; Tue, 15 Aug 2023 21:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fr-0004vm-Jx; Tue, 15 Aug 2023 21:07:07 +0000
Received: by outflank-mailman (input) for mailman id 584050;
 Tue, 15 Aug 2023 21:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fq-0004ge-6g
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2461fc-3baf-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 23:07:04 +0200 (CEST)
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
X-Inumbo-ID: af2461fc-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UfkZMvSTOydVLRxmNKDfbvQp7DAjMWPXLA54Fw2pmto=;
  b=ijKlaDeGUs13HcRyMUVCGSOtvCd+A6K8N2Ev563mfVWFvgGSFmuIt0wL
   cukszLs9/vBBThz+WUoFauWvjOIABGqX6GsEC2IbqE0X7JnSrUUox9eVM
   V3T4P+oVlMnYOB+s8BD7BCqRFKttySQruuqo01aL8yGyz3+o5Jeu1y0xb
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119453628
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:H1Vrx6IVD80HczSpFE+R95UlxSXFcZb7ZxGr2PjKsXjdYENS0jEAm
 zFOXzvUM6qLZDT9f9F+YIy2/EgH7ZfQzNdgQQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c40AUZLx
 /hJJQkkNC7dqLmu4Z/rWu9j05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJQJwx3G/
 DKuE2LRXxU8ZIydzhO/0iy11ubtpzzpeY8OPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4qjb+QGCHUAfUyVMLtchsaceSTU02
 3eTktjuBDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bzRLoS+RnQaOMp4fLRx6r2
 xGn/Dg4iOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRfYuC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFywPtmY
 8vHIJn8VCZy5UFbIN2eHbt17FPW7npmmTO7qW7TnnxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9c4wvkJzr2Wo
 SnVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:AqPREaCW22JhPBblHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:3/37WWH4VcIZJng7qmIk9GkRKMR0f0T0lkmODBSgKEs5WLuaHAo=
X-Talos-MUID: 9a23:EI/1GQrolkXybKTE5Xsez2xmEpc44aOHMmBTiMUPmfObJw19Jx7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119453628"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH v3 06/10] tools: Introduce a non-truncating xc_xenver_extraversion()
Date: Tue, 15 Aug 2023 22:06:46 +0100
Message-ID: <20230815210650.2735671-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
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
 tools/libs/ctrl/xc_version.c        | 75 +++++++++++++++++++++++++++++
 tools/libs/light/libxl.c            |  4 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c |  9 ++--
 4 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index faec1dd82453..b839196bf4c4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1593,6 +1593,12 @@ long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len);
 
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
index 175d6dde0b80..f91f7271d5bf 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -582,7 +582,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 {
     GC_INIT(ctx);
     union {
-        xen_extraversion_t xen_extra;
         xen_compile_info_t xen_cc;
         xen_changeset_info_t xen_chgset;
         xen_capabilities_info_t xen_caps;
@@ -601,8 +600,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->xen_version_major = xen_version >> 16;
     info->xen_version_minor = xen_version & 0xFF;
 
-    xc_version(ctx->xch, XENVER_extraversion, &u.xen_extra);
-    info->xen_version_extra = libxl__strdup(NOGC, u.xen_extra);
+    info->xen_version_extra = xc_xenver_extraversion(ctx->xch);
 
     xc_version(ctx->xch, XENVER_compile_info, &u.xen_cc);
     info->compiler = libxl__strdup(NOGC, u.xen_cc.compiler);
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 3703f48c74d1..379a7935a145 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -980,9 +980,8 @@ CAMLprim value stub_xc_version_version(value xch_val)
 	CAMLparam1(xch_val);
 	CAMLlocal1(result);
 	xc_interface *xch = xch_of_val(xch_val);
-	xen_extraversion_t extra;
+	char *extra;
 	long packed;
-	int retval;
 
 	caml_enter_blocking_section();
 	packed = xc_version(xch, XENVER_version, NULL);
@@ -992,10 +991,10 @@ CAMLprim value stub_xc_version_version(value xch_val)
 		failwith_xc(xch);
 
 	caml_enter_blocking_section();
-	retval = xc_version(xch, XENVER_extraversion, &extra);
+	extra = xc_xenver_extraversion(xch);
 	caml_leave_blocking_section();
 
-	if (retval)
+	if (!extra)
 		failwith_xc(xch);
 
 	result = caml_alloc_tuple(3);
@@ -1004,6 +1003,8 @@ CAMLprim value stub_xc_version_version(value xch_val)
 	Store_field(result, 1, Val_int(packed & 0xffff));
 	Store_field(result, 2, caml_copy_string(extra));
 
+	free(extra);
+
 	CAMLreturn(result);
 }
 
-- 
2.30.2


