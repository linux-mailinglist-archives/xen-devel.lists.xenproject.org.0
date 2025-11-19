Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF8C6F052
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166056.1492696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiXX-0005MQ-4c; Wed, 19 Nov 2025 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166056.1492696; Wed, 19 Nov 2025 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiXX-0005K1-0r; Wed, 19 Nov 2025 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1166056;
 Wed, 19 Nov 2025 13:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBIH=53=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vLiXV-0005Jv-5V
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:48:05 +0000
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c405::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5b5695-c54e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 14:47:58 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SE1PPF0B96CE885.apcprd06.prod.outlook.com
 (2603:1096:108:1::408) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 19 Nov
 2025 13:47:34 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 13:47:34 +0000
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
X-Inumbo-ID: 5a5b5695-c54e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXrdBfiKZ3f+BQqhwmBdMCFrjUaXpAq0z3B8lDI3Djom2kbp2XgGSduIjiZFxquRSTI4A2ZigJ4OL9V3XAsz5D98zUi/k4edEmTffdyFpK029YYJLIRdv/8Xok79l2CHuAhPaaYNwMuUvfnYJOeeG4vYeCq/0g6tjnOp0YNzIZn4j6ivNjoLOKm1a7+lmR5ZEqVNMQ2vOCsiwz2+Wqj/NMjDZzvDUqRBsv4UdYPgig34MTTBmQQlCLR9zs7sU1BsySMePvcbO7ma7bzUS2a2e5fc6IB6cZ0ntCtTNWCYMVRE6QKfjGeEKgtzcNzyCaGhMHDQJDqWxCth+24noKtWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgekb5CaypElNKJQWk8fX4QMHEBy462BkQmLzLvlNV8=;
 b=Cgcd+G0Un+PvgHThxo8pcAGzc9ggbI0vWmMvGMjEDHDjZIJtkMWt9sce8nShUMr5Xl/9noqVlGZRMwGfvhoC8sMRERlwcAYAFll7ZGmpdxLXSKYtSavxCOXwCAIaBWX2B2+QhMONbruu0IRoWjQfzmjM17ET4N3uOLs5epI7ifRfcIAzWWHDfeMmeyKYednombOHZmrhmtiT1nu8B1WEybt+VwVkJxpeh6LU4az/YdkBEcnEDDuGOW58JYfBqYy1zdkJi2wqaA7E2lGK9fI01td3DncVLNqD+Sd7zd1ViWzy0mxoJecUxApv7VGrBS0D9CJGFWWqSw4Y9/tYyO03sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgekb5CaypElNKJQWk8fX4QMHEBy462BkQmLzLvlNV8=;
 b=Jdnz9uqfqKXRVVW1DaB6kJ2a36VmN42vBzwuISRsK0Ac8NED6sXenOA4GqXf7UHL2rF1wDixHlL3UikjIclflvvk3vii56YtgxvbGFydInlmHEjs6EMVuqSZ8jj09z5NJV0XEXImjHPX54ay1LkPix76EdX9DKGShLleW01Ak50cWmrdxurMeftdVQbkW4ZDt/z7PfJr0S9bn+notdS7DzpgXSnSh8AW/GJlGKFO4RYtqKjvAAXSPgDP5zHI/LxSEi5QTjXUi23heQQnXzZy8FnX2ySwLGGOlanvnXZ6AJCxlf4/Q83XWppWgAmCDYw81PXdoAkKg8xMi1xl2gL8nQ==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Mohamed Mediouni <mohamed@unpredictable.fr>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Driscoll, Dan" <dan.driscoll@siemens.com>, "noor.ahsan@siemens.com"
	<noor.ahsan@siemens.com>, "fahad.arslan@siemens.com"
	<fahad.arslan@siemens.com>, "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
	Haseeb Ashraf <haseebashraf091@gmail.com>
Subject: Re: [XEN PATCH] xen/arm/p2m: perform IPA-based TLBI for arm64 when
 IPA is known
Thread-Topic: [XEN PATCH] xen/arm/p2m: perform IPA-based TLBI for arm64 when
 IPA is known
