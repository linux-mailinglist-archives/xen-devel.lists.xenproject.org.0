Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A31B3986A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098004.1452156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ4q-0003wv-8r; Thu, 28 Aug 2025 09:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098004.1452156; Thu, 28 Aug 2025 09:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ4q-0003ts-5a; Thu, 28 Aug 2025 09:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1098004;
 Thu, 28 Aug 2025 09:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zjrZ=3I=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1urZ4o-0003tX-TW
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:37:51 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89e092e-83f2-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:37:48 +0200 (CEST)
Received: from DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) by DU0PR08MB9874.eurprd08.prod.outlook.com
 (2603:10a6:10:422::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 09:37:46 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::c5) by DUZPR01CA0080.outlook.office365.com
 (2603:10a6:10:46a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 09:37:43 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Thu, 28 Aug 2025 09:37:45 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by AS8PR08MB7942.eurprd08.prod.outlook.com (2603:10a6:20b:53a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 09:37:13 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.9031.019; Thu, 28 Aug 2025
 09:37:12 +0000
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
X-Inumbo-ID: a89e092e-83f2-11f0-ae26-e363de0e7a9e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eGmKPxkIUgI2sr19E8ncF7m4KistwoHn8yETAhLq9wWUdZpMGx/C1BFThPH9U9881tFIgzC9+cBkaq4zHhure9wof2ZrH5oDePLDy39xVuc9uzJ4j98r/xbMJG7nGnNxeCX/3cKTxfV7UOv56tvjDXLDuuGrspb2Phq4T4YY37hXAQkpV5JHFsrkmIOMxYrJ376NspYuDXum7peLw6rt20D1ZeBczR72GrF776/spY+qytHeIbthR/cuPhfmCtOg2JcMVIjn1xaN65LWG4ko2b97nuESbU7Mv1Yg034UY9EDxoHYKCx62BLy8vj87G6IOW7lZxMpymIL5KSlsQ+uZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prWRnuWXjw4uKYXEOoFp+eEuHp91/jO9Azj03WRAcBs=;
 b=tPcI09R1UO+UXDEcvnEZHSj9joh0bfsR3eryi1LGtSIUJwlXisCu78QrUDmqpzDosB4uKdDp8VK6iBW+7gVOVGswtMAM7ghYoXqh/JTdPiAGR+BktuSlAh3rJbTFN4YbrkUQkNODTuBZxtu7v1GPxco6ZrZ/zD4UPgbM7P/vw8wGJglcsxofq8DdxRxoO2XaV8JrzB86uK/RziktEt86bVqoJyTnNX7R8tk/BkUX7XP5jWDNL8a43uxpbAx33guTNj7/2mUNlgq77AVVy0VjeAd7hpX/W4rAbbnGw6X9fiqkhSEKLNxnY9NWrAkE5lteJvC7krg5Gm6a20rVUOmHYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prWRnuWXjw4uKYXEOoFp+eEuHp91/jO9Azj03WRAcBs=;
 b=LHkdglYjEcNlDFWSFSWAcAdUdcYwwTVUYoudSLirtTOZsYMVSRfcle8vrSlPbw93aN36PJ2rO7SkiyGmOunwEWfsAddDE045xbSphQp1SHaNqczRGPOJViT1GjRSqoVXxpFv58xMH2AfF1w3rlSt1TFSN6Atu5EJ3eSx2odTCxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFA1vZnG8CpI9iISRXetuI1vFvj5IHP6dVPuBbfxlT/DtrVwRL5DJHTExcXr6ordUAt42QllhFarpc8mxJRdEJQL6JA3QDc2Tp44EUTPtKicsi1R1MD08fETSoprX1qdvRTrjNzNV4kKi11N2w87DjuVG/cFFriX2svFUaNPXVHDtLzZBZFVtV5kafydZmXfOUS3rrzL1QoEROq0Bu0QuxIzLNfqsY0yQ1GnzRqZOKOVWOnkzDMMQq8USDJ//wmunQE6nmgMsscT3b4S4Y6yKDmVwEALpo2uYS0DUM+7lNncRFZFBFa4Du+F8Pol9W7Gg6MmcWPUufHrXfnpaLzFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prWRnuWXjw4uKYXEOoFp+eEuHp91/jO9Azj03WRAcBs=;
 b=e+sCGDiFB9yOGg9DqfkS3afk851LeQXaNqsCel0pgvCrt1bTa4gQ87YnloPNEO5raMWn4cWR8viVbM8TtmogSncX3ODJEeAFfnA88Dhnum3T07quyWNKvm0Gthb5Hcip9KNrGkJrX1TVgx8n9Gem9zjqN0fY/cykt4dWUCz2eODICzhiHl38MHbvJ5Ovp1VS6Sv9n3nhMGtxRcIF9VrkV/oVWemRKKN01WLyxDIcaDM1wbbyNjxENmD0Kxqlklr0PG5WBhQyJ45iv7V6DLgfkKGJcbjam9H1MaXSbygzh+uftfXnkoXighuow/ZY548u1I3/AOfAG10J3baw8FR1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prWRnuWXjw4uKYXEOoFp+eEuHp91/jO9Azj03WRAcBs=;
 b=LHkdglYjEcNlDFWSFSWAcAdUdcYwwTVUYoudSLirtTOZsYMVSRfcle8vrSlPbw93aN36PJ2rO7SkiyGmOunwEWfsAddDE045xbSphQp1SHaNqczRGPOJViT1GjRSqoVXxpFv58xMH2AfF1w3rlSt1TFSN6Atu5EJ3eSx2odTCxQ=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/5] arm/mpu: Implement ioremap_attr for MPU
Thread-Topic: [PATCH v2 4/5] arm/mpu: Implement ioremap_attr for MPU
Thread-Index: AQHcF/ycst5ZxM1WdEyQIzD/TwjB3bR3zqQA
Date: Thu, 28 Aug 2025 09:37:12 +0000
Message-ID: <DD8D8334-6973-47BD-907F-D7E621A44E38@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <d2287756e1cd2e7f1cf4ac1bc5de775840c0b0ce.1756312498.git.hari.limaye@arm.com>
 <3f59b4ff-31f0-4801-96ba-83df139af081@amd.com>
In-Reply-To: <3f59b4ff-31f0-4801-96ba-83df139af081@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|AS8PR08MB7942:EE_|DB1PEPF000509E6:EE_|DU0PR08MB9874:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e65609-af52-4b6f-dae8-08dde6168b66
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CjvexDXa1O9/BzD0Z/w+a5ae0L9NTRJKsFeBjaj3roH1goOsE1+NEKF65h/3?=
 =?us-ascii?Q?goNHpxPK2eGkItMebrl1h3kP1Jx4sVSs4x2n0tRv26SAdA8nUKA7qioFPY6h?=
 =?us-ascii?Q?/k/oiXXA75+yKtXtDgK3n7nHPH0D+iWNEjM2krA5L6fxzhhcwNVNRK2hwRz6?=
 =?us-ascii?Q?DPC+Ntz7FtDE9El4v/rtzVM7Wr043GVYh6XmWaQz/XnPl3zgQyDC3ahcJ69+?=
 =?us-ascii?Q?vI4xiK/NaFGLLPcir9Zy2mFYMBwrk8aj5wGvkWeOkrCYaXt+dGc5UQSyjMXO?=
 =?us-ascii?Q?dQpS9MRuQq1EQ1r6NSOxkhq8KuO8PSpQajLHYNPDP9FRxEsRTJGKmAR44Yol?=
 =?us-ascii?Q?M2tPk3O/rUlQv+xlQSvU5gS7XGrdgLL9hCwDnhJFaxl+JCAL1x145mccMzUa?=
 =?us-ascii?Q?ln3pVjGqcwYYue+xs6oj1RcJ0g+AOdn5SI8jrpnI6o1Xsd8KhDpb9V/lW3Mw?=
 =?us-ascii?Q?IjLy7auVUBHUvwZgtTANCIeu9Sk20lTsKnpM4CywhretLNjKJoxT32foDxJX?=
 =?us-ascii?Q?u/vRIWvI1Bno5EYXjUeSukQjIMdan4K+i7m2lHsWkZwVGaZtz1NVlHNuF9XQ?=
 =?us-ascii?Q?oRVpy1mdbn8zhF/cmWNctBgv9WFO4yg24RFlErZzyEerACfOU6GCXKcy8s0H?=
 =?us-ascii?Q?svZvaQgCXppSsY4V33bEMzW6ZzZP4LvYvXgieUtkT3l2NGoaNF9Qs+YlokVk?=
 =?us-ascii?Q?t0KA56yFXtfsjZkAXyjfXX4+mkTK03R2Ww3pMrbGcnKoVJkMQi0yFy4A1/g6?=
 =?us-ascii?Q?1qfqmOTftceqV9gu2LPpwqfnd3jtADnpF1eDCvonRlEoAbt/2llwj7wciAl5?=
 =?us-ascii?Q?MhWJbk+ZYs6PxtO5SKQhTllonu2g9pL33r3cXgTrhxR6D01lKeA8hys2ON7H?=
 =?us-ascii?Q?TPrIYDq/s58oqaNXpjaXEtqOvCyWKZ7RIvhf5twN2WXGeuvqjf6Dtg1nmi4i?=
 =?us-ascii?Q?TVf/DEPsnHKsY5un2jjg1EllrCw6WcqVikDlHRJji4Cf3gVg3c3XyViW25ic?=
 =?us-ascii?Q?P33Z2I+m6vzka2FrsQrzXBI/7IIE2U/9VbDoAYL9ZFzQK20wMpFJK3H2Bxbk?=
 =?us-ascii?Q?6T3b/1giYYKqMTThyf1F3DVGbJPyfxnhHnY+xrF0vDTFroXm072Eau8Sa9u0?=
 =?us-ascii?Q?WSDQNvdVLqmegr4RE2JBwMiRyeASLvWotQ3Rdy5NhLWz2/SIWJ+axZokdRL1?=
 =?us-ascii?Q?iNPyeRtbb99vsEhisyoPkLDWbBOhJCLwS7FsYOoS5ImC8iFPDrpsugMgbtw2?=
 =?us-ascii?Q?SiYYlWITZrZ55Up25EiLcbncbj6OlygA4T5kszatVccQjWPy5di7Rky4yOhK?=
 =?us-ascii?Q?/6+w2CDcvSqnSqf+fG7utDhM8Up3qNU0imUUL80dBg+qish3i+TwY2HhJtOJ?=
 =?us-ascii?Q?khjoE2FaqQLVPRhd0SLgyhbAREmn+ExqZXhX3Ntecf+zMLxW5S+r5fcd4f2+?=
 =?us-ascii?Q?hvnF+IZpD7xOmGcdsTKuXzJbbq7GAqEYFp9yEaP2V3/jwRIvQfVMpg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6BE6BC0DF228C4DA470F83E53BFC9FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7942
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aad9417f-b695-44ed-4f88-08dde61677a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?czIUPcUO5nhWAlfVlFZ34oHuwzbUrUJ2QPMgrWpQr7FrhJzzuNPdkCpFsS/j?=
 =?us-ascii?Q?Z+FFp4AhyaV6XhatZMv4lmID8h2XHeVFts88YAar/vKpoA1ZhCNPchnjw9Nu?=
 =?us-ascii?Q?oXwPIRORPa46LoDZEeBv/XtH2uCAF4E8Hz7XgEX+ZHCl8iAeQJDmnCf3gdCN?=
 =?us-ascii?Q?ohCbr+9LWUn1p7i+gy6SlVXc1PpwZrLbpIaJko5J4kDy8ayj2p+6rxBZaK5B?=
 =?us-ascii?Q?bZuBCfBUeAnyD2CvL7zQNZeEJ0sQyOaxzgQcLLOYLKKIE+7ytIipAoixSXig?=
 =?us-ascii?Q?PZgu5zf2YoUoHrR+T2/umUHuSr636Bfq+4OrlH7bMoKLmrBFpL30J1F+GQZE?=
 =?us-ascii?Q?81EdS59qFh78bXTvujRn/Z6CY1F7dvbCdTR1fiHbund5KnNzW9tCjgpYL+cj?=
 =?us-ascii?Q?bXI/7vF7GKfRRTFLef35E89iX7bVLLwTLIBcJNRafrJWxGC/Bv6SoTeoBz28?=
 =?us-ascii?Q?PMlWmpDsShVLhJSkLrlxJ8PI05W772PhcPPu4qW70XMQ5ze5lNq2Wvjguf8V?=
 =?us-ascii?Q?wObndq0cn/VX4gwscbJLNL9xbJbV5c2O/NI67Kd6sfb/hr/tt6nMxnUUhUT1?=
 =?us-ascii?Q?+UvFBzAe0dfsPq9XxRZ8tiiqPk+hnOqcDAYeEagNULpi0COSycgud+mem3Qa?=
 =?us-ascii?Q?SkaYHy0HOOALNpJsAHQEeBPP3dj3oTN/ZShNMac7gcHhqFW6Rr5ybwI/5k8M?=
 =?us-ascii?Q?PEWjdSNoWkohCdUEhLWtW2pZssqhQ6LQbu1Y8ZB08piGkwJqrE1jp9QB8xnM?=
 =?us-ascii?Q?6w4fUpL+cdPjyW1n+nJeB8l0x08nYehZJMXNeYvIxDVogV3dRn97nINUjX0d?=
 =?us-ascii?Q?lMC9F91vVL5jYYFSZVhWyZ1IhvskGT95m2CYFmYl2V+W9u2oFBv08IgN/D1t?=
 =?us-ascii?Q?qmKtzMU7Tu0zTBeUycILLEMuGJIHQmGDtD+3Esw2VcDT6kb+GuhkIA6cCEJZ?=
 =?us-ascii?Q?99b3Nn0h3xy2iU8HHdMOk1Yp64QqoEioNhDFHDsFWx1fwYAn1gfmQEd43wlZ?=
 =?us-ascii?Q?ztPre3m4liFfoHK8a5OofTskkk8HJHbM4fONNAhnugL8HCXF/obU1pBdD/2D?=
 =?us-ascii?Q?ngn18XGdT4a4F8ZA135mTpgE9N2L5ItYd9J8J5j75I/CEpGMz0Ud2mG1Ejr8?=
 =?us-ascii?Q?eWbwZtiyM+kOjBskdl1258SwlZD6r7SC/yM5KMqY1RFY2AYSwYPVKJkcaqHR?=
 =?us-ascii?Q?FpDNMJuMvUEq25ze/vSKCRnShU86s7LntSD6JyQV7/ghR+LZYWD/oX5r9wLK?=
 =?us-ascii?Q?JagiAlilNue9hkROlMh/uRoaraTXRCezwPYPTLxWk+2nLLU1PZi5c6WM/aqA?=
 =?us-ascii?Q?HREMCYJxizKpCvAKVhA3pPddRHg7RHZTrgg8f5AlJuS67l6o53DJKZvfGaal?=
 =?us-ascii?Q?xWDJiZlLp7PQow0srEnzM4PiCeABQlNTx0XVClZKAg9gW16RC3oSTbItgHg5?=
 =?us-ascii?Q?BsUf4QFe2AjOXID4hwcJR5tYHB2WU0HwUxjjbgErMZqLD7VVVxD4VPjuDgHN?=
 =?us-ascii?Q?ZfTkIDC5X1s+qiRef1qnr0aXRKYHdHGYBPGi?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:37:45.7938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e65609-af52-4b6f-dae8-08dde6168b66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9874

Hi Michal,

>>=20
>> +    rc =3D mpumap_contains_region(xen_mpumap, max_mpu_regions, start, e=
nd, &idx);
>> +    if ( rc < 0 )
>> +         panic("Cannot handle overlapping MPU memory protection regions=
\n");
> Why panic? This function is not used only at boot time and should propaga=
te
> error to the caller, it's also within a spin lock.

Good point - I will update this to propagate the error in the next version =
of the series.

>> +    /* This API is only meant to unmap transient regions */
>> +    if ( !region_is_transient(&xen_mpumap[idx]) )
> So is this the only purpose of the transient flag? To check that unmap_mm=
_range
> is used on the range that was mapped with map_mm_range? What would happen
> without introducing this flag? You already check for the matching attribu=
tes.
>=20
> ~Michal
>=20

Yes this is the purpose of the transient flag - we want to ensure that a ca=
ll to unmap_mm_range only destroys a mapping that was created by a matching=
 call to map_mm_range. Due to the fact that map_mm_range may not create a m=
apping in the instance that one already exists - `/* Already mapped with sa=
me attributes */` - we need this check to ensure that unmap_mm_range will n=
ot destroy a pre-existing mapping.

Many thanks,
Hari


