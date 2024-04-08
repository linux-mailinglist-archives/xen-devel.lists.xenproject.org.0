Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683089CEFF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 01:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702068.1096829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtyZN-0000Rp-5Z; Mon, 08 Apr 2024 23:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702068.1096829; Mon, 08 Apr 2024 23:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtyZN-0000Pu-2h; Mon, 08 Apr 2024 23:38:33 +0000
Received: by outflank-mailman (input) for mailman id 702068;
 Mon, 08 Apr 2024 23:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bW3C=LN=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rtyZL-0000Pj-ON
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 23:38:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20700.outbound.protection.outlook.com
 [2a01:111:f403:2608::700])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d124ce-f601-11ee-914f-f14010f3f246;
 Tue, 09 Apr 2024 01:38:29 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 23:38:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.037; Mon, 8 Apr 2024
 23:38:27 +0000
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
X-Inumbo-ID: 19d124ce-f601-11ee-914f-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO8qy7GA593B148Rj7+Z4svQxsbczff1T6uy+mYK/PzivKs6PRe9CoNqivEYtRz0xXwQBQ3cG7aQLZV4YgS5/Og7ubba63DTxgoed8+EC0h+bLNYC2+RrkapnzlxgIL1Phw7TJbheBCX+VPBJYn3ifE0YOzrZguBffRTs84w/UatYqzScNS/tk18ToG+5skWzszW1WSFg9Tq4EnIHRb6djwXSZ+ZBZ35kOyFeOd0mJ3/j0TVGBXcAw94ha2f9G+Qfrc5nc7lnFe+Iv22M7SLE2CiqsCEvPjT/4iMB9H/DL/H9GNMtihRfK1l94MDTeHBglnduO7G8kXHSv+QcHjSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaY7V/sBDnPDLN5/NgSC9ZPe7xS95w4QXBn7FxcCV3g=;
 b=OPxLyA8ob8QiYGjoH9M0lyZO4AlzvKKAW6fbRQE3S8Y33T0tsGdaT6MDFPEAEkhTm8W7D5CFuonAK6uaxdfHhAGsi+I77ShcseS8aqAx6MDifpcEVWiXLqNwwy3ZNkM6tzbMhSSOeTaRstgeO5JOKgPisqXJLZnZwVEW3OFEl7ALqtKr3zYcs1P4WChbwWhvOOJNvbYU7edCCiGv2YfOlOW1qVsm4XxR3rk+B2dWYzMQaaHu13vnFa9utMXzoRA2xd2bcWIT36+Vudwwz12IRzbwsCTFZH+z/r2BA42mAnE1DkwS6W0VgeuDPE5SKtnA3HpyKPnYRmiVE07wmPSBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaY7V/sBDnPDLN5/NgSC9ZPe7xS95w4QXBn7FxcCV3g=;
 b=VEJRNhPfSAfi7t0BeXvaubfBJSJYs9pDPnwKTlBT/SUeeoUF5gHg/mgzyMlsmPND6dLbxqZpvKl6x9hUEXZRcOi9dsnfw77o8mRw8Cjnl+wRnHdVBhdIHQ/No4oq2MNzaK7K+MLYvpSE/C7F7Vx3s3yRWfFcLEHimjitC1jm0hE=
From: Peng Fan <peng.fan@nxp.com>
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonas
 Blixt <jonas.blixt@actia.se>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v4 2/3] xen/drivers: imx-lpuart: Replace iMX8QM compatible
 with iMX8QXP
Thread-Topic: [PATCH v4 2/3] xen/drivers: imx-lpuart: Replace iMX8QM
 compatible with iMX8QXP
Thread-Index: AQHaic9t9NatChHdRkuf/zCq/htzErFfB/9A
Date: Mon, 8 Apr 2024 23:38:27 +0000
Message-ID:
 <DU0PR04MB9417707F2EFAD119C40EE09C88002@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-3-john.ernberg@actia.se>
