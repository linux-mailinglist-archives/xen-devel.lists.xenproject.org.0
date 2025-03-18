Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC0A66656
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 03:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918403.1323121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMmn-0005Pq-6V; Tue, 18 Mar 2025 02:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918403.1323121; Tue, 18 Mar 2025 02:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMmn-0005OC-2A; Tue, 18 Mar 2025 02:34:33 +0000
Received: by outflank-mailman (input) for mailman id 918403;
 Tue, 18 Mar 2025 02:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuMml-0004hg-CP
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 02:34:31 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a2aa4f-03a1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 03:34:29 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10565.eurprd03.prod.outlook.com
 (2603:10a6:800:20c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:34:21 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:34:21 +0000
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
X-Inumbo-ID: 84a2aa4f-03a1-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAtKsDizaGLABh2as4WKMSbP2b3HQozYNMQzdiOBWf4MAcYYl8OoWKXPZyDP6nVgtKI0CAMqmFiNOtg4G18X612awUx+/96CWCCoJQw4SyIqB/Y1Z0IWHo9KJRdxb5qcfY/RNhy0IfpieNdJEBmdsRM4J93MHRKj2sG1HYd5ntDBEIMbKtd7qxBgJZRZT7VF7hHDqxduMypsn/JiFAsyU293yhWw9+4KIDZGVh8C3mOFG9zlWzGaMSTXWbx5qZbYJe5Tpji2usOVysz4PaAonVxDxsiBTMlcvm+5xg9Ii39nwkxgtl+m1fUPycDxpRjRfW9vH3kGF72YCkD89LTQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfIgfIDoaXKyQ0Ye0/pA+kr9b+4erfmqyiKrr/jzcao=;
 b=wSD3oc7EglKNXOq0dUM9C37hY1BTlFbiVOuXQPpST7BBYQdkMavSCsLToqCkiaMUupGBGqwbHJd+VAUM7eExC3Zu74jxDcTzRu7dDoq6Dl/Dmoys7q6EsGe9GD54VxHjb4Iw3zQj3hRWCPYfe8T+KmGI2s//O4WmfwO2F6T6L0YmSPl0LwVyoDJU7nroFqXQsHHueUIEPtcLMEd+hnfwRdX9hu7nEODpNLacwUgPEs98ClVGyHZJo4oc05Z4NxuzUPApM66JyqT45UoZLYCov9NgBZSrra6RgRcgACwBOTJ7PYf0ztMGAO2ohQF6UFpepbJpbwI1Zx8I8MXQ+j5BMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfIgfIDoaXKyQ0Ye0/pA+kr9b+4erfmqyiKrr/jzcao=;
 b=UPIkM1X9UAevy9gnO2A1IINmF9nhBz6DdhaZ3LuMXClpYSqg/c1lgDBJAoqNaOSzfkp5ycCLXtxJAAu7bB0F/nCTEApUnR+S9ufy1Prr4PRg6dkTbbZIwYhfXbGCiIt9wcBMaX2bmr5kLbjbAbzDTgMUmP16XYy6rNpH2K/LFhGf27z2p3pTxPq5I7xwlGG6Gr/f6kqpVSSzk/++yBy781+1FSCkWGAAuktXtLRuI1WG5/3Ug5d/wvV8+NoNl01yiNvH0xnBmZlv29zraQvVVAKks4AfPfEfjEzT/aA2C3A+3Se0xJQh2hkiU0sYr7TOMEOAl+BB1hIfTbq6ryf8+g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 2/3] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v7 2/3] xen: arm: enable stack protector feature
