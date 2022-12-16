Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC364F0ED
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464887.723463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP7-00081i-1d; Fri, 16 Dec 2022 18:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464887.723463; Fri, 16 Dec 2022 18:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP6-0007z3-Tz; Fri, 16 Dec 2022 18:25:52 +0000
Received: by outflank-mailman (input) for mailman id 464887;
 Fri, 16 Dec 2022 18:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP5-0006tv-SB
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fdb66a4-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:25:50 +0100 (CET)
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
X-Inumbo-ID: 0fdb66a4-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qiRt7qXMDUW2Lh6zGZ8vuFNvacsvAkkokWySMsWC7A=;
  b=MlXIkRtkk+HlJBqMHfcKJuu2PQME9AXGK/KQUXEi0im9swv3LYI2Gxm2
   aMasSZ3SJYpxiLDwYGmef7uKXcIbmfzFFmSETvBqnbF8mK3M/9/5B9rIx
   DC9mgyGBt1TbrL02RSiuiwQNuzY0T9mbX964C+7ULoKBTUiDYeTca3XuJ
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88310837
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qwA7UqkziJDBIjBuiCGJES3o5gyPJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYUTvSO6vbZGfye41xaN7g9BsF6JDVzIRqGVFl+X89ESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ecZaw4yYzacvbqZzKO+aeNRupx5Dta+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnTzbTxe7k6Sv600y2PS0BZwwP7mN9+9ltmiFZUOxx7I/
 T2uE2LRKUFKG+CkzHm823eJn+rkhn2ge65JC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhIVRdd4CeAx7wCJjK3O7G6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aIilWE1APQzA+FSQJ8tzAqrwP1kjtUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3271k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRO8ErJVbWrHkyOyZ8OlwBd2B1wckC1
 WqzK57wXR7294w5pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29EN843K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe95QGK7Pff1Q5SAnMyZb5mNscRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:Jks78aN+eyJ06MBcTiajsMiBIKoaSvp037B87TEWdfU1SKOlfq
 WV9sjzuiWZtN98YgBapTnEAtj5fZq+z/BICOsqTNCftVLdyQmVxehZhOPfKn/bak7DH4hmpM
 JdmsNFeaTN5DZB4PrS0U2RDtNl+MWK7KyJqI7lvg1QZDAvQ7xk5x1iCg6dVml/RAwDIZYiDp
 KT6o5mqlObGEg/X4CSG3wMRfLCr9qOsJrnZFo6HBYh8gGFkDOv7/rbHnGjviv3XVt0sNMfGD
 j++DDE2g==
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88310837"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 01/11] tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper
Date: Fri, 16 Dec 2022 18:25:10 +0000
Message-ID: <4eb53994bcc3548e8da6e8ab9c50acf822b85702.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is not strictly necessary since it is essentially a no-op
currently: a cast to void* and value*, even in OCaml 5.0.

However it does make it clearer that what we have here is not a regular
OCaml value, but one allocated with Abstract_tag or Custom_tag,
and follows the example from the manual more closely:
https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head

It also makes it clearer that these modules have been reviewed for
compat with OCaml 5.0.

We cannot use OCaml finalizers here, because we want control over when to unmap
these pages from remote domains.
A follow-up commit will add use-after-free detection instead.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Reason for inclusion in 4.17:
- make code follow best practice for upcoming OCaml 5.0 compiler (already in beta)

Changes since v2:
- add Acked-by line

Changes since v3:
- mention that use-after-free is fixed in another commit, and we cannot use
  finalizers here
---
 tools/ocaml/libs/mmap/mmap_stubs.h    | 4 ++++
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 2 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h b/tools/ocaml/libs/mmap/mmap_stubs.h
index 65e4239890..66f18d4406 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -30,4 +30,8 @@ struct mmap_interface
 	int len;
 };
 
+#ifndef Data_abstract_val
+#define Data_abstract_val(x) ((void*)(value*)(x))
+#endif
+
 #endif
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index e2ce088e25..141dedb78c 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,7 +28,7 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
-#define Intf_val(a) ((struct mmap_interface *) a)
+#define Intf_val(a) ((struct mmap_interface *) Data_abstract_val(a))
 
 static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 7a91fdee75..cc9114029f 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -35,7 +35,7 @@
 #include <sys/mman.h>
 #include "mmap_stubs.h"
 
-#define GET_C_STRUCT(a) ((struct mmap_interface *) a)
+#define GET_C_STRUCT(a) ((struct mmap_interface *) Data_abstract_val(a))
 
 /*
  * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
-- 
2.34.1


