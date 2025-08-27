Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0FB37609
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 02:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095354.1450407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3si-0005aq-SY; Wed, 27 Aug 2025 00:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095354.1450407; Wed, 27 Aug 2025 00:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3si-0005ZN-Pt; Wed, 27 Aug 2025 00:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1095354;
 Wed, 27 Aug 2025 00:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur3sh-0005ZH-IH
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 00:19:15 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76446d5f-82db-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 02:19:14 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GVXPR03MB10457.eurprd03.prod.outlook.com
 (2603:10a6:150:156::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 00:19:08 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:19:07 +0000
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
X-Inumbo-ID: 76446d5f-82db-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtRECZ9vkvHeDB3W3PM6lO9H5Alz1leZ2NIPDSYsOOIkgLdthz/u3CehDbUZb22Axo7h9cJ93ZZLhGa/whV/0bNolQui9KSjoJpvWr77VLAOasSrXQK3zcPqKLKBKeqOt0L07Re9mifZlp6NC/gEI0YQRJE+kv2h3k/9Q5UymBY8Bp0jhCxXLrYTD46jlJrO5DoQC2TTaRnlo9qiOQU56oRCFPCrIj12ozpTRq8+k9rfmHA9eTuol/+J3leaAQBloLQtviULmbRfymlj3gW79byFKtnP6GtZgUZlK617whcR7C7LXF6tOQv29e3vQcQQJawAn7FnrS7dMyN+vzZ7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr71aB/kHUl+qZczs297RTTR6ScXudXbw0EeAD+Ve3E=;
 b=xAJHg4yOsJjRmF/U6MmqqR4R4AErIqM0DfOqiHZsTkXPqBZURieJG/+ATg0EUnUNzGzZVTtn4IJ3H8OCK2d22koDLFposA8wQWWZsmcO6enlPiuGwzftIEwXNzKEAqyUHv4L5klJuL2SeqS23U4j8yOfBKDBX5Zy9ix69YFXqisg0mNrTfWtkw1InNaKPNi0B9RGDJ6c7Prl5ny+WJ1PN+IdSacSkDnd8sUjb5NyZl3xpMUWzcpvX834eIk+cqxkTA4FO394dlIyEJnSb3FGzRovsQGzGS/vZoyfa3giwPJDDvZc1quO0JKQbjFTXLHuiu70EtByT4DmR8q+2UuyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr71aB/kHUl+qZczs297RTTR6ScXudXbw0EeAD+Ve3E=;
 b=IiE7knh/r+Us7ThXhApGA5+URGZyXcLXWRA74BAr03FJM63mFTS281qClgpdNixrajyRLoFSuiMpF5AFTSCSGVLsMBm0Ue6jfbK6AwCqxI24+tGDyzkdFkzX7J4N9S8uCpY4ljWvu/dB2B0n874KX4AVBWjhV8BNVbzo8u+xXj9VQEydMEl4UZnqPs03Y441cYYvxxpMlnktsNMUCknUe9YwbXGEca0FMdAKhsNDxZWN40FAIk7gpkE9wCTVZPHWI+LxSlG5ylUVzesdbccGqlJb2uhM1FQSNClI3n+KNePVJTtRjTOVXZ/8LR5h9XSr46AYK6ZVJQpDVsHXZf9ZVg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 4/4] xen/arm64: constify is_32/64bit_domain() macro for
 CONFIG_ARM64_AARCH32=n
Thread-Topic: [PATCH v2 4/4] xen/arm64: constify is_32/64bit_domain() macro
 for CONFIG_ARM64_AARCH32=n
