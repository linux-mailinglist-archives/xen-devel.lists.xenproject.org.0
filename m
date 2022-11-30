Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B763DC07
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450096.707265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxS-00055V-N7; Wed, 30 Nov 2022 17:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450096.707265; Wed, 30 Nov 2022 17:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxS-00053e-Hg; Wed, 30 Nov 2022 17:33:18 +0000
Received: by outflank-mailman (input) for mailman id 450096;
 Wed, 30 Nov 2022 17:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0QxR-00053X-3v
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114a107b-70d5-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 18:33:15 +0100 (CET)
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
X-Inumbo-ID: 114a107b-70d5-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B7XrV77otQZr2bmIK7huqRctxQtLlsxHZQUaKQ7Y7q8=;
  b=Q8h72x2uc8i0RjasTKe/N1jTVHdJjnRcmE+gxN+9AEIxIxWr5LmBRbfm
   QdE9oaZRSTps4Cdb3wpe69LgLiZYfhxRdppoEGgtdfuYefFIsLukuwxMO
   64yVQQMPo0pHk/UzOg7eJCfToBgtqUSmpiOxEU5osEHTSCHUPPI4z0Y6k
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86313610
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lg4mnqjZUi/+DKrXzquvOEBpX161dBAKZh0ujC45NGQN5FlHY01je
 htvWzyAMv+Iazb3eogkYYrg9h5T78TRytZnHgFrpCkwFn4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QSGzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQSMjMOMw6AlduHwZ6KWMVAjJ9zFe3kadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHyfyNZrhSJorAw4EDYzRBr0airO93QEjCPbZULxR/D+
 Duel4j/Kjc/G9GT2Tekzn2tq8bErRPxZpMoE4Tto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ89iMwoIAo+UesT927WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sESIPLmxfeywWdDoEz+jxjK051UL2atk2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oxZPnqgKulmSwXuF1e5aEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPMkuKFHZoX8yORD4M4XRfK4Ey/lX1
 XCzKJbEMJrnIf4/kGreqxk1jtfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClM9STt4VK+MmepJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:gs2GP6tklA7/7iaOstds2vAr7skDctV00zEX/kB9WHVpm6uj+/
 xG/c516faQsl0ssR4b9+xoVJPgfZq/z+8X3WBhB9eftWDd0QPDQb2KhrGSoQEIdReOktJ15O
 NNdLV/Fc21LXUSt7ec3OBgKadE/OW6
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="86313610"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Date: Wed, 30 Nov 2022 17:32:35 +0000
Message-ID: <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669829264.git.edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
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
 tools/ocaml/libs/xc/xenctrl.ml      | 44 ++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 45 +++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 16 ++++++++++
 3 files changed, 105 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index c21e391f98..1f8d927b0c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -298,6 +298,50 @@ external map_foreign_range: handle -> domid -> int
   -> nativeint -> Xenmmap.mmap_interface
   = "stub_map_foreign_range"
 
+type hvm_param =
+  | HVM_PARAM_CALLBACK_IRQ
+  | HVM_PARAM_STORE_PFN
+  | HVM_PARAM_STORE_EVTCHN
+  | HVM_PARAM_UNDEFINED_3
+  | HVM_PARAM_PAE_ENABLED
+  | HVM_PARAM_IOREQ_PFN
+  | HVM_PARAM_BUFIOREQ_PFN
+  | HVM_PARAM_UNDEFINED_7
+  | HVM_PARAM_UNDEFINED_8
+  | HVM_PARAM_VIRIDIAN
+  | HVM_PARAM_TIMER_MODE0
+  | HVM_PARAM_HPET_ENABLED1
+  | HVM_PARAM_IDENT_PT2
+  | HVM_PARAM_UNDEFINED_13
+  | HVM_PARAM_ACPI_S_STATE4
+  | HVM_PARAM_VM86_TSS5
+  | HVM_PARAM_VPT_ALIGN6
+  | HVM_PARAM_CONSOLE_PFN7
+  | HVM_PARAM_CONSOLE_EVTCHN8
+  | HVM_PARAM_ACPI_IOPORTS_LOCATION9
+  | HVM_PARAM_MEMORY_EVENT_CR00
+  | HVM_PARAM_MEMORY_EVENT_CR31
+  | HVM_PARAM_MEMORY_EVENT_CR42
+  | HVM_PARAM_MEMORY_EVENT_INT33
+  | HVM_PARAM_NESTEDHVM4
+  | HVM_PARAM_MEMORY_EVENT_SINGLE_STEP5
+  | HVM_PARAM_UNDEFINED_26
+  | HVM_PARAM_PAGING_RING_PFN7
+  | HVM_PARAM_MONITOR_RING_PFN8
+  | HVM_PARAM_SHARING_RING_PFN9
+  | HVM_PARAM_MEMORY_EVENT_MSR0
+  | HVM_PARAM_TRIPLE_FAULT_REASON1
+  | HVM_PARAM_IOREQ_SERVER_PFN2
+  | HVM_PARAM_NR_IOREQ_SERVER_PAGES3
+  | HVM_PARAM_VM_GENERATION_ID_ADDR4
+  | HVM_PARAM_ALTP2M5
+  | HVM_PARAM_X87_FIP_WIDTH6
+  | HVM_PARAM_VM86_TSS_SIZED7
+  | HVM_PARAM_MCA_CAP8
+
+external hvm_param_get: handle -> domid -> hvm_param -> int64
+  = "stub_xc_hvm_param_get"
+
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
   = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 60e7902e66..f6c7e5b553 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -236,6 +236,51 @@ external map_foreign_range :
   handle -> domid -> int -> nativeint -> Xenmmap.mmap_interface
   = "stub_map_foreign_range"
 
