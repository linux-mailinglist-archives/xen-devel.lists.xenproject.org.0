Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353CB10E3D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056235.1424456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRf-00058O-Qd; Thu, 24 Jul 2025 15:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056235.1424456; Thu, 24 Jul 2025 15:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRf-0004wf-Ge; Thu, 24 Jul 2025 15:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1056235;
 Thu, 24 Jul 2025 14:57:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO0-0003AJ-4V
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:32 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8642f152-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:31 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:27 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:27 +0000
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
X-Inumbo-ID: 8642f152-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bpc/idhC0XxHAlOk23z5Qgx5rZbTLKfDvnLg47YAaM8+PMaVCrT/FhQGMRXBCwSGVv/CHSTukUBhY+tJqJH/3l9SfVBP/T7QH6PIpdilZ1FP383X6R53Mc+0UibRO6jr2eFOe0/w/BAIZaAmC7zVqFgRx/fzY5my4NpeO7zbAoQsEDj3IwPE/ffJDwwnrop5cgzJzrHK+tUrXzg34mDLi14JOfnG26qacJRPAv0wOw+rSH5XrMPnHLAelRqcj7kOgXHeX4aG7Td3ogixjIeifhwbo6xjc444ij5zlpN0800chrwlHxqgQyUhARN99vWrRKiLOMxjtayb0HnKDgUubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1hupRKnHin38VHng5juuS4wnBF3qpl30SYauRGiXPw=;
 b=U/vtmu2jG2UvACGXwZjKILo0tII9MvS/nLd7KmcRVwYtZuS2vc0n2+D2ndARaVKXoHdnBaaJha2HZNc97KmNgewUCAR8c46iATEnRpEXSI+BTw/M5GlREm5ClqCL49BZwiAgGX3MBye/4fCBIq0AHGIg8jUhzc8a6JwfnCYfCrhyx1hB/K7MY/vtoswr22YS1lpfXPe8Bw1H4aRUVDTl1+5DwndfQgI5nTPI3l8Y4W+Gi51067ttTIxE2drMzYPscsYxshfCLDBgm3K1DSMwvm+f1DODoex6yk+mZTf1VpRQSscHbUWdNYgVQkbdzYJC07xxfNFu3i7etwUeXDj/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1hupRKnHin38VHng5juuS4wnBF3qpl30SYauRGiXPw=;
 b=vIJiTs4yfWgApJ1FzXlAzynDKFyo5z9rYlD6LicMhh8wz7Apn+c9rAG3swDpbA/dSEIm1tUWppi3mRRlLEHiuMhj7zQ3MQU+j6vo0xZ1PlxTHwcB52UqnG8TdQ3oWhnuqD/wY+PT8b1cqKFvdt6mExd/nvqvY8FZNmdUAk/9z28QCu/ttsyLWl1ipoUOLcKiee3wCbC2B0vlPy5x/yxXnlOln1zH2Ck0UUBGNR7lF2ZFHcceDDXgmLDEcWgB4wS+0cuJ03+MSz9BjlPmxlhqzfzsnKC8HRfS12qXjjJy4fE2hA1iC3/0He0PJE2WvntJWF6Trg7HDjigi5D0ZL56Eg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Index: AQHb/KtFI2Edut4AEUehFxvwbJvRHQ==
