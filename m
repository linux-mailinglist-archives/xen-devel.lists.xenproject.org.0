Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C086C51C61
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159697.1488021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S9-00078d-He; Wed, 12 Nov 2025 10:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159697.1488021; Wed, 12 Nov 2025 10:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S9-00077N-Db; Wed, 12 Nov 2025 10:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1159697;
 Wed, 12 Nov 2025 10:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8S7-0006fP-TR
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:51 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 978e5c21-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:50 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:47 +0000
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
X-Inumbo-ID: 978e5c21-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QU/E6D/VLWvTbrcom6n2/JUvZDwsJgd6kK2n4+lKTHmpUdkBrFU4wF5GciPKSsrpTLZe8PeD1xMhQyf4Qtg4IMa3bzkhlSDj+SoOdAe8vKGddMEIl+3wuJr40g6X1F7DSlLyn5yUfCrHpZaepZuvgUIKP2kEpvoKLXkCDbIQp9mExp/DA4KXSskNDhjX/pL/5sicG7+ELw2IBmUA+Q6UJqz2CSnz8VAmzUitsVZHjFt+KxWDdApWYoSi3iPO1DJ4rv9BWY0y1EZmVOV1Nlv3VrXCpjiOD8u3UOs8+xeO2VwZZIpGP8DH2f3fohd3X4JH5jCoDvjVdIMfLHPw/yPdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FxshkFkWOqZmPT//TbkNT6jPbFRsRNuCROPuKtzNAY=;
 b=KPfne4HO/C7co+vVmTq0MtrkhJjnx4uIpvZr7kGik02O4kJZ2F6GGIlZpmuO7lIE7EAOVub4izheem8qJHJSnWqXxlYGM4doI6cvEbXXLlVSjQcoRQ9QWNUg/7PyFofAJ1PvCcW2Cpjp5qoYtqyQ4CPfLnhljA1cs4AlythO2SI7KRKJvPpFM1AwdLqB/WD9ZDq2d8kLSYUWIR2Ofo19RORCy0ehtTqmmHI3wLkzwmX9iAi2LLITFg84gcRTGD820qmWjp5e+lNnaMQeB/a9gvhWegLCzw4o5mg2FNKaTzz3+ccV0W+sTTfW/PlkrEv7Rg0MedxFDepwcWCZNx1NzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FxshkFkWOqZmPT//TbkNT6jPbFRsRNuCROPuKtzNAY=;
 b=nC198cCGI9tZlfZ0caPgj6E42EGc++ofujKMmzLDCXthd5tdDEfB+lXOc/yJoQiY6N6i40FznKpzEl0s/MdsoYR2n3mxgytrl/BEV3eDfG6k3+LjVdAZ/eGt3JOasxP0MPBlQmoT2YAZglv2L9MhObn5Kl47ZNokb7QDPCcaCqF1PZHFokAKrdWuQ1fSWbxmFKp99pSZQl2w3kg9FayKztNx3IlehlD/Xuha8Aw2jMnzBghqlilAHcQJGGAvsj83WLoC3zTx9aB1K9G6wzpzC7OK7EBbfQEwUhhmT1ayJZLtj4fU2rKnVG+Xdl1bwZNo6AgWcVDabEaH51xZfu/dTg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/8] arm/gic: Use static irqaction
