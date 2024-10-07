Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5E99387C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812449.1225203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuaY-0007Lo-5v; Mon, 07 Oct 2024 20:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812449.1225203; Mon, 07 Oct 2024 20:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuaY-0007Jl-3H; Mon, 07 Oct 2024 20:44:18 +0000
Received: by outflank-mailman (input) for mailman id 812449;
 Mon, 07 Oct 2024 20:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxuaW-0007Jf-IP
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:44:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8693cb2-84ec-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 22:44:13 +0200 (CEST)
Received: from MN2PR18CA0026.namprd18.prod.outlook.com (2603:10b6:208:23c::31)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 20:44:08 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::2d) by MN2PR18CA0026.outlook.office365.com
 (2603:10b6:208:23c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.21 via Frontend
 Transport; Mon, 7 Oct 2024 20:44:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 20:44:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:44:07 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:44:06 -0500
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
X-Inumbo-ID: e8693cb2-84ec-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3Cg+g5KZ0dziZTabN8I5EY/7PJqW884FSFwP/cAAJlVJMyUT8IEIekxNpd0QOd4AVOtYtuAhK55+kUnErcPbLZgHCOGv/kF9mi/KNAlCDB3DXInMUoqA9SFMPRQ+h7MmqVv/EgzAeJYgkSehsBq+hRLvsGJjvxdqd/JKCtNqShcxrybBw0o6kE6k6obGZebCFTERp42nShypVJhhuVi8aVapduroRcpLzGI0NPvqcyOpC93gVRS0j94iKUYYFLk2YUfED5bhlX+pSo+KfOdEnD3WSKWxYWc3nxHe+lTAM8T3phD4IFLbPDkAloPvxUqVM9VwQpSGs5pydETJNITQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aFKNN8zeTmL9p0hh2u5Ql5ouGkss6IbcxyAIunV52o=;
 b=NotYfhBlz5yM23RIwsQCRGNcvGPdqaakgb5wWuEWIowaUmFgVlJQfBm2BtqC09jFbnTAi0pGw46dBHwceERYqhShNCmUETV5R7TvawyKf3unu7mgRrq9oRg9EuJbViFk2pHBUv1D1dpcpkscxamlOrxhnSuiLdDsyONpD8hAu8Ln89gc8hNjeObtqtjLc4xLia0ZNK+BVS7pEp3mCNNVn38FUrZgoyaWJbWSJnt7zU5e9vVOsOasIG0DjFaYLMxMRcC7A6yNayrtI3AIl3lg44EFnHUk7/V1HeUDagSCVXfIdnYjkSAY6++6lfEV0ofNYIbSyMkpa9fiq5QVc4zJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aFKNN8zeTmL9p0hh2u5Ql5ouGkss6IbcxyAIunV52o=;
 b=pcz7IG9gTVCGExZONIkabs96c0UEUcIDTcX0chj28F/qe794QeunOzvlc9IleI1jBsi2kDG7/nqulxn+9j7NrbJ/PIN5FQXScGgNGg87VPDXbsRYZm3tDOa1W4OBsIefrDx1lh3yHeoGG5+97+2ShM0CtdHL/rUTnscHLJyqm2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bd0e24a2-dbd5-41d7-a85f-6aa6f90c0e54@amd.com>
Date: Mon, 7 Oct 2024 16:44:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/44] x86/boot: transition relocation calculations to
 struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-15-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SA3PR12MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ea8454-6663-4f99-4ad4-08dce710ca83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHJEeXVkaDYwYVMydmI1a2RNR2hoRnRIS1FCVS94TktzM2RrU0lGbDhMeExu?=
 =?utf-8?B?blcrdTB6N0hKT0V3VnIwT0Y4UkQ2Qk5XSlJFUkU4S2ZLNXVYcUo1L1hPYVJP?=
 =?utf-8?B?WUlMS3p3YVhBQkJLdGh6WFpPQWgwa28rT3N6SUx3cXBWM1RtN3cwWXQ1WDBF?=
 =?utf-8?B?Z251VS9PY2d0dWtsb2FUTWxJOXNaMVRUWkxUeExKT2EyRzlWeGJoKzVnOWVk?=
 =?utf-8?B?Si9tM08ySnZPamdVWjZNaTV4d3RCVjdoRklhbVJlcUZGZ2VRUU1SY1hESTBt?=
 =?utf-8?B?R3BzTTRMbWh2RlovYlFoOFl6VDV5WU1oVEpiNHpXRzV1aFdxSE92SDcxNWxU?=
 =?utf-8?B?T2lRb2s5am9TMjE5TTI2V3JzMFpueDM3S1VQbmY5cjNYelpoUXZiS3JwZkVs?=
 =?utf-8?B?SzdWSUFkUDBXOHV2MktvNDlLOGNlYjM3YzM4Z0htNXFvalJENHYxODNLTURX?=
 =?utf-8?B?MmIrMEhWSFlqWVZlWlowM2srb2ZVQnBjSGlUNlJiU3VHb3AxbFFLeDZIVUZv?=
 =?utf-8?B?OGswbHZWRGZBbkRlMzdNK0pOL3RwQVVJSlJRY09rZWhLSHFyT3FjZWg4SFc1?=
 =?utf-8?B?bUd0d2FLamNYUEdkSTkvRXA2SlkxdmZuL2FlYWFRSEMrS1FBNGNLMXRaVW1O?=
 =?utf-8?B?OGU1SVQ0alpiakpBd1lvR1B3QW54aHNoZDNmQ2N1czFUb3JNY3FydnZxL1BW?=
 =?utf-8?B?Qld0M0hMWEVlUFZndmE0MHBPR1A1a1JFQnFnTWJjVWIzRzRjL3BnNzdPYlhI?=
 =?utf-8?B?cnU0STNyMW42UGJhNXZRR3BvN0JzKzVyUjRTVFhhWk5oY0Z2QkdidThPTm9U?=
 =?utf-8?B?czA1TnN1S3NaRXdNbmlHWjRXakthaTBQaS8xdklXdkJhejRpQXMvcDZJK0tL?=
 =?utf-8?B?aUtJNTlLRFRLZUk0ZjVlQTlWcWJ5WHJjNGNqeGdaSnZrVHhoKzBoYldvK1Fu?=
 =?utf-8?B?RE4rbjlZT3pPVVFaeDB3STVMblZQSTlvSnJHL3phTk9xNTk2R2N3WCtsRWlQ?=
 =?utf-8?B?cFBna0RjU0cwMGRzcEU3ZERNeE56TmNiOXJheS9hcTZNZjgzdFVHQkQrQWls?=
 =?utf-8?B?MWZ1cUJLcFY2NVo4QkYxM3lKdldQaHNjWFZSRzFJdEZOTmpvcGVGdStGcm1X?=
 =?utf-8?B?Q1c5bVZKUXpJKzVobG5lYmpVd2g0ZXVhSmNDbnh5eHgvbXFKenhLZlRRYTdI?=
 =?utf-8?B?dW16a1pISkY2RzVPTjNkY2lXcGZXWmM3ZGxDeFdRdDZ6Y1h1NzA2YjQ3eC9m?=
 =?utf-8?B?T09nN3E4eDk4eVFHTW1lVE45cGQ2S1BEZUk3dktOeDFlQldQVE5OZkFQT2oy?=
 =?utf-8?B?bTN6ZUNXOXdUSzdyRjlvOFVpbDZnSnMySnFRV2ZsQXZ3NXNPTXNHVFRMMmtL?=
 =?utf-8?B?R2hXa2pYSExVaDBiY2ZrbVNDYkk2c0w1cEpEdXNYekNYTThYaGNkSnVPUWsw?=
 =?utf-8?B?NmV3RjhOWm9URTlQVWRuaXlKQm5uZFUvTzZ2MElSU3pxbjlmUlRDUW1zNUlr?=
 =?utf-8?B?YnlSK2k4cStMMG5ydTVKaVc2YVR6ZHl4M0Yrc3pSaDF6QmZqazZhZytGdk5X?=
 =?utf-8?B?Z2JrK3QzaWM3ZkFCczV4eDlYRy9aUlhVSnpoTlNTQkFBSTlOTGdBVjNLc20r?=
 =?utf-8?B?ZldETnUyT0xsbmthdU95bDhldW10TEJybXpzUlV6MzBqbnlWZlAxSi9VVWtv?=
 =?utf-8?B?MzNKQWpLTUlDSnVvWmFxVDh4aGplWWR6Y2RvVVNDTGx1ZVY5NkpVeXZFN2Jr?=
 =?utf-8?B?emtiNEFrVFc1Y0svNWlNaHVPaWMydTVJbVpvSHArZkdMUCtlTE1qdHo0eTlT?=
 =?utf-8?B?azRUdnFtWkpLOWtHU29DRWlwcERGTlBRTTFVN3ZISWF6d3dta3Q2OHAxMHZv?=
 =?utf-8?Q?O9xu2iwoPRi2J?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:44:08.2081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ea8454-6663-4f99-4ad4-08dce710ca83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Use struct boot_module fields, start and size, when calculating the relocation
