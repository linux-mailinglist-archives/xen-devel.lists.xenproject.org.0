Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC308B07EBB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045703.1415897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8cP-0003LA-Sd; Wed, 16 Jul 2025 20:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045703.1415897; Wed, 16 Jul 2025 20:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8cP-0003Ii-PV; Wed, 16 Jul 2025 20:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1045703;
 Wed, 16 Jul 2025 20:20:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8Yi-0003uY-DC
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:16:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc80fe7-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:16:54 +0200 (CEST)
Received: from BN0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:408:e7::24)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 16 Jul
 2025 20:16:49 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::3d) by BN0PR03CA0049.outlook.office365.com
 (2603:10b6:408:e7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:16:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:16:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:16:48 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:16:48 -0500
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
X-Inumbo-ID: cfc80fe7-6281-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppLTjpPrC1m/6SGiDx4zl+FvCeim38w/Ne4vhXyminAaLvGVdMflgdWytFQquAM8lhyaqLP5Y231LiHSffTWt3MzUHNnHoKZjtOpijTZbRp1dbXu0eKXp3witMqB+HBCEjeGG16uJGejbJ/8dOm1qsYDN4e3asupScvhZLiQo51KD/XRgfRRJMpnPhwD5kx7Wzm4zFXzgpEV66awqcGC5MxtuRO+SLWerOS/WVw+u3wsxCepzUK1AhnYGN8TMB4+DwWcbfF4iKlo6rkGZmDdZsa3+hVFwxRTJrfYd3FoEQD6rutym2xybv2U75qo9VCFiTpr1AvWxNgdsF4/GNIt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAJMn6EwKQTDWUQ9IZSZ2kRVjC+n/8TyZxE1WeWBC38=;
 b=HYxANU+nx3wKSn/7D2al1Dua5AL8kC9omu+8hULVrYZIWUIMSY6hTDe8p2L1FLOO/jPKPSRTfXlnMRksNTKYesRxr4p6MmqJ740fZ6PY7b0oqF0nCGwNNaDG530yRt3QTKNLq96nPZcxFPSBQ3DEK+b7uTrZaqaqMOcmPagXoylUTQNfTH8AL/buYtH2nzkTauHBXO9qGFkmUJXG7+215ESJScOBkqsfh3inEbM/eXgGNilxovDQ2RUkTrxrDNCXy8J40DNeNzQQqwaN/GXNB3knHAJTTAt0sjq9OjxLaDiFt47zFmeuFBRxu5OfhMZrUGLdgYt/fYa6ZxcMZACObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAJMn6EwKQTDWUQ9IZSZ2kRVjC+n/8TyZxE1WeWBC38=;
 b=NZrjOng9+k80Z7T8URFweI0UKP96lP6wW2uGVf7Klv7EwtUbWJ2B90SyPrgylyxxzaTf3oKaMV6FqmLNd1AtF2Vz3dqmOz3wOh6pTPGjuCNlUuKRzf/bU8mEHE5V6pDIKdA9kjTYO2KJmOhfuI+0w9wq6gwsFv6NFO89YcldoDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <973f8678-dff5-4e00-9e25-ce8879eab13f@amd.com>
Date: Wed, 16 Jul 2025 16:09:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v7 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
 <ebe250c1-d2bd-4b4e-8f2b-484c6cc08a22@suse.com>
Content-Language: en-US
In-Reply-To: <ebe250c1-d2bd-4b4e-8f2b-484c6cc08a22@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 4062e2b7-6df5-4e4b-e954-08ddc4a5b1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzNEYmFyaUlTZjc0RWlsemVNb3hWNEdyRVJIdHdjUFdxOEFKWXBPRXpzNVV5?=
 =?utf-8?B?aG9hSmo1S3U0RE1adW00UmNzTlFvQzRkM3FrZ2xTeUx2ZU5JcHRobHlkZzNy?=
 =?utf-8?B?ZjcyZTFNMG9COGlsWWZRcVdBQTFTK0xqMXUyL2hPdGtTTE1HMks2VkFDakRL?=
 =?utf-8?B?Y2w0SzRXaUFqWmpkNkJ5RzZaVzZzN1VpYS9ERzNCOUduUFZ4Y1pxdFEza0dK?=
 =?utf-8?B?UlFOZ1hGYThLZzhZemhTbkE4MDlQdTN3Tm9oakEzYnFDWmhsaUp3VWRRd1h1?=
 =?utf-8?B?eE9rVUZsdHQ1dWJ3cnFySjNmcktaYnNUTmpyZnZROVhrZHhMeWVTVi8zdnpv?=
 =?utf-8?B?YUZOemdsN1U0cFJQZmdXR25uc2FzbS9KeXFSb2dzK0kxOW9RWDVmWEs1M1NH?=
 =?utf-8?B?b2dEOS8vcm5qRG5OWGs2NTFlY3RQRlFvdzdxTDZYZVB6d0l1MVBsa2hVY1lS?=
 =?utf-8?B?UmxNQTJManJ4ck1qMUw2cWdCSG9TeFBSWnhReDhwYTZKcVRGWXBaY1llZ3dB?=
 =?utf-8?B?aVE1Vm5XYjBSUXFtazdJeXNlVEY0eERPaHBqOVpQZ3VuZTRCejZXNFI5WUd1?=
 =?utf-8?B?ZGkweFJUVFJFaWpLV0tjMHV4NWgrUmNVSnBlN3J3RWZKZ09yVi9RQ3ByQjM3?=
 =?utf-8?B?K2xGNERjY2xCbVVKWkRkMUs3UGN5KzBnTkpFOGxwKzkrVUxOamE5Z3pSaUZN?=
 =?utf-8?B?cmhDcVNkSC9pbW81cjg5UCtZVWsxaENMU1NzK3FoQ2J2VHpTVERlMXpFOEdK?=
 =?utf-8?B?OUs4OWRIdUhaNEVjK3NuNzNaV0VISkdsSytWTHdmV1hYSUpid0RMSnNjUFRo?=
 =?utf-8?B?TExMdkg1UlR2dGVpd0xrN2ZONUVSUDJZa1JJZ2R6RTRvbi9CNHNPYjQyK2Ew?=
 =?utf-8?B?dytIRTAyQ3pTTXIyN1VsN2ZKNHV5Wkk3dS9hSHR1QkNzK1dlMElVVTVHaHA3?=
 =?utf-8?B?MFIrODBPQnF4NGo5d2hBZHdKS2VHMXlRaFhEOG9pSTRhTDFqWGJybHR4VFdq?=
 =?utf-8?B?QW9laWJPNzhEeWE4RHBzZDdsZGJqM3RySElJVlVuSE1jL2dReGtsRVhvaDBB?=
 =?utf-8?B?TGNlbmRBRm5qVGErZmJ6SW02V1pnVUZwOHpZaElaYUNhT3ZhV1UwSlFPaGUv?=
 =?utf-8?B?RlBndUVONmNrY3ZQQTFKczlpTnUraDZ5ZERVdWVZU3NMRW9xbW9vckp3WUtC?=
 =?utf-8?B?TngwbU14UlhlMnlVMVc0N0JtandzMlEwd3VCcUVSdTd4Wmh0VkNvaHNvTnMz?=
 =?utf-8?B?SW1JWUlRU1UxTjJiVkd1MElIaUp1dWxqMEpuNDJkV3JHM1JBYjdxV1BmQnQv?=
 =?utf-8?B?Rjd5ZjFjNDR1YlduemM4V015UkdHUklYeWwyUjR2WnNGTTRnUEpKTzgwQUQ1?=
 =?utf-8?B?SFFLMDhUTXNweGxJOXNXMFNhakZZV0QwWmJOVlFMalU3dCthQW5ZcWlRUWJZ?=
 =?utf-8?B?M2FQUjNFM0F0ZFhVNmt2RW9PVnJSbWJtRmU0Rk9HRmhUL3JLVTdxcEUwUUxG?=
 =?utf-8?B?KzNWTWdnNytQUjNVVUczUEd1Q05BaHNoUFJsaEJmV2IzcjNQalkya0MrNEYw?=
 =?utf-8?B?UU9oVVBicXE5aW5qdnpGem1lQkV6MGI5cWJLWUVVMFpXdWpMWUhNbEQ5WEk0?=
 =?utf-8?B?S0dTMTRUUWtMbmtlZ2JPMFgrSEhnSklWOXNTOUN1MkJhSUR4Qk14bHU1NG5Y?=
 =?utf-8?B?bmp0WXh6MFlwUThodCtLSkc2YlgwT3d5UGwwaDhoKzZnOFlYNEFuWkw1NHI1?=
 =?utf-8?B?K0hzVzJiYVVVMldqMlNqeS9YMm1JU3hvSHVRcHFCY3JDT3ZZL2NqSGtva3R2?=
 =?utf-8?B?T2k5QllSTUMzdHF2Z1BTUUdURWJ5c1dwZTYzMTRFOEc4bzVRQkpmOEpQMm5I?=
 =?utf-8?B?cGlkOTFocWpidlJwNGlqRk0vRTZGRWNvZWNDMDMxUjZxV3dMZzYzY0xXSFla?=
 =?utf-8?B?NENwMUZETGMxMW5JYmloUW5xKzRSSWMvTXA3NVVyeUN4azNuWUJHcmo3WGc5?=
 =?utf-8?B?ZDFCNzl5TFkwS1lkeEE3cmpJdkJMRjlIUTNwdml1ZE0vVzF6OWVtNmVzenI0?=
 =?utf-8?Q?AZvC9o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:16:48.9062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4062e2b7-6df5-4e4b-e954-08ddc4a5b1e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953

On 2025-07-02 08:15, Jan Beulich wrote:
> Before we start actually adjusting behavior when ERMS is available,
> follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
> REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
> bit is clear.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