In-Reply-To: <20240408161129.900347-3-john.ernberg@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8989:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ++xNg1+fQExQCWtp/PYfpZVlLQb1+2MTgSHzAhYHYwa1mcVYEXyP+EzrC9BMXqXETZknviUjPSIbPCt3UfJFZOEY/070JhreOQzLQUKEg017POfYhNv7/nqkOAx7rk2z+okPFsxhBn/0An8mE1Qr9UxYUQYHzx6aKkC4gRvf3LJ+k+QCdrNIE9jC/MgvpQqDya4uW0jNHOzoYyJSQvY0wZlJuwy7UUeCoYbykCQ+DFYOUcq2ghxG7guhVP/IeYEu0pNk3vOUXdDui0y+nXS9Hj7yGn/7q9YZUfs6K6kgcitBzPRxclK8uWdCVOPeOUvKqa/pNeGerQglfavhHt1soCv5mmApfJJ7mky/j5vrBlSfhtGzuqdI4HuW+O0HoEoHmPQSAlja/sDRUBpTffUeEjvZBWWFkK2rwyc7ufyuqa33a2y7f3nRnallVaiJ9rl2K2SZB5p/18Ps5vWM/sYZvcOQYEYSM4zfkbk03oy9DfmJ9libTbZ0QVeftiRSm3hZA4I1X67wOeSySEHNcO5DZtQbF9z5fdswIP7WtblSq77wjo+HTV9/zouug7D6ENyqsqfakCt01Ws32lxSIEndgxTM6G4Gd5e72XFOlAEZqpHIb13m42xgcHilCzOUPCIygC3AVJzosuCICtGXeKbYL6BO6iBzKZfoB1eVjysjpzM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tufKAioEKzav1iTaaYI/tVUnxGsEOu8aWpcgzzrNP0uiP6CkHszcuS/hb6wi?=
 =?us-ascii?Q?TGvg/f3XCeRdx4wb/6/h++5D2/WPBP8SW+4otOIrOXbehIPHlbGc48gyCX1G?=
 =?us-ascii?Q?YfB7ZcMK+pkrLF1oJtMSiG2OLuJZ88pe0Z9ogC5bCpUrNXPvjnp+KN8WlfMF?=
 =?us-ascii?Q?O1/ebuU7qFtu+4RzlhZUHjuNPvKGVosya77l7vBCWkJ8JkxeB44vlgd6UrB6?=
 =?us-ascii?Q?W9aXK51kwm4gNmIgyVc89hkovewDkmomJBSrbhXRyyGWggSvUTG9rotNWzkF?=
 =?us-ascii?Q?LtsPCfW/XaJZoXw9T6qBajNOucafZ0+433BqRRVALuG8ZaKnrWR9+ICXLpsv?=
 =?us-ascii?Q?hED+B5u2HTmQc+uU0qzBMZawXPCtGyo8JLrnYBMpAKUjxHVcpGLIMSQn7Gm6?=
 =?us-ascii?Q?yi4QosmO7fSD9ARzZ7lmjxBDNUD4WgBYn5TkHJ7dvDZedkS6kOIUcVhn5g7m?=
 =?us-ascii?Q?7Wc8KdmLBtuhqFxhbRRbQ608CaQjqHVIjDqqbt9ZbifrV7puNiWoXPSqay9U?=
 =?us-ascii?Q?+yXAALBOP5flrG3cOS8gV8PZFdh9Yuk5nNCfhkdcyNBwL8wrnVUUGxcHt87X?=
 =?us-ascii?Q?qy6yd7VH+eQBGGJSGNBvtYBrRud4u3qdUzgpptmTWxCWZfM8u8PiT+CUj+Lv?=
 =?us-ascii?Q?l1uMyNu0KMk195ia3l9fKjiddxFG3xtzJB7968HynBdA/adJFeV8bf3LKai7?=
 =?us-ascii?Q?+cat7Rr5QMLBS0z7T9KLyquNItDkaPyoJKPEMyJYDtIVTcWvwJ0eaJCAJ9D+?=
 =?us-ascii?Q?thgNvstdjU7XodJ9d3nm7SoO/KEEBwwduYmXw6TGwuAA+4aTrOJSl3qzVX4K?=
 =?us-ascii?Q?CW/aEcCOEWFI5KDOiBW6aRZDs4zscVLfXtVHh/0NfyY1EIS74oeP03cY/ljN?=
 =?us-ascii?Q?jnJmejk3MI+PLbsYBkW8ZSqCdxZ0nM2LMueYR38n0JfGCFtFtiIowGoyOqhX?=
 =?us-ascii?Q?D5Yicj06vNapRXXiXSNlBzxSKucn7x87P772MpZTiwObOoFCLndqrJ4RG2Nb?=
 =?us-ascii?Q?5swTfxRDrNSHtflwfGBFb0oHcw0y2vbz5AgOYgOXNrvQeD+9I63CFi+B8E6f?=
 =?us-ascii?Q?uh84iABU85xBHFk/7PXp5vEJU3H7bYQhmTCKLPIOp2HR/kmA6T003AqQ+yEy?=
 =?us-ascii?Q?Wu3vOAOMoTQHob954wKcDTpAumcLmZpERinvL1VT1K8ecWv9BIZGruYJZkxH?=
 =?us-ascii?Q?7rKsVR/WmU/q9VsYeZO8Rm1M3B8c1pVZLLZMrR0bRAgrN3t+nyDT5+TrqLcA?=
 =?us-ascii?Q?EQtDs82n6kKDWRW6f40/S9UB5SNWUyY+ZZCE+Tg3iuVsQB7w8UcsLlXIbPlr?=
 =?us-ascii?Q?1Pp4VF/NU0VHQj8V10XoiczSbzEBBUSUTL5QsQrcqucKlbTaBWYE4VeAmDG9?=
 =?us-ascii?Q?ZXhxtgKRgKlYxvQLjWuEBGTMX8N+yXDpfF0VDT5dDBFvZEKaq7xL+SbE/w7d?=
 =?us-ascii?Q?RuQdpp9sHMe4hhfVyoXMDqo3O1mhVVYzJaPd8cVIPP2GTYw7SSgyV9eYD4lC?=
 =?us-ascii?Q?fgh36HLMxjxQnfVuy8NaWocuOn/VQr4AxvuL0pMN1AcjUG7I6U0aVsrU1Tsq?=
 =?us-ascii?Q?k0+UxSFaiPndCV+HsOk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094b13c9-c61c-478f-db8a-08dc5824fd45
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 23:38:27.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XqcnjT5RFz+VXKRert0ugav5zRXwA6rt1vw29VJLZ9r6xi1KTuj71rNT4ruGRwf9nEFHG+Y7e+BAFHE2bPsrrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

