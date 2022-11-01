Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8B61512F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 19:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435180.688320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYL-0007PQ-69; Tue, 01 Nov 2022 17:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435180.688320; Tue, 01 Nov 2022 17:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYL-0007Lq-35; Tue, 01 Nov 2022 17:59:57 +0000
Received: by outflank-mailman (input) for mailman id 435180;
 Tue, 01 Nov 2022 17:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9Gt=3B=citrix.com=prvs=297828b18=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1opvYJ-0007Ki-Nm
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 17:59:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbff9131-5a0e-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 18:59:54 +0100 (CET)
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
X-Inumbo-ID: fbff9131-5a0e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667325593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1BFJHHFskkYwrDc+C5nugZc7KAKVNuo0AeEB6cAz2Ac=;
  b=AKxvz6YnDCOszHd+cJLKs3kTgFtCgnathi9qor3hj+O0VGmjqyrpJq/o
   0Onwfr92DqqYBOmIEl08UAbNT56pe4dE2gjeXqILJjfhtw1/M0zQYH033
   tUdSNauPsNiCrzJQG+dq1ibShfQKlagj6rSF74jQq+7PMy8Gz/9rUuFyq
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83555985
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W9spzqqhDI3c791hhctDyL4LHM1eBmIaZRIvgKrLsJaIsI4StFCzt
 garIBnVPqmCZmT8fd4jOYjj9ksHvZXTmoNrSwA5/i82QXkR8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W5wUmAWP6gR5gaHzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC5VagyTnOOI/KOQa7ZQjM5yL5DPGqpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzBUtlOT47Yw+W/Q5AdwzKLsIJzefdniqcB9zh3F+
 z+XrzmR7hcyM/qdy2CcyG6Wv8jipn76VIwONYaq+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9ZZDeAS8gyGzavQpQGDCQAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9MzcGeT8fTDU58vLC/705hEPMF/JFOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT9FWyzyGskTKuMDirjUWawC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKlDdoHg1PxXBgj2FfK0QfUYXY
 MnzTCpRJSxCVfQPIMSeGo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+V29z
 jqqH5HVo/mpeLGhP3K/HE96BQxiEEXX8rit8JcKKrHYclM4cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:hiF3n62h8t59zmxs1GuCIAqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.95,231,1661832000"; 
   d="scan'208";a="83555985"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <pau.safont@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v1 2/2] xenctrl: use larger chunksize in domain_getinfolist
Date: Tue, 1 Nov 2022 17:59:17 +0000
Message-ID: <b4efb7836d134520912d39f2eda172b29894e05b.1667324874.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667324874.git.edvin.torok@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The support limit of XAPI is 1000, so using 1024 will very likely get
everything in one go.
Other code in Xen also uses chunk sizes of 256 or 1024, and would be
much better than 2, especially now that list construction is more
efficient.

Xenopsd should also use `domain_getinfo` instead of `domain_getinfolist`
in a lot of places where info list is used, but that is another
optimization.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Tested-by: Pau Ruiz Safont <pau.safont@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 3ebedffdc7..a56539ff2c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -237,7 +237,7 @@ let rev_append_fold acc e = List.rev_append e acc
 let rev_concat lst = List.fold_left rev_append_fold [] lst
 
 let domain_getinfolist handle first_domain =
-	let nb = 2 in
+	let nb = 1024 in
 	let rec __getlist lst from =
 		(* _domain_getinfolist returns domains in reverse order, largest first *)
 		match _domain_getinfolist handle from nb with
-- 
2.34.1


