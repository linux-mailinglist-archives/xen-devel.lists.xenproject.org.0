Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3333254C50
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpq-0005ch-FE; Thu, 27 Aug 2020 17:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpp-00056c-0W
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:37:13 +0000
X-Inumbo-ID: dc60f84d-2d97-4916-8360-bcc5e7bf25e6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc60f84d-2d97-4916-8360-bcc5e7bf25e6;
 Thu, 27 Aug 2020 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JAJlhKAtT6VltCui8Tp0Kdu9mctN9hxfwG2v7mhb6M=;
 b=c32Oe1sKdonCBoboQ6eCNBdLm7HTY5QRUdsnkyS+BZQSMU8PRPQYmyhf
 yfVZgAcySmTitzbF0Iwb0iLhYeUBRckbgkw2zygdVsDZjsr6ZhsEfcgGb
 gLHmagQZhQ1xf1pIRfpmVuN5WI6hcGHCM2MMmy7KOez7k+A7W+rT8BiZM 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 95XsEbv5SdvEiFtxG5Upoatpn1CM22AS7cVFzFed/oySNFoo/z6PX/L8s029HAVNEQhrEa+xAI
 4wu/+BXGsW4zf9sGBdGDCDtsWakXjzHVKZ/nISa3DpnQ7s/hLWjI0eEua/BM0o9bfaUU3+Ripl
 RP654pWgSrw0pyigRjbRymagJDAOO+QWqJfnaXz/iFcK9dhdUwEscL/Lu2XcNgERlw1gXmofVr
 xkabgG1HoQBlstMYqoaI1EFFVsv1mDKeSXuznSkMr1P5alZ6/RFcjg8vtB0Oyyfi1QUoNnT3nB
 tm8=
X-SBRS: 2.7
X-MesageID: 25466307
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25466307"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/9] tools/ocaml: use common macros for manipulating
 mmap_interface
Date: Thu, 27 Aug 2020 18:35:52 +0100
Message-ID: <9c9d2ac94cd7c307837643d7a6a59c66cef155e9.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/mmap_stubs.h    |  7 +++++++
 tools/ocaml/libs/mmap/xenmmap_stubs.c |  2 --
 tools/ocaml/libs/xb/xs_ring_stubs.c   | 14 +++++---------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h b/tools/ocaml/libs/mmap/mmap_stubs.h
index 65e4239890..816ba6a724 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -30,4 +30,11 @@ struct mmap_interface
 	int len;
 };
 
+#ifndef Data_abstract_val
+#define Data_abstract_val(v) ((void*) Op_val(v))
+#endif
+
+#define Intf_val(a) ((struct mmap_interface *) Data_abstract_val(a))
+#define Intf_data_val(a) (Intf_val(a)->addr)
+
 #endif
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index e2ce088e25..b811990a89 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,8 +28,6 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
-#define Intf_val(a) ((struct mmap_interface *) a)
-
 static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
                                int len, int offset)
diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 7537a23949..9b6e3209fe 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -34,8 +34,6 @@
 
 #include "mmap_stubs.h"
 
-#define GET_C_STRUCT(a) ((struct mmap_interface *) a)
-
 /*
  * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
  * if needed.
@@ -51,12 +49,11 @@ CAMLprim value ml_interface_read(value ml_interface,
 	CAMLparam3(ml_interface, ml_buffer, ml_len);
 	CAMLlocal1(ml_result);
 
-	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
 	unsigned char *buffer = Bytes_val(ml_buffer);
 	int len = Int_val(ml_len);
 	int result;
 
-	struct xenstore_domain_interface *intf = interface->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(ml_interface);
 	XENSTORE_RING_IDX cons, prod; /* offsets only */
 	int total_data, data;
 	uint32_t connection;
@@ -110,12 +107,11 @@ CAMLprim value ml_interface_write(value ml_interface,
 	CAMLparam3(ml_interface, ml_buffer, ml_len);
 	CAMLlocal1(ml_result);
 
-	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
 	const unsigned char *buffer = Bytes_val(ml_buffer);
 	int len = Int_val(ml_len);
 	int result;
 
-	struct xenstore_domain_interface *intf = interface->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(ml_interface);
 	XENSTORE_RING_IDX cons, prod;
 	int total_space, space;
 	uint32_t connection;
@@ -165,7 +161,7 @@ exit:
 CAMLprim value ml_interface_set_server_features(value interface, value v)
 {
 	CAMLparam2(interface, v);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 
 	intf->server_features = Int_val(v);
 
@@ -175,7 +171,7 @@ CAMLprim value ml_interface_set_server_features(value interface, value v)
 CAMLprim value ml_interface_get_server_features(value interface)
 {
 	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 
 	CAMLreturn(Val_int (intf->server_features));
 }
@@ -183,7 +179,7 @@ CAMLprim value ml_interface_get_server_features(value interface)
 CAMLprim value ml_interface_close(value interface)
 {
 	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 	int i;
 
 	intf->req_cons = intf->req_prod = intf->rsp_cons = intf->rsp_prod = 0;
-- 
2.25.1


