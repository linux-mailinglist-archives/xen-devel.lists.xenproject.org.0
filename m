Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F39DFC8A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846379.1261557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2Hv-0007ty-10; Mon, 02 Dec 2024 09:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846379.1261557; Mon, 02 Dec 2024 09:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2Hu-0007s0-Td; Mon, 02 Dec 2024 09:00:14 +0000
Received: by outflank-mailman (input) for mailman id 846379;
 Mon, 02 Dec 2024 09:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iz4U=S3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tI2Ht-0007ru-8G
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:00:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:200a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ecfe85-b08b-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:00:04 +0100 (CET)
Received: from CH5PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:1ed::24)
 by CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 08:59:58 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::76) by CH5PR02CA0023.outlook.office365.com
 (2603:10b6:610:1ed::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Mon,
 2 Dec 2024 08:59:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 08:59:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 02:59:57 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 02:59:57 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Dec 2024 02:59:55 -0600
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
X-Inumbo-ID: d0ecfe85-b08b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjIzIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQwZWNmZTg1LWIwOGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMwMDA0LjAzODk3Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBd6ADSQXbKsXgLZlwVy6g1vJOxSp5J2taU0/sEi0AWgpnxIgZTxsGWafcDz89Hp1FYEtspsRHvY/As+vfJmvdrNJxzvejotdqT5JNQDPClk8C3rq/1ZzWZRt+YHOmxjSNgbXDTGBSJ/NWcJv1THwcPmk9actKm922QbbLuS6yF8kZUBQawsPY6nTBRQI5qT1P+mI5jXV93RcxcAkdm0NSqjegJrBG5dK5YhPLNXd657Cg2dXOsZMxmjzcMNQxcGSMXosAeLsCXm5WD6gWiWG9uZRDzcRqOGXmxfxWcGhtvBfTZG1K/9norttTfIuHhbsHmE7zKlMVuo3fHZzfk9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp/U1v6+FQ6/1wXETDAFYDJzqNc3x2DplBj5uXrEDyg=;
 b=WP+l1d2ksuSJxKLANCkc2olHsYIoOjvKbW+L/VlbC48xACQFCSuHC+cQcNuLhMQTmcK07fc78apuWZDPYrJQzdGz/Vo0QuwYaEZ0/wViMUEngdH68rzXkRmkcFbf/57G7RgisqWXga+YoVh0RmDkPTBNb4KU919CfwsWn3PGUWyth9achTCrk1/KRtY6SyhIdiypRhVFhs5FNrhCC5ARkbqPMPpxBPey8coqQPx3aSD6bQqKDYAIswqE3RkCG3PV+Cnv0amZlWdc+Eot7pis+DBWIm/G2ZFTihTtXpBnQwYxgadqEMd7C1MSJUjP2VsOazqATHg5xI0IGxJd4D9Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp/U1v6+FQ6/1wXETDAFYDJzqNc3x2DplBj5uXrEDyg=;
 b=hkGj8d07NwFEnrYXxyNmdB073TaRPGLGi7NWTK3WPgOtoKIXsJVRHnuOvJApZniZ4Z2rwePfZgOj6Ur7cfIeAd+2g2nyjb+VDCbHjZiWxx//wgwGmn+Z58p4wf1XADcb7qU5oq1DseAK5yA32iJLXbS0YjjuiuDmMirp+a/42L0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c069caef-77bd-40c8-81cb-9f1667962d39@amd.com>
Date: Mon, 2 Dec 2024 09:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/12] xen/arm: make consider_modules() available for
 xen relocation
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-12-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-12-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4aa6ea-0467-41cc-3d29-08dd12afb2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjNLdHk1SU9GSGhWQVA0S2FvR1pLYlVTNEhXUE40YlBmRjRYQzJRYlZYaVJR?=
 =?utf-8?B?MWx1THcxaDREYXJRNUpYWFFMYUF1a1poYVhoMFkrSEpCOWRteDhJMUdIZ0No?=
 =?utf-8?B?clZhNFpKVGJyR0J0THBQR1ZTQzA1dUlNT00wakExV3l5aERybHlGRGtHbHp4?=
 =?utf-8?B?ZEZNUDFFaU5weXRPamJnb0lIZ29UeElJdGU5TUhReVNGMU0rNHFROWVLVkcx?=
 =?utf-8?B?VSs1d0Mva0k4NUN2NllQZGNDcytraG1GMjdHOWhTc082dzVQVTRXekx1ZEVQ?=
 =?utf-8?B?M0t3VUl6LzdhampKazNFY2tPcnVqbmI5NFVXa0ZKMmEvcldwSWdCaEQyMjFP?=
 =?utf-8?B?dlREeWF2c1ZtZ05KS25qRy9FczMvZEZ5Q0w0aWRhQVhxNlhSS0JQbmZqQVYy?=
 =?utf-8?B?cW4wZE9tUURGeGNNWjVVeThuNHRTQThWcHVHdWdkb25ZRGlDaXRJMldXTDB0?=
 =?utf-8?B?UTlWaDZyajNrMEZXTllrbUU5SzMveEpQdzROa2NBNlRZK0tZbHE5SDc4YzEv?=
 =?utf-8?B?TTF6QUlCVnlQc29NWWZvUjZhSFhITHlzaXVSbnNya1A4anRrbm5nL29YNU9D?=
 =?utf-8?B?bUZsK05tQWIrdXFZZkNFNEhtMDFaYnJiRCtjMkhaUmIyQkhqd0h0V2QxaElS?=
 =?utf-8?B?Y3dQMDAxNlQ5S0FjVVMveTczWmRUZjlYbWlFSGUyTG1WOUFPeDIvdmJudzI3?=
 =?utf-8?B?WXJiZ1QrY2kwbFUyNWpuRTZkejFMVTE2eXUyNGM5NEFUNnRGZUFVa21valg3?=
 =?utf-8?B?SVVDbkVHa3Z0bTVrTmV4dHRwWCtwYmttYWcrdjFJM0RkWGRxQVREdjhrWFhD?=
 =?utf-8?B?U29QZld3K0p6ZnJmanVOOTM4NUt5TkorN2VyNTdlZ1FqSWljckRPQVJNNE9v?=
 =?utf-8?B?ektTay9sWEFIUnBNbFdkMk5DeGhFZ2IyQmVWejZpa3VkejNJMnRBUjVKVkF0?=
 =?utf-8?B?Z2s0VFdvWUhJSGNldkxoL0c0K3hBSDhjb25oY1U2Y05RcmZCelNDaXgyS1hE?=
 =?utf-8?B?K3craUZRb0FVYnZhNkFQQlA4UHVGVlpWSmhLWmUzNzZTcHpQdFY4Sk94RHBr?=
 =?utf-8?B?YTV3cmxWUHJUWU1MZmlRYVg2NDN5dVFKUW1ERXF0aXE2WDlyV0tOTE5DK0Ir?=
 =?utf-8?B?WVFjUTl1dlAvTUthc2d2WXMxRjZ5SEFnd3FBOEx3OUlHb3dBWWZxRitYdDRM?=
 =?utf-8?B?bStmNHlCVmNBU3M1MjNmSTNyTjdoaG5PbG45bG9ySGpQeGtyNTNUOFNRQ0xx?=
 =?utf-8?B?aEIxNTZkQndjQlFLYlN4U0w1S0hFMEp1NURnQXRrSlV3UG9VMDFnZ3Z5QlIr?=
 =?utf-8?B?VklsV0NlRUxNTFlvZ0l1WmdyYjVnYVNvMHpFZEkzN2hZY1N1OEI1dU9EdlNn?=
 =?utf-8?B?RW90ejJVcW1yU1VVMExnc3FkWWFlT2tKOWlTc1RNaDVFckdVWWV0UTAwSnpB?=
 =?utf-8?B?QVcvQXlYQ2FqVGpBc0ZoNlNkMEpGL2FEdTBQZWtSWXdleFB6WXNHTlVqM1N0?=
 =?utf-8?B?TnJjT3dVRW1MZzJWeGhGTlRHSVh1cDkvR3ZqV1hTT1dyMGtndGx1VFFmeVo0?=
 =?utf-8?B?NnJrQm9ITnZQOE1qblBMc0RTdUVidmw2YTUzdUNRS0doSDJaZWpLK01tOHhs?=
 =?utf-8?B?UUxtWjZPZ3czcXA1QXUyaFI0bXd0MWNaNVVzSFN0clYvS3V1Qm5EL3plR2NG?=
 =?utf-8?B?UzduT3gxS3FqakZuSHRJbDZ5SDFHcHJod2ZIM0ptbnJIaDJNYjlxMWd4cUFB?=
 =?utf-8?B?MkJuTS9wUEpZMFlvTTcxWElFcy85UnN6cUIxUXRiQ3dRa09ndmhRWjNxb3gy?=
 =?utf-8?B?dTNOVnBKMTV5VGs5Mzg5VkxWdis5eDdlYXllaEd0T2ZUOHVId2hFOE5xbVIy?=
 =?utf-8?B?eGdrWG1QRVhOQWRucDJIL1pLamY3M2xGeEFMdzFkN2w2eWV0ZmVXVzZ2anRV?=
 =?utf-8?Q?gZmGl6mAunQBE9nIAqsYC+70SjLpZ2es?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 08:59:58.1029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4aa6ea-0467-41cc-3d29-08dd12afb2a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> Cache coloring must physically relocate Xen in order to color the hypervisor
