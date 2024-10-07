Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF999390F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812496.1225275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvC1-0004Hj-Cl; Mon, 07 Oct 2024 21:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812496.1225275; Mon, 07 Oct 2024 21:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvC1-0004EV-8j; Mon, 07 Oct 2024 21:23:01 +0000
Received: by outflank-mailman (input) for mailman id 812496;
 Mon, 07 Oct 2024 21:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxvBz-0004EP-Rz
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:22:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529670b6-84f2-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 23:22:58 +0200 (CEST)
Received: from PH3PEPF0000409E.namprd05.prod.outlook.com (2603:10b6:518:1::4e)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 21:22:52 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF0000409E.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.15 via Frontend
 Transport; Mon, 7 Oct 2024 21:22:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 21:22:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 16:22:49 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 16:22:48 -0500
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
X-Inumbo-ID: 529670b6-84f2-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdm9A7LOLk16Q1XqB3K3BCgcqLvtpIfv0Ifx8iPziblZzdAHXVCMwJlR756BPSgGFZPAoewJUAKUfQ81Qe5XS63pA6Ksw+NNpLAS0e037Y86sJLc4i4zKBDMqNtbvk4rYwCd8VzRj9ZVY0opSR2HCdI1ndfA5n22Wps2CavJTLsQ9zZyQBJRPKMsZiTxRqfsXY14mUHFUStDIqnA2+5I4vVVp4I/pM3vglZ1COw4npwV7Vq4PNzD/sp6ZFFopkwUxY8wSqgCKkqbg+q7Lx89CUVcUs2fNUaNC9sOsMCYcYoQYM5BkHs31I+RFSX3/VpkXvQNh2Ym8UckiQYwZ6/8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9FYQmmvfNAFaiF/JWWU9p2Bg+UkfmhFpA5nOwPwFL8=;
 b=pRmiz3I1EmXVQfMxO60JXsbX8/FQUp/PqsnlaPQlaLxBp4bdRWX7rnYd+NzCn0/uKIW9rLIKOUE/GbhuMRK2SAma224H6IyE9N80W3evH9/hqt2J/Buz5XjCF6dypEg3WWFio63Hj7VTnInNEplCWrRq/SwxwxbhTiYUeQpjVyPMUMmlgfeGRL0T1KUpKEYRzTD8pW6hQLmPmPdbJmh0ZlUpUXO3TAJUXipLJhbfZEvPymq9YIbnyht+aRgRSBFhiJNA2tM+NPtDDYsAy0t/A+Q3cAoKnVvFx8ZgPw58OJnrtqczLGJ1tHCLRyv00Ti33Wo54NvKbPQ+8XA5EJtzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9FYQmmvfNAFaiF/JWWU9p2Bg+UkfmhFpA5nOwPwFL8=;
 b=T/o2FpqQgsNXGzo+K24D8ERTVR56FcCa1fom70IXVfScUEww6oq134y9RHyzea6Tw+opJ/UeK7LZi/lfK+pU4EHW/Ejm+ZfIaEzManUyXn2XV/4XJqu1cIdzvZXTAeRAzaFEX3WZWHhGGr2Y9OyMvWJe7xNieoZCTs4XdTYsD3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