Thread-Index: AQHbl64+nK1qcyuMXkOHD2CNqoxb4Q==
Date: Tue, 18 Mar 2025 02:34:16 +0000
Message-ID: <20250318023234.1210659-3-volodymyr_babchuk@epam.com>
References: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10565:EE_
x-ms-office365-filtering-correlation-id: bed78708-a625-4b98-b50d-08dd65c563b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9fqFbNb6QtfqKNMGq+WW4Iq+oCdabRK9sIw+XjUk0zqLJgAx6Al1/wADpO?=
 =?iso-8859-1?Q?Xupm3YavleGYIlXAjzLpelz9vcALIbA7uRxUtMHiPJJkmruKzjBeaklvqb?=
 =?iso-8859-1?Q?AGoWb2LumjlsUOAIY6x6IhlEHQVUP61NQn28KKWA4lYgGCBIbxBEaGNL5M?=
 =?iso-8859-1?Q?Y87mSo1QAHcZh4+/DU4JNLdZRwj+b2uM3UTqBlFkoHOCEaT8kEBKH2d9xX?=
 =?iso-8859-1?Q?UprnxUozCXYvqOpu6DX5ZAZJBuXZC3wvsFR5VIXZxqk7+uoUBmhXha+5s5?=
 =?iso-8859-1?Q?artrn/4n2anlgGtuTHB9C1vxp6lUOJRCzvhrmol7y5bUgjkpt/LqjQq+mD?=
 =?iso-8859-1?Q?uTHmpf7Bx8ePNxWlKvC/01KwnrlbqgX1i9SnyGiDv1fOap99a4neMHe9St?=
 =?iso-8859-1?Q?TYX9IEw51XKHlER7A7uRK/8rclrI1QN/Z5U11SZ31bnGjlF0D9lWPwREkn?=
 =?iso-8859-1?Q?j0vb2Ulmg25VwJYCP35ZezSPC1tuoHe7oSWhsMY2bDJsZfT0VVulNoTd8F?=
 =?iso-8859-1?Q?FEiKsMifR9I6FTsWB2rCHtjeUInSRehH99tZExdfzn/JsTwQp0aoHz+3ga?=
 =?iso-8859-1?Q?FueMdll6K9MqWhuTUprx5+cBjtpN4rxi/jRlMAk/YSSOBS9eL5xoBj8JsG?=
 =?iso-8859-1?Q?RfqiiOHXrH+lxDwQItKauwOeaj95w/SoVdGAtvyxGBo3Re+AWJITzHaMM6?=
 =?iso-8859-1?Q?JJhLnsS1+x3Tra1WZ1mUjsQM79+A5/6BavJ+GqJQosbhbX7OenkaQns8t3?=
 =?iso-8859-1?Q?N4TldsIXiTUbns8svhc4sgVIYvLPdfakx2YZ8aaNhTiVEt7b2ck96pj3hN?=
 =?iso-8859-1?Q?aWmrZpnbuZpEW4Ix3urvjJtoPHEK4Yg5swmZUlaFS/JJM1IcVv+Okvl2c6?=
 =?iso-8859-1?Q?v7vtYqsvuqGhUtw+BBcik0So0bvyVltSlAAw95fgU9g02EzH+i7pScvQee?=
 =?iso-8859-1?Q?HgBLIXY4tZaCuCGUbyZBKp8v8XxXSuj37Um0Xe4zXTQGBvW6Afd2WEIdYK?=
 =?iso-8859-1?Q?QfyhjyGOCwIyBM7NEQzsp+7NdjJ5Lv5RPrCse2YTswaNnGS8yvgXnEkhVo?=
 =?iso-8859-1?Q?/PWyyJ3g+JrfmHZ/xOuza+8+Jtvw57lJPhtmD8U6/32OTiXIXTBpOfrhIW?=
 =?iso-8859-1?Q?ssoZWJH56ZIMbzE0SebEayA69C/DAALEOyx2zIRu8SESa6CRdxO1rSIMl2?=
 =?iso-8859-1?Q?hL0DiiTKa5qDp+qpEqJBJjYXmpTz/WvaVDMLIjkY1AX5ZoZRGQ1bwI1rnK?=
 =?iso-8859-1?Q?fAfJ/N5SjVOn20JpGs5kDcKwo1owLrVoIBwYxuIltRBY7j5Vy13ipUHLm7?=
 =?iso-8859-1?Q?0oGykq91zC7B4QISN/sSfr2YR6+NJhoLjN6RrpAI15eG7FbP5PHikEC8yW?=
 =?iso-8859-1?Q?InnFIs/0BU5A2FRau7arYC5rHAnGZSkqWSg9q6c3XzbE7uD1dO4/S2fbdV?=
 =?iso-8859-1?Q?4gqWmfX/0gc9VNDOpFi9QUGkoYnF4up5Kkg9/+HL5Iyxeh39nQrbHGth/g?=
 =?iso-8859-1?Q?aR5SaUqQ+r7ZsJlsPwescc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GxaJvlYJlQpdsZrVmidVU/AOPCtB5BdPmL0r8KclJHeemLQ65jbMCkgIU8?=
 =?iso-8859-1?Q?rMtEY6IgQ+7T8y4xqbIQIg0mPajZS+ou5GNIx4/9t+yPKvF4aec2wlzMsi?=
 =?iso-8859-1?Q?bkbdy7IFCx7siBNOVu2xrZJzT/BKJoJw5ilq8fANobx9PPKxZqlAIxaTkN?=
 =?iso-8859-1?Q?ZFXRsL9r5VeDyZAhg8m457N8RwOyeJQHNi5TpyAA0bxj5vginUIFcj19s3?=
 =?iso-8859-1?Q?4pll9VTSwTgVGTzkhUwrZoNE+1IHj7mN7MuOB4FDMNDjdySCOSKBsAJUNR?=
 =?iso-8859-1?Q?80RsAH940lPq3OixUiwcpRL8b+mMoJNgPDmccUSkmTiB7BkHDb6B3zkk61?=
 =?iso-8859-1?Q?NJzXoq/bK0fvwI7k8wA3kv9j36HrL09TaLOt8kj3/NqbnW+lgPvq2W7kBU?=
 =?iso-8859-1?Q?xkFM/5ONTZJa9bhclCmPALVFePIKKUgXpLYuWQp4pSkKmaVklaAQhINFMi?=
 =?iso-8859-1?Q?TkcH75oy4vASPJsBVI4aBXM1b07KMkcMoNaeJ1xckQrL8vYw1qE9aHA580?=
 =?iso-8859-1?Q?Wv3PnQxVcRRpRUKiSXA93ztxJyxb/EIMFYeY8DqavOMYdAkNQvH2aoFYsk?=
 =?iso-8859-1?Q?3n4hC6tcDNV2Zlm+t7ur2/Ik8Rx1QV1G91HSHPSh7m/vvZ+0+7dZmP5U2I?=
 =?iso-8859-1?Q?i5PqMxD+DAsHB7P9fB3TNWeA+rVH0Or/rQ4lI1CYQ3wL2NwcZbnRkFAKVM?=
 =?iso-8859-1?Q?SbVv2Uw5uY5zOnzi1RRTdLFZmmKM2t80XlwqlyyiH9YuXBUiY1YQ9UEOkZ?=
 =?iso-8859-1?Q?ltEyiGgH+ahVVn7WUN0I0DDTrPDrB9Oq5rNAGNo0FNK0hseV6oLAjlMMf3?=
 =?iso-8859-1?Q?wg0LOfBNBCRYQZTBUi79QIFPzH1qw4vV5uxMToPqQbMlnZRmdjZH/Q1WF2?=
 =?iso-8859-1?Q?cjdUsoGK8vT4p6cUamhyvUfWgFIQ2UwmwVQS9wQWMpEgvpt2N0c+4n/a8T?=
 =?iso-8859-1?Q?a45zx3jeZHTA1fpNSV5v56vmvzqquvwfW7Pk7Z2GrJtRiJyKO6E+J2YoS4?=
 =?iso-8859-1?Q?bsznwX01Z8V0GNusIm3GsIfSJKPq24apuohcJoXUPMVgUDOCBV0sFnbPEC?=
 =?iso-8859-1?Q?B9nefBzcPAwypkF7tr9s9HYDpOK1xxdrI/ISVpQRetRT9TwT9dxSTJh6LL?=
 =?iso-8859-1?Q?PZlIIw6ac8nABRHtSMMjomeBxNP1P9zmZ5tngMPsxbySwNNx5VS1nNO/y/?=
 =?iso-8859-1?Q?BAUZ4RZek5q7eOugNoknpV/kIrQvq3dYiT4dbYhqicQlHfPeWm/Xtj50IQ?=
 =?iso-8859-1?Q?ROUXId7R+RbFO/bwAAm68Dmz9AszdUPBejBTNRRoDvC5ZeVUKH+Vp4FNXb?=
 =?iso-8859-1?Q?5gNHo/zDSJ5cq16JLBIkn0w6Qf/kNf141bb7Nq9VKkC5BByqCBAGusCXWK?=
 =?iso-8859-1?Q?haRZFo4sARGR5/KJU56ispkS4QlCUfmiNFMFkKnPoH9/KfNnrOjtwxxfOp?=
 =?iso-8859-1?Q?sXwtb0/3ToaE0gg1Tvi2RvwOSHFq4g3cKPnth1xJzeVV/ZKijByYG55Ecb?=
 =?iso-8859-1?Q?Z+OwSu6ty/9GVdU2xlsQ77Dp4LtZfEEgFfxtXyrNmwdtUBZt2FdwyqvW9e?=
 =?iso-8859-1?Q?Pbl+V1ZFBzoYR5GB5KdzvZZj6A0/Zr5XS3h+sXD/bPUK2x0dM0Lpkh/PES?=
 =?iso-8859-1?Q?vCKbW17fxTywFR53c6H6HFqbtzfsGAXFtRIklv4ucxW9GmSpuWJprQhQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed78708-a625-4b98-b50d-08dd65c563b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 02:34:16.8716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6z5+pxoWHc8mRdrlUmUVNi/UUEgIHgpBI+6bAncSZKfu782oAnv6kKY/opGJ6ghHmCeNDOTKBnC4N1/Gbb1U+CehdZ7wy4+PRXKBqkSOPkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10565

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Initialize stack protector magic value very early, at the
very beginning of start_xen() function.

We want to do this early because prior to that
boot_stack_chk_guard_setup() call, default stack protector guard value
is used. While it is fine for general development and testing, it does
not provide highest security level, because potential attacker will
know the default value and can alter a payload, so correct stack
guard value will be placed in the correct position.

Apart from that argument, boot_stack_chk_guard_setup() should be
called prior to enabling secondary CPUs to avoid race with them.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---

Changes in v6:

 - Expanded the commit message
 - Added Julien's A-b tag

Changes in v5:

 - Call boot_stack_chk_guard_setup() from start_xen()
   instead of early ASM
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ffdff1f0a3..5d6870c817 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
=20
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ffcae900d7..fa11e6be9f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -30,6 +30,7 @@
 #include <xen/virtual_region.h>
 #include <xen/version.h>
 #include <xen/vmap.h>
+#include <xen/stack-protector.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
@@ -306,6 +307,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
     struct domain *d;
     int rc, i;
=20
+    boot_stack_chk_guard_setup();
+
     dcache_line_bytes =3D read_dcache_line_bytes();
=20
     percpu_init_areas();
--=20
2.48.1

