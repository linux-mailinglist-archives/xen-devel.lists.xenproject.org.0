Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAFAC45AC
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 02:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997848.1378668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJhvU-0001h5-MX; Tue, 27 May 2025 00:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997848.1378668; Tue, 27 May 2025 00:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJhvU-0001dx-Ii; Tue, 27 May 2025 00:12:16 +0000
Received: by outflank-mailman (input) for mailman id 997848;
 Tue, 27 May 2025 00:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1m/z=YL=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1uJhvS-0001dr-HJ
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 00:12:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20628.outbound.protection.outlook.com
 [2a01:111:f403:260e::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33e574d8-3a8f-11f0-b893-0df219b8e170;
 Tue, 27 May 2025 02:11:58 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DBBPR03MB10559.eurprd03.prod.outlook.com (2603:10a6:10:53b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 00:11:54 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%6]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 00:11:52 +0000
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
X-Inumbo-ID: 33e574d8-3a8f-11f0-b893-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eag9UkjrgEy3J4s2MzsgucPHduymncGWZNtD2B5k++yQGNpi/GiRm89Pcwgv4Gyq1GumeNYwN0bh1YHpnKI9KVTG5r3g54eFXXIKypTrtfAX2GANtLV8ZzD8fnfpmpf8oEtXzpUTTLKaGLatAht/Rrc9IGWmnWYrQQjQL/MAXbckxJc5hlRn1UjpKQ7YO9x0dl+ZvkhLmBsu5QEd8AqzrXsqB6jsafz7inRMQrjQAtxHooiVXtCZv1d5RRxURbbLFDhsELJ75bxSMNUFH3iNJO/GwyyM07iJqmJYttlThtEnU5DhJLLqhVwQiLc51cjhdxOJ9G7ovWhplPoBCET0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0UC2uVhves3JMuCM7fsnRk6dFJ47wZaR/LSaZmPfjk=;
 b=KOurWadc9FUbLGn2PIJeLoRkNnSwZgcSSCFOMtFv4swefTCvXE5mCBG00tE+gOxUAvNtddsUYeDvRZFkrD4E9oA4tyWvMg2wJGy466ZRkZKn00koDmHlWPtsF/F0TQ3UPT5cN6KwMhHp8CjhwcuWjKI9meYLmdO7OJ3IePpLXTjkzXXQUdM870vOMeFQxhRQvSdqsHXBUvmfUGhMqFV1svsSkPkh7dr05ORLfi9ez2Gn9QS/7OdP5/ngMZmBQGOZ5YK0S1oJPblwO/u2jUp9c9un8azRyjzrTygKBesiEO5rMRdGjkKi+YAE3O7s5ROoSGc22AtKv53TP1celjVZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0UC2uVhves3JMuCM7fsnRk6dFJ47wZaR/LSaZmPfjk=;
 b=IOUIhGhs4T6XwxDf8zbBmCfqVZ9xkoRhe6Mu+y4W8DAWOmtGuGgSCOdEtPJQee0TCrXnOJ3TWVUnd6LvdlfsZgSFBMnijKMrk05OZfhO+KzZyP6XWI7KrSQ+sYNroUUskEZfy1hl7iDh9GxBU/+PImE5xCHZPa2IoB8pN75Hy0LPACQlGa6OeVYxuCLo6AM7C8gKEsEAaTTfkzF+glBImdCP47ZPlvxR/bmUpBuj+rGZc3XX97ok2n5hFM64rzuvGR/yw5/r2fc30ZbGDJso6WdzoWO40iQqOs7smaAMKD7dDjMeV6b+VU5sqgV+2r27W43858wqjIoO1DjdVdAncw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/vgic-v3: Fix GICD_ICPENDR read access in
 __vgic_v3_distr_common_mmio_read()
Thread-Topic: [PATCH] arm/vgic-v3: Fix GICD_ICPENDR read access in
 __vgic_v3_distr_common_mmio_read()
Thread-Index: AQHbzpvyD0IOuzZwNE60YXhXy//Nyg==
Date: Tue, 27 May 2025 00:11:52 +0000
Message-ID: <20250527001151.3804521-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DBBPR03MB10559:EE_
x-ms-office365-filtering-correlation-id: c8fb11b6-f7f8-4dbc-004c-08dd9cb31548
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IzG31bOzYibb1elIpimdc1OTLKeoDciXOJuBde0Oi09Ad247KXFvQuLKfW?=
 =?iso-8859-1?Q?+u4GssAb1RVmkDLTdr781MlkY46IksTTG8y9xYbLjk8N034aQK/3PsD136?=
 =?iso-8859-1?Q?NzWdNOfZy42GBCyQ/+whC5D2IetjlYbPwlDfFWgGtDUdDjPTrew/sfk9kP?=
 =?iso-8859-1?Q?C46Fj27NOPKEdD9aL1tixA/61gkwpuY/S+xUDGoN2qXjeo4LGHTSf7A364?=
 =?iso-8859-1?Q?MKEv0u8Z9lyv/imdEvJJlVJqdmCJUw7m1xff6H8o+SlZAtCeMpwlCpPA/F?=
 =?iso-8859-1?Q?jJzlY4f02lvghl5r2itQ+/dynr7MMCU2eL5CSKdyzy6AxM6Q2RFCv5ah+E?=
 =?iso-8859-1?Q?G+fTNetOve3lxde1kKLCdsjsePzY6R82Sw8akYKjqMokl6MRZp7c0GNzCQ?=
 =?iso-8859-1?Q?8DDxASkqJPk8rlD3zpRVFn5FTwZc16VKenLKv1a+ojDlj6J1F3Fuf+tSWL?=
 =?iso-8859-1?Q?h56JGN3erkEsIAZBEg4vc0Fy7Dvfas563ytRqtBBfIRCrVjpArV8QiExl7?=
 =?iso-8859-1?Q?1FfBwE4DNrYuoFN3d26qjkIxTHy/Y9UV/V0d2JLPlVRyi0TivDMg5uN2Rc?=
 =?iso-8859-1?Q?5WxJAxc1GtcJKXnBRLPfprBEixMHf2RFhqMJQfeaKJo+a7H/dy1YmKxR1E?=
 =?iso-8859-1?Q?UnecKSNPkaOGZ5BboTuir3QpZP063WPPdLQM3gm3V8KrQuh2hsWpG1VmcE?=
 =?iso-8859-1?Q?JVPNuzSp/ZNet1qOmiaol3qDihDoIXIxXVm8Nsj2PTBCB/7CxIjj9Irks9?=
 =?iso-8859-1?Q?hBlX4rrc0agNP3qLMtSI3sZ9gIfCxLhGUEJUZhG1jJ9ADFon5/tl/OF+bl?=
 =?iso-8859-1?Q?v/gKR3jAmXeJEqg1Z5u+CgXsfhOsVjRPFxKBIQfy9MJdK8nvHUV9ySgyQn?=
 =?iso-8859-1?Q?08a+rryEWgFGkFYywNi7wtrAQA7qhqEKK1vWv1vWXQA+oRMtotopD63jEN?=
 =?iso-8859-1?Q?/siWNevMM5k+XHEyOHoKGE3pCaOc8oicCf86IvOz1Rqy5NiLV+yXH3cM7f?=
 =?iso-8859-1?Q?X5bFH4LM69OA/Dt547yjI4FWxI1KA/Mk0t50yA065+LbT2X/7d4hLaZ5C6?=
 =?iso-8859-1?Q?qEUH43fkTrhvM6KbIwWmjZesxDkK7Z9bbMGqDa7tZGkkBBKN8fCIw0mVfG?=
 =?iso-8859-1?Q?TXx1o6l2Qi97LYeA6LEsjLk900SmH63WoMuefTBmS8u2wy45QyvdBB3tLy?=
 =?iso-8859-1?Q?jPXDi/0ak7eafqmo0Wh+9ee8mpS/T5alvUDJFpxC8aE2VUvAnQiOpVYpQV?=
 =?iso-8859-1?Q?H+JJ2lyY03Wm3Gjyr4cGLgAV7+H7j25/hvZUNQMG2cy0FGoGQw3l68Ompj?=
 =?iso-8859-1?Q?r5lbxmLUFnSrB4J8ahfTH8Q1Ba0gHFXSx9sDPXaD5tfS/m3ORQ5CvUF7Bc?=
 =?iso-8859-1?Q?9tNYhGxmFfI8MiPkBXxKragpNuWwuk4YJjkkc6d8PWquW+4ieWZgUmixGW?=
 =?iso-8859-1?Q?6PzQzZvSA5gKR6b6wZrWrDGJl8XRcjLIacvZszHM1taPdX43UPx2YGQlt9?=
 =?iso-8859-1?Q?ItP3Va2ARySkZ09tm7LBEWG4FotAr1KfctN9RgteZOHA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NS+gzp6IkJNBp8hTewZL3GW2Qrs8YdkqFcJBzl5nkuZaPTrWXlTQ5qMZ5Q?=
 =?iso-8859-1?Q?fWJCjRfW8wmGt46BB9ugwQXo6qnVueN+0qqEmLhccu7PvBr81BjtkFiB79?=
 =?iso-8859-1?Q?i3gju9EGWUVDeRJ6bpueOG+eNY60PYVyEP13m+IHtFfQJgsoXxRvkLRgnU?=
 =?iso-8859-1?Q?XbV0gq0Rr205joWELp/r70E5NkozK9BtRnBJwbA2LsdWEiNzTeLaRePJCK?=
 =?iso-8859-1?Q?tuKMWZm/6ECQokHyA4uTmNwOqolrrhbieGuIa9V5MkB1iWRmVlZR4j5Pfy?=
 =?iso-8859-1?Q?r6WnAqM4gU3C9fD6CZh7f3eFioir+kdDNKNdr4E0bMZ7Vxbs/1rE1Gk3WJ?=
 =?iso-8859-1?Q?06amSWjdsh7zLbiyPmg6C3oVF5/yfZNVW7Xsvo8JhGZKnroALjiLT5I3u2?=
 =?iso-8859-1?Q?LQQx5Z3IMnBxxAP/8HV/eQ4zApGWf9P49Oi12chfjVMkwMlKTvZNqmOqN8?=
 =?iso-8859-1?Q?H7MLkK0/q7/DGgQ2oGnIR7USlXM9H9Hq3JcIqvakGLeo+Vz0q0o6tcZMvv?=
 =?iso-8859-1?Q?ui4UwPSyamE3426Q6+hsHSSU+XSTXHyWmWaBN24vrOurzqVtQBkJ99jtqz?=
 =?iso-8859-1?Q?vRpuTITBCd5Jr7gZbgOuTRg2ycc0Lfk7fAhlTTwZK6LytOhxHeQS4nnvZb?=
 =?iso-8859-1?Q?rPA1LQsaU76yPJDeQdWXTYo7hi14vXilIh40mqDyZAaldno0SCwZ/6gTev?=
 =?iso-8859-1?Q?cfIuaapwrFEMW+G5CjwcibvJ7EsLDYhy4+IG8TfFnObAlveQ+wBitP60K+?=
 =?iso-8859-1?Q?RG4BSpFFIgIc89XAxxwEeHfOwYpZxpVK5Lx1VVIQN1fF2z0ZdnjdoUGMLG?=
 =?iso-8859-1?Q?4SHp60wQ659ep/Ts1gxkJPfWQrsYSmyNNDeMUQ/zmDOej38kZvYrDz/IPD?=
 =?iso-8859-1?Q?juFuUOLDVKQ0AGy24/AiDKnYJnGgPei4k8ZFoJCBJYguPdH3dxNyLXkSm9?=
 =?iso-8859-1?Q?BcR6Yujl/PvpK6wEh+4dt+25a8E5m+sKHKa1D1MRJEAJpygOZ75r4Du4rC?=
 =?iso-8859-1?Q?pnQbkzZiIrh1kcKiU+knE9q+4BTOAJ4y0R4Wx2HEWSgi1jTuCiDcJsc+0f?=
 =?iso-8859-1?Q?ODfnbmRsWxlzpFSr5FTn9dBI9PnA9qTudAh5DZ4TIF1bI0ZIN24CFSPkoE?=
 =?iso-8859-1?Q?K/p9B+uhH4GgaSpEcdOrOqIsxPBr71rOMUNwePJIYYkC8804OGB8grWEZw?=
 =?iso-8859-1?Q?ycK4VPI8Tcw8rGBrP6C7CauCnoMdZTKfyCJeebT4t0bdJu2E+qTInqzcZ2?=
 =?iso-8859-1?Q?sU1PMCI2P5lO0KtMkK9grpQ4f2l/jsUgHUEDPjXhS6FD6Dy+/3/Y6lTOeH?=
 =?iso-8859-1?Q?03Wun3+YQjbFuqu4TTkHcdndXUxgW9hW777xEqBpJvhfKfQJI2S9jKp4aN?=
 =?iso-8859-1?Q?qU0I6JHN96C/KQFMw4so3JiGgVoRKPC6sN5KDr9urPQXCji3N+NxNKOqcN?=
 =?iso-8859-1?Q?3q8esi+vXcSlH7fwu6JY3QSa6sWGl1M0CwRHheoC7zteLYZgPSYzYb2WEG?=
 =?iso-8859-1?Q?V6k7ToRVFHdFCAThbYZlwupN4+2R4erRO2QpylMvuRh/y2PEKBlT2CqAs9?=
 =?iso-8859-1?Q?VEfFC19DgoGq2ZprJDEgnxfGnUUDE92Cwc5G4Fh7Em7q5WK5s639XKqLwq?=
 =?iso-8859-1?Q?KO4dNI2Y4pGRtIarlsMEubsuk627t79y0pSo8ywDGWuPjDxuGJHhuuogtE?=
 =?iso-8859-1?Q?PviBFcJtge0sSdsGa54=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fb11b6-f7f8-4dbc-004c-08dd9cb31548
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 00:11:52.6261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wD2f9rsiOK4+Vm35B2PLZXhIUmFcS8y8xUAkiJXpObaRk5hA1zivGB9uUUMh5W+pxJmbD+KDkzH/Ux6GHRmR/TWbE5D9k8VvalrTwiMMSXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10559

An attempt to read access the GICD_ICPENDR<n> register (where n > 0)
which should be RAZ (as not supported) causes the guest data abort
due to incorrect end offset (GICD_ICPENDR) in the case range.
Fix that by using the proper end offset (GICD_ICPENDRN).

Fixes: a2b83f95bfa ("xen/arm: vgic: Properly emulate the full register")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index f20249f731..4369c55177 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -709,7 +709,7 @@ static int __vgic_v3_distr_common_mmio_read(const char =
*name, struct vcpu *v,
=20
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
-    case VRANGE32(GICD_ICPENDR, GICD_ICPENDR):
+    case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
--=20
2.34.1

