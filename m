Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D8B1D81C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072961.1435952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzvO-00080x-Rb; Thu, 07 Aug 2025 12:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072961.1435952; Thu, 07 Aug 2025 12:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzvO-0007yR-OU; Thu, 07 Aug 2025 12:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1072961;
 Thu, 07 Aug 2025 12:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoY-0001m4-R3
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:46 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2144e93-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:44 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:36 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:36 +0000
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
X-Inumbo-ID: c2144e93-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJSv9yVnt//skqjZuPMutnZcobjEs+dn7xK7whcbBVEiJJgTgq+iQm+Ke9oSP/bJ8EzJVuLhD8rdylOgOM8k6UOFg4pq50zLpFxh5+wtL3q0IrJsA5LXgkOXH2kWkPfDaBUm2lsJDhW45ETVAFUu5WyvVQTOPdLNy+SdpIkGQVKVKlo4dd/h3yg42wbtZU2opkPoCWmULZS6GizKiUcntlt7nimGlJKDmtqMsdsRHsrFodmqVAtGsefhykMeC57HNklBIhGSVa6CgDey9SW6J1PQQF1lHPte6v+e+EWZGrKigawuSW+pAx3cidgTQJ6aZ4xdWX1Uz0ef8zs0mZXL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ89LMIPTbRnlzEDyq9ltnP9nKlxsnZBGFd6mUivo7M=;
 b=wbEl8kPs4JEn/SYYrqQvIKjCwIZ9gVd8POp2uPy4ZRveGuhQVpl7QZMZYu/0GXTmfY9NvVUlvjB8Va1HdSzFiwuIovlEvagj8TLyizktETSQRVBtdf4W9f99nHi0BKv0qnHBOw870rwXSR9NbS3KvVoljAW3alf8xdq7YzF/jEKMj06gIbYhDT/HvOBfvtv2c0qLZLCdn1ekzN4ZhC2OHC/tNwCgvmBKXtKkYM7ERA/Abl3KvCxlHd4qNgSxEjjOOpkmGmuVWi94nOtVwsWljJKbOeeO6PQ8PU7YaD2TSqLrXLD951+hQ2mPpr4wWSEg4Wu2jsmZjbnWbylNmrylmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ89LMIPTbRnlzEDyq9ltnP9nKlxsnZBGFd6mUivo7M=;
 b=aHMErXJG0YB58w8pHTP/irxmR7+A98k6sz2/w5OCTNNCmvv2Q9XdFzGFt0YO8ti0rr0g2KGSB2fcx6zAnn9/1c9Jts+73n3wCfvm/wOzsYqp8hRNmrpq8TX1DJsBzoOxSumHlBNRUghzba8WPdtxmlRBqeRtCmB5VUcSi44k6T7PtaOZKdrpmjAN1Als6wNBEPati5bCMKsapTqpZ4fbXfBC3QFFw8HOI1s1z5ysVkdopz+vdovDNmC3mPZeNEJfvvhedpSUlW6zlj/CKXiilX85S30LpwA/mb8vdL4jLq/hzO9l8iRWWptsE5JVvw+5GElfhDFvUYS1xVHgzRrSxg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcB5d9o2YugLH3UUKTUBQVCD+iyg==
