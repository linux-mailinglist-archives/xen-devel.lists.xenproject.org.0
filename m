Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E5BB1BA72
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070891.1434515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMgg-0005VG-Dm; Tue, 05 Aug 2025 18:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070891.1434515; Tue, 05 Aug 2025 18:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMgg-0005Se-AP; Tue, 05 Aug 2025 18:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1070891;
 Tue, 05 Aug 2025 18:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMge-0005SY-SE
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:47:00 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c20ee2-722c-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 20:46:59 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9719.eurprd03.prod.outlook.com (2603:10a6:20b:60d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:40:20 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:40:20 +0000
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
X-Inumbo-ID: 91c20ee2-722c-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOEVOFs0rGtKx0nJ2SGYWjIOUBponGeoo4ceirBxBWNFOvBhy64t+QY5WIgz7idcxvtK7c2uWPhrJTfQ/sISLP52UUNkr6uVvLJtC56iMRz65byTQvKcHcepekRYesTaMyELGYzH9YGbNTv1our9pjPJ0oBZaYnb/sicQKaFLdNGoZQ6OebjBCSGf6NnfRQNnHY5M+fnPbl7b5PSHWWgzgp6Ee3EX5b9qzrkciXSYek0knj1ihrW33oBS0HsAkkmXzDZ9zI58ALZ9jW2pp76lLpAhzCSs9RlJTkCUnMlnFh55kQJTznMKdKOtPaasay3fD102eFJtvhHdJTBH7A1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxpuxyu0g9+Fu2b++6hLldY1aOTngd3gJou/wkyvr+0=;
 b=CpUXxVuZAhqvFG7/tnGSCVJzdgjSvbqkaG2P18tYL+ZBQiwg0nzypxHtyqU9hOSXr0u7KDNdHFRpf9l2F/NRBnq6Nhg8aljdnXWEXweGN8F2dmcUF7SxdmY/Qafz//KCy8OoWVEEVgFNbCdH0+Ux8mhpMOozv1nToZuZ6PanngD+dKiObcsmIRtlW2lBh9cRfhnz5n7zTQzxrqhXfc+5bM3nPYWFOetogb3gkQf0aRty7xNFzeKuCSXQg93HYC1xcDgXU/40RjdhCYhZknHxt1mI/aOMQxOfqMFLTylr7ONNBLKho4PPEjX+4NhWZXusKkkHlMB0RoHh1hz2coGhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxpuxyu0g9+Fu2b++6hLldY1aOTngd3gJou/wkyvr+0=;
 b=bd8dNFy6JKPs93uaIT2x6xxsng1429cWgaegj8rH5KiToLZxwUvm1jFHgTVyG1iwVV7BB04kzt6++Erdv612PoCacJCsDJqNnRHCzyxcGA833wa3h3QrFIseejcHbDEQU2fz29p/s2uJdvzo5XcE+8PkELjOjC0iNo3St0BBSjsiboWl7AbtaqU9cf0kLhIAazUdyhQBZQqyM4TPyIUUj0w6U+mc2dAtJvbhnA/D/Vrl13rm8yps/uXi1C+Xs4yW/8OyAqg0dSQsDpjMTS3OSn2l3XKaUvHJ3v+ZsmPp98WDnxlWRqvQWm+2qXvQo5jPLHZtyoZlaSnjJ83fhsqsfg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] xen/arch: irq: drop unreachable pirq callbacks
