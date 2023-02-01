Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65E6866E8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 14:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488306.756330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNDBM-0007IE-Dq; Wed, 01 Feb 2023 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488306.756330; Wed, 01 Feb 2023 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNDBM-0007F3-As; Wed, 01 Feb 2023 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 488306;
 Wed, 01 Feb 2023 13:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPhy=55=citrix.com=prvs=38943224b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pNDBL-0007Ex-2o
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 13:29:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b984eb3-a234-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 14:29:45 +0100 (CET)
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
X-Inumbo-ID: 7b984eb3-a234-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675258185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i7KYkpkwLrJeQiqmARu1gX5bVgBma3PSiIgTw8YCdtg=;
  b=BqXbCe6Rw7/XZPc23VsWNCLjRJQWmGcu5CBaE4286l1g/fd5doaCmH3z
   Wkiyg0gDMHe6z8/y7s2BpiS14/KlHWXcFgjGkLOiYQ0JWOo+Huxayie8W
   vHfqkBpyVS3/yj9F22IWv0OUS2VL2sKbqu4ia0gB8KOWdMHsRjU2vGMnf
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94615550
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NrphE6r6zarhWHiGlHUtIfI9N0ReBmIZZRIvgKrLsJaIsI4StFCzt
 garIBnVPfffYmH9L9tzPonkpE4Hu5LczNc3Tldo+S8wFXlH8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACgmd0yDoMWr+ayQTNN9h/wkdND0YIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOaoT2kX0xCXDCZ4Rar2HKmm9/9oR3iAboxMpfh9dhFr2TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U24R+A4rDZ6AGYAi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+MhiruOQ8yMFYcTik+XAo95IH6v90820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHRcFJG9eFoSTLkWVsDNZWei9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK+JN4sWOsAsLlXYlM2LWaJ39zm9+HXAbIllY
 cvLGSpSJSly5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLHDEN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBhWMmp95QLJrHaSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 BlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:UlC0ka+vJp881wKjHJ9uk+DQI+orL9Y04lQ7vn2ZHyYlF/Bw8P
 re/sjztCWE6wr5PUtLpTnuAsS9qB/nmaKdgrNwAV7BZmfbUQKTRekI0WKI+Vzd8kPFmdK0ZM
 xbAsxDNOE=
X-IronPort-AV: E=Sophos;i="5.97,263,1669093200"; 
   d="scan'208";a="94615550"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH] tools/ocaml/libs: Fix memory/resource leaks with caml_alloc_custom()
Date: Wed, 1 Feb 2023 13:29:24 +0000
Message-ID: <20230201132924.28711-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All caml_alloc_*() functions can throw exceptions, and longjump out of
context.  If this happens, we leak the xch/xce handle.

Reorder the logic to allocate the the Ocaml object first.

Fixes: 8b3c06a3e545 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
Fixes: 22d5affdf0ce ("tools/ocaml/evtchn: OCaml 5 support, fix potential resource leak")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 6 ++++--
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index 34dcfed30275..1980acf405a5 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -63,6 +63,8 @@ CAMLprim value stub_eventchn_init(value cloexec)
 	if ( !Bool_val(cloexec) )
 		flags |= XENEVTCHN_NO_CLOEXEC;
 
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+
 	caml_enter_blocking_section();
 	xce = xenevtchn_open(NULL, flags);
 	caml_leave_blocking_section();
@@ -70,7 +72,6 @@ CAMLprim value stub_eventchn_init(value cloexec)
 	if (xce == NULL)
 		caml_failwith("open failed");
 
-	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
 	*(xenevtchn_handle **)Data_custom_val(result) = xce;
 
 	CAMLreturn(result);
@@ -82,6 +83,8 @@ CAMLprim value stub_eventchn_fdopen(value fdval)
 	CAMLlocal1(result);
 	xenevtchn_handle *xce;
 
+	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+
 	caml_enter_blocking_section();
 	xce = xenevtchn_fdopen(NULL, Int_val(fdval), 0);
 	caml_leave_blocking_section();
@@ -89,7 +92,6 @@ CAMLprim value stub_eventchn_fdopen(value fdval)
 	if (xce == NULL)
 		caml_failwith("evtchn fdopen failed");
 
-	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
 	*(xenevtchn_handle **)Data_custom_val(result) = xce;
 
 	CAMLreturn(result);
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index f9006c662382..ed1cbafdb488 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -98,6 +98,8 @@ CAMLprim value stub_xc_interface_open(value unit)
 	CAMLlocal1(result);
 	xc_interface *xch;
 
+	result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
+
 	caml_enter_blocking_section();
 	xch = xc_interface_open(NULL, NULL, 0);
 	caml_leave_blocking_section();
@@ -105,7 +107,6 @@ CAMLprim value stub_xc_interface_open(value unit)
 	if ( !xch )
 		failwith_xc(xch);
 
-	result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
 	*(xc_interface **)Data_custom_val(result) = xch;
 
 	CAMLreturn(result);
-- 
2.11.0


