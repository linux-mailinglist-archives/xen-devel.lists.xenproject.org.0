Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F077D4DA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584051.914470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Ft-0005D1-WB; Tue, 15 Aug 2023 21:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584051.914470; Tue, 15 Aug 2023 21:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Ft-0005Br-RH; Tue, 15 Aug 2023 21:07:09 +0000
Received: by outflank-mailman (input) for mailman id 584051;
 Tue, 15 Aug 2023 21:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fr-0004qk-JA
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af3c3bee-3baf-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 23:07:05 +0200 (CEST)
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
X-Inumbo-ID: af3c3bee-3baf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1+RMVJk98RwcyuWOiYVPUBLbonGeMd8JnyJIvIqHGro=;
  b=S3/R/G1Po3//CVpx8g9s7VLojD+YPUo1k1yP+GGqcXRPFv/OwF2Czxz3
   YUByPRy+OfFaGsvsTwiECYlGyH1/UX9uxUyTmdYxtkE33xhksXp2KETvX
   Senm3BfyJ8ZhVylZQnwouVYsS3yln5jhwOUhw39W3eGlpn1nIxwAfyq24
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119453629
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Yp1nC6LsQhehCEG1FE+R95UlxSXFcZb7ZxGr2PjKsXjdYENShjcEz
 mJOXm6DaKmPNzCje95+Od6+808B6pTXn9NlSAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c40AUZLx
 /hJJQkkNC7dqLmu4Z/rWu9j05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJQJwx3G/
 DOuE2LRPAk7CoHEySi5wmupnsaSsBGhc6kTC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4qjb+QGCHUAfUyVMLtchsaceSTU02
 3eTktjuBDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bzRLoS+RnQaOMp4fLRx6r2
 xGn/Dg4iOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRfYuC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFywPtmY
 8vHIJn8VCZy5UFbIN2eHbt17FPW7npmmTO7qW7TnnxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9c4wvkJzr2Wo
 SnVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:OALUVa9HnoR3ZZNbVzZuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:Jxop8WHLqDOw1J6pqmIk9GkRKMR0f0T0lkmODBSgKEs5WLuaHAo=
X-Talos-MUID: 9a23:u9DCXARXky+Iq4HuRXTSnBBcaZxo8ZieEUUVuMgriZOvHi1vbmI=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119453629"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH v3 07/10] tools: Introduce a non-truncating xc_xenver_capabilities()
Date: Tue, 15 Aug 2023 22:06:47 +0100
Message-ID: <20230815210650.2735671-8-andrew.cooper3@citrix.com>
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
 tools/libs/light/libxl.c            |  4 +---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 18 ++++++++++++++++--
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index b839196bf4c4..9bd5eed7397a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1598,6 +1598,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
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
index f91f7271d5bf..ae6c5e04cd59 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -584,7 +584,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     union {
         xen_compile_info_t xen_cc;
         xen_changeset_info_t xen_chgset;
-        xen_capabilities_info_t xen_caps;
         xen_platform_parameters_t p_parms;
         xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
@@ -608,8 +607,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->compile_domain = libxl__strdup(NOGC, u.xen_cc.compile_domain);
     info->compile_date = libxl__strdup(NOGC, u.xen_cc.compile_date);
 
-    xc_version(ctx->xch, XENVER_capabilities, &u.xen_caps);
-    info->capabilities = libxl__strdup(NOGC, u.xen_caps);
+    info->capabilities = xc_xenver_capabilities(ctx->xch);
 
     xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
     info->changeset = libxl__strdup(NOGC, u.xen_chgset);
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 379a7935a145..e8da7d18d29d 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1062,9 +1062,23 @@ CAMLprim value stub_xc_version_changeset(value xch_val)
 
 CAMLprim value stub_xc_version_capabilities(value xch_val)
 {
-	xen_capabilities_info_t ci;
+	CAMLparam1(xch_val);
+	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
+	char *capabilities;
+
+	caml_enter_blocking_section();
+	capabilities = xc_xenver_capabilities(xch);
+	caml_leave_blocking_section();
 
-	return xc_version_single_string(xch_val, XENVER_capabilities, &ci);
+	if (!capabilities)
+		failwith_xc(xch);
+
+	result = caml_copy_string(capabilities);
+
+	free(capabilities);
+
+	CAMLreturn(result);
 }
 
 
-- 
2.30.2


