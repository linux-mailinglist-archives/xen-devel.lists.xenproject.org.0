Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A91B0EAD3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053293.1422045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTDg-0005zJ-Jj; Wed, 23 Jul 2025 06:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053293.1422045; Wed, 23 Jul 2025 06:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTDg-0005wC-Gj; Wed, 23 Jul 2025 06:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1053293;
 Wed, 23 Jul 2025 06:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLRA=2E=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ueTDf-0005w6-5f
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:44:51 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 870c4e0c-6790-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:44:49 +0200 (CEST)
Received: from AM0PR02CA0170.eurprd02.prod.outlook.com (2603:10a6:20b:28e::7)
 by GVXPR08MB10811.eurprd08.prod.outlook.com (2603:10a6:150:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:44:42 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::f9) by AM0PR02CA0170.outlook.office365.com
 (2603:10a6:20b:28e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:44:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Wed, 23 Jul 2025 06:44:41 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 by GV1PR08MB8641.eurprd08.prod.outlook.com (2603:10a6:150:82::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:44:05 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5]) by AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5%5]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 06:44:05 +0000
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
X-Inumbo-ID: 870c4e0c-6790-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Nc/1lShUdWv6dEoKSLp++H5KdVF3klwEzQJMK28qFk4+rtPbL1Mb3DrWVJ8PTNPt17IcXhz0393uooH64nmMGSRaPaOvda2JZ3GXH0q8W8tIoeR1lGaj1fuMkTT3/PjnVj7lv5dADuxZ1cjVXWnxFGyWsNyEpWaX5O3Ud+godGfIJgmUe0ReHgLTncVsOy9xZMBXzfRreArm6MKErVSxmscu0y2GfLJdlsJgJZtj+o2YKO8NV2HgtmaFDUHcH3LhtOutlOtX7LaIknCXKRNaf6aMkVaeHchEH6pJP4YNeEZ3GJjODWYndfIn3RxjtX2AsM8SqbJThWcBVPbHJPv3yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnG6VJtmapreUwJtAZ8L2PihWOSYh9+kQRKV1Ph3qgE=;
 b=ks0COBbtnBFkGDMhfUpECFTVXuFPa17YXFoda12ftt93tt6zbyn16HH3T6xVupLm7OIWrzR4JJ1Isd/NCdzMR/TjmndXAmR5FNP6fJy9nuOFSBITAZ8towH8h7bRdBxMQ4ajpgWTE1cQkAvVsgksh5QWOZv7kJLLZ3kW9sLJBNfZkrpIwqJ7EAWkkmy2jMUqtxsxwGMprbtjaNqF205yOQLsdSLAjOXDC223EF1z57Gc/dvO4bOjj9cekVJBqkAVGGaonh7lmvjxkOpC6Wcf14LlyGLyWAlrt/G+ZY30lIbNmF+CHV6POLx29pI2C6ZSOLf0pe356yPcmEjouTvwJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnG6VJtmapreUwJtAZ8L2PihWOSYh9+kQRKV1Ph3qgE=;
 b=j8Hwn7Cp/zu086vlCY9ByZAb8hWGcP8wqHBJhp5h2u/Oy6oAu6CtawjC6Y1JkiVMHAJJhhXOi5eWV9uncVx25n23ZYu6pfIzkRitva7bIcrLYEO988ncu6wIfzY4V41zQ++TCOkH2ArhkLb112lsJcBk/h5IwiPCTCQ9H6oV338=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp/m3Dir3cokoJ0EauBlaTEn6WXJtiJ0jk7UWvcFrGQsZxZWIg/8z9y8Ow7QjmRJhd4YMsIFDtl1+iRGoLxdu4rzR5srNA2shL48FZZFpsGc1OBC+qcW7E79c2r2q4dtkxaVlQHsFU9ogxlctLQj3hjkqi04XDQfDi57nzx3ewI33gPpcMOmkK9QtVei892FbrxIFh0L2HVuWBwKSiR8vhH7BattgrX00Fy8k9y8voGZG5pB/DItVGWGikbgqgHmrwCROK0zvLXSRSDY0h+I9Qncti8IzDnHHn5ThpzJlUsUhvDPUnGLyRC8SqXmoB/sD8XLTwsW2HjAIrNqm2J4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnG6VJtmapreUwJtAZ8L2PihWOSYh9+kQRKV1Ph3qgE=;
 b=VHNAPlJRPUQQvozvnBrYldBdRNhxEjvzLZ58IUu8Gjnokytb0lj7ZYavrgR/L4LGcyVvaDq0XQxvwiVTwWYn1gdQl084cBhRiKBKbDfD0+13LOVD62xgx9OE2naLQUPZhM666XbvtRo/uz72Cp1ZqGiK08uMezpdeT58bOajE1RItDEH5Tkjc4KBshhjcc2yYNV6rlEPVj6X/VaOdnfyRSrUZlBKJVV374DWZTfOStqle28fdT+8KREnw5sO8ehB+FNWZ496MfxXV6Zwf6pvoQtKwM5mH8RzYuz4Vo9Yi6xLj8sb4IgYiA2NffHr8EDWytRmyjgApLZfOUSupSgefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnG6VJtmapreUwJtAZ8L2PihWOSYh9+kQRKV1Ph3qgE=;
 b=j8Hwn7Cp/zu086vlCY9ByZAb8hWGcP8wqHBJhp5h2u/Oy6oAu6CtawjC6Y1JkiVMHAJJhhXOi5eWV9uncVx25n23ZYu6pfIzkRitva7bIcrLYEO988ncu6wIfzY4V41zQ++TCOkH2ArhkLb112lsJcBk/h5IwiPCTCQ9H6oV338=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] device-tree/kernel: Use memcpy in output_length()