Thread-Topic: [PATCH v4 2/8] arm/gic: Use static irqaction
Thread-Index: AQHcU8JXITHNd+O1aUapS4pb98alZA==
Date: Wed, 12 Nov 2025 10:51:47 +0000
Message-ID:
 <64269e5a7989e8593d670126f488a09dcab0c9ae.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: 927b82e9-f60b-4460-9534-08de21d97a28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qguHDPPAHsCK6t3SxLIL33zg1OrjV6jjaxSQNGmUFADJ8Dz3UK+zxKHIcw?=
 =?iso-8859-1?Q?rAQg/0TG0cr0jFmRdSVgdCm4hbiVdp8RLCdlfPpXMjUwd+mSjGAT8s6V26?=
 =?iso-8859-1?Q?gWLsmOMI+GZfb4NUQDgEJLcbuWc3LdKgB6jXUA8ws4S5AMJaoZKcYmSPm1?=
 =?iso-8859-1?Q?SPo9OEK87kBqkVwL20AMRDvyJ2w/f5JlkFCdYgASjtpQiU38or0OankwX7?=
 =?iso-8859-1?Q?ziGc3fHXU6S8J+jII4IjTDx8BkDtqYk9juLmCcU8kEBIfARyKsAUTlVe9+?=
 =?iso-8859-1?Q?Fsi0N3NowIvlWyd+rV6nUwms9txI+aSIf+vjKTX6q2VRLoSCJ+2UrfFzWn?=
 =?iso-8859-1?Q?SEE1+jayCPrgWiD8IU78ydp0+3XdydwSEL25pCKnnxzoIoltj3l+oFT8UV?=
 =?iso-8859-1?Q?n78NW2hCNrLMcZICaDbiYbfUioj5NGz63rNUL8BVvwsvABxV1UA21ZExDl?=
 =?iso-8859-1?Q?Ti7XxGWfL1FPCLaN+0J/14Nou2Jh8nZrSimk0c8a6zzAeJbIkKTRMm0W4h?=
 =?iso-8859-1?Q?ZjJdLiFr8yo6hajAtjFzrKQI9kcFzlhtutsUDBnYVgSzrI1uXnWESUcDcr?=
 =?iso-8859-1?Q?7nO9W1KIv7DGMEK4D9xT/3QPtRABGUOyA/q/UqodPRaZXh6CdeJrtSLPDe?=
 =?iso-8859-1?Q?aFnB16MI9EtNp/1E49Nc0avonvQ4yG4HSRA13JESnsNIhJGFcTKcYSdASu?=
 =?iso-8859-1?Q?OQZ9Oae3RkHvIUm4bffHdikbxdrpzmlReC7QmAylUhMe9FZO1i8kM4mQGp?=
 =?iso-8859-1?Q?agSeGjSY/Yu7BEjkDUAh2wPjZTHOK2P2qr3L6GCjARdDGUpj0uKPqp033a?=
 =?iso-8859-1?Q?CJA0kQJwl8lcWs4gnkzcOPBwtV8UnfBee1PHwrvBew80IY5hGZLRUEESDq?=
 =?iso-8859-1?Q?m2UF3R3ZuJR/gmYz/WgiEeuDJbWTzSJV8lixUgDnR5QebVOnPlUbKW6Y8T?=
 =?iso-8859-1?Q?F2OB62zx0o5SaafRPITzA32AijRS1u4kdkroWeXxtQU6BB1WeTFRNqK0Ve?=
 =?iso-8859-1?Q?hwyOAXzqVO/whfZRyIWKzlsPWUCTPHT/F+SuQ6RxR6p74Rohu9s53igd68?=
 =?iso-8859-1?Q?qkfQplelaDs63viPyza2di5qVkdzaEJkoYTr6zGcovtwebYzQcuckM4j/i?=
 =?iso-8859-1?Q?m98eulgs48rhU/o8a+K/j8X/iHEhhhoWKc+FIw+4faYELU6HkuqlrVBphK?=
 =?iso-8859-1?Q?26+uY3c6EtTqmupzMjSSTVuNeaSCRzcZc4bHfUzjBldq2L/GDfCMiRdjrz?=
 =?iso-8859-1?Q?5mFoO6P0i+PNTmyZefGNxquRrowmR6R5a9pze3Nxo8fYa1mSJbqWqGgXBZ?=
 =?iso-8859-1?Q?bxRVKqhoCgtaoehd2lyZidZDvBtXP+XHePNbmJLMDX5BGd8EuplogNQUJk?=
 =?iso-8859-1?Q?54Xq1EsX+/so3lPCeBX4o7BLtBeJR8s3Na6k6v07wIjJHXOAleew7mshBh?=
 =?iso-8859-1?Q?cqzQRVLLhTohc2cZfHpxez8DXlVpRvKzhMUwgr/S7CKP4opimJ1q2VRYoV?=
 =?iso-8859-1?Q?D4ahc3c1sD2N+ygnStI6GNT6ryYNdpfWyGOQSY5PQu8ldHopI/5YZeYbir?=
 =?iso-8859-1?Q?fWo8As8/KFRm6+OyFY3FOqNUocrz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FksaG3WkQj/qNdlBZ85Xj7l/lc2v/SlMgmFkA18T/rwprQL6T/AkqgSBl9?=
 =?iso-8859-1?Q?9YKVf91nSgZQ0DMSy11iBfssY+oWV414UFbzZdxnpYvyo3Ko1O2AurjU7a?=
 =?iso-8859-1?Q?vllJAXv5TMaLvDf1jgE+tOPvoLilUk9sftu+nrb+9Jkb62lOW9jMV2/NP8?=
 =?iso-8859-1?Q?TammXpA/TaJdcGNfO83znvktF1wWdTNnYzXYDV0NhvE9vCC+f9ZDBB8FSQ?=
 =?iso-8859-1?Q?QtKqajOuK37WTU6G20o9Yzt+d74TbXOU9J9ul+TfnneV/rZgj2wmElQ22m?=
 =?iso-8859-1?Q?HkOWdOf4Wbh+mjLyTxucl2DrBLO8qAmDHdpWXsUW4GYhXB9kFdPKoWneho?=
 =?iso-8859-1?Q?lWQ5YeBnL1hzAut+RD/+L8WdmfaDZKaQKewqUVzUNXRTwGiPBs6307f4a0?=
 =?iso-8859-1?Q?03Ulh2ti6GqRuM9kdNcmulLi/f6IXIfOMBjF2ATvgfHG+ep3Bx4RWsusnY?=
 =?iso-8859-1?Q?t3A9uKSlr+hDGtcZ0F4yC+F0Obz7thXx4Jh0W0SKDiEdrXcnmia37sl4+C?=
 =?iso-8859-1?Q?gF8r/dgt8O+9yMEQfKmrhlil3AO5t296Nkby2lB4sEGO6J0A3RH+7EEKfD?=
 =?iso-8859-1?Q?1WDqUij1Qpc5uYqcoGaaQm7T/LQWT5ycwvBAsSpFWlaW2Gct5olTvY/g0v?=
 =?iso-8859-1?Q?aIXgSS4uh7v5gDs/ChMGm8/Y7SwowCKv2sT9fBJEkz+BcNjessjCTo/Td4?=
 =?iso-8859-1?Q?5Wle0fUF8qxA8LEHFs6gZjAdIU53ui79tQYHF8Ah4E5Iz1c2VV2G75IG/O?=
 =?iso-8859-1?Q?bs9hgEDghXq6dr/wUu/iZcdNM4A6mHjf8pLi2DtURRfIwVHueL55F+Vca3?=
 =?iso-8859-1?Q?BhM5BPejz5qcUgC/pu5K9xC3FGELBDI8Pl78pQLzQRDkWzPrQ/ACvufNhJ?=
 =?iso-8859-1?Q?vLYflH5Cinqkr3bdDWUwRAnk04Ik6z1SyjkGc1CnoQP238NttRbc8tGJgd?=
 =?iso-8859-1?Q?H8BpJhZJCTaljP9k83p4UaVQJrv2bXTtFunqqPI0HHhaiGWt/5u0hBPj9G?=
 =?iso-8859-1?Q?GhhcdnfOGm7847lp7nh+my7rNRsMjKGopOobb7ZS8eVSXwSUrAOMwo09dC?=
 =?iso-8859-1?Q?LB7kd2qm45vhDUusDOxiM7y6hOh+EBlIVacVGGRvh3V58QWb2ARLGLx/X9?=
 =?iso-8859-1?Q?q0N6JoIoBNeCAF27+UKO+nSYQnI6tf+i6UJ0shLhGU0k1Fh6vvTjq+Cjtv?=
 =?iso-8859-1?Q?hnjrXzeWW6Y15T9vkzV5TJ3EVKD51d4dJCDN5s/B7UlPrEA+rL1/knyJLn?=
 =?iso-8859-1?Q?Li3Pda4XWgR6szMlYJ+PdHtKQ/n1l7FS/iQaMntgiKqFmLxmeJpZAH/EWt?=
 =?iso-8859-1?Q?tOQukRqc9RpPqMTMW/7rWvbxmez1mnaXWWUj0+ptSRZtMBlHbSKcwMczLa?=
 =?iso-8859-1?Q?ZUHHqrob4MIwBoqS+icI4vbOR8u0+vab+K8dyfLSFtdr4xT6KQ7lJ9iF9j?=
 =?iso-8859-1?Q?VBZ8t1H2WiB0IkwuqSZ3PRmZocduyzy9o6zOeODuG2IgeIupN0y4w/WGNG?=
 =?iso-8859-1?Q?DmMz5TQ0RM24WF5iMiVdq/3C6662/+QvY5DnlutlYly2exDe+VNKrrtlYm?=
 =?iso-8859-1?Q?KpCj8aM3WpVSWLVMdSCc5ZG53+VvKxkfObU/22pCHcwdXzekqiCfed5wWB?=
 =?iso-8859-1?Q?1mXa259zVyq7ZXFPnqW7K3Lu7i7P4Cz1YQJ6SbpbRU/cC+uW88q4/vvA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927b82e9-f60b-4460-9534-08de21d97a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:47.3691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGepZV0w5ptRmN7w+OQxOzcpFflsxNL5yhumyMH3f6Z+T7EwCy8IFT2N4wXW6j8k63V7NKHYq2cJ28ri+umqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

When stopping a core cpu_gic_callback is called in non-alloc
context, which causes xfree in release_irq to fail an assert.

To fix this, switch to a statically allocated irqaction that does not
need to be freed in release_irq.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>

v3->v4:
* make irqactions static
* collect RBs

v2->v3:
* no changes

v1->v2:
* use percpu actions
---
 xen/arch/arm/gic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 260ee64cca..ee75258fc3 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -386,10 +386,17 @@ void gic_dump_info(struct vcpu *v)
     gic_hw_ops->dump_state(v);
 }
=20
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_maintenance);
+
 void init_maintenance_interrupt(void)
 {
-    request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interrup=
t,
-                "irq-maintenance", NULL);
+    struct irqaction *maintenance =3D &this_cpu(irq_maintenance);
+
+    maintenance->name =3D "irq-maintenance";
+    maintenance->handler =3D maintenance_interrupt;
+    maintenance->dev_id =3D NULL;
+    maintenance->free_on_release =3D 0;
+    setup_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance);
 }
=20
 int gic_make_hwdom_dt_node(const struct domain *d,
--=20
2.51.2

