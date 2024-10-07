Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50779936E9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812345.1225075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxst0-0002gE-Mw; Mon, 07 Oct 2024 18:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812345.1225075; Mon, 07 Oct 2024 18:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxst0-0002d3-Jn; Mon, 07 Oct 2024 18:55:14 +0000
Received: by outflank-mailman (input) for mailman id 812345;
 Mon, 07 Oct 2024 18:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxssy-0002cx-Km
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:55:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acb2b091-84dd-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 20:55:10 +0200 (CEST)
Received: from BYAPR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:e0::27)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 18:55:06 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::55) by BYAPR05CA0086.outlook.office365.com
 (2603:10b6:a03:e0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Mon, 7 Oct 2024 18:55:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:55:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:55:05 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 13:55:04 -0500
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
X-Inumbo-ID: acb2b091-84dd-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKNoCNqlMwzdUiSrDvX3aXc7WhG5WTj1UGMFXF6/Yr8wiZnJjO8CcE8J1Ochg/tVnZJW73yvs8jHtfAwGPPJ+8mFI5whdb4xVLixsv7Og+OfreVr1Fz8BjJ1QDIb1X0JHn804TT/YZfgdyeq4lX6L2wmUJR2b2JtSXA+bg5r0HWEDrmsHt0M8bAA8+YkTFcdgbk+nET4VXfrNjsfgQjIdXHHvtA28i1GgtaU0aRdfYLJxSFUtkH/7OjZtBojVKzq4rrU+qRw1lHzieB6r1tK3AS21drG9nhm7WU3Luw2Gnxr8YPq8ljiU6wf8W21d7qHQ8uK/1jqszk1EM8kIhtyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwYtHh0L3KCIcFt+4d2OyIplEEg0uBKf3d0pfIJMBiE=;
 b=eLyEJfDL1C27/oTD+4MNIR1hsAk10SiAqQ1Q6cIbKG5g6os56OgefrCNvwWru2Z4/uyMKGwwCugS3N/P0nVc+X8VQe4JkLbMLN0wmGKvKe9QHUishTERaFEVrnxgBmFO25ahAjfHasi//P5jqIfLLux4ACyips1KXtz4YlctvluEPDOZY1rfkxTnRvFJW6efsIUbEgTs+EGqyM0KLDNDovb/s6v1A07OKlZ/FNjV7WhPEMowEMYskd65kgXiBv67lGzpZS/QhcHUiUiEVj1k0vIDN+tEOOH5VTcl0jXIAPfV5t2hU6rZOBtcKs70QykJneezKtGbx3GhA1MldS5aKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwYtHh0L3KCIcFt+4d2OyIplEEg0uBKf3d0pfIJMBiE=;
 b=zFT698ZMX6HZlszX1ymRhNaE+1OLOicUhs+ayjuhCHWCAD4+JfwgHHrx+q8yWAb8eXAxd7H2/FtJGxznFgv1qrNn7pdJWXJNerlYM3vJvrxR030XefAl+X4vWZ1eHKE8fNbOUllQ6zue8bfLcsjc5F+hNPkEQhoTjxenk2c9J/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <af3c6fae-ac24-4629-b295-2dedb5824819@amd.com>
Date: Mon, 7 Oct 2024 14:55:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/44] x86/boot: move headroom to boot modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-8-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 65eb3dd5-7775-4309-6730-08dce7018f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFM0bzNvSkp3SDlUSFBwaDYyZ2VGU3hIQno1YnRENnBZY1RSaTJZOS9Kd0E3?=
 =?utf-8?B?Ymx6ekxrdEp0Z2VNZ0hFMnVhYnBvOVFKMlFhbjlGb25zdXhDRG53SUNYVGt0?=
 =?utf-8?B?Wkhld1FJcDgxdy82WU8yVFQ2bFFJN2NabDNmVk1UWFB6cy9wUHdXcXVLK3B4?=
 =?utf-8?B?R011N21SVTJWZ2htR0FqTkRndlRubVRJTHZiekxETlAzQlM1bkhKdURyQ25o?=
 =?utf-8?B?eEhPcWxKV0JLM1NPc3orUDJ0VTltS2JiZjgyT0I2cWFpbHVSbUg0SHR4MjN0?=
 =?utf-8?B?NXRPb1U3dm55bEZGU0dlcmNqQ2kwVlp3WldtZ0gxemZvZzRBc1VxSkRTYXhV?=
 =?utf-8?B?UFdpWjVtMEw1RHA1clZWejYvMHFzYzVtU2swNis5T1dpUGwyZkJlSDFGalhp?=
 =?utf-8?B?Y2k3b3phZzJJU01FeVdrQVQ4a3ExYjF6VjhQKzBWZGZNSlVJc2NkMWNyWm43?=
 =?utf-8?B?VHg1RllSbjhjdlRsNjQvMS9qcWp0N1M0eVVZRFVTcXFISVNycDhUczE0NURF?=
 =?utf-8?B?SGVvRlkyVGJoNVJuNFI4N0xmWkdLeTFnZHZSSUVWOVlLMXlPT0V6Qm1hK21L?=
 =?utf-8?B?L0xJRVVSSS9iY1pFeGdwd3hxUkJ4YUM1MXhueGtDUjZJWUxtN0dyTjBFZ1lq?=
 =?utf-8?B?U0R5Zk5MWFVtM2lIbTdyY2xxejE3YzIydUpOSzcwN0xITDlFOFJJUXBMdTVM?=
 =?utf-8?B?Sklvek5BTkQ2M08vWmx4anBuV21EeVNKV3NEZzhGTjVYSVJXd2lzdDh0TnNW?=
 =?utf-8?B?MzlDOFlqaXJSUDZnc2thblJUZVNFL0tESkd1VlJoUVI4ZkNYZUNJQmlCbGJs?=
 =?utf-8?B?VytnZVdFZWFjZDAxVXJvT1lzbkdoaGMvOFkxSExuZzdFTW5kUWtsWDJWMW5k?=
 =?utf-8?B?Z21TbUo2cEwxNENrQnNvUE1yMzZPU1h4TjloLy8rT3RvQWRmaWE4eTc3eEUw?=
 =?utf-8?B?TmMwSUNZK3dJVVkvbmFmNUhRbkpEYUg2cnBLakdiNm1NK2VsR2VYUXI5dlFo?=
 =?utf-8?B?ck1oaVBvRDg0SVBwWWNQbGQyakUvQ1JpRFFoZTJ4bVRwTHVMWHh1LzkraElP?=
 =?utf-8?B?anNXMThjRldzRnk5RkdCeTUweFNqeE5jcDBSQmlxSjZaMXhvaHp1bWtCQ3dy?=
 =?utf-8?B?eG9sQU5vdTFidVIwb3JreCtYTUdodk5LbVRwVWRiM2lCUGlzekpQbEc5S1RV?=
 =?utf-8?B?dGpFLzQycUNoZm5uNnN3QjBHa0UxV0s5S2lKc204djZWQ2dxbE5QUmVWM0pk?=
 =?utf-8?B?aVBqS2I3Q2hFSFQxK3Q3NUU5WTNNbmNHeCtmeHd1VEFTQTBqL2Z1aW9xTnRI?=
 =?utf-8?B?ZXhQSkRVNmdpWnNZT25BRWhUSDVOK1BYbGt3US9BV2pFblBPWmtoTkszVDda?=
 =?utf-8?B?K21iSDhlazcrTUlwM0w3ODFUSnc5V3BHRWNSQVVvNTgxNXZDWWpPOW9VSU8x?=
 =?utf-8?B?S1dCMnVxdEhYR1h5eFhRTk9VRmFJSXl0c0xST0wwbFliZVdVaVM5ZHd3T3E0?=
 =?utf-8?B?NllCaTlJR0dQcjRqYm9aZ1QxSDUyejA2QjB6eElGeVlkdWEwL2NlWXp4K2sw?=
 =?utf-8?B?eHpLWnMyb2hNVzA5TzhnWmFodFMzeUtGaHpveGxSVm8ydGdNWkZtWWp0OUNT?=
 =?utf-8?B?bk1SWGF2Zy96NFlibi9NMDVrckhyL1BWbE5LeXRXUy9KaEhnQlFzcEFVNUFn?=
 =?utf-8?B?Wkh4NGNGUmQ3aXk4L0hGblFQaG0xWkZndndHanRIUEIvRFhPNTBXQy9jaHFY?=
 =?utf-8?B?UkZ2Y3c2QlIxSDRsQU1pV1o3OWRmUHV0TW9RaHpvQWpralFic0IzOUp3anlq?=
 =?utf-8?Q?4W1pKnLU6l7ZLXs42WS4cWCgL4eRPYyR01DY4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:55:06.1931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eb3dd5-7775-4309-6730-08dce7018f2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The purpose of struct boot_module is to encapsulate the state of boot module as
