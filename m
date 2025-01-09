Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F7A075F8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 13:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868326.1279851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrtm-0005b3-4e; Thu, 09 Jan 2025 12:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868326.1279851; Thu, 09 Jan 2025 12:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrtm-0005Xv-0L; Thu, 09 Jan 2025 12:44:30 +0000
Received: by outflank-mailman (input) for mailman id 868326;
 Thu, 09 Jan 2025 12:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVrtk-0005Xp-2s
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 12:44:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062d.outbound.protection.outlook.com
 [2a01:111:f403:260e::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b86bcd-ce87-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 13:44:26 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB7944.eurprd08.prod.outlook.com (2603:10a6:20b:541::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 12:44:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 12:44:23 +0000
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
X-Inumbo-ID: 75b86bcd-ce87-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+SpOSFf87UzYi7d0OkbBebkVL+36suhoxJJyYSY4pQWhXa7C9dkRRwvGYa5EkBeTFE3CUy5fS6tl+lT7E4BnmcJl7xm38Xr7VIF1rgFShP85tMmCL/ASZ5FGDbIKH7iFNeA4sty47vpyQFwUh3fmaoDOMpfA9EBNmMGF9yuWiEQ0arwqBk4+o5Ka8msVmMkMPyYZbg/ROiRBqVQRjljqsBE30SeJgXSX7KIPNeSgrBypsP1SXicBfd5KETcRlUSPNV/lpujwcA78VHM3WyGWCbThR9cSbJtLhMndHaBHPC3esj+q08kK8lvhzu79Uc3hE1XsoZlXrpGx6NILL8XYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VviiSMZ02u9GiW/QNCAMwOXjwvEMR4/YoW/9a1VYoZY=;
 b=itHd8Nfk2X9nX3rPhlgK96678pWh1sakXNauaBz0FHFhH8A+eYnpg6ulejsVJl+Sp+iW9z3165doeXgDHfjJ84DG3SiGx4quhvsV5NG/M1doO4eZKDYGs+/J9IcBSVViTtYqhC9zX7oB1MrSpzDXfPuDOdehGg0uhD85d8X75ZBghoqmQ0C7+qEFdjlVEdWq8lUlg0aD9OobWLTvBaZLGJ2IZcLFWQAR+aet2f4kDg+xCyjjZoonWf2cyLhb5aEIcoLe7VWAtHexyULJiyoC4gryv2ZJT2xJ9crQsMAihlrO1ySkZh6apY1KmP7v4nUaTztQeDrJLsQPTpOtxlPGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VviiSMZ02u9GiW/QNCAMwOXjwvEMR4/YoW/9a1VYoZY=;
 b=OfgEKhmXb7E7wACqKBfjVX6mQe7lpDIEJIRgELLE/j+YAuBz9eoi0hyyLaK3kWUxIM8+nI7QjI/AlZQ/ig2+kkMBSBPO2s4NORbcnKAApdctSSnVDaneZGxoVw3dHSXPJTZddkxK66b7GJIhiXlnhUa/LNqvyDC+QfvV8DtTWRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v4] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v4] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbYe83ZG0syumJUEGH2kASpg58SrMOExqAgAAjnACAAC3JAA==
Date: Thu, 9 Jan 2025 12:44:23 +0000
Message-ID: <9F9BC3B7-BB56-4E1D-B287-751679F1EE7B@arm.com>
References: <20250108170304.2250917-1-ayan.kumar.halder@amd.com>
 <E21BDDA5-F268-4127-82FA-1BD58DD6028D@arm.com>
 <dac15016-b55f-4066-a8e6-b2eb8346655c@amd.com>
