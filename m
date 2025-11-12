Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE590C51D47
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 12:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159862.1488131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8g2-0006zK-8t; Wed, 12 Nov 2025 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159862.1488131; Wed, 12 Nov 2025 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8g2-0006xA-5U; Wed, 12 Nov 2025 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1159862;
 Wed, 12 Nov 2025 11:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21S/=5U=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vJ8g0-0006x4-3r
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 11:06:12 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97b8ca4d-bfb7-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 12:06:09 +0100 (CET)
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by DBAPR08MB5863.eurprd08.prod.outlook.com
 (2603:10a6:10:1a1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 11:06:04 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::6d) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 11:06:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 11:06:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB9147.eurprd08.prod.outlook.com (2603:10a6:20b:57e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 12 Nov
 2025 11:05:29 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:05:28 +0000
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
X-Inumbo-ID: 97b8ca4d-bfb7-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FyMxQtxW9S0pe7yv4cJjaU1urvNxC6VCAsOHGgnN092k9zT7LjrC+unaKw/bMIRLd7k63+0B7FQmv/lRs7YP4T12oSd9bS5439DxdvX0j+wl4y+kmRdZ6vofzzMROgQYdTvNjr/TjhapevPRIlHf/LwhFtIv6cVvxYftEodsveY8PkNJWZXCRFMXbhmQHzvJWDE1MY4GuD6YzNdGcitz2Y6ASU0wIFHIDDlTHnlDnbWwmF4ZBNTEOhF+kTiLzHi0WiKHyQVBKxBo+p31w2ReBQ2BJz20rEmg8MHHKu1Ble3Rx/TBcFZznxw/jt4EYSicDJsxA2pDlYEPUm4/LJcsUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J00A0u+LTp5MHlX0LCiutNk3+xlaDNZBgWNsHm0GalM=;
 b=rDohA3eyvRamVwG4gcW9CCN7vR3eqPKhe6AiMJklZ0bVYcW+gIyhxUDIrGd5YIzdVowAyCjcmPsrsRsAzwaeF3e9XWhl58NgQMAQQCmehXDekQdYYTGhOV1XVKmkhSz4TlYZHOvV6GC97EbRJu7gfrk3VBZcLxn/4iRCkRzHyOx3qNl3ipyDRiD/IRN0H8rYekKQTUBOFMMb7lujJbz6u9VVGKhjJ0h1VLEy9CeO1ZYAa/HprEfL4hWVRkR0Ae96fpDcS3sPKSd5VdQnrDYGSVw9ufpqLCs9mtao8zXFpi0vbq2EV6snloUH3N4wqESbHotqnytgZq/NYiRteM0yDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J00A0u+LTp5MHlX0LCiutNk3+xlaDNZBgWNsHm0GalM=;
 b=gZA11uLH/ETkTn4uFua5KB8hzwj5avRGQlPG7zBtEvXCtQtjttUsi2esoVxtFGySnmSzTjiDJz4ZpL+rRxuPW48KTlJmTVzsp8qHpL4fsj5G3vxSY50rrPO2ku6dmd0dMODXaQ3BPhOgXMyann/O+3n7jzNU66fv/GMme3SVd/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etimu8ZOe8EH2rhmgEqKbuFhVfM5CPSI77yY1S3rJsZIJeI0xtV2S4vpGlA1+YVJhAueG8KsG8TjJMnJn8wMFcdE4XzvMY/CmmTGo5ZpZCz41wx6jOmxD5OB1BTfntcwERhnWhgOTyM3POvepFfs/WSQYtk+535LTyl6yFQ9WbMbLqyjFDVNHZs7k+wz5dSakK8KqfzIjcN5PypQFiGKy6Zh6Rn4qgeQWqDrOV45ilAqm6CRuYgilRiFDpL4cBcXkmZ3FH5MiwY5acrF5oswLeIPyEs4x7p/wGkZljqlBj/vRQMKU2mWw8yD0GWNqF6M41+/htgoqoO/VBAGx7AFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J00A0u+LTp5MHlX0LCiutNk3+xlaDNZBgWNsHm0GalM=;
 b=SBZ1UXu8El9aZ2Ec6D7RPlLiD6H5RDWaaImLvzrHR5iRiNWRgcviklZRrrSC0vOzYR5LYAl5uBg3OPI8tZX94H/6hXHvHCDF7fBlZvrRhaOgBZPNO2seUdvq9sY3pl44lHufmvv5cVju90mlyufUGVYAneTE7S+MLQOIbH3zrbxZLYYt2+gyyCDJ7GLVKxlLJn2AiTxm8nSDzxLIXvkqtn3T0dScQRxiLJy0IImzo9050iGG1VBPlCGqM+Yghs5/jvRnG9Y0DDULDaQVMPEGfm2oPQIAeN72Q4y7ydeHfTAitxsMuI7Plu8dbCN4JYGG7DjzHjSHPn161ON5o7tAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J00A0u+LTp5MHlX0LCiutNk3+xlaDNZBgWNsHm0GalM=;
 b=gZA11uLH/ETkTn4uFua5KB8hzwj5avRGQlPG7zBtEvXCtQtjttUsi2esoVxtFGySnmSzTjiDJz4ZpL+rRxuPW48KTlJmTVzsp8qHpL4fsj5G3vxSY50rrPO2ku6dmd0dMODXaQ3BPhOgXMyann/O+3n7jzNU66fv/GMme3SVd/o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Topic: [PATCH v2] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Index: AQHcU7nF1Zr/ErjEH0+gSpDahlo6L7Tu4OoA
Date: Wed, 12 Nov 2025 11:05:28 +0000
Message-ID: <91A85A43-F853-4010-B190-61A8ACC3DC60@arm.com>
References:
 <92efc0f0bb286ceeb8788a8900bac9f9f1ed9613.1762940762.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <92efc0f0bb286ceeb8788a8900bac9f9f1ed9613.1762940762.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB9147:EE_|DB5PEPF00014B97:EE_|DBAPR08MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 0905aaaa-7f8f-4d45-305f-08de21db7917
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ankzbklQWkFQbHR6NVhyUWJRN25KaUd2Mk16dExINEJFM1lyK3ZBcktkSE02?=
 =?utf-8?B?eXRFbitQdExoTEg3TlNyb2hjVUJaRWhqZThKZkljQlBJQnkvVFBaWDUzMW5N?=
 =?utf-8?B?N3NySzJuMGw5MklXdE1YMHNNSlhHTG5vSTVEUUdDQ2hlOGtjWmo3dmsrMUg3?=
 =?utf-8?B?YnVPd3lvOHlvNDVpL09oU2tHMmE5bGFtLytUVWRJTGdNYnR5Sm9GTTJzeVBh?=
 =?utf-8?B?NDQra1lrK3Z4ejBZbkxhbEYwSUpGSExSOVVXcnR0NjdHeUhUNWhpVUtjU3Zo?=
 =?utf-8?B?amcvM0VPL2NhcU50YklsRmJxT3NSS1J6S20yODFCK0pNMzR1RzlNa1UxbjhE?=
 =?utf-8?B?SGRZYVZsZ0I2RHRRUWV5dXVSTkwzWGxXWWV0N1IvNVVTRjVlK0l1Z09yb2Nv?=
 =?utf-8?B?TXFDTFcweFdvNGlRQ2tGazYxSDdYS0J3UCtMYi8xVmNDWG1Za3F5cTg1eWUy?=
 =?utf-8?B?WFRvSEJqZDkvUk80dWZNTzB1ZzJya2tWZzhwWDArdG5rd1lJdll1cTQ1aXJU?=
 =?utf-8?B?c01aOXFVWlFYSWZ5STl1eit1SjRkZzBYVklkaEJkaEszQ3FmcWQ0ak9SQ3E4?=
 =?utf-8?B?RlNXczBqRDVGUFRZaHNwWXkwRHk2TkhHWW01Q0RrdGRVWE5iaUxjQ0syZFdr?=
 =?utf-8?B?R1lWaWhsbi9lMko1ZDlVUDBMWm5kZHUrdlZFV1dEN1Rmd0lEWWNpMWwxUzBu?=
 =?utf-8?B?Unk1VVZLM0R3RE1jNUo2YWNYMmJwZ09mSGJsNnNUeVg1RUtKQ0ZZcmlWYVFW?=
 =?utf-8?B?cmxSSjArNWdLYktSQXRTZk5pUWZHTEpRVzZLVVpWYUxyYTVMSWY4eVRvL3RH?=
 =?utf-8?B?RVZHd1NMd0Rwc1RqL1R5ekh0WE1xMHNhNFRqclhQSzhiQkNWSGFZOVFVY3dp?=
 =?utf-8?B?V0pDREhTSTdCaTlKQyt0YWp2SHhkNTIzWGNkc0VodUUyUGZGMEhDUHJuL0w5?=
 =?utf-8?B?c1k3ZitBN1BFUm9zR1Y4WXIraU9WeER3MG1LUUpOMjVjbndvQ0dxUHA1RUQ0?=
 =?utf-8?B?NDNNeW05b3lrSGhEYXNBdUgzUm00WDh3bERrZU5kcUs1dWprdVg3NEJ1OXpM?=
 =?utf-8?B?MkQvOWFlbFZRdWs4Y2N5RWhMdVc2ODJBNE5obFcvMTdHdmFoUjRLYnhPZjVy?=
 =?utf-8?B?eFF2eFBNdzduTVFPUGx4R3M5ZlVrcEgzZjczajFVc1FXWEoxcWo2bHY3amhB?=
 =?utf-8?B?UEg3Rjl5UDRmQXErd2U3elF4U1VSSkF0Z0pNc1hJcUhhYm1Bek1kd0hQQnBE?=
 =?utf-8?B?MGNyZGhoOHpiTzQ2YjEwVUdJQ05LU1Nia0JPUVlFOFhYdUIzVG5sUHVzbmx2?=
 =?utf-8?B?VSs3cW9MTWVpblAvUnpvRkh2S3o2WlorSjBhK01OOVU2N3ZhcTZmRFdYWkFt?=
 =?utf-8?B?MG1DdnNWWkwzdnRRRzVPSXI3RkFNZGFhTDUyc3Q3TFI1Q0F6T1d1NUFVaVda?=
 =?utf-8?B?aVBFTktJR1g4ekpsaGErR1lXdFdwUllWb3ZSWTh6MFdvSk9SYVpxaDV5ckow?=
 =?utf-8?B?aDRVa3FEL1hoSVhaTFhQdXk0eUdnRVMyZmN4bFdWRU9HM0dFVWVNdUV6U3l4?=
 =?utf-8?B?TDVVUXZpcm0xQ1FEVTFsanFvaGw0Y2pxR1YxMVJhY2s4cnE1eFVnd2ZCMUFx?=
 =?utf-8?B?VUZkY2FZNGRHYS80SkZUL3JiZEhXL1NNalNhZWVPREZnQU55OWtVQ1NMSm9o?=
 =?utf-8?B?dy9BbFBFWHhyeVRMU3NQVEI5SHA2ODJjdGp6a3J1a3lEdzlTZ0pEV2RQSHJ0?=
 =?utf-8?B?NnZYOFhDSHNMbndLc0svWVBiNnVBVWpjTDdweFdLTExYR3o1aEVvVitVRkNl?=
 =?utf-8?B?cVVOWnpiOTY0Q3JMbmZDd3V1VmF2Ty8wWUdxV0pVd0RkSjMzbURQc1IwMkVJ?=
 =?utf-8?B?S0hyMXlONnpIRTRmT2F0Y2thRndxWlpMWW9RZlJtUE15UnhrQnU1eG84OTVC?=
 =?utf-8?B?bHBXRmR0Z1pTYmtRSVFnSWRVYzJ4bDQxdTd1WDBQUjlSNitGMEhmUHp4OHQy?=
 =?utf-8?B?MWhJOVBNc2huT3daUjJsTEtwMWRoZWxrcnR5THJvU3dQc3lFUEgzR1JOeGQ2?=
 =?utf-8?Q?xUX2fB?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2704E82CF6FB8459795B9D9688C9715@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9147
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	768408b3-5bdf-4734-486c-08de21db63c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|1800799024|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWlORk5QaVdqbWJlUTdSTEx0czFQL2NjTzR1b1E4WXZ6aVBGcVFkTVgyVjNV?=
 =?utf-8?B?ZlJkMER4UU96d3MzeGlvTll2bmsrMnpKTVRDUzJ2aXRYcnVnL2QwakI0YVRk?=
 =?utf-8?B?OUFVb0U3UmNqSjA4TFI5MXBpNlJQSGwyVVhmekkrbXNNRTVZWFBoaUtHSXI2?=
 =?utf-8?B?SUZST3NuKzdiS0IzcVlBYkFaS09DSzZuaXNMTjJNdHFUV1d0TzhVeVdTQVBM?=
 =?utf-8?B?WHA5c2hrL0ZrZ2xDY0tndEJSOWpPSDlBQXFPcTNCWGZ2d0VtazJQN01QRy8v?=
 =?utf-8?B?d1Q3eE53ZjQwWnJWbE9HWkRVZzdLVDV3V0R0Rys1SWJEZ2MzRy9pM2pHYXdm?=
 =?utf-8?B?cXNteUNtUVZQYXRxME03eUpPdTlrUUFTZDJYMW1TbDFVRGo5RVYyM1BTMVBr?=
 =?utf-8?B?bkp0N0JMZlovOUJXR1RyTHJjelZZTGFhL05TamFiMGxBOFJWVVlUWEhEZFZy?=
 =?utf-8?B?WlZzRkNSbDJhWFVwVE1iejNwd2NyOHJXNmFZMkh5enNUZWtXcXNZMjJEVS9h?=
 =?utf-8?B?aEVWWVBkQkxIQXduQXhseDN3Rm12Mm9XZG9Nek1CQ1huV0s1Ky9rM2NYdlYw?=
 =?utf-8?B?QTIwMkwvaW1nRStJUkY0M1k3QkpoQUxRSnFiMmtjaXFVQnh6RVFGTnlSa2FX?=
 =?utf-8?B?VDZaK0Ribmpnb1hsV0pmVnhZMmw1bTJsMTgvazFpTE9BMnJlL0NyUHJuUVEr?=
 =?utf-8?B?YlFxVEFzUGtVZnJYOHd1Q2ZhK1d4YUU2WnRVRkxDeVFENFBrS2tPZDJhOUpY?=
 =?utf-8?B?RUg0TWowWCtUbk9WNEtMKyt4ZG4zSGdLOWxycjRzUXgxc29zSTVGeHBZODlr?=
 =?utf-8?B?TFl6Q3ZsYWFOK1F2TFBpN3B0S2ZrajErN1JZN3B4bG5nTEdUREQwdkhNRkds?=
 =?utf-8?B?SVRXNFJySzlEdy9HQjk4TnkyZkprLys3b1hpQkoxY2VyOTlkd1RTaThsK0Fw?=
 =?utf-8?B?aXNyeDRDemlZeC80YW41SkdkTjBuUk9tWTVzenVkTVlqM1FzZjd5eThoUUdm?=
 =?utf-8?B?cVdQemxiQUdXdmFZRUJZSUk2SjdPV3g4UEQyN29RZVhjVUM1RWhUajlRVEtL?=
 =?utf-8?B?eHFMRnVIZW1md2FKTUt2dWVZVHdJVTJhT29vMHdlUUtKRjBzL1RuOG9VdjVD?=
 =?utf-8?B?R2lsZU1mODJ0cHVKVGV5amsxUXNmMFVzNi9sRnkvc1ljMFF6ZGdOV25pdnVN?=
 =?utf-8?B?SnFPdzJJZ0Fkd3N5c2RPRkgxdGV5Q2oxM0cxMkhzUzNaRUpsQ2lweExERlM4?=
 =?utf-8?B?dHg4NDZPSXRlemxIL2hXYmpCYXIzR29kSVFXMFQ5bzcwekZaRGRBR0dHRC9V?=
 =?utf-8?B?TGpyb2hFVDRJclBWWDZJdnZNaUNCbGZVQ3FrMU1vSXVDK3ExTTRiVmxHNVFN?=
 =?utf-8?B?S0w3MHpBOExpbFFWWjJobCtVMVZ3Q2NVc1hyemFRb1hxSitYWHZqcWgzZHRv?=
 =?utf-8?B?L3VyS01JY3RKN21wN01sSVVKakZhdXVocG9jSFJmYmkxNnh4SmMxV2ZueHJY?=
 =?utf-8?B?UnRrUVN0NmVkYldNMmNuVXhTbkhCeGNGM0t3dTFZenFtTUdCaWxSVVQ4RENR?=
 =?utf-8?B?ZG03d3dITEtWSTlSTVBjYUpBc25SLzNDcmtxcjNtbjNjMTlXSHZrK1FFdjJ5?=
 =?utf-8?B?djZJKys3SU9DY0hEU09lVDkraHh1eUpqbUNLMDFNZUdzcXFvR1pnMGN2YnhT?=
 =?utf-8?B?eHQwU2srVWU1SklRcW12SklDd2R0VTR5TitBemc4dGRlckpNN3Frdng1T084?=
 =?utf-8?B?aHFERGhUNFZEWVNUTE91WmpoQWpYbmU3R0hzQnk2K29JQ1IvQ0FSOElBVThG?=
 =?utf-8?B?c1U4RnVXZjY4U1hDUkdYNXY0RUZMUTVoTzRjMXUvMVFZejA5NkdER1JtamYy?=
 =?utf-8?B?MzZjRXlqaTdSOXorWloyRDNVV1Nvemw4SDVBdi9kdDFaN2lUQ2xRUkF5cDdX?=
 =?utf-8?B?QjNrMVdORG44NW5yRXEyTVF6ZDdIUUlld1RvVGZVT0VlNHljUDZOcFBUcTV3?=
 =?utf-8?B?MWJzWVU3NzBlZm1iY1huL3U2YXljek53ZG44MnlDNWFlOW1ZdklwM1AyWWhT?=
 =?utf-8?B?WHJKL0tiSGtHaEtWdnJEQ0NSbUpKSW9RbDdlbXQzbnBHOS9heGUwTUFjYnNU?=
 =?utf-8?Q?ujVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:06:04.5297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0905aaaa-7f8f-4d45-305f-08de21db7917
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5863

DQoNCj4gT24gMTIgTm92IDIwMjUsIGF0IDA5OjUwLCBEbXl0cm8gUHJva29wY2h1azEgPGRteXRy
b19wcm9rb3BjaHVrMUBlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBSZW1vdmUgdGhlIHJlZHVuZGFu
dCBsb2NhbCAnRFRCX01BR0lDJyBkZWZpbml0aW9uIGFuZCByZXBsYWNlIGl0cyB1c2FnZQ0KPiB3
aXRoIHRoZSBjYW5vbmljYWwgJ0ZEVF9NQUdJQycgZnJvbSAnbGliZmR0Jy4NCj4gDQo+IEFtZW5k
czogNjZlZGViMmUzOTcyIChhcm06IGNvcHkgRFRCIGFwcGVuZGVkIHRvIHpJbWFnZSkNCj4gU2ln
bmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNv
bT4NCj4gLS0tDQoNCllvdSBjYW4gcmV0YWluIG15IFItYnksIG5vIGNvZGUgY2hhbmdlcyB3ZXJl
IGRvbmUgaWYgSeKAmW0gbm90IHdyb25nLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

