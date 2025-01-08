Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29FA054D2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866924.1278307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQqn-0000Pm-1w; Wed, 08 Jan 2025 07:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866924.1278307; Wed, 08 Jan 2025 07:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQqm-0000NR-V9; Wed, 08 Jan 2025 07:51:36 +0000
Received: by outflank-mailman (input) for mailman id 866924;
 Wed, 08 Jan 2025 07:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVQql-0000NL-5F
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:51:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f403:2614::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604855ab-cd95-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 08:51:32 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS1PR08MB7452.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 07:51:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 07:51:29 +0000
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
X-Inumbo-ID: 604855ab-cd95-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmRfwMrZI5ARI4BLkRwiXzKJExSFwGAG0Bv2L8Wa7+xfDPHayjPgWdNHj7OozELz2DeMqRmFqVajPWuZqAG2wx0QrfpEmG1lH6LXLOl48YN4TjRXOXIIqJwLYr5YesXSv77sU2HcWntT/qfd6k/vf/lN1Snn4PbGwHzSiGOBxL+4ShE8QR8trImI0K8HJwBgN//4Yzi92nKpAuoDUoRxhDvEBbAz82LEx1t/QV7vjwxxO1sRGQb8l9FOFFTgqVjH5abAJ7t47O6mC4MT7g+gKs4p0AV67/6BVnqkrMfayI1TFEwRMC1HChdDdonp4phg1BRTi2AQrJI4V+Ngz3QjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlXOjQrCby1QP/I8MWOWzF5fpShAa0rDjD9dQB5xkVs=;
 b=FsU88y19Hz52bGo++kjKjExgkGg30apbQAwjojSLllkf5jQK7t3Oa3oe+Tjf27hWWK0Pq/vy6vvBsO+1TBsQJJn7KOVAD/0cbIkMSjclGa80J6gxv7gUNQMXUo/Ul0ps5NHS74p8qJYmgSqpD55U6or95tSVGer+BQhyGPaW/e3zmRH0AlULHkhrzL8zV5O9zdYSQ9HDQacnE7euQmRJsj1Gl7+z+mV+08RM1qT3wPiZI+uu7cWjyoyS9X5hEqCCHlYF0Oi42ISA+Hqc9wWpVQ8DpBG75DlMIYPyXUzXMDjw/qubuK0hkm5fN/8PWhlxV1clQ70vYEWCZJOcQCuYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlXOjQrCby1QP/I8MWOWzF5fpShAa0rDjD9dQB5xkVs=;
 b=g1zdKaYdwda8IPcbD0LDgzi+M4oShyDpdceSdtWZWh7M6Wukp8exNbevNVxcBNNLPuzYdDdzZZuJ3+Ib6yQeoB8qAC+KkJONthvTPNpQspg+9cN9U9NFQc73YWbp8faLM4XFFVq5mJYKCzgFyCMTFe14XhXhFRW31B5rqFpHM5g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v3] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbUgS4JJcMvJVd5kOG9/I5q9pAibMMoCqA
