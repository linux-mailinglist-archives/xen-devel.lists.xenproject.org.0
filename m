Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D593CAD5F3E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 21:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012137.1390679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRPK-00068k-IW; Wed, 11 Jun 2025 19:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012137.1390679; Wed, 11 Jun 2025 19:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRPK-00066j-FC; Wed, 11 Jun 2025 19:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1012137;
 Wed, 11 Jun 2025 19:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5sXg=Y2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uPRPJ-00066d-3Y
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 19:46:45 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8a9831-46fc-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 21:46:42 +0200 (CEST)
Received: from AS4P189CA0046.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::11)
 by AS4PR08MB7604.eurprd08.prod.outlook.com (2603:10a6:20b:4ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 19:46:39 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::2d) by AS4P189CA0046.outlook.office365.com
 (2603:10a6:20b:659::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 19:46:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 19:46:37 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AM8PR08MB5554.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 19:46:06 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 19:46:05 +0000
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
X-Inumbo-ID: cc8a9831-46fc-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZXqLA9wYLzo/reL6IeHI0AiBwsJycliBgHgcBz2UXL0y5Sandx21Ljxe82XSr4QrHTG7kVoNC2QHSl5/sbs9IiJhijqWQh8ENNl+0UK6bQqKPFvfo5nO7iFD2vDTRYSuhWZudlcrMxOiVleJnyWDrt+MJa/FvIIVpYyAU/OpCawm6FUwmAHbRCmBbJ08rm4+exvhoVytr7M4FX0VHJ7wtAfE5Ot6zfeZ3CjNgSyY0QEDgqWpKyZfhc4qAFHP9ZcdEUpzY1IE8wYTLoyChUU5WkYa7ZJQH0z4d5isjfWQ2kqS1qzeZ56gw+j6o/VUNKUkF+FywyfFvHF2Id9Ak1cJcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWX0B3lXcheQh3GEV+XThXx5FUm+EHnK9SaHRi2SvT0=;
 b=Jpy2I9g+XpbxhvgDRAXDI+6DIfn0JJUZ4BMiKsEnyR7l8Gc0pX6KqzaAAaIttEbkMBoljotuHAihJTkXXPsuvbztF1j7jOXr3FNnOpsFGh9QZRvN27PNFltubFaeAUZT87aG7G8J1UH3TYXPfL+o5uqLWd26rmtWpKQe+PpKLQXK6U3y79vs+8+F441UNNEM5Te9ut1wG+l3Uh9YwlRcPzPioa5Z9C3p2WYMiD4gjhiFIX6ItiBmqBQUWy6NJ4WTbkBPDfa5AlpIBs91ogCXHzcxqHQ+EbSHprQAClqpAdgpQn7+7f23LJ/Zt73QJD8PQ1Fj2w60QqXOh/w6xCY+Hw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWX0B3lXcheQh3GEV+XThXx5FUm+EHnK9SaHRi2SvT0=;
 b=cG1UcZD4YPjiDq+XRzH2lYUhaXTIsXJq3j8q/9wOv7MXn6uzXXa9cHnoxWDHCGbRNiVqYOwMcTiFvaIlS9R2FhkUE65H2Klv0OuMUdy3D8SRdQszLSYVRefNGmv9xhEu3jItSPMD0J6hvP9p3Bvl6ICSYeTK2nAiWJhe5Ccw0TE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywZXHFs9ooPSkiGii+rwXnghUCQXnh2D4cybb8WSHVZum/hilnHEtgVVG2KlT3fC9oxcAqcvq2HthWd63IE7SjMcH+MfIgVD19jRH5ILUt9ASj37mLh9sNDuZhoI6FmB2NL/I0udBqGj2nxRFkfHwmHq0q459WZc09mzMHo0mnDOihd6+LnppRSrsAfJtF6pqfAY5B/3w8eeJmrvT4cguix+A2SG8l9aDly0UGzqjRNKvGVV/t/CiQMASqCPUKFWXJiGVeyyllJkZjwxR/y8hQbDn/UUtp2e12huVhamy5Xle0iz/1Oa1+icfc9oPUtUBDwza84PvgaqLxedlkT7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWX0B3lXcheQh3GEV+XThXx5FUm+EHnK9SaHRi2SvT0=;
 b=gGYQvTkXFic1rqslZVlgFoy79ac4ue33gOtFEvQ6T+shA5W1If3hmN6DJFnbvmuiu4SykK1XpMk0y+liUbFkYkn8PzKKlK3RBVH5bg93t+yhVQxy7NteWN1xab+tkoZqUTb0xRt8oOBSSXnqEPzlCt9+fow9FOcyseYa0lgyPTvATIc63Fa6y2BjP4AiADaEHCUkuUT09a3k/A4Hxbtv+3gN6A2sfRbqwkK2bkmqoWvHtkh+EtrGqzDuVYL5ICdnW5/vdAUzexVeGy4ixD9JjINJ2Rc1jk7K+odKarV7YBzRsmlnBdsgg2IfrbweWXKym5NStFsMch7SwG5Z9q/Dwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWX0B3lXcheQh3GEV+XThXx5FUm+EHnK9SaHRi2SvT0=;
 b=cG1UcZD4YPjiDq+XRzH2lYUhaXTIsXJq3j8q/9wOv7MXn6uzXXa9cHnoxWDHCGbRNiVqYOwMcTiFvaIlS9R2FhkUE65H2Klv0OuMUdy3D8SRdQszLSYVRefNGmv9xhEu3jItSPMD0J6hvP9p3Bvl6ICSYeTK2nAiWJhe5Ccw0TE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/6] arm/mpu: Move domain-page.c to arm32 specific dir
