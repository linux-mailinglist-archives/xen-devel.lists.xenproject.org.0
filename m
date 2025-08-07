Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49568B1D7F7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072927.1435872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoR-00021t-Cd; Thu, 07 Aug 2025 12:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072927.1435872; Thu, 07 Aug 2025 12:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoR-000203-8L; Thu, 07 Aug 2025 12:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1072927;
 Thu, 07 Aug 2025 12:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoP-0001m4-Hz
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:37 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcda59af-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:36 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PR3PR03MB6425.eurprd03.prod.outlook.com (2603:10a6:102:75::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 12:33:31 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:31 +0000
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
X-Inumbo-ID: bcda59af-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsAt98nWPiu7Kl83rRVH74UqFRGYcqeT7ph12IL61gVIrPg/q8OGWBmEuzVP+u49Kt/6gNWKy4ly9eeP8n94tc4yO42EMxgJqpcvU4XlazWph1JiOZN1y4iJbfqzS+Kc57Oi9SwGs00Dt4wnIz06dHfWZ3TpLBLpwFUvURZ9yVwRoAqf1kt5+3uuVEiHiGfX4UM67Z+zdhVx1BTNyISv8W5cIJ8UrRxg5Hsbgq7HLLmwlJ1wtkl1jOLZIcl0H/uOjm29eQT3QutuIrS1fmbwkNVkEhNT6HQJuB/gx3UXB97AzJ0R5ukTWuKFk2ES7KpoiqEfb2qp0mEa4w7Dxr/aqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC6NDosY+1Aunr9L72guv4I+Ysx9FQyAJ4/28AnhYr8=;
 b=qzbUXEQHatSLfIkr+H9s6uLSRrmtN5VcaybRu3J/Lwc3UGATwXCLX/Onobf6cz2bvp7M49uZc8F7Y+zI0Eg6UPyjuM+mwmNcqkA7T37vjf7+BRfFL8SaMyYJi3BDKdJCKjI92JL9RKP6KlrKHSS7qK2C6zAEfNdvWbQK1q/1fP40NmcbSCVGi7IqqH4CzZLHCnJ24j93/r8Tofs6tYjI/j5StEjjbRc5JUINOgd8k/h/6SrtBFVQk3hE5zi0suHPZF/GBhrmTXp5cMthHJQSwuQJ1KKMIr9GHZxXHJyCAJUwKVmADoZ4VXSItT6CKoAEqgAWS2p9hOBgXd3pbgFsfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC6NDosY+1Aunr9L72guv4I+Ysx9FQyAJ4/28AnhYr8=;
 b=JAqVKG7jUDT98vRPMyldbDOzZOWAZFwiaXs+C8n8K5dmLyuLhlIjCCxj17+y2x5/mOsECKNFg5ELqG5OzwNbmRqVBR8rMNJNm8x8E6gzm+jNIzZcfTMosyO+rGKFz99lDGPZ45+QQeNgSymDLIDJLKtmekA93Y6wm5lvfemx6EfNI7bdzp8UUEtFM33GYWs6ZWnoe6+MMtGvzb63sc7zjuIcufdKwAy6ngVTygGplc2ZMsFxJCd2jhzFQjE7Q5pgRgUF45wOdhbHvDOMfW8bfMJwxmGDSYObWoLAZXpFEG/dp0gHPmgNmt1QJvU7cgRn7vbl9YTdHG35jFNwt9IUFw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcB5d7cCAQRdJCgUKSzBGsZt4ytQ==
Date: Thu, 7 Aug 2025 12:33:30 +0000
Message-ID:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1754514206.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PR3PR03MB6425:EE_
x-ms-office365-filtering-correlation-id: a40d14e3-b1c0-4bbb-9dc8-08ddd5ae9e2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OAPemSOAQKLw/kC1zBnwQA8odemZ4JJZ0k+vxKIDHAw/FIUDWE7U69Yopu?=
 =?iso-8859-1?Q?Ac0FDFszXpBdK9gxxA9e7+zye63sBolQ/WnuUSnsbSaVbnOrP51YuydKGS?=
 =?iso-8859-1?Q?pB1GSA1/cZU4IrJ6CqrRwL8EBwJa69pS+wMamf9DYBFbhUe0RdWm+Nvsv6?=
 =?iso-8859-1?Q?16P/H1zgVmW1F6iGqcXwfkGieHyo/VWRNKHQJr84iuHxT8sKvvTqYbJvXK?=
 =?iso-8859-1?Q?Ot445fXnDRGkj15u0+Cg4ezK1EmHKelzmCksS07qi5sHH0iLvF1VLOcm4p?=
 =?iso-8859-1?Q?ul8R1jM6RLf2jS/upkwSZ7bACGzmmdTE0Ckyq8iIynWJgSCZFr7VC/2poA?=
 =?iso-8859-1?Q?ZSLo4Ko2guBkLNARcD78Ocm6Ub3dNLGLrmE+c+7sCpGxJiMaV98KmdRRR7?=
 =?iso-8859-1?Q?IZlkG/1oNFWE+yxFjZx58nLPMP/rhm1/SskzR/Dt+GNJWvz8Ma91W/eKVZ?=
 =?iso-8859-1?Q?uWIXE60j7fZXwIRqCX8Mf98Eq0FlATp5kbowLisWrd5qrit9SZ0ail+pr7?=
 =?iso-8859-1?Q?O0lxFBUcKxdbzuYK6WvMh1ShlHDAafdoawaw+wgrcoMpGzrQ1i6tiznk9m?=
 =?iso-8859-1?Q?smtbwbDwZuMcXL38Ylol9Q6lpRO7N+iPzshL8lCRw77HUsRWb7DKIo+iCl?=
 =?iso-8859-1?Q?S+OJZNLUr4AJJP9f7KUSm3MYrpQnzchl4JWcie8npT8UGi4Ek5aAKx6Tuu?=
 =?iso-8859-1?Q?xpqKMjUv3zh/arrWnqSv+BvTjAe5I1EwWctm0jHGs1itfex8pJOMGyJJzm?=
 =?iso-8859-1?Q?ts4/amVvoQR3Q9qqAdGzJEVyddKe8cdwbDpxE+4pypyyLq5ctI1jcYzUk3?=
 =?iso-8859-1?Q?gCHWTEAEsliIODFtjsYBoSfKHHsCoY2rPTIft2HrgIsR4CDzJV6FL+IkHx?=
 =?iso-8859-1?Q?KsvTFfvO5hflibtla53qMUUpmgdgOG44kGPyu548IKT8M8aJPYClxLKkFN?=
 =?iso-8859-1?Q?YFIfquhx+NbLkTqulKvTjgaJFNEh2GsqeHgT2hVTtaAhqWXRiHmbSzayr0?=
 =?iso-8859-1?Q?vsF5VBNv82TLRXQlYA/gvdO7Wg7/dhDS5oEOZQ14PW9l9ThUErqoSoflja?=
 =?iso-8859-1?Q?LBQQasnKhlfBllScRXCmN4qETpqEzEFGR/qCYUDFFmKHpMn+nuWWIpI7gk?=
 =?iso-8859-1?Q?q9xIyzcHLUFs5Rgu2GknLBQqMbwPpzRALDL6rO8/nXONp4/ezGTjH/whIw?=
 =?iso-8859-1?Q?JPPBwQD3j7N/ghjmEiZ9AkINmyYW93MhjWa0chS4Tw/7HVqSobHeH4dZcj?=
 =?iso-8859-1?Q?yvNV4PUiutM8hpkrN7ShGlcvnxjR2VYwL3TdhkkjzAbMKxoikPp5ruhdDD?=
 =?iso-8859-1?Q?9Y8rtSXoOr+qyH0gmDsdyAEHwhK7zgkXE1Cs11UN/uWw2nJieM6rXUnJba?=
 =?iso-8859-1?Q?wz5zHFjvn8S0MauQ8v/Q+wyPB93q3RLtfzatDKkgF6M9/m7GrVi9q2vKsf?=
 =?iso-8859-1?Q?uLzVZA6v7h6TyIeROzGt8eBZx/LOQyRn8V+GWEwCyfj5cJXPiXH3K3H/k9?=
 =?iso-8859-1?Q?CO8ciqy36wvW00ppx3+BgZN/nv1l9Fmq3miw40XBh+JQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yNPYo59HXGWNf+ApFkNAGZBJ+flHmCVjgdPkmb2UTkG6mzYOb58LZRM0ia?=
 =?iso-8859-1?Q?gJqCztJsRCK4I43mHnitglT6DHCpJkdj4Pq/hMzzaDDm5vsy8EnSH4fGVV?=
 =?iso-8859-1?Q?p8wkZBM9XEkoWRHOZPQtIfoCizqyTf/gz66KZ4uGgwWAtf5eK/lKdbM6/s?=
 =?iso-8859-1?Q?e+w6Jm0F7F3FZ+dPDoK8Rm/bFozyVrgizm0L5vmaCsCP9wHtAIuPoTOeGr?=
 =?iso-8859-1?Q?xqvkQEtL5UQkjD6ecLPGBAJNmlwt1It+ncR4NTdSjo2lqRqtg13+wUkaFe?=
 =?iso-8859-1?Q?qNW6ZffckJsz40vU/uuVzDJprY4li9xNaYSFOatlZEC8+lDpS+mvxR+bse?=
 =?iso-8859-1?Q?bd2Dgv4LNOShH5OCzpbN6YTn2YrEMlTxDuzV5T1eoKdsMKKhjn1bT4XUqg?=
 =?iso-8859-1?Q?1eZBN1jSWqeAUSHeQhCS1E9yBXKIZs7JnyGRoCmGFLQnGglSyU6u0zpzHw?=
 =?iso-8859-1?Q?jpCT6grWdcvHJgviVffbQVUh8pBOmoUfAxVvQJP/iDx81ctZcvJk5hrAZK?=
 =?iso-8859-1?Q?TvAaP4pCK/ZzwyQzR3u8UUsVHTWkJOyJcnOXc3YMFyq2t/gqD/b8Cra2Iq?=
 =?iso-8859-1?Q?qbHKEQxe/WSUZVHUwluTEypK1Tx1qE7F3jnVPIb/4ioeSi9wNCTnC39h76?=
 =?iso-8859-1?Q?qmmyz6mP0yOKPT+DgpvRMkDQ0A4hipDQA7S+W4WNzuHjWO/t7Utgsl03tY?=
 =?iso-8859-1?Q?Jc5zXZdJ5ngQza8BPFFWPtYRkjpub3dJRSWdNZPQFtjNvabMXNpG8z1hOl?=
 =?iso-8859-1?Q?QUvFuJdXggmxBEbeNYfJGC9DvVIXryzg+tJ0269xZk1Yjxiv/f6o3vDYXu?=
 =?iso-8859-1?Q?m4Gt6NfPbnxRUHp5NSFmfVvL8Cj4PwjiiJZmNdQjRxDp2DePbWC9SyWs50?=
 =?iso-8859-1?Q?UrghO1GjdQkBwg2OAPgYasJ6ObifRUc0QHTot97WrRAANAg57IdFnW/Bns?=
 =?iso-8859-1?Q?QcbxW2vjOK0vbpmQxhqotx/9NPb6XSEqOz9KhyIbjQ/BW7h8uHrSFxj5my?=
 =?iso-8859-1?Q?WVzaXhPMJNk7+kLlCNOCVOQPaTwWtQezFacx7H73f9lcRqmj8oOSZcE6mY?=
 =?iso-8859-1?Q?8EHVn2iIVCW5BCy/smnBCEHBd8d4bjhCfB0vzZhJLv4dgdb5mfNvRkd7Db?=
 =?iso-8859-1?Q?kALpr/VrmjCGTV67u/RTJKzDKfPaPN/pV7susk+/7NEixMjgyvUP2wuA1o?=
 =?iso-8859-1?Q?IEQHMHSdCG3sCV8rkaBvn1S0Li2HX1mzWyuq3+e/hoSNBE/IHUUh3EFZyo?=
 =?iso-8859-1?Q?+kFoA1LCZdtscEPvxTJNdDrB4AayS9RSPyFg7xatqFa1oHYVsN18MkznIF?=
 =?iso-8859-1?Q?OmC8raahfk3SNsjeGJpceMqUQEmBMelcADdQjFIhPeIEAqSRKkVXAO78Tc?=
 =?iso-8859-1?Q?oc+I5GKfYGl9jWpk0j9u8Dgs23MhAtTA+v6+bwI6y6sddlKVjFNhYKL979?=
 =?iso-8859-1?Q?vH8T7BskOXhNLhT/ZshHLghpK9irXcwBy5hJIseTAufWo8RSgbmyQ2HogT?=
 =?iso-8859-1?Q?0F8EmO5SDKsP+6HhaxQ3QzAkADpRvU2p4OjmQNt/TSJ1biWKbDPiAAz7Po?=
 =?iso-8859-1?Q?Z3E+ILD/X/V9AfdeocTVP/lv9mizmVPT0P3JnZjXIS8fcqU19rxNppPunr?=
 =?iso-8859-1?Q?quLPymKqA6UAizVICMG/00N9v0lY7RWPj0iGH7kWy3svxuNi3tLdi+AbP4?=
 =?iso-8859-1?Q?H2atsCJuJtjAvIElJog=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40d14e3-b1c0-4bbb-9dc8-08ddd5ae9e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:30.0211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tllMqS7TUtZKOu0ut61NobU5cx9wiFUPHHHQNaE+MMG8EVBjX84XD4HZ4Gz5Ll9XBik8oJKUp6hDW4ZNb5ngciw4ErZ9WH8RTzZxO6a5hUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6425

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- no changes
---
 xen/arch/arm/gic-v3.c          | 99 ++++++++++++++++++++++------------
 xen/arch/arm/include/asm/irq.h |  1 +
 2 files changed, 67 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..8fd78aba44 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,62 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    panic("Invalid offset 0x%x for IRQ#%d", offset, irqd->irq);
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
-
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +508,9 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32 =
offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
-
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +597,26 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
     spin_lock(&gicv3.lock);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,15 +635,12 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     spin_lock(&gicv3.lock);
=20
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
+    writeb_relaxed(priority, addr);
=20
     spin_unlock(&gicv3.lock);
 }
@@ -1273,6 +1305,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1317,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

