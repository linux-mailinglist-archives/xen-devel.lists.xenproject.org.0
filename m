Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FF2F88E4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68727.123143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxU-0001ox-TT; Fri, 15 Jan 2021 22:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68727.123143; Fri, 15 Jan 2021 22:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxU-0001o4-OP; Fri, 15 Jan 2021 22:52:44 +0000
Received: by outflank-mailman (input) for mailman id 68727;
 Fri, 15 Jan 2021 22:52:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxS-0001Wj-VC
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce39791c-cde2-44e2-bddc-f6b8853784ee;
 Fri, 15 Jan 2021 22:52:31 +0000 (UTC)
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
X-Inumbo-ID: ce39791c-cde2-44e2-bddc-f6b8853784ee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yOHeqFGiMe4hZS6YwMQMyCOdiJ0wM3c0HqxPstrpIhc=;
  b=ChfqWcI3+UBe+xsqzxLXcI3S9YDZ2SUz6+sd+Um9bpqjjBZUr+xiR2h3
   B5yrZgiTB8O/acoXVw5HvEoVnwFgwbupeQ/stb89hixecPc5vsaxVa7HQ
   LPVZA+2y3qh+PKs5fc8fsEisL0iTqCoCchhmHU4nC6oYEpl9hvItrne7Q
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 38anpzmgEYm8RC8Iis3iaGr6eVYc2bd8LxVkaIVgGeoD/pNFjIQR4yS69KRxzhioTeAC5+4gS/
 Hj5zYoImDN9l6+1npPaVAYxtu04FVAcHGByMckRUTwSNzpdyrxz6t80SAe30pofSha9SFCcyKE
 0jtzlsBrDbgeQ0nNPxJPXL+/3qWXp2T78oxyk4rNY95oTIY+Oi56b1fAEEpr7kEAh6U1zyZLUu
 ubLKDYmSOENgXHcdi/E3AoUasW9oest8gKslDov1b9nDZwZ0L4V5ALvVPnn2zRpVyNqUuIZ9d0
 +pU=
X-SBRS: 5.1
X-MesageID: 35435267
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35435267"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/4] tools/ocaml/libs/xb: do not crash after xenbus is unmapped
Date: Fri, 15 Jan 2021 22:29:06 +0000
Message-ID: <0af9839d3a8f27421b4c8f1220f9a2165d815ac2.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xenmmap.unmap sets the address to MAP_FAILED in xenmmap_stubs.c.
If due to a bug there were still references to the Xenbus and we attempt
to use it then we crash.
Raise an exception instead of crashing.

(My initial version of fuzz testing had such a bug)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xb/xs_ring_stubs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 7537a23949..7a91fdee75 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -32,6 +32,7 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
+#include <sys/mman.h>
 #include "mmap_stubs.h"
 
 #define GET_C_STRUCT(a) ((struct mmap_interface *) a)
@@ -166,6 +167,8 @@ CAMLprim value ml_interface_set_server_features(value interface, value v)
 {
 	CAMLparam2(interface, v);
 	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+	if (intf == (void*)MAP_FAILED)
+		caml_failwith("Interface closed");
 
 	intf->server_features = Int_val(v);
 
-- 
2.29.2


