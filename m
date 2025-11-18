Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11908C6B9A6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 21:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165362.1492149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLSGc-0001WP-9z; Tue, 18 Nov 2025 20:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165362.1492149; Tue, 18 Nov 2025 20:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLSGc-0001TI-6G; Tue, 18 Nov 2025 20:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1165362;
 Tue, 18 Nov 2025 20:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/+5=52=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLSGZ-0001Sp-To
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 20:25:32 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9292dd0-c4bc-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 21:25:29 +0100 (CET)
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by MW4PR12MB7430.namprd12.prod.outlook.com (2603:10b6:303:224::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 20:25:24 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::ee) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 20:25:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 20:25:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 12:25:23 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 12:25:23 -0800
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 12:25:22 -0800
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
X-Inumbo-ID: b9292dd0-c4bc-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE3W0iBIKjAUEnGrTi+2YZdfDu2aMbizsFKpdK7XxRv+A0GC1U2Q2Y4VzyaqjHEtNfreg4vsmDrJJ4F6CVbJdNVKhRnjclea4Jc/ZpcNsNFcdDD+uEVtfjPJv+uVBXZOTbmnAcummhKU/Ud/E98Nfl8tF2S9BQibxUHhbNc4zpj34aCgeYtJwe4G/XcnM3qx8Pcf2isKDmwDVa292ovc4aVVmMfmJQDwTCwdM4N44SGrUEbBwTiotyizvdc5rG+g0pnh22FOodgo+a5jIiOWXV4s4zir17lh30Gph+nxefsyPOQYMbkme2LexuSlg1pk01kXRYvmj6+DA9oLUlNsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIb/armPiwKL08gh7vN4UjU1LnktCJ3ZTzj4hT54DQ4=;
 b=FUbrTDCjCn7AOGeLfTWmq23YVeJkRPlm0vafmiElpB5S63kmCymtKMsgIdh525RZ8WcSNwlGImfTD/rZlpNBE+KJHkA8s1jgc6nn4uLR21PT2FXu3lKB4r/zFhlVB7iOnB1KDsJ+9GCzyyzOmrjIK3fo0EmWbH7A8Ewaqj3MRN3wFYUaHZ6yHE2sVjWj/ZOFJO6tgjnzFmpj9Zq1P/78UVXLMfXkXneCrfQHMo/RaUaE+5/a51rnPXVE2gM0zDUvYb1jKleomo/x63lcnmvLqm/GJ0obwpo+h9OHqOKV1EgkSq1KLWdRc+K62BjRC4Z3GaoDw+ij0hnTn3ub4N9GBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIb/armPiwKL08gh7vN4UjU1LnktCJ3ZTzj4hT54DQ4=;
 b=dTvCZL5o6XIdP/WzttXpKdiIWzL5VVUmbaV6GW/9/RMAU6MKgtjE5bH6cXndnLI8adYM4xmssL/FgZYq9LnPJkclQf7y1bte3rEZMsSuspeC6EecRd6VBpHlKeJe6KzhjJl5LDm6Nl5l5W82jD18KCLWDbMWhUIwuz4eptWf00I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8f0c9b79-eed1-4e69-a7d5-3e3151fc3984@amd.com>
