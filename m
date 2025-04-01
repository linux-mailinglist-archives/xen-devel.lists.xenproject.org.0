Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC1A77B2A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934014.1335859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzava-0000B2-Uf; Tue, 01 Apr 2025 12:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934014.1335859; Tue, 01 Apr 2025 12:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzava-00006j-RU; Tue, 01 Apr 2025 12:41:14 +0000
Received: by outflank-mailman (input) for mailman id 934014;
 Tue, 01 Apr 2025 12:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heJ8=WT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tzavZ-0008PM-6q
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:41:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f403:2614::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9674ba96-0ef6-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:41:10 +0200 (CEST)
Received: from AS4P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::10)
 by AS1PR08MB7585.eurprd08.prod.outlook.com (2603:10a6:20b:471::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Tue, 1 Apr
 2025 12:41:06 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::4e) by AS4P189CA0006.outlook.office365.com
 (2603:10a6:20b:5d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 12:41:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 12:41:05 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB10351.eurprd08.prod.outlook.com (2603:10a6:20b:579::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 12:40:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 12:39:48 +0000
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
X-Inumbo-ID: 9674ba96-0ef6-11f0-9ea7-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uzFyFCyKS31KwPQ8GpinjEifNPPFQR+MFUcte7iVvkKG3bKGECKEFgITHcjsZsPwWR1UbN2z/jM8C9fnU7jTd3nXxAeZ0byWUU+R8kXiyzmh8YUsqrgYDpzECIzvNgMmTe8jiaEaCid7aja7dQOILCtZ6jqEw5PqTSLGmOscJDfMu+6729KDSHbKBZLfnu8gPyI7BJacmf4ZB02LrIeTjtZSzRCxb2itX3tzhmMsVXZ/escGRG0EpK/LIOltTUsek8ICRC56ynIP4+/Z3PFCLEhXpzKX7kzMi2ZDcg8agpYpszywmbcQdFKR1TIZbRUIUrpw9V3gdlsiPMz2gnEY/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrmUDUAsVhFxUMqGL5k77UKZXX+SoRVVirby99Rb2k4=;
 b=nT4PbSRXNwuN5EAUNmLp23FglpYQUNCG8SjWxsZWjk9PPl9w+clgAy692jljK3eXiQasvcVj2IE9YyX4luVDXP2faNud4uKNj5FSCqKcNapB+Vjs1BzDYpf0InvQoGggfpwNANPqBH4abHJq3Mbo6j3dw+dgZozZpTRHgCGqX1TkNLu+lEY5gopIR9bBrVSYQShYPyaSTNZ3VVq/WwwGFMtTGwLXVRXi7RXL+k1Uv7c4+EQeEVC9MD/x5MTpxQ4NCpCW8d6GiUhpk329zekwRVB7Hlvq6eXBd4cI3jMeDt9T83LTcaE/pDw5Fh1zVi8Y1JJNwTrJlEn8xn/yKPuAsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrmUDUAsVhFxUMqGL5k77UKZXX+SoRVVirby99Rb2k4=;
 b=eBSQxqF9/24JUfZSo8ekx3swerGb0xAt6emPaKQ1pqj7zGBTBgyfTdZ0Oisfda7GjJoQmiYMYxMonc4kMa0UlWi8C8SrVgJdgy05VMZThSWDgyeTlxP0JhQmUI9j/FTPe/otDX4Gr65KavNVbOOq+/4qNLBUtnHVse7V4Ky3YEQ=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR6qpIHP1Y6FYyJL01Uh/iEepFhA5PG0z66aXIknz2/PtZBskoo2wYNzdTppw+d/3BtvGHVZZOqhW5wgZQZgW9mxipC6+kSByNn1lo6Tew5Rg8wHLEU1vur3IVymszOc1PsK2QRJBg42c6E3+FMeR8XjAnzgctf/aEA2kNlPAioKRy74MY4orS/ZMpZfUp68YVYK4DTB1vs7hufHOm4kwvn6gldzd/kbPfP8GJx1xZOj8h/GuktOVUnv8BzH+t9tCgiYwJ7elm7hueGnIiPu3nPy+pL8mwBjHzl/8wKdkyhkC4sV9QwVXLO9ujtJoNUbEDuYOv+OyUMZFVftneKYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrmUDUAsVhFxUMqGL5k77UKZXX+SoRVVirby99Rb2k4=;
 b=TpmJK0UidoCO4qM0+z5R6hE8OtYTr2ZbE6gWKOJ7mcku7us0inWYU4xKQ0kirqtwe9pnMGE9vELSXDqzGdUdAwO+RJqrZ2zGj7DyE0YRYFzaBM0dYwFoVCOS2TywD/JRDv5Gj4vIjhS6nuH4WPC/9IXaPhI9QmHLrbgKJbCRpSp7kBbpVJdFcmmII2IFiJgRdMH0nYCbGkvd55JB1xNja+dHgk+KHiZ14nicXipEC/ugPOFuGi5IUzaUtKrDanVP5YOpkQ2k3x+4r6Jd4Q0yuKyw7N4bg28P0dDNx8YoE1qYulTusty/svwtGfaS4Vk1xTS6aj1bZmnH62vMm7exzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrmUDUAsVhFxUMqGL5k77UKZXX+SoRVVirby99Rb2k4=;
 b=eBSQxqF9/24JUfZSo8ekx3swerGb0xAt6emPaKQ1pqj7zGBTBgyfTdZ0Oisfda7GjJoQmiYMYxMonc4kMa0UlWi8C8SrVgJdgy05VMZThSWDgyeTlxP0JhQmUI9j/FTPe/otDX4Gr65KavNVbOOq+/4qNLBUtnHVse7V4Ky3YEQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Index: AQHbouXYbSonA6PaSkKWeRFZ+sT80rOOwF8A
Date: Tue, 1 Apr 2025 12:39:48 +0000
Message-ID: <EBE0456F-945C-4B55-AE86-602AD0F1556E@arm.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
In-Reply-To: <20250401090937.105187-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB10351:EE_|AMS0EPF000001B6:EE_|AS1PR08MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f7c8b4-4d85-40d2-3097-08dd711a77f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?akN2d285MUtHRldqZm5rVHp0dzRwSGJIT3pzVW9iRWxSM1FPSDhJaXJoaXVL?=
 =?utf-8?B?VTA0cmRBY0IxVmZTT1ZrNDc0WE9ZZElJSnkxK0dMaUtVNDk0U0swMC83S0dP?=
 =?utf-8?B?T1hCZFJ0YXJ3ZklrRXJLL2pDT2ZRbnlMb0FRN2hKb0ZKQ2QvSXc0SVh4c0JD?=
 =?utf-8?B?L2RtTVRYbzdjM2VFeVB2UlphRjFKemZYUFFNYTYvR3d5dzdVdXFXcXlMcE1s?=
 =?utf-8?B?QzhJWVRGRmg1dmJ1MHBNcEVrd2h3ODA0MkJGaFNkaXl3dVFFM0VmbERXUjYy?=
 =?utf-8?B?bytqNGdlQm9oOWVrYTlyNnFDNXowblBWTk9TWm96SXBlNy9mN1FINzU5NXNq?=
 =?utf-8?B?M1BPK0ZhcWhFTUN4K0lSZk5jOTY4RlZpOGVWMW5vTiswSTFydmRlRlRXT25E?=
 =?utf-8?B?Sk40RGFvK05TM3ZwNXUvbGlIbndYbUxiL09lYXloTmxlMzVRa2FFdUliVmRP?=
 =?utf-8?B?cUZ3S1h6YWNYc0crTUJmU2VDbUNtdzNXUDExR1JDanR5ZTNXY204K1RaQ1l5?=
 =?utf-8?B?SDFaUHNzK3JTT3lEV1dOTzF6aGo0bU9VVFpNbCtvOHA2NktWN1d1T0daSlBL?=
 =?utf-8?B?WXA0OTNkQjBEYkdGMmlEbVlFZVY0dUxic3ZDNlJkZW5IK3AwR05iNys3QmdL?=
 =?utf-8?B?Z3QrNEQxZEFGTFQ3QUwwYm5yR3BCeVJmR3ZSc05EbmF4T1k4eTd2UkE2MVg3?=
 =?utf-8?B?dXY0YmcyNndUVkZXcFgzQytRU0xRbk13ZktOK0toNFZtdW9hcmtPUFljTWdp?=
 =?utf-8?B?aUc1bkk3dkdzeHQ3TnUwL29saU9leEJwWUhwcGRhakVRMEdTOC95Qit5QUIx?=
 =?utf-8?B?U00zNkdsOUVxRFNoTkhHeFI1MUg1eVR6dWtlMUVSUllXWXZXektZb29SblJ6?=
 =?utf-8?B?RzJGQTJzSWVac3lGaHNhdEdINytBUEZEUG9SUDl6dU10ZVVWcmFIZEVMOWtm?=
 =?utf-8?B?dXFIK2pmQWIxOFFZcWl1RUJhOElZam0zaS8yLzZLVzBVam5CUlBqdklXN20w?=
 =?utf-8?B?UmNGak1rV0VCTW8xMVIwU0tDeXZaMyt1SUNYN1hWMGFvMXIrMW53ZkxQMHZV?=
 =?utf-8?B?OGkvYy93S0FkM0t2VFBRNHV0Z1llNW5EQ01oR0lyeFdteVFFVGpadjBsY1k2?=
 =?utf-8?B?RklFaTgzQUJmazh6QjlEeDVQZzBRQWpkLzRaOVp3VW5jM25GejVyMzdycTZ4?=
 =?utf-8?B?SlV5ZnhmenJveVhuNDF4MUZXZHRhNHhGanJtbm03WWQxdEMxMU04czhEbWhm?=
 =?utf-8?B?WTZXb0VTVk5mc2ZMMmpIeWNWR2JEd3FyeG5LVXdNakt0K3M4a3dKdXZ3c1pF?=
 =?utf-8?B?VGpBVTZpVmZHYVVaQzNKK09rdy9VSnF4RE9zN2JrcTdzUFVNZ2NCb3p3MWhG?=
 =?utf-8?B?SmR2YWx2b0oyK3RVV1JXZVNyRUdXeXZGRW1lODFlRkhQdC9NWGE1ZHFzK2NL?=
 =?utf-8?B?djk0Q21SMmsySU1yU2xDOGRQNEFMS24xVE00SzFJaks0SnJkcXVjTTBWeXl4?=
 =?utf-8?B?dytLcnEzOTAycEkySUxTaStOTkRBdURHdnJXQ2xVSjRSWjhoWTM5WUV3VTV1?=
 =?utf-8?B?T1NoeFZ6bGVrVFJWWXVPVnFKMUxyYkM0cjJOUnlMcEd1bU14V2hIaWpMd0pB?=
 =?utf-8?B?S2JpZjFudE0wZGx3TTFXK0xLc215SGVTTmNzS0UwaFI4b3p4MCtwTXQ2cEw1?=
 =?utf-8?B?em1TQTJJMXV6b2ttb3pLVnRwTzlaYWF5RG4vanBPWEwwQ3UvRUFTUmFzWUhE?=
 =?utf-8?B?UGdadVRIUFZkT25IN0xOcVk1bVBjTGU5eEk0c3dXNTZuVkk4U2RqdzQwdERa?=
 =?utf-8?B?UWJuMnVuUGIzOTlVQUJBVXR3L1lRVVV3UG15bWZBNG1MTkVXVENkS3NHdHZh?=
 =?utf-8?B?UmFKakNuZ3ZjQWFDcElOcC9QWG1NaGJCRE91NnphOXVHUGpzSFNhaDB4UlNQ?=
 =?utf-8?B?ZkJYdTVQazg4SnZSdm1VNmJUOFBzYmh2cHBKK3h4eHFGTzRUa1BzNTRKTm9i?=
 =?utf-8?B?MVBFQnN4YnN3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <797576624C5C8840A4BA6920E288E501@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10351
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25ae182c-3c40-4e9a-7b4d-08dd711a4a7d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTVnbHRKRlpvWlU5elRjRnUvSG1XQktoY0J3RUhpYlJ6dUw4cU5WOWx4a05I?=
 =?utf-8?B?TGI2MVZMV0VMcnd4dm5KVVdnZ01OV2ZvY1Z1NEUwblBNQ2N4eGd1RGtBRGps?=
 =?utf-8?B?VXhDT283YUxPbzB0d3NjSG5JRlhwc2RLU3dXTHlVLzcyRS9pbVgxcDQ3WCtN?=
 =?utf-8?B?ZVIxWXp6d1ovNDJGNHNYL0UvR0hMRGQyV25mZ1FLenZhY1RxeUpUNVBpYXZX?=
 =?utf-8?B?bmhDcmd5K0dkVVhlMUQ3cVE1UlRiQmY3Q0d1VWxpNE9NcTRIQzl1UTlCSFF1?=
 =?utf-8?B?N00wcWIwK1MybnBIRnA5K2JIMDRBMlpGZzFKNHFNb3hvRDNtTEI2a0RaTkdG?=
 =?utf-8?B?SFJ3ek5wVTQxV2FqZlZpSGpvdjVZM1VzVnRRanNiU2djV3Z2UXFPUHZqeG9i?=
 =?utf-8?B?RjY0aEpFUTVEOEZJeEE1Vkt0MmRPa1BKRXU4elpiQXFveUp6R3ZNd0duVU1V?=
 =?utf-8?B?UHViMEphb2lrYlJTbGhTODFRMDBTdkpJOWlCYkE3dlFiN25PWkt2K01VWXF0?=
 =?utf-8?B?ajhIWDF3TEh5SGRxUW0rdllDTmRoQ2dNc3kyLzJmcXpZU0tEcmVyZHRGa3Nt?=
 =?utf-8?B?Y3VCUDVveGV5a2x3NzVuQ0pYdko1VlI5WnVwMUY1YW1IVVdNS0JJQTFRa1Mz?=
 =?utf-8?B?bGZHbmFHM2QvclkwVG5JL2xBUnRlK3BOa2F1dUZhdU1QZ3JmVmN4NWJtYmJo?=
 =?utf-8?B?Uld1ZVV2SUNLVVBiMS9YT2liWmJndXFhMTNmZUpxb1drZjRqaTBBNUNPQ2tC?=
 =?utf-8?B?N1lQZDdmNk5MaVdDQ3lPM0ZWTHNGRFRnYjlBM2RTUFpwOHdSMWh4V0s0cTdp?=
 =?utf-8?B?WkNJWDc3bXNnVWlkTUw2dzdpa2ZMVVpFY2hGak1mZlZhcWNzS3dtSnh6a3I0?=
 =?utf-8?B?Y01yUlU3NFVYTllWMXYrb0NCNHd3TEhuazIyMW9OTS9wZ1lQVXhyZlZoeGgz?=
 =?utf-8?B?RUJzOVQ1UU80aFE1Y25VcFc0REF1ZENPYldhQ1d0SFJ5NDBHdnAyTzVqYW9q?=
 =?utf-8?B?VXBQQ0U1amR4aThtN3g1YWRpbGdldEh4Qmo4d1J2dDkrUExWS3ZKYi9NaXNO?=
 =?utf-8?B?UlRkY1VqRlUvMFY2WlN5MXpZdVJUQkppQWJFTWVJZ2wvR0JwSnBjTGZlQnpr?=
 =?utf-8?B?aXAyRUhSalBCSUY4dkRYcWRqSFRsMTJxTy9jQWFUa2F6RkRJeGthQktKTUNt?=
 =?utf-8?B?NUdKSjFLdHgzUVB5NXY5cUNHc3BlbWRiNnZ4M2RLTFB5RWR5SDMybVRKa09Q?=
 =?utf-8?B?UnlEM0hCUTZXNDIrdHNVenowOGJsdGpvUVE4aDBMTTIxOEZEeW1tMXFXRXcr?=
 =?utf-8?B?bHRoTnIwQjQrN0hUM3k3N3NGVlRvU2hLWklvWUxET1FzSHdza1pXaHNvd2xZ?=
 =?utf-8?B?WFZBWFRsMkd3Yjk3N0phQzZyajdLNWN1VnFMZ1JaOXRPTnhwQ29yelUwZEpw?=
 =?utf-8?B?WTRkOS92c3JIcEFpVGJqb3JZT2NyUDYwZlUwaDJhaHNSb3hmRkVBNDVESDU1?=
 =?utf-8?B?cjBCdTZOcDdjWTBXdTc1aTU0MHhDQ0J3OCtsc3Z3dXFhbmFUcXY4MlE4ZXls?=
 =?utf-8?B?Z0ltcWo4ODcySklRZDIyOVVnOCtwdUlFMTZLVDQ3SjVoeUFWL211dHA3cnIr?=
 =?utf-8?B?bVNwc2RuanZHaWFRUFB0a241QzgxOVhDQS9XM0lNcXBwYm9HT0FTWi9nWVZE?=
 =?utf-8?B?L2xpTkhJU1hNZXcycFNQTWtBSFA0NXJUZW9xK0FyM21QcFluZnFEODQ1VTRH?=
 =?utf-8?B?UFpCVmVIdmx6UTR3ajYvd3V4M2dTOGtXRzhpbVBBdFFTSlRMZkREaUR5V0dJ?=
 =?utf-8?B?VTY3ZlNGS3NNWXE0MXVZNXgzM0dmSnlMK1BzR2hiL2dKSWd3UUtyaThjdGdq?=
 =?utf-8?B?M0Y4QnpjdmltNXM0akdhUmZ4azU3U0Nxbkl2WHR5bEtDU1RxOWZwQU9TSFg4?=
 =?utf-8?B?S0hRcTRQcU9NZFdFYUppUkd5UnE3U0dnN1llV3IveG5jODlZYS9URTZGc1Zr?=
 =?utf-8?B?aFkydXBFUE9MRmcyY01GakVNcTNsRVRSYUd4L1BnTUVWNGExaTZXYVQwbjNa?=
 =?utf-8?Q?/K0P2l?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 12:41:05.1080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f7c8b4-4d85-40d2-3097-08dd711a77f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7585

SGkgTWljaGFsLA0KDQo+IE9uIDEgQXByIDIwMjUsIGF0IDEwOjA5LCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFRoZXJlJ3Mgbm8gYmVuZWZpdCBpbiBo
YXZpbmcgcHJvY2Vzc19zaG1fY2hvc2VuKCkgbmV4dCB0byBwcm9jZXNzX3NobSgpLg0KPiBUaGUg
Zm9ybWVyIGlzIGp1c3QgYSBoZWxwZXIgdG8gcGFzcyAiL2Nob3NlbiIgbm9kZSB0byB0aGUgbGF0
dGVyIGZvcg0KPiBod2RvbSBjYXNlLiBEcm9wIHByb2Nlc3Nfc2htX2Nob3NlbigpIGFuZCBpbnN0
ZWFkIHVzZSBwcm9jZXNzX3NobSgpDQo+IHBhc3NpbmcgTlVMTCBhcyBub2RlIHBhcmFtZXRlciwg
d2hpY2ggd2lsbCByZXN1bHQgaW4gc2VhcmNoaW5nIGZvciBhbmQNCj4gdXNpbmcgL2Nob3NlbiB0
byBmaW5kIHNobSBub2RlICh0aGUgRFQgZnVsbCBwYXRoIHNlYXJjaCBpcyBkb25lIGluDQo+IHBy
b2Nlc3Nfc2htKCkgdG8gYXZvaWQgZXhwZW5zaXZlIGxvb2t1cCBpZiAhQ09ORklHX1NUQVRJQ19T
SE0pLiBUaGlzDQo+IHdpbGwgc2ltcGxpZnkgZnV0dXJlIGhhbmRsaW5nIG9mIGh3L2NvbnRyb2wg
ZG9tYWluIHNlcGFyYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPg0KPiAtLS0NCg0KTG9va3MgZ29vZCB0byBtZToNCg0KUmV2aWV3
ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIGFs
c28gdGVzdGVkIGJvdGggY29uZmlndXJhdGlvbiBDT05GSUdfU1RBVElDX1NITSBhbmQgIUNPTkZJ
R19TVEFUSUNfU0hNLA0Kd2l0aCBEb20wIGFuZCB3aXRoIG9ubHkgRG9tVSAoRG9tMGxlc3Mgc3Rh
cnRlZCk6DQoNClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

