Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154F99554F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 19:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813392.1226320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDhE-0008My-GM; Tue, 08 Oct 2024 17:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813392.1226320; Tue, 08 Oct 2024 17:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDhE-0008LT-Db; Tue, 08 Oct 2024 17:08:28 +0000
Received: by outflank-mailman (input) for mailman id 813392;
 Tue, 08 Oct 2024 17:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDhD-0008LN-4N
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 17:08:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed609801-8597-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 19:08:25 +0200 (CEST)
Received: from PH8PR05CA0022.namprd05.prod.outlook.com (2603:10b6:510:2cc::10)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:08:20 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::f3) by PH8PR05CA0022.outlook.office365.com
 (2603:10b6:510:2cc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 17:08:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 17:08:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 12:08:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 12:08:18 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 12:08:18 -0500
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
X-Inumbo-ID: ed609801-8597-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH69uf5U1caztKu8tqtk5FddWN88pO2caXDkPvlU+vWHyAtDLnsHhx+o8TzO+N7uhtopamW1lQfS52vCofcvGOXQLgFJMXYa47dpZyBUhDQGrSpBSASb/Bae5w2yFDx4dYhEnienpCf08by2QG4VavmQnR7sGgJuWWoofEqvQarE+4hF6G+voIW3IkKC87ZG0cQn1rMox1id6Y88WRySSksK1u/7a8t9JZoSP+GT9vCVPoIZY28lof3imzRTrSHwz36o+mIabnDlX5kRxSjVwX0RKON/EZUuU2OwwrEb3pOR7T9rytteOC3L5k8q5mraI3bfklnIrhKLWZiJsCMOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4PqYY8vaPyU4fep7AqwrEpfeeWyJp6J+pS3JulfCAI=;
 b=zUNVzOcuZewFiP3RbXBc0sTKdwCVFnwVKacMvxeO9iuzvb5TwPV1Vp9JAhfaCxsc2e1OWSbtk/Um4qYo+LuJ+inmlCjlb7D5t98AXTYASB0D4oyxaeB00BvcJSgi3QJB4Er1GNHjAXZFfRmThAfK3Vy08wQEh+6/vgvQbda8cB4FVu0wYuMLA78Uw6JG6CsR2JIKi82f+LSInjD52OufJbRjtPlZR6aY/x+W+EWvl+k5ZHeMnGxJbwbGCnKu17Zo8T4obhfZBbuVxPrx2fkOiGVmPzRfs49YbVJyhmrezzWUNxnqH0ChC3zICodcVC/SRxWJVlv4Ijgcix4WchMORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4PqYY8vaPyU4fep7AqwrEpfeeWyJp6J+pS3JulfCAI=;
 b=12BTDnF8EqSpu1jBArRgmZCzyJDY4GQUhq5jQPu98wnyAlfiI34imEGsVT5DQ4W2k1Y7sZrjXM1G1owJBfhc3OEWnd4CtDBtYR9E7ZITVaOU37bL2Zga9k5IKohhqVuOKc3Fk4SEevRTNLMvEAsvSq7+1alEMtuDVXVcZDKEQzw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cc11ab03-d518-444b-bc0c-24d656ea1e8d@amd.com>
Date: Tue, 8 Oct 2024 13:08:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/44] x86/boot: add cmdline to struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-29-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-29-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bc4a79-f7a7-41eb-08e7-08dce7bbcf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzZpSDdySjR3REswWkxUamZWYUdhbXpFeUhVbWVjR2h3MVErai92dUphUURl?=
 =?utf-8?B?WlkrcnZDSG5QK0NOaXRCcDJLS2tOZVBuSnBsZnY2bCs5dnZnblhiUkpqUTNK?=
 =?utf-8?B?aGFQK2U3ZWdqeTkzWXcxZDhZOSs5L1FFSFoyVTY5eGc5bGo1c1Zxb2hmeTB3?=
 =?utf-8?B?dzJPL1pPdk1BWTA0cWFBeG1vZGp6dVd4VWl2eFRvVFo5MjJnMCtLVHJGQkZU?=
 =?utf-8?B?UFRrM1hQN25Nd2JySHpiTTlpdEc3b2pDeHl4MVM2OUJIRm9LN0dCOVZXTWtP?=
 =?utf-8?B?MTF2MDZuTmMydDhSVlVIcGRoeUtkRzRlZmpWRkpGNFg2eFdEZWFKeTlKLzhX?=
 =?utf-8?B?RFNQd0RZaEtPZ3ZYd096dnpvMnJzWjZFSUtVdzZXMVVKS3BnNGhHSkNsbnFk?=
 =?utf-8?B?R3A5M1VLd3djVUwyMXJNUWthdzd3bHJnSENEa29LNTVNN1pzQ1RROVRCcHd6?=
 =?utf-8?B?VUcyVUlnVFV0T3NEV2p2MDhQSE90Z2ZFUlRaQ2htNlBocDVaaVo0c0NSYTBR?=
 =?utf-8?B?QklJWkMyTUNuNE80bWRDdzl3MHlyVFNGN1hQQ2dNcXVsSmdkZ01CZUQrbDhJ?=
 =?utf-8?B?dVZ2VS9SMnhteXJiVHlnV0pnell5STlwS0hGdUIvWWRzNkdlS1NicTNTdjBT?=
 =?utf-8?B?cFRNN2pQZDNtUGFjRmhHejFoZEVVUyt2K0VJbHdyYUV3cVRyMDNpQ0xnazVn?=
 =?utf-8?B?aUs0dzJlbHlmQU1sd0pibngvNlpobFlQNkNlTTdGenlOaWF1cXVET0tZV3hq?=
 =?utf-8?B?cDYxdk9ZUXM1Zmd5c3VyTE1ncWlyVmVrZThjUkZEWG9LNDdVUGxGeU5FbDda?=
 =?utf-8?B?OUJVYm5PS0VwNGxuSEhWL3BmRFFXcTlPc0RHWGdKMklxcTkxS1o2L3N2RytS?=
 =?utf-8?B?NDVmMXhQRjYrR00xNHBBY3ZvK1FrOWhBSFMrYi9SSUlVQy9oVXM5K0U0TzI0?=
 =?utf-8?B?Zms3THdVTm1Dem1aOWFHWDZGTkNJbTFJamtaY2tRTGlHcXJITFAveVBiRGlT?=
 =?utf-8?B?SXBoTTlLVkRHbThXMUVZR1VjMmwyMzZzN2ZPanQzMEllRkJSb2xVY3k2blYr?=
 =?utf-8?B?Uk9ZNVpSeFhQS2srbnJUdjFzdElQUlVvMGFRanBWbkJONXdJd3p2OTI3OXNS?=
 =?utf-8?B?QTN0blUzR2pqNlBUbGhoN2tZaVVidTFRV1VMbm9ZbVZPaE5aOUhpeWU2SXB6?=
 =?utf-8?B?b05ZS2V4cHpNT1c5UmJ6aDR4MHc4SUdmYmNkT2RGQ3Z1TTZKakhzZnRSNnl3?=
 =?utf-8?B?MnFnRUw0VTBKV2xiYWlOdW5CYm01TzFEWElMMGRmdDJxQ1BKQ0ttbzZiTjgx?=
 =?utf-8?B?a3FCaXl3VTg0SEw5c21aQzYzWWZKVE94ZVpFZEhpUVJkd29haWdoZUNpRHM1?=
 =?utf-8?B?QWhWMnYwVUZYQjdhVFJvaVpxT1NxZ1NGem9iYVZYNTdmSnJjK2tMSXJ5L0Iy?=
 =?utf-8?B?WHRndkI0NUk4WG0zd2NWbGVqYUNaR2VmZlpnUXF6d2Nud3haY2QwOUZmR0ht?=
 =?utf-8?B?clZlSEJnVzE5eEx0R1p5U0puVDhFNzJHa2gySGdnZEJhTE8reCtwRm1WTTZr?=
 =?utf-8?B?Nkh6eTIwVUlZWm8wMy9Va2tudGdJejJxbU04OGNoNlZqRWhiYnZnZGlqWGpF?=
 =?utf-8?B?aDd2cEVRNk5JTENycVgxK0pUVVp3czRBRDE2cFFTZEpZTWNsMC9BdnM1ZFBt?=
 =?utf-8?B?TlZORHZEUi9uTXhCZzZQeGZsOU56ZCs2MmJoKzBVeiszOGI0VlhuREorVnlq?=
 =?utf-8?B?eVF4LzVzRWYxVDZGdHZuWnZRUVJnR05rUENJM3l6Z1pFYzhIOXdHRmo5SG5z?=
 =?utf-8?B?MVdTaFRrT2ZGZHh3eXQzbllmYkd5eVprRUh0cjBMbUV4QS9XcmV6YTFrdDRn?=
 =?utf-8?Q?XpEHFDTke36jD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:08:19.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bc4a79-f7a7-41eb-08e7-08dce7bbcf1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Add a char pointer field, cmdline, to struct boot_module to hold the address
