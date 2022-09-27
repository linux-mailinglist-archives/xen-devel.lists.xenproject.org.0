Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEE5EC0CB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412491.655850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Yz-0008FP-Kk; Tue, 27 Sep 2022 11:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412491.655850; Tue, 27 Sep 2022 11:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Yz-0008CY-Hc; Tue, 27 Sep 2022 11:15:45 +0000
Received: by outflank-mailman (input) for mailman id 412491;
 Tue, 27 Sep 2022 11:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Yy-0008Aw-Dw
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b895e39a-3e55-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 13:15:42 +0200 (CEST)
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
X-Inumbo-ID: b895e39a-3e55-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FDvDgX7AxBcpgWMVzYo5l6lVSFhVUQDnFTbkDG8AAP4=;
  b=VfzeFkjrp58JMhRmLOKVq1oOdeYS1HPmeik4NCDGNQYoYbECgkH0sAG4
   VvzOkTS6VZUF8/Hm2OnvO4DBU7jD/oUIZxhbDNDzS8R07OaD6+H6dY0Fe
   N1FzxTPmoxfkyq0HT5aPrGTqdLYdKjIkD5WrlgKWB9HfXwH8aoSb2JcM1
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83941730
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OuIcr643ljqtc0Opum9JfQxRtEfHchMFZxGqfqrLsTDasY5as4F+v
 jRKXWzQP/uOMzPzLt53YYu2o0tT7ZODzNUwQVFr+yg9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wZhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FCkNSz
 9xBdwwuLQq7vaWd7KmKVc9V05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqOK4DTGp4N9qqej
 m7d7Vb9GzsYD4W86nmitWuvnv6VvyyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWV9tBJ
 mQO9yEprKx081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3oWfjy+IGXFKEUxBfxc+CiAp+Oj8hrhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1R/HNFBz3oRZPmLy8BxkhTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CKyON4UTM8ggLF7vEMRSiam4gAjQfLUEy/lja
 f93j+71ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPSb9dFvwGAHRBgzPxP/b/V69H
 hc2H5fi9iizp8WlO3GLrNJOcTjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:Up+ZiK/jWUvzldOMOFtuk+DiI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re5MjztCWE8Qr5N0tQ+uxoVJPufZqYz+8Q3WBzB8bFYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IOc+EYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="83941730"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/5] tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0 compat
Date: Tue, 27 Sep 2022 12:14:59 +0100
Message-ID: <b0b9b0d30f6fb86d470b68e11cf541a4c3ab8172.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664276827.git.edvin.torok@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
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


