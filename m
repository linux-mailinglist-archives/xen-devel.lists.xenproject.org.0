Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69F37ADD3
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125907.237051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmu-0002zf-MR; Tue, 11 May 2021 18:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125907.237051; Tue, 11 May 2021 18:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmu-0002xU-IA; Tue, 11 May 2021 18:07:20 +0000
Received: by outflank-mailman (input) for mailman id 125907;
 Tue, 11 May 2021 18:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWms-0000hb-QD
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c9be45a-b6e0-44f1-897a-16a30e5de11b;
 Tue, 11 May 2021 18:07:01 +0000 (UTC)
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
X-Inumbo-ID: 9c9be45a-b6e0-44f1-897a-16a30e5de11b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9mD+y4+KHJLl7F5bXUBrPg32mwOSoUG5fSCQwye7W70=;
  b=XTTUhpB1cJv7Afv+gaIhlJhCj5vOgOyT4wOrjCjerORKIOPUCcbruXg/
   /YfGBqJF1/r0D9qrmQFHQnvgIMeVTXB6henp2uwHLmU5DpzeoqDWoT0kX
   ACp/sa4DOQXRBhGs3RR1mxaJnMrq4YYwDCLGR/GMml0U0tFguu6zT2Bvk
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UQeXyntwYzSztu4nyK19C5cw8sAUrc9eVV6jQWCg2hA7PhP5mCdaPh01FsCzxfVp3vD5RgECo5
 1ehNvxozd4YgFyBhI5FbpgUdkld+oA6+Wl94ln5TbMxjzn3j2UdBgWzzHHkDXZ6VEP+L0/EpgC
 vmRhSN2U6FLqOqkpIcbtaHpwZLNL8u2INqdLPTrjXgF2IFVBNbIx234NbSYcRMWoLyEoLEcBN3
 oMLty26irLS1Stusg5Xvd5QffwEyKRqOAmMwairLpbomk2feZbgqDgbRPy8rUwsJDsMLL7/AmS
 Sy0=
X-SBRS: 5.1
X-MesageID: 43954257
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gs89JaHeYqgY8YuOpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43954257"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 09/17] tools/ocaml: use common macros for manipulating mmap_interface
Date: Tue, 11 May 2021 19:05:22 +0100
Message-ID: <744b98946062028be059435fbe2b9ccc2009e1e8.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also expose these macros in a header file that can be reused by
the upcoming grant table code.

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
index 7a91fdee75..614c6e371d 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -35,8 +35,6 @@
 #include <sys/mman.h>
 #include "mmap_stubs.h"
 
-#define GET_C_STRUCT(a) ((struct mmap_interface *) a)
-
 /*
  * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
  * if needed.
@@ -52,12 +50,11 @@ CAMLprim value ml_interface_read(value ml_interface,
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
@@ -111,12 +108,11 @@ CAMLprim value ml_interface_write(value ml_interface,
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
@@ -166,7 +162,7 @@ exit:
 CAMLprim value ml_interface_set_server_features(value interface, value v)
 {
 	CAMLparam2(interface, v);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 	if (intf == (void*)MAP_FAILED)
 		caml_failwith("Interface closed");
 
@@ -178,7 +174,7 @@ CAMLprim value ml_interface_set_server_features(value interface, value v)
 CAMLprim value ml_interface_get_server_features(value interface)
 {
 	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 
 	CAMLreturn(Val_int (intf->server_features));
 }
@@ -186,7 +182,7 @@ CAMLprim value ml_interface_get_server_features(value interface)
 CAMLprim value ml_interface_close(value interface)
 {
 	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	struct xenstore_domain_interface *intf = Intf_data_val(interface);
 	int i;
 
 	intf->req_cons = intf->req_prod = intf->rsp_cons = intf->rsp_prod = 0;
-- 
2.25.1


