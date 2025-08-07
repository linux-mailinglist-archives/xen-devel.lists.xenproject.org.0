Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07945B1DD1C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073351.1436403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P4-0002nA-PG; Thu, 07 Aug 2025 18:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073351.1436403; Thu, 07 Aug 2025 18:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P4-0002c5-39; Thu, 07 Aug 2025 18:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1073351;
 Thu, 07 Aug 2025 16:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xn-00076W-36
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:35 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4936a45-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:34 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:28 +0000
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
X-Inumbo-ID: e4936a45-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtbI+geXYrtGEpMXMm0SiMn211k7uNLwpiIiAsF3BYkDexUbRHlF24hIuWYGTbaU5bZdeVO3mPzuhQfHL+TL3hwjKt0YQyjVVYBy8J4xxbgMUdp7pWXJv/iqTlnmEJkbIDzU5HvPcgWDQdei0aS2xYcDbiDoHsp/m0N5RjKaJEeuR51TIQQTqTj8LpTHRK/wiss+54BfheqxUi54O1JHneCFvXJcmyGCyKsPTs0Z77Y+jeT0ndUBLphNt7qbK1HlARiRP+mFM/RqFQRDvTLHtt5VntgPsEqvC/froyCkIGCtrN5FlqOw3jlc6XCjJpjrs+iXkKdHSY8yR8X6OfO0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzIg5GHDCWFcYWZJkLnWl/NOh0XfgRa9h4RfPtk/omM=;
 b=MtFmzOBzFNuuudnp32L9T3tCoYDVTIJ2b9eS9Y/FowrtHt29CQByKOpUrFMWWNF7vTwPltjKMzjeYqiWkYFlpzOD9AUaUyIj2XDILtebJdm/pzPn9ZySOR/8yVxxBQkIAO/Z44KyhY0rBGdkpwRPuIM/cymRBzOu6JE5UHy8JqSAckCSfEYGb4FsBjFssXKlPeN1v02B74y+IEIUg03l51Pio/Hb0AMrha3ae1fSz7TjDO/wOhuUwbtOJ8GzEFuFqSo2OXPcC/jRNWlzLIj+/FpLYA8OYzBBUvpG+Pvi7hQm6dQnf03PjXRpwbP3sxuw/wzc7jz6lnDfpaZktohs+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzIg5GHDCWFcYWZJkLnWl/NOh0XfgRa9h4RfPtk/omM=;
 b=hs5V3EcyHzApptAFxZ+NbZCsP1v1gvIryq+eVjRkn0h1esnqB8g+JSLT3CzhOBpjDpzA88f2dlnEH12WubYJtbMma23c2xX0SqPUucj9UQz5IP+24hkITbIHzVunHrRwTqqZK1RP90AMIUa8IMxUJpJQCHJoIlZmyPEKT9851MK1Frrwbc2L1BqiiMfxg+t0AgV9k6+mRIn2znuX70jh4CKZ4gm9l3d0vGNZGS3hTepfoRXDn65/VMJPSR0DprTRjUxsW0ByW9WlP6nudJDGu6DFKxkoWnfVXtcdbEhOqU0w3ihfm0FTqLsejLtV/WgDfKxTYuVCWDA1DSQtL5Fxzg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 13/20] xen/arm: vsmmuv3: Add "iommus" property node for dom0
 devices
Thread-Topic: [PATCH 13/20] xen/arm: vsmmuv3: Add "iommus" property node for
 dom0 devices
