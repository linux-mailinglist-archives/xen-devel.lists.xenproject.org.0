Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176A60718E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 10:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427397.676408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmwd-0000ET-Pr; Fri, 21 Oct 2022 07:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427397.676408; Fri, 21 Oct 2022 07:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmwd-0000BH-MY; Fri, 21 Oct 2022 07:59:55 +0000
Received: by outflank-mailman (input) for mailman id 427397;
 Fri, 21 Oct 2022 07:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRpv=2W=citrix.com=prvs=286e1060a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1olmwc-0000B0-EA
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 07:59:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5766a2a3-5116-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 09:59:53 +0200 (CEST)
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
X-Inumbo-ID: 5766a2a3-5116-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666339193;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JuPSkEVXaJjMkq42I+yC8YUIvudAydl1dIqUndfnzLU=;
  b=Y8ip/oW9LLOcMI+G5enK1Vqodceeg1V+uTRcKT+IGELr4uVkN4h/F45Y
   0HqOKyksmdS4kcqguWiZmlJIUcFRCBKxTEPf3x7pUFecZma0wov1ZAzfp
   5zlC5+3bJ3rUOP96xNEuyxpjXKLm75v/1ZfMHpvjIgucc17F9BEFRxNsw
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83214158
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VfVbwa2KyFaG8jTI9PbD5d9xkn2cJEfYwER7XKvMYLTBsI5bp2AHn
 2BJUWqOPv2LNjOgcoh2OY3goBwGupCGnNM3GQs+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlB5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUZ5MttH2diz
 sBfB2tWQRGDuKH10umkH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8aBIw/mqG0gWP4cBVTqU6PpLpx6G/WpOB0+Oi2aoOJI4HaLSlTtn6Wt
 kf3/FjePgATDPrAlwrV2XiswdaayEsXX6pNTeblp5aGmma75mEVEgxQalK9rtGwkEv4UNVaQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt9L3KCZxtpGudTWyrey7rDONemsHdnBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1XR9lFBN7falUwZGKD+bF4qFxBHFbzFb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510k/a6TYi/BqmPNoomjn1NmOmvpnoGiam4hjqFraTRuftnZ
 cfznTiEUR729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQPmRrlgsMu5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSdiXs2r9pwOK4Zu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:fnInNqE30+vEZuKppLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208";a="83214158"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.17 v2] tools/ocaml/xenstored: fix live update exception
Date: Fri, 21 Oct 2022 08:59:25 +0100
Message-ID: <4a89f1f44cb171e1f92dae2401a580a10fd0c5a0.1666339129.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

During live update we will load the /tool/xenstored path from the previous binary,
and then try to mkdir /tool again which will fail with EEXIST.
Check for existence of the path before creating it.

The write call to /tool/xenstored should not need any changes
(and we do want to overwrite any previous path, in case it changed).

Prior to 7110192b1df6 live update would work only if the binary path was
specified, and with 7110192b1df6 and this live update also works when
no binary path is specified in `xenstore-control live-update`.

Fixes: 7110192b1df6 ("tools/oxenstored: Fix Oxenstored Live Update")
Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
 tools/ocaml/xenstored/xenstored.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index fc90fcdeb5..acc7290627 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -353,7 +353,9 @@ let _ =
 	) in
 
 	(* required for xenstore-control to detect availability of live-update *)
-	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string "/tool");
+	let tool_path = Store.Path.of_string "/tool" in
+	if not (Store.path_exists store tool_path) then
+		Store.mkdir store Perms.Connection.full_rights tool_path;
 	Store.write store Perms.Connection.full_rights
 		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
 

base-commit: 0c06760be3dc3f286015e18c4b1d1694e55da026
-- 
2.34.1


