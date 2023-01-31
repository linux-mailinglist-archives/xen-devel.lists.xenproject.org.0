Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8556838AA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487848.755605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC7-0001PM-Qi; Tue, 31 Jan 2023 21:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487848.755605; Tue, 31 Jan 2023 21:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC7-0001NA-J3; Tue, 31 Jan 2023 21:29:35 +0000
Received: by outflank-mailman (input) for mailman id 487848;
 Tue, 31 Jan 2023 21:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC4-0000Nm-Ku
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5645ffb5-a1ae-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 22:29:27 +0100 (CET)
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
X-Inumbo-ID: 5645ffb5-a1ae-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tJ4tTGgnhHKyde+wF8qU4LPiC92eyP3hCl2+Pked3dE=;
  b=h0RIaL/CLB2RtKjhN19reXDuj+bnJZI4CkqtOSzxdvot/NfOX9gbYNeq
   LHjrL/ZM75xHvyaBL7giR6WQk9kQC8YRhZ2bELP3EHGJVE6KsZ7dzjKEM
   OhR+Rffut5fpnwEilSmol6HdB32rbB36TXdH0E+Z7d3jG1brKmKKcd9a1
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95097287
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rLtUSq9AKfsAhmGvWTVPDrUDgX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jAZXG3TbP2MNzajedp3Ydvn8UNS6JKEmoRgTQFsqyo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKsS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklz2
 acxGmAiciucrMvn3rPiE+RQlpkaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Ewx7J+
 TiWoAwVBDlBKYyHxBG3wEmK3MPdlATpWqkIBIWRo6sCbFq7mTVIVUx+uUGAifWwlEOWQd9UL
 E0QvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnQxYiB6SFTXKO9dF7G34XEgi+JJgM8fHEDPHYJcRtY2oy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGeE6bKMN8N7n9hIx5JEVd443d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa/SI20DqiMM4AUPfCdkTNrGwk3NSatM53FyhBwwcnTx
 7/EGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dglWcyNkWMys+6S6tIere2JbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:Mzq3j6hycse6p0DbZoBFeMqRMnBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95097287"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob
 Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 7/7] tools/ocaml/xc: Don't reference Custom objects with the GC lock released
Date: Tue, 31 Jan 2023 21:29:13 +0000
Message-ID: <20230131212913.6199-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

The modification to the _H() macro for Ocaml 5 support introduced a subtle
bug.  From the manual:

  https://ocaml.org/manual/intfc.html#ss:parallel-execution-long-running-c-code

"After caml_release_runtime_system() was called and until
caml_acquire_runtime_system() is called, the C code must not access any OCaml
data, nor call any function of the run-time system, nor call back into OCaml
code."

Previously, the value was a naked C pointer, so dereferencing it wasn't
"accessing any Ocaml data", but the fix to avoid naked C pointers added a
layer of indirection through an Ocaml Custom object, meaning that the common
pattern of using _H() in a blocking section is unsafe.

In order to fix:

 * Drop the _H() macro and replace it with a static inline xch_of_val().
 * Opencode the assignment into Data_custom_val() in the constructors.
 * Rename "value xch" parameters to "value xch_val" so we can consistently
   have "xc_interface *xch" on the stack, and obtain the pointer with the GC
   lock still held.
 * Drop the _D() macro while at it, because it's just pointless indirection.

Fixes: 8b3c06a3e545 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 454 ++++++++++++++++++++----------------
 1 file changed, 251 insertions(+), 203 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index e5277f6f19a2..f9006c662382 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -37,9 +37,6 @@
 
 #include "mmap_stubs.h"
 
-#define _H(__h) (*((xc_interface **)Data_custom_val(__h)))
-#define _D(__d) ((uint32_t)Int_val(__d))
-
 #ifndef Val_none
 #define Val_none (Val_int(0))
 #endif
@@ -48,9 +45,18 @@
 #define Tag_some 0
 #endif
 
+static inline xc_interface *xch_of_val(value v)
+{
+	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
+
+	return xch;
+}
+
 static void stub_xenctrl_finalize(value v)
 {
-	xc_interface_close(_H(v));
+	xc_interface *xch = xch_of_val(v);
+
+	xc_interface_close(xch);
 }
 
 static struct custom_operations xenctrl_ops = {
@@ -100,7 +106,7 @@ CAMLprim value stub_xc_interface_open(value unit)
 		failwith_xc(xch);
 
 	result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
-	_H(result) = xch;
+	*(xc_interface **)Data_custom_val(result) = xch;
 
 	CAMLreturn(result);
 }
@@ -187,10 +193,11 @@ static unsigned int ocaml_list_to_c_bitmap(value l)
 	return val;
 }
 
-CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config)
+CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value config)
 {
-	CAMLparam3(xch, wanted_domid, config);
+	CAMLparam3(xch_val, wanted_domid, config);
 	CAMLlocal2(l, arch_domconfig);
+	xc_interface *xch = xch_of_val(xch_val);
 
 	/* Mnemonics for the named fields inside domctl_create_config */
 #define VAL_SSIDREF             Field(config, 0)
@@ -282,98 +289,104 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #undef VAL_SSIDREF
 
 	caml_enter_blocking_section();
-	result = xc_domain_create(_H(xch), &domid, &cfg);
+	result = xc_domain_create(xch, &domid, &cfg);
 	caml_leave_blocking_section();
 
 	if (result < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_int(domid));
 }
 
