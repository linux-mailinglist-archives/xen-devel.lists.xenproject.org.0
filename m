Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329DB0104A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 02:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040033.1411509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1l0-0005Uk-4Z; Fri, 11 Jul 2025 00:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040033.1411509; Fri, 11 Jul 2025 00:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1l0-0005Sb-20; Fri, 11 Jul 2025 00:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1040033;
 Fri, 11 Jul 2025 00:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwYO=ZY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ua1ky-0005Qh-5v
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 00:36:52 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:240a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2045c74c-5def-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 02:36:49 +0200 (CEST)
Received: from MN2PR10CA0030.namprd10.prod.outlook.com (2603:10b6:208:120::43)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 00:36:42 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:208:120:cafe::40) by MN2PR10CA0030.outlook.office365.com
 (2603:10b6:208:120::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 00:36:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 00:36:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 19:36:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 19:36:41 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 19:36:41 -0500
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
X-Inumbo-ID: 2045c74c-5def-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAJ3tdtnJHx7+YBLXu7Yc9tX9XiazvJXT3FUbk47j9oFlaFxyXp/XW2e4K6KaxQ3co4YiA/ZCY+pP6PIvl6tC0R3S3pUen6GcyPVoGNdcbswxJywraLq7gu0PxiBY7qnC+S9nph/Pe+YnuSu2zig6aRkXc3DIJekfzMHPzaBTsUksxfH5/N+hVEhTdMJIHec8vWvXuIoW+p/pAADwjMrs29BNvoYDcpl5CuUV2zFdwo6KmWIEuOjU0hf4ePgzbwfqGtbrbTsMejZnqa438ukQv6THGw5JyU6WBEjBPpzVKUzKUnqcUtPVA5y1iOg764H6NJ/AyFLMN5FOU7LMNlOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu8HczdrIOu4FRdPm2mPE+j0YN4Icvri6gDA0ab8h0c=;
 b=t2BvLkyJESoUiRBJ2G1/WC7ouwIlZ/8kdcTLjpsqIBYMp825OwE7BHXTgFbSlZGY7B1x1ElKuaDveY4rkCnuIxQiG/gPBfzGynoFD6V4xmvO4imTCrCyrDwGVyAMN8nNlSut9r1Nqa8Wn36m//BhU1ontyZ5Zf02WVYlqnp2XvSgFRthBzQ7klLvtsU0Em0vp6uNjpMbrBLyTuxaYF3KSmqR5XI0J564RYK0HwZ9+yj8BmmN/AS6Db//zte69RaXCU9ylIP4hbBfAhXLvszH54zgCEOre8cjK1V2kEueS1bpJ3ncK+9XtgjCpmasYpJ3pXcubAr9jrext7SQA0hSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu8HczdrIOu4FRdPm2mPE+j0YN4Icvri6gDA0ab8h0c=;
 b=TiOeczqpPW9D1aw0GDjcaVmdMemnNubu2FdLfSl9eSTpY3YkH0PR+BaljmX5/lWSIgu39c+v0p/cW0NkvoLkDPGaZiYWwybRSIdxrJMlRSUnyRpMW9Xfm9Gn+KoERgTdcpZNZlAQPDYQ/z9FntmK7c0vEklNNRvKunzEV7cXyCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cbb2c96d-c4da-4360-9f74-0dbfe3448747@amd.com>
Date: Thu, 10 Jul 2025 19:21:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-13-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ca76cd-bfde-4501-8700-08ddc01301b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVVIMHFUT3ZXRmlsd2V0OUl1NXhVTzRwSW9RYTROYWRLcnZuSXNxUFMrQysv?=
 =?utf-8?B?ZjNlNEk0MTZQQzh4VnFoZUdlU2h2dDUraXcxanBRWXpKSlJCY0FGblEzYjl0?=
 =?utf-8?B?TlZtQWZzVWRtVmwzRjZZWXRrVVhkczE2RXhBT1QzbGtuQ1pJSFVGdlZtRVk0?=
 =?utf-8?B?aW92L1lQMS93WmtmUEc0S1kra2VnWldRV0RtVzZXbGJhOHdpRGx1NFVQS1Yr?=
 =?utf-8?B?NGFiRTJUNXpPR1F2TmtzbXFqczM0SnY0cWNNMWYrcDVLbDI3RTN3alRnU1ZC?=
 =?utf-8?B?MStvbjEwL3lOalFLd3VpUzZkU0dmcGN3Tk5saTMvNTFaVGp1Yncvdnh1RG8y?=
 =?utf-8?B?Vmd2ZVNnY3ZwdWNUTjQ0TXNhc0UwUTh1VWtjV3cxMVZnMmJlU2JMR2h3QS9Q?=
 =?utf-8?B?N09vZFc4QjdLcDIySmFhMStyam55OWc0Y1Z1Kzl2N0pYOFNDaU9FaGJVUVlO?=
 =?utf-8?B?MmZCMFdVaVlyRUNqWWFVb3VsV2NhaENUNlNGdENoKytSNjN4ZEJiTlBtWGtu?=
 =?utf-8?B?SlVSVjR3U2V4ZGZYZWltY2NYeHNvWURYK2VtVFJndXNzVDZjWXhzZndTSEhK?=
 =?utf-8?B?Y0EydFVGWHExQ2lXNTZENlhGZFRuNUQ4WWNxM3lyc2tJQXg4Umg5aXJ5NDAw?=
 =?utf-8?B?Nldjczc4VU42Uzd1L2FRdXRiNFBUNHBnemF5N0hETEE1a2VDZG5kQ3h5ekZQ?=
 =?utf-8?B?TnRocTlHK3IzTHdDaWI5ZTc4YlJJc20wb2N5cVRLWmFEdlJRenRRYTR4SmJW?=
 =?utf-8?B?aktTSmZObEQ5VFdTaVdXQnhBWTJRWXNNL0pvclF6U1lkazJoeHdsMFZjaTRM?=
 =?utf-8?B?U04wdi9oUkRTNXNTTW13K1IxakJjMDR1L0lJa2cyWE5taC9JQkhwa2dPL2xu?=
 =?utf-8?B?Vkh2RnlFUDBDTFJGZXZLMDlxdXhma3M4RCtaL0NlV0VkZVRNZ3pSYUxMdUV2?=
 =?utf-8?B?aTFDdytXOW95bUR3Y2dnZ0dxZDNCUWQyV1Q4TlRlMTB4aGUzSHVxR0VzUE0y?=
 =?utf-8?B?THRZZHlwM0lhOGgrUFovbDZxQ1ppSXBaUWsxNHllZ2ZHeG5PQUxDRXYrVHU4?=
 =?utf-8?B?RXBJb2lIeGluaXoyWkpLc3ROV3JoeElydTNycG9TdUVlRzV0cUlReWdEUFUr?=
 =?utf-8?B?QzZlQldXWllQVVVocXJEdGMxRkZGbkhYL0JKcWxIZFVKMGsyV0VEUDhhTlk1?=
 =?utf-8?B?MnVhcW51cXV1NmRCV1FMSzZqdEl5a1BhTVNQZi84VFlhdVpTdmtiVnQ1d1Bv?=
 =?utf-8?B?ajdldldmSTZULzloKzBOZDc5dmVsdHRweVJMVWNScWw4TFRDMTR5R1dHYUF5?=
 =?utf-8?B?b0ZZd29Ud1p3Y3RJM2UzSUlsc3VUajJRdTBaS20yLzRzV3BjWkJWRW5PN3NK?=
 =?utf-8?B?aGxYUnZnQUdHMWdtYmh3RHdWUXk3WnFwL1h2azZianFqVkZ0dlc0NTQ5azd3?=
 =?utf-8?B?VWhMUzk2amlJQmp0OXR1WlhZRmhzQkFmd0FBdHY4cHg2VDJQQjZtVlU4Ly8r?=
 =?utf-8?B?TVkvVE5xRHh6bHVScXZzTnVGVlJhZjVXamtqYlhqa1M1djdjSXNNKzVqbHJn?=
 =?utf-8?B?L2lnc2x3UWFCSTdKUGQvbzF4UTJJS0RFL0Z0ZWpHek8vY0Y0UGdXajZXcmxk?=
 =?utf-8?B?VUhXbmVESXhkQUg0UUxVMXdxc3JjT2hlRWd6eDRyWitua240VG1ucWpBT0oz?=
 =?utf-8?B?VzZuWWVWNUZpT3FNVklnQ1dtTFBjQW1JcnE0MlUwRzVlVUdmS1FNaEFJV2V2?=
 =?utf-8?B?b05oSUJ6WTJTWkI1YTA3SWFwcGpOZ3c1dzV3TGVuWVJkMEt0SUswb2Rkek5a?=
 =?utf-8?B?cmlTOUwrQ1lQbGN1RmwydUpka1R2LzRyQjZUTFIwRHIxL0EzUUJra0llcjk2?=
 =?utf-8?B?TWdudmkxVXgxUFhGaFJRN0F1NmlOdkNKNUJoQlhNcCtaQXJhNGdQc2lpdDIz?=
 =?utf-8?B?TzVxZHhNQWcyUVZBSFBzdmZPVmN5SUVQYVF1L3FiRUNxVVZJZ2ZXc09nY2RM?=
 =?utf-8?B?L3g5S09DNkFMRGF4M0VWUitBQVh4dWhyMkhheld4VXJROEFmMkhWdHVJbkt4?=
 =?utf-8?Q?A8TsNM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 00:36:42.1694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ca76cd-bfde-4501-8700-08ddc01301b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437

On 2025-07-02 04:12, Juergen Gross wrote:
> Especially for support of Xenstore-stubdom live update some memory must
> be handed over to the new kernel without moving it around: as the
> 9pfs device used for storing and retrieving the state of Xenstore
> needs to be kept operational across kexec (it can't be reopened due to
> Xenstore not being available without access to the device), the ring
> pages need to be accessible via active grants by the backend all the
> time.
> 
> Add the basic support for that by reserving a pre-defined number of
> memory pages at the top of the memory. This memory area will be
> handed over to the new kernel via specifying it as a module in
> struct hvm_start_info.
> 
> The contents of the memory area are described via a generic table of
> contents in the last page of the memory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   Config.mk             |  2 ++
>   arch/x86/kexec.c      | 77 +++++++++++++++++++++++++++++++++++++++++++
>   arch/x86/mm.c         | 18 ++++++++++
>   arch/x86/setup.c      | 28 ++++++++++++++++
>   include/kernel.h      |  1 +
>   include/kexec.h       | 45 +++++++++++++++++++++++++
>   include/x86/arch_mm.h |  1 +
>   kexec.c               |  3 ++
>   mm.c                  |  6 ++++
>   9 files changed, 181 insertions(+)
> 
> diff --git a/Config.mk b/Config.mk
> index b9675e61..0e4e86d8 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -220,6 +220,8 @@ CONFIG-$(lwip) += CONFIG_LWIP
>   $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
>   $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
>   
> +CONFIG-val-$(CONFIG_KEXEC) += CONFIG_KEXEC_MODULE_PAGES
> +

I don't know Makefiles well enough to review the preceding patch.  This 
doesn't seem to be used?

>   $(foreach i,$(CONFIG-val-y),$(eval $(i) ?= 0))
>   
>   CONFIG-x += CONFIG_LIBXS
> diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
> index 804e7b6d..7fb98473 100644
> --- a/arch/x86/kexec.c
> +++ b/arch/x86/kexec.c
> @@ -201,10 +201,73 @@ static unsigned long kexec_param_loc;
>   static unsigned int kexec_param_size;
>   static unsigned long kexec_param_mem;
>   
> +static struct kexec_module *kexec_check_module(void)
> +{
> +    unsigned long mod_size;
> +    unsigned long mod;
> +    struct kexec_module *module_ptr;
> +
> +    mod = get_module(&mod_size);
> +    if ( !mod )
> +        return NULL;
> +    /* Size must be a multiple of PAGE_SIZE. */
> +    if ( mod_size & ~PAGE_MASK )
> +        return NULL;
> +
> +    /* Kxec module description is at start of the last page of the module. */

Kexec

> +    module_ptr = (void *)(mod + mod_size - (unsigned long)PAGE_SIZE);
> +
> +    /* Check eye catcher. */
> +    if ( memcmp(module_ptr->eye_catcher, KEXECMOD_EYECATCHER,
> +                sizeof(module_ptr->eye_catcher)) )
> +        return NULL;
> +    if ( module_ptr->n_pages != (mod_size >> PAGE_SHIFT) - 1 )
> +        return NULL;
> +
> +    return module_ptr;
> +}

> +#define min(a, b) ((a) < (b) ? (a) : (b))
> +void kexec_module(unsigned long start_pfn, unsigned long max_pfn)
> +{
> +    /* Reuse already existing kexec module. */
> +    mod_ptr = kexec_check_module();
> +    if ( !mod_ptr && CONFIG_KEXEC_MODULE_PAGES )

What if CONFIG_KEXEC_MODULE_PAGES changes between the old and the new 
stubdom?

> +    {
> +        max_pfn = min(max_pfn, PHYS_PFN(0xffffffff));
> +
> +        iterate_memory_range(PFN_PHYS(start_pfn), PFN_PHYS(max_pfn),
> +                             get_mod_addr);
> +        BUG_ON(!kexec_mod_start);
> +
> +        mod_ptr = (void *)(kexec_mod_start +
> +                           ((CONFIG_KEXEC_MODULE_PAGES - 1) << PAGE_SHIFT));
> +        memset(mod_ptr, 0, PAGE_SIZE);
> +        memcpy(mod_ptr->eye_catcher, KEXECMOD_EYECATCHER,
> +               sizeof(mod_ptr->eye_catcher));
> +        mod_ptr->n_pages = CONFIG_KEXEC_MODULE_PAGES - 1;
> +        memset(mod_ptr->pg2rec, KEXECMOD_PG_FREE, mod_ptr->n_pages);

I was wondering about a BUILD_BUG_ON for CONFIG_KEXEC_MODULE_PAGES 
versus some limit but I can't think of one.
> +        mod_ptr->recs_off = sizeof(struct kexec_module) +
> +                            CONFIG_KEXEC_MODULE_PAGES + (mod_ptr->n_pages & 1);

mod_ptr->n_pages & 1 is to ensure 16bit alignment?

mod_ptr->n_pages = CONFIG_KEXEC_MODULE_PAGES - 1, and pg2rec is n_pages, 
so using CONFIG_KEXEC_MODULE_PAGES makes this off by 1?

> +
> +        set_reserved_range(kexec_mod_start, (unsigned long)mod_ptr + PAGE_SIZE);
> +    }
> +}
> +

> @@ -252,6 +316,19 @@ int kexec_get_entry(const char *cmdline)
>       info->memmap_entries = mmap - (struct hvm_memmap_table_entry *)next;
>       next = mmap;
>   
> +    if ( mod_ptr )
> +    {
> +        mod = next;
> +        memset(mod, 0, sizeof(*mod));
> +        info->nr_modules = 1;
> +        info->modlist_paddr = kexec_param_loc +

Looking at this again, I wonder if kexec_param_loc would be better named 
_pa or _paddr.

> +                              (unsigned long)next - kexec_param_mem;
> +        mod->paddr = kexec_mod_start;
> +        mod->size = PFN_PHYS(mod_ptr->n_pages + 1);
> +        mod->cmdline_paddr = 0;
> +        next = mod + 1;
> +    }
> +
>       info->cmdline_paddr = kexec_param_loc + (unsigned long)next - kexec_param_mem;
>       strcpy(next, cmdline);
>   


> diff --git a/include/kexec.h b/include/kexec.h
> index b89c3000..0200005f 100644
> --- a/include/kexec.h
> +++ b/include/kexec.h
> @@ -2,6 +2,48 @@
>   #define _KEXEC_H
>   #include <mini-os/elf.h>
>   
> +/*
> + * Kexec module used to hand over memory across kexec().
> + *
> + * This is an ABI which should be modified only in a compatible way.
> + * struct kexec_module is located at the start of the last page of the module.

Why is kexec_module, which seems like a header, placed in the last page?

> + *
> + * The module can contain data/pages of multiple users. Each user has an own
> + * record which layout is depending on the user. Records are linked via a table
> + * of record offsets.
> + *
> + * All admin data (struct kexec_module, record offset table and records) must
> + * fit into the last page of the module.
> + */
> +struct kexec_module {
> +    uint8_t eye_catcher[8];
> +#define KEXECMOD_EYECATCHER "KexecMem"
> +    uint16_t n_pages;       /* Number of allocatable pages in the module.    */
> +    uint16_t n_records;     /* Size of record table (max. 255).              */
> +#define KEXECMOD_REC_MAX    255
> +    uint16_t recs_off;      /* Offset to record table from start of page.    */
> +                            /* The record table is an array of               */
> +                            /* struct kexec_module_rec.                      */
> +    uint8_t pg2rec[];       /* One entry per allocatable module page, value  */
> +                            /* is record number (starting from 0) associated */
> +                            /* with it. Free pages have value 255.           */

This reads like it is 1 page per record...

> +#define KEXECMOD_PG_FREE    255
> +};
> +
> +struct kexec_module_rec {
> +    uint16_t offset;        /* Offset to record from start of page.          */

... but then why would you need an offset?  How do you identify which 
"page" or do you mean from the start of the module?

> +    uint8_t type;           /* Type of record.                               */
> +#define KEXECMOD_REC_NONE   0
> +    uint8_t size;           /* Size of record.                               */
> +};
> +
> +#ifndef CONFIG_KEXEC_MODULE_PAGES
> +#define CONFIG_KEXEC_MODULE_PAGES 0
> +#endif
> +
> +extern unsigned long kexec_mod_start;
> +extern struct kexec_module *mod_ptr;
> +
>   /* One element of kexec actions (last element must have action KEXEC_CALL): */
>   struct kexec_action {
>       enum {

> diff --git a/kexec.c b/kexec.c
> index 2607c819..ded29882 100644
> --- a/kexec.c
> +++ b/kexec.c
> @@ -250,3 +250,6 @@ int kexec_add_action(int action, void *dest, void *src, unsigned int len)
>   
>       return 0;
>   }
> +
> +unsigned long kexec_mod_start;
> +struct kexec_module *mod_ptr;

Personally, I find it a little unusual to add variables at the end of 
the file.  But it's fine and you don't have to change it.

Regards,
Jason

