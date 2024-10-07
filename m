Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2093993775
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 21:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812367.1225094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtVF-0002ll-Pl; Mon, 07 Oct 2024 19:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812367.1225094; Mon, 07 Oct 2024 19:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtVF-0002jG-M1; Mon, 07 Oct 2024 19:34:45 +0000
Received: by outflank-mailman (input) for mailman id 812367;
 Mon, 07 Oct 2024 19:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxtVE-0002iu-CI
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 19:34:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327b55ad-84e3-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 21:34:42 +0200 (CEST)
Received: from BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28) by
 DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Mon, 7 Oct 2024 19:34:36 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::4) by BYAPR01CA0015.outlook.office365.com
 (2603:10b6:a02:80::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 7 Oct 2024 19:34:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 19:34:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 14:34:35 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:34 -0500
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
X-Inumbo-ID: 327b55ad-84e3-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3mTZWyhz9IAhFQZjUqFnuP22UK6KrHl+UIk0Nb4eD+y6bLbbdcnLdrVcZkQJJVh7Ar+hSJpf6AaNGS3kF4ZkSPL6NOcO325ovkIh7WWeJOHKRs2do1uVcIYMBm5kMkyeFVpdC6iXv0n48GIXP1bCi1BX5jEjls2t8E+bEA1To5pZUVsmLxDtqUbzGX/Q0VXw+1EGQvLHH+6RP9zk0qj043X6WdmEAFG7Azll0Vs512SOlGNm0u0x32MrUmt/FWdRkm42iIyBKdsnUWz9/t4MM+E0BaR1saHpOFaxyxjOxuzC/wm/j4BpuD4mf1Mhqi8W6L7LL3mBuhxbHGjC8hBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Br5IqemP5mmEKm3QmgCNxQLdckF52FE8XN2atHAZPg=;
 b=HI0itcflEx9L4XMx2sCRn58B2hU74rcULT7dqKI/YWB3x96bQz5JOn9jgmsQZuF2M+TpM/EZiEZX0/aoGAwyulSpKGXBdNrRh0uRDt2HIRQC7ZcZFWMCkY62mFa22XA21r5kJxvIJIazA2iKZTyTs7VL/p75g8RAsUFbpEseo1KnO9SY5ezf8jB3LuRGGzF3+t/zFGvzu5A5c4oV/k8dYabQt3OOzjcc/FkNAcTkJFbrYAUPRcjzVbMEnkS0Tf5I9h6FOTpTQPjP79fEeXFiMuZeKM5zUT9UUuSwYQbkFzlRYcQ2UWCVfZdsjmWIHx83ziLavUNj5/NN98hwoRcIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Br5IqemP5mmEKm3QmgCNxQLdckF52FE8XN2atHAZPg=;
 b=EJIT9nTc9AFA+QAl7SY6ZAeor56LYhBl7VXkkxrsW92VLd+v2neFaeG4M+UHqirh1xVoiE6UPW8xqq/3FZraqHKEi9l73ByIDLwPv7rHRZgJ79bJLs1XZRMroFGZX6BHR3gE1g7/sfA+PQFjBPUOVz9rBvp9CAvns1bWN0XLfyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a2346abb-e332-40a3-88bb-0159f6a359e8@amd.com>
Date: Mon, 7 Oct 2024 15:34:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec72ae9-5bba-4cc1-d460-08dce70713d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dy9OeTNuSDV0VHA2MUtXNmtaSW5TQjJSUkk1ZFNTbis0SWlkMXAvdXAybE9D?=
 =?utf-8?B?Nk4zdU85bkFZR00yZGJzdTVkWTcrSUxSNXhzcmxGSlRXRDVCcmp3WlBjdFJl?=
 =?utf-8?B?QjZRQzg3TEFLdThvemwvSTh4NFdOdDNsRG5qa2txc1A5cjRkQlNCdS9OWTN2?=
 =?utf-8?B?b1hLOWFlTXJRSXdZdC9MUDN4S3hoUFpCaHBreGhBL0cyQ1RCT0gvOE5GYyth?=
 =?utf-8?B?VXFTdTB4WGdqSkdtaGhTNFdETU5neEJFUkdCNTVhU2lIckhZVVpmMEtaTUVB?=
 =?utf-8?B?MDlHWlZlUmtlcFNibXdjWTFBZHVzV0pWdndBTVBmTjJueXc4cVFDeDkxOXZy?=
 =?utf-8?B?Y25FQjJ3Ull6WitjZVdkbHpncU11YWU3WnNiY0xkVE5PTFJrNWczdUd3QVlS?=
 =?utf-8?B?OEd4b1p0V0VSdEY1TmprTm9MWVFGUEJZSEwxTGdzT3g1Nlg4SXlkbzBzOUli?=
 =?utf-8?B?Ukxuci84akh1UUVqbTB3N0JmREErbDZSOURieTVlSmVmY3VuaCt1VkxCMEVp?=
 =?utf-8?B?Q0g5YmEwbzJEOUZFcnZCV2QrL2pOV3NIUGFhMnFjOHR6dmt1bzR3ZTFXdU1O?=
 =?utf-8?B?bzNsK1liRzhsd21STXZmZHJhcmVmTUc4UDJBRkpzc2hVMXZweFdhRC8wcll6?=
 =?utf-8?B?QlRjdU81OFhEL0xGN2pOZFR0RnZodTdVbmNTSHpvQXVRTWZxcWJFWDBLYmxX?=
 =?utf-8?B?MURBT3c3eG5EOGdNZ09UaWYya0pySEdCaURia1M5WVV1TlV3cVlZNkY0L0ty?=
 =?utf-8?B?aGJYT1QwaEF4SHhGaG1ad3FibS9aRlVQN3dQL3lScGQyT2tnMXBmM3FMMmxX?=
 =?utf-8?B?U2tBUjFSSk5VcVBBRjdwbmRPckJEOU5qNUpBM1AzWlNtNm84a2VrKy9NTGp5?=
 =?utf-8?B?QXlabXhKYUVsQzZyY0p6UHI1UEhVNXE1ZkpTZ3R4NFJGall3YVhla0QwWThL?=
 =?utf-8?B?bFdNMlMvekJ3UThhdjZjbHVUY0RUUDhlWFRuVlFIbVh6T01YWVpyeW9JeXhT?=
 =?utf-8?B?RlhCRERjam9tdnBKT3YrYkRtV2lPZjFyeDFTQ3R4RDdTYXFRMDRGSzU2SjVy?=
 =?utf-8?B?aTg0a2dFbUs4NDlQeFFvdzBsRnlVQ3c0RFUzaU9ZMGlkSUZCT3laTFY4NDRu?=
 =?utf-8?B?bzdzN3RWWW1PczdJcEtpZGQvWHZSTW8wVGhKNXhJR0ltanhibVZRYXE1bXhP?=
 =?utf-8?B?WlYwbGpjckFkMUk1RHgwQ3dHOGZsL1Q3aEpzWkRITlV6eVhkWGI4anBldldL?=
 =?utf-8?B?clFHdlF3WTlhU1VoMVhpTGdlbFdoU2dEamFYcWZ3b3dsNk96ZjFFS1FZRkd6?=
 =?utf-8?B?NlFXdkJaREUwRVdnand1dnB4eGhXUGEvcE5vL3F5cHRTUjJyVzZsK05IckJ0?=
 =?utf-8?B?NkZqS0dzTzZpQ0tkamVrNmp0MjMvNHpYTXFDMXZnd3I4V21hQ0YzZ1lxR0lN?=
 =?utf-8?B?NlRGSXZaMzNkWW12TlRrMHBsekx5MHVxWnBuK08xd1VtdjU5RmpyT1gxTnVM?=
 =?utf-8?B?WDRmbFJHeGxGLzVrdTY3N2NSQTk3U1F1Ujl3OG1SMGovVzdBMk1hejNJR25E?=
 =?utf-8?B?Y3dTd2Jac1NZZFRLTUR0eFhwZTdKK1B6bEZRNTRJN0FoYW9wZGxabnp1Njkz?=
 =?utf-8?B?QzFTRThVeVJVNCtEWjZvMVFRRTlYR2JPZCtOMmE2WkpGUVFheEduT0pMbnlz?=
 =?utf-8?B?NHBBQXJLRlcwWTVHcU52ZzZGY0VtelQ4YzNzTlVoeDVrRGtMYzdDenJuN3RB?=
 =?utf-8?B?Ym82SEFNa1h6L216bDVFZXozQnFRRlZkbndkYjBVa3N3bm5kMWVBbmx6TGYx?=
 =?utf-8?B?ZmtubHFLeW50WkJaY0hKZ29nVEM0L3FMYWZvRzRwcTc0SlNnR2Y0c2wvQkpx?=
 =?utf-8?Q?hvHGiQb++/EXe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 19:34:36.2126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec72ae9-5bba-4cc1-d460-08dce70713d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638

On 2024-10-06 17:49, Daniel P. Smith wrote:
> To allow a slow conversion of x86 over to struct boot_module, start with
> replacing all references to struct mod to the early_mod element of struct
> boot_module. These serves twofold, first to allow the incremental transition
> from struct mod fields to struct boot_module fields. The second is to allow
> the conversion of function definitions from taking struct mod parameters to
> accepting struct boot_module as needed when a transitioned field will be
> accessed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 61 ++++++++++++++++++++++++--------------------
>   1 file changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index dd82ca3d43e2..ba4bee6b93af 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1341,15 +1341,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>       kexec_reserve_area();
>   
> -    initial_images = mod;
> +    initial_images = bi->mods[0].mod;

Isn't this wrong?
mod is the array of module_t * of *all* modules, but bi->mods[0].mod is 
a single module_t *?

>   
>       for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
>       {
> -        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
> +        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
>               panic("Bootloader didn't honor module alignment request\n");
> -        mod[i].mod_end -= mod[i].mod_start;
> -        mod[i].mod_start >>= PAGE_SHIFT;
> -        mod[i].reserved = 0;
> +        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
> +        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
> +        bi->mods[i].mod->reserved = 0;
>       }
>   
>       /*

> @@ -1509,13 +1510,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   #endif
>       }
>   
> -    if ( bi->mods[0].headroom && !mod->reserved )
> +    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
>           panic("Not enough memory to relocate the dom0 kernel image\n");
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
> +        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
> +                        << PAGE_SHIFT;

pfn_to_paddr() ?

>   
> -        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
> +        reserve_e820_ram(&boot_e820, s,
> +                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
>       }
>   
>       if ( !xen_phys_start )
> @@ -1593,8 +1596,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>                   map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
>                   for ( j = 0; j < bi->nr_modules; ++j )
>                   {
> -                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
> -                                   mod[j].mod_end;
> +                    uint64_t end = pfn_to_paddr(
> +                                   bi->mods[j].mod->mod_start) +
> +                                   bi->mods[j].mod->mod_end;

I think you want a different indent.  I think
     uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start)

will all fit on one line (indented all the way).  (Thunderbird makes it 
difficult me to send indented.)

>   
>                       if ( map_e < end )
>                           map_e = end;
> @@ -1668,11 +1672,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        set_pdx_range(mod[i].mod_start,
> -                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
> -        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
> -                         _mfn(mod[i].mod_start),
> -                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
> +        set_pdx_range(bi->mods[i].mod->mod_start,
> +                      bi->mods[i].mod->mod_start +
> +                      PFN_UP(bi->mods[i].mod->mod_end));
> +        map_pages_to_xen(
> +            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),

map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),

All fits on one line.

> +            _mfn(bi->mods[i].mod->mod_start),
> +            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>       }
>   
>   #ifdef CONFIG_KEXEC

Regards,
Jason

