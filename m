Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1C2B6D45
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29207.58500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ej-0000RI-Jc; Tue, 17 Nov 2020 18:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29207.58500; Tue, 17 Nov 2020 18:24:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ej-0000QS-EL; Tue, 17 Nov 2020 18:24:41 +0000
Received: by outflank-mailman (input) for mailman id 29207;
 Tue, 17 Nov 2020 18:24:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kf5eh-0000Nf-64
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85000255-6885-414e-a09d-84777ce71f9c;
 Tue, 17 Nov 2020 18:24:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kf5eh-0000Nf-64
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:39 +0000
X-Inumbo-ID: 85000255-6885-414e-a09d-84777ce71f9c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 85000255-6885-414e-a09d-84777ce71f9c;
	Tue, 17 Nov 2020 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605637478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i6bm0XeGGoT0blOMLK0wVmpS37YcigZ/KepZXeFkhVk=;
  b=CDCQMG7ZH8K/EbvBWB+MpbTHoI9j8xNVqXJDi0aD7ISfwA2KK4kf0n5l
   uyLNDLTtlopMu0agRfSkEF6mBfIwQwI3XlWwjeRqQVDYibbTFFJVwDnTL
   WTjAk2E6SqwnZjZew5xCt8v8jPswBRB3ZH/XNVK2vA+aDt7Cw6QSJugEJ
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1YBI43kkoek/v47lc4t9Y8IDbe6KSH18dXeybFs4y06H72P+DI3XEiaAsV1+7yaI0gHedJaL4e
 PtPON66JBgeg0xnC3DNtU3+Du5cRE/i0ERcZoA7RQUJc6v8wir9J5A2fLmzacY0ImEjwPPfW0z
 6eMrNLnQYeeZ7agMNQK31Ay667AnvslrDpmTZ1p6xOUaxPaPnu4Ad07f30GqZRs5bEh3IbINPD
 je1isAWr+ASL7t04L0xOPt4qOspvC0qHF+6hkGReaC6amHYQT3dVlj6vCYsULEpGY1Vn/lCjfI
 REE=
X-SBRS: None
X-MesageID: 31385525
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31385525"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 4/4] tools/ocaml/libs/xc: backward compatible domid control at domain creation time
Date: Tue, 17 Nov 2020 18:24:12 +0000
Message-ID: <559929d2ae95f6527e5050051c917b7586182ad2.1605636800.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <cover.1605636799.git.edvin.torok@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

One can specify the domid to use when creating the domain, but this was hardcoded to 0.

Keep the existing `domain_create` function (and the type of its parameters) as is to make
backwards compatibility easier.
Introduce a new `domain_create_domid` OCaml API that allows specifying the domid.
A new version of xenopsd can choose to start using this, while old versions of xenopsd will keep
building and using the old API.

Controlling the domid can be useful during testing or migration.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 3 +++
 tools/ocaml/libs/xc/xenctrl.mli     | 2 ++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 9 +++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index e878699b0a..9d720886e9 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -182,6 +182,9 @@ let with_intf f =
 external domain_create: handle -> domctl_create_config -> domid
        = "stub_xc_domain_create"
 
+external domain_create_domid: handle -> domctl_create_config -> domid -> domid
+       = "stub_xc_domain_create_domid"
+
 external domain_sethandle: handle -> domid -> string -> unit
        = "stub_xc_domain_sethandle"
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index e64907df8e..e629022901 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -145,6 +145,8 @@ val close_handle: unit -> unit
 
 external domain_create : handle -> domctl_create_config -> domid
   = "stub_xc_domain_create"
+external domain_create_domid : handle -> domctl_create_config -> domid -> domid
+  = "stub_xc_domain_create_domid"
 external domain_sethandle : handle -> domid -> string -> unit = "stub_xc_domain_sethandle"
 external domain_max_vcpus : handle -> domid -> int -> unit
   = "stub_xc_domain_max_vcpus"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 94aba38a42..bb718fd164 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -175,7 +175,7 @@ static unsigned int ocaml_list_to_c_bitmap(value l)
 	return val;
 }
 
-CAMLprim value stub_xc_domain_create(value xch, value config)
+CAMLprim value stub_xc_domain_create_domid(value xch, value config, value want_domid)
 {
 	CAMLparam2(xch, config);
 	CAMLlocal2(l, arch_domconfig);
@@ -191,7 +191,7 @@ CAMLprim value stub_xc_domain_create(value xch, value config)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_ARCH                Field(config, 8)
 
-	uint32_t domid = 0;
+	uint32_t domid = Int_val(want_domid);
 	int result;
 	struct xen_domctl_createdomain cfg = {
 		.ssidref = Int32_val(VAL_SSIDREF),
@@ -262,6 +262,11 @@ CAMLprim value stub_xc_domain_create(value xch, value config)
 	CAMLreturn(Val_int(domid));
 }
 
+CAMLprim value stub_xc_domain_create(value xch, value config, value want_domid)
+{
+    return stub_xc_domain_create_domid(xch, config, Val_int(0));
+}
+
 CAMLprim value stub_xc_domain_max_vcpus(value xch, value domid,
                                         value max_vcpus)
 {
-- 
2.18.4


