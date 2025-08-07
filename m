Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62DB1DD12
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073359.1436445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PB-0004FS-35; Thu, 07 Aug 2025 18:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073359.1436445; Thu, 07 Aug 2025 18:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PA-0003ux-70; Thu, 07 Aug 2025 18:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1073359;
 Thu, 07 Aug 2025 16:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xr-00076W-4D
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:39 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5d92072-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:36 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI0PR03MB10757.eurprd03.prod.outlook.com (2603:10a6:800:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 16:59:32 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:32 +0000
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
X-Inumbo-ID: e5d92072-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb5FtBvPKSQHM6OqDGtRW77un+hF0m/WxKcXk7/w+mrOVu3SAhcqXD6kMxdkurx03G/JRQXu34Q8bbJ+ml7LykVoDwOmX1oDsICXxb5a8tLFNmMoFKovmVE0gbc1F3potxS8nKbxTEnNIQi864L9fyJMvAzVTm7nP3QkqWOgu3vhRZk5f+7qfJdUJ+/S1FcOMMmXgqTc7B33yDBsGqe4YxBww7rz8GgvhOUC7h1O1/ORqGOHYYJgH/JZc9NGuXNNmKmEoFBlErWsJpesep2Nu9QBu8mubCUfDMkof2Og6Y15ARfCV6QE6/J3kFWb20ek92xoYkifohxzQ7ymwXvboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBM/Oobt0LXDf7iN7IAMUwzJ2Wbk8CrHV22+yrEMYhM=;
 b=SqE5PYhlb4ZXoJ5E6tbW1Ux0AOm2UoMeNtx4rmQBstViTGwP11BhYSjb3pNUxKxX2CdSOwIHZtq51zEqAPrHwLgCkVeC3jOdnYNNsedeJNqfS4MY++dydvc95aR8LZfymE4nGmnlLPCXHsHOkDNYD5PgY1tgeuu340gqhwtvZg4awGWrGIV9qmZil8qhDi84jq2wr6LyvvUyAd+lIL3fj2/a3MuyN79xbRmZVu+pZsY60wzkJq7NprTrOd/yoVu/s2fkgF3TYq3EUT0OEyYc37GgOgQ5Pnzn4L6Nfk8Mglb3GD+CWBjDoXUgAAlC1PjhPLeWqpd67d7Rn4VkIXHAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBM/Oobt0LXDf7iN7IAMUwzJ2Wbk8CrHV22+yrEMYhM=;
 b=tLIBFxoFWce6G9NSIVsCP60GRcWPloTRC86VgxmwwMNmx2vsfCVqPtawoYPS+pwOW1VcifdEH/Lse7IrLcVIQG0Ap+ckPt/rnED3PU9k5pIPcIbXfv0/NNjK+xWrWswMq10JsAuhxlOSgG5aIJiSNRVyDo1Aa/5atD92boZUrwUIZk3xT+M9k544oO4JE0VqFXt5nN+ONA3w77GugNurNzJv2uH/Mq3YVClUlM4Fvytb2MHqBoMFD+LlyO4l5WE3j7nRrpg1JRjmt/zcZuxUu3pIP62qjMyWx0pLJrPVSnKpaOsUUgCS7TrPVFT3zTYGErqBTkfa2+FUqgqykUETpQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 17/20] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Topic: [PATCH 17/20] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Index: AQHcB7yl9f0v0YO6DkW2QyqxB5OyfA==