Thread-Topic: [PATCH v2 0/3] xen/arch: irq: drop unreachable pirq callbacks
Thread-Index: AQHcBjhlEY+RVNk+sUWW4VV5tSaw/Q==
Date: Tue, 5 Aug 2025 18:40:20 +0000
Message-ID: <20250805184003.202839-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9719:EE_
x-ms-office365-filtering-correlation-id: fc36a8cd-bb93-4127-af40-08ddd44f87c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c6xWHsqRQnAL7jw1ebzxrMko6hKrnJ5zJLt0mp3d/gTwjVaPlyY7IlNjZj?=
 =?iso-8859-1?Q?fzlgLJ2jIldUKFu3ufbAUhyZad/Kvcu+xxv0cqRNYJKRquCGqgp+U46gVc?=
 =?iso-8859-1?Q?dgNZT7hfq5F+kJZWH7pMPUqDeQULMvJZ83p21bSmDNQQVXGrn98kgNYI7U?=
 =?iso-8859-1?Q?95Y50rIGMHuPgDbQNLyyvNKWxEQ7GyWl05WChvBYU5CY2G7vPeLrYqn8zA?=
 =?iso-8859-1?Q?ouRfc2NRyGlH90peSojMGJ2j6CTuqzvSgW+npWBxuhOOlk32BR8lrk+GNn?=
 =?iso-8859-1?Q?MqBAAsrW7OIXIwH92IsnR3frU69xLz8Tr+bsnevr5+dVH8NLkIxdzBVjaw?=
 =?iso-8859-1?Q?yaVeXmsrQWv1lpcwMtOcje4I5pQ/MU9VxD1F9zpzke6daQIYyqYbvj0wE5?=
 =?iso-8859-1?Q?YuoJ/QM9f6UgeolAjTYZ1JeB2V7rKXut03v0tvZhW/uNLOyjlCSXpR744L?=
 =?iso-8859-1?Q?z0nowarP4i72vQoWYk7CO3zggW6hhWnnMbKHcJjg6DqZRc06aYoMqvQNFD?=
 =?iso-8859-1?Q?ZGINgIyl+KQ7TyWc8WWeoEfTkuyOq3RiqlTnf3i5QSS3m+iXpznrGhGjqz?=
 =?iso-8859-1?Q?SwwNvIaoOup0pyyfGssezHte3gQW+erRQQYv2OI86gutyKq2+gPVrK6dZr?=
 =?iso-8859-1?Q?ivCCrw58emAkcjk9NCdWiLM2q11AV3dIqOgp+Nz82Fe9PdkKiRHWaYLIVs?=
 =?iso-8859-1?Q?XwOqPYqSVMUtRJFfIOx7+RXta9X+OcB+0MuynlUV0BSRd77VcpGtXz+SaG?=
 =?iso-8859-1?Q?4ij1W1XryYBt+qToa+KlBNgqByVIjD06RJrnCULVJ9WqIWiyqW+MhY7SiM?=
 =?iso-8859-1?Q?HRHrySiRDhh23u9hhe+WQcjYPwrDGf2+/HXn82VoHzS3XN7MT+ln5XbYsx?=
 =?iso-8859-1?Q?XLkxjcxghjHzqs9AjouZQBDuOKInxS7DbGblvdT4WAE9zlrKZieaEHlFy7?=
 =?iso-8859-1?Q?IjsP+Sne0/R407J9tNoiewbMgB1Qd6PYCUmIOgyd0JaqEOz6ACIf/jV+d2?=
 =?iso-8859-1?Q?jURduueszqOMqpRM97sfp4BGTgpt/oduWhDYBPPjzvxpHN3FLea+K1pKxx?=
 =?iso-8859-1?Q?9PBGgbKTXk2nv2zALzVQXwIffEKu3+eIwiXzUNj+xwZB6TVe5FZ6sY5CUj?=
 =?iso-8859-1?Q?Y2Fs8O70o82NNo1cSk+gFamS76XVfloRWYq7XX/LnTm9TqY+Hw5/jD/SnS?=
 =?iso-8859-1?Q?M1jMnXw4cTb0vcjcKbgjxKzQ5jpB24GvWue237+SlNHgjsf1kZlmp5PPdw?=
 =?iso-8859-1?Q?EuQgFH8jrDvxEVfs4R/4GAhJy8iNXbo8AW+nWInVt1wIo/it62v4aYnx/t?=
 =?iso-8859-1?Q?M5XQhMl48SJgBKN1pK7wRUzVmsnrzpvXRSIQTPQ8ZoE7XM0DZwPc6sZBvT?=
 =?iso-8859-1?Q?WCUrtnobJBOje8/B/mee3UvLGU2wUG5t30Wl0IatrAqHcwMJw7LItEL+Co?=
 =?iso-8859-1?Q?mmO9E2Is0VZLcg+i1eUzWoC9IjcM9LyKJxS3smvbAiTkan+pNnZN79N8OO?=
 =?iso-8859-1?Q?II7yWV2iSazwBKdoast6umUxFOKA/jVdj9OJg+oXX7VA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fQ88duweTGfxSdSWahM0AQGrH2VOuzC8Fk+Fycq1vpqk75tKeYglbw+w5/?=
 =?iso-8859-1?Q?nVcmhD442PMpqc/86xRZHeCMHpK3byPFLU1PddS/NW0oJ11reJok/3Dtzv?=
 =?iso-8859-1?Q?IP9PiNzQ8ZsqawxZ9aScULEWSjT0VWRMKm36pvIeqhvBumLZphWdoxRxP3?=
 =?iso-8859-1?Q?TiHymyO6ABzHWqLKrza/Ot9axaoEYflWf9c7uix9oLf+xs0fm3b1Dr8sKM?=
 =?iso-8859-1?Q?UU53npZbvZBYcrT0vadFyfH/5SJkgn2xrnv0FmaOMqTn+PF0hjIk+qy+2t?=
 =?iso-8859-1?Q?03df35LGCHNwlarsJaNGidDPPL/E+oKMrC9GfqYuK65Y8g9wvFO24ig5xF?=
 =?iso-8859-1?Q?zT/USwSPyet7pqSHpoAJB+cosUkM+7MUxFxQUgSu0OD5aguVt//WQc4qWP?=
 =?iso-8859-1?Q?fFsJhOXFbJG4uYcAhdRqf0djVs23VeZflfX8EhYMdtDu75Mn0NEmL7ps9g?=
 =?iso-8859-1?Q?cJkZ+Y8zIf0Iv2PL+/BwSnbHxAX+6OmSj3+8IuDbo6kp/5m4gT2NUeuntQ?=
 =?iso-8859-1?Q?iZHMk+fW1iF0qayZ+gkTGlI4T7h+KanU8dK1moudtHKH6DBT6kKXXjs1/u?=
 =?iso-8859-1?Q?vg2KiKpurvTPhl/1q3Bh4LputVblLKrZc29cy1t7Ex1yW5r4m2R9cMCjUB?=
 =?iso-8859-1?Q?gH7TnnN7Q2uPbgDwpxhR1DNrJLboaMECMjDp5NTiPXNhgdKkY6P4clTCLK?=
 =?iso-8859-1?Q?7NDFPpHSYtOaQd1g0T+eHR3JcgzyJDdoWuKqVjLs4n9GO8z5I1wG5fqQj8?=
 =?iso-8859-1?Q?69iIpegVBf8ri+I+EUHykAGiXXsocjN6mr63fsn1D6DrKG+CV4R+MVdudL?=
 =?iso-8859-1?Q?CQXdkPf5Y0hN5bpR7Pgq1ZOIpEbv6pbFEa6h58NB3NYKK12b5ngD+nyaJN?=
 =?iso-8859-1?Q?OXSbHtfTFvzsqaBMuRr7uWzsJaufNQpCKo8Kzwbi1gqkhuNML0ZvOle416?=
 =?iso-8859-1?Q?8J16c6nl7MJAnSxp+FPyaKvyiMLg4rOC/U91rDtCn/Tnni8Dk1EfFuIXXu?=
 =?iso-8859-1?Q?Ehj6IzZE7jB1Q9WWrQC9nY8Ign4YNNf0WwVR+xkRDzhi6yCAAZ4yDcNuJD?=
 =?iso-8859-1?Q?+zIAvEW+tebFBFX5gvZFehXGBVjsnwF3bO/MnglUAFPCxj1bx0HEU52JCJ?=
 =?iso-8859-1?Q?KDqFsX1n0pW44C9lqc3/aQDnpa19844d+o+3use9jdqdrE1UAOALm2Z2E1?=
 =?iso-8859-1?Q?7Oz2pMHztsVEKz6u71JZKZQHeGHE58cWEDm460iR+3ImHkapp7ctv+Do8p?=
 =?iso-8859-1?Q?hzZAI8gMpz7QC3A0szUPAQimhiU5lrQSxkW5Pxc/R6k0MJ+s5a26sWopyN?=
 =?iso-8859-1?Q?60GC4XZc9/NpPKx98rPgd6ZzfNi8B7lvygMmpJwCOR7eBTM/zIm+Z/e5j+?=
 =?iso-8859-1?Q?ancxVsfGauq7HfHBjF9Appg/73yJU3OTEVoOJnJFmWEBiJ4cc2taeI2K2N?=
 =?iso-8859-1?Q?3HTQmw5/Ijgg3tgay1Xh/N1fo504kuaTe0tcjGyV4/cISvR0gC/ZvbjtTN?=
 =?iso-8859-1?Q?Tl39IRjnc2odJgqBy+btR0ZNSc6Xama7gMNiA0cDtmJxunCPmbr7zr582R?=
 =?iso-8859-1?Q?JuE9CELXfbNViJf7QP9aJQZP4CzFZO+WKL/sQOVHHcJpYozClzBpqiBl4k?=
 =?iso-8859-1?Q?TpVCR0RFdp0/6qN+USeFakZ4OLZFT/qsv37dkcLqShLsXzr45U8KSbJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc36a8cd-bb93-4127-af40-08ddd44f87c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 18:40:20.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRareoB5rwAerrtb19xvx7rcpIHbA2cqIxJe1bZv7phBjgMfD/29Wwwksd4OIZirk2vOXt4B1MVwFmkI0Nu2UTwuDzU+vq5MW1/4IIfmH1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9719

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence prerequisite patch was merged [1] arch specific pIRQ callback can now
be dropped for arches without pIRQ support as those callback become unreach=
able.

[1] commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for ar=
ches with pIRQ support only")

Changes in v2:
- reworded commit messages as requested
- added reviewer's tags

Grygorii Strashko (3):
  xen/arm: irq: drop unreachable pirq callbacks
  xen/ppc: irq: drop unreachable pirq callbacks
  xen/riscv: irq: drop unreachable pirq callbacks

 xen/arch/arm/irq.c     | 29 -----------------------------
 xen/arch/ppc/stubs.c   | 20 --------------------
 xen/arch/riscv/stubs.c | 20 --------------------
 3 files changed, 69 deletions(-)

--=20
2.34.1

