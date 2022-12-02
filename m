Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14B640559
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451792.709594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13j0-0004rT-LT; Fri, 02 Dec 2022 10:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451792.709594; Fri, 02 Dec 2022 10:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13j0-0004mj-IF; Fri, 02 Dec 2022 10:56:58 +0000
Received: by outflank-mailman (input) for mailman id 451792;
 Fri, 02 Dec 2022 10:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p13iz-0003rQ-0F
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:56:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07415175-7230-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 11:56:55 +0100 (CET)
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
X-Inumbo-ID: 07415175-7230-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669978615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bOQ3oRol1JrYqAer48HmKkncGmJC2gDM4u9fgjLBE4w=;
  b=PwUcsH1Sd6ese38RgEAqgl/itElvM4QLSH4HKAtEliMYWLKWPdrVVhlh
   HLUZOLiPJFYh5G1/u6BIqo8yyJLNK6a5f3dPMG6LGzUvdGhDwDAqoxbfv
   dbn97ijudYO7ZG2IpfpLQ02f+iwsM7orI3VPJkHPIhPHb6OTCnMbL6tqY
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86249443
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9+w8H60VYJD1MzPDD/bD5cBxkn2cJEfYwER7XKvMYLTBsI5bpzdSz
 jcZDTrSb/aDa2umc48iPITl8UoP78KDmIcwTQM6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmP6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJ1Nq5
 KYydg80dDufpbyn6rfrTMNiiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWkeu2h3+5bzpCr1G9rqsr+WnDigd21dABNfKFJIbWFJkJxS50o
 Erq3XyoMBJLLeWF2BaA0nOju8zUzTnkDdd6+LqQqacx3Qz7KnYoIA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQrHeaszYGVtFXEul87xuCooLL5y6JC25CSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+ynxejYwJLElYYTjMmExov5onlio8820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHRcFJG9eFoSTLkWVsDNZWei9U3j4sI2OBX
 aMphStf5YVIIFyhZrJtboS6BqwClPa+RIW8B66NNYQXP/CdkTNrGwk3NSatM53FyhBwwcnTx
 7/EGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G396
 chEDcKWxn13CaumCsUh2dJJfA9iwLlSLcyelvG7gcbYfVA7SDt8UKGLqV7jEqQ895loei7z1
 inVcidlJJDX3yScQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:fTToYqNaVxtv/sBcTvWjsMiBIKoaSvp037BL7TEXdfUxSKelfq
 +V8sjzuSWUtN9uYgBDpTnwAtjlfVr67tpO7Y4deZ2iVA7gtG7AFvAF0WKK+VSJdxEWkNQ86U
 5OScdD4bbLfD1HZKjBkWqF+55J+rO6GOrBv4rj80s=
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86249443"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/4] tools/ocaml/libs/xc: add binding to xc_evtchn_status
Date: Fri, 2 Dec 2022 10:55:57 +0000
Message-ID: <c43ff9e8a95a73dadcd5db6ad10340a45592dd01.1669978356.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669978356.git.edvin.torok@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no API or ioctl to query event channel status, it is only
present in xenctrl.h

The C union is mapped to an OCaml variant exposing just the value from the
correct union tag.

The information provided here is similar to 'lsevtchn', but rather than
parsing its output it queries the underlying API directly.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes since v1:
* drop paragraph about where this is used
* add comment about max port
* use Xeneventchn.virq_t instead of int, add a dependency: xc -> eventchn
* initialize struct without memset-ing first
* use 2 CAMLreturn, I found an example in the OCaml stdlib that does that so should be future-proof https://github.com/ocaml/ocaml/blob/663e8d219f566095e3a9497c5bae07b6a95cae39/otherlibs/unix/dup_win32.c#L52-L77
* use Tag_some, defining it if needed
* fix typo on failwith
---
 tools/ocaml/libs/Makefile           |  2 +-
 tools/ocaml/libs/xc/META.in         |  2 +-
 tools/ocaml/libs/xc/Makefile        |  2 +-
 tools/ocaml/libs/xc/xenctrl.ml      | 15 +++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 15 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 67 +++++++++++++++++++++++++++++
 6 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/Makefile b/tools/ocaml/libs/Makefile
index 7e7c27e2d5..15f45a6d66 100644
--- a/tools/ocaml/libs/Makefile
+++ b/tools/ocaml/libs/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS= \
 	mmap \
 	xentoollog \
-	xc eventchn \
+	eventchn xc\
 	xb xs xl
 
 .PHONY: all
diff --git a/tools/ocaml/libs/xc/META.in b/tools/ocaml/libs/xc/META.in
index 2ff4dcb6bf..6a273936a3 100644
--- a/tools/ocaml/libs/xc/META.in
+++ b/tools/ocaml/libs/xc/META.in
@@ -1,5 +1,5 @@
 version = "@VERSION@"
 description = "Xen Control Interface"
-requires = "unix,xenmmap"
+requires = "unix,xenmmap,xeneventchn"
 archive(byte) = "xenctrl.cma"
 archive(native) = "xenctrl.cmxa"
diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
index 3b76e9ad7b..1d9fecb06e 100644
--- a/tools/ocaml/libs/xc/Makefile
+++ b/tools/ocaml/libs/xc/Makefile
@@ -4,7 +4,7 @@ include $(OCAML_TOPLEVEL)/common.make
 
 CFLAGS += -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
 CFLAGS += $(APPEND_CFLAGS)
-OCAMLINCLUDE += -I ../mmap
+OCAMLINCLUDE += -I ../mmap -I ../eventchn
 
 OBJS = xenctrl
 INTF = xenctrl.cmi
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2ed7454b16..5dac47991e 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -267,6 +267,21 @@ external evtchn_alloc_unbound: handle -> domid -> domid -> int
   = "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset: handle -> domid -> unit = "stub_xc_evtchn_reset"
 
+(* FIFO has theoretical maximum of 2^28 ports, fits in an int *)
+type evtchn_interdomain = { dom: domid; port: int}
+
+type evtchn_stat =
+  | EVTCHNSTAT_unbound of domid
+  | EVTCHNSTAT_interdomain of evtchn_interdomain
+  | EVTCHNSTAT_pirq of int
+  | EVTCHNSTAT_virq of Xeneventchn.virq_t
+  | EVTCHNSTAT_ipi
+
+type evtchn_status = { vcpu: int; status: evtchn_stat }
+
+external evtchn_status: handle -> domid -> int -> evtchn_status option =
+  "stub_xc_evtchn_status"
+
 external readconsolering: handle -> string = "stub_xc_readconsolering"
 
 external send_debug_keys: handle -> string -> unit = "stub_xc_send_debug_keys"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 0f80aafea0..6c9206bc74 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -206,6 +206,21 @@ external shadow_allocation_get : handle -> domid -> int
 external evtchn_alloc_unbound : handle -> domid -> domid -> int
   = "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset : handle -> domid -> unit = "stub_xc_evtchn_reset"
+
+type evtchn_interdomain = { dom: domid; port: int}
+
+type evtchn_stat =
+  | EVTCHNSTAT_unbound of domid
+  | EVTCHNSTAT_interdomain of evtchn_interdomain
+  | EVTCHNSTAT_pirq of int
+  | EVTCHNSTAT_virq of Xeneventchn.virq_t
+  | EVTCHNSTAT_ipi
+
+type evtchn_status = { vcpu: int; status: evtchn_stat }
+
+external evtchn_status: handle -> domid -> int -> evtchn_status option =
+  "stub_xc_evtchn_status"
+
 external readconsolering : handle -> string = "stub_xc_readconsolering"
 external send_debug_keys : handle -> string -> unit = "stub_xc_send_debug_keys"
 external physinfo : handle -> physinfo = "stub_xc_physinfo"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index d30585f21c..a492ea17fd 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -44,6 +44,10 @@
 #define Val_none (Val_int(0))
 #endif
 
+#ifndef Tag_some
+#define Tag_some 0
+#endif
+
 #define string_of_option_array(array, index) \
     ((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
 
@@ -641,6 +645,69 @@ CAMLprim value stub_xc_evtchn_reset(value xch, value domid)
     CAMLreturn(Val_unit);
 }
 
+CAMLprim value stub_xc_evtchn_status(value xch, value domid, value port)
+{
+    CAMLparam3(xch, domid, port);
+    CAMLlocal4(result, result_status, stat, interdomain);
+    xc_evtchn_status_t status = {
+        .dom = _D(domid),
+        .port = Int_val(port),
+    };
+    int rc;
+
+    caml_enter_blocking_section();
+    rc = xc_evtchn_status(_H(xch), &status);
+    caml_leave_blocking_section();
+
+    if ( rc < 0 )
+        failwith_xc(_H(xch));
+
+    if ( status.status == EVTCHNSTAT_closed )
+        CAMLreturn(Val_none);
+
+    switch ( status.status )
+    {
+    case EVTCHNSTAT_unbound:
+        stat = caml_alloc(1, 0); /* 1st non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.unbound.dom));
+        break;
+
+    case EVTCHNSTAT_interdomain:
+        interdomain = caml_alloc_tuple(2);
+        Store_field(interdomain, 0, Val_int(status.u.interdomain.dom));
+        Store_field(interdomain, 1, Val_int(status.u.interdomain.port));
+        stat = caml_alloc(1, 1); /*  2nd non-constant constructor */
+        Store_field(stat, 0, interdomain);
+        break;
+    case EVTCHNSTAT_pirq:
+        stat = caml_alloc(1, 2); /* 3rd non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.pirq));
+        break;
+
+    case EVTCHNSTAT_virq:
+        stat = caml_alloc(1, 3); /* 4th non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.virq));
+        break;
+
+    case EVTCHNSTAT_ipi:
+        stat = Val_int(0); /* 1st constant constructor */
+        break;
+
+    default:
+        caml_failwith("Unknown evtchn status");
+
+    }
+    result_status = caml_alloc_tuple(2);
+    Store_field(result_status, 0, Val_int(status.vcpu));
+    Store_field(result_status, 1, stat);
+
+    /* caml_alloc_some is missing in older versions of OCaml
+     */
+    result = caml_alloc_small(1, Tag_some);
+    Store_field(result, 0, result_status);
+
+    CAMLreturn(result);
+}
 
 CAMLprim value stub_xc_readconsolering(value xch)
 {
-- 
2.34.1


