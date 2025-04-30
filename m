Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A47AA4AFF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 14:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973573.1361668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA6T9-00053V-Fs; Wed, 30 Apr 2025 12:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973573.1361668; Wed, 30 Apr 2025 12:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA6T9-00050t-D2; Wed, 30 Apr 2025 12:23:19 +0000
Received: by outflank-mailman (input) for mailman id 973573;
 Wed, 30 Apr 2025 12:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uA6T7-00050n-KF
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 12:23:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2613::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e315b120-25bd-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 14:23:14 +0200 (CEST)
Received: from PR3P193CA0032.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::7) by
 DU2PR08MB9963.eurprd08.prod.outlook.com (2603:10a6:10:495::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Wed, 30 Apr 2025 12:23:10 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:51:cafe::24) by PR3P193CA0032.outlook.office365.com
 (2603:10a6:102:51::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 12:23:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.2 via
 Frontend Transport; Wed, 30 Apr 2025 12:23:10 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PA6PR08MB10738.eurprd08.prod.outlook.com (2603:10a6:102:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 12:22:37 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:22:37 +0000
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
X-Inumbo-ID: e315b120-25bd-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tIJAehQX3Fw1F1zCX6oNRZoQIWc9/KkT5AcrvPqAay7dTDWB7tZStgiO+xH+apEgDFS82K4f2ZeKlhNWMmHVRnO0AWvJh41VcoApkEMhrEGmxBynTwk8T+GHiohPtEfCgbRJ+EDPtVBilm9hzBbiSFH2PsDdI04/mPDlNxXoys85YfylPCMUpTWdK0b9y6Ojc5HIzARbtSPoHXp9RVZSxVs3w5R4/jjyKRShvHxTbIRKQSSxwuM4K0SFNY38NWhGIqG36fJvEmRo+IJYcRGcbSH/UKaYcUAcgrBdV10+iYsWXRQ+QYjM6032Q9/VEwZJ3saTHyJYloPW8FCnXUdgPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8o9f0xo/hUkhj2cuddNrtFka2lKU2fMB/VfxM58In1c=;
 b=D9ZbDvSoQuPx65h3KObFoH2cx7zdLznvIWk0YFMss0w+0u32AzZzkbCPUOVEScLQMjdU2h6yNqL5ef1nS2o71BOiPRx5a3wZO1y73G8mdd5r6KexILZFhnBEs1SMBFiCAgsr82wJAeDUp9E1+hjaiihHjmch3AopVEXqA/bY90GOR+YkZQ3GbzB5ESjH3BobXpEdzDcAaRVM7TaVMLW6MntlGE4OZxXSufDWkLyocHghhFGuTdKNFlAHYu6DQ4966JJa5+qw3oKzaX5hUhmBHy2rmka/NCREOslcZcfdVjo7FWBtpKWJY2gxB+/Xy19En/oloNDtlVS8Ia9PS/Zrsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o9f0xo/hUkhj2cuddNrtFka2lKU2fMB/VfxM58In1c=;
 b=NT8dbtUpwLRCZJfTXSSyf3SRKSkXaeQYKtmjTvnWv2kDrWHbDm+Iggus9CjqPnBQojuUF3bF4NNegYSQtR/xbrEwqBwflxTC2LEIKeNHf9mHFAPScQWLDX6lYQcFE98Z9jYDSG6QBrQM+P+BClz3Nk0OVIap5LR6RACOGPU9JOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jer36ERGP/Xk7hIh82iBNQbxxQXMkKDbkMqmgol2zFYJmrUlPrCuPEgEdfPJ1ZW/2s6j4DC/S9ECip+anxo9Pebcprb9AZM9WrR2OU6F//riGLFaF74Ts90veioMByQjoDEdKMwz3RznotVHq39njhYY+5yVbK/t3tN1rvWrGIiYWqHxsVpumeXI9KQ5ciGfTb3HPlmvJISS7Fcm8447Yr0dMW49DG339v1Khmf+9jyR2w/XZ377XwRq/OEe2Rju2TqN4FjiK6SkJ/eztX+9cn6ukEWDcir2ZMqtXa7S99OZJjIRVMqYXMlXhKaH1YsMRkm4116PPzKeqZ/EeOiKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8o9f0xo/hUkhj2cuddNrtFka2lKU2fMB/VfxM58In1c=;
 b=NjPNV6ajs1/VeXmgifEzR8ESJFXBe/Gu4WQeDRgbFDLTH4EFAz7Y3ZIvPMpOvmy7zrpSMIF+gD1AAKzPMD7mwKFUCp/bQBTAgo/mkomM5eycBbIca9kVHpT2WXbVkQqctwK6czxuh3XfyRsajIck9gNkIqO3BH98RGexMZnnxxD+RXVG2iVkBzFXheDlvOWnZo/GRbLR+qn5LRh5vAUWGN3gnzvb4ZVgbT06BY4AewesnuCrm8xpVSs+6wGzeMZ1aA6hBfcy8SRKVjrN7XY7D8qP1hHjhOqaUY/m5q8TTSre+aO07XPwR/ZwFyQVxzpvgpxlSKAiEl8Y4u3GVgseEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o9f0xo/hUkhj2cuddNrtFka2lKU2fMB/VfxM58In1c=;
 b=NT8dbtUpwLRCZJfTXSSyf3SRKSkXaeQYKtmjTvnWv2kDrWHbDm+Iggus9CjqPnBQojuUF3bF4NNegYSQtR/xbrEwqBwflxTC2LEIKeNHf9mHFAPScQWLDX6lYQcFE98Z9jYDSG6QBrQM+P+BClz3Nk0OVIap5LR6RACOGPU9JOY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/7] arm/mpu: Provide and populate MPU C data
 structures
Thread-Topic: [PATCH v4 3/7] arm/mpu: Provide and populate MPU C data
 structures
Thread-Index: AQHbuRprYh16Ok81YUq8WQ3ZmeL+z7O8CyoAgAAXmgA=
Date: Wed, 30 Apr 2025 12:22:37 +0000
Message-ID: <CE38FEAB-180D-478D-99E5-855CEEB870E9@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-4-luca.fancellu@arm.com>
 <7fa8309f-0f5b-4842-bb0a-8c6e1fe5c11f@amd.com>
In-Reply-To: <7fa8309f-0f5b-4842-bb0a-8c6e1fe5c11f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PA6PR08MB10738:EE_|AM4PEPF00025F99:EE_|DU2PR08MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4c79a5-10a9-4fdd-3106-08dd87e1c557
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NW1Ub3pBNGhaNENseDNLZ2JwaDgxclR2dFlTRlBFdFFwRDUraFpURmJrSGRC?=
 =?utf-8?B?Ritrc28xUlFIVmdTM0x2eTBORkp2NU1qQktFR3VuWmJkUTI5NHh6cDQ1cGxW?=
 =?utf-8?B?c0lYeFlYaGg3V3FlVnJQSytRQlV4Q1phWnJjZlJjc29DRG1LSW1Cakw5bURn?=
 =?utf-8?B?dUhab3FRQkZROUwxSVU5bi95bmFNd3VyaytpNTFEZjNLQXZxUFJFMXN1SGp3?=
 =?utf-8?B?aTF1QVYzSjJKaGZhSVRuRUpTSTh6TGd6SjdRRUtjQnl1MVhGUENFczNXUUh4?=
 =?utf-8?B?TjdaQ0l5MEdqSWFCSE9WcytJT1ozU0NBU1F3UmtYS3pyK3RDTmRreDRId1lW?=
 =?utf-8?B?c0NpZm8yQjhSTStSWUN6MlZIMHR2c3U4Tjhubm90cXoremdPcjZERFZXeGZz?=
 =?utf-8?B?SWRnNUNmd0sycnFncHVrTVhxK2Zkd3I5Tm5MVVZWODZzbmpBeGxFSVByUHNS?=
 =?utf-8?B?MTRiWHV0MzNJWUV5ZStDOXZmUXdGS3Q1aEI4VWRlUGhXM2RXZXJtRlFzWkZQ?=
 =?utf-8?B?VEhMOTZKQlJWUHFmc3VldjF0blduVmJEUVUwK2poTUNGUXIwdWZiUU92d09u?=
 =?utf-8?B?dXJXQkZQcjJIQzM1Nm5aZ2hhRXd2THo0N2lzQXlLeTBZdWtCeXJFWGt0M1F5?=
 =?utf-8?B?Mkh4ODd1UkthNEFOdG5hK21LMGR5K1VITWZyWnVWb2V4ckFBOEo4cjhuUnhY?=
 =?utf-8?B?OEdUUFBYMG5aNG9tZTRHdS91TGRhd3h2OVkrOXU2RjY4Z3A2cEpHQTFqd0Q0?=
 =?utf-8?B?OUgwRzVIdU9aY1Rab0JWRXdqOXNDTkRnd2ZPS0xWM0ZOSkgvUWdXVVZzR2ZR?=
 =?utf-8?B?bGVjWG5tbWNhaHZRQTJZeStYYnhkRWtkREU2WnI5OWlCL0hXWVNiZS9JZW52?=
 =?utf-8?B?UEU4N3RVR0VXd2dOTlpXUzNGc2RKaVBrNkl0SFd1U2doQXZ5S2w1OFRvYnd6?=
 =?utf-8?B?c09yVDhNeHB2dXVVMWl4eDRhTm1MWElEY29CaittTDl6akhBNXNKR0Nqbnc3?=
 =?utf-8?B?TUpGY1BjU0RWVWdSd1E4VHc1Z1h5SUN6YTk1VXU2RzJuRFJvaWtXd21kSWtk?=
 =?utf-8?B?bHdBdHdmd1dzczlQT3poN1czbkUvMS9nbFlPNGRxbTJKQVh4c3lhd2JQYlhU?=
 =?utf-8?B?b1J3SmthVzNDb0lFV2gzSzRGaEd4blB1Z3NybTd2L2hpQnlWYjVpSmF4Mmpi?=
 =?utf-8?B?LzZZSkFLakoyb0xHRjg2YTRkU3JUTi9EaE9zeEFrZWt1QXc2bjNaMUx3dlQw?=
 =?utf-8?B?RUNkSUgrSlVZcGNUSFl6T2JYK1ZWb1NnSkhiZWJyT09tblRUNHk0dndWVXZk?=
 =?utf-8?B?Zmtqa0c5d1J1NW11c3BrNnZKYmY3Z3lLZlg2UmduT2s2NW9hYkc0V0k3Qmdv?=
 =?utf-8?B?TzYvVWlXSVBtRlpoL2JwcjBzUXlvWnNXQlhsNUJrUlY5ZGRXdktRMkEreDRG?=
 =?utf-8?B?c2NxK2JEMnAxMFZ1VHRyZlNqbUJ2b25tL3R1NEJtQXZXbnNnRWZPeVBvc1lV?=
 =?utf-8?B?cXJyZ1QrQ3VZM0J5MGJqejhsUTU0UCtENi9HRTFzNzBuWEdDckFJTk5TbTRB?=
 =?utf-8?B?RjlNYW1td1BxbTJQVTNhMUF6VUYzSzJ0TDJ0ZllpOElSVHhzUUpHR0d0bDdj?=
 =?utf-8?B?QmRpdGNNdllwelN6emFvTUV6ZXFLMzljU2hGdHhNMTFDZ1IrcEZzZFVMamhB?=
 =?utf-8?B?ekFXQnJnLzczKzR2WUdXMytPV2FaSk81VWo5eWg0cEtXdVFVazVzYUQ1b1Jl?=
 =?utf-8?B?cngrdGc3S1IzMGhLYU5JaUp0VVp2dlRhN2dlTWxEYjNLVUk3MlpsKzVWVUhj?=
 =?utf-8?B?ZllibitZcDlYWmlJeE9UVXFZTEpjdVJxUHNTb2dZZjJFWUdBZGxjQU55NFAr?=
 =?utf-8?B?YWFOUGlQM21IZG5YMi90Y1lROFBBc1V4V0FyVnhkK1M3Zk81V1crVFZSd0dt?=
 =?utf-8?B?NktaOTFiaEcvcDJacmozS2R3QkdXaUJZSkdrMTVrY2I0MHlRbGNWVzY0dGhP?=
 =?utf-8?B?S2Z1cHhua2h3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1963A213CA0FE84FA11A97BB4CBC9235@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10738
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05b64012-4365-47aa-6f03-08dd87e1b1b3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWZtZjNMYmpaWTJRakhZVkE1ZmZVb1pjZDduaFlKNm1Eb0ViaHEyUEVYb2hM?=
 =?utf-8?B?TDUyQmlVZ25sa2hDNkNuZ3lhUWxkdGs1b3hZc1AzZGRYVFRTM3F4a0RINXhz?=
 =?utf-8?B?aFlMNW41UjlCUTNTeDBGRUx4UnpyNnNRZ09RNWpBOVlKVWFNSFd5TkpxSzdw?=
 =?utf-8?B?enJ2NzZqdDZXODZ6STJZMUI3dkpYM0xlQ2Zqck00QTJUMndNNitmZEhzSG9H?=
 =?utf-8?B?WERMMnU0enR6amZKQ2twODQzRGhEU3F6czIwSFpwQk95aC9EN1VHcGpKb0Jk?=
 =?utf-8?B?dnh1S0t6Mk9aUWQwRmZCME1tU1lqSnVOVVUrdVZqWmh4cjVZMDJmTFpMVzdk?=
 =?utf-8?B?VnpScHdPV0dScDF3eHRlaW12T2RpUUZ3dWNlbmRQbGlJdFFSQXlHYlFBMytR?=
 =?utf-8?B?TVpPL1BCSzJDT3dmM09LSkQ0dUFKZDROcmZvckM3ZkpPa00yVlIzOWt1Wjc4?=
 =?utf-8?B?cWNJSnU4UVdBZXl0d0xWWnBENVNUOGhFLy8zRE4zOFFuRWRCZlJkclRVNGJs?=
 =?utf-8?B?Tis5R1ZZeVoxbzBhZG5ac01YSTkxTjY5ZjJreHQzSFF5TGZkRExQZFE1SHNs?=
 =?utf-8?B?Qkk1QW04ZkpMMHNKNkJEVGNSd1N4Z0Z0YlB5Z2Z4WENMN0I5UlBlUU03SzVx?=
 =?utf-8?B?Ymdvb1NqVTV4S1liMDl5RmhQTTlYVFRYSnN6N2ZkRDYxZDJDQ3B4MjFpenBy?=
 =?utf-8?B?SEh5SEFQODMvUnZTWkdRM1RibE5vaWRjUnh0SUpIQXQxMVZyVzE4U1RlVVo2?=
 =?utf-8?B?Z0ZsL0hMaFYrYU1wU1h2dFRjZVI0ckNEbTVacVBkNzl3SUpmbyt1UGN5UWQ1?=
 =?utf-8?B?ZG9PN094ckUyK3FEbEpVVmZKbFhjY0wzMmYvVUYrd1J2NHRaaWZSaWxhVlo1?=
 =?utf-8?B?MnhwdXB0M2lIcHRJVk5UazNYTkZ0TlBya2pBcFpJVXQ5NE4reWFhbUxiK1Ux?=
 =?utf-8?B?T3BENjdWbVNpQlczVGk1STd0L2wyOExsMXg2TklQbWFiaThWTUdFVGNBU3BD?=
 =?utf-8?B?TGtkV3hjQ1lkWXJWVUpqTzRQaEZtUlZPSTQwQ3VqVUhINjZJNVVpeG1Fb2Yv?=
 =?utf-8?B?NGhqTk1JY1VaejJjeHRybDI3UUJRbjB5QjB5SGZkVGJKN1hocWJGR0dnUXgw?=
 =?utf-8?B?bHViSk54aTE2WDd4eFE1ZndWd0FhUWU5WlJmdlo1MlpNRmxhNTdxNmF0UGVW?=
 =?utf-8?B?SFhnQzVZbVVrOVFoTnF1c2tIOXpXS1pDbVpvNmxYZ2pLK0swb3BRR3ZHOGZy?=
 =?utf-8?B?ZWNGUDJPN21QRjB0NTZ0WFBZSndObVE0RWEzeUJNclpxTmY4SFl4eTZaVHVk?=
 =?utf-8?B?YUxsL01OckVJeFZNZnVRdElOc0x0QmF0N3JKL250R1NOR25NWkFJT2dydFFZ?=
 =?utf-8?B?dG1hQjlQK1B6RHc2QW1YamZYOUd0M1RWMURFUnVoU3Q2VVRTa2pHbTdGN0ZP?=
 =?utf-8?B?NlJVaS9kcmxtL3ZNeFhvTUxmUlRaV0NRZzFxUjUyWU5TR3ptNmV0YVdOWGk0?=
 =?utf-8?B?NFVYZFBrbThYV0xQeHB1WG42amdWWUk3K0lwWTdxbm5Ic2Ewd3JxRFRXMkxZ?=
 =?utf-8?B?bzBFTkQrbnprdDAyTEdCNVpveVdtekg5bXZ4bzhQWGkvcGo0cHBqb2RHTHdT?=
 =?utf-8?B?UlRsREpJcjlpeklxRVdvcFBvRk9pdGpFbXRaNEdQZkZwQnptaHpMdHIxUU15?=
 =?utf-8?B?Sk4rTHc2Wk9HYThnQlBhTmp5WTZuUUROdkZHSEVvMVVjNExoTW9ZVmRFTS9s?=
 =?utf-8?B?N2M4Zis5bDcyNFo1b2RmTlZFMlBGSnpIN0d6TGxyUEVjK01XK1VVNTJiMnFV?=
 =?utf-8?B?MDI2TDBWM0pIOUJqdnZhaEdBbGhIS2NhMjB0akM2NmhuVVppVERFT3VOYXpR?=
 =?utf-8?B?Ni9pOHprSG0rVTkrRzd4VmdINDIrK1pwUmg0VVhmQ1N1OFFWaWVzbEJ3U0Ft?=
 =?utf-8?B?UGh2N2hVclF2dTdndDFKNTVnZzUySWFVSHF0WUZ5Mi8xb2l3Z0xOMkkrcnlR?=
 =?utf-8?B?THBOS2NwZ3RnczdKZ3RKVW9nMFZ1eVUwUGgrVFU5SVRYN2hGZnRTK240WEFT?=
 =?utf-8?Q?IeYlCE?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:23:10.3782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4c79a5-10a9-4fdd-3106-08dd87e1c557
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9963

SGkgTWljaGFsLA0KDQo+IE9uIDMwIEFwciAyMDI1LCBhdCAxMTo1NywgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAyOS8wNC8yMDI1
IDE3OjIwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gUHJvdmlkZSBzb21lIGRhdGEgc3RydWN0
dXJlIGluIHRoZSBDIHdvcmxkIHRvIHRyYWNrIHRoZSBNUFUNCj4+IHN0YXR1cywgdGhlc2Ugc3Ry
dWN0dXJlcyB3aWxsIGJlIGZpbGxlZCBhdCBib290IGJ5IHRoZSBhc3NlbWJseQ0KPj4gZWFybHkg
Y29kZSB3aXRoIHRoZSBib290IE1QVSByZWdpb25zIGFuZCBhZnRlcndhcmRzIHRoZXkgd2lsbCBi
ZQ0KPj4gdXNlZCBhdCBydW50aW1lLg0KPj4gDQo+PiBQcm92aWRlIG1ldGhvZHMgdG8gdXBkYXRl
IGEgYml0bWFwIGNyZWF0ZWQgd2l0aCBERUNMQVJFX0JJVE1BUA0KPj4gZnJvbSB0aGUgYXNzZW1i
bHkgY29kZSBmb3IgYm90aCBBcm0zMiBhbmQgQXJtNjQuDQo+PiANCj4+IE1vZGlmeSBBcm02NCBh
c3NlbWJseSBib290IGNvZGUgdG8gcmVzZXQgYW55IHVudXNlZCBNUFUgcmVnaW9uLA0KPj4gaW5p
dGlhbGlzZSAnbWF4X3hlbl9tcHVtYXAnIHdpdGggdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgTVBV
DQo+IElNTyB0aGlzIGlzIG5vdCBhIGdvb2QgbmFtZSBiZWNhdXNlIHRoZXJlJ3Mgbm90aGluZyB0
aGVyZSBzdWdnZXN0aW5nIHRoYXQgdGhpcw0KPiB2YXJpYWJsZSBzdG9yZXMgdGhlIG51bWJlci4g
TWF5YmUgbWF4X21wdV9yZWdpb25zIG9yIG1heF94ZW5fbXB1bWFwX3JlZ2lvbnMuDQoNCm9rIEkg
d2lsbCBjaGFuZ2UgaXQNCg0KPj4gDQo+PiAgICAgLyogeDA6IHJlZ2lvbiBzZWwgKi8NCj4+ICAg
ICBtb3YgICB4MCwgeHpyDQo+PiAgICAgLyogWGVuIHRleHQgc2VjdGlvbi4gKi8NCj4+IEBAIC03
NCw2ICs3NywxNiBAQCBGVU5DKGVuYWJsZV9ib290X2NwdV9tbSkNCj4+ICAgICBwcmVwYXJlX3hl
bl9yZWdpb24geDAsIHgxLCB4MiwgeDMsIHg0LCB4NSwgYXR0cl9wcmJhcj1SRUdJT05fREVWSUNF
X1BSQkFSLCBhdHRyX3BybGFyPVJFR0lPTl9ERVZJQ0VfUFJMQVINCj4+ICNlbmRpZg0KPj4gDQo+
PiAremVyb19tcHU6DQo+PiArICAgIC8qIFJlc2V0IHJlbWFpbmluZyBNUFUgcmVnaW9ucyAqLw0K
Pj4gKyAgICBjbXAgICB4MCwgeDUNCj4+ICsgICAgYmVxICAgb3V0X3plcm9fbXB1DQo+PiArICAg
IG1vdiAgIHgxLCAjMA0KPj4gKyAgICBtb3YgICB4MiwgIzENCj4gU2hvdWxkbid0IHdlIG1hcmsg
dGhlIHJlZ2lvbiBhcyBlbXRweSAoYmFzZSA9PSBsaW1pdCkgd2hlbiBkb2luZyByZWdpb24gY2xl
YXI/DQoNClNvIHRoZSBtYWNybyB0YWtlcyBhbiBleGNsdXNpdmUgcmFuZ2UsIGluc2lkZSBpdCB3
aWxsIGNoYW5nZSB0byBpbmNsdXNpdmUgYnkgZG9pbmcgbGltaXQtMSwNCnNvIHRoZSByZWdpb24g
d2lsbCBiZSBlbXB0eS4NCg0KPiANCj4gDQo+PiBAQCAtMCwwICsxLDY3IEBADQo+PiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4gKw0KPj4gKy8qDQo+PiAr
ICogU2V0cyBhIGJpdCBpbiBhIGJpdG1hcCBkZWNsYXJlZCBieSBERUNMQVJFX0JJVE1BUCwgc3lt
Ym9sIG5hbWUgcGFzc2VkIHRocm91Z2gNCj4+ICsgKiBiaXRtYXBfc3ltYm9sLg0KPj4gKyAqDQo+
PiArICogYml0bWFwX3NldF9iaXQ6ICAgICAgc3ltYm9sIG9mIHRoZSBiaXRtYXAgZGVjbGFyZWQg
YnkgREVDTEFSRV9CSVRNQVANCj4+ICsgKiBiaXQ6ICAgICAgICAgICAgICAgICBiaXQgbnVtYmVy
IHRvIGJlIHNldCBpbiB0aGUgYml0bWFwDQo+PiArICogdG1wMS10bXA0OiAgICAgICAgICAgdGVt
cG9yYXJ5IHJlZ2lzdGVycyB1c2VkIGZvciB0aGUgY29tcHV0YXRpb24NCj4+ICsgKg0KPj4gKyAq
IFByZXNlcnZlcyBiaXQuDQo+IEhlcmUgeW91IHNheSBpdCBpcyBwcmVzZXJ2ZWQsIHlldC4uLg0K
PiANCj4+ICsgKiBPdXRwdXQ6DQo+PiArICogIHRtcDE6IEFkZHJlc3Mgb2YgdGhlIHdvcmQgY29u
dGFpbmluZyB0aGUgY2hhbmdlZCBiaXQuDQo+PiArICogQ2xvYmJlcnM6IGJpdCwgdG1wMSwgdG1w
MiwgdG1wMywgdG1wNC4NCj4gLi4uIGhlcmUgeW91IGxpc3QgaXMgYXMgY2xvYmJlcmVkLg0KDQpy
aWdodCwgSeKAmWxsIGZpeCB0aGF0DQoNCj4gDQo+PiArICovDQo+PiArLm1hY3JvIGJpdG1hcF9z
ZXRfYml0IGJpdG1hcF9zeW1ib2wsIGJpdCwgdG1wMSwgdG1wMiwgdG1wMywgdG1wNA0KPj4gKyAg
ICBhZHJfbCAgIFx0bXAxLCBcYml0bWFwX3N5bWJvbA0KPj4gKyAgICBtb3YgICAgIFx0bXAyLCAj
KEJZVEVTX1BFUl9MT05HIC0gMSkNCj4+ICsgICAgbXZuICAgICBcdG1wMiwgXHRtcDINCj4+ICsg
ICAgbHNyICAgICBcdG1wMywgXGJpdCwgIzMNCj4+ICsgICAgYW5kICAgICBcdG1wMiwgXHRtcDMs
IFx0bXAyDQo+PiArICAgIGFkZCAgICAgXHRtcDEsIFx0bXAxLCBcdG1wMiAgICAgICAgICAgICAg
ICAgLy8gYml0bWFwX3N5bWJvbCArIChiaXQvQklUU19QRVJfTE9ORykqQllURVNfUEVSX0xPTkcN
Cj4gV2UgZG9uJ3QgdXNlIC8vIHN0eWxlIGNvbW1lbnRzLiBQbGVhc2UgdXNlIC8qICovDQoNCnN1
cmUsIEnigJlsbCBjaGFuZ2UgaGVyZSBhbmQgaW4gdGhlIHJlc3Qgb2YgdGhlIHBhdGNoDQoNCj4+
IA0KPj4gDQo+PiAjZGVmaW5lIE1QVV9SRUdJT05fU0hJRlQgIDYNCj4+IEBAIC0xNyw2ICsyMSw3
IEBADQo+PiAjZGVmaW5lIE5VTV9NUFVfUkVHSU9OU19TSElGVCAgIDgNCj4+ICNkZWZpbmUgTlVN
X01QVV9SRUdJT05TICAgICAgICAgKF9BQygxLCBVTCkgPDwgTlVNX01QVV9SRUdJT05TX1NISUZU
KQ0KPj4gI2RlZmluZSBOVU1fTVBVX1JFR0lPTlNfTUFTSyAgICAoTlVNX01QVV9SRUdJT05TIC0g
MSkNCj4+ICsjZGVmaW5lIE1BWF9NUFVfUkVHSU9OX05SICAgICAgIDI1NQ0KPiBTaG91bGRuJ3Qg
eW91IGRlZmluZSBpdCB1c2luZyBOVU1fTVBVX1JFR0lPTlM/IEl0IHNob3VsZCBoYXZlIHRoZSBz
YW1lDQo+IGRlZmluaXRpb24gYXMgbWFzay4NCg0KTWF5YmUgSSBtaXN1bmRlcnN0b29kIHlvdXIg
Y29tbWVudCBpbiB0aGUgcHJldmlvdXMgcGF0Y2gsIG9rIEkgd2lsbCB1c2U6DQoNCiNkZWZpbmUg
TUFYX01QVV9SRUdJT05fTlIgICAgICBOVU1fTVBVX1JFR0lPTlNfTUFTSw0KDQo+PiANCj4+ICsN
Cj4+ICsubWFjcm8gc3RvcmVfcGFpciByZWcxLCByZWcyLCBkc3QNCj4+ICsgICAgICAgIHN0cCBc
cmVnMSwgXHJlZzIsIFtcZHN0XQ0KPiBXaHkgOCBpbnN0ZWFkIG9mIDQgc3BhY2VzPw0KDQpJ4oCZ
bGwgZml4IA0KDQo+PiANCj4+IC8qDQo+PiAgKiBNYWNybyB0byBwcmVwYXJlIGFuZCBzZXQgYSBF
TDIgTVBVIG1lbW9yeSByZWdpb24uDQo+PiAgKiBXZSB3aWxsIGFsc28gY3JlYXRlIGFuIGFjY29y
ZGluZyBNUFUgbWVtb3J5IHJlZ2lvbiBlbnRyeSwgd2hpY2gNCj4+ICAqIGlzIGEgc3RydWN0dXJl
IG9mIHByX3QsICBpbiB0YWJsZSBccHJtYXAuDQo+PiAgKg0KPj4gICogc2VsOiAgICAgICAgIHJl
Z2lvbiBzZWxlY3Rvcg0KPj4gLSAqIGJhc2U6ICAgICAgICByZWcgc3RvcmluZyBiYXNlIGFkZHJl
c3MNCj4+IC0gKiBsaW1pdDogICAgICAgcmVnIHN0b3JpbmcgbGltaXQgYWRkcmVzcw0KPj4gKyAq
IHRtcDE6ICAgICAgICByZWcgc3RvcmluZyBiYXNlIGFkZHJlc3MNCj4+ICsgKiB0bXAyOiAgICAg
ICAgcmVnIHN0b3JpbmcgbGltaXQgYWRkcmVzcw0KPiBJIHRoaW5rIHRoaXMgY2hhbmdlIGlzIG5v
dCBuZWVkZWQuIFRoZSBwYXJhbWV0ZXJzIHNob3VsZCBiZSBuYW1lZCBiYXNlIGFuZCBsaW1pdA0K
PiBiZWNhdXNlIHRoaXMgaXMgd2hhdCB5b3UgZXhwZWN0IGNhbGxlciB0byBwYXNzLiBJbnNpZGUg
dGhlIGZ1bmN0aW9uLCB5b3UgY2FuIGRvDQo+IHdoYXRldmVyIHlvdSB3YW50IHdpdGggdGhlc2Ug
cmVnaXN0ZXJzIGFuZCBjYWxsZXIgZG9lcyBub3QgY2FyZSBhcyBsb25nIGFzIHlvdQ0KPiBtZW50
aW9uIGlmIHRoZXkgYXJlIGNsb2JiZXJlZCBvciBub3QuIFNhbWUgaW4gQyB3b3JsZC4gWW91IGNh
biByZXVzZSB0aGUNCj4gcGFyYW1ldGVyIGZvciBhIGRpZmZlcmVudCBpbnRlcm5hbCBwdXJwb3Nl
IGluc2lkZSBhIGZ1bmN0aW9uLg0KDQpvayBJ4oCZbGwgcmV2ZXJ0IGJhY2sNCg0KPj4gDQo+PiAr
DQo+PiArICAgIC8qIExvYWQgcGFpciBpbnRvIHhlbl9tcHVtYXAgYW5kIGludmFsaWRhdGUgY2Fj
aGUgKi8NCj4+ICsgICAgbW92ICAgXHRtcDEsIFxzZWwNCj4+ICsgICAgbHNsICAgXHRtcDEsIFx0
bXAxLCAjWEVOX01QVU1BUF9FTlRSWV9TSElGVA0KPiBZb3UgY291bGQgZ2V0IHJpZCBvZiB0aGVz
ZSAyIGV4dHJhIGluc3RydWN0aW9ucyBhbmQgaW5zdGVhZCBkbzoNCj4gDQo+PiArICAgIGFkcl9s
IFx0bXAyLCB4ZW5fbXB1bWFwDQo+PiArICAgIGFkZCAgIFx0bXAyLCBcdG1wMiwgXHRtcDENCj4g
YWRkIFx0bXAyLCBcdG1wMiwgXHNlbCwgbHNsICNYRU5fTVBVTUFQX0VOVFJZX1NISUZUDQoNCnll
cCwgSeKAmWxsIHVzZSBpdA0KDQo+IHdoaWNoIGNvbWJpbmVzIGV2ZXJ5dGhpbmcgaW4gb25lIGdv
Lg0KPiANCj4+ICsgICAgc3RvcmVfcGFpciBccHJiYXIsIFxwcmxhciwgXHRtcDINCj4+ICsgICAg
aW52YWxpZGF0ZV9kY2FjaGVfb25lIFx0bXAyDQo+PiArDQo+PiArICAgIC8qIFNldC9jbGVhciB4
ZW5fbXB1bWFwX21hc2sgYml0bWFwICovDQo+PiArICAgIHRzdCAgIFxwcmxhciwgI1BSTEFSX0VM
eF9FTg0KPj4gKyAgICBibmUgICAyZg0KPj4gKyAgICAvLyBSZWdpb24gaXMgZGlzYWJsZWQsIGNs
ZWFyIHRoZSBiaXQgaW4gdGhlIGJpdG1hcA0KPiBDb21tZW50IHN0eWxlLCBoZXJlIGFuZCBlbHNl
d2hlcmUNCj4gDQo+PiArICAgIGJpdG1hcF9jbGVhcl9iaXQgeGVuX21wdW1hcF9tYXNrLCBcc2Vs
LCBcdG1wMSwgXHRtcDIsIFxwcmJhciwgXHBybGFyDQo+PiArICAgIGIgICAgIDNmDQo+PiArDQo+
PiArMjoNCj4+ICsgICAgLy8gUmVnaW9uIGlzIGVuYWJsZWQsIHNldCB0aGUgYml0IGluIHRoZSBi
aXRtYXANCj4+ICsgICAgYml0bWFwX3NldF9iaXQgeGVuX21wdW1hcF9tYXNrLCBcc2VsLCBcdG1w
MSwgXHRtcDIsIFxwcmJhciwgXHBybGFyDQo+IFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBmaXJz
dCBjbGVhciB0aGUgZW50aXJlIGJpdG1hcCBiZWZvcmUgc2V0dGluZyB1cCB0aGUNCj4gcmVnaW9u
cyAoaS5lLiBhbGwgcmVnaW9ucyBkaXNhYmxlZCkgYW5kIHRoZW4gb25seSBoYXZlIHRoZSBzZXQg
cGFydCBoZXJlPw0KDQp3ZWxsIHdlIGFyZSBnb2luZyB0byBzZXQgdXAgYWxsIHJlZ2lvbiBhbnl3
YXksIGRvaW5nIHRoYXQgaGVyZSB3aWxsIHNhdmUgc29tZSB0aW1lDQpzcGVudCBvbiBiYXJyaWVy
cyBhbmQgY2FjaGUgaW52YWxpZGF0aW9uLCBtYXliZSBub3QgbXVjaCwgYnV0IHN0aWxs4oCmDQoN
CkNoZWVycywNCkx1Y2E=

