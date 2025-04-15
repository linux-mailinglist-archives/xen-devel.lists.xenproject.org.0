Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D5A89D33
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953760.1348189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4f88-0004ua-7F; Tue, 15 Apr 2025 12:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953760.1348189; Tue, 15 Apr 2025 12:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4f88-0004t8-3p; Tue, 15 Apr 2025 12:11:08 +0000
Received: by outflank-mailman (input) for mailman id 953760;
 Tue, 15 Apr 2025 12:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4f86-0004t2-AN
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:11:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2614::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b330ba9d-19f2-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 14:11:03 +0200 (CEST)
Received: from DUZPR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::20) by AS4PR08MB7856.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 12:11:00 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::eb) by DUZPR01CA0094.outlook.office365.com
 (2603:10a6:10:4bb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Tue,
 15 Apr 2025 12:10:54 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 12:10:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB10376.eurprd08.prod.outlook.com (2603:10a6:20b:545::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 12:10:25 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 12:10:24 +0000
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
X-Inumbo-ID: b330ba9d-19f2-11f0-9eae-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D9e2QfON9UXIX0HbYOSGa7JSN9I+OlCsTVfGp4coUvfGOxTNpmFjWOvpNqa2V2SXNv1MgJ0fDTkpdFPzeLKPW2Eh6Fb031kHkSQtlikDDCFxDGVZAgbXyDVRPxPrcBmQf5AlfUzCSbzEmetDEr/KSR2xxaFdde++bWBuwPtQUdHxne1uRt3nizYQJH2BCXbWgDJt5+5TmmQ2ha4qqeKRXtQG1tBqMzlFxSIL4KFFGZN5P/Sr7AXRoTJzIrxzhoT2wjj1ErFdbusbOQK0F88Z+IlwxkBxSSuYhMk+2vMFzorYKndYjvDVxLKJnfbG+qJLZ74wNAcYST21bV4Ej23k1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maXQIFrepbcnWNUy7X+0V7vl3j2FxLUceEItRnrI7XM=;
 b=V+Un2fz45151rA58QIGmId5Gu44q4yDBFBRsA60OWuM75wFje4S/fpI05A9RiADOQwhs4eDN+nHeVDRKroh7+IdyafCtu6VV7QlwHXRJ7TOuqD+EZv24Rk0m72423kXub9DZeoW5Zrjb8GaQMu6Ac10Z1wvRHeubwu0ox2+/Z3TUwzV1FLTxQl8wGeRjpiYB5mk8dMcYNlAmh+vKCBFIT1ShStKasH5ZLzWJG0F3cT+t9y//DpyzYozURxC0ndlTPl8nL6tau7CxXQ85jofnzU+XZ+w6fA57TURR5oWLeSxXdU+lraawickrplxin4fTWIXN+bJ5hmmCfxFemaORlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maXQIFrepbcnWNUy7X+0V7vl3j2FxLUceEItRnrI7XM=;
 b=cLq/cqLDafwzb8RTc0wsF8xhgMfPgWuTSxWlIt4Ul6/44cBWRph7gqrMWCStn2G9P8nbo5hVHNk6hAHbExWT/VnMNSUpCkK87yR1rR7QSm4Pk4EEmLSeVqGcsPmXevsf0FdjeWnDromLxadVh6gmapdkapfU1cKKgBYyo96rolw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjDPlLh+uT7PtY9Ux+sp1GjnpgC1+mUXl2RVQsqVvgCkOxIDqqnE26DJe21O3SalVoVSO9xtNRZLVhaawZkNakjmDzUZuZiQsnSSO2FkaHYnhbwaOPiPpq7Npa1jQt4kToUFn9jkwnL7Y6lUiKTgY56DtXJ+nAD1X8VqbDOhLjW83ju8JykXRv0nYWm4Fr+wPJBGEtCk6E8Ic3Q2vc8FsaVM0cRL18NIodC5ZnLqaJHtzSZsdOme6Dg03azQn7oomXkPVwi8i+h0j1G92qsB3kiQpjky/IFUnWkd0A5LtTvMFfutBLIvwrknwKnRhYppL7jtPGcMwJ+lbbR111P4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maXQIFrepbcnWNUy7X+0V7vl3j2FxLUceEItRnrI7XM=;
 b=lDzNhojcN/7X0pWnlM4VEiQ3I4bMM66eUng6XE1WCQL771G7Cjk7GzwxzqkWgEQ0nJJn7bb51BeuFH0icJU0rfRfkotKWeJb4shligxtEOIQqU8l+iPljsGgQAtRWZwUtr1cRstATGSE8YQL4v/tnzZLROAqXKI6yH06HzHKkUXLQZZUN9XzRV/L5u1DEujZ8U/rdZXPKFQhIEbc/ByhShozWV1i6K5ZmgL2fz6/shOPaVdrMI6YTjZv93XcrB1q4gi8gMDSOPjeyO6Mjij9URLRKtukW+KvsZrJDQP4d/PWJ7hlqaRL6sEUZs1OF5k4M8sl6b6vMnSB+bkHVioosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maXQIFrepbcnWNUy7X+0V7vl3j2FxLUceEItRnrI7XM=;
 b=cLq/cqLDafwzb8RTc0wsF8xhgMfPgWuTSxWlIt4Ul6/44cBWRph7gqrMWCStn2G9P8nbo5hVHNk6hAHbExWT/VnMNSUpCkK87yR1rR7QSm4Pk4EEmLSeVqGcsPmXevsf0FdjeWnDromLxadVh6gmapdkapfU1cKKgBYyo96rolw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Xen Armv8-R booting protocol
Thread-Topic: Xen Armv8-R booting protocol
Thread-Index: AQHbrf9e2Q3ZtL+0AUaAx8EjnSV7Wg==
Date: Tue, 15 Apr 2025 12:10:24 +0000
Message-ID: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB10376:EE_|DB3PEPF0000885F:EE_|AS4PR08MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac851e0-ec58-4d24-ed94-08dd7c169509
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?U3NpelM3UlJWcE9KaGtSL2F2MXZoMG0zYzBXSzV6eFRIdExEYkNSWFd1OFVn?=
 =?utf-8?B?V3RiMDlLU0hPWDhLODVFRkFmMWFSVDVva1VNUlB2cStrTWZaZDU3L3BXRWFq?=
 =?utf-8?B?YnR1M0crbkg4Y2kwSHoreFVDQlpWbkZVK0xGc083c1YrRGdJcXZQbXpPTlBR?=
 =?utf-8?B?QkRLbHM4SVpVVGtQeUlWWENzMHA0cjlpVlRsRmJMTXVLbEg5L3pZKzVITzY5?=
 =?utf-8?B?RHBoenQybEU4b0ZSVmlJTWYxUHpMY09YWlBVSVBvc08zdktQNGU2cjJLUDFV?=
 =?utf-8?B?SlJ2UE93WjBGWDROVktHbktsdVlkYnpwQ1cxZGUyZHVWNFdjZEdHeFk0VGs1?=
 =?utf-8?B?R1F2VGEyemVtM0FrOTVheG5PczdOamx1VktGNndXTEVTUkRyRXFjTDVzdGdN?=
 =?utf-8?B?WmdmNU55bms3RzNSdGdIRUd6OUQ1NHMxRHBHWHNiSUpVWUVIUXZEVHRsL0p5?=
 =?utf-8?B?c2I5cWV4ZXRhTHorb3NlQkZDN1M1RHFZQmJhVitFY005bFNKcGkzamJjdFpU?=
 =?utf-8?B?ZXgxTnUwdmtGVzlrcTBTUHVMWW9ZUmVMekJKQmVHL0lzRUJlTVJhZ01ZRFNN?=
 =?utf-8?B?YVRod0Q4V0c5blowYUFucnBkWktxektGVnI5NUVsNHlvWGRJdnJIRHR3aTZ4?=
 =?utf-8?B?UHdvSXFRQzgrWDBkK0ViUjgzSmk1UVFYYkl6REgxaXpUWjE3WFZxb1R3Qmo4?=
 =?utf-8?B?NWJ6KzUvemhnVFBqWUZFQzBwNktwRTRCS3ZoQUtFK1M3UVMvRWJsTk5QZGNo?=
 =?utf-8?B?NHF3UlBIaDB1QW9UQ1J4WG9qSCtWdFd3Uk91dk5hY3V1ZVlZL292dStFUFJQ?=
 =?utf-8?B?NzRjcVdvQTdYZlBvU1hMZGpHZi9wT21qWUV2bm8raW53eXplNXlmc085Ukd1?=
 =?utf-8?B?NHlsN1pxWkxENTZDZ3E2UlJ4bFZVelhONUI1QnVFdUR2VEZQTmgyS0JrRlZt?=
 =?utf-8?B?Q1d1Zkt1UDc1QWpBL0JlQnU0N0xycXhJYUZhc2c4WSs2Sm5OaWpXQW1oaTU5?=
 =?utf-8?B?UlI1Qzg4a09SSEhnZGNBR1NGYU5jRW96cnlBcWx1S3UrQUMvYUxhUUVES1Yz?=
 =?utf-8?B?cStDajB5dmFqcWRtSlFQanVKSU5NT21EWExDbmp0UzdVVDRrQi92M1dyakZu?=
 =?utf-8?B?aDNDc0FUbVA1WDVBc1BwZ2ZDbHNmb3ZHaittcGU2L1BnRWZKQWo5dDF6M0JK?=
 =?utf-8?B?NHV1UVl2bVFDczE4MnVZRFRNNDUvUEp5RWZqZXk0SlJ6a1orc1VYamx0MHFO?=
 =?utf-8?B?L0R1Zi9LVFNrOXhZZkZnUTRBZ1FMcjV6aTNYOCtDK1FiQ3J1Rmw5dEhmZExS?=
 =?utf-8?B?MEROVE5QeTZzeVlDYlFMRnQ5YW8weW5SYUNmRzE3SkJQKzZ1UWxIUHRVU2hm?=
 =?utf-8?B?Y21RR1g0RFBpUHdvQ3ZzTHJWcDhiUWU0R2FMeVo5OUwxdUNqN3FvOEpQWTVm?=
 =?utf-8?B?dWhwaDQva0w5clpHak02c1FqSUIwV2RXY3ZHdytZN0dHWU9tcWc4bnkwQXlK?=
 =?utf-8?B?ZFpDSmpFT1hoaEFzMGJkaTNhellyZHBiazY1YUROV2NLQzUrMnVXQ294TVhq?=
 =?utf-8?B?bk16bnIwK3RkNExnK3YzT0VIa2xxWVNrUStBU2kzMHBKVlN1SDJqaFJPRFIv?=
 =?utf-8?B?N0xLVng4NmI5MEIrbDhhMERYMkNvVndlMndLOWZuR3RKVDhzemhCMlQ5QmN2?=
 =?utf-8?B?VFdZbGZqanJ2YmRBMHRoQzE4czcxTVZzZHAwdEl4UGpwelVUU3BWVW82V29V?=
 =?utf-8?B?eFlUb3Z4K255RGhWRmttTlN0OHRVNFJnQW1MQnIxSmdYa0E5endpTTBtNkRy?=
 =?utf-8?B?SHl5MG5COEViUWxYaDJzUHRKbUJONXBiR0dNbU81NzR0L2JiVVlMVGNXNXBi?=
 =?utf-8?B?OHV6ZEZKMGRRbUkrc3ZiWlpVZVFBcElBQXlFMVZkYVFNd2RVRHJZL0YxMlZB?=
 =?utf-8?B?Qm1BV3lPWnIzME16WG1MRHArMEhTZzVqRWZEQ3JORHFYeXNqQTg0M052UWYw?=
 =?utf-8?Q?yeAYHPw2GLj6lZtAcSEv71NvRCQRDc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <987667777EDE8B4D9AE31F0DCA4D087A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10376
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20a68947-5c3f-4617-f937-08dd7c1680d0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1FiWTVLMTNnNXlYVGRvY0JhdWRKME9nRGJPQ2RtOGZCZFg3dU5ZS1VvT2U5?=
 =?utf-8?B?Q3AwUk1iTXJsVkZiS3FEZkFmcmEvYzQ4cncvS1ZQT1hwTStzTE85VzY4WW94?=
 =?utf-8?B?VnJvSkwvR3NRNTVXVzNYQjAyalg5aWdsRVJqQzdzbkEvNlBpR2xXSWR0S3ly?=
 =?utf-8?B?M2JnaTM2R1YraGFPK2Z4SkxCTnNURncvejBrYXNXcFhPdWlER0F6WlliQmxH?=
 =?utf-8?B?bzc4b1ZDcVNtaWd6K0ZERFI2dERZVUppOE80Qm5mM09VK0oxTHRMdFUwcEd6?=
 =?utf-8?B?ZU9pcUpmN0lhUVAyYkVUb293WFlvRm8rcDB3TFJxNVpDUDhKUlAwSS9yRWJU?=
 =?utf-8?B?SFRjNytRNkJzcFN2NXVnWW9DZjNIUmFLY3Bobk9MRTdEZERla21vUktqMi9R?=
 =?utf-8?B?clJYYjM0ZFEvTkNuZ3NRNHRSOWU2cDI2RDlycjZ1ZC81a3FtRWJlSzFhcGNu?=
 =?utf-8?B?ME1DOWplMHB4clpraGphMTcwNUE4WnU4TjgvTldLN0FQdm5hRk1IZ1hSVWhJ?=
 =?utf-8?B?WmdoL3k0Q2VOcFYvSzZ4bzRRSTNHL3BKc0YvM3Jvd09UUFU3LzI2QmhzL3Rj?=
 =?utf-8?B?SXh4R0xIQUxZWVhHL2xmMWtCSWN2QnNsQ3JGYzY1OVN3Yms1Q2ZpL2loUlBL?=
 =?utf-8?B?bWYvVXFzeHVUbGRqcHdQdmxka1VpSWZoa09QUFRCbmtYR3lCMU1UTzFicDIv?=
 =?utf-8?B?Kzk3bkR1YnhLS2k3cTFMWlh3dElnWFBzMW1MSDJmeGx4c3JkRk92WWo2Um9t?=
 =?utf-8?B?ejUxNTdEUkR3RnQzSUVzV0JrcGdxS2d6R0szMmJmRW8xRE1YeCtNWVRTREVJ?=
 =?utf-8?B?SUZZclgzZkRvWlJKOG1wL0J1c3h5NHhmRUMrOVFRU0hPYmo0bkhoMVJkeGx3?=
 =?utf-8?B?MTlEczFyTytvd0QvNnhteGcxZ3hSQjhBNllZNFdnNHZsY3VkdE9IVkpOMlVS?=
 =?utf-8?B?RHE5RzRlY2QwVFBUSzg2SlJsNmhyVkJFZlpkR3ZLLzRiNDJwWUFiaFQwMDY4?=
 =?utf-8?B?ejNpV05kUlFITVR5OWo2QWNxaEx0a0VGZ0JELzdPSDgzbUx0ODd6a01uSVpo?=
 =?utf-8?B?UDEzbU94K1lOVjNwdTRJdkZyRi9UMTBTQ2J6UER1WHRxMTlQbTBOckdOeEh2?=
 =?utf-8?B?NXRLeXdkTHhRQ2JiS1NqMUpBYmVYWVZWem5PRnpTaVF5OERRM2svK1k0ZXRr?=
 =?utf-8?B?YWpGNVpGY2wybVU2TDlRRnZpeU5vWE55MVc3d0taSnFCdDg4SSt6Z1pPMlNs?=
 =?utf-8?B?WGdHdkIyUVpWYkZXbllZYkJqMG4waFdjZytGakNleFJIZTFPS3c5dmljSnJr?=
 =?utf-8?B?MVhCQVFzeE84KzZRUkMxSlRuNFdiNmNyaFg2WDhNcGRUSUhvSnRXdkFNZFJL?=
 =?utf-8?B?ZmwrcUd0MVFLMmV0RCtJKy9PVjJ1bFU2dExTY2x1ZW8wUWJDZndEN1VRM21q?=
 =?utf-8?B?cXhtcjN5QjRqTWZmN0tHdEdaNVBmOFVvbU1NdUVVTFRMbEVZRHQvQWQ3eVZG?=
 =?utf-8?B?WW1WWjdEOWxjZWc3RnJIczQzSGk2VGRQZERSa25Ed09ld3hVdFAzclBDVENL?=
 =?utf-8?B?aFd3MjEvcEdXRVR0TmFLbk4rRTJLTHkxREt5M3VYaUN5L2JRc1pKR2FXT2N2?=
 =?utf-8?B?SHhJNndZSGFpUHdyS0dHdGp4b3lmVW9UMjdqUUV5TWdlV013RmxhTVBqR2ha?=
 =?utf-8?B?ajhJMkdQNFJ5VWROby80aVIvckhsUWZIQURvTWljUGRyQTAvOXEwNmNKdlV4?=
 =?utf-8?B?NnQzTmNzQkhCd2FNcnBYYmtpRTJqUVIycmNsaHhYQXIyVDdGSzRuTFBZb2FG?=
 =?utf-8?B?dkhrN2R1QUFMMEM4Wnc5VytRbHp5UXkzdmxzSkUyTVFReFd4TWR0dEVhQVJX?=
 =?utf-8?B?RVlBSDhsZUdsMXdQVVBiUG1IcWQ1ak5UOHJGUytUUjQ5UUcvcEgwVjRYN1FO?=
 =?utf-8?B?dFVocVpEM2Y3T3FkdFFDU01xTzBjNVFEWmxrekZUSHYxTkN0NkR2UHRUTE5m?=
 =?utf-8?B?Ums3Rld0RWhuVFJ0dGRTWmhGdFpSTVBNRm52aXY0c3dJbVcvakRIZ1hwcTJw?=
 =?utf-8?B?dXpQUSsveWlVeVdqeXJBVFo2MzBWKzArakhDZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:10:58.6965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac851e0-ec58-4d24-ed94-08dd7c169509
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7856

SGkgYWxsLA0KDQpJ4oCZdmUgc3RhcnRlZCB0aGlzIHRocmVhZCB0byB0YWxrIGFib3V0IGEgcG9z
c2libGUgWGVuIGJvb3RpbmcgcHJvdG9jb2wgd2hlbiBydW5uaW5nIG9uIEFybXY4LVIsDQpjdXJy
ZW50bHkgWGVuIHVzZXMgdGhlIExpbnV4IGJvb3QgcHJvdG9jb2wgYW5kIHNvbWUgb3RoZXIgcmVx
dWlyZW1lbnRzIHN0YXRlZCBpbiBkb2NzL21pc2MvYXJtL2Jvb3RpbmcudHh0Lg0KDQpVbmZvcnR1
bmF0ZWx5IHdlIGRvbuKAmXQgaGF2ZSBhbnl0aGluZyBhbHJlYWR5IGF2YWlsYWJsZSBmb3IgQXJt
djgtUiwgdGhlIG9ubHkgaW1wbGVtZW50YXRpb24gb2YgYSBib290bG9hZGVyDQppcyB0aGUgYm9v
dC13cmFwcGVyLWFhcmNoNjQgd2hpY2gga2VlcHMgdGhlIE1QVSBvZmYsIEkvRCBjYWNoZSBvZmYu
DQoNClNvIG15IHByb3Bvc2FsIGlzIHRvIGFkZCBhZGRpdGlvbmFsIHJlcXVpcmVtZW50cyBpbiBv
dXIgZG9jcy9taXNjL2FybS9ib290aW5nLnR4dCBmb3IgdGhlIGNhc2Ugd2hlcmUgWGVuIGlzDQpz
dGFydGVkIG9uIEFybXY4LVIsIHVuZGVyICJGaXJtd2FyZS9ib290bG9hZGVyIHJlcXVpcmVtZW50
c+KAnS4NCg0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vYm9vdGluZy50eHQgYi9kb2NzL21p
c2MvYXJtL2Jvb3RpbmcudHh0DQppbmRleCAyMWFlNzQ4MzdkY2MuLjM5ZjAyOTE1M2UzOCAxMDA2
NDQNCi0tLSBhL2RvY3MvbWlzYy9hcm0vYm9vdGluZy50eHQNCisrKyBiL2RvY3MvbWlzYy9hcm0v
Ym9vdGluZy50eHQNCkBAIC02Miw2ICs2MiwxNCBAQCBYZW4gcmVsaWVzIG9uIHNvbWUgc2V0dGlu
Z3MgdGhlIGZpcm13YXJlIGhhcyB0byBjb25maWd1cmUgaW4gRUwzIGJlZm9yZSBzdGFydGluZw0K
IA0KICogVGhlIGJpdCBTQ1JfRUwzLkhDRSAocmVzcC4gU0NSLkhDRSBmb3IgMzItYml0IEFSTSkg
bXVzdCBiZSBzZXQgdG8gMS4NCiANCitXaGVuIFhlbiBydW5zIG9uIEFybXY4LVIsIHRoZSBoaWdo
ZXN0IGV4Y2VwdGlvbiBsZXZlbCBpcyBFTDIgYW5kIHRoZSBvbmx5DQorYXZhaWxhYmxlIG1vZGUg
aXMgc2VjdXJlLCBoZW5jZSB0aGUgYWJvdmUgcmVxdWlyZW1lbnRzIG5lZWRzIHRvIGJlIGFkanVz
dGVkIHRvDQordGhpcyBjYXNlOg0KKw0KKyogWGVuIG11c3QgYmUgZW50ZXJlZCBpbiBTIEVMMiBt
b2RlLg0KKw0KKyogWGVuIG11c3QgYmUgZW50ZXJlZCB3aXRoIE1QVSBvZmYgYW5kIGRhdGEgY2Fj
aGUgZGlzYWJsZWQgKFNDVExSX0VMMi5NIGJpdCBhbmQNCisgIFNDVExSX0VMMi5DIHNldCB0byAw
KS4NCiANCiBbMV0gbGludXgvRG9jdW1lbnRhdGlvbi9hcm0vYm9vdGluZy5yc3QNCiBMYXRlc3Qg
dmVyc2lvbjogaHR0cDovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2FyY2gvYXJtL2Jvb3RpbmcucnN0DQoN
ClBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRob3VnaHRzLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