Date: Mon, 7 Oct 2024 17:22:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-18-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-18-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa89e93-14f0-493b-99bc-08dce71633a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3dNVkZlajBNMnk5aFNNTTQzOHYrbDE2NUlNWjIxTlhaY0M5WjdCaWhKbThy?=
 =?utf-8?B?RmVwMFhhMEdUcFNmTUFnRmVJc0RkbUtSYm1jTFQvb2tXcmpZZ3pEc0pUR01p?=
 =?utf-8?B?b3RiUXNScGRvV0cwT2V5UC8yREZBTjAvWDNMdC9GUmtoQVRWZUtGUWp6dDNU?=
 =?utf-8?B?bHNQajhGSm9LQW9jdzdMTnVDMVVkZFdvVHg5bG11NDUzUi96Z2FaSGFJd05E?=
 =?utf-8?B?SWJkemlLQTJQWEwxUGJlZUlvZVlVOVNxVmJ4SEVzVHpEYlcyMU9EVE5pSlFZ?=
 =?utf-8?B?RUVFQkc1eTcwUVFVS3paNUQxL0NlQ2JrRFBhYUxIL3JLUHVuOXl5TXAvWDAy?=
 =?utf-8?B?OWJHbnRIRGZ0SnhTV0FZNjI1RmJVSG5uUDlyQnM4SDRPUzh1c0RzeW1teTN4?=
 =?utf-8?B?SmFnR2ZSK0lneXdSS0lOOWZ6ZzdLd2VnaGhBNldGRkc3SnRud2laenFIa3Qx?=
 =?utf-8?B?Wmw2OUl6VzhyZDNiVmxtcjBSbW45YUtNMEZqTzZlWHpxZm9YQmtUWkMva3hD?=
 =?utf-8?B?NlQwdU5YZ2V0cjI5cXJFWG5nV3VORC9iRyt5R241cVpNSElNV1NXMjhvYWZH?=
 =?utf-8?B?VFJhNWViZUx4cVBXNEU5eUhuclNVU1l0RFRudVdMMzk0NzZGR0NXKzEyUTFS?=
 =?utf-8?B?Znl4ZldhejA1cGEzMDJ4ZnRMci9yMUNxK0REU3J3M1dnR215OXlqUHZscVZJ?=
 =?utf-8?B?K1VRN3RlelNhdnNQdGJWbzM2OGYxMHpkd1ZsY3FqL01BQ1JZRlBPUjlVcjNE?=
 =?utf-8?B?QlVFN0YzUTZXUDZydmx5d29tMkJzblJGSTBSVE1HVjVNSm90WWM5czhBMjJX?=
 =?utf-8?B?V3dONDdDbVJyNm9pTGpzNElvdGtmM3liblAzZGpOVVJKS0R4UFRtb2xIL3ZE?=
 =?utf-8?B?dDJXOUJUU05xdXY3YmlQaGtscmxrbVA5bHk0b0Zna1B2ZEJzd3k5L1BnblAx?=
 =?utf-8?B?bFNxQk4wdEpkekxUSEVSc1YyRmpHLzJSUzd2dEpYZWJUbHVrSWlYcHJSU3Vh?=
 =?utf-8?B?ZG5WSEVOWU41VWhmcm9nZ3BibDV0VUFlZW5pd1AyYVZpR2dCcjBMQlRDcWJz?=
 =?utf-8?B?Nml2bm9NOUMyTHRXaWphQjRnL0ovVzY5RXNkQWJ0NW1SY0ZSTldGTWRPWXBF?=
 =?utf-8?B?S3Ewa1VWMTR6U1QyYTJ5VXkvTjJNanFYNklHMXNFNG1zV1F6SUtucVFGUitk?=
 =?utf-8?B?ZlA4a2VRVGhzQnBrcHJRU09pNkRBZ2lmNDZPUUpXZjFHYTNsd1FhQzlUdGxZ?=
 =?utf-8?B?Z3NXZEFDRzlPNXFaQWN3VCt4L1A2NjhxRVN1clo4Nmo4T0ZVbWw0K2I1dkJk?=
 =?utf-8?B?Ky9maytqQ3hpNk5HTGFWNHBLTUdzTlR4TVduaExzNmd6M1NCTHZ1bHZBT0g0?=
 =?utf-8?B?eXN4MW95ZlZkYWZhNThqb3ZzU2dYQkw0NlplcmdkNUl0VkkyQ2RRZmtFc1Y5?=
 =?utf-8?B?dmg4YThkWDIwN2s4Q2tuMWw5MUNjZ2RrQWRDenZSelNDTE82cTJiVFNjU3FW?=
 =?utf-8?B?ellMbS9UeEpVdU85cWJ6czRzWGhEOXpaS25nb0F5Wm1TSTlSRURCdjRzenNh?=
 =?utf-8?B?MEwyL0JwVzRZMkVZTXdQaUZqMkR3aWxxSFBmb1QvZElCVnU2UzdKaXlxME41?=
 =?utf-8?B?YS9vMEN5bUE2K0lpSjVBTlhLdkNWanJCbHJUc2RPUnFhZjJaZVhBQzJEK1FS?=
 =?utf-8?B?dTVCNmFuZVBIbFdrMFZhZGladzY0RVVLQm5WMmJmekFvTEdzMWpBNDhtaXJG?=
 =?utf-8?B?aFc5ejV6VGpnWVl4UGxGM2poZ05kWk0xa1NsdWhvRHJsRkVob01YTlhqNzlr?=
 =?utf-8?B?QXYrUDBkOUx1bUxEaDFESkl4NW0xa1VTNk5Rc1FxZEQyN3ZWVTRIeVBDbklU?=
 =?utf-8?Q?vIY4DdVknDE/d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 21:22:51.9458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa89e93-14f0-493b-99bc-08dce71633a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Convert the microcode loading functions to take struct boot_info, and then
