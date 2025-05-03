Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3DAA8110
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 16:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975356.1362878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBDmM-00071y-Oa; Sat, 03 May 2025 14:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975356.1362878; Sat, 03 May 2025 14:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBDmM-000703-Lx; Sat, 03 May 2025 14:23:46 +0000
Received: by outflank-mailman (input) for mailman id 975356;
 Sat, 03 May 2025 14:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMCY=XT=student.uliege.be=Julie.NgamiaDjabiri@srs-se1.protection.inumbo.net>)
 id 1uBDRw-0004gc-G9
 for xen-devel@lists.xenproject.org; Sat, 03 May 2025 14:02:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070d.outbound.protection.outlook.com
 [2a01:111:f403:2614::70d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4340b710-2827-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 16:02:34 +0200 (CEST)
Received: from DB9P250MB0523.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:338::7) by
 AM8P250MB0170.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:321::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Sat, 3 May 2025 14:02:32 +0000
Received: from DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
 ([fe80::bfa1:a1c3:42a9:744e]) by DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
 ([fe80::bfa1:a1c3:42a9:744e%6]) with mapi id 15.20.8699.026; Sat, 3 May 2025
 14:02:32 +0000
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
X-Inumbo-ID: 4340b710-2827-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEyTBkd5t7GPQ8oyR95neyNl0eUdY7ykQaKmeQsKWQZmNiu0mCeqeWYUVB7bKlhgtMq2tw4Stxf9dJzRcukVhoE7Sm9v5TanQ5wZ13/ZxpuqCbM5fpo8w2OlxU+mPMs0B4rqB1V8LKNXvQ40s+hp5cp3CdrfaTkfy0AcwaulvkfCEERrFrZVnpB3cA+DfbdHXarPN6pQoYE7X5zkBo3O+qbQEI2sMFgJxTw6FGRYmWLCx7D+VBpY1C1OCzemK7gOB6j6LVRW785GS08n7O2Rb/gMVw/DIEGSKAKyGolQ8TPPblqmzqWvcFZVRGaB5OiNZx4wrkpc2PUcBJxRTmMcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWfPJ7h2wIyrDdt6ont0+03Q8nQPskSIr/7vUkLZ4Pc=;
 b=Me+qr3e3OBitYyMrkpR+92O4wlhGcxga9vTqxE+9D27TnhVQDEvEJkjDAkuv3M/bHv3sE7iuy24IduRvfwHJc4Hi2mwFrjVHSZpK/Ww3f1jzBe+ZiLU0I8bMxVcsrVFuB/IELGwLV6przYtUBbwuyUmjYmp6hOiCz/Wr05jK08KL1j0llLGdIYO4LG63TxgduGZeVrhG4yLMb9X5xE0BykhcxkPE27Yw4vw6jEdzGntLy0wuipKP1mtQJr/K3lDOKbLKv+AjJfvvbf/inspdOgtb6n30vUyonvadtv2ChjY9ZjCnz2MdjALZ7vW46Qy26OnuhxQlSyYH1PbY0yXlDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uliege.be; dmarc=pass action=none
 header.from=student.uliege.be; dkim=pass header.d=student.uliege.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uliege.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWfPJ7h2wIyrDdt6ont0+03Q8nQPskSIr/7vUkLZ4Pc=;
 b=XDV9NedFJcei16Rg3L73Vq5YqYMHxvpDpyCMp6MtDZDGSXKufSAKczyWNUa0ldt4oMv2XrR9WujO8s/fsJuR00NO5tiY7xgCEaxNm6Ef+Jo9oxB1dGhbCo4zxMrgfM2tFhN3Jl16wgQXossWMKPWLk38GDlL1X1/3fVs1cBs/vmsAL5HO4myE6yKdg7uCYmRoJ8IRfBRcrXoDMUUcjC9HVi6j9JivJ86atMZgCJbCMBnp9q8++uUWmGfQlcvTUCngcC+RxxULLYYE7xbwckwTCJxIhK8Di5PPszay7TYUHfWucWcoGvuNhEyzYgGFYM+VG4mBxOHJIV+mZJbzph65g==
From: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Request for patch to fix boot loop issue in Xen 4.17.6
Thread-Topic: Request for patch to fix boot loop issue in Xen 4.17.6
Thread-Index: AQHbu22NmgKiRiHk2kKM1KfVYdOb3w==
Date: Sat, 3 May 2025 14:02:32 +0000
Message-ID:
 <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.uliege.be;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P250MB0523:EE_|AM8P250MB0170:EE_
