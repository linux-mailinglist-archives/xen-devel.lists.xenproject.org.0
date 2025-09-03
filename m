Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF34B423B5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108415.1458568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUw-0008HJ-2u; Wed, 03 Sep 2025 14:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108415.1458568; Wed, 03 Sep 2025 14:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUv-0008ES-UA; Wed, 03 Sep 2025 14:30:05 +0000
Received: by outflank-mailman (input) for mailman id 1108415;
 Wed, 03 Sep 2025 14:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUu-0006ez-6x
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:04 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aad0cb2-88d2-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 16:30:03 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB10653.eurprd03.prod.outlook.com (2603:10a6:150:203::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 14:29:59 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:29:59 +0000
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
X-Inumbo-ID: 7aad0cb2-88d2-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLFl93IL7tEJsRvKBcL6QiLeeJXdzsW+Gyp4aexmIfmc4veRrNskAbjPi2Gx5CgA8E0WVSMDjhBmv1XUwoG4TPQtTmdkhru/OFsYxp3GdZcSFulE25RGxQc/WyNHrrgQ2SQvQjTilxbxWgBnzsY4+WsRAtFxAJ++IMF6hJr7x54n6xTpzq83ZDXcU6JSGWnvaQt2LQmGb0QiQD6x0iu9W0nfsmPMy6XaecTx+GVVH36V4rTEwNIhriLDjnTac7NIbRgtkymjKHlqzsdUS37OKF0hkcF0lWBm6dGGSwIWAKbu+hq2Kyd7veUsz9lf3QN7Vr/KyOq5tkY1UO8aMXetkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uddG+ZQNOEeV7oaE/2uDHhE7FrL2ecdb6+J/N7Jflu8=;
 b=n+EH1H53kJd6ViW93OceMYDHaCSMS2QaFwdFBb8MjHLfXfDExv9J3hu0ZPW/6jkq1tEJ0qPH7XjeL/cuVOXL6QbyGO0qCsQJkYM36aZND+okWxv77rMKucAQ6WCqPlczqGI3926LIgUeY8jDfOcq9AfiFkj5TFPZg7jb92C6f6hMloCIMY7F7+mSodGsmDplcIGfnf7EH0HX2OajiZqOAe5nXrNylZ6T5+yTO46/cd14Xdd2nKCNOowoPg975iuIXzERhnx4gT34t2qvi+Vk6TdVhBSPyc6wSohuaM34myGxjIjpxiPWEDN1ETkrcnZmSs46YQyUL0WzSrLh181sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uddG+ZQNOEeV7oaE/2uDHhE7FrL2ecdb6+J/N7Jflu8=;
 b=nRYo59ZDAjr56Ykbh3+JfHyA4yqr/1bwVUmHuJxxf972dl+Qtksg5EhVQv7+PerzNsgAvDVldpGQf/3UK++lbo6wMystqTtkU+k5DKRU7Qytbu0JtZ/hrXJN8tI0jKZ4Dqe550x9PimCcBVl7iCr5bScGJJYBdZEB0i/AN8/s/u+awL6SFUR8Jea9Jj4UwWh5bnC6atSWdttEyI28ZEt8etfQAKBvPljLmiEcsV6DdByeY1UffPSCexhYWCYdqhjW5v4hg/HYvWyszjCKKIg6OlNhQ9ahsKkkFf61M8U4gEm6aPJmDpyx/8h38xjO6PFSQdzJWFcBHW1pPhAr6838A==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v6 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHN861IdGTmH+JEChpQbSpoZJ2Q==
Date: Wed, 3 Sep 2025 14:29:59 +0000
Message-ID:
 <bdaec9b9704a6f21325b507365a165cce89cca16.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB10653:EE_
x-ms-office365-filtering-correlation-id: 84f1623c-a08f-4349-e1fb-08ddeaf65ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xtj6eVt22J5h89hLkHM/ZAgCUHSY+2FSzZ5PojWK5Ro7UjRS9uSAmst1N8?=
 =?iso-8859-1?Q?x2N4YNyA4hSaByRzyP7NT/2rKCJLi2WVpDkYzMZjOJHE/9CPwiPqDj47dL?=
 =?iso-8859-1?Q?opRyWlmSerEQnTv07jVda7Vqn7eXEksgkENe0vL+OQCSoenh4uML3/n4gV?=
 =?iso-8859-1?Q?9/+QlkGk4plv7Li+8V6KbgEZFN+Jnjzc0y/hpMNyYH2D98pN06b4rF/lbN?=
 =?iso-8859-1?Q?LX2uTZ8HQXxP58o0sIYwbKh2aWmGa3L08lqtOdgvnYJyNix3DXmKzWQuqr?=
 =?iso-8859-1?Q?+BJqOs2LsrKqwcPHjBphL+kmTx0G21F8xx7ffTbZVPtEvnpuLwzG4El3Em?=
 =?iso-8859-1?Q?T4TDJ6SeAzQIp4AH8AHlud2SVMIEbsJ2lNJrBmcYCq/j1UrmTg9oGwU0J7?=
 =?iso-8859-1?Q?EzGvMbj0sHJVATacqZV6qmfgvsCdwi7HffTQNCzz0aqMNczfZaoq2SZHIV?=
 =?iso-8859-1?Q?dgqecZaC9YTBtGJ/HJGf5k+fqQOaFY5q3nm96ANIJ72xS+i/Ue1IRvuW9V?=
 =?iso-8859-1?Q?g9vOpw3mRSFcndBUGJppctGbvPhbu645M6qrMAgz7v/6z2aKqhxJXpNlH3?=
 =?iso-8859-1?Q?bHZtiPOe5GhQbNwqYPKqGQ91V0pMjt6+7KbbPkx7VjdphhjdKv8LNFrTd4?=
 =?iso-8859-1?Q?3zAMxc2fJANKm4GhRcbflGtgFK64IN1+BZNHipvM8+U+omnbbjZYQPsKh+?=
 =?iso-8859-1?Q?0lItIPW/0gFi6syw2rg8MK661oQUDmicC66pNeFoCe02lyRO4EIRPQX0g+?=
 =?iso-8859-1?Q?Sn6A7gOGNQYbdjKgy49G2a6ISe2w7fJ+J1UqFilGSVHYvkJS7wLnFsGirp?=
 =?iso-8859-1?Q?49AvlMRbL3+5Q77gA6jipT9mhKUX3rs4dZ0i/8XXwFdvnVfexsObtuoau7?=
 =?iso-8859-1?Q?9YFB4FQqvnqyj/yh7Q2yznrD0nTHKB+qSLGq2lOuiG2ezrj/SnRRuE4Ba3?=
 =?iso-8859-1?Q?JdMhKs/bz90rC0+ed1sDmiYPoxpd8LTrG9G34fU4gTkAMvpMqcoHziCwlM?=
 =?iso-8859-1?Q?9qyFqlp2GMGj3qL/57P6jlASGL9WkyMIQRQw71/Ua3FQHDS+0hDAK2/HV6?=
 =?iso-8859-1?Q?trbchhK7JkURqGGr1YwWFqgKap5A0w71KIIK3dFkui1ilygS+heZwzN5AW?=
 =?iso-8859-1?Q?3wmmUlZBvigmgV4M/9ukeU8l08nsEapVokxneusrGdvQi9+TlTYR3RjgmR?=
 =?iso-8859-1?Q?RU6WRyx/j1+DNH003Cz20jrsBtzMkxq/3WVhfAcX8+kQh+2eZk+KZdbJHw?=
 =?iso-8859-1?Q?S1JAow/rs2jPpzjbres3hAaCF2rYJwZOHSZfrGogMuYmWZOozaPBFG4WlI?=
 =?iso-8859-1?Q?ho6wB9+ZegIiE3oKlABzo3PN8ffFmoF/7kJriRbp9ipHQAWCAv/NoOg4s3?=
 =?iso-8859-1?Q?jk83i+18sglQjatgInlggIaHrKvebymL4kLJ4Fk91JJAUzl4YgiZQVYHRI?=
 =?iso-8859-1?Q?8/yGYt+vfmEP9VtQi1C6fnJWzcJ3dnVWv8yddhlOjfzDFYa49hduqvJAqU?=
 =?iso-8859-1?Q?iwIHwS4CgxyRws/Hg4drEde9TxNSylgdkGAnTrvDDX9Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BXJeqR/GWaY4Qq0jHCRsflB0HBKOKpR4o8OE/MRLf5XhQ26wUsOCj756PT?=
 =?iso-8859-1?Q?kvDryPeg0TbXyipE5qdUwr/2fLjPxpWyyPXRZ8fvKeBh8Zo8clFpu5swE0?=
 =?iso-8859-1?Q?GEUPR/QlM19xfXCdy63bCDD20+o6liE73xJOJVekkxRkGus73+lVdwMIZQ?=
 =?iso-8859-1?Q?loYcIHRY9Ydndf0BDuJi1aUia6jaQaBRxOR+XtFyAt5Bq8eLAW3dU4omEu?=
 =?iso-8859-1?Q?OvhOBG/pTtfwXYkwyA+ytpWHFuJ3TKvZD4yUZmulwIlOEEOswIRV+kmj1L?=
 =?iso-8859-1?Q?NY3YXZGrR90tSKPIXe2EHszfoIJ9Q4BjEsmfFYJfE63ZlmKmowiOh/HrbN?=
 =?iso-8859-1?Q?/13vlFH+n0tBGdeuyENAQJQBUUEwQOzlLh74l4SVNrmxDJ/2rujxsK+Fy/?=
 =?iso-8859-1?Q?m1MjQEh59BvpBxPTwgYzwHo9tsRdMxVUwcgScrenRbX35oAbTmXd5whXXq?=
 =?iso-8859-1?Q?TlwezNrQjQKvJ1zADsA4V63RkWjc/nYxz1PHLvxSapfTV74BDh7d9JvaYX?=
 =?iso-8859-1?Q?k3IXT40act+92Hm/d1dhHRbiBanqT2JO9Ge3JBlxW8zrzP2U3RjWWTffuM?=
 =?iso-8859-1?Q?0JIkqudRbRdpY37t9pzb0i6GNiM4ExldDriKgY7a7FcjIVXMb6JpDyFvqX?=
 =?iso-8859-1?Q?tUyM7rG9NMi+uWk1s3n0rfNgYMAvrtvAiBI4FkX1U3Kt+TfND75whxh92W?=
 =?iso-8859-1?Q?jEFStvwTDoksEP7CQBLWvXYXj3AJj5cCKL5Mle10hZIM8ivBZIfjQsg/zh?=
 =?iso-8859-1?Q?n4bse9PgnILRhCjBJVKzI9AQV/EHX7aH0BzEogkydmwsRpNe7KKikRMUai?=
 =?iso-8859-1?Q?TdhQBGR8XThXnU4QrKEmgjF+YTCccEMnYje7lTL8W1RgPWNQeAPfIa2BGx?=
 =?iso-8859-1?Q?UVJQVB93ozJyiW9K//t1zLEs6KeXe59I6VqD+SixW2FyFgg33DWOFT/SYy?=
 =?iso-8859-1?Q?y8nPcWBXoftfeh1POqhRe6p2SIXGNs7JE1Z0NGJrHfHMMkWe7H6pjl2KRb?=
 =?iso-8859-1?Q?SkKx7O15fj1rnee5gVoRFOhSqqbO9H5qMAWhQgK+Jdw7m0mtjW1tNzI8ji?=
 =?iso-8859-1?Q?EFsYc0VlFA/hZrGU5AqHpsVuyIF/7fN300n6k9hAudck9L9DNt066pxvHg?=
 =?iso-8859-1?Q?h6GFcis0qapk6vcvO1PYcDlIYrXNPncvW8GoDmcbnTlxKii1k6g8Eps1iF?=
 =?iso-8859-1?Q?uqUhOJd6D0BThq+qXxEKqiQBEtiEfq7GEj23TicTGikAy0QYYtK+IeuR2L?=
 =?iso-8859-1?Q?dF1h2c9hEA88lo27JnRbcF3i4W20aqYW2QqxUphg20x+rgu5HfTn5fRqWl?=
 =?iso-8859-1?Q?o218ZV74Jhsf5RTb7Adrtr2Um1P95XDbrB0SLoD1gGpYkFbVcj0o0TFcqD?=
 =?iso-8859-1?Q?sYkSke8X79Zu3ljjya2mZuG3HslnjYZg7cmgxJAzwomn38ThTHdzG9UX0r?=
 =?iso-8859-1?Q?hM9CiOHEzQH2pW6XMCZjxSx7ASIojBHfwFZbYce1jUQmNFYmi7WPH2xjYM?=
 =?iso-8859-1?Q?lBGRekfn1z7PyBC8Ac83jV3XQ3OqQsWN5Kaj5zNwKOJMpfPw3G5hKjwNUo?=
 =?iso-8859-1?Q?Zo9+ASwAiX13iWctw5ciOY5nAVJ2vTNI7wxh4zO6OCle8BOezkJre0gfs2?=
 =?iso-8859-1?Q?3OJOCKnLWbCER1rJSBmUsLq+ZkheT2W+g7XlZOrXMSVi4HdsYg31+WEZG1?=
 =?iso-8859-1?Q?rT7IF7U3CEYIs0UPRtY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f1623c-a08f-4349-e1fb-08ddeaf65ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:29:59.7562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6dR9DhLvYO9u4Ii2XNdIlEC1STg/txzLcSXEsUXmCporXgEzOC1P/d841Mim+N2LS7QQyCPY91YgbWBrjuAE5dFrwlABblo2fyOFyTQ1oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10653

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V6:
- added an assert in is_espi() when CONFIG_GICV3_ESPI=3Dn to ensure that
  out-of-range array resources are not accessed, e.g., in __irq_to_desc()
- removed unnecessary parentheses in is_espi()
- converted helper macro to inline functions and added sanity checks
  with ASSERTs to them
- defined espi_to_desc for non-eSPI builds as a prototype
- updates the comments
- used the IS_ENABLED(CONFIG_GICV3_ESPI) macro to initialize nr_irqs

Changes in V5:
- no functional changes introduced by this version compared with V4, only
  minor fixes and removal of ifdefs for macroses
- added TODO comment, suggested by Oleksandr Tyshchenko
- changed int to unsigned int for irqs
- removed ifdefs for eSPI-specific defines and macros to reduce the
  number of ifdefs and code duplication in further changes
- removed reviewed-by as moving defines from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- removed redundant line with 'default n' in Kconfig, as it is disabled
  by default, without explicit specification
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- disable CONFIG_GICV3_ESPI default value to n

Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  8 +++++
 xen/arch/arm/include/asm/irq.h | 37 ++++++++++++++++++++++++
 xen/arch/arm/irq.c             | 53 ++++++++++++++++++++++++++++++++--
 3 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..43b05533b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..f4d0997651 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,10 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +43,12 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/* This will cover the eSPI range, to allow asignmant of eSPIs to domains.=
 */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +64,34 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline unsigned int espi_intid_to_idx(unsigned int intid)
+{
+    ASSERT(intid >=3D ESPI_BASE_INTID && intid <=3D ESPI_MAX_INTID);
+    return intid - ESPI_BASE_INTID;
+}
+
+static inline unsigned int espi_idx_to_intid(unsigned int idx)
+{
+    ASSERT(idx <=3D NR_ESPI_IRQS);
+    return idx + ESPI_BASE_INTID;
+}
+
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID;
+#else
+    /*
+     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI =
is
+     * disabled. Returning false allows the compiler to optimize the code
+     * when the config is disabled, while the assert ensures that out-of-r=
ange
+     * array resources are not accessed, e.g., in __irq_to_desc().
+     */
+    ASSERT(irq >=3D ESPI_BASE_INTID);
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..c934d39bf6 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,9 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
-const unsigned int nr_irqs =3D NR_IRQS;
+const unsigned int nr_irqs =3D IS_ENABLED(CONFIG_GICV3_ESPI) ?
+                                        (ESPI_MAX_INTID + 1) :
+                                        NR_IRQS;
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +48,50 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+/* TODO: Consider allocating an array dynamically */
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[espi_intid_to_idx(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    unsigned int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+/*
+ * Defined as a prototype as it should not be called if CONFIG_GICV3_ESPI=
=3Dn.
+ * Without CONFIG_GICV3_ESPI, the additional 1024 IRQ descriptors will not
+ * be defined, and thus, they cannot be used. Unless INTIDs from the eSPI
+ * range are mistakenly defined in Xen DTS when the appropriate config is
+ * disabled, this function will not be reached because is_espi will return
+ * false for non-eSPI INTIDs.
+ */
+struct irq_desc *espi_to_desc(unsigned int irq);
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +99,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +128,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

