Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7530951B25
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 14:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777143.1187332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDSF-0007tf-RE; Wed, 14 Aug 2024 12:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777143.1187332; Wed, 14 Aug 2024 12:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDSF-0007rR-OR; Wed, 14 Aug 2024 12:50:19 +0000
Received: by outflank-mailman (input) for mailman id 777143;
 Wed, 14 Aug 2024 12:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seDSE-0006XY-GW
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 12:50:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c092f3d7-5a3b-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 14:50:16 +0200 (CEST)
Received: from BY3PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:217::21)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Wed, 14 Aug
 2024 12:50:11 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::81) by BY3PR04CA0016.outlook.office365.com
 (2603:10b6:a03:217::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Wed, 14 Aug 2024 12:50:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 12:50:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 07:50:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 07:50:09 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 07:50:07 -0500
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
X-Inumbo-ID: c092f3d7-5a3b-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/DIrhf8fgFn4hpqE6RWcgazj361lo85RKXsHU66ZUUaifdkK3aNsbb6kWC66yTeg3HkiVsdJhTt/8CtwOoEoPdbY+Qw18V/2ajngslgcxZebiKwpAQ9r6tOPx33XO0yF5cPS71xbVlXhsAuJtBReltvhln3QnVNhAwjU8pQAKNelhVa9p4lRcBWlzFQpyxQ9RjEfCMzoNLp3XqACGfWaoKNnbF4rrLG9DmjRIKTtFzthUVxzdLrc9PElaA8hAdXB1drUmEOYhDDHyYRjDDRVSMb7socoITvWKonSpTLaIdaMBy7l/sizZTDOwi9DBAfEvVMMp4hyFbVvnju2as1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDT/PTe6Y5fTipC6iRJxvSsn50WTw1GGRwK8lw6qSPU=;
 b=GO0kCrssnWCjlDcQHbn03LICvEjw5q0yNLFfNoj2/aFj0IpQSW8pOv+4oYkXVl5JZskCbeiNWonq3mBVf0ZMqD6dd3lch/cjsqdW2YI1U3qhgXpLrg+pytqlrnilAvn1U9kbjHCt9cpLAQJPeMzmUsia9iIMBxIYDCjqzzxOzvf8Uam0iBOSSJQfm1advaXmIWlCFX33gxrmdkkkdlHCXMYJOgzWI6/Mf5Xcgpwi7LG3IyH917Q7t6BLGiagq/owiYZsuSp0ea0iqooHWkb+cpCHU+hr5HB0R4lLIQ95ycpUFr2HB6ltn+1T8VEmHMTv6uIqwx+LmLqoC9wRdjD4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDT/PTe6Y5fTipC6iRJxvSsn50WTw1GGRwK8lw6qSPU=;
 b=rTiJp1pWRaSdmeYV5kbweCTuy/e1yMNpqIj7v+yYkozDYMMwuaeky/myXxZxsqYpttbMW++hkWjri+6PvSHY80kcxXD1WXZxa1k1rU1BPm/ebd3eAw3aUP2l6y0k6do9eapff6DaQlpAMGdRxCTjRMLEb2FCjcCJDiRS1o3AHQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d1144ab4-a342-452b-bd03-a67409657fa7@amd.com>
Date: Wed, 14 Aug 2024 14:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen: arm: Add a new helper update_boot_mapping()
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>,
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240813171356.46760-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0d00ce-23cc-4ab8-75da-08dcbc5fa246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWN6T3d3OC9xanN1Qm1sTm1taFdpUGdwcXhLc2kzc0RqSTMvUDJIOE5aTjU3?=
 =?utf-8?B?UGxPQUNzQmZvci9kaWdCL3ROL1dxVUlJQlhJZm9uanBWNk9kK3BpYTBINVpz?=
 =?utf-8?B?dzhPMFlVSTBEY2dXdUtEdW5WcGVTUkRjU1lmaVlTSkV6MHFrWlpKbEdUOVA0?=
 =?utf-8?B?U05sVi9oNTdWK1JyN1VIU3BLSXU4YTZCUFV4RnJUN2JESVRMbHAzaVlWWk5Z?=
 =?utf-8?B?SUtmTGVLMVhlU2FiVll2NFI2MmZtQWFrWllWaFVsdnZuS0MzMjlFa0JTZmZT?=
 =?utf-8?B?R04vM2h6YXV3Q0VDZTV1TmsvZDRUc1JKZW15aHh4WWlQbWtUcWUzNGNrSGpr?=
 =?utf-8?B?Yzkrc1lORGI3dDdobVdPSkpWYTBTT1EwcEtWVXlHdUZpZURja1JlVzlyeTZ2?=
 =?utf-8?B?aDlnVHUxRnpLS2o5cUNEWnJPYm1mQ1ZmUnhMWnJWZEZnWVdUTEJZSUJreW1q?=
 =?utf-8?B?RnpybWJ4R1pTN2ZZYVh2cUtDMk1EbGs5eTl4YmRKem9GQksrMFAyTXA5azdo?=
 =?utf-8?B?dStSa0tzaGNxYUMweCt1MFhaTzA0ZFBuVVJDUGVwdGZwOC9XektlcHk3L21M?=
 =?utf-8?B?b3FBeTBaZXM3N0lWTzNqYm1hdlRxRG11YmgyVjlWYUVPUkQrS2lmU3NKblRh?=
 =?utf-8?B?MFlhUDVEL1FKaTZLck1FRS9BcERRSWxLTE9HWWxTVE0vZTRwaTZFYUtmZ2h5?=
 =?utf-8?B?ck9WTWF3YzQrdEptKzRSQkhLK0QvY1hnNTdsTkpPb1NaaWdWdHNpZjlrZW1v?=
 =?utf-8?B?WExPTTdsWEpJTDVwakprYVhnVkcvdUJPQUs1S0VMUmZncHA4dnJLTFVrcmZM?=
 =?utf-8?B?aVhhZTNSTDlyaklmM3ZNSGFNalFXdjJjYXg3Sk1RSlkxeWVHb0VnL1NvdE53?=
 =?utf-8?B?dFpVYzFuZnRrRVIxQVFSeC9OVW9jL3BuM2JPa016Wm1pUWxERHdPeGt3OVVm?=
 =?utf-8?B?bjRHQU5mWVJrRDgrRkVodVJ6VzNNVEJmZTJmWTBRdC9iRXBnRFhEdUkvd0ph?=
 =?utf-8?B?ZE42azUwYnV1TlBiSXJuMW5rUHhxUUE1WHRkRXRvVWh2eENJMlFmVzhER0Vk?=
 =?utf-8?B?SHZack0vOU5YRjZTd0pRMDk2cFN4WGcwbzhyM1pFVExxNzJOUlZsTEdVNE1o?=
 =?utf-8?B?NHNkdG1nZjlmc1pHUzNrdHFwZnJzVnNISU9udmZWcU5RS0Nxa05EbTdIdWFm?=
 =?utf-8?B?QnJDN0lhRzZZVmpnZGNlQlk5bHlXVXgxNU5XT1VLcklreDJ2WmJXK0RMdGs4?=
 =?utf-8?B?SytwZnN4emJGcEdQODJGUnBGaTdTZFJQVzFqR1k5T3RlN1pLRUpwNldqT0t1?=
 =?utf-8?B?Qnp6UzlTOVNVVit5bmpNUzQ3aE95K2paMERsWGpxZmNtV3BmR05mdk1tWjh2?=
 =?utf-8?B?MXVnNkVKQjkwUGlVeGZiclVNSWpyUjh6NGhmUFM0SEpwTTdmbmR5YjBFWGlz?=
 =?utf-8?B?TzBLTS94cS82dUdJSEF3MldYWWh1eXdGS3c3alNDWjRzU1F1VlpIVnBNRFJq?=
 =?utf-8?B?dzZzdlRZNndaa09rd0wzV2lCcUp1ZXVIeFBWdlZCTVVaSEVhZCtaZHBCZit6?=
 =?utf-8?B?d3c1aTlxRUZpZTRRZzg1NS9iRkQ0R0dtSFoydzJsYUE3SHR3QmxSYUdyUEFF?=
 =?utf-8?B?WU9aSkdpRDQ4SWY0ZXAreTd1aGNuektJY3hBNjJDUHBqZlJWdFZYMDZoTFNy?=
 =?utf-8?B?M0FmNFpjSlV1MVZJOXFqd0liV3lmRTNhMnJKS0FqcnNVZXUzaDFRekRaZFhs?=
 =?utf-8?B?UStnNXNIMVJNYnNUUXB0RDI1d1dDcjduMzJWMmY2RHkrMWZRZFM4Wks5b2dL?=
 =?utf-8?B?eVlHMy9sQnlTZGJVQ2h5QmRFVEtRTzN1V2luSEtwTXpwdGh0UXR0MjYxVm9S?=
 =?utf-8?B?ZFZqUmIyYkxlUUdVS0w0SGtobmphcWFJVEFaRXJDL1N6aHFWeGFWTDRxNVZZ?=
 =?utf-8?Q?aRnbtxSoI1MJ6YEOvD7pM7tUuCQJqVt6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 12:50:10.9115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0d00ce-23cc-4ab8-75da-08dcbc5fa246
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871

Hi Ayan,

On 13/08/2024 19:13, Ayan Kumar Halder wrote:
> update_boot_mapping() invokes update_identity_mapping() for the MMU specific
> code.
> Later when the MPU code is added, update_boot_mapping() would invoke the
> equivalent.
> 
> The common code now invokes update_boot_mapping() instead of
> update_identity_mapping(). So, that there is clear abstraction between the
> common and MMU/MPU specific logic.
> 
> This is in continuation to commit
> f661a20aa880: "Extract MMU-specific MM code".
> 
> update_identity_mapping() is now marked as static as it is called within
> xen/arch/arm/arm64/mmu/mm.c only. Also, updated the prototype to
> update_boot_mapping() which is now invoked from other files.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Introduced update_boot_mapping() which invokes
> update_identity_mapping() in MMU specific code.
> 
> v2 - 1. Make update_identity_mapping() static and update the prototype.
> 
>  xen/arch/arm/arm64/mmu/mm.c         | 7 ++++++-
>  xen/arch/arm/arm64/smpboot.c        | 6 +++---
>  xen/arch/arm/include/asm/arm64/mm.h | 2 +-
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 293acb67e0..1afbbeda5a 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -111,7 +111,7 @@ void __init arch_setup_page_tables(void)
>      prepare_runtime_identity_mapping();
>  }
>  
> -void update_identity_mapping(bool enable)
> +static void update_identity_mapping(bool enable)
>  {
>      paddr_t id_addr = virt_to_maddr(_start);
>      int rc;
> @@ -125,6 +125,11 @@ void update_identity_mapping(bool enable)
>      BUG_ON(rc);
>  }
>  
> +void update_boot_mapping(bool enable)
> +{
> +    update_identity_mapping(enable);
> +}
> +
>  extern void switch_ttbr_id(uint64_t ttbr);
>  
>  typedef void (switch_ttbr_fn)(uint64_t ttbr);
> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
> index a225fae64d..789f352ab6 100644
> --- a/xen/arch/arm/arm64/smpboot.c
> +++ b/xen/arch/arm/arm64/smpboot.c
> @@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
>      if ( !smp_enable_ops[cpu].prepare_cpu )
>          return -ENODEV;
>  
> -    update_identity_mapping(true);
> +    update_boot_mapping(true);
>  
>      rc = smp_enable_ops[cpu].prepare_cpu(cpu);
>      if ( rc )
> -        update_identity_mapping(false);
> +        update_boot_mapping(false);
>  
>      return rc;
>  }
>  
>  void arch_cpu_up_finish(void)
>  {
> -    update_identity_mapping(false);
> +    update_boot_mapping(false);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index e0bd23a6ed..ac8d1f5c78 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -21,7 +21,7 @@ void arch_setup_page_tables(void);
>   * Note that nested call (e.g. enable=true, enable=true) is not
>   * supported.
>   */
> -void update_identity_mapping(bool enable);
> +void update_boot_mapping(bool enable);
The whole point of adding a wrapper was to avoid ambiguity \wrt identity mapping and MPU.
You changed the name of a function but left the comment which is pretty MMU specific. I think
it should be moved to update_identity_mapping.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

