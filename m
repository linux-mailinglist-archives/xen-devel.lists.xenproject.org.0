Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B725B4AA5B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116289.1462665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvUR-00023P-9D; Tue, 09 Sep 2025 10:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116289.1462665; Tue, 09 Sep 2025 10:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvUR-00021g-6I; Tue, 09 Sep 2025 10:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1116289;
 Tue, 09 Sep 2025 10:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvI3-0001My-Ur
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:31 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12a0d1da-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:23 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:23 +0000
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
X-Inumbo-ID: 12a0d1da-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqTAwCKlpOGsE3qP2pCZMtVDz3kE/TVwI7M++Tx9pp8ep41CaYA5ik2LetQIs8cl9mhjHj9+o2y1JsZ/IN6O44230JN3aa6XUtkxGtgznKzFuWiQE+b/CzkVT7zHgC/yYUQ5XDUvtHxCAIKINN83oPC3DJpxN1/IXRqbzLZv4Q7peAJ1YvOzDWJd4xG08aehC/x8WNCJXcSFAKPxXY1i3wTaaBayFW6mkASJBQVFKO7KLolCUYgW41/QysGtR4aPWWw1IESt0gN4mIWdkhM4VaPF0Wlp4Yy1KhIFPAXv1hk4X2Nodv9r/lmcsbh1nZYSDDE7eHBmy4JHnLget06J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK2ANacRUU7NJsl4Hbi5dxeY3QEVv3ULJVeqrFBFYdw=;
 b=l4/PK4tdGEbLumBta3OMCSyAh3Omx3Ykx+Kd7kjFHGzKT6oEmhGC0gZABPXCUPBzTYSTtxgfikJft5pQk8lkVNi+/qmhltUhklC3QDcWWmimMzwAXlN2BTiQAVhHCPyViInDBrYDDaO5XpVt07x/iSiM3fYYq5+ngRgEH4EPDHyPAWKHhr8zGv44K98nkKogqRHaeU9zQzUh49MDzg2E/SX0vl1YykA0djcNDtQ4t6hR7vqGsweIe3iNFDsUOoBDGKhYQduvCIn1sIddjSi61UVPwy8iEUYb5QEOIx0RwTccu4xicZVmJBXGSwfkTDnrCq69jJn9OFpWsShPq6xFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK2ANacRUU7NJsl4Hbi5dxeY3QEVv3ULJVeqrFBFYdw=;
 b=ZO9i2zhMqC5GMNzQ8y8EJaLuDevqTIpLcURYsZipVEq/fTFvQ6OxAir/hznQnLIrFHcmAiv+OK22GAP1hyzPhKMtRhPiWTaYoW8qT0zRr1BmLR91SNHLwChn+wVpTe7exrwOaRGsXnDf1ZxLIR5/KMIi5LfUkDtn+5FEVfPx2e7enD05V96Mz8JF5ZXw4ut7FdQGwgz1i3eQCLm76eVj7IVentgEkCV3x94ia1XGmobOdZxVNHOyP9dmMBJbiBk4glVG3IDEg9pjCCrg8ayrqkU9cdSuJzR93n0UTX1SbQJIYWsKr+1tb6TeWNKotpXNRrcP9RJY5Ay14zh4+DlwLw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v8 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcIXHRRi0flx0W9EqWXyy7VrmvOw==
