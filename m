Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDB9954F7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813375.1226289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDRp-0001Dc-O8; Tue, 08 Oct 2024 16:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813375.1226289; Tue, 08 Oct 2024 16:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDRp-0001Aj-LG; Tue, 08 Oct 2024 16:52:33 +0000
Received: by outflank-mailman (input) for mailman id 813375;
 Tue, 08 Oct 2024 16:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDRo-0001Ad-ME
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:52:32 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2409::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4355acf-8595-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:52:30 +0200 (CEST)
Received: from PH8PR21CA0004.namprd21.prod.outlook.com (2603:10b6:510:2ce::11)
 by PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 16:52:25 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::80) by PH8PR21CA0004.outlook.office365.com
 (2603:10b6:510:2ce::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.3 via Frontend
 Transport; Tue, 8 Oct 2024 16:52:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:52:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:52:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:52:24 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:52:23 -0500
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
X-Inumbo-ID: b4355acf-8595-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJQD4dEe9ArVHGtVT76Yl/3am9V/vivacUidyh9pVBkMtK/NGffOVpmiyboWYSwzPOmnV8gmL4Shfn7KCD5Ls55YKSOoF0sFsJhe9W9nYCET2Ftt4o7L6aEygo9eegHE4H7J6grABo3GOJz0u9ZS54opOV9kChuLQHIib+inBl2moTjfrrKy3hbhGRhFJqvjTdKnvteR6o+9LZ1qco85LFQWBK9ZomU1K8/dnOVZ91Xkm7OgGZOCluMuJwAkE79VG8/ZMm5zKy6F8HSn5omfcMEWR1xSClYyaKffR7SZNAyTzUIKWE3kbOIU6yPukEB6QHNi9LGQO4W/mvzkkA+9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBYWX9WX+30T2jZasXYno7vXPVVwV0H7pTZ1vp4nrF4=;
 b=XXXflTmgyXSeZ283T8EloMyX9KJ6m4QdWU/YK5R/deb1GnAiJmkX9N17CNtmDfbKouMDsojJxjAeRE03/Qbru7uXBfZfGJRFSgYPNboGX503oB7MG7s/RL3vy5rz+p52otcEhTkOwqOOt1Wb4cR7t3XQx+i5mvKH17d4jfnnw/Ha9J25bv1kaKbZFlnPDUk5idkSno3MUt0vGkHQcdO1ZDzkn9VxaZgZ6Whh6WQeAAmA7NrRgvX17/K3Kd2O/1c+P1OKvFboT2ZUVnSkCzb1xhGG1NQSRensmh4Hit9JNMUmTIdLsB51vCU2VX3g++VcE5D6NQLNkIBk1bBeOYb0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBYWX9WX+30T2jZasXYno7vXPVVwV0H7pTZ1vp4nrF4=;
 b=MfaCSZ6VprwnPkZMlE+/VDaPe2Vk7PKGSjLP67gl56aemF0gcT0UfQyZBO94A1v4QFvzpWQhGl6jxn5gWu7k3EAzEHgEh5mwfpvxmclitFeTi1lhpJa2sMqnpeSU7tZViTGse8luhykFXhTvNA4hsWyn/Xm1swG1jOltl61utPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1bc18234-2e50-467d-875a-3968165f5570@amd.com>
Date: Tue, 8 Oct 2024 12:52:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/44] x86/boot: convert create_dom0 to use boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-26-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-26-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4e9e94-4cf3-41f5-3a36-08dce7b9962e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ai92VkVxZ1B1M2RTbDF3V1lndGFNejB3UldLaUNyQW1yMnpzaUt2N2MzWUlm?=
 =?utf-8?B?WlQ2dWpaNW5XeWYyODRRSy9GTytGbE4wbEVTbFBIMm5ha200K3JqVlM0TzQ4?=
 =?utf-8?B?MWtwaHA4MUdOVDBSK1VRMWs4QmJyTU9DVHJLWS9CREF4SzFmWXRrUTJoVDJG?=
 =?utf-8?B?MUh4MHhadS8wTFlaUUZOSHBMUUtFU1RoSkhTWE5NMkNndnIwNitNZktvancz?=
 =?utf-8?B?TW1odENzTUQ5bHVkd0hHZlIvZC92OHBHL3UzUnl1OE5zcjJLV3hjMStxWTIz?=
 =?utf-8?B?RWxTai9IR29FMzFaQVFJRnhMZWJGTHJhZnNQekR2czhRYjlqMVpwbElGU2hr?=
 =?utf-8?B?QktkYjZhRHZZUGZLWWljZnFFYjJwcFFyN0pTTmdTclpnQUZ4TS9RcTZhbUFj?=
 =?utf-8?B?RW16UXEwVGFmb2paYy8rMmFkaU1ra3Q4WjR3OWJZWE9sVFltajZXUXlNRmpt?=
 =?utf-8?B?anZyUzZnbS9pdGpIdWtXaTlYeFJITnhMWEtCLzV6QUN0ZEVLWm9Cak5mWjNr?=
 =?utf-8?B?aUFkVUlHdkxkRmNKUzVVQnRoUjR1Y1RJc2ZtQ0hDbWZ5SlV1ZVBJR1ByL0lv?=
 =?utf-8?B?YklhY0xaSGtSL2dPckpZTlc0aGVxRjl1Tjk5Q2tXYXoyYTVWejJaa2cvQzF4?=
 =?utf-8?B?Z3BZMjQzK1pmOFlXWXU0TUNySlVCTDJ2K1c4WTN0L0xOZ0RLSEdJcWhMVDB6?=
 =?utf-8?B?VzM3YXNuVHBZcFZKTlpIVkxIY09Ebjd0T2xlSWhWUlV0U2RReFJFV0JEK3RM?=
 =?utf-8?B?Z1pERUl5VmFTWkxHNEU3cjNSYUsxZzBEZWlCejhzSXhyMzB5ajZPejhscjBB?=
 =?utf-8?B?QlJyNHk5Qjcyd0M0dW1DckpuSTM1OW95L3UrV3M4SDdXR3FiUHlVNGR4bHFI?=
 =?utf-8?B?NFZDMEVrdWxrakFFTlRhaHVQMVB2Q3RWdnZYUzg3cG9rdk9hZDVsZVBPb3Nv?=
 =?utf-8?B?T3hVaEg2RzJHTkZ6VnFnN29Lbk5jTmgyRkVLRVM1ZEdzci9wbkRWaElwYzBM?=
 =?utf-8?B?OWt4aGxLY0FWa0xDbUdMVVpXQXdSb0VyZGlmNHNTWWlsSmdVYU0yOHVsTVNo?=
 =?utf-8?B?K0tXRkpwc2FjTk1hdnBjRFBJTy9RRW1KVHJ6eWpWdnlEU0ptSWlCcVA1SVVq?=
 =?utf-8?B?aXJ4QmxCMXhWRkkxY3FvQWJ4K2RwcTFDd2xKVHpmRWVPTWhlTDJQT1lXVG1s?=
 =?utf-8?B?RGJDK1hHWHp2RlNsV1JXZDgzSVVBQW5rOWRPQU9taTFDbHBkZlh4RVN5dnhn?=
 =?utf-8?B?aFJzOFQwbWxzS1pvRTQ5SjZRUmoyQjlRbC9zVWw2RHFBM1dCRXg3NHlYS0Fi?=
 =?utf-8?B?T1BPcTl6WldUSFBLK3ZOTHQ5SnFZN0RlQWhBMGhJWEZhOTNIMEVDWlphSGFX?=
 =?utf-8?B?UkkrUkF3VmRmMCtSLzZ5a01DMWcrNG02bjYvalRCakF2T2JtQmZsTEVHQVE1?=
 =?utf-8?B?dEFWUVpDT29HQVF6UkFKekFSZGs3ci9FSmtjaXFOOFgvK0MwV1lXL05PcXhj?=
 =?utf-8?B?cVd5SFkwTUk1OWlERElXbDFpT1VSK0Yzc21CWmI2aThaaHo0ajNRTTc0NzNI?=
 =?utf-8?B?OFhvOWdGTzEvK05mZElLUDVlQWlNN1FqZ00zMGUvNkZHdUpQTXdyWmJITW4v?=
 =?utf-8?B?NzVHU2c2WENCV3FsTFQxUGkxWDFNVnBjUmZwMWZUUWI3dHJvM3RTaWE0aUxK?=
 =?utf-8?B?U2lJaG9tamgwU1NOTG45cktnMTNURVNsa2lvQ0xENVdJRk1EajlvenFxMUVh?=
 =?utf-8?B?NmF3S05sUXdwZWdScDlGTWM2QUh4Q3FReUk2OXQ3NE80SWhQVjdVdVlybXo2?=
 =?utf-8?Q?zH79kgkXeFJDyM9NPFa2HRD1TRtoSYgP4MdRQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:52:25.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4e9e94-4cf3-41f5-3a36-08dce7b9962e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This commit changes create_dom0 to no longer take the individual components and
> take struct boot_info instead. Internally, it is changed to locate the kernel
> and ramdisk details from struct boot_info.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 0d2ee19998aa..c2bcddc50990 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>       return n;
>   }
>   
> -static struct domain *__init create_dom0(const module_t *image,
> -                                         unsigned long headroom,
> -                                         module_t *initrd, const char *kextra,
> -                                         const char *loader)
> +static struct domain *__init create_dom0(const struct boot_info *bi,
> +                                         const char *kextra)
>   {
>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>   
> @@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const module_t *image,
>               .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
>           },
>       };
> +    int headroom, mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);

I think headroom should stay unsigned long, which matches struct 
boot_module.

With that

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

