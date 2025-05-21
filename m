Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C593ABF3CF
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991756.1375580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiHX-0006FW-UU; Wed, 21 May 2025 12:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991756.1375580; Wed, 21 May 2025 12:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiHX-0006Ch-R0; Wed, 21 May 2025 12:10:47 +0000
Received: by outflank-mailman (input) for mailman id 991756;
 Wed, 21 May 2025 12:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEeW=YF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHiHV-0006Cb-EP
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:10:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2613::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ee0579d-363c-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 14:10:44 +0200 (CEST)
Received: from AS4P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::13)
 by PAVPR08MB9457.eurprd08.prod.outlook.com (2603:10a6:102:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:10:41 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::57) by AS4P195CA0008.outlook.office365.com
 (2603:10a6:20b:5e2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 21 May 2025 12:10:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 12:10:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 12:10:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 12:10:06 +0000
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
X-Inumbo-ID: 9ee0579d-363c-11f0-a2fa-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vp59a7G8ekOFvVgkBY1V4SbUTKPhjqdXNGb/Z6LJ3CLGxJPQL4Xyg47/5xOEnvadYyaspzYMWhkyyjoaM14QCDHB52cN8o7LcIx0Q89QsUDdPXsr0ahCyeF7EsUYIi8v2GbZTzodnkWe9DUvltxztQzeiDf5rO2q1kZKGAHlUmTgwzGptN5eMtgiU+A4xC2zRlrVpH15XD88zORUjCtLI6NJ7mMyPDcmKm+0IpdQ7ReAGxOOljzTw9cX1dOjoGlDNr6QAqve/n+m2M550yzZ6VlZ1EhnAYjdemg853BrDCphQA436HgiK80t/5+9D6VoEeCr7p8tSI5Pu3AUIl4J4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcSkkmGT7b+3fviiu8CoKuciKMK1pXA3TW8fB0LM+Mk=;
 b=Cyw1lM7VasPTINXgJaWqSPwbGxSabgF3KcQwQuDwYLVIjAJbQzlFu8wicANz72vNAJllzbnh7k+D+F4nB455H8ofT3kwTjUcwjNktzdHSd5YsdtNRMuc4R0YZO4/nVzUDsZhzWzb8h5myRNm8/jfxyFw1MZUPpCrYJHCekb2iWPi4nURS9pYN+PCPTy6aOofj6aJITfCUHUXoWS7qTB205u/OQo0C4/3p61uotwxUsmIqQfZUSF2bS+hFMHcS4nHFjqyHG8L0CzFRcvlC3zoaP0RXUu6HHWcjhE8jAYa0MUf6q263ykC1ku7ZfY4Sbo7cq6XUx0OVc8Vj31DDpFUog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcSkkmGT7b+3fviiu8CoKuciKMK1pXA3TW8fB0LM+Mk=;
 b=hRM41e4SH4tbXi3jWc48xw+q/kgrJxpIePKW0wMrg3313lbrAs/4hFBPrxawrCGW/mUfoUCN3lS94635axYtxRCNKjtT5KjBF/Km9ol2TZD67DHMiAO9IR916xf5Qf4NFqmcX+ga6sjKjiiYIZYKEkuHOG+wQ328qBWla9x5dS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRm/syPETxHaT3PzZN9GQ2/nN0+7kSplvERyd9NxMpeXakToGz7CiLsFw/NseLVPHuhvMuWMZJxl1iz6cgRAdIkbdu9H+rIJttjC0FO3l8v04leemqxntD2ZebnILtCVzsN4KpsHMJnwrAYK5VK2Yx2vlCEPr2bq4/X2uMymaXLlEtIrJ4ig7CIEmZmTZFXN6rxMW5TrqDWPG6+jtG/ZJd3iEmV0XdHK3B0NiXvggO7lmvkBzMX0AvDWeoNrcoGNeJxLc9Uuv0NlA+GyMBeFxBgm65JuXe9zLXSBFEavXzAbwdNN+kkRDrjLKwGFLy3SnIgXy64ywymlFPZEl0qsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcSkkmGT7b+3fviiu8CoKuciKMK1pXA3TW8fB0LM+Mk=;
 b=F1PU7J83vES3q+VIg/1gryK+9z2zCLbXnpZdK9yoczwVQQxGHD+42BxjGiMdne3FVnVYZf1z3dg7NsJW9wnbiYkecjQS7d59421kx1n5FM/+R2vfQskApEGlx1H9y33KV3vHAZgDIg9rg2IRfiywuq56w0/ILiuUMmEOl9mvtseCD/cg1IAg8eY4qYGdGpGxGO4VZrhvdQGVdDDXOLzqrsvS3cwo01phjMfkix8QP/tLMvzKe0fG57+uRRSj40vluJJnQVspSD+kAdcKseCaxlLYXrJS7ZOwQu4Dz2g7pX8Vxa3jGK6oUztLur/KkjM1Uv8kbBTfcQaskEnEW2Qmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcSkkmGT7b+3fviiu8CoKuciKMK1pXA3TW8fB0LM+Mk=;
 b=hRM41e4SH4tbXi3jWc48xw+q/kgrJxpIePKW0wMrg3313lbrAs/4hFBPrxawrCGW/mUfoUCN3lS94635axYtxRCNKjtT5KjBF/Km9ol2TZD67DHMiAO9IR916xf5Qf4NFqmcX+ga6sjKjiiYIZYKEkuHOG+wQ328qBWla9x5dS4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands
 of XEN_VERSION
Thread-Topic: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands
 of XEN_VERSION
Thread-Index: AQHbwNT/t0poWSgC+UCvRirhbzGp97PdENyA
Date: Wed, 21 May 2025 12:10:06 +0000
Message-ID: <F4CC8423-AC3F-4F7D-AC99-047D4F8C7BF3@arm.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
 <20250509112447.2931909-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250509112447.2931909-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9867:EE_|AMS0EPF000001AF:EE_|PAVPR08MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: bca68ee4-4609-4c98-6ae5-08dd98608038
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?4Qf7nOFN5mTJnfGEJmjOhMeyAlXjkU5CxuKUiYjNpINaITBMoXAFMqO8JI/G?=
 =?us-ascii?Q?OwYwONnbyWX0KQTBuYet5MPgMgHgTsfh7l6q7diGQQAvd+1EWNK0mHrwM5kl?=
 =?us-ascii?Q?A3AHVamyb7R5k0am6gux2B1aJuvn1bVxelLsqIka9WU9VDPQmt6gczSHv7kZ?=
 =?us-ascii?Q?jLJxv27wGZLR4PSVOq+h/wOE3N5iKbSL5Duh67XejAXx444Q9Y0KbBnnZWA9?=
 =?us-ascii?Q?ziAnG9Wzoum+HPg3Ydg8rQAFAfUWmCoHjogfeHlP6HxX0GRXKc7Fa22j6K18?=
 =?us-ascii?Q?Bohcx7m8DBqqhZ6F1xI4GGBesJtrlbDDCrHSQA9Esphqv8nIK3oRnUFyT0Rl?=
 =?us-ascii?Q?mPJ5/owqa7MJQGQFHeob4+bD8MNy/X/G13BFa5ygXna2GyTGlMFraoL83cik?=
 =?us-ascii?Q?XSmBrEETZ81jvQpZUih8dy8xF4n/W8OLHu9q1bzdQn3piK8ZC+zMwGMZ/A6u?=
 =?us-ascii?Q?uBQkFAiAXttjIstThAvlhs15exrZ5m6DEX4YVXg0D2sLGTD5RUmICcASwi5k?=
 =?us-ascii?Q?1xpvKkstq02oyQ99iJMVsi50xrmCrhibeTLXU9ebKvF+79RtbWNBM02PhUrd?=
 =?us-ascii?Q?xMc1tSFizpr6LU5v05vAVv9+9DmMmKf0TjEuGc23ocr3w03kn2H+IfncqpkA?=
 =?us-ascii?Q?z7f+TT5lw9E6LPZDlCbHl/q2c441vxZLGsNIEu/m6rDjM7zenbWbQYTq8A9a?=
 =?us-ascii?Q?wPM3kK62sQqXDhVvs9+5k2xH6yfB601sCPXLnH7UpTkRZFQ8W2iDJFNKocFf?=
 =?us-ascii?Q?B74k+NXn+oAwGpGB9vFfm5wUpbhP2LUCLylF5QFrYy9BaEBue/2ZYyYE4+W3?=
 =?us-ascii?Q?JQc0EBjGX2gYBk99tEXl9rPW6taINsCvv02Twa87KrfXSTLlmbWEVrW+7th0?=
 =?us-ascii?Q?8O1q5UvMfQKJOGPBW+f2IXD6FWERLlF7n1E72u1Adjh9VwtPWHkfnsld5lV/?=
 =?us-ascii?Q?2/GVhgAjtLCI4BJ6eYpj/kmhGsftFyjMy4PVwl25261MRngkE8cVstLNRmtp?=
 =?us-ascii?Q?gzHGmsR5mWdMHMmdQe26LROIEmG/E/SoESYuSDNgwcBnLGFTjaRLQ8taAAJ2?=
 =?us-ascii?Q?1Fdy90WqkHKl2DUPc0e5AmdKRsWBv8cx6QR3hirD6aS9/FcvHHDI6es9ttDH?=
 =?us-ascii?Q?YzjNjYgMhu5/s65cmc6Xs6C/6l9KZi3xyRE4KHIwgeupqK2b4chEnbxQmDhu?=
 =?us-ascii?Q?m7xHB8zM2SooBQxYqdRs+x4oFnZc6BHGjTm6eBANBm+JhLt8HPgWUqqwyxXD?=
 =?us-ascii?Q?4V1jbBqYeYUAPY2ppfF4Sa7bxY4apAz3OH4SpjGT4AuDqsBtp6oi4dD1ny8n?=
 =?us-ascii?Q?YFNKsb3UzrhwUTe+qYtd2IaZM0fTFtNSh396SPV2AyIbC6SgPBls5F538bR9?=
 =?us-ascii?Q?5eZ+wR4x78W33t8ZEDrVcdNMBUf3hmwFWh9zOYaSpM3PtLu7zINL8ljp8d10?=
 =?us-ascii?Q?aMzxCdriUxs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8268D9E54BD8174DA0701A37BD4345B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9fd7c93-1005-4914-f33e-08dd98606c8f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|376014|82310400026|35042699022|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jE3sENhPvSrQGYwjNugYf16QnPiVmQC9rvM1FshUiNGaQcForCKNrxfxyXTL?=
 =?us-ascii?Q?K1Ig/xqE1SoNf3IyabF4joG5jJeS8Xeb1+aMxg+McOeIKq6i4M47phLBKnB+?=
 =?us-ascii?Q?Ylr1Eg4WomhmlB7L0ZR2uMi6+VvSD1ECDZBzkA/1mDe79CQ6yYiYizrF6NNa?=
 =?us-ascii?Q?JYXYjz26sHZPBPGwrjB+LE4jN/LzWq7o5AqGuU3BDYQgkJu9sjgkyyD7p/ue?=
 =?us-ascii?Q?OToQ3B5SkuyTLpA720FuiPNQAkn0AN3runv9/H6EZ+sA+cez65PSsHbnyeHa?=
 =?us-ascii?Q?oXqFVVIEaryTWDadQdXdE2LcvQuBvBv9MWAL/kV/xsa2p3HsoPp+S3EvUqwq?=
 =?us-ascii?Q?1AJyyZ6kjRxgITAXo7Ieh55BCkM8l53NXmtkhf+prz358odHFqivxOIMJUif?=
 =?us-ascii?Q?zo2DoiTRMEQpITBJYMFBffyOV/Fj3oGq3TtuT3zIFPI+MO2e/jqzMi0obYcV?=
 =?us-ascii?Q?flaXr5vW+pyOf0iuAuOVSDbIvrS+FQbAznpIMzHkiwZ0p5qvM+2YZyTHS4Wa?=
 =?us-ascii?Q?FoN1oEXvPpKWQGN/S9FI7CURNnjqG5HQTJ8b1GI59p40nV0TkifnYvrNFNJR?=
 =?us-ascii?Q?g2oYTHkxRbUQDeT87oxg4BEHG8lMgjciqbPyfEO1KgSiRlq7OO+SRVPwWbmj?=
 =?us-ascii?Q?VHWdCtt7jwCn4ca6YWQUkdA8aduIb6fth6bQ1RLVqHbibqm1ZZB2OuVmi1iN?=
 =?us-ascii?Q?fltPdUtoC+npSMqS2wU68hCyl01knE7ktzwi/xO+EqCUp10JxaFKkn4v9bEc?=
 =?us-ascii?Q?0SbmOrt1imjA2AFnXN34GvD+AqAhgdb91nBWUU/ae3e9w3euhlTM3o5gDFj6?=
 =?us-ascii?Q?8449gZPsPxRYnHgEmDrkHcWozcpfe8lZAmrWeUrWRXZ11kbRVWw/vfpuEgDT?=
 =?us-ascii?Q?/+0a6gFV/ymtd1w8tjVMH0whhVlsY0gIEZCquS91om12DPIUfeYoYBi9Oxvi?=
 =?us-ascii?Q?kyfwfdg7Mhu4QT9XbZvbgXx/9/9aS2X7tXQRiFFW8LRy/x7uVCuSBi56VY1F?=
 =?us-ascii?Q?mZ3PzWynLbKrZY/gCji8/YFMi80D7/b1mRRNX7k2Lh3jYEHZyqowaUdscCyH?=
 =?us-ascii?Q?/3sLa1EArDosqYDD5vmj8E1wgtReJ7jKh/97LAKI/nHvBegvfaf8zpwiI1cL?=
 =?us-ascii?Q?fVjsj5pZZkfWP8uOpwHDOnKXaZHmeb1wIhY4k4bSmZLrx1IV6Lbr1dNB0kDE?=
 =?us-ascii?Q?0f62kxyyiGHr/EtxpQg68tRiwj1rJ7RD+TX2NDO2ldsQNChB12/0W7R59WkX?=
 =?us-ascii?Q?ZsqRal2ncnkQMY3t6SzN+koXozpT027YPIV7NNsDFqoH+2MRnAJEA1OzWfB5?=
 =?us-ascii?Q?PhBBGvFwoZf82ZKg/MdWCjWg7cPoPqNROWESPRu4NeIezZR8NGbu5ZnL0hGM?=
 =?us-ascii?Q?FWf5EONSqHuujkgYJt4YaqjSop6jdC5aUMRsI/UYolemOc5qGg4UduGYVN+W?=
 =?us-ascii?Q?yqGbnKiAlelL7JMUcg15RtR+r9wtDhHYt3IO/wSIAUqT6mY+H7fhbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(376014)(82310400026)(35042699022)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:10:39.0975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca68ee4-4609-4c98-6ae5-08dd98608038
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9457

Hi Ayan,

> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Define requirements for specific commands.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. Reworded the requirement so as to avoid mentioining variable name=
s
> or hardcoded strings. Otherwise, one would need to change the requirement
> each time the code changes.
>=20
> v2 - 1. Moved few changes to previous patch.
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
> .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
> .../reqs/design-reqs/version_hypercall.rst    | 82 ++++++++++++++++++
> docs/fusa/reqs/index.rst                      |  3 +
> docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
> 6 files changed, 237 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> index f00b0b00f9..f58a9d50aa 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -56,3 +56,18 @@ Comments:
> Covers:
>  - `XenProd~version_hyp_first_param~1`
>  - `XenProd~version_hyp_second_param~1`
> +
> +Return value
> +------------
> +
> +`XenSwdgn~arm64_ret_val~1`
> +
> +Description:
> +Xen shall store the return value in first cpu core register.

use x0 instead.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~hyp_err_ret_val~1`
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/doc=
s/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..3aa12ea2c2
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall have an internal constant string to denote that the cpu is run=
ning
> +in arm64 mode.

This is untestable if this is purely internal so this cannot be a requireme=
nt
I am not quite sure why you need this, can you explain ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> +Capabilities AArch32
> +--------------------
> +
> +`XenSwdgn~arm64_capabilities_aarch32~1`
> +
> +Description:
> +Xen shall have a internal constant string to denote that the cpu is runn=
ing in
> +arm32 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa=
/reqs/design-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..aac5896965
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> @@ -0,0 +1,82 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version
> +-------
> +
> +`XenSwdgn~version~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_VERSION) storing the version num=
ber
> +coming from the Makefile.