> address and size. It also ensures that early_mod references are kept in sync.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 36 +++++++++++++++++-------------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f968758048ed..4f540c461b26 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1490,7 +1490,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>               struct boot_module *bm = &bi->mods[j];
>               unsigned long size;
>   
> -            size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
> +            size = PAGE_ALIGN(bm->headroom + bm->size);

Is there a mismatch from mod_end in PFNs to bm->size in bytes?  Or is 
mod_start in pfns and mod_end in bytes?

>   
>               if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
>                   continue;
> @@ -1504,13 +1504,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>               if ( s < end &&
>                    (bm->headroom ||
> -                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
> +                  paddr_to_pfn(end - size) > paddr_to_pfn(bm->start)) )

Drop the paddr_to_pfn if both sides are now in bytes?

>               {
> -                move_memory(end - size + bm->headroom,
> -                            (uint64_t)bm->mod->mod_start << PAGE_SHIFT,
> -                            bm->mod->mod_end);
> -                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
> -                bm->mod->mod_end += bm->headroom;
> +                move_memory(end - size + bm->headroom, bm->start, bm->size);
> +                bm->start = (end - size);
> +                bm->mod->mod_start = paddr_to_pfn(bm->start);
> +                bm->size += bm->headroom;
> +                bm->mod->mod_end = bm->size;
>                   bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
>               }
>           }

> @@ -1700,13 +1698,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        set_pdx_range(bi->mods[i].mod->mod_start,
> -                      bi->mods[i].mod->mod_start +
> -                      PFN_UP(bi->mods[i].mod->mod_end));
> +        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
> +                      paddr_to_pfn(bi->mods[i].mod->mod_start) +

Shouldn't these be
     paddr_to_pfn(bi->mods[i].start)
?

> +                      PFN_UP(bi->mods[i].size));
>           map_pages_to_xen(
> -            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
> -            _mfn(bi->mods[i].mod->mod_start),
> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
> +            (unsigned long)maddr_to_virt(bi->mods[i].start),
> +            maddr_to_mfn(bi->mods[i].start),
> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);

First argument should fit on same line as map_pages_to_xen().

>       }
>   
>   #ifdef CONFIG_KEXEC

Regards,
Jason

