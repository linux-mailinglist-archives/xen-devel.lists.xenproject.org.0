Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7E6838A8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487845.755567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC4-0000UY-NA; Tue, 31 Jan 2023 21:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487845.755567; Tue, 31 Jan 2023 21:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC4-0000Pl-GI; Tue, 31 Jan 2023 21:29:32 +0000
Received: by outflank-mailman (input) for mailman id 487845;
 Tue, 31 Jan 2023 21:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC2-0000Nb-NH
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55eb48d0-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:28 +0100 (CET)
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
X-Inumbo-ID: 55eb48d0-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Epp3wFTJjIGliIjbWr7uyY/q1naoD6A5ExyqnrFK5rI=;
  b=UJUr2HlDbZcKqqNgMq7dcLaPSyT+kXj+eeYjDK03mMc1fylKIMJ91E1y
   TaCNb/sumgXKP+nVlPEe2xdRk53pUKRw01M9gA7M6QMpBLI+LyZCY6qQC
   eKpIF+bQGFDtYfCUrJFlVkh6B2hfxOLNL7ya53W/Kst+FxGF+K/Fs+6yL
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95024398
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V4+TD6+/ZY02RbRFWKniDrUDgX6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GRJCz2Gb/iCYGX3fIwgOYiw9UkA6JeByNRrGlNlpSs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKsS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkUy
 u0nARFdLSqioMmR4ZeHavlmoMcKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Ewx7C+
 jmXrwwVBDlACIyBxheP60umj96I3gDhVLIfL4ano6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0V9NOHsUg5QqKy66S5ByWblXoVRYYNoZg7pVvA2V3i
 BnQxYiB6SFTXKO9E02MyZ61/XCIGA8+Ck4nWQ8URy0Gyoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGeE6bKMN8N7n9hIx5JEVd443d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa/SI20DqiMM4AUPfCdkTNrGwk3NSatM53FyhBwwcnTx
 7/EGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dglWcyNkWMys+6S6tIere2JbJY3oMNeJqZtJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:9jBw2K20Bzub96R4VOQEwAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95024398"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 3/7] tools/ocaml/evtchn: Don't reference Custom objects with the GC lock released
Date: Tue, 31 Jan 2023 21:29:09 +0000
Message-ID: <20230131212913.6199-4-andrew.cooper3@citrix.com>
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

 * Drop the _H() macro and replace it with a static inline xce_of_val().
 * Opencode the assignment into Data_custom_val() in the two constructors.
 * Rename "value xce" parameters to "value xce_val" so we can consistently
   have "xenevtchn_handle *xce" on the stack, and obtain the pointer with the
   GC lock still held.

Fixes: 22d5affdf0ce ("tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak")
Signed-off-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 60 ++++++++++++++++-----------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index aa8a69cc1ecb..d7881ca95f98 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -33,11 +33,14 @@
 #include <caml/fail.h>
 #include <caml/signals.h>
 
-#define _H(__h) (*((xenevtchn_handle **)Data_custom_val(__h)))
+static inline xenevtchn_handle *xce_of_val(value v)
+{
+	return *(xenevtchn_handle **)Data_custom_val(v);
+}
 
 static void stub_evtchn_finalize(value v)
 {
-	xenevtchn_close(_H(v));
+	xenevtchn_close(xce_of_val(v));
 }
 
 static struct custom_operations xenevtchn_ops = {
@@ -68,7 +71,7 @@ CAMLprim value stub_eventchn_init(value cloexec)
 		caml_failwith("open failed");
 
 	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
-	_H(result) = xce;
+	*(xenevtchn_handle **)Data_custom_val(result) = xce;
 
 	CAMLreturn(result);
 }
@@ -87,18 +90,19 @@ CAMLprim value stub_eventchn_fdopen(value fdval)
 		caml_failwith("evtchn fdopen failed");
 
 	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