Date: Thu, 7 Aug 2025 16:59:32 +0000
Message-ID:
 <ce91f4111ea28b620db6c29e46f1fcfec79ad89b.1754580688.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: b4d01857-a845-4cfb-c189-08ddd5d3c7bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qGPuMi5YVwwyQMLtibypNfAc8205ifubbwQ9EhJe2Pyv52I2r55mvB5sGq?=
 =?iso-8859-1?Q?F4yxRorE+k8QMqUF+NErF/Fwo79w6ZNQLQTSQCMI/rczGDRoS7/nl+H5hO?=
 =?iso-8859-1?Q?SuuXH8Jsb9izYGT5qMQQnc8yFiGhH3Sxlko2X090tJX55KAJRuk/Bs0sWH?=
 =?iso-8859-1?Q?h87CMbpJPTv/3MUJdDYxfAvMwTTWXrti7U//ebxN06vmNF/+qCDAZxVbuB?=
 =?iso-8859-1?Q?34/aKr5hvs2co8zjcEgJ+mFBBFlBMPivCNu2JAmKIfUkz62wR1tFDi+0b1?=
 =?iso-8859-1?Q?ZfrCXiBoXJr7V5zsLTduSJVGAyQlYjtM5PitDtKM1PjnUt8kT48TfffCoH?=
 =?iso-8859-1?Q?i4IuhQxC3LJohPAxu5yoIDa8h1tKge09VY1GgmHrsZz36leCiU++/LnjW8?=
 =?iso-8859-1?Q?2QXbr6LJdF1fzkn99plDHRwT5DZEs5OXS253QIH6JMLjhGQEYmi+18tfpU?=
 =?iso-8859-1?Q?AOjwgGgpnNaeKtztgHNg/UQ+yxBDIP43GDl2FJLvvapuqt32Iye3CvEWcP?=
 =?iso-8859-1?Q?6Fofo8YzkZI8QLNQw0bF3YHTsv4ZsJK++eajmbrZGOGVWtwKr33BKphj6g?=
 =?iso-8859-1?Q?fKtQt3VAV9KHcYyJ78nes2MSTRknUtT21HeGEeLUC/8BB/2IPwgy9KSa31?=
 =?iso-8859-1?Q?AMjx/UKn+LH8nRdZhuC8+Vu+Qr6KuM+Fy/G5b6bRFVA/+X/pnrNhfc751n?=
 =?iso-8859-1?Q?F81nGVaWohriTEWJNH8O+skfvMOb+ugFKdpJ16iZrBrYsoGkC9428v+AYh?=
 =?iso-8859-1?Q?OvkrK50MDuxmv2LpS4Xtn7AeBhDO3V4PS34456BtISyCkeFZe8qDWI92v8?=
 =?iso-8859-1?Q?DrVkB2qkVktjDFtGekikIInB2h+zzbqyodsNC09n7FNlGhSYXd/Fj/lo58?=
 =?iso-8859-1?Q?xE86mvr01IfZdvWe/c1banojsth5LE+4CqlouIcok4MgVsM6Xcfa4zpLh3?=
 =?iso-8859-1?Q?PuyRyGRqViJxwa8BrLrM5FYKPKKFCIlhFvV6OmlLva9o8/paWPQiZ4iJcB?=
 =?iso-8859-1?Q?1R1EIIVnmulpP0ZM2rs4X3i3CWtC+QUIocTZRmCTtIzNI450BlH5u5nsv7?=
 =?iso-8859-1?Q?c+Vjd/lIXva0P08afRyCiKoSK/P4nlcvDHMSZUfkW66bQKuPFP64gIBoL/?=
 =?iso-8859-1?Q?2ZOZREFB27fS9WiDkJQZV2DK7NSlhMTvAph0a35c6OmU2dp3gYoo9GvzQk?=
 =?iso-8859-1?Q?ajPQ+xv9b7/V6q90X9P5N4mc/HvRou9tkwQEIHlYaCDqJSpV24P5igdP8H?=
 =?iso-8859-1?Q?pqXdYe6iVqA+PivH+TSxcZIIpUZlSseAFaUSpNvT7mzKbOaaXQxgSoK63N?=
 =?iso-8859-1?Q?BQnzJu1IXYNDyNSQjRw1nnOGAamsrlJHE0F0aS7SwolCCqXVmLAESoVuFL?=
 =?iso-8859-1?Q?pvJUv6i2Cj+C0DSwk0Ab+H8UM8R/Tirzf16eOnBYHBPWwhaLm7cuib25G9?=
 =?iso-8859-1?Q?ljZWNuF/4RRIrIOnSM9WfkgjJKrcT00WnpYfvcdEEY9X+cd/G+mmD+5OR9?=
 =?iso-8859-1?Q?i+PzZ73sXV867h4ugUYz0I2S+mdwbRNhxmVqiFaW02og=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0NUIdagPzrogfuqHA7w/4vfOv5BPadHKGnSGAvBp06KeIQ0yG5FE94Hkt8?=
 =?iso-8859-1?Q?Ftn+PKXgTVpj1E79x8ePG3t3K0sWUK2W4bqO6OgSbLGF58i1EpR3OJhtOD?=
 =?iso-8859-1?Q?3bP3S58kIhp3rataefW2sW//jUd/+QEmVtykX1sUCsJDjX57lEQ37TbiKH?=
 =?iso-8859-1?Q?YoPPlnAHM7ysNr2p2tUOYunSfQh26+P64L96IwAfZ8DIOG3wKAR6HI9XFA?=
 =?iso-8859-1?Q?m3hKnsvhPZnyFTjX7zd2lV7N3gNvS3brqulcSZnS8kP2ZwsGe/6SePNlA4?=
 =?iso-8859-1?Q?zW7KVy7DF9pLDi2px67MsKwx5QcwjuqbjTpCoPufHdOZh6Ir6NE77gMMxz?=
 =?iso-8859-1?Q?dbDYS+Xlm9d0f6jl3QRN0orwpMDqMZRMLTfJgdiWgPHo3qev+iXGeurCHM?=
 =?iso-8859-1?Q?Y0d1w2z4NdUBPN5MCw149adCD3nGgb/kHcPhyIK5MUBinG7Tdnf6DMng24?=
 =?iso-8859-1?Q?q5h+fnyYlswPXs+yvj4lYzcqmBYW+0rjmpdGqStkYda4axYssvNplfSgIs?=
 =?iso-8859-1?Q?gNQAOn5MT11qfN4/YfuYoF1AlPqwtayO07LtdTLvCNVb3qj64ZvAhvlWfh?=
 =?iso-8859-1?Q?804vI0N/fkG9qyZQ6mftAthxMqVE8QQgyRvf58an9fjXEODkfwGLA5Q3QS?=
 =?iso-8859-1?Q?8Fp6Y6lNOtD0dbpS9ODRMJdy0FyvA1q7OYGtpELgPwveqfQcTh6cdJwjt8?=
 =?iso-8859-1?Q?6857mgq1kIbrONfwwwxKhomzFQldmPrU6OktQ2jgl/O1MfmdFvy7j0zVq1?=
 =?iso-8859-1?Q?Dr3T0YTkaGPOg2JmsVC1jV1CwAzVDNBjGFulRSx+a7s7NGSY3b/nQ4hBOk?=
 =?iso-8859-1?Q?g0N+uvvv46rL+GNvudyNbv4zyoLt3ddICzzCXQXV9zY8DfNs2Ykx+ObwxE?=
 =?iso-8859-1?Q?9Qt6iUZuB3jiMCuxBp61fyKyN2v4AI1HoNq+jVmQ66Bhub+6xG0BiKLmKa?=
 =?iso-8859-1?Q?XkeDDbcvr2TLcpffDvgxXmjlpp9ymFlrttjg/TlpKG+PadgNn/Tjji4ynV?=
 =?iso-8859-1?Q?+Y0OSdm9w4DMCs/lmt59EmwtOXcHPfxaTffsMvr9qF5arU4H8PwyB6Oywu?=
 =?iso-8859-1?Q?DcL4MbsRgNIqBQZLGiWb9ftjD0118ufu6k82JmsxPkswBHBASaCQM3iqcl?=
 =?iso-8859-1?Q?yKqRuAy6WD9+R2HmlMOcRLvraD7Zz0nkOV2WMbmUmKnFN2O97fTUrPWlDe?=
 =?iso-8859-1?Q?pbI6UJE6sxgSAFE309N8z38G4g7EHDeWjbieLGkov3qGXOTjajQAa+z1J0?=
 =?iso-8859-1?Q?8W2toujxEnzOAHF6U/ZzGAdLdHkkr2IitYyXjooMLfbgFncbpqrh67VCtB?=
 =?iso-8859-1?Q?nZgYM4WIgcVTcFTSu1oHAwl6tnn1Qav44jKPOI02JCz0Xd2YLrfAh4g59L?=
 =?iso-8859-1?Q?qplYMmOkjw1Ow1DUpt/oKnHcPrNC+xZ+5OfbTNR8sOChJMAKdGNPjmc/GI?=
 =?iso-8859-1?Q?70D2vrhrXeWu3Ev+e318KsG0zyhOwyAd4qeUoqFEx+Zb447ORpM08vp/fH?=
 =?iso-8859-1?Q?rhrmT0OGCaRXysURyioquhMDbUR+bBtIb/WNKaKvC9pvLqFr07big4EXqS?=
 =?iso-8859-1?Q?AbV2icXxSEaLBiNjZd4WBX7jJt7Elv6q3veBdRwdJ24a7shnDRoM52QHKQ?=
 =?iso-8859-1?Q?a/F1YJo58rl4R578g6LD0udM67ie9i9VrTvIjEa7/a3tKnNXi4LB8qiQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d01857-a845-4cfb-c189-08ddd5d3c7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:32.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijOeTGxIc2NT81pp1R4dFmxpNSRLRV1qmC1Tbet8Wo8PESvhn3gEfh5QwqSk4vuzC939GuqKFEB6dZd3KiAFdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10757

