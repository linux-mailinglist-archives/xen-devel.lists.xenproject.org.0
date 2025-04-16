Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15225A90965
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 18:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956488.1349893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u560O-000848-AI; Wed, 16 Apr 2025 16:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956488.1349893; Wed, 16 Apr 2025 16:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u560O-00081m-7H; Wed, 16 Apr 2025 16:52:56 +0000
Received: by outflank-mailman (input) for mailman id 956488;
 Wed, 16 Apr 2025 16:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hq9D=XC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u560M-00081e-Aa
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 16:52:54 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be582c3-1ae3-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 18:52:51 +0200 (CEST)
Received: from AM8P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::23)
 by AS2PR08MB9499.eurprd08.prod.outlook.com (2603:10a6:20b:60d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 16:52:48 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::dd) by AM8P190CA0018.outlook.office365.com
 (2603:10a6:20b:219::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 16 Apr 2025 16:52:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 16:52:47 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB9274.eurprd08.prod.outlook.com (2603:10a6:10:41a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Wed, 16 Apr 2025 16:52:14 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:52:14 +0000
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
X-Inumbo-ID: 3be582c3-1ae3-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rtSriI0bcc5fGzyYHQny4pN5ayNb06j9xV3fsIPe/S18oUkyMUsJqXXYnoU+xh8ErLC59WqGlxZ4DXhbS3kJhaMmrZT0qk2QdvSO8Qh0FTzt5fOEUEP3lB+y7VGo5C6C2mhyvEK3bUneu33CmIooDfZE4dUrXCmq8pAcT8VpB5nMINfAdypdfeMb70b8dhM+HDBD/i4FhxIjagUY8uHktWwtqJIRhh8ZGhVTM849GUS2grg29vcKxEu1fUciM78wkTz8yovKR56OAj+5jSScuSS/SMFcGRYtlrL6Ht275NHsrK/DbJfKjYh+qPTfJ6N+8xlaikcjSzi05Ml2HeBtZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2S3IO+vua4ihT4o2hq7kOos91bMviBIwTOa6K+qhSA=;
 b=HRYZYp762jVf2IhhACsMp3zOL5UWrF32l4iTGFIzfFpyPbKdEP3qRufH1TApcMYpmbGdmGtlZXtSqDKClPqUgUP9CGnQoyj00sRs7JuccfHoEhQEw93U/wfLLPMFxr8J5M1nzc0Bbtk+SO/gFd4+he0mbNIt4eiDVp6y4sANgRqArwCSISYg+qZjswRFfQnVBprXyE3h3YsECtW/i73knYU338f1IYOf962/1TTyc3qekITEvk5o25z+aG8tCAQAjD+m4BpcVj8Q8/Z0iFlFrvK/rREhZOyyqNwmoniFCsg3PAeQYtJRS5gc23zot1GkOhkJFTSWQ9RlGzcTh2lhpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2S3IO+vua4ihT4o2hq7kOos91bMviBIwTOa6K+qhSA=;
 b=a5ph5Tamfi0Uq8UMQSoPcV+lvmqbn6sow3bBmcLB4wjbp2AfvDTXCKstAkMrf1ok5bC1FexInFIyk2QmntBEDmucy9rRmyw3s6DPOyd+c1U8QFS1jrAw0B1nXl907i4z+5l5NsSzHB2JvtNqK/1Sf0ku0kIViJ9U5FdpGkX9WrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqWpO21Pm4dhDLwDDvGODx/3SobM2eaPOm/fKTtH0v0823nCwV3W0NROdxjU2SOQ5sXwF3kYKa7pXrk9jbY+ADgPV6R0VzIWvqZFpQxnOsVjh1NpVEuafEiamJp/yfIRThL9bcmDPb2dtJZjWxhbBHf5yRufm+srBa6+Ahc+Edo++NknZjBwa2hUW+9pZmKMdQrdyAJs5MXriobSx69wp3zmFjSQz8/uToTsHcRQsffHKD6rcY+WIFtpZoKz9COy+sRZmPjX0i3M2KOl7WVMhcnYRFxK7pXmZtWJMdZJ+3T/9qxfO0PTUmwdVY34zxxpSzZgX+jJ+fbtYxNkwTRoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2S3IO+vua4ihT4o2hq7kOos91bMviBIwTOa6K+qhSA=;
 b=lfzsrPjIubh7Z1lQrlmn09TzNhSjNqhGeZdbAYY7SFx4YYg9uSMZ7VYr8FxDBTFTVA7fI+tYW5R+FtTwbRS/a2hjIq19xKtBwiwWvgZx9erTYqkQQK/hGv1cwRxPshrDZZCIYwn14aOZIDxDiAKZYyXA46ikruhSaa/ROgoQDjCDqFc/IZSIzDblBPaaPvsFNtd4eqdjVdPoGOjnN2foQK/DzA8djA+13KWHT9L37braQWFZ7CROj0+FFeTq1GvhVL8QfP/7IPYy1sylg1l/6h+QIldhYsMVFuTsL86i9uoppp3MjWuB9O5DXS8R498NRd21xF/Iu45HBUu0Cri/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2S3IO+vua4ihT4o2hq7kOos91bMviBIwTOa6K+qhSA=;
 b=a5ph5Tamfi0Uq8UMQSoPcV+lvmqbn6sow3bBmcLB4wjbp2AfvDTXCKstAkMrf1ok5bC1FexInFIyk2QmntBEDmucy9rRmyw3s6DPOyd+c1U8QFS1jrAw0B1nXl907i4z+5l5NsSzHB2JvtNqK/1Sf0ku0kIViJ9U5FdpGkX9WrI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/7] arm/mpu: Introduce MPU memory mapping flags
Thread-Topic: [PATCH v3 5/7] arm/mpu: Introduce MPU memory mapping flags
Thread-Index: AQHbqvIRPrwVw96fI0iTW2LEmRilT7OjEIMAgAN5QoA=
Date: Wed, 16 Apr 2025 16:52:13 +0000
Message-ID: <4E014B93-3CFC-4FAD-B177-6B61A4996B7D@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-6-luca.fancellu@arm.com>
 <64f32855-e33d-4d89-9066-e63f0f1cce94@xen.org>
In-Reply-To: <64f32855-e33d-4d89-9066-e63f0f1cce94@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB9274:EE_|AMS0EPF00000198:EE_|AS2PR08MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: 9977713d-9ede-4fb0-87b0-08dd7d071e02
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bm9kZ05rMThiZFpZTElmbGdnRkpZTUpRNlNDZ0s0MFFKTkQyQ0ZSM3hiMlU2?=
 =?utf-8?B?d0dNZDAyeFQydTJHK1dZT1I3Y3hDSko5SWVjVTArby90MXdGMk1pYmdFby93?=
 =?utf-8?B?RGR0a2tobXhzc1ZvUlJlUzVORU1KYm5pL3NVdUo2anlkM3d1dWJhK2FnVHJR?=
 =?utf-8?B?R0MyNGcxVjVod2ZhRC93cEdNSXB3ME92N0J6eXRrRG5jTklTVDgyZHNEeVlI?=
 =?utf-8?B?dzZtYUdsOWFoNkZoSlZBZDlDUTdBbGI4czBwazZWUzB0Zkg5MGhvUG8zZytD?=
 =?utf-8?B?LzNRMmp3Wi8wdW1YUWZQSlUxYUR4RW1XT09wa0d3TiszbzZOc1o3bDJMVDcz?=
 =?utf-8?B?STVBUEpzZ2twZ01acENyb2F2akliVXF2Q3RVWXlMbUpGbzlJaE5Gc01aK1A0?=
 =?utf-8?B?WnM5QjRNQSsyTDVIV2xRUUdLWGRVN0xKTEV0cnpvay9zbDYvSWJvcjRENG5w?=
 =?utf-8?B?ckl0NVlSdXQwMWJqSUFjMlloYUo5ZHVSWENkbE5JN1JEeXRPSnVUdEZ6TVZY?=
 =?utf-8?B?YURiWWJpVTBjNGJOSkpjdGsyQXVWNDErQXZZU0pZRldkOHZZZDVaalRuZk8v?=
 =?utf-8?B?OFVMWEthSVo5OEpFa2ppV3JzODBTVXlrbGxYSjVLZ0cyUDNaZGs3dUt4dFM2?=
 =?utf-8?B?ZjY1aWNBNjFSZGl5SmpSMkJtc0gveHNtU0JBbURMNkdzTzhLejN5TWNyZmNI?=
 =?utf-8?B?WU9qQSt0ck4wQkFjVGNTdko3R2poMzgwQmpOdWM5bThLZXJ3b21DN0hyTTZP?=
 =?utf-8?B?VjlUaE5HU1E4MWdRYlVoY1hFTGRVbjZPbFpCNDQ0MEtmcGh3UGNRYUprckpx?=
 =?utf-8?B?RlJvcituQXF5V3g1Wmg1TVRna3pSTW1FMmduZTZUVnk1c0twM1ZENGRWWUIr?=
 =?utf-8?B?a0c1WXBCWGdFSVdXd0pkS2t2MkRKcGk2K095dDYxNExEdjhVWTYyNjdyengw?=
 =?utf-8?B?alg3ZGY5R3Z6dmsxZ3BnVTFIZFVRRGcyZDlRVTBjRm9WZFVNYk9uSEJpWjli?=
 =?utf-8?B?TUZ0L1JEYmRBZHZhblhTdThNWmdWelpHa3IwVE9aYytCR0NWaHM0TUU2WWpz?=
 =?utf-8?B?bjh4VU9QV1ZDNksySC9VNXQ3WGtvZ2R1ZzF2azFpYjR4eUNjbDFNM25XcU9C?=
 =?utf-8?B?eklFeWRZN1pNckJobXo0RW1XSDQxbzdHN3BBcDhNeE5rdURWRjhkWWZmVGYy?=
 =?utf-8?B?SzRqM2FhOW95Ym5qd21aR2xFeVBvS3RQcjRoSHphR25jVXBwSUd0dTlWVWFk?=
 =?utf-8?B?aHdOWlhXRFhtMVJacWhpSk42emF0d0lremJ0SDZMVDBQNUZQdVBXSXNQWG1a?=
 =?utf-8?B?UDBlZnlUREZ4R0k4WUdwU3B1UnZBeE1JdkxYMDlVOVM1Mk5Ec3c5QVVMUnZn?=
 =?utf-8?B?em1JM2cvVmhrbFFyVm1nTGMxV1AxM2RWVVc4MTJxWVY3UGszMGp6UUVORThD?=
 =?utf-8?B?ZEFoYkZ1ZmNRSStoWkJhN0JRYXdCYjVPQ2J5UmkxYjFBdTBDenN1UTNkRktx?=
 =?utf-8?B?eURzUk8vUzBqK1NibU5OaUsrUU02SGFaZDRFZHZrUVVzc3NIZjZpRFR2c1A3?=
 =?utf-8?B?TG01VlVxa3AwWEtDNDFlaGFtV21kWE5zUmFzM2F1NjE4bXRNNjVBZ0ZhSlVG?=
 =?utf-8?B?UDlKU3hObnJIN095RXlOT2JRNW1NMTFadkRQSk9Nejl5Q1IxdHZZU2ZDWmlV?=
 =?utf-8?B?bnJKdDZSczhYK2hCQS82enJrUG9wME9TNWxsTlRhekZseDdqbS83Y3JpYzJE?=
 =?utf-8?B?L0dhRDdNc2Fyb3VCeTFndno4cUFMT3JuRlp3eTNxOWRRWEw1YVNDTElQZ2dl?=
 =?utf-8?B?bDE3QkpzY2hiNFUwa1dkNVIzY3Z4R1BHNzIrcG1CbGNpU3FtR084dzhSYldv?=
 =?utf-8?B?UTFNdDhsaklIZWl1WmhLWjFYWXA5cm4xNWJoZFBXWWtzcm4yd0NiaGNSS1Fl?=
 =?utf-8?B?bkx2RXVMTHFjT1pPUnl1RDBDbUtoRWFVb2NIUC9KOWJQSFdvTjE4ZWc2RGNk?=
 =?utf-8?B?Q3FjUzNsUzhnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F96842ADFB749142A158ABB26B784F6E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9274
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e37a692d-b57c-4a2f-f39f-08dd7d0709cb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|1800799024|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nk51ZUw3T1hGcU0reUR5Y1BEOUFEWldDVW9LRyt1d1RQQTRrT212THFKdWUr?=
 =?utf-8?B?UVQ2QndpYS9tWk9KUnBpeXZhZUZYUE0vWnZxODlTb0N6a3FFMzhUWG9pdXZp?=
 =?utf-8?B?KzltdFdMS2k0LzZuOWZsL1VIUDJYTWNtZGVpbWJZMVAzMm14YnY1eEQ0b0R3?=
 =?utf-8?B?QTdkZ1hoQkZieTVkSEV0TnBTaVVPWkNVbUlqVFkvNGJCVFIycmc1Z1RCZk5U?=
 =?utf-8?B?WVJ0STdIbHV1bEdubmdPWmJGTmtCTEFkZXZvelgvRWRFc25URDR4Q2Q2ZFdW?=
 =?utf-8?B?T25IMVhjb2FaRGVzcm5PMWRFTnBoc3FicXF0bWZiWHI3am5nTHpFWVQwc0dR?=
 =?utf-8?B?Z3J3QTZ4ZGVMZTNtMDV0cWhaVndURENKcmE3ODNFUW9GZ05MWllJUHowUUUx?=
 =?utf-8?B?RGk0aW1iWGZZWm1HN0kzakZnM1JINVEzUmQ2Ymp4L1VZWHM5VC9NdkVCSms0?=
 =?utf-8?B?T3BVZTliSlhWUHF1Vm1ON2dZditTV1FqVW9UNm0xWkdpZHUzNGlNWmtZN3Ru?=
 =?utf-8?B?Q3BqRDdlN1RVWHYyMCtRdWNGODJUUDVLTTJ0cmdWUDZEVys0N2YrSXJIbEYx?=
 =?utf-8?B?WncrSXZtOGFTMllYRFNoWVhuZ09SNlgvcU90OHRNM3VXL0dKcllRZlUxQWRa?=
 =?utf-8?B?WFlRVTIrN3ZreXdkd1NvMG9ROTZDYnZNM1hNWHQvcG5rYTgxeHdvbFExY1RH?=
 =?utf-8?B?WFJLeEhVd0xTYW41SlFxOWdWcW5hQW4xWDQ4elZ5WDlkSFRVL1A1NTdqUi91?=
 =?utf-8?B?anlnVVJhVWoxMVJ4Q1AvQU5MbDhCODVKWk9wTG9Yd1dXb1Qyd0tXVzlhZDVj?=
 =?utf-8?B?MUxweWpZS1BKYktUZnBHWlBtalcrU0k1NUpvRldCbzRnbDRabFRlQ3RrV3ZU?=
 =?utf-8?B?bjVsVndZaERGUVhyQzljclM5MXA4RXk3ZWkzNDlibGJkNGVOaHVlanRJczRr?=
 =?utf-8?B?SXpGd1IrQXR4UmxUQ0FYZkxxc0xZY1o1bldvVElaYUZ2T0RXN2JYZ0YzWUVt?=
 =?utf-8?B?MktKNXovVWorNDFQb2ZCbVd0S1pWcmE4WFpoWWFvM2RjR0pHZEhOb2RRWFpt?=
 =?utf-8?B?bVhBdW5ienpPMTBjTE55VmFPc1FySHZVRFl5NTltTldlMGNpOEJCek1EaG1Y?=
 =?utf-8?B?U1Bxd3ZDalRvUjU4clhqK0JoSFlmV0xOMU5tUHh4VXRHcW9VdW9MZHFONXcv?=
 =?utf-8?B?MW9BRXdZcWRCZFV2ZHRLV0xEMTIrTS9vU3YrUGtGUVU4NVFUMisvcVNiWVVu?=
 =?utf-8?B?Wi9FRkVoT0pmcVNTTmdTcGhwaWlhMGlIVWxGSnlLQVI4MWczMVNqVXI2L1o4?=
 =?utf-8?B?NXB6Uzcva2wyTmk2TTdDYTg0NzMrQSthMWZVL3ZaVU5HL3dzSlJuWllSTi82?=
 =?utf-8?B?VjhXUS9HK3o1YmJuR05ITnB5M0Z0L3dDOUVwYmthdFFGaDBiSUtqWU5DN2Ux?=
 =?utf-8?B?VnBXWkh1MndNWGEwOW14WUhHN290M0FuL0R5SnUrQXNNUjQyQjNzWXh2VDRX?=
 =?utf-8?B?eE1iWGtYZjVMQjlmbklVUy82ZTdaTTBJVDZzTWZqemNuQ2xQcmJLZVpyUUg1?=
 =?utf-8?B?OHFRUnhLSldDQUx3NUJqbGd2cml3RG1kZlZGODVYSWlVUkp0WjNZRDgrZzRq?=
 =?utf-8?B?RVF1R2dTMVpLM0YvM29nWWxZWUNIYmg5UlZGRFQzSUJSNmNDZVdCQ3ZMSjU4?=
 =?utf-8?B?am1MelgzclZsQUhONVJHM01DWGlqZE02MlpHZ3U1SFpTb2xDbThFQTc0Umxo?=
 =?utf-8?B?ek4yTjlZRCt6T2lxaHdzcmJrNVNkT0I4MElNZkhQelVzRUY2b2ZGNFZEUFRT?=
 =?utf-8?B?SkEwaElTNmVtSHdzZmxJNGgwb3dFSnVnUk5JOWV1OTZrdytrcUtFUitEUjNW?=
 =?utf-8?B?YmJOV0Zub1V1V1l1cWY1TnNTbXE2Y21FclpmeVFMSXFBVTVZdlVBNzI5K1VQ?=
 =?utf-8?B?MlpaRGg2N3o0T0N2MDZvMWV4Z3VwU1BzMkw1VjczMVljYXZWcEpnQ1UzcXNW?=
 =?utf-8?B?NmtUSVNXcXFQaEUxaks4eEdXMkdET3QzdnRFRWhSU09TR1pQYmh6YWJ5NThy?=
 =?utf-8?Q?iA/SHh?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(1800799024)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:52:47.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9977713d-9ede-4fb0-87b0-08dd7d071e02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9499

SGkgSnVsaWVuLA0KDQo+IE9uIDE0IEFwciAyMDI1LCBhdCAxMjo0OCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTEvMDQvMjAy
NSAyMzo1NiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEludHJvZHVjZSB0aGUgTVBVIG1lbW9y
eSBtYXBwaW5nIGZsYWdzIGluIGFzbS9wYWdlLmguDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vcGFnZS5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3BhZ2UuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdlLmgN
Cj4+IGluZGV4IDY5ZjgxN2QxZTY4YS4uMjJmN2QyYzZjYjMwIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3BhZ2UuaA0KPj4gQEAgLTYyLDYgKzYyLDcgQEANCj4+ICAgICNkZWZpbmUgTUFJUlZB
TCAoTUFJUjFWQUwgPDwgMzIgfCBNQUlSMFZBTCkNCj4+ICArI2lmZGVmIENPTkZJR19NTVUNCj4+
ICAvKg0KPj4gICAqIExheW91dCBvZiB0aGUgZmxhZ3MgdXNlZCBmb3IgdXBkYXRpbmcgdGhlIGh5
cGVydmlzb3IgcGFnZSB0YWJsZXMNCj4+ICAgKg0KPj4gQEAgLTkwLDYgKzkxLDMwIEBADQo+PiAg
I2RlZmluZSBfUEFHRV9DT05USUdfQklUICAgIDgNCj4+ICAjZGVmaW5lIF9QQUdFX0NPTlRJRyAg
ICAgICAgKDFVIDw8IF9QQUdFX0NPTlRJR19CSVQpDQo+PiAgKyNlbHNlIC8qICFDT05GSUdfTU1V
ICovDQo+PiArDQo+PiArLyoNCj4+ICsgKiBMYXlvdXQgb2YgdGhlIGZsYWdzIHVzZWQgZm9yIHVw
ZGF0aW5nIE1QVSBtZW1vcnkgcmVnaW9uIGF0dHJpYnV0ZXMNCj4+ICsgKiBbMDoyXSBNZW1vcnkg
YXR0cmlidXRlIEluZGV4DQo+PiArICogWzM6NF0gRXhlY3V0ZSBOZXZlcg0KPj4gKyAqIFs1OjZd
IEFjY2VzcyBQZXJtaXNzaW9uDQo+IA0KPiBJIGFtIHJhdGhlciBjb25mdXNlZCB3aHkgd2UgYXJl
IHNwbGl0dGluZyBFeGVjdXRlIE5ldmVyIGZyb20gdGhlIEFjY2VzcyBQZXJtaXNzaW9uLiBJIGd1
ZXNzIHlvdSB0cmllZCB0byBtYXRjaCB0aGUgSFcsIGJ1dCBpdCBhbHNvIG1lYW5zIHdlIG5lZWQg
dG8gZHVwbGljYXRlIGEgbG90IG9mIGRlZmluZSBiZXR3ZWVuIHRoZSBNTVUgYW5kIE1QVSBjb2Rl
Lg0KPiANCj4gSW5zdGVhZCwgSSB3b3VsZCByYXRoZXIgdHJ5IHRvIHJlLXVzZSB0aGUgZXhpc3Rp
bmcgb25lcyBhbmQgaWdub3JlIHRoZSBvbmVzIHdlIGRvbid0IG5lZWQgKGUuZy4gQkxPQ0tfQklU
IGFuZCBDT05USUcpLg0KDQpJ4oCZbSBoYXZpbmcgYSBiaXQgb2YgdHJvdWJsZSB1bmRlcnN0YW5k
aW5nIHRoZSBNTVUgcGFydDoNCg0KLyoNCiogTGF5b3V0IG9mIHRoZSBmbGFncyB1c2VkIGZvciB1
cGRhdGluZyB0aGUgaHlwZXJ2aXNvciBwYWdlIHRhYmxlcw0KKg0KKiBbMDoyXSBNZW1vcnkgQXR0
cmlidXRlIEluZGV4DQoqIFszOjRdIFBlcm1pc3Npb24gZmxhZ3MNCiogWzVdIFBhZ2UgcHJlc2Vu
dA0KKiBbNl0gT25seSBwb3B1bGF0ZSBwYWdlIHRhYmxlcw0KKiBbN10gU3VwZXJwYWdlIG1hcHBp
bmdzIGlzIGFsbG93ZWQNCiogWzhdIFNldCBjb250aWd1b3VzIGJpdCAoaW50ZXJuYWwgZmxhZykN
CiovDQojZGVmaW5lIFBBR0VfQUlfTUFTSyh4KSAoKHgpICYgMHg3VSkNCg0KI2RlZmluZSBfUEFH
RV9YTl9CSVQgMw0KI2RlZmluZSBfUEFHRV9ST19CSVQgNA0KI2RlZmluZSBfUEFHRV9YTiAoMVUg
PDwgX1BBR0VfWE5fQklUKQ0KI2RlZmluZSBfUEFHRV9STyAoMVUgPDwgX1BBR0VfUk9fQklUKQ0K
I2RlZmluZSBQQUdFX1hOX01BU0soeCkgKCgoeCkgPj4gX1BBR0VfWE5fQklUKSAmIDB4MVUpDQoj
ZGVmaW5lIFBBR0VfUk9fTUFTSyh4KSAoKCh4KSA+PiBfUEFHRV9ST19CSVQpICYgMHgxVSkNCg0K
SSBjYW4gc2VlIG9uIHRoZSBNTVUgYmFzaWNhbGx5IEFQWzFdIG1lYW5zIFJPIG9yIG5vdCwgQVBb
MF0gbWVhbnMgWE4gb3Igbm90LCBmcm9tIHRoZSBhcm0gc3BlYw0KKHZlcmlzb24gTC5hLCBEOC40
LjIuMS4xIFN0YWdlIDIgZGF0YSBhY2Nlc3NlcyB1c2luZyBEaXJlY3QgcGVybWlzc2lvbnMpIEkg
Y2FuIHNlZSBzdGFnZSAyIEFQWzE6MF0gaXM6DQogLSAwMDogbm8gYWNjZXNzDQogLSAwMTogUk8N
CiAtIDEwOiBXTw0KIC0gMTE6IFJXDQoNClNvOg0KIC0gMDA6IHJlYWQtb25seSBpcyB6ZXJvIGFu
ZCBleGVjdXRpb24gaXMgYWxsb3dlZA0KIC0gMDE6IHJlYWQtb25seSBpcyB6ZXJvIGFuZCBleGVj
dXRpb24gaXMgbm90IGFsbG93ZWQNCiAtIDEwOiByZWFkLW9ubHkgaXMgb25lICg/PyksIGV4ZWN1
dGlvbiBpcyBhbGxvd2VkDQogLSAxMTogcmVhZC1vbmx5IGlzIG9uZSAoPz8pLCBleGVjdXRpb24g
aXMgbm90IGFsbG93ZWQNCg0KSeKAmW0gY2xlYXJseSBtaXNzaW5nIHNvbWV0aGluZyBiZWNhdXNl
IGV2ZXJ5dGhpbmcgd29ya3MsIHNvIGNvdWxkIHlvdSBoZWxwIG1lIHRvIHVuZGVyc3RhbmQgdGhp
cyBwYXJ0Pw0KDQo=