-CAMLprim value stub_xc_domain_max_vcpus(value xch, value domid,
+CAMLprim value stub_xc_domain_max_vcpus(value xch_val, value domid,
                                         value max_vcpus)
 {
-	CAMLparam3(xch, domid, max_vcpus);
+	CAMLparam3(xch_val, domid, max_vcpus);
+	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
-	r = xc_domain_max_vcpus(_H(xch), _D(domid), Int_val(max_vcpus));
+	r = xc_domain_max_vcpus(xch, Int_val(domid), Int_val(max_vcpus));
 	if (r)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
 
-value stub_xc_domain_sethandle(value xch, value domid, value handle)
+value stub_xc_domain_sethandle(value xch_val, value domid, value handle)
 {
-	CAMLparam3(xch, domid, handle);
+	CAMLparam3(xch_val, domid, handle);
+	xc_interface *xch = xch_of_val(xch_val);
 	xen_domain_handle_t h;
 	int i;
 
 	domain_handle_of_uuid_string(h, String_val(handle));
 
-	i = xc_domain_sethandle(_H(xch), _D(domid), h);
+	i = xc_domain_sethandle(xch, Int_val(domid), h);
 	if (i)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-static value dom_op(value xch, value domid, int (*fn)(xc_interface *, uint32_t))
+static value dom_op(value xch_val, value domid,
+		    int (*fn)(xc_interface *, uint32_t))
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
+	xc_interface *xch = xch_of_val(xch_val);
 	int result;
 
-	uint32_t c_domid = _D(domid);
+	uint32_t c_domid = Int_val(domid);
 
 	caml_enter_blocking_section();
-	result = fn(_H(xch), c_domid);
+	result = fn(xch, c_domid);
 	caml_leave_blocking_section();
         if (result)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_pause(value xch, value domid)
+CAMLprim value stub_xc_domain_pause(value xch_val, value domid)
 {
-	return dom_op(xch, domid, xc_domain_pause);
+	return dom_op(xch_val, domid, xc_domain_pause);
 }
 
 
-CAMLprim value stub_xc_domain_unpause(value xch, value domid)
+CAMLprim value stub_xc_domain_unpause(value xch_val, value domid)
 {
-	return dom_op(xch, domid, xc_domain_unpause);
+	return dom_op(xch_val, domid, xc_domain_unpause);
 }
 
-CAMLprim value stub_xc_domain_destroy(value xch, value domid)
+CAMLprim value stub_xc_domain_destroy(value xch_val, value domid)
 {
-	return dom_op(xch, domid, xc_domain_destroy);
+	return dom_op(xch_val, domid, xc_domain_destroy);
 }
 
-CAMLprim value stub_xc_domain_resume_fast(value xch, value domid)
+CAMLprim value stub_xc_domain_resume_fast(value xch_val, value domid)
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
+	xc_interface *xch = xch_of_val(xch_val);
 	int result;
 
-	uint32_t c_domid = _D(domid);
+	uint32_t c_domid = Int_val(domid);
 
 	caml_enter_blocking_section();
-	result = xc_domain_resume(_H(xch), c_domid, 1);
+	result = xc_domain_resume(xch, c_domid, 1);
 	caml_leave_blocking_section();
         if (result)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_shutdown(value xch, value domid, value reason)
+CAMLprim value stub_xc_domain_shutdown(value xch_val, value domid, value reason)
 {
-	CAMLparam3(xch, domid, reason);
+	CAMLparam3(xch_val, domid, reason);
+	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 
-	ret = xc_domain_shutdown(_H(xch), _D(domid), Int_val(reason));
+	ret = xc_domain_shutdown(xch, Int_val(domid), Int_val(reason));
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
@@ -433,10 +446,11 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_xc_domain_getinfolist(value xch, value first_domain, value nb)
+CAMLprim value stub_xc_domain_getinfolist(value xch_val, value first_domain, value nb)
 {
-	CAMLparam3(xch, first_domain, nb);
+	CAMLparam3(xch_val, first_domain, nb);
 	CAMLlocal2(result, temp);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_domaininfo_t * info;
 	int i, ret, toalloc, retval;
 	unsigned int c_max_domains;
@@ -450,16 +464,16 @@ CAMLprim value stub_xc_domain_getinfolist(value xch, value first_domain, value n
 
 	result = temp = Val_emptylist;
 
-	c_first_domain = _D(first_domain);
+	c_first_domain = Int_val(first_domain);
 	c_max_domains = Int_val(nb);
 	caml_enter_blocking_section();
-	retval = xc_domain_getinfolist(_H(xch), c_first_domain,
+	retval = xc_domain_getinfolist(xch, c_first_domain,
 				       c_max_domains, info);
 	caml_leave_blocking_section();
 
 	if (retval < 0) {
 		free(info);
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	}
 	for (i = 0; i < retval; i++) {
 		result = caml_alloc_small(2, Tag_cons);
@@ -474,38 +488,39 @@ CAMLprim value stub_xc_domain_getinfolist(value xch, value first_domain, value n
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_xc_domain_getinfo(value xch, value domid)
+CAMLprim value stub_xc_domain_getinfo(value xch_val, value domid)
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
 	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_domaininfo_t info;
 	int ret;
 
-	ret = xc_domain_getinfolist(_H(xch), _D(domid), 1, &info);
+	ret = xc_domain_getinfolist(xch, Int_val(domid), 1, &info);
 	if (ret != 1)
-		failwith_xc(_H(xch));
-	if (info.domain != _D(domid))
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
+	if (info.domain != Int_val(domid))
+		failwith_xc(xch);
 
 	result = alloc_domaininfo(&info);
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_xc_vcpu_getinfo(value xch, value domid, value vcpu)
+CAMLprim value stub_xc_vcpu_getinfo(value xch_val, value domid, value vcpu)
 {
-	CAMLparam3(xch, domid, vcpu);
+	CAMLparam3(xch_val, domid, vcpu);
 	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_vcpuinfo_t info;
 	int retval;
 
-	uint32_t c_domid = _D(domid);
+	uint32_t c_domid = Int_val(domid);
 	uint32_t c_vcpu = Int_val(vcpu);
 	caml_enter_blocking_section();
-	retval = xc_vcpu_getinfo(_H(xch), c_domid,
-	                         c_vcpu, &info);
+	retval = xc_vcpu_getinfo(xch, c_domid, c_vcpu, &info);
 	caml_leave_blocking_section();
 	if (retval < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	result = caml_alloc_tuple(5);
 	Store_field(result, 0, Val_bool(info.online));
@@ -517,17 +532,18 @@ CAMLprim value stub_xc_vcpu_getinfo(value xch, value domid, value vcpu)
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_xc_vcpu_context_get(value xch, value domid,
+CAMLprim value stub_xc_vcpu_context_get(value xch_val, value domid,
                                         value cpu)
 {
-	CAMLparam3(xch, domid, cpu);
+	CAMLparam3(xch_val, domid, cpu);
+	xc_interface *xch = xch_of_val(xch_val);
 	CAMLlocal1(context);
 	int ret;
 	vcpu_guest_context_any_t ctxt;
 
-	ret = xc_vcpu_getcontext(_H(xch), _D(domid), Int_val(cpu), &ctxt);
+	ret = xc_vcpu_getcontext(xch, Int_val(domid), Int_val(cpu), &ctxt);
 	if ( ret < 0 )
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	context = caml_alloc_string(sizeof(ctxt));
 	memcpy((char *) String_val(context), &ctxt.c, sizeof(ctxt.c));
@@ -535,10 +551,10 @@ CAMLprim value stub_xc_vcpu_context_get(value xch, value domid,
 	CAMLreturn(context);
 }
 
-static int get_cpumap_len(value xch, value cpumap)
+static int get_cpumap_len(xc_interface *xch, value cpumap)
 {
 	int ml_len = Wosize_val(cpumap);
-	int xc_len = xc_get_max_cpus(_H(xch));
+	int xc_len = xc_get_max_cpus(xch);
 
 	if (ml_len < xc_len)
 		return ml_len;
@@ -546,56 +562,58 @@ static int get_cpumap_len(value xch, value cpumap)
 		return xc_len;
 }
 
-CAMLprim value stub_xc_vcpu_setaffinity(value xch, value domid,
+CAMLprim value stub_xc_vcpu_setaffinity(value xch_val, value domid,
                                         value vcpu, value cpumap)
 {
-	CAMLparam4(xch, domid, vcpu, cpumap);
+	CAMLparam4(xch_val, domid, vcpu, cpumap);
+	xc_interface *xch = xch_of_val(xch_val);
 	int i, len = get_cpumap_len(xch, cpumap);
 	xc_cpumap_t c_cpumap;
 	int retval;
 
-	c_cpumap = xc_cpumap_alloc(_H(xch));
+	c_cpumap = xc_cpumap_alloc(xch);
 	if (c_cpumap == NULL)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	for (i=0; i<len; i++) {
 		if (Bool_val(Field(cpumap, i)))
 			c_cpumap[i/8] |= 1 << (i&7);
 	}
-	retval = xc_vcpu_setaffinity(_H(xch), _D(domid),
+	retval = xc_vcpu_setaffinity(xch, Int_val(domid),
 				     Int_val(vcpu),
 				     c_cpumap, NULL,
 				     XEN_VCPUAFFINITY_HARD);
 	free(c_cpumap);
 
 	if (retval < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_vcpu_getaffinity(value xch, value domid,
+CAMLprim value stub_xc_vcpu_getaffinity(value xch_val, value domid,
                                         value vcpu)
 {
-	CAMLparam3(xch, domid, vcpu);
+	CAMLparam3(xch_val, domid, vcpu);
 	CAMLlocal1(ret);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_cpumap_t c_cpumap;
-	int i, len = xc_get_max_cpus(_H(xch));
+	int i, len = xc_get_max_cpus(xch);
 	int retval;
 
 	if (len < 1)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
-	c_cpumap = xc_cpumap_alloc(_H(xch));
+	c_cpumap = xc_cpumap_alloc(xch);
 	if (c_cpumap == NULL)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
-	retval = xc_vcpu_getaffinity(_H(xch), _D(domid),
+	retval = xc_vcpu_getaffinity(xch, Int_val(domid),
 				     Int_val(vcpu),
 				     c_cpumap, NULL,
 				     XEN_VCPUAFFINITY_HARD);
 	if (retval < 0) {
 		free(c_cpumap);
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	}
 
 	ret = caml_alloc(len, 0);
@@ -612,63 +630,68 @@ CAMLprim value stub_xc_vcpu_getaffinity(value xch, value domid,
 	CAMLreturn(ret);
 }
 
-CAMLprim value stub_xc_sched_id(value xch)
+CAMLprim value stub_xc_sched_id(value xch_val)
 {
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
+	xc_interface *xch = xch_of_val(xch_val);
 	int sched_id;
 
-	if (xc_sched_id(_H(xch), &sched_id))
-		failwith_xc(_H(xch));
+	if (xc_sched_id(xch, &sched_id))
+		failwith_xc(xch);
+
 	CAMLreturn(Val_int(sched_id));
 }
 
-CAMLprim value stub_xc_evtchn_alloc_unbound(value xch,
+CAMLprim value stub_xc_evtchn_alloc_unbound(value xch_val,
                                             value local_domid,
                                             value remote_domid)
 {
-	CAMLparam3(xch, local_domid, remote_domid);
+	CAMLparam3(xch_val, local_domid, remote_domid);
+	xc_interface *xch = xch_of_val(xch_val);
 	int result;
 
-	uint32_t c_local_domid = _D(local_domid);
-	uint32_t c_remote_domid = _D(remote_domid);
+	uint32_t c_local_domid = Int_val(local_domid);
+	uint32_t c_remote_domid = Int_val(remote_domid);
 
 	caml_enter_blocking_section();
-	result = xc_evtchn_alloc_unbound(_H(xch), c_local_domid,
+	result = xc_evtchn_alloc_unbound(xch, c_local_domid,
 	                                     c_remote_domid);
 	caml_leave_blocking_section();
 
 	if (result < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_int(result));
 }
 
-CAMLprim value stub_xc_evtchn_reset(value xch, value domid)
+CAMLprim value stub_xc_evtchn_reset(value xch_val, value domid)
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
+	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
-	r = xc_evtchn_reset(_H(xch), _D(domid));
+	r = xc_evtchn_reset(xch, Int_val(domid));
 	if (r < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_evtchn_status(value xch, value domid, value port)
+CAMLprim value stub_xc_evtchn_status(value xch_val, value domid, value port)
 {
-	CAMLparam3(xch, domid, port);
+	CAMLparam3(xch_val, domid, port);
 	CAMLlocal4(result, result_status, stat, interdomain);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_evtchn_status_t status = {
-		.dom = _D(domid),
+		.dom = Int_val(domid),
 		.port = Int_val(port),
 	};
 	int rc;
 
 	caml_enter_blocking_section();
-	rc = xc_evtchn_status(_H(xch), &status);
+	rc = xc_evtchn_status(xch, &status);
 	caml_leave_blocking_section();
 
 	if ( rc < 0 )
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	switch ( status.status )
 	{
@@ -716,7 +739,7 @@ CAMLprim value stub_xc_evtchn_status(value xch, value domid, value port)
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_xc_readconsolering(value xch)
+CAMLprim value stub_xc_readconsolering(value xch_val)
 {
 	/* Safe to use outside of blocking sections because of Ocaml GC lock. */
 	static unsigned int conring_size = 16384 + 1;
@@ -725,8 +748,9 @@ CAMLprim value stub_xc_readconsolering(value xch)
 	char *str = NULL, *ptr;
 	int ret;
 
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
 	CAMLlocal1(ring);
+	xc_interface *xch = xch_of_val(xch_val);
 
 	str = malloc(size);
 	if (!str)
@@ -734,12 +758,12 @@ CAMLprim value stub_xc_readconsolering(value xch)
 
 	/* Hopefully our conring_size guess is sufficient */
 	caml_enter_blocking_section();
-	ret = xc_readconsolering(_H(xch), str, &count, 0, 0, &index);
+	ret = xc_readconsolering(xch, str, &count, 0, 0, &index);
 	caml_leave_blocking_section();
 
 	if (ret < 0) {
 		free(str);
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	}
 
 	while (count == size && ret >= 0) {
@@ -755,7 +779,7 @@ CAMLprim value stub_xc_readconsolering(value xch)
 		count = size - count;
 
 		caml_enter_blocking_section();
-		ret = xc_readconsolering(_H(xch), str, &count, 0, 1, &index);
+		ret = xc_readconsolering(xch, str, &count, 0, 1, &index);
 		caml_leave_blocking_section();
 
 		count += str - ptr;
@@ -777,30 +801,32 @@ CAMLprim value stub_xc_readconsolering(value xch)
 	CAMLreturn(ring);
 }
 
-CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
+CAMLprim value stub_xc_send_debug_keys(value xch_val, value keys)
 {
-	CAMLparam2(xch, keys);
+	CAMLparam2(xch_val, keys);
+	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
-	r = xc_send_debug_keys(_H(xch), String_val(keys));
+	r = xc_send_debug_keys(xch, String_val(keys));
 	if (r)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_physinfo(value xch)
+CAMLprim value stub_xc_physinfo(value xch_val)
 {
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
 	CAMLlocal4(physinfo, cap_list, arch_cap_flags, arch_cap_list);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_physinfo_t c_physinfo;
 	int r, arch_cap_flags_tag;
 
 	caml_enter_blocking_section();
-	r = xc_physinfo(_H(xch), &c_physinfo);
+	r = xc_physinfo(xch, &c_physinfo);
 	caml_leave_blocking_section();
 
 	if (r)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	/*
 	 * capabilities: physinfo_cap_flag list;
@@ -837,10 +863,11 @@ CAMLprim value stub_xc_physinfo(value xch)
 	CAMLreturn(physinfo);
 }
 
-CAMLprim value stub_xc_pcpu_info(value xch, value nr_cpus)
+CAMLprim value stub_xc_pcpu_info(value xch_val, value nr_cpus)
 {
-	CAMLparam2(xch, nr_cpus);
+	CAMLparam2(xch_val, nr_cpus);
 	CAMLlocal2(pcpus, v);
+	xc_interface *xch = xch_of_val(xch_val);
 	xc_cpuinfo_t *info;
 	int r, size;
 
@@ -852,12 +879,12 @@ CAMLprim value stub_xc_pcpu_info(value xch, value nr_cpus)
 		caml_raise_out_of_memory();
 
 	caml_enter_blocking_section();
-	r = xc_getcpuinfo(_H(xch), Int_val(nr_cpus), info, &size);
+	r = xc_getcpuinfo(xch, Int_val(nr_cpus), info, &size);
 	caml_leave_blocking_section();
 
 	if (r) {
 		free(info);
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	}
 
 	if (size > 0) {
@@ -873,79 +900,82 @@ CAMLprim value stub_xc_pcpu_info(value xch, value nr_cpus)
 	CAMLreturn(pcpus);
 }
 
-CAMLprim value stub_xc_domain_setmaxmem(value xch, value domid,
+CAMLprim value stub_xc_domain_setmaxmem(value xch_val, value domid,
                                         value max_memkb)
 {
-	CAMLparam3(xch, domid, max_memkb);
+	CAMLparam3(xch_val, domid, max_memkb);
+	xc_interface *xch = xch_of_val(xch_val);
 	int retval;
 
-	uint32_t c_domid = _D(domid);
+	uint32_t c_domid = Int_val(domid);
 	unsigned int c_max_memkb = Int64_val(max_memkb);
 	caml_enter_blocking_section();
-	retval = xc_domain_setmaxmem(_H(xch), c_domid,
-	                                 c_max_memkb);
+	retval = xc_domain_setmaxmem(xch, c_domid, c_max_memkb);
 	caml_leave_blocking_section();
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_set_memmap_limit(value xch, value domid,
+CAMLprim value stub_xc_domain_set_memmap_limit(value xch_val, value domid,
                                                value map_limitkb)
 {
-	CAMLparam3(xch, domid, map_limitkb);
+	CAMLparam3(xch_val, domid, map_limitkb);
+	xc_interface *xch = xch_of_val(xch_val);
 	unsigned long v;
 	int retval;
 
 	v = Int64_val(map_limitkb);
-	retval = xc_domain_set_memmap_limit(_H(xch), _D(domid), v);
+	retval = xc_domain_set_memmap_limit(xch, Int_val(domid), v);
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_memory_increase_reservation(value xch,
+CAMLprim value stub_xc_domain_memory_increase_reservation(value xch_val,
                                                           value domid,
                                                           value mem_kb)
 {
-	CAMLparam3(xch, domid, mem_kb);
+	CAMLparam3(xch_val, domid, mem_kb);
+	xc_interface *xch = xch_of_val(xch_val);
 	int retval;
 
 	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (XC_PAGE_SHIFT - 10);
 
-	uint32_t c_domid = _D(domid);
+	uint32_t c_domid = Int_val(domid);
 	caml_enter_blocking_section();
-	retval = xc_domain_increase_reservation_exact(_H(xch), c_domid,
+	retval = xc_domain_increase_reservation_exact(xch, c_domid,
 							  nr_extents, 0, 0, NULL);
 	caml_leave_blocking_section();
 
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_version_version(value xch)
+CAMLprim value stub_xc_version_version(value xch_val)
 {
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
 	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
 	xen_extraversion_t extra;
 	long packed;
 	int retval;
 
 	caml_enter_blocking_section();
-	packed = xc_version(_H(xch), XENVER_version, NULL);
+	packed = xc_version(xch, XENVER_version, NULL);
 	caml_leave_blocking_section();
 
 	if (packed < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), XENVER_extraversion, &extra);
+	retval = xc_version(xch, XENVER_extraversion, &extra);
 	caml_leave_blocking_section();
 
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	result = caml_alloc_tuple(3);
 
@@ -957,19 +987,20 @@ CAMLprim value stub_xc_version_version(value xch)
 }
 
 
-CAMLprim value stub_xc_version_compile_info(value xch)
+CAMLprim value stub_xc_version_compile_info(value xch_val)
 {
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
 	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
 	xen_compile_info_t ci;
 	int retval;
 
 	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), XENVER_compile_info, &ci);
+	retval = xc_version(xch, XENVER_compile_info, &ci);
 	caml_leave_blocking_section();
 
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	result = caml_alloc_tuple(4);
 
@@ -982,35 +1013,36 @@ CAMLprim value stub_xc_version_compile_info(value xch)
 }
 
 
-static value xc_version_single_string(value xch, int code, void *info)
+static value xc_version_single_string(value xch_val, int code, void *info)
 {
-	CAMLparam1(xch);
+	CAMLparam1(xch_val);
+	xc_interface *xch = xch_of_val(xch_val);
 	int retval;
 
 	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), code, info);
+	retval = xc_version(xch, code, info);
 	caml_leave_blocking_section();
 
 	if (retval)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(caml_copy_string((char *)info));
 }
 
 
-CAMLprim value stub_xc_version_changeset(value xch)
+CAMLprim value stub_xc_version_changeset(value xch_val)
 {
 	xen_changeset_info_t ci;
 
-	return xc_version_single_string(xch, XENVER_changeset, &ci);
+	return xc_version_single_string(xch_val, XENVER_changeset, &ci);
 }
 
 
-CAMLprim value stub_xc_version_capabilities(value xch)
+CAMLprim value stub_xc_version_capabilities(value xch_val)
 {
 	xen_capabilities_info_t ci;
 
-	return xc_version_single_string(xch, XENVER_capabilities, &ci);
+	return xc_version_single_string(xch_val, XENVER_capabilities, &ci);
 }
 
 
@@ -1022,11 +1054,12 @@ CAMLprim value stub_pages_to_kib(value pages)
 }
 
 
-CAMLprim value stub_map_foreign_range(value xch, value dom,
+CAMLprim value stub_map_foreign_range(value xch_val, value dom,
                                       value size, value mfn)
 {
-	CAMLparam4(xch, dom, size, mfn);
+	CAMLparam4(xch_val, dom, size, mfn);
 	CAMLlocal1(result);
+	xc_interface *xch = xch_of_val(xch_val);
 	struct mmap_interface *intf;
 	unsigned long c_mfn = Nativeint_val(mfn);
 	int len = Int_val(size);
@@ -1037,7 +1070,7 @@ CAMLprim value stub_map_foreign_range(value xch, value dom,
 			    Abstract_tag);
 
 	caml_enter_blocking_section();
-	ptr = xc_map_foreign_range(_H(xch), _D(dom), len,
+	ptr = xc_map_foreign_range(xch, Int_val(dom), len,
 				   PROT_READ|PROT_WRITE, c_mfn);
 	caml_leave_blocking_section();
 
@@ -1050,18 +1083,19 @@ CAMLprim value stub_map_foreign_range(value xch, value dom,
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_sched_credit_domain_get(value xch, value domid)
+CAMLprim value stub_sched_credit_domain_get(value xch_val, value domid)
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
 	CAMLlocal1(sdom);
+	xc_interface *xch = xch_of_val(xch_val);
 	struct xen_domctl_sched_credit c_sdom;
 	int ret;
 
 	caml_enter_blocking_section();
-	ret = xc_sched_credit_domain_get(_H(xch), _D(domid), &c_sdom);
+	ret = xc_sched_credit_domain_get(xch, Int_val(domid), &c_sdom);
 	caml_leave_blocking_section();
 	if (ret != 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	sdom = caml_alloc_tuple(2);
 	Store_field(sdom, 0, Val_int(c_sdom.weight));
@@ -1070,67 +1104,71 @@ CAMLprim value stub_sched_credit_domain_get(value xch, value domid)
 	CAMLreturn(sdom);
 }
 
-CAMLprim value stub_sched_credit_domain_set(value xch, value domid,
+CAMLprim value stub_sched_credit_domain_set(value xch_val, value domid,
                                             value sdom)
 {
-	CAMLparam3(xch, domid, sdom);
+	CAMLparam3(xch_val, domid, sdom);
+	xc_interface *xch = xch_of_val(xch_val);
 	struct xen_domctl_sched_credit c_sdom;
 	int ret;
 
 	c_sdom.weight = Int_val(Field(sdom, 0));
 	c_sdom.cap = Int_val(Field(sdom, 1));
 	caml_enter_blocking_section();
-	ret = xc_sched_credit_domain_set(_H(xch), _D(domid), &c_sdom);
+	ret = xc_sched_credit_domain_set(xch, Int_val(domid), &c_sdom);
 	caml_leave_blocking_section();
 	if (ret != 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_shadow_allocation_get(value xch, value domid)
+CAMLprim value stub_shadow_allocation_get(value xch_val, value domid)
 {
-	CAMLparam2(xch, domid);
+	CAMLparam2(xch_val, domid);
 	CAMLlocal1(mb);
+	xc_interface *xch = xch_of_val(xch_val);
 	unsigned int c_mb;
 	int ret;
 
 	caml_enter_blocking_section();
-	ret = xc_shadow_control(_H(xch), _D(domid),
+	ret = xc_shadow_control(xch, Int_val(domid),
 				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
 				&c_mb, 0);
 	caml_leave_blocking_section();
 	if (ret != 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	mb = Val_int(c_mb);
 	CAMLreturn(mb);
 }
 
-CAMLprim value stub_shadow_allocation_set(value xch, value domid,
+CAMLprim value stub_shadow_allocation_set(value xch_val, value domid,
 					  value mb)
 {
-	CAMLparam3(xch, domid, mb);
+	CAMLparam3(xch_val, domid, mb);
+	xc_interface *xch = xch_of_val(xch_val);
 	unsigned int c_mb;
 	int ret;
 
 	c_mb = Int_val(mb);
 	caml_enter_blocking_section();
-	ret = xc_shadow_control(_H(xch), _D(domid),
+	ret = xc_shadow_control(xch, Int_val(domid),
 				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
 				&c_mb, 0);
 	caml_leave_blocking_section();
 	if (ret != 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_ioport_permission(value xch, value domid,
+CAMLprim value stub_xc_domain_ioport_permission(value xch_val, value domid,
 					       value start_port, value nr_ports,
 					       value allow)
 {
-	CAMLparam5(xch, domid, start_port, nr_ports, allow);
+	CAMLparam5(xch_val, domid, start_port, nr_ports, allow);
+	xc_interface *xch = xch_of_val(xch_val);
 	uint32_t c_start_port, c_nr_ports;
 	uint8_t c_allow;
 	int ret;
@@ -1139,19 +1177,20 @@ CAMLprim value stub_xc_domain_ioport_permission(value xch, value domid,
 	c_nr_ports = Int_val(nr_ports);
 	c_allow = Bool_val(allow);
 
-	ret = xc_domain_ioport_permission(_H(xch), _D(domid),
+	ret = xc_domain_ioport_permission(xch, Int_val(domid),
 					 c_start_port, c_nr_ports, c_allow);
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_iomem_permission(value xch, value domid,
+CAMLprim value stub_xc_domain_iomem_permission(value xch_val, value domid,
 					       value start_pfn, value nr_pfns,
 					       value allow)
 {
-	CAMLparam5(xch, domid, start_pfn, nr_pfns, allow);
+	CAMLparam5(xch_val, domid, start_pfn, nr_pfns, allow);
+	xc_interface *xch = xch_of_val(xch_val);
 	unsigned long c_start_pfn, c_nr_pfns;
 	uint8_t c_allow;
 	int ret;
@@ -1160,18 +1199,19 @@ CAMLprim value stub_xc_domain_iomem_permission(value xch, value domid,
 	c_nr_pfns = Nativeint_val(nr_pfns);
 	c_allow = Bool_val(allow);
 
-	ret = xc_domain_iomem_permission(_H(xch), _D(domid),
+	ret = xc_domain_iomem_permission(xch, Int_val(domid),
 					 c_start_pfn, c_nr_pfns, c_allow);
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
+CAMLprim value stub_xc_domain_irq_permission(value xch_val, value domid,
 					     value pirq, value allow)
 {
-	CAMLparam4(xch, domid, pirq, allow);
+	CAMLparam4(xch_val, domid, pirq, allow);
+	xc_interface *xch = xch_of_val(xch_val);
 	uint32_t c_pirq;
 	bool c_allow;
 	int ret;
@@ -1179,41 +1219,44 @@ CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
 	c_pirq = Int_val(pirq);
 	c_allow = Bool_val(allow);
 
-	ret = xc_domain_irq_permission(_H(xch), _D(domid),
+	ret = xc_domain_irq_permission(xch, Int_val(domid),
 				       c_pirq, c_allow);
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_hvm_param_get(value xch, value domid, value param)
+CAMLprim value stub_xc_hvm_param_get(value xch_val, value domid, value param)
 {
-	CAMLparam3(xch, domid, param);
+	CAMLparam3(xch_val, domid, param);
+	xc_interface *xch = xch_of_val(xch_val);
 	uint64_t val;
 	int ret;
 
 	caml_enter_blocking_section();
-	ret = xc_hvm_param_get(_H(xch), _D(domid), Int_val(param), &val);
+	ret = xc_hvm_param_get(xch, Int_val(domid), Int_val(param), &val);
 	caml_leave_blocking_section();
 
 	if ( ret )
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(caml_copy_int64(val));
 }
 
-CAMLprim value stub_xc_hvm_param_set(value xch, value domid, value param, value val)
+CAMLprim value stub_xc_hvm_param_set(value xch_val, value domid, value param, value val)
 {
-	CAMLparam4(xch, domid, param, val);
+	CAMLparam4(xch_val, domid, param, val);
+	xc_interface *xch = xch_of_val(xch_val);
+	uint64_t val64 = Int64_val(val);
 	int ret;
 
 	caml_enter_blocking_section();
-	ret = xc_hvm_param_set(_H(xch), _D(domid), Int_val(param), Int64_val(val));
+	ret = xc_hvm_param_set(xch, Int_val(domid), Int_val(param), val64);
 	caml_leave_blocking_section();
 
 	if ( ret )
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_unit);
 }
@@ -1226,9 +1269,10 @@ static uint32_t encode_sbdf(int domain, int bus, int dev, int func)
 		((uint32_t)func   &    0x7);
 }
 
-CAMLprim value stub_xc_domain_test_assign_device(value xch, value domid, value desc)
+CAMLprim value stub_xc_domain_test_assign_device(value xch_val, value domid, value desc)
 {
-	CAMLparam3(xch, domid, desc);
+	CAMLparam3(xch_val, domid, desc);
+	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 	int domain, bus, dev, func;
 	uint32_t sbdf;
@@ -1239,14 +1283,15 @@ CAMLprim value stub_xc_domain_test_assign_device(value xch, value domid, value d
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = xc_test_assign_device(_H(xch), _D(domid), sbdf);
+	ret = xc_test_assign_device(xch, Int_val(domid), sbdf);
 
 	CAMLreturn(Val_bool(ret == 0));
 }
 
-CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc)
+CAMLprim value stub_xc_domain_assign_device(value xch_val, value domid, value desc)
 {
-	CAMLparam3(xch, domid, desc);
+	CAMLparam3(xch_val, domid, desc);
+	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 	int domain, bus, dev, func;
 	uint32_t sbdf;
@@ -1257,17 +1302,18 @@ CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc)
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = xc_assign_device(_H(xch), _D(domid), sbdf,
+	ret = xc_assign_device(xch, Int_val(domid), sbdf,
 			       XEN_DOMCTL_DEV_RDM_RELAXED);
 
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_domain_deassign_device(value xch, value domid, value desc)
+CAMLprim value stub_xc_domain_deassign_device(value xch_val, value domid, value desc)
 {
-	CAMLparam3(xch, domid, desc);
+	CAMLparam3(xch_val, domid, desc);
+	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 	int domain, bus, dev, func;
 	uint32_t sbdf;
@@ -1278,28 +1324,29 @@ CAMLprim value stub_xc_domain_deassign_device(value xch, value domid, value desc
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = xc_deassign_device(_H(xch), _D(domid), sbdf);
+	ret = xc_deassign_device(xch, Int_val(domid), sbdf);
 
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_xc_get_cpu_featureset(value xch, value idx)
+CAMLprim value stub_xc_get_cpu_featureset(value xch_val, value idx)
 {
-	CAMLparam2(xch, idx);
+	CAMLparam2(xch_val, idx);
 	CAMLlocal1(bitmap_val);
 #if defined(__i386__) || defined(__x86_64__)
+	xc_interface *xch = xch_of_val(xch_val);
 
 	/* Safe, because of the global ocaml lock. */
 	static uint32_t fs_len;
 
 	if (fs_len == 0)
 	{
-		int ret = xc_get_cpu_featureset(_H(xch), 0, &fs_len, NULL);
+		int ret = xc_get_cpu_featureset(xch, 0, &fs_len, NULL);
 
 		if (ret || (fs_len == 0))
-			failwith_xc(_H(xch));
+			failwith_xc(xch);
 	}
 
 	{
@@ -1307,10 +1354,10 @@ CAMLprim value stub_xc_get_cpu_featureset(value xch, value idx)
 		uint32_t fs[fs_len], len = fs_len;
 		unsigned int i;
 
-		int ret = xc_get_cpu_featureset(_H(xch), Int_val(idx), &len, fs);
+		int ret = xc_get_cpu_featureset(xch, Int_val(idx), &len, fs);
 
 		if (ret)
-			failwith_xc(_H(xch));
+			failwith_xc(xch);
 
 		bitmap_val = caml_alloc(len, 0);
 
@@ -1323,15 +1370,16 @@ CAMLprim value stub_xc_get_cpu_featureset(value xch, value idx)
 	CAMLreturn(bitmap_val);
 }
 
-CAMLprim value stub_xc_watchdog(value xch, value domid, value timeout)
+CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 {
-	CAMLparam3(xch, domid, timeout);
+	CAMLparam3(xch_val, domid, timeout);
+	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 	unsigned int c_timeout = Int32_val(timeout);
 
-	ret = xc_watchdog(_H(xch), _D(domid), c_timeout);
+	ret = xc_watchdog(xch, Int_val(domid), c_timeout);
 	if (ret < 0)
-		failwith_xc(_H(xch));
+		failwith_xc(xch);
 
 	CAMLreturn(Val_int(ret));
 }
-- 
2.11.0