From: Rahul Singh <rahul.singh@arm.com>

Alloc and reserve virq for event queue and global error to send event to
guests. Also Modify the libxl to accomadate the new define virq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c           | 28 ++++++++++++++++++++++++--
 xen/arch/arm/dom0less-build.c          | 17 ++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 13 ++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index c8255d8d4f..55beda8c0e 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -86,8 +86,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm.nr_s=
pis;
     unsigned int i;
-    uint32_t vuart_irq, virtio_irq =3D 0;
-    bool vuart_enabled =3D false, virtio_enabled =3D false;
+    uint32_t vuart_irq, virtio_irq =3D 0, vsmmu_irq =3D 0;
+    bool vuart_enabled =3D false, virtio_enabled =3D false, vsmmu_enabled =
=3D false;
     uint64_t virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
@@ -102,6 +102,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled =3D true;
     }
=20
+    /*
+     * If smmuv3 viommu is enabled then increment the nr_spis to allow all=
ocation
+     * of SPI VIRQ for VSMMU.
+     */
+    if (d_config->b_info.arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMM=
UV3) {
+        nr_spis +=3D (GUEST_VSMMU_SPI - 32) + 1;
+        vsmmu_irq =3D GUEST_VSMMU_SPI;
+        vsmmu_enabled =3D true;
+    }
+
     for (i =3D 0; i < d_config->num_disks; i++) {
         libxl_device_disk *disk =3D &d_config->disks[i];
=20
@@ -170,6 +180,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
=20
+        if (vsmmu_enabled && irq =3D=3D vsmmu_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with vSMMUv3 SPI\n", i=
rq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
=20
@@ -893,6 +908,7 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
 {
     int res;
     const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+    gic_interrupt intr;
=20
     res =3D fdt_begin_node(fdt, name);
     if (res) return res;
@@ -911,6 +927,14 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
     if (res) return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if (res) return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1e526c10de..66ef3dfa1f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -224,6 +224,7 @@ static int __init make_vsmmuv3_node(const struct kernel=
_info *kinfo)
     char buf[24];
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    gic_interrupt_t intr;
     void *fdt =3D kinfo->fdt;
=20
     snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
@@ -254,6 +255,22 @@ static int __init make_vsmmuv3_node(const struct kerne=
l_info *kinfo)
     if ( res )
         return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if ( res )
+        return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property(kinfo->fdt, "interrupts",
+                       intr, sizeof(intr));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(kinfo->fdt, "interrupt-parent",
+                            kinfo->phandle_intc);
+    if ( res )
+        return res;
+
     res =3D fdt_end_node(fdt);
=20
     return res;
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 7a6c18df53..a5b9700369 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -733,6 +733,7 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handl=
er =3D {
 static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
                                paddr_t size, uint32_t virq)
 {
+    int ret;
     struct virt_smmu *smmu;
=20
     smmu =3D xzalloc(struct virt_smmu);
@@ -748,12 +749,24 @@ static int vsmmuv3_init_single(struct domain *d, padd=
r_t addr,
=20
     spin_lock_init(&smmu->cmd_queue_lock);
=20
+    ret =3D vgic_reserve_virq(d, virq);
+    if ( !ret )
+    {
+        ret =3D -EINVAL;
+        goto out;
+    }
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
     /* Register the vIOMMU to be able to clean it up later. */
     list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
=20
     return 0;
+
+out:
+    xfree(smmu);
+    vgic_free_virq(d, virq);
+    return ret;
 }
=20
 int domain_vsmmuv3_init(struct domain *d)
--=20
2.43.0

