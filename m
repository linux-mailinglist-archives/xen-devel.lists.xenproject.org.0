Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279CB52B75
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119648.1464935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXz-00051L-8x; Thu, 11 Sep 2025 08:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119648.1464935; Thu, 11 Sep 2025 08:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXz-0004zk-5E; Thu, 11 Sep 2025 08:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1119648;
 Thu, 11 Sep 2025 08:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcXw-0004XB-UF
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:20:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38196c94-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:20:47 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9468.eurprd03.prod.outlook.com (2603:10a6:20b:59b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:20:35 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:20:35 +0000
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
X-Inumbo-ID: 38196c94-8ee8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcnxHkCloahbG6p5FNFww5ojMRW/gJ0OQElIIKrPArg0CHA/4kuTjiJkk8sdWeAPiJcY64UsTUejAsfskGXnvTKx9t0cLbkYgn4BW/OYQ8wbh180gpj7rA37F2TwnaLOj/72bWMRB7tsygC8k9IqEcyLRblC6DYk7HvxBVcFbtx6uDW5ikFh2OyFoSbSOEhLLm5sqi6a78zi+m/fpCz5QoSIGkcx7ZuYawG9MR/YG906NTf5i3JqdhgaVCTFqpUKHoXZAjOyI31eNn+/JewDk0hIFTwksEnsvUaZH4z6wFfQkQYY4LsovIaZEVMDZ8px0vvCKxY7t437dvcpDvkS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX2rdTxDeSwKJ1lHrAmzqYdj5Iky3KiEQg90cX64EBY=;
 b=mue+0pAYqbIO536mTFxh/dwYTnbFCocqFOD7elj1+0fMLU3P2EF9Sz/y7+nm3TBPFuwZDgYT/C6tWfJkTtzwuG1VVEBXWsvPFS20uHmSFgeQNGKd3pkcYmRW3JmTbGZpIu6IgUb8XjfjGP6fCFTsfn+57BTu/lymRSanY/PJ7TNTDGEWtT7kIQra9Dz0WmU9+qJk1mrhHyUFBqkCS85Yhizrh0AhWqBFkgF0rFbD37AGjO/m4ngEf/QlVpUpvTsHIBrMUmk0dfoH1LaIn/FaDV2lX/Gf6zCeN5GP02HlaSP7em926VwMq1SqkdSfAHnYOHQNVJaWYkYVF4DPlPAQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX2rdTxDeSwKJ1lHrAmzqYdj5Iky3KiEQg90cX64EBY=;
 b=PFYqDIX+b6k7ub9j16KvSJWUl+skFKqI7RXbcMXm2qK0MsIS83Jm5TIdpf1WW3iRPGwdrTZyg+mVE9nmvLZxxyDHDOPssIhnBtSPAroS/aoCeVME7wCfRGqpJYK6wHRl6mAzGI9/B8KtWJlL4u7xVdChH7Ewf23LsbxTQggJ+X2rE86oyktmfCHeIjQhnU91+51cYRhJYXymmyYMiiDY0o51SiydRynNF6NG5krG653a4GXSQu7dYCec52XXqNZAjVOfCW/gBx4Sx1Ku8qg0whE7lOayFH5nvWHkKX8PIOJUXWfRHeX6SNhwyXRQ+dxJMsg03IsCbHwxDTG8CFt7JQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Topic: [PATCH v3 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Index: AQHcIvTyqGjM1f4hhUaFOl5Oytg18g==
Date: Thu, 11 Sep 2025 08:20:35 +0000
Message-ID: <20250911082034.1326377-3-grygorii_strashko@epam.com>
References: <20250911082034.1326377-1-grygorii_strashko@epam.com>
In-Reply-To: <20250911082034.1326377-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9468:EE_
x-ms-office365-filtering-correlation-id: 8607d37e-6679-41b5-cda5-08ddf10c157d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x00dVmFen7y2hKXeLKcIWQ41nV8u9C2s8U4glClP7SOhKtMMViwyEXu7X6?=
 =?iso-8859-1?Q?PqvMBzE5gvNKqg+nHpzlpzqCt15UNGBPRkKysdtBl0OyO8gb6iXQ61U+CM?=
 =?iso-8859-1?Q?Ng/1vNqpSMwdYKZUNdQ6L6REdD6wWn2PaMBI09YpQ1yAYsO//H/zsotD59?=
 =?iso-8859-1?Q?jXFNIXyrhjR455spbz+g+AYgkm4YS+mavOIBVYLyGX1KN06UMTSO4cTSKg?=
 =?iso-8859-1?Q?cp22Ups+e/voQNABEetuqIrOQgG0iLjMxDwiP8RUVdidI80LBt6whOUkQg?=
 =?iso-8859-1?Q?TUDjp9D+paBBla4iv3ikoD+lgAr6dzSU9lnKtMrSrFgR8yzki2jHMNG9j1?=
 =?iso-8859-1?Q?UC/IVXuE8NVM58JfJM4QMYF9tfPGz6nIMkn6vKOUzefWU6FnbaAMvbMs1l?=
 =?iso-8859-1?Q?KU4O5Jz+uHf6LuA8P62d79ZfiZz1zArDXrHqGukG7xQrTR++FmXa3VGnA4?=
 =?iso-8859-1?Q?vHTSuZYziNSngrJye7P2Sc5binC/9jzg9ze7HKtfqujh7N3lRsWB6FX88p?=
 =?iso-8859-1?Q?iN8VdGarKqZ11qJYFZVUGVNzSJbN+daJTATO/y3bOjlm2ge2nM/z1ueM1t?=
 =?iso-8859-1?Q?N4zAV2b7ovWMTE6wL5wdwWU7f4kbfuNu50OElpLLYONOtibnuOpiEVYAk/?=
 =?iso-8859-1?Q?rlKvZQTbv/0OdAF/IslI7+npRt4jPFKWMIIT9fmTNwEAQxd/Bf1VZYwiJv?=
 =?iso-8859-1?Q?2jvrLloX5YrN0nLlVfZ7Tb+BBF1tYYHBwpEExGirQOmqn5hWyBX5m8jVVH?=
 =?iso-8859-1?Q?VTb5PG9M42TSNBrRTLgiqS1frbNpe5sH5rnr6LnWIUezSPBq60ejCzNJS5?=
 =?iso-8859-1?Q?af7YLIbcTdboym3G/vSzNaBPv/Isa0wMtYzF6YpvU2KzZAWqinFq4jAQNi?=
 =?iso-8859-1?Q?0+88n93KIxJPnxnNuyoDPw04qOnTt04kwMAa3iApoAos7seSUEgo6fqa/E?=
 =?iso-8859-1?Q?UEphOAqcV9rvpFpTmC4MzqMvoW2XhOe4dGydl8UGJw5K2cLvv84QtYOu8m?=
 =?iso-8859-1?Q?El8O5+zExYZFLyfPpGzbFeI38z5u1hEazWJJtvvH445ZEa4VKk0Jm45hec?=
 =?iso-8859-1?Q?x5fKxKna8BAatfTww95ZmlsrNZrOgBUt2qdky5d6xyY3nsQ9OMSCBMFB58?=
 =?iso-8859-1?Q?qFKgBRb+QuxNOwN2hYov4/OuaH8ZRT/yas/Ty7mcZj3IaMhgAg5e1g1iAG?=
 =?iso-8859-1?Q?KLGpmNv2AwMvdPE5Nq93Lip4faXNEggov4RU1El4PxwLnXU4n3tYWR20p9?=
 =?iso-8859-1?Q?UeRa1pbGjWJp/6cSioVyFz6eW+X3A67YkBFyEVtVKEFWL6u7ostQGLwKJG?=
 =?iso-8859-1?Q?8LOsFlEDWnCw6yUSkuBa/aJ0wL9O+wYC00rSrYYqZMxO9EdnSxBLLu9GjD?=
 =?iso-8859-1?Q?DYt6gCX7WQsaF3o38UyiMJlWcQHq+YLIPJqwUj4Bi2Z6tME/Ut5eJr048A?=
 =?iso-8859-1?Q?aobt3UA3kEtl8zfxYzJ/h9w3sk3Jh1jakjWqFo7RJnVVP9ZgJcry4ig2fq?=
 =?iso-8859-1?Q?IzEcMAC0hgUfTNkU8GK8htMRNFWLLhCUOtdkzyV3zOY9Yc6W3AFaBUB8h1?=
 =?iso-8859-1?Q?IlPAQzQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Sf/Gjt1rfMd9Pl8Jw1o9omlnWxnHOy+uGbSPlGykLNM4t1dAUR8H42jmd0?=
 =?iso-8859-1?Q?Gmfyt+4qliwijjsSQZgaeleGDRaXVvzYJf8QYYJWpn4b6EI31G6Q58OMQb?=
 =?iso-8859-1?Q?wTXj2EKvNWPubxn4rWvc0/UxUjNCGCsxcR3eSdKro/MTRHkAtIN4ReKZOb?=
 =?iso-8859-1?Q?pmzQ0ia5BJB3tXIutystQKkz5baT+LfCLEfZN8hGkZQ4JGeGmZb5DLh8ab?=
 =?iso-8859-1?Q?OojvbfV9Zy0l5tcDjUtpsgEJs+QVEut0TXoFsbEj+SZ2Nk4LUVQSfiNiCC?=
 =?iso-8859-1?Q?EdIJFhhXfrp576MrwJQRwLGLfymHRmsKJoBIsQ1AWfd7DXpyUp5tQi1CuY?=
 =?iso-8859-1?Q?V7daNmJEiUkF2BGv1qD9qcznh7HcNpy1zuiJ6NWpOukbQKwEG/3UX7/7N/?=
 =?iso-8859-1?Q?LitLE08q95DtZ3UN67SZ0x+mgYSwzwrxHW7ozUHXJVo3qkRU1JbyK1Hph+?=
 =?iso-8859-1?Q?nOw5ZfCTlif1cXOuSOSB5sICXGff3y59AlbqFFtc7/1nWseMjiP599nn+j?=
 =?iso-8859-1?Q?VpyUnWcqs9PCkwTfJxrv9zcI96zktjoRW0hcs3PnPtlPCpNI4kOD5fpGHS?=
 =?iso-8859-1?Q?U33CFvcH7Vt2eFnWL0Au+4JOrZ8PEShk+ft0CPp8Awto8g/gnwhTBq0/Eb?=
 =?iso-8859-1?Q?0MkUx0tpXtruI2+omhGTtBb4DXBHbOgKeAJDrRuOpk4zxN5ZSKrJciFUlD?=
 =?iso-8859-1?Q?EFORTzDKVOIk3hOS9zx4IOZMPTur3YAPo1OLvB4JRiuaieGP1afKsBoaZ3?=
 =?iso-8859-1?Q?DGmoj5lilyd15bGNcV2XzCHmrFQ6nP+d53nR+p2QvkIplwBr/mWeLKuN67?=
 =?iso-8859-1?Q?hmPYdyqI7+eICOZJbr6Kgpno71plE9/aOW7oL4OA6ngb22R43woYSYtEnG?=
 =?iso-8859-1?Q?S1tfhVAA7bfBJHlQBuJQUimv1/dn0dbQFI61+za5VaE0NINReFe4FPNRqm?=
 =?iso-8859-1?Q?dkDRjY3L8nl1W71+HtM0lGyc2RD1jb63ueO6y9WUiJ9RJNuw+lpR5Mupoy?=
 =?iso-8859-1?Q?UI4j4CfRUSLb9bGZmRMcJYnI1rgFlXvAYTKAWG25VL5xyl0q26KofOPMY/?=
 =?iso-8859-1?Q?lGsm0fF2gVkC0st172NaxKwsvEjC1AMzX3Cu0n1q3Pxp4A9WjI1uakiJgE?=
 =?iso-8859-1?Q?DaEYbgRym/3Cg3JeYeCrmcPyYkTfjPBfUAzBfsBpHGS1xDarytj3zXkGyM?=
 =?iso-8859-1?Q?g2JzcJ+MbLC1xLqTUs0IQHqSrkfv5wTz/MCIZ7aKudNPydD1RA3WoOHUEb?=
 =?iso-8859-1?Q?ZVmowhe7aJSwti6CaXWGRJWQQ7lb+Bzn6WnLIQI6zR42cF8s0pAPPTxQAr?=
 =?iso-8859-1?Q?ECM+fYrjsdm9JWGhjeUJa/gEGN/ySxaq9u5KLtVF2Dil48DU+QR5ziESmP?=
 =?iso-8859-1?Q?0OFWANUXU7GFIUZDmQxtwZhSRjdUdODJ865WQmzgAeGJ8ijMnQ7wFX/7Xy?=
 =?iso-8859-1?Q?JUSrMDFQdcBCeX3MGapxuGzNC85hjr6R3np0ILVFFKQrkuYJb7lYAWTNrZ?=
 =?iso-8859-1?Q?aOOMzaQUhrBeTFZikF9ffW4ZaVRS+vUmXCC0zdTGAjqFx1ETK283eOq6PY?=
 =?iso-8859-1?Q?9V41FTpGxFdUR6xjUyAbWn3rs/f8Y3K5DlDIbPXUB6wMDKhAEbL8l8v7Qw?=
 =?iso-8859-1?Q?ULfebSIP28qt2BtF3DzKipAC7dhIvOC9jhEX4ijZpsYefFNmsbONRCgA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8607d37e-6679-41b5-cda5-08ddf10c157d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:20:35.8346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bDiDLms0kG0CGOd2ovImZXyOM2Cc5Y4/kVQUSRetGgjiw6SDprAtudRZ9BSITj4GlExzxJg9oDrcsiPnLT8F9JMe4KDN5YKJaFPd7mpEPXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9468

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split is_32bit/64bit_domain() macro implementations between arm64/arm32.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
v3:
- no changes, add tag

v2:
- fix comments related to macro parameters evaluation issues

 xen/arch/arm/include/asm/arm32/domain.h | 20 +++++++++++++++++
 xen/arch/arm/include/asm/arm64/domain.h | 29 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  7 +++---
 3 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
 create mode 100644 xen/arch/arm/include/asm/arm64/domain.h

diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
new file mode 100644
index 000000000000..1bd0735c9194
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM32_DOMAIN_H
+#define ARM_ARM32_DOMAIN_H
+
+/* Arm32 always runs guests in AArch32 mode */
+
+#define is_32bit_domain(d) ((void)(d), 1)
+#define is_64bit_domain(d) ((void)(d), 0)
+
+#endif /* ARM_ARM32_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
new file mode 100644
index 000000000000..1a2d73950bf0
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM64_DOMAIN_H
+#define ARM_ARM64_DOMAIN_H
+
+/*
+ * Returns true if guest execution state is AArch32
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
+
+/*
+ * Returns true if guest execution state is AArch64
+ *
+ * @d: pointer to the domain structure
+ */
+#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
+#endif /* ARM_ARM64_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index af3e168374b4..1a83f3924fb7 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -22,11 +22,10 @@ enum domain_type {
     DOMAIN_32BIT,
     DOMAIN_64BIT,
 };
-#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
-#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+
+# include <asm/arm64/domain.h>
 #else
-#define is_32bit_domain(d) (1)
-#define is_64bit_domain(d) (0)
+# include <asm/arm32/domain.h>
 #endif
=20
 /*
--=20
2.34.1

