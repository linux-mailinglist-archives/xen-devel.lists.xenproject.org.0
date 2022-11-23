Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F01636D0B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 23:27:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447736.704307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxyBW-0003cd-MN; Wed, 23 Nov 2022 22:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447736.704307; Wed, 23 Nov 2022 22:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxyBW-0003ZK-IX; Wed, 23 Nov 2022 22:25:38 +0000
Received: by outflank-mailman (input) for mailman id 447736;
 Wed, 23 Nov 2022 22:25:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuiL=3X=citrix.com=prvs=31995ac12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxyBV-0003ZB-PC
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 22:25:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be43bc55-6b7d-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 23:25:34 +0100 (CET)
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
X-Inumbo-ID: be43bc55-6b7d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669242334;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ss1D4ingsK86pl+VHuAvo8YZPZvL2G85Rxu9B0/DrhI=;
  b=DzH5TA7x0x6i5kKGhEZWxjQGQT50DnWt/xswhUgcEclt/AjU6CLC9CTu
   r5TYbf23UUs4fGfuPf7usi5JJ66PwRF1ZvQZfmInOftvPQppBmvmrVHoD
   j9mCx6T4cRZnJnbVTX7CNklR/aapSQNi+o9q8Kdah3fC0a4G8YHFENJ3n
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 87991771
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yQxpZKkO2FyqLJGAzT2usY3o5gziJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWmqAOKncMGb3Lt0ga4u3/ElUvJeDzNBgSQc4/y4xFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gSGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dsVDh0SdxGqvMez/ILqa7hDiNgyAeC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zhnJ9
 zuZoD2R7hcyF+zB5Cqf+2CQlMjsliD9aIM2DYyWz6s/6LGU7jNKU0BHPbehmtG1g1Czc8hSI
 EsV/mwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9bn+726iNrBqJHC0pHT4jNAAKURooyoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGeE6bKMN8N7n9hIx0NPhagKvFlDyL5Ba67puVbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4W/DKCIPooVOMAZmOq7EMZGPB744owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FdfDVbLIYo43KymNLpmtvPd+F2Nm
 zudXuPToyhivCTFSnG/2eYuwZoidxDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:zOFf/KvkWEaXFsm62Gi8xp4w7skDYtV00zEX/kB9WHVpmszxra
 +TdZUgpHvJYVkqOU3I9ersBEDiewK4yXcW2+ks1N6ZNWGM0ldARLsSj7cKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="87991771"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Date: Wed, 23 Nov 2022 22:25:17 +0000
Message-ID: <20221123222517.12140-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The binding for xc_interface_close() free the underlying handle while leaving
the Ocaml object still in scope and usable.  This would make it easy to suffer
a use-after-free, if it weren't for the fact that the typical usage is as a
singleton that lives for the lifetime of the program.

Ocaml 5 no longer permits storing a naked C pointer in an Ocaml value.

Therefore, use a Custom block.  This allows us to use the finaliser callback
to call xc_interface_close(), if the Ocaml object goes out of scope.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

I've confirmed that Xenctrl.close_handle does cause the finaliser to be
called, simply by dropping the handle reference.
---
 tools/ocaml/libs/xc/xenctrl.ml      |  3 +--
 tools/ocaml/libs/xc/xenctrl.mli     |  1 -
 tools/ocaml/libs/xc/xenctrl_stubs.c | 43 ++++++++++++++++++++++---------------
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index aa650533f718..4b74e31c75cb 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -175,7 +175,6 @@ exception Error of string
 type handle
 
 external interface_open: unit -> handle = "stub_xc_interface_open"
-external interface_close: handle -> unit = "stub_xc_interface_close"
 
 let handle = ref None
 
@@ -183,7 +182,7 @@ let get_handle () = !handle
 
 let close_handle () =
 	match !handle with
-	| Some h -> handle := None; interface_close h
+	| Some h -> handle := None
 	| None -> ()
 
 let with_intf f =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 5bf5f5dfea36..ddfe84dc22a9 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -146,7 +146,6 @@ type shutdown_reason = Poweroff | Reboot | Suspend | Crash | Watchdog | Soft_res
 exception Error of string
 type handle
 external interface_open : unit -> handle = "stub_xc_interface_open"
-external interface_close : handle -> unit = "stub_xc_interface_close"
 
 (** [with_intf f] runs [f] with a global handle that is opened on demand
  * and kept open. Conceptually, a client should use either
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index f37848ae0bb3..4e1204085422 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -37,13 +37,28 @@
 
 #include "mmap_stubs.h"
 
-#define _H(__h) ((xc_interface *)(__h))
+#define _H(__h) (*((xc_interface **)Data_custom_val(__h)))
 #define _D(__d) ((uint32_t)Int_val(__d))
 
 #ifndef Val_none
 #define Val_none (Val_int(0))
 #endif
 
+static void stub_xenctrl_finalize(value v)
+{
+	xc_interface_close(_H(v));
+}
+
+static struct custom_operations xenctrl_ops = {
+	.identifier  = "xenctrl",
+	.finalize    = stub_xenctrl_finalize,
+	.compare     = custom_compare_default,     /* Can't compare     */
+	.hash        = custom_hash_default,        /* Can't hash        */
+	.serialize   = custom_serialize_default,   /* Can't serialize   */
+	.deserialize = custom_deserialize_default, /* Can't deserialize */
+	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+};
+
 #define string_of_option_array(array, index) \
 	((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
 
@@ -70,26 +85,20 @@ static void Noreturn failwith_xc(xc_interface *xch)
 CAMLprim value stub_xc_interface_open(void)
 {
 	CAMLparam0();
-        xc_interface *xch;
-
-	/* Don't assert XC_OPENFLAG_NON_REENTRANT because these bindings
-	 * do not prevent re-entrancy to libxc */
-        xch = xc_interface_open(NULL, NULL, 0);
-        if (xch == NULL)
-		failwith_xc(NULL);
-        CAMLreturn((value)xch);
-}
-
-
-CAMLprim value stub_xc_interface_close(value xch)
-{
-	CAMLparam1(xch);
+	CAMLlocal1(result);
+	xc_interface *xch;
 
 	caml_enter_blocking_section();
-	xc_interface_close(_H(xch));
+	xch = xc_interface_open(NULL, NULL, 0);
 	caml_leave_blocking_section();
 
-	CAMLreturn(Val_unit);
+	if ( !xch )
+		failwith_xc(xch);
+
+	result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
+	_H(result) = xch;
+
+	CAMLreturn(result);
 }
 
 static void domain_handle_of_uuid_string(xen_domain_handle_t h,
-- 
2.11.0