Thread-Topic: [PATCH] device-tree/kernel: Use memcpy in output_length()
Thread-Index: AQHb+tzM3z6ZCe/riEG373GipwMM9LQ9kneAgAGvWoCAAALFAA==
Date: Wed, 23 Jul 2025 06:44:05 +0000
Message-ID: <076390A7-2E02-4241-9B38-3BF64A526BC6@arm.com>
References: <20250722074645.19029-1-michal.orzel@amd.com>
 <1d5c10bc-eb69-492c-9f1a-6a273feecdcd@amd.com>
 <0aac46ee-fd2f-43b4-accd-6eae133c618e@amd.com>
In-Reply-To: <0aac46ee-fd2f-43b4-accd-6eae133c618e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM8PR08MB6578:EE_|GV1PR08MB8641:EE_|AMS0EPF000001A2:EE_|GVXPR08MB10811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9547d9d9-aef9-47e2-454f-08ddc9b4672e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?1bSkyTUyrTdtGqLQ46fi5lFCNpCn7yp8tuFAMAUzwAfDToh4cxKNtbjAqUwD?=
 =?us-ascii?Q?yGj36bzIBR7wB7t0bIblKl2NtqSy/0YxCJEh5wc/8G0du23StB9L3+BiZNMd?=
 =?us-ascii?Q?wviEob43mMc6TviP2UKs0OyUe/7/5bRvpGs389two5YKDWXSLdN6BWYwqJb7?=
 =?us-ascii?Q?Nz1yvDdZydAHFciQuoevIPpCqlyRTtPJJwTHOR/8Fzaw+tmVTFdYSqVjZ/d7?=
 =?us-ascii?Q?0ppahQEaWWyjRqPF4OX5RdvLp16iBDdZDWMYdRNmQxtnS2PakgBiGBJIFhym?=
 =?us-ascii?Q?Z5Rdx4ZYHnQhd/70yJ3NtAlxBpo/VeSrGL9aPI6vzM8lp4MckSaBJlYCPUyw?=
 =?us-ascii?Q?pikegFDeLVmV2V2IidWGBuHcqhTCjkaEzts3tkURbgz4hsrt/dTzXaIKzfpF?=
 =?us-ascii?Q?rsWBI+aILTsKdKQ0USDrtfNqVf5rSOa91eEer/tJaouGYXu9EqgMVlsPLNgm?=
 =?us-ascii?Q?aekheIsiGpca6CJtGmb1DXjJyf8KDDVylSEHV419E/F18H6ZokqzYapJXBR9?=
 =?us-ascii?Q?5W8vESTxwkuORYJopHUdwizRUKUp938+seJjhj33tD5NdNXm7Cn0JIaT1t5J?=
 =?us-ascii?Q?x6r2dw8vYiZL5COnIx5dRVD4iz7OfMLLDDwmH+Xel7kT37LU2eieebeTNYCo?=
 =?us-ascii?Q?iV0+APXUaF07WxTIk/kysOWOUkc7yHcQxl/KFq2CKs2sgAG7i+MWJjL6HVbX?=
 =?us-ascii?Q?98tH/0sIsNcwLiNvJt1Zz+bCNvZa/OUt6q3ubAO0T4zITJdt1FUWAFnTGhSh?=
 =?us-ascii?Q?nbjtrXJP4fkgTEcfeXqqn2AhyRc+IpsjvDK3OzsY37xec81/pD99grmvUL1a?=
 =?us-ascii?Q?GNjiI+YHIEK2lRcv3XLLRn1gCO0lFci0UObd8Q6C1OEWQPh3k/eNN3WS7m6J?=
 =?us-ascii?Q?gfWJaM9MzbCoPMsFYDTsXCrWcOwasqjM2RHfVjRgg3RNsBNaOR++eewq2pmW?=
 =?us-ascii?Q?8ZFGFO7qf+F42G203RlBAPRp9szWSqID6YVXVsGuBQA8wgx2py/IVcpOTzTe?=
 =?us-ascii?Q?xXKEI4D1ReNbOJejegPmV/mTtzRNKuHj1HSChY5P2xXx++ACeP2H8slj3jmw?=
 =?us-ascii?Q?62rtKf+zgerirUvQ3BcTATfGm1z+loyMYy5FRZdRB2Q/04rGtFHr215KtYO0?=
 =?us-ascii?Q?XNx37Abnwc6nzxEzXtzXrNdTbxbE78YLW0PKbqrAsglzdkSmBD//CAYF2u9s?=
 =?us-ascii?Q?hbCNtqOVk7TwIXYqPt+Y17QqeMvNjY+Cso22YN5F4GeCMYjPRwnAAUxpOifL?=
 =?us-ascii?Q?ycVKXDrKsncA9/uGYiYe4Zqh6XfNOBKG6bZkSqHfzQ0g4eCMo/bRO/0Jham2?=
 =?us-ascii?Q?BVUSPDy6fvxrhlq/DSQ78wl7u6ARF9LO28e2gRi8h4ZojfFhin7tm6QVZma3?=
 =?us-ascii?Q?IAv5YrnroNAdZj5LNV/jOKOmgber0XTgOrfblagxW3kOK/vxMK2XoZJS/VYJ?=
 =?us-ascii?Q?vtExlINai+boUEZKxHFh9TEBNMOmImelzH4mW5SIykuQI8AxhVVmEg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <81AE4CCFA0EC774CA493FC38AA7FC8D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8641
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cffef032-e18d-49f1-6ebb-08ddc9b45136
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/fydVVdNKLGV3cn305UmyqMy8FSRXD6k8aN9bRmemVLLTRG1ddRLdr3U89Yi?=
 =?us-ascii?Q?9QfW5XKsqgCrp9d3A5zU48szsOQpIIZLjoXTu12Q4+6K+xNgW2hlgf2AofSz?=
 =?us-ascii?Q?oIQ9+5chqocjrVCUD8odDXZp6Pf+lQjDbtEDoFQ0aQ888lAB7RiweU0AgGv+?=
 =?us-ascii?Q?0UVNpjvUsvg3EKx+mEW2AYyNdzC2UCyIXLtoO+OfLqiJRb1xP9VpN5Bl/pmS?=
 =?us-ascii?Q?MWUHvFbfHmZ8DCXbN9t4eOyKq0KIEVjoWDtMIKW1PV9fOwHzzXh6DGS22fEN?=
 =?us-ascii?Q?Dsrup8f06aXJMDDmNDg/4SdAXJRDXXNAY1/y3s3p0MIe56HzlJpnIVxawypG?=
 =?us-ascii?Q?ubvJWDwRReQl2ybnGwNO+JNhHc9iYS6h4BLV9+B8cIivzMh+HDufxCHT0Vca?=
 =?us-ascii?Q?Lo3a9EB5bwiTM7cIdrt8cDqxTM+mtIdJLYWw3nWRCGODxhOtfW591VscSJza?=
 =?us-ascii?Q?GL0PIhDYD/+RciSJdExSZ8pCSJAoi/pdglhTVuh1rdANgt42KQpwHL1gOIzh?=
 =?us-ascii?Q?QxF8/bcWtlH3BTOHX7Mf/uO5XsDtL2/+GxmNx+wy5OXl/OtybI2KLYMG4MZp?=
 =?us-ascii?Q?6yn9t5DXO9NdMuzWpKrFtUawdaqD8JmBuMoXT4J9BjEhvznbSaPIUwiA51Oh?=
 =?us-ascii?Q?M8QUA6NYjTHmLRIkcfPLTDeQP6WcohaD/ELybDMy9CVCV2pxJN5Ep2QfUY+d?=
 =?us-ascii?Q?HH0wON8CJLtBl8ruNEUDTthHDpCbf+V0ww0fbhDWSIWL25EtG0/9lKdZK52E?=
 =?us-ascii?Q?SJ2wvxZgNuAkrDd6KjzXGefK4Eqo8SUKLMQtP2llJ3YxuYyvcEWSYsLet/Wb?=
 =?us-ascii?Q?gVcyiI8BgYbKhVoYpBKbbIfb7wkeMmXVD1EWn56gXTrOXl4IAq7ImOl0VgXr?=
 =?us-ascii?Q?wWWJkt8htQ3/lvy+VbT5fPhF69XDe8wRPlviH8RnbQD2qCZQ1ahpbV1YrLqn?=
 =?us-ascii?Q?Ws1R302LOTBmnmKfr9ehwxKQbl5Mc7Z2cm+0F+g4X5VmbdmJi2o3z9mW+stD?=
 =?us-ascii?Q?y8Prswjl+N98pKNHOhlHOdq4gL+KS2UulCbc2albwDfEsjLpC0bTEppGSt+l?=
 =?us-ascii?Q?Fg4NkUamd5UBlUlTAwXVDT0xLYuApXs18qtTGKGgiSsGeiwGX2Hmp/rko0mV?=
 =?us-ascii?Q?VDKm7A/IUD0GkQXbRimxTupueUrNJ3fqMASlkrsVY/e5yHdgvVobnOHZJ4Bn?=
 =?us-ascii?Q?x8pKmCUARsVJNFOoAo18xisyaZbhkK1eWzw77bc/837qcOFcsFsDYXOzZF0W?=
 =?us-ascii?Q?xXIi35SZ1gL40cA/v1MtDZxetK8djBkvYT5dHv/Q4bH14OWpzBaHNLPRGKWK?=
 =?us-ascii?Q?fiauyU4Em9aIYTNMn1xRCAdM8/qWNwZjd0Mc1EuCHifwJYg2eC/tfC86ys2h?=
 =?us-ascii?Q?6Ufxj9zzUuyPePx1cERu2YMiUBW+keb/kP0/ZgREcrYWqiQIapnvugE0HYcU?=
 =?us-ascii?Q?zcEOqckg02RADzI67ctlgm8kc8ljbbiw2iR5XQA1M16EQp26r82zT1kGusTI?=
 =?us-ascii?Q?cHr+IGzxGyLhXLbacbzJh7uV2s9SGgvOt51P?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:44:41.7880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9547d9d9-aef9-47e2-454f-08ddc9b4672e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10811

