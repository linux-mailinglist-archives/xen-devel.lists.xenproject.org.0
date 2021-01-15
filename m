Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EB2F8901
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68772.123240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3U-0003C5-JU; Fri, 15 Jan 2021 22:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68772.123240; Fri, 15 Jan 2021 22:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3U-0003BQ-Cg; Fri, 15 Jan 2021 22:58:56 +0000
Received: by outflank-mailman (input) for mailman id 68772;
 Fri, 15 Jan 2021 22:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xyv-0001Wj-2v
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:54:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 629a213d-4dfe-4247-bf5f-c08231a24f78;
 Fri, 15 Jan 2021 22:52:49 +0000 (UTC)
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
X-Inumbo-ID: 629a213d-4dfe-4247-bf5f-c08231a24f78
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fmXH+SV34jkCGcRhwIYTVVlbOpuedtyRttAjPwZ3tU=;
  b=CcVuX5iQNs+fVN63dfSRrLsvA6q/seyVFIkFDcNfMshZNM9Zj/oeWIaT
   yWVvjYZeLE7utfh4e4joa2CAmoq0335CYfWqitAN2fOMefSsD6hLl2lPo
   jqTK5rmY0QcMwhqgQBBVBlwJfYe7uMgHvvgVoucDopKQIloAdzVuW8SSl
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T6uE9a3+Hbivy7ic5p4Ho0uLZWHlEkl/q9h05/gdILwahYLCt++JDR8X6X08cYBMinvb6OivdF
 k+wPABfO6WAvOhXxAmB0ZcqtXv1dihG/xvPO1wfuV5Z9rJq3o6r9tnaDbC8UJiU/CriNC5PeKS
 3wNLaVbm7iqU/z1uyFMTPCOOLjbEvxsTftN5AUQ8HxSYUf77VIfzRwM0dpye0XtkGw8joJBB03
 Cnye1B64S1R6F0ywp2GmreXqXGUvj0miEoHp1xoz6N3Sc1RuluJbMVIwv7NWjAgA2klCqqDRGb
 5Tk=
X-SBRS: 5.1
X-MesageID: 35435287
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35435287"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] tools/ocaml/libs/xc: backward compatible domid control at domain creation time
Date: Fri, 15 Jan 2021 22:28:53 +0000
Message-ID: <610924e3a2a426cfe1d7a614c095c15a095c3475.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

One can specify the domid to use when creating the domain, but this was hardcoded to 0.

Keep the existing `domain_create` function, and make domid an optional argument.
When not specified default to 0.

A new version of xenopsd can choose to start using this, while old versions of xenopsd will keep
building and using the old API.
(The ABI will change, but that changes every time a function is introduced/removed or modified)

Controlling the domid can be useful during testing or migration.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Changed since V1:
* introduced an optional ?domid for better backwards compatibility
* use CAMLparam3 because we have an additional parameter
---
 tools/ocaml/libs/xc/xenctrl.ml      | 5 ++++-
 tools/ocaml/libs/xc/xenctrl.mli     | 4 ++--
 tools/ocaml/libs/xc/xenctrl_stubs.c | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index e878699b0a..e0a47c4769 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -179,9 +179,12 @@ let with_intf f =
 		handle := Some h;
 		f h
 
-external domain_create: handle -> domctl_create_config -> domid
+external domain_create_stub: handle -> domid -> domctl_create_config -> domid
        = "stub_xc_domain_create"
 
+let domain_create handle ?(domid=0) config =
+	domain_create_stub handle domid config
+
 external domain_sethandle: handle -> domid -> string -> unit
        = "stub_xc_domain_sethandle"
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index e64907df8e..84311fa33d 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -143,8 +143,8 @@ val get_handle: unit -> handle option
  * would invalidate the handle that with_intf passes to its argument. *)
 val close_handle: unit -> unit
 
-external domain_create : handle -> domctl_create_config -> domid
-  = "stub_xc_domain_create"
+val domain_create: handle -> ?domid:int -> domctl_create_config -> domid
+
 external domain_sethandle : handle -> domid -> string -> unit = "stub_xc_domain_sethandle"
 external domain_max_vcpus : handle -> domid -> int -> unit
   = "stub_xc_domain_max_vcpus"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 94aba38a42..9a8dbe5579 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -175,9 +175,9 @@ static unsigned int ocaml_list_to_c_bitmap(value l)
 	return val;
 }
 
-CAMLprim value stub_xc_domain_create(value xch, value config)
+CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config)
 {
-	CAMLparam2(xch, config);
+	CAMLparam3(xch, wanted_domid, config);
 	CAMLlocal2(l, arch_domconfig);
 
 	/* Mnemonics for the named fields inside domctl_create_config */
@@ -191,7 +191,7 @@ CAMLprim value stub_xc_domain_create(value xch, value config)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_ARCH                Field(config, 8)
 
-	uint32_t domid = 0;
+	uint32_t domid = Int_val(wanted_domid);
 	int result;
 	struct xen_domctl_createdomain cfg = {
 		.ssidref = Int32_val(VAL_SSIDREF),
-- 
2.29.2


