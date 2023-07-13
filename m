Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC861751B8E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 10:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563009.879867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJriJ-0003dL-86; Thu, 13 Jul 2023 08:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563009.879867; Thu, 13 Jul 2023 08:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJriJ-0003aH-51; Thu, 13 Jul 2023 08:30:15 +0000
Received: by outflank-mailman (input) for mailman id 563009;
 Thu, 13 Jul 2023 08:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tZN=C7=citrix.com=prvs=5513f61bf=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1qJriH-0003a9-TD
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 08:30:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a541ae0-2157-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 10:30:11 +0200 (CEST)
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
X-Inumbo-ID: 7a541ae0-2157-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689237011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w4ON7zZmWZRE/nTYJfzNVlT9Rgni4/BHAnPQvc1KIVU=;
  b=VhGSokWxXZwKe/txKpxiZIjJjZ6ieoUWjfqidBoJMkCBSD+WoWLzvZpD
   47KsFz2k1XQu7JZBbntyRdCmaKugL4Mr+f+Lc008/tqqRVbkiTQjve1vO
   y5TKXWvXAFQFBmUZ/+gXSD08ur4O14QGXkjEhqJpWSA1ub3PZSohrZjVb
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115947715
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:lSaW2axEw9BaG/jMFLB6t+dIxirEfRIJ4+MujC+fZmUNrF6WrkVRn
 zYeWjyAPa3bamD1LogjaI3n9h4EuMSBm4QwSAdrpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKsT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUNk6
 sVfOTQ8VymOleKvm+ifROtzr9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+limf+dXtEr0iSpoI84nTJzRw327/oWDbQUoXTGJQJwRnB+
 woq+UzVHTwBDuWm1QCO80/zvMGXj3n1d9krQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasshcCVvJKHuY96QXLzbDbiy6GAkAUQzgHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aGwIKFCgTYR49dAYX48C4+qU9jA3mUYM2eEKqteEZCQ0c0
 hjT8nhv3uVI0pJSv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RfHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Pf4uM9zhVJxyk/WI+THZuhf8N4omX3SMXFXfoHEGibC4gggBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eZD+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9404BCbKuO3WPrNZ7wJJjBSFTOK0aYvd/LoarSjeK0kl9YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:xWuqn6gXqGKvqHfo6FGd7NB9nnBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKF+Vzd8kXFndK1vp
 0QEZSWZueRMbEAt7ec3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: 9a23:JzAm5WDf075QReT6EwtN63dTC8QUS0TQ3nfJeBWcB2R2YaLAHA==
X-Talos-MUID: 9a23:b5rwtQTQIcue4ok3RXTAmxx5Dv5R/56lCX1Sq7teqZOKGndJbmI=
X-IronPort-AV: E=Sophos;i="6.01,202,1684814400"; 
   d="scan'208";a="115947715"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xenctrl_stubs.c: fix NULL dereference
Date: Thu, 13 Jul 2023 09:30:01 +0100
Message-ID: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

`Tag_cons` is `0` and is meant to be used as the tag argument for `caml_alloc`/`caml_alloc_small`
when constructing a non-empty list.
The empty list is `Val_emptylist` instead (which is really just `Val_int(0)`).

Assigning `0` to a list value like this is equivalent to assigning the naked pointer `NULL` to the field.
Naked pointers are not valid in OCaml 5, however even in OCaml <5.x any attempt to iterate on the list will lead to a segfault.

The list currently only has an opaque type, so no code would have reason to iterate on it currently,
but we shouldn't construct invalid OCaml values that might lead to a crash when exploring the type.

`Val_emptylist` is available since OCaml 3.01 as a constant.

Fixes: e5ac68a011 ("x86/hvm: Revert per-domain APIC acceleration support")

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index e4d9070f2d..3703f48c74 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -832,7 +832,7 @@ CAMLprim value physinfo_arch_caps(const xc_physinfo_t *info)
 
 	tag = 1; /* tag x86 */
 
-	arch_obj = Tag_cons;
+	arch_obj = Val_emptylist;
 
 #endif
 
-- 
2.41.0


