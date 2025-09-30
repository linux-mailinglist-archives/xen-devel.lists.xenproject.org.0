Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D12BACF10
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 14:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134259.1472228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZqB-0002Ih-2g; Tue, 30 Sep 2025 12:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134259.1472228; Tue, 30 Sep 2025 12:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZqA-0002Fb-Ur; Tue, 30 Sep 2025 12:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1134259;
 Tue, 30 Sep 2025 12:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7R3=4J=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v3Zq9-0002FV-2I
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 12:52:21 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cea2bed-9dfc-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 14:52:20 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by DB9PR03MB9856.eurprd03.prod.outlook.com
 (2603:10a6:10:45c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:52:16 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:52:16 +0000
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
X-Inumbo-ID: 4cea2bed-9dfc-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhPhcZKlklOxzwfg6A/dstcNIIQvOkeZWib/J79FgQ7+teW8JOyE4RLHSF3L/itGQl3yI1yDluL+1lUFWvaADO7xTf68T8oPZAU4iVceaLQtzkXuMom9QDaZOrogf87BcwgUgwuGsQb9Q+mt0qX6v4Jp3yAUSimmr1iim4NE40JGC4h29U8YFHr6eWgA2vjkAOBLZqou1cqd8H1NQ+qFuEyS9c95p1kMLn0TKGXz5O8F7qDgrp+lZ+e4Hw5CpXr5ons5md4Wl33MAOE4Y0h4P2pUH1FIDw7DAlGu7+DorMEKJ4Wp6c5+QGlezQi+HV6rowISPvw6zR2I6I/boqDUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Erjrl30noscaX2lqT9hvXNNxAk5ztrLaiZs6au1Q5qk=;
 b=o9CEUkJml1eFKcn168hNaSubzOHLgeYxwXBUWF8KutZ0kG8LBf7rkh1Ap+XJ2N75BsYF8PbCHiOUTnmJFIyqo02DD5TCfXUbwjaBo1rur2+AdLnCr1X4U/a/ZzvWhuK0l2XWY4UPBLecPbG1o2MQVvUY38kOOszDudMk6I4TQWGCwXHhsCuUbCrwASSGcuW8x7mAurX4Wvz/BxaSd3HW12fdnsUFDEoNg4rYNvHQQEwDpMotX8ACtk2HghHp1P1i8SjgR52WQakzlY1pvZphb4RW6vTFCTPKGETloK+OtWwIsYnNeqNqezTUhMx4KyTQPj8S/Yc6E1EfE/suefKzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Erjrl30noscaX2lqT9hvXNNxAk5ztrLaiZs6au1Q5qk=;
 b=H5oFQNXAv09364nMVjI1WVehzjvyYT0tEOd6EUKC1Sd5A85Ln7NOABG4Ft0mDpyS5WuzVYo0qENdiFzTq3uS7txEeaq2jEr2ymbzL495EwWdXkGntwpEMLSNSfhzfy3TgRAGudR+y/VBsmUajLkmIR1RTdJbMc7p4Itjc/MSftTyE1Ke4XR7jCXChb8OoDcNIPs5aPrBAduGaZe9rkzWh9BVVDxGNOQZ9E1ru9KVMW7VXo22EML+mMcLfCftjqj0yYAZW3Y0tg2TdsDAzHTW67gOQwmWISObjzXkoo3gGV4oqVhWTWxjXZBbfx7Du5fmSEcvcLQiN6G5k35yGDAt/Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v5] x86: make Viridian support optional