Date: Wed, 8 Jan 2025 07:51:29 +0000
Message-ID: <7402DB1D-61F6-467C-89BD-6985A6817362@arm.com>
References: <20241219105640.3294591-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241219105640.3294591-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|AS1PR08MB7452:EE_
x-ms-office365-filtering-correlation-id: 441c45d6-a3bc-4389-425c-08dd2fb94304
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7ifo0ng1CuXyEnjLHB4kvAHgbyZG6eidIOezs5RRHbnVSSY8ezaZhcZ/UTYs?=
 =?us-ascii?Q?PFfpoPkdrVCoOeMKCkfbDgQMJeicuEFTwRSg3Cc6A3EAUunvogQfNgb0U822?=
 =?us-ascii?Q?5PqAwXAXXHgxfjKk67sCIJkfWJYJM4d6at5iOqBLeUChXyp4VZrE5pMUySr5?=
 =?us-ascii?Q?HFbk9rbJt8c/2+kV6bAsdwJwY3uPMVTfszFqkGSq93rjS0Rnih6M1uGuKdGQ?=
 =?us-ascii?Q?igbLHLNi3b+GWbHTWsUW4kjZcVJTA35lTblsWTKrPmgkhfWgahJd+0ruAdGY?=
 =?us-ascii?Q?wYH1+YMEobnMXBbC6yVEOYbBKCPbM9AHyxWu4P8k7zlVikLhKkMX/IMXPfPZ?=
 =?us-ascii?Q?d9l9OhuBCO72woT7X73u5oJTR41uEXMU4kh13G54avGTMVcHDclIEdb9VfWz?=
 =?us-ascii?Q?lgZmUA36OF0WHZrA2DCVsIHb1Gz/QD3E3F+nt4kerpiNSB2gq1ibIeTu2YMY?=
 =?us-ascii?Q?hvJxjHMTvkMof9tvdkG7mTZ4CgfUD4c+GHTjr1n7IihJKTGmVr+hqbyKKher?=
 =?us-ascii?Q?a9lKmf9m2V1yVmIBaohr/oDsfAOeB0S30PHlQca2J7ClH0AX2Rza3j2nXY91?=
 =?us-ascii?Q?H6ideUsL/iUPRUTwwxBtycA8QcwubPJzViGtW11jDP6HbKbQreBdE1lqnUEq?=
 =?us-ascii?Q?YD0phaoxi+HDTUfLBvIAfr7spjRAcXctuUDFotvDIh1OLERLi/XZJ7BbQOuL?=
 =?us-ascii?Q?LtMRtS9prO1MzGeh3rbny2OOdJlytkIyApctfecb+uraYd+rIUsOLkf86vV7?=
 =?us-ascii?Q?qmn4iykYEHMPXctr8DbPsXrZlVNdvLqGzL/Wu3bUXYOujQC/NrZRoG2hwu3+?=
 =?us-ascii?Q?wSHvnnG2MkeYnCsmy2GI47L5YybNDpwfMduu3hOXsTfd/TbFu0J5GUrCo6Tn?=
 =?us-ascii?Q?Nf24XiI2cmrZw01lBJLrgjKS0bhg7IStxFm93SGLXulfX2T/tvL9eM1h4NQg?=
 =?us-ascii?Q?jJU9NVWEtG2Lc5CyfLjQhTYSsM8b3ZlG4kpFn4LdExXIJo+Jq5aMBpk2+vBO?=
 =?us-ascii?Q?CuTVEgJkhjVkLFrNK063bu5MLqrhJB5CcxPx5b7lWuh9zQgdMgvAnmH+G8Zw?=
 =?us-ascii?Q?B7smVEmyqFLg/8eIWSbEwQ6XZcHMO7kSn0UXNtcA8KQdGQ3kolpSZsQTeXms?=
 =?us-ascii?Q?lOjTruW5kH8X8QCLhldTaOxZuZBaqfnwDX9GwaDPATIwifu2A9bGPoowpHWM?=
 =?us-ascii?Q?lN5FYsyYgDcJ/syeGmZnuPwrFKovOf6U3qeOBBX3YWbiyrXWSJ0I1EJORC6X?=
 =?us-ascii?Q?YnT5Ij7G8lbAppOnkMNBbx+nK77N1Lijh/63+P3PlqUGNDGJn17lvPmg431e?=
 =?us-ascii?Q?yEZKmWEIlfHgDQSDg3qQ6XH4WixZ4uD3yu7L0wpFAEM40+b3c9J1ytWwW+oB?=
 =?us-ascii?Q?IdXa7bvQRKiocnk2XtdfK5lyyFqKcL5yvZxDpBs6E4PB1giKYg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4XzJOj9YhF6o7wYh1wkzeaD7ScsUe2Gh5GMp5IwdngTaIMGk436BBBfTvDZw?=
 =?us-ascii?Q?BivTeyQtGgHCwZhUkzw3njrQVtuA1z73yAgFiiUHxTPxnoJrO+wgPF4pZ8yR?=
 =?us-ascii?Q?cfzVVq7WTCUIXtCW5wNzLbs7hm3x678T5+ugkvkPMYj8eUX586X/MWQnwaoZ?=
 =?us-ascii?Q?5Zp1OrEP06QIskHSW+/ZbPKl/FXVZ3gkYE6Cuzic7MwSdq92xWWXTTHRIPA/?=
 =?us-ascii?Q?w0dxwLa0dgPULFgzNNbFlOsuq3r/h2A40FktG3VN56Xc2sDbd0otmfvekN9j?=
 =?us-ascii?Q?wTUBtTxGX02fr5gzcI5D2bPt5rCg6N2f0D+7AzAKFvkFFCNlEr1HSx7MxLlz?=
 =?us-ascii?Q?VBab+lAemBMrRM1EDq3k3Bsf60UBZf7LoNUVs2zYALJYHwjakPjNyPOgVXdY?=
 =?us-ascii?Q?UuPV09tWSlxSaUdusr4EzL3n+V4MnKYXRngv2JEiORXpblDK7DVDgmZ/iVg1?=
 =?us-ascii?Q?K4ScTzznkksp1kiWkhHx55tIUPQ5qmwl2VFu0X8ieKcICj7TqqHKgRRcqTWn?=
 =?us-ascii?Q?irN2TFcDGazEMzI/p5P7euti8S4iY+hao6DzFYVLipti3BUL+mzP64F3JKhg?=
 =?us-ascii?Q?xXDCEEi3XRAuzx1D2Ujge2gSAreI4NjdkfgLsY4Unjbuci3K9GMNuydD0TZH?=
 =?us-ascii?Q?VQYATiGms5TW3Gf6pP4DrUD28ihsHDgbwbl3QVp7/z5Xd3wpIlyzAYSAqJXE?=
 =?us-ascii?Q?LL6bZFGbdFZYXI9pa9S8vvDupsP3Yd4umxSkb/Eg834Cugvd1tmbtJuYxHwa?=
 =?us-ascii?Q?eJe90b7Pbt2XXQ7A9KmoQbgfAUPROGiVpKkhIjLo2fPmLe0owVDeW7P9Csh7?=
 =?us-ascii?Q?NZ8Q86DztmhQv7f7vHzVsGs11/Qw5znNLY8BIsdQAx4kQ6cKHg06ZV5uM4xC?=
 =?us-ascii?Q?0GTc+xzzdGrbk5yq++3LCKxhWFa+IDmrfpiQ0JiP61uZ68n9n6iXcwmSXeGo?=
 =?us-ascii?Q?jl8cclw1h5fy6Py3lBSacS4JZpOngd4KJNkgBiYG6XrYuWhhjpy+9WJibCRh?=
 =?us-ascii?Q?Gx2VKu3DzUNjt+N8eustgBfbEO7G0wD5SF0gYgbLuZIBdSc2ckG1WONKFLoK?=
 =?us-ascii?Q?Bd9/jWMQjrshRPaQ4s9/Gz35lKf5AdB3jN32fiJBFC5iDVlUDJwHOj4jLHn1?=
 =?us-ascii?Q?NP4gn5xyeTPZ8Rn1CHp6rUx48pqubfi9k4CLpFOGGmHxER22+c7VATAy9KLA?=
 =?us-ascii?Q?WqwZAlfr4/xhTHG4W6+RaK4djyJCpjlxzuVoDIYlCLq24ESNutqoZsbsFyag?=
 =?us-ascii?Q?GnvvjvxvEqstCMJz/rgAYmzUy+AZBdEwtK65neaPwwcXvXQPPyzXxMWj/ySF?=
 =?us-ascii?Q?xHwPFnCRSQCM+qc/53ZR+L+oI3In0v+Ny0zBr4QrnFHXCnzOgOT8tf8Ml7rL?=
 =?us-ascii?Q?XXBm1XdCjK9tro9upcTQXBrQcQkcjuiTJdlnTfA9AUdWWpYjP0wyzLG226Sx?=
 =?us-ascii?Q?mb2tov4GGnKryjxT6D8XxqNzmmlNfCvDf3pKaniJjL/w4mz4idyarpwiMj1x?=
 =?us-ascii?Q?InHPiCi773oGYBt5LI3VfPbQHp+Tan6rtD1V5ebOwtP9LYSVjLbd9VKhnXUj?=
 =?us-ascii?Q?W/3nCWGxbpkaeKiq76KnNyouZx5L4RBLonLGUpVetb7+xsokAWelBUl89uB7?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6AEAB3958FEA704982AFDD8CF9F0A2B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441c45d6-a3bc-4389-425c-08dd2fb94304
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 07:51:29.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzXd/nGWuifh4oEmTE5+rNWbumB3cx/9XGOioIljwNSFF2YiIch2GdteZ9sPsrSlgkhf4c24EaJWN01h4j3ZmKdhzFgwoapaY1Li5SjO9h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7452

