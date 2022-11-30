Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4063DC0B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450101.707297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxj-000657-KA; Wed, 30 Nov 2022 17:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450101.707297; Wed, 30 Nov 2022 17:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxj-00062S-GB; Wed, 30 Nov 2022 17:33:35 +0000
Received: by outflank-mailman (input) for mailman id 450101;
 Wed, 30 Nov 2022 17:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qxi-00053d-5S
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1b3528-70d5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:33:32 +0100 (CET)
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
X-Inumbo-ID: 1b1b3528-70d5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TdKFY6xa4RIITGrxxK+ZLNUPhd54yxmI6+a2nMfKmA8=;
  b=L49WcI1jrgPpJEY1DqI0oCe5rOyLycD4qHceuyracvW8SakXApyzvhHl
   fxt3M2SYw4wC1qEpSGh6+lydzyboxDBSnWtguE4PSbyOHLn9lkMPacFjj
   IlhK+qbcT4S6mYNc/JJOJ5Nmk5zBt8WLwxxnGwvjszXP3ktbsVpMQFQm7
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 84930615
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B+zHVaxNFohiJwWmSs56t+cgxirEfRIJ4+MujC+fZmUNrF6WrkUAm
 zcZXm6HaP+PMDfzLoolaoWwoEgBu5GEyNMyGlRspCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPqgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU0Qr
 MIKBBcBVFOCg8OQ0fGna/JDn9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tOqkmHj5NSFfslWWjaE2/3LS3Ep6172F3N/9KoDbHp0LxxvwS
 mTu0Wi6XwoxJsGjzmCM6Xj9huL0uDzcV9dHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHKNoBM0QddbFOw+rgaXxcL8/AKxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8gW3rBzo5CmM4Ji4AbC0UoMXCu64qkUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N5n9hO0yT5FWy13N2ZDBkBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66KP4USPMYsKlPbokmCgHJ8OUi3yCDAdolma
 f+mnTuEVy5GWcyLMhLpLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/L7XSeFM5SDx5Upc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACg7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:Asj1Y6ijO415SD9gjhfNZBmGcXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="84930615"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to xc_evtchn_status
Date: Wed, 30 Nov 2022 17:32:34 +0000
Message-ID: <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669829264.git.edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no API or ioctl to query event channel status, it is only
present in xenctrl.h

The C union is mapped to an OCaml variant exposing just the value from the
correct union tag.

Querying event channel status is useful when analyzing Windows VMs that
may have reset and changed the xenstore event channel port number from
what it initially got booted with.
The information provided here is similar to 'lstevtchn', but rather than
parsing its output it queries the underlying API directly.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 14 +++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 15 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 65 +++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2ed7454b16..c21e391f98 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -267,6 +267,20 @@ external evtchn_alloc_unbound: handle -> domid -> domid -> int
   = "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset: handle -> domid -> unit = "stub_xc_evtchn_reset"
 
+type evtchn_interdomain = { dom: domid; port: int}
+
+type evtchn_stat =
+  | EVTCHNSTAT_unbound of domid
+  | EVTCHNSTAT_interdomain of evtchn_interdomain
+  | EVTCHNSTAT_pirq of int
+  | EVTCHNSTAT_virq of int
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
index 0f80aafea0..60e7902e66 100644
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
+  | EVTCHNSTAT_virq of int
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
index d30585f21c..67f3648391 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -641,6 +641,71 @@ CAMLprim value stub_xc_evtchn_reset(value xch, value domid)
     CAMLreturn(Val_unit);
 }
 
+CAMLprim value stub_xc_evtchn_status(value xch, value domid, value port)
+{
+    CAMLparam3(xch, domid, port);
+    CAMLlocal4(result, result_status, stat, interdomain);
+    xc_evtchn_status_t status;
+    int rc;
+
+    memset(&status, 0, sizeof(status));
+    status.dom = _D(domid);
+    status.port = Int_val(port);
+
+    caml_enter_blocking_section();
+    rc = xc_evtchn_status(_H(xch), &status);
+    caml_leave_blocking_section();
+
+    if ( rc < 0 )
+        failwith_xc(_H(xch));
+
+    if ( status.status == EVTCHNSTAT_closed )
+        result = Val_none;
+    else
+    {
+        switch ( status.status )
+        {
+        case EVTCHNSTAT_unbound:
+            stat = caml_alloc(1, 0); /* 1st non-constant constructor */
+            Store_field(stat, 0, Val_int(status.u.unbound.dom));
+            break;
+
+        case EVTCHNSTAT_interdomain:
+            interdomain = caml_alloc_tuple(2);
+            Store_field(interdomain, 0, Val_int(status.u.interdomain.dom));
+            Store_field(interdomain, 1, Val_int(status.u.interdomain.port));
+            stat = caml_alloc(1, 1); /*  2nd non-constant constructor */
+            Store_field(stat, 0, interdomain);
+            break;
+        case EVTCHNSTAT_pirq:
+            stat = caml_alloc(1, 2); /* 3rd non-constant constructor */
+            Store_field(stat, 0, Val_int(status.u.pirq));
+            break;
+
+        case EVTCHNSTAT_virq:
+            stat = caml_alloc(1, 3); /* 4th non-constant constructor */
+            Store_field(stat, 0, Val_int(status.u.virq));
+            break;
+
+        case EVTCHNSTAT_ipi:
+            stat = Val_int(0); /* 1st constant constructor */
+            break;
+
+        default:
+            caml_failwith("Unkown evtchn status");
+        }
+        result_status = caml_alloc_tuple(2);
+        Store_field(result_status, 0, Val_int(status.vcpu));
+        Store_field(result_status, 1, stat);
+
+        /* Tag_some and caml_alloc_some are missing in older versions of OCaml
+         */
+        result = caml_alloc_small(1, 0);
+        Store_field(result, 0, result_status);
+    }
+
+    CAMLreturn(result);
+}
 
 CAMLprim value stub_xc_readconsolering(value xch)
 {
-- 
2.34.1


