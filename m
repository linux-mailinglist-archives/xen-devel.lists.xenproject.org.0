Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C80C649F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164004.1491029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL073-0001j8-81; Mon, 17 Nov 2025 14:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164004.1491029; Mon, 17 Nov 2025 14:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL073-0001g2-4d; Mon, 17 Nov 2025 14:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1164004;
 Mon, 17 Nov 2025 14:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQzi=5Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vL071-0001f9-7A
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:21:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b91572ee-c3c0-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:21:36 +0100 (CET)
Received: from AS4PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::7)
 by AMDPR08MB11483.eurprd08.prod.outlook.com (2603:10a6:20b:716::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:21:33 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ab) by AS4PR10CA0017.outlook.office365.com
 (2603:10a6:20b:5d8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 14:21:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 14:21:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB8390.eurprd08.prod.outlook.com (2603:10a6:150:bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:20:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 14:20:57 +0000
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
X-Inumbo-ID: b91572ee-c3c0-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HPY0HH4QMgPEUREeTyLODd+wXVatVI6nuTl0kjZ1Kwqlbr3KVG8juH2ScTlzV5pIotx95syr6Y29vMR0zehRnBsB+qZKahDlv6iYDnkw5M19STnQB0wtZDIHk9Hu+CiG0suzdk9USGP1n0uJr1nw968Ggm4zrPxdkv8NJh9Rxanemry+siP/5v4HtFEbjkNL4lzsNcDprtIfJ0du5DCbNVNATLyntaVIaXJGaxTO+VFfpRdl29iSYI6ZrnmTsDOENp9rQwC8TVIHNpLzR9U9d/zvAgxcRE/tFmOYbAj9RKAeWPbAb0kWVzm/YK9yg9in+bulptGAGI1Kc1By+ylszQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlIPpS5/9FnSYrrAmyhu4WvPH+6rexsPF7h1Tg5kqa4=;
 b=jecBaVe/ZJE96+pulB80ppLHcHepXaA9UTCskImXprtPQ6nxE1qI6ZNoeBj4/ulT4B5OusC+kBIoIx4M7SHv+hilleummS0j0tJsJh1d+SqhFMeFdUrLxnpsL1AEKmvACNCoQfwudkKKYsbXSlkpAfKk66cQRBoQNU+9G3xMFJLhUvIn9oG9NhwARMYYR8Nxm5kQ359Oeh7w86+p3Xh9JOTixEkwa8jWc5g8HP7ddnsfdrNouNZsQXHfKimhMX3lYPDfvZVMnuVR5duD3DStpdhJoAOWQXpahuQOi6ctfGNOHTfBaqdu1RxDydUFceyufdejws3ezYpMc9o3YxIeaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlIPpS5/9FnSYrrAmyhu4WvPH+6rexsPF7h1Tg5kqa4=;
 b=LrmG7VlAQaKmt2LvhV0yTVy3WGCq1U8X27wSInty3kiAJgWYmkVxHcZujs5TWoHebPptAhxH7CNAnV9egbYm16fbVBlwoL6lvvKSb8RpVmR++ptHYV4pGQF79XSRvnR8UHRb6OYwu5P9uslgXQM7nU38rIyYBjxwL7CFGqi7OfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfZM5EN/LZbDoX+8h4wE/jX3n8ni2/xVVzPN8gWS/0mx0g5FIbgSz1/YBX0Bz50er6wswbUERKidWoBKM84vRLw3bKj9rQFC4rpH/UVWezn1fnNv6CLB8sGOwi88wZu63Ak4giFGQs6/9G+cGp/sVty2qztVVXnYZGa8oa1ppY+z68Fb5UzOeYTBNXpKySJfxyLC+uAikWPv5fdv7UIT/AIOyleUgT1fkBivQP+4/roHI+6TN8aR5N10zC8fkTMZbZEBJFUkJ2myErVXCwSvUYjt7C5xUPiolyWPLe7NSJQmTzC7vdxLQyshGnqDSrwdiOJey3a38oiPUlMXKdHdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlIPpS5/9FnSYrrAmyhu4WvPH+6rexsPF7h1Tg5kqa4=;
 b=iC55M7Yyg2HNHX+q9pMOz+sAEZTWK6XITw55qPmRT0lXgj8lZXo0i230/S2nU+suIbclug/Nh0ovVpXtk8uem2CQuewXG8+tQhX4gQcTCYd9fCzrkovWl6CwTfM79eRITZKsU4wEftia2fCQ8wCb3woVk9vnV43EFDnaWNKR7OXw5OI8k4m39mpIhD07TNqWMnZ3B20aazoY4mg/xhX8/q++cexgSkV/XHBgpPLOaxZzPE3b4sb7YyhxRoljFeuOyFgI6LxV0uGNlx8tuhchM/3f/QDyI45UkRpMOY/c3gXqjIU3S4cHe4wEEaBcvu6bYfRcD2jtvAq47Y4U9CT4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlIPpS5/9FnSYrrAmyhu4WvPH+6rexsPF7h1Tg5kqa4=;
 b=LrmG7VlAQaKmt2LvhV0yTVy3WGCq1U8X27wSInty3kiAJgWYmkVxHcZujs5TWoHebPptAhxH7CNAnV9egbYm16fbVBlwoL6lvvKSb8RpVmR++ptHYV4pGQF79XSRvnR8UHRb6OYwu5P9uslgXQM7nU38rIyYBjxwL7CFGqi7OfU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Harry Ramsey <Harry.Ramsey@arm.com>
Subject: Re: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
Thread-Topic: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
Thread-Index: AQHcU9GZpx9Ewja+9EW1e1HUZJtzELTvMOuAgAAD+oCAB6VIAIAAGNOA
Date: Mon, 17 Nov 2025 14:20:57 +0000
Message-ID: <16A2378D-663C-435A-B668-DDB12957E52C@arm.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-2-harry.ramsey@arm.com>
 <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
 <fe082ad9-ee55-46bd-8b93-5320649e6aca@arm.com>
 <EF7146C1-4351-49F1-A0A2-9BAE0EEFB888@arm.com>
 <7261ef7c-c574-4c3f-9aa0-259386f05d05@amd.com>
In-Reply-To: <7261ef7c-c574-4c3f-9aa0-259386f05d05@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB8390:EE_|AMS0EPF00000198:EE_|AMDPR08MB11483:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c2f510-c6db-4677-ada6-08de25e49bd3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7ygSgqyV3+/hIek0Vx5fJ1l41zKYLfXs8iSIOlalYD5u19PmjmooHxoqnHbd?=
 =?us-ascii?Q?edqEQzl8G23Cs3coc/sFBHgY585C8HDKZoatJe6h69zAxmN9mU7wIX4twwFO?=
 =?us-ascii?Q?ALMopmyGEtESQ3yC0+1rvloMKg+XvS4UYP6ZP0GHbSnIOFaVcLVjbdU2rAv7?=
 =?us-ascii?Q?h5JBE3x/0OMpuTYoInTal2U77nDKan4MO2NX8g8pU+4N4/pCc8BECN/OntzT?=
 =?us-ascii?Q?enjFUyTQwEh/Lk3f3k2bC805mdwffvrsV12+16Hu+9EAHXx8w4qjS6ghzuA2?=
 =?us-ascii?Q?jwfCdakAYDegAS1E+xbZS9gGfrM5kf5QHH0Cl1wN9RulJiRUetGHdo0r1OLN?=
 =?us-ascii?Q?zGrmNKqSqYCv0KGnKjgioWo7BlG7ZwXgwfeXYNsj6MgvaHoYGCeVPPXE1jF/?=
 =?us-ascii?Q?11Eb3x44sxnnHpepNG9aVBo8+PCTXKi+bmB8Fr0N7K4tSmmuw7300mawo3/B?=
 =?us-ascii?Q?+dkCOgjjF93gwAk/7rqlf6S1WmqPWhjKODBAWn/EZIInjhAvFEE4gWVaJ1nh?=
 =?us-ascii?Q?+XNn06a0AehzD2GnGrxCA4XopYFs0D61sbypMn1rTArF7KZjjWNJKiXN/XCT?=
 =?us-ascii?Q?7NUh6jrA9IKDrE+iK9paeW4Fhzvcpiy8BOhTkEPExjl99ZQI21vBcojfQg4a?=
 =?us-ascii?Q?i+w9NpFTEc60KTa/XwcipsQ4kUqDjyim5u74y9yRO95aQ0dI78xExgTYaOmT?=
 =?us-ascii?Q?WoufUNZ5tOYH1vbWWVrQWbwytfFZcke5N4+K+N0uni3NPBda8LKMXq66Go+x?=
 =?us-ascii?Q?+f/oD5EWg9IA5PxbTQEQ7fbWugL4FvTAwLj7ZOF6TFi8F9TpMnZGMGLLGMJV?=
 =?us-ascii?Q?jFVHENnH4NLJVD6YNYUDm8HT8OkFJXrsfeFQC46UcS5B8KKwshxKiZkT0ivN?=
 =?us-ascii?Q?HWGU3fGINu4Q2uU8WgZ9s0KPo6GiVBaAeZwBUfTcXJXBki/Ha1Qi1hlrwL9K?=
 =?us-ascii?Q?f6N9yfjJQqigzKP1CJdLUsFq3jSuFjKUIvMkSAPWMogVbd4FM6At1lYWE8b9?=
 =?us-ascii?Q?/SfrX7GkAljWvZS3zKylFZJhO8sTM1mkIpRe9HrVHC0ZuuX4TouBmVjd+Nt2?=
 =?us-ascii?Q?VtO1VRE2ObxnJONdhlTtgPqkW+Y7s5/oEmg5VXgC4RXa5yZaqv+rzNQTmgur?=
 =?us-ascii?Q?nuqNcocbzOPB9S9pNnUXiiY32YXQy7xf328L72jlg1cwWJTfjapLtuJmG/2l?=
 =?us-ascii?Q?wyqwOAQe7IReRAhBV74qwDk507ZO9/OO8STPgG545Z3MPxgng7rZcwAOzdUF?=
 =?us-ascii?Q?3hBstuKbKGP82AZLTRtltH4I2rFc3A/5dwWI0SGQAtWB9pG76HVgJPUDWMXu?=
 =?us-ascii?Q?Y73cPzgb4RiwHjhYfpAIG8anTIaLHdgm+b1Yhk1W1hwV/gw6dl4rqIpWx5mr?=
 =?us-ascii?Q?G8ePNLr6DK+9GZGUjjtEyCGsLfISpYSzwnOu3flq2nXazSsftB0jqhVMkLlN?=
 =?us-ascii?Q?ENjc7OLYeji0ZkHKE+GixMTFWWq9Djd18PmWEVIlCZkbe6mh1b1IGxyCL07P?=
 =?us-ascii?Q?AIc1T2hukRvK5tEy879T9UNjq3wRUGFfCx/Q?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D94EFECD5033D1448121EC11E7BD50C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8390
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa2332fe-8ceb-4464-7b42-08de25e48698
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|35042699022|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sJQZtFYm0E0UrfTPKVezH6b8JSOc7x/txzZqbVZcFc4yxnJIfQkIavY3AGxX?=
 =?us-ascii?Q?LRbHMMNFSt6vn2D//Vt4J2/hawQnEnx83rKbGB+P0FV5wjmbDEmto1Z4qfFp?=
 =?us-ascii?Q?o+he/6B+WJQ2SUDaPUjPoZAo6iHGdutaceIHfhqocDE5KnhAVh9htfJGbf3m?=
 =?us-ascii?Q?MI5qZzYwpJfvHGBOJ3oN9tRxofMIzUvImoxBHuNlaya1f/+3gNc9IdjSsxQF?=
 =?us-ascii?Q?BblaJs3HbWArUo7wV15cDNy4u4tbRLYzPhnKCxvhdAZFF6IBtYwHmvx4qXE8?=
 =?us-ascii?Q?EaJL4S0u9uTMzh+AwtyXKi/Z/ABmgzP6BXyfMLc+X+nVZRh4UdhhG0MCsAvb?=
 =?us-ascii?Q?V8OG0duWH0Z5TGGv8mvmhBED3g1dkAakNNA7MsD0rDVp3pjYBcdxKqHHA52L?=
 =?us-ascii?Q?5g3mZQVV/eXhbuk4BwurJMjlhMzmlq4/ZYB4NInu3eO4clZx80UcgjM9sx/e?=
 =?us-ascii?Q?N/lQJqWvgaVpc3ITawTEe37HVh+wbL/qCZ/AzZivVg3cptt2SM8Vwl06zChX?=
 =?us-ascii?Q?FxWpBuM36UeXRIpb9A6SY0fsSVBdsVbJPIrUZZjYDczH3Dy605cylKfSTeHC?=
 =?us-ascii?Q?TNbV25nbWtMTviDzOXZNGXgdS0ghKbARbaa1BGX6ufuBZdUgkLajp2R+Yn4a?=
 =?us-ascii?Q?aZwiJ9/jz4g7+f/C8LGAl08roW9Aibktpha4L3v99pQlLf1YOOvlkuOvkK+y?=
 =?us-ascii?Q?pOZe5EdvLesWFsNzYe5caU6cxufgyQqkVTCiOghKlQursxaZi0zym7eafNAx?=
 =?us-ascii?Q?/H6UvjvPhF9nIkNF4mCBZQCbVtVOjv26FcyZgi4ZnyiHrVPid9meCi6/Cydo?=
 =?us-ascii?Q?UwPYsMWU6Xx5UZo4NQZXzBTgG+Bzj0P+8XGpiI8km9g3ZT99d04wAzF1vawC?=
 =?us-ascii?Q?v60g0zHCJJxxC3QSdBjuV4cK9AWJoGMGvWuj3oyAqATHw0ZGsV1Eap3A0wV3?=
 =?us-ascii?Q?8lp7odeJqYyyS2d4MEdRCelcHO9FOho2Vnj7RmqYiJzLh7sLkY5Clr61XAS3?=
 =?us-ascii?Q?gZtESc4zYWUXuR3LXGqirdbUS+gsnFs/0acrZNXcf8E2Y3odoZcSBJ4m66Bb?=
 =?us-ascii?Q?z58Uh0aUdzpiq7IOfF319XQESlVJn7o0q4i+lXVPtY4H3xU07g3VbPNJb55N?=
 =?us-ascii?Q?GDzimNJ4hwPlmqkBTN5ha4RJbUUc9/fbJBQ+94huCpsktIoIn1ER2SkrnSsY?=
 =?us-ascii?Q?w9mAb62It/0IlBC5cKwPTyT4IP1ET2zjfOgngnyGJKsS7J6HWlz7GoRq72CL?=
 =?us-ascii?Q?QU7MygoSJpfVsQQrp8gC9XjB27PvU5rRawTlX+ytBvI1+gHy6/0RfdhJ723R?=
 =?us-ascii?Q?X3djF4N4lsFqzSi7yuCdodif/aR1eotAPuWQB8IwZtGRxRmw9l4yipQLxK06?=
 =?us-ascii?Q?enfUd6rNfA4HSuGwBZIrrCZIFnpbiFBxwqwgDws4+dWkQa3a7PNaEiWv398M?=
 =?us-ascii?Q?u2ANlo3kIf+gBasWL2jSmxIRxwMwHu4vfwkcDFdG5CyeH9TAwiNaUbihGju3?=
 =?us-ascii?Q?zAD+9WcuUJ2deLaXuFP/5y3Nq4F2/Uu3tqegMFsESang+Kx0YMOKYPzg6T4K?=
 =?us-ascii?Q?cWuDnAHNOBrGRSCDejg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(35042699022)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:21:32.9391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c2f510-c6db-4677-ada6-08de25e49bd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11483

HI Michal,

> On 17 Nov 2025, at 12:51, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 12/11/2025 17:06, Luca Fancellu wrote:
>> Hi Michal,
>>=20
>>>>> +void __init setup_mm(void)
>>>>> +{
>>>>> +    const struct membanks *banks =3D bootinfo_get_mem();
>>>>> +    paddr_t ram_start =3D INVALID_PADDR;
>>>>> +    paddr_t ram_end =3D 0;
>>>>> +    paddr_t ram_size =3D 0;
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    init_pdx();
>>>>> +
>>>>> +    for ( i =3D 0; i < banks->nr_banks; i++ )
>>>>> +    {
>>>>> +        const struct membank *bank =3D &banks->bank[i];
>>>>> +        paddr_t bank_end =3D bank->start + bank->size;
>>>>> +
>>>>> +        ram_size =3D ram_size + bank->size;
>>>>> +        ram_start =3D min(ram_start, bank->start);
>>>>> +        ram_end =3D max(ram_end, bank_end);
>>>>> +    }
>>>>> +
>>>>> +    total_pages =3D ram_size >> PAGE_SHIFT;
>>>>> +
>>>>> +    /*
>>>>> +     * On MMU systems we need some memory to allocate the page-table=
s used for
>>>>> +     * the directmap mappings.  But some regions may contain memory =
already
>>>>> +     * allocated for other uses (e.g. modules, reserved-memory...).
>>>>> +     *
>>>>> +     * On MPU systems we need to pre-reserve regions that were alloc=
ated for
>>>>> +     * other uses (e.g. modules, reserved-memory...).
>>>> I'm not sure I understand this part of the comment with regards to
>>>> populate_boot_allocator(). Could you please explain?
>>=20
>> Maybe here we should just write that on MPU system we are populating the=
 boot allocator with the
>> static heap region, since static heap is mandatory for MPU.
>>=20
>> What do you think?
> The reason for the original comment was to explain why we need to call
> populate_boot_allocator() that early (i.e. before setting up direct map a=
nd not
> before setting up frametable). It's not about explaining why we need to p=
opulate
> boot allocator because that is rather clear. In case of MPU I don't think=
 there
> is a reason for doing that early, so we might not need any reasoning.

ok sounds good, we can avoid mentioning the MPU section all together.

Cheers,
Luca


