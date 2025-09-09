Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B47B4AA11
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116194.1462604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvOd-0005ue-3f; Tue, 09 Sep 2025 10:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116194.1462604; Tue, 09 Sep 2025 10:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvOd-0005sr-10; Tue, 09 Sep 2025 10:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1116194;
 Tue, 09 Sep 2025 10:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvI0-0000yD-OK
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:28 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11555a8b-8d65-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:09:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:21 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:21 +0000
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
X-Inumbo-ID: 11555a8b-8d65-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWBYPXR8V/kBGfCmcAFytIuqfgjcuHW/eDrkNm+e5mAiaXZIW6k1GWbuDl+D5F7fxWtKjh9mnt6rgHKEV9AmrcVIsosL1suD/ViGStRdGfrcdV/ewpA7sc0ynD/wbyZeoqGWFD9fYSNzAN2V3RqaqptmYRQNmjj0En+9kUwmLfnUEWs527QQdm4ddyb7PQnsD/Sf61zIyFMOv5B8fgGWLJrY9ZiBFx1oEVzZXZeTcF2ulfgucSQQxo/CPETMaKce7ANJA0HdRUr8pf7teqb4Ima8JUnVLJGcFDb6FDQOVQ2OsFakM105RWF9chUdeiPNdY8V6vr/dUNGAAxvp4YgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wvjb8Q2MRZ30uBI5D+0Q4eS0/g5NqC7ZCG+VanVMZrk=;
 b=xEohO314ESLcmE5Vs1UuBcxTr9Dh5kR0n4S5DSgXoReyHT1bCqjXRlYaCDIqbx6P3ZORIKnqSDX5idGYophaGvFI0GRFfeeKZvx/0JmXxNZCBjvOiuz5vmxeMFkPZWC3xeMn18CPECm6rJIAEWPtYlXWmutGCsVuUpRroiouufIFg5b2TxTgyPIePjM6nEesllX3qiCCA8HbzyKSmrSbcbAlu4VXe7Ntrsfqc5gSMyc2pWyz0T2Xe13etCJnJ3sclr7MWgaCQTCNP6G2slhUjsSHZT49ochnksBG8V/LoO1TTnX2ff5x0fs0K6CeLZGzxsPpMNHJ5JrfhhP/qt9uaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wvjb8Q2MRZ30uBI5D+0Q4eS0/g5NqC7ZCG+VanVMZrk=;
 b=sQGiMWKFmhNVOLRUNuv3AP329xM8642XyhCbocGdxmkLOTHHLumRgn9NflFRswZQoiRWlvkBndm6nNFFLvSsMDwshrEZQDrzVUU/9T0urTA8IZKyUOpMUTXo3Q85PIMuHjXix7iG8RrB2j5JkMIKVyfEAS7Tl8o2Cnkv/Ed4LpaakKCTUf5MM9e/1pRiN1svofyeQDwwWFAM35PlP+KJH72VojCj/ZC0iUNHz/XgFUoljzbDBaRyxg9bCinRfy5Q8GL1GUkO9kgyV2JAoAxMkOs+/KJwmthes7KP0/By27aY9Z5MfMlm5RMJG9KB1QJxifKAYBAAih4tP6TfWgEsAg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Topic: [PATCH v8 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Index: AQHcIXHPX1YLtsRvi0asSCS1zVQdvg==
Date: Tue, 9 Sep 2025 10:09:20 +0000
Message-ID:
 <c0ce59346799a0b42f9542be2e0654d64155ddc7.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: c22e6002-2518-437d-ae78-08ddef88f1f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dpZLcY+27wp0XnLl7hPcXPlxFlWYr4tiiwMty6MDZutWzmUznGl3/R8iuj?=
 =?iso-8859-1?Q?zZmDvF43jKY6zkaxYw6+f2unrHGUoOafl0cRW06UnEVEbdKxrflWd/Y2if?=
 =?iso-8859-1?Q?2RlRqbFk9ymongCLa08Ab81obQcb1Ud+Y0TDJ6kGi0O3ARp45sbf4zyCym?=
 =?iso-8859-1?Q?EUYxzmSh/89mBdzQjfwBhE8RX9y7ELs9aDqynEdW22x3jQ5RiRQZ0mQo8k?=
 =?iso-8859-1?Q?rNN062bliDQ7vXTL4nRK//CwByW4mfUWKQJkVAjRR73IsNaEYfRorteR4x?=
 =?iso-8859-1?Q?EWsCRfchWPTQmIlhWsRM3r+Ky/AHlEUPClxSFjFiXv+5sErVP2jf2F5bS8?=
 =?iso-8859-1?Q?TwC8o3qXfW9Jo+JsgBMa5qas295wSkrHreHju1WkcTbW1+7kg3vZtlqRaE?=
 =?iso-8859-1?Q?T7yUJbW7P1V0OTqm1d71/h4NcV0FtDsdUqJopBwb6iMw2A07a+4tqJ2NBZ?=
 =?iso-8859-1?Q?QE7jtkr21AYCC6vybAaCoqdjzraFbJeiZ7whAfZ70Eql/7eq3NVsyQ2TNG?=
 =?iso-8859-1?Q?RWXi8BAhV0RdzVTk7zQDrasmdCiAbBexQVAThjLZEcVa+oe8HJjDr+k5DJ?=
 =?iso-8859-1?Q?9pCO39l3BO0rdj+f9x8HToYxzZGuW4MemdwPE/Bmb43EFzeDoPq+Qs75BG?=
 =?iso-8859-1?Q?YfkYxS2MMJPfQmRu7PQYBqpkO3hxpswHn3juQpivCAnri7pza90F89J2Eb?=
 =?iso-8859-1?Q?XYqqT0KauTlirUVao181guqjuTpvvOPO0jwrcuX5pXXPr2UEZC+gSoN/qv?=
 =?iso-8859-1?Q?D9zwhNMGQX0CP/lxl8nPt/gQb+LMqofTz1HUj+YUZZw++Qt2L+f+t8XpNk?=
 =?iso-8859-1?Q?WDULbqX6PVUNfByZL5UVsRbddflLMcFe/tWoKV86ZvVuPkGEeMNP0z6Yrn?=
 =?iso-8859-1?Q?7fMZZLPYwHFnCVNqIt9YmxvIqo4Z09ylREtrW9p1OAMxkZ3+Ms4VQmyZj8?=
 =?iso-8859-1?Q?CyV6TU9Hy6HdEhqU64+uz0OTpdvUaEnlj/IlK/2kDk1VlZeI6XVObpnsh9?=
 =?iso-8859-1?Q?snluglIqdEIGN4QFQ4Gis/YqUHHq1EOK9xF1lymHYcYVqur7D1V4cND+Ku?=
 =?iso-8859-1?Q?K2NSpKTzaR/5XaTuYD6dX+ULcMTdm/RMlbJqOFAP7t3jzT5tVKDtBc80J1?=
 =?iso-8859-1?Q?YQc5TxAKVRsY9kwX7ANHBz9PZ93MXEwVGnLXE+zHIGzuXspozvZTPOa6EY?=
 =?iso-8859-1?Q?WP9ud3JWoHS2q1WDRM3Zc+FUgo4QzFMrdMPNhvBrdu6+3MS31nRNEv73op?=
 =?iso-8859-1?Q?HFKlUugI5aQRho7YqRC1+AfHj05gVEnXAW3PylkAG8VnsH4rZfB6cixspv?=
 =?iso-8859-1?Q?xqQCGxClo9LllbYYGILO3rz7sbKKTl4gNwp5zwJk3AjyhwPwJ/KhOOitS4?=
 =?iso-8859-1?Q?lxnsaaIwFDmEhTTxN7ENttmtjZjJaITquTE+D1nJBywrrfmx1zaTyTExhM?=
 =?iso-8859-1?Q?fKO7/pqJKc5QSDWO4c1YJK7hijVCHo5FWvMqu98qukHV4i50CZi0oJEbPr?=
 =?iso-8859-1?Q?qvqYPR1ZIUiqmFshQij4wZFfUHk40o3MrlPYLKu81UXA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?S502qPGptCo2Mw9v70rS7DWlPVsVHnyMHLR0uVsA7k5wJrJSLfEuDqbi6t?=
 =?iso-8859-1?Q?N2AfzJc5VTP9ZdODP0u1a5KwlNYaqxJ8SXY26JEVCPWC3fckV8TcWkIsXh?=
 =?iso-8859-1?Q?jRpgyO2OMp3FxorXzs4d1+bKKKYFyMTyfzkStOUUczb1Po1dxnv7m2lSuG?=
 =?iso-8859-1?Q?93aLX7cp7HjpTVIaSdGUnfXmkTe0FcvvmAiMgYDtq4tH49VgGsDlldXwqK?=
 =?iso-8859-1?Q?Uk0Kgzyx2LvaX1rGqIWH1qwpTN6W3Wh9YrlbXXdkcqStNictBWCdGtfJQH?=
 =?iso-8859-1?Q?1loe8KPifZxOndQWPa4tzA77xcSRU4IeKlKPUPgWDs5noV/f+VFHtONsYm?=
 =?iso-8859-1?Q?vd3mre2ohOHaLPJqWVIFKjik8Xhm43OQBBc+kgZ6XTbEc0KtdZPtfhL3KV?=
 =?iso-8859-1?Q?NxG0PSXVq/sN/jaWHaYR4I6hHUsF47bdfAUA5eSPIFTwRU3N+08XOQDPe7?=
 =?iso-8859-1?Q?GuWr4SpnWhAQSXK9QksVciXURja969RRBSVFicxmVt2Nz4MG7K33SA3u0L?=
 =?iso-8859-1?Q?lZHzZ1eX0p4LC1y36gl+X3/hawSIOTVq9BOjV1m4/muFRUdDJWBRSQviyf?=
 =?iso-8859-1?Q?K+BCl/YV5AlgPfP5efpwAyWeInPHOpkz9o5NVY5nrLK0tJefb1ajqYWaRJ?=
 =?iso-8859-1?Q?9COMR6fHa4sOZIxRUZNNbVJlM2U/bC3qCb3+Tkxtqf9qImiBghSBPptnK/?=
 =?iso-8859-1?Q?vsnSJq3FZuMJhqF/s3ctL2FVUP/s/4HIbopwD37RQL27RATrt3u52ufGg1?=
 =?iso-8859-1?Q?q79uzTOcnvarUtEtdFZ0RUvsR8GL2+W8A07lqHntVRCFAx7+wFVKOeQD2m?=
 =?iso-8859-1?Q?7LNLKVXETW5Ab2Gdiup/4JYKX19DXxJVAcxC1OadcwOLNN6lA8Z+3UD8fU?=
 =?iso-8859-1?Q?0sGM5mgZE8az04AREPcJJlK1gGGsSwBnjl8bdStf0GsSgZnQLq2W8gmKUB?=
 =?iso-8859-1?Q?YWtmzzOgPMyym1idqWVMJuYe+75CWb1pH5sP1r81QmGeP2ZRGOOBCwU88A?=
 =?iso-8859-1?Q?q25v8bRzxeeGbVsgLBn/FgshrsCMUP3/n4RCBUI/V2SlmVB7cDN0TIQI48?=
 =?iso-8859-1?Q?wLzg6aNk/bJNZYptoun8d1B38z1r6IOeUhvyxr9Vex8f02mPaHgqpMKM6X?=
 =?iso-8859-1?Q?3gHIt6ieYFdCkWY7fJQw99VCmfkaHWBu59svvXa0/WSkx5hPRK54uL1x/7?=
 =?iso-8859-1?Q?PbV7i5LLOKYY0jJSVj2/nKOJOBtN30eY99Ia0A0HU/0pEbWkT3KKnnSNO0?=
 =?iso-8859-1?Q?gCTkdrbHtLuN4cWobd50VOU2pXbB2TICKugiCd5i9TUzAGsADviSkyLg1O?=
 =?iso-8859-1?Q?87TLWgWQDV1m/n36q4r5pBPe6WP8pgLW8gwc3tvzhKVn1FdnJFS/vjSEhl?=
 =?iso-8859-1?Q?O/3isKKe3DzI0UGXnRNoEcCrabnR/EPw++VNMyCW5u9UPDz1H9tLeIyAA1?=
 =?iso-8859-1?Q?4SjpXIcM7NP7u7VDbrFz5d0MPgF5fqntbEuJNzF0i/595fBHLgzG3whAC2?=
 =?iso-8859-1?Q?J3E1WhbJF/KmmDQRrnrlUUG5TQt8atqwlKVDxCONAZh6vuA2vc7Ifaz9eH?=
 =?iso-8859-1?Q?1JA2utF3YY6J89JFEt3ou7FMeL7JvhyYX1BIKItW76AAw51X5HNLQgWu2j?=
 =?iso-8859-1?Q?1wsEzkUwe813h9Wu3f7sFjCWfaTWC8ymCqgr+G/hl3V9VD/aet2Tu/TRMI?=
 =?iso-8859-1?Q?jGUeElkUIXP/IT00Ywo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22e6002-2518-437d-ae78-08ddef88f1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:20.9464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1giZiPDNqaxiGZFps3l2MW3v7hAFrw8D7hPCsVbf5ckYq1zdti14+F8Mw7BKraUMNjl7HnBo827ZzcLDNWSYk1BY1l7tX1PB+ZMMywoMWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

The gic_interrupt function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1019. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- no changes

Changes in V7:
- no changes

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

