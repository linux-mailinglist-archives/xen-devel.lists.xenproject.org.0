Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2DB0A332
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048583.1418788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjYt-0006Jc-UJ; Fri, 18 Jul 2025 11:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048583.1418788; Fri, 18 Jul 2025 11:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjYt-0006He-Qm; Fri, 18 Jul 2025 11:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1048583;
 Fri, 18 Jul 2025 11:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34x3=Z7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucjYs-0006HF-1D
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:47:34 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc65b25f-63cc-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:47:30 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9191.eurprd03.prod.outlook.com (2603:10a6:20b:5c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Fri, 18 Jul
 2025 11:47:29 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 11:47:28 +0000
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
X-Inumbo-ID: fc65b25f-63cc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok4j4xSpAksR2giFP7m+J+QdJ5nlnvfzclBFOFow30pljksJNE0jZcK+uJhC58yVLUY6YBNswfe4vb5WGrRimhnf7iRBSXAdqvr2g+oq/NQps1UoY7Nd9tlmj0O4IH2CroZT0tdkuox2NooE9gi7iUjsqwFKS9spe5wOGXSmy8kfFL0Nt1kQjUF+0KxwYDxyBPvvvzxZCyesy9toPseGSCksWVb48Axss9lnB2OBC54/ovXD08Tz76evS7DZRuE9kzDKvIBXGoFJ185Uj40Tbxi/qHULrfWmbjFinLzy2CLyKinYNBLOs7mSdFD0S74MtN6a5Z/2fZlqBDDjncZYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P/DnrReDH7XcDbVthez/Ru4DXxJDgHSgHbDKszeTNk=;
 b=XnCgURUT7zNB7i5x5VZ26ijNUHFXkpbBwBZDpxdikWJw+Qy/VelaTKHrcTBYY8nxLFgwl6JFk4Kciht0GyEeJb2Q+3iW5LLRcFbteBOzU1mE8M9ke6qpAd/vyDawwA501SQOvAelOIIHuumfrc0PjVmE3P3OUc9YLPunR22tu/cV51kCWvB1Dq16KwGddH59HaKnqw1OcIND7Ei/Y93c8N6OF+ZNOnN5uQMjAyHcUoDca61QWALhVTKVZ4DxOaKGmLb7A1vP9yPWR9IJFcuRzGoxm3kI1U/ENA6do/GCmu/oGhOR/zmtNjgOmCy3gvB0JN/3AE5c5cAvMZgc41pihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P/DnrReDH7XcDbVthez/Ru4DXxJDgHSgHbDKszeTNk=;
 b=GI2+gEJl8B0WLPuK7N0fzHlk2dG1J7bY2crW5x5le9Ya4lDkRh1kkF85EkQIgsaUfvt8dubRT3bo/pDg0JiIWROHCPSBKhs0OIEqGVXOMuWrm1LOtZJwPjcc0etSWqRWeoA5fxVLpPK5IxtoAR783yptZ6IyG5wy5YWxTUv31+cir0YKLjcOZqvMulyHdoxSue9Ip1uGo2guXKAQmXnGrzgFAl1B12X4JAv4Hihl1N1dCe4YT+Ybt2zLdgFxJGv0O2kQWPyw/3s6qB8hTDKxoNE/M8UJkqgbaXCRPJUk0nV/l/fwW1XtkkB8okCejUYpOuESVoIKZHSLE5fjtIK/Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8b600c93-b8cc-4828-9a20-90b9245da026@epam.com>
Date: Fri, 18 Jul 2025 14:47:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <20250718101149.3107110-2-grygorii_strashko@epam.com>
 <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 9410272d-6234-4a9c-a1bb-08ddc5f0df4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTdHb3lTalMxMWx1MEl5SnBXMGIvVmI1RzRMMUhMcjcvT2F2eFh5bGNpWFJv?=
 =?utf-8?B?cUE3eUx6WWJvQzkrZ2c1QW56SmJOMDFjb0dGSXY3M1hCOEtsVmFXVnRxNmZH?=
 =?utf-8?B?RnN0Z2lHQ0V6aEVGMFRnN3l5Z3VrU2R1YUlwcGJ0YlkrdXJZV3R1MDdGcW5v?=
 =?utf-8?B?dXR6MGY5S0s2RlpQcnVFNnY3QjdHdVdDTmRpQVFtNXltNGI4Mk9rNEF3d3dr?=
 =?utf-8?B?L2dzdTN1SWU5dnk2QjRSZHovU1JrVW9weTIwRHRnelZzUlUwN212VE5YYjNa?=
 =?utf-8?B?RzdCK0kwQTBPVDY0SUdTOG9LV3NHZnFlT1Q0cWZVenJ4WCtKVGc0VFR6bHIx?=
 =?utf-8?B?bmI2MmpSUmdwTnFvWmFvbk5kRDlkVHF5UzJXMWxvOUcrR0t5OWNvSjVBMHBI?=
 =?utf-8?B?RzlvM3JmT016QlkwcVZqeEZmcGlxL1doSkhhUEV4WXpiS2E2aXNjdDhVRC9U?=
 =?utf-8?B?K2ZWNmd2aXJiZHAySDBrK09lNGhCeVNraUxQckFzTmx1QlYycFBlV0ZpV1gv?=
 =?utf-8?B?Mm56ODFFZHEyNzQwQWppK3o4THE5Tmp6R3g4eUwrNU5XRzM3Y2loR0piRGpS?=
 =?utf-8?B?eng1akx6cDVJVmV4OEpXYTM0Z1BrdlRFZUdrWmxrMmJwWXQ5NnVUWTRQM3pl?=
 =?utf-8?B?N1pTTm1IL0FrU24wNDI3TUdQQ3RwakdsQ0IzSHdVVlV6RXg3eTBacHFDNTVU?=
 =?utf-8?B?NUsrVmowV0Z4QVVvVXRpbHNVa0ltZGoyejBlRGFNcnFVWEVsM2tWb0xIN1NU?=
 =?utf-8?B?enlrbGo4ekdUM2ZXS0VLYzVFNzltTTB6ZjFDN2orbUU4Z1V3YXN4S2N2ekdl?=
 =?utf-8?B?eEl0dGtEM0hYZ1BJMkxXSm82ei9VUUQvdkVjNHFMclBaYmc2bkNMK1VZV2Fj?=
 =?utf-8?B?NUFWNHh3WFl0M29QZUl1WDlaM2d2enpGazhBWWlGNG4xMzk3ZWNvUVR4OEJJ?=
 =?utf-8?B?S1FrbllsUkpxV080ODcybEVrZjJPeGdBeGpZSytidCtJdWovOFIzT3I1TkNy?=
 =?utf-8?B?eHhmTlV2UjUyMUg5Y0JFOEJJRXRLVmVxc2lMZHJSTlhHS1RJRncwNUVzLzhs?=
 =?utf-8?B?QXluT1hsbFluNS9Fb1lrVlF5NldYY1FGbnhsNHdXbTM2WXJ3K05ydUVtQ1RC?=
 =?utf-8?B?dGt5eDBRMCtyLzVtU3A0cHlOekFKK0poM2xWK1gvRDFyM1RVWEpRcnlrODRp?=
 =?utf-8?B?am9yV2tKS1plcmdKMXhoazdFYWJ4ancwTGJFaS9DemhXSkwyYWlIcndKL1Rl?=
 =?utf-8?B?aVJJR29xSWJ2bDU4dWpaQmI4ZWNiY0ZndG0yTWN3bjlMT2xLVGV3b1ZoOGQ5?=
 =?utf-8?B?QzRyMVNZSDJVTUY4MjBrNDRYOEVIMzFWdWg5TU1GUDNOczZ1UVBpNGNndzFt?=
 =?utf-8?B?Qm5qWlZFb0NvWnZQWTRvRENvbklPbG5wYVk5MXhqaUFLb284anJJQjRqaUhG?=
 =?utf-8?B?RnE5a2NnRi9DeS94QmFqWGprMFRjSi9CWVBtMmRRTXQvWUdZWWhXOGt6MEdQ?=
 =?utf-8?B?UUQxU3ErTjRpWGNvUFlXbWd3eU9PV29vSE9mYS9vak81US9tWGR0N1Jib216?=
 =?utf-8?B?OXByUk8vcFl3L3VLc2ZzTmVGREtEV3k4V2tlWXpac3FlbWpOUURnTDdSNE1H?=
 =?utf-8?B?T2dKdnZTZzNkNGg2cmM3R3BzdVNJQXVyc242NjBXR1ZDWlFKR2xJSi9XUGlZ?=
 =?utf-8?B?bnN0WDBndW9PY3BqUjkrRVJRMmRIN1R3QVpwZ3VTbStmQ2xEMS83VVU2SzM4?=
 =?utf-8?B?TklLcnFodEcxWXp2UDd5dmdZSWRtSWg3QTVBVTB5cHJqTGRTYkNIV0hoYmZa?=
 =?utf-8?B?aVUrVG42alE2QUdRNFJITDVaL0ZWb3YvL3Y5eFlRRWx1QlRCUlAwSjNpSXN2?=
 =?utf-8?B?ajF5OGRnakw3RStvUnlBUUFXWWVDdzQvWTZtVitDbkVQbFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdwcWFXNDlIT2Nob1h6cnVUZjBNdnQyRU1oV1dFa0VZdXM2cVl2YXJKV1BO?=
 =?utf-8?B?SHBzVWdtemc4NVluYS9HRlFSY0tIR3pBdkEwV2gzQnpTRlczeVFBNzM3Tisv?=
 =?utf-8?B?Mk9Gc2FIMmVibGtlaFlncWdUajJXMGk0cUU3NjFWOEx3dkhOQ2szUmQ2aUo4?=
 =?utf-8?B?L3h3aEhrNS8ya1U2VzYza0IvSHBCYzJialJIZVVyY2h3Mnlsc0U3YWI2a2g4?=
 =?utf-8?B?cmV1OG1rckdIYllaWDhwWGN6c0swMHNCbkVzU1RkLzNvNXRLZW9QRkRydG1z?=
 =?utf-8?B?d2RBOGJFZ1dkT3JQNFlVbGhUWU42N1hFQlBzV015WkhQZ3hucTdqS2QxRmhx?=
 =?utf-8?B?UXF5TnM2NkszOXRPSGdqNlF4aXBIZ1FiSkFORDJBNEw5NXVjRlc0NDQzbjFt?=
 =?utf-8?B?QVdLdC8wZzJJbkZ3K0JoTkxSeWVwNVhzMXFLTDg2SXRJNzBtYk1zU2ZVNXV0?=
 =?utf-8?B?bFFrT1pGanFMTzVLRTBpRFcwbVJmQ0ZPSVRmU1JkWXZEbW1KRkFsVU9jMjFk?=
 =?utf-8?B?K1FKOGVUaUkyTVllSWhNR2syNVh3d1QzczBxUmZZVktKbjZDY1RSZmwwak1W?=
 =?utf-8?B?dmhXU2Iyb1JTOWNidDloTCtZOUoycDUzMkppS09LY3Myd0tXQmxGM1RxenJx?=
 =?utf-8?B?YnBlblhSZHFVNzlkbzA0Y293U2IzN3k0TDUzWWZlbU40Zk5YR0k2YzhqYllm?=
 =?utf-8?B?R2ZvU1BKRFNyWFdlbmFqWEU0S1pwTStSbXhuaXhFTkl0bllrTCtXaVpudnhj?=
 =?utf-8?B?RXZ0SHRsL1l4WnBXQlpGanpzTkRrMk1zL3VoeUhmVDdzVDhzOHlINmJYVXpx?=
 =?utf-8?B?TXgza2k4NHdUbkZzbW1TVWFCNkxrc21IV0ltYVNUMHFvdVVVbFZJQ1I1b1Vm?=
 =?utf-8?B?UEhIaTBJdG9CUDU5OGJ3VGpmWnZqeTNxN2E0bTFNQkFSNFpCZzBISW9QRXBY?=
 =?utf-8?B?cVJYVG9HMnhIM2o0UGh4SFptVmtJWlQ5V1ZORWpiK01XSkx6UjArUDVGM3Iv?=
 =?utf-8?B?dTFOdDR6U1lOeFpiMWg3Z0VyRXRzK1ZwM2RiL21pbTVVNVdZdk82TTF6VmUx?=
 =?utf-8?B?RENwa1R3VWlMbWhUV1RwNGgwNWw1OU5aUkxJKzBqL0NhQlpCRld1cFVqRDVO?=
 =?utf-8?B?Vnp3VUdpVEF4QisxSnZyczFnYldaN0VpL1FLYUJwc2ZmbHhQSkRpeHdLd0RR?=
 =?utf-8?B?bkRnZEU0TEs3SERmQVZMb1FwS3pLcVNCZUhRaU1BdVM4djJ5VnQ3aGxJZUFF?=
 =?utf-8?B?eUtGb1ZMeFg1UDdRT0hSS2x2dUtUMDkwVWJETGRhbmRBVUZxMmowRGdBalJ0?=
 =?utf-8?B?MDMwZlEzVTNONDN4bTNQZ2tGZjFGMUl0aTVDd2xua0hjeXF4TGkzVU1NRWli?=
 =?utf-8?B?NXgvc2dqcFRDaExqd2dRa3BOdzUxTjdwWXNFbGp2ZWg2OExRTWhRYUJ6TWNU?=
 =?utf-8?B?YVFJQjZOa2V2KzVQbithd2xZVWp6cDVsTFVNRW8xcG93VVVVbm8xOFFLTElF?=
 =?utf-8?B?VWFDelY3dHl5OXJkWVhXYVFNL0gyS2VIaEd4TERrQkI1dG5aWDBDUDZ3cXlC?=
 =?utf-8?B?OVJYbklGNWc3VzE1UnZEZDlaeEpmTnNuZ0hJZ3NYVU1nMWM4bDhyTHFHUlcv?=
 =?utf-8?B?eTlEdWZ2cDhhR0J3N0dreHBpcElabXowUHRibjNyckExTTRVUkhUWnhINFh0?=
 =?utf-8?B?ZzkvclorUUlwMXcrZzVwTkp1amtLeG52Yy9zalhvSkNRWk8vdzMwMXJvM3Jt?=
 =?utf-8?B?cFQrWWxoZXh4RVBkU3l1MFdkMEkzR0RkeGN1K1BJSTFrMnVqRTdUL3JtSlhy?=
 =?utf-8?B?bWxUMDArOU41STZyOENNMUtPZ3grdFllSFEvUW5KUzNCT21OK2RSVnlON1dE?=
 =?utf-8?B?cFZabG5NSytQRWZwdjBVaGpoaERJZFNESEpSQkttQW5xYjYyLzVrM25uOWp0?=
 =?utf-8?B?cUUrSXh6ZkoxMS9kc1pYbHVtdGx2WGJ2WEFWUDlXalczSTJ2OGxKcSt0YWp4?=
 =?utf-8?B?bFp2aTRLWFlUNE1TSU8zQmpZL25hbkcvT1A3MitSVjE4YklVa09RdDc0V2Vx?=
 =?utf-8?B?alB4RG9YNERqNjZaUEo3NTVtcmhMS0ZxeDFza3ZOR1ZaN29Td2k3NUNRcFhW?=
 =?utf-8?B?Q1JMWGc1bThqTXk0aUJ4Z0hweWNSOHUwR1B4TmpCcnMwdlZuUVpDR0FwaTBr?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9410272d-6234-4a9c-a1bb-08ddc5f0df4a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:47:28.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Vy+r6kIdOLWQsvB7GRZhi0MbNNpXQmp+S3zEILkcjYr/ClS38NosMjlOdlEmds8Rz3rSUfL2kgTJsNvUvDQtsRw7/RNCnrX0I4mpPMjF9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9191



On 18.07.25 13:22, Jan Beulich wrote:
> On 18.07.2025 12:11, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
>> arch callbacks become unreachable, so drop them.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/arch/arm/irq.c | 29 -----------------------------
>>   1 file changed, 29 deletions(-)
> 
> Can this really be a separate change? That is, aren't we going to have transient
> Misra violations (for Arm only) between the two changes?

The violation exist even before this series, and applies to arm/ppc/riscv actually

alloc_pirq_struct - unreachable
pirq_guest_bind - unreachable
pirq_guest_unbind - unreachable
pirq_set_affinity - "reachable" at least from compiler point of view.

Would you like to have cumulative, cross-arch change to drop above arch callbacks and
squash it in previous patch?

  
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -595,35 +595,6 @@ unlock:
>>       return ret;
>>   }
>>   
>> -/*
>> - * pirq event channels. We don't use these on ARM, instead we use the
>> - * features of the GIC to inject virtualised normal interrupts.
>> - */
>> -struct pirq *alloc_pirq_struct(struct domain *d)
>> -{
>> -    return NULL;
>> -}
>> -
>> -/*
>> - * These are all unreachable given an alloc_pirq_struct
>> - * which returns NULL, all callers try to lookup struct pirq first
>> - * which will fail.
>> - */
>> -int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>> -{
>> -    BUG();
>> -}
>> -
>> -void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
>> -{
>> -    BUG();
>> -}
>> -
>> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
>> -{
>> -    BUG();
>> -}
>> -
>>   static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>>   {
>>       return (curr == IRQ_TYPE_INVALID || curr == new );
> 

-- 
Best regards,
-grygorii

