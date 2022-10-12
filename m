Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E05FCA9E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 20:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421344.666599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQr-0002IC-PO; Wed, 12 Oct 2022 18:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421344.666599; Wed, 12 Oct 2022 18:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQr-0002G8-Ma; Wed, 12 Oct 2022 18:26:17 +0000
Received: by outflank-mailman (input) for mailman id 421344;
 Wed, 12 Oct 2022 18:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nFe=2N=citrix.com=prvs=277557e37=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oigQq-00020d-1p
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 18:26:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 594525bf-4a5b-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 20:26:13 +0200 (CEST)
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
X-Inumbo-ID: 594525bf-4a5b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665599172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3Qjvk2FsC2aL9utAcIX9UxVQ2DyGvaU7wX3c+UI0SBU=;
  b=XYLwjkQs/OajDfuOCWv/gcHi25mHm9nu0fgmZ/izhk9cSrCRBo9b/Edd
   I10MeGnVSnk+25OXayEYA+1VLtlqmWNmLiMt/DmW5nAyDGcWUZp51l+0j
   str9ZTz2j4bVKI2ki5+IAUvY3+2Y+CCXZ+zTqvJuv47xOLRDK6UlV5gzx
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82599032
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AILbUX61R0z4PK7LKzvbDix16xbzCYnBdZch4h?=
 =?us-ascii?q?dh9DyJ0z/GscokSnZKBI4ySk/ScjpLhhS12IhzijssjrW0y4farjUk4fX+vy?=
 =?us-ascii?q?cz0/4boJhEnr1zCI2gG7gzYZWLLPCORpyD9k8JlqGXvc9aH1vMoz8hiHpjUs?=
 =?us-ascii?q?15WsCX/TMy6HEBfafa+1+CbQpGhXXZnCPipiUYQtFP9HyrjnezApG3JgOzM6?=
 =?us-ascii?q?rm1rSFyQBbgMd90gmYkf6nft1TSJOM/+uYLf8P/MzntOFiBOdpJkV9GAk8cU?=
 =?us-ascii?q?1Rg160lknFhwiLghV38brwctft7jkhbmLGOrKfeFE95aSUdZcp+P4yXjfEJB?=
 =?us-ascii?q?NbqZjD3Wr38ehHUndMDq10ZX7QDVsw0W7NFewUZETuD/It64HTeBhWgE3Fsu?=
 =?us-ascii?q?l9FcLnOBpyQOcaxWR+q2sMoWLKXROolj2Flj2vQoAZbFEnq+QasiP+Vpk73C?=
 =?us-ascii?q?Pm9O/n+laQbJALyYcFUTaaeX+k7GDMYhaYw3qbFVBodN5uSW79UYzAbhnUq+?=
 =?us-ascii?q?p2oiEITIdn7mhu6plCe11P1v1cDocToKk45YhaOUiOR5dEqDiKfG/Oiaptdx?=
 =?us-ascii?q?m7eJ9fIxbWy16+VD9mzG+w5dPprfZ09PgGO8gXBIuFeeKiRfXjGOl2jOgxI9?=
 =?us-ascii?q?2vly59xtw2udID++NhHSee8+/eiPX7+wTAzaEWqN+BPEvm+v6zihRUS918Bm?=
 =?us-ascii?q?mKd/P1cOz1UIqEaumlx6zOWtd5jijCJpQqtFFMUdLYmk0vzhrx9E2623oeMy?=
 =?us-ascii?q?yBkFgZmttc+24WCo9AqXl/W9/rfU2K2Dh8ELNK1HivJ0XpWJ7SVFjMctKSEt?=
 =?us-ascii?q?tWP9raeuv+IGukNlx14qjYXi/Bo9KrB9/hMOj9wqjkaBl0ppwF3HpPCs/9y2?=
 =?us-ascii?q?lJn/yHHRc53mmMjdXO0DWPx+asx8VB6gnGwnXRaHA+V5EpHnPm08IZ/tZC67?=
 =?us-ascii?q?+iMzI2VXyqNqMYYAkXjo7uH2ZmNhoi0Yjvxz/AxljNZFjdr2qamPCTcp3PSq?=
 =?us-ascii?q?vfQGIJwRb1oVxK4zhurOLXiaLgcUsbodEoaSuZdmvKqlKOi1WUKYYNLOxy11?=
 =?us-ascii?q?H9MVqi8vE4cZJyZWtGKzgvrO6ykHK0yA1t8Wl1Tv3yMmjbTc1KUHky1wk7VR?=
 =?us-ascii?q?xq/146kMuAI0oGdEKrMf0f/bR2o0CX8X1+4WPi6PCXHiUoMOVc0DdEW41zfy?=
 =?us-ascii?q?owfxaHLJ2OQbopLvmOFYSHOf5dqusKNIiyuVh7fJeKtDWTBeWfv+NrPH6ruH?=
 =?us-ascii?q?Z+K4mb0RY8Sko423OQeXFRe5FYs5F0ewboUsJVVXO0nTgwYbZVFcD8ZnLFMO?=
 =?us-ascii?q?K+7YSfnVu84tvvMByjOWp4GmpVYut/mTGrPLqjh14Z5nyAdhCbM9FoQcp157?=
 =?us-ascii?q?utDPTAxf0cg6jQi6h0Ywv8kdVkPML9/dYusTfACj3cydN7W+e9KZme0QuZsK?=
 =?us-ascii?q?zGh60KKR15Rs2c6joC9Ro43V4EGM2e5pQ2Vu18N7Xxjqm9LkAU9BBCC5xMcP?=
 =?us-ascii?q?hMhpkUSc2Wkdy2BU7jKZrYNIjV8cv03tXve7bfEWbx46peTTlJFfr3D12/RO?=
 =?us-ascii?q?iC0ZjqDCJa5iVDl/kvPpr3apyyjRdCsd9xGMzyvnoLdmWg7gbb4LdW5y+dVw?=
 =?us-ascii?q?76+Ho4o64gZ7ZrbcTbNGiglCPmYl9Iz15fdZ58zNu4GJxSSUJJk8SBS2pU6S?=
 =?us-ascii?q?OLmSMMaARtozxK0CavUr1PcAueWoi/wptvn++44rovLVfzg30Ic5+HpjNxGy?=
 =?us-ascii?q?tKRd1PstLy2ics/KpaPO0lG6yGkxEQvswpGHN8B4ZhHSECoMxGw81fNShjIr?=
 =?us-ascii?q?SqrFxoJ3s5iwcOnygAHdshl5dEKO7CIemHZqYuFq2/gnasTPAH3IuUSvyk60?=
 =?us-ascii?q?cefyIXfdkc9D1i4XgbtXWAxLLA1lVANYHaouEh+biJpTz10+HmkFvPNqPU3h?=
 =?us-ascii?q?aBa0ChXRqk6JNZlaNHKLXRPB3lvlCyvi0vJJJavc5jpAwsPNM26hLzbE+4Yz?=
 =?us-ascii?q?00wzGC2otlRVb4GLHWkUKV7W3fqSsweRePFPjEqrvwOKG1+PLOFuqnKYHRy2?=
 =?us-ascii?q?w8+i2A2YXIdyLNfxinfY2bZR9Tkb1T2pMGjQN0gwODSQhX3GaGOftAMWnd1a?=
 =?us-ascii?q?+/7xqD0QXWh2WJuCS8zIA03JYHUI7fNCwpi+KS5lJligaStqFWfYhWzFN1EV?=
 =?us-ascii?q?Jq0G6xYOuNuIRxrIdzqIcnGAZrKDEqvDoKjAEEwA/eW/YLIXhWH5/lHTTufH?=
 =?us-ascii?q?d42XXLwve3NWH4bcpAPuvFT0wUshlSiru6ibnHIpCMEf/mcKxW9nioECzbhT?=
 =?us-ascii?q?VqgTCalMAyNx2MyQ70dtEHxPZYbo6lvR6HgbbjjjfxN5/6E2AQlKfVvpLqbk?=
 =?us-ascii?q?YXU1bi0RRVU/YfQG+p09sKZ/Z/jL2BziuSJ8p6rXlCWqqG1c4NPGksX7KXSg?=
 =?us-ascii?q?iPva7BPUxOc1vRPdI/mrCy5JbYCtDdBamn7UhOMNUvnISJh7ETJjYCoSDRS5?=
 =?us-ascii?q?7PbP1Q5bL3mrSaPhA+zzMd97dscd1VsahvEEYhi3b6/9sWBVU7ffIZOqXImo?=
 =?us-ascii?q?eZ4b5k0xiNB43lZy9eZl2iGjADQmOClxyCt18RXg0CA4isZ64YSe//DQ+tnR?=
 =?us-ascii?q?r54yKIOxW7Xn5g4x6hqLy2/+9PMTzzgYIStRgI+Uil9mF9EAJZsNOPIEc+I5?=
 =?us-ascii?q?2vqYURvSbEqxYbZWf/8o0P0trj2R1urXkBtkIc/yWLtq/dIVfO73TYh24glQ?=
 =?us-ascii?q?0ARvfEDmoUPjVMJV8RUtnyg4f0++L22S++8eKr2d9lpuYslMU6vswpOsfNYt?=
 =?us-ascii?q?766dVVHzMoI59s7G+J/iE8PnFcFqWKg+0+I1bUCHfSYww=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82599032"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH 2/2] tools/ocaml/xc: Address ABI issues with physinfo arch flags
