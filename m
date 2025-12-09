Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C0CAFABE
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181427.1504482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvBE-00057F-3V; Tue, 09 Dec 2025 10:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181427.1504482; Tue, 09 Dec 2025 10:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvBE-00055G-0Q; Tue, 09 Dec 2025 10:42:52 +0000
Received: by outflank-mailman (input) for mailman id 1181427;
 Tue, 09 Dec 2025 10:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIuS=6P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vSvBC-0004Ft-3p
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:42:50 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd719537-d4eb-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 11:42:49 +0100 (CET)
Received: from SN7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::7)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 10:42:44 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::24) by SN7P222CA0022.outlook.office365.com
 (2603:10b6:806:124::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 10:42:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 10:42:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 04:42:43 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 02:42:41 -0800
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
X-Inumbo-ID: cd719537-d4eb-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f27g2U2w+5ZlVlAmTDyv4+ewj8qhi2B0rSLss6gYle3TUS2nLvBeJWYEop2ocZqAP5qK8MTBqIgAzoXC93FZuOTAWMSJXqRyQJH9yfbGzRxfveTUdoxxjHZYnpG+ZzLKkZHcrKAjfnNNyT51bPHwK4jDccBfpD12igBiwNSosOmuP54Bj1P6tZbwMt6wb7oG7uIBuzA9h1BGj+Zs17Cu0Pj6hnSvdL0yRaYAZvGf8eRwjzbarij6DyfUIJOm2w54arYQn+U5PIaLSR2Dv7VLn+m6beuswYpZyIg7b9g2lsY5b8oQPM8N/h66kYAwgTbFQgr/nveijtDAYEdAjE3KCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOevnLtBHKOc4v/CbKgN2Q0ADAYGKTP0fsSB3dprXic=;
 b=tzRrqGid4Emg3jMuLyUaMp78g7M/gEZ9LsA6Se9jkUt8m2bSDofdppUO9blqXgr3whZl+p8lKzOA3dtdqgV++BtnN6l+DQXMzc8J8+OXXfZBkCDT7buaFK5Tf6FcrKDM/NnkEzh0d63uBnGlv6wxz4GFB+Srn4/QpVmCeAz2eoDR22+Shq/4I9lczPLx0wgC374S9g/3S80YrST0GlG90j+jHu/aEBHEvZOQT6joCM9eLeF+zh8dUXgXCe66JiMSzhEDKB4RVM9xY6JeWUI1IbIEWpfS96OvBe0bvlyIIhvvjtdnALJR6bigFkV7QZ1syxJ7vPm3G9qZsJeHpPrtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOevnLtBHKOc4v/CbKgN2Q0ADAYGKTP0fsSB3dprXic=;
 b=q0IPljncVSZrfeoyJBBvJQrGZuTrYegpRfpozKyG11irQJyKMRNTIR0yslVoeUOQCcv68RMQx+/OQP3SVDJHaseZTRKeH7YhsE+2uW1tT/EOCC2QUaJOv3sgCg6JC6Sn4XPxK31O0w0u/CSux35/raJcKscqFAZqg+oB15yTAV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e40b3fba-5ca3-4ab5-9cb1-f285480187d6@amd.com>
Date: Tue, 9 Dec 2025 11:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe0403e-79ac-4ee1-b8a6-08de370faf39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3B1bVJBcytXTW44NG5nOVV0cTNwaEg2QW5Ga3F4SWE1bEh1OU1qQ2lIaHg1?=
 =?utf-8?B?TGZSM0xpZzkvNitSVWtBbnFEYjNXR2huWEZ2MUZoQ3ZSdmhuRk5aUGR4VDhv?=
 =?utf-8?B?NTd2a1FjanBDOEtmbmxXSk9va3hVNnMxbTNFYUhmZ0NtOEk5VUtNOXppd3Fx?=
 =?utf-8?B?VTRZc2FsTDJLR0c5UVEvZE0zdEY3a3lKbk9jQkZjQjNqcGxoRkx1SUdVQjNZ?=
 =?utf-8?B?ZDF2bjViRk9ncTFFUmY3alVzNzhMYkNleXlmTG1GVXh4WitIVHYybXowOEx5?=
 =?utf-8?B?WjAwL1NmK2VnT3pqTWZhVUIwcnRYRDVDaFNXTmlkUGlSeEtHS0poUCtaUEtz?=
 =?utf-8?B?STlkYTBqcUQ5bVNTdmk2OVU0MU4rNXVaRnRibjhNMmYzNDFxN2s5YlZiY1FH?=
 =?utf-8?B?dGQ1N1BaSDE5RXJFRmxCaWZUOUV1MTNSVlNZeXdPN3lRVnFOc2IwSG9xMmdO?=
 =?utf-8?B?Yy9wcGpSdUV3YVRudDV3bWxQZEk4TnNhclVEeW45R1B1OFlHYThXR0cxWXJ0?=
 =?utf-8?B?cmlUY053ZmxGVkRJcVNSMHdzTTlHbEI0WXB5ekVaSGJVTWNBNFpSSTJ5L0Rn?=
 =?utf-8?B?YWRKaVFTbWZudC9ra04vL0lSdjR5SGFuTDQ2dFNmWjlRd21Fd1g1akwwdVFh?=
 =?utf-8?B?Z3JKdDJRZFJBKzkyY3hIdnoweDJ4eXdJRzQyS29ZNUx0VmNPUGNPMnJCaXE3?=
 =?utf-8?B?Z2ZEV2xwUC9wdjlEKzJhSnhiNGNjUmo4NFZJQ2dyellpVUVjVkE1SnhJUytl?=
 =?utf-8?B?cjM1d2N1OS90YytpYXZ2L28xQmZMK2IvQWxWcng1L3BEU3FOWVVuczdEZ3Fw?=
 =?utf-8?B?RXpHR21JTnhjSkl3eC9vSHhUY0Frb3J3MVR2OHJGb2c4Y0FHQUxpVmlQNkNN?=
 =?utf-8?B?ZmV2RWpDaDRiYlBYOTArL1VJdlgveGNOSi9XOEVOTnRrMjV4VGNIaGxNUGx3?=
 =?utf-8?B?TWtIWlZsZG91M2pOTWJrVHhHWlpUZHhHOWNTRFhxSkdMRFVzNFBSdE5hOHFp?=
 =?utf-8?B?YXhKckpzUk9Sa280SUM1SHQ5blEyeHFvbWJPeWtJRDBYR3BiNnhwaHRkM2U4?=
 =?utf-8?B?YXAzclNVcGF4UDhYeHZWRnVKL0lxR2xVOGVaL0cwZm5xeHFTd2xRUHlrOUh6?=
 =?utf-8?B?S2xEVUNCSmtDNlBWTlBZenZGVm85VXA0ZFk4OWI1dVpReFVvZkZrNUVNVEgx?=
 =?utf-8?B?ZFN5RFQrSXZNMGk4UjJGdzIzQ3N2dGdYVEhydFFNU0F3WDU3dENubWo0TGsz?=
 =?utf-8?B?VlYxTXhIV1hZM1RtSVFDNjV5WE9adDM0QXU0d1UxTlIzVmQ4YXc1VThJZkdR?=
 =?utf-8?B?OFNZaTQ0YXFyT3Y3UG1ncEJhWVRROFNIK3Y1amg4YzI4WjN6WVM1aU56R1VP?=
 =?utf-8?B?L2lqWnZtQXpxZDhKZ1Vrd0daTzdseWpkV0FmZVlCdUZXU1U2STNsQWUrQjEr?=
 =?utf-8?B?b2hyNHR5a3JyWENHcEZ5SG1EMVMwYkIvNytwQ0NiZVkrR212cnlkQmNSenQ2?=
 =?utf-8?B?ZmcyTEVmaEViSVVtcXo0WGE3Ukozd29nNGR2cFVDMUp5WndiKzdXcWlyTjFI?=
 =?utf-8?B?dzllb3pRVXcrdEFYMWxuc1gwdEkyWVExaGRCbnBMNUFVZG5sQUFtZlMxNFZ0?=
 =?utf-8?B?bU5ibWlDbE5LMUEwRXVjM21wTkVGck4vUXFVT1RaeTFvVnBCQ1k5clFobExL?=
 =?utf-8?B?dmYva0VzbWNUWHkxWjhIMklPdjRlRng1WjVQdXYxa0xZNlBhTWdZWGJWQm1h?=
 =?utf-8?B?TmZkbTlDYlhUTHQ2V0I4NUlaanZ6T21SVFc0LzlkYWtJbmFEL3VlTHNhbXZU?=
 =?utf-8?B?dmNMQnJpU0xSaTlBYmFOMUFjc3o0dlZhUldrNGptU253bTlWdTBqZVB5THZP?=
 =?utf-8?B?amcyOExVNXZxQjRZYWMzWnI3ZGx2ejZIM296OFNTQ0wvdnlZMWlJcVRQUTA2?=
 =?utf-8?B?M200UWxLWjFUenNRVlE3dXRLRm1CYjlmOVVoMm1FaTRQUlVxTjVWV0RUR2tS?=
 =?utf-8?B?TUwwdzh0aDl1WnlXR1dmM0dLMzFTOUYwZTk2Nmk4TXpvZmNNcGVkMnZWZ3BR?=
 =?utf-8?B?RDFPTEJlWHNZY1ZLQkN4Ni8yUWNMWlU1dVRnODVPc1l3TnJUdVpRbzYyZE40?=
 =?utf-8?Q?DzH4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:42:43.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe0403e-79ac-4ee1-b8a6-08de370faf39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787



On 09/12/2025 11:37, Bertrand Marquis wrote:
> Force ThumbEE support to not available in the version of the PFR0
> register value we present to guest.
> Xen does not support ThumbEE and will trap all access to ThumbEE
> registers so do not report it being supported if the hardware supports
> it.
> 
> Fixes: 5bbe1fe413f9 ("ARM: Drop ThumbEE support")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/cpufeature.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1a80738571e3..4cde208e721a 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -225,6 +225,7 @@ static int __init create_domain_cpuinfo(void)
>  #ifdef CONFIG_ARM_64
>      domain_cpuinfo.pfr64.amu = 0;
>  #endif
> +    domain_cpuinfo.pfr32.thumbee = 0;
Let's not split AMU section. Also, it looks like a convention here to add a
comment about feature we disabled. With:

    /* Hide ThumbEE support */
    domain_cpuinfo.pfr32.thumbee = 0;

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

that could be done on commit.

Do you have a pipeline link?

~Michal

>      domain_cpuinfo.pfr32.amu = 0;
>  
>      /* Hide RAS support as Xen does not support it */


