Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99A9BF912
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 23:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831374.1246664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oKY-0006yr-Ef; Wed, 06 Nov 2024 22:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831374.1246664; Wed, 06 Nov 2024 22:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oKY-0006x7-Bw; Wed, 06 Nov 2024 22:16:50 +0000
Received: by outflank-mailman (input) for mailman id 831374;
 Wed, 06 Nov 2024 22:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEZf=SB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t8oKX-0006x1-8g
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 22:16:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8cec959-9c8c-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 23:16:36 +0100 (CET)
Received: from SN4PR0501CA0060.namprd05.prod.outlook.com
 (2603:10b6:803:41::37) by SA3PR12MB7952.namprd12.prod.outlook.com
 (2603:10b6:806:316::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Wed, 6 Nov
 2024 22:16:32 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::f1) by SN4PR0501CA0060.outlook.office365.com
 (2603:10b6:803:41::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Wed, 6 Nov 2024 22:16:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 22:16:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 16:16:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 16:16:31 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 16:16:30 -0600
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
X-Inumbo-ID: c8cec959-9c8c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjBkIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImM4Y2VjOTU5LTljOGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTMxMzk2LjM3MDc1NCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds4uHz19NAy8yqQ1JDuAK4Q1FpPxaJwJQqpbmmklH+Krxd2okSlurdWfDJIMgaszhnziCFBq47i7z+v8ntQu3n6oqVWuEBrCgh5FnxQHENt33yQGvAFu3TLCvUt1EkBvD41/XwpQYUE06td+IxLM3AGQNePtXtv3sKl6IfrXUwJdlu/34QU37d/Pw8eORm4I2odf7Bvk3IXjDpcjNgolwQGhmZtO1m5hiIr7UdsxyTlpXV8Av/byGEltP3/oPa4nkCwfub7O6nWom/gtc5eLzNNBDVAwz17Z7+lNgNFSf6MM7XETNkYJzX8MILSTeC+Jr0FQNrRr+rjHmfGVk+iVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E80QCvVYRMVdrgjpY5Lml6kcF0rOZlAtuXbSg4ACi0w=;
 b=leTODSwLkyMHrRYINucoguiPD2PTJPHnD/S8l9GPKO+XdDB/8DhdGPWnT/pQ1cdqnZvjzMO7RZ25WbGs/XWYq/XXKhDDS3uBMEO6VTtnSM2PX3PKaHpjl/9bUruOhooy+m6UEt+eP8vRIblyyMZq7e78PlXVx6dCHgRetWSQfbRV+fdq8XWnDlI9YtU/83ndzp1OjwETMJh74QUYiNnHQ84y68jvoUzRKRGiztdYwbQER7Gl9k3e1gETsERkFuxcrQ4GhKTKqbyw+LX2I6sAYfR0c3dXtmkws2uYRRqARNuTE2XCjV7JfF71L4kZNWFjRcKqaKKpmdlFMeXDVNyi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E80QCvVYRMVdrgjpY5Lml6kcF0rOZlAtuXbSg4ACi0w=;
 b=Tn7MgY/W30Iv/ltoBhv5ft1cxS/wazWJGu/U8YZl/FMLXmn56YmsrHYQmfZxMKND8VxsAKTPLPugHDWl1uvhEhKS0Yr56q13n3sNvCoJPJCU9G8RKNvY0bm2mxpQw/FibNreYbdUFgI0HdU9Ah7gDjsqQCJvyRiyr+kmRmT0tJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
Date: Wed, 6 Nov 2024 17:16:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86/boot: introduce module release
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-5-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: de443ce6-b78c-41fd-382e-08dcfeb0ab62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1hRR3FqZlMzNFh3cEREejAvdE9td2hzVk83QXV3aW5TNXhtT1lERmRRSnlU?=
 =?utf-8?B?bFRhOTFXdW9RYU80bWJScmlMa3J2TGF0TCtrYWhsT3VUTkJZVGM0WTlJTHRz?=
 =?utf-8?B?RjRBd2pWaE1SSUN1R1BwV0h0UXI4ekhpSjhaK2xLMmZZazQ4aGUvQU1TZnNM?=
 =?utf-8?B?OCtvV2RDYWRJL0k2djg2MGJyQWlrT3BHNmRodFdyV2NVMEF2cnI4TnVOSXhk?=
 =?utf-8?B?SlI2a0N4UUpOVm1rUm01S3BRUzJ5L3Z3aklUc3JuNkpNUDM0R1llbnZhdCth?=
 =?utf-8?B?NUMrMmFRa0I5aEMvaThDbVZtN2t0cWlaQUJ1dHR0QVVNOEhpMjlyMDNpTXhk?=
 =?utf-8?B?Z0lxUm9XZU03YzdjM1k1eVJzTnFRTngvb2NnSWlFY0piNDZuNVVVTG9xNjR5?=
 =?utf-8?B?VzhYQmlIUzZrUk5qVEVQT1FoenJaaGd6RnpGL0NPVEltT1dnUDI2Q1ZyMHFP?=
 =?utf-8?B?Tm5LVjcxb0ppc1BQbEs3cU9YYkhUZDd1bEVDL2hEK2R1V2lsZE1mdk92MDJ1?=
 =?utf-8?B?eWNOUDZwaFpKRjlhbEZlNlpWd3FVbCswS0VlZFJsNkFIV0xTY3hCU0dITGJq?=
 =?utf-8?B?SUdpWHdEZHc1VEE5dlRhSXZMNkhxWFNUbjNCNDZrSHpLMTlvcklTbFcwenZx?=
 =?utf-8?B?MFdCbFVZdnRSU3lkT256aHZ0L0o2NjNMdUp0U3hrNjN4R2pFaUJlWEczS1Q1?=
 =?utf-8?B?VS9tY3BMQ3dVeFpXSWpKdHpnaHg0U0d2WkEvdGo0dWdFRUdvc0JDNUE2MDEx?=
 =?utf-8?B?aUY4NnZ6NjM1YVhldWFmc1ZCdTN0L1R5VzhFcVJUakVnUzVKN1dPLy9jTTBK?=
 =?utf-8?B?Y3EwNzBXYWxybkFxRitoNjZjcllBODdtZlc3eWhpdzQzTDA4ZUhmdjcrS1p5?=
 =?utf-8?B?KzJmRkZ6VzVVUTRLL1JSamFPTUs5eTF3alUzaUlhK2JjeWdUZWFlL0xZLzlm?=
 =?utf-8?B?ZXFzM1oyL0lRdTd6NzliUENGUlhMTEZsYkJRTVlCdm05U0ZDemFhM2M0WEdH?=
 =?utf-8?B?QTZ2elpJdkZNK3VSM1laTDdxd2t2a1pFMURJeUFzNzRtcXJFNGE0TFRMcUtj?=
 =?utf-8?B?Y1k5OUV1TElOUzJGNzdhT0N0OHNnNTNPUXhidVQrUWZuNURaOWZSQkhIM2tV?=
 =?utf-8?B?dmdqWlBPbjJ3TmFFZ25ZQm52REp3bkwrbnR0VG9NbGczb2dCL2xoSEJKQ2ZY?=
 =?utf-8?B?aDdIVCtiS2lSL3ZBTzFKOGVYTVhqZi9jTGVSNlYwRDRONStZSVo3bDBxZC9Z?=
 =?utf-8?B?c0FOdUFPdVNhYkllZTZLdGt3RGN6Q2xxYUdhaWFwUW5wVDhHek9vN2VwQlEx?=
 =?utf-8?B?L1BHbzdQNjN3VkhhWWZ4NStPaGRQL2NsRWpFbHo5OUpmSnBvR2RnL1dGUjNv?=
 =?utf-8?B?bHM4M1N1d2FBblNMNVBWOWwrbmh5MFpKM2JML0pOMVJOS3F0YS83aEJmNUpk?=
 =?utf-8?B?eEd3K1Y4MXJac25xNjVhUEluYkJEZXRRS05qL0IwZWcrZ1o0aUtzMk1iRmp2?=
 =?utf-8?B?Z1o5Zm8xV1ZMVzdyN21QUWFCV3N2N0w1SzBZd0g3NEhGcHpucnFiSXJoVXJz?=
 =?utf-8?B?QXRJS2t1T0RMd0RXSTFmWXJPWGJ2OExzcjFDeWVNNnkzbDFqNkd5eXNFTGwr?=
 =?utf-8?B?MWxvY21nMFppZ0xkTC96cHpGS0VhSXdBczB5MDkyNFN6OUZqZ1RGSEYrbHZ2?=
 =?utf-8?B?OWdBVkpGdWxYa3R6a1Vrb1FoblpjNnk5Rjd2OE43TUk5TitTL2w3dGVhTTJN?=
 =?utf-8?B?NTVBSjZ5SnkxenN4Nm5NNDkyQ1JxSmt3RmZXY1craE5jNzBzaC94ZlBsKzky?=
 =?utf-8?B?b0dOVWttdm14ZS9McVltRW9Zd0gzSlZrQXVGalFCekltdmcxRXE4UVN3L3hk?=
 =?utf-8?B?Z1FlaFdIS2MwS1R1WHNUaXlUSE9sMnJXVTdyeUV5empUZVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 22:16:32.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de443ce6-b78c-41fd-382e-08dcfeb0ab62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952

On 2024-11-02 13:25, Daniel P. Smith wrote:
> A precarious approach was used to release the pages used to hold a boot module.
> The precariousness stemmed from the fact that in the case of PV dom0, the
> initrd module pages may be either mapped or explicitly copied into the dom0
> address space. So to handle this situation, the PV dom0 construction code will
> set the size of the module to zero, relying on discard_initial_images() to skip
> any modules with a size of zero.
> 
> A function is introduced to release a module when it is no longer needed that
> accepts a boolean parameter, free_mem, to indicate if the corresponding pages
> can be freed. To track that a module has been released, the boot module flag
> `released` is introduced.
> 
> The previous release model was a free all at once except those of size zeros,
> which would handle any unused modules passed. The new model is one of, free
> consumed module after usage is complete, thus unconsumed modules do not have a
> consumer to free them.

Slightly confusing.  Maybe just "The new model is to free modules after 
they are consumed.  Thus unconsumed modules are not freed."

> To address this, the discard_uknown_boot_modules() is

"unknown"

> introduced and called after the last module identification occurs, initrd, to
> free the pages of any boot modules that are identified as not being released.
> After domain construction completes, all modules should be freed. A walk of the
> boot modules is added after domain construction to validate and notify if a
> module is found not to have been released.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v7:
> - This is a new approach as an alternative to the `consumed` flag.
> ---
>   xen/arch/x86/cpu/microcode/core.c   |  4 ++
>   xen/arch/x86/hvm/dom0_build.c       |  7 ++--
>   xen/arch/x86/include/asm/bootinfo.h |  2 +
>   xen/arch/x86/include/asm/setup.h    |  3 +-
>   xen/arch/x86/pv/dom0_build.c        | 20 ++--------
>   xen/arch/x86/setup.c                | 57 +++++++++++++++++++++++------
>   xen/xsm/xsm_core.c                  |  5 +++
>   7 files changed, 67 insertions(+), 31 deletions(-)
> 

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d061ece0541f..e6d2d25fd038 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -341,27 +341,55 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>       return nr;
>   }
>   
> -void __init discard_initial_images(void) /* a.k.a. Free boot modules */
> +void __init release_boot_module(struct boot_module *bm, bool free_mem)
> +{
> +    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
> +    uint64_t size  = bm->mod->mod_end;
> +
> +    if ( bm->released )
> +    {
> +        printk(XENLOG_WARNING "Attempt second release boot module of type %d\n",
> +               bm->type);
> +        return;
> +    }
> +
> +    if ( free_mem )
> +        init_domheap_pages(start, start + PAGE_ALIGN(size));
> +
> +    bm->released = true;
> +}
> +
> +void __init release_module(const module_t *m, bool free_mem)
>   {
>       struct boot_info *bi = &xen_boot_info;
>       unsigned int i;
>   
> -    for ( i = 0; i < bi->nr_modules; ++i )
> +    for ( i = 0; i < bi->nr_modules; i++ )
>       {
> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
> -        uint64_t size  = bi->mods[i].mod->mod_end;
> +        if ( bi->mods[i].mod == m )
> +            release_boot_module(&bi->mods[i], free_mem);
> +    }
> +}
>   
> -        /*
> -         * Sometimes the initrd is mapped, rather than copied, into dom0.
> -         * Size being 0 is how we're instructed to leave the module alone.
> -         */
> -        if ( size == 0 )
> +static void __init discard_unknown_boot_modules(void)
> +{
> +    struct boot_info *bi = &xen_boot_info;
> +    unsigned int i, count = 0;
> +
> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)