In-Reply-To: <dac15016-b55f-4066-a8e6-b2eb8346655c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|AS8PR08MB7944:EE_
x-ms-office365-filtering-correlation-id: 30a8d781-57ee-4dcb-ae57-08dd30ab5822
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?O1/Gi5ze0mUZ01mCO8zf3dGog8jF/kemqKSJJmNyNIU6nlu6BdEnnNFMWIh3?=
 =?us-ascii?Q?FymWt2MkvYKhFU0LY/SYK0wrKm4VLrqh8l4xnPQar1bLujVOfArom+9h3s2D?=
 =?us-ascii?Q?/M3l6PkXPLYGMJ/KnP3nLeVkBgr9yHA+lImgu0BReYIa1dCx7dNvzlwWrB+I?=
 =?us-ascii?Q?eauhPlH1CqEKjUN9pmIxYdHY+RDY8smMwZxRt9k/dayt/oNT7EQyCqQ1yVm6?=
 =?us-ascii?Q?zhTzTAQ3LgyJlYew2PZGwdBHt7c5Hg0G0/zEzBYl3GZYNMNPnX/rF1XgItXI?=
 =?us-ascii?Q?L0pURoA7uivZpJ3PJ7b3ux+KRFdeYEMyrYb0/53zIN98DDkkTZxiea+EnFNu?=
 =?us-ascii?Q?3MJuWLKwQ/dfuOsoZtL63e3FbSfgPpYJh772h2TU8YRcp8wFfIgzBhjjN62K?=
 =?us-ascii?Q?6s+9xBJlJRXivpm+G9uECtL1oLu/0z7r1AfJmI7+InLN5MUaCoio9XswEBtA?=
 =?us-ascii?Q?RQsRTdecOwp0d57l6lb3Ucp+/209JftcNdoP3VJ81TiqY7VN79yDbOFFbDcb?=
 =?us-ascii?Q?irfB6rRYeAjb4DwGBjMuyaI9y+4FKxwYLKFiu1QMsEtrJiAxilkmZlk8sXOC?=
 =?us-ascii?Q?IgeLmLifsVtwW7Qv1hCqzeFoHdREgSq3I4wOaMjCEZoEMNfmqEtKaqX4l0k6?=
 =?us-ascii?Q?3ypAPqLes8sRY26rUqx29GlBOT9vaSwXUOfS9KBBOStfXbbM2r5SEA5vp3RI?=
 =?us-ascii?Q?NPpLqHDC/Cyx01kJaFu+OioDH4vlHadmZqFMEzMOePmuy4q57QV1ElDJ76C2?=
 =?us-ascii?Q?78GoJe1uYG29PmvTDp2PQqliCN+wUg20ChVFL9UAuI9yZAAfJuO3hCU0zNZM?=
 =?us-ascii?Q?29GF30gE3q9uxhSCLrk7+b+wEAx3M3E9Q1VlOek0MBHSP58kAA01YTsrZmal?=
 =?us-ascii?Q?e3hLoly9wNakyzMz7dqC+4Krpqi7X/3CVtj1dB6ftbEinnyeZ6CUYCnTNA+I?=
 =?us-ascii?Q?rX/OB5hhupRYCA+1FFsHfUmxOpHRnF5Xfhjez9iU49ardjZDfwsATwWH7m1K?=
 =?us-ascii?Q?jAOhKypKm/e+oGNvfN/GFQUbF453thC/o7+nNmo/4xjo8YUyWJWBjV3r/QdR?=
 =?us-ascii?Q?S/76XFDuE+Q/YxE1ajq/KlGv46QkZ+t1DvzZHc9D5mkXb6wK+0wHKA2TzRWU?=
 =?us-ascii?Q?Zga21JMF/q4lqeZvC8QPCnDGO6fnhAQeWn1kzaNf6XcExaEvXCuvjkjRCG+k?=
 =?us-ascii?Q?hp4fV6zuxIkVmKtJnoFJSzeljD8eR1ZWVSkAXjSk7Ac0NQyFMEiCToBgUEvV?=
 =?us-ascii?Q?W4xWrBrN46WXF+Ccu2hOZ9SCkLJJqherFku0XomcOg3E0o2iIHGzDnyR0gVw?=
 =?us-ascii?Q?/navHhdRh/GWjoZAwfznZYJqvgyH8NSOdqbGAzty0BbuSvdnXUrETBCnPQcJ?=
 =?us-ascii?Q?WVtEhl4hh1VuaPHW90sb327TKX1W2GUQPmljC1k384nWNBqpb+OkOkFOszG/?=
 =?us-ascii?Q?rxlDcdoyTG4jPITOmuhXcsLh4jNLsbLv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sq5on1CdywW1cC0LsNVEbpE95K7Wslj6031nQH+ga2bhf7S2CsXehQSAWEq1?=
 =?us-ascii?Q?lMl32LuEcWstrukUkJ6i2ek+HWYMjDwxhF+zbDBMxgkzS0gSyLaZVZe/M0Nk?=
 =?us-ascii?Q?fhxveHi1BfWCbDm/s/gZuTencO4CSBwl3rEJB89UqqcbnYOXFqXz9iAaIMSs?=
 =?us-ascii?Q?O5H0h7ZWCoZvb4gN5CT8QYQHDVNmp7yePh23wGpEEFL8pIIsLVuUdel18jkb?=
 =?us-ascii?Q?U0IXkO5FNSlY+avCy+QpA1A6o3dAOpo0HA9HCfrd0cpt4cpQejudZFarEQ1x?=
 =?us-ascii?Q?bi50uTDOHBewQ6X+MfbPYz7JvutpZ419Lbx7jOLHUcqwOgoMh38fL89UKX4+?=
 =?us-ascii?Q?94saaoucSZwlcvAEziGKwX3kEpNPygl0HpMEjjxDd+hQ376q/dhzwE3dYBDs?=
 =?us-ascii?Q?BZhe/jcrpW9iMUAKjZbTPGY/XsN7V6x5za/Mpo03Dhwt7UIhf9y828umE3qa?=
 =?us-ascii?Q?brSAMcjeb3y1aLGz1XsEgO1nKdG4lB0Uxrx18ruiRgw5/sw4/xCE83aCZx+U?=
 =?us-ascii?Q?JnMof3WpD6UROd3gQu/4pymiSm6psklNc6nD46ljpSEzHGcRtgODI46lDt0C?=
 =?us-ascii?Q?9PHtR4EB4kO7chUwDUDuPyviFzquz7OJXoyHfe181Yr6TCGVkqMKGvQHc/ZU?=
 =?us-ascii?Q?IU2C59iuZF2J0/A0fArzGU0BHFBE+NmPUaNpTvVdL7K3HdgoV/AF0xYEOWTG?=
 =?us-ascii?Q?H53DRY3a9QMWNFyCdHCChLYdkPvE6mZm/eBXxYJC/O8A/MJhZOubnndsKs2r?=
 =?us-ascii?Q?Jg+KP9Hf+PzYu8KqoqepbavVqAexVotINSDQ2FJIWb2ZvABy2rY9zAQ1IKk2?=
 =?us-ascii?Q?gMQMss5edybATGYNMTBrP2EinUASGcK4PlWY6RmaVY4PSdneq5DOvyX+m6+J?=
 =?us-ascii?Q?IIm02sEwEp8wnlRLSjDjuPK7HrHmu7QWPld1z5UNaI4fckW5XgMBr2bEcp85?=
 =?us-ascii?Q?ekQQCcShx1UFSn8222oeQa8bBH4jREqE2wqdPAnQG/4uohn0iL3GpLTPLSlI?=
 =?us-ascii?Q?ufUNET2qeVvJjO+zR1TiJDDZ+DmWmXI9w4odif+hiFx63vzIrayxvoiq2Aqu?=
 =?us-ascii?Q?v7CmolxPkHCtZSPi2yrwwk0kI58S9pBzcfcuStq2fJ9miWhU8beMzUYwXIxn?=
 =?us-ascii?Q?SSdMy+rUW3ZmThLawjL1F1E3P3ZkP8MBnhCJ4tcGUECnnizTDIlJrC7Cm7e0?=
 =?us-ascii?Q?nBHstcg6Lc50KsMNKpd6CdzTtfptKLpRPdi7qlDWJpx5erxGc4gLbd1LC5HR?=
 =?us-ascii?Q?2fgMXoKfTdDf+VxG4vT42Qgu3eZEbgapiXLVOvkfVX8tcwhKwGzSQNveA3Gy?=
 =?us-ascii?Q?2RmlJZZ8Kqgk/HbUGIJ4ZZ/TRNkXfMJlQjW1t5UprgF/EBgUTxhlAWJzEerE?=
 =?us-ascii?Q?+SIZWn3C5/3MUHxhZNAYby1atRzBwqA21Ttmhm8fXt4NL5/HpzsoELNTNfm3?=
 =?us-ascii?Q?IQzVGH6kdx6BAXFdZkF/iW9bupEnHU0fXqgh0fVwxdAKNa//BdljT3Ccv1ra?=
 =?us-ascii?Q?vEOs/FQEpbSHD7SsXIMZZSoxwS97jPVA3e+jYE8xaXex2E6sc5b7WNoXLRSP?=
 =?us-ascii?Q?cnprIi8wYzxeKhsM9D7Up+kCMTCuuOA9Evu5UG4aDNbIFJx7xtpdHdAO2clr?=
 =?us-ascii?Q?Rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDFD96B0B4AAE9489ECF045CD86AF669@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a8d781-57ee-4dcb-ae57-08dd30ab5822
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 12:44:23.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QsHP3Gw1kpjiM2keQTuqOSB746syEJlXBkd3z4Rfqc91aKpOMK2MTiyszVtXGvI7V9tYStpvNXD6n9Ad7LUVxeT1TMgEK5EcVi00NbqmG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7944