x-ms-office365-filtering-correlation-id: 58ad76ec-6790-4f4d-0be7-08dd8a4b264f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018|13003099007|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XcY6RIlapLt1GLVIK8a09gOIbAjKJf7ZrVUtlJZh7WvsbkJhlEM21eoG1T?=
 =?iso-8859-1?Q?Bbb/oa3+r32lTGDlIg0mamGsRgoAaHuBdU8LTX5KiPxdVmBNv7qNc1NYIg?=
 =?iso-8859-1?Q?cSrtHIcBU/1sLzzZdVetD9Pb/473Eto2roKULeYBaW7rS/A7gfHgTnc89g?=
 =?iso-8859-1?Q?L9GLUoGdYjFCLGlcxkKWMV+T9hBMaR+bxnDUkKdOz2USA9L3c4DiIZ1xx9?=
 =?iso-8859-1?Q?5KSWdlto8dPxZuxM8YwhF5ndW1rmSeCuFCB2ge5MPJec+/R3VBq/3GPrgp?=
 =?iso-8859-1?Q?BE3uuX0N7rvaK4hUJAYP1EdhdmCTcztG7yTHOyXhXctLdpbYwRJUYO634d?=
 =?iso-8859-1?Q?JnVmLx+FuCsxEh2trn3dUNqfYz6g3KpXm+ztc2ZuVpHKKomvX3ecENj5jz?=
 =?iso-8859-1?Q?gAH29p46Oysp4lwqMnmjgGNjlt+YDVj0RsMZOVJviFufkxWSp9ts9Qj7jm?=
 =?iso-8859-1?Q?VgfnWM3JwGw1CmpGb+oksnozKMbCMzvVCvPIUtlaPY+gFBx+xAfJOkyUDd?=
 =?iso-8859-1?Q?FhTwiVfsY6aLOz7arV/Sb3q4j8v/ajW8jInWjmLy/S6TEcFUs4Vhvwqaee?=
 =?iso-8859-1?Q?cRE0v2l8GyHxK4V5NqaERS4YwHhv8DFn+Nu/Ojzmj0AqB5MdC7BI2MgZEz?=
 =?iso-8859-1?Q?FN6KLClbkhfBJNMVAahSuwV2xN2w7rTVUsv7B6qHMUS+FDO4infzW+US7O?=
 =?iso-8859-1?Q?6U4QqCk2t0jlG+/1EYHt9nvNxCV3REKKvV4jV0NawAmxOz3rz7ex2etORx?=
 =?iso-8859-1?Q?07CGO2ozueZT/uC6G0qWXgEFiQWjkomamel3sw2KNKb2ro3N1rQsO5+TpQ?=
 =?iso-8859-1?Q?WnyNsXvMXIikHZTuGVqxlJfQ/3LkUxtM9iL0nbd5bN433XAHFQTxNLPvFj?=
 =?iso-8859-1?Q?RaWQVXRkydV8rvRe3X2ElAgtQGWJ2HSqbrr+8+J3P683nNyvXgQYoWLokB?=
 =?iso-8859-1?Q?J5t3QE8OoFmWxLcXRqJ+OMZbAauYXxAo+RkuTfZA0ygM3E/X0Z1Lbq4z41?=
 =?iso-8859-1?Q?yaf6Rx/KpBbKJtK1KurHqQQ1Vqx5cN7SxzUTETUnAEBEIohDRi6EYDKjIz?=
 =?iso-8859-1?Q?RceCLOGXv+AeDLQHo4DhPIY+0WxO7YyX7ttW8lpHsQXIw+nMlE0e+9bIbu?=
 =?iso-8859-1?Q?nTdnz66B64Xa1dHMyz86Xe+YrpTEeZTg4TQa/c+IRIIkTWNh1WdtHTTS0Q?=
 =?iso-8859-1?Q?0NVxGM+v6OGQjt1/IUhfZG6TENSNVQey3grwI/Vun6JeYCaDbKUhBA3GmF?=
 =?iso-8859-1?Q?yT/LsN9grrq1s0YI+IArKSNc19taegz7mVYsuKbFRfFea/o+qSsHvcmz0R?=
 =?iso-8859-1?Q?RgLG3Lj5O6adnZuni7UhUAS43NZMvu+wIYUrgWMg5pRieqLk7aaf4yx3jp?=
 =?iso-8859-1?Q?hKdgRj5k5V1R1cEt83vRI/DiQHmyKRJcHgxppYz5CY3rZ5S5NIbIjw8Jsx?=
 =?iso-8859-1?Q?XzZl7tIT0pv/YQp9CuLKekJdidu0fT0375jkUKh7tqtdDCxJYBEETixOMY?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P250MB0523.EURP250.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(13003099007)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SqKuFrc4Gac1kfJjTSA/RPy0b1omFChap0uWuObXsp3RPBC9TovhVM0SRK?=
 =?iso-8859-1?Q?BRKlyYUpFzpZmuwaI9OibeKJAgVn2e3b0u6vvx3yxeoQY1pUA/j+KT8nAA?=
 =?iso-8859-1?Q?CoQFlWgAcuyZghTNGlvAqrnpETUVAM6QjdDgiX3MFBuUk4AzkK09nVKuDu?=
 =?iso-8859-1?Q?sXFVWbMw74t/9h80HbrDE/7pH8bWE6p9142JCatEO9FEUD/UeWg5TiADf0?=
 =?iso-8859-1?Q?YO5C5W+4T/r+CHPkyncAu+DWpDw0+oMPu/379e7pKUX70lnsHF1ABje6HW?=
 =?iso-8859-1?Q?HY4eb9+0g9uid2qSXXFPKq9xufdCbypPGDAjFS2WcW4wHsAiV3vvBiE941?=
 =?iso-8859-1?Q?jDk6R/1JY7GzRYZQpQiHeNKIkjPM3WRA3PKnBQxsyZ8DCeIuITAi3ZSPb/?=
 =?iso-8859-1?Q?YVNld5WDhcN+x6Ujzfp2NzpLDusyz9cBUS4EUa/HIMZ3EUPcI2oIkwFCaY?=
 =?iso-8859-1?Q?FRkhmke8efaPJfWYpgxzrsKV8BlP5Fpi3nlZs6wnISh/P1FJkd6pDNBe22?=
 =?iso-8859-1?Q?GwqmIFMAbecylnZYUbqgHb6a4Q8UVGFKPhCYJ3Tx+jfJcYRkwxINcadOpD?=
 =?iso-8859-1?Q?0Yzjv3H6MVm1GKrQXOaBz1VkHsgjHNWtHQDix5pw/b7i/XK8/FFbyH4d+I?=
 =?iso-8859-1?Q?KCsA9+Uv363YcMSe8TudePciTVbTjADHD/bt+8PG/v4cHZkroj+sxANDxi?=
 =?iso-8859-1?Q?oe0Pr0lWi863WboW9IjbrLyZMUApTzhwEcASQyzmNfQReGpjFfI2tFqKPR?=
 =?iso-8859-1?Q?PqKPRH7U+8XupwfTnnsI0jOXs87pdt14mJxjR5KXTV2qOXZWivZJ1kgW3D?=
 =?iso-8859-1?Q?3m4FGc43PREzwUNb8O1MjFr5hKswc89cb0jqTCicLr3jThMaPr1kuZoLdD?=
 =?iso-8859-1?Q?GXCefPxt0ZlIwMwepnN2d/U35TcvnE+II/mpM8Krgp500YpCYEPHq/BR+h?=
 =?iso-8859-1?Q?GROtupB8dC8muyThhkgwpMUby96Smk5nlWovat2cbWgA4FboX5nW+7csXp?=
 =?iso-8859-1?Q?qfyjwpNUwk2AJ4yONwXFt8ahkLS8lW2xIccYlr1geLYRU2mLXNQnkIhl18?=
 =?iso-8859-1?Q?E1z/A06WMr2IGZ1FVMtvsGPDFaZYu2bOdEe4Czm528N4FTlo2lzsKWj1lu?=
 =?iso-8859-1?Q?1vBas0Vwjk0+Ylhv10LY/m/KHYmBnKWtSz2dvidyyOFut2UumKL2fQTlEr?=
 =?iso-8859-1?Q?LHgszLXutbtThYahbcCBOqqsl7IXoGKGrO+lZunVN7/gJrC1Lewl+BYEu6?=
 =?iso-8859-1?Q?UrZkITlj3YE7iEEJXc1tq95oRzNbkXXUUATUyYi2coEnG8tc5A+pOhjU/G?=
 =?iso-8859-1?Q?Y/nBURhZKE0ais6I/1WVICnsCfhtmmNlasmo0zQjLUT5FbJkvT5NacobKC?=
 =?iso-8859-1?Q?yfsHvkIutkdzVLBRCS+UjKieuCKnRnmpS7s7cWGpMcJozAbt9rVq5jVb9o?=
 =?iso-8859-1?Q?n/k9IGuAGBmM7KozmO1qT7roMi/qlCE2xwAQXeWiBhonFSolaazCxWgh3G?=
 =?iso-8859-1?Q?/ybbL28O674zo7d7LghNRQiKMvrvjRcpanSHZsI5H22eIf7B2W14Tbm1d/?=
 =?iso-8859-1?Q?Rw03qHDKrNcRHYnZmuxaDlzjmvqUTum9KA7b1RPPi27MtPl6VHOVf7M8Gf?=
 =?iso-8859-1?Q?/rjfDEl83wIEkyVeub5lg/QlwW6b5KvRc6IUmtmoiS9h766xOFcYf/I5JA?=
 =?iso-8859-1?Q?1Cjz0Y7ailkOyrMlLdfp0cu+rEgH76KLWoTaOO8LB5Fa65O6EqrF08gDxj?=
 =?iso-8859-1?Q?Cq5cfya5EQI64afQpnlytdO3M=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB9P250MB05235527B537774F77EB9E26A08D2DB9P250MB0523EURP_"
