Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E7D25440
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205323.1519624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgP9j-0002tK-4u; Thu, 15 Jan 2026 15:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205323.1519624; Thu, 15 Jan 2026 15:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgP9j-0002qy-1D; Thu, 15 Jan 2026 15:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1205323;
 Thu, 15 Jan 2026 15:21:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jd1q=7U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vgP9h-0002qd-6A
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:21:01 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9c36978-f225-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:20:56 +0100 (CET)
Received: from BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:20:52 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::17) by BL0PR05CA0017.outlook.office365.com
 (2603:10b6:208:91::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 15:20:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 15:20:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 15 Jan
 2026 09:20:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 09:20:48 -0600
Received: from [172.28.136.14] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 07:20:47 -0800
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
X-Inumbo-ID: c9c36978-f225-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3/aiv0CjILA943Oe+m+0rNs994WoeGGaaNTid+VM8aIBfXGVknLop+NqX64UFDIrEAzF3tf7LU7L8MHkyHOE1E1AMTbyKYfrYP4zb1pyhotQrgDoMfKBDKA5d+oL06Sxj0nL1tIyGffvj8PzSIL1oJ5zzapKjPnG9E5BASdU2yWM3iDdlgU6U4/Zoc/QZXm8AZgAA1WU6FsoBsI4djPlLUCFjUgnnIY58TZRWSvfW5l6H+U/F3a8Cc1LZb2A1wb1bEY9+AjGEYsmDBPozddBb4xGMcCnriDoDZxyRrvocwCwTC24dj4Va+topPblikGxACJa1rSmBbotgEtGzMyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT0YncTFlrxicix8PIWQyUS6zwBdKYeczTKCyPIeycY=;
 b=hoFVyBm1FjIgvLf8HGFLtbAX2KgHlMakLrFNOO6zgZXV3Y8d08yJPWBGkLSblt+h3JAqZXAzcvjw0N84+lUwMo2SoSoiskV4vI8FdgOlPyENY+oLApexrVNVjYxdbVDc5fvq5GwR7XaKdAat/c9dB+JH0b5NuHVw9vXLR+x7iH7EMV51QjkK2L3+PE9Ha3Qt+ydRml1/kXo+fAQMwIzZfoB2157oBDNRZajKGtDthFyXB4u84jHrOhrCQvmg+bgN3eGESKYovKTVd/ESpwa4Fj3bEAT3eZhR0Ejm+obno6jc4xU1MWe/DY1yxt/zod2WQzoosrjROgqPvpHmVmBy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AT0YncTFlrxicix8PIWQyUS6zwBdKYeczTKCyPIeycY=;
 b=Who3EB/c0i2hsDukJzlNYArfcRQ3rbgpFQC9XVPRaCsX3pZ+gHP88EAsa3JE9PoA7ur8Og1OxCZX7qgU6MD54N44JEnGQs5CbdMyQGTFfAnWkwWQxrLPm14NSv4zWm18mSGSHfnHMj5/JZnFNyvowSKIfIOXkUmsb7G6QNdg20Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f346d915-5da3-4a4a-9314-24af17f92718@amd.com>
Date: Thu, 15 Jan 2026 10:08:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/p2m: move xenmem_access_to_p2m_access() to
 common p2m.c
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-5-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260115092841.2651224-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: aed075ec-8b50-4dde-5986-08de5449aa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1A1V05sNVZqVDJVRVFUZ3BjQ3UzNnZJOTIvcC84Z2xFWHZqQUNWYy9pNEpk?=
 =?utf-8?B?bjRHaHZ2aEU4TXVRZWFRMnlVUWlYSjNadTQzWHBHVWhSeTZmT0hkUEVnVmhz?=
 =?utf-8?B?OEdJejIrUDM4UU95OUNPZ2ZWcmhUdURTajlBU3RVWDNjWWFHaCtLTGJVdXVM?=
 =?utf-8?B?MDdFVFh0TlZHdWRheHFCMmxYN1FHOTJCSFowUnE4bmxxTlRZLzdHSVdZNkQy?=
 =?utf-8?B?OWU2c3dLT2Rqd2hqZE9jWUpZQWlUa2U4ZWNpTElaZFNUTU9IZ0tvTUd6WmNr?=
 =?utf-8?B?VHRHTWV1MlR3OUJtdzJJMFdJZ0tFNEJBUU10NXlZM20yTlFaMlNWU1BBSXkx?=
 =?utf-8?B?R2NpRVowWHRaREN3elZTdE1nNXBIeFVMdTJYelpwUDlIRVUzcmxmUTZ0cEF3?=
 =?utf-8?B?RGUwWDBrMTIxUXUwcFVNVmlURVlBTHRKbVVCd2UzWFFVWjhUais2Z3dRNkg5?=
 =?utf-8?B?UDZnVUF1WUkydFBSVGptZGFYVmhwV1hsWmlBNTltUUNMUjJNV3hPTVA0cFFV?=
 =?utf-8?B?dFFyalp6Uk11Mi9BN2hPSm1HSlZ0bThxS1F0VHE2RHkwcTZ2LzNlQ2p5N1hL?=
 =?utf-8?B?bVNnRmdVb1p6TmQ5dGpaU0FiSXM2VjFmcDdXMldQOEwzaXc3T3lSYllINzNN?=
 =?utf-8?B?M1VXNmVuck1yeUdKODNEeDVlbUFIUnJMOThpR1FZQVI4SlNkUWJRbzRLMFhI?=
 =?utf-8?B?b1dPa0k5bGN0NUU3akhoSDByb2U4dm95U0czbVNmTEJHa05EQWtnVUl3bWx4?=
 =?utf-8?B?SDh4LzNnb2J6OUtva0ptWk1aWW1JNm1leE9xSmViSG9kZFFxbjBiczVZRXor?=
 =?utf-8?B?RFJWaXRrZS96bG1vTCt6WUNTZDVnK1g0cXo3eC9SbEJYdmhvV3g5Rzd1R3hl?=
 =?utf-8?B?RkZaZjFtNWd4R1VES2wvdWJCVklXSHdpVlU5UndzMUZkMWNOZ2JFaHpwQjY2?=
 =?utf-8?B?UFJDb0xtK2FZcE9mOFRNWDdqSi85cVVtdFR1WG5DZmZPVFl2RDNMVGpLTUk3?=
 =?utf-8?B?RWhTUy9JMWRXSit5OXEzQ2NKOXpFOXF2QUZKOHhtdVI3WW9CQjlGb0xoTjRo?=
 =?utf-8?B?RzA5ZTI1VWY5UWt5R2xQNENjZGtueXRuSk9hbnYrTUlNNWFzaHhQelFaOE42?=
 =?utf-8?B?VUtrQWNkSE5iSHNkQ1hwK1BqK1BXY2xHWEtUU2dSdERXV2xwSmZnSXN4NFVE?=
 =?utf-8?B?Zk4rbDcwOUFRelU2U0U3SEk0bWsrSGF1SEVVUGZ4SGNJcTY4WmJ3THVmTC9x?=
 =?utf-8?B?bE8wT2JVb0RrTTZmT2hrQWlVOFQrMVlyUnNHL3Q0d3hZbFR3ZGtCSVIyVlR6?=
 =?utf-8?B?cGp6dGVNMDh5TXlyanptV2dTNzVZYnVqS1hqc2Y3d0VRNGhzRTlLdFYzUVFI?=
 =?utf-8?B?ZnNXS09KcGJNc0htdGZFb1VYUFRLZkpBYkV3OEJLcHNlYjhMTnFiS09MS2Ro?=
 =?utf-8?B?VFNnOU00UlRFN3h6SkNpbHZaNUk1K3Q4RFJMdGdTOHpLcXVxWU53YUJwWUpl?=
 =?utf-8?B?VTZDd2xCQ3F5MXNqMEZlRlZEckRUVWdnc2NHRUVLbmZWV0VJZjB5bjAwaWdy?=
 =?utf-8?B?SjJrMURrVDI3RGtQZFM3bDlObHZ3elRBUEdUUVNnY0U5TjhUcWNJY1NwU3I5?=
 =?utf-8?B?SDBiUzVYV3ZUSTVnQ0dpZnRqUUIzekRqbVg3QXZ5RVpLZXFSY3NYNms0ZjVV?=
 =?utf-8?B?YjVqaURPQU9PckV1NC9nN3o4cWRnemhQUHdZaDIxU0Q4aVRHMG9hS255S01Y?=
 =?utf-8?B?ZVVzcklhMWhiaStYYmNUaXRjcm0xNUc4Z280M0VkOHJzV0dOdU9ORDdaVzB1?=
 =?utf-8?B?TWZSMkVQOVhsSlk2eHdQNG02cUZ0UnNBSUxXYXBtUnFHalFEY3kwQWUxYzlP?=
 =?utf-8?B?eldIRHdSV1l1VVBnSGF3bGdKZmI1WFc5M1BNM3RKVk80NXRuVmJqSWxvVXRm?=
 =?utf-8?B?OTNRaXBZTjdpNHYwTW1sVmpyeHpZVmpmcm80ZTRYcEdUOEpiN0RwSEtibGxI?=
 =?utf-8?B?aWhDdW1rUEpZSUI3VlhuS2YySWM0M1lXR1ZCaVZEcU5WQzhGK29uQXEzb2dQ?=
 =?utf-8?B?d3cyeVorTlNkWTVkYS9EMnVQMW9mMnJUcC9HTlBZbUIvbkVaeFN6WlRnZTY1?=
 =?utf-8?B?aGhBVm5XaTRYb1BiSFlaQVRieUlNTGdJYUdWeXZvWTB5QmREeFlnMlFrSFky?=
 =?utf-8?B?ZFV5cnprTUFZMFBlNUZkaEx0TDNOMGoxZ3JTUlIwMmd6WTBlL2NMSnczMVV4?=
 =?utf-8?B?QXRGZmpNT2lXZGdyTlNHMDRsU3N3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:20:49.4881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed075ec-8b50-4dde-5986-08de5449aa0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525

On 2026-01-15 04:28, Penny Zheng wrote:
> Memory access and ALTP2M are two seperate features, while both depending on
> helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
> other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
> Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise it
> will become unreachable when both VM_EVENT=n and ALTP2M=n, and hence
> violating Misra rule 2.1
> We also need to move declaration from mem_access.h to p2m-common.h
> An extra blank line is inserted after each case-block to correct coding
> style at the same time.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