Date: Tue, 18 Nov 2025 15:25:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86/cpufreq: use host CPU policy in HWP driver
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
 <b57c2fc2-d302-464d-aaf3-552da0114bb2@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b57c2fc2-d302-464d-aaf3-552da0114bb2@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MW4PR12MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5e8193-f8e5-44e8-b1a6-08de26e09aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnBqcE5lbFMwSW5wT1h1VjVydzBJTno3WHZwZGt0M2k2RHprYnV6WmQ5aHJh?=
 =?utf-8?B?QWFsU1kvcHhvaEl2ZEgrWFVIWEQ1ZmlMRTN6Si9xeUFvVjNXTVRLRk1XZTB6?=
 =?utf-8?B?MUk1MytyQU9BNnpTZnFNbzhKUis0Z25PNEdCOVBmZmczR3BWT2FJQXg4U0JN?=
 =?utf-8?B?OUl2b2RxNGdzT1EwVDhNQ2NraStnb1J6T3l6OUlnY1U4V2tuUmdqUzVYa2l3?=
 =?utf-8?B?M1lHRkpjejFJaklvU29rNHZDdURka2RJbDY2QUY3cVVWcExQYXdqNFpXdnJM?=
 =?utf-8?B?R21rejRBWVRHS0VqamZHbFhWZTNidVI2U1o2bWNKNXVRK2dQUllYRi80WUlM?=
 =?utf-8?B?amw2enI3NGdFYjV3NGRVelRoUmsxTk1MaXF6MWhFVFRjbFNXV3hpU3RKMUwz?=
 =?utf-8?B?RzB1RDdIU3JsdTJ4VWRpTEVYZzJGRjRaV0JRSmlwRlZyQjFkQ3ovbVM1U3oy?=
 =?utf-8?B?VitJZDQ1c1g0MCs1QmhvU3FaalZmZXJxK2NISDFvRTFjdjgwSko5MzhCcEFX?=
 =?utf-8?B?cVRYZ2UzT2FJdVUxQU9COExKdlZTbnlCOTNyZTIvdkxNUHdsZDRpWDA0ZE9y?=
 =?utf-8?B?YzBxTlJVczhVeUx4VDZEWnRlZ3FmR1UweGJ3UUgxemNjcG1KUGZya1ZDTVFh?=
 =?utf-8?B?bTFQQXFmT0pHbmNuSjJLM2U1bUxLVFQzVEZpUnppcDVHdC9nNndreHJXNi9E?=
 =?utf-8?B?UldkMlBNTGI3MUJFYmVVbi9PTDM2RVpSRnBSdERGc20yZWFqL2RsMVczOTRX?=
 =?utf-8?B?dHFRYkJOYTVwNDBmVTNuNDdHOGNXTU9kbmQwVWdScmttbGtNQjd0OThxSzJL?=
 =?utf-8?B?enQ1QlpHMXhYc09YTVJTL0RoZ2R1bzA0b1VjVWVlTjZZV2hFN05YMzJLNTZm?=
 =?utf-8?B?QTJWV2tJdVJqREhraU9ZQ1B6eTBhdE9uL3JHYmYxZDVXaUF0Zkk3RHdtZ29y?=
 =?utf-8?B?MW0yMWJxM2JDaU8vU0Z1cEFnZHVGNDhmTGJJd295UGRQN09iUWl5TnBUYmNP?=
 =?utf-8?B?N3NhdDB3RHVBMGF6SGxEeVdZRG8yMWp4cVlzZlJ5TDZIL2lDRE90d2hkSG5B?=
 =?utf-8?B?VWlpRlNYcWJ3cGVmcjMrYytFTTV0elg2Z0tXakNXcmpuWDQ0ZUxleW5lZU1Q?=
 =?utf-8?B?Si83NWZiTkg1ekd0MG5sc2E0WDU2cVFURDVrNzkvN1NvWWdtaFMrdnY1M2Q0?=
 =?utf-8?B?SDBMenR6eU1sbi9ZYkJLbURwWXBYaStRM0Z1MjlYMno1MVpXT2J4bi91VTZ0?=
 =?utf-8?B?QlBzWk4rcTVXY1BDT251bFhlNGM0ZTBrNHRpV3BUcktvY21TZEh0emlpR0Ro?=
 =?utf-8?B?b1NDbWsvUC9DL2UvTVFRNlRHREVVenBWUFpTRC9pc1Flbm9za1NJNzlFRVd6?=
 =?utf-8?B?d0srSHRzRVVjV1FVM0R4V1NsaHBReVRKT1A4RHBVL3FSaElWZE1WQ1RtaTRi?=
 =?utf-8?B?Sjc4Y3dtVWJyZmN0N0tSWkREZTZXMVl3SERxRjFLNHRiRWZWb2lnYlNsUXpJ?=
 =?utf-8?B?UnQ2NCt4WjJkZER5WXFuUC9CWHVzMTBBRDI3VE0wNXpvTEJIcEs0RzZ1MHVa?=
 =?utf-8?B?d1N6SkVscGhFbHFaVTlnVngvTEpXMWlMb2JmVk41Ykl4MzN6RlJqNXhCNjFJ?=
 =?utf-8?B?Wjc3Wm5rVU1VVUV0NHFrMGNMVCtYcnB1OVRUMGNTeVQrbjNGbDA4RUFjT1Jz?=
 =?utf-8?B?cGoySmU2S2hwemtWbnM1YzFISkVXMlptUjRRQXByRW5aYnk2VkhNY2U1RHZE?=
 =?utf-8?B?dHdpTXBOMlQ1UVBrRWo3Nmk3LzlhUWg0dGoxM2ZqSHJGYVhsWTBmcVUvTVQ5?=
 =?utf-8?B?M3BRM0UrTjNCNGFRSDkvdm9yb1BNNnFHa1h5TDVIUm0rRjBwcHdQZmhYYm8x?=
 =?utf-8?B?RjVyQkhqeVkwRG9mVFZlQzVhbTFFTU9rWkg5S2o1bnNBWURUNlJ1RUErTUlq?=
 =?utf-8?B?UmFJL3RQZzhTZDNIZ1M1Rm9MMFBDYWYvMGNaSlNTL2hxUm9uMFF3RFY2VHlS?=
 =?utf-8?B?Qk1YdFEySWxrZko3ejBkWWpHa1N6a3dwSlk0UXZNV3BEWW1QUjkrU0VFeDdm?=
 =?utf-8?B?eXIzYy9BK1FIQjlmTnlOalZ5ckY1am0wSVFxNmVaL1lneVIyVjllWWNwWUZr?=
 =?utf-8?Q?1nRo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:25:24.0656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5e8193-f8e5-44e8-b1a6-08de26e09aa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7430

