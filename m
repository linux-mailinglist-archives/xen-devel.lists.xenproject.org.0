Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07F9958BE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813555.1226543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syH86-0001lR-K6; Tue, 08 Oct 2024 20:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813555.1226543; Tue, 08 Oct 2024 20:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syH86-0001j3-Gd; Tue, 08 Oct 2024 20:48:26 +0000
Received: by outflank-mailman (input) for mailman id 813555;
 Tue, 08 Oct 2024 20:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syH85-0001ix-61
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:48:25 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a818f80f-85b6-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:48:23 +0200 (CEST)
Received: from BL0PR1501CA0027.namprd15.prod.outlook.com
 (2603:10b6:207:17::40) by BY5PR12MB4164.namprd12.prod.outlook.com
 (2603:10b6:a03:207::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 20:48:18 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::7b) by BL0PR1501CA0027.outlook.office365.com
 (2603:10b6:207:17::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 20:48:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:48:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:48:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:48:16 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:48:16 -0500
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
X-Inumbo-ID: a818f80f-85b6-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwgMq6836jC5sY35zEPLXf+cKaVvKfaOv+lRh4MvajZ27osWW8YR8NYgPeSNOikpA1zxtQ6P7Q/VPELqF4lV6YH+/6XP5LBgckQrHf3HuOcsjzGEtcRxYqxtbkJY5yOT/0pwBVQx1vsvg8nXT5EE0jpbY0C9R/mB/7RWHhgodca/L/2YVkYrucLwb6Qgtstk00PDyK6fBbo40Ef7XQ+W++pOfcjFy4XArysESdedOK9Fj50qjvlAMlsDos2nnGjH+1wVK/GyYmSCdOVj33D1xmAqKOGOhbrUPe2A5WNWZci7q/yI74hBPSoyMr0s2QKO94bk1MTRofSIZWSCPlJQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKNXg5cDvMCtoT7GI50eLriDbSWKWgWhYorrdT8xM0I=;
 b=XSZIg/05xMcly9YSpjJCTYr7N3G7j2div2V2kbht6KE1ayP94n6jI39fmPlD8POU3ZyAXA0U8dhKpBcENOGFS0o+DizHHPn8k+NllgctL3ntsCdOAzSGdIXCEGcLVah8FMmu6JJY1KhEZmytENwWM9pfHc/2UXRbscOWAjcxcCSy/yFY25aW8xQJQ6OsacCCQBJm1zWhmM6j+0i0plZuI/QnHLhtlXHqB7BPOM9rlxDWB66vCwiiPT9BDzQULki0oWv364x0YV6BlYL4K6LWGU36lbiFMn1Z79cx46pSgzvQwZyV1qdgu6K8tirwnayKJGjSMe8HabNAY38gM2zC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKNXg5cDvMCtoT7GI50eLriDbSWKWgWhYorrdT8xM0I=;
 b=pfgG7KszErdGMGTzU62gnrUb381cJSESLvM5EPRLL6YWv867YCIvzxIbhEyX6aiC8znWNyMeP8wz4EyMLmgGr2D/EQiveXGjIwXaa2/Zkhn0L17A2b9jhaM/nIkQCUKk0ZhNtKcE1izEJ/ml6R+fC6C+3+keNyrlvW8onE62F2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b6429ff7-207d-4247-9bc7-4875a68a2b68@amd.com>
Date: Tue, 8 Oct 2024 15:47:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 42/44] x86/boot: convert construct_dom0 to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-43-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-43-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: dae44254-583c-45b7-e0b5-08dce7da898c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjJ6UW03RFp2aW5OZytuRlg3ZUtxd3huSEI3UzJPMFBod0RQellVZDJYNXhV?=
 =?utf-8?B?WnRUWVZOdlFqRlBrazU2em9aRytwaUNuRkVtVFNyZXFPRnFsSkxpKzRYUjl0?=
 =?utf-8?B?d0d6Z25pRGVsNUtUN0V0REVqaDBZK094Z3lza1JjN0ZSbE9FVVBSSGFBMzFX?=
 =?utf-8?B?c0czcGVMa3lFSktJT3E0NnhpWUZlRnR6aGE2WkJBOVU1L2ppLzJ2VWJuSmhT?=
 =?utf-8?B?TzFwNmpieTRFL1h2anFxL09LMTRYTDRMUUdKN3V1SUd2NVg3TGRGK1pVY29F?=
 =?utf-8?B?aHVVUEFJbU9jdDVJTlB1R0phU3FUVi9vYWtFL0lHNHJuOUtFaG51ZUlxenU3?=
 =?utf-8?B?WENaQk5pVXV3eC9KS2xUQ1hhTzlJVWtIbzUvVUVZdDVnTkZwbzk1VDBlb3VJ?=
 =?utf-8?B?NUZVVHhxY2VCeWYrZXJINmhUVEszSVVIQld2YS9zZ01RZEVkZ0dVL0tMY0xl?=
 =?utf-8?B?YjZpb3hmcE5nUFluVThYUHdOVkEvRkxmYUpWNDBtZTRmUW1IUTVkSmNGT0x5?=
 =?utf-8?B?akg5bGV1RDZDQ0FZYmRoRHIvL1A3Z05TREtESzg5NXNqTkJoRWxSM0VMQWx4?=
 =?utf-8?B?SUc3Y1Q0ak9qSGlwMVBBczZGUEt5aDVKeXY2UGpuU0NFRGJ4UXdpWjlFRjQz?=
 =?utf-8?B?NTFlU2E5eHVaTFRXV1d4LytLQ2lCZTJJMDRrblg3N3k0SVNueFRSak5Ic0pn?=
 =?utf-8?B?MlptNDAwWTFrU3QrSGxSeFludWMxK1I3MG5zNTJnZ0c3a0pmbVBiQnlTVE1x?=
 =?utf-8?B?dFNncU5KY2xOVEdMNjh2L0VxTUhhUjI2R0xLV255UnRBN1VaK3pOMVN5aHcx?=
 =?utf-8?B?U09kNHJUUXlmeFljZFNEVDBIRUZxZHBCSktweDN4bndwaE9Td0gvUXc2bGFo?=
 =?utf-8?B?MTZjSW14QXlWcjZKTjdBSUhLa0h4bHhVTnkzK2o3NUFNNG1IRko5aTV6NDRL?=
 =?utf-8?B?VTd2aGZqVFZJTkZadmovRHdFNnZJeitWaXZHTDJQRWMzN082OEl0N2FFbUZY?=
 =?utf-8?B?b09LcUVPUndSTlNnSCtzcWNJSnhJRzZXUmdLeS9zUkVpYVUyeG9MTCtZRmdm?=
 =?utf-8?B?aDEwbHpORFhQV2VoaGdORTRjcTcxeWJ2MThjaUpHeW9ZcWE1cmIrcTFPL2Z5?=
 =?utf-8?B?b29nblltb2laa3h4WGw3cXZjRkI5RTNiZ0F1NGZJYXJzUVhsRDk0RUlTMkhU?=
 =?utf-8?B?dkdKMkdzbUtIb2ZsTXM0NVVhSnpLN2JvdERRcHVIeTQ1WnY3MThQNzhPbjVT?=
 =?utf-8?B?ZUpmM2xZSGZ6S25QWlVMcmNFQUJPYlQ0eklieW56Rk5YYkRMaUFuSlhCL0Rv?=
 =?utf-8?B?b1ZhMk1ndnVuZzVDMGlDS2lSbkQzY1cvVm1RdGtkNzg4ZzFWY1hDQ1pqRTBC?=
 =?utf-8?B?QUdjcDU1Uk5VZFgrSmx6NCtlcG43a1NVUERsRk9RNXI4b1RKTlBpU1FJMENk?=
 =?utf-8?B?a004YkFyajRldzVZOC90bXlwL0Qrdi9VTi9hcWZjcVFVZXlyTUZVUkNBT29k?=
 =?utf-8?B?Qkp0ajh0MWVjOTZBU3MrS3JZTlFYVXRNYkxDZWw4NlBZb21mR3hjYmpPU3lV?=
 =?utf-8?B?Mmk1RlpqbmV3Y0hMeE1MZ2hpUHdCaS9MUldCZThENi9PTnZBTEFIWmlkREJp?=
 =?utf-8?B?UFNOZEdHNThUZUFoSGJuLy8zbHlrQjRTNVhDcGJnN2NCMU9hSUptaGZpTmpp?=
 =?utf-8?B?VjZuLy9JZ0dTY3p6YWR3Wm96aldLc0k4TzJJdUhYUWYxWC9sdVJnVnc1eU1Y?=
 =?utf-8?B?NWtacWtjZUhHMStnN254OENLVHRxbmhzcTdDSzhaR09mQ0hSLzJDZGZBemho?=
 =?utf-8?B?YUg5OG5nelIvdjJiNE1DVzR5c0JwLzJaTElmTWdRS1l1QU5Fck41clZyL1pq?=
 =?utf-8?Q?r9BdqnHVDj79D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:48:17.5740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae44254-583c-45b7-e0b5-08dce7da898c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164

