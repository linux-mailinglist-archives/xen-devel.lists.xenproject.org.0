Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDFB244FC0
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 00:13:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6hwH-00089S-Ew; Fri, 14 Aug 2020 22:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEIT=BY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k6hwG-000891-Ql
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 22:12:40 +0000
X-Inumbo-ID: edf2a22b-ff50-4a2b-995d-a1c07ad16467
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edf2a22b-ff50-4a2b-995d-a1c07ad16467;
 Fri, 14 Aug 2020 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597443157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YT4HghR0/mQiuB+0ZHbTT8P7/FFGJ4MPWIY1ryiFPUA=;
 b=LHLwtQZLD17xQqjSbeBzxiZcSTcuuUWjOegjl7MuxhyjR7awPjWkhsaV
 fztKWKLoh0vyvZcG3s6uGvCdYQ2k9ci/Ey7uE3CUJlBvRyTYRavf6Bv/5
 hZ8g2/MAo8nZcTRPvL3f15x9QyIaBWGj2Z6ODLJScmSZErmhrBgpUGS+h s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VRvqjG0Z9Mii4Qho8718sZXP81D4c5CkfE7hbkOyWgAzlSlmlT1PvrS9bXzuUa3RLdBPVilUmF
 XqSvTvYm0ejKdlYLNLlttH4vzu+WO/5uBcqARR1edle/G12D4uhks0WxHj0TV9OgZ6atM+7POY
 f/gufhcM35e8/OcAwkVpOrAaHcyIz9oAdfujTOTw3Rrs/RnG+0F90xRPAcUvKCHiNO9aJpjvhK
 tAVZXS7YN2nzVLmD6FnrPEIUQPwa7Z0t/OY3x2CVHVrzLkcbEYharJIyhclc5eJOXQPsfrAxE+
 Q+k=
X-SBRS: 2.7
X-MesageID: 24917746
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24917746"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 2/6] tools/ocaml/xenstored: fix deprecation warning
Date: Fri, 14 Aug 2020 23:11:42 +0100
Message-ID: <dd8321997216f505002e589db062b0cd05b9f124.1597442238.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597442238.git.edvin.torok@citrix.com>
References: <cover.1597442238.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FTLPEX02CAS02.citrite.net (10.13.99.123) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

```
File "xenstored/disk.ml", line 33, characters 9-23:
33 | 	let c = Char.lowercase c in
              ^^^^^^^^^^^^^^
(alert deprecated): Stdlib.Char.lowercase
Use Char.lowercase_ascii instead.
```

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/disk.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 4739967b61..1ca0e2a95e 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -30,7 +30,7 @@ let undec c =
 	| _          -> raise (Failure "undecify")
 
 let unhex c =
-	let c = Char.lowercase c in
+	let c = Char.lowercase_ascii c in
 	match c with
 	| '0' .. '9' -> (Char.code c) - (Char.code '0')
 	| 'a' .. 'f' -> (Char.code c) - (Char.code 'a') + 10
-- 
2.25.1


