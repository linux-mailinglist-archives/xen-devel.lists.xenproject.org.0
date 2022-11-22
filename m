Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B4634006
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447228.703254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5F-0001Q0-BQ; Tue, 22 Nov 2022 15:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447228.703254; Tue, 22 Nov 2022 15:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5F-0001Fk-1V; Tue, 22 Nov 2022 15:21:13 +0000
Received: by outflank-mailman (input) for mailman id 447228;
 Tue, 22 Nov 2022 15:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV5D-0000Pt-Hj
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4975d2f2-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:07 +0100 (CET)
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
X-Inumbo-ID: 4975d2f2-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ftaqE+uJKqGeClk6offLXZjZa6ryJgP18AvrDuvBHds=;
  b=g2fmZ/SMKNZI3AztpnsMDKDOsT0r7X331qoTTfFC9ESLV5sZcFx/pPQB
   r81fkaZtpb+DnJwnRIqGoKnNn1FqcghxcsxWd1KD0JlLuwlOgc1cSxuby
   TsAs0mknAQoppXI7RQhhqIQBvHTxXsZvxGFIHYrr/3IbRsKJlfvayUWqf
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84920460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4ifm4KNFDFveuKrvrR33l8FynXyQoLVcMsEvi/4bfWQNrUpxhWMBn
 DBJXDrSPveCMDf8KYt+atm+/ExSv8eHmN5mHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AZmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rsmPnNP8
 /EfFD4ESRW5lrrn5ryHVPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KoDbH50JwB7wS
 mTu3VvZWxAlF96k4yeV2Wuyp/bszR7+YddHfFG/3qEz2wDCroAJMzUaXEW2ieO0gUm/X5RYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BWG1QoryTRHWh+L6zqAmjYXkzI1McenpRJeca2OUPsL3fnzqWEIgySP7u14ykcd3j6
 2vU9XZj3t3/meZOjvzmpg6f3lpAs7CTFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdwTXGo3h5Jnzu5643MT02DaC3/AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51IJucINYyH0M/Afj2eN5yMClPiIKDgYfqqMMoomjmZZKWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf0P8dd3Ls9DuYIWKtcWnz6PFcuilk7/uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 L6z6+PiJ81jbdDD
IronPort-HdrOrdr: A9a23:YXERXaPQhTruqcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="84920460"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 1/8] tools/oxenstored: Fix incorrect scope after an if statement
Date: Tue, 22 Nov 2022 15:20:36 +0000
Message-ID: <20221122152043.8518-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A debug statement got inserted into a single-expression if statement.

Insert brackets to give the intended meaning, rather than the actual meaning
where the "let con = Connections..." is outside and executed unconditionally.

This results in some unnecessary ring checks for domains which otherwise have
IO credit.

Fixes: 42f0581a91d4 ("tools/oxenstored: Implement live update for socket connections")
Reported-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/xenstored/xenstored.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index ffd43a4eee64..c5dc7a28d082 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -475,7 +475,7 @@ let _ =
 
 	let ring_scan_checker dom =
 		(* no need to scan domains already marked as for processing *)
-		if not (Domain.get_io_credit dom > 0) then
+		if not (Domain.get_io_credit dom > 0) then (
 			debug "Looking up domid %d" (Domain.get_id dom);
 			let con = Connections.find_domain cons (Domain.get_id dom) in
 			if not (Connection.has_more_work con) then (
@@ -490,7 +490,8 @@ let _ =
 					let n = 32 + 2 * (Domains.number domains) in
 					info "found lazy domain %d, credit %d" (Domain.get_id dom) n;
 					Domain.set_io_credit ~n dom
-			) in
+			)
+		) in
 
 	let last_stat_time = ref 0. in
 	let last_scan_time = ref 0. in
-- 
2.11.0


