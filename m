Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CDB373BB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 22:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095072.1450217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur065-0007h5-1P; Tue, 26 Aug 2025 20:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095072.1450217; Tue, 26 Aug 2025 20:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur064-0007fO-Tv; Tue, 26 Aug 2025 20:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1095072;
 Tue, 26 Aug 2025 20:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur062-0007dQ-Ou
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 20:16:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94412928-82b9-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 22:16:41 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7521.eurprd03.prod.outlook.com
 (2603:10a6:20b:344::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 20:16:39 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 20:16:39 +0000
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
X-Inumbo-ID: 94412928-82b9-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtgOOiCc8cPCMWvGEcslAuVznnII2zRf/c3O05int/4BNre0wlN9K9a8Pf0qxNVSiOzTTZfGlJFpWlDvKDrhMnuglqtq9fXe2GqX6QlCv3kjBSTEhdy/d/jHkbu5HNoWcKsCiDjFW53H6aFm0AeVyjN3ooxBdnBhOTXcIAvJEiD3aW2Z8ngIccB/a7+MDwx3qy2n4/7HR0tZnaiHcwa3DjDcM7DkuzxQHxdTVLZsDkUaToZL7983vvp+T1a7ohjJJaUwgthDTHY9JASGWIfaKWzMUguxSgiD5P3v1RLy1Smj68Vec7dmjzpsEP51cFpeR96swIHr7WWL/LVrdYAH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ETeGl12XGv6FyPiROn1jEG1DqEW8h5hgkx+DXtLTZ0=;
 b=P/eMWOEbVTVLE40JOKooQ9rojH7GWcM6R+XOpYVLlkxHgJN3GBV0LN3ur3l7AzTQRn0j4G9OG40xrYC9Uemc8t3XDBLev99H0Yr6t21pYaQyB1z5lzYksF+pQgL+AAEU3BCGi6AFB8TIr+hxuuJSjkFB0HjC7armtvaSP4ckV3rjkOv/NjaKkxWYVSih72tahcWFusmN8F988NRbo+PsWso+Eq6moXE7Ct7uBU4Hc5IuzISMa2FdBLrUg9Eb3us3hVtOKcfczQCSiaBWhmKZ+f992L1a5GZg1KqT3v79yjNUc81h0gKZl9/jDnr7mxTA9+8tXgi8FLZHWninmCxuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ETeGl12XGv6FyPiROn1jEG1DqEW8h5hgkx+DXtLTZ0=;
 b=ZnKQ4Xw7NjwNYZ0L5vMA+2PeADbRcLZi6TEZTBX0h/gR0FW3GmeXPJ9Tjr8J7DnZMLyj6lbMUhyhZMHbkG61LVkDDnG43MXE/b2gdmbEheBsYd1/Z2JNhmjiV/XK9xq8MW/815fYftfCGrqFJUOqcU1lKSa+v57emzBYiAm8D5Uf7wdRyXaWOUKOMYgIJPLDOILaRw/QLKbr3Y8bCO5lTrFf2N+C7lGXo2zqkVjKdFj7c3hU3I4gj9dGwHFZegYNhCxD5v8jHWosflIliHnr/6mM8f0C9PdqWV+QV2IiwIapRyxHHHigUX/qZKsxuhy1qg1VHMeLNy4oEGd0JKwslA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcFpJ/t39ssss6a0y8SPAQeD5PEA==
Date: Tue, 26 Aug 2025 20:16:39 +0000
Message-ID: <87zfbl4z4p.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:37 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7521:EE_
x-ms-office365-filtering-correlation-id: 3a62177e-bb95-477b-af35-08dde4dd7741
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sXNwt5+ZTFU/7DjWqBenJFATzM0y/3HNatlc70paWk5YmGGX1r4Vob4H5j?=
 =?iso-8859-1?Q?eWKEHNYMSfH1o3wvwyrGcXjue/hb3DmZWgObHmL3+obNfvy30LFNSWbygg?=
 =?iso-8859-1?Q?4L9xLfzHKXOCSBHiYCSHNqoppQs0qG/qWYdRB+4wkVgrP32nzlCjxnCESf?=
 =?iso-8859-1?Q?twtZZEALJBT7GlD4nupoQBDfd5zT7Lw2o5ANznqxmkIK9gUR5Yxzh70tNC?=
 =?iso-8859-1?Q?mEe5q0WrQI5w253GzvGNGmaOcPVOKsIx8F5VAO048QREdGAbfGlDy2B4TV?=
 =?iso-8859-1?Q?gXOPeWTo2cYpJxStpWIqyf5ogaDrrkaI5dMdcQIeWSxxbAhGTJ/xo/V2Tr?=
 =?iso-8859-1?Q?nXSeTWQEldY+4L6WFrhdPGVM+x+UJ6uToB6EVnGW5/tmsDe6CSZLX6NLJf?=
 =?iso-8859-1?Q?aMZ3/rAQoTdIs4aYys8shhcQlsONMRFaiq2WJfaq/sdz/DPtBByK/fDI/H?=
 =?iso-8859-1?Q?9Mr3ER7ZMXOwHzZj/uROQZExNQPcrdzxSK9nDlWcXoXyyVJeF3LWUqCXFF?=
 =?iso-8859-1?Q?KPo2xHvau8V+ctClO8JN2iZoBw3HETdN6kxu8vfh8KY1yOG2oKyCYeIV6U?=
 =?iso-8859-1?Q?fwpwRfVaXDpU4pBauR4FY30g0B0EpDjcoyf2e8VkVnkuHIQ1eo77JkTHts?=
 =?iso-8859-1?Q?HP8ZTkefKPOe0U79azp7DD/fwl/b1R8yib005HJh16htriq9ei/wrLqhnB?=
 =?iso-8859-1?Q?/5Wjl6rwn9NyaxbiS0G11CLxkhslCDCtywHL4LC+HEBOTgB5KwGvVul8s7?=
 =?iso-8859-1?Q?kItPqDHn7CCiG3F5nQ58+2jqosJWNxwV+O5ritx0RydDOwkkyr0obMY3Qu?=
 =?iso-8859-1?Q?LYzCBtTH0/MMc5XIfpKDRF6HlFLclw3U8b/RQmXrguaCyMZfpj3DutnVJq?=
 =?iso-8859-1?Q?LlKXrBPO57qvmZXwRS7kQUtOpKbnwAuL3zBIRmtfsqdO0vYjGoeeZd5K3G?=
 =?iso-8859-1?Q?2FsCIny1okwOPi0pB5UAtU+TJVxMjcD1OyEq4r6nFfwIaBfSNEHNZF44Qu?=
 =?iso-8859-1?Q?odcOrHvmdMN9jJq6A7Apnj5C27sFYfKD+L7F0ANJkexEzQQuHpvtw3bDwY?=
 =?iso-8859-1?Q?ApTD6JtmLY8kA9oe50nwRtAI0dK6WXZ60ZGTYzcnYBaP9fLf4LXXcmtHPh?=
 =?iso-8859-1?Q?oDe4aRF305GWk2nOCfgfxUIAzq988IKap3ffb3371iVCN62cw5YK8CsmAo?=
 =?iso-8859-1?Q?MMI5yBPJwSTxc/YAEF3zOCAvmR4e19XgOZRRfBqszOclcvtdWx/h2310wW?=
 =?iso-8859-1?Q?TLREmxqSrmT4Ntzr8czLZnNod46Jui7ECZ8KPnwKwZy6RBKKdLrFdG/8Me?=
 =?iso-8859-1?Q?b56c7KTG6dFsLIGda0nCPqIagHSV/kgcj0Uqux35NsXBg4+uJXVs6PkyJC?=
 =?iso-8859-1?Q?LtoE3JthpWy+yujPkKU785cfa6ZafEq2xnC5MvVF2teQBxmw4roIoKrCFW?=
 =?iso-8859-1?Q?V6zp2Q8vFYkNA4FJr6+/nzRD6FI1QmzCgA/uhyYDXZC0TNIFWF9Mpw42wZ?=
 =?iso-8859-1?Q?pLeRnKqyKEjDB8Wgj3ncoTX82ccPee/o3Y4tR8SPDRXw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NvMfmIKMAssxsgHAa5QELhAbQ/c8273uUCgJ7qWr1dBTfQgoLaPuE+MMzw?=
 =?iso-8859-1?Q?zXUKAA1Gd5J2rnXjSWk3iYfBnRxNP5nQitLegim1vmeS2UAiH45mMBJhnq?=
 =?iso-8859-1?Q?L1ahnuuaVC99rTXbGntrGdt+LZ5La/3Sy6lUxJgXSfuFO4Bb3U0NKeLdgZ?=
 =?iso-8859-1?Q?lFO4ScFBLDZmywJWNrzEnVUi7lvNQ8NbqMU3cvY9msdCR03030p8ukXMse?=
 =?iso-8859-1?Q?dJA+botjlTPJ9dX9D7JMtH7WWm9z955twnvetXuHTgnz39BYYXlIcsbKkA?=
 =?iso-8859-1?Q?CqDGM81wnlDngLQ0/jM3MmeJRBxl+R7rdoWhX9H3dJvwFTWxPyOnl9VVQH?=
 =?iso-8859-1?Q?rxMeWsEfozMe+HMW0cIpOIjV3wVZuSf+bavj4y6T0lU0P7Y/C7V3vXoW21?=
 =?iso-8859-1?Q?YwaPNzogojy4Z6AZa2L9Xg4R/9Z54uTcLxVQKjeqfpJ+zH+sYB/179TMOv?=
 =?iso-8859-1?Q?exyP7a5mtcHv/N5nRKwIfN/iKeysoHfXZQ4AeGgoCPOM0NvOmNvdfQ74W4?=
 =?iso-8859-1?Q?cp95Tkfkd9Z5Lw+fmeb7wwwZEGyRV8ojgnZNRbO9+4jGA/vAxTQ/LvVqNg?=
 =?iso-8859-1?Q?4yfSQtiepZhBSY06KScId3ejFbv7gt3dxMxV7jnZ+TBKWI7bIS++cjH5Zg?=
 =?iso-8859-1?Q?YHuhbtqL6g+lfqOaNhpPhc6QWtHPeQ+YqAJVpZEGdAc3W0+WhPYnAMw9Fs?=
 =?iso-8859-1?Q?MtX63j3Ul412J7Z2oir1ziZdqQnmi+kztKnwbG+/pcYfuPD6v65533bD8v?=
 =?iso-8859-1?Q?xvG7X4vKV+4yzXVcHxhotmzNiq1TZpQ2+hqM3ukVNxn0yTznZ3CE1noja5?=
 =?iso-8859-1?Q?DqGUPI1xLKAdk00qhQfAILeiYc3Or5tpPcJGh8JuTw27FNX2B91utKcdNN?=
 =?iso-8859-1?Q?ZsgoTD20uM8efsguW5GY1917kjo07S3s6IYL11jzquxyw6ArWFbaxPjDw2?=
 =?iso-8859-1?Q?zNUU7VVqZhkd6Lg7MnhtZ+gVgLJ3Dr+mYKTHjJc1Hfkjpom+ZZn2iVIyYQ?=
 =?iso-8859-1?Q?vUgWLGA6yYbFYR+n6YPO2l0rog3pQfS+cGVzpidrN6GRG0IVWCcZgH85Vr?=
 =?iso-8859-1?Q?Y3c/ikUOub23vq0rlT1P5nAuPRkbPCb+mYxBkweCWRBkmYCBzYffo9/ez3?=
 =?iso-8859-1?Q?nDHMSimYm8s/Y381QDJrWLi9bCR0/USxyqlKwHvWCXIbb21Lh1lz+Rg1TE?=
 =?iso-8859-1?Q?wnGjE1wjf2q4evbCY98D+2h/aTVQZx29NnEOqfxGScqW7UY11h/evZctoo?=
 =?iso-8859-1?Q?bMwB9hyjGy4PCCjTjzEnS38jYQ4Cl7qTGv1PkCpAJnrwb22Hs7xXRSuVG0?=
 =?iso-8859-1?Q?8L7VXWb3YGc3rDWOYiwxGsoyj3JOlWuCYiw7ZGT/nDm3U2BpO0KFeETz50?=
 =?iso-8859-1?Q?bB7pdfMsnCtiDR1JF7GIsZ5pbESiZ6jZFcTP6K+BEaFrTdL4BuYDPfM4Id?=
 =?iso-8859-1?Q?XPhPMU/jRob6PAXOHSlFTzt7UIU/w22/jTCWOMcGQoxSHimc+Wv140D96O?=
 =?iso-8859-1?Q?6V4o/V+YNPr+9osMsq6zvQ2Uwth7bVijQglygWl7jyTeDdifvjgncYfyMp?=
 =?iso-8859-1?Q?MT3q7fpw9yCcTH9UR71V8RbOe43dbVpy8rGt9mnTD+ycU3HouMR5cd5YSs?=
 =?iso-8859-1?Q?n6VRp5pmxhCIZ8r9TFi7+zgMLwLYJiyDDpKhqiH+uymoqVuHDOO1Xzmg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a62177e-bb95-477b-af35-08dde4dd7741
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 20:16:39.6080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pa3SGRQE/L5hTDU2wbHWd1PUjyn2bwv32YFLcw1o1hXSfyY1KBBhP8AH0ImVQaNRpLyDADu9op/QFlwlkidLcZgd5Iwf1Hep8UhwedXSR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7521


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
>
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
>
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>   case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>   it possible to add stubs with the same name, and as a result, reduce
>   the number of #ifdefs
> - change CONFIG_GICV3_ESPI default value to n
> ---
>  xen/arch/arm/Kconfig           |  9 ++++++
>  xen/arch/arm/include/asm/irq.h | 26 +++++++++++++++++
>  xen/arch/arm/irq.c             | 52 +++++++++++++++++++++++++++++++++-
>  3 files changed, 86 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..5813e5b267 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,15 @@ config GICV3
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
> =20
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	default n
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPO=
RTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 5bc6475eb4..221dbf23a2 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,15 @@ struct arch_irq_desc {
>  #define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
> +#endif
> +
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */
>  #define INVALID_LPI     0
> =20
> @@ -39,7 +48,15 @@ struct arch_irq_desc {
>  #define INVALID_IRQ     1023
> =20
>  extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>  #define nr_static_irqs NR_IRQS
> +#endif
> =20
>  struct irq_desc;
>  struct irqaction;
> @@ -55,6 +72,15 @@ static inline bool is_lpi(unsigned int irq)
>      return irq >=3D LPI_OFFSET;
>  }
> =20
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
> +#else
> +    return false;
> +#endif
> +}
> +
>  #define domain_pirq_to_irq(d, pirq) (pirq)
> =20
>  bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b8eccfc924..adb5e49ea3 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,11 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
> +#else
>  const unsigned int nr_irqs =3D NR_IRQS;
> +#endif
> =20
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +50,49 @@ void irq_end_none(struct irq_desc *irq)
>  }
> =20
>  static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +static irq_desc_t espi_desc[NR_ESPI_IRQS];
> +
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    return &espi_desc[ESPI_INTID2IDX(irq)];
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    int irq;
> +
> +    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc =3D irq_to_desc(irq);
> +        int rc =3D init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq =3D irq;
> +        desc->action  =3D NULL;
> +    }
> +
> +    return 0;
> +}
> +#else
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_espi will always return false.
> + */
> +static struct irq_desc *espi_to_desc(unsigned int irq)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static int __init init_espi_data(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
> =20
>  struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +100,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_desc(irq);
> +
>      return &irq_desc[irq-NR_LOCAL_IRQS];
>  }
> =20
> @@ -79,7 +129,7 @@ static int __init init_irq_data(void)
>          desc->action  =3D NULL;
>      }
> =20
> -    return 0;
> +    return init_espi_data();
>  }
> =20
>  static int init_local_irq_data(unsigned int cpu)

--=20
WBR, Volodymyr=

