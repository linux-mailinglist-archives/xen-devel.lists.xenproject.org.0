Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D1AD40FE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 19:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011148.1389495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2xU-0000NH-Qh; Tue, 10 Jun 2025 17:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011148.1389495; Tue, 10 Jun 2025 17:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP2xU-0000Lk-NF; Tue, 10 Jun 2025 17:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1011148;
 Tue, 10 Jun 2025 17:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ku7P=YZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP2xT-0000Ld-86
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 17:40:23 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2405::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8157c35-4621-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 19:40:17 +0200 (CEST)
Received: from BN9PR03CA0359.namprd03.prod.outlook.com (2603:10b6:408:f6::34)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 17:40:13 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::6b) by BN9PR03CA0359.outlook.office365.com
 (2603:10b6:408:f6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.28 via Frontend Transport; Tue,
 10 Jun 2025 17:40:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 17:40:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 12:40:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 12:40:12 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 12:40:11 -0500
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
X-Inumbo-ID: f8157c35-4621-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG0Nu7vFxr38MyBO2jp5g5savh+zCQM1nwXFDkwi9jMmOcTFtFbL08H7WcyUT3NAXbdo/inYBrai0jNu9HrcfdBqn1sLj1YIsQroEBPcWY1andpGraLGDUOS05DVIYwa1KBsvZJP0BqYXXtmteBAVTcwKNv+LY9q8rwallO5bciq5rdw8lyDjtq3ctMc3lVkXAg+eDtPA8BkT89AndYXvBAIMGok04uFdfnj+MsEU8Kf5MXXTjaE5p+RWDUxD1kvf0X7530HlcbRnronlewFjr87Eh8ugOq9vNRpx2BDjopYwFYLkgoz9eMpCXFK8A009t+n9MfNjfO9i5XrNggwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PksA5C6iw+sZppG3ZXdMEOJitc+OQy9il77T0rpHx80=;
 b=PcFOLQOJSyZnvOvl/nqjXdB3ZVE9X4zrZzv029VFhClygXgOXT4jRaSsOjlEZ3S+JJNjWI0oRsYarHLJn4wLvFBKxz9k7BTlV1nkKnqTO10m5+q1DAqOhTEzNFEcBLAX+EyLOLeiFFH9KzC1ixGghPgG0id1/7zQRPlfvJ1TH/cXi7mb3AiVqY3XF4DBdO8r+deYBCDEEb5CyUrjRvHJnigskbjibap1Qt9c9fA/1VX8F9EZp7mondmPWJkB2J435X6xs/5MiCVwYrsK5BkIWlCSklU3kzuwmD559JZQgV9oDB4ZdrNiMzuT6Zqvm4WVZSUmEo+JuXV1+5gRFZxWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PksA5C6iw+sZppG3ZXdMEOJitc+OQy9il77T0rpHx80=;
 b=LSGyv1DxpxM8spmgXwrF5NQC8KsdwhuFOd18HK+AFXQDaSdVLZOBoZcMrhzwVP+2DCDFfg5/pbkKUDuu14eDHRTyio+pGlgKkbM2/rUfl2gCD9KpYeiu7AOOrqHuRFrrYaMutL+5AsKA+vNe9IktejRsik82TFuj+Wl3UwJ3qYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03be429c-063d-4467-91e7-7ef2e148a2fb@amd.com>
Date: Tue, 10 Jun 2025 13:39:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Denis Mukhin <dmukhin@ford.com>, "Alejandro
 Vallejo" <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
 <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
 <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 1904aaf8-0c6d-46e8-87ba-08dda845da5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVBkWXdUcEN0MlE5S1pNYWRTMzUwUGpHTW5meVBtNk9pVDVHdUN2Z0dGSHJG?=
 =?utf-8?B?N0JodmV5ODZxODF0Z0tVaXkzMVhYeDNqWUtiRDZtYnd5R0RoL2drUFZJc0tU?=
 =?utf-8?B?TmZZY0l2ZUdEaUI4WHFDeHphTXpld2cvalg1U3NUeFF3eWtFNThydU1mdEdk?=
 =?utf-8?B?cWlKUWpoMEtUazZWVk9mb0RNajM2NlNPUEdHUFdWZnRsV1Zva2Q2Mkx6SmxM?=
 =?utf-8?B?UmtWbnB3REozQVJnQmRjYUNiWFIwY3ppL3ZFRkhWcC9iSENwV3FCZFJKQnEz?=
 =?utf-8?B?RUR3YWpOWU1RdkNid1BhaFk4UFdwd25uQi9tWStod0FyQ3drWU1uUitOVWow?=
 =?utf-8?B?STVCMjd3bnBteXpYN2REM2hmNzlFSkNWZWpXK3lFa3YxSHZKdFM5VFFIMEhB?=
 =?utf-8?B?NmRndlFheWdxZ2dBU1A2R3JNeEE2QmJEczF0RG9RTEVYTkZtcmpobWFQTmVJ?=
 =?utf-8?B?VXJmbnVOS3VLNzlpM1BtWHI2blp6KzBrOHVXSjVmUnBlSDhMdGpuYkdkelhh?=
 =?utf-8?B?N1IvdXM4Rkt5UTgxZDU1TDA4VmsybGowSXVtUDc2ckVuSUxoN2lJMTB1dkxH?=
 =?utf-8?B?WTQ0SVlGN0NFQVA2MWdRTy80MXlrakttUko0YlZJRUNUbDJQMEIvYWhpKzlq?=
 =?utf-8?B?Sk9oY2p4TDNuUXhjWUlQa1I0RmE1alhDQnVyU3pJUEFsQnNNWHlmOGcxdHo2?=
 =?utf-8?B?MUF6ejQza0ZxL0FNWWhtY0JocU9lOWM3TXlpK2NrVy8yN2RSR21zRVppRVZu?=
 =?utf-8?B?a0orb3h2dHdaUGlHZmRVd002aUoxbU84bEV2d2tFbzFYVXVGTmhFNjdyY3gw?=
 =?utf-8?B?cnJoZnVHaW5OWVQzdEUwQ040MVp6aTZaM0VEaW1DNzR5ZXdGV04vdlF4c3Y5?=
 =?utf-8?B?KzhGQmJIQVlKc2htODU4QXN2WDhYZ1NDOU42c1FRQWpRTUlNUjRxUUcybmpF?=
 =?utf-8?B?RjJERk4vWHlmWVIvaDluRU0yaFBPNGlWWmxDcXByMGZjeWtiNEMyUG5GMVdF?=
 =?utf-8?B?eCt0bStJNDFDS0JFd0xCQ3FYcUxOalIzbFQ1TXJTTmdSdDRFRjdSVVJHSm41?=
 =?utf-8?B?czRKeFJWYnYyNjRWbTFlUXNvVWRjZ004Q09wUzJtK0FBTVozZGFyZE9SeDIz?=
 =?utf-8?B?NGZDWThQN1ZKcEJ3QTdPbDc2MWhXanNQaDRRdTIxSjRrc2pwMEdrQk1OOHgw?=
 =?utf-8?B?bXROSkhQVm5LdFJjbERBb3l2akxxVVJZSUhxenEreDRmSW5FcWgrL0JTMzVz?=
 =?utf-8?B?MjY4eEhuMTExeFFSMFR2Y0gyak16TVA0Nlh5aC9kQnJWVVBrR0J1SFFSL3dw?=
 =?utf-8?B?eXVxeVdoUGhESG14OHhzYXptbGF5MVlwSjRvRW5xeStLa3FKaTFNSzk4Uzhz?=
 =?utf-8?B?dUpGTk94K1BCczUyOG9POVZUM1FyaW5jSEZIOEVkaWhWRmhBZmU5K29KKzZU?=
 =?utf-8?B?KzdudDA4Qi8vR3lJNzg4ekdOZDdLR0UxK25DYU42bEtVZ1lUWkdtNG5CUURG?=
 =?utf-8?B?RHNGeFJJK1Fpc2FSaSt3ZEV5aXF3c0hBNWhYWTdBUXV4dURQY01udEx0TWpJ?=
 =?utf-8?B?Um1tdTZiYzNCV2YrQ1NHRGQvMG1GQWUzQnFqUlhCblRGaS9OaXZkNmM3L0NY?=
 =?utf-8?B?S0s3K1c0ZEZoUnRJdXRsY3lkU3ExdVdNQU5tVGtiNDRrQ1R0TEYvUEJ6WmxN?=
 =?utf-8?B?Yk82V0k5SGdPUDMvZHlvcHNEYituZUFKVVUveXRyYlhCL1JqYXFoM0xyTGpW?=
 =?utf-8?B?YWRURkdoK1MyZlJmb0R1NThsVkY0eVVMeHVvN3dDTEM0Y016bW8yUzdwVm9T?=
 =?utf-8?B?Si9qdzdtVHgzZDQ3R0FReDNaL0Rnckd5Z013SU94YTF2cnlhd3Bkc20yOTRN?=
 =?utf-8?B?cCttRlJjcEhFL3M5TzRneVA1UzlkT0h2Q3QyMXNPc0lTdTM2OXR2N0d6T2JU?=
 =?utf-8?B?VWJJQ295VWt3d0xydC8rS2pwVzE1cWFRMTYyaFpyYVlRdURCMFp5S3c2VmEz?=
 =?utf-8?B?MGJONm5ENEtOYnVKNmNjdGllOWpXUmNueXBYaDFOZEYxY20xS2Q0SzM3Lytr?=
 =?utf-8?Q?u0qciG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 17:40:12.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1904aaf8-0c6d-46e8-87ba-08dda845da5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176



On 2025-06-10 02:56, Jan Beulich wrote:
> On 09.06.2025 19:07, Jason Andryuk wrote:
>> On 2025-04-29 08:36, Alejandro Vallejo wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> Add support to read the command line from the hyperlaunch device tree.
>>> The device tree command line is located in the "bootargs" property of the
>>> "multiboot,kernel" node.
>>>
>>> A boot loader command line, e.g. a grub module string field, takes
>>> precendence over the device tree one since it is easier to modify.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>
>>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
>>> index cbb0ed30a2..dabe201b04 100644
>>> --- a/xen/common/domain-builder/fdt.c
>>> +++ b/xen/common/domain-builder/fdt.c
>>> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>>>                printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
>>>                bi->mods[idx].type = BOOTMOD_KERNEL;
>>>                bd->kernel = &bi->mods[idx];
>>> +
>>> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
>>> +            if ( bd->kernel->cmdline_pa &&
>>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>
>> The logic is incorrect - it should be:
>>
>>              if ( !bd->kernel->cmdline_pa ||
>>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>
>> If there is no cmdline_pa (which happens with the "reg" property) or the if there is a 0-length string, then check the DT for bootargs.
> 
> Even that sounds bogus to me: There's a difference between "no command line"
> and "empty command line".

Yes, you have a point.  The difficulty is grub always provides a NUL 
terminated string, so Xen can't differentiate the two.

Regards,
Jason

