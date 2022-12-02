Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76C64055A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451791.709580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13ip-0004Ht-DB; Fri, 02 Dec 2022 10:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451791.709580; Fri, 02 Dec 2022 10:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13ip-0004Ag-87; Fri, 02 Dec 2022 10:56:47 +0000
Received: by outflank-mailman (input) for mailman id 451791;
 Fri, 02 Dec 2022 10:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p13in-0003rQ-Rj
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:56:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02088ada-7230-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 11:56:43 +0100 (CET)
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
X-Inumbo-ID: 02088ada-7230-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669978603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QgjMO2gIB8QWUK5sjC9SR0sZ2xWrGexC5cYmAhj6F4=;
  b=IcR0B3Tbf5MWEM+QbsGobvstwY9iTYwZyFdjC9VSBXojNM9Sxnoo4edG
   ivq2lZI9banzy9JaGl63sc73WHXEVib+OyoDa3ARTF3LwX8ji1/sXKNP7
   zPD6Mi5h7Eq6mKUDyABUUXG3BuOv3wyIaZQ/ts/DQpWmNHzvlOxWuOHpq
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86240596
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G4HeNat/U8aAxXcQb5bfg3KsNufnVF5eMUV32f8akzHdYApBsoF/q
 tZmKT+Fa63bZmSkL90kaomy/E0HsZ7WnNBrTFRorHoyRiNE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweCIWZTWPnOCK5rfqQ8tx1997PeDNM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0FwBzE/
 j+XoQwVBDkKOIyR8iaO0Evvj//2nQPFdY00L+a3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0V9NOHsUg5QqKy66S5ByWbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwBFP3QJQCMfTzcj5ojqgpxilUreZ/BsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMYgJVbWong1OxfNt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GXeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQMKbTeclA7Qz97YxITqJt4E7FYc21uvr+g1
 hmAtoVwkQKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:HjWhT6CUP2uayUrlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86240596"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/4] tools/ocaml/libs/xc: add hvm_param_get binding
Date: Fri, 2 Dec 2022 10:55:58 +0000
Message-ID: <af355b5ef654745130815f30299d67bea7284f0e.1669978356.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669978356.git.edvin.torok@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Not to be confused which hvm_get_param, which also exists and has a
different, more error-prone interface.

This one always returns a 64-bit value, and that is retained in the
OCaml binding as well, returning 'int64' (and not int, or nativeint
which might have a different size).

The integer here is unsigned in the C API, however OCaml only has signed integers.

No bits are lost, it is just a matter of interpretation when printing
and for certain arithmetic operations, however in the cases where the
MSB is set it is very likely that the value is an address and no
arithmetic should be performed on the OCaml side on it.
(this is not a new problem with this binding, but worth mentioning given
the difference in types)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes since v1:
* drop accidental extra numbers in variant names
* use 'val' instead of 'result' for local var
* add binding for hvm_param_set
---
 tools/ocaml/libs/xc/xenctrl.ml      | 47 ++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 48 +++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 32 +++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 5dac47991e..370dac3fc8 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -299,6 +299,53 @@ external map_foreign_range: handle -> domid -> int
   -> nativeint -> Xenmmap.mmap_interface
   = "stub_map_foreign_range"
 
+type hvm_param =
+  | HVM_PARAM_CALLBACK_IRQ
+  | HVM_PARAM_STORE_PFN
+  | HVM_PARAM_STORE_EVTCHN
+  | HVM_PARAM_UNDEF_3
+  | HVM_PARAM_PAE_ENABLED
+  | HVM_PARAM_IOREQ_PFN
+  | HVM_PARAM_BUFIOREQ_PFN
+  | HVM_PARAM_UNDEF_7
+  | HVM_PARAM_UNDEF_8
+  | HVM_PARAM_VIRIDIAN
+  | HVM_PARAM_TIMER_MODE0
+  | HVM_PARAM_HPET_ENABLED1
+  | HVM_PARAM_IDENT_PT2
+  | HVM_PARAM_UNDEF_13
+  | HVM_PARAM_ACPI_S_STATE
+  | HVM_PARAM_VM86_TSS
+  | HVM_PARAM_VPT_ALIGN
+  | HVM_PARAM_CONSOLE_PFN
+  | HVM_PARAM_CONSOLE_EVTCHN
+  | HVM_PARAM_ACPI_IOPORTS_LOCATION
+  | HVM_PARAM_MEMORY_EVENT_CR0
+  | HVM_PARAM_MEMORY_EVENT_CR3
+  | HVM_PARAM_MEMORY_EVENT_CR4
+  | HVM_PARAM_MEMORY_EVENT_INT3
+  | HVM_PARAM_NESTEDHVM
+  | HVM_PARAM_MEMORY_EVENT_SINGLE_STEP
+  | HVM_PARAM_UNDEF_26
+  | HVM_PARAM_PAGING_RING_PFN
+  | HVM_PARAM_MONITOR_RING_PFN
+  | HVM_PARAM_SHARING_RING_PFN
+  | HVM_PARAM_MEMORY_EVENT_MSR
+  | HVM_PARAM_TRIPLE_FAULT_REASON
+  | HVM_PARAM_IOREQ_SERVER_PFN
+  | HVM_PARAM_NR_IOREQ_SERVER_PAGES
+  | HVM_PARAM_VM_GENERATION_ID_ADDR
+  | HVM_PARAM_ALTP2M
+  | HVM_PARAM_X87_FIP_WIDTH6
+  | HVM_PARAM_VM86_TSS_SIZED
+  | HVM_PARAM_MCA_CAP
+
+external hvm_param_get: handle -> domid -> hvm_param -> int64
+  = "stub_xc_hvm_param_get"
+
+external hvm_param_set: handle -> domid -> hvm_param -> int64 -> unit
+  = "stub_xc_hvm_param_set"
+
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
   = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6c9206bc74..e18d5cddb7 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -236,6 +236,54 @@ external map_foreign_range :
   handle -> domid -> int -> nativeint -> Xenmmap.mmap_interface
   = "stub_map_foreign_range"
 