Date: Thu, 24 Jul 2025 14:57:26 +0000
Message-ID:
 <6f7e5b23852d4791c81db75ebaaccc2dc7151c22.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: b8ed4ece-00a8-49ce-b7a6-08ddcac2680f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TcRoCZYzgzrpIjcbCg8Pbg8uHx0o/yXrxFx+fqllyAHdUZD5kmA2jOYueZ?=
 =?iso-8859-1?Q?HW/dPe9vv8M65KWk78y4DFvUtrXFXrBr56GtNL7Cd67CNp47DLX9aqP46v?=
 =?iso-8859-1?Q?20F9Tn/YrqSS5ntDznHw5IYi8+GuzU4Zuxpr9P2PVgzN90OQhLUPgY9IEn?=
 =?iso-8859-1?Q?piE/cMORNOlYfdqPKZKFZkAE/UnBp1ZGQUt7AI+a/ZxJn99MGUWQC3bPy0?=
 =?iso-8859-1?Q?NBYJHwWioi0IQLbdxjyNh6rDpmbTxWmKYlpe6Gc1ZBfbeKleYwwPMSaAaU?=
 =?iso-8859-1?Q?pWVWL4cSyBofSvL2M4HPvkuQkTXPhBd5fsXfFVK1LuBGP7PxsiAr+C/h6N?=
 =?iso-8859-1?Q?5A6hZq5sEFmgen+2jbvpww9TR5Uz+Ta2hD+iVEoMsXixDBxC08p9ydlPNu?=
 =?iso-8859-1?Q?eBCZ+ONwO9nfYP/WypUAA3AY1jFD9kLaiesds3cON2S15WUCalxigwzmO/?=
 =?iso-8859-1?Q?G4tBWodH4JonLsGR46HiHJP77hRUzsGQLc+MZa4ebvh7rexq1I5mwaJ2kN?=
 =?iso-8859-1?Q?h0F57hCCeSIdVCGsqoheri7ey/vRUxUr/DJvWvipeMA4211QcxH0jqbHL8?=
 =?iso-8859-1?Q?T/yS4lHRGY5py9Lr3NbFjRuc78113UXntglJc8UgTgJ2xS/B+iwiHNeH20?=
 =?iso-8859-1?Q?ZlWBLAzchtiU4ZjdlwQw9RRC0YjeJ5gMtRmJlN9FRnniMuM5uck9vXaRQt?=
 =?iso-8859-1?Q?pOSZgV6IYCeIiaXLpywEMkrEWHknBJKFGNKdR8guVl+xomLe0aymUACwPD?=
 =?iso-8859-1?Q?arGSVwWGqho4wVBb01/hOW1eVW+LXLvV1HpnSFL7e8rRTV7lMlvwLkRzir?=
 =?iso-8859-1?Q?ztf28r3Ayfd9DBkg4Z3y0Qogm5cnVONR18JHfXZduYEPeScUQJ3yICicUL?=
 =?iso-8859-1?Q?3FgJG6/YuRqkISCgIrm9gWJwixygm0Trkv3IYXJJep+zYBBEnrMynkQGLo?=
 =?iso-8859-1?Q?RrBP5GHPu78a6EbZ9TER9ngeKcrAy/bO7zwrtNOtt9ItIXdE4NXbto7tFK?=
 =?iso-8859-1?Q?ksIxgOm/1misu4ARqWuSpEMNPbdLG5pDkc+GzMxFHyKqmc4BSkhFYFr2nB?=
 =?iso-8859-1?Q?RY7YsNJzrqHP9m8qDmeRNd9BDlYykwqf9x56zg9Wo6jpJrLMeRaCfkTc4/?=
 =?iso-8859-1?Q?bHa+WWGatDbhLn4xFVblbQqj/ZLBYXmc/4mIQku9QRBweKJSb1lCpwxKBc?=
 =?iso-8859-1?Q?4/DPfMt6gZIN5cDDzEEwBK9mSf6lozdkT8Hc1A6udkFw7IX+fv9/FHSjd9?=
 =?iso-8859-1?Q?FLLNUQ0E/yBCRqL2UgiFbOdqWVDIBLYv2lUDERVYIdQpCK0YcEeizoM4bb?=
 =?iso-8859-1?Q?H9HL6ndXuDbJqBlCltWFAuhDctx5qQlMvGhjsk36uxwBFRmAfl+7xYhlUo?=
 =?iso-8859-1?Q?q8LQrGt3B1r1lIRYqRP5vAokj76oEr7zPYKLs0T2kaIsbwbJ6V7CXu7F7p?=
 =?iso-8859-1?Q?+pjtgON+I7hEbAfi5a/IZg6tTfYkIJeSL1SrtPIuEqS8nnZfXB3kITFEo0?=
 =?iso-8859-1?Q?k4n8GSuUPEcdKkbV5L9oX/ncluQCCrVXVfE6PmaeZ8PQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?11Sl+JicpW6EGP3+oNbI1xfDhFbSqfR9qDirCmIRTH/RpqNCx3S157nj88?=
 =?iso-8859-1?Q?/TeonPDOmnT+fxEc5+iI2LvekYduEW3x6uZ7pJLUkTSK8p4girhHiWh03o?=
 =?iso-8859-1?Q?dAIb092On0GfZ9c9V+jokHQGWUQYkfP2xEPU45agoPzzKzmOlRpzmg5kbD?=
 =?iso-8859-1?Q?bZFgBuZhzvtP0L//VvOqMFs4yoEmqvC/VplPru1XxL3ug3b2Scve5yx46H?=
 =?iso-8859-1?Q?86+sphWMyiyhzMdFc6h/QYxZrlHchSHIoQ+uFreAJWcrfGd+3pp0rq3rr4?=
 =?iso-8859-1?Q?lFLmOkL5gOMR+caZxM+VwaPtIAA5xJKjW0wcSXI5CRh7C1JUzCLwXQT9Vf?=
 =?iso-8859-1?Q?iLSuUCTdR3faaozCKWf7m69tIr102BYv8oyt6yFtlNPnnE8Lafih4bPs23?=
 =?iso-8859-1?Q?icKRlPs5zu8hqw8JKcUwWicpU/R2DSwBeIbT9k1ejr0koX7Z0F+jIuJAqg?=
 =?iso-8859-1?Q?6gLXYhNuj5hdLpn4VJU/PDbQVjM+cPb5aJUI5L70oPE1quEO/MmUcChGrd?=
 =?iso-8859-1?Q?UlNSlsFF7KEcXJ59d8AHPn98X3o/lynn4m4cubHoCbeqkzzW+To/Tkyjwa?=
 =?iso-8859-1?Q?i/tbO84+5hVMRmkI+4Jho2iW0S17vMhf5kBcfG1VpbAnWwqhC1u2yWTfkA?=
 =?iso-8859-1?Q?sasURVlcrI6rSj2As2omQeFBIyzMXZXDLOSnvnsVEPaeYxdNpE/bQ3ba85?=
 =?iso-8859-1?Q?ws/hVIbvnoCztApfWu1hhKVY/BV0aQZxY7n2YCXBt0jJsUSjchNSFyR/iP?=
 =?iso-8859-1?Q?cpWRam/vTmGgidCVBXvyhDPXme8OF4ViUPpixmv/A1Lecdzk01IrIF6GUf?=
 =?iso-8859-1?Q?GY7nRw/E62NeOkMVZXCZ3+2sKtR+Ub+n2phYYv+DfMUGhOhkMEbWYg96yf?=
 =?iso-8859-1?Q?74IwwNDaRqfr0sX2XUW1wnobvnhCmeFxiBbLjZUmwPYZ5CN11LbJsYkHDy?=
 =?iso-8859-1?Q?1njMxSAylyHD3McPzNgRFONnyWAliTTKwbnNqiCsxVXjds4ulWHEbmdEuI?=
 =?iso-8859-1?Q?4SQhIAwpf0Pi4Byg9PyssELxhQhJS7hsrKyt10mmMWoO+cjmslRo0JzHMt?=
 =?iso-8859-1?Q?HGSb+zxIf5ktvdM84wbsFR8MdNzbl2hmY7F6zqeNrRLVnu0ur+CJdnDAcv?=
 =?iso-8859-1?Q?rTUFFQ6VKA975SswRf3UG3DwWUz+cDTO0F1VHnIIqdMQGF44pPBoCSbvWa?=
 =?iso-8859-1?Q?dF1QjwxQNSVQGb6ttUB1XhnUpkCKjjpRhRc71DKZrCKk412r6aCM3K+lms?=
 =?iso-8859-1?Q?YGMLS+II+/Y3yRDHnBrq97p/+kvRbbMvoDW6HeI503RmatnibCB7qYBWoH?=
 =?iso-8859-1?Q?pYcy/PMAW+wAnoy4Kj+VRN9gaPvm47DAfr+leBCIOHAK/C1hi0CTJss8Tw?=
 =?iso-8859-1?Q?hKa14+lCMPa9ND6VsQbnWcSIYBV9+Dx2q68506q9AtummNKquTTTKf7V2i?=
 =?iso-8859-1?Q?jV40kBcvyChruG48orrcEFyZSjD8uY6+ZvtAxfJPFGbehytd5NDv+34NaV?=
 =?iso-8859-1?Q?WJzatBC3CopVIiWbHVt+AN7GaH8sQUk1RPNkRloY+6lB8erXrGpuuDT1hs?=
 =?iso-8859-1?Q?nxL+qF7sT6OEcD3eIwUjtU5nB1HNYIHhg/5z9QbAmV9jyDifIlevrfyCpU?=
 =?iso-8859-1?Q?itRvywE15nWLxxj4i4Jez8qBIYOcy29YxFx3MkQzxFvml+A9/RNV5Gz7kz?=
 =?iso-8859-1?Q?47MCvaEB+5lP7iaCmzU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ed4ece-00a8-49ce-b7a6-08ddcac2680f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:26.6500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZXD+zCeHW5DcMWm4lJecGRRvLgsmJTejVSLLzznEOB2Y2g65+GNrAqEU8HuCUFDBl/8d5pG2v2zvrhVioFh4to6ijoYqoq068sjrN2ujDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

The do_IRQ() function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1024. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index d5f2addf9f..b4a185fcc5 100644
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

