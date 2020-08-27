Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFABB254C49
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpN-0005Ek-7e; Thu, 27 Aug 2020 17:36:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpK-00056c-WD
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:43 +0000
X-Inumbo-ID: 563efaa2-08c3-4d94-bfc5-4c72bbfecd22
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 563efaa2-08c3-4d94-bfc5-4c72bbfecd22;
 Thu, 27 Aug 2020 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHtz8SI3DK32t3n20Jh2fkPiCC9AQrSqzwoeDRcCDxg=;
 b=OhMd4UvNDmiTHreY9vzL42ZUaQr3IP83FKKe16bweLWWdk2L7DMxphCe
 lsB9AW6K68tDVyR+C936gVvb6Z8wl8xynbu5xZKBg9lNvFiHFPJt5ZO/b
 qpolvm3R1RuMrMl87ZB7cIAnR3E0N56eeCgMHSy/Niw6OfrQOAUWZqQ7h 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: C0S0RLJgF8B17AKpgUdpO56kOJ8g4LkusOgkQAqwFnhe0GXIVL6B+VqOASkoNs6XAenp1CyFzh
 IlJYZNHdZFGzvlnU26cz+zgbdnD/sQMQLYPK5awd0/uEI3IrpjgpFlSJwf02QoMSl5aaVvUEEQ
 lkdMFhy7T1QhYl5dUJpwWp1TT+I0Bbgy+CMOfH7FYS+F//6rZ6og/EVWIM+4KN3VNmNYFlBfWd
 rJ5wYLkvappcfgC8d3ZJ22QxWfRGbjNpSgioxUJ3X4wJuCr8nHTMLwSWMA7OhMXreqywLwafqf
 djk=
X-SBRS: 2.7
X-MesageID: 25595289
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25595289"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 3/9] tools/ocaml/libs/mmap: Expose stub_mmap_alloc
Date: Thu, 27 Aug 2020 18:35:54 +0100
Message-ID: <3b9add7e69d48e99ea5349169f6e45ef1d802c0e.1598548832.git.edvin.torok@citrix.com>
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
index 4d09c5a6e6..9c1126c6a2 100644
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
+	addr = mmap(NULL, length, c_pflag, c_mflag, fd, Int_val(offset));
+	if (MAP_FAILED == addr)
+		uerror("mmap", Nothing);
+
+	result = stub_mmap_alloc(addr, length);
 	CAMLreturn(result);
 }
 
-- 
2.25.1


