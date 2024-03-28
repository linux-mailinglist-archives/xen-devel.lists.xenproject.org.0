Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8089053C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699122.1091716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshj-0005OU-HZ; Thu, 28 Mar 2024 16:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699122.1091716; Thu, 28 Mar 2024 16:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshj-0005Mp-Dj; Thu, 28 Mar 2024 16:34:15 +0000
Received: by outflank-mailman (input) for mailman id 699122;
 Thu, 28 Mar 2024 16:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOaz=LC=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rpshh-0004sj-Df
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:34:13 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c374dd-ed21-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:34:11 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Mar
 2024 17:34:08 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Thu, 28 Mar 2024 17:34:08 +0100
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
X-Inumbo-ID: 01c374dd-ed21-11ee-a1ef-f123f15fe8a2
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
Subject: [PATCH v3 2/3] xen/drivers: imx-lpuart: Replace iMX8QM compatible
 with iMX8QXP
Thread-Topic: [PATCH v3 2/3] xen/drivers: imx-lpuart: Replace iMX8QM
 compatible with iMX8QXP
Thread-Index: AQHagS3BJCg2KK7t2Uy8sRQfsSm0XQ==
Date: Thu, 28 Mar 2024 16:34:08 +0000
Message-ID: <20240328163351.64808-3-john.ernberg@actia.se>
References: <20240328163351.64808-1-john.ernberg@actia.se>
In-Reply-To: <20240328163351.64808-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D729556C7D66
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
index 522680a25c..9d0e0871f7 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -255,7 +255,7 @@ static int __init imx_lpuart_init(struct dt_device_node=
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