> pointed to by the string field of struct mod. This removes the need to use the
> early_mod field to get to the dom0 kernel command line.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 2 ++
>   xen/arch/x86/setup.c                | 9 ++++++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 9ed260629012..3b6bfbe88770 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -38,6 +38,8 @@ struct boot_module {
>   #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
>   #define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
>   
> +    const char *cmdline;
> +
>       paddr_t start;
>       size_t size;
>   };
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index aed0837902c4..d5916e85f68e 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -312,6 +312,8 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>       {
>           bi->mods[i].mod = &mods[i];
>   
> +        bi->mods[i].cmdline = (char *)(paddr_t)mods[i].string;
> +
>           bi->mods[i].start = (paddr_t)mods[i].mod_start;
>           bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
>       }
> @@ -1000,10 +1002,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           panic("Error creating d%uv0\n", domid);
>   
>       /* Grab the DOM0 command line. */
> -    if ( image->mod->string || bi->kextra )
> +    if ( image->cmdline || bi->kextra )
>       {
> -        if ( image->mod->string )
> -            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
> +        if ( image->cmdline )
> +            safe_strcpy(cmdline,
> +                        cmdline_cook(__va((unsigned long)image->cmdline),

char * seems inappropriate if cmdline isn't usable as a string.  Maybe 
have cmdline as a paddr_t, or can __va() be used at assignment time?

Regards,
Jason

>                           bi->loader));
>   
>           if ( bi->kextra )

