Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B699037AE43
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125966.237160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWzE-0001ic-SP; Tue, 11 May 2021 18:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125966.237160; Tue, 11 May 2021 18:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWzE-0001e4-OC; Tue, 11 May 2021 18:20:04 +0000
Received: by outflank-mailman (input) for mailman id 125966;
 Tue, 11 May 2021 18:20:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWzC-0007g6-Gc
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:20:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5946d18-6347-4a01-b85a-ef69397626d8;
 Tue, 11 May 2021 18:19:52 +0000 (UTC)
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
X-Inumbo-ID: f5946d18-6347-4a01-b85a-ef69397626d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J+9ZxhITGKoBgE2ifCsItTortedaZyt2nhMpStVL/so=;
  b=XJSfpc+dTIt6Q38wUp8db9vi/yMt1O/ebOIm0kqVeL0XyGdYI764Fsjh
   ZbkBMWwJhD0u87sto/loF8PF7rEdLgfN4iffGJHiHHoawUukEF1jWg/VO
   BkaBcKomDqjxQ7c0WolHh70un31yFtwbyggMUth5Xk01n2Iqq8vvzFPWs
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eok2EWv+dnswMwHUxdnkS/1jaZMiXDFa8autCFiLG+96j29z7lRLvcNsXNXK8AE9HMbjLmZ4z4
 wVpschl9SdLGmR0x9xpadQRjzhhqdMkTiqRRhcRrBmKoZTH9+EAShUW39qicA0CCB+MkreIDvG
 /ruM/TdhMJMeTJ4+0Y0EzGZtncOYzvvTFqSF1CDUpXnlkonquSzBgM2af8+NC5Ea7NRQk2cjEj
 t5EqGT6OdFNIVB7p62PqYuJrPT54JfDRbRjksqBm1dnActV1vMsNtrn0oeYWINvUt3LGJKb2a3
 D1Q=
X-SBRS: 5.1
X-MesageID: 43562374
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IGpwuaylIAVs6EAzT9IgKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43562374"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 11/17] tools/ocaml/libs/mmap: Expose stub_mmap_alloc
Date: Tue, 11 May 2021 19:05:24 +0100
Message-ID: <ef983bbf2cf5cea6fa45da82ace330a50ab26a8e.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This also handles mmap errors better by using the `uerror` helper
to raise a proper exception using `errno`.

Changed type of `len` from `int` to `size_t`: at construction time we
ensure the length is >= 0, so we can reflect this by using an unsigned
type. The type is unsigned at the C API level, and a negative integer
would just get translated to a very large unsigned number otherwise.

mmap also takes off_t and size_t, so using int64 would be more generic
here, however we only ever use this interface to map rings, so keeping
the `int` sizes is fine.
OCaml itself only uses `ints` for mapping bigarrays, and int64 for just
the offset.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/mmap_stubs.h    |  4 +++-
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 31 +++++++++++++++++----------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h b/tools/ocaml/libs/mmap/mmap_stubs.h
index 816ba6a724..3352594e38 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -27,7 +27,7 @@
 struct mmap_interface
 {
 	void *addr;
-	int len;
+	size_t len;
 };
 
 #ifndef Data_abstract_val
@@ -37,4 +37,6 @@ struct mmap_interface
 #define Intf_val(a) ((struct mmap_interface *) Data_abstract_val(a))
 #define Intf_data_val(a) (Intf_val(a)->addr)
 
+value stub_mmap_alloc(void *addr, size_t len);
+
 #endif
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index 4d09c5a6e6..d7a97c76f5 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -27,16 +27,18 @@
 #include <caml/custom.h>
 #include <caml/fail.h>
 #include <caml/callback.h>
+#include <caml/unixsupport.h>
 
 #define Wsize_bsize_round(n) (Wsize_bsize( (n) + sizeof(value) - 1 ))
 
-static int mmap_interface_init(struct mmap_interface *intf,
-                               int fd, int pflag, int mflag,
-                               int len, int offset)
+value stub_mmap_alloc(void *addr, size_t len)
 {
-	intf->len = len;
-	intf->addr = mmap(NULL, len, pflag, mflag, fd, offset);
-	return (intf->addr == MAP_FAILED) ? errno : 0;
+	CAMLparam0();
+	CAMLlocal1(result);
+	result = caml_alloc(Wsize_bsize_round(sizeof(struct mmap_interface)), Abstract_tag);
+	Intf_val(result)->addr = addr;
+	Intf_val(result)->len = len;
+	CAMLreturn(result);
 }
 
 CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
@@ -45,6 +47,8 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 	CAMLparam5(fd, pflag, mflag, len, offset);
 	CAMLlocal1(result);
 	int c_pflag, c_mflag;
+	void* addr;
+	size_t length;
 
 	switch (Int_val(pflag)) {
 	case 0: c_pflag = PROT_READ; break;
@@ -59,12 +63,17 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 	default: caml_invalid_argument("maptype");
 	}
 
-	result = caml_alloc(Wsize_bsize_round(sizeof(struct mmap_interface)), Abstract_tag);
+	if (Int_val(len) < 0)
+		caml_invalid_argument("negative size");
+	if (Int_val(offset) < 0)
+		caml_invalid_argument("negative offset");
+	length = Int_val(len);
 
-	if (mmap_interface_init(Intf_val(result), Int_val(fd),
-	                        c_pflag, c_mflag,
-	                        Int_val(len), Int_val(offset)))
-		caml_failwith("mmap");
+	addr = mmap(NULL, length, c_pflag, c_mflag, Int_val(fd), Int_val(offset));
+	if (MAP_FAILED == addr)
+		uerror("mmap", Nothing);
+
+	result = stub_mmap_alloc(addr, length);
 	CAMLreturn(result);
 }
 
-- 
2.25.1


