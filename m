Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFE3AC91B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144450.265862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luC0t-0003OP-8C; Fri, 18 Jun 2021 10:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144450.265862; Fri, 18 Jun 2021 10:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luC0t-0003Lu-4n; Fri, 18 Jun 2021 10:46:15 +0000
Received: by outflank-mailman (input) for mailman id 144450;
 Fri, 18 Jun 2021 10:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axfQ=LM=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1luC0r-0003Lo-Rg
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:46:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2421318e-c52e-47bf-8410-e2cc398a69e3;
 Fri, 18 Jun 2021 10:46:11 +0000 (UTC)
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
X-Inumbo-ID: 2421318e-c52e-47bf-8410-e2cc398a69e3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624013170;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9vOeCeFfOggb0WwAvbYfKTPJrxgP0fgM+hFpQdUu6Cw=;
  b=HDKGAFjkNJUkowY4Elyywh5zx4dnCXXH2K21RoZrWnKTngCGfWlquxKy
   wLzupSVJsuI+52z16zt6LCxIB2uCx9weGm6xDikAEcmJc0bM3ASGXlL7Y
   iCRIf5v1Euj6HR76EAA6FZyALpOrP14Hhuwg5antk8wzVE/dut7JIO57D
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hoguw0MVsLT8mcdRJCBigjaePAd3Wh3nqUxuzzyqPRAv/ydvVp8VL373AnyMKpeobLEcFpeSbd
 vqJedRcA1OXgjgUCI8Ko3h7khmAoPWsYkSIe5ThfXsFaydOVXtRF7TvpyUXOWZEDb8R2b2+NIE
 ppFkKEiLNiCpFaDLa8R4zFkhC5HWFj8gKjbKgQHHkCByrLotjczxWRf48y5svWfb/84YL/Ga84
 11GA6vs8tMrFA0SLPENTPe6LYuaZChXJFQpajc/KrCjxXzSEUZfRHE/LG67SqmIdwVWkmMoEyB
 Qec=
X-SBRS: 5.1
X-MesageID: 46518866
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KfGBEqNtJL/JGcBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46518866"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Date: Fri, 18 Jun 2021 11:45:15 +0100
Message-ID: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduces following functions in Xenctrl and associated types:
get_system_cpu_policy
cpu_policy_to_featureset,
string_of_xen_cpu_policy_index

These are wrappers around the existing C functions in xenctrl.h,
that will be used by xenopsd initially.

-Wno-declaration-after-statement is disabled to allow mixing
declarations and code to simplify writing the stubs
by using variable length arrays on the stack instead of
allocating/freeing memory
(which would require additional error-handling logic).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/Makefile        |   2 +-
 tools/ocaml/libs/xc/xenctrl.ml      |  37 ++++++
 tools/ocaml/libs/xc/xenctrl.mli     |  71 ++++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 195 ++++++++++++++++++++++++++++
 4 files changed, 304 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
index b6da4fdbaf..64dca99613 100644
--- a/tools/ocaml/libs/xc/Makefile
+++ b/tools/ocaml/libs/xc/Makefile
@@ -3,7 +3,7 @@ XEN_ROOT=$(TOPLEVEL)/../..
 include $(TOPLEVEL)/common.make
 
 CFLAGS += -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
-CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(APPEND_CFLAGS) -Wno-declaration-after-statement
 OCAMLINCLUDE += -I ../mmap
 
 OBJS = xenctrl
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a5588c643f..fa2cea5091 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -286,6 +286,43 @@ external version_capabilities: handle -> string =
 type featureset_index = Featureset_raw | Featureset_host | Featureset_pv | Featureset_hvm
 external get_cpu_featureset : handle -> featureset_index -> int64 array = "stub_xc_get_cpu_featureset"
 