-	_H(result) = xce;
+	*(xenevtchn_handle **)Data_custom_val(result) = xce;
 
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_eventchn_fd(value xce)
+CAMLprim value stub_eventchn_fd(value xce_val)
 {
-	CAMLparam1(xce);
+	CAMLparam1(xce_val);
 	CAMLlocal1(result);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	int fd;
 
-	fd = xenevtchn_fd(_H(xce));
+	fd = xenevtchn_fd(xce);
 	if (fd == -1)
 		caml_failwith("evtchn fd failed");
 
@@ -107,13 +111,14 @@ CAMLprim value stub_eventchn_fd(value xce)
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_eventchn_notify(value xce, value port)
+CAMLprim value stub_eventchn_notify(value xce_val, value port)
 {
-	CAMLparam2(xce, port);
+	CAMLparam2(xce_val, port);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	int rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_notify(_H(xce), Int_val(port));
+	rc = xenevtchn_notify(xce, Int_val(port));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
@@ -122,15 +127,16 @@ CAMLprim value stub_eventchn_notify(value xce, value port)
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_eventchn_bind_interdomain(value xce, value domid,
+CAMLprim value stub_eventchn_bind_interdomain(value xce_val, value domid,
                                               value remote_port)
 {
-	CAMLparam3(xce, domid, remote_port);
+	CAMLparam3(xce_val, domid, remote_port);
 	CAMLlocal1(port);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	xenevtchn_port_or_error_t rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_bind_interdomain(_H(xce), Int_val(domid), Int_val(remote_port));
+	rc = xenevtchn_bind_interdomain(xce, Int_val(domid), Int_val(remote_port));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
@@ -140,14 +146,15 @@ CAMLprim value stub_eventchn_bind_interdomain(value xce, value domid,
 	CAMLreturn(port);
 }
 
-CAMLprim value stub_eventchn_bind_virq(value xce, value virq_type)
+CAMLprim value stub_eventchn_bind_virq(value xce_val, value virq_type)
 {
-	CAMLparam2(xce, virq_type);
+	CAMLparam2(xce_val, virq_type);
 	CAMLlocal1(port);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	xenevtchn_port_or_error_t rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_bind_virq(_H(xce), Int_val(virq_type));
+	rc = xenevtchn_bind_virq(xce, Int_val(virq_type));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
@@ -157,13 +164,14 @@ CAMLprim value stub_eventchn_bind_virq(value xce, value virq_type)
 	CAMLreturn(port);
 }
 
-CAMLprim value stub_eventchn_unbind(value xce, value port)
+CAMLprim value stub_eventchn_unbind(value xce_val, value port)
 {
-	CAMLparam2(xce, port);
+	CAMLparam2(xce_val, port);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	int rc;
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_unbind(_H(xce), Int_val(port));
+	rc = xenevtchn_unbind(xce, Int_val(port));
 	caml_leave_blocking_section();
 
 	if (rc == -1)
@@ -172,14 +180,15 @@ CAMLprim value stub_eventchn_unbind(value xce, value port)
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_eventchn_pending(value xce)
+CAMLprim value stub_eventchn_pending(value xce_val)
 {
-	CAMLparam1(xce);
+	CAMLparam1(xce_val);
 	CAMLlocal1(result);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	xenevtchn_port_or_error_t port;
 
 	caml_enter_blocking_section();
-	port = xenevtchn_pending(_H(xce));
+	port = xenevtchn_pending(xce);
 	caml_leave_blocking_section();
 
 	if (port == -1)
@@ -189,16 +198,17 @@ CAMLprim value stub_eventchn_pending(value xce)
 	CAMLreturn(result);
 }
 
-CAMLprim value stub_eventchn_unmask(value xce, value _port)
+CAMLprim value stub_eventchn_unmask(value xce_val, value _port)
 {
-	CAMLparam2(xce, _port);
+	CAMLparam2(xce_val, _port);
+	xenevtchn_handle *xce = xce_of_val(xce_val);
 	evtchn_port_t port;
 	int rc;
 
 	port = Int_val(_port);
 
 	caml_enter_blocking_section();
-	rc = xenevtchn_unmask(_H(xce), port);
+	rc = xenevtchn_unmask(xce, port);
 	caml_leave_blocking_section();
 
 	if (rc)
-- 
2.11.0


