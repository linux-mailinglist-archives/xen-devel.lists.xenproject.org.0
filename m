Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FEB40E8C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107422.1457859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXYt-0004rg-7D; Tue, 02 Sep 2025 20:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107422.1457859; Tue, 02 Sep 2025 20:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXYt-0004pS-47; Tue, 02 Sep 2025 20:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1107422;
 Tue, 02 Sep 2025 20:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXYr-0004ol-J0
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:25:01 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5bbe793-883a-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:24:59 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM0PR03MB6308.eurprd03.prod.outlook.com
 (2603:10a6:20b:152::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 20:24:56 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:24:56 +0000
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
X-Inumbo-ID: e5bbe793-883a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYg20URorB5RWrCo5d1MCqPJwHGfDfzYm9DnUqjUc++QsLCmc512N8fqITCT5z8VOg+szVJilvo7S8eAWXlPCVVV7w+G9fqR5vIXh+mK3XbLyi07EYMYFN1WxJSo2qmU7aHQVhxp8+eLfAL0BRk3FG38XCM8LAwETky5JkK4C3oTVvTSLXq4lcDMhAIZs00GEMrtXCF3oPmey8PUmgck89GGOEzF4ylFdl2zZtpt23moav3xaL7SC8hrfs3th6L6Y6T3y29MSyyyMKMH+JXM+QgydPou1INiqfbXAXH94+hakFt9jHW9E/sj3bgJGFDSyx2mNU3BQJ5McsEdtLpEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiaST0ehVkbNnNRoWfpImv+RIARwbEGB6zRzp/50Fy8=;
 b=dEuKXk9XMM8SZ+gaxcSR8foENeZuHpd5LdR1MAavH2Rj7qGrqU763aUUXOcCsDIkfP17HqH1xk2B3dtJn/ltO5U34uiFLC5fL2K56IfC0qNgNEwINfzDVE3GTHSHqLVdG16eEc0esXuu11ftOsRbh2//mLroO0SwJCqOUgyUtgQo+kJEZ2KzfS9TfBm15E6tL78fQuaIQikjxulDTnpRe8G2yD0ZE+Lz/h9TFOYWUmRGLKtNAGmf2TdPFNx+1oxmHrxReRMnNzhKLUn9UIPiXUkR1hnkLp5fPLjPrqUMTkHAxjRjS6uYfjVFjfsakVIVF+hOd3j5NumSbYcJaAaNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiaST0ehVkbNnNRoWfpImv+RIARwbEGB6zRzp/50Fy8=;
 b=Rp8IQsVNOqQzAvUyPuVeglC++gQfxi8GABu/47ybjXBGm2DYYkUtsfnS08cFHH8bTZLaBVerbB4cmut9L250kx+rls9N2JNAFIziffx0I9XzSvYPmmhwyRecN7BYLqMNakGVxjVf60u1YkRoJDkMmiMYW3v7PiwPxsPRfMAPyAVuRBz7gSMU4mLGaI+B8QPa565Zh/O1/Ra1Uu/yJBgF0rMCeKtCU60ORblKf48N1+zUboC/jcZX7/kEq8HdXbwugv3x8qOfZs83eVHut704YIoAU8vJkTZYgYE1xJtXBBGzk0gLeKbHKC7dJ07UfdyatqcFzg74qwqO2iOIbnw6Zg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v6 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v6 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHcG4064D97SFCG3kWQLRIi5MFCzA==
Date: Tue, 2 Sep 2025 20:24:55 +0000
Message-ID: <87bjnswqjs.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
	<c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
In-Reply-To:
 <c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 2 Sep 2025 01:10:06 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM0PR03MB6308:EE_
x-ms-office365-filtering-correlation-id: 84213983-04bf-4477-23f0-08ddea5ec801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KO/vzXUEEcqhbNs14weiPoVJAGjL+2tbXEpA3og0vfrbt09oVgAbX1p44l?=
 =?iso-8859-1?Q?JtudJtqcRf24xBiFzWaPlXk+8AIlK6z08SQ7lfZvaRtMnj70jpqA33OvAo?=
 =?iso-8859-1?Q?vKyfv9Q4qzfU3yJmSjfP1Fodur/L86Gn2xNCXOmtCc/WYlY94cBu77pRwv?=
 =?iso-8859-1?Q?LGkpug0PzOkQXcaQAxUKHwaT7Ceo9Ye8l8ICUd6Kq9QbrXAU++V2j4B+HQ?=
 =?iso-8859-1?Q?/Dz6DjA2hEb3//jxEUaIPRCuUI77htJzIWwjEfc8+Sv3q+v7CS/Sd9qCyd?=
 =?iso-8859-1?Q?FX+Rr1QAv7yVrRXszm7sBJyTTHNWd/fJ8OXOb0v3oWwWhOd8jX3rfTbKpJ?=
 =?iso-8859-1?Q?QKy8zKQn3auxgMhQxgXAAHmc3ViHQeNwWD1PAImbiwZHybptj+ydogi8TO?=
 =?iso-8859-1?Q?8y9aiHdjTlRMabUOAo9hZuYUgt5mfzvjeW2kq9UkSEpKrESwwf9/iHEe7I?=
 =?iso-8859-1?Q?RJafPYtWoXYS1s89AV/qUUquy5MZtfMcTkCR7Kddh9u+OsxyIuMf4BhvfP?=
 =?iso-8859-1?Q?vji1kxFrxNoxWsyxC/xpWhiTfwS+RCXB9agRCRU0XOMd77pGIyUumVE2uC?=
 =?iso-8859-1?Q?y9eKszbNJAAjW8j6vUpS5j0OVXdkXiES2Vn+CMIMUW8qqg0dKdlg83Mmuw?=
 =?iso-8859-1?Q?IHHx4Spw6lBhpPfFFkTcxrP+hWYUoavLAmQ7c4ES83dWGYmGoeyva2iXyi?=
 =?iso-8859-1?Q?5QxE66JbY1NMcQ+CKnMO/SEFoh/nYwNrMitaobjFsS3yy4zaXQSivAq/1A?=
 =?iso-8859-1?Q?/jTTfczSQtra869eh8AzdIUSa3nOZKOe07Y9XyRraSPbGYTs/xlnLy65Jt?=
 =?iso-8859-1?Q?C0A8uAlFMHbNR6nRK+4ubuR/UQt4FMiT3WxR91BgBSiin1XERHdjO4ZvlU?=
 =?iso-8859-1?Q?krX7NzzBIYg0oqEa9MdH54mF3Zs/bxcqKKtOe15tDiiRPTRQIQRkkOeru3?=
 =?iso-8859-1?Q?uS5xse0Ju24r7n2augZPbfqiFggPkW5daYRSNwenyhttOucYq6dEXAwK+d?=
 =?iso-8859-1?Q?VVYa0rcQlpQiW8bYlmzeOCw6GpDeQrdOJ1yNfOSi8yQSzLpopJFVYafGUZ?=
 =?iso-8859-1?Q?C1kPvGkDJqHyr4b8aAjKa9OhCM9qkdNU+ZlilpUGquDPFs+c3hCbM90EM1?=
 =?iso-8859-1?Q?M4V1A8U5TqeoL5TF3Q3Frgo4B0Y5QSYsuJlEyuksqqj5G1ZrfWsXI2c4Cw?=
 =?iso-8859-1?Q?Aqic7th0kBaWPLeiObns73fEXFZOaxCBx+2Lo5HsuLYBENTsNOfev3etjR?=
 =?iso-8859-1?Q?FmPrZ+hUFeXM/KXjli0IquxXoB54ZZCUQn/mSYLdgbkShlC1eMYrn/zGfp?=
 =?iso-8859-1?Q?WNNJxMHgAwbjmb1JXdViMQwUaNa+I7rZ48XLlYmm2er93tOrDDSdTWgTvu?=
 =?iso-8859-1?Q?jgCH0LQcqqE6cCMyVBQL6pTQMOj1D2puef5loFp3+11lVXE0RdmCLbwg5s?=
 =?iso-8859-1?Q?AgMTGpR2YdSk7CICQUJVm+PPY0LSkTXYXSKKHxcS+9Z5r54tsPxPyM6RPx?=
 =?iso-8859-1?Q?fb6tA3k1jkq56gjICNQFJ5u4R9zfhxL1Fcoy1qjHclaw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oSWU/7K+OriiLJYjtSmh3gEE5Bv/52finQ1Ckgx8mFfKHGRMpeqd85aeEX?=
 =?iso-8859-1?Q?ezykyJtwymT/RzRJPxh1TOmGKq7fXbAp5M949xsFJNeJSrfmuP/yk9zF6p?=
 =?iso-8859-1?Q?xOaX2Tfwz5587A2lhAH5JQ2enEGVc+v9SPxEjhW0Tei3QUz2ZZmYvPY0Rc?=
 =?iso-8859-1?Q?U2ZgV9T7nHuw4ULEpeGzUscn95ddBT2KjBHHZA1fXGIx7YP1fOpfvFzsal?=
 =?iso-8859-1?Q?PHTDv+kpNPIk/jFnFeJVUxZ7msGcYkyVUBfBwf7+vRuiM1kfKcFXL4uYKw?=
 =?iso-8859-1?Q?WhV1ICFdNBiIm35aSqyje6Tek1O7yr4k8VToVXx9IRFAXt3oi/838HMpgm?=
 =?iso-8859-1?Q?w2u6cjPcauvd4Yz5QdjTrVQy+5YjR14eTD1jAAGXaI0xeviEkvpZxYIloX?=
 =?iso-8859-1?Q?XlFiVEfPtWoaQBS3m1iIpsdt/LxWC/NPgEHnl8jU4X3SfWA3jxRCrYT8Ci?=
 =?iso-8859-1?Q?FAOKw/cqkHTg3IfAxZqjGbwieAHBxN4emfutt0QG1C+we7VcUtE0J5P9Cc?=
 =?iso-8859-1?Q?N7MutWPNsB+qyqueURgLYiZ1xT+Uocwq9sRymvFG6WmcGL+E5cEMsiQoKs?=
 =?iso-8859-1?Q?O28489zd4E03rJNQIjcVWo8SxmFExytEmPlWgh5Kr62+rm+naGAmtumAPr?=
 =?iso-8859-1?Q?dmplqZF7GPYAjJBPPTb7YykkoTYuQ9QTWtlQB+uaTs4ZDMrewMNhPJIc2F?=
 =?iso-8859-1?Q?DC+QyP/S91iYXKOGpxDHTjTCddNfg5l5QdOebSQjj1Jt6fA5JSaWgaZxu+?=
 =?iso-8859-1?Q?U9axtkIZLfrfaRJgBwJBobXm8mDvUJqrzT0SBNAidPqBGl1vqcn6EkGSBo?=
 =?iso-8859-1?Q?5ubqwldusw3U3KdYayBbMhlC12aFDqWKTxAADrImokmjCTZBLdc5DTruQJ?=
 =?iso-8859-1?Q?ilfBxjyWegltGbq8QOGW/eQvFBk32nFXEdIFcMC1rT5vROGDFT9uFMLOYB?=
 =?iso-8859-1?Q?Mak+fd5L7Q0XTlV1LLbT0cXGLKUvZNXmDmqhamFpkgo9Mx929HW/PGsi6B?=
 =?iso-8859-1?Q?cuc3+qT3uiXgRQj/ufnhbxhBMH0g7Zvw5rUeHAKVNS1z6EQWEKZmKQhwea?=
 =?iso-8859-1?Q?N+L1qdPG+ERJUM6vKIBBbpB+hjJdKNJDNw17vBxpmlXbBtCiBRKepAAMHr?=
 =?iso-8859-1?Q?uZ1A/rze69RY4mddYYGFImg3slRewXRkoBmyB5KWDkUH5ClgnyLdWHMO0V?=
 =?iso-8859-1?Q?D1aFozTRFFWvYbWs0C5WRT9squN528plDfH2Ikimk8iLZ3O8czaG3snUOC?=
 =?iso-8859-1?Q?t+MCYbN5Wf1jt1A4jpcyPtlEjfNql4xr4OpB4y6UDTveeuUyC90dI8bxAK?=
 =?iso-8859-1?Q?CuY3x7riNg8j4/zdNIbIP9EAppAqAZnfmv9ZKPxqDCQK3aTgmUOX4QSiGo?=
 =?iso-8859-1?Q?LPX9H2WLBmkLT14884qDVlaI4S8hh857cZn+yOxwsj2Tqvz9rQ9XMLLvIo?=
 =?iso-8859-1?Q?SU9yxBYvaKGLI0HjyRqMYPgCam9Xj2ikEauDjRiy79UQgE7OA79Wz/3n0D?=
 =?iso-8859-1?Q?kcRNdBwZpXaTHoQk3QK+Kyf9dFP6cd8d5DB56+zkvHrHgq14NjC/ASlYx3?=
 =?iso-8859-1?Q?GWGGFEG3lpXRPgZAM8a1kdDXeCNZaXzW1eagTmh/N7Z3BWMVo7rDexVPUI?=
 =?iso-8859-1?Q?rmciHX2D4uYY6Q2dnvtgJbkh6U7MXwz38VsMJe73AduFx4VJq678Ajww?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84213983-04bf-4477-23f0-08ddea5ec801
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:24:55.9512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kGzLQNZVVJtUovtLsXGuSoUaz3IWJAUlc7YpHO6EG9S+rjiIFRci6+kljcBxSOspoIlA3p9qxr3ZTvgqmnXZxDPDuVqDsJwYOW//kRGSTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6308


Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v6:
> - drop extra func/line printing from dprintk
> - drop checking context allocation from resume handler
> - merge some loops where it is possible
>
> Changes in v4:
>   - Add error logging for allocation failures
>
> Changes in v3:
>   - Drop asserts and return error codes instead.
>   - Wrap code with CONFIG_SYSTEM_SUSPEND.
>
> Changes in v2:
>   - Minor fixes after review.
> ---
>  xen/arch/arm/gic-v2.c          | 143 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/gic.c             |  29 +++++++
>  xen/arch/arm/include/asm/gic.h |  12 +++
>  3 files changed, 184 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..6373599e69 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1098,6 +1098,140 @@ static int gicv2_iomem_deny_access(struct domain =
*d)
>      return iomem_deny_access(d, mfn, mfn + nr);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
> +    uint32_t gicc_ctlr;
> +    uint32_t gicc_pmr;
> +    uint32_t gicc_bpr;
> +    /* GICD context */
> +    uint32_t gicd_ctlr;
> +    uint32_t *gicd_isenabler;
> +    uint32_t *gicd_isactiver;
> +    uint32_t *gicd_ipriorityr;
> +    uint32_t *gicd_itargetsr;
> +    uint32_t *gicd_icfgr;
> +};
> +
> +static struct gicv2_context gicv2_context;
> +
> +static int gicv2_suspend(void)
> +{
> +    unsigned int i;
> +
> +    if ( !gicv2_context.gicd_isenabler )
> +    {
> +        dprintk(XENLOG_WARNING, "GICv2 suspend context not allocated!\n"=
);
> +        return -ENOMEM;
> +    }
> +
> +    /* Save GICC configuration */
> +    gicv2_context.gicc_ctlr =3D readl_gicc(GICC_CTLR);
> +    gicv2_context.gicc_pmr =3D readl_gicc(GICC_PMR);
> +    gicv2_context.gicc_bpr =3D readl_gicc(GICC_BPR);
> +
> +    /* Save GICD configuration */
> +    gicv2_context.gicd_ctlr =3D readl_gicd(GICD_CTLR);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +    {
> +        gicv2_context.gicd_isenabler[i] =3D readl_gicd(GICD_ISENABLER + =
i * 4);
> +        gicv2_context.gicd_isactiver[i] =3D readl_gicd(GICD_ISACTIVER + =
i * 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +    {
> +        gicv2_context.gicd_ipriorityr[i] =3D readl_gicd(GICD_IPRIORITYR =
+ i * 4);
> +        gicv2_context.gicd_itargetsr[i] =3D readl_gicd(GICD_ITARGETSR + =
i * 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        gicv2_context.gicd_icfgr[i] =3D readl_gicd(GICD_ICFGR + i * 4);
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    unsigned int i;
> +
> +    gicv2_cpu_disable();
> +    /* Disable distributor */
> +    writel_gicd(0, GICD_CTLR);
> +
> +    /* Restore GICD configuration */
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +    {
> +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i =
* 4);
> +
> +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i =
* 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +    {
> +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + =
i * 4);
> +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i =
* 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> +
> +    /* Make sure all registers are restored and enable distributor */
> +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
> +
> +    /* Restore GIC CPU interface configuration */
> +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> +
> +    /* Enable GIC CPU interface */
> +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI=
,
> +                GICC_CTLR);
> +}
> +
> +static void gicv2_alloc_context(struct gicv2_context *gc)
> +{
> +    uint32_t n =3D gicv2_info.nr_lines;
> +
> +    gc->gicd_isenabler =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isenabler )
> +        goto err_free;
> +
> +    gc->gicd_isactiver =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isactiver )
> +        goto err_free;
> +
> +    gc->gicd_itargetsr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_itargetsr )
> +        goto err_free;
> +
> +    gc->gicd_ipriorityr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_ipriorityr )
> +        goto err_free;
> +
> +    gc->gicd_icfgr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
> +    if ( !gc->gicd_icfgr )
> +        goto err_free;
> +
> +    return;
> +
> + err_free:
> +    printk(XENLOG_ERR "Failed to allocate memory for GICv2 suspend conte=
xt\n");
> +
> +    xfree(gc->gicd_icfgr);
> +    xfree(gc->gicd_ipriorityr);
> +    xfree(gc->gicd_itargetsr);
> +    xfree(gc->gicd_isactiver);
> +    xfree(gc->gicd_isenabler);
> +
> +    memset(gc, 0, sizeof(*gc));
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  #ifdef CONFIG_ACPI
>  static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain=
 *d)