Hi,

> On 23 Jul 2025, at 08:33, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 22/07/2025 06:50, Jason Andryuk wrote:
>> On 2025-07-22 03:46, Michal Orzel wrote:
>>> Trying to boot a compressed kernel with UBSAN enabled, results in the
>>> following warning:
>>> (XEN) UBSAN: Undefined behaviour in common/device-tree/kernel.c:21:12
>>> (XEN) load of misaligned address 00000a0040f89867 for type 'uint32_t'
>>> (XEN) which requires 4 byte alignment
>>> ...
>>> (XEN)    [<00000a0000529964>] kernel_decompress+0x2bc/0x5bc
>>> (XEN)    [<00000a000052a354>] kernel_probe+0x6f0/0x734
>>> (XEN)    [<00000a0000528714>] dom0less-build.c#construct_domU+0x188/0x9=
d8
>>>=20
>>> If &image[image_len - 4] is not aligned to 4B boundary it causes
>>> unaligned access which is undefined behavior on Arm. Use memcpy instead
>>> to be safe.
>>>=20
>>> Fixes: c1be0b102e0e ("xen/arm: support gzip compressed kernels")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  xen/common/device-tree/kernel.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/k=
ernel.c
>>> index ef393182b691..28096121a52d 100644
>>> --- a/xen/common/device-tree/kernel.c
>>> +++ b/xen/common/device-tree/kernel.c
>>> @@ -18,7 +18,11 @@
>>>=20
>>>  static uint32_t __init output_length(char *image, unsigned long image_=
len)
>>>  {
>>> -    return *(uint32_t *)&image[image_len - 4];
>>=20
>> Maybe just:
>>     return get_unaligned_le32(&image[image_len - 4]);
>>=20
>> You'll also need:
>> #include <xen/unaligned.h>
>>=20
>> The gzip size is little endian,
> I thought about this solution but decided to use memcpy because one day w=
e may
> want to support other compression algorithms and forcing LE could cause i=
ssues.

That makes sense so:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> I'm ok either way. Let other maintainers decide.
>=20
> ~Michal
>=20


