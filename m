Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B100634007
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447229.703267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5G-0001oF-TW; Tue, 22 Nov 2022 15:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447229.703267; Tue, 22 Nov 2022 15:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5G-0001jW-Fs; Tue, 22 Nov 2022 15:21:14 +0000
Received: by outflank-mailman (input) for mailman id 447229;
 Tue, 22 Nov 2022 15:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV5E-0000Pt-Hn
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1b946e-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:08 +0100 (CET)
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
X-Inumbo-ID: 4a1b946e-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0EP93NE9oZj0G/r8F641xXDztqVUJkqAFbkxrSBRCso=;
  b=FuUUYDEyZqu4ivHK7Yw/6WCpzlerdU5WmyhRVq+YM0MBcbWCTPRhYFlU
   eBgwohKLX1zgzoVNwxMPbdtqW6FuhjWF9Mbv7OjitS8xUcGwr3JX62nCW
   XpoFaShNyLhXyn6GIsg/JL9sj4c+rFrb5ndHVHBKOkIwWeOvxgGrlqqhG
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84920461
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/m1Og6wtyNzAYIc9EMN6t+dlxirEfRIJ4+MujC+fZmUNrF6WrkUGz
 mceWGzSPa7YNjT8fIglYIWwoB4CsJPSzdJiGQU4rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6oT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTwfy
 u4ZLj0KUh6KoOeM0erqbOdQmNt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFZkExB7E+
 DuuE2LRMhcdNPmv5Rm81U2229HxrAarBLovLejtnhJtqALKnTFCYPEMbnO3qOe0olSzUNVeL
 woT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH7eyqW3Ob+7CoozqVPBIEdT4kaxMaUl5QizX8m73fni4jX/46TvDk1o2uQGChq
 9yZhHNg3utO1Kbnw43+pAma2Gz0+/AlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBho81XRtlFH97fbFXhbadHRvHMN12FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPus4LYSb0MvUpPd3Z5yEWIU/ITISNaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GPeegrcuJd1rh0DKZT7H82nn0/+iODGDJNXIJ9cWGazgikCxPvsiG3oH
 xx3baNmFz03vDXCXxTq
IronPort-HdrOrdr: A9a23:wxi1dKDj1Ql8FhDlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ8l6U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="84920461"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 3/8] tools/ocaml/evtchn: Add binding for xenevtchn_fdopen()
Date: Tue, 22 Nov 2022 15:20:38 +0000
Message-ID: <20221122152043.8518-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

For live update, the new oxenstored needs to reconstruct an evtchn object
around an existing file descriptor.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Split out of combined patch
---
 tools/ocaml/libs/eventchn/xeneventchn.ml      |  1 +
 tools/ocaml/libs/eventchn/xeneventchn.mli     |  4 ++++
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn.ml b/tools/ocaml/libs/eventchn/xeneventchn.ml
index dd00a1f0ead5..be4de82f46b9 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.ml
+++ b/tools/ocaml/libs/eventchn/xeneventchn.ml
@@ -17,6 +17,7 @@
 type handle
 
 external init: unit -> handle = "stub_eventchn_init"
+external fdopen: Unix.file_descr -> handle = "stub_eventchn_fdopen"
 external fd: handle -> Unix.file_descr = "stub_eventchn_fd"
 
 type t = int
diff --git a/tools/ocaml/libs/eventchn/xeneventchn.mli b/tools/ocaml/libs/eventchn/xeneventchn.mli
index 08c73376438e..98b3c86f3702 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.mli
+++ b/tools/ocaml/libs/eventchn/xeneventchn.mli
@@ -47,6 +47,10 @@ val init: unit -> handle
 (** Return an initialised event channel interface. On error it
     will throw a Failure exception. *)
 
+val fdopen: Unix.file_descr -> handle
+(** Return an initialised event channel interface, from an already open evtchn
+    file descriptor.  On error it will throw a Failure exception. *)
+
 val fd: handle -> Unix.file_descr
 (** Return a file descriptor suitable for Unix.select. When
     the descriptor becomes readable, it is safe to call 'pending'.
diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index 37f1cc4e1478..7bdf711bc150 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -69,6 +69,25 @@ CAMLprim value stub_eventchn_init(void)
 	CAMLreturn(result);
 }
 
+CAMLprim value stub_eventchn_fdopen(value fdval)
+{
+	CAMLparam1(fdval);
+	CAMLlocal1(result);
+	xenevtchn_handle *xce;
+
+	caml_enter_blocking_section();
+	xce = xenevtchn_fdopen(NULL, Int_val(fdval), 0);
+	caml_leave_blocking_section();
+
+	if (xce == NULL)
+		caml_failwith("evtchn fdopen failed");
+
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+	_H(result) = xce;
+
+	CAMLreturn(result);
+}
+
 CAMLprim value stub_eventchn_fd(value xce)
 {
 	CAMLparam1(xce);
-- 
2.11.0