Thread-Topic: [PATCH v5] x86: make Viridian support optional
Thread-Index: AQHcMgkMkZmHuEXP5EqWMA+gnbZsPg==
Date: Tue, 30 Sep 2025 12:52:16 +0000
Message-ID: <20250930125215.1087214-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|DB9PR03MB9856:EE_
x-ms-office365-filtering-correlation-id: f13d7852-36d5-4df1-45e8-08de00202f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HaeB7Kmcm4pWSTiXt1CfPY5KkITcz+hq23LWlq41s36pq7eZ9x2YKZKHFd?=
 =?iso-8859-1?Q?goqssOCvopDK1t6tcWatJi80T44a7Ft/goqD4tdiiSpqYVC9QVWVxDK+P7?=
 =?iso-8859-1?Q?wW/pEWpB2d/3e7ndtRN2X6lkkHNI+20dTFcd3Hlbjp3zsRqWlKL6a5AfPR?=
 =?iso-8859-1?Q?KvYmS5qTr2g1kHbD/VRTfNPLHY3zZlSiwEFaHEToTx77UYygoEGvugTOlL?=
 =?iso-8859-1?Q?wjAHdx0/eAgJ51F+g3PQuwdQXz+aDH61/Ik4s1uycXO8a/NZO1rimJ+KqX?=
 =?iso-8859-1?Q?skGQGIeUayTVosSHLewy0Io4SATQ+4ATGlGQ5lELo1UAJ4f6t6R8juSoMF?=
 =?iso-8859-1?Q?oGh5LodFFwdNiB5F/iM7eL49dir4X56fvR+6WKXEEdbbM5fL8k0ON+2CfM?=
 =?iso-8859-1?Q?7Q7KbBH7kQri71oWL8nzNjlUzP7+yMCI/ebIzqrLIfC8VgA1uiEbWOP6BX?=
 =?iso-8859-1?Q?O6qXII92SyJpJ0Pt2DeSI8lnWGAjn4WELVe2kdyo03sOgoFSjIPP+JEEiF?=
 =?iso-8859-1?Q?qlpjQx5QsLTtCvIB0I60LvuudLPhJyL68tCMDwot+mXqSApXjDYPx5+nGd?=
 =?iso-8859-1?Q?8kJ45IfPpeFlI/Q8T/dm4rz7OP96ftf9mLj/L6IBWQmAvYjw5MpluTzhdp?=
 =?iso-8859-1?Q?99+v8JaVWxkkj0LD32rGMq8+2oGe0uHwMXIrb8qxkpcGgFV6ykaIMJDY9A?=
 =?iso-8859-1?Q?h3IdSov1PG3s8JgkmmQlejLhaE4f+hk9NsDqcfM42YLveR9UHwd9kM1kVK?=
 =?iso-8859-1?Q?SH+ctA8SCmq47Wi+1QemPYPx8M9+RCzoc6fcyb+eRZmYcKZKCqtNvAh94M?=
 =?iso-8859-1?Q?VGhLOgTfHorUuAGwlfifJslruJdMvaE04IDxQvg0eg/kmshHPV9CW3EE5D?=
 =?iso-8859-1?Q?iB+NM88OnRX6AM2mCL+mhAlwQ0EWBminFKd5aGuCOO/1EDl2BgBPUnuTi/?=
 =?iso-8859-1?Q?StqaYLiWULhaLyIQBxz+YppfxVVTB5b8gu4IVtc6YMxNzgx6EJNWrLBkan?=
 =?iso-8859-1?Q?NUjPdvqMDV9rHgRs/AlMB4hSe/VSLB2zCBS9qbspuLR4JZxRdRxf4hgN9v?=
 =?iso-8859-1?Q?FjHH78/5MTf22mTRGpe5rGTEa5XvUURRcJrwwaqot/8rApJ4Q13Y+rUH30?=
 =?iso-8859-1?Q?gdFYEP8ZBv1bVs3F/Pyag1TsUKnn9Q1SFJIZiiWgxi3BVcEE7G3SqrMC2J?=
 =?iso-8859-1?Q?bSXS5rLm23Y1k993VErLoOlwNvveX4GIRHxRO8FEYa33wbz1I5LtfmArdS?=
 =?iso-8859-1?Q?wjI8gP44CjFXRPoqreAxJoinsQvEh7J0a+/cxZu+PzzdGAKUjuH3xwFg+D?=
 =?iso-8859-1?Q?R5oiKPzUVgSNKFNc7jMeIl05JBTrqczqzTQh+AGFHFlZixS49pR2vBuHeB?=
 =?iso-8859-1?Q?kMdzUCpwhFpierJE8nyz7TfKlJFUpUWGLWKn/o8FL4ikyw2iwKQ8tg2jzs?=
 =?iso-8859-1?Q?nQr5/iVWbrMGOYOOAnY0zgN3ZPz9LxhnFLM8vWG7mb0KWh/qBKpLIeMFTE?=
 =?iso-8859-1?Q?CMfCkYBR4dRSypPV67id+R?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N25PxKQ+9bi8uiSdwEzLH9MDzq4VHx5gt1VpkmM+d6yaeVp2DB9kj7AQtV?=
 =?iso-8859-1?Q?hF05w3twkd+ptNWVxpoj9hAc6YEtvmmr+QuLlveakMeyu5tdKiynRlsL3K?=
 =?iso-8859-1?Q?GnjUqLR4gXEzd7cJxb1oXHAR2cJwiBkYxw2d7uzuWxjwTNef1nGk5BDyYX?=
 =?iso-8859-1?Q?NloqgJ85Tv8gQ8nElArdFCsYwyhUaWpS8wcc1lztNaHEkLCS0LcpFQ5Xzh?=
 =?iso-8859-1?Q?qCpfZF2JH+C99QXf4nVG3Tx8iVD9Endk1HwemXGJJ/q/0b6YXnp0avbNrt?=
 =?iso-8859-1?Q?ou5Rpmg3cvzDSwSyahzQM3tfEapOuHL8Qi51csGlnxpDZHfY1pm/YIXONZ?=
 =?iso-8859-1?Q?+YJUWRZzkm5hcQx5leyLoNiY59j8VAOAyDwzuAtijCnA+cO0eNOv5AQjfb?=
 =?iso-8859-1?Q?GaQwzhjPDF8zc0O2V73RZCAFZURZzFdYKWEJu2jn1xb48MYT18COYPQxMD?=
 =?iso-8859-1?Q?KtlD+oWhBDyKh9xDpIsc6tjFv5tHNABCwPXhQ95WNVrGA8ZcnzXzeKuxsH?=
 =?iso-8859-1?Q?P5Ys4ZEcKU2pIvn0oLcjkZLh3mDXPQSqwlG3v+3coIgMMkSZJuyLi5obFh?=
 =?iso-8859-1?Q?WPJimpg7Rpl1MqBCLxIaYaYQ+ORnKfWNQXRF5chuO3Aeua18xt1r56H/MM?=
 =?iso-8859-1?Q?RByqCt/rFZ5pAHMM+PFAQA5iqN1sOnTuvyvaAtxSfHw+mYlfyUe1CcxCC2?=
 =?iso-8859-1?Q?UXsMHuC+9GqZiKCUEq4TinHDjax8uOL1am70wDOcTaHNpqWmUH/EJkt036?=
 =?iso-8859-1?Q?JcOFo2CFTLQTBPPH3vegS/PBRmSephn/HHab8w1D1k4/qYWz4+QeoOOaOd?=
 =?iso-8859-1?Q?5Fll2Fngngu2w/HY2CKT96pzjzN8DeBG06e8ysbIvESKWaxRGMpb76J/WP?=
 =?iso-8859-1?Q?Ug8LRM9/GQAD3PuOYDu8mxvi7uHglUV2pRTTYmRMcVJ4lY4gSmBqSVUlhy?=
 =?iso-8859-1?Q?IFQYE4YWjM0kN8wAQmQbNRqRxBae+qOixRbOiIVXok/lxoNTLxEJXIDu5K?=
 =?iso-8859-1?Q?BVrPkHbVUjsnH80X8bXAKWcO1PP7Tma5uBZaq1E2uZ3SqM/27nOOUnyAut?=
 =?iso-8859-1?Q?Tl7QqC5kQXSbNb4W1s53DV/y7XtNax1EBhfrKL4plNRwsp5rvNpZaLath3?=
 =?iso-8859-1?Q?TQSXECBpmHkbpbuezQ9T8H5/GK6XjD+ictNlpvEqJ2n41+DfsDuhlhgHPh?=
 =?iso-8859-1?Q?3hUuWrdEBeo5By/vnt4U5etunrfRG6EACF5VV8vfIm9YiX75xJ4SebEwOW?=
 =?iso-8859-1?Q?OpT1mF9q//f069axkQlaUdIFgw+OE2awIEbKVnbYTSSl7InzNtwm2C+igJ?=
 =?iso-8859-1?Q?rmVIuZD+sE667+iK6V665+1Y4XTWfDv1MIbbMs3J4GWY2p6jYN/MiUItMH?=
 =?iso-8859-1?Q?+pEnnsUh8tkxLhMcblwiS17q7SD39RsQtUNrpj8/mdNzVtuuCKXQlWQdiR?=
 =?iso-8859-1?Q?WXJIaEn+EEdzccNc82W9Vw/BxJ95WU8xmNmGY2UiofXS3CjAUThX2T7bJk?=
 =?iso-8859-1?Q?qCOj766GBt5ITwMQe+0ZaIuhz42hM0Drq9eTT4VrBAoJxMQDIh1XuQ0xKY?=
 =?iso-8859-1?Q?N6lAaLYl+rEXldKdRjkF+aChSWNl0zU61KEl387fveZkVVdDm83T1MOkAp?=
 =?iso-8859-1?Q?Ykf73eKUH9jue/jkyCcC5AhIc2yfqWK1aOipl2PSLa9p8rbJFHwvk0ug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13d7852-36d5-4df1-45e8-08de00202f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 12:52:16.7950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJwfTBjiD9z7CTQDU2L1Kymyhl9siplppupoz/wbJV20pim2BsJv0fSHTZKpykkP6+OmR3AtjD4GkYsZxA7wAKyI1gHCAyGtlltu+ssgOhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9856

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Add config option VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

