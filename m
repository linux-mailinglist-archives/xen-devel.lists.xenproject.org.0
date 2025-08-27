Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB9B38978
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096724.1451380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoo-0000C4-M7; Wed, 27 Aug 2025 18:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096724.1451380; Wed, 27 Aug 2025 18:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoo-00008X-I6; Wed, 27 Aug 2025 18:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1096724;
 Wed, 27 Aug 2025 18:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKom-0006ki-9Q
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b4580af-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:18 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:16 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:16 +0000
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
X-Inumbo-ID: 0b4580af-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caOTPuYbSmSZGNZz0sOkiN8aby/w/eVMiaspTw2yf0jydc1jQl9I5TWBmaTx7sc/gWg+j2IzFU/OnNqLxWcU5/t6M9I68GC87J+FAcn7GnsNE2sBtEAVGeG/dSFcA1/RIOG9/osDjyLWGK2INj4FG/ixp2ZcOEP+agvY2fYq6cFLzjyJBC7adWdxtDafT8+kf6IzOOte3XkpbIaYMhi7mxcZ3bMHD2T799SojUR5pDS8ynPXvcWF/x79348HDxJYTUBWI4pXn10R0wZB6EByq6k5nSua+UgH/eMevWRtKfw5j+2Ezh6HlnpoO3jcBbCPvtqr9Us8C5OGpma/tntEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnzy15kpQUB2aljLQCGM3xkSvJVu3LwpRqowKjns4VU=;
 b=WbzwsnMHPyo416rotW7Ppf669zQHzYFnx8ZEj/jY1P3hnI/xQFDUA+NtGOoI1CCCnwtQBSGZJftSDUpMj89uUlKQQQADO6wVSYMKF78XcggyqdnlnEHwjqRo1/s4MeeJKBNTjj+hN+Q3bFeexn1RXZrMOkGFnytWy4uJaMlaGw1ruuK8SIJ9jgJytnhZ6WY7akZ5uF27M8P9jyb88uHhPB1frrpBqWEhb3gu3DvUbMTpnjT3UHLS5OzMDYGoVuifKWfa1mR7VysqS6Dw3vQdOD+Hgnray7TDDWSeUnFpHpWTULUNCZItPEobIcgDEhlGLw2rfkNwN4vop3iYdpeKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnzy15kpQUB2aljLQCGM3xkSvJVu3LwpRqowKjns4VU=;
 b=QojNKQuZXKbiT/n5uTxVj9XfkiNUvHaoOd/re1TVPxWPS9hOmr3LERAcieH4xJNB1Lwx+O3TyXIXP5AWke8xHdOQWC1n4lf638x0yshulwu3zmiy02pKLzwwfZmwvusmz9aQ173ElrAM2bNMeDDqplzErtWJ6O3xWER0NQIKYFCXDNpE9xsZwmTAmBB7dJU17MdcfQDzDyf3H4FlpMwX+A1nmZBx3SB8lGULWGsSz47bB6QdAX/ttRDXNgNyXC7KF7zYdia8yDvKGvFeXFfDPwihzxqKpv3xYlxsVn6yuGWTs8QQjeFv4LkuneevFbT54/Tz1VHg6SZonb2rhfrRJw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Topic: [PATCH v4 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Index: AQHcF3/Loedl2G5iukGvdwDJKvr6zw==
Date: Wed, 27 Aug 2025 18:24:16 +0000
Message-ID:
 <f713c2fb1fd42c72d6223af0525c42b81af7d624.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: 9344efa6-74fd-4d89-2777-08dde596ee48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qVQoUBaJAntHW6rOogsb28f6bsHsNHRlyx9MB7V/p6lUg1kjRhRcxSkLTR?=
 =?iso-8859-1?Q?oWnqiT8O+9K8OSfHhooiQ/f5OvCX4O2i1Cwoba/2yE4bUmL25EBN58nXf6?=
 =?iso-8859-1?Q?QFWBAisgjTO1MkZ7WaUCWt1VIELgP+qPOTVRpf9JKnvcKOTOG6DhNVGZcP?=
 =?iso-8859-1?Q?WtSD3fVU+HBPXLsFgCrFjHwhNUHAJOq5LhfbGi+DYGqFQDekoqpzdK9gyn?=
 =?iso-8859-1?Q?jmQ+ZTd3bVQhMWAX9Lr5V4IL4xruAVdpIfk/FNU1q06UP/xy7tb8R/JTCf?=
 =?iso-8859-1?Q?UtEW2sbBtG7pFnekFS1uC87D/kOzF+GSUzzr/1i5Vu6xN81FP297cXeNAC?=
 =?iso-8859-1?Q?7v8x4dFoxG+D+1N8LgboYObN50HErXUDfHvfQ77A7bcMW9d+PsIXr3Ta6y?=
 =?iso-8859-1?Q?p5aQ+F0fQcgonJ704wU/ZMExHy7WLurPTAaLSQ9fG4HBpHro++yJqLlV+b?=
 =?iso-8859-1?Q?aqptIF5wBH2OntCR21zXwVMs4KN5a8/HQ6U6DbvKA+UMd0EK+XjykvchPy?=
 =?iso-8859-1?Q?txfLMc6etMbv39EemT7/23CwI8jpiYYj4wFPl/5lJrILnY22n9khSOZjR5?=
 =?iso-8859-1?Q?ZIOvd9iIp6eSIbnhI8ZKvpZ2rXzyO57iOMAsGKlP4a0m2LbV/j33EYacT0?=
 =?iso-8859-1?Q?IWI2gzcmvCGoUipLYele3gPXOQbj8uM5vco804jyRoAnXPV9b9dH9vjzAo?=
 =?iso-8859-1?Q?ma0/FCNPAl903h1aZQkYyrvVz9LwBfH0V/ae52TU9iwk2Zu3rhVkJpMvIR?=
 =?iso-8859-1?Q?HZ9H6GUK/uxkXS1KGgkOC8rVK/PhifEeA1D7JuXYYDzzRb5RVMc418dXh3?=
 =?iso-8859-1?Q?y55/pVO/djxkwRiUm98Y2icrbFoMEPzaDV1dJ5NxA9VXrlSvizKhaGhcGC?=
 =?iso-8859-1?Q?ahwF5X9f959sCoSREXX9oeJNDkgt4yhc0b3dJVJJeadJf0xELNPKOkMeO+?=
 =?iso-8859-1?Q?SbldMsP3A629KkP0lKm3H3mDy+/FE6TruQ7Bqk9No7iLd+YZgsyEEdEIBQ?=
 =?iso-8859-1?Q?/qbKDRv0aNPG+aeo3ewXz5CLFMrhxQSZI3olnMLAaKhENRD1qgat/bDuM7?=
 =?iso-8859-1?Q?mGR8K4YE4dKxyEZPfpL24VMK0YJ+HsjENL6+w9RKHAA9UFafy9pO011p4h?=
 =?iso-8859-1?Q?/dkPx50q4t/bSQXUr1Ytwh11iYvnHNV7MfJbFTwbuTSPucVP1Q3T9vHbhW?=
 =?iso-8859-1?Q?dJ0Xe7yG7SOv3bTCFgpFL3qO2i25SKrLhd8dv9aguhb+43meDWvUOa6dDV?=
 =?iso-8859-1?Q?p44HaNRyvWyfH4sP8adqHykgiH0rdMYGLECBAQlsIUN3CaEIPXMq8pVRgC?=
 =?iso-8859-1?Q?m5Ny1RgxbOmvBvu/86KigHxo47wiDWNb4QdWXhshUppiT6LLqqsaGXdKOZ?=
 =?iso-8859-1?Q?sH5o4sHHXBvwsMMtc0Jv6LIUqtO13BWhT9CGbxMAvy9iLmyoGChG4ABnxo?=
 =?iso-8859-1?Q?I0NDeBLYUvhkSwM3LLwnv4SWsoIVVtQFPQeBdrI1quHRmDq4NvTaZIN/ZK?=
 =?iso-8859-1?Q?FxnLDfCZRGok0mUSNJii84+5f2kzfDDYCJ7WFGkCmk0A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/soGEYtSDdA4qda4sBo6Pm0qujdGpXKCGJubRFkYWH1pK6At2lR7LONJFf?=
 =?iso-8859-1?Q?gnTBZxFw+4+r9SY5a67PQeqic1KMlmbM0CfrQG2Ninx2hP+GMCY1xhutMV?=
 =?iso-8859-1?Q?aLYtjEk6taR6y9BG5YLiXj8xBTv4+LPSvLCvbYPUpovb7COLUKgrlT4o1g?=
 =?iso-8859-1?Q?Prn7sM2uv4lY1QyuUegJwli4tYc/IAEljJ9F3KklRFi1Pq/f7PpgpyCL4j?=
 =?iso-8859-1?Q?RaZdoxIygLqxg4/cXENzWfpucKobFDApf/kYl6O1EurLQr/rjf7/ixzxdI?=
 =?iso-8859-1?Q?2Tz+JnkpulvGa4ddbR7k9ikyrpp6THPV8QyzqSmFEZJlrYhKakmtVy8Ilp?=
 =?iso-8859-1?Q?9sdAa4B7zlg26IYFTuMSzW3TLmwxK7pRj7BqUGUfNfOITVq18E+gVxTLSF?=
 =?iso-8859-1?Q?yyKVU8t7Qm+QatHM4pWl6gU58selu9mgvPo0wim5ZuraYAiQJObpBSBr1u?=
 =?iso-8859-1?Q?s9TWkHBj6qWXvBMpgqANrMwg6SGMAdKfV0o3QWDieilNKsg/lEKYQ3TRRz?=
 =?iso-8859-1?Q?MKYFAWK+ZshD7neQSGQK3DopqyADb7hipzv3avy12UdKE1aZyOVswhxWKH?=
 =?iso-8859-1?Q?+Uy9N0/IeUlruK2rqYYxkYUmDCIaVNIBP/mUQhpBK+RxhL8l1R8IA7kTa6?=
 =?iso-8859-1?Q?0pfjc65jOWXZHR6oemsBppGtRYR//Xm5dneFaZGepnvKV1ifVbUdnNAbjr?=
 =?iso-8859-1?Q?ehiKKOP2zc0PsV1BRXfe7HAlyyTSeZ6I+gtfnGC0Ipy+uhqNOcHWFhwLIl?=
 =?iso-8859-1?Q?k5E9724xS63sh6sl0dRm0HdsSUXCE8Bsc531lRfTyr/ZfR+zSrnkkOlvKk?=
 =?iso-8859-1?Q?oxnpnPCYqsg7qP6vDRX5iUbuMe6ScYDcFYCJ+mRXHPDqDIo+5VUBMJBHbv?=
 =?iso-8859-1?Q?+I+MTH/CbIRXm6qnoY/mH8G9uVaX4P3xo3suSlwE+W68auAgexdlWA2CoB?=
 =?iso-8859-1?Q?QQd74O6MtDQUwcTqDJalOV9SMTTml/AGcEaj7zAYGGiUKYZrQj6tzc9xQK?=
 =?iso-8859-1?Q?wPtvcHRDGbfgubD5F92C5j1hak0c60GzLVVE6K+3J65kGbog5RMIXb715P?=
 =?iso-8859-1?Q?CdKoXvorWPnFtgFfJ/qOezoLZ5GTaB1ZG6NJHQYVI4CFjAxQslWjsHTGCL?=
 =?iso-8859-1?Q?89NcHmVXchxofVDodxHLbs3RJF6E8k+pCrfJ4gxOpMRTJlwUnxKoJvK//C?=
 =?iso-8859-1?Q?YbYoVYw09fEP2YOK7jS8EFcKYfO8N5d3p7OCvW7fZXGHD3wkeucUtQeviG?=
 =?iso-8859-1?Q?FBZnoJ6QzVz4Syp67vtWEvUlXycoGvaqwZFGKj8nqEHF4XR7/9e+ooUQ2y?=
 =?iso-8859-1?Q?B+11IP1K0C2opBkrU0QfEfJUVIUMGWJ7InlB19H4E7vLMoI87rFAD+CYEh?=
 =?iso-8859-1?Q?7PVxXk9t/b44F86qq8TF2v/HswE5XpgjNQKIKBbgTDvPzqrtkeM7ZCP9EX?=
 =?iso-8859-1?Q?PNHTlzibza3ssFUtlTYQx/toE5u7lqLYr0kWkycxSSoq8xey1Jt0emmlHI?=
 =?iso-8859-1?Q?8uy5mOLN8YL3U2p6SlWI7ewE0ne9ffKrxA0RDQ2dLtyCPtuYA13lWrjbfZ?=
 =?iso-8859-1?Q?yghjCERO45uNAqPdNczi3EUqBnFWCw69NVQx7DQcItoHH//7BEf6REYWwZ?=
 =?iso-8859-1?Q?OdCIhTYmpkTl6QJqn2eR42gH09WFTV8cz3feW+Jbcyr+zza6vIRgApbQy1?=
 =?iso-8859-1?Q?TAwA/c2GHNsh/nS9bFg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9344efa6-74fd-4d89-2777-08dde596ee48
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:16.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gf0ejP/ASFlV8kSgx5Oy0148USNOQAuQFtprLhu+xwLNL8a08UmYxhLjnEdlWng7c1MYW82rE+ROG1UjoSt5XxrfF44XDCGlcoica0ksnFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

The gic_interrupt function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1019. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
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

