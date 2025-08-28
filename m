Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64791B3A451
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099413.1453307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureUg-0005Iq-Ln; Thu, 28 Aug 2025 15:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099413.1453307; Thu, 28 Aug 2025 15:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureUg-0005Hc-J6; Thu, 28 Aug 2025 15:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1099413;
 Thu, 28 Aug 2025 15:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zcYL=3I=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ureUe-00056P-Sg
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:24:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2417::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234c38ad-8423-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:24:50 +0200 (CEST)
Received: from CH2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:5a::26)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Thu, 28 Aug
 2025 15:24:46 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::f3) by CH2PR08CA0016.outlook.office365.com
 (2603:10b6:610:5a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 15:24:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 15:24:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 10:24:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 08:24:45 -0700
Received: from [172.20.185.149] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 10:24:44 -0500
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
X-Inumbo-ID: 234c38ad-8423-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd795vfGt+npyF8Gmth+tyClRemcXg8E2fTs+jK7kA0YxQ3o5x2zo30po9tW1sYbvYlvZmzSGi/ZFIW/yQ/BeUPKGxu3qwFi5iZfvnxUmDCdlyFR2eTrk4WMq4pMaMqq8sni48jzB4EshhuPOxbgeryRgon2AHAj3Az5hW71sF7IaRXNiYUiRiLb2jtIFVe/itaqfeCOXZL6uoYhmGzFM3WxoMXTmPaIBBoVoRPq1u81zzSliskvsJcVFpxL2z9yllJTfVOKXIRjW8EYU1V8NZt+G/pRVKyJu1LvvoUPdMI4p2MBBzmG0lvdXarybhPaotUwiP5cwT0Mu2Sbb0rIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsjStin+qEOYqvova+nacGlf0aAi2wYHMPXpupURFgU=;
 b=TwGxZ6bw5Zt3YrSmTS7edrWURK4xQvAgBHGwR/BVZ7zs9foH+qWtqdyzhjDk3W/Xqr2y9SKQf5CcQmLRiWHzVXnrrDYJUtNbKD6UpbXmZ0S7A5oTRjhjVuR41zEi/a8CuWDI7RbE4cjnLe4ZqXp5T9vsiYKnpoOw2TZRLiZakdyiYPsTfluDlA6rnjc7aEGju6mTVzthYNzMCBkDp0vskSxcv11ogWntAXk4Ou294wfQYgj1agIlueSEDlTaVkpf2FNi9Y8BU1pXVQLViLY/aeJXYX6yqQLpM8dvEoF8qG2PnY7yodA+7MGyywQ9DCiw5lZxOnEZZCRBq/yt+RcaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsjStin+qEOYqvova+nacGlf0aAi2wYHMPXpupURFgU=;
 b=VsHIB54FYN6jxzFV/wQdrGuJof7uyjJh8AzPvLTTLrgedxKaxPOlFoXAKNpYBqzXjnd5iFFDQUSuOYbm/bHXJWnb7tXgM5q5qwoCI56SIxV3lbtuqxrQxuiSgo/MgFZX5sq1iQiSzEphN4g8Zv05k8l+2lIfbKnXRw31gF0Zekc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c7efc9ee-d2ab-4960-9670-d2a63b992141@amd.com>
Date: Thu, 28 Aug 2025 11:24:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
References: <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f2aba2-39b2-466e-0642-08dde6470522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0EzVjZLenVKeUlRbEZFOE5mcmZPdzQ2MGJGb0IzZG95cy9NMWFubjdUMkpo?=
 =?utf-8?B?RFBTRnJ0RmFtYmczUWl0Z3hSV3FHTlNWLzNITG13d0hIbWFta2M4OXRxVjBa?=
 =?utf-8?B?U3FXQ3lBdlQ2TVVkNWNFRW95MkNBUkhDN05LVWloU3VZRnVuUURLcVQ4NGd1?=
 =?utf-8?B?cHRvMytPSlhMOUg1Z2w1Tjk3V1VLTlNiTFpWVHFzY0hsOXhScDhiQW83bTAv?=
 =?utf-8?B?dmMvTHRWTXlGbjgrVFdob0FLaW1VTExPQXh0SXdrdjh0cVpCenMzU2xsQ0I5?=
 =?utf-8?B?QzNEMTB0RFFMTjRIeTVYbit4c2E1OVBsVjMvUkt2aWpyZVF4QnV2c253Tm5C?=
 =?utf-8?B?TDZTTUM5TkJPSk9Lc1VvNEJDbExlUVZXaGk3aXpDbTJLdkFmVlhqMHB2ZTVV?=
 =?utf-8?B?dUZVTk5uLy82Mlo2RGJGc1p2UVhHMUZWeHpxa2U1ajJaYmh4NkFQUUoyaGJ6?=
 =?utf-8?B?T1pZbkt5MW4wQTZDRVRrTGFJZG12L0p2LzkxV2MrY3M5WHE3Njk2N3U1THpL?=
 =?utf-8?B?YlllVFBCUkU1aXQ2UGgvb3Rrb3J2R0dyVEVxU3RQWmNneU9oSVZRNVBSUjBX?=
 =?utf-8?B?NklZQzZlcjE4L2JNL2EvOWNjVlExbktnSWcxeFZNUHlGYzc3ZExCS25vWk54?=
 =?utf-8?B?ZWFRbUo3c3p4bEpNMzB3V1ZFSXZpM1B1MHFCdUJzNE94YzRWLzhXS25Ra2V0?=
 =?utf-8?B?N2hMQitRdFJhOFNhZWxobTBsZTl2SEV0Z0VDRmRkODNvSjFiL2c5TGp3TDBu?=
 =?utf-8?B?UlBSaGcwaW8yUWJwOWZQQnN2STNVTlpuMjN0bGM2R0VYRVI1cXlwWFE5S3Ru?=
 =?utf-8?B?YVRmaVpLbXNIMldVdVRXOVZJUndhSUpLY0ttNDgxOFFlSjZFLzY3bUNPZjBw?=
 =?utf-8?B?UlAzQWI4UjJob1hhQXBXeHVJWTU5Tkdzc3dRMy9odEtrMkU4bENuUTRsdXhs?=
 =?utf-8?B?dWFxVmQvck52UFpiRWRiK2s2eStILzhHdW1CalNRSElYaURWa0FBOGtGVlB6?=
 =?utf-8?B?a3Q1ZjdGc05HbFo2K1k0T0J6dkhudWljdmR1ekNNMkhmM0FCTUsrejBJT3M4?=
 =?utf-8?B?RnM0eWw4cnRkcFptREk1SzFibndsVVZaUGRrQjJEVWVCSjZiQk10VnlhaElr?=
 =?utf-8?B?RU5DZDZWV1BOeTNEdjF4R1Nod0dKNlZSSDVZbzVRMXR2aGNucGkzOGNkeERO?=
 =?utf-8?B?QTc4MmVHT1Zic1pYcFg1Ui80eVlHZlpvV3JxSzJyay9ITzB6cW5uTTdrNTRC?=
 =?utf-8?B?QWxRTTRPMUowNFN1NVc4MVc2Q0lhYTVPSk9WcDZlVXgybGd0LzhYeHo2TTd1?=
 =?utf-8?B?ZnRma1dDZktVcUdsbjVMNkUwbzh0bDdjNEk1MGptQUNRSWVRdHJwaXg3amJU?=
 =?utf-8?B?eXJBQ3paMU1WQ3hKY25QTEVtQVpVQ3JFUGlrUUowYkVTRnFWd0tvdmtETlBN?=
 =?utf-8?B?TXR2ejFZNzRWM1F4aHI5ciszVVVFeXR2cHJhT0RCdjhZaXh5ZnFMNU45aWlD?=
 =?utf-8?B?Mlh1WlFPVFZzWW95emtudVJFQkJOZmhzVGdld3NGOC9NMkpiT0Vzd3M2VkJr?=
 =?utf-8?B?Q3hYTUU5OEFNaFdMazhnTzBvOGZMc3BRUS90VGdBM2c4SGFkM2EvT1UrUjQy?=
 =?utf-8?B?S0xSbjZHZWNlUm1sRWZESCtwRlArbEpZWTN6UXcxK3lHRGpMYkgvZjQ4RVdx?=
 =?utf-8?B?cmRHN1RiQ0lHQnk0Z3krYU91bHZpWTYxaFV6eEFjS2Z4UVlMQVJkcms0SFR3?=
 =?utf-8?B?WWZUL2ZwV2M1Z3g1eWg0MGhjTlh2Yi9xTmJ1VjNRdmwycWx6R29uOXZnMWlo?=
 =?utf-8?B?WXpDSTBWRDVTSDFTc3Q3VjNuWjdMVnJzVmdSYmlvNVdKOEhlTjVWd0lwQmpO?=
 =?utf-8?B?a0o2ZXdIMGEzSW5kdlZMYjluYytTbzE4bkszRTJjQmk2ckhRZ00yQnRwSTRU?=
 =?utf-8?B?UklxcEZVQmJLSFRNZkVqdjJOaXIwczBGU1BJQ1ZNQ1ZJYkxaQnVDdFlvQUwx?=
 =?utf-8?B?NDRleVJJcTllVnhBZ2daamEybXZNblZLSXJDOERDajlVaUVNdGt6ek52Zys4?=
 =?utf-8?Q?EQcp0C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 15:24:45.9104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f2aba2-39b2-466e-0642-08dde6470522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

On 8/28/25 05:39, Dmytro Prokopchuk1 wrote:
> Fix an issue in the 'fail:' cleanup path of the 'assign_shared_memory()'
> function where the use of an unsigned long 'i' with the condition
> '--i >= 0' caused an infinite loop.

I'm not requesting any changes to this patch, but as a separate discussion this
could have been caught with -Wtype-limits:

arch/arm/static-shmem.c: In function ‘assign_shared_memory’:
arch/arm/static-shmem.c:188:17: warning: comparison of unsigned expression in ‘>= 0’ is always true [-Wtype-limits]
  188 |     while ( --i >= 0 )
      |                 ^~

It might be nice to add this warning flag into the build by default, but there
may be other issues that would need to be addressed first. Having the flag at
least for the release build would be nice, since the debug build may (or may
not) have justifiable occurrences inside of ASSERTs. Again, I don't mean to
increase the scope of work, I'm just making an observation.

If you're curious try it out, add this to your make command:
EXTRA_CFLAGS_XEN_CORE="-Wtype-limits -Wno-error=type-limits"