Date: Tue, 9 Sep 2025 10:09:23 +0000
Message-ID:
 <9479e88988b0c0c2e88d8ba8d2eb210a2cf68c8f.1757412099.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: eac54e05-469f-46c7-0760-08ddef88f393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EuSiUmwqx5vH475IXor8An+8zkkWHPKD9qpJYQsh/bAyrfw8tuR8E2Ripe?=
 =?iso-8859-1?Q?CBILDX7E4rBIDrkZgkoxEZjg2gO3XnHYXCkB8QmZzKn1UbuIyJbOIluifx?=
 =?iso-8859-1?Q?7EE5MIFKC8d8TR2gu32BblXR965JuMKKLzP4huxTLKJyQoBeBgpoT7LiBE?=
 =?iso-8859-1?Q?LQ0M64t9N+iGhvwKA9QdCOr8z+r5mO0bNY684ajDupQdQgOd4gXJ74zclp?=
 =?iso-8859-1?Q?wtVP+Ee97QqLLndHbBGolonX8hrWoSf1KkoZ+ljERQ8fxR1RUFbKBM7Kha?=
 =?iso-8859-1?Q?1Betf0WPfRugt/7Rc4BGR73fTIfkjCEAwjl3xOmToqL4ac6Aj/lSciC1Kk?=
 =?iso-8859-1?Q?5Z6NlZqy0cz+In/1x3q1NWNm+gC1Zw3aDZGn5rRrR/UDJ7dDkyDxv/r8OG?=
 =?iso-8859-1?Q?sK0+MHtK9rYTxSpFSy5KiWkcXavQ5bxEVmKuqK8c/2JUJdovZIq81Zoe3M?=
 =?iso-8859-1?Q?YDY1QAlOr+7t5WWrTZB6gWT5NIjp7SB98Kfm9i36XrHWt87xmDI3taWFHv?=
 =?iso-8859-1?Q?v6FnBR4x8lhlRbkTZe16UcbZyO3NeFRqdDjTPZqhpwzEG0gi7w5OSakQjy?=
 =?iso-8859-1?Q?hr8Gf3Vqeh7W85BKPvichFymETfAxOXZQQVL/zbNZxMhkJ18XvELJexe5F?=
 =?iso-8859-1?Q?VfU1Kxq/XcUpGh9j3l0Va1JvjIHNjubRVIqa0dDSvB8FYKgf/+a5nXYop/?=
 =?iso-8859-1?Q?tgBPVk0qY88zkUV4utBZBhQBNO+w3mqNnQILtGClFRvXudQ9GGA26yXDTZ?=
 =?iso-8859-1?Q?c8oBGyaLrVU3z4jZVuQAHtsBpZg/OVq5HjbR5UFmcqd64chBum5a5COy4L?=
 =?iso-8859-1?Q?L03IxEGj7ZQ/PKwuU9r3ubNP9xF5hZjY04/zUd6CMz11Dc71pCLnMkSYIS?=
 =?iso-8859-1?Q?lsJ9BDYo83ufeLI0IwdIqZCF8LFPkOWQI0eHZqIyL/iKd+KL3jsiH/vqqo?=
 =?iso-8859-1?Q?uJJXlGZCBI0kZjN5boBA32TVOzwflyyeUktH6f9DCuH1FbuaBJ2cD87zXy?=
 =?iso-8859-1?Q?MKC0VaX/ebzxb7/hPCsq+HTYiwzr57SO6IP+1vT3fStI9T+xu5DCtE1l35?=
 =?iso-8859-1?Q?tZpuldFTvLTM9JZz+7mVHc4QBd1JlBkNE6t0jMSu/pOhu2Rfb8vAl+e3nt?=
 =?iso-8859-1?Q?s0c3Lkk/UKdiDuwpk8F+soztLTb/54SIUmURpeUFrG9Xvxz+ZQHvRodsTl?=
 =?iso-8859-1?Q?exJ5N5CqeXd6XJt9FYZDdJd8Pb0niGzc1zWBsVw+td8ZtLokOz2L6nlgqE?=
 =?iso-8859-1?Q?xtgx35sKXEjuPLetWcng6mPu0BStbz6zMTL39TidkQLZjbrLoCSwM4c2D5?=
 =?iso-8859-1?Q?T4/RuDFB8iRWtfDFNz2/1UhpBL8r0BegzC1lOpjrgmzD3Emafq7vyx4dyX?=
 =?iso-8859-1?Q?b2vmh/3r3MhSVspGg0VcKkkehXWN7xwfiZHgk+4d3WSfNjOTw4vv21n9qk?=
 =?iso-8859-1?Q?XVQKF7aCokPlkZ85BGevMxD7LhZAjPmff4ih6DvTcQvkQX6fpgeRz8+Cd3?=
 =?iso-8859-1?Q?q2sX8TMm8yVHPYyvOEGznFcgGHtV902nzHzXVUTboB1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hVPE8nnBEJ5ZNeENMg6/bZ8zCQl3FeXlnFnl9bOUHSiUOU88vLDac0QYcY?=
 =?iso-8859-1?Q?oSrgv8sn9/rDgwWGnv4HwePzvMKN9Tq3gcOvjcls704ZFTacPXJAWjtbHn?=
 =?iso-8859-1?Q?Sf/dB2Ehn258/QRN6qpuAz2dfL6CxwXx+YSzWvtKWFKcHnQA8GTccYkGZg?=
 =?iso-8859-1?Q?R3l7aYlvbKUvf6vsz4j3aypZuifKWNVlJh87de01TJJgIchnQL7+VO735a?=
 =?iso-8859-1?Q?VAPOsviM/yIa7sOLSC/bSqlyfUv1fMPdHvr2n/o4zcXvBg4hMiJgxnkIKM?=
 =?iso-8859-1?Q?ywNe9AfTPfdR0qxkyLxgkInCFkMWmJ71iTjkDy28WnO8OcbLthggYkwMNb?=
 =?iso-8859-1?Q?hDZP1btVvrRC0+KIt+03gXe4WoC/MtE3cETHLkfhirQ7c4Dyza3cn1RcKr?=
 =?iso-8859-1?Q?5UO1eS2DCTRZXK1WSI6Ku6/QX3SEO0UNkA9okXxxrwnmtpOn5EEmiTPICw?=
 =?iso-8859-1?Q?wh/oTqGe5X/NKe++04HtrYcknil6JLKG6Oe5cdZOjyYdZzRlJQxU90O6Po?=
 =?iso-8859-1?Q?vSqBcNXJ4c4ozyGsKhU9RKO6Km7xpxVYSZUzKcV5UG6xrxVusGIxAwTSv5?=
 =?iso-8859-1?Q?dT1yAcOP26RvqsK1tHbNj9Hr4rrBSnxfTncs6Ck4oMNZl6pLEh+y35VfJv?=
 =?iso-8859-1?Q?bCMcu3bq690yxpStfjirBw9nfmDpg7LRmTAKCVz4jDbdVjHbGv2C46cNFU?=
 =?iso-8859-1?Q?ID/cMcbm0Cez1TEeHYDAhrlhZ4ZpyEUqhgnnf3pax8/aQCJ2G2oIjKWEti?=
 =?iso-8859-1?Q?EpV8FkzbYExBBGgtkK6+7qNguB2aB2vXQ6ZJLB+Jt/nfVHZaFAp0iYeuYK?=
 =?iso-8859-1?Q?N9FQxllql50WaN7iHZ6a402hmYmGgXEnhWulG8riInJ7EbTbpSXsQqgMzg?=
 =?iso-8859-1?Q?qVLc9AbtOAyQzQLMjVUwyFTsAabty75wCdY29LZTVJHT6fCxINGOtF+Fr5?=
 =?iso-8859-1?Q?LWl2xpYlj+hWzfply1qD6Sud1TcRFaIbrRdgIK3C7nnyUWNH8Rs3fwsNVK?=
 =?iso-8859-1?Q?iaogTG8bkIcOcrvEh4NaXGQSZbPM8DdLtIkzasA0gK7nzXqOj5Bb0RD+uK?=
 =?iso-8859-1?Q?jV8ScBT8NZ2QDinAH35D1tcQoaLChUXyBgwSbOtUPBgFkt9csA/LNYZsQj?=
 =?iso-8859-1?Q?Esg5MxcRaQkjZIPTnWuBazpU0VmCOxpWVeLAW/8Nqaw+01GDm39wx5Pius?=
 =?iso-8859-1?Q?4u+Wa8qotdbCYDZd/1U/CCJ9oiep4/GhqFWqlaaslfI2kp2yyRfDVJXZHt?=
 =?iso-8859-1?Q?C3+7rWEQw2m9cD/UQnVOJz/uvBM8KXKANQGvd0G9Q3oajsgAVOb3FT9MPU?=
 =?iso-8859-1?Q?5MkJ9lv3ZfvrrP5L79AnLQ/99gWbMc3XFWqsZ3IdNhc3UAXS8+QySDCDiz?=
 =?iso-8859-1?Q?2f33MDqwxP+/jZTqik/04l7/3tIxNKMMia+Q1spx+JYI6VVH/5/R+JHVbE?=
 =?iso-8859-1?Q?KQVYidTRvAkuKG46l9CVbeWC5VYiWSvBZCPcCG0wNk9/ymGpn571zAbUZB?=
 =?iso-8859-1?Q?snwt5IP+o96oPJxymBOlZPQNf0wTFihDvnYMm7TDJz/85q+ei6d/HUEwBC?=
 =?iso-8859-1?Q?LxMO8y3wdZu5H3XBiXxQ0V3fHY4hahYXKpDkMzAn5A2apB4Cf8NfE5HLX2?=
 =?iso-8859-1?Q?Sc4K7zX8qJCY9i5ANA5SNxb0WrWTXSZoSQZQ4uRkvVswtCVfqBHeALQoqY?=
 =?iso-8859-1?Q?HL72Iyamkdse7fQfg+k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac54e05-469f-46c7-0760-08ddef88f393
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:23.6993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3ZFeX72Y24KAwVkcq8cGk6LwM5/oEJJ8FgzYax1ZOUBtuCPVCGIXCdc6Ka3IdEgcrVXkJDn/iDBSWFR3ilsvTVLqg/z/XLYBmyv8FqSnPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

To properly deactivate physical eSPI routed to a domain and allow them to
be retriggered after the initial trigger, the LR needs to be updated. The
current implementation ignores interrupts outside the range specified by
the mask 0x3FF, which only covers IRQ numbers up to 1023. To enable
processing of eSPI interrupts, this patch updates the mask to 0x1FFF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- added acked-by from Julien Grall

Changes in V7:
- added reviewed-by from Volodymyr Babchuk

Changes in V6:
- updated mask to 0x1fff to avoid confusion
- updated commit message
- removed reviewed-by as new changes requires additional confirmation
  from reviewers

Changes in V5:
- no changes

Changes in V4:
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3370b4cd52..c373b94d19 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -211,7 +211,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x1fff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