+(* order must match the order in Val_cpuid_leaf *)
+type xen_cpuid_leaf = {
+  leaf: int64;
+  subleaf: int64;
+  a: int64;
+  b: int64;
+  c: int64;
+  d: int64;
+}
+
+(* order must match the order in Val_msr_entry *)
+type xen_msr_entry = {
+  idx: int64;
+  flags: int64;
+  value: int64; (* val is a keyword, using 'value' *)
+}
+
+type xen_cpu_policy = {
+  leaves: xen_cpuid_leaf array;
+  msrs: xen_msr_entry array;
+}
+
+(* must match XEN_SYSCTL_cpu_policy* order in xen/include/public/sysctl.h *)
+type xen_cpu_policy_index = Cpu_policy_raw | Cpu_policy_host | Cpu_policy_pv_max | Cpu_policy_hvm_max | Cpu_policy_pv_default | Cpu_policy_hvm_default
+
+let string_of_xen_cpu_policy_index = function
+  | Cpu_policy_raw -> "Raw"
+  | Cpu_policy_host -> "Host"
+  | Cpu_policy_pv_max -> "PV Max"
+  | Cpu_policy_hvm_max -> "HVM Max"
+  | Cpu_policy_pv_default -> "PV default"
+  | Cpu_policy_hvm_default -> "HVM default"
+
+external get_system_cpu_policy: handle -> xen_cpu_policy_index -> xen_cpu_policy = "stub_xc_get_system_cpu_policy"
+
+external cpu_policy_to_featureset: handle -> xen_cpu_policy -> int64 array = "stub_xc_policy_to_featureset"
+
 external watchdog : handle -> int -> int32 -> int
   = "stub_xc_watchdog"
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6e94940a8a..605adeeec9 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -223,6 +223,77 @@ external version_capabilities : handle -> string
 type featureset_index = Featureset_raw | Featureset_host | Featureset_pv | Featureset_hvm
 external get_cpu_featureset : handle -> featureset_index -> int64 array = "stub_xc_get_cpu_featureset"
 
+(** CPUID takes a leaf (EAX) and optional subleaf (ECX) as input and
+    returns feature information bitset in 4 registers (EAX, EBX, ECX, EDX).
+    This record captures one such invocation of CPUID.
+
+    CPU manuals contain tables explaining the available leaves/subleaves and feature bits:
+
+        https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
+          Intel® 64 and IA-32 architectures software developer's  manual volume 2A: Instruction set reference
+          Chapter 3.2, Table 3-8
+
+        https://developer.amd.com/resources/developer-guides-manuals/
+          AMD64 Architecture Programmer’s Manual Volume 3: General Purpose and System Instructions
+          Appendix D Instruction Subsets and CPUID Feature Flags
+ *)
+type xen_cpuid_leaf = {
+  leaf: int64; (** initial EAX value *)
+  subleaf: int64; (** initial ECX value *)
+  a: int64; (** EAX result *)
+  b: int64; (** EBX result *)
+  c: int64; (** ECX result *)
+  d: int64; (** EDX result *)
+}
+
+(** CPU Model Specific Registers control various aspects of CPU behaviour.
+
+    RDMSR takes ECX as input and returns its result in EDX:EAX.
+    This record captures one invocation of RDMSR.
+
+    CPU manuals document the available MSRs and feature bits
+
+       https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
+         Intel® 64 and IA-32 architectures software developer's manual volume 4: Model-specific registers
+         Chapter 2, "Model-Specific Registers (MSRs)"
+
+       https://developer.amd.com/resources/developer-guides-manuals/
+         AMD64 Architecture Programmer’s Manual Volume 2: System Programming
+         Appendix A "MSR Cross-Reference"
+ *)
+type xen_msr_entry = {
+  idx: int64; (** MSR register - ECX input *)
+  flags: int64; (** reserved, must be zero *)
+  value: int64; (** EDX:EAX output *)
+}
+
+(** Xen CPU policy contains the CPUID features and MSRs visible in a domain.
+    The order of leaves and MSRs is not important, but entries cannot be duplicated.
+ *)
+type xen_cpu_policy = {
+  leaves: xen_cpuid_leaf array; (** Array of CPUID leaves/ *)
+  msrs: xen_msr_entry array; (** Array of MSRs *)
+}
+
+(** Xen CPU policy to query or set *)
+type xen_cpu_policy_index =
+  | Cpu_policy_raw (** as seen on boot *)
+  | Cpu_policy_host (** features implemented by the host *)
+  | Cpu_policy_pv_max (** maximum PV features that we can accept in a migration: either implemented natively or emulated *)
+  | Cpu_policy_hvm_max (** maximum HVM features that we can accept in a migration: either implemented natively or emulated *)
+  | Cpu_policy_pv_default (** default PV features for newly booted VMs *)
+  | Cpu_policy_hvm_default (** default HVM features for newly booted VMs *)
+
+(** [string_of_xen_cpu_policy_index policy_index] is the name of the [policy_index] policy *)
+val string_of_xen_cpu_policy_index : xen_cpu_policy_index -> string
+
+(** [get_system_cpu_policy xenctrlhandle policy_index] retrieves the [policy_index] policy from the running hypervisor *)
+external get_system_cpu_policy: handle -> xen_cpu_policy_index -> xen_cpu_policy = "stub_xc_get_system_cpu_policy"
+
+(** [cpu_policy_to_featureset xenctrlhandle policy] converts [policy] to a featureset for backwards compatibility
+    (e.g. accepting incoming migrations in xenopsd from a non-policy-aware xenopsd) *)
+external cpu_policy_to_featureset: handle -> xen_cpu_policy -> int64 array = "stub_xc_policy_to_featureset"
+
 external pages_to_kib : int64 -> int64 = "stub_pages_to_kib"
 val pages_to_mib : int64 -> int64
 external watchdog : handle -> int -> int32 -> int
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index d05d7bb30e..4a230de8b7 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -34,6 +34,9 @@
 #include <xenctrl.h>
 #include <xen-tools/libs.h>
 
