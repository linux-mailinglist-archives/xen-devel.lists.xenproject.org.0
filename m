Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A234A843ED2
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673958.1048571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Z-0007nd-2R; Wed, 31 Jan 2024 11:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673958.1048571; Wed, 31 Jan 2024 11:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Y-0007h2-Uk; Wed, 31 Jan 2024 11:51:12 +0000
Received: by outflank-mailman (input) for mailman id 673958;
 Wed, 31 Jan 2024 11:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aY=JJ=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rV96m-0007Xr-A9
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:50:24 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea699cf4-c02e-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:50:22 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 12:50:20 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 31 Jan 2024 12:50:20 +0100
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
X-Inumbo-ID: ea699cf4-c02e-11ee-98f5-efadbce2ee36
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "John
 Ernberg" <john.ernberg@actia.se>
Subject: [PATCH 2/2] xen/drivers: imx-lpuart: Add iMX8QXP compatible
Thread-Topic: [PATCH 2/2] xen/drivers: imx-lpuart: Add iMX8QXP compatible
Thread-Index: AQHaVDuqVZ6MA3Rd4EaFO4eTM5QUaw==
Date: Wed, 31 Jan 2024 11:50:20 +0000
Message-ID: <20240131114952.305805-3-john.ernberg@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
In-Reply-To: <20240131114952.305805-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955667360
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Allow the uart to probe also with iMX8QXP. The ip-block is the same as in t=
he QM,
only the compatible is needed.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 xen/drivers/char/imx-lpuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 77f70c2719..c85e81109a 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -257,6 +257,7 @@ static int __init imx_lpuart_init(struct dt_device_node=
 *dev,
 static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =3D
 {
     DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
+    DT_MATCH_COMPATIBLE("fsl,imx8qxp-lpuart"),
     { /* sentinel */ },
 };
=20
--=20
2.43.0