> it is processed by Xen. Locating boot module state struct boot_module reduces
> the number of global variables as well as the number of state variables that
> must be passed around. It also lays the groundwork for hyperlaunch mult-domain
> construction, where multiple instances of state variables like headroom will be
> needed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h |  5 +++++
>   xen/arch/x86/setup.c                | 23 ++++++++++++++---------
>   2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index d19473d8941e..c7e6b4ebf0da 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -17,6 +17,11 @@
>   struct boot_module {
>       /* Transitionary only */
>       module_t *mod;
> +    /*
> +     * A boot module may contain a compressed kernel that Xen will need space
> +     * reserved, into which it will be decompressed.

Maybe "Extra space, before the module data, for compressed kernel 
modules to be decompressed into."

And some ascii art could help:

[ headroom ][ compressed data ]
  <decompression>
[ decompressed data ]

(Not sure how to create a down arrow...)

> +     */
> +    unsigned long headroom;
>   };
>   
>   /*
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index ba9f110d98c6..dd82ca3d43e2 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1012,7 +1012,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       struct boot_info *bi;
>       multiboot_info_t *mbi;
>       module_t *mod;
> -    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
> +    unsigned long nr_pages, raw_max_page, module_map[1];
>       int i, j, e820_warn = 0, bytes = 0;
>       unsigned long eb_start, eb_end;
>       bool acpi_boot_table_init_done = false, relocated = false;
> @@ -1371,7 +1371,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>           mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
>       }
>   
> -    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
> +    bi->mods[0].headroom =
> +        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
> +                         bi->mods[0].mod->mod_end);
> +
>       bootstrap_map(NULL);
>   
>   #ifndef highmem_start
> @@ -1456,8 +1459,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>                * decompressor overheads of mod[0] (the dom0 kernel).  When we
>                * move mod[0], we incorporate this as extra space at the start.
>                */
> -            unsigned long headroom = j ? 0 : modules_headroom;
> -            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
> +            struct boot_module *bm = &bi->mods[j];
> +            unsigned long size;
> +
> +            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);

Just do
             unsigned long size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
?

>   
>               if ( mod[j].reserved )
>                   continue;

The rest looks good.

Regards,
Jason

