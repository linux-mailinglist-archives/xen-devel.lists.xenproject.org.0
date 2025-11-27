Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD31C9045B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174418.1499386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEN-0002pm-TV; Thu, 27 Nov 2025 22:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174418.1499386; Thu, 27 Nov 2025 22:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEN-0002mQ-Po; Thu, 27 Nov 2025 22:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1174418;
 Thu, 27 Nov 2025 22:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0cJ=6D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOkEM-00025I-BB
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:12:50 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 359da64e-cbde-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 23:12:49 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB10621.eurprd03.prod.outlook.com (2603:10a6:10:58c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 22:12:45 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 22:12:45 +0000
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
X-Inumbo-ID: 359da64e-cbde-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/o/xaXpWzBcuUoENwL+4ipHVmzMzLZKHDdCGrolHY1MpMUPjKAdiasyn4WSwDYcL098cI9oSuakLtuUIzEh1sepMKlL+iQBgqkh1Tk2X8JzLJOMrzAM0E1mXdKT7Y5BwozCToC9CZcrl+6iPw7YJN9OP08IC9ipKSSVvyOFzz6pVhRxeCnznrVZzwwdJx8eIoPg4JDcdACxkb+yc7LRTdErxTtf7U1s+Qf6+KKgppoj5qHqoK1mA+CZxhgJ2vL1IZ5iGBm4mtiHRSR0n9zZIQjPKo0wlMIUKcJ7LVLjUO05PMnxLuruVDBtanTctwS6bk7Duo4t65RUXMDHOkCkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcD4l5loFshEvvxq/petHO507SqQ7F4HeKr8OCcVhEM=;
 b=Jla/ABUt+QAFhl43zV2AYXOZfDe0jn2aOVHi+1mWwWDPCZGs9EePhnWEWwe0WchoEuPk3fjy6yQm3vk+XuQdMOYQsB+5672/t/KN2m9Wi4B0qAUXl6XzKxiRcW4IsoM/Eho3+xrKRaLgLPhaibAKezsFHqLCCJdcuLQX5icPaeYic4Aw4/ix//SzKrQ8y9qOlZJ3yYFdGDMdDddS2DxYL5+d7flrfh9g6Xde+hZ80IgjtL/K1guJlyyCFlu9iW0N4jZWZTFIls7jPIy6ZnoSX6CCtu+WlBCoImJslqIoJtJoSrr4MqiJUuArTwN7hKdBBSPIugTOWTCPFLgmU/pcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcD4l5loFshEvvxq/petHO507SqQ7F4HeKr8OCcVhEM=;
 b=J4KrnhmdKpJgnbL5cjFFeVJUbFMYPlBibeWpph4QdwUMohhZCpI2rMCdXRS7v/n4ggEzoySa+v7M3CA+dnKjuA8zKNgxRaYCssC+aE9dFcCHhaMcc36stJmO++NdRuQ7WXYSZkc//OTLquPMiak+fgXD5my2U3vMD8WM2E3cnAzPZ4ZpDtg4xuBEHdcHhrbYfyi5UUxqyfHpV0kgRhAsIspE7cRUWqN3NBSHO0av5gDYH3nS3p44dT3ncIEPIWVC9wLGVSy8Khw5Q0ifvuY2LWaJ5ZofEzYqOZbTcd9V7uMbHLfzfLb7fACWPphKE/oqxxoZjvsqWkraD2RXELwiUw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field handling
 to pv32
Thread-Topic: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcX+r1HmzqtRQZ0kOlP0COlNBiAQ==
Date: Thu, 27 Nov 2025 22:12:45 +0000
Message-ID: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DU4PR03MB10621:EE_
x-ms-office365-filtering-correlation-id: 005ea4a3-bbc9-4e16-9814-08de2e0217c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0Cw/WNNPJDeD745/lxGETZtCX7ILiu30xzBwjI/HuDuwl+tsCJ/yLScZwz?=
 =?iso-8859-1?Q?8+ucsW8QrYZBsCEEE75/NlefXC0MayWy14uJogklq/n1CQeYycmuFZh1Dx?=
 =?iso-8859-1?Q?UXEzMVHo9RpHKwZST0kNjOSBSLRjMpXUGm/437hYgQUFUuKsXWlrj/bWmH?=
 =?iso-8859-1?Q?gtbzYbnmFeHP3VpxMZtRA8xp8tn4Ja46OAb/Nl5FKsDvOP6n/vX+wZEHap?=
 =?iso-8859-1?Q?idIc1qjaWNBUOCbYldgIRYxEoBMmqMulkdkKLHwr43QdeBjm/zTWjKEHgd?=
 =?iso-8859-1?Q?QRyS5fQ9ck+QKqv/OYcAg1o2621R3136a79+F2fONx3v/MJ8l+raB7SfxQ?=
 =?iso-8859-1?Q?wFJJjIrezKXAVFPxQ4bpMjJx+HJXmaWNBv0OePG9vrZieKZ0r+oyss616q?=
 =?iso-8859-1?Q?yACT0akXMBIksDrl+YBK0yu5Cjv1WwuxBX1971SHtlHrZpAFQPIRcnfLPd?=
 =?iso-8859-1?Q?Um+YKo2IZqMrDKCneAYa36dtR93gyaaZUjaKhclIPl+2EDOdq/BEnQCjop?=
 =?iso-8859-1?Q?tkh6KXbKqTCL2dOWVZQp2MU49nO1dsrDWHzF7SfzhpC8exws367+zWcv8m?=
 =?iso-8859-1?Q?K7mydQ9gZG5mjUVs3yW5JkE64adFb86y6ImLcQwhnnNjSYDmLOoELLU97K?=
 =?iso-8859-1?Q?RGlXTwDRs7hQt8YCLtwCHlavasMMIkCYYt9AI222j2pj2XB5nrhlzAoKro?=
 =?iso-8859-1?Q?1sPHjPxqwD2b1h8vLXnglkOPllexOp9oELfs1K5CmsR8iIKeOFZcdvXeou?=
 =?iso-8859-1?Q?hLwZbow5Whv+S3hw+CqWSe+kqpM5cyXbcWsqX12qGbd3xupwW29KEzp83g?=
 =?iso-8859-1?Q?CDetNUS0rFiheznNM+t90orM0LDvMAEKOg+q+2ndbR4ZZkkHFj0NMfSJ/5?=
 =?iso-8859-1?Q?FZ4b7DhwvCBMfxoNLS1fBHE8NLibiesR2lTUjM+qXRlNRodk4VX93eg0yf?=
 =?iso-8859-1?Q?BkJ4j/dZSnXl2WesjPjP7yiHG+oHmpBtjrbL4cCD7tYJHzYZRFt6cHWIg1?=
 =?iso-8859-1?Q?VxjjDUZxP1JZqgPqPFtu/ZzqOQ3o4CZEOWYQcRpPpGJMLnpsjOYFnBGBXi?=
 =?iso-8859-1?Q?97i0RgDWJWWON71YV16jWUX8O9zi8lDwex6iyib3M2qQU1dYJlwfAp0EC/?=
 =?iso-8859-1?Q?Ghj4C74yOpWJu3F4q+PajvfSDubh+ky49Dfa8rLj6Fv3Om+jTXH2f95Gos?=
 =?iso-8859-1?Q?KvqYMiHV+F/RPA4WTvd2C1OxpqKBEBRav68SOtHltrCOARHWyS+Z/DNj1d?=
 =?iso-8859-1?Q?z/XnUPNuRYxDwmLu55w5i0RUW8ZtTIbzF6n2oImYJxZwv9YAe+5uxhBuBx?=
 =?iso-8859-1?Q?upE06i8ZZhx6H1Vmv9RHPbqDVL4+ri4HOgsqbyqwNP2WmpumSHEXQa08PZ?=
 =?iso-8859-1?Q?9lKtQ9iA3J3SXTX6HkTjaB1VXd0AFm6KtBS7aQJVVOSi9AqNgZQbITy24H?=
 =?iso-8859-1?Q?fnre4NEfOCMgSJidXq5en9m5CZpRGZlCzL6WL+7/x9MGJIX10uB4vAgMnh?=
 =?iso-8859-1?Q?GzXWwpGGE1YtydQ6AnHcJN9dwcVmPMgeLe9rdokLogUNCieuW4MOC5VBpz?=
 =?iso-8859-1?Q?ZPNAhXIAJ3NIqTF3lNL/o8XxkEAE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5aTVOY+9MviHQnxo7iSY7n01zKAnwRIfbDtMvmNlky9jxeVUCMeDNDqC/U?=
 =?iso-8859-1?Q?Xbo8sPWjq3uaGH9DKxuDOqN8DH0vUL7ijCap4AnHq2xYSLlB205xwbg0by?=
 =?iso-8859-1?Q?WlJqHOnoC204+nLdKrru/AiJFK3wI+hmEmTC+PdOSiBDXhBmbEg2E8dLFX?=
 =?iso-8859-1?Q?RsCruPh4zM9DiyvPvtW36i1no9QnKgXUCE2Ih1CHGPdm8cspZGiyTYp2oq?=
 =?iso-8859-1?Q?DOUkG+IszyQAfu1w2IeFGZqRH/044UITtnN9RutVSHpfbiNPQqmPsMuDhT?=
 =?iso-8859-1?Q?yZlofRmGeUxjEBUbsCWkgE3QQxNqTn16vLC10Xdpi+W/+oDp3lBpE1MbhP?=
 =?iso-8859-1?Q?K6jfCvz1m3eCpf8u1c/kcnszb5Xz62AfUWKEN8Qdy6WR+owIQEczIEn5Th?=
 =?iso-8859-1?Q?cp8ov4kqHOpDmgmlpSC+ZC2FmlZK38dhjopLwTd0Q/CjEqQlyURa0ROBNo?=
 =?iso-8859-1?Q?qcEm+9YpkenqWsUaM2wafqt+URXYIoeflEJ0dhbXXh6sdbYtWM8VyijbGy?=
 =?iso-8859-1?Q?2zzAQjjianCXbr8wolz/vLnusdbSL4v3SKFEtI6eEMm9QHyIJqFZVvxDeJ?=
 =?iso-8859-1?Q?bIlXM1SWEQY1hfyQdUCtzWks8ndbX9VJyZnqbLCkKBW5LcwUPCqXTWN+rt?=
 =?iso-8859-1?Q?uo9MyZvUcJe9jnBfeQXUJecnhRDw3X+b+r6gcXMBShOyacm/ROMAqq9mGc?=
 =?iso-8859-1?Q?wzuHCAETk8yV5PjjXrzkV2WBeKreRl+s2RjtZG95CXcVEJeS143Hr3iXxf?=
 =?iso-8859-1?Q?2t6Wq/u4g7Qz8jta3qPS1AEmtaJpPR58p2zHvHLcr6m/pKiBBoxs6AklZs?=
 =?iso-8859-1?Q?hCR0VFpaKvIlipppIxTscDJr2UUP3r/10YQZfUEitw1H0a7PXR0l24O5No?=
 =?iso-8859-1?Q?rnRejcsqTcJMfYIITk8cDzOMPZ6xgA9u+F/aweS98flBpM2vrCpxO/b5p8?=
 =?iso-8859-1?Q?ksgO/CN9Mtr0Oza8xlF6YKWnyVGhNm2ypW+u/hoFYwXyoISCwy+LDSI5UX?=
 =?iso-8859-1?Q?s36pukgZjnBZAlTvovUP/K7mgFXq2KmxNSTt8ST7BOn9G25eb8R1shnPun?=
 =?iso-8859-1?Q?+QjjvmMhQRrmObgH56d70463XxRQrjA+xDDjavybPq6gVeIdlo+P1LLUDj?=
 =?iso-8859-1?Q?JaIVMu90NUwLf17aIph4qp2lb3GHKYrsiEWPDqNqoEwPD1cZnHntkEjYcN?=
 =?iso-8859-1?Q?G1y1X58z0GRBe28QCxvn6U9+a/Yev8ETvgkvFF7A1zwewqfnDZ7FsnMZPr?=
 =?iso-8859-1?Q?X94AHslhH51Zr3d5HJo5sLBZeiF/bOiXuJA6y8UJkcAV2v+rtFZgepLa/u?=
 =?iso-8859-1?Q?MwbU7HoYDX+Dg+VBly5waaBzYrGiVoylNyStwO4D5wjPIcjUVWalZqSpG3?=
 =?iso-8859-1?Q?DGs1Uw+JfJ8WbwCF1akd7itkzq08Z+MocR0PMLIOoJ6vu9yzX8pyNZYbu/?=
 =?iso-8859-1?Q?v3Xkel8n6lV2EO5cKs2USDzSWuZA0+wcyVtHNxT0DWW2Qj753Kf3G3NR71?=
 =?iso-8859-1?Q?37odwkQNjc8ccOso8mBbJaP+JBY5rHhL/VeoqCpQkIVd5+6ZVPqHcjMOYu?=
 =?iso-8859-1?Q?OJpKbL8ExHuzfnta30zAMllamWaGRjzS2yjAec5O0PJ+TxLDNcDKXDtah+?=
 =?iso-8859-1?Q?3lGjG8v/J0KScbnH3HsBXNavxdCxLvgRJiV/GGpkpbSve2+0WdB85iCg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005ea4a3-bbc9-4e16-9814-08de2e0217c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 22:12:45.6205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYqO2l8IkxFXONbIJYf4BQq1thsWUy9nFVrpUIUliUgc7ceAmDPbTzf35blibmQNzwV/tDg2LG+IOEbNOrPg22IeiKisB1TvXHEJBzB2PPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10621

From: Grygorii Strashko <grygorii_strashko@epam.com>

1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
3) move d->arch.physaddr_bitsize field handling to pv32 code

changes in v2:
- split on 3 patches
- move physaddr_bitsize in struct pv_domain
- make minimal style adjustments as requested

Grygorii Strashko (3):
  arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
  xen/mm: add generic domain_clamp_alloc_bitsize() macro
  xen/x86: move d->arch.physaddr_bitsize field handling to pv32

 xen/arch/arm/include/asm/mm.h     |  3 ---
 xen/arch/ppc/include/asm/mm.h     |  3 ---
 xen/arch/riscv/include/asm/mm.h   |  3 ---
 xen/arch/x86/include/asm/domain.h |  8 +++++---
 xen/arch/x86/include/asm/mm.h     |  7 +++++--
 xen/arch/x86/pv/dom0_build.c      |  6 ++++--
 xen/arch/x86/pv/domain.c          | 23 +++++++++++++++++++++++
 xen/arch/x86/x86_64/mm.c          | 20 --------------------
 xen/include/xen/mm.h              |  4 ++++
 9 files changed, 41 insertions(+), 36 deletions(-)

--=20
2.34.1