Thread-Index: AQHcBrdwDd4mYDTTDkqkhQfu8XlSDA==
Date: Wed, 27 Aug 2025 00:19:07 +0000
Message-ID: <87h5xt39c5.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-5-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-5-grygorii_strashko@epam.com> (Grygorii
	Strashko's message of "Wed, 6 Aug 2025 09:49:43 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GVXPR03MB10457:EE_
x-ms-office365-filtering-correlation-id: 01ad716a-bf08-4608-96cb-08dde4ff56a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MvZZ3tg1K18LFEgvSYGtKQlWT3qANj9EymJsB1jrneBecobjrsWSYX36aY?=
 =?iso-8859-1?Q?0Ybz5yP3t6XzNIfJXXa3DIy1SEoW1b/TMDHa8ZejZHsGrga4smgxc+HJ9F?=
 =?iso-8859-1?Q?VI4ah70awkPeY5xK+ZmVNyXjBFM/2+Qca1QDDcaaoXxDMnHek8uHYbahGr?=
 =?iso-8859-1?Q?wQDFGH7ldWVsTJ/DZ9cLaN+H8EVC6OMloKYEPYITWMaDU6DU5NI73IwZYc?=
 =?iso-8859-1?Q?yQLrv1AAG+Wt7q6upQYASV5snZ4W2hfMOM5lBIbZWB4nadxRaoAqBryG3M?=
 =?iso-8859-1?Q?LNEARk3vs7PefSsXgtdfPSKsqq1ii3X8xiUeB3ime+89omF2hYjSpZfCFx?=
 =?iso-8859-1?Q?4H75yUf6XAsf5daoFcIKVFYbW6JIA3KhNLG2Xl4LYxuQ09TLhi2Z/cDb9P?=
 =?iso-8859-1?Q?naYi8Un30axCh4TgwX2CYsSNFKEayRiXtdgZkCwY6vDhwYs+mH/OF0RQQe?=
 =?iso-8859-1?Q?ARKWBWe8uPAiJoEN6eg5EGyBghWRhvqLPLPSBAbV/n9FS+NCza01ZW8146?=
 =?iso-8859-1?Q?jYDmzNIORAdpcObt4G4ayYo9Z9FMHEuKcF+UDaA8Ky25qTODi6/2vDQuxm?=
 =?iso-8859-1?Q?o6JE1l906OTNDpkP+j5KRilO5QomRBm2r2TJ7TttnzHPwIq7EA6L6/BVd/?=
 =?iso-8859-1?Q?X6quOd5KTdkzLgTsFVUFiVYYGqserJURqhtxBUmG7UlUYdVlJ4/AZ536Pb?=
 =?iso-8859-1?Q?mym7c/YXEnxodu0TcyGxswtAG5c0xgvwdo1KFWMaGNyNP/QsfjiE/XCV5h?=
 =?iso-8859-1?Q?OwhO+8Jecllh7Kem6IYHTwz4c7/0M4G0AG1kUQxLCoOtt7rbCWE4O2Ts7l?=
 =?iso-8859-1?Q?beNDeLiJ+jAJigiy0vm2DHnIm/3ckpRt+bqV4Dk4UqmFCiTCggfS3THkI4?=
 =?iso-8859-1?Q?hZEZQn15kK3CQlmPqKFN9+aZ2SbGt2JOyPg5NWJpJaI26q/75dwraHZ8Lu?=
 =?iso-8859-1?Q?cHVB8arsaRAMeaQ9jSK9xMdPOhz0hWI5wfEe47Ws4YmlIDGYBbcHVJfWri?=
 =?iso-8859-1?Q?0C7ZiY8CbhgdMssKIdR/9UdDuYa4RKVdi/okSBx8o7dVxP62I3wj1nheQ5?=
 =?iso-8859-1?Q?oqXBLF3T3Ae7vcfQ+YaCUFplQeIBNXfTfF5uqfwG7g3Ll/Od/KUg4itwiJ?=
 =?iso-8859-1?Q?VpKfWuZbHQOC5iz5gNl7GmbqVGlDYFXZwBFbD6WlNJD3eqyaOUzzaC9Qsw?=
 =?iso-8859-1?Q?BKMW4P2X7pp/Kzm1YvPIeNMshwEF/DvZiZUTasHNK2ZKL76roDdZ/cRjPz?=
 =?iso-8859-1?Q?1QYCEhv+9t9eh7fsFnSEEFHPfoOmegPKtTRU9SnNRxA96KmgRZAT3W+XS2?=
 =?iso-8859-1?Q?x/nDmwiLa27dAbQjiUZITbizxlcWuKcQgf4sNChP0GejW8BTNxZk3LvlKF?=
 =?iso-8859-1?Q?OJ0h+UUUc4ZC5VJb5T4XDtVIiyz/01kIAdFpjlceBnCEwQ5eIsMgadw5l/?=
 =?iso-8859-1?Q?/J3HvsHV3Dp/s081fbyE05ZJSdi40PP+E1ERt2DaHdFI/C1zN/1ItCYsPY?=
 =?iso-8859-1?Q?9q3u4Zt8WDks1kldMN+8WPYU/liJ4OThUk6cbLVNYqo9WWxGBXHRqKd1Uu?=
 =?iso-8859-1?Q?ZwfP3TU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3F/hpYjQug1ULWWvrxfuCv+j6s8yUwxrZf1kWOwulXZbFcPikAEiCFnaVy?=
 =?iso-8859-1?Q?DboYSWRuDoeJEaHzwTzCVc9r9xbVZpjnFOrZ0erkeKOv/TdkpqAfkAwRiQ?=
 =?iso-8859-1?Q?Gh/f/i4GmAH3WMcDCXi4vCqAhc7P6EDGoYnnyVAoxJqhco61eybAHRjHF/?=
 =?iso-8859-1?Q?6gr00SSOVkg+42z1hjDecrGETRaPeusWndibdqefB7oJrFNKkEUIxEHb1l?=
 =?iso-8859-1?Q?C7J0RJ1jfQ1PS0CYFqKoSi4jb9jp7WymcBT5Y8fXRdhEwnkB1t9I25I9+d?=
 =?iso-8859-1?Q?XVI23/AVEB/JmvjXeEYoQBKLletu9lWI3upcjW/qDJupKa85flEfcARa90?=
 =?iso-8859-1?Q?30J0IaINUHt5oPcF/kfIasxmVs7Om32mKMJogpiqeoYdF5N0GsunSiPJQP?=
 =?iso-8859-1?Q?hljELB+Voj/5aVRz1NKndUHBT3pogjEehCxssRF2OEDxGRqFIoPmKicfNU?=
 =?iso-8859-1?Q?W3ZMvMSQkH6HLBa2iit4w2CmuHmdZpAT8nQOpcvPGNgDEMeHtU6sP5roV/?=
 =?iso-8859-1?Q?xnJhFPI8caeaGspbDTTsZZ8PcYTe7jwePK/ulnLnN51c7gbYelFQNt8g+e?=
 =?iso-8859-1?Q?OHK56MdIUaqgr1R0E+wDTzOnJ6rkJc7RnH9eRPvPZmO5VTpykiocgYF5hd?=
 =?iso-8859-1?Q?xrjxMNtOxddSyKGm8RDRGL/f7gkjXKdL/FLPXQRxUxejQTFc0kFAfEDZbk?=
 =?iso-8859-1?Q?I0jgIB/AR+nDKAoXeKTCCMHy2X3WOeG5V4ZEdOL+GAdZ7b8t63EVuavbZ7?=
 =?iso-8859-1?Q?i3DzawqtrxBV1qV1T08CwcVsQ34ulzM/wO8eFACfM8SirG8wNopmHDV2+1?=
 =?iso-8859-1?Q?2bojq3mRP3MSzmYJaDdJb0+0RpFSZseBZ+YJKKHWZmzen3k6EqzxzdO4RI?=
 =?iso-8859-1?Q?JaCmlQu9M0/akJ9guzj9vgOdWvZhRqAx01mzukaqgm/AnQB/lfGG8Es+Ix?=
 =?iso-8859-1?Q?bBcP2o9Cngq+avQG2Q/fnQBuGQTPKVkJ+EpMRHjTWG1wpnQX5lijStHrG+?=
 =?iso-8859-1?Q?hM5NBEtb12zBHTrn0Cf0Ci7LVqWnbtur016B69agGxCa2Rcw7lL/8vk6Rf?=
 =?iso-8859-1?Q?Kyrcl7hoglh6nzyU0jiYYgPBUCdNbm8mT71BICrxTHjyrM1R0QTL3Sl3+B?=
 =?iso-8859-1?Q?J9NYzPBg0A2xUFVdzyCRolZ5MWUd4Fks698w7BIsPNFnBnBg7TwitatgUW?=
 =?iso-8859-1?Q?NduRocQlOqxkDt4iYMm2qU/KepYEfAHPnlQOG0zBtsCh+e6ewlBXlc5btq?=
 =?iso-8859-1?Q?Ij44clfssZPO7lG1JGcQW2QYwqhLskCxVUFYv2sNlkZ77O+Dvbzl6Lo8mj?=
 =?iso-8859-1?Q?iygA7/XVXiW0AW2g9syH4w3pyLiesRoLDNVA1VNCeFgildHQKTMVZKvyrs?=
 =?iso-8859-1?Q?QGslFL8kfnSBZzlWpi2Gy6rehJZr9m4RA/m0palL7LKGkK2KtODdRntDlr?=
 =?iso-8859-1?Q?HsRUqkDNkdmG9mOaniS7ct8aqz5yCJRun7TTf9G0NJZ1AAZFKV33KLzmGS?=
 =?iso-8859-1?Q?u96DhNI6FZYhDxZawTsNlvqL/KOTNCqAlzRaouQpyghwlFdVnjDZqiWQI/?=
 =?iso-8859-1?Q?t+sQx4ilJxF3q3jpgBg+QHyyI8DNw6TqhwXx4IBPLFbjFpNYTqiETm7FJU?=
 =?iso-8859-1?Q?JGE9p/qAdicnw1RQCDtrMir6vHaoWbo0DlIb9t/uqrH6Ft4GNJa3ESBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ad716a-bf08-4608-96cb-08dde4ff56a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 00:19:07.7126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifr5eqXK16MxoQvR8s7icBHGDUI+WzS2s28DjuHmHORgNpHG8TdN8velIHUyg2+/MdRJEBLEUIeA7MRA7/AOqvRRq+YykJ60u5aasrbKrq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10457



Hi,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Constify is_32/64bit_domain() macro for the case CONFIG_ARM64_AARCH32=3Dn=
 and
> so allow compiler to opt out Aarch32 specific code.
>
> Before (CONFIG_ARM64_AARCH32=3Dy):
>    text	   data	    bss	    dec	    hex	filename
>  859212	 322404	 270880	1452496	 1629d0	xen-syms-before
>
> After (CONFIG_ARM64_AARCH32=3Dn):
>    text	   data	    bss	    dec	    hex	filename
>  851256	 322404	 270880	1444540	 160abc	xen-syms-after
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> v2:
> - use IS_ENABLED(CONFIG_ARM64_AARCH32) instead of ifdefs
>
>  xen/arch/arm/include/asm/arm64/domain.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/inclu=
de/asm/arm64/domain.h
> index bebcbc582f97..70dfbeac7443 100644
> --- a/xen/arch/arm/include/asm/arm64/domain.h
> +++ b/xen/arch/arm/include/asm/arm64/domain.h
> @@ -12,14 +12,16 @@ struct kernel_info;
>   *
>   * @d: pointer to the domain structure
>   */
> -#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
> +#define is_32bit_domain(d)                                              =
       \
> +        (IS_ENABLED(CONFIG_ARM64_AARCH32) && (d)->arch.type =3D=3D DOMAI=
N_32BIT)
> =20
>  /*
>   * Returns true if guest execution state is AArch64
>   *
>   * @d: pointer to the domain structure
>   */
> -#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
> +#define is_64bit_domain(d)                                              =
       \
> +        (!IS_ENABLED(CONFIG_ARM64_AARCH32) || (d)->arch.type =3D=3D DOMA=
IN_64BIT)
> =20
>  /*
>   * Arm64 declares AArch32 (32bit) Execution State support in the

--=20
WBR, Volodymyr=

