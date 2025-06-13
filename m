Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C5AD919F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014597.1392709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Vh-00053Z-P7; Fri, 13 Jun 2025 15:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014597.1392709; Fri, 13 Jun 2025 15:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Vh-00050o-MD; Fri, 13 Jun 2025 15:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1014597;
 Fri, 13 Jun 2025 15:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQd4=Y4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uQ6Vg-0004iP-6T
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:40:04 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab9d6248-486c-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:40:02 +0200 (CEST)
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by AS8PR08MB6104.eurprd08.prod.outlook.com (2603:10a6:20b:299::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:39:58 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::a) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 15:39:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Fri, 13 Jun 2025 15:39:56 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Fri, 13 Jun 2025 15:39:21 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 15:39:21 +0000
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
X-Inumbo-ID: ab9d6248-486c-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EFK/KbcPj9Ns3d/AkuwQWUnSAsRyFXsFDahLebJYlEC2TDp7EQrios8pYCI7x6Ll+FN/l0KPGMDQzv20GGL4ZdRNCFSZUYbtPbA/xFx19aP2vDq8H98+ENu9Z6apKEC4IDv8YPF6WpSPa6kbvMjuUXNQ1v9r2VSoLS+gXMJnx0Hux+eGtqpMezy5v7qq90aVB1WDAh2VIV7txbAQtAqhnVDG6guu2ghkNdR8tqVyTiAz2inZj3xpw2ApxkHq/wuiGwqA8QOYXsOD9mnZoYZ+6NCHjJlrmXkCfpqgJ742B/6X4ukezx4dSRzRemUFpTv8obIy+dBoUIdw/F2KWWAc5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOeunrsjP1nZaW+DLJHQ+Z0jzivpn/v68lRbvAtK0V0=;
 b=zCfImC3mnlYCKkY3o0tpLXeeIJExzYRL10h/Q2yH0aJHNITqXM9LZOpDel8+sVQjivGDPgb4guz010NmUWmjqiJq8CYqnbpEdOhz12LBlEzcK1XeTls5zIivr6Ie73MyTAWXsyX/NfDOe33IbEnneEBV9pRZRDAR5YPE3WSnNLrKUZ9wxI9osmPBFFkpEeDURnXxygy3fgQ8Nh5DopejWkOkLKXkhdfN/uXEtW53bSNw+dkCyzba1OzickgzMI+frrmLWyQ1PknYw0nP56LG9QY1o+e9gYP+xtmjmoN4MAmF2kOqo3vncZ+eThOn/l5bLWKRkRO1sv3KJtcLEbrHYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOeunrsjP1nZaW+DLJHQ+Z0jzivpn/v68lRbvAtK0V0=;
 b=D9u/0X3KZSIBg6Zb7nMYNMSmqPsS6BiYNnPVVEye6fJ+QlSCW949gwfB6c2aIS/1r1p05sYvzHzyDjxqtgTH93y2qBLYCNpfts4CgRKTLuXQel3jQJTkB9jlKg87mnH2z7C96lHuLzRQSq2oXhli2VXdFl8qWRISRTua5GKJiLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6S/Elf97FoRfypsp78D5nt/UgkEyNXhoULjvdQfWl/AHd+tCFGRsFjmD95kTknYuFUmfLhuKXea6NhDdXTlLWLSY3T2+w5m8icvkyQZD6ymO5XvgubNbWz40pFak93nhwdJ/KYiPIQAt3nnYtzewQp2Du/YH+SGBwZ/x/9/qkbqbrNWqLNHo6eaB0yGd85omL58bKsOWzU8XGEfa7AcvmZxJ93lMHqyJY4Jumi0Zp6yOcm3UD/3bW9NF6DGbiWRZiG9pM9+zHEad50KZhSN9sNMPhidfAFf5u22/0S+15b+gvfWIX//h7WMHAkZ+mytjUn+8iF6fQxNyLX7q7PMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOeunrsjP1nZaW+DLJHQ+Z0jzivpn/v68lRbvAtK0V0=;
 b=liVk+XaS/WYru8IHD7c1L/H9A3boTPJIbtRNLVXbv0hvIg1216PvIo9pHnoNQeOATVREofxmiwmIkYZo6VCa3TgW11XlKnQDlOCP6+b/TWpwKpx2ickXv4TVnEGNICWrvHKjJwcFOtawUE44kcCryZL58UI4AN0d6PD/XpIsrhqARDwAX1Ck0rleiSkZndIT6oxYAZOA4xS+8Xw1XJ7XngwlmLwncboNu6E00EVAi5ssOvVFurkXgrmRKxi9RvFxbbGT+je7kGQFfKtkyWJ9jUPHTHadC/CxFtManszbK/xUpvnM8kxpW54eGGNI43TaL+4XB+3TADu6SAgTwNg8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOeunrsjP1nZaW+DLJHQ+Z0jzivpn/v68lRbvAtK0V0=;
 b=D9u/0X3KZSIBg6Zb7nMYNMSmqPsS6BiYNnPVVEye6fJ+QlSCW949gwfB6c2aIS/1r1p05sYvzHzyDjxqtgTH93y2qBLYCNpfts4CgRKTLuXQel3jQJTkB9jlKg87mnH2z7C96lHuLzRQSq2oXhli2VXdFl8qWRISRTua5GKJiLY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Topic: [PATCH v3 2/6] arm/mpu: Provide and populate MPU C data
 structures