[grygorii_strashko@epam.com: fixed NULL pointer deref in
viridian_save_domain_ctxt()]
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v5:
- drop "depends on AMD_SVM || INTEL_VMX"
- return -EILSEQ from viridian_load_x() if !VIRIDIAN

changes in v4:
- s/HVM_VIRIDIAN/VIRIDIAN
- add "depends on AMD_SVM || INTEL_VMX"
- add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_=
load_domain_ctxt

changes in v3:
- fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
  which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridia=
n
  support optional"")

v4: https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.282=
1531-1-grygorii_strashko@epam.com/
v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.221=
4104-1-grygorii_strashko@epam.com/
v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.398=
2645-1-Sergiy_Kibrik@epam.com/

 xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
 xen/arch/x86/hvm/viridian/viridian.c  | 14 ++++++++++----
 xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
 8 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f2904255..928bb5662b89 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -62,6 +62,16 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config VIRIDIAN
+	bool "Hyper-V enlightenments for guests" if EXPERT
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as faster hypercalls,
+	  efficient timer and interrupt handling, and enhanced paravirtualized
+	  I/O. This is to improve performance and compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..736eb3f966e9 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) +=3D svm/
 obj-$(CONFIG_INTEL_VMX) +=3D vmx/
-obj-y +=3D viridian/
+obj-$(CONFIG_VIRIDIAN) +=3D viridian/
=20
 obj-y +=3D asid.o
 obj-y +=3D dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a1d..95a80369b9b8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio =3D hvm_default_tsc_scaling_ratio;
