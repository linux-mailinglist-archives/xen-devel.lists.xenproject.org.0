Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A887B36756
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094535.1449858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ2-0007s1-As; Tue, 26 Aug 2025 14:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094535.1449858; Tue, 26 Aug 2025 14:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ2-0007jf-3k; Tue, 26 Aug 2025 14:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1094535;
 Tue, 26 Aug 2025 14:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ0-00072q-An
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:46 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2bfa7bb-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:45 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:38 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:38 +0000
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
X-Inumbo-ID: c2bfa7bb-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nio7ItpvwptvrCtquDpFa+VRfm1tmp4IbvvjotUptkagaUvyxrlRf2Lq/t/AsxG4Kry/GYiPI2zhHVhfBm8DhvgX+JRZBTck9vSmKqeh2ZHFxRNYTHea4hFdBOqFDP+CZhvnGE+BsfSnPTe9p4XH7icItFK8kwHDBndaANq2j/5SjiWfwzp9k0Il6ivxf0bPAv+YZILd/V+c1fT7vG30+gXQZ2JzRDT3ggZ8q3T2TJRg0TBWvKsfxHqrTZmktkiXuCwcxkFFNw15I8AZENDpfQZh1HviSeap/0246dUVWFco6BiGMKXzHj2eZWn2XD5LOwtPh91YGUKcyhGtfoYKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNynwHJEadmNOUhC1e0brDBUQKdzxoPCI/wbBBJn4/4=;
 b=sEBo1Jb4lDUDnfYFI7Z8Qiv80FVES9xX/BXaTwFg5StP1XYYowvHqUNKEGOCOadzs6c8WbstzF0sqzpe40TAjknI/jLKrZE1EoL1qrm5Q4oLEPk+b+D+4tOTggJw2pRpkaOOAQr8p6mrAQYs/kPZR8OMbHi7Ux2qWwSN4D+rDXpXJHdAp2Y8qDZYTKMqHEksctXNhmARahz2SSMsdrusft09G93zumy1VDmuLGIYFDtNdYQ+1xtJQE8AdYykHfz4d7WnTOE9VUijRxHWwIvI6scsXiT+pq9N5K9EcEs7JRAv0XDlET+T6RapXT+6NQO4E88TJvuvMKM3IHiZZvOwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNynwHJEadmNOUhC1e0brDBUQKdzxoPCI/wbBBJn4/4=;
 b=jKVNQfDACtS3K25+WOQlAxMjbEbXS5PZoJ9WIcsrbC7sL/UWPgHzJ3DnUwZV/AdTDq52E8bqagaMuXjwCSovE+HTGcU1T+aOeStGGTEJvT6qAi+6wTt5ogHnJJstPWsqvbdEB51vztPF0e1smM/CCW10WTc8sdm1pFdi7P8wUKL0+rrLIkcXL2J6HPZ7t/HftsFy+urGgmg72ee5zgYbH/ptYXDtTOuuWnh2lY4CtGxKYNrfx36wGZVlLrJUK5h5xo6B8PonO/1flFIj273lk+Wgoc0Vyj45Mj1EejZvYAvjC2oHK1sHodN73c9vwzuAzClaH9C4mdTqh6Xm5xEnxA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the
 do_IRQ function
