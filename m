Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94037AE3D
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125962.237112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz4-0008Jw-5b; Tue, 11 May 2021 18:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125962.237112; Tue, 11 May 2021 18:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz4-0008Hc-0g; Tue, 11 May 2021 18:19:54 +0000
Received: by outflank-mailman (input) for mailman id 125962;
 Tue, 11 May 2021 18:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWz2-0007g6-GI
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:19:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19b3bfa7-5419-49b1-8051-bd5514dfe581;
 Tue, 11 May 2021 18:19:47 +0000 (UTC)
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
X-Inumbo-ID: 19b3bfa7-5419-49b1-8051-bd5514dfe581
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EoaUpYs9b5JtY9mZ1Jy5aNZ4/ohnkMdircO88bxkg44=;
  b=CHcTnBQ+gbXHApTpscebxkhpzBSOUA1WUEEhTnbrMVn8fA7Px6OwgTy6
   CJXlvR4R0vmzePd3hrxiwsEeAN+FVR9TMtNpODlef+6CwGiTvmjdqOpXQ
   0rdtuwvkbZi5XXNHCab4tjr7TPLbNw3eJ6v/5TiOJeZBvhWbQg3qO31J8
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jXvHeAJvDN1mXXdaAWfqlPHHazwViQ0FtFAp5WTIfOpuEqy+a0KF3Ohxx4UIqAk8EUleoTu5tl
 NaRTf4EMlBhS6a9UrEyQLomS4Wry7YRe26ICnZ1n3MP+FaDaqd00tixNEsozcWIN57bePj/hax
 edxjqei4oFFQWlggOIaVjGXhk65Cv4ADXQpot/PjgaArEdGdKc/BdQ0ZoLWxXOTwYyB+AmSWNU
 bA7dWsMaQJtOWZuXtTDd3+JHwpqYGEwrX6TOKyQYRB70rd9+tD6X9LR5T8hwevckaH4hv/jYQa
 a7Y=
X-SBRS: 5.1
X-MesageID: 43562364
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:afEZh6mNz+/LDj4Xj8abPvWYjILpDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Ar5OUtQ4OxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9voSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43562364"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 12/17] tools/ocaml/libs/mmap: mark mmap/munmap as blocking
Date: Tue, 11 May 2021 19:05:25 +0100
Message-ID: <294a60be29027d33b0a1d154b7d576237c7dd420.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These functions can potentially take some time,
so allow other OCaml code to proceed meanwhile (if any).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index d7a97c76f5..e8d2d6add5 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,6 +28,7 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 #include <caml/unixsupport.h>
+#include <caml/signals.h>
 
 #define Wsize_bsize_round(n) (Wsize_bsize( (n) + sizeof(value) - 1 ))
 
@@ -69,7 +70,9 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 		caml_invalid_argument("negative offset");
 	length = Int_val(len);
 
+	caml_enter_blocking_section();
 	addr = mmap(NULL, length, c_pflag, c_mflag, Int_val(fd), Int_val(offset));
+	caml_leave_blocking_section();
 	if (MAP_FAILED == addr)
 		uerror("mmap", Nothing);
 
@@ -80,10 +83,15 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 CAMLprim value stub_mmap_final(value intf)
 {
 	CAMLparam1(intf);
+	struct mmap_interface interface = *Intf_val(intf);
 
-	if (Intf_val(intf)->addr != MAP_FAILED)
-		munmap(Intf_val(intf)->addr, Intf_val(intf)->len);
+	/* mark it as freed, in case munmap below fails, so we don't retry it */
 	Intf_val(intf)->addr = MAP_FAILED;
+	if (interface.addr != MAP_FAILED) {
+		caml_enter_blocking_section();
+		munmap(interface.addr, interface.len);
+		caml_leave_blocking_section();
+	}
 
 	CAMLreturn(Val_unit);
 }
-- 
2.25.1


