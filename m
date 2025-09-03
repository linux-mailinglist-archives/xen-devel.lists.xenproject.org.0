Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A07B423B8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108428.1458588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoV4-0000oQ-RL; Wed, 03 Sep 2025 14:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108428.1458588; Wed, 03 Sep 2025 14:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoV4-0000ls-M0; Wed, 03 Sep 2025 14:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1108428;
 Wed, 03 Sep 2025 14:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoV3-0006B7-0s
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f6f6876-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:11 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:06 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:06 +0000
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
X-Inumbo-ID: 7f6f6876-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojVnU9i0e/k2uXXUyTxvpi/l4gAUvlZ+zw7pqaLaWwPTCg8AE36ZHRELid3jh/Tj64MI/iMLl6HocHuPPJFXVtLiDNScy8gskFflsFGJAfhXMvOxhGlN5Ebo0GikxrVtQIvVsapSD4b3om4P/s62FHlHje9cJOS3BAI49M64Z76yAWebgQcTybr1JJIg+RYQz2kn80yGqOEZo/XcjgPr/9malhkuSSyS5AgljrlEPfnLd7APKcgmb7QL2HcahQ7gCmu6qS6rGVoBgJKzjLi849KePdtIYlOdITDBC2nN0dUkc6NPJ3B0KAfFp4ncaMFcpOo23MpECCSWS2jaY5VWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt+MrXSrWQoMopLt4vHzSv5xdwM8xeu2Xm0s0Iqfftg=;
 b=KfGUPfy2zBdeA6vi0N4zy/ERgTdRQJCsUttpz/qRtAx+hDa5t9AGJr9g/lFGQH86c9TBKIb8H8ZCOrD8xrk87Fxva5UuPyfaVxqA1Vt/N5lyiIzF+OniievDyQE7KmXKQbeZPD0A+OmLUicR/5vCTailPpgBhGd7ku/Djte8YfF+dkFVWIVJzHM2VcWxmqY3lI5XLOr0+qpR5XT9ber2J5wWw64BSmPVSoABp7/F0CI2/1qlVKpUl+BFFNbmNm+CXFqdvxagKFEQvJBf4+uK3AgpRGLXWw1/SNOUXijmSlxywfBwEUdRRzstPBnP/CQMVkZt0wZbtNa0FH4XP2bNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt+MrXSrWQoMopLt4vHzSv5xdwM8xeu2Xm0s0Iqfftg=;
 b=lb5J5+DsoXWKboLiagADShRQninZjQAi6PPwNsXYh983IqC+LCDvzZpC5HFl9m7CJx0QQSG2AfuF4hdY1PHEqIHGuu503drZDMcVblkChOfh+EaqDRUbE8wefIbO0zKHSsjjWyoGEP52r9lqXF5DG/AFIaqhpB5XyBIC7cbnJ6eeZg8jD2n428vzCUkv9RR1DTiQnVLiNSGfmu/SKj1JkKAPl60lHf3Sw/JLQv6DeMtcDFMTv2MBTvKKBFbIiWrgC9+d/Iq4muPpx5LNErFxHL7tHDr0NuSKJViDDQ3iPrUg8VmqKoIN2P3Luu622OYx2D9UHHCspYcl1/xHXhuqXQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Topic: [PATCH v6 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Index: AQHcHN8+OArI03lw30qaP2eYXB9+3Q==
Date: Wed, 3 Sep 2025 14:30:06 +0000
Message-ID:
 <8769853433e9f5edb9902d88b82f8ee922b5d319.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: b1fd2df0-111a-4a34-eee1-08ddeaf660a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OcFlTO9Ahvg1dE5ZTbYhzF95WwEe+BcuQmSWG+vodP/a79YniPH2/VdWwz?=
 =?iso-8859-1?Q?juE2mN/gGdw8ylwasOcRbrHS4dFjHFkWIaPvKwGX4+Rr56Pa2G9qKkBukn?=
 =?iso-8859-1?Q?Asre2JTLjhdrccnhlRMWKPyIjlrpaV9EU2mrU8slI0syUvXYc8PCtgokrU?=
 =?iso-8859-1?Q?QTY+jok/e0lPwkdEw1+EocQICFMBG5yhWdE7l5+aMg7+tf66+u8LdF0PWW?=
 =?iso-8859-1?Q?hUHOv1i9OO8JPZITx+w8gcFT3yCKTfrObyGdNzO7m27E1BmrqF18c0aOWF?=
 =?iso-8859-1?Q?nk2cPE+0kZaLGijqKacu9iCCdAlmPOw1qurWuToBP9e0nopGKu1g2Or7y7?=
 =?iso-8859-1?Q?AzuBJZxAaE2frFK/KA+9KHvUpu7wbaGmiXRCuVorse5cExxVUGgJy32anH?=
 =?iso-8859-1?Q?Pynm1watlKiRljl+vgDUPgLw6pXRW3qAR9yaB4D55k9f4T9NKaWLF53xqe?=
 =?iso-8859-1?Q?w5kkZSAXrX+7Gygx4es1jR8tvI058EeBG61tuvg2MDWclNm87tiKIrcCxX?=
 =?iso-8859-1?Q?yH9fk9neUiZvqHd0ZyAVv1fosJDgEAqSBBzwANxZ5QR6PjEBsxBzT5onUr?=
 =?iso-8859-1?Q?K843zFK9kzkCNMEFyQLhLI8WAqAGSZCX3wj+81+80OlsaoHWZrLQQ7eXVZ?=
 =?iso-8859-1?Q?mHRc3FhIbr5QGHZRz90WuBCIbJz9kVnMjJePkFqR1O2SjuTWwRznc16n09?=
 =?iso-8859-1?Q?rsGaMUhlscUwn7vLrKzFfQAljauTxnf+QVTInH0N/ll+uZF7QH4W/VfCF6?=
 =?iso-8859-1?Q?E/n9Y9AswSVwictJzfJ5KZixPuhWC+gXyvxbgRSQj1wWsDOcieDB6vc0Q+?=
 =?iso-8859-1?Q?SFhp5ffDHhsPs2Gct2sORuRNMfE4V+n3qQBW9EPbQ4EdQm/1zw2MAewYzv?=
 =?iso-8859-1?Q?E1hzW2mZJjOUxddCxK4aIhuiQCq7Sd4UFfDBvkqww59NbgZIYF0o0gNTni?=
 =?iso-8859-1?Q?UNqi2NqCwpcF549Hw1P0x1KAFm7pYHhlpSJjYagq3dmp12VWuHf7fqOfhf?=
 =?iso-8859-1?Q?JJaXARZ8UDegsHngvSfDOZ5E0+GjeCpSH6NjBPCs9y0EXk13HxRUo3qJ9C?=
 =?iso-8859-1?Q?FNZ5aYrI8YY5rsS84hjU1kHSZD4YwVrSHI1K9SxRUKyV8heKfOULqjSWAs?=
 =?iso-8859-1?Q?Aey+TozKLavj2JPbNpHhaIZLloEsj8eZovAEURyQvI9V2zGvxlQydvjxI8?=
 =?iso-8859-1?Q?0EdcX5D3SLIA6vnDlTDXH/dnV0PCAOd0yBG4w90U/PV9l0sgaTTY/ySek7?=
 =?iso-8859-1?Q?mbybumtqyse8T8uvQnPQSHh7J56/sjCKcK9QjNQFDWJSvNbni2cpRo6rMi?=
 =?iso-8859-1?Q?Gczyp8GIJYrPmpF3kVaXTrf8FnZxuCnrO+IqKCzhbVB+N1k9ADV9nDnlRO?=
 =?iso-8859-1?Q?PmfHOcee7YPwsjacYymNjGeXKFs1iMuXTjc4JVlGNuk4cuK6dkhzCh6UeQ?=
 =?iso-8859-1?Q?TKAMmOah+Hl3x4ANNUM8qJJToJYxn/qa3a2NIbyZj/D6bIa8zg+PAicDdf?=
 =?iso-8859-1?Q?H86kKmpa+8Nec/HB1RHrblWVMpjkEEPZ2cVdvNLwfpFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?854JDx3e53BdeJPMshHgykj/C0sWRWVdmmgdPuj87pxCxUZ/CVQzzyVp1C?=
 =?iso-8859-1?Q?ffat+Fw1b+xO9dOMYTn69Aeq8nr/drJ4Q/+fKoViYDeb8CZaU0/0z4uBTp?=
 =?iso-8859-1?Q?vtNNb02vl2rqSuTfB8NILZcXDPPFY6o9eTaFPSanHoMTtn0XCzcG1iixBP?=
 =?iso-8859-1?Q?KD8K/4VmsHusCfk7VySpGviMi8WqrJ5sdmzuV9n71iHG2O+PWSUyBM50A9?=
 =?iso-8859-1?Q?k2LC4JUP7UTutlYrC/Dlikrk/N30GaS7S71arZKg6uESQNOsPV7Vr8f+kq?=
 =?iso-8859-1?Q?/1gug/XLuJWP2D4M+shDwxkaWfF64Kj9BF23jmv2rHHkA36FJxryo14Pcj?=
 =?iso-8859-1?Q?d+BapkLjQaeKMb7lJtcHtWaXrUr93sH+TjuRQiVBFigr3m3VQwhPdVELR9?=
 =?iso-8859-1?Q?LbJBMInYPZDnsprYEFOlj9TIdFvOs9vAqwSmTLH0qfJbpXd+gUHXcv9RaX?=
 =?iso-8859-1?Q?UrpZhtckBXJFOkNPJJ3nVL8VhZWFuRgnD9smD0ntdWILPaYfEfvwgEYJ8V?=
 =?iso-8859-1?Q?7prdjatu8a79sEpc/730vcFyK1/r1iwNrfDpjl/ChbgzXjHAAa/bDs+LrK?=
 =?iso-8859-1?Q?3cMbCAW3GkglM98MBbPe9RY+BvUEbN+kt9Xh/1xkLqpkZl+EmPPrQj1Yas?=
 =?iso-8859-1?Q?HPMzmOKxIUEmKB+XevJzV2Xx0VbRD8gFOa3iSqBWX7yOPx06rINl4V/fKh?=
 =?iso-8859-1?Q?7si2w20H5JbC/saqoeYlxojsluDogtCiD1JVImD+XvvEHduuHO+oYjUSgV?=
 =?iso-8859-1?Q?RlsLCNb+pN27dj62TfPpsyZOT++KT+QmpynDZ3pZjrKYnB1oYpdZxzGMyK?=
 =?iso-8859-1?Q?PHPRVPeXK4Z1a9Duo32qj+kZlrAJ6Vtl1Kmu90olON/92NshGfeWD3gvke?=
 =?iso-8859-1?Q?/lbIEdj6bCIrNjdwPiYHYNxvLNeAF1RIWPtnOsO+1Q1hEe/1eU+p4TwTx0?=
 =?iso-8859-1?Q?xmuq3noGelkKvyYhtlDhgUtAhGToTmmdT0yn7EFzS2nT+KWHGN3ORyvmXv?=
 =?iso-8859-1?Q?A5vFWRrcQz/g/wJN6dnUOo5MhKPfg5ax1UWP/wqoS6wsvFFJerQdmnjeK8?=
 =?iso-8859-1?Q?e7oR7yDiLaplbBrRDLBVV9VQR6Du84keniif19V5wmsGyaYOos7IFFHuxr?=
 =?iso-8859-1?Q?2s4CwzxLswHQz2hF5RKTuIwu6J8JsHAooxSxrwGknL1rj9S5Cg9GfuViBT?=
 =?iso-8859-1?Q?HMcrAjfbatkyhyWePsuL/iLn0uBxX7jureOonmzT2Xvmkqm0+U6avzriFV?=
 =?iso-8859-1?Q?zeAhACXUMAVoTv+B2wiHEizEmnA2qTi+6PGiBQOWM354Rs8CTWwPD5DJ5w?=
 =?iso-8859-1?Q?d1Rh5EOUVFBHupM1sHu1NNuggKKRWMYQCNz9//SaMqLI7W6CwosFIEa/EW?=
 =?iso-8859-1?Q?H5cTA2sFx+Rk7Ol3R3SEPTa2tCevd4aBjpxqUQg+6PKBaE475aY+xsywJR?=
 =?iso-8859-1?Q?vm+2tUI/M8MbnpVz/Jly4iE9BbNHcm1HHaU89mVfbCd3IpoxcHS1C4qslH?=
 =?iso-8859-1?Q?UQFYD9SXMOZPUq9qcGr4WHTjDTA1gWwS64fY/6dQc/pCGqI/3cAAht4cO+?=
 =?iso-8859-1?Q?rEg1ZzuJfC3ujv1xkKN4VCFrR8rp3Fsc81ctrnVOeB8Lm6XDqO3jHLSrWl?=
 =?iso-8859-1?Q?bcviR2qXeeRKjouYLqKTpCozZ8JGbnGqm9dUP872UfE/eA0Q8k7PVTCoup?=
 =?iso-8859-1?Q?epj3LcL5Gm9dbOIpvyo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fd2df0-111a-4a34-eee1-08ddeaf660a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:06.0589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYvbarSqhVTJraaAcN8XUUECdKfGyxE/Ji8VDlzJ+Dr361A9MK5Lne12Hhyd/gJhAuziVHSG7/cQIpIo4DCZ2tcgSxt6g0Lzfo7K/OfBFxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

The gic_interrupt function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1019. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V6:
- added acked-by from Julien Grall

Changes in V5:
- no changes

Changes in V4:
- fixed commit message
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- no changes
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 9469c9d08c..260ee64cca 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -342,7 +342,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_f=
iq)
         /* Reading IRQ will ACK it */
         irq =3D gic_hw_ops->read_irq();
=20
-        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) )
+        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(=
irq) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
--=20
2.34.1