Thread-Index: AQHcB7yjZjfsfeySMU+j/Wtm9iEvHQ==
Date: Thu, 7 Aug 2025 16:59:28 +0000
Message-ID:
 <ae2a37beca1f81016a97df2e521351c4f79f153a.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 27341c5c-d8c9-42ff-b62b-08ddd5d3c58a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OGQyVTdO3Lf/Szu33R3gUcKJIM2/W1IYPe45qLb3mY80YPFy9m8S9N3RNN?=
 =?iso-8859-1?Q?3wKhDuyQ48aOhrmrY0ykyH3BYC4rqUkU59j5pbEoXyPeKzWa6gFhZXCcW6?=
 =?iso-8859-1?Q?IZrGxH5405eRmLPoSJgbZKUQ9CWJP6m7EYSc+6at3hfTlmyWsIiu33d86L?=
 =?iso-8859-1?Q?TnWi2kvxqZ4kxOJn+uHdcFpJFPUC9o39VuCz5d90zoa+5xAuoTlsmS86q8?=
 =?iso-8859-1?Q?5FtxzaQND24GdhEWthIyNg73AbG6OvGkHuFifnFvOh53QmEk3t38Whkn8B?=
 =?iso-8859-1?Q?IHTbIM4ipucNI7+bybi5qz8reU4x3hsyhK2Jc+SuJHD2RaqE3VTs1LKoK7?=
 =?iso-8859-1?Q?Ke6YXTi4Lxl+FznOVjcI2p2ai6Xdz9wj2+mRgTNwM0TC93REzF2cPCxxPG?=
 =?iso-8859-1?Q?V8pAqiu26s3RNxWmdGcjbKOVr6ZClh31dRhTvXV5y7HKl2TdE9N+R6GgkL?=
 =?iso-8859-1?Q?jZ+Id3xzU80kZzVeOugIeGNROOvpTp/oZNdTy4e52skbSTw7pmGjXGjbs/?=
 =?iso-8859-1?Q?t7YFyJ4g99DTzcFzAB6dBLdJQIgnn249cb/V174nLm31Uocsbll/zGzMCV?=
 =?iso-8859-1?Q?b9UoGEIP7atWbJmxA22veqhRPt+q6Fwnzm0azn8rBWKK+nkX1SskXBalme?=
 =?iso-8859-1?Q?f5K5+q+jg+5QB0UxDc8BNgjFZzpsoroDzmLBqEuJF7pykHW9gaVKtDxJoT?=
 =?iso-8859-1?Q?4QUvmGEpYxsezTin+ebhVWGHwqJXcQ2ub86zHvca+fgunINHHMczvXxRTb?=
 =?iso-8859-1?Q?l7+272vfh5y/V8z+ltUmY1/ltGIYCCUzY71esG12hb4ZOMM1bPMNu7GVye?=
 =?iso-8859-1?Q?RxjQgaqV3pv0F2ZFOPzB3y1W9FFIuQ2lCvfxfpPJKuQAMeeGUmRxW+x+Lf?=
 =?iso-8859-1?Q?cbbKsKG0kS2e3335K2mG9mJZUc6U2o2AU2LEi0VirdoG9GFg7teOlbhYAt?=
 =?iso-8859-1?Q?9+xTtTJTvGuBvQXBUwE8ThKqAKkIweySrf9SRLvg6/sxc3RCgBR3yHYzbh?=
 =?iso-8859-1?Q?GY0+i6mhuPeWT/3OU1B+MqnUb1CdjbOOX8Ixydc1UYJ0m16agwmMJ9/22w?=
 =?iso-8859-1?Q?giUlhjMGkEcxPJp6qDbPYI7lg2bxkX1QGRD3aZP3HWmY8vHQozL2TOG/8T?=
 =?iso-8859-1?Q?ROWzOtL//+RF2YEv2Hh9/k2x0g0Zr85FBndwWocY+WfHb4KQaQZ6lyjshi?=
 =?iso-8859-1?Q?yXgmwMwib1OHPbALfUqImRLCdKD02F5V3M7nKRMDH6VPHVzjhmTo+9hUse?=
 =?iso-8859-1?Q?qVrT7ffvuyv4d3v3D0w59iQQo1ev+Cc9cYbI9FtybZD8zOfuSp257RpCR/?=
 =?iso-8859-1?Q?VMcysK93WQpkoJHfATkL2N+dfB4fLASP7Gl3pVdFBLXlovqRmjpLDJP6Fa?=
 =?iso-8859-1?Q?sKOfr1Q7FO0IEk69BQUcprg7Ccl/8rjnf23Hg78F9qf0zbBsnBYKA47dBz?=
 =?iso-8859-1?Q?grMYQSCXpF1qSxNDrukXBhL+FRtjhhI9ASUGzeZxufkVen23gML2XzgYH+?=
 =?iso-8859-1?Q?gwex5GEMPcYF39w4jpc3Ksz7hEdIbwecgyLMmsbUIlkQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xcRE77neETtlOnNm4NV3Z5JiLmAZ/r/EWs9plLih1K1sptLV+V5dzlTxwW?=
 =?iso-8859-1?Q?IFbGBzDAC0FbTL4ZLdaeCoy9jCKC7FpAC2nPllexpN/zM/UBxGofMsNWwU?=
 =?iso-8859-1?Q?INQrmcQPl7x3hQKgO8iCRxM2Xj3d5B7fjJVhO4sWHyr6R4lZEQTq1N4+J/?=
 =?iso-8859-1?Q?0xzAqukcDv8BJERInMQTTZxHENx1ucY5jBdt1nHLWRAQ4N4oZH9hWi+nyq?=
 =?iso-8859-1?Q?69yteWMHVxlgHYuiZCGn2LBOjiHfVuTaOi6F1/X/3LmckdTilAEw9yoFvX?=
 =?iso-8859-1?Q?1NF0sDQnfte4lLFKywe8BYLI/G5U3w567j+oj9z0C7lSueRgnQpsqTNDDH?=
 =?iso-8859-1?Q?BxmK1HRS/oi+DggVRy+QbJl1WgY8gMhYcni55XobuEO7De/cdX/kbtNzyX?=
 =?iso-8859-1?Q?FaJoFz7aN1d45qE76/l0IkDC72MayKyPfNVzuR0QbIr46afOyDWtse02z7?=
 =?iso-8859-1?Q?2GJ6SdGyuvkBSJIwwyp2rRLWioHYK/3iLT7sQtElOqRvyndN3IV7rps/65?=
 =?iso-8859-1?Q?twyok6x7td03Ej2KEgCjEaoKyd+ANbx8TUoiD8eHmrshwKRgRveJEKJtHI?=
 =?iso-8859-1?Q?ffgyXG5ya/LRLd3CsLJ6o+X1OIyYu8J+BiKh2/aCXV47nGmLxbcdmFzrWU?=
 =?iso-8859-1?Q?vt0llUER6bSGeyT1YobCTtMDOpCIfUK32xNPXwHbXXnzMjOdXOXecTSOv1?=
 =?iso-8859-1?Q?Yrt8GKhlMZnZ1oIUl+nX54JgIpBteJGgSejUt8aIeftMIiZsAey82S7hol?=
 =?iso-8859-1?Q?iBaxQ6l1TV6bLXjqrMP8FFr+42nEe7AM9IOvzzdRSOIXKZtzZzkJsMdtHM?=
 =?iso-8859-1?Q?g0jnshh1wlTWgMEfzueKpDz7c2k0beO47uxZ+w9v0We9lqN8Cv6SJFwk0l?=
 =?iso-8859-1?Q?/Cwl7qCEncyR1781Ev/MNQZT8blGUtDZMiGtULlPeVKvG9dbT4p5VD/JXE?=
 =?iso-8859-1?Q?tX9NakFiG53w9Lj3A6uiR+/fpEGAkOMc3Iw2C99NIZ+6yDzx2uKWvVnPAS?=
 =?iso-8859-1?Q?90SnWsQn8z8XbGMg2Ng/6S1WIeWXEe6nWeGvsknO7942FD7uwFXEOk/smp?=
 =?iso-8859-1?Q?0mIDTYZ9iuXsB/7JYo4t2k/h37aZ707/XmQIeppHey158B3E0Kk7N8wfpS?=
 =?iso-8859-1?Q?ZE6fa6GeqEVb17HPitCA/fXHZy7X8D7ybV5beSXyLmmH1DjPIJ0U8qUTef?=
 =?iso-8859-1?Q?GV7KDk1SD56sJKRCahEPsW/7NwJoS+Kr1DdFuSrJyNiXI9IvnC0CTn+F6K?=
 =?iso-8859-1?Q?wF6PVZujJcetL6MvyiSOjuFD4IKzcw6IKF9SumnFC6CcCKu4ETY5TmnCFJ?=
 =?iso-8859-1?Q?dFdmb/B38TOI7tpQaooQwHJaXvCMAS8Y2e/qV+M4l4CICtKpKAseFTfcoA?=
 =?iso-8859-1?Q?43Dk7sHq8PGwQ4W15qY9oH39n5nuJkQ7hLribqIbEfTF4vL1xKsP67T+JR?=
 =?iso-8859-1?Q?7x5yeTtjOeavzmB4jqQexeyYM0zdq0j9uxeHw+BHJUWn+pz8e841QieLe8?=
 =?iso-8859-1?Q?vYMAsKZr+twkZFV2kggcsZ104he43z1oAXVAmzhpsazqdP7e/fRek81+JP?=
 =?iso-8859-1?Q?r6Xs31f8T57vWzXwHRlEcClFqDF0MKpPDN648uMTxCGXfncpBJCzzCYLR3?=
 =?iso-8859-1?Q?78b02Usa2Z+YNGo1q2cZw3o26TRewyZyH0RkDF3CXs3+3cZb0+PEWbjg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27341c5c-d8c9-42ff-b62b-08ddd5d3c58a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:28.5033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eyy9dMI9904W4IufNdjF5pRUIzpqECV9Swc0nttKmPh4HpSSOxsT+qVjbZtLeiy5ST0YsM+i4pEjllq3e/iZvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

"iommus" property will be added for dom0 devices to virtual
IOMMU node to enable the dom0 linux kernel to configure the IOMMU

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 50e4f5fee4..9d2b0ea928 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -537,9 +537,12 @@ static int __init write_properties(struct domain *d, s=
truct kernel_info *kinfo,
             continue;
         }
=20
-        if ( iommu_node )
+        /*
+         * Expose IOMMU specific properties to hwdom when vIOMMU is
+         * enabled.
+         */
+        if ( iommu_node && !is_viommu_enabled() )
         {
-            /* Don't expose IOMMU specific properties to hwdom */
             if ( dt_property_name_is_equal(prop, "iommus") )
                 continue;
=20
--=20
2.43.0