Date: Wed, 12 Oct 2022 19:25:52 +0100
Message-ID: <20221012182552.26866-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221012182552.26866-1-andrew.cooper3@citrix.com>
References: <20221012182552.26866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The current bindings function, but the preexisting

  type physinfo_arch_cap_flag =
         | X86 of x86_physinfo_arch_cap_flag

is a special case in the Ocaml type system with an unusual indirection, and
will break when a second option, e.g. `| ARM of ...` is added.

Also, the position the list is logically wrong.  Currently, the types express
a list of elements which might be an x86 flag or an arm flag (and can
intermix), whereas what we actually want is either a list of x86 flags, or a
list of ARM flags (that cannot intermix).

Rework the Ocaml types to avoid the ABI special case and move the list
primitive, and adjust the C bindings to match.

Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 10 ++++++----
 tools/ocaml/libs/xc/xenctrl.mli     | 11 +++++++----
 tools/ocaml/libs/xc/xenctrl_stubs.c | 22 ++++++++++++----------
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 0c71e5eef3c7..28ed6422317c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -130,13 +130,15 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+type arm_physinfo_cap_flag
 
-type x86_physinfo_arch_cap_flag =
+type x86_physinfo_cap_flag =
 	| CAP_X86_ASSISTED_XAPIC
 	| CAP_X86_ASSISTED_X2APIC
 
