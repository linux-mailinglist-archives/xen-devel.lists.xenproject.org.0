Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296BC4F557
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159201.1487613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZU-0001M8-Tj; Tue, 11 Nov 2025 17:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159201.1487613; Tue, 11 Nov 2025 17:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZU-0001Id-P7; Tue, 11 Nov 2025 17:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1159201;
 Tue, 11 Nov 2025 17:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZT-0000bw-25
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d7b209-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:22 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM0PR03MB6323.eurprd03.prod.outlook.com
 (2603:10a6:20b:159::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:19 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:19 +0000
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
X-Inumbo-ID: 73d7b209-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNie5hzaFx/BQCr0Xl1Fo1fX/mVN2VoQi4ourxs/zJQJ9F0uVZYUAotVLlPWNeFWraNsNeUm3/QtIxtgh4HdVal2htt3cPQw3RH2ePmpredffOTNaEKPWgxHo1Z/A6v/sGyB5XW7+ILo3GF7YpIqGsYOF8ya4AXL3n8t1HXNDnS0YTTr5m+rcTl0/b+3jNhYwCtDeaCq9/7LzIBqt0Jqmyxl4oGy0FkHIDRQd10KBjpXftvaO2CVit3RVsEH8wr373jor9yNGmbh1Sjpe67oiIEfXiIJeor8e/VklDKcC8gO9AbLbPNRfGWG+Ys6GbgBJB2XAouNXETqoU0/sOJs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/lnQxdGMZSF9FLwYWN8SmKP15cEH8ABapnXho5cQ0U=;
 b=YdHnE52jxLMnmuFAFjEatlfM/i/AWas4z7KG7UE9ZTXhKJuPMhodhZR/0V7Kbh5AIkptoTxGM5vQJO85Uzx9+hKU5bUXn+A9tmaOkOsKqdmqeqjwzZTTV2roLvZKpFI21GRCbchHy8XU5uKj9i4FwzJ8qoqa3mhctfTe2eFnmcsptRZ5sS58kUZpB3J8a+5cp1Ae5XgZPq4iHaIK/QxAGBZvkMpSH3d6b+d5GtquTdCjg/5KPS4dI6B5Xp/HOam0ZNLTlGJVQ3GGWwzeClOqp9vZbrmvS/iYzYkwSVf5zNqakgxAGVWpjgFtQI/6xeyTutEce8IRjMz9kxZGzptaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/lnQxdGMZSF9FLwYWN8SmKP15cEH8ABapnXho5cQ0U=;
 b=jdLmPmfomyzWEhnlUtwHfVdFtckruX3gPTj9J+oU/41w7ZMRTjd/OvRBBBagz/aJGE0j2fwPu6vibxAKMe7kSI3+zjTlNKUR/K9CO1j2jmR1ejN7Pm6b5UarcvisRGL8x5v1AE28gHtCswVAUBnbSevOfuyULxMu16DVRfWXwhgmnjO/pykHBX6sSnzwg58X/+ogyhSct9sFhpotmLqBdba2Sl28JN1vVDGyVCRGXEXOjpGRfKvIUnT+H5XjluxREldfT3rsH619Y6FTkYu2YmCtsyCiUWH4UOljl3KBSK7nO6UpFnyd0hM7X3ll5Gjp4KYWqV5TajaiSekrsb3now==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH 5/5] x86: constify has_32bit_shinfo() if !CONFIG_COMPAT
Thread-Topic: [XEN][PATCH 5/5] x86: constify has_32bit_shinfo() if
 !CONFIG_COMPAT