On 2024-10-06 17:49, Daniel P. Smith wrote:
> A struct boot_domain now encapsulates the domain reference, kernel, ramdisk,
> and command line for the domain being constructed. As a result of this
> encapsulation, construct_dom0 can now take a single struct boot_domain instead
> of these four parameters.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/dom0_build.c        | 19 +++++++++----------
>   xen/arch/x86/include/asm/setup.h |  4 +---
>   xen/arch/x86/setup.c             |  2 +-
>   3 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 71b2e3afc1a1..e552f2e9abef 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -597,22 +597,21 @@ int __init dom0_setup_permissions(struct domain *d)
>       return rc;
>   }
>   
> -int __init construct_dom0(struct domain *d, const struct boot_module *image,
> -                          struct boot_module *initrd, const char *cmdline)
> +int __init construct_dom0(struct boot_domain *bd)
>   {
>       int rc;

I think a local variable would be better:

     struct domain *d = bd->d;

The patch is smaller, and using just d is common in the hypervisor.

Regards,
Jason

>   
>       /* Sanity! */
> -    BUG_ON(!pv_shim && d->domain_id != 0);
> -    BUG_ON(d->vcpu[0] == NULL);
> -    BUG_ON(d->vcpu[0]->is_initialised);
> +    BUG_ON(!pv_shim && bd->d->domain_id != 0);
> +    BUG_ON(bd->d->vcpu[0] == NULL);
> +    BUG_ON(bd->d->vcpu[0]->is_initialised);
>   
>       process_pending_softirqs();
>   
> -    if ( is_hvm_domain(d) )
> -        rc = dom0_construct_pvh(d, image, initrd, cmdline);
> -    else if ( is_pv_domain(d) )
> -        rc = dom0_construct_pv(d, image, initrd, cmdline);
> +    if ( is_hvm_domain(bd->d) )
> +        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
> +    else if ( is_pv_domain(bd->d) )
> +        rc = dom0_construct_pv(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
>       else
>           panic("Cannot construct Dom0. No guest interface available\n");
>   