-type physinfo_arch_cap_flag =
-	| X86 of x86_physinfo_arch_cap_flag
+type arch_physinfo_cap_flags =
+	| ARM of arm_physinfo_cap_flag list
+	| X86 of x86_physinfo_cap_flag list
 
 type physinfo =
 {
@@ -151,7 +153,7 @@ type physinfo =
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
 	max_nr_cpus      : int;
-	arch_capabilities : physinfo_arch_cap_flag list;
+	arch_capabilities : arch_physinfo_cap_flags;
 }
 
 type version =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index a8458e19ca4b..c2076d60c970 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -115,12 +115,15 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
-type x86_physinfo_arch_cap_flag =
+type arm_physinfo_cap_flag
+
+type x86_physinfo_cap_flag =
   | CAP_X86_ASSISTED_XAPIC
   | CAP_X86_ASSISTED_X2APIC
 
-type physinfo_arch_cap_flag =
-  | X86 of x86_physinfo_arch_cap_flag
+type arch_physinfo_cap_flags =
+  | ARM of arm_physinfo_cap_flag list
+  | X86 of x86_physinfo_cap_flag list
 
 type physinfo = {
   threads_per_core : int;
@@ -133,7 +136,7 @@ type physinfo = {
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
-  arch_capabilities : physinfo_arch_cap_flag list;
+  arch_capabilities : arch_physinfo_cap_flags;
 }
 type version = { major : int; minor : int; extra : string; }
 type compile_info = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index fe9c00ce008a..03f4cbf93cd3 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -716,9 +716,10 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 CAMLprim value stub_xc_physinfo(value xch)
 {
 	CAMLparam1(xch);
-	CAMLlocal4(physinfo, cap_list, x86_arch_cap_list, arch_cap_list);
+	CAMLlocal2(physinfo, cap_list);
+	CAMLlocal2(arch_cap_flags, arch_cap_list);
 	xc_physinfo_t c_physinfo;
-	int r;
+	int r, arch_cap_flags_tag;
 
 	caml_enter_blocking_section();
 	r = xc_physinfo(_H(xch), &c_physinfo);
@@ -748,18 +749,19 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
 #if defined(__i386__) || defined(__x86_64__)
-	x86_arch_cap_list = c_bitmap_to_ocaml_list
-		/* ! x86_physinfo_arch_cap_flag CAP_X86_ none */
+	arch_cap_list = c_bitmap_to_ocaml_list
+		/* ! x86_physinfo_cap_flag CAP_X86_ none */
 		/* ! XEN_SYSCTL_PHYSCAP_X86_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
 		(c_physinfo.arch_capabilities);
-	/*
-	 * arch_capabilities: physinfo_arch_cap_flag list;
-	 */
-	arch_cap_list = x86_arch_cap_list;
+
+	arch_cap_flags_tag = 1; /* tag x86 */
 #else
-	arch_cap_list = Val_emptylist;
+	caml_failwith("Unhandled architecture");
 #endif
-	Store_field(physinfo, 10, arch_cap_list);
+
+	arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
+	Store_field(arch_cap_flags, 0, arch_cap_list);
+	Store_field(physinfo, 10, arch_cap_flags);
 
 	CAMLreturn(physinfo);
 }
-- 
2.11.0