Thread-Index: AQHb2t5PH46Li7ClPkCuT4B0B2toC7QBPMgA
Date: Fri, 13 Jun 2025 15:39:20 +0000
Message-ID: <067962B3-7AEA-4A4E-A55E-1BEC66132706@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-3-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GVXPR08MB7727:EE_|DU6PEPF00009526:EE_|AS8PR08MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f7879-8271-4ea5-8eed-08ddaa908c6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VUlNWjFTaG1SbzJ3WVZvMGVmRXBNMys2VjFZTytyRTFSamR0RDYrWm5SUzA0?=
 =?utf-8?B?R1A5Vy82aEpyYWFUaCtVTWppTUJuaHlQQXFqUDlGeDQvVE9EYXJ2OTFEVmsx?=
 =?utf-8?B?TmE3cHV2VHQ3aVh2aE5Bd3JpZE9XbXQyOXdPazUzRXltUGJQVDQ5U1NLMVJO?=
 =?utf-8?B?V0o0bUJhYmgybmlDQTRJc01PTlV2dXUyeGdSc2xKSUYzSFUzajhYRlUwazlt?=
 =?utf-8?B?aVZ3QzVFSFRPd1RPcUVucE8yV24vKzNpL2xuTkxFeUdlMG53NjRibTY5QTdw?=
 =?utf-8?B?ZkNlRHFtSnpHSm1sSmtPck1jWWFKMU1nek8yeXlrV0l6TE5KY205eDNCdUdy?=
 =?utf-8?B?NzhpVEYrNm14ZVJzZi9VTUJqQ0pjaVFOU3NpK2JYdFA0YXh3YW9nS0VDVkdB?=
 =?utf-8?B?enpMVm96OE1qUzBaY3VKSmJ1d1dZaEpUK0lHUjhtZlk2VDYvR2ZoMGxmYmZ2?=
 =?utf-8?B?UUdCY3ZVbnpOV2pocXBabzFBK3pKOHhtN2RCZ0UxbWVoMmVocGgvU3NvYys4?=
 =?utf-8?B?UzUzNmxneUJzS3ZzRkNJOHdjMUxXT3UzM0VFT201WkczT3hEREQ2TTQ0QUVu?=
 =?utf-8?B?Si81Q3BESnFrQUlRcEkyS0xFWnUrTU9yQlh4cHdLWFovdjY3RG1BYXJOZkVt?=
 =?utf-8?B?NzhxNi8zeDMvYWYxejdTanp5enZ3SWptSWFGSDJycThWblBWZ0NlaWcxQ0Rt?=
 =?utf-8?B?ZW1peERiQ2ExTnBsTUVGZjd5MDJINjdPZFFjSVlZYXI3TDFUZlluZzN6TDdk?=
 =?utf-8?B?cFZLcnNsZ1BldGlNRnYyNXQzWEtFY2Y1ZU9Vc05rd2NGbDNBS0w2NVdYeXZj?=
 =?utf-8?B?ajVpL0FEdTZmS0EvUTBUSG50YUp4KzRQalZDRlpsVjlkbEdHUTNQVnF6Smdy?=
 =?utf-8?B?UzBkWWFXSUd6VDRKR2I1YW9GeXB3Vkt5eGswOXd5SmkzYmxkK1R0Ym1VazZB?=
 =?utf-8?B?eFM2ZVc4Z0M2VldYRFM4eWFPOGF3Vjh3UE9iRmNHUndoaTgwWDQrZVRkNnVw?=
 =?utf-8?B?cDVoWjhsNkQ3QUZUZTZEQmpGQkdzYTVJbmJFdmQ5Uk9laHFyWElEQUdEZ1pa?=
 =?utf-8?B?Y1BHbTg4YzNDVjJ5T3Zwd1IrRU0xWW9GS2kyRlYwSjNjMWprY3VIYmZRK1hH?=
 =?utf-8?B?MlgwcGxWVkxrUk1uZm9hNTU5WWNSSGI5YTUxOHpCSGE5dFowemwvRm9LK2cy?=
 =?utf-8?B?aElIa2dWZC9xb3haVnNrd0RDQ2xSR3hMOFVwTW9HRDRrSnduM0o3WXcxUUs3?=
 =?utf-8?B?RStGdlQ0TFZEcXkwZEZPc21LbTlkL043ejViRkVhSXo1UmltK29tckhJSTNW?=
 =?utf-8?B?VFpocVVuYkVYNW5BMW9KUDJnRVRBSXNVcUlSdDZ1TWdadnZiSlFOS3YrWis4?=
 =?utf-8?B?dTJSSStsbDV0elRjUVN1S1pSbnV1dVlEUmFCa2psZ00ybTMwdS9rb0lFU3BV?=
 =?utf-8?B?WGdROWcvS2d6UWpmeHVRQWVyaENuZHcvTTdDNW9wVkU3aHhyajg2OG9XclJR?=
 =?utf-8?B?d21GV09pTVBIcUxGR1Rhb3I4ZUp2d3V2V3VrYnRZck5icG1WaEwwdElDakVo?=
 =?utf-8?B?NFYvMzRDbzk5ekMrRG9xbDhnVWQ3VlVjUkRjdEdEZ3VGRDlwbGlDTXJCOU41?=
 =?utf-8?B?bnJERlpkY3dwY1FSeE82U2gvMW5MdXJ1MWhYTGV3OWc0eEdBM3AvRVFqR0tC?=
 =?utf-8?B?TFBLRzNMQzlKRjhhVEpQNGtUZk56aGowbHVQdENuSTlUSVI0cVVJUXh3OWRQ?=
 =?utf-8?B?NzFjYkRnOWNCRzVoVXdYeGdiWHpqbTc0WnZvN0lHWjgvV1VrT2V3OXZEYTl5?=
 =?utf-8?B?bnhwcUY5S2h1TlI1d0UxSVZtc0Y1TWNsOVloN0kyalVDRTFMbHpod3dRRURT?=
 =?utf-8?B?aGJyRzYwL3c3S3JVcUZzMklpd1R3WXNuaG5QeU8xTHhXQWZkdUpjZmhXblh0?=
 =?utf-8?B?ak1uZVVveVNzQVkrblVTaUgvcVBGc2dhY01ZdlE1QURUNURpaFZ6NGhaM1ZL?=
 =?utf-8?Q?kC9jnBFzLl+nA5UV/QVHkINAW6ZQa8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <15A125CA29888E43B27187718AE7BDC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7727
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	898f20ec-cf2e-4e7a-5025-08ddaa90774b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0ZHN1NMSk16aHFWNUtwVWFCUW5xc2loT3RrTHRVU1NVazZXWlNXOEJ0aVZY?=
 =?utf-8?B?TXdTQnNQaVFUYkx0U1c0ZlE3c3Q1T09ycDZ4NExpK2dPODc0L0d0UDRKQUls?=
 =?utf-8?B?R3A3ZjROcktjUXVYTTQwVFV5c1dWc2N2L2x1cWFhYmkrZ2tZTWdoRlQ3cHVk?=
 =?utf-8?B?OWliTkJyK3BVczhiRWxVdC9jeTBLOG5yRTU1YTNIbFg3R0hhRDkyRGdHaGx1?=
 =?utf-8?B?RW1SRG1OMHNUMkkzcUNna3Vzbm56WU5IaEdWblp0VmtNVDh2ZEF4UFZPSnJr?=
 =?utf-8?B?dmwrUnk2WmV0bzFQUENYRWdOUGxQWTd0M2duMC96cWFNMzc3UnpROGVteXht?=
 =?utf-8?B?YlFWNnpsV2RIWTNhMUdTVWNZUWNqdTVSTXJTZDVzVlp3MjNzUkYxMmUxNE5T?=
 =?utf-8?B?cExmNXMxdHlYMkhMUTdyNk9JQzZtM1VIT0pWbWx1SUlNUENHK3RXVXg3b1FS?=
 =?utf-8?B?aU84RDllLy8zeUl4dU9ycldZMEJMNjMrWjBMUlNEZVJ6eDNpSlh3YXFFclRB?=
 =?utf-8?B?V2lJWFFOc2tieE03M2FGcVkwSjRCMlFwQTVxUEFLN0R6aG5Od0MxUm8wRlNX?=
 =?utf-8?B?bG15VFNXZjEvKzJMbUFBNlZTY0NjdzdmNDc4ei9oSEJ1RkhYanJrZzRwbDJ6?=
 =?utf-8?B?RjR5d0pQY08vVnZjWWN5UXlzMXBEcjhndHErU2JzaWttTnFscXBVN2E1VUV4?=
 =?utf-8?B?WERRWFdZQnpvZHY0WXFJUThYc1FJOE51OHFhdzc1QzdlWWNIUWQ3amxXcDZ3?=
 =?utf-8?B?V1BDc0NOMGd6cU5EbEd6dGRFZ2JQNzVPeVI3MTZGdm1yK1Y4R0hUcUJPREpI?=
 =?utf-8?B?SjRaYXlmaVp2OTA0eXUzWHdJL2xpRmhPVFdCS0JoV3hFQjVJSWJWaVB1ZG5j?=
 =?utf-8?B?Z21Tbm1OQmJMeGphMjFrM3hVaXl6SEthY04zT1NEYzZ4U1VLY3NDSW5OS1Np?=
 =?utf-8?B?aGJtU1dHNzgrUnJDZXY5QkJkbHJSTFJrYzdWdXNReUQwTHgwN1Y5dGo2Tjcx?=
 =?utf-8?B?WHdSQjluN1lTM0FFSUFIWWtXOEsxWnBCWGNhQjBCZWNvQ0ZaTkhaelovNnp2?=
 =?utf-8?B?Y0Z6MnVlWGlta1paREJKeDhGYmVxZmEyWnp2NVdTTjMxZkpTaTZDNVhWbU5X?=
 =?utf-8?B?SjEvblhGKzU3L0FQZE5oNlhSVjVqZFl0eEQwWDFjN3JPSHc5aXFBY3hoREtY?=
 =?utf-8?B?SjdsRXM0dXlNdTM5eGg1MzM2UVNOQk9UaXBkU1hVQ2R5a3krMXJoRzZEcFM2?=
 =?utf-8?B?aDlRUW8xYWhqUSs5eURaaUhUSTUwWFd3R2tXYUJaZkpieDBYUmtlbXBpZEJs?=
 =?utf-8?B?bmh1Q2J5TFJvVWJjMjZRTVdvdXFyZDM0bXYzM0FmT2tYUWFsYkc4TnJHVHZn?=
 =?utf-8?B?Yk5lT0FlSFVQYnV2c2NrV2RvYzdNOXVPR0JlU2FjNGtGMjZSY0JVSi9hdWdE?=
 =?utf-8?B?cWlHUzNOYk00VXF6Nk5uTlFhR2tMalVBc1BBMGMxR3dwaVhRdEkzWVE4L3hY?=
 =?utf-8?B?UXZOQVJsYVRRZnEwdVBGc2g3SUlyV1daOUhOYmhzOFovZEJPS3JTZHVsMER4?=
 =?utf-8?B?UEYxY3R4VVhqb29QZ1ViN0Z2OWI2ZzE3T0o4WHdyaFJwaGVpa0o4RmwvQk4y?=
 =?utf-8?B?RmF2cnhldFNQQXNKZDNnUDdOZytabUYrTDNiMUJtdmhLTkJDbklEMWdvWkxP?=
 =?utf-8?B?QW5mYkpxRndFdHFDOVZoK3pHejZvV0l1ek9tOWhzajFTWDYxL3JvVnljZmZ2?=
 =?utf-8?B?ZldtZXB0Y2FwaU1xVDNaVnhRS3pxRTVSKzgwRVVFTXYyL2c3V0RpNDhKVDBF?=
 =?utf-8?B?RVNvUnpyV09NZFpWMzFOUVYyaS9nWkZGeXpsUDdmREJVVmxOcHRLTDVrbTVn?=
 =?utf-8?B?dE9TeVowdHd2bnZ1bDU0K2NCNFM2Z0lBWmluRVAyYnJFUnBpaE1DRkhRQU1C?=
 =?utf-8?B?dk13MkU4WTBTNlBjd0docEowOThhTzE4SDlLb3JCVHVPRlVzTjdMRXFobUd0?=
 =?utf-8?B?R2hKQkVoa083QTk2VHQ5dWVRb3p5NGtqR3dDU0p5aDJIbXV1eEVianNNUlR0?=
 =?utf-8?Q?1rawmz?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:39:56.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f7879-8271-4ea5-8eed-08ddaa908c6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6104

