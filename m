Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC466DF8E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479425.743306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPp-0001dW-Bi; Tue, 17 Jan 2023 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479425.743306; Tue, 17 Jan 2023 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPp-0001Xp-53; Tue, 17 Jan 2023 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 479425;
 Tue, 17 Jan 2023 13:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPo-0000XC-0g
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be8b0f7-966e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 14:54:13 +0100 (CET)
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
X-Inumbo-ID: 6be8b0f7-966e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mE/iBXFwyWDQLAcCnVIU+5UD6GpcaO2CE3H3XDadFrA=;
  b=CIyhQRxXWhoJHJ1OBMCv2KtAvqV6vX2X9RjeOpet/5ot9cUAtMQQ/WHT
   xmUnI0hIqQUwxnyA5rQ6Yus7tMncpb4I/DiFbTPZM0yjxUq/1z+qrUdiO
   b8NogMY6LV+YrndYtzCxeLgA7KY1EQXA4Pfc6Mh60msM6femd7hvqWCyi
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898371
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:veBvuakiVdH2uTlxDxxP/yLo5gyKJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWzjVPP2NYWqhe4h/a4+1oRtQvcXSzNdhSQdl+Xo3EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eYDKhRdSDCtvLKnnLKaUtNpqtslCda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfB9
 jOWpDugav0cHPW/zQrdzW/9uqjooyr8XtwdBqa6r9c/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VD3YJZiRMY9snsIkxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZsx4EorlqP3bImHhn
 zCrtBI7q6oVqNFegs1X4mv7byKQSonhF1BqvVSNBDr6vmuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2WBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcqJF7bpHE/PB/Lt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQMJ77TeFQ4Rjt/YxITqJt4E7FYc21uvr+g1
 hmAtoVwkwWXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:5gipqqMnNqAtUMBcTgejsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 9hGZIOdeHYPBxBouvRpCODNL8bsb66GKLDv5aj85+6JzsaFJ2J7G1Ce3im+lUdfnghOXKgfq
 DsnPauoVCbCA0qhpTSPAh8YwDbzee7767bXQ==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898371"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 3/6] tools: Introduce a non-truncating xc_xenver_capabilities()
Date: Tue, 17 Jan 2023 13:53:33 +0000
Message-ID: <20230117135336.11662-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Update libxl and the ocaml stubs to match.  No API/ABI change in either.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 tools/libs/light/libxl.c            |  4 +---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 17 +++++++++++++++--
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 1e88d49371a4..279dc17d67d4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1609,6 +1609,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
  * free().
  */
 char *xc_xenver_extraversion(xc_interface *xch);
+char *xc_xenver_capabilities(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 2c14474feec5..512302a393ea 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -156,3 +156,8 @@ char *xc_xenver_extraversion(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_extraversion2);
 }
+
+char *xc_xenver_capabilities(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_capabilities2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 3e16e568839c..139e838d1407 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -583,7 +583,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     union {
         xen_compile_info_t xen_cc;
         xen_changeset_info_t xen_chgset;
-        xen_capabilities_info_t xen_caps;
         xen_platform_parameters_t p_parms;
         xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
@@ -607,8 +606,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->compile_domain = libxl__strdup(NOGC, u.xen_cc.compile_domain);
     info->compile_date = libxl__strdup(NOGC, u.xen_cc.compile_date);
 
-    xc_version(ctx->xch, XENVER_capabilities, &u.xen_caps);
-    info->capabilities = libxl__strdup(NOGC, u.xen_caps);
+    info->capabilities = xc_xenver_capabilities(ctx->xch);
 
     xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
     info->changeset = libxl__strdup(NOGC, u.xen_chgset);
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index f3ce12dd8683..368f4727f0a0 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1009,9 +1009,22 @@ CAMLprim value stub_xc_version_changeset(value xch)
 
 CAMLprim value stub_xc_version_capabilities(value xch)
 {
-	xen_capabilities_info_t ci;
+	CAMLparam1(xch);
+	CAMLlocal1(result);
+	char *capabilities;
+
+	caml_enter_blocking_section();
+	retval = xc_xenver_capabilities(_H(xch));
+	caml_leave_blocking_section();
 
-	return xc_version_single_string(xch, XENVER_capabilities, &ci);
+	if (!capabilities)
+		failwith_xc(_H(xch));
+
+	result = caml_copy_string(capabilities);
+
+	free(capabilities);
+
+	CAMLreturn(result);
 }
 
 
-- 
2.11.0