> Subject: [PATCH v4 2/3] xen/drivers: imx-lpuart: Replace iMX8QM compatibl=
e
> with iMX8QXP
>=20
> Allow the uart to probe also with iMX8QXP. The ip-block is the same as in=
 the
> QM.
>=20
> Since the fsl,imx8qm-lpuart compatible in Linux exists in name only and i=
s not
> used in the driver any iMX8QM device tree that can boot Linux must set
> fsl,imx8qxp-lpuart compatible as well as the QM one.
>=20
> Thus we replace the compatible rather than adding just another one.
>=20
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>=20
> v4:
>  - no changes
>=20
> v3:
>  - no changes
>=20
> v2:
>  - Replace the compatible rather than adding to the list (Julien Grall)
>  - Reword commit message to reflect the above.
>  - Collect Julien's ack
> ---
>  xen/drivers/char/imx-lpuart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.=
c
> index 7770d158bf..cf034d7ed0 100644
> --- a/xen/drivers/char/imx-lpuart.c
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -236,7 +236,7 @@ static int __init imx_lpuart_init(struct
> dt_device_node *dev,
>=20
>  static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
=3D  {
> -    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> +    DT_MATCH_COMPATIBLE("fsl,imx8qxp-lpuart"),
>      { /* sentinel */ },

Reviewed-by: Peng Fan <peng.fan@nxp.com>
>  };
>=20
> --
> 2.44.0

