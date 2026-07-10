Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jeYOKHfUUGrt5wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:16:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F973A1FE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=ZcS6GwkJ;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359133.1612871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9CF-00044k-1a; Fri, 10 Jul 2026 11:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359133.1612871; Fri, 10 Jul 2026 11:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9CE-000422-V5; Fri, 10 Jul 2026 11:15:06 +0000
Received: by outflank-mailman (input) for mailman id 1359133;
 Fri, 10 Jul 2026 11:15:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi9CE-00041w-4p
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:15:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi9CD-006nsZ-Hf
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:15:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50d435-bab6-0a2a0a5309dd-0a2a450983e6-10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:15:05 +0200
Received: from [52.101.72.112]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50d439-b440-0a2a45090019-346548702a61-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:15:05 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB8328.eurprd03.prod.outlook.com (2603:10a6:10:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:15:02 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 11:15:02 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRATEPBz3NUDozlP4FNiYYg0p2WRXo2ivJnmySK6+hKiJUVYZEFcqM4sCgLqPFaFMuXKvV4iHsZjUd6zpjOd3YT9V+bdjIX4+O9gJH/0gbA2QeePzd74XjIHa7d6cVPevjDbTyBlNnBSIwHV6dZU2jzTt0gGcikMzpRW9J01dpTb1nx/gnEuQCFylG8tlu/iZ8+Xmb/4xk1//POWEcdpGWO4w0rYyyJ0TijNqM7rNCRu51TaV4KQzN9ekJ/+NiIMIOG7SLmlaNzDOicyOl2YmBeEyNW5XNDvHFFaWj70ca+scJ1rw8f94ondGlDqT6O2eIF7tY3rHpuVx1vxWANEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45ratonVk2tVXCIJ3ujuHUvmUB/gpD29pdHydCdOuQc=;
 b=QwASoHnvLik9sdikpdX8K0Q2HDnBfXJGrNq8lXH4yDRgDqC/rQ1ZVKFjMI5iV1dgJj93fwn3CKRge/NdlnvlagGFdqYPmItQNfX2oMLH75GTdZD5lBo0Wc/2073Y6u99ozNvVkDT1enHuZHcBV/tzT4nCb8Bm2Cqlw/8tBhsnrL5av471dIfXpinFd1VI8IwdAaCm+xsxUPR+MAUlDXCFsdsSRKK2sLorNU684LAZO8d954G5nX9gfjSIth7fzmZhtcU7UPAQWNQ8iefQLsc5JcPomXwP1Kng9ehsVVsJYKlWkh+cZ/DjlAUxn7ia/W/cCpJ19LmnvOfHnHvdvEsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45ratonVk2tVXCIJ3ujuHUvmUB/gpD29pdHydCdOuQc=;
 b=ZcS6GwkJFQZUQWxB33xIQXDXXde1mLrKz6xyzs502bgwFXM8d4FZrPQk1xvVazOzfYhDcIQAMStNb8/Ab3lKAWLHVHK4MobwY9F75JejZ57ZEMkv1l1NhreEk+qokxEeOvxwLrmxETx37SASXAcQVd8zvpNvwki5ILO+ncdQqT/mfzIQ69t6hnCvV4wc7VS8RZTA0VPlMx9RaUwCHX9LJCX+I7jr85ym5MIJ5U5cla3jQ6r8/dl8ntGbmk+JThMkYZ/c4I+gfv8ispbnb6aWVNzrIh02rg4j0JWzYjj3nU7qAC/vXEAyRHZe1UUh7dXeLYGlpziiar/uBvefF/SPHg==
Date: Fri, 10 Jul 2026 14:14:58 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
Message-ID: <5gpmoe7cng53rxtxmldvjwe3dnbenoji6anyqy4uxado354hfp@tkdo7pmufaor>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3794f3f4-e555-40cc-1f78-08dede747cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ekohvUJymxbQMikARcy5lfd3w6J5duBLcJZTe8TlVlN0jfnC5BoZGcYHp6jyxuu6QLPfP91TuMpzhVL1RDy0LAEB7H4InxqROqf6IrMojen2rVqZiR3flRo+9GN47SewLN7Tzcag9/R1Bh5PARP3436i4Or6sJkThOxq1zx/U2NLQII0bFmLoCXSXHx0urwnO5Ed61ipht3150P7qiEv8+bGHMyxclqtXbxk7pwUZHYwf+9aacGZbp682nBHqxTYEAo7d39ZXikBlO5AO18X6fhh1k6DTmhuheZQQ/hX4voh909wgf5BhVVo/9ODwk9tBYbvbvaOJQJLk6VXuSOgzV6xkk5pypf+Z9p55Tohc87lpeSg6Jj8VUEBjhZx25/8+fYY7WiW+fyOwbnCZv5WYItNtYWG/FTvdGjraHHeNVbhDw2XsnfzXDUYIE/HcP8w7gF7CKkWjXL2QMC9FBVEOujq6a9oFen8tLqNigx1c8gJWw3HNKlMX9F3BlbQzR1QfJRg9Nrft4Bz2K2z45Ir59GZ7zlUONRT9guzmbhsmuEpVydBBFheP0FrditIYaW+6PcF7gbSN4NEz1QIj0HO2GoOF653bJ6vlB8JyIxfX4sk5sSPKFKVBXe1l8uTxkyJNyoFCx7aMyw+If37qoLZFw+S4VpbC7tzbXmexYt+o1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1pmTDVYNGlHbTc4WEI4WlhyMFRKS3N0ai9EbWUzcHlnL2dFOXFGK3ZnQ1B5?=
 =?utf-8?B?RjRLQmhJVGYvdllHUnJZcDBYczdtQmkwK3EyaFRpM255UkdnQTNCMCtqdWht?=
 =?utf-8?B?NWltWFFIOEQ3ZnJyekxScEdRdW54U1FjRDVjZC9GdEkxSjg2STBNVDQwdDFJ?=
 =?utf-8?B?SFRaNmJxMGIrZmxhaGVxVTFJdnQ0NHNqQWJjenZoTEhLeFlQc3B3cFFoM0Ez?=
 =?utf-8?B?SUE0N1ROTCtUT3ROQ0NKLzNNKzVhN1ZZaFRueHhnRVpUVG1KeUpVNGdIOWRP?=
 =?utf-8?B?UkpLY0R3am9TSzVLcm4vNFN3cXhMbTNYeVJ1ejJidk1HTGJsZXEzVmdSL0Vw?=
 =?utf-8?B?Mi9kZUcrOXA1anRmeE5OK04xNnBORmpvcURGem96c2tqQzVPSnJ2di9Pc0px?=
 =?utf-8?B?RDlvbkpGVjEyOGF4ZXFYRU1NVDNJZi9vOG1VMTc2MmtNeXJKRkJ2S2RDOWpF?=
 =?utf-8?B?V3dic3pGYklYYW9rOHQyRzNoZ0czYXVNQk03d2VEbG9id1NsQ2hrT3JJMGwy?=
 =?utf-8?B?N1BRL1dYM2ZZOHA5WjRZV3YzWFpyZndFTjhHbFM1b2JFL1hEVGk4MlNCY1ph?=
 =?utf-8?B?QXZlYU9pSWdpakVYRmVKaDRtalJnem1ySlh0NkIwY3NyMyt6OE9naXZxelpV?=
 =?utf-8?B?akpRWFhWTTZxRFkyakhEZXZsQjRiTmFPWGNHLzVYZXIwc0Z0VnZESFgwL0pn?=
 =?utf-8?B?VGcvWm9jbjNMYU4yVXpBMUtHUWg0cnEzOXY4YjZtOTY1djQ3MGcxdjdGWEpV?=
 =?utf-8?B?UXh4RHQ4S3lnWXRjYnVRaUdJU1ZaV21wakdWV2FMV2Z2V0dmRGliODkxMVZM?=
 =?utf-8?B?WlI4cURTSVd2MUttc2pVZnJZUzEwV01LQnViRFFsbkVDL2E2TFBMMmhQd3o4?=
 =?utf-8?B?dmgrdlZtVkJjdXZLajhjY2ZJYnJQOE02MFU1bWRGSFFLd0ViVzNlcXhtSm5C?=
 =?utf-8?B?b0hPcHhYeStYODFMWS9FMU04QXdqSVNTK3lTTnpEcWthSmhMTFdhQjZsTDhG?=
 =?utf-8?B?TXpZM3JtVE5WMFVEbGNVU1p5Q0tvNUx3TkxDUzNwYkFCcVhXRzNRV1VlRnZE?=
 =?utf-8?B?aGJhNkptWVh3OTBFM2J0L2tYMm9JYXJJZVVpTEJUWGptTDd2N3VydUY1UlM5?=
 =?utf-8?B?MWN2L0t2amV5NWhMWU1mYStCb0FJQnVVZW9vZFFITFVmSy9HMjUrVWU2Y1RO?=
 =?utf-8?B?dmlUVXdiWEVwWkMyYzBUVHNKaHVvSFYxNGRUcGVwYWFYazZNcTgxRk1SSkJM?=
 =?utf-8?B?WFdxRXZFY1hTMlRTRW10cEQ5MnhmRlp1ZXVwRmpnRnZzWElxeEdjdFpkRWVj?=
 =?utf-8?B?MmczcGg0VWVjdnQ0VmNwMnlJOGQvSUNPUHpTcnRQd01raGIyK0VkamJHeC9N?=
 =?utf-8?B?RElROU03MmFMYzJ6Y2RDbDhyeEpkMlArYkNqL29XaFVGMFUyaUt3anlnZFlT?=
 =?utf-8?B?M1N1VmZlSFgxL3BkMU9VTi9aalNnR1l2YUFLenhqb0ltRXpBeEF4d2xYRnc5?=
 =?utf-8?B?VHZIL0U3eWZLcHg2ZTQ4eHh0QU9qaUhuMHFPelZsdUY2bmJ4dlJvSnRyZC9P?=
 =?utf-8?B?S3k3RFpVZENIbWwwUm8vVlRyUkpUM0orc2lPVFZ2UHdWMkRSdFQvcXhmaTBF?=
 =?utf-8?B?S0JjcWFIL1E0S3NBYzJDZGVuOTJjdU5VSU05cERWT0wwa3Q3R0JQR3R4N3dk?=
 =?utf-8?B?eGhiSy9OWVJjS24rYzFXWXFnL1FpZUNvaWoyekpuY1RKdk13NUJrKzZzVXJR?=
 =?utf-8?B?VW9IS2F3amVXb0RKakJnOG1BWWtQOGM0cDZLNFQ5Rk0rbjZWNHhwT0plTnpJ?=
 =?utf-8?B?ZkJrZ1F0RHZEZTJndlR3NVIrK0E0Q2RpRG4rNWVtcm1YUXBHSmJPb2tFbUxl?=
 =?utf-8?B?ajhpdTJ4U24vY1BSS0NNQ2g1eVVLUGZaWk1acllwc04xUHZ3Ukt6Q3FZV29o?=
 =?utf-8?B?RVBVOHJkTkhXU1RXT2RsT3RGTzFNenZPTWtmY3dETEpidC9Cd0JLd1Bsd1FT?=
 =?utf-8?B?UmxOUENhZXdGL1hRdXJQNTRtakwybnpwdEdRZnNZcWRpR0pOYVZhL0ZsTVN1?=
 =?utf-8?B?WUl4OXhNVWw3NWcwOW9ZenlGK3dtRk1KQTNrL3dRQ0hhZVpUN1l1SFFxOWtm?=
 =?utf-8?B?cHVYbFRTeWVQdDYyZHNQRXc3NUM5VVhjYVcrTC9VSWN5Myt5NTNPdzFkbUJD?=
 =?utf-8?B?bG95ajVRZnZLTC9ienY3YkxhbGR3cWNBQjhMWllUdnpoNStIamI2Ly9pR1lJ?=
 =?utf-8?B?MGpOU3BxM2tYU1NLc1RPYkE2YkZ5WEFnd2NVaEhCbzV5TDI2eGJpd3JpSEMx?=
 =?utf-8?B?UldKRUVYeVpCdmphNUwySEMzS3RJWlBrTG1QVndEK2xnLysvblF5UT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3794f3f4-e555-40cc-1f78-08dede747cc0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:15:02.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFMvMrQ+33liCVAkz/8kiqDyWnrmIP8zlWHtb3ZfFFSru7+aLTC68ring7Sud+pq/e97ryfENUO7GsD4D4QXLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8328
X-purgate-ID: tlsNG-bad1c0/1783682105-56F6EA0B-9A77B350/0/0
X-purgate-type: clean
X-purgate-size: 2056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D40F973A1FE

Hi Michal,

Thank you for the review.

On Fri, Jul 10, 2026 at 12:10:50PM +0200, Orzel, Michal wrote:
> 
> 
> On 10-Jul-26 10:31, Mykola Kvach wrote:
> > With GICv3 eSPI support, nr_irqs covers the architectural INTID
> > namespace up to ESPI_MAX_INTID. That namespace is not backed by a
> > single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
> > espi_desc[], and the INTIDs in between must not be treated as
> > descriptor indices.
> > 
> > A firmware-provided interrupt in the sparse range can therefore pass
> > checks based only on nr_irqs and reach irq_to_desc().
> What are the possible consequences? You should explain it in the commit msg.
> Also, what is your criteria behind protecting irq_to_desc()? There are other
> places, where we have unprotected irq_to_desc(). Last but not least I think we
> should have an ASSERT in __irq_to_desc() to prevent the indexing failure if we
> end up there with a sparse IRQ accidentally.

I reproduced this on FVP by adding a fake DT interrupt with reserved
INTID 3000. This was deliberately malformed fault injection. The only
architecturally allocated interrupt class in the 1024-4095 gap is ePPI,
which Xen does not currently support. The resulting out-of-bounds access
to irq_desc[] may corrupt Xen memory or crash the hypervisor.

There is also a non-synthetic case with CONFIG_GICV3_ESPI=n. An
architecturally valid eSPI described in DT reaches:

    platform_get_irq() -> irq_set_type() -> irq_set_spi_type()

Previously, irq_to_desc() was called before validation, while no
espi_desc[] was compiled in. Moving the lookup after gic_is_spi() makes
Xen reject the interrupt with -EINVAL instead.

My criterion is to validate externally supplied IRQs at entry points
which can return an error. The remaining callers use fixed,
GIC-reported, or previously validated IRQs.

I will also add:

    ASSERT(irq < NR_IRQS);

in __irq_to_desc(), after the optional eSPI lookup and immediately before
indexing irq_desc[].

Best regards,
Mykola