> and consider_modules() is a key function that is needed to find a new
> available physical address.
> 
> 672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related code out")
> moved consider_modules() under arm32. Move it to mmu/setup.c and make it
> non-static so that it can be used outside.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v10:
> - no changes
> v9:
> - no changes
> v8:
> - patch adapted to new changes to consider_modules()
> v7:
> - moved consider_modules() to arm/mmu/setup.c
> v6:
> - new patch
> ---
>  xen/arch/arm/arm32/mmu/mm.c      | 95 +------------------------------
>  xen/arch/arm/include/asm/setup.h |  3 +
>  xen/arch/arm/mmu/setup.c         | 97 ++++++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+), 94 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index 063611412b..c5fcd19291 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -9,6 +9,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
> +#include <asm/setup.h>
Sort alphabetically.

> 
>  static unsigned long opt_xenheap_megabytes __initdata;
>  integer_param("xenheap_megabytes", opt_xenheap_megabytes);
> @@ -31,100 +32,6 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>      directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
>  }
> 
> -/*
> - * Returns the end address of the highest region in the range s..e
> - * with required size and alignment that does not conflict with the
> - * modules from first_mod to nr_modules.
> - *
> - * For non-recursive callers first_mod should normally be 0 (all
> - * modules and Xen itself) or 1 (all modules but not Xen).
> - */
> -static paddr_t __init consider_modules(paddr_t s, paddr_t e,
> -                                       uint32_t size, paddr_t align,
> -                                       int first_mod)
> -{
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> -#ifdef CONFIG_STATIC_SHM
> -    const struct membanks *shmem = bootinfo_get_shmem();
> -#endif
> -    const struct bootmodules *mi = &bootinfo.modules;
> -    int i;
> -    int nr;
> -
> -    s = (s+align-1) & ~(align-1);
> -    e = e & ~(align-1);
> -
> -    if ( s > e ||  e - s < size )
> -        return 0;
> -
> -    /* First check the boot modules */
> -    for ( i = first_mod; i < mi->nr_mods; i++ )
> -    {
> -        paddr_t mod_s = mi->module[i].start;
> -        paddr_t mod_e = mod_s + mi->module[i].size;
> -
> -        if ( s < mod_e && mod_s < e )
> -        {
> -            mod_e = consider_modules(mod_e, e, size, align, i+1);
> -            if ( mod_e )
> -                return mod_e;
> -
> -            return consider_modules(s, mod_s, size, align, i+1);
> -        }
> -    }
> -
> -    /*
> -     * i is the current bootmodule we are evaluating, across all
> -     * possible kinds of bootmodules.
> -     *
> -     * When retrieving the corresponding reserved-memory addresses, we
> -     * need to index the reserved_mem bank starting from 0, and only counting
> -     * the reserved-memory modules. Hence, we need to use i - nr.
> -     */
> -    nr = mi->nr_mods;
> -    for ( ; i - nr < reserved_mem->nr_banks; i++ )
> -    {
> -        paddr_t r_s = reserved_mem->bank[i - nr].start;
> -        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
> -
> -        if ( s < r_e && r_s < e )
> -        {
> -            r_e = consider_modules(r_e, e, size, align, i + 1);
> -            if ( r_e )
> -                return r_e;
> -
> -            return consider_modules(s, r_s, size, align, i + 1);
> -        }
> -    }
> -
> -#ifdef CONFIG_STATIC_SHM
> -    nr += reserved_mem->nr_banks;
> -    for ( ; i - nr < shmem->nr_banks; i++ )
> -    {
> -        paddr_t r_s, r_e;
> -
> -        r_s = shmem->bank[i - nr].start;
> -
> -        /* Shared memory banks can contain INVALID_PADDR as start */
> -        if ( INVALID_PADDR == r_s )
> -            continue;
> -
> -        r_e = r_s + shmem->bank[i - nr].size;
> -
> -        if ( s < r_e && r_s < e )
> -        {
> -            r_e = consider_modules(r_e, e, size, align, i + 1);
> -            if ( r_e )
> -                return r_e;
> -
> -            return consider_modules(s, r_s, size, align, i + 1);
> -        }
> -    }
> -#endif
> -
> -    return e;
> -}
> -
>  /*
>   * Find a contiguous region that fits in the static heap region with
>   * required size and alignment, and return the end address of the region
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 64c227d171..0c560d141f 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -89,6 +89,9 @@ struct init_info
>      unsigned int cpuid;
>  };
> 
> +paddr_t consider_modules(paddr_t s, paddr_t e, uint32_t size, paddr_t align,
> +                         int first_mod);
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 9664e85ee6..1cf62390e3 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -6,7 +6,10 @@
>   */
> 
>  #include <xen/init.h>
> +#include <xen/lib.h>
What's in lib.h that consider_modules() requires?

>  #include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
Why? AFAICS, this header defines fdt_get_mem_rsv_paddr() which is not used in this file.

> +#include <xen/llc-coloring.h>
Why? There's nothing LLC related here at this point.

With the header inclusions sorted out:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


