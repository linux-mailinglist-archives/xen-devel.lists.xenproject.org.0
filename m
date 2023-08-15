Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3364577D4DB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584053.914481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fu-0005QZ-K5; Tue, 15 Aug 2023 21:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584053.914481; Tue, 15 Aug 2023 21:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fu-0005KS-Ew; Tue, 15 Aug 2023 21:07:10 +0000
Received: by outflank-mailman (input) for mailman id 584053;
 Tue, 15 Aug 2023 21:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fs-0004ge-DC
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b087b55d-3baf-11ee-9b0c-b553b5be7939;
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
X-Inumbo-ID: b087b55d-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hU8HFMYeVIQ0k7mr1+LByODOt5SbiNcRsTDvsxssU9Q=;
  b=XU5OWBGuMqL93RvpwGAXyUpdNVjrTzFSFu+Z9Silyg8Bh2pYOVvBsBwA
   M/dmYW7EN1Zi8X7sAqeCGEc007AWsX1Fjj1gSWmGYC/Jg8wm0I+I3pXV+
   Nf6O5/oBERQM5Z+kQbz3g8b2uejxQrkL1eZSAG7xQJ8sNWlQKlH4resSa
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119453630
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:69iqWq8nIenRqyUK5pURDrUDpn6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WQfXG7TafeKZmfxftt0O46x8UICsMLRz4M3SQQ4pSE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNakW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkN9
 dsdGjRcYymq3dzo7+mja8Q8lsIseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxxfE+
 zmYpDyR7hcyBuWF2CSUsXCXicyfxTP5Y64bJLaxz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQC2
 laXkvvzCDdosbnTTmiSnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznDdZEFZyx39DMMGvOn
 R/RtAkT16UVgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWO0e+yzMUJVJdPUUOQS9voY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhha
 M3CK5rwXClKUPQPIN+KqwA1i+ND+8zD7TmLGcCTI+qPgNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQEKWQGOqdR7BQlTfRAG6WXe95Q/mhirflA3RwnMypb5ndscRmCSt/8Iy7qUp
 ivjBRcwJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:8zzviK5Xk5OeMwUwTgPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:BgvHsm1aIEQnRj6B+2wU6rxfWcACd0/ZnXrpChWGV0kyUJy4GU+W9/Yx
X-Talos-MUID: 9a23:0qnWiQm8x5G/5/tBbmPadnpQDd15/bXtCnsCssVeq8u/GSVAMD6k2WE=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119453630"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH v3 08/10] tools: Introduce a non-truncating xc_xenver_changeset()
Date: Tue, 15 Aug 2023 22:06:48 +0100
Message-ID: <20230815210650.2735671-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update libxl and the ocaml stubs to match.  No API/ABI change in either.

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
---
 tools/include/xenctrl.h             |  1 +
 tools/libs/ctrl/xc_version.c        |  5 +++++
 tools/libs/light/libxl.c            |  5 +----
 tools/ocaml/libs/xc/xenctrl_stubs.c | 19 ++++++++-----------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9bd5eed7397a..0400d65acaed 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1599,6 +1599,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
  */
 char *xc_xenver_extraversion(xc_interface *xch);
 char *xc_xenver_capabilities(xc_interface *xch);
+char *xc_xenver_changeset(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 512302a393ea..9f2cae03dba8 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -161,3 +161,8 @@ char *xc_xenver_capabilities(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_capabilities2);
 }
+
+char *xc_xenver_changeset(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_changeset2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index ae6c5e04cd59..9a3532ce139a 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -583,7 +583,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     GC_INIT(ctx);
     union {
         xen_compile_info_t xen_cc;
-        xen_changeset_info_t xen_chgset;
         xen_platform_parameters_t p_parms;
         xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
@@ -608,9 +607,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->compile_date = libxl__strdup(NOGC, u.xen_cc.compile_date);
 
     info->capabilities = xc_xenver_capabilities(ctx->xch);
-
-    xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
-    info->changeset = libxl__strdup(NOGC, u.xen_chgset);
+    info->changeset = xc_xenver_changeset(ctx->xch);
 
     xc_version(ctx->xch, XENVER_platform_parameters, &u.p_parms);
     info->virt_start = u.p_parms.virt_start;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index e8da7d18d29d..8495d5bd9892 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1035,28 +1035,25 @@ CAMLprim value stub_xc_version_compile_info(value xch_val)
 }
 
 
-static value xc_version_single_string(value xch_val, int code, void *info)
+CAMLprim value stub_xc_version_changeset(value xch_val)
 {
 	CAMLparam1(xch_val);
+	CAMLlocal1(result);
 	xc_interface *xch = xch_of_val(xch_val);
-	int retval;
+	char *changeset;
 
 	caml_enter_blocking_section();
-	retval = xc_version(xch, code, info);
+	changeset = xc_xenver_changeset(xch);
 	caml_leave_blocking_section();
 
-	if (retval)
+	if (!changeset)
 		failwith_xc(xch);
 
-	CAMLreturn(caml_copy_string((char *)info));
-}
+	result = caml_copy_string(changeset);
 
+	free(changeset);
 
-CAMLprim value stub_xc_version_changeset(value xch_val)
-{
-	xen_changeset_info_t ci;
-
-	return xc_version_single_string(xch_val, XENVER_changeset, &ci);
+	CAMLreturn(result);
 }
 
 
-- 
2.30.2