for_each_boot_module_by_type ( i, bi, BOOTMOD_UNKNOWN )

To match style from 74af2d98276d ("x86/boot: eliminate module_map")

> +    {
> +        struct boot_module *bm = &bi->mods[i];
> +
> +        if ( bm == NULL || bm->released )
>               continue;
>   
> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
> +        release_boot_module(bm, true);
> +        count++;
>       }
>   
> -    bi->nr_modules = 0;
> +    if ( count )
> +        printk(XENLOG_DEBUG "Releasing pages for uknown boot module %d\n",

"unknown".  Since the operation already happened, maybe "Released pages 
for %d unknown boot modules"?  I'm not sure of the value of that 
message.  It would be more informative to provide the module index and 
maybe a page count.  The index would at least point to which module is 
unused.

> +               count);
>   }
>   
>   static void __init init_idle_domain(void)
> @@ -2111,6 +2139,8 @@ void asmlinkage __init noreturn __start_xen(void)
>                      initrdidx);
>       }
>   
> +    discard_unknown_boot_modules();
> +
>       /*
>        * We're going to setup domain0 using the module(s) that we stashed safely
>        * above our heap. The second module, if present, is an initrd ramdisk.
> @@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
>       if ( !dom0 )
>           panic("Could not set up DOM0 guest OS\n");
>   
> +    /* Check and warn if any modules did not get released */
> +    for ( i = 0; i < bi->nr_modules; i++ )
> +        if ( !bi->mods[i].released )
> +            printk(XENLOG_ERR "Boot module %d not released, memory leaked", i);
> +

Why not release the memory here instead of leaking it?

I feel like the corner case of mapping the dom0 initrd is leading to 
this manual approach or releasing modules individually.  That logic then 
has to be spread around.  discard_initial_images() kept the logic 
centralized.  Maybe just replace the mod_end == 0 special case with a 
"don't release me" flag that is checked in discard_initial_images()?

Regards,
Jason

