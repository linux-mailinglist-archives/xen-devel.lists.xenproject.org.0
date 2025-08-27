Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F1B37615
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 02:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095375.1450428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3wc-0007in-Jw; Wed, 27 Aug 2025 00:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095375.1450428; Wed, 27 Aug 2025 00:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3wc-0007fe-Gl; Wed, 27 Aug 2025 00:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1095375;
 Wed, 27 Aug 2025 00:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur3wa-0007fW-PB
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 00:23:16 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061e644b-82dc-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 02:23:15 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GVXPR03MB10457.eurprd03.prod.outlook.com
 (2603:10a6:150:156::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 00:23:13 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:23:13 +0000
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
X-Inumbo-ID: 061e644b-82dc-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1kjvEA00j3sEPP22SDtYr/g3lo66z0HfCzDg8s4A5C8MrpJFBoLSYA8CBjWUfVkQro7a7b1uDxXEcM4UGWxSF+4sGq+Zy4VI54RBJqg29mHKrjm6Wu2kVmw82iFUTXVZBQtfn0dKwTYW4oi4iFSlMBIWKsU3IliC990Fq11xWunTb8N6fFhOv+LBnm0Ez3YfiGx+PY8uDVTO5kpDLu34JaKDAD6bBfyR62d0OYaD2Ou/zcYwFC+EeyLhq5q8TTPp5SCNnCuSsFSAVC/y7cHUAQSa9dY7BpJWHGhWteNnUQJi37VYDg96RhEgZUrajnekc894cM6VRZAmKMYMPPb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEtG11dicL76z7ANfatS456H8ipnPkrKnEv7LBElCpI=;
 b=jXH1dt9rwUu0MSWqAaC4yvbFiT50vy06ngGsbk/xFbeibstgjG5A7E/b2OyBWScPB8bU8uVbOze5ts6L+27/pevjUs4T60y/hFTK5FsvvCAQECLTkubDl/4ltnaHpR1SHaHsCvHpJiRcHrtYbWGK96l4o/8TqKCnlFP5srav1wRe7oB3zWxNk9Z8azfovsJ1QqIlzd7juGRkh67on7DrQEgatueVxMJV7N3QvYCpgzh3zowtx7RBjrqFHcwEuYJ/ybWdaHG071VLWLpKA1AAOeOfN1c2khr0ktUU87CLVPlypo8k503f65lDf4P6rgzA0FIBGp5CtGrB+9uY2wYZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEtG11dicL76z7ANfatS456H8ipnPkrKnEv7LBElCpI=;
 b=K9eO6+TcU76/JV90rO3709ajolUtILbYxZrUAV+lx87hukAYKWCRD4M+apKTDFNouMDsqeZYl4t6P/gDW8Eu+JqRrIBPQKCDtuPdvjNKv9DsWmlEFwMowtmoLGUyWqmt+EXovrK3vP9znsWEZ5H4jIj1ptMi+HWP0NLcMQWfo5gi4gc5gxxESccSNxT0eUofDFoKoW+A7BOpFu1Y4gRnMxILB9aEVV+S/8thdSXkiV9e3fGB5WMHWPI36FmwJDvrTUdNjUxaB0ctZRJqqAn8jRED4r9CWlC7US3pllRdyfsMdszyc41xKGmjxKIFTi5tWSmBvPg+uKXanpf7zVXbhQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Topic: [PATCH v2 2/4] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
Thread-Index: AQHcBrdwbCiaA0DkGUiaPFn5+2VGXA==
Date: Wed, 27 Aug 2025 00:23:13 +0000
Message-ID: <875xe9395b.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-3-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-3-grygorii_strashko@epam.com> (Grygorii
	Strashko's message of "Wed, 6 Aug 2025 09:49:42 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GVXPR03MB10457:EE_
x-ms-office365-filtering-correlation-id: a6d4b57a-70f7-4fff-aa98-08dde4ffe916
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?13Wf/qEgYK9e88uttTC3SE6N1b6e7L5VxTHB9Poc+3XlMU0QiGxEoouxaK?=
 =?iso-8859-1?Q?KikH+PHsxFv4aWhpbvlyh5tiO0RbXqLDSlT051sS9RVwtW0nHXyrkIukUf?=
 =?iso-8859-1?Q?Bdi29qdW0tnS72sIwn3AxjfSXwoFWUa0NWuN1PSCKdGjQ/1QcIqNZC9wko?=
 =?iso-8859-1?Q?X7ZW8gaX3xHa0a7o2PQlvl+wa1FGz/G/x1AZwFerbcOC+j0XYTi0hoii6h?=
 =?iso-8859-1?Q?SvFXMX+U9i/rpjn4jIjixY6xlebr7dtk3mbzouGwsSdJQnAXHBD/HiCN24?=
 =?iso-8859-1?Q?KrSYO7Lz3JDeDZYwr+3pFd2fVvexjpzRto3XF4aIojGeusCkFc0QSP25zy?=
 =?iso-8859-1?Q?Cex0fJNUXtqke+YZSl7S1jO7A0ZDZyv3fJSBegmWtbcKV+k6pz+JVcnuAf?=
 =?iso-8859-1?Q?u2ykAmUIVjg4yZGuyQcwLrFGqSPDgMwUwk7LfIhQaGDqfya/Pp6hes10pl?=
 =?iso-8859-1?Q?Mte3zxm1JRtDiOwxdi8KbJws7RPqdqHs32vRLC41iwcThljqxHjzDPNeXX?=
 =?iso-8859-1?Q?hwwwds21EG6JT9CeJxGPleD/TqLvLWji0SRonKcR+Pe7JSwfyX2OBBVZlo?=
 =?iso-8859-1?Q?G65I961FLcDRI2ngTGrPKUujrqlOcLfGW1JgjgSwEAOtBS9c1GUNNQ8dUf?=
 =?iso-8859-1?Q?yJvnFjM4kS9CVpUZXPF7wplkktJkRH7xFj+bApwhGkWuUnMwP2+if9KOSW?=
 =?iso-8859-1?Q?vKO2z6ZiQP58m2/6+3z3yGEDsBS+ifIR/rZfSCWpoAxuLIAb7DrnDWzGlc?=
 =?iso-8859-1?Q?K3cloSnczccQoXHTEZbHdcCceMdtW3p0oHOVB0/4x+ImHZKXaPNid/VIKu?=
 =?iso-8859-1?Q?KLyoxI75dl0/OmBXCEPXs+hNMd56XgWTr7goFP5ahC6AyhduAdLrpZ2X4x?=
 =?iso-8859-1?Q?2yyWEucf6g5Ki82HVyQ4trasSsR/DHB6K82qDTBhugxF2/L6TeDV9pL2Et?=
 =?iso-8859-1?Q?5nt5dHXKmLUrDLV/Zr1/g+tU3OK/s1Sfm43VN+gKIM2Ed06FxLoB2DOOox?=
 =?iso-8859-1?Q?BRWYjPvYmxHUe9TMUAKdET00j4Rss3EarQp7wrMs1j4nwIWER844s4Z25K?=
 =?iso-8859-1?Q?L6tiMh3Z1XqzR6kqQsaMznlSDpuEh+c4wxJFJaz0dGCSRGJayhTAbBMwxa?=
 =?iso-8859-1?Q?6mEOqgkb8j58qExg3fL7vU6InYSOUkBAYTep7AfSk1sGgzXwdBv/UwTuvJ?=
 =?iso-8859-1?Q?yfWDQzKtIw/PK3ARAZ/27ri8K3FytwqPZHROQYk+mM2ebOAXhlFNlV1Q+L?=
 =?iso-8859-1?Q?QuvZnbF+8SForsxOCxb3YeZ7txQXIfM7cKqW7+hmR1rDYHcZPMs1sOgrdk?=
 =?iso-8859-1?Q?IbaT+EMei6xxUYhcWhM8WCJvN6NCh4lKvt34qAWtcj542xIOgtmzIC05JI?=
 =?iso-8859-1?Q?h5UMrlGHJtDGaDfmOul1zeebHWLKr/c/z115TQrWI8hRLKWL5hqq0Rwi41?=
 =?iso-8859-1?Q?zR+bI41FR1/KrLpLGVULzwGY5vKxK/qhmH2nguMbbgY7sAWjHOr/HS62ZG?=
 =?iso-8859-1?Q?FhlyIzUwYUR2liq/lyXCSJ4purx396EV6OU69AT9estpjteYSivJQMVlfE?=
 =?iso-8859-1?Q?T+PDbZw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cf6VmhYDHsdl1zg7L+C89pC+2kLnJISFCS/0TEaJZOJi/1Ozqg2qFBepRu?=
 =?iso-8859-1?Q?3QzDCK9J6fW1N9oWUv+292i+WmBO8vIU7nmXr2fWPhmn3P1ltWuDbMs7W+?=
 =?iso-8859-1?Q?mKTD1lOt73r0aAZjvD+6svGIUHuNXVxChPW/HjysYS048VNMU1zm9Q18vz?=
 =?iso-8859-1?Q?69gMNDgtGCobcXnlKVT8Qc7vcdPLiG0lkUO4BvUFXpp73/m71e53TweVFM?=
 =?iso-8859-1?Q?WUixytQHlYbZE+5dzkg246gsvGjAGiEyiG6OK2TIQC93MQV8i6oeOeTycB?=
 =?iso-8859-1?Q?hBLLtvVNoh4WEIWkuzfDIlwR1xyNf/TLG+CyJwxhMVyMPE0uXEl47+j5QD?=
 =?iso-8859-1?Q?ov6xUeyfDdVFjO0qlB1In+v3W05t65rxj8d3yjrYL7TIIJ6rue6tcMw+Km?=
 =?iso-8859-1?Q?Zr2nDdH0V54UiSYck7loEcHiFFqqdKW+5097rlXzB0pQCwrdSKZVjsCSCy?=
 =?iso-8859-1?Q?5XCA93PE4wv8ynmwdREP8fDsy7qprVEYs2uxU9A9cR5ipBD2ffYPhVolvD?=
 =?iso-8859-1?Q?MwGihi6ZFr6WDOThCHNlaZf3p4+FOu5f5D6NaMMnW8Zo1k4SUqN14KMRkZ?=
 =?iso-8859-1?Q?GBNhMoN0d5WBkfHJMmWsFzXxkOxNw/y7jFF1O1nt+XcBLHAtDTqNyH/wjS?=
 =?iso-8859-1?Q?fcrly5L3M1rIrCBR55w1rSAQWagUI+lfe8DjCiAiyDi9NzZIiuV+RSTmIj?=
 =?iso-8859-1?Q?wCB/29dFVI8hTB9G5e6wUHvw008kQeD4Tcwjt6kwU3myg5u+SxY/LKoRii?=
 =?iso-8859-1?Q?PpjFdKoF0lFbpO0RqP2kXnNIjvcWBHVEccNQP8kC8DlY0FBbvBXGn7aLtL?=
 =?iso-8859-1?Q?U1y+HfoHVkSF0t7EUmc58aiwpDNZauy4BcZrzMNCYX4yuIu8DxDOVEjIHC?=
 =?iso-8859-1?Q?UoDYzKvBX9cTBue+c1kh2u187CsTKn3O568SYnxoxi6ICKuwp5X9AK6W+y?=
 =?iso-8859-1?Q?BhKFX38OzO1FTfdHdjnGMpYkUIJ8ZaDVHFa31CTb7ub9z3JmiZJZx57Ues?=
 =?iso-8859-1?Q?f7JGusFrjRwEvupB34OaJpuQyyXmuMMYf9rNlWBdU6dUcSajEFlHqnfp4+?=
 =?iso-8859-1?Q?JcR5DgGK2fgnk/5BP7lsaim60owDThk/7VwAhnI4UAjQpRQMHyFG6cBu8z?=
 =?iso-8859-1?Q?kXlDc2VhXlS0Gn72UcwPvp/QFjgIjdURBvJWUHLzXP2/Ds7/Rz+WIMMjgn?=
 =?iso-8859-1?Q?4/OHCkB8oAx342DuHOEmXGxsLBKgoGmdhLi8lzk+3eWniPZ6kNoK41jffT?=
 =?iso-8859-1?Q?zGWRFq3hpvO+8QzeHSHJAXi+CLeP/8dCHAioicMmHTFuqu/TjsUmdnyIa3?=
 =?iso-8859-1?Q?S9ynlqt845Xp03bytjFskUgZuEx2K1ezK2wA9SyVx5VNv4lMpTFaT0GE7D?=
 =?iso-8859-1?Q?uY2x7Q3n3x9gM/1sXmXX4kYItHw0Bs7E/D8yFUeYN08CADTNBL9mXgM+O9?=
 =?iso-8859-1?Q?Y8Z4d9REzqWJnFJV4pMPRb/5gt2tAuLBFRx9Kv+ecmQyVTKV2TCGqIbXLN?=
 =?iso-8859-1?Q?Zm9JnPumrLao2l4vG7RQfdx1o+7z6OyDmDXsNuAOnDzBMZVtSEExvSepsX?=
 =?iso-8859-1?Q?/A60ByYriqcGWg+Bnaq+hRgFDCwEtqminY1KjPAfIUV/aNFI+GnZNUG+Nd?=
 =?iso-8859-1?Q?OL38QemTTy+6ITh40+iWA9RwMis/9QyO7bHs07MhU+i0nWwSJr+1ZPXg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d4b57a-70f7-4fff-aa98-08dde4ffe916
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 00:23:13.4738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a94pE8dl1gb47ATYNLhYCfbTUM9k0ImkHyj0AXfvbgV3g0DFWuB3e24jQo6zLChWcf3KHZ2nJS6kvbP9+4OdGqGTGD1Tkfpa2eGD4h8UKYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10457

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Split is_32bit/64bit_domain() macro implementations between arm64/arm32.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> v2:
> - fix comments related to macro parameters evaluation issues
>
>  xen/arch/arm/include/asm/arm32/domain.h | 20 +++++++++++++++++
>  xen/arch/arm/include/asm/arm64/domain.h | 29 +++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h       |  7 +++---
>  3 files changed, 52 insertions(+), 4 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
>  create mode 100644 xen/arch/arm/include/asm/arm64/domain.h
>
> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/inclu=
de/asm/arm32/domain.h
> new file mode 100644
> index 000000000000..1bd0735c9194
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm32/domain.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_ARM32_DOMAIN_H
> +#define ARM_ARM32_DOMAIN_H
> +
> +/* Arm32 always runs guests in AArch32 mode */
> +
> +#define is_32bit_domain(d) ((void)(d), 1)
> +#define is_64bit_domain(d) ((void)(d), 0)
> +
> +#endif /* ARM_ARM32_DOMAIN_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/inclu=
de/asm/arm64/domain.h
> new file mode 100644
> index 000000000000..1a2d73950bf0
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/domain.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ARM_ARM64_DOMAIN_H
> +#define ARM_ARM64_DOMAIN_H
> +
> +/*
> + * Returns true if guest execution state is AArch32
> + *
> + * @d: pointer to the domain structure
> + */
> +#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
> +
> +/*
> + * Returns true if guest execution state is AArch64
> + *
> + * @d: pointer to the domain structure
> + */
> +#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
> +
> +#endif /* ARM_ARM64_DOMAIN_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index a3487ca71303..dde48178b857 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -22,11 +22,10 @@ enum domain_type {
>      DOMAIN_32BIT,
>      DOMAIN_64BIT,
>  };
> -#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
> -#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
> +
> +# include <asm/arm64/domain.h>
>  #else
> -#define is_32bit_domain(d) (1)
> -#define is_64bit_domain(d) (0)
> +# include <asm/arm32/domain.h>
>  #endif
> =20
>  /*

--=20
WBR, Volodymyr=