Hi Ayan,

> On 19 Dec 2024, at 11:56, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add requirements for dom0less domain creation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. As the dom0less domain creation requirements specifies the dt pro=
perties
> for creating domains, it has been moved to product requirements. Product
> requirements define the interface Xen exposes to other domains.
>=20
> 2. For the requirements which introduces new terms (like grant table, etc=
), I
> have provided the definition as part of the comments.
>=20
> 3. Introduced new market requirements to specify that Xen can assign iome=
m and
> irqs to domains.
>=20
> 4. The design requirements will be added later.
>=20
> v2 - 1. Rephrased the requirements as suggested.
>=20
> 2. Split the product requirements into arm64 specific and common.
>=20
> 3. The arm64 specific requirements have arm64_ prefixed to their tag name=
s.
>=20
> 4. Grant table requirements have been dropped for now.
>=20
> 5. Added a market requirement to denote that Xen can support multiple sch=
edulers.
>=20
> 6. Updated index.rst as we have a new file ie product-reqs/reqs.rst.
>=20
> docs/fusa/reqs/index.rst                   |   1 +
> docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 +++++++++++++++-
> docs/fusa/reqs/product-reqs/reqs.rst       | 163 +++++++++++++++++++++
> 4 files changed, 321 insertions(+), 2 deletions(-)
> create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst
>=20
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 8a4dae6fb2..1088a51d52 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -8,6 +8,7 @@ Requirements documentation
>=20
>    intro
>    market-reqs/reqs
> +   product-reqs/reqs
>    product-reqs/arm64/reqs
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index f456788d96..39b2714237 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -47,3 +47,34 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Static VM definition
> +--------------------
> +
> +`XenMkt~static_vm_definition~1`
> +
> +Description:
> +Xen shall support assigning peripherals to various domains.
> +
> +Rationale:
> +
> +Comments:
> +Peripheral implies an iomem (input output memory) and/or interrupts.
> +
> +Needs:
> + - XenProd
> +
> +Multiple schedulers
> +-------------------
> +
> +`XenMkt~multiple_schedulers~1`
> +
> +Description:
> +Xen shall provide different ways of scheduling virtual cpus onto physica=
l cpus.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index db91c47a02..c8fee0e49f 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -6,7 +6,7 @@ Domain Creation And Runtime
> Emulated Timer
> --------------
>=20
> -`XenProd~emulated_timer~1`
> +`XenProd~arm64_emulated_timer~1`
>=20
> Description:
> Xen shall grant access to "Arm Generic Timer" for the domains.
> @@ -25,7 +25,7 @@ Needs:
> Emulated UART
> -------------
>=20
> -`XenProd~emulated_uart~1`
> +`XenProd~arm64_emulated_uart~1`
>=20
> Description:
> Xen shall provide an "Arm SBSA UART" compliant device to the domains.
> @@ -40,3 +40,127 @@ Covers:
>=20
> Needs:
>  - XenSwdgn
> +
> +Linux kernel image
> +------------------
> +
> +`XenProd~arm64_linux_kernel_image~1`
> +
> +Description:
> +Xen shall create a domain with a binary containing header compliant with=
 Arm64
