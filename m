Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7641621863
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440121.694205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQce-0002Ej-EW; Tue, 08 Nov 2022 15:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440121.694205; Tue, 08 Nov 2022 15:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQce-0002Ch-9q; Tue, 08 Nov 2022 15:34:44 +0000
Received: by outflank-mailman (input) for mailman id 440121;
 Tue, 08 Nov 2022 15:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcc-0001RY-J7
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daa98f32-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:39 +0100 (CET)
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
X-Inumbo-ID: daa98f32-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQjCOry0zbEmn2oC12Zes+ysVPjXqsmur55tzbE8yXw=;
  b=YRfbrNHcw+YM8eG8ORyAI8w5qtpFTzyBl5mgX1XZIa0mue6NUQAKTIZ1
   OcPfeE247AlKxiDQ/vMms8lCKg7Gh5SLUMj63KbYNfh8qw9kqwT/kWvhb
   LKrciB92PQOc16SyiTPU8I4M8gSEbh0E57cBGYiwvv0Aux1Vx5B90XiW6
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83996668
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CHeWQq3HnZYAnLfe4/bD5d9xkn2cJEfYwER7XKvMYLTBsI5bpz1Vy
 2JJUWDVOPjZMWDzeNhxaoi+909VvpGDzYI3GVY/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBFlU3
 /BIDDA3RTOSmv3r8pK+Fc8viZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWkeu2h3+5bzpCr1G9rqsr+WnDigd21dABNfKFIY3bG5sLzi50o
 EqZ/Tn5IDsgF+Wc7meO81+ng7HktgT0Ddd6+LqQqacx3Qz7KnYoIBEfS1aTu/SyjU+6HdVFJ
 CQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iIQLlDjDHvJjKoWWn8DqRAPQx
 m+s7ydr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJ1cFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwIlpn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 8jLLZj1VS5AV/QPIN+KqwA1iOFD+8zD7TmLGcCTI+qPjdJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQA/CwGJmbMuwacidClmWsqt8JQHL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:9j1UrKpBo47eN31NWZln3Y0aV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="83996668"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 01/15] tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0 compat
Date: Tue, 8 Nov 2022 15:33:53 +0000
Message-ID: <c7d7ff720977f2e09b519f62b80d918b3aa9d4c2.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a finalizer on the event channel value, so that it calls
`xenevtchn_close` when the value would be GCed.

In practice oxenstored seems to be the only user of this,
and it creates a single global event channel only,
but freeing this could still be useful when run with OCAMLRUNPARAM=c

The code was previously casting a C pointer to an OCaml value,
which should be avoided: OCaml 5.0 won't support it.
(all "naked" C pointers must be wrapped inside an OCaml value,
 either an Abstract tag, or Nativeint, see the manual
 https://ocaml.org/manual/intfc.html#ss:c-outside-head)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Reason for inclusion in 4.17:
- Fixes a runtime bug with upcoming OCaml 5.0 (already in beta)

Changes since v2:
- added Acked-by line
- add 4.17 reason
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index f889a7a2e4..67af116377 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -33,7 +33,30 @@
 #include <caml/fail.h>
 #include <caml/signals.h>
 
-#define _H(__h) ((xenevtchn_handle *)(__h))
+/* We want to close the event channel when it is no longer in use,
+   which can only be done safely with a finalizer.
+   Event channels are typically long lived, so we don't need tighter control over resource deallocation.
+   Use a custom block
+*/
+
+/* Access the xenevtchn_t* part of the OCaml custom block */
+#define _H(__h) (*((xenevtchn_handle**)Data_custom_val(__h)))
+
+static void stub_evtchn_finalize(value v)
+{
+	/* docs say to not use any CAMLparam* macros here */
+	xenevtchn_close(_H(v));
+}
+
+static struct custom_operations xenevtchn_ops = {
+	"xenevtchn",
+	stub_evtchn_finalize,
+	custom_compare_default, /* raises Failure, cannot compare */
+	custom_hash_default, /* ignored */
+	custom_serialize_default, /* raises Failure, can't serialize */
+	custom_deserialize_default, /* raises Failure, can't deserialize */
+	custom_compare_ext_default /* raises Failure */
+};
 
 CAMLprim value stub_eventchn_init(void)
 {
@@ -48,7 +71,9 @@ CAMLprim value stub_eventchn_init(void)
 	if (xce == NULL)
 		caml_failwith("open failed");
 
-	result = (value)xce;
+	/* contains file descriptors, trigger full GC at least every 128 allocations */
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+	_H(result) = xce;
 	CAMLreturn(result);
 }
 
-- 
2.34.1