> using struct boot_module to map and check for microcode. To keep the changes
> focused, continue using the struct mod to hold the reference to the microcode
> that is used by the late microcode logic.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/cpu/microcode/core.c    | 37 +++++++++++++---------------
>   xen/arch/x86/include/asm/bootinfo.h  |  1 +
>   xen/arch/x86/include/asm/microcode.h | 14 ++++++-----
>   xen/arch/x86/setup.c                 |  4 +--
>   4 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 8564e4d2c94c..22fea80bc97e 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c

> @@ -205,20 +204,18 @@ static void __init microcode_scan_module(
>   }
>   
>   static void __init microcode_grab_module(
> -    unsigned long *module_map,
> -    const multiboot_info_t *mbi)
> +    unsigned long *module_map, struct boot_info *bi)
>   {
> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
> -
>       if ( ucode_mod_idx < 0 )
> -        ucode_mod_idx += mbi->mods_count;
> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
> +        ucode_mod_idx += bi->nr_modules;
> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>            !__test_and_clear_bit(ucode_mod_idx, module_map) )
>           goto scan;
> -    ucode_mod = mod[ucode_mod_idx];
> +    bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;

Why the dereference: *bi->mods[ucode_mod_idx].mod; ?  I don't think it 
should be there.

>   scan:
>       if ( ucode_scan )
> -        microcode_scan_module(module_map, mbi);
> +        microcode_scan_module(module_map, bi);
>   }
>   
>   static struct microcode_ops __ro_after_init ucode_ops;
> @@ -822,8 +819,8 @@ static int __init early_update_cache(const void *data, size_t len)
>       return rc;
>   }
>   
> -int __init microcode_init_cache(unsigned long *module_map,
> -                                const struct multiboot_info *mbi)
> +int __init microcode_init_cache(
> +    unsigned long *module_map, const struct boot_info *bi)

Why the indent style change?  I prefer the original indent and it 
doesn't seem like the line length matters.  And it looks like you 
restore the indent later.

>   {
>       int rc = 0;
>   

> diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
> index 57c08205d475..495c8f7a7cc5 100644
> --- a/xen/arch/x86/include/asm/microcode.h
> +++ b/xen/arch/x86/include/asm/microcode.h
> @@ -4,6 +4,8 @@
>   #include <xen/types.h>
>   #include <xen/percpu.h>
>   
> +#include <asm/bootinfo.h>
> +
>   #include <public/xen.h>
>   
>   struct multiboot_info;
> @@ -22,12 +24,12 @@ struct cpu_signature {
>   DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
>   
>   void microcode_set_module(unsigned int idx);
> -int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
> -                     unsigned long len, unsigned int flags);
> -int early_microcode_init(unsigned long *module_map,
> -                         const struct multiboot_info *mbi);
> -int microcode_init_cache(unsigned long *module_map,
> -                         const struct multiboot_info *mbi);
> +int microcode_update(
> +    XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
> +int early_microcode_init(
> +    unsigned long *module_map, struct boot_info *bi);
> +int microcode_init_cache(
> +    unsigned long *module_map, const struct boot_info *bi);

More indent churn.  The diff would be smaller without it.

>   int microcode_update_one(void);
>   
>   #endif /* ASM_X86__MICROCODE_H */