+(* needs to be sorted according to its numeric value, watch out for gaps! *)
+type hvm_param =
+  | HVM_PARAM_CALLBACK_IRQ
+  | HVM_PARAM_STORE_PFN
+  | HVM_PARAM_STORE_EVTCHN
+  | HVM_PARAM_UNDEF_3
+  | HVM_PARAM_PAE_ENABLED
+  | HVM_PARAM_IOREQ_PFN
+  | HVM_PARAM_BUFIOREQ_PFN
+  | HVM_PARAM_UNDEF_7
+  | HVM_PARAM_UNDEF_8
+  | HVM_PARAM_VIRIDIAN
+  | HVM_PARAM_TIMER_MODE0
+  | HVM_PARAM_HPET_ENABLED1
+  | HVM_PARAM_IDENT_PT2
+  | HVM_PARAM_UNDEF_13
+  | HVM_PARAM_ACPI_S_STATE
+  | HVM_PARAM_VM86_TSS
+  | HVM_PARAM_VPT_ALIGN
+  | HVM_PARAM_CONSOLE_PFN
+  | HVM_PARAM_CONSOLE_EVTCHN
+  | HVM_PARAM_ACPI_IOPORTS_LOCATION
+  | HVM_PARAM_MEMORY_EVENT_CR0
+  | HVM_PARAM_MEMORY_EVENT_CR3
+  | HVM_PARAM_MEMORY_EVENT_CR4
+  | HVM_PARAM_MEMORY_EVENT_INT3
+  | HVM_PARAM_NESTEDHVM
+  | HVM_PARAM_MEMORY_EVENT_SINGLE_STEP
+  | HVM_PARAM_UNDEF_26
+  | HVM_PARAM_PAGING_RING_PFN
+  | HVM_PARAM_MONITOR_RING_PFN
+  | HVM_PARAM_SHARING_RING_PFN
+  | HVM_PARAM_MEMORY_EVENT_MSR
+  | HVM_PARAM_TRIPLE_FAULT_REASON
+  | HVM_PARAM_IOREQ_SERVER_PFN
+  | HVM_PARAM_NR_IOREQ_SERVER_PAGES
+  | HVM_PARAM_VM_GENERATION_ID_ADDR
+  | HVM_PARAM_ALTP2M
+  | HVM_PARAM_X87_FIP_WIDTH6
+  | HVM_PARAM_VM86_TSS_SIZED
+  | HVM_PARAM_MCA_CAP
+
+external hvm_param_get: handle -> domid -> hvm_param -> int64
+  = "stub_xc_hvm_param_get"
+
+external hvm_param_set: handle -> domid -> hvm_param -> int64 -> unit
+  = "stub_xc_hvm_param_set"
+
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
   = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index a492ea17fd..d042edb495 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1178,6 +1178,38 @@ CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
     CAMLreturn(Val_unit);
 }
 
+CAMLprim value stub_xc_hvm_param_get(value xch, value domid, value param)
+{
+    CAMLparam3(xch, domid, param);
+    uint64_t val;
+    int ret;
+
+    caml_enter_blocking_section();
+    ret = xc_hvm_param_get(_H(xch), _D(domid), Int_val(param), &val);
+    caml_leave_blocking_section();
+
+    if ( ret )
+        failwith_xc(_H(xch));
+
+    CAMLreturn(caml_copy_int64(val));
+}
+
+CAMLprim value stub_xc_hvm_param_set(value xch, value domid, value param, value val)
+{
+    CAMLparam4(xch, domid, param, val);
+    int ret;
+
+    caml_enter_blocking_section();
+    ret = xc_hvm_param_set(_H(xch), _D(domid), Int_val(param), Int64_val(val));
+    caml_leave_blocking_section();
+
+    if ( ret )
+        failwith_xc(_H(xch));
+
+    CAMLreturn(Val_unit);
+}
+
+
 static uint32_t encode_sbdf(int domain, int bus, int dev, int func)
 {
     return  ((uint32_t)domain & 0xffff) << 16 |
-- 
2.34.1