Thread-Index: AQHcTlJkrRvi9xUbREKbU/4GUfXtUrT1Vd2AgAMhG4c=
Date: Wed, 19 Nov 2025 13:47:34 +0000
Message-ID:
 <KL1PR0601MB45885BEB1C85C8AAFDD062CFE6D6A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References: <20251105124727.142272-1-haseebashraf091@gmail.com>
 <cf7ab262-59f4-4f92-8194-be16b56ccbdc@xen.org>
In-Reply-To: <cf7ab262-59f4-4f92-8194-be16b56ccbdc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: mohamed@unpredictable.fr
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-19T13:47:33.492Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SE1PPF0B96CE885:EE_
x-ms-office365-filtering-correlation-id: d89439c2-83b9-445e-7cf0-08de27723167
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|39142699007|31052699007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qhyWX5vHN25uDQPqIWJzHFuVCFh6U6Z8XNf+V+kQy4IHS5G3UTT9sLlvvD?=
 =?iso-8859-1?Q?Ake4CtQKoMsKU9FZXpvC/yb3/JIhbjjrccu7ewX62qLsl1pK67Fen8wH5z?=
 =?iso-8859-1?Q?9pA8rtkhYyQ51iymUmLkqzFk39wqtjy7Xps3OnNVqBU/asQyhRbNhTDGv0?=
 =?iso-8859-1?Q?TuWW8bJnoL2ejsWqxHRqKccNJqj2XNlSwfz6xz0i2GF0FbZ4LeMkVdbvrT?=
 =?iso-8859-1?Q?gJZkO6nmAcswMcVSYFyPTDFGzlQolr08jGJmyTZSiHyNB/LjKGBT97qrQV?=
 =?iso-8859-1?Q?nkjxwVTIWDb3oT5MDckMbpFC7+C2pBcVWtzg7r6jvs/exSzJyOC1sTilWA?=
 =?iso-8859-1?Q?qO5xekqcQrmjz09O+O7CBQFsCu7ULFR3ysopQH8ol+V2XTnS4VROHFv8eX?=
 =?iso-8859-1?Q?dTIFG9fJGKBKsxqsSS5Quxk4O4QdXuJoDAlmCDny9ed5tuDatiosw9S5W1?=
 =?iso-8859-1?Q?Xp3vGTBhXflNKpbgDt5Q+ZDpr99R6zc+1cw4htusJTArBnNB8Dk+bG+vcb?=
 =?iso-8859-1?Q?76hvJq0BqyjioDahgsZaLJbZ1Oc1CU8jw4UhnqROSdZi51VHK+Opk95efO?=
 =?iso-8859-1?Q?cnJ4s6EyWj/ZqlwfUN6cwkxhsdnac/yiT+FpVrynpNpc3KuxdZmFP9x8PS?=
 =?iso-8859-1?Q?mm73MMjEC3e64ONU01bjq3CM0npivxHQbH3YwNmaUUdvaZ5oIArQ2JtW04?=
 =?iso-8859-1?Q?j+okRbwFTk7VTGWcpY+5piOlhSwkHx4HFd41yOJisZJIQvM32k0inG9GuS?=
 =?iso-8859-1?Q?ffIfgmEImUQZvjvw5WAi19yddd/uBqcNvhlfCLj+Yydx01KC9N+VzSgag9?=
 =?iso-8859-1?Q?zPK8zYfHwA4h6aX86mA+QuCFRrM+6Y8Lzelc2q12hLRYuDB13B/YlNTd3T?=
 =?iso-8859-1?Q?s2voVZqIuBHCoLmN+m6j0K9TfFB3Wc3gKihWv6rEa+GbIYZDrbmb2uLFh0?=
 =?iso-8859-1?Q?bJ/BX+FrLrX5OF0ENOOu8lVV6MQ/t4PGJgyQL1en2sapZb423LO73L+b2y?=
 =?iso-8859-1?Q?NdvN8HYGEn0taVX8PQ2es4XsznLH4j11/4+gLWJpfKVYOITNTdN+vsPVme?=
 =?iso-8859-1?Q?eTeTQnfhgws6MTCkq2TFCAq2IUKTYvcWyN3E6Hj0sYu03El0HMNkc6Nd2u?=
 =?iso-8859-1?Q?9tNw94wrsQPdsFsoMVDR2ZJke3hgct5vyffuH0Q+lfirkroYLankRK7UYu?=
 =?iso-8859-1?Q?DLzNIW9SQD5o9VTcpziONaCof323chjIWSb2YugcDwrj4U3mwtQMvabztw?=
 =?iso-8859-1?Q?cXg3NM7+ta3rHK6nOjRRWqYV3QtFnUHSAdzEWB1Bpoe3oLAWYKN20/UFII?=
 =?iso-8859-1?Q?QyS1NUMgSw2hTtNCtv5DCvpJbkkez2fvqwWfi31Y4AqW+BUZotYr3etSsO?=
 =?iso-8859-1?Q?nyGm5Xa6mWl2PZ8fcdJcN1AJiTtaUxncccCvKYuCUIoCnUvfia4MG4Wi19?=
 =?iso-8859-1?Q?Oj+JpHeZ7e3If/gOSI1/CnW3tM1NsxD0KyvJ8MIzXLkoLxT5WeeybYTknD?=
 =?iso-8859-1?Q?fAVcIy9Vy/0BU14vsMkDtMwN6nPREPe6qDBuP9nlgbpQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(39142699007)(31052699007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LpM7srCgVYg/6KyGg+rCz4pQvAoMzz7m8wAQIrIGmDpxtN+XltlxGC8kPq?=
 =?iso-8859-1?Q?MtBvKbYfg7uWBh+hb9uzd12HYeOCXp9jtcbAdRqp7KqstbxhID8PQk+YsA?=
 =?iso-8859-1?Q?N22Vb8kBM928aPQOtefCVsd6syi6oyT3QHecg+6vBk5N5cChJ25TraIe0V?=
 =?iso-8859-1?Q?fJ0OF7JlaYBuRW0xlUB3r21RY+cuTiN24lMGzNFAtxRivMwFJq9W9f6TaU?=
 =?iso-8859-1?Q?H6oO4gLynIMJpbo9Iki722tGPq2HbC/ZQ5Zh+/4q/AqQ6D0AAF9/N9+eGl?=
 =?iso-8859-1?Q?qYWw5G3VfrmH7lrtDiR/GLA3EkMqGo7tXyLtmTk4cvyAX2KMc1mIm1MmJo?=
 =?iso-8859-1?Q?9O27GiDYYEUrmf6+VEuT64OipYkVZMBJkbxOZnC9qbAvzVgwksEx4KZea7?=
 =?iso-8859-1?Q?emMA0vWdx7NNdGDVZv1BYHxRQKnxybfmURp1C6Y85gD5BgLFifzUL7Quge?=
 =?iso-8859-1?Q?/P+NU1cuc0IN9wLl7qNjj9s2XYb6I3uZVyeBmgi7CLrGwFLdcobIOvDxUz?=
 =?iso-8859-1?Q?ZYrLIA/fujNq6O7hyzGCWndwzkiUn583aF34VXdUxNvfLvJvGE/M9XF6MA?=
 =?iso-8859-1?Q?kjdJa39H8i4BdfxcO95SZYKgBSFsEO6DG7sJpS/DlblTD2juemXUk30Aw7?=
 =?iso-8859-1?Q?uXZ27a/ONPzMDhqJr4u7Jtwc0KTaykBpQvG+4jyorqjm04Y4MAo4HsPEn3?=
 =?iso-8859-1?Q?GVy0Wh5hY0Bmk+YSBx1+jDIsmzqFS+1xFwHQl2fy7XsU8r+De/Cc3g5G0T?=
 =?iso-8859-1?Q?UWDTKx8pJoQH4pAIKxDkpmha4TtfMqC+LQSUv+5QHe8DRwryErYK3uth/r?=
 =?iso-8859-1?Q?KyHgEWtIHy6FJS3ZFvOHJ7cs149cT/vy7WNeCCnZFTCncOL3rFtl008Dbu?=
 =?iso-8859-1?Q?OF7IE5QUHZTwB5786Z0Tzvv7liphO5TBD7uS21KNx9OLFIR5JP1v7fckmo?=
 =?iso-8859-1?Q?UuFWEAOeXZ5aL0efRPxpxMib+/U58vqMbydsNjyQLoNesOu41rPZ+3NveW?=
 =?iso-8859-1?Q?RxVNALUana41GuZ+eplOBCuUPHnPjSQ5XkTVyP+sBWRjJvZG3lvaPcIrXd?=
 =?iso-8859-1?Q?a/6go6yhHJl6KYfoLhMUb2ytctuORahNC424FkD4J9KT/OLfiLBniyXWor?=
 =?iso-8859-1?Q?irG3ddYn3HvKGC7GpILjqkt5iajy8CFavNNN3KDMuvmmFyPM1GG1gbPL9i?=
 =?iso-8859-1?Q?TpzWCfZ9ALMnz4PVTklkRZXJsvMHo+1H+m23kkmIdeQmZ6GmKJ8uyBdtIJ?=
 =?iso-8859-1?Q?2gvnf5EAiSDnO1kIK5c1l+EVJgJPpi69hWyEHkH1KQ5lSXysBRi96zCXj0?=
 =?iso-8859-1?Q?OimrCPwFRDVJevnx45iet3qmqXyXG4M3BZkdFmry+RTyjvnM0Dzxn781Me?=
 =?iso-8859-1?Q?UsPb/76xXcvEG0+hG0Z/a9aGn/IGaL7VpQnNal9Z2a4CYiZEzi6r8S5x+i?=
 =?iso-8859-1?Q?3CWou6JzjcntmFIvX1eIPIoVIwWqnC+t95B3lUl5Pi0IanUohxBt6p+Ynz?=
 =?iso-8859-1?Q?uEDbFNzeIRebYavhgYh2lFyTMEJ/lrt+81zdCThxp7oBzOuIsqZVXKyruZ?=
 =?iso-8859-1?Q?Exbih2/CtUMUFkvPlehrhpYfUtZjoJmg7giRMRDnp30YFBS8/FvEcKNn+0?=
 =?iso-8859-1?Q?lCulS8MoB4Qllgp49NHC4FL7GZrF37jYfA?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB45885BEB1C85C8AAFDD062CFE6D6AKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89439c2-83b9-445e-7cf0-08de27723167
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 13:47:34.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YS9BnANendod8u4/5NlujUQcIi0ojMS13O+aW/T1FQvwo72J3aN6QGKNmgq/m/p1EB9XE9ty8emcnIbEirh+41tDj93M6QjoiMqcNqqHCio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF0B96CE885

--_000_KL1PR0601MB45885BEB1C85C8AAFDD062CFE6D6AKL1PR0601MB4588_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for your review.

> > The first one is addressed by relaxing VMALLS12E1IS -> VMALLE1IS.
> > Each CPU have their own private TLBs, so flush between vCPU of the
> > same domains is required to avoid translations from vCPUx to "leak"
> > to the vCPUy.
>
> This doesn't really tell me why we don't need the flush the S2. The key
> point is (barring altp2m) the stage-2 is common between all the vCPUs of
> a VM.

Alright, I'll update the commit message in version 2.

> > This can be achieved by using VMALLE1. If FEAT_nTLBPA
> > is present then VMALLE1 can also be avoided.
>
> I had a look at the Arm Arm and I can't figure out why it is fine to
> skip the flush. Can you provide a pointer? BTW, in general, it is useful
> to quote the Arm Arm for the reviewer and future reader. It makes easier
> to find what you are talking about.

Okay. This was pointed out by @Mohamed Mediouni<mailto:mohamed@unpredictabl=
e.fr>. From Arm Arm:
> Translation table entry caching that is used for stage 1 translations and=
 is indexed by the intermediate physical
> address of the location holding the translation table entry. However, FEA=
T_nTLBPA allows software
> discoverability of whether such caches exist, such that if FEAT_nTLBPA is=
 implemented, such caching is not
> implemented.

> > +/*
> > + * FLush TLB by IPA. This will likely be used in a loop, so the caller
> > + * is responsible to use the appropriate memory barriers before/after
> > + * the sequence.
>
> If the goal is to call TLB_HELPER_IPA() in a loop, then the current
> implementation is too expensive.
>
> If the CPU doesn't need the repeat TLBI workaround, then you only need
> to do the dsb; isb once.
>
> If the CPU need the repeat TLBI workaround, looking at the Cortex A76
> errata doc (https://developer.arm.com/documentation/SDEN885749/latest/)
> then I think you might be able to do:
>
> "Flush TLBs"
> "DSB"
> "ISB"
> "Flush TLBs"
> "DSB"
> "ISB"

Yes, I did not use dsb/isb inside this helper TLB_HELPER_IPA(). That's what=
 the comment explains that the caller is responsible to call isb/dsb outsid=
e as it can be invoked in a loop. So, dsb() and isb() should be added befor=
e and after the loop where this is invoked in the loop. (I forgot isb() in =
my patch, I'll update that). And I kept the sequence with repeat TLBI worka=
round same as used in TLB_HELPER_VA() and it is also same in Linux Kernel: =
https://github.com/torvalds/linux/blob/master/arch/arm64/include/asm/tlbflu=
sh.h#L32.

> > diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/=
asm/mmu/p2m.h
> > index 58496c0b09..fc2e08bbe8 100644
> > --- a/xen/arch/arm/include/asm/mmu/p2m.h
> > +++ b/xen/arch/arm/include/asm/mmu/p2m.h
> > @@ -10,6 +10,10 @@ extern unsigned int p2m_root_level;
> >
> >   struct p2m_domain;
> >   void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
> > +#ifdef CONFIG_ARM_64
>
> We should also handle Arm 32-bit. Barring nTLBA, the code should be the
> same.

Okay, nTLBPA feature is also available on Arm 32-bit. I'll update this.

> > diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> > index 51abf3504f..28268fb67f 100644
> > --- a/xen/arch/arm/mmu/p2m.c
> > +++ b/xen/arch/arm/mmu/p2m.c
> > @@ -235,7 +235,12 @@ void p2m_restore_state(struct vcpu *n)
> >        * when running multiple vCPU of the same domain on a single pCPU=
.
> >        */
> >       if ( *last_vcpu_ran !=3D INVALID_VCPU_ID && *last_vcpu_ran !=3D n=
->vcpu_id )
> > +#ifdef CONFIG_ARM_64
> > +        if ( system_cpuinfo.mm64.ntlbpa !=3D MM64_NTLBPA_SUPPORT_IMP )
>
> If we decide to use nTLBA, then we should introduce a capability so the
> check can be patched at aboot time.

Alright, I need to go through how a CPU capability is added in Xen. Any com=
mit I can use as reference?

> > +        /*
> > +         * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to alloca=
te
> > +         * TLBs entries because the context is partially modified. We
> > +         * only need the VMID for flushing the TLBs, so we can generat=
e
> > +         * a new VTTBR with the VMID to flush and the empty root table=
.
> > +         */
> > +        if ( !cpus_have_const_cap(ARM64_WORKAROUND_AT_SPECULATE) )
> > +            vttbr =3D p2m->vttbr;
> > +        else
> > +            vttbr =3D generate_vttbr(p2m->vmid, empty_root_mfn);
> > +
> > +        WRITE_SYSREG64(vttbr, VTTBR_EL2);
> > +
> > +        /* Ensure VTTBR_EL2 is synchronized before flushing the TLBs *=
/
> > +        isb();
> > +    }
>
> I don't really like the idea to duplicate the AT speculation logic.
> Could we try to consolidate by introducing helper to load and unload the
> VTTBR?

Okay, I'll create helpers for load_vttbr() and restore_vttbr().

> > +
> > +    /* Ensure prior page-tables updates have completed */
> > +    dsb(ishst);
> > +
> > +    /* Invalidate stage-2 TLB entries by IPA range */
> > +    for ( i =3D 0; i < page_count; i++ ) {
> > +        flush_guest_tlb_one_s2(ipa);
> > +        ipa +=3D 1UL << PAGE_SHIFT;
> > +    }
>
> In theory, __p2m_set_entry() could modify large region. For 1GB region
> it means the loop would send 262144 TLB instructions. This seems quite a
> lot.
>
> If the region is a superpage, then you might be able to send a single
> TLB instruction (need to confirm from the ARM ARM).
>
> If the region contains multiple mapping, then I wonder whether it would
> be better to flush the full S2. Not sure what would be the threshold.

__p2m_set_entry() invokes p2m_force_tlb_flush_range_sync() only after split=
ting the superpage. Therefore, I think it would require invalidating w.r.t.=
 normal page size. IPAS2E1 does not have any input argument to specify supe=
rpage size, only base address and translation granules of 4K, 16K and 64K.
I'll do some profiling and let you know of threshold for full S2 invalidati=
on vs IPA-based S2-invalidation in my use-case.

> > @@ -1090,8 +1169,13 @@ static int __p2m_set_entry(struct p2m_domain *p2=
m,
> >           p2m_remove_pte(entry, p2m->clean_pte);
> >
> >       if ( removing_mapping )
> > +#ifdef CONFIG_ARM_64
> > +        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
> > +                                       1UL << page_order);
> > +#else
> >           /* Flush can be deferred if the entry is removed */
> >           p2m->need_flush |=3D !!lpae_is_valid(orig_pte);
> > +#endif
>
> To emphasis on what I wrote above, this is one of the reason I would
> strongly prefer if we had support for p2m_force_flush_range_sync() on
> Arm 32-bit. This would make the code a lot simpler and easier to reason.

IPA-based TLBI (TLBIIPAS2) exists for Arm 32-bit only after armv8a.
For simplification, we can wrap p2m_force_tlb_flush_sync() in p2m_force_tlb=
_flush_range_sync() for Arm 32-bit for older architectures where this is un=
supported. How an architecture-specific feature is implemented? like this o=
ne is supported only after armv8a and range TLBI is supported only after ar=
mv8.4a. Any reference example would be helpful.

Regards,
Haseeb

--_000_KL1PR0601MB45885BEB1C85C8AAFDD062CFE6D6AKL1PR0601MB4588_
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
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Julien,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for your review.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; The first one is addressed by relaxing VMALLS12E1IS -&gt; VMALLE1=
IS.<br>
&gt; &gt; Each CPU have their own private TLBs, so flush between vCPU of th=
e<br>
&gt; &gt; same domains is required to avoid translations from vCPUx to &quo=
t;leak&quot;<br>
&gt; &gt; to the vCPUy.<br>
&gt;<br>
&gt; This doesn't really tell me why we don't need the flush the S2. The ke=
y<br>
&gt; point is (barring altp2m) the stage-2 is common between all the vCPUs =
of<br>
&gt; a VM.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Alright, I'll update the commit message in version 2.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; This can be achieved by using VMALLE1. If FEAT_nTLBPA<br>
&gt; &gt; is present then VMALLE1 can also be avoided.<br>
&gt;&nbsp;<br>
&gt; I had a look at the Arm Arm and I can't figure out why it is fine to<b=
r>
&gt; skip the flush. Can you provide a pointer? BTW, in general, it is usef=
ul<br>
&gt; to quote the Arm Arm for the reviewer and future reader. It makes easi=
er<br>
&gt; to find what you are talking about.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Okay. This was pointed out by <a class=3D"tWKOu mention ms-bgc-nlr ms-fcl-b=
" id=3D"OWAAM424008" href=3D"mailto:mohamed@unpredictable.fr">
@Mohamed Mediouni</a>. From Arm Arm:</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; Translation table entry caching that is used for stage 1 translations =
and is indexed by the intermediate physical</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; address of the location holding the translation table entry. However, =
FEAT_nTLBPA allows software</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; discoverability of whether such caches exist, such that if FEAT_nTLBPA=
 is implemented, such caching is not</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; implemented.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; +/*<br>
&gt; &gt; + * FLush TLB by IPA. This will likely be used in a loop, so the =
caller<br>
&gt; &gt; + * is responsible to use the appropriate memory barriers before/=
after<br>
&gt; &gt; + * the sequence.<br>
&gt;&nbsp;<br>
&gt; If the goal is to call TLB_HELPER_IPA() in a loop, then the current<br=
>
&gt; implementation is too&nbsp;expensive.<br>
&gt;&nbsp;<br>
&gt; If the CPU doesn't need the repeat TLBI workaround, then you only need=
<br>
&gt; to do the dsb; isb once.<br>
&gt;&nbsp;<br>
&gt; If the CPU need the repeat TLBI workaround, looking at the Cortex A76<=
/div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; errata doc (<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D=
"OWAf205ea90-4efa-1a31-9b8f-c484d8c948ad" href=3D"https://developer.arm.com=
/documentation/SDEN885749/latest/">https://developer.arm.com/documentation/=
SDEN885749/latest/</a>)</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; then I think you might be able to do:<br>
&gt;&nbsp;<br>
&gt; &quot;Flush TLBs&quot;<br>
&gt; &quot;DSB&quot;<br>
&gt; &quot;ISB&quot;<br>
&gt; &quot;Flush TLBs&quot;<br>
&gt; &quot;DSB&quot;<br>
&gt; &quot;ISB&quot;</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, I did not use dsb/isb inside this helper TLB_HELPER_IPA(). That's what=
 the comment explains that the caller is responsible to call isb/dsb outsid=
e as it can be invoked in a loop. So, dsb() and isb() should be added befor=
e and after the loop where this
 is invoked in the loop. (I forgot isb() in my patch, I'll update that). An=
d I kept the sequence with repeat TLBI workaround same as used in TLB_HELPE=
R_VA() and it is also same in Linux Kernel:
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA376d7870-d8f5=
-e504-3ba0-53ea60bf0fec" href=3D"https://github.com/torvalds/linux/blob/mas=
ter/arch/arm64/include/asm/tlbflush.h#L32">
https://github.com/torvalds/linux/blob/master/arch/arm64/include/asm/tlbflu=
sh.h#L32</a>.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/in=
clude/asm/mmu/p2m.h<br>
&gt; &gt; index 58496c0b09..fc2e08bbe8 100644<br>
&gt; &gt; --- a/xen/arch/arm/include/asm/mmu/p2m.h<br>
&gt; &gt; +++ b/xen/arch/arm/include/asm/mmu/p2m.h<br>
&gt; &gt; @@ -10,6 +10,10 @@ extern unsigned int p2m_root_level;<br>
&gt; &gt;&nbsp;&nbsp;<br>
&gt; &gt;&nbsp;&nbsp; struct p2m_domain;<br>
&gt; &gt;&nbsp;&nbsp; void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)=
;<br>
&gt; &gt; +#ifdef CONFIG_ARM_64<br>
&gt;&nbsp;<br>
&gt; We should also handle Arm 32-bit. Barring nTLBA, the code should be th=
e<br>
&gt; same.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Okay, nTLBPA feature is also available on Arm 32-bit. I'll update this.</di=
v>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c<br>
&gt; &gt; index 51abf3504f..28268fb67f 100644<br>
&gt; &gt; --- a/xen/arch/arm/mmu/p2m.c<br>
&gt; &gt; +++ b/xen/arch/arm/mmu/p2m.c<br>
&gt; &gt; @@ -235,7 +235,12 @@ void p2m_restore_state(struct vcpu *n)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * when running multiple=
 vCPU of the same domain on a single pCPU.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( *last_vcpu_ran !=3D INVA=
LID_VCPU_ID &amp;&amp; *last_vcpu_ran !=3D n-&gt;vcpu_id )<br>
&gt; &gt; +#ifdef CONFIG_ARM_64<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( system_cpuinfo.m=
m64.ntlbpa !=3D MM64_NTLBPA_SUPPORT_IMP )<br>
&gt;&nbsp;<br>
&gt; If we decide to use nTLBA, then we should introduce a capability so th=
e<br>
&gt; check can be patched at aboot time.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Alright, I need to go through how a CPU capability is added in Xen. Any com=
mit I can use as reference?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ARM64_WORKARO=
UND_AT_SPECULATE: We need to stop AT to allocate<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TLBs entries =
because the context is partially modified. We<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * only need the=
 VMID for flushing the TLBs, so we can generate<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a new VTTBR w=
ith the VMID to flush and the empty root table.<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !cpus_have_const=
_cap(ARM64_WORKAROUND_AT_SPECULATE) )<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; vttbr =3D p2m-&gt;vttbr;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; vttbr =3D generate_vttbr(p2m-&gt;vmid, empty_root_mfn);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_SYSREG64(vttbr,=
 VTTBR_EL2);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Ensure VTTBR_EL2 i=
s synchronized before flushing the TLBs */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isb();<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; I don't really like the idea to duplicate the AT speculation logic.<br=
>
&gt; Could we try to consolidate by introducing helper to load and unload t=
he<br>
&gt; VTTBR?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Okay, I'll create helpers for load_vttbr() and restore_vttbr().</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; /* Ensure prior page-tables updates have comp=
leted */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; dsb(ishst);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; /* Invalidate stage-2 TLB entries by IPA rang=
e */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; for ( i =3D 0; i &lt; page_count; i++ ) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_guest_tlb_one_s=
2(ipa);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipa +=3D 1UL &lt;&lt;=
 PAGE_SHIFT;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; In theory, __p2m_set_entry()&nbsp;could&nbsp;modify large region. For =
1GB region<br>
&gt; it means the loop would send 262144 TLB instructions. This seems quite=
 a<br>
&gt; lot.<br>
&gt;&nbsp;<br>
&gt; If the region is a superpage, then you might be able to send a single<=
br>
&gt; TLB instruction (need to confirm from the ARM ARM).<br>
&gt;&nbsp;<br>
&gt; If the region contains multiple mapping, then I wonder whether it woul=
d<br>
&gt; be better to flush the full S2. Not sure what would be the threshold.<=
br>
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
__p2m_set_entry() invokes p2m_force_tlb_flush_range_sync() only after split=
ting the superpage. Therefore, I think&nbsp;it would require invalidating w=
.r.t. normal page size. IPAS2E1 does not have any input argument to specify=
 superpage size, only base address and
 translation granules of 4K, 16K and 64K.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
I'll do some profiling and let you know of threshold for full S2 invalidati=
on vs IPA-based S2-invalidation in my use-case.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; &gt; @@ -1090,8 +1169,13 @@ static int __p2m_set_entry(struct p2m_doma=
in *p2m,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m_r=
emove_pte(entry, p2m-&gt;clean_pte);<br>
&gt; &gt;&nbsp;&nbsp;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( removing_mapping )<br>
&gt; &gt; +#ifdef CONFIG_ARM_64<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m_force_tlb_flush_r=
ange_sync(p2m, gfn_x(sgfn) &lt;&lt; PAGE_SHIFT,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 1UL &lt;&lt; page_order);<br>
&gt; &gt; +#else<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Fl=
ush can be deferred if the entry is removed */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m-&=
gt;need_flush |=3D !!lpae_is_valid(orig_pte);<br>
&gt; &gt; +#endif<br>
&gt;&nbsp;<br>
&gt; To emphasis on what I wrote above, this is one of the reason I would<b=
r>
&gt; strongly prefer if we had support for p2m_force_flush_range_sync() on<=
br>
&gt; Arm 32-bit. This would make the code a lot simpler and easier to reaso=
n.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
IPA-based TLBI (TLBIIPAS2) exists for Arm 32-bit only after armv8a.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
For simplification, we can wrap p2m_force_tlb_flush_sync() in p2m_force_tlb=
_flush_range_sync() for Arm 32-bit for older architectures where this is un=
supported. How an architecture-specific feature is implemented? like this o=
ne is supported only after armv8a
 and range TLBI is supported only after armv8.4a. Any reference example wou=
ld be helpful.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb</div>
</body>
</html>

--_000_KL1PR0601MB45885BEB1C85C8AAFDD062CFE6D6AKL1PR0601MB4588_--

