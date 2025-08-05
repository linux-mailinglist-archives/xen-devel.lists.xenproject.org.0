Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB62B1BA60
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070872.1434485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMas-0003i9-64; Tue, 05 Aug 2025 18:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070872.1434485; Tue, 05 Aug 2025 18:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMas-0003f1-1j; Tue, 05 Aug 2025 18:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1070872;
 Tue, 05 Aug 2025 18:41:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMaq-0003e3-CZ
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:41:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba564c00-722b-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 20:40:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9719.eurprd03.prod.outlook.com (2603:10a6:20b:60d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:40:20 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:40:20 +0000
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
X-Inumbo-ID: ba564c00-722b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUVWqSY2zscj71XVvAM4y9Wl5BGXazb6hLpnyV4w5OE5K/6J9qSh9kvzRpyHWCgRhCgWwoB5HlcJf48WqYUum5rd5EoSDG5IYkOcFTd8sJ0USIgXsEMTFIvE9Q1Sr+I2CGBZTz2zpZhWLhNBS84gdq1kMffRPSSJu0BsxuxMX7T38bv6swzIV5yaYXBM79Q5hx2FXSXTWcOd/x74aL5Ficb1Cdd1QAppBiXck2DqnzuqIQVuYaq5IeEhQ24qqwg3IAnf/BpPxLYMWPe1w2Ioc+O6pCWkR0i5Bmu9zKhHQ/sOK0oUjnWm+sRqJD7mYPdovuseUBKMWMIz58rXeduKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ICIu1LnPFrPVQvLLhoLO3we8fxkiCkYbGFAbNQIUXc=;
 b=vmu8g53t3SUJ4vvYb840jxLmPk2jUgPzT1FCB26SqVn3Iug/Robf36x85CeNTuujjZVhzoHsKOD0zGJfaTrx49ch771HyDAf4tWzB8QiWpVrdVi+w6hPKVSC99YtbA/zEDiKrN3p6ZXeb4wevUIDeQJ2GMWu3Wxa8Ox7e4pcCH/R0+yq5idqSue+3VPTgNs2tXDOq5Rpz1AeTf/maYg9yIbymWnVrz9E8zrsLWt1xkszuEZsOz45Ra1k0CszmyFqsKDpZZcSrDGq9fofl7m7+f/wIEDQThZDFCk0p2f1YkH4NVOae9En6qO2q40p7ZTsXZcutZ2x+3qav6tjRxgUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ICIu1LnPFrPVQvLLhoLO3we8fxkiCkYbGFAbNQIUXc=;
 b=H+Kxa7kbVX6nXNpjTEagYE2QgAGhtovJ0X6WNIBAUA3o21jcSXw2tmVqIbbzDW0mm7yaZDCxHhAh0RNWge5+EpbcbOp32hUc6qzr+PGCu8DBhPZXMC/9QRQuo3qwvV8J0+Qjbe0WSztDQNS6dFeHrCA+FMYuL7nhuEV3m7rvf0RR33k1n7yir95eu7Ah+Hz/H04rITFRy17FK+VBngo53uE98BnuBAMUi+MFSHxemMxaWQNB9zDnvGVJWftUoNYLwvAT8MN7rdRda1SKj2lqAwpFIaB8bOPz4QuRPHQramy6LvErnhl/EVPq7TqiIK+TLokHzKm6B1truQ8gf4v3uQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2 1/3] xen/arm: irq: drop unreachable pirq callbacks
