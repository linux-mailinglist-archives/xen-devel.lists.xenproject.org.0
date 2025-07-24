Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C9B10E34
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056245.1424498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRi-000678-Le; Thu, 24 Jul 2025 15:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056245.1424498; Thu, 24 Jul 2025 15:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRi-0005vb-DI; Thu, 24 Jul 2025 15:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1056245;
 Thu, 24 Jul 2025 14:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO4-0003Cp-8a
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:36 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8709381c-689e-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:57:33 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:26 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:26 +0000
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
X-Inumbo-ID: 8709381c-689e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIB+q3xHMg1+DHHrst5X4AS7XNhCs0lmoknc9RmWKRr5XVaz8G5clMUbveOujt5w3j3FIi4McQN+jMSJJmN1AbItrHiMYVkJ3+vDydrifvtF4VHIZGih5j/wphTR1krGdqwq1LhVd7K3lfX+XdVsJrVa1NZqlwf0+6fMF1v+O3kvC8os/yj0OgWO0MGltochq5d2oalhGntHzo4XhGKMUmHQOqiFQNBc8bMgLrra9Zxa7U5ayNsRvA1EE/o+rVXmXloxi538kZrpIF44T7BoYLliebZPPSB8BRv3RNCB1vmnABZ0nR3wwLOfPop6OV7iBh11fbqpE1oYQkLIi/FZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K3SUakFmg6xlGlkpHdz1OtpeXQO9IpQmNbrCTPpuSs=;
 b=fvDV/XTWPefu1UxKosH4IrrbbxfqVNwRVZfp9K13mlUACF/DrALJm9gTHjfPfrkxbKSJZ1QkXfPG626AB5DGBqRtLToIXDD9w6vjKKME5rwMz2apGpLApzd2hDdjjZTFqDYwDg/PF4p5scZxEQzU5lM0jG0/i6tdTlPhhKfhOum/EPUpzzNvK2L3S4E43MYtb4rY+iUN838hU0YoUkKMRME59fFzd8FJQVq5drtSPvxgt17jDaWR5T7/IpCpEqVlQ3UV+QN8IBBymob5lXn9ZtigGqXEI5qwcfCt3vC3lgeYfIx3i/CQjL0nwjfq4TxmHYM9zWzrIOfen6LOMSBX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K3SUakFmg6xlGlkpHdz1OtpeXQO9IpQmNbrCTPpuSs=;
 b=vfiHA3zQFB51L/EZIKFBu/a6UIXEWfhG0KAvriJNA+BM2nqE0hSN9RVSBjEoauUKOi3eX0efC//Fuv7j1AHwc4GR6+vnkA0N/mfzeeML470FZlIX2ZCXb6N4+zUbd6tmkG8hxHaam2gVaVXqtlo3dnsYHfm15VhqhbUE4tU5k3SLYMmXQKKRQSJ1Qe5IXVV/bjXnE0YprugGVaJPkDbfzna9ebcuA3KmXOC2deZ0Ri4df/UyAZWswvYECOBiFkVwNMepfsm21GEIkrqvuzupdnwGvOaXvrKbkCW+/haStU2On/cfkyxnJoqAOVxjUYZku42E1AfDQ8cYCDaixPp/PA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/10] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH 03/10] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Index: AQHb/KtEYh9SiZdfSk28/CwfX8TIUg==