=20
-    rc =3D viridian_domain_init(d);
-    if ( rc )
-        goto fail2;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_domain_init(d);
+        if ( rc )
+            goto fail2;
+    }
=20
     rc =3D alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc !=3D 0 )
@@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
         alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
=20
-    viridian_domain_deinit(d);
+    if ( is_viridian_domain(d) )
+        viridian_domain_deinit(d);
=20
     ioreq_server_destroy_all(d);
=20
@@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
          && (rc =3D nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: neste=
dhvm_vcpu_destroy */
         goto fail5;
=20
-    rc =3D viridian_vcpu_init(v);
-    if ( rc )
-        goto fail6;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_vcpu_init(v);
+        if ( rc )
+            goto fail6;
+    }
=20
     rc =3D ioreq_server_add_vcpu_all(d, v);
     if ( rc !=3D 0 )
@@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
  fail2:
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(d) )
+        viridian_vcpu_deinit(v);
     return rc;
 }
=20
 void hvm_vcpu_destroy(struct vcpu *v)
 {
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
=20
     ioreq_server_remove_vcpu_all(v->domain, v);
=20
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index c0be24bd2210..1212cc418728 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
 {
     const struct domain *d =3D v->domain;
     const struct viridian_domain *vd =3D d->arch.hvm.viridian;
-    struct hvm_viridian_domain_context ctxt =3D {
-        .hypercall_gpa =3D vd->hypercall_gpa.raw,
-        .guest_os_id =3D vd->guest_os_id.raw,
-    };
+    struct hvm_viridian_domain_context ctxt =3D {};
=20
     if ( !is_viridian_domain(d) )
         return 0;
=20
+    ctxt.hypercall_gpa =3D vd->hypercall_gpa.raw;
+    ctxt.guest_os_id =3D vd->guest_os_id.raw,
+
     viridian_time_save_domain_ctxt(d, &ctxt);
     viridian_synic_save_domain_ctxt(d, &ctxt);
=20
@@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
     struct viridian_domain *vd =3D d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return -EILSEQ;
+
     if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) !=3D 0 )
         return -EINVAL;
=20
@@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
     struct vcpu *v;
     struct hvm_viridian_vcpu_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return -EILSEQ;
+
     if ( vcpuid >=3D d->max_vcpus || (v =3D d->vcpu[vcpuid]) =3D=3D NULL )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 993e972cd71e..79697487ba90 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi =3D viridian_apic_assist_completed(v);
+    bool missed_eoi =3D has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
=20
  again:
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
=20
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
=20
     isr =3D vlapic_find_highest_isr(vlapic);
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >=3D 0 &&
          (irr & 0xf0) <=3D (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 333501d5f2ac..95d9336a28f0 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -111,7 +111,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
=20
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index f02183691ea6..7312cdd878e1 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -510,7 +510,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
=20
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_VIRIDIAN) && \
+     is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
=20
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 924af890c5b2..9ed9eaff3bc5 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -176,7 +176,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
     struct x86_event     inject_event;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_VCPU_H__ */
--=20
2.34.1