+(* needs to be sorted according to its numeric value, watch out for gaps! *)
+type hvm_param =
+  | HVM_PARAM_CALLBACK_IRQ
+  | HVM_PARAM_STORE_PFN
+  | HVM_PARAM_STORE_EVTCHN
+  | HVM_PARAM_UNDEFINED_3
+  | HVM_PARAM_PAE_ENABLED
+  | HVM_PARAM_IOREQ_PFN
+  | HVM_PARAM_BUFIOREQ_PFN
+  | HVM_PARAM_UNDEFINED_7
+  | HVM_PARAM_UNDEFINED_8
+  | HVM_PARAM_VIRIDIAN
+  | HVM_PARAM_TIMER_MODE0
+  | HVM_PARAM_HPET_ENABLED1
+  | HVM_PARAM_IDENT_PT2
+  | HVM_PARAM_UNDEFINED_13
+  | HVM_PARAM_ACPI_S_STATE4
+  | HVM_PARAM_VM86_TSS5
+  | HVM_PARAM_VPT_ALIGN6
+  | HVM_PARAM_CONSOLE_PFN7
+  | HVM_PARAM_CONSOLE_EVTCHN8
+  | HVM_PARAM_ACPI_IOPORTS_LOCATION9
+  | HVM_PARAM_MEMORY_EVENT_CR00
+  | HVM_PARAM_MEMORY_EVENT_CR31
+  | HVM_PARAM_MEMORY_EVENT_CR42
+  | HVM_PARAM_MEMORY_EVENT_INT33
+  | HVM_PARAM_NESTEDHVM4
+  | HVM_PARAM_MEMORY_EVENT_SINGLE_STEP5
+  | HVM_PARAM_UNDEFINED_26
+  | HVM_PARAM_PAGING_RING_PFN7
+  | HVM_PARAM_MONITOR_RING_PFN8
+  | HVM_PARAM_SHARING_RING_PFN9
+  | HVM_PARAM_MEMORY_EVENT_MSR0
+  | HVM_PARAM_TRIPLE_FAULT_REASON1
+  | HVM_PARAM_IOREQ_SERVER_PFN2
+  | HVM_PARAM_NR_IOREQ_SERVER_PAGES3
+  | HVM_PARAM_VM_GENERATION_ID_ADDR4
+  | HVM_PARAM_ALTP2M5
+  | HVM_PARAM_X87_FIP_WIDTH6
+  | HVM_PARAM_VM86_TSS_SIZED7
+  | HVM_PARAM_MCA_CAP8
+
+external hvm_param_get: handle -> domid -> hvm_param -> int64
+  = "stub_xc_hvm_param_get"
+
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
   = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 67f3648391..b2df93d4f8 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1176,6 +1176,22 @@ CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
     CAMLreturn(Val_unit);
 }
 
+CAMLprim value stub_xc_hvm_param_get(value xch, value domid, value param)
+{
+    CAMLparam3(xch, domid, param);
+    uint64_t result;
+    int ret;
+
+    caml_enter_blocking_section();
+    ret = xc_hvm_param_get(_H(xch), _D(domid), Int_val(param), &result);
+    caml_leave_blocking_section();
+
+    if ( ret )
+        failwith_xc(_H(xch));
+
+    CAMLreturn(caml_copy_int64(result));
+}
+
 static uint32_t encode_sbdf(int domain, int bus, int dev, int func)
 {
     return  ((uint32_t)domain & 0xffff) << 16 |
-- 
2.34.1


