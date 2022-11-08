Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853F621865
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440125.694249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcn-0003Xk-9P; Tue, 08 Nov 2022 15:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440125.694249; Tue, 08 Nov 2022 15:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQcn-0003TY-51; Tue, 08 Nov 2022 15:34:53 +0000
Received: by outflank-mailman (input) for mailman id 440125;
 Tue, 08 Nov 2022 15:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcl-0003Q1-Gs
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a8562e-5f7a-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 16:34:49 +0100 (CET)
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
X-Inumbo-ID: e0a8562e-5f7a-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MEdqPuuz28JG9GUY0dslF3e+ZAUQoxJNc/yTLkjgR6E=;
  b=Rfne7eT985xPq10+c1Qb7a3QG19ihq9dOcXIFChprs6W5jgvv8ljqePs
   TLAqbi54kvfgxJBQAMew6zVTYLPNVwW95AEWg0rOX4clrrOpg7+DMZ5vV
   EYBi5zV/3T1voRSwmyumoim4IUrad/bEPV9PybeIPo+0/2PPtju3cVyMs
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84398280
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vKRODK1dnOG9ENnkuPbD5d9xkn2cJEfYwER7XKvMYLTBsI5bpz0Bz
 TFMXjyBa/3ZYjP9fY8iOt+woEsHu8XUy9YyHVRvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWzpM/
 uUfCGk3SR252O+3/aCcd/JIr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWkeu2h3+5bzpCr1G9rqsr+WnDigd21dABNfKFJofbFZ8Fxi50o
 Erm2nrDBjghEOCTiiOK6lj0q9XWxyP0Ddd6+LqQqacx3Qz7KnYoIBEfS1aTu/SyjU+6HdVFJ
 CQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iNtojBnWSfY6Kom4tIL4GAzi5
 A2RiAFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJ1cFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwIlpn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 8jLLZj1VS5AV/QPIN+KqwA1iOFD+8zD7TmLGcCTI+qPjdJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQA/CwGJmbMuwacidClmWsqt8JQHL4Zu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:KH2ZaqiFfTwXU2d031bvkwKXM3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84398280"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix build error
Date: Tue, 8 Nov 2022 15:34:01 +0000
Message-ID: <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Building with Dune in release mode fails with:
```
File "ocaml/xenstored/store.ml", line 464, characters 13-32:
Warning 18: this type-based record disambiguation is not principal.
File "ocaml/xenstored/store.ml", line 1:
Error: Some fatal warnings were triggered (1 occurrences)
```

This is a warning to help keep the code futureproof, quoting from its
documentation:
> Check information path during type-checking, to make sure that all types are
> derived in a principal way. When using labelled arguments and/or polymorphic
> methods, this flag is required to ensure future versions of the compiler will
> be able to infer types correctly, even if internal algorithms change. All
> programs accepted in -principal mode are also accepted in the default mode with
> equivalent types, but different binary signatures, and this may slow down type
> checking; yet it is a good idea to use it once before publishing source code.

Fixes: db471408edd46 "tools/ocaml/xenstored: Fix quota bypass on domain shutdown"

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- fixes a build error in a previous commit that is already in master

Changes since v2:
- new in v3
---
 tools/ocaml/xenstored/store.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 14ec404988..38a4945372 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -461,7 +461,7 @@ let reset_permissions store domid =
       | Some perms ->
         if perms <> node.perms then
           Logging.debug "store|node" "Changed permissions for node %s" (Node.get_name node);
-        Some { node with perms }
+        Some { node with Node.perms }
     ) store.root
 
 type ops = {
-- 
2.34.1