Hi Ayan,

> On 9 Jan 2025, at 11:00, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 09/01/2025 07:53, Bertrand Marquis wrote:
>> Hi Ayan,
> Hi Bertrand,
>>=20
>> This is a lot better.
>> I just have some minor phrasing comments after.
>>=20
>>> On 8 Jan 2025, at 18:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> =
wrote:
>>>=20
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>=20
>>> Add requirements for dom0less domain creation.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With the fixes handled on commit:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>>> ---
>>> Changes from -
>>>=20
>>> v1 - 1. As the dom0less domain creation requirements specifies the dt p=
roperties
>>> for creating domains, it has been moved to product requirements. Produc=
t
>>> requirements define the interface Xen exposes to other domains.
>>>=20
>>> 2. For the requirements which introduces new terms (like grant table, e=
tc), I
>>> have provided the definition as part of the comments.
>>>=20
>>> 3. Introduced new market requirements to specify that Xen can assign io=
mem and
>>> irqs to domains.
>>>=20
>>> 4. The design requirements will be added later.
>>>=20
>>> v2 - 1. Rephrased the requirements as suggested.
>>>=20
>>> 2. Split the product requirements into arm64 specific and common.
>>>=20
>>> 3. The arm64 specific requirements have arm64_ prefixed to their tag na=
mes.
>>>=20
>>> 4. Grant table requirements have been dropped for now.
>>>=20
>>> 5. Added a market requirement to denote that Xen can support multiple s=
chedulers.
>>>=20
>>> 6. Updated index.rst as we have a new file ie product-reqs/reqs.rst.
>>>=20
>>> V3 - 1. Removed duplicate mention for 'Rationale'.
>>>=20
>>> 2. Fixed some of the descriptions as per the review comments.
>>>=20
>>> docs/fusa/reqs/index.rst                   |   1 +
>>> docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
>>> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 ++++++++++++++++-
>>> docs/fusa/reqs/product-reqs/reqs.rst       | 160 +++++++++++++++++++++
>>> 4 files changed, 318 insertions(+), 2 deletions(-)
>>> create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index 8a4dae6fb2..1088a51d52 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -8,6 +8,7 @@ Requirements documentation
>>>=20
>>>    intro
>>>    market-reqs/reqs
>>> +   product-reqs/reqs
>>>    product-reqs/arm64/reqs
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index f456788d96..39b2714237 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -47,3 +47,34 @@ Comments:
>>>=20
>>> Needs:
>>>  - XenProd
>>> +
>>> +Static VM definition
>>> +--------------------
>>> +
>>> +`XenMkt~static_vm_definition~1`
>>> +
>>> +Description:
>>> +Xen shall support assigning peripherals to various domains.
>> "various" here could be removed or replaced with "a domain" to be cohere=
nt with
>> the phrasing after.
> I agree
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Peripheral implies an iomem (input output memory) and/or interrupts.
>>> +
>>> +Needs:
>>> + - XenProd
>>> +
>>> +Multiple schedulers
>>> +-------------------
>>> +
>>> +`XenMkt~multiple_schedulers~1`
>>> +
>>> +Description:
>>> +Xen shall provide different ways of scheduling virtual cpus onto physi=
cal cpus.
>> different here is a bit imprecise.
>> how about:
>> Xen shall have configurable scheduling strategies of virtual cpus onto p=
hysical cpus.
>=20
> looks fine to me.
>=20
> Are you ok to give your R-b ? Then I can request Michal to fix them on co=
mmit.
>=20
> - Ayan
>=20
>>=20
>> The rest looks good.
>>=20
>> Cheers
>> Bertrand