SGkgQXlhbiwNCg0KPiBPbiAxMSBKdW4gMjAyNSwgYXQgMTU6MzUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE1vZGlmeSBBcm0zMiBh
c3NlbWJseSBib290IGNvZGUgdG8gcmVzZXQgYW55IHVudXNlZCBNUFUgcmVnaW9uLCBpbml0aWFs
aXNlDQo+ICdtYXhfbXB1X3JlZ2lvbnMnIHdpdGggdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgTVBV
IHJlZ2lvbnMgYW5kIHNldC9jbGVhciB0aGUNCj4gYml0bWFwICd4ZW5fbXB1bWFwX21hc2snIHVz
ZWQgdG8gdHJhY2sgdGhlIGVuYWJsZWQgcmVnaW9ucy4NCj4gDQo+IEludHJvZHVjZSBjYWNoZS5T
IHRvIGhvbGQgYXJtMzIgY2FjaGUgcmVsYXRlZCBmdW5jdGlvbnMuDQo+IA0KPiBVc2UgdGhlIG1h
Y3JvIGRlZmluaXRpb24gZm9yICJkY2FjaGVfbGluZV9zaXplIiBmcm9tIGxpbnV4Lg0KPiANCj4g
Q2hhbmdlIHRoZSBvcmRlciBvZiByZWdpc3RlcnMgaW4gcHJlcGFyZV94ZW5fcmVnaW9uKCkgYXMg
J3N0cmQnIGluc3RydWN0aW9uDQo+IGlzIHVzZWQgdG8gc3RvcmUge3ByYmFyLCBwcmxhcn0gaW4g
YXJtMzIuIFRodXMsICdwcmJhcicgaGFzIHRvIGJlIGEgZXZlbg0KPiBudW1iZXJlZCByZWdpc3Rl
ciBhbmQgJ3BybGFyJyBpcyB0aGUgY29uc2VjdXRpdmVseSBvcmRlcmVkIHJlZ2lzdGVyLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFt
ZC5jb20+DQo+IC0tLQ0KDQpUaGlzIExHVE0sIEnigJl2ZSBhbHNvIGJ1aWx0IGZvciBBcm02NCBh
bmQgQXJtMzIuDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFy
bS5jb20+DQoNCg0K

