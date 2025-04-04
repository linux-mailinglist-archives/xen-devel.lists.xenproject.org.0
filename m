Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664D1A7B99A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 11:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937967.1338810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0d0h-000233-6o; Fri, 04 Apr 2025 09:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937967.1338810; Fri, 04 Apr 2025 09:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0d0h-00021e-42; Fri, 04 Apr 2025 09:06:47 +0000
Received: by outflank-mailman (input) for mailman id 937967;
 Fri, 04 Apr 2025 09:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWcl=WW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u0d0f-00021Y-Je
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 09:06:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f403:2614::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec731b6-1134-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 11:06:40 +0200 (CEST)
Received: from AM8P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::25)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Fri, 4 Apr
 2025 09:06:37 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::a7) by AM8P190CA0020.outlook.office365.com
 (2603:10a6:20b:219::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Fri,
 4 Apr 2025 09:06:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Fri, 4 Apr 2025 09:06:35 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB9PR08MB6539.eurprd08.prod.outlook.com (2603:10a6:10:23f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.42; Fri, 4 Apr 2025 09:06:01 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 09:06:01 +0000
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
X-Inumbo-ID: 1ec731b6-1134-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aiVEdkTWp7tB/eTSMeNOyElyxAJmBNTBpwSL7sc9+YJIcgLqL2jLEetryubGTBu9R71QKwYE98TybsI75M3FndwlKEVQMYx+Le0dI4+ITqyUqfbYe33100wrVWV/xMjOpMDXrRchsiVjWbhBoCygBBngEeLNK999DMNccr2MiAjlLD5+QE028KxhnFeHLsN7/7YiWVnrdbVL3UiUqph9P8RXHgh11XwPHZElnZd9Avk/81BygnVUUKrDMc7+KHlz9/4n9YbfV+6do/hikLqUVYB3kT31Hq7HCeov3JeiGBvxLOIL/zn/2D0RQNk0+hzxW63dVkoq7FAntcv4JDUstg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgV7iPXptNhudm0tQwgC6iOh/l0dCTb0/mDc2I7DuwE=;
 b=AghH92fUuU317zz0CI0IqRzPmMJEQxhc3WKNcvtiHCuTm4/XzIZk51VmInl/G4No1k8zok48qQuCSErlcQQ3NcJ1AKDG1ZHntY/bX4L5FGrT+jawLgrTMiOu/9J4spc9BOI2iO6UZSuPDHPU1aX2/7IiGaxshMAYN5NvX0fJE7OH8tDI8sdWUHDDFXpk5hRa3fv/eAbyZrLG6w8NAH88WQENnTawhDgcz9MIR+Pgngt3sBUOy3pNRNGzgZQGOpzHh0qj+wKkX9A3BdaauujVehBxvbnEHHHwP4BOKt16GqOkcSOw/Q3t1RQSzLmPQiBIXgDnDnA59ivF/5RjwT98/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgV7iPXptNhudm0tQwgC6iOh/l0dCTb0/mDc2I7DuwE=;
 b=WOPcGitB2lzlqTbztayLRnsHCTFW2ErrnP0uPKSLa9mgDGm8lyXnnUGX+fofrYRpDXrOuw2ozCTxw08DeTTQM4ym99aD00Zo+zd5Ze+oTDoi033jfQXKOvT4VRCtiR59OklyFHmu8noIkk/dKr//9CiKGo0NCsJJSm8nnXTRTgE=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6gTRkhpuQtfwFL3pF5lV3RoDwmpxzHrdrScWyZ6jEtec2+nF+Gy7IuLDsKcau3F+KM2m1uE8uW7JMgphXBXvVzNa//b7cqtxA/D2GbwawAyTyBF3GX57OUERcr4feZSYKUQptkI1rhJa2j2H2ypWA+67QX5N/3RmxTQmQV+tbXWsqYEOg1mrrMMU5F/nqEYaKsTDLtPeT0NXKXSM+/XMXIZBNLZ9mHkWU0MpYZmmbm6pN15pNLcO287HH9hAxUSUsJ4voQWmNMgCAwdYOhZhtb47rftFlXtvW6B1qddcQafIDeiJHuIIV3esr6i5REs6r9CGE5L9nvkWBrNJ88bYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgV7iPXptNhudm0tQwgC6iOh/l0dCTb0/mDc2I7DuwE=;
 b=wg8N4L0oSMXugKXx7h7HEKbDP6p02T0GE+RHnAPCrbrwwSNA3KmbEy5lEMfqyJ7MDJJtuyo3f4M63EIL+UWgtV7BLbdnkoLYIONTm+dDC7XMBoD023ImQendsjc5khDlhHAkT3Au+mSemClXRRi+Sixlj/xn6xxAjzj6+0jltPA3GP/8Y3Uqqx5gxk4w/u6C10PxfS2a5NG2jF1H3hmcem+u6fjTzHprbBeaJq9Ob6wENh2erRxqyu0+MImZ5NloX6/F8Ew2/cEbfAPcDrL3Em/LVewvNMuoX6hIJPricatCYEFTMa3toZREjjUWNY5EpKpNXac6Lo/0dOli2eqEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgV7iPXptNhudm0tQwgC6iOh/l0dCTb0/mDc2I7DuwE=;
 b=WOPcGitB2lzlqTbztayLRnsHCTFW2ErrnP0uPKSLa9mgDGm8lyXnnUGX+fofrYRpDXrOuw2ozCTxw08DeTTQM4ym99aD00Zo+zd5Ze+oTDoi033jfQXKOvT4VRCtiR59OklyFHmu8noIkk/dKr//9CiKGo0NCsJJSm8nnXTRTgE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Thread-Topic: [PATCH v4 1/3] xen/arm: Move some of the functions to common
 file
Thread-Index: AQHbpLu5pa88e8EeQkugLRqmrl+P07OTN/eA
Date: Fri, 4 Apr 2025 09:06:01 +0000
Message-ID: <C6C24096-2BCC-4D09-A20E-AAB1FA923A18@arm.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250403171241.975377-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB9PR08MB6539:EE_|AMS0EPF0000019B:EE_|DB8PR08MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: 739a3e9b-5145-4c9c-ba4e-08dd7358003d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?a1FpZWU0WlFMby9XRFFrSGc4ODNLRG9VS2IycFRRMjZEYzV3cDZOcGtRWVQ2?=
 =?utf-8?B?MlRlL2N0K0VacFp3aFA5czZQeGg1UnFXSWJyeWF3V010SmU3NXVDYlM3NFkx?=
 =?utf-8?B?MWVKQ3M0RkFKZjdJVEFBWmpWZ052SHoreURuV0NDR2R2ZkRsb3ZxUUtFaS9k?=
 =?utf-8?B?TFVyaXcxSWNidWo1bEVYQWhoT3JHUHA1ekJiZ0VHaWYydEprMFAxU00yTWtY?=
 =?utf-8?B?ZTk0MmFtUUp5T2xLVTdwdEhwL25QNHVWdnAxSjYyVllZSi81OVNabHVRaEly?=
 =?utf-8?B?OE9BQmRmVllnZUxVMUVVTFlJWU1TMS9XaGtDK0hpWWdhU2tSeVBKWWJYc3g5?=
 =?utf-8?B?N3NlWFRrUWhTVklPR3A1M3lPNFlwYzJJTm9ndDJ0Ym9SU0pJczArd1VsUG9s?=
 =?utf-8?B?L0JOR0RtTUJmYmppaE1LeHdjRHdBQlh4SU1PTlc2Z2k5K1JiVDFySzFRRTJC?=
 =?utf-8?B?VXMyR0dyTXJIcTNpSTJIQjZEcHFvbmlKVXp4ZnU2aWp3UnVQUkdxdzR0SEVE?=
 =?utf-8?B?UitIWTZxSkt6cHdJenBkNkRxdFNETWxtdlBMcnpXYWVqOVpyTms2VHRtOG5S?=
 =?utf-8?B?Umh4SnpiUjVJMjZKc0N1aXczSTVHMGtEWWMwcVZBbnRsK3V1QzBPSG05ZmNv?=
 =?utf-8?B?WUF2czdaU244MG94ZGI4SnQ5ZVdreVZTNzBqek4rOEM2b09aUXlBWHdsM2hC?=
 =?utf-8?B?eTVOdFUxeTJDZlZYemVlajl6OHZiZDE5NDNlaGhQdXVXcVhvOWZDZkZmSFZM?=
 =?utf-8?B?b255Q3BlcHFOTExISFFJc1FNaE43cDA2d2RuY2N3L2JIMStVVVpmRjlZRWlp?=
 =?utf-8?B?UDFVTWtQSGQ0bndDYktsa1lBWlFXb1RaeXR2OThBUXEvdkxDbTVTRG0xWFZE?=
 =?utf-8?B?RGpudjVsa3J2THdZYUw3OEVmNHUzRmZwbzJwaWFiUjdRT0R0MjFrN20yMzRJ?=
 =?utf-8?B?aVZZMlVaclZHNDdFZUxiRDJzSGxEc1lTTVhPWW9OTXRnWm5vMHFTRzM4cDNn?=
 =?utf-8?B?NlU4WWtxS3RiN0N6VWx0OWcxU2Rra3dESVFkY2xkWmc2TmRNdG9jTllHakhD?=
 =?utf-8?B?RHBWMHFvSExCN1BlOXgwTWl2TTNNM0p5RmVwc3VYZUc4Q0hkM210U1I2Mms0?=
 =?utf-8?B?Wjh2ZHhUWmcxcWVyU1RFWnlQMXhONWtwaTA1SFRTaDZoV0dVaVNQS2ZpQWYr?=
 =?utf-8?B?YVhQeDFiK2NING9DbTdRaGtGektQT25hY0lvalhrbDdsRTRycVR2TTArVEx4?=
 =?utf-8?B?djZnc2RMWHVFV1l4WHNkNkxuY0Q4aVoxV2lRYXJBUElmdER4eXZQSVVseWNk?=
 =?utf-8?B?cVM4cmdiRDlwRUd2MGJxNGxIcmNIYzhtWkwwdVBkNnM1MkkwWDRqc0lXbVh1?=
 =?utf-8?B?dFlGUHFmZ0treFUxWW9KQm1MNUViZmt2alhtYlAvc3lteHA2YzJHRmM4TUJy?=
 =?utf-8?B?Yy9vaW5lWXNBNWR1YmFkelF2bzVoeWxTMkVsQXFlSE1RYkt6RnlrcGtDOU9z?=
 =?utf-8?B?WmowNDhMdTlrdXYyYnNpRTNwRWdLeUdWTVRYNVAvNmM2UW9ralNhNW85T3N4?=
 =?utf-8?B?THdUM0pRaUIyK2F6SDFGeThmL0FWZEc3M0M5eVBqd1hsRTZHS1JWcnhxeFVa?=
 =?utf-8?B?dEJkcWV4c3ZLaWhWbjFrc0IxbWt1UTFqNHRLazFJTHpPNXgyRko1TUZyL25z?=
 =?utf-8?B?eDd0cmxKNkR5TGtmTWluS3grNWswSUpCR0hLU2plYWEvaGlraFFFYTZRREkz?=
 =?utf-8?B?Ny96SjlybmFSUWY0U25aM04yZ2NqaGdDUzg4eTFHdjluc0JHQlB2MkJ0SUJF?=
 =?utf-8?B?cHpxbURyTUd2WndubGo0YmpnZnJ0TDg0Q1JzenoydHlBR0E2bDRlbit2WjZ0?=
 =?utf-8?B?Y2Zzb1B1a1BHMkdOMmY1NWphNEtqY3FrUmhwRlRiYklCMXRhSXV5RTZZRDdn?=
 =?utf-8?Q?NuR06B6RNtBQJDmbbQgeVMwihQtzlnL1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFF8BCE320A7254CA61DA64D99F4BDB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6539
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd2a46d9-713e-4252-892a-08dd7357ec09
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRyck1GSmhCc0h0NWg1WU5HYzlkVmUvK0E3cEpDQjRmWmplWWpycStxSmpE?=
 =?utf-8?B?UjcxNEw4NmExM2FhSGdnUWEwWVBHMXUzdHI0dGdDWkVxbGpvcHArMXpjUUN5?=
 =?utf-8?B?a1A3bjl1cnRLVjRzRmVwYUlPbVlaWjZTUG5JZVlmU29oOEJ0T3hUdWNTZ1dH?=
 =?utf-8?B?L2ZZZVdwd0FvYUI0dnJacWdabVY2RjhhN2M4a21WRTk5cHpHN1RYTEJWNWNW?=
 =?utf-8?B?eDk4MDVRSFE5aUxNNkY2OU1RSWVISEl5MXFXcmp3NkkxeWxNZ2xNK0ZhWXdE?=
 =?utf-8?B?MnAyRFVJVnJmR2dyMHhvVDNDc2VKdzFaQ3BzaE1Fc29KQ1U5U3gxbzRpeldu?=
 =?utf-8?B?RDdTNGhhTkVrRWI5L1U0ZU9YVWtOZUJzaVFUaEdGT3BGejM4V09WZ2FVME9X?=
 =?utf-8?B?UFgzeHdrL1dTMWxVa2c3cjgzTHhoYU9aMGlSNVVROCtEU3ExNHcxRExraUxV?=
 =?utf-8?B?WVZpaXJ1NGgrWVZ6b0FaUmU4M0diZnA1d0tqMWVTQmV2N1ZMNER2aENKaDJi?=
 =?utf-8?B?Vk1HQ2I1VDZkQmRaTWdYcDdRbTFSRFJyaUUvQ2FobUpLU1FoZ1J3OGRPVWE2?=
 =?utf-8?B?b0lMaWJoUTFLYVdVUnhpemtnVWJmaFErZ01DMTZBOFZEWWd3K2c4OWVOZ1dQ?=
 =?utf-8?B?ZUNWcHRHUnpySytMdURIU3A1TUZ1MEdiV0dMNlFWMWplYjZKVWhNVDNlV0I5?=
 =?utf-8?B?T2lmVmdLNGVYaVg5T043K3NnUGVPSy9oMTA1ajk5bW9pK1RyamJzMVl0NkJY?=
 =?utf-8?B?YjFRSEFkL0hPT2xmbzd6d0g4N1RtY0hhSk1rTk94bGhUS0VKY1VPakltcW9l?=
 =?utf-8?B?QzBkVjVDQ3VWd3hTOHo0RVhmeGF1bHhYUzVNQktnWEhSYWtyYXIzQzJicURM?=
 =?utf-8?B?bkx4Vk1ndU11eFVUWE5EeHBqbXBFTndBaDRPVkpuNytwazQ4VGlQcW0yVDNB?=
 =?utf-8?B?Yi80cHJCU3AvUkxUNW1wTmFtSTRyTTJIWHZtRWJXamxIaFZSTkxrTDZQUUsw?=
 =?utf-8?B?eEFpa3kzYzVsL0t5Zk4vR0ZYSitnem5wYXdHdXprNG85WFR2YmZ6S0gwVk1n?=
 =?utf-8?B?MXY2cTV3N3BmcHBCa2FZV3ZZc0ZvL1hWN3I0S3g5aW56blR1YlBEYnU5T3hy?=
 =?utf-8?B?ckVyaS92MVNUM0N6end5ZWx4QXljaXdxUXo3Zmovd1hkekR4S2k2UWhhaUwz?=
 =?utf-8?B?YWRRNnlKZDBPRHNXOGp1QkZHTEN0SGw2SUo2eUlqVkJzSWlVbWRDRmtQUjRY?=
 =?utf-8?B?MkdlTlZSWm9TemRoV3pqMnFtRWhRK2hBRlhKYml3TExQSTBJMk11RmlQSVpl?=
 =?utf-8?B?ekU1Tmw0UEg5dVRnZHU5QldNOHZaRzQ4NGllZnUzYWxpOHNXcFA0WFRtamFM?=
 =?utf-8?B?b3g0ckhicnA4MFcwT1dHM1VYN3NCWGhqOVJaVFpYaEFObUtRMHhtSUttUVRy?=
 =?utf-8?B?YmtGQk5oaFR2b25YVG1QUGZaeWVCRDhKVURzUVFZKzdYN09IQnk2ODk2WlR3?=
 =?utf-8?B?ME9kVDlOZ3o5T3lrd2htTFNORG8rc0hRaWdRek1BOFEydi9RREtDbm9seTEy?=
 =?utf-8?B?Q2lTNWswYm92amZHRGFnRThTb2MxOVJSZkE2eGVOK0lqY1hzcGtzdmhCY1I0?=
 =?utf-8?B?MnFpYktzNWVRaXU0cTBPaE9CR0piVUd0WXhrcnIwWXhRbmxYWlN0REhzeTJr?=
 =?utf-8?B?aGg0T2xTa1NaL0xhaGJlaGZuSkRwNWx5eDdrckRMNnAxZlhiNHBGY2NtOUkr?=
 =?utf-8?B?cHVvV3R6V09ZS2dId2xvNlVUdStka25nYUJZQ2JRblRpcWtxSlZHT1ZjQ2N2?=
 =?utf-8?B?UWZsaWU1ekF6UUpNanFKTGVxU1h4Rm1OQVhQZnBzbU1NSW9pTXkyS0dNbmkv?=
 =?utf-8?B?eUJ5NW1idEdXZzFYckl0OU1YWXRjbTM4Z1I1MTVFTjZWZGtMVEFXSkNyOXFQ?=
 =?utf-8?B?ZHZuTG03VzVCR1F1TDczMWhHMW93RmxLbjhwbFdRcmZrV0YwTnhQK1JKK1NP?=
 =?utf-8?Q?XVkMKTL89U+iBXqKpEfe3wJ0fLJ6ss=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 09:06:35.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739a3e9b-5145-4c9c-ba4e-08dd7358003d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371

SGkgQXlhbiwNCg0KPiBPbiAzIEFwciAyMDI1LCBhdCAxODoxMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQWRkZWQgYSBuZXcgZmls
ZSBwcmVwYXJlX3hlbl9yZWdpb24uaW5jIHRvIGhvbGQgdGhlIGNvbW1vbiBlYXJseWJvb3QgTVBV
IHJlZ2lvbnMNCj4gY29uZmlndXJhdGlvbnMgYWNyb3NzIGFybTY0IGFuZCBhcm0zMi4NCj4gDQo+
IHByZXBhcmVfeGVuX3JlZ2lvbiwgZmFpbF9pbnN1ZmZpY2llbnRfcmVnaW9ucygpIHdpbGwgYmUg
dXNlZCBieSBib3RoIGFybTMyIGFuZA0KPiBhcm02NC4gVGh1cywgdGhleSBoYXZlIGJlZW4gbW92
ZWQgdG8gcHJlcGFyZV94ZW5fcmVnaW9uLmluYy4NCj4gDQo+IGVuYWJsZV9zZWNvbmRhcnlfY3B1
X21tKCkgaXMgYSBzdHViIHdoaWNoIGlzIG1vdmVkIHRvIHByZXBhcmVfeGVuX3JlZ2lvbi5pbmMg
YXMNCj4gU01QIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIGZvciBNUFUuDQo+IA0KPiAqX1BS
QkFSIGFyZSBtb3ZlZCB0byBhcm02NC9zeXNyZWdzLmguDQo+ICpfUFJMQVIgYXJlIG1vdmVkIHRv
IHByZXBhcmVfeGVuX3JlZ2lvbi5pbmMgYXMgdGhleSBhcmUgY29tbW9uIGJldHdlZW4gYXJtMzIN
Cj4gYW5kIGFybTY0Lg0KPiANCj4gSW50cm9kdWNlIFdSSVRFX1NZU1JFR19BU00gdG8gd3JpdGUg
dG8gdGhlIHN5c3RlbSByZWdpc3RlcnMgZnJvbSB0aGUgY29tbW9uIGFzbQ0KPiBmaWxlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFt
ZC5jb20+DQo+IC0tLQ0KDQpUaGUgc3BsaXQgZm9yIHRoZSBjb21tb24gY29kZSBzZWVtcyBvayB0
byBtZSwgYnV0IHRoaXMgcGF0Y2ggaXMgaW50cm9kdWNpbmcgYW4gaXNzdWUgZm9yIHRoZSBhcm02
NCBjb21waWxhdGlvbiwNCknigJl2ZSBkb25lIGFuIGV4cGVyaW1lbnQgYW5kIHdpdGggdGhlc2Ug
Y2hhbmdlcyBJ4oCZbSBhYmxlIHRvIGNvbXBpbGUgYm90aCwgYnV0IGZlZWwgZnJlZSB0byBpZ25v
cmUgaWYgaXTigJlzIG5vIHdoYXQgeW91DQpoYWQgaW4gbWluZC4NCg0KZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9zeXNyZWdzLmggYi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJtMzIvc3lzcmVncy5oDQppbmRleCAyMjg3MTk5OWFmYjMuLmE5MGQxNjEwYTE1
NSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9zeXNyZWdzLmgN
CisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9zeXNyZWdzLmgNCkBAIC0yMCw2
ICsyMCwxMyBAQA0KICAqIHVzZXMgcjAgYXMgYSBwbGFjZWhvbGRlciByZWdpc3Rlci4gKi8NCiAj
ZGVmaW5lIENNRF9DUDMyKG5hbWUuLi4pICAgICAgIm1jciAiIF9fc3RyaW5naWZ5KENQMzIocjAs
IG5hbWUpKSAiOyINCiANCisjZGVmaW5lIFJFR0lPTl9URVhUX1BSQkFSICAgICAgIDB4MTggICAg
LyogU0g9MTEgQVA9MTAgWE49MCAqLw0KKyNkZWZpbmUgUkVHSU9OX1JPX1BSQkFSICAgICAgICAg
MHgxRCAgICAvKiBTSD0xMSBBUD0xMCBYTj0xICovDQorI2RlZmluZSBSRUdJT05fREFUQV9QUkJB
UiAgICAgICAweDE5ICAgIC8qIFNIPTExIEFQPTAwIFhOPTEgKi8NCisjZGVmaW5lIFJFR0lPTl9E
RVZJQ0VfUFJCQVIgICAgIDB4MTEgICAgLyogU0g9MTAgQVA9MDAgWE49MSAqLw0KKw0KKyNkZWZp
bmUgV1JJVEVfU1lTUkVHX0FTTSh2LCBuYW1lKSBtY3IgQ1AzMih2LCBuYW1lKQ0KKw0KICNpZm5k
ZWYgX19BU1NFTUJMWV9fDQogDQogLyogQyB3cmFwcGVycyAqLw0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9jcHJlZ3MuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9j
cHJlZ3MuaA0KaW5kZXggNjAxOWEyY2JkZDg5Li5iOTA5YWRjMTAyYTUgMTAwNjQ0DQotLS0gYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3ByZWdzLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9jcHJlZ3MuaA0KQEAgLTEsMTAgKzEsNiBAQA0KICNpZm5kZWYgX19BU01fQVJNX0NQ
UkVHU19IDQogI2RlZmluZSBfX0FTTV9BUk1fQ1BSRUdTX0gNCiANCi0jaWZkZWYgQ09ORklHX01Q
VQ0KLSNpbmNsdWRlIDxhc20vbXB1L2NwcmVncy5oPg0KLSNlbmRpZg0KLQ0KIC8qDQogICogQUFy
Y2gzMiBDby1wcm9jZXNzb3IgcmVnaXN0ZXJzLg0KICAqDQpAQCAtNTAyLDYgKzQ5OCwxMiBAQA0K
ICNkZWZpbmUgTVZGUjBfRUwxICAgICAgICAgICAgICAgTVZGUjANCiAjZGVmaW5lIE1WRlIxX0VM
MSAgICAgICAgICAgICAgIE1WRlIxDQogI2RlZmluZSBNVkZSMl9FTDEgICAgICAgICAgICAgICBN
VkZSMg0KKyNkZWZpbmUgSE1QVUlSICAgICAgICAgICAgICAgICAgcDE1LDQsYzAsYzAsNA0KKyNk
ZWZpbmUgSFBSU0VMUiAgICAgICAgICAgICAgICAgcDE1LDQsYzYsYzIsMQ0KKyNkZWZpbmUgUFJC
QVJfRUwyICAgICAgICAgICAgICAgcDE1LDQsYzYsYzMsMA0KKyNkZWZpbmUgUFJMQVJfRUwyICAg
ICAgICAgICAgICAgcDE1LDQsYzYsYzgsMQ0KKyNkZWZpbmUgTVBVSVJfRUwyICAgICAgICAgICAg
ICAgSE1QVUlSDQorI2RlZmluZSBQUlNFTFJfRUwyICAgICAgICAgICAgICBIUFJTRUxSDQogI2Vu
ZGlmDQogDQogI2VuZGlmDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21w
dS9jcHJlZ3MuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvY3ByZWdzLmgNCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggNjY4NzEzNzlhNTNiLi4wMDAwMDAwMDAwMDANCi0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvY3ByZWdzLmgNCisrKyAvZGV2L251bGwN
CkBAIC0xLDMwICswLDAgQEANCi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5ICovDQotDQotI2lmbmRlZiBfX0FTTV9BUk1fTVBVX0NQUkVHU19IDQotI2RlZmluZSBfX0FT
TV9BUk1fTVBVX0NQUkVHU19IDQotDQotI2RlZmluZSBSRUdJT05fVEVYVF9QUkJBUiAgICAgICAw
eDE4ICAgIC8qIFNIPTExIEFQPTEwIFhOPTAgKi8NCi0jZGVmaW5lIFJFR0lPTl9ST19QUkJBUiAg
ICAgICAgIDB4MUQgICAgLyogU0g9MTEgQVA9MTAgWE49MSAqLw0KLSNkZWZpbmUgUkVHSU9OX0RB
VEFfUFJCQVIgICAgICAgMHgxOSAgICAvKiBTSD0xMSBBUD0wMCBYTj0xICovDQotI2RlZmluZSBS
RUdJT05fREVWSUNFX1BSQkFSICAgICAweDExICAgIC8qIFNIPTEwIEFQPTAwIFhOPTEgKi8NCi0N
Ci0jZGVmaW5lIEhNUFVJUiAgICAgICAgICBwMTUsNCxjMCxjMCw0DQotDQotLyogQ1AxNSBDUjY6
IE1QVSBQcm90ZWN0aW9uIFJlZ2lvbiBCYXNlL0xpbWl0L1NlbGVjdCBBZGRyZXNzIFJlZ2lzdGVy
ICovDQotI2RlZmluZSBIUFJTRUxSICAgICAgICAgcDE1LDQsYzYsYzIsMQ0KLSNkZWZpbmUgUFJC
QVJfRUwyICAgICAgIHAxNSw0LGM2LGMzLDANCi0jZGVmaW5lIFBSTEFSX0VMMiAgICAgICBwMTUs
NCxjNixjOCwxDQotDQotI2RlZmluZSBNUFVJUl9FTDIgICAgICAgSE1QVUlSDQotI2RlZmluZSBQ
UlNFTFJfRUwyICAgICAgSFBSU0VMUg0KLQ0KLSNkZWZpbmUgV1JJVEVfU1lTUkVHX0FTTSh2LCBu
YW1lKSBtY3IgQ1AzMih2LCBuYW1lKQ0KLQ0KLSNlbmRpZiAvKiBfX0FTTV9BUk1fTVBVX0NQUkVH
U19IICovDQotDQotLyoNCi0gKiBMb2NhbCB2YXJpYWJsZXM6DQotICogbW9kZTogQVNNDQotICog
aW5kZW50LXRhYnMtbW9kZTogbmlsDQotICogRW5kOg0KLSAqLw0KDQoNCg0K