Thread-Index: AQHcFpJ/78TDbVIRnkOE9iNbqduJVA==
Date: Tue, 26 Aug 2025 14:05:37 +0000
Message-ID:
 <c977f6c0746d4461a804ba2e2ca80159190923ab.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: b75de3f4-3ebc-4f1e-1904-08dde4a9a2c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ccjNkLrlpLjxiYYn9soFwYw7L/FZXep7lHuqixQ8fC5m9egAd3U2u1AHLt?=
 =?iso-8859-1?Q?dR2jZ1SU5wLAOdhVUrpUeMFg321M2tbpuxhdu3tY99dBENPOILrTvNz44a?=
 =?iso-8859-1?Q?OhdvIS21dv+X9Sh7BELpA+I1GlwrftKC8pHoon8KNWpbfqt3trVc8thAHi?=
 =?iso-8859-1?Q?mJQPxEaCKW6ekIMjTuP6dycu4kaFFsdUqjyxBfkaqsunAuiqChSyjmUSR+?=
 =?iso-8859-1?Q?ig6L+OMIRjtm79E6LOW9wV6zMSBTj3A9ZbO0g1USIwDicE2VdNjzQdm+5B?=
 =?iso-8859-1?Q?ToEjjEo7gJxM/6lSaT3taIslkF5UflCAkyIMqmMYgoGvWRX6XpDuc1VC+f?=
 =?iso-8859-1?Q?rrTS3rSTgOnJKcRM3GkX8aRCDHX4478HKTGWqAvzsqJFf1iOLPDjiar1ox?=
 =?iso-8859-1?Q?NA0WehyOTxO8ccpHn06l6k9d4+l2xPL9GwGeOFRhvVTibidB9j5I3J0VIZ?=
 =?iso-8859-1?Q?lQrsAXIoqnJ0xBGSZxGnDRdntrEoiC0r9nEvtXwOA89q74PnpCCHN8rrVu?=
 =?iso-8859-1?Q?GC67XjNQeWRsaQ6OjjP9H1L1Ycdvmxcw7nYBUBIczjDulrKlWMpGFu79r+?=
 =?iso-8859-1?Q?38Iqi/392Wo1Vi5VfGOkkOwvEFSVIfWwtlDjUuVvwE/NmwEv8Rhbeeyin1?=
 =?iso-8859-1?Q?8U6MKi/NGFyn9IVBmQfiq3YwNMY0+rEGSPGIUTTmmTE1bB8GswD+qkTG/I?=
 =?iso-8859-1?Q?LSOWk3W6oFK4sbNRA9K2osrZS16IQUsFUrH+PvzPOyhEoRJ3BiyfCYjh5H?=
 =?iso-8859-1?Q?TwmijSPoWBSKdS9xRftcEkK++9pl2e7cpdZPfH0Bqu/vORR9Kr7QhP816Y?=
 =?iso-8859-1?Q?+bMq7/a4beHgPj7UKPwZ0MTM9KFk170/uVW4EcP/gKTpHhPs0jAoJoPuOi?=
 =?iso-8859-1?Q?C4GoAT/j+LYGK8FUv8UJ5+Gx4Hr8D4tWOUzmVlRlOHPezygCDPRkbmMz4b?=
 =?iso-8859-1?Q?X/IpYH3ePLefuEBiui/xh9DY3C/lDXPJdo52n0qTEzkUvUaDipNdX5gKyS?=
 =?iso-8859-1?Q?dAHIGPXwJJh3cl1GhzQEp8/gVSiQ78rn4oFJrjCjv9Vk2NPosV+GvmgfW5?=
 =?iso-8859-1?Q?BxPjbgsxKIOeKrVAVadADe++uXLk7OsAgwbgfW2FRy5BXHZWzwU8l23BfC?=
 =?iso-8859-1?Q?9O+nd4k9qtOTERHgepY16fFvuY0HWse1TwlZWf+sJcdPJU9ljyS+vPWa+t?=
 =?iso-8859-1?Q?uPmfQHO6kmpZD7T2wNQZ9oXwEJ7HV+BSL2PoXG4PsFF0U78jjb39pyWLkQ?=
 =?iso-8859-1?Q?h74gzmT+Av8ETiR/oDozB9AH0vAVX+WQTMM8eg3rcop7AiN8Dld2CAkoJR?=
 =?iso-8859-1?Q?kARVLrRkatlAeQP4iAMimEBzc/d0eMq9mYJ9KnKX69a2F06rix5QF+K6HK?=
 =?iso-8859-1?Q?ENs/rzsurjeqAzuYH0JfWGx29D/SrEeppAeStQfsYJFuMr5GvcXek5UPQQ?=
 =?iso-8859-1?Q?dDrHhCFH6WNsejR+nM4rvoJd0E+zlo8QiJPiBAaa6CgIktUeTEfa8wj3uQ?=
 =?iso-8859-1?Q?M0TRsNknmitl60rSn45mzDPi8S3BZnB4/Ns+WESU++Fw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SwYIl9q5ClSV0QD5kCOpFKFwA4XyK8YXCddaOOWqkngBRJ/uc7Uea4YKcr?=
 =?iso-8859-1?Q?j+gOW1pxUmAFQeh9i+2hAh/M6cQXYeEh4NSoy9VQtUvUCUSeQVzrCcRsgD?=
 =?iso-8859-1?Q?40+2P1kxxToMfMBmgtQ3UC/0sNqhO6JOeVWsOIYnSx5+Dp2/Xorv7J7Mwo?=
 =?iso-8859-1?Q?xU+bttsK0sskUlgzZSh9E6FWqpbw9x8OYbIJS0p0lgEXJvCqOBi2B0ZT9f?=
 =?iso-8859-1?Q?DRksOD1FlFl80l9hoOQ5UEmBx71v21ofb62wm5Eq9uq0P9PGs8bTUSe2Q8?=
 =?iso-8859-1?Q?QjITRW+NuJYSsioNObpIZMAlekZ3RWknh2PNbf9vd/4hyidmnyM/N4WKSc?=
 =?iso-8859-1?Q?5xN1eAV8Pn56USNF7y13S7WKDyg4HFNKZvFncH4W3xBWUJnhBjcYNyuSvm?=
 =?iso-8859-1?Q?PJo80Ps2PwzBo4b57ly0yPBca76Nkmw66kMSXC7+XXeKcxpdoStF4RijpT?=
 =?iso-8859-1?Q?g+JRDeX2jnECw5ShUQsYEoROV5M4d5TFfVLPXpW9P7Hj1JpzrMBLBXOEVi?=
 =?iso-8859-1?Q?oaci4kBdX50qguha27sirGRSubhISj+U2WVA0cb+xNAUSyQekt+s5Jgbh0?=
 =?iso-8859-1?Q?L2woAxxmbMub2CgmZ3iw0F+FFFOQ8ByQOOn1zJuW+CVOQIeVveDJdx1A3t?=
 =?iso-8859-1?Q?e5ibFcC4QiJ4iLj1sJZCUuNzjS216DypOGGSfwZiCZTORFSy+H1QoQuqt0?=
 =?iso-8859-1?Q?522ElVG0TbLZeRRT4idRQxWcG0+whANzorCD27+fr4zqwsMMutZbCE2q01?=
 =?iso-8859-1?Q?Jx8Yi8lIZ3nSfDKi6/5QpuwmRF5h+EkJeN7zwruthfq/i30mWyAL8Nf1Ku?=
 =?iso-8859-1?Q?7SZ7KVlSdI7tOzuUmtsWs07Ed3DdABDI8iekn9gYncCOc2cTAJZIWY0UYA?=
 =?iso-8859-1?Q?ugVIEpQTfMYVxvfdfIvheAsBTOcv/oVq/muk3owApgUOJRybvlf1Im4Ibb?=
 =?iso-8859-1?Q?yogwsbMfcW7wO21RDtaKyKic1Ua7FuYyKUJuJI+KZnt8gRfm0j+cn3yPiR?=
 =?iso-8859-1?Q?Be7hk/J0FbWRVZQnEGYoplnq5byLDqkLjM6p+jjepDqcvelPpnXvqI9NcH?=
 =?iso-8859-1?Q?3pbILK7hhcGmrc4Mt0E5/0JlrymcqDJWh84SQBnRKSAQkO/A8+WrXAymmK?=
 =?iso-8859-1?Q?hsZH0c+qS4GBc3mvbp0CPD3pU7y1PzdQ6kvuJE7cMElVabsVULmh5+cUVg?=
 =?iso-8859-1?Q?Y4qmVYKWYbhXfymNMSOg8OsV8hHGx576QnkyRP3j5H8y3RRnVOZdA7uXsw?=
 =?iso-8859-1?Q?t670E+fuD5kvkpWt5XYLWf4HEv4BLhbAyp+BNF9J2LhNdgIay3loWwyUBG?=
 =?iso-8859-1?Q?ymB46FTXCBLHwarxbbK4t53xOEsrJN1LLiNHIOc9sbrvP2pfh8CMwZvKb/?=
 =?iso-8859-1?Q?UYH7wDd1D3L/i4g2BuqfVW/gd0iwcfmnimvnn/kqGvyE0JYhhAx3hOHPMF?=
 =?iso-8859-1?Q?BtBuscP0pDkIfidGZrGtwiXTLLhhSyyW+XwR9T5d8ugB8tnepl5YOQCExA?=
 =?iso-8859-1?Q?gb7D0Td9DoZKUE7idf8aXeLTrfOPbiDiZg6PsNfqwCUUL/BDDqcC0MS6Sr?=
 =?iso-8859-1?Q?ybvZNjwAl0XRhJWl6TK163I6N6rtybvFIL8XQRYM2vGU7xsRqNE95+fHUX?=
 =?iso-8859-1?Q?zmDFaMRBfk2Hw4p6ZWiQdZH2LaUvrUTpmi5//tCMiQdC9tFdvtJHUJy2J1?=
 =?iso-8859-1?Q?KGJOHwVnfs8f1jfyUKg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75de3f4-3ebc-4f1e-1904-08dde4a9a2c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:38.0197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7cuumLurB3lE4WjDi4jisH2/qSH3foL5HwJ1RJe/KUmwRRsotMwawGcqX1V4/ZOqxRxgLxFuBClyoxR6z9gzKHbyczVwcuY4c8A6Meb2/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

The do_IRQ() function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1024. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- no changes

Changes in V3:
- no changes
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index b88237ccda..634b77c987 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -341,7 +341,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_f=
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