> +Linux kernel image [1].
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Gzip Linux kernel image
> +-----------------------
> +
> +`XenProd~arm64_linux_kernel_gzip_image~1`
> +
> +Description:
> +Xen shall create a domain with a Gzip compressed binary containing heade=
r
> +compliant with Arm64 Linux kernel image [1].
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Kernel with uImage header
> +-------------------------
> +
> +`XenProd~arm64_kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a binary containing uImage header [2].
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Gzip kernel with uImage header
> +------------------------------
> +
> +`XenProd~arm64_gzip_kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a Gzip compressed binary containing uImag=
e
> +header [2].
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +SPIs
> +----
> +
> +`XenProd~arm64_spis~1`
> +
> +Description:
> +Xen shall create a domain with a number of shared peripheral interrupts =
as
> +specified in the device tree.

"a number" is kind of undefined here. If we have a limit then we should spe=
cify it
here otherwise this becomes hard to test.
I would suggest to rephrase to "assign hardware shared peripheral interrupt=
s
specified in the device tree to a domain"

> +
> +Rationale:
> +
> +Comments:
> +Device tree is a data structure and language for describing hardware whi=
ch is
> +readable by an operating system [3].
> +A shared peripheral interrupt is a peripheral interrupt that the Arm Gen=
eric
> +Interrupt Controller's Distributor interface can route to any combinatio=
n of
> +processors [4].
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Virtual PL011
> +-------------
> +
> +`XenProd~arm64_virtual_pl011~1`
> +
> +Description:
> +Xen shall provide an "Arm PL011 UART" compliant device to the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~provide_console_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch/a=
rm64/booting.rst
> +| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h=
#L315
> +| [3] https://docs.kernel.org/devicetree/usage-model.html
> +| [4] https://developer.arm.com/documentation/ihi0048/a/Introduction/Ter=
minology/Interrupt-types?lang=3Den
> diff --git a/docs/fusa/reqs/product-reqs/reqs.rst b/docs/fusa/reqs/produc=
t-reqs/reqs.rst
> new file mode 100644
> index 0000000000..9257fec713
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/reqs.rst
> @@ -0,0 +1,163 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Domain Creation And Runtime
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Kernel command line arguments
> +-----------------------------
> +
> +`XenProd~kernel_cmd_line_args~1`
> +
> +Description:
> +Xen shall pass kernel command line arguments to a domain via a device tr=
ee.

