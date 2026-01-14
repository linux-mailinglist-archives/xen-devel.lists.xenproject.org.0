Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFFD2003D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 17:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203421.1518633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3Ig-0006AC-Ih; Wed, 14 Jan 2026 16:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203421.1518633; Wed, 14 Jan 2026 16:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3Ig-00068i-Fa; Wed, 14 Jan 2026 16:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1203421;
 Wed, 14 Jan 2026 16:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vg3If-00068c-7O
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 16:00:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30092e83-f162-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 17:00:46 +0100 (CET)
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by DB8PR08MB5305.eurprd08.prod.outlook.com (2603:10a6:10:112::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 16:00:39 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::9d) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 16:00:37 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 14 Jan 2026 16:00:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB11762.eurprd08.prod.outlook.com (2603:10a6:150:317::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 15:59:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 15:59:36 +0000
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
X-Inumbo-ID: 30092e83-f162-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mA4e6RTVr7LiyhkLAnL+fMYmQ1+i2znW3QHzScZYXEKPpeWMBi2g9WmklqxZlNnBS1++S1nKEAL+hfHRm8p6iFB1Hp/hp2Zczo7lgJMz5qFobDNNSnRerxcqx5TjLkyXD/659YFbGacU6WiJeP8njCqeWkCsfEW00cB230TlXzndDFlrT9cydvdj1NtP94VyogX1uNBTIKd62E+21hy6A/lqKg9f3i4rU+U78dHjTdkeeUhhnxirDqoibncJcDfpSrq+4TGsGK6g/qimdcpwTfYQMuekAerQQUBMP9fvrPCVrkdmI2Wihm70QwEIPJsv1WbTchbPLNinAaBcSsk1Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8mjaOvVX1HbYVVLsDJ6Dg5Yz1px4buq7pt8oH4hTdg=;
 b=tgHtD4gReS0e8gHq/2U3J5GfTKBpgK4CK/zIW6VX3YSm5YZXR+IAXTDx5sbIB78r8E4O1gjh7U3VBO7xKfTH/RWfY6JcDTzjMuM5EH1I+GQRk3OdUjuJOsO3IcJj2RcwbYWF9dye0rVc84qBTTpgXXC3FbYcB/XyZ8UI4Y1CpB39R+Vqd1TsYyiz0AuAfoaTC6knt6Vb77K58tGEr7e/dVzhyLIWYAC0AQ4dvki8PpRRt3idgZf6QoVvWuUgtuAw5IwY4RjVNlAOXBoviAx/DnsY+/SbzVXkWz1pNByX/MZkYv5tNuJU3JU/TvLH2TgozGDygmQfhEnRl3gz+bQeCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8mjaOvVX1HbYVVLsDJ6Dg5Yz1px4buq7pt8oH4hTdg=;
 b=aYe3Srv3Hu3kjfS+AUaCxX8MPyVtcmhDMjERltDurMACt5YdwYPDZV7hUXbiJ8CXEIRiCiE4p2/htGS/G852MprjnDAIXSMP228R//MVaD18vwDLc3yyxSP+bJTtRUkU7dr57lLwOZYcrG+PRn/HKPhLUMnjQa3mbXUGbyX/l8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0QY9Fw8Ko8hLE1rt85+h9Vblq1A7nV7pRoM8Mu6h7gQr+jwYUVRP+bQEx+K6B5L6p9layl/NDQ3rOgW1VER+uJDOuku13vkoZ84O2xh1L2HfAZtwAqkO1FIhrOt1ATNOcX6y+6gnvRJUV+9kb6GQ9iUNCCGcPRCzOxOEcfz9EXW579FMS+Lg4tDPslgmRpSy/j94sdHRPzFlobAtFNciYfsBoKsGTEvq7LQfnRRv2VWIbaFWKRih7ZaLnXsEgdE4Z4VF4n4II/uYi0zeSKa0JRghVMaRtTdn7T9p6GKRWwnTVan/T0PSarS7gzY/uiczULXYvEawFJY5ha3Z8at8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8mjaOvVX1HbYVVLsDJ6Dg5Yz1px4buq7pt8oH4hTdg=;
 b=QpJalPn1WaDOVUWDnF5l8DJB9HQ/VG3VL7HydaBIPsE88FeIgm8RXkvEoKyaR1EQj4a2ZGti4GtvIesbkLqfhfLozI3KO1ygKZzF+JpIs+ZBLxIaBZhiBfbgfKi5J0X3XuMFF93JdMOevj4Xc/waH/ibOgkWJpiMBdr11SDEh/cSg3E050gpvKdVuzFm7AnLE/j3VLXXHl8RplzIZYvXoQV65ok7RoLk2uExTN+xWgDgVDypLtX8OPQjz3T0EiGpyUjqdDQh2LobTeCPuqTv3ZD94PDIfGlFBEL3y3YJPiQxWAFct4kFKKsPjNbGKB5Q3+NN0zlUDaBb+SutBBZWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8mjaOvVX1HbYVVLsDJ6Dg5Yz1px4buq7pt8oH4hTdg=;
 b=aYe3Srv3Hu3kjfS+AUaCxX8MPyVtcmhDMjERltDurMACt5YdwYPDZV7hUXbiJ8CXEIRiCiE4p2/htGS/G852MprjnDAIXSMP228R//MVaD18vwDLc3yyxSP+bJTtRUkU7dr57lLwOZYcrG+PRn/HKPhLUMnjQa3mbXUGbyX/l8E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v4 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Topic: [PATCH v4 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Index: AQHchW4/x/lNNLz1O02Z0+T7tL7LY7VR0o6A
Date: Wed, 14 Jan 2026 15:59:35 +0000
Message-ID: <4EEAE5C4-59C7-4FA2-9B90-764C754420E1@arm.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
 <20260114142734.239197-7-harry.ramsey@arm.com>
 <c9330c5d-1cbe-4277-b784-9be86b87f149@amd.com>
In-Reply-To: <c9330c5d-1cbe-4277-b784-9be86b87f149@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB11762:EE_|DB3PEPF00008860:EE_|DB8PR08MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: c78b5a71-6539-4c97-14a0-08de53860fce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S2tjK1d5ek9MSFZ1ZnRWTXJkVFRaaTduVHNBVWw5d2ZTellKWVR5Zk9mbGVK?=
 =?utf-8?B?ams4Mmtlb3dRYmQ2VzZQRE1wQit1R0hKNEUwblpZRk8rbE83VHBTOHRDVUVO?=
 =?utf-8?B?bVpJUXZnYUtVU04xaml1YWlMOHFZTUVla2pDV2d0MmVFaW5qenR5VWx5K3JV?=
 =?utf-8?B?K0YwbGd4eXEzTE5kaEFTempmbXR4U0JKYzloaUlPdHBxd0VXVFVNVWJQVDQw?=
 =?utf-8?B?OHA2MXV1NE1VYkczMXBJNjNKenNBT1lwcW9GMFE0UDNGWUs1Z1JjTFd3dnZv?=
 =?utf-8?B?SDVjdGNxQUhuUlU5R1lWQkhtTzBKMktGbDdkL01VZlZZR3BQaXlLS3pyMWZr?=
 =?utf-8?B?VGRtMlptWjlpa29pdkJOMGNPU0FFZjFXdUNuNUtFTWlvc3Zid2hrVjd0ZEdL?=
 =?utf-8?B?RFhnK0hwMjlyN2MrQU1RR2JNSTQvMkg5akJFZnBDZ1JsVFJ2NFNEQjd3Ri95?=
 =?utf-8?B?VnZSbkJ1YU13dVNKYVM4R3NOTFM2OXh6SGpTamlWbEthR1RpZWlmYjB6WkxR?=
 =?utf-8?B?TGs5bWNZOS9YdGNrMGF0SCswaUNDVjBEZFJpYlBYZXJOSDNCOXRqTXdnd2tR?=
 =?utf-8?B?WlNxU1ZCSWNFd2had3J3b3ZYM05walI3UG5oMzlWZ043QjBGY0ROYnBpVVJp?=
 =?utf-8?B?MXR5aHFNZDg4QmtNMmQwQkxHS0VySXNRU2xxNjMrZTVXSEkwOHQ1aW14QU0z?=
 =?utf-8?B?NkpUYjViTkVvb1p2ZHBvMjJxd2NuLzRHTTlPT0J6d3diQ2V5SXB5MDZGTXFk?=
 =?utf-8?B?RS9HbEVSOXo2RFRsTGsrajRHUXFpNHZ1L2hIS0VtUGhubjNVSEJQSjQrNld1?=
 =?utf-8?B?WXZ6UFRic3huc0M4bVJRSEtCTjJKUWlXQlVVZDhDaGxBb1prSmJ4d0haVG81?=
 =?utf-8?B?TldpS3ZuODd3MmFZYnFiYWV3QWRZN1VJL0x5azNjdzc4WGU3QS8xMzBjalZF?=
 =?utf-8?B?cTg5RklEZGczejhNWm5GTG5LWEQzM3kwd0NZRFVLUk0vYlpnUGFoM2VCZVVU?=
 =?utf-8?B?cHJKakZpTUJlamtNaW1ZTzhESloweGR1NFcwR0QrMVRzalRnUkEvWWd0Mk0r?=
 =?utf-8?B?bDBOQzlTTHVVRDdSNzc3QkRIRlF3OVhyYWh3MGU3YWcvMFpVVlNBVzBwRFg3?=
 =?utf-8?B?eVZyQmxiRHQ2MnF5Q1JXM2NVaXV2SkQxUVNycGxudVdZTk0yMHJJVC9mZFVX?=
 =?utf-8?B?Rm5xWFRlRXlpdVdGdXBUeSswY3lDQjhCU3RQbW1MazJyT3lJNmhQc1hwME1G?=
 =?utf-8?B?SDBvU3ozNUJhZkduMmRsRTl2VGFBcmtVem0xZEdJL1dGTW1lR2RndytWSzk2?=
 =?utf-8?B?VDh5MkJBMmJETUF4UnFXQ3dEb2tVRE5zU2oybHNBMHRKbEN0Y1dUSFNqTXAr?=
 =?utf-8?B?Y0s0TDRQcVQ2MmY1cWkxcHpUR21lRGs4dUpWRUJFSUJ1eUozT2RFbmt5aW5M?=
 =?utf-8?B?enBNSkU4Tk9CaEQ0YWMxUW45REsvaXdVdVlJS2lleHVqZVpHNGRJek1XV2Zu?=
 =?utf-8?B?RStzOG9JZnUrcHU2Q1RPV3Y2eEM0MFdNSnhWdDhLTzNaSS9MdHJaNldxcm9q?=
 =?utf-8?B?aUQxR1lyWE1ZOGJ0L2xEQ2pzTXRYTGh4ai9iYWlMcDNFejB2RFBabGdEdnNk?=
 =?utf-8?B?eXR1TGpvZVgzTzFHdUdhY1NRRnRuc21sd3ZXQ1JXYjRDY3FON2M4OTRKYjBk?=
 =?utf-8?B?cGVBT1I5czhkWFVEaTNlVFVKS1o5YXNDamNLNzdsT2pHV3NDbmxzNHVMMURy?=
 =?utf-8?B?NjQyVGhyeTVHTld5cWFXQklpSm1mdG5sNkZ1eEkyYklVbGtST28rME5JZ0ZI?=
 =?utf-8?B?SGtkOURoK3puUEZjZUtXSUhJWUtnZ0Y4NHhqcFdBOFk4ZEEyNmFWOWw1YTND?=
 =?utf-8?B?Zkt1SHhnbENHOVJYTXlEc0YzcDRtZEZwZVkyTmV0UWp6S0xBQjB3QnZxcFp4?=
 =?utf-8?B?Qlg3RGdmVDczUFFsYjRCejFUQmNxVFVueVRxZktiZlFibUV1OVdpYTdXMkJx?=
 =?utf-8?B?WGxwWi81cjBiZ1M5VzZCMnJLeG1GQVZTa1lCYXM1UHJsTmZqR2dsNlhpdzc5?=
 =?utf-8?B?MlY1WVhMWVEyc0J1SDg5ZkZSZGlWRkRybER2OWozYnB4Y2JvTFpKNU51bUhT?=
 =?utf-8?B?TEtrQWYzUVA2bExIZXpENW9IMENwS05hSmM3QjVMbTJBNVoyZ0JKRGVBRlM4?=
 =?utf-8?Q?zrNdY0QnblJQAmGDS/WpFGo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE68119583E3224BB0E3725C65F2AC05@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11762
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21889377-57dc-40dc-f907-08de5385ea4f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|1800799024|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXl4TURCbXVKM0Zwc00vU2Q4ay9XekZCNkg4S2RjWW94RzBocmFjNFh6Y2JB?=
 =?utf-8?B?WHlua01ndFVOcUJ5bVAybEh4NWhIUWtYVzU4Zm9lTG1xVDE2VEdtcWFoVE9z?=
 =?utf-8?B?MytIb1lSTi9aMTdYRk1UdkgvcnNmT3lTZ1E1dE9hSFpKbk52Z05Kbk1lTEJz?=
 =?utf-8?B?WEJGK1lhdlpySzhtTXo4TzN5TEdBMFV1NFI5ZUFWK0VieWpxUHlmQ1NIV0Nu?=
 =?utf-8?B?TW9YNkk5K09lOTgyNXZ5eHhveE9zOEZkMXhWMm11VG1vQS9wTFZtcGd3SFdT?=
 =?utf-8?B?RFk0S3pOUHBxSmNCRzBaNVkxY1FHQjNzN21oSktYQWRZVUtjbmhFYW5rUnpU?=
 =?utf-8?B?UWFEVmx5YWdqd1R2a1FmRlJDL1I5NXI4K2ZTOW9aNVN5dVdCUzJsZXJzQ0pl?=
 =?utf-8?B?VFN5UE5hMHU5Wm51ZHZTeHpzaWljVC93VDZpbllyOW01clppNy9GOVA0MGZ3?=
 =?utf-8?B?OTdTcWR6Q2JqdVJ1WmozczBXaVVtVXErUDhVVm1lbDBoQnVlVU9RRFFqUlNT?=
 =?utf-8?B?amlTcndNcndoSXoxekZvc2ZPeE1nOVd5cVJlcUpGalZEVXRsbHQ1MG8yZ2ZU?=
 =?utf-8?B?YjhaV3pjVklub1M3WEgyUzRQZDhMamh3VXhsTzkxOERhNmNkdDBYUEZBQ1F6?=
 =?utf-8?B?MFhBVTJnLzl3NitrbHp3UTRHTXYzZnVhTFFJMC9tVS95SWxucnk1U1ZFVmFY?=
 =?utf-8?B?ajIxT3U1eEJXT2NlN3BhdndNdEF1WGpPVElJcDhJU0dENXlrUHBqREcvcGpC?=
 =?utf-8?B?ZEQyTmRxVG8vMms5SHlGSXorajdabWdFS0c0bnkyWkZpdS8rNThOU1RPWU9H?=
 =?utf-8?B?YTRwTXFDb3NnTDY2c1FWRlJXazNHc2pRaTNwS0JmVFNEV1ppcnpYa244SEVh?=
 =?utf-8?B?b0tyaUxRN21aeVQyb1RWcTlpbTdaaGtDTEhLYmsyTm5tT0tNSjlmbTlzMjZD?=
 =?utf-8?B?Vng4VWVYcHovNlNNZnV0KzVmQVhMZU1kUTZEeGgrRXl0YzJ2bmFYL0l2YllR?=
 =?utf-8?B?M2ZiWVhMNVhFdzFqcldubkFUVVRidUNDV0RmWjlRNDJ6cTNkcXc0TW03aEc3?=
 =?utf-8?B?dHRhblE4cEE5cFdzSmxMRld4UVcwVzl0MnpRQkhnYkJnVVJlS2JzKzVDckVX?=
 =?utf-8?B?d1lES3NQS1ZaSDljakJoaFBTR3UvVS83TTFpQjlidno5SFpoT3VSeXduZEhn?=
 =?utf-8?B?cWl4SFN2SVBGUFExM2VXWEpBQnBTYXhVbElER1lBeHRxWjhFenVzOCtqOXRh?=
 =?utf-8?B?Ync2MmgwZm4wOUxPRGlMemJBcWdnVldwTzdYOWY3TWUvdkljK25VMXpBVDRI?=
 =?utf-8?B?ZWtpdmtubFV2bHVOY0hxS0xZZjRKWHUvUEdwUVVRaGN6N1FPWUNpQW1OV1h2?=
 =?utf-8?B?Z2N6R0xZUkZRanA3Q3VsOUtNSVpxSXVTREZ3YW9iYXBkTDJtYVo0S2pqSmh6?=
 =?utf-8?B?NGd0dXY5KzhYdnJnLytCaXg5bGZpVGsxd0E2ODI5eDB5ajA4R0xLTjlOOHJl?=
 =?utf-8?B?RWsyNy9oa3B0TUIzNlpRNWRVT1A0SDVKcDgxeVI4WjR3YzhYMzAyQjVEaW5Y?=
 =?utf-8?B?cjZGcHh2dkZ2VnJNTkwyUmVZRDgrS3oyKzkwaVVUM0ZtTTZwdGg4UWhKdDJV?=
 =?utf-8?B?ZmNEeU5BTXV3eGN6eDVpak9hU0xyNlV2c2FKWktsbWFleGlrK1hqK1NxNTUw?=
 =?utf-8?B?cHpIQkZ6RjNZZFV6c20rMXJlZGhWMHNEak80b1NPZFZzYVBYa253RzNmQm1H?=
 =?utf-8?B?aE1BZ2E1dVlwWEtuK01aOEszeVJoMHc1RWJESE5raElBQ0lPcitGU1VUSVZE?=
 =?utf-8?B?TktWWXNGd0RXVWFzT2xDV2ZCSE1wYmxKeDJHdU0wdUJmUENEaEpWMjV2b1RZ?=
 =?utf-8?B?YUNCdjNKcXR1bldkYm8zcXlKdklnOEt0RFBWeGVxVEg4K1NiRWV2YnE5c3F0?=
 =?utf-8?B?OVE0RDZhNXFyTnl4ampTRmt6bG9vU1FsVDQxSElJcnY4aThKRnlxR2oxbjdR?=
 =?utf-8?B?elZHN3IvMTNuT3lFemNlaG52WWg0dmJ4aTN1QkxHdnFCenlZSDlFendvYWty?=
 =?utf-8?B?TjNyS2p0dDY5NjJHZkxiYmdCLzVSejJobi9uYmpVZk9hYlJRZ2Z2OEMrZGM4?=
 =?utf-8?B?ZExtNFZPWVhwU0loRXJOZ3VJY29NMWd5WXNMRXlhbi9UbllieWtUdlVoaDFE?=
 =?utf-8?B?dDM0M2MyeWxhMXphQ2N2aFZwZTBWYnE0blJvNDZKN1JONzN3Y2N6MFVlTGdO?=
 =?utf-8?B?RzN0VFh1bEs2eHI3K0p6anZZNWx3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(1800799024)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:00:38.8099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c78b5a71-6539-4c97-14a0-08de53860fce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5305

DQoNCj4gT24gMTQgSmFuIDIwMjYsIGF0IDE1OjU1LCBIYWxkZXIsIEF5YW4gS3VtYXIgPGF5YW5r
dW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgSGFycnksDQo+IA0KPiBDYW4gd2UgZXhwYW5k
IHRoaXMgdG8gY292ZXIgQXJtMzIgYXMgd2VsbCA/IEkgZGlkIHNvbWUgdGVzdCBhbmQgYm90aCBB
cm0zMiBhbmQgQXJtNjQgZ2V0IHRvIHRoZSBzYW1lIHBvaW50Lg0KDQpUaGUgb25seSBwcm9ibGVt
IGlzIHRoYXQgd2UgZG9u4oCZdCBoYXZlIGFuIEFybTMyIHNldHVwIHRvIHRlc3QgdGhlc2UsIGlm
IHRoZSBtYWludGFpbmVyIGFyZSBvayB3ZSBjYW4gZG8gaXQsDQpidXQgdGhlbiBpdCBzaG91bGQg
YmUgeW91IHRvIHRlc3Qgb24gYXJtMzIuDQoNCkFsc28sIGluIGNhc2UsIGNvdWxkIGl0IGJlIGRv
bmUgd2hpbGUgY29tbWl0dGluZz8gKHByb3ZpZGVkIHRoYXQgdGhlIG1haW50YWluZXIgZ2l2ZSB0
aGVpciBhY2spDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