On 2025-11-18 15:04, Andrew Cooper wrote:
> On 18/11/2025 3:09 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>> @@ -183,29 +178,25 @@ static bool __init hwp_available(void)

>>           return false;
>>   
>> -    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
>> +    if ( !host_cpu_policy.basic.pm.hwp_epp )
>>       {
>>           hwp_verbose("disabled: No energy/performance preference available");
>>   
>>           return false;
>>       }
>>   
>> -    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
>> -    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
>> -    feature_hdc                 = eax & CPUID6_EAX_HDC;
>> +    feature_hdc                 = host_cpu_policy.basic.pm.hdc;
> 
> Looking at how feature_hdc is used, I think it should be the bit within
> the host policy, rather than a separate boolean.
> 
> The host policy "is" what Xen is using, so if the HWP code decides it
> doesn't like HDC, then that does want reflecting.
> 
> Unrelated to this patch, but as I've been looking at the code.  What
> happens when hwp_init_msrs() fails on an AP?  I can't see anything which
> unwinds the initialised HDC state on the prior CPUs...

Assuming symmetry, it'd fail on the BSP and never get to an AP.  Yes, I 
didn't consider unwinding.

>> @@ -365,7 +357,7 @@ static void cf_check hwp_init_msrs(void
>>       }
>>   
>>       /* Ensure we don't generate interrupts */
>> -    if ( feature_hwp_notification )
>> +    if ( host_cpu_policy.basic.pm.hwp_notification )
>>           wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> 
> Again, unrelated to the patch, but why is this a wrmsr_safe() ?

It seemed safer ;)

> If the feature is enumerated, the MSR had better work.

Yes, but I wasn't sure how much to trust it.  I only tested with 2 
processor models, so I wanted to be safer.  IIRC, I saw a #GP or two 
during development.  Those might have been from writing a reserved bit 
and fixed during development.

Given my small testing size, I wanted to keep it safe and not take down Xen.

Regards,
Jason

