Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72A89C967
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 18:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702011.1096712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtraw-0001s5-3Y; Mon, 08 Apr 2024 16:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702011.1096712; Mon, 08 Apr 2024 16:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtrav-0001nM-W9; Mon, 08 Apr 2024 16:11:41 +0000
Received: by outflank-mailman (input) for mailman id 702011;
 Mon, 08 Apr 2024 16:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUGe=LN=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rtrau-0001de-6X
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 16:11:40 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad6ee2ac-f5c2-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 18:11:37 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 8 Apr
 2024 18:11:35 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Mon, 8 Apr 2024 18:11:35 +0200
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
X-Inumbo-ID: ad6ee2ac-f5c2-11ee-b7f7-5d6b493b22b9
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/3] xen/drivers: imx-lpuart: Replace iMX8QM compatible
 with iMX8QXP
Thread-Topic: [PATCH v4 2/3] xen/drivers: imx-lpuart: Replace iMX8QM
 compatible with iMX8QXP
Thread-Index: AQHaic9t9NatChHdRkuf/zCq/htzEg==
Date: Mon, 8 Apr 2024 16:11:35 +0000
Message-ID: <20240408161129.900347-3-john.ernberg@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
In-Reply-To: <20240408161129.900347-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72954657C6A
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Allow the uart to probe also with iMX8QXP. The ip-block is the same as in
the QM.

Since the fsl,imx8qm-lpuart compatible in Linux exists in name only and is
not used in the driver any iMX8QM device tree that can boot Linux must set
fsl,imx8qxp-lpuart compatible as well as the QM one.

Thus we replace the compatible rather than adding just another one.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
Acked-by: Julien Grall <jgrall@amazon.com>

---

v4:
 - no changes

v3:
 - no changes

v2:
 - Replace the compatible rather than adding to the list (Julien Grall)
 - Reword commit message to reflect the above.
 - Collect Julien's ack
---
 xen/drivers/char/imx-lpuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 7770d158bf..cf034d7ed0 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -236,7 +236,7 @@ static int __init imx_lpuart_init(struct dt_device_node=
 *dev,
=20
 static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =3D
 {
-    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
+    DT_MATCH_COMPATIBLE("fsl,imx8qxp-lpuart"),
     { /* sentinel */ },
 };
=20
--=20
2.44.0