Would it make sense to say where the "command line" to pass is specified ?

> +
> +Rationale:
> +
> +Comments:
> +Device tree is a data structure and language for describing hardware whi=
ch is
> +readable by an operating system [1].
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Ramdisk
> +-------
> +
> +`XenProd~ramdisk~1`
> +
> +Description:
> +Xen shall provide the address of an initial ramdisk to a domain via a de=
vice
> +tree.
> +
> +Rationale:
> +
> +Comments:
> +The initial ramdisk is contained in memory.
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Memory
> +------
> +
> +`XenProd~memory~1`
> +
> +Description:
> +Xen shall create a domain with an amount of memory specified in a device=
 tree.

s/an/the/

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +vCPUs
> +-----
> +
> +`XenProd~vcpus~1`
> +
> +Description:
> +A domain shall have a configurable number of virtual CPUs (1 to XX).

XX should be replaced with "the maximum number specified at compilation
 in the configuration through CONFIG_MAX_CPUS" or something like that.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Credit2 CPU pool scheduler
> +--------------------------
> +
> +`XenProd~credit2_cpu_pool_scheduler~1`
> +
> +Description:
> +Xen shall have a scheduler where a physical cpu can be shared between mo=
re than
> +one virtual cpu.

i think you can name it in the req: "a credit2 scheduler"

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~multiple_schedulers~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +NUL CPU pool scheduler
> +----------------------
> +
> +`XenProd~nul_cpu_pool_scheduler~1`
> +
> +Description:
> +Xen shall have a scheduler where the virtual cpu will be always running =
on its
> +dedicated physical cpu.

name the scheduler and also "domain virtual cpu is always"

> +
> +Rationale:
> +
> +Comments:
> +A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~multiple_schedulers~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Assign iomem
> +------------
> +
> +`XenProd~assign_iomem~1`
> +
> +Description:
> +Xen shall support assigning iomem to a domain.

We cannot assign "any iomem" but pages of iomem (address and size aligned t=
o a page).

> +
> +Rationale:
> +
> +Comments:
> +
> +Rationale:

2 times rationale

> +
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Forward interrupts
> +------------------
> +
> +`XenProd~forward_irqs~1`
> +
> +Description:
> +Xen shall support forwarding interrupts to a domain.

I think you need to add "hardware interrupts" here.

> +
> +Rationale:
> +
> +Comments:
> +
> +Rationale:

rationale twice

> +
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +| [1] https://docs.kernel.org/devicetree/usage-model.html
> --=20
> 2.25.1
>=20

Cheers
Bertrand