+#include <xen/lib/x86/cpuid.h>
+#include <xen/lib/x86/msr.h>
+
 #include "mmap_stubs.h"
 
 #define PAGE_SHIFT		12
@@ -1216,6 +1219,198 @@ CAMLprim value stub_xc_watchdog(value xch, value domid, value timeout)
 	CAMLreturn(Val_int(ret));
 }
 
+static CAMLprim value Val_cpuid_leaf(const xen_cpuid_leaf_t *leaf)
+{
+    CAMLparam0();
+    CAMLlocal1(result);
+    result = caml_alloc_tuple(6);
+    Store_field(result, 0, caml_copy_int64(leaf->leaf));
+    Store_field(result, 1, caml_copy_int64(leaf->subleaf));
+    Store_field(result, 2, caml_copy_int64(leaf->a));
+    Store_field(result, 3, caml_copy_int64(leaf->b));
+    Store_field(result, 4, caml_copy_int64(leaf->c));
+    Store_field(result, 5, caml_copy_int64(leaf->d));
+
+    CAMLreturn(result);
+}
+
+static CAMLprim void cpuid_leaf_of_val(xen_cpuid_leaf_t *leaf, value v)
+{
+    CAMLparam1(v);
+    leaf->leaf = Int64_val(Field(v, 0));
+    leaf->subleaf = Int64_val(Field(v, 1));
+    leaf->a = Int64_val(Field(v, 2));
+    leaf->b = Int64_val(Field(v, 3));
+    leaf->c = Int64_val(Field(v, 4));
+    leaf->d = Int64_val(Field(v, 5));
+
+    CAMLreturn0;
+}
+
+static CAMLprim value Val_msr_entry(const xen_msr_entry_t *msr)
+{
+    CAMLparam0();
+    CAMLlocal1(result);
+    result = caml_alloc_tuple(3);
+    Store_field(result, 0, caml_copy_int64(msr->idx));
+    Store_field(result, 1, caml_copy_int64(msr->flags));
+    Store_field(result, 2, caml_copy_int64(msr->val));
+    CAMLreturn(result);
+}
+
+#if 0
+static CAMLprim void msr_entry_of_val(xen_msr_entry_t *msr, value v)
+{
+    CAMLparam1(v);
+    msr->idx = Int64_val(Field(v, 0));
+    msr->flags = Int64_val(Field(v, 1));
+    msr->val = Int64_val(Field(v, 2));
+    CAMLreturn0;
+}
+#endif
+
+static CAMLprim value Val_leaves(const xen_cpuid_leaf_t *leaves, uint32_t nr_leaves)
+{
+    CAMLparam0();
+    CAMLlocal1(result);
+    uint32_t i;
+
+    result = caml_alloc(nr_leaves, 0);
+    for (i=0;i<nr_leaves;i++)
+        Store_field(result, i, Val_cpuid_leaf(&leaves[i]));
+
+    CAMLreturn(result);
+}
+
+static CAMLprim value Val_msrs(const xen_msr_entry_t *msrs, uint32_t nr_msrs)
+{
+    CAMLparam0();
+    CAMLlocal1(result);
+
+    result = caml_alloc(nr_msrs, 0);
+    for (unsigned i=0;i<nr_msrs;i++)
+        Store_field(result, i, Val_msr_entry(&msrs[i]));
+    CAMLreturn(result);
+}
+
+static CAMLprim value Val_policy(const xen_cpuid_leaf_t *leaves, uint32_t nr_leaves, const xen_msr_entry_t *msrs, uint32_t nr_msrs)
+{
+    CAMLparam0();
+    CAMLlocal1(result);
+
+    result = caml_alloc_tuple(2);
+    Store_field(result, 0, Val_leaves(leaves, nr_leaves));
+    Store_field(result, 1, Val_msrs(msrs, nr_msrs));
+    CAMLreturn(result);
+}
+
+static void cpuid_policy_of_val(struct cpuid_policy *p, value policy)
+{
+    CAMLparam1(policy);
+    CAMLlocal1(cpu_policy);
+    uint32_t i;
+
+    cpu_policy = Field(policy, 0);
+
+    uint32_t nr_leaves = caml_array_length(cpu_policy);
+    xen_cpuid_leaf_t leaves[nr_leaves];
+    for (i=0;i<nr_leaves;i++)
+        cpuid_leaf_of_val(&leaves[i], Field(cpu_policy, i));
+
+
+    uint32_t err_leaf=0, err_subleaf=0;
+    int rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves, &err_leaf, &err_subleaf);
+    if (rc)
+        caml_failwith("Failed to deserialize CPU policy"); /* TODO: err_leaf/err_subleaf */
+
+    CAMLreturn0;
+}
+
+#if 0
+static void msr_policy_of_val(struct msr_policy *p, value policy)
+{
+    CAMLparam1(policy);
+    CAMLlocal1(msr_policy);
+    uint32_t i;
+
+    msr_policy = Field(policy, 1);
+
+    uint32_t nr_msrs = caml_array_length(msr_policy);
+    xen_msr_entry_t msrs[nr_msrs];
+    for (i=0;i<nr_msrs;i++)
+        msr_entry_of_val(&msrs[i], Field(msr_policy, i));
+
+    uint32_t err_msr = 0;
+    int rc = x86_msr_copy_from_buffer(p, msrs, nr_msrs, &err_msr);
+    if (rc)
+        caml_failwith("Failed to deserialize CPU policy"); /* TODO: err_msr */
+
+    CAMLreturn0;
+}
+#endif
+
+CAMLprim value stub_xc_get_system_cpu_policy(value xch, value policy_kind)
+{
+    CAMLparam2(xch, policy_kind);
+    CAMLlocal1(result);
+
+    uint32_t max_leaves = 0, max_msrs = 0;
+
+    if (xc_cpu_policy_get_size(_H(xch), &max_leaves, &max_msrs))
+            failwith_xc(_H(xch));
+
+    xen_cpuid_leaf_t leaves[max_leaves];
+    xen_msr_entry_t msrs[max_msrs];
+    memset(leaves, 0, sizeof(leaves));
+    memset(msrs, 0, sizeof(msrs));
+
+    /* It'd be simpler if we could avoid this allocation here,
+       but the type is private */
+    xc_cpu_policy_t *policy = xc_cpu_policy_init();
+    if (!policy)
+        caml_raise_out_of_memory();
+
+    int rc;
+    rc = xc_cpu_policy_get_system(_H(xch), Int_val(policy_kind), policy) ||
+         xc_cpu_policy_serialise(_H(xch), policy, leaves, &max_leaves, msrs, &max_msrs);
+    xc_cpu_policy_destroy(policy);
+    if (rc)
+        failwith_xc(_H(xch));
+
+    result = Val_policy(leaves, max_leaves, msrs, max_msrs);
+    CAMLreturn(result);
+}
+
+CAMLprim value stub_xc_policy_to_featureset(value xch, value policy)
+{
+    CAMLparam2(xch, policy);
+    CAMLlocal1(result);
+    struct cpuid_policy p;
+
+    memset(&p, 0, sizeof(p));
+    cpuid_policy_of_val(&p, policy);
+
+    uint32_t fs_len;
+    int rc = xc_get_cpu_featureset(_H(xch), 0, &fs_len, NULL);
+    if (rc)
+        failwith_xc(_H(xch));
+    /* xenctrl stub is statically linked, xenctrl is dynamically loaded,
+     * the 2 featureset lengths could be different, but fs_len should be the greater one.
+     * */
+    if (fs_len < FEATURESET_NR_ENTRIES)
+        caml_invalid_argument("cpuid_policy_to_featureset");
+
+    uint32_t featureset[fs_len];
+    memset(featureset, 0, sizeof(featureset));
+    cpuid_policy_to_featureset(&p, featureset);
+
+    result = caml_alloc(fs_len, 0);
+    for(unsigned i=0; i<fs_len; i++)
+        Store_field(result, i, caml_copy_int64(featureset[i]));
+
+    CAMLreturn(result);
+}
+
 /*
  * Local variables:
  *  indent-tabs-mode: t
-- 
2.27.0