I really have doubts about this and the following one.

If this only goal is to say what should be returned in the XEN_VERSION hypc=
all you might
just need something saying it and mention this as a comment because you wil=
l have a very
hard time to test such a requirement.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Subversion
> +----------
> +
> +`XenSwdgn~subversion~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_SUBVERSION) storing the sub vers=
ion
> +number coming from the Makefile.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Error copying buffer
> +--------------------
> +
> +`XenSwdgn~error_copy_buffer~1`
> +
> +Description:
> +Xen shall return -EFAULT if it is not able to copy data to domain's buff=
er.
> +
> +Rationale:
> +-EFAULT is one of the error code defined in
> +http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/publ=
ic/errno.h.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~hyp_err_ret_val~1`
> +
> +Extraversion
> +------------
> +
> +`XenSwdgn~extraversion~1`
> +
> +Description:
> +Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extrav=
ersion
> +coming from the build environment.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_extraversion_cmd~1`
> +
> +Changeset
> +---------
> +
> +`XenSwdgn~changeset~1`
> +
> +Description:
> +Xen shall have a internal constant string (XEN_CHANGESET) storing the da=
te,
> +time and git hash of the last change made to Xen's codebase.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_changeset_cmd~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index d8683edce7..de19b0cda2 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -11,6 +11,9 @@ Requirements documentation
>    product-reqs/reqs
>    product-reqs/arm64/reqs
>    product-reqs/version_hypercall
> +   product-reqs/hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
>    design-reqs/arm64/hypercall
> +   design-reqs/arm64/version_hypercall
> +   design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/hypercall.rst b/docs/fusa/reqs/p=
roduct-reqs/hypercall.rst
> new file mode 100644
> index 0000000000..b57b9acde8
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/hypercall.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Error Return Value
> +------------------
> +
> +`XenProd~hyp_err_ret_val~1`
> +
> +Description:
> +In case the hypercall fails, Xen shall return one of the error codes def=
ined
> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include/p=
ublic/errno.h.

s/the/an/ hypercall otherwise it is not quite clear which hypercall you mea=
n.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> index 400d51bbeb..2ef1c4f9ca 100644
> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -41,3 +41,86 @@ Covers:
>=20
> Needs:
>  - XenSwdgn
> +
> +Version command
> +---------------
> +
> +`XenProd~version_hyp_version_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve =
Xen's
> +version in the domain's register 0.
> +
> +Rationale:
> +
> +Comments:
> +Xen version is composed of major and minor number.

How Xen version is encoded should be a requirement, you can add this direct=
ly into
the definition of this one in fact i think.

> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Extraversion command
> +--------------------
> +
> +`XenProd~version_hyp_extraversion_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
> +extraversion in the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION'=
 command
> +line parameter while building Xen.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Capabilities command
> +--------------------
> +
> +`XenProd~version_hyp_capabilities_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
> +capabilities to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Capabilities related information is represented by char[1024].
> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.

Isn't it mandatory for xen to return aarch64 for arm64 ?
This could be turned into a requirement (easily testable).

> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Changeset command
> +-----------------
> +
> +`XenProd~version_hyp_changeset_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 4) for hypercall (num 17) to copy chang=
eset
> +to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Changeset is string denoting the date, time and git hash of the last cha=
nge
> +made to Xen's codebase.

Does this has a standard format ? if so it should be explained.

> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20

Cheers
Bertrand