Thread-Index: AQHcUzQz61ny0hXUD0mGRD03jggr5Q==
Date: Tue, 11 Nov 2025 17:54:18 +0000
Message-ID: <20251111175413.3540690-6-grygorii_strashko@epam.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM0PR03MB6323:EE_
x-ms-office365-filtering-correlation-id: 5cac667c-5354-418e-fe51-08de214b56d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xP9HR70JCWVImCa5IsggLUUAN8nL5Xt7YDDE/ZgJR7ZTefYL408gK740lD?=
 =?iso-8859-1?Q?W1V9yj3PFqbURQA1GSO82NVPdKxZ9acRduy4vrzoi4LMZtzNIabjL4+G/2?=
 =?iso-8859-1?Q?+lu5lXAUjjeZY6VyPqXk3sIuGxo5H69GIH41VyT8lJJszraf1QQb0JTMbL?=
 =?iso-8859-1?Q?FG6zFLtDSyfXMYDEWLni7E/+AIUFTZP8sIyYJ+/xuQo/1/Nq9lsXdWeY7O?=
 =?iso-8859-1?Q?Q5FKADv77N92BkHEFIl9Zc1DDERdowdSq2h+8i+rdaFKGKVY6HwVhqsLfq?=
 =?iso-8859-1?Q?c0A742zBlCVO71a82m6fU3Pe5j9ayvppSawed/+3ccYvVnJ8//iWyofNBr?=
 =?iso-8859-1?Q?V79RbYm9iENs32UDgj93eOc3fasrgWmGouktY2MlmEeOA2J3IrIl2+4Int?=
 =?iso-8859-1?Q?uS0KDmmYASBuQHE644TNkcTo6QxEbFgFUg/BGVPUS51qdOLPicWU5z3TNB?=
 =?iso-8859-1?Q?U+QbaSHci1jgm/OiODho30hvqVlkT3gIeONg4xFxLZlWBSsmbiEON6Sfrp?=
 =?iso-8859-1?Q?pHIa0NP+DX9wYo1hiU2fKY482Dzc5x5yOHK/kLdJfgdjy7Diaf3HOykg0N?=
 =?iso-8859-1?Q?d8TdXD36Xwt0Hd9SGf0fcgvfeHAOS4LrBJ7wC3ytHXrgEieN90xh7AuYwV?=
 =?iso-8859-1?Q?y77G6bnYRPJPmJ+3g2pfxoPsvTJxYSYg0lMDlIKzfaezSxsZML8/Y2WIHu?=
 =?iso-8859-1?Q?5C3Royy6/8lv7u/WfiWpTbM7p+O4f/h3Ox3n49W88B0l2pQ08nqTfCgrrd?=
 =?iso-8859-1?Q?BxI1Vjqb25xaFxH6m7ZLvgmcSTKM2+4hVkwcBX10vlO0V1Ze3auwzGjvez?=
 =?iso-8859-1?Q?Bg28HDX2qUIBoEAz/+xlnaT8qhHkShdEqDudHJnyuPoWKwJYmTG9+E1mEy?=
 =?iso-8859-1?Q?lDghrWKgQQr8HF25r0QTa7uGHqpBWkc85HwnYC+wvdXGEpv7NJafZurFM3?=
 =?iso-8859-1?Q?8VU2YVG4OUSEoZE4dgk7NZ97fXvVdeKaOfXBNVt1ffjg9rrHY+HNoo9+xx?=
 =?iso-8859-1?Q?AxcVypLQt/LVPYodcpHSz43dCFEQvMkLcSaONfOg3aQNa1pTkjTE1/+ghi?=
 =?iso-8859-1?Q?MTrAGxjzuwqbPB4URXoKADcN/D0pn0uVnK7yD0z3tgdXE3r3EbjYXWp5xU?=
 =?iso-8859-1?Q?KsrtPygmdhgtNs88blvgIsfKw0wM3ZCygpz+pcFpKdL4Z4ubapSPgTQxW7?=
 =?iso-8859-1?Q?w97YLMtoBA3zVlc+vhx/bHdvusi45miPyK8mmBEwkNyG2HlY1iIJBsFzzs?=
 =?iso-8859-1?Q?eQuZxl4sKSuLjGw2KKqB6XNZczDZ8Nblvpo3k9iiKZLQU2M7OQSKHyITF9?=
 =?iso-8859-1?Q?s4HS2N5eNc2rHVd1AWOLQW1+y+FNolTGhjAL2FbFHEAtk/YbDh7gqNjdzC?=
 =?iso-8859-1?Q?vwkhPm8L8fVe4AEwABxzyq5gxnT0AF7s+mBugfpjeEbYpb27dOXisvN5Wr?=
 =?iso-8859-1?Q?Nh1rY7zMsSpqVME352OER8cWMTX6vqFv75lcWfi2ktmefHF1sDpFNfn/Bw?=
 =?iso-8859-1?Q?6i/3Xlh1g1zpW2TSqioTorHCqiNP3m3WZoINGYbG9KdWRNhIHXI9KFI2Hx?=
 =?iso-8859-1?Q?4/z58758seDJHgoFFJWgETPXyKDT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L7oVqU7Kqes35U+v1tMA60UN+IED7c6FsRqox0Yf8mBNyfncFx21y/5Bir?=
 =?iso-8859-1?Q?JHnZ025kOVm4wUBE7yZeDl3wBF9IEJsXR/g6GTHkakDFhd7hYNeRIiJu6G?=
 =?iso-8859-1?Q?xtq/aQD2fAIkTsSpIuWbF3yCyrCAliDtlgF7yPo5rrMbhs/FyRxoLhnNm9?=
 =?iso-8859-1?Q?7wkvhm/grn4ZFFCD88a9yCJPHNlhjyy5F1MrF2TGtD5s5s8jPzrLGOqDTs?=
 =?iso-8859-1?Q?0/VlmcOPWGHr0YOS2jQXkyS1p6s0OO17Vp71XmLfeKAFNroLiPS6KwjttS?=
 =?iso-8859-1?Q?dIG/oDqV11T7YY1DRvz+PSvw0sGo784TwJiP1yuWYgYsJ3VtdHgb/gkzzL?=
 =?iso-8859-1?Q?sw/TlLgkzKTq2ef0CKQd78jNgSf07NhpyU3OjuPUbaIaLjnUNd9QyNx7N7?=
 =?iso-8859-1?Q?7cSKAYrHFasDyDfpzbznBOI3aYzqcparfdKw6lNo9eApyucPpayW6BXT2N?=
 =?iso-8859-1?Q?1qUUwlQZa4E0B/Inp7mxLM5yVq0qrV1TU3oQbZX9V87VYHpH1+oKd/x4k/?=
 =?iso-8859-1?Q?WH2InKEQ7Fy/QQ9W887k48Jy+6jn4TfOwzwTT/hbv24CJkp6nuQgI57mk/?=
 =?iso-8859-1?Q?ZUXL9eFKg2u0tkPE3pRUeTA2BpxAu4+QSMui+UPCU/VZRY0xhzpHsjFwgP?=
 =?iso-8859-1?Q?CNakPCJ7kShhyUVfDf+T9zbChAy5pNrJNZTb7EhLBKmMctEIFiuh3QDWmf?=
 =?iso-8859-1?Q?nuah8XwhJnpt4hZdIdhmvEE+QXvOUsCc/xRGtmgZ8uMB5Adr/fO3iGn5IW?=
 =?iso-8859-1?Q?OQuqk6azS98DuUQ2n8r1/rlBV4JemBOJ9QiT4hS02D1IUwIn6xYJ/oC0nC?=
 =?iso-8859-1?Q?Sl+XXHZvSHb6bUVA1GNG7oHgq2YGoUgYlne9DVnLxVPilHG2qWIkw8K811?=
 =?iso-8859-1?Q?Asc6Ot7lCrz/qbd9igGpF4Mp+PHl/zgGM+U9SVBg0VxVD7UjCz+nghyh95?=
 =?iso-8859-1?Q?dQYy0DmuYEc9JUGnPtOeMNEnyF6ShK4MYN8yvwzSj95bxdQcdYjY/MpzzU?=
 =?iso-8859-1?Q?iGWLo6owoZ9qr+qeDLsAdYr2Sx4IxE21jOXoMCqRIIyDNjs9HFn0Sw40Fa?=
 =?iso-8859-1?Q?YNONQNzBGpTM7TNP+3kSiiRkCTBwryYTn1S+gAJPlr+oLNUNVPARPy7BcN?=
 =?iso-8859-1?Q?g6V+njpOS6BRxEl7wlgqPol2mpo5tR7IBHHLrwcvSuYWqbG2A2zZA4C0la?=
 =?iso-8859-1?Q?UElBUGRhlk0ySrwL3TRGUS7sAea3xggVLEylgT+KIyHVJCbGfR7heJdgRn?=
 =?iso-8859-1?Q?PLtO8UOaoLoQMDSHq0WjGYnXhF+IhHGMHTAc5jpAhkbzuqnORzRJXDRKB5?=
 =?iso-8859-1?Q?cBgpcUkD850osvzul2D0tZgyDlA4kW3Q7OjSV7GwJ3br04kiwiZLcNultv?=
 =?iso-8859-1?Q?l2JonFdgwJH7OqJck6vVYy3z/IVuKBNFpcKAl+D37rqWJNSYjS8U9ZiYta?=
 =?iso-8859-1?Q?AZKNxm9tqF8DRAC5d+qwYnzWeTv2b5JuBUz9PU+tyR6ZfClaETfu41fs+m?=
 =?iso-8859-1?Q?nIU8gNllmOn1lgjQd/qsUaXoVT3WqWwp2T6WSRPUZScLzI3o9kwZdQAH6l?=
 =?iso-8859-1?Q?KiOrEg/hXszJyMFLFh8ojqWOP1X7jWGRw33F+Yp5l3ZlgwwZsiI0UC/7tT?=
 =?iso-8859-1?Q?+fVPGsPLf9vuhN8vCtlY6MrINE7eMPEIRJoI5XGj0fYMJW4Fogehw+RA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cac667c-5354-418e-fe51-08de214b56d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:18.4610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qa60MR0lUrs3Mm/ESIb2Ub1G4/hfGHKSih4mn4O4aRivV1gdbmWEN+d+5ro2tCpiaqzzjuyAgBeLWOUUhS55B28tWFyytURkxi+W188CPng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323

From: Grygorii Strashko <grygorii_strashko@epam.com>

Constify has_32bit_shinfo() if !CONFIG_COMPAT.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/include/asm/domain.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5df8c7825333..6883b7226aa7 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -12,7 +12,8 @@
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
=20
-#define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
+#define has_32bit_shinfo(d)                                               =
     \
+        (IS_ENABLED(CONFIG_COMPAT) && (d)->arch.has_32bit_shinfo)
=20
 /*
  * Set to true if either the global vector-type callback or per-vCPU
--=20
2.34.1