Date: Thu, 7 Aug 2025 12:33:34 +0000
Message-ID:
 <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: 2aec7064-9a5e-498b-5926-08ddd5aea117
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nQLNwnzT7OA9i1QSPFTUELdgtPcwWvg0ntCOql4RDpPC95wqdUVUY9s1fu?=
 =?iso-8859-1?Q?x0orl5KBu+HcpjAErG1b5P94sWjBaif3vamGoxKABtoUt2lDy6VCQraobv?=
 =?iso-8859-1?Q?uc+YANXuABiAuSx95olTK7ssLfhLAUDSZSuGBIBHmt1U+r3n48BMcHgB/n?=
 =?iso-8859-1?Q?fgXyBqjOEVLkl5ZysCVCSgYuAv7O3Bch6aHBtbEbpctgvS4FQrOBcKcvkk?=
 =?iso-8859-1?Q?H3PzKxjwYu1eRx6yhtRtK0tXtuEiKIBKwqjYuV2xEnRKP7raHhRK9yXVwV?=
 =?iso-8859-1?Q?f8hJsLztFHFpBiW+Zqk1UcEXB+K8F/J9pcTAK0yirNyqwl4eOMSX0L0ZWp?=
 =?iso-8859-1?Q?bDRe0xLNVGf/eF+WjlwbpG/Y6rg5dzpBkBBKun2aEOOyzY7eGeO7EXM9q8?=
 =?iso-8859-1?Q?AOvRcYVuOklS2x19unjOA+nJEQZ0bUfAtV5nGki8Fn49j6X6YPgiQHovAT?=
 =?iso-8859-1?Q?OlIhLuSyK0wfsSTbCBNXYCQ41rw6AOHiYdDooO3ETsYO9Fs27ctgsSutHv?=
 =?iso-8859-1?Q?Em93aXUe0P0l9U8I3X7b6wPAFgTE5ufc6d+8sjAM0U4U4mZYVo7YnAWNNu?=
 =?iso-8859-1?Q?zPVhrHR5nEUARYMEor8cddIT8D4k+Mj2kb8bvbvYhAJecyND1m93Gqsla4?=
 =?iso-8859-1?Q?HxsuzeoydnqsKetG/4JZfjW/LseS9h3kRmwYkwmj2pc3gEt6nBwZmOyAMe?=
 =?iso-8859-1?Q?+oaKWRyW/oWHf932qMVdVcC2G0a2jUcsIzI9j9szZS6sYiXC21dAkZ5X3B?=
 =?iso-8859-1?Q?7jkkqze3ItF1gharzWw5YjpasYqEOmn9JFWXeiywbLuMIjwoywN4udV9l/?=
 =?iso-8859-1?Q?DKcN5wuXcdQu329Fe/7PHRF7OSvQhCEHTR1Z77WdpMChJWZjvo1IZU6jDr?=
 =?iso-8859-1?Q?SyPGLLikmC7yOyi4nQ2ad3hw599MbOBqaJGQ9RjPWZjXNJnnIPWF6L4SKd?=
 =?iso-8859-1?Q?tzV05eooXrhnTBvMiJBlRAjwkIOp0LcbVJt/+vtikQUivKY80jpkLROqEj?=
 =?iso-8859-1?Q?9wtqlosesNeqPLw5/Gp4lgYvNbESa7XGWCfOjoOktSeDOT4g8nAYycpVrY?=
 =?iso-8859-1?Q?KUO1A0vwUQHk3D6GAA59TdDILhifT/3HRYb/XoVfBkNTMrCOTXBDpCJe2G?=
 =?iso-8859-1?Q?U/fZ28dhqjV6pRHuhPUSpeIzow0mMqBqUZBzXnaF87MQmGQnGv3JayZ4hN?=
 =?iso-8859-1?Q?u//Xkev6hmCyy6skaJVZO5c8vGg7nTxkjH690nigwmMPELA9nfKmlSC7Ia?=
 =?iso-8859-1?Q?71oWVpkjMtQd6JvHUcND94Hu7jc2EP19kDGPIZ1vEs3IjX71jHAWP8wFdp?=
 =?iso-8859-1?Q?PXyx+GqYBrs8fkBj8Io5Vg1+H4MfzwHsgEHIEf8mKSRY3xII+/9f6b/OkJ?=
 =?iso-8859-1?Q?JDF9yfkkWjQ1r3lHEbBn5IypPpuT888/48XKuqg3ZVSrO20gsH7f8n3AZ0?=
 =?iso-8859-1?Q?AgPdVJiHnRhAa4+SsZIlOdX7S+8upBOsIRXOjHnidicVbHsYWUWgndQwRK?=
 =?iso-8859-1?Q?lbucS4LgQ11y25nTdeGoOGvXWu223q5bA6g3uDJcukew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YV4PVr7L3MSTxkLQc5D6Jp29kgJPh6Oa7wYw+sZfgq5f0+dTZQRW1ERvdY?=
 =?iso-8859-1?Q?7kt5kpR0S9MDlC+vOgvDL9M9CgXY/fnJBIsC+lugvCqjZEw4qc0O73R0Vy?=
 =?iso-8859-1?Q?xrkQJEhVefrIx4QQxjYFO/z9OoCpKBL/CGjNGNmBsXHSAzh2POAgGExrlT?=
 =?iso-8859-1?Q?ZAUTakfIjm83eh1k+TMPdcjJ+zVb1UQ5mJHc1OGsJbK8SqMqmvFvre6FBc?=
 =?iso-8859-1?Q?DBMesE/ugkX5JlAcYkmR8byylg9hKJhvRpRyg7CF6oP4v0Y1Xviko+NfD6?=
 =?iso-8859-1?Q?tsqqMT3lKd0qdRTLBItMGivk6as6tF0BWscB7Dmpc8LVWtacdFdwYW57uS?=
 =?iso-8859-1?Q?WlsdoN19zLWs2L7n1qkHiaMPNLWK7g/6znYDVZNmcDDV1VrWg8I8cSuhKE?=
 =?iso-8859-1?Q?cQdqm2Glzx8A9geMpwpVLG0W2InpiJFhTuSrrmK/sTgUbxmB2fitoSthws?=
 =?iso-8859-1?Q?5PsLNniNjdFJJgDXYPxnTYdshmh7CfU+j41y5HXWAwX5gO1svjy40BhCbf?=
 =?iso-8859-1?Q?+TSJFAUCPetHvQ8ieC3sf/b+keW21w5gNg5Ls/EcnF27LoIydVE6OetBaj?=
 =?iso-8859-1?Q?YWaXN2oDqXJYfHvvXCqOTAQbtxOM1OU4l1JO9Ugb5+xv7GVE1fVLsI0gOu?=
 =?iso-8859-1?Q?jucdBgDufZbyNeMcOrbS55ArMRWNoeDN0+QsYf/d303fjYUZD/cjGByf39?=
 =?iso-8859-1?Q?JD6JBZQSOdO8/Xl3GolBWKrDjyoqUkoMQ8GjwO3lp7tTDQnJdJwa/gp4U0?=
 =?iso-8859-1?Q?+NNfpoZ8a3w60TGnOrIpLobB0WMeCoheVig1f51LW479Iqakwf/FjlRNKA?=
 =?iso-8859-1?Q?3cN7AJsDJZBR61IHN21nwhRnKq70GrFtuuQrBy1FjHBVNhV5C4T88gtUB/?=
 =?iso-8859-1?Q?sToBL7JA+FPr71vkdIJD0A64c9FyFD9skBHyT6I5md5pLkBvF9KIVkDE3x?=
 =?iso-8859-1?Q?HiIvb2edAiuTfYOq4FohNe+oPmfRou15B3dtmT6xMze8X7DwaQvVN8SgdF?=
 =?iso-8859-1?Q?Bbcoyhb4u0F8IrbpZPp693RNCqlVQ5n5GRX4B/YlG6xfX3XEWc0vko32Po?=
 =?iso-8859-1?Q?jpfTJnn6RLNeQuLIJIkaR8h9rsiBueX9AQ/IPo2dUOkm3hKOWkDDAumpRj?=
 =?iso-8859-1?Q?yeO8o17oFfRTtdhCfuSDVhu+fnz+l/I5iYufsGsBQmKNmtCC1iJb3Yaywi?=
 =?iso-8859-1?Q?ws3jEIjqTPe2hak/AvsQ+/7ud3AXls+FOptNOHvVeg70lQFQNwqlpKCKsh?=
 =?iso-8859-1?Q?KoYPCm8Du94+JLonLHgeUdv0lob2n1suXEeAOfWh22AyulhAnc3UyIr9WU?=
 =?iso-8859-1?Q?pkPfe/OIph3va2EbYdywqcAdWTJ0J89dp5aiiMBR0Sm75vgNWFt2dtHkma?=
 =?iso-8859-1?Q?mjDDC5At6AazEzpvtWZfrDncJ6BZwYF104MZg84FlbcQ+hVYa6Fl8MK02a?=
 =?iso-8859-1?Q?0CsMZJF/4hpGhWEDUqAhwLM1qgZjio0OVDtGRS6MElwtoiDdqFcxO/qSRd?=
 =?iso-8859-1?Q?/EBV8XMltasnDMKrvDmbRuybxp7rJ/e+AnVF+afajyN+ewytXa/RGPECcJ?=
 =?iso-8859-1?Q?fsp24j2MJLVT6SbvJsC7UrkaCv1MUs7mrKOEBisQTT7DJ7LA2SjiMgxANw?=
 =?iso-8859-1?Q?ygYBbEHMwfdc/POqzK1c8cUZKIgiaym8K0gb1m5oXlEZiP+XmF114hT+9z?=
 =?iso-8859-1?Q?4sE9CiilX7sO/PceFAc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aec7064-9a5e-498b-5926-08ddd5aea117
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:34.6060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oSSk9YCzf7RaVe4qtZLyz38SqZQKirprYgNWMh3IR92HiUV5/O90vwLx+NZRpcXBckQMX81SmwGZ18EiHpBAa4NKdC74dFo9EDTmhWE5Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- add missing rank index conversion for pending and inflight irqs
---
 xen/arch/arm/vgic-v3.c | 248 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 245 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..1cacbb6e43 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -111,7 +111,7 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank=
 *rank,
  * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int offset, uint64_t irouter, bool=
 espi)
 {
     struct vcpu *new_vcpu, *old_vcpu;
     unsigned int virq;
@@ -123,7 +123,8 @@ static void vgic_store_irouter(struct domain *d, struct=
 vgic_irq_rank *rank,
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
      * never call this function.
      */
-    ASSERT(virq >=3D 32);
+    if ( !espi )
+        ASSERT(virq >=3D 32);
=20
     /* Get the index in the rank */
     offset =3D virq & INTERRUPT_RANK_MASK;
@@ -146,6 +147,11 @@ static void vgic_store_irouter(struct domain *d, struc=
t vgic_irq_rank *rank,
     /* Only migrate the IRQ if the target vCPU has changed */
     if ( new_vcpu !=3D old_vcpu )
     {
+#ifdef CONFIG_GICV3_ESPI
+        /* Convert virq index to eSPI range */
+        if ( espi )
+            virq =3D ESPI_IDX2INTID(virq);
+#endif
         if ( vgic_migrate_irq(old_vcpu, new_vcpu, virq) )
             write_atomic(&rank->vcpu[offset], new_vcpu->vcpu_id);
     }
@@ -685,6 +691,9 @@ static int __vgic_v3_distr_common_mmio_read(const char =
*name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
@@ -710,11 +719,19 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+#endif
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+#endif
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
@@ -752,6 +769,61 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t ipriorityr;
+        uint8_t rank_index;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_WOR=
D);
+
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(ipriorityr, info);
+
+        return 1;
+    }
+
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t icfgr;
+
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_WO=
RD)];
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(icfgr, info);
+
+        return 1;
+    }
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled read r%d offset %#08x\n",
@@ -782,6 +854,9 @@ static int __vgic_v3_distr_common_mmio_write(const char=
 *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -871,6 +946,87 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_setbits(&rank->ienable, r, info);
+        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank=
->index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_clearbits(&rank->ienable, r, info);
+        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank-=
>index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
+
+        return 1;
+
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index),=
 r);
+
+        goto write_ignore;
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%d\n",
+               v, name, r, reg - GICD_ISACTIVERnE);
+        return 0;
+
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%d\n",
+               v, name, r, reg - GICD_ICACTIVER);
+        goto write_ignore_32;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t *ipriorityr, priority;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYRnE,
+                                                      DABT_WORD)];
+        priority =3D ACCESS_ONCE(*ipriorityr);
+        vreg_reg32_update(&priority, r, info);
+        ACCESS_ONCE(*ipriorityr) =3D priority;
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE=
,
+                                                     DABT_WORD)],
+                          r, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled write r%d=3D%"PRIregister" offset %#08x=
\n",
@@ -1129,6 +1285,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.nr_espis > 0 )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1194,6 +1360,18 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1216,7 +1394,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1235,8 +1417,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
=20
         return 1;
     }
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+
+        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg64_extract(irouter, info);
+
+        return 1;
+    }
+#endif
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,6 +1586,18 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
@@ -1405,7 +1621,11 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1419,12 +1639,34 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         vgic_lock_rank(v, rank, flags);
         irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er, false);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+
+        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vreg_reg64_update(&irouter, r, info);
+        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTERnE, iro=
uter, true);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
+#endif
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
--=20
2.34.1

