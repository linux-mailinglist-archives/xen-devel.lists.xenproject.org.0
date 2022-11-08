Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FC621869
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440126.694257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcn-0003hK-Sa; Tue, 08 Nov 2022 15:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440126.694257; Tue, 08 Nov 2022 15:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcn-0003Xi-LR; Tue, 08 Nov 2022 15:34:53 +0000
Received: by outflank-mailman (input) for mailman id 440126;
 Tue, 08 Nov 2022 15:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcl-0001RY-Gs
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ef84aa-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:49 +0100 (CET)
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
X-Inumbo-ID: e0ef84aa-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ZXiX9ItGs2cbrZyrTgiP7zufiQzcqMjhU4Bz6aA7bo=;
  b=QCdChhoGm43hsmE+1+edlUuHhyNoKL7Rgghp7jpV/rATFoOk4ckvePYu
   j/unOBHLxXr/ghnpIGfOggmcS4yATolVulgSSn7URVVn+ASJCeZyGs5RR
   9X37WRB1dsz6feCU76wItMEcuU247pmf0pU0s2ml7RUIE0ZFB8st28F9O
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84416530
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QJrAg68xziy/qLbiSl7tDrUDjH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mtKWG6HPa6KajCjeYx0PYq28E5X6pWDytdrS1Nuq388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKgb5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklRq
 dkbdBsWfiu8iuSU7p2nUPs1uO08eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+limf+dXtEr0iSpoI84nTJzRw327/oWDbQUozWGZwLwx3Az
 o7A12vHJD8/bP+89WuMzVaLhM/KpXzxZJ1HQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmtx6zO8kCmD24LZjdbbZots8pebTAjy
 FKhhd7iAj1r9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bkU7qTYpIC76OsdDzOx/f3
 yqY9RYXmOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW3C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8Ph0UB/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnFLpbwUy9CUf45nFJaotvxNpdymEgDKZ77H8inn3xLL5LCDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CYXDj+i+2dB7EG3m2lBiVM2p8ZcMLr7aSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:H+TIP6HUiUxyFGElpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84416530"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 08/15] tools/ocaml/libs/evtchn: add xenevtchn_fdopen bindings
Date: Tue, 8 Nov 2022 15:34:00 +0000
Message-ID: <3e7f15778ffb5d5d7adde8567c4d50197607f7b2.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- needed for a bugfix in a followup commit

Changes since v2:
- new in v3
---
 tools/ocaml/libs/eventchn/xeneventchn.ml      |  6 +++-
 tools/ocaml/libs/eventchn/xeneventchn.mli     |  9 +++++-
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 28 +++++++++++++++++--
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn.ml b/tools/ocaml/libs/eventchn/xeneventchn.ml
index dd00a1f0ea..34f7391f5e 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.ml
+++ b/tools/ocaml/libs/eventchn/xeneventchn.ml
@@ -16,7 +16,11 @@
 
 type handle
 
-external init: unit -> handle = "stub_eventchn_init"
+external init_cloexec: bool -> handle = "stub_eventchn_init"
+
+let init ?(cloexec=true) () = init_cloexec cloexec
+
+external fdopen: Unix.file_descr -> handle = "stub_eventchn_fdopen"
 external fd: handle -> Unix.file_descr = "stub_eventchn_fd"
 
 type t = int
diff --git a/tools/ocaml/libs/eventchn/xeneventchn.mli b/tools/ocaml/libs/eventchn/xeneventchn.mli
index 08c7337643..3965b29621 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.mli
+++ b/tools/ocaml/libs/eventchn/xeneventchn.mli
@@ -43,7 +43,14 @@ val to_int: t -> int
 
 val of_int: int -> t
 
-val init: unit -> handle
+val init: ?cloexec:bool -> unit -> handle
+(** [init ?cloexec ()]
+    Return an initialised event channel interface.
+    The default is to close the underlying file descriptor
+    on [execve], which can be overriden with [~cloexec:false].
+    On error it will throw a Failure exception. *)
+
+val fdopen: Unix.file_descr -> handle
 (** Return an initialised event channel interface. On error it
     will throw a Failure exception. *)
 
diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index 2263c4caa1..92092ca31e 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -58,14 +58,36 @@ static struct custom_operations xenevtchn_ops = {
     custom_compare_ext_default /* raises Failure */
 };
 
-CAMLprim value stub_eventchn_init(void)
+CAMLprim value stub_eventchn_init(value cloexec)
 {
-    CAMLparam0();
+    CAMLparam1(cloexec);
     CAMLlocal1(result);
     xenevtchn_handle *xce;
 
     caml_enter_blocking_section();
-    xce = xenevtchn_open(NULL, 0);
+    xce = xenevtchn_open(NULL, Bool_val(cloexec) ? 0 : XENEVTCHN_NO_CLOEXEC);
+    caml_leave_blocking_section();
+
+    if ( xce == NULL )
+        caml_failwith("open failed");
+
+    /* contains file descriptors, trigger full GC at least every 128
+     * allocations
+     */
+    result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+    _H(result) = xce;
+    CAMLreturn(result);
+}
+
+CAMLprim value stub_eventchn_fdopen(value fdval)
+{
+    CAMLparam1(fdval);
+    CAMLlocal1(result);
+    xenevtchn_handle *xce;
+
+    caml_enter_blocking_section();
+    /* having any flags here would raise EINVAL */
+    xce = xenevtchn_fdopen(NULL, Int_val(fdval), 0);
     caml_leave_blocking_section();
 
     if (xce == NULL)
-- 
2.34.1