Thread-Topic: [PATCH v3 3/6] arm/mpu: Move domain-page.c to arm32 specific dir
Thread-Index: AQHb2t5UdjEFY0/YQEOuciLTdcs6S7P+XQ+A
Date: Wed, 11 Jun 2025 19:46:05 +0000
Message-ID: <E685CAE6-A57F-4C01-BEB9-FD0CFA5AF560@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AM8PR08MB5554:EE_|AM3PEPF0000A797:EE_|AS4PR08MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: beb33a54-d166-4055-1d1a-08dda920adf9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?w65eArWTHkHjiDSDc35MHtmrF2an4IKImlvh3yVDSdFnnOrm3c+uqWp5b0ER?=
 =?us-ascii?Q?Fazg4d2dUmTaC3AcMq3ciZi0GpSPY2okMumhAU4nqiVn7poPu9x7Xm7eMUgC?=
 =?us-ascii?Q?mtV3B7739uOuWf2/Dle1+Henxc9iYzbY0Q6jmIKKdXiJcrGunvIeEIxDX6OZ?=
 =?us-ascii?Q?u/s26w7GQHC2S/t9Doj+Z3AI0a40qQ/2PEOh3hxJ3uv4xUoQv4WpnvPOdumx?=
 =?us-ascii?Q?D5YrSHkURlHBfa1MC0CSKHYHGx6r5+A45JbxrnigLeCEH8wCzQDZNPgYLDjc?=
 =?us-ascii?Q?FZ8Udw0S1T63qFQH8RXwniDnc6jyB5phsgNSn29kPyJ0t4k62wGqCJHddYn1?=
 =?us-ascii?Q?XhNciGqshDaQkEiIsIfkIj8wSoRmfgOq6QTVUDyL4PblpcwVeA1GxdHnctEJ?=
 =?us-ascii?Q?5DgyuBB0OyQ5Vu595TTslHIGLPD4dlY+1t0N+7VNwcvZYcU59mzj2UWTSyjK?=
 =?us-ascii?Q?/Ovu2fYsHbipB+UCujfkqxmbF/RgBRoqmG8sBem3NAbjphHodyqkc3epogeR?=
 =?us-ascii?Q?SkBkEU6sEptEdA5RxC6Tlg1Ot4+jHIPzeP3tphHkzoMedhC9hoeNQAAcT4T8?=
 =?us-ascii?Q?3N//PDAH3FdJN7rLxK5eBX/2Ax+xBEhD3F5CNPHJbFTfjPixdcP7PHSpHdQG?=
 =?us-ascii?Q?NgTSCAu+blVcD7/3PHMOT/Qb7mBpNmcXSjZlJls84h7lr4q8jSsTWKlGsN2u?=
 =?us-ascii?Q?ioK1V9d30StFs85YB4GhoMj/TX7i1O5TytBHdx2RwTgkbcWGE3RNMqLhoOA2?=
 =?us-ascii?Q?/tZpmc9NT5imzsFFc46rjsARl2d11xdDm9AoWsxD7N1XqyCk3WHTg8WbhRJd?=
 =?us-ascii?Q?L/znwYiilAC0FUCwx7myqSIlzBcgfxBc1YBj07NQpZKwfmLq+12Z4e5rUZEC?=
 =?us-ascii?Q?FD3a3F/o8YFJh9/3NsxTjveElpB+daIMxbV+xWDjzIya3RBgHbKj6Wy6rLVt?=
 =?us-ascii?Q?niVlXPEMtSBCv+sMAJ9VVg528JZGo0xMCNDv6Ooji0PkKYls4o6jAHoBfNwa?=
 =?us-ascii?Q?yxpLfJEmxBoL1z6HYXk9KfyBpLfhApaWFxL9DWPmq2BYViUnkMwIHCtGWjmz?=
 =?us-ascii?Q?tfHs+ShIqRoxoY7Qtv3h2v43YhKwdVerDB0ckRVawqPiJOXJUjwWFdNA2UCi?=
 =?us-ascii?Q?m+n3J8n9xxzRcsTGRjaqCESb9hyanDD9K7IEx3uPohW2lEZZC2Bl0OiwEaa8?=
 =?us-ascii?Q?DDYE8/FWEBLZeYcYQilZLgZUAJqs6eVvTRQJGxaIapA71cwOcKbT6ncxK7r+?=
 =?us-ascii?Q?9uGPepRKDkWETiakbP5Wi1YmHlt5jiXxtydIbB6KSZTKcH2LUd47PG+EZDcy?=
 =?us-ascii?Q?QtNs/Js3VeOjViEPGAXQviDDrIwRLbyKmCcTyNJcdA5Gs7vUNNXqP29fYcex?=
 =?us-ascii?Q?Hil0o5DxLz8a6LBICJBjg7Ny8OVwqZJq1+ouFDreHc6DwLGQC/qB8SrNmBFh?=
 =?us-ascii?Q?mdSvMrK1fmE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55479781A4D6FE44A0AEE4467776B921@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5554
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb09b3f0-6a4e-4dec-c93d-08dda9209add
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oh2nGsqR6lQnOkQE8b0k0a2dwIIQV3X0jQUoJhMOJBelF0Zjrx+sduZ2suiV?=
 =?us-ascii?Q?RbG9wzlODldCW/tH9tF2yEGlPUVoczjvREGaulCQv3AA35OnG8hEepy/VWJe?=
 =?us-ascii?Q?zlxs5AyWXYv41WuL5PtbQOBPhV/4LWOXAxCDSaQ0kBoc/Af47WUbOwTIi0b/?=
 =?us-ascii?Q?6KbZA8NHLp9I7yLzvKrN+kpKArnFt8oyDA4Vs98YnX4g1+gmytqbmca27jbM?=
 =?us-ascii?Q?+NlGo3EoK9j6Fe3bB/27SWoSMhqAww7uSyuTTiMNGmwudWXt/gXmk5vwbFdi?=
 =?us-ascii?Q?N/oz9vgRTs0GnXTlUQSreXBJexOOIwKiqg+mZi2DP9eK6w9Kro+zVStFQFMA?=
 =?us-ascii?Q?rJLXCO4lFIEFv/+/VfGQxDVdnkVsCSBvMn9uPgW4vIUUko6K1uWhDCsaRjtc?=
 =?us-ascii?Q?j6wKtI/q5vpHuUyNO7mhbn1yvhpTfLbwWMAHWVRC/5LFDRy+tv86JCdvBnvw?=
 =?us-ascii?Q?zZZPw7ogxrQNT1jPZihoeskTUIMHUKO5LP5w50Qvcw0A+oH38UqJMKlOOOfM?=
 =?us-ascii?Q?iGSrDyGz8rMJoEIV6HCceg4/ZleaIK5vxSNvWtOKdEhd6DFsa1uMPFrix73/?=
 =?us-ascii?Q?MNrTHDM/HoM/GY65TXcCrnci+R66oAYpaFTDro1ZFS9zaw3inGME15qlB/70?=
 =?us-ascii?Q?Q26VYitk6wRTIKYSqzKocEiIrZOJUwuHSEk1g0sUx2y8QDK3xAp5TDr5K87u?=
 =?us-ascii?Q?B08itJQmGylOv8WQR2kKeyu/hDNH8tDR0gkx4ZyilHnNXV7e/N0lbVqQJIL4?=
 =?us-ascii?Q?hkycU2xTBk+IcDunm7z2E29aSc4Y7RnaNSv/gmp8bWYWda0lufd/07+irBIt?=
 =?us-ascii?Q?BiLpTBdKBLK/y6HejDTTtFce3bW4FA80fjk7tLeSht1qVwvegRaLIduDYC/7?=
 =?us-ascii?Q?XI5WYofxqtX0hJzhcnvYslDqBDtTwO5X2aCrNySzS45Uj8y92rmMR5hFnKCP?=
 =?us-ascii?Q?f4xJsqhSL5gaHUCo3/OkKoExOiJw4K+T13GAeao2BqaEKXzGxle2Mo9YKkBq?=
 =?us-ascii?Q?jVzH7YHHewIgOwbOvTcGBivlTryd5vG7pp3cc2l8qP5ww9lgLmq8vdVXDe6D?=
 =?us-ascii?Q?HrTcIh/RJOs2N5LwhxHTHYKPn+gPVaCIgfCWG70oE6O9WxR0SuOG4DJfEVCV?=
 =?us-ascii?Q?wm3Uc8X9zfdPn0HqbMOrFBpCsQo2J3E+wtuRG6uyIQhBrNZxyHsqtypjl7NZ?=
 =?us-ascii?Q?r7G+7HgoDRREzPvbINykAZW5KzPjMoAf4o4JjudXkXDDx3vO2ftnTiFXf/wQ?=
 =?us-ascii?Q?7qAfS7eIy1yypc3rv9MtWzYNfcmsxyrLEuDXDYLRqSGFpWYrBgOoSnSuhXDT?=
 =?us-ascii?Q?BuY/m6mhUIiV5FaWLRzmkgCDnqT45oUXDJqabM04Z9QzVHgDo0iVyaCsswIx?=
 =?us-ascii?Q?i3T26RYuOdIl7wNBXpYNSqZcb7LTJMrZoSLQ36I8gxTMY9SnZ/kWFA0ibAzv?=
 =?us-ascii?Q?+l2ECMHVRmc7k787zs99ZzSJ+ZgXh6Exfm5Q2KQ2grja97KJH2XwyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 19:46:37.8288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb33a54-d166-4055-1d1a-08dda920adf9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7604

Hi Ayan,

> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> Create xen/arch/arm/mpu/arm32 to hold arm32 specific bits.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>=20
> v1..v2 - New patch in v3.
>=20
> xen/arch/arm/mpu/Makefile                  | 2 +-
> xen/arch/arm/mpu/arm32/Makefile            | 1 +
> xen/arch/arm/mpu/{ =3D> arm32}/domain-page.c | 0
> 3 files changed, 2 insertions(+), 1 deletion(-)
> create mode 100644 xen/arch/arm/mpu/arm32/Makefile
> rename xen/arch/arm/mpu/{ =3D> arm32}/domain-page.c (100%)

Uhm, why?

Arm64 is using domain-page.c:
https://gitlab.com/xen-project/people/lucafancellu/xen/-/commit/b28198d0007=
8991d4a6502e94c8779d84fec0120

Did I miss something?

Cheers,
Luca=

