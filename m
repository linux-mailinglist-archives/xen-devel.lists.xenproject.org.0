Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0EB1DD1B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073364.1436476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PH-0005KI-Cb; Thu, 07 Aug 2025 18:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073364.1436476; Thu, 07 Aug 2025 18:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PF-00050a-Hr; Thu, 07 Aug 2025 18:32:01 +0000
Received: by outflank-mailman (input) for mailman id 1073364;
 Thu, 07 Aug 2025 16:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xu-00076W-4g
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:42 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e71243a9-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:38 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI0PR03MB10757.eurprd03.prod.outlook.com (2603:10a6:800:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 16:59:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:35 +0000
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
X-Inumbo-ID: e71243a9-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0VhczSh8b1n66G6+pDtD4QUIJyDY4+65PQi18x6yY41CWARNwBCzyLbXbosyftaxIl44vV0D1mSXvBLB6aioVCguYDfB6UOdzC9Z6N65TFBOkpLQCEip3tXBW3mBNtiRmKLTdDbdC4IY5T4edxat+4JQpJA6JEoXir0LV9oadDuB7mWTbioPmJniBrApKHGojQx7cgdIvoLkbb24sA1N4BYSenlHWgta37sNbZWrVSYValkMqaGbjyhL9sRQCwXmSsAjeM4qTVILaR03l64QC19VEg1Jhi888KKMFSMlyJP5fTtrBwRwpko4cNAJx0RRJzMstIuumyyyCtRqr7qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N139GbhE8zRhemLrZtoyLCg0r1ZmYt9NvxgUFa12HIU=;
 b=PwA70XNqIFG3T0Fji25/fV99Ffst+QIFy5HS4pQkBUSwaiuI9AwN3DVnUigzH/PXWHH56+K9dB5r0YN0u61e5RNsep3/bqrsKHY+OTJToxv72rODOg2T1conFSEgEmxJgUcc83+R9+OlL5jgbwkGoeCdjI0XQoLAC89gFKEB0CROtXEeLXSPhQYHqxgs3NVTgq9c9N4GecKDQVw7RROLbAwNSN5R6rujWPShect659AU7V5qiCvagmUscj3ksdYsSercP71/Utaeo5BFQv6tSkcv/oHkCdETIeJiWO47N8JQeHSGu2NAl13D+ZCf3aOulGNfHe8LLyq8Jsto1cODOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N139GbhE8zRhemLrZtoyLCg0r1ZmYt9NvxgUFa12HIU=;
 b=XCvUyNWX67kK/d+CdBkILPz0ZDhLG+UQhydC7ATSt7TyMufjpOoYJKcR13/hCmovK0VKDyDTpEt9VBlJOptIq2t8LqLdcRyY3YOZixrqTpqqZ55VrMTuk/BBw6y/LI6HHI9OxhhHZc1TbKaR2H9pX+JyJgMELa9DJxdfKP59r01ifjl2sSUvg3kjO1xZFJ+0iAFyhrL4wTfhQei2ODliimERFOdTzGBAJbW7UpnefJ/Bjh/iFj9arGG0lju7EX8ZJzIrqgZCx5ZP+po3afH33o4PjnuHfp+CtQsTuntYh08OsUupaYQEp3lhPXfOu1f2z4HxijSlEXL8wGik1DXe6g==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 20/20] xen/arm: vIOMMU: Modify the partial device tree for
 dom0less
Thread-Topic: [PATCH 20/20] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHcB7ynr3/KXhUzEkK9AiVwODSe+g==
Date: Thu, 7 Aug 2025 16:59:35 +0000
Message-ID:
 <dfc3876d97763a06178cee2dcd70cce9dedc7919.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|VI0PR03MB10757:EE_