Date: Thu, 24 Jul 2025 14:57:25 +0000
Message-ID:
 <790b1d3876206c8236986d7237173dacae99cac2.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: 6e70a7d4-cfe5-4ca1-e595-08ddcac2675f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Asabo+sr8fwaiY9O+Tak+vXfCgx8HEAU2xntvBnIYymibpgm2mtSu9cHze?=
 =?iso-8859-1?Q?dGBTlQRAQeVFfQ10r1wRXS9HGDprLVqvvftq4LLwYUMk1lhyVSH+3Ig8sr?=
 =?iso-8859-1?Q?KHTlWdCsPSq2WvSy47WHkRBKIyzq9VUSk6wUF+/HD3FY02VbJvReZ+2PwL?=
 =?iso-8859-1?Q?oEq7UsO5pcjkOvCaHdbskpVbk+AxuIYc0UCTNak6HpoKmq0Aq0sm7JcHxE?=
 =?iso-8859-1?Q?jq5tux+N0ULx39F6y0DEk3Dk7bkhG1ofePi/HjHc3EtaB3C0T7FNqXhU0/?=
 =?iso-8859-1?Q?4X0BOT/7zb89A0QXMOuTR1jMQV592zOEu2uJmXzWojJy7O/okOogHcLcbl?=
 =?iso-8859-1?Q?xTldxGSHtfnvBk02Olc1fv6+ZBj7V1+S/e/VvaNcZtZSUG9JEdiJZxnXBt?=
 =?iso-8859-1?Q?KryO6D/vaZpebzzpzqwhOk2vHSo5AS4g0msfVFY485Hq9BZLSjR/I8n3jL?=
 =?iso-8859-1?Q?agaXuwAXrsdekfEeXVLIQl9Rdd1dBELV1IR8KpeN5lnd0G+mEfpSPNxe0M?=
 =?iso-8859-1?Q?WdaI+cphBlC1a7SGv8K8WTDF10vB1kYCTusynK4P2Ska31eLnyPW0voZDA?=
 =?iso-8859-1?Q?KhCecMwPyA4JrEtDF01LYB6oN6cH53e+DJvSjYtTK5oVHGUpzVWKKGhVTC?=
 =?iso-8859-1?Q?qjUgRbifNWlJQY97dWJdE466SpdWdB9djCDU2PV/9AhElJS7SVWSAt0Z0K?=
 =?iso-8859-1?Q?KRWW5h7tuX6+HgrjcfftqOh6lye9L6zPDeS8eeJkpAJyYTe5cXC3hJxxCF?=
 =?iso-8859-1?Q?qbx54kmacU/VgGjqPkTq3zCQ97E1FZABEWoHwhpFOM+0Hg9xj4wLSIvEPM?=
 =?iso-8859-1?Q?4xhjXpOvmpBM6a09PpNHtC3gR7P1g2cQe8fwMfR70FB/vOl86jg7U5DDYL?=
 =?iso-8859-1?Q?C58NJFq11+Fqt0ZdTUAnLMbbfBRDwx8AVhmSK9C7ZgHFxWtCbibLWUJE8/?=
 =?iso-8859-1?Q?HiIlt9w/qJKQiyhAgRIGDoeL04o2pY7TV33wpnbggi282iK+evhcRg8hvo?=
 =?iso-8859-1?Q?e0mRuh75HfNntXZg7GTQ8Ly/3YFfjMsxoltJdm2JFZgzids9quUx1pbd+I?=
 =?iso-8859-1?Q?KHV5tBNVOSvL2I8e42N6SKw8iCKR52aRcmEDStoG0tXUVdX84pehoGfBxV?=
 =?iso-8859-1?Q?JdOQE2zrQ3uoNCLq44sLAg+Wt/ftkzHefUWVV4t+eDwhcmFu9suhjEthnh?=
 =?iso-8859-1?Q?aB/VUchZKuG8hbyRKxaG55tzlOXAbeJHeJm8n85NYVpU2xuxADtDH2Avq8?=
 =?iso-8859-1?Q?zLWui9wWsJ0iaCuESrzW44YS+Jwfm8dxEpRS9GIGG+nJl3oYmRnnCjOadk?=
 =?iso-8859-1?Q?V5aqSD4XQFOt/DC9n3Y06QlLlcCVEp8UpBfxGV9XpXPiie+c6vKu+mRntR?=
 =?iso-8859-1?Q?iRSoyiHMzAOdoNkaW1CSRR7T6H2XvB9XlSxfvyq4GZlj0YgJhV7hpZVNJa?=
 =?iso-8859-1?Q?l5gsXkChookVWc49ypxLUSFfIwPLlAPHmTA4JOPBk/SbEbMju5O8HBnlxC?=
 =?iso-8859-1?Q?JQltzGRCe6Kr9uqaGcJPnN3ZcY63VgxDlZ1PBSk/jmOw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1q55RAMLjQFXx3FsdDLQlzCyM4UEybS7EeXrGG4KrGAdVv3XJFUkEZ0zdu?=
 =?iso-8859-1?Q?mAhcJ83OPd7Q9WmhUMLTUP9UEksD24ALkbwLqLw0GPprXIIN+OY9qMS4Yw?=
 =?iso-8859-1?Q?sFaZgNujCQufcT+Rld4o94qSNbHoBgO7UEYaMgME1qslv/k3aHmQvm9G39?=
 =?iso-8859-1?Q?PZNR2+OnNMcHrPy5D8eNbdLxxskgqeT5dwH30mUC+wqYZZaU6JAAPrmfQ+?=
 =?iso-8859-1?Q?VCCLjtU00q+zucGJnSCGrvAdz8GMNe3VI6eVyHiwwcU0hBhY67qGYYQEAf?=
 =?iso-8859-1?Q?de2Bk1k3nB6oob84v4kaT3ulsBnaMFnNaqoISD0zE8I0GQrOM0LSOmhqaC?=
 =?iso-8859-1?Q?HfdBCgvGcxNLCocmAAF8iJUI8EuN4DZQCZsVvi3bj43JAZJkhcBP+scsdK?=
 =?iso-8859-1?Q?9AAgOcFOwmD/XrYooWtnsV/PM/kVHILyN+AyrQhmJjOwmqerem8qYEwW+3?=
 =?iso-8859-1?Q?/bZ7q06A8/b2IWgmTI/42VjgUwtW3PhZg7BqGBx0LcUWwHr7U6JzAOUN9l?=
 =?iso-8859-1?Q?7TubmQRhuJBa9RdTP0KMMsmdbGycQvV3yvv5/eNsl5ZhKweTIsOfL055Ts?=
 =?iso-8859-1?Q?GymJuwYFqamdJPAGDrifRSzAeEPnEFknyH1/WXL0a00qVUGNfDWdhW4jVy?=
 =?iso-8859-1?Q?1OzytVh3lVZ3cBxPthvljd9KwBWTgj1Ev9RXOBKeLgysb13kdD/grRjCSQ?=
 =?iso-8859-1?Q?kXYlx2mhHrlgrNKSjMSnDqj4Jfkxdohtd9glLiy/7SGTsEMLQTsDqcHz70?=
 =?iso-8859-1?Q?2aV1PdkeYSwfKqntS9iNnW9BL8D3JUHR8f24y6qmyVSXwacP5Xu7cS5Agr?=
 =?iso-8859-1?Q?85INJw4BwC2b+2l0z7IXO4in77+MYcQB7BR5gpPkjnSkMzhYHArSrPxfpi?=
 =?iso-8859-1?Q?7HiRWHdiArpsB4R/FlIzhUhk4Pq1dSa8QaepTRmO+e6YA+VO5Lj+D3BVrp?=
 =?iso-8859-1?Q?OWfBVCIYX8tyO0oGbi26Hgi631mSf4QrVYMx1EXKv2JT+slLKm3SYnsct6?=
 =?iso-8859-1?Q?nmTN/SrEUl8ZLRsGLVpgUDsGEt7ka4V+2LZQX9/SDUW3hm6+H33pQly8R8?=
 =?iso-8859-1?Q?YPvll0W3JkUTpJ17OmsJ9NJZV3CZKR7jfrZK58IQub2KLper/73gxTmEQ7?=
 =?iso-8859-1?Q?0zhQUHzDfojjrtQravX0NVqs8Njz5OIlr4oGkMLJRGQM0PsHeKMLe5u+1z?=
 =?iso-8859-1?Q?EX+jV8rZoYyelacCQhn+IsQdUFTKy+MhHRHNV6vRmOb6AGM1paIU+TQ8y5?=
 =?iso-8859-1?Q?32GkUMkQVG2PIlzB6s+8fk1uvycgMSFPsjAZ/PIO12L+wh3id4cTXC+qUE?=
 =?iso-8859-1?Q?43PaVbRHlAPtTn3dazzYYtUhAoAeEn8vGSY1N5g0Xt/ijTKKV2jhMWEZoj?=
 =?iso-8859-1?Q?zC/xxeap95nY8Zbo+mW8ZOAcyKA4kP7EpzgFeSyndLPWNTHh3be4pmG3YJ?=
 =?iso-8859-1?Q?NgL56qt8Id5f6xZesh5eorHuiX4Bu2N6ioN95tHtxYstDtWxmKsyxHw9lY?=
 =?iso-8859-1?Q?Kyb1qlhXj9CpxkkcuAMwVwXz9I9FBU1b8ny4Mkh89dH6hJgcSZbkOj7shz?=
 =?iso-8859-1?Q?wLLxzAKgffqBKOBDtw6qFoATUr/WNGyCHA0273TR6dTXBwIkZmjg8MBza1?=
 =?iso-8859-1?Q?iNORDFMMO8LysW7wAKowUKn41+6I6qSo3vwVzI6cGqlo8Ij+TxpEideMTM?=
 =?iso-8859-1?Q?nYZrr2FVL1tEw7alnnQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e70a7d4-cfe5-4ca1-e595-08ddcac2675f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:25.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vz3AmfO4bSbh0VZuLOABsSMBV0xshO7ELoJQKwmcNjoDpl+OGK3YOS6X78wjSPd1r+JutNluBdennElCxVyA5Ct86o6hgRPc/DT18S5me8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/gic-v3.c                  | 68 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         |  4 ++
 xen/arch/arm/include/asm/gic_v3_defs.h | 33 +++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 8fd78aba44..476524225d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, u32 offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            break;
+        }
+    }
+#endif
     default:
         break;
     }
@@ -645,6 +675,35 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static void gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr;
+    int i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYRnE + (i / 4)=
 * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLERnE + (i / 32) * 4=
);
+        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVERnE + (i / 32) * 4=
);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -690,6 +749,10 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+#ifdef CONFIG_GICV3_ESPI
+    gicv3_dist_espi_common_init(type);
+#endif
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -703,6 +766,11 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+#endif
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..1c4e3cf31e 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -316,6 +316,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..7f769b38e3 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,39 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+#ifdef CONFIG_GICV3_ESPI
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(typer) ((((typer) & GICD_TYPER_ESPI_RANGE_MA=
SK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

