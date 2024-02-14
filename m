Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBFD854DAB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681056.1059630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmq-0001KM-BU; Wed, 14 Feb 2024 16:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681056.1059630; Wed, 14 Feb 2024 16:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmq-0001Ho-7P; Wed, 14 Feb 2024 16:07:04 +0000
Received: by outflank-mailman (input) for mailman id 681056;
 Wed, 14 Feb 2024 16:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNvu=JX=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1raHmo-0000fn-Up
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:07:02 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 163d58a9-cb53-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:07:01 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 17:07:00 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 14 Feb 2024 17:07:00 +0100
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
X-Inumbo-ID: 163d58a9-cb53-11ee-8a4d-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 2/2] xen/drivers: imx-lpuart: Replace iMX8QM compatible
 with iMX8QXP
Thread-Topic: [PATCH v2 2/2] xen/drivers: imx-lpuart: Replace iMX8QM
 compatible with iMX8QXP
Thread-Index: AQHaX1/XC0kFM5mNB0K7IOFYEeejEA==
Date: Wed, 14 Feb 2024 16:06:59 +0000
Message-ID: <20240214160644.3418228-3-john.ernberg@actia.se>
References: <20240214160644.3418228-1-john.ernberg@actia.se>
In-Reply-To: <20240214160644.3418228-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955607464
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

v2:
 - Replace the compatible rather than adding to the list (Julien Grall)
 - Reword commit message to reflect the above.
 - Collect Julien's ack
---
 xen/drivers/char/imx-lpuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 77f70c2719..7a9c2e3878 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -256,7 +256,7 @@ static int __init imx_lpuart_init(struct dt_device_node=
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
2.43.0

