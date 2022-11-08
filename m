Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16238621867
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440119.694180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcb-0001ev-Uy; Tue, 08 Nov 2022 15:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440119.694180; Tue, 08 Nov 2022 15:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcb-0001Zh-QQ; Tue, 08 Nov 2022 15:34:41 +0000
Received: by outflank-mailman (input) for mailman id 440119;
 Tue, 08 Nov 2022 15:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQca-0001RY-IV
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da2c792b-5f7a-11ed-91b5-6bf2151ebd3b;
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
X-Inumbo-ID: da2c792b-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g06Eyz8tqCWbarSPvXlT2vv3bAoXEM2vFz5TwhOXiT8=;
  b=V6rsC8faRbzMWxDU4t08CXyvH+xfOY7TZgrdBaGzP88HjR+SDjBDZm3g
   GVC3gXjiy96p/coA4+sIIx2YTdk2xfo97jT32lYbgV3X6h4BQYTC8ywc6
   ArhZrsgenBrzueWFKFfaBSBw1CtMVbsGBP7/LbH+zV0olfzWVFPgiIvNv
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83477663
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MuhKVqrukL7MHgKzhD7rzePyu/NeBmIUZRIvgKrLsJaIsI4StFCzt
 garIBmAb/uLYjChf4pyYIy+/B4D7cfdmIUxHAE5rig8RS1DpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzylNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABEcfjatmtOT+rnhcuJh3poZLPbVGYxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzBUtlOT47Yw+W/Q5AdwzKLsIJzefdniqcB9zh3E+
 T2YoT+R7hcyM9C25RjC/lWXxerVsC34fqxCP5vo6as/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yyaUAHIVCAFIbtMOvdUzAzct0
 zehk9r3CBR1vbaSSHbb8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5CAb6ToMDEPAv7m
 QiBoXBgvbUss+sEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374105CHx7ZiHCgUpLj2WZWqwXIVDIT4iNaxwtRoMmj1gYXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyhFWfg5lWLuHblNuVPO+szZ7TqNLa0XMjz9iebODJJrYett3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGOmbP+7DkicxAGOHwBg5UGK7HZeVE+SDhJ5j246epJRrGJVp99zo/gl
 kxRkGcCoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:D8IkaqhnYTzWd6p5H/GM+qTIpHBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="83477663"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 03/15] tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper
Date: Tue, 8 Nov 2022 15:33:55 +0000
Message-ID: <6d9e337ef6bfd7540ae5a0d6b4b1b73fd5e84b16.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
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

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Reason for inclusion in 4.17:
- make code follow best practice for upcoming OCaml 5.0 compiler (already in beta)

Changes since v2:
- add Acked-by line
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 2 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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


