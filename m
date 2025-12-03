Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CAC9F46E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 15:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176870.1501331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnli-0006zh-1A; Wed, 03 Dec 2025 14:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176870.1501331; Wed, 03 Dec 2025 14:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnlh-0006wk-U1; Wed, 03 Dec 2025 14:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1176870;
 Wed, 03 Dec 2025 14:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcFb=6J=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQnlf-0006we-UE
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 14:23:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab5b2d42-d053-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 15:23:42 +0100 (CET)
Received: from AS8PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:311::10)
 by PAVPR08MB9083.eurprd08.prod.outlook.com (2603:10a6:102:325::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:23:37 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:311:cafe::3) by AS8PR05CA0005.outlook.office365.com
 (2603:10a6:20b:311::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:23:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 3 Dec 2025 14:23:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAXPR08MB7468.eurprd08.prod.outlook.com (2603:10a6:102:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:22:32 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 14:22:31 +0000
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
X-Inumbo-ID: ab5b2d42-d053-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ppwpAlkaf7geG4ca2ay2yIk/J7CDMrNJrX/z1cXKdODckP7WTd4FZ5E6txEX1v9B7EvaDa6DwTLfMz7h+ity9ny2JDqzTZzx+TDMLtzv5QN0EJD4yeWLh+n7J92u1LXDTyohXAtXu81frvQRldD25j8JIEb/PTksWo4KaAmiKHgSV3VurmrMUmMW616zA4473vUjN7Fa1Xv8KDj7B1WqF5q61iaPqAnxHR6EhnLm5zveE5cJHy8MkBHrgWaRARaeUM/i6EZvIVAZODl/XL1+nVB4Ee1znscIWMb/NNl9dxx+Ae7R6G6BPsX+gk9RJ48kbtVnw311CeiNfcUiEkeTeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAY2NJoKF6dhvdCIt7QIOTlfzvtsswO8KDntMLjoqbk=;
 b=HdfM9a+bx6FkdwYlElDaPcFdMEaXe4ClGbKF2s0slavKS23PqhFif0Bz7blQMdMgEEcIGr0kWZTSRt4qb/DL7dvxiRujxaa62F3vTlmM+e8oQRDdMvN69a5TzR7P17CmrGvFHkLjkym5euNIptpl4eRUo8fWyctZPvDqfjJDz53cXy0lPfKnFJTxmH+89I0XUTmdqOgZyQZtCy5F4/f+xJh1mJKP0dAilICMPWX759QEnB8HjvzbqPXGM1y7Ofc3BjEV78o5SoAupMTtIgh582tiC3zYvsJ9uPSrlTNavIKOQiSOPbtZql2a8zQ2twJyeNjNFqHEKnZfvFIj3vOEZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAY2NJoKF6dhvdCIt7QIOTlfzvtsswO8KDntMLjoqbk=;
 b=ptjCh3AHmEAFf5DtSHA+7Ylo87T4SGTMlIxyRURwe8SZeEqOsAgxERNQZn8a8yhvwg2cZlwrDCzz+39HKubvLaqNtcpnAfu/f1hMOCvdYKkf6Sd117NaVeu20PBzFRnM0ytuWgpchjjjKaSItBT5/VaB1IoYQvWH5HhQvjM8xms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyUDAhHKhvYnABkmFt1v4TMrt030E/JppYflnZSbB7VKE+pFggCnGTTuJUJyvXO6z5I04xAbwULMH62uEOn/inmR5mu+erPGVOX+1Q3jxr0B4r3ci80jVX0k9jLQ3WPDIjkNripUKhPPWWA97t2yZSCbH3Rzcze8YoaWE4LoMompAC2vliP2hAhToEn41+0fdtLlKkk6ILaPyu9r5Uvk5+Oi8Zvx/NabpZrXgGY52gC8IJCk4pSkpVHxSuErE8KQp4sB2BNC/T/aq7Ds0VS8JvUAiMV8q7uResebUjpyZcbiwnvjKGzKNlOVOCntWOCQNvh6dpphfQD9p2V4RWCdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAY2NJoKF6dhvdCIt7QIOTlfzvtsswO8KDntMLjoqbk=;
 b=y6iZbLEJVNIx3ppYKSo/gAymtI0n5D0cRjTcuEZVzlIR6CHgnfkyCj+lfzK0ru1SOGDyCxrAfb+snE/jr8m2s/3OVlSdw3Vi/NH3hSpEeS5QoqfkVZEikkx4jFdJ6O/0Y0p0V3KlKBrhkZyp2oIXXUYG439B2gaO07UF1IMtDMysjzBOMadywPCtatHG9TBf/KgrsAYXa767nIFAOcFCceOaYGSM0/Jj9jLCDurcnr28tLu8ZbeomRBCOBkLaWd9z+XrWGolLom75ifTsdHFP22IkflmXSlC6szsNDtzpzHWFrI/dSyi8t+QKKeSXDbbLpxxNp3Gk/fDs+4bsQPdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAY2NJoKF6dhvdCIt7QIOTlfzvtsswO8KDntMLjoqbk=;
 b=ptjCh3AHmEAFf5DtSHA+7Ylo87T4SGTMlIxyRURwe8SZeEqOsAgxERNQZn8a8yhvwg2cZlwrDCzz+39HKubvLaqNtcpnAfu/f1hMOCvdYKkf6Sd117NaVeu20PBzFRnM0ytuWgpchjjjKaSItBT5/VaB1IoYQvWH5HhQvjM8xms=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 07/10] xen/arm: ffa: refactor direct requests via RUN
 helper
Thread-Topic: [PATCH 07/10] xen/arm: ffa: refactor direct requests via RUN
 helper
Thread-Index: AQHcX7X0sGAu99JlG0eRwdEB2YckarUP+a4AgAAHX4A=
Date: Wed, 3 Dec 2025 14:22:31 +0000
Message-ID: <F68AA498-C239-486A-8C29-4AACC55B8B5E@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <b13dfa489f41d5b72a25f40d6e45d38ad1b93051.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44EJdyBV0Uy9yY8xo7YuJPLfUM6v0RtfpRiEqUu=o1ig6g@mail.gmail.com>
In-Reply-To:
 <CAHUa44EJdyBV0Uy9yY8xo7YuJPLfUM6v0RtfpRiEqUu=o1ig6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAXPR08MB7468:EE_|AMS0EPF00000196:EE_|PAVPR08MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 333a830e-a9ea-4c27-cbbe-08de32778c1e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MDdtNkh2RWsvVldWcmtsb0sxVzZnb0hialpOWnpiR3FxR3JjRG9rSXRnbVFR?=
 =?utf-8?B?aVI3U09iQjExeGVsTkxTdytlVUsrZUR4Y2hYQjhZWkk1NDdUdURNUHNEWjAx?=
 =?utf-8?B?cjdtWVRmVEc0N0RDRVNQQWdnZXBxNnJIQ1I4OEs0eEtDRG1lQWxpeVcwZnNa?=
 =?utf-8?B?Rkl1ZUZyL1hFQ2J0QXpyRGJUQXp3UlZodWxid2xvNlUzTTNkb3hNWTZSckdX?=
 =?utf-8?B?SEZmczc2UzJJV1lvMEgxcjZqcSt6eVZNOGhVOXVKb3dpczBJNTVlWDN2elNC?=
 =?utf-8?B?LzBRVUhST21XZ1RQN0pYRENZWGVaaktUMTFZYWs3Y0JQRmd4RkwyT2FSamJB?=
 =?utf-8?B?dDBrV2Vxcm1MRnJ4RENXVVpVb1VIWm5YZUs3bW9hRjQ5aWIvT0NZL0RxMUtL?=
 =?utf-8?B?enY3Q1d3VnJBMEpoVGFYeHZTOXF1Ylo4T25ubmx6czZwZVR6N1RIU1YrZ0d6?=
 =?utf-8?B?NkJ3Sk1LcFJrTEhOa2dQU29QVWJDSzJqUitnbURZbnVYV1RlV3gyTUZnSnBu?=
 =?utf-8?B?VGlPNXFNTk5qNWJnZkVaM25mODkyM055cU5oL2Z4ZkkwY3lTOE1HZGRYK2x4?=
 =?utf-8?B?a0hTK3YxckVIRUVrV3RuOHlVNVdCdzY1eDAxZHdVN3BlczhGdDlPN1RlWUlF?=
 =?utf-8?B?eVRMdFJPT2VpWElIL25ueExRWWRVQ1NiWXc0MVp0VmRJdEROako1R0tabmU5?=
 =?utf-8?B?dEtBVFZvL3lucjJNbFZJYllGTWlHZVZjeGFHTUFZZ3B0eXBMTnk5aG5HclQv?=
 =?utf-8?B?c2IwLytUcUdhNldjZUVXdmYxQ2JJcHVyemRTOWJ6a2s0aWdvNWNYSWd5THAz?=
 =?utf-8?B?MnpwR0xuaDhwK2cvREJPaHpVd01PWnFHL1hjc3hNVTczV3UrdW9RWTkyVGdI?=
 =?utf-8?B?cWVDcFhpaUNUZnRpYWc0RURUMDFCQmNvNVhXUlBLSEZaaFJCNUsrZXpPa1kz?=
 =?utf-8?B?elFpVExJTXY2b2xmcm1DMHJHSGovU0Iyd0sxWithUE14cjBhalhnU1RIVTZL?=
 =?utf-8?B?Q203SlRJNWN4L1RpdTlRaCsrVndhUmVrMnBaclpYN3p1WHF0VmROeENxaVg4?=
 =?utf-8?B?VDl2ZHZQeEtJVGZIaWhKM3pLMHlmcC85a1FaRHNRRThTdjBxdm1MOC9IYys3?=
 =?utf-8?B?dmV1R0RvTUJ4akk3cTBnV0JRSU9YNTFGY1dNc3R0RW90bmM4K1Q0NUlVZ0Ix?=
 =?utf-8?B?RVY1M0F2QmpyMjlyK2tITmo1clhPZkFqNWZrQ1JuYmlLbmhTY2NiQVFMTkpZ?=
 =?utf-8?B?R1Fhb3BoS1M5Q1c4UjZRdG9OK0VFQnd2a3B3RS8vSmVkaktXOVNRTS90NXJ5?=
 =?utf-8?B?di9waVF5ejI3MVNFU2ZnaUR3bVc4UWdQRzZrWHpFRDdoUkl2Z1BCU0ZOZzM5?=
 =?utf-8?B?TVQ1U2tHU1lCTWhFd0cyT0JaWlc0RnB2UzQzcUY5REFYU2hRdXdBNGp1OE8y?=
 =?utf-8?B?OTgrNXZCRjBORFZxdWJ0eTRyN3QvbkpCSVBPbFg0YUhiNjdWZWVqczdKbnJQ?=
 =?utf-8?B?V3VlbDUrOWJuK3A1MW1KbG93OG9WcllJRkRrSjBYK1dhRHZsSWdtUTBPZ3ZV?=
 =?utf-8?B?UEc4eUl2eE1rWjF4T2VCMlNzYUJvWlhMQWQrOXZsTndFNkdyMlJuai9aRHJC?=
 =?utf-8?B?TGg1Vkh0Y0ROVFdWemowdlZvdnJKVHBaOG1TSFVkNXhRcXprY2cvcnpRZk9W?=
 =?utf-8?B?VlBObHp0WFBPZWswdS9CYSttd0dsMjFSUm52RGZZcnEzU3V6Q3c2dzhyVDhs?=
 =?utf-8?B?Mk5zSnJZVDV3Y3B6Sm5ZZW0rbjV1enFiOXpvcklGQjBubThPeGVWbGxlQ29m?=
 =?utf-8?B?ZWNya2xaaFFOU2MxV21aMjk3KzdFN0FQQ1l3eW1VbTlPek1oekNGVi96UDUx?=
 =?utf-8?B?UCt6K1FMV3h1VHhDOEdzYUF2MHFvZkNFY2o0NDhGTnhOTVJNYmhhUE9nZ1Jy?=
 =?utf-8?B?QlRpcmpPb3ZqWmdLYnFrUWJrN0RJRUxncWthNDUvUGRBNDhwSDhzQUp2U29R?=
 =?utf-8?B?TWFjKzBUKzNXK3JZeVdabUFib2ZtbXhZZEdaMTFDWkdJQ3Ezb0lyTFpKUGpk?=
 =?utf-8?Q?GgL3mZ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FACCC811902C6A4CBE0D2ADF0B7A25C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7468
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16ff5b3d-2a59-4fb5-e6f9-08de32776588
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|1800799024|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGhPN3phWk5za0wvOU1xeWxjcHZhcFkvSUZnazdKUVA1RUFUcDNMMGUrTUxz?=
 =?utf-8?B?Ylo3Q0R5UGYvbERkUEc3N0xoNW9jU0dpSDZJcGJFdEJveWEvOU5DRXNxY21a?=
 =?utf-8?B?Sk00UVJVdUQ3QTVFeWFZUlNuK1ZIUURTdEJ0NFcrbnE5YVdPRlZ2cmZZYUxP?=
 =?utf-8?B?SEpaR1RDcmxneVFYc3d1NFFYWk5XOU91a0pXdS9IcWNyQVNJbVNNaTkxZm9o?=
 =?utf-8?B?RGQyOUc2dzdDOHgrUHMrb0kvTlNjanM3Y1oweVppR3Y2WE1YakN6c2g4VWJ4?=
 =?utf-8?B?czVDOElpZUpNQThqU0ZBOWtUOHFJYUhZcUNJckVXVkRSaFJDNGZTT2c3VkFv?=
 =?utf-8?B?bVdGYzQxTUNuQjJ2Y1lncUw5aWFtVnVvVmR1SmZhUFllbzJGZUw5WUlDUlpU?=
 =?utf-8?B?dHJjYzJxNlB5dVU3c21ldG01bGlOd09NdWExcWZLUmZYZ0lOcG5pdnk2Vnho?=
 =?utf-8?B?TXdCQzNZamxOZjV2T3ZMRndMRlRUaEV3MkkwT3p3MytKdXFnUWxLb1VVWWtP?=
 =?utf-8?B?OUVxMmFsWU9ieTA3VzRxNlB5cmg1ZGdEZE5OV3Bidll6SUd0S3lGMVFJbWRL?=
 =?utf-8?B?dUNrNDJUdG0xYXM3MzZlMjdHcG9OVkdCVDFnTXFlNEdBMHpsR01KVzE4Nkli?=
 =?utf-8?B?YldmWnlEWHhSZjBhWjRBUGRjRW5tVUhTY0t6SmM0elV4TUVac05tbk11bW9w?=
 =?utf-8?B?a2cyenl5b2g4bXRyRmFiUVk1Y3lNVDVTbGFTMEZMUThNL21pdGdMZzJVMXdr?=
 =?utf-8?B?cUErcEdLQXZsZkpqRi9SMGRTNEdvekZzOUIyc2NsR0prRktnT3JMbmlnTEoy?=
 =?utf-8?B?dkd1R3J6RnFtZ1V2LytUYUcycDEzMVl1UFFSK2xmZ040MTZCTVRiOXlFWHp5?=
 =?utf-8?B?cWU2MTQxQWdrRGlxSEF6NWNLZDZ1SHZ4YTl4YmlrWWg5UmllWGJEaUlWd29y?=
 =?utf-8?B?TGZmNzhYc3U4NFJPTGI0RkYybUcwV04xZzQ0SWhUd1d4QWN0OTlsR3pzQnFw?=
 =?utf-8?B?QzFwRXFva2t5K1dhM0RJZ3FES29qZUZ6R2dodDFHSFNHK2N1M3l3TG45dG8z?=
 =?utf-8?B?cWlQdEJyUVBCdjB4czlGYTJTem1XNDdSS1VXRXdyUEdYTkpGV2svMVNvVTV5?=
 =?utf-8?B?T0Y1STVaMm5rT0ZyMXdGUTJBVFRPVldnY1Q4QjQ4QUlVNFp0ZHB0d1V3bTZN?=
 =?utf-8?B?MU1RdFRidkwvUXI3QzNGT1JLbUNXOHBBaExDdnRQQXUxNTNyTUV4c0VXR29s?=
 =?utf-8?B?eEdtQUR1NFJic2Z4S2Z5d3U3MUhwN2xKdStTd3lFVmU3cnpsVjQvcm14THJC?=
 =?utf-8?B?OURrWHNTZkhJdm0vSlJQMHpQNnF6elJSZ2g4M3VERHB0Z3l3UmNUOWk1SEZ0?=
 =?utf-8?B?dlhnOG9qaE5ZMGp6OERXemVmeWVzdjVXdDhJaXNUNjJnMkUyM09hUW15R05a?=
 =?utf-8?B?MUxLNEtudWR5REJuMGNlVDQ2Rml6UExiZUt4U25id25JR3Y1TGFqTk5yMEpq?=
 =?utf-8?B?aVp6V1g3cnNJRE1yMjZqR3BLTTN4Qjc1cGVjY1NhZXg4WmMxdkg2ODJDVHZY?=
 =?utf-8?B?bzlPejR0WjUwWkhaWnFiYlh4LzJkcHZoTHhOSERLeHFycDhqUlpzR3NyYlpN?=
 =?utf-8?B?cmF4Vm5KcVJVUFlURzJBZTZEOHFFYUsxTTRNcUlnck50RHNkVWZDdituazFW?=
 =?utf-8?B?WmpoTHl1dXVQaVEzVi9QYTVpMEZKVjVHeEEydDNSS0ptUWxnRnBPZkVneXg5?=
 =?utf-8?B?UGVWV0VVRy95MndwTjhZRUFva3F2Wm92VHNRTWZGSCtaWDgvMXZxcVl4cDgy?=
 =?utf-8?B?Q2VZOXhsY2pQQUpDTlB0MnUrLytBajhhaWxHTFp0a3R3M1NaWkkxYk5wekk2?=
 =?utf-8?B?OUk1WXM0ZzFHbGI1UG9kMUJPYzQzb0xFWHc4N0M0WWZ0MFV4bzRaWDdzSXJJ?=
 =?utf-8?B?emNWSUJuWFVzaG9qeTQ4VkhSeVhOOWVqRytwYWxLM2lrN2V3RXVjNnlEZGFo?=
 =?utf-8?B?d04vUTVFczFONk9uRmJSdEdObldHOG05VU9nYmd2NFlrZHNoSDFpVE5CVXBM?=
 =?utf-8?B?NDhEa2VPV3ROdFpRYlBlb1c0TkJidFc2aDdCTVk4N1hNS0RaZ2dpTXZLaFkr?=
 =?utf-8?Q?Ug64=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(1800799024)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:23:36.5596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333a830e-a9ea-4c27-cbbe-08de32778c1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9083

SGkgSmVucywNCg0KPiBPbiAzIERlYyAyMDI1LCBhdCAxNDo1NSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCA0OjUz4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gU2hhcmUgdGhlIFNNQ0ND
IHBsdW1iaW5nIHVzZWQgYnkgU0VORF9ESVJFQ1QgYW5kIFJVTiB2aWEgYSBjb21tb24NCj4+IGZm
YV9maW5pc2hfZGlyZWN0X3JlcV9ydW4oKSBoZWxwZXIgc28gY2Fub25pY2FsIHN1Y2Nlc3MgYW5k
IGVycm9yIGNhc2VzDQo+PiBhcmUgaGFuZGxlZCBpbiBvbmUgcGxhY2UuDQo+PiANCj4+IFRoZSBk
aXNwYXRjaGVyIG5vdyByb3V0ZXMgRkZBX1JVTiB0aHJvdWdoIGZmYV9oYW5kbGVfcnVuKCksIGFu
ZCBkaXJlY3QNCj4+IHJlcXVlc3RzIGJhaWwgb3V0IGVhcmx5IGlmIGEgZ3Vlc3QgdGFyZ2V0cyBp
dHNlbGYgb3IgYSBub24tc2VjdXJlDQo+PiBlbmRwb2ludC4gVGhpcyBzaW1wbGlmaWVzIHRoZSBk
aXJlY3QgcGF0aCBhbmQgcHJlcGFyZXMgdGhlIG1lZGlhdG9yIGZvcg0KPj4gdGhlIHdpZGVyIHYx
LjIgcmVnaXN0ZXIgQUJJLg0KPiANCj4gRnJvbSB0aGUgYWJvdmUsIGl0IHNvdW5kcyBsaWtlIEZG
QV9SVU4gd2FzIGFscmVhZHkgc3VwcG9ydGVkLCBidXQgSQ0KPiBkb24ndCBzZWUgaG93Lg0KDQpZ
ZXMgSXQgc2VlbXMgaSBmb3Jnb3QgdG8gcmV3b3JrIHRoZSBjb21taXQgbWVzc2FnZSB3aGVuIGkg
cmV3b3JrDQp0aGUgc3BsaXQgaW4gbXkgc2VyaWUuDQoNCkkgd2lsbCB1cGRhdGUgdGhlIGNvbW1p
dCBtZXNzYWdlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
QmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB4
ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jICAgICAgICAgfCAgIDMgKw0KPj4geGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfbXNnLmMgICAgIHwgMTExICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0K
Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIHwgICAxICsNCj4+IDMgZmlsZXMgY2hh
bmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4g
aW5kZXggNzM5MmJiNmMzZGI5Li45MmNiNmFkN2VjOTcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+IA0KPiBG
RkFfUlVOIHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIGxpc3Qgb2YgdW5zdXBwb3J0ZWQgRkYt
QSBpbnRlcmZhY2VzDQo+IGNsb3NlIHRvIHRoZSB0b3Agb2YgdGhpcyBmaWxlLg0KDQpJbiBmYWN0
IGkgZG8gdGhhdCBpbiB0aGUgbGFzdCBwYXRjaCBvZiB0aGUgc2VyaWUgd2l0aCBhZGRpbmcgc3Vw
cG9ydCBmb3IgRkZBX1JVTg0KaW4gZmZhX2ZlYXR1cmVzIGJ1dCB0aGlzIGRvZXMgbm90IHJlYWxs
eSBtYWtlIHNlbnNlIGFzIHRoaXMgaXMgbm90IGJvdW5kZWQgdG8gMS4yLg0KDQpJIHdpbGwgbW92
ZSB0aG9zZSBmcm9tIHBhdGNoIDEwIGludG8gdGhpcyBvbmUgaW5zdGVhZCBpbiBuZXh0IHZlcnNp
b24uDQoNCj4gDQo+IFRoZSByZXN0IGxvb2tzIGdvb2QuDQo+IA0KDQpUaGFua3MNCkNoZWVycw0K
QmVydHJhbmQNCg0KDQo=