MIME-Version: 1.0
X-OriginatorOrg: student.uliege.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad76ec-6790-4f4d-0be7-08dd8a4b264f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2025 14:02:32.6249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 62e13b84-1960-4562-8c7f-72472951da8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p41RPcu5UzDgNo5x5/A4fy9VR4O591kCRt0FCmK07QUdNFMD7CHmateB7yoY0oSi38ZLnZH7I53rj4/DEUgM41AdvNsN3xgh+Mf6zR6PsyWXm7Ht1v90FcqXPbOpm//K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P250MB0170

--_000_DB9P250MB05235527B537774F77EB9E26A08D2DB9P250MB0523EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Xen developers,

I would like to ask if the following fix can also be included in Xen 4.17.6=
 (and eventually in the Xen versions after 4.17.6 that don't have the fix) =
:

https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddd05d265b8ab=
da4cc7206b29cd71b77fb46658bf

This bug causes a boot loop in nested virtualization environments (for inst=
ance nested environments that use VMware Workstation), making Xen unable to=
 start. It was introduced in version 4.17.3 and the fix has already be incl=
uded in 4.19(.2) and 4.20(.0) and woud be planned to be included in Xen 4.1=
8.6 in the coming weeks.

Even though Xen 4.17 is in security-only support, this is an issue that blo=
cks testing and usage for users and projects such as Alpine Linux.

I am a student using Xen in a nested setup for Virtal Machine Introspection=
 (VMI), and including this fix in 4.17.6 would really help avoid these prob=
lems for others in a similar case.

Best regards,
Julie Ngamia


--_000_DB9P250MB05235527B537774F77EB9E26A08D2DB9P250MB0523EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Dear Xen developers,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
I would like to ask if the following fix can also be included in Xen 4.17.6=
 (and eventually in the Xen versions after 4.17.6 that don't have the fix) =
:</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Dd=
d05d265b8abda4cc7206b29cd71b77fb46658bf" target=3D"_blank" id=3D"OWAd0164df=
6-5537-150a-e93f-811fc8de476d" class=3D"ms-outlook-linkify OWAAutoLink" dat=
a-linkindex=3D"0" style=3D"margin: 0px;">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dcommitdiff;h=3Ddd05d265b8abda4cc7206b29cd71b77fb46658bf</a><=
/div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
This bug causes a boot loop in nested virtualization environments (for inst=
ance nested environments that use VMware Workstation), making Xen unable to=
 start. It was introduced in version 4.17.3 and the fix has already be incl=
uded in 4.19(.2) and 4.20(.0) and
 woud be planned to be included in Xen 4.18.6 in the coming weeks.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Even though Xen 4.17 is in security-only support, this is an issue that blo=
cks testing and usage for users and projects such as Alpine Linux.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
I am a student using Xen in a nested setup for Virtal Machine Introspection=
 (VMI), and including this fix in 4.17.6 would really help avoid these prob=
lems for others in a similar case.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Best regards,<br>
Julie Ngamia</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DB9P250MB05235527B537774F77EB9E26A08D2DB9P250MB0523EURP_--