Thread-Topic: [PATCH v2 1/3] xen/arm: irq: drop unreachable pirq callbacks
Thread-Index: AQHcBjhleTZOnx+b3Uimt1PhvreN+g==
Date: Tue, 5 Aug 2025 18:40:20 +0000
Message-ID: <20250805184003.202839-2-grygorii_strashko@epam.com>
References: <20250805184003.202839-1-grygorii_strashko@epam.com>
In-Reply-To: <20250805184003.202839-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9719:EE_
x-ms-office365-filtering-correlation-id: d71c8bb4-a00d-4f7e-d3b4-08ddd44f880d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?N77v+oUALB4T5+xGUMUifma4cjFuPZSCQEVW0NW+w+9AuT5lDBC+wt79Jv?=
 =?iso-8859-1?Q?5Ht5NrxGC46pj0RVFCq2/qXcF+ojdEj4D/IB+DBYoHMEu1NGSPYPgyUM1E?=
 =?iso-8859-1?Q?GEhsTMrM66pcTz2+Z1JAT2+1aErFeSetBVJEIV7FjDo2yMbDEMnFIoRTYG?=
 =?iso-8859-1?Q?G2zHHlFO2cTaX9xT8hgE8Th+Ol51/zMfNXtZD+EF7UG85OUpJ2iGjChDcX?=
 =?iso-8859-1?Q?yBUi+8dqiYwcdklNv4+yv3EE6wQPDfgnRKYQQcrkOuxkIujtpL/MPAxrmC?=
 =?iso-8859-1?Q?UJvuxxI5mH0t07mCoGkShtdBpnwr3vwHVZchNCyPJkOr1ZNGydD/t7iIJI?=
 =?iso-8859-1?Q?D9n524jlotzVwA9I/GHZDpJEe4CvKKdyGQ0tVMD84B71FHojMhYnx7l3lW?=
 =?iso-8859-1?Q?9/exSEN6ZN8HPm8Zl1CNJPONMJtVExm1rbld0rGHyox0XqF8y7pmtCtwEE?=
 =?iso-8859-1?Q?OYxJfAwV+tt6vYCf7ZpJ/WXxC4tBKPY3mV7UihDta6FtYB25d58ItymRd/?=
 =?iso-8859-1?Q?qB8WGdgjWkE21m4R86ztfN+7Z2ZQcoaYmxP/SPic4HgBegRbTGFVi4Sinm?=
 =?iso-8859-1?Q?e13iiMlSaSoEaCVCHUwstVui1lq/fvYEr8oMe8DmjVg9+t+umalo5uS1Lu?=
 =?iso-8859-1?Q?JWgMknjPErYd33FdMkeYGGnA4CNmj9dQ5EBNHU2g8vYSiUyjMPzsq/M4ro?=
 =?iso-8859-1?Q?zhTvPE8dI3t+mLiK4EtYsrF8S/MPTWbgArRmc10FfzuVkEMob7U/WF4VNP?=
 =?iso-8859-1?Q?NFfEUYPoN9A/3DHaAeyilfDz+GAzZukJyi+3UZ5dqhgsqN3LZvJ+d780KN?=
 =?iso-8859-1?Q?OvHLnICaYYDHevyN52ar549yPI0v576VVfWkkc6xvkbxoDOsjY5xjbYkLR?=
 =?iso-8859-1?Q?IYwoQQpVNRlgD119fTNj+8iIczUpzUULHFX4dt6s2atUPcGmwogoyOwBCr?=
 =?iso-8859-1?Q?0fociIAVgZHoiHLH8scNUssbvct/dYCSfZUltC4HwhbGxGFJC0NxzG5Sjh?=
 =?iso-8859-1?Q?5O0+E2oUKFfa5ILunCXh2Ie1xi65blib6dkPS7THVbrcuH3QJ8fnNV4Vjl?=
 =?iso-8859-1?Q?KzaEJthiMyf4upp7HxCFAUGViLujy0MsOlRkRxSRye7E7+rLXsuKmKfhJE?=
 =?iso-8859-1?Q?+8OTMxvqlCFAUXTt7RfjwnWLAM/Mcm5o0bZbAStwZz3f1zNigy503/bfv0?=
 =?iso-8859-1?Q?9Y5iwKYavDP4g4yoGPvZzNA9bNI1qyWsTNhPBxesTSwqrp/8OZQa2c5l+A?=
 =?iso-8859-1?Q?dR7GHpSo9hW/v92HZhShs5D/UvGWsbXD6r/B+SwSstQl9jRtmhJR48uTHe?=
 =?iso-8859-1?Q?VB7AVxdB7MCztw3qqbMzRPQojGlO+uSZUsN1DkqSy1eLMd/XLhQJNgLeLR?=
 =?iso-8859-1?Q?0ZRGLX4l9O1PWxznhlwQe6Tbfe+AN3kqhLkFC8tx3tAjFHF3tv8IL2ES3a?=
 =?iso-8859-1?Q?ZfeZR62+xB94i+wePAepAp2CYZYXNz8NG7ZEheqLbA/C4c6uLNIcQ6jt6m?=
 =?iso-8859-1?Q?KMIrsUVW0Cd6EDfGlrCiGAhRv+Bx9N2SZi2R9aG3+uvg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+pHFd5s1IZ6nAFe1jTo54gyqJj/PGJvYX3zVTjI3pUPlQl/oAVxh/r8R0b?=
 =?iso-8859-1?Q?sHl4nSPJNZcXM3oAljRBO72f/sTG4T3XWANC4KN4tqiyoFHLh0e3RfKNBF?=
 =?iso-8859-1?Q?KRUJYYOwAhJM6EvNKd8H2/plwxrkle5GU/YIXZ/+4Yq2fznjetVosZt2s8?=
 =?iso-8859-1?Q?rpHZcVNIGU/RyQPtP00ZbMoIwYQugz5o3YHX1xNtDdA5g+zLdK83Xl3CgW?=
 =?iso-8859-1?Q?MbbEDEPMDCXIe6TpUb4Oy+EEAzR+eXqz0HBg8HTncmkTSSHYEY1lfYl6di?=
 =?iso-8859-1?Q?a4Bx/N+79OJ+c4rSGkA0lEwbhDO3B6jy6b4ruiUTwAyC1bkFMBcfEBUyRo?=
 =?iso-8859-1?Q?3SSpv+1jkWAZcuEJN/hc1cZ+mxE2NoLf2G4bnSdWvWrWzL2WYFc+AK7YTd?=
 =?iso-8859-1?Q?ZQfPx2pm2WXN2WakAHEUq0hY+LeGT8AdFt4UTk8bYWkyDEjAR3uLjEjf01?=
 =?iso-8859-1?Q?tGW5/+VapPoEDBFLOmbiYVtc5JUiDhCmX7fAcM8kMRmd4oQnfZ0yz/nEq/?=
 =?iso-8859-1?Q?nds88QIou+D2clL9R6EeyV16XZ8Bpdgo/+LT22Q+MC6iRyJgcLkT+ctU2L?=
 =?iso-8859-1?Q?QVky0+2uH+Eq9Y2pXxD9bKISrqTwi1I7Cdj66CekLVHs6/Z9fZTHJbT1w2?=
 =?iso-8859-1?Q?xn3LBI+hUnw5nQALjxJwEJmxTJbpDMS7aSbK9G1l4L6WVM+viAnCK+rOkp?=
 =?iso-8859-1?Q?qYA9yqJuQIrbkXm5KCp9u38kjaOl2yu21u8i/7l50aPfMmTMqhIVU0HXzY?=
 =?iso-8859-1?Q?zPNROTfilqPyEgEXiM+iWYlMaIkNqgsksir/5wTlNOx3s/aMvyqvMxRJNq?=
 =?iso-8859-1?Q?wplgRGgirYUnc8IKY2yyZrJ9A3Mg//TGx5ug2bWsDZpP42OibK4hlJSNOc?=
 =?iso-8859-1?Q?M8hU4+uO9hmW92U52PqCYAXx1W2Qt5tROjcUypjGpD1BNUgcZs5X+IGX6s?=
 =?iso-8859-1?Q?wq3aE76W1LuUOR9+Oxx03LjviQTU7RrBJeSzlhg3K+xJj0jhMPDiyWZ+7O?=
 =?iso-8859-1?Q?nHrZjBgNl9iVxrsiNVLRFi4rMF2oXEShmxnQiA3nFALrq2Jj7ywKbZoxMZ?=
 =?iso-8859-1?Q?JB/WnsLrACJsA/HAQpHAK9PZOb3NP0BTcTLCSPFB+A1jO5I1tQcuMdGvk5?=
 =?iso-8859-1?Q?6/w1sJWFMGT8CzBEEgRY3gtCBqXQMLQeahIbglPws389yazAk5rbx67wsY?=
 =?iso-8859-1?Q?6uFAKfPhFo0MAU88tHHU5Ee0GZEVEYgN3esTajuTpv2vZoSyG8aKNmBW9G?=
 =?iso-8859-1?Q?eZ37Xx4ytuhf4FYLFdY0kTcsW4lhbrxAfOsJ8X9/CjGEU71XSwl2ry9VQb?=
 =?iso-8859-1?Q?Hg4g2nXTFm7eQh0qGfBSV6HC21U7g69Vor/KnT+B0ObyJQxAR/RX9lkQ0U?=
 =?iso-8859-1?Q?c+jEIVKbZMJFTkDHXLY+gLOeVSdKb+TlDzuPWwo4flfw8IA/po+XMH8GKK?=
 =?iso-8859-1?Q?GQ8yTtdGzsckhJnsXFZDj7I+ieE+bgwnDyZ/LZi3cwzw0+kf13ikdrJNBR?=
 =?iso-8859-1?Q?ptQUkYCW2J9HpK9wSIAjt0kiLr9vTeap+IOETe9AQzfk6E1kFgFv3NOJO6?=
 =?iso-8859-1?Q?T/fa13sLX8eBA1oHADTWptPOwgti+iEDSaVPGvTI3eMKnYkybnqelZP6uL?=
 =?iso-8859-1?Q?auwxoKg62WpE/Ahv+X6jwohN7tfi9HPjrvC+0E43st7Ob2AmUOQa83mw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71c8bb4-a00d-4f7e-d3b4-08ddd44f880d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 18:40:20.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLepVwL+sFduqI5NySNLPQfGSavwbB7VxVeZwb2VUsJHQlPfjUAO6nmI3GApBN4VN/Y/7ZOXICoSFlQB5g3jL7/sQfXa4vkYIZNjiIXK52s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9719

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for
arches with pIRQ support only"), the corresponding Arm arch pIRQ callbacks
become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/irq.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c43..4bbf0b0664df 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -595,35 +595,6 @@ unlock:
     return ret;
 }
=20
-/*
- * pirq event channels. We don't use these on ARM, instead we use the
- * features of the GIC to inject virtualised normal interrupts.
- */
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    return NULL;
-}
-
-/*
- * These are all unreachable given an alloc_pirq_struct
- * which returns NULL, all callers try to lookup struct pirq first
- * which will fail.
- */
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG();
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG();
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG();
-}
-
 static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 {
     return (curr =3D=3D IRQ_TYPE_INVALID || curr =3D=3D new );
--=20
2.34.1