x-ms-office365-filtering-correlation-id: 5af17c9d-a294-44e6-6ce5-08ddd5d3c9b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MHyszSv8bSPZCq5g3+sS1JN650X+9m5WjIcbusTKHG4E87DlXF23xbGymf?=
 =?iso-8859-1?Q?FlLJ0cKxy/nFL1AnSph6cmNlJde2+aZ+3I+OFi1CE66NIYRHXmoXJ5kcoz?=
 =?iso-8859-1?Q?tD+a1kSZzhGQHff0iKzZ9P5ieM0DgMrqEPLkzkJMyReOio/Tmgl8ymtMba?=
 =?iso-8859-1?Q?VsKjD78Fw/9F4hXnGae9Abo+lrHnMHdD7/I9nPDIv2FTy3fIDFV0ETxnNS?=
 =?iso-8859-1?Q?3HnDjQh8+vckQol1lIFjfdsv4e6MKkHCniHSGSC9NK9djaSaVGDm5P7jje?=
 =?iso-8859-1?Q?o4tGjYZXg3XhQ+fCNVyyW1THp0WBK06tfheU09l7xR5/XoCJM6He9J7ORM?=
 =?iso-8859-1?Q?LUshEWEpnHE1F3cOOMGLvl0Lk3FsnvqoLQ5WdXrZnO3d9TJikEvNRKTjw4?=
 =?iso-8859-1?Q?doyvnrE+3KW5rmPicSkI6c3l7h+hJb4KghbI7mwYTq9RlOtTembLizbvG+?=
 =?iso-8859-1?Q?c4TR6xuPY0FyRYkF21lpbXy0WkZTDfuBz78sMjyZoOtu780iHua8xXiloq?=
 =?iso-8859-1?Q?/3YxRw8cQOdRFWdO+fdmDDvbFnj1Ol6Mls0FTHzKQ++VDBGBgh1Y0drFeI?=
 =?iso-8859-1?Q?/AP7SfoLL12b0PABdTck0BUzrgkpxtL7bzH450iyQBUXDcvHpSNWs+u6Ff?=
 =?iso-8859-1?Q?1wdHxR3A9HI0QwWBgT3aTAqJ37IOGdEGjVdOF7ILPLFrvv3Eidswnyzbrb?=
 =?iso-8859-1?Q?RNkEPdtzI9lf2SnCVsZQqqYmZilyYxhEL/rnhrZ723eVWhXjktCMDw52Qu?=
 =?iso-8859-1?Q?+DznvBHGIKb17qhaxVqMgBv6elHfz1RF91errP6bPu5WnhO76gu27NGyiu?=
 =?iso-8859-1?Q?pcKJNETES8Mi9iq9e05FxPdqJ5QoppK4+FAkZbzS91SKI4xsrWA5YviQny?=
 =?iso-8859-1?Q?FUpu04gQNyY+malthQpizyIUjoNbObkPsi2W6pJSuNu1rzf91ozJgjAirG?=
 =?iso-8859-1?Q?y/p8uxy6EQtOAbYKNOKta3KV0zS63GQQLOk4PH1sOLgG4dZtBAqAhqa1Gw?=
 =?iso-8859-1?Q?43pLY3u8SCNhte5ocCJE25RmbhIrfK2IJYs35SXroKUiPV/UDgg7aItFPL?=
 =?iso-8859-1?Q?AwF8Ryn/Cp55ZyESuzS0nVhxgsmzK0kjo6tXr9itScmMmMDFJ5KZv08A7z?=
 =?iso-8859-1?Q?zxEV9F0I/+/eaZReYUB0FynkW8TcmB7UuFCOhooLfsddESExO0V06pLG9g?=
 =?iso-8859-1?Q?EZv8QAHPYLKUBvsxdVyMiBa2SS3oQ2fwjjbkjexirqdtMzDYfLyNBwPNZ0?=
 =?iso-8859-1?Q?RpWPYAjm5NRTZN16fpOr1VXcSplcRrCYF1NWS/Xd1AkCNKOXLy7zCyHHrg?=
 =?iso-8859-1?Q?V1QTwly9ZmhCngLOZoeDuAsIXpvyjdqbXxg8Q3yL75hYGVuuFlnG/+lVIR?=
 =?iso-8859-1?Q?CKKUEQJrIY9st72r4EXZl4vDlRaNJhWh7clCGZVOq/K7bcmM8JwaQMmrAR?=
 =?iso-8859-1?Q?EBUejOppCU9V6ahNMahMv8C9cxuHjb338pkx7cOf/wvKhXGrWPcKMZrKml?=
 =?iso-8859-1?Q?X+u9s/UGTPksFVNpPwbmMR9OjJYWEsXXiEN7bwh0E93A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b+n7hy1ljQn09teDJ8LT8lj7RMIQqeykzP3THCV6gc7rhuX+42drqWgjxk?=
 =?iso-8859-1?Q?JMICThJNAeVCPd88Dv4XAmmRLqUNeBbweectBEMi0/vSaDKB8qXeqsAtkX?=
 =?iso-8859-1?Q?HFKMXIS8ZdxgABkuJ4Vcx1MaPWPI1dXV6MCIHtrpU88jj2vZzXYQp/uQKb?=
 =?iso-8859-1?Q?kfczS4UpNTcuNUKFa8/IwYIQFHe1gDC0JMJ4wEu39yt5l4dzKsuKk6IZaN?=
 =?iso-8859-1?Q?7rpsRsC+fWysSPTQnEskr10x8y4D3ogaIYRIEMCkwv/TK+xOJKAAhYoLDk?=
 =?iso-8859-1?Q?XT0LmFAYl/VED2WlL4C+SPmguNYb/OzkasjBOofjKUK/Mjwx0aSSFh4Jsg?=
 =?iso-8859-1?Q?LHGBD+gxObSJ3llZXqbygv0wUlaKqMm8e6tuttH5Fne++2Gw39OgEAZTxa?=
 =?iso-8859-1?Q?sVD+pgrPUACoyHp9K9o9NqG/WhJrkpzsnp88pVHOGDSDtduDzP3oRbBq84?=
 =?iso-8859-1?Q?2OcbtqtNczRfEDQBcJQj3ZsfyrAQsbwIvb42gdqCskVK8D5YASu2nQ0Oju?=
 =?iso-8859-1?Q?gXGCihhXED4zWGhI0y7sOmQKFLQlUdKYTcTqFktMEUwZia8jgovZW5kiHW?=
 =?iso-8859-1?Q?h/KtFMS8H4P7s+dJLGQTaoz3ugwnNZILAdNkkx1JHfTwoecmEJyJXO2Ixu?=
 =?iso-8859-1?Q?fmN9+Qa1h6qRswUTNoUKfq7mnf5rp2Gqv2sqcQArpPaFilQHJc8Hekdx+e?=
 =?iso-8859-1?Q?oAGqLocLvnPM56rP803A2lGURHFTg2/iRatbF8CRt7Lv8W8VCqdL48IwJp?=
 =?iso-8859-1?Q?C8pLK9ScHlAVJZhhq443NB4yvoMdu1URJlrElFdP1+R8hAPejerEbqLL7o?=
 =?iso-8859-1?Q?WLQUoKki/UPnW2/O6v7fPIydN1Yq68gBJ025gyjsdPwBdVvCnPjVgjmNvs?=
 =?iso-8859-1?Q?ZccsyGw4uubfM4nmMr79ZeBvV7wssUX4SgKCskI17tkomx7EkPAxiOej/9?=
 =?iso-8859-1?Q?/YFEcHiW5Z3EjQdwZGfBTEzRmBF/nm41eEJlbDCA0nT6B9jFhpF+pyvCXu?=
 =?iso-8859-1?Q?UlthRpHA+crBqKqMqx7RhpsKhTRz2nJo4ifveNFKjdFDM8E1fvd9J3fDpY?=
 =?iso-8859-1?Q?ExvPijN2Ub0ql151eaT86HnbQCsmz5Q31k+SF7gH1iHWbiZZVY+r86T62A?=
 =?iso-8859-1?Q?Pq5ahZArFt0j3XX3wFW6xps7FAjDTlJPPuUcoNz1XN5vqMOsCb6JZlrN3p?=
 =?iso-8859-1?Q?l9P/y1ovOqauc/4BGlvAhnMImkju5I9K7Ymc5RYUEpnfoZGgLJRFHmie3a?=
 =?iso-8859-1?Q?2/xNgFx+P9KLjhK1Z+A6yxbK9TMeNbvDBflKLJqV/W4mMRbhOrIJdRwdGM?=
 =?iso-8859-1?Q?iivmQXnwl5N5te7990m4cksPYp2P06aI2RjpStU5EtXAsbIiB9DJPsZdlN?=
 =?iso-8859-1?Q?GnPOT4bn6ICbkJxH0HruRlWpkn6lwysYkDdPbs3rjklw4nxSIuHIVG3BUN?=
 =?iso-8859-1?Q?8JmaT8AzmpWvoFtgLWFmOtsYJj4A6ssqBQcjP/TgCG15HhSaSxt0UwTXUk?=
 =?iso-8859-1?Q?zKieDUQQTtumKGdH5QWcLTFyY9wJ4nfmi0pNeS3CJl2KyjaTzURahJLpHg?=
 =?iso-8859-1?Q?n+r/A17UKbLSBGarX4Yl5uy018KhWTxBoP5J0wZeyI0QcWuzvqXKdaAObr?=
 =?iso-8859-1?Q?zQ2QzulECYrvKCu3mY7ShrXqlVEtAI0o9RvF1/fXpuGFjxHPgwBRZ53g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af17c9d-a294-44e6-6ce5-08ddd5d3c9b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:35.5097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ehSu/DYwzUTdg51mcRV3NurZ7OjTMwLylPpsuStBCWSH6XnNhEH7Pcat0uUBjqimihbbrNUImA5wMq3oE3KqpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10757

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/device-tree/dom0less-build.c | 31 ++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 6bb038111d..3cfffa6581 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -314,7 +314,35 @@ static int __init handle_prop_pfdt(struct kernel_info =
*kinfo,
     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
=20
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pf=
dt,
+static void modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    int proplen, i, rc;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    if ( !prop )
+        return;
+
+    prop_c =3D xzalloc_bytes(proplen);
+
+    for ( i =3D 0; i < proplen / 8; ++i )
+    {
+        prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+    }
+
+    rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT"=
);
+        return;
+    }
+
+    return;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
                                  bool scan_passthrough_prop)
@@ -340,6 +368,7 @@ static int __init scan_pfdt_node(struct kernel_info *ki=
nfo, const void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
+        modify_pfdt_node(pfdt, node_next);
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
                             scan_passthrough_prop);
         if ( rc )
--=20
2.43.0