>  {
> @@ -1302,6 +1436,11 @@ static int __init gicv2_init(void)
> =20
>      spin_unlock(&gicv2.lock);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Allocate memory to be used for saving GIC context during the susp=
end */
> +    gicv2_alloc_context(&gicv2_context);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>      return 0;
>  }
> =20
> @@ -1345,6 +1484,10 @@ static const struct gic_hw_operations gicv2_ops =
=3D {
>      .map_hwdom_extra_mappings =3D gicv2_map_hwdom_extra_mappings,
>      .iomem_deny_access   =3D gicv2_iomem_deny_access,
>      .do_LPI              =3D gicv2_do_LPI,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend             =3D gicv2_suspend,
> +    .resume              =3D gicv2_resume,
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>  };
> =20
>  /* Set up the GIC */
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..a018bd7715 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -425,6 +425,35 @@ int gic_iomem_deny_access(struct domain *d)
>      return gic_hw_ops->iomem_deny_access(d);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +int gic_suspend(void)
> +{
> +    /* Must be called by boot CPU#0 with interrupts disabled */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +
> +    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
> +        return -ENOSYS;
> +
> +    return gic_hw_ops->suspend();
> +}
> +
> +void gic_resume(void)
> +{
> +    /*
> +     * Must be called by boot CPU#0 with interrupts disabled after gic_s=
uspend
> +     * has returned successfully.
> +     */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +    ASSERT(gic_hw_ops->resume);
> +
> +    gic_hw_ops->resume();
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static int cpu_gic_callback(struct notifier_block *nfb,
>                              unsigned long action,
>                              void *hcpu)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 541f0eeb80..a706303008 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -280,6 +280,12 @@ extern int gicv_setup(struct domain *d);
>  extern void gic_save_state(struct vcpu *v);
>  extern void gic_restore_state(struct vcpu *v);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/* Suspend/resume */
> +extern int gic_suspend(void);
> +extern void gic_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  /* SGI (AKA IPIs) */
>  enum gic_sgi {
>      GIC_SGI_EVENT_CHECK,
> @@ -395,6 +401,12 @@ struct gic_hw_operations {
>      int (*iomem_deny_access)(struct domain *d);
>      /* Handle LPIs, which require special handling */
>      void (*do_LPI)(unsigned int lpi);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Save GIC configuration due to the system suspend */
> +    int (*suspend)(void);
> +    /* Restore GIC configuration due to the system resume */
> +    void (*resume)(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>  };
> =20
>  extern const struct gic_hw_operations *gic_hw_ops;

--=20
WBR, Volodymyr=

