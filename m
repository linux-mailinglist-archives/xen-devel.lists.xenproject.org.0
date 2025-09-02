Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D3B40E97
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107465.1457880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXnA-0007bg-PE; Tue, 02 Sep 2025 20:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107465.1457880; Tue, 02 Sep 2025 20:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXnA-0007ZX-MF; Tue, 02 Sep 2025 20:39:48 +0000
Received: by outflank-mailman (input) for mailman id 1107465;
 Tue, 02 Sep 2025 20:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXn9-0007ZR-S7
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:39:47 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5bcc792-883c-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:39:45 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7137.eurprd03.prod.outlook.com
 (2603:10a6:20b:2d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:39:41 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:39:41 +0000
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
X-Inumbo-ID: f5bcc792-883c-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdICQakDqve6QitTFcjMT3eakef8Z+YurmWm12C/cbzjKSWFhE+K9HgUpiGG3ZltBjWnSrnrY7V+T/uS+iVLyF3tYAA6nIuJw/b84Lkl7UhluhNa1mNUbdLV2MwrJ20S9fKTfgI6WnVVT0ttx0af7TNoORnCyaHGNrfI9yFMEQNRrcxJtBPNjhotsTEhAtdRIGBwmNvads2LBNZwmsci+o2LVdi3OsvXefiQw/GeQC+bDNtaYFU6liY7SS9W0R+v16hrMTjvfNe4RB82Zcrt6or0wi/p8eXvlPw4xmUKGT5jgmtAseuIHqN3pMI+fqJWZUOPYFTdu9xmoee+LFVTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cxd15S9cG9TO0HjzQAmllabL/ai5xUhN3K3bgIQ6jsU=;
 b=kSJRj2wJdkRl2vLnAnigXuLIJQKPkCjuaPpJg/GmqNfy2bK8C4bjg9h8IfYz/Kcou0wJNi8oQWQTL9br+qIDI+nbxx5XB2B+O4ES1R/vt71CCF5CVQxNNroOJJ5iwut1Z90Gtl+b+hLgTFfiEOfTmzlJRx2rckKEFXRaUnPuNhVpSVmC/YOR+SgQjQOSS8bFmQEhM+jp0gdX8qXSL/jaR+eUQPu5L1wGPzjXmuAGz918VNkkhjUsANCIkGPABixIfM5uMBt+ZKuvVRjUFh8I3/rxAwSQ3DbNi8L3vEZCvswLuE8Qsg5OwdZoLYcFTiMRY4+BLcztamaH0u4SlLW5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cxd15S9cG9TO0HjzQAmllabL/ai5xUhN3K3bgIQ6jsU=;
 b=gUbo2zWCLLbRdoYwEtsX8QeGhdG7IcIpouxY6X6G/hi0ab+tuOrILVSQ+iySEHVkhnM/n7XXspyePCvZeEL2FxSqFRcWLncoD53askBr3a3JAZA0gBT0ReCYsVlgIgzcvq8D6kSoWlRqSXhEhVKleDXilLITfemNXFDLtqqHrK/9DqN1eMCh+YIj2dntlEMLioxkdR6rXjFObiEm1NSVJLWx1wKjMq0jg9TZB4tF2ub6rB1cxROBz15ZAovW3XODOj7AXkROB+hNUwyzecNzpPhGy4WCvy2dciKs7lQuqUc+6f0nxTZQDcoQJ8g7FKCDSRbOK9BNezk7YYtl97Hdvw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
Subject: Re: [PATCH v6 07/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v6 07/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHcG40/dU6/M1xyc0yVxU6cfQnuGg==
Date: Tue, 2 Sep 2025 20:39:41 +0000
Message-ID: <87zfbcvbar.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
	<3a05d0f188943173703690981a7590fd12fabd4c.1756763487.git.mykola_kvach@epam.com>
In-Reply-To:
 <3a05d0f188943173703690981a7590fd12fabd4c.1756763487.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 2 Sep 2025 01:10:11 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7137:EE_
x-ms-office365-filtering-correlation-id: 391ebabf-dea2-43e7-c93d-08ddea60d7b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/RDsUP23TsNYi3RRVT3VKmyq7Stca381mVUzzKAKIyn128roL8390TIhm3?=
 =?iso-8859-1?Q?rHw6rjIH9hM7Fw72SxtBAoshuaIGwqVrW2sg3Cv3HXmgDJ69oh69709TOT?=
 =?iso-8859-1?Q?mwHXAy11DFlPAjkZlOPunB7zre5s3X41hOtSb7qZNv1CbNxadmQi1HaOtz?=
 =?iso-8859-1?Q?PXzQaedClBfQ0Mxr0SFhEDWCrrrx5BjqrGmq3MZ73JALLjZnKRRxCxQoUh?=
 =?iso-8859-1?Q?5pkZBfmn+OENfkNGxHNHg2P+6diQG6a4kTA1xuOJR3UAJZG5e1R+tRa0JQ?=
 =?iso-8859-1?Q?vIAA9kMqI7+x3CIZ2Mr/7sWD6jc2nX3MqeSBdR9mN+VvGAbmSKVEcQB7jn?=
 =?iso-8859-1?Q?6UJHuLL1mJf6Nq0irLHe+8StbQ50LEZMuA3BYBx9SC9mAOodvd9NQa+3jr?=
 =?iso-8859-1?Q?l3UQNrhXiHRcCJyY/3OHzN6U9xeuQvINgr8lfmj5AfSF6O9Ws/HGoC584w?=
 =?iso-8859-1?Q?xsvlEEevxY6wCb+/Iv1FRSyw1BDp3z+nGTi9tGVNzP+Nmrb3qfOtlmNerH?=
 =?iso-8859-1?Q?iN7Yga1lsNUydlZCfFG8GJV/YLx9E1F1outIDZCiA8RlEm2g/05UTqRZyM?=
 =?iso-8859-1?Q?jh5PmXBOvrayNQWvvUl36WmCmXBBsYZW6+SiBnLIGkKltrq7YroI+3f8+9?=
 =?iso-8859-1?Q?ajFkRKs6ACyT9KHpfqsgQeqIIDrSAtzB5eZxHUlmENnubtvdO36OYy5BIr?=
 =?iso-8859-1?Q?vty/Z0iDuLQu2sRJbrlxkpBo15K/LiBS3ej4k2R0V5EhTtAo3C4J9Pw6mn?=
 =?iso-8859-1?Q?ZCfrOugW360ZmRPvgCROkmJAvVZNvPTXuRr2CWxVEJY83ECNnTH4laZmUE?=
 =?iso-8859-1?Q?hAMmLG37rlYec4cffjWOcQG/iVAN73f0G0GisOdHbCdWswCDKV/9GNMFtV?=
 =?iso-8859-1?Q?sEQLStmYDvu8X7uDDlF2JS4QBjTLzOHtfVs+6a+c/5RmKhu8U3jxM5Alhb?=
 =?iso-8859-1?Q?ZaXlcCzhF2Yf8sU+lHw1WCWdWB+2+Rp+T0xvMKTvIqTOHSkHpXFgyMzrHE?=
 =?iso-8859-1?Q?xCMr6MPMl/mUNsUqZ/7AK/PDC6UOq65DMLpCX2Bw2ZQHJV47DdCnMshCh1?=
 =?iso-8859-1?Q?UGVugmxMms1DZix6wv7+cULcDu3CJfc8b3w4PuvluS/KQQ8rvurghYODKH?=
 =?iso-8859-1?Q?h7Vo9HIbPu5+znD++/VjVd0aUa5xUnRa/dN8LhROlCturU155jc8HveHN4?=
 =?iso-8859-1?Q?N1flEPBppr46qdJFOBB0RjwYzGrtY/KfN2Rl/7PyjpHvMym39Dg01f5By8?=
 =?iso-8859-1?Q?4JuXVNPy6WbgTVKQ0XNFOvGXpgwzmacXEaHQ722rmDW9S8Thuz/UKay+tJ?=
 =?iso-8859-1?Q?HRFuwkigvg0Yz/3MHVqYgmJo9U5HtqEfJUaJo8PwV2OmgbfqAbDiOeNILv?=
 =?iso-8859-1?Q?lx4yTL9SAAraJ0lJVXQ+oMyReIWQVnXwD3U9m2Hn2YroMQIt6z+Q8RLydB?=
 =?iso-8859-1?Q?db/hh7hdGJ0E/4aE2DwvQRJT/nltqWV2edCJbPuwoBC5F1egvS8OdSGHDt?=
 =?iso-8859-1?Q?TRodX3r+yrrgcuidcMXEMJrtoi7gAxUvQZJzDwLWgEmA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c5hR8pIWFEvM66i0V8n9pLE9LIIzHOsSkkQvEhOmPRS8469zFvo8/a6Kd2?=
 =?iso-8859-1?Q?G8g34G1q1SkEbeYRoiDd4Cg0JMptpnrv6KxFgtO+UIxZmusSInzfvK84gL?=
 =?iso-8859-1?Q?7ZUY/Z81K2rpjsBl5WrqWqXw2g9cJpVcyOFDd3+NLJEFO4kIwBA3ZCJ/GL?=
 =?iso-8859-1?Q?3x11rp8YQEEvApFLHWxOdexfRpdnpnXMwX26TgOEFEA5ocCAgQlfa7//Je?=
 =?iso-8859-1?Q?2ZRVNApT7Pb0pwkK06yHqHcmfbh1C6QivB98cJzkqZV0BzVyWLiPV6x3bg?=
 =?iso-8859-1?Q?9t6fhqP18iKJokHU0EB9yIYyDyW3xakesrLB6xgniatOkzgQYqliw9F/6n?=
 =?iso-8859-1?Q?Bs8h0HM4oNI70jh7+WxNDjrunRS4v8SGMbH7C8IgNiHOjh3ldzoIghveFL?=
 =?iso-8859-1?Q?ruT8NMdz32GFyhoT8OmIVfhJsso087FdRJ2kFSfZZsbpNsCqLbHE0w4p/x?=
 =?iso-8859-1?Q?kSOa/hu8XRO4wfTjNR2beDacEbSPsXLj2+u22vrP6I/fTGDZaznDqm+e3k?=
 =?iso-8859-1?Q?U23JQcVHXWZgfgI8YJKfeKv2tWK17LWpLGCL7p5uwGOLow0zMEr/kjulHc?=
 =?iso-8859-1?Q?oTgCu/5M4KlTc7TZ4oVh8wt7QgLabiE3J+ZLpLNFK4sCGu+75F3z/02oir?=
 =?iso-8859-1?Q?gowlv/6yao+VCiZxsGVqaeHdKdHKSaxC2vx2ttiTKwLlcLhqbGsSPU7lwa?=
 =?iso-8859-1?Q?o3/clqG6JDceQkO0MjJ+ATI81DJUB3gy6i2XiMMqIcwjCcOM2u9dLzU8Bm?=
 =?iso-8859-1?Q?4mi7lo8ahG7KEU02U1z9vF8bVHsPIIjDX3WT2ji2ZryzfFk0iKafjZHeLW?=
 =?iso-8859-1?Q?itIYGyhbHl0xL56If02KoC6EaD8Gamiry+3QCJnR5Fcz/hl0jLAti1YZyM?=
 =?iso-8859-1?Q?mEhVsMgNOblKxBWas+4EiPfar/fNJK69gyDNQEVHzxOW+uK8WzWXT7IJ5V?=
 =?iso-8859-1?Q?elQLco2SbtncysNdwzKvx6mTMyo7XGg3L9sSMDXSxXkFOjHYzGRibsx2X8?=
 =?iso-8859-1?Q?bEzrSf5qPJdYtNn0FkjHqPq8/13ealT7+DDwkFLmkarE06/QGsOBZz5lZy?=
 =?iso-8859-1?Q?lDnmtOAcZb5HNBkUc+Dw/ZTKUOeGTfw23sNAlyGPqy9PqJ3a0IkvOHwuPj?=
 =?iso-8859-1?Q?YJL3bUyQQNZI31g+A7gD9gYG360ctkAdjP/Apqzf1Ovji49hAzH/bXqoS0?=
 =?iso-8859-1?Q?3BLB8nJ7TgrMc0fez/fA0Eat6rzFsVt7SGbmvpmoVCINdBU4mtUXpr9V1v?=
 =?iso-8859-1?Q?rHpeBHymx0eX/6Pih43nyl6o+PmG2XNIqxpH3cupS38czEF+VZkQPyy0Xc?=
 =?iso-8859-1?Q?J2D6sdayL/G90eTv8lLrSXhH5meHScCSTn74nHKtREHHqDRSGD+QiXXofq?=
 =?iso-8859-1?Q?5iAfJbGlEMQkfFVWjxysrkaA/yHNujwhsnJrGGdtzmzF/uwOfbxHyR4ihV?=
 =?iso-8859-1?Q?PRr8HRNgFLk91QoQBzLeul628DlZOrgh4TND1s30ORgQB87MEfE0LhHGLN?=
 =?iso-8859-1?Q?8iPRjB9v/3jR1wQeGn1hFINy/H509revNrb9yJNYtf5vMzT9aHcgqp7RBK?=
 =?iso-8859-1?Q?qBIwSDwEMzq5ZznYjrIcYp5QaEhGoFH9WnP4MDBZnsTAg5cONri1fHDmeL?=
 =?iso-8859-1?Q?wUWghT7fKgESZilU0QzcmrYngmSZLqrzMkIx48UweXy2S3ZNgi+aK7kw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391ebabf-dea2-43e7-c93d-08ddea60d7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:39:41.2969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PP3qQtK6sJKxiG3NyqTTmRb2DFD8p0WRCWQbofY1XvSz8REDlVCSUv22EgJhX2a7hGVCs3T3QClOEOOKIfkDX8HS77C9nifVhWnaSceQFhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7137


Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Store and restore active context and micro-TLB registers.
>
> Tested on R-Car H3 Starter Kit.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in V6:
> - refactor code related to hw_register struct, from now it's called
>   ipmmu_reg_ctx
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 +++++++++++++++++++++++
>  1 file changed, 257 insertions(+)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index ea9fa9ddf3..0973559861 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -71,6 +71,8 @@
>  })
>  #endif
> =20
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>  #define dev_info(dev, fmt, ...)    \
>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>  #define dev_warn(dev, fmt, ...)    \
> @@ -130,6 +132,24 @@ struct ipmmu_features {
>      unsigned int imuctr_ttsel_mask;
>  };
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct ipmmu_reg_ctx {
> +    unsigned int imttlbr0;
> +    unsigned int imttubr0;
> +    unsigned int imttbcr;
> +    unsigned int imctr;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
>  /* Root/Cache IPMMU device's information */
>  struct ipmmu_vmsa_device {
>      struct device *dev;
> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>      const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> +#endif
>  };
> =20
>  /*
> @@ -547,6 +570,222 @@ static void ipmmu_domain_free_context(struct ipmmu_=
vmsa_device *mmu,
>      spin_unlock_irqrestore(&mmu->lock, flags);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain=
)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->conte=
xt_id);
> +
> +    regs->imttlbr0 =3D ipmmu_ctx_read_root(domain, IMTTLBR0);
> +    regs->imttubr0 =3D ipmmu_ctx_read_root(domain, IMTTUBR0);
> +    regs->imttbcr  =3D ipmmu_ctx_read_root(domain, IMTTBCR);
> +    regs->imctr    =3D ipmmu_ctx_read_root(domain, IMCTR);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domai=
n)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs  =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->cont=
ext_id);
> +
> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resu=
me
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending ...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming ...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        uint32_t reg;
> +
> +        /* Do not use security group function */
> +        reg =3D IMSCTLR + mmu->features->control_offset_base;
> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP=
);
> +
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            /* Use stage 2 translation table format */
> +            reg =3D IMSAUXCTLR + mmu->features->control_offset_base;
> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PT=
E);
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_restore_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_restore(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +}
> +
> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +    unsigned int *utlbs_val, *asids_val;
> +    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +    utlbs_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !utlbs_val )
> +        return -ENOMEM;
> +
> +    asids_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !asids_val )
> +    {
> +        xfree(utlbs_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data =3D xzalloc(struct ipmmu_vmsa_backup);
> +    if ( !backup_data )
> +    {
> +        xfree(utlbs_val);
> +        xfree(asids_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data->dev =3D dev;
> +    backup_data->utlbs_val =3D utlbs_val;
> +    backup_data->asids_val =3D asids_val;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +    list_add(&backup_data->list, &ipmmu_devices_backup);
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +
> +    return 0;
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>  {
>      uint64_t ttbr;
> @@ -559,6 +798,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vms=
a_domain *domain)
>          return ret;
> =20
>      domain->context_id =3D ret;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[ret] =3D &root_pgtable[ret];
> +#endif
> =20
>      /*
>       * TTBR0
> @@ -615,6 +857,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu=
_vmsa_domain *domain)
>      ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>      ipmmu_tlb_sync(domain);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> +#endif
>      ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>  }
> =20
> @@ -1427,6 +1672,14 @@ static int ipmmu_add_device(u8 devfn, struct devic=
e *dev)
>      }
>  #endif
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( ipmmu_alloc_ctx_suspend(dev) )
> +    {
> +        dev_err(dev, "Failed to allocate context for suspend\n");
> +        return -ENOMEM;
> +    }
> +#endif
> +
>      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
> =20
> @@ -1492,6 +1745,10 @@ static const struct iommu_ops ipmmu_iommu_ops =3D
>      .unmap_page      =3D arm_iommu_unmap_page,
>      .dt_xlate        =3D ipmmu_dt_xlate,
>      .add_device      =3D ipmmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend         =3D ipmmu_suspend,
> +    .resume          =3D ipmmu_resume,
> +#endif
>  };
> =20
>  static __init int ipmmu_init(struct dt_device_node *node, const void *da=
ta)

--=20
WBR, Volodymyr=

