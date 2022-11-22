Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE6633FFD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447221.703182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV54-00085u-K1; Tue, 22 Nov 2022 15:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447221.703182; Tue, 22 Nov 2022 15:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV54-000838-FU; Tue, 22 Nov 2022 15:21:02 +0000
Received: by outflank-mailman (input) for mailman id 447221;
 Tue, 22 Nov 2022 15:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV52-00082v-QP
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fb11d6-6a79-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 16:20:58 +0100 (CET)
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
X-Inumbo-ID: 42fb11d6-6a79-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1BYJug4YTOsoAI8ImSgHkkpV3S64Z2EdA3k2jZuilTM=;
  b=H2bLllQTlb4Rdou4xjz4HBpRYkzsLP9S1/L7bOJmr2bIf4XrkWwsKjq9
   eoVkoH/W0c3W08DuLm+hiwWP7kbAdpJskQ1jlEl7gEbxK138Sg5gvAQlB
   syaBHSUC9KweU5moHXSaAuB5hO8hZtFob/dPOOAijvoxw2LXS4ck2BNiC
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85763990
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xhKYfqlZGOeppPb1VSwL6bno5gzTJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdCD+BbK2NYzD8LdAiPInl8UoFvJXWztAwS1Bkrig1QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gWGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d88BxY9MxOOvuSv5qm0V8p13cU5MNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zhvH+
 DmXrjyR7hcyEtuOyGCm/SKXoKzkwjnBYK89Nv6Bz6s/6LGU7jNKU0BHPbehmtG1g1Czc8hSI
 EsV/mwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9alay0IfJrj6LPzEzNmAfRjZfTBEZ/Iy2yG0stS4jXuqPAYbs0IOkQWGrm
 mHbxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvZ5pyBWG3TZS82AJrlxAOxeLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYiryMPIpPNjvVZtCIU3c+TPND6C8UzazSsIpKF/vEN9GOCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7517FLqrwhgrV7uqWfTlUn7geHHPSTNIVrHWXPXBt0EAGq/iF292
 75i2wGikX2zjMWWjvHrzLMu
IronPort-HdrOrdr: A9a23:Oa0BY6kf0R2FyhxsXLoZZDJhUbPpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7gr5OUtQ/uxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyIMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85763990"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 2/8] tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak
Date: Tue, 22 Nov 2022 15:20:37 +0000
Message-ID: <20221122152043.8518-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

There is no binding for xenevtchn_close().  In principle, this is a resource
leak, but the typical usage is as a singleton that lives for the lifetime of
the program.

Ocaml 5 no longer permits storing a naked C pointer in an Ocaml value.

Therefore, use a Custom block.  This allows us to use the finaliser callback
to call xenevtchn_close(), if the Ocaml object goes out of scope.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index f889a7a2e4a1..37f1cc4e1478 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -33,7 +33,22 @@
 #include <caml/fail.h>
 #include <caml/signals.h>
 
-#define _H(__h) ((xenevtchn_handle *)(__h))
+#define _H(__h) (*((xenevtchn_handle **)Data_custom_val(__h)))
+
+static void stub_evtchn_finalize(value v)
+{
+	xenevtchn_close(_H(v));
+}
+
+static struct custom_operations xenevtchn_ops = {
+	.identifier  = "xenevtchn",
+	.finalize    = stub_evtchn_finalize,
+	.compare     = custom_compare_default,     /* Can't compare     */
+	.hash        = custom_hash_default,        /* Can't hash        */
+	.serialize   = custom_serialize_default,   /* Can't serialize   */
+	.deserialize = custom_deserialize_default, /* Can't deserialize */
+	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+};
 
 CAMLprim value stub_eventchn_init(void)
 {
@@ -48,7 +63,9 @@ CAMLprim value stub_eventchn_init(void)
 	if (xce == NULL)
 		caml_failwith("open failed");
 
-	result = (value)xce;
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+	_H(result) = xce;
+
 	CAMLreturn(result);
 }
 
-- 
2.11.0


