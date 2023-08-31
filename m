Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C6778E923
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593540.926534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdjg-0000rl-0q; Thu, 31 Aug 2023 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593540.926534; Thu, 31 Aug 2023 09:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdjf-0000pn-TN; Thu, 31 Aug 2023 09:13:07 +0000
Received: by outflank-mailman (input) for mailman id 593540;
 Thu, 31 Aug 2023 09:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTy1=EQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qbdje-0000ph-04
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:13:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96b57772-47de-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:13:03 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB5891.namprd12.prod.outlook.com (2603:10b6:8:67::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 09:12:59 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 09:12:59 +0000
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
X-Inumbo-ID: 96b57772-47de-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbzoJ+Fh52MATtsbSDRWw+WGcnOivGi7EU4h8u7ACw5txCiTzVdFLVsZ89at1RMPjFFpaZ0uTUrt0gAc+R9VDrxnmnYu7clWPJEdlkXme65Im6PT5WXqzjkVGJPv9i9lWWLL95tpGSePsHlhM/FTXvi2/cFwdh7tA+AzEHzwzbb6qcsakGbo2uhwvoRs6Ax/emRM4BeuNP1B+Hzi17do/wYbLRErdRkY/9qYANMh/WV/IGCEoQ2h0YfMHgkvabOVW0e3613+bDpiiajIU+P2SDpbKbx9bi5gsPBSP+Ala3ZhjYjzlQQAuroG1S1XBk7QU26TXZ1Vl1T2jcR7oe6MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N+JXxX6EishSCtigrSRjMizHPdnv/3iqPVGZS2X2vk=;
 b=FljWy1qxd7C3rXZ7kt5CCt9DFnLvNZTQ72z39CKX+ra/F5xgRjOZq3vREBLV14ZdOXvPcH3lWYPkZ3JS6rw21aoBBnlhJp+/a1I/MOAqtzN8sMJ27U7mYjHUTVcWcxZjGevBshSt7683zMWK42/C2b/iBTdGvvsd5A0MMuLvpIpYDUp2cbsgN6EciSiSqgnO87VROz5OTXP6d6gDqxHL63CLIBDuYYmeZ3r//HExnOEgv7PhKa5sTMaO2kbTKu7hUeqt955BDTbPyAA2UPAbVYedvE9hnfuxFCDKbuasDae9uJNGeRq/fBdTENtIvA5Ai/4aTwFkLouhaek5Ft119Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N+JXxX6EishSCtigrSRjMizHPdnv/3iqPVGZS2X2vk=;
 b=0rFfoxWZi280thbaFUa7nl7QFxBAx4DG/kM8tPojMa8D74BpsYyzy22YY9PdI7MathEzckeqOaNoY7hve9EecThtJyCbXj6PTZPgDd7yCymeKctbg+5s+89lgrPx5V8VZ/cfL2HADRD48YJxG/lrihmEP4zPp/sEMCm3OKgxJIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
Date: Thu, 31 Aug 2023 10:12:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>, Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230828013224.669433-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f80fc68-85a2-4917-2b70-08dbaa02781b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0nqpqai1obdDUUszHOPN5YFdx+9l8jjPKw9Ax2+frOYWa4zkeAngpO4S/PhZkUGPhQsBNcqdyHeULqnwByHEUtgPK8r1g/kQsql/QOiaAXR58lyaDd1GbQW8zxD6Uu6dzZHBBCJU4bJxfjx79QoRlxw6Yy2Xh1et63asIRP4kMEI611VgxfNFAgOZH3PbO67ioX9bpDIl54caasbG5OjfytSNiB/i7RvhoCEKPEjvyf9Lnx2owUqb+ssfE7hyAuPeZop7k/MDZ0P+19DKWRGljnrWAJnCzTAfTKHAV2INFd6ZcQhXQpns08EA6f3LoBv1N74UAOE+IXIy5sKlwiz51OQovvIETR+51e3PTMZsbaU5Cj4/ZU53BK2MMEif9fS2iEj6E+vUgWYb19dVvBTZC5uXbFMl3NUvu2jpghU5ZsTJj8dpH22uDNzj7B4Iea34RZ+HYqKhUkMZZOSh42hi9P9e7fh8oCkt4nSYjsn6bOO+u5GVG47o3lF7Vm4ssYYAI2VP9qSI/Ze+K7MgzcHpKzVIHnE3AWgeWG01dEESYHj7pnkD3Fdewwx88ur/+9pTOt4dQxTtfwtU3za4SBhI5kyz95b+d+WWO3jixLMTZyuA1esOZZ7yUdNU579lIhJIN4i6zRqCEy///wZWq3jFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(5660300002)(4326008)(8676002)(83380400001)(2616005)(31696002)(26005)(36756003)(2906002)(8936002)(6666004)(66556008)(6506007)(6486002)(54906003)(66476007)(31686004)(478600001)(53546011)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0ZaUmtVN0I4SWhJamlER1hNNUlWcTYzcHV6TW44VFlicHl1Z3cwaFY3NlhZ?=
 =?utf-8?B?UHFNcS9GNnBGZ0xHL3FhRXpjQys4VGJFQndYSEh5c2U1RjJ4dzdySk1HbUd5?=
 =?utf-8?B?T1Y5eXVOdzd0T1YzbDg3WW9kVXhIM1ZDaW50RVhIaEo2NWdjZUlkMjhkVitx?=
 =?utf-8?B?NnRnY3ltajJvaFkxZU1CNlZxazBzanMweEFuWFdpK2ozQnJQSFdqQWM5Wklh?=
 =?utf-8?B?Q1VGWVNHUU9wbzAxU0ZJZUxlWlJHc3JPT0k4ZTFRSm1TQ2NUajZiNjVGT05i?=
 =?utf-8?B?V1ZpWEsybGJueVVyZ0dhT1BucnFTQnJxdVB1eWIvL3paY0VHbzlFTXlmQm4w?=
 =?utf-8?B?bG1MSE9jQ3pkQmUrUGNTSlF3cEVVenVTcGZGMGFaSllWZ0tWNG5sM1h5NzEz?=
 =?utf-8?B?NzdtZmdGOGNZRTU4RXNUbzFUMUVsTTQyMXZmWjAzNGw1OEdVbEFVeVhPbHlJ?=
 =?utf-8?B?czd3MXVBdDJYSnRNNFNkcnltQXBZL09IaFNmOHVxSE5qbjFsZEFUZlFNTWNT?=
 =?utf-8?B?TTNGNDZ4ZGlzTWJheTREUlVoTVdFTlNjbmNrUWVFeGQ1MGxpWjA0bjFicE5X?=
 =?utf-8?B?VmJPUjRockJXUXpVci9MaDVVdDZWWnVqMFNwc3gxR2RwY0RNNCs5dDArQXpQ?=
 =?utf-8?B?dTV6d3A0aHFrUkNlN2JQOThyRE1vZUVDVnFTZjlWb3NjcTkxOFRDTVRVR3Qx?=
 =?utf-8?B?TElPd3ZSODhGdGhFd0RUTzRhaXYvdnduUStKNWJzMzkzM3dPVzJUcHFCQ0Mr?=
 =?utf-8?B?NW4xclJnaHE0NVplZy9GWEVGRVBRUDBLYmhiT3B1TENEcG9EUEx2NnNRR09a?=
 =?utf-8?B?ZndaditJaEhXZXQyT3dBM01BZGxDYW9PZTRsRHlhL1NsR0NzRGIzTmtudTVT?=
 =?utf-8?B?WjFyTFl4NE0weTgyQW8rdG4zTkZGNWdKbmdUdHp5LzFkSFdrRmcxcmVvSURa?=
 =?utf-8?B?bGE2WGU1TkluazF1d0ZSam10bGtJRzZaa3pjcE05K1E0c0hxK2t5eHNNR21V?=
 =?utf-8?B?bDlla3dkSktiOS82a0tUT1RHUk96N0FVQ2JBUjVjZWQvbTUwRzBGcjg4LytM?=
 =?utf-8?B?Wlplbjk1Yk5wNmY1TnBIMDZjWWxpbE9rTXhXWUJ1QzNDaklnUTY0T0dzZzBY?=
 =?utf-8?B?c1dIeDBHbFdZVmZBZnFsKy9ubHc3MXU2RnRRNW5LQWZZWmc2RHdWeTJEYXo2?=
 =?utf-8?B?R3RzaDNUbC9mVWZ3Z2RZSG02Nmg3YjkwRGpzUzZoRnNUeVpKYVVUTjJucERv?=
 =?utf-8?B?OUtyQUErY3RjVm11Z2ZhM3VNVk1nVHMrSVNHTFhubWZscTVTcUh0ZmFZOUhL?=
 =?utf-8?B?WDBHQXJrVmhRcm9CRnhGM3RBWndrK0s5TUo5VkdQdlBWTXExQ3VBSkMycXRB?=
 =?utf-8?B?dkFpS09aUytmZHVjaG85SklxSmtSTC94TENaTUx6L05HZnFnUUsxRmNVNzQ3?=
 =?utf-8?B?L2FYM0hkaGhRMTFpVVlmbmxaaDZGQjhCRU5jUXFYd2N4Ukd2MSs4VGlGY0NO?=
 =?utf-8?B?d0RRSk5CdGFVQXZ1Y2NPUTQrczE3SVd5M0RFWGlZTEZQZXVLaXVpQjZOTzhC?=
 =?utf-8?B?bUtnQ1FNc21JQ05zSWROOG8rNzIzdEZvcG1tRmRKMHEvVElLTElMK0pVd1gr?=
 =?utf-8?B?LzRMaktYMDJqMUh0MHNHVnJpRUpkUW9Bb2RKbE5WUGVmT2djUlRWMTljL3k3?=
 =?utf-8?B?b3dzc0ZHVFdGQmVRSmkyM0pJQitiYU5GaWFpY1BaVEJCL1hZTGNTbTF2ZlpT?=
 =?utf-8?B?U0pqYmtVcnpZcDI2bS9IYVV4clZNbTZwSHhZUDJjOE9nZzZuWHBEekpsUm4w?=
 =?utf-8?B?RnJOYnlyWG5DcmVWYmJsR2NZU1kvOUZ4MGtXcWNTSHgyY1Z4Y1hnNUpmc3cw?=
 =?utf-8?B?UEtWL2F3V09QNXg0eTV6ZW4vd0tFV2VUaFl1T1hka2QweFRNNEZqdWZUSXRo?=
 =?utf-8?B?WkJkTWUzTmZ3Njc1OXNKMk02MmVmcjhxMzlldDRXZ21lTWhPUzZlSHA0NURG?=
 =?utf-8?B?M1BYS3hTamJlK2VVRjluYWRwNnZDS3VqUXRROUV3QUFPaGRUejNveEhWaFpV?=
 =?utf-8?B?WVZWVWhsTHpRazlrRTB3Mk41eVcyZEJQUW1JYUJMR3BXb2Y0eGlkWklaRUNI?=
 =?utf-8?Q?dfzIrNMnrKuiH1iMBvGILzxDa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f80fc68-85a2-4917-2b70-08dbaa02781b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:12:58.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJyEIy0vLN337mXFKVr0Y2N+b2NvfZrE+TjmRQokEuux0d/kHNuPzsi4utK0mDWP0NmUTVLvhpi45B+uRd/s8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5891

Hi Henry,

On 28/08/2023 02:32, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Currently mmu_init_secondary_cpu() only enforces the page table
> should not contain mapping that are both Writable and eXecutables
> after boot. To ease the arch/arm/mm.c split work, fold this function
> to head.S.
>
> Introduce assembly macro pt_enforce_wxn for both arm32 and arm64.
> For arm64, the macro is called at the end of enable_secondary_cpu_mm().
> For arm32, the macro is called before secondary CPUs jumping into
> the C world.
>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v6:
> - New patch.
> ---
>   xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
>   xen/arch/arm/arm64/mmu/head.S | 21 +++++++++++++++++++++
>   xen/arch/arm/include/asm/mm.h |  2 --
>   xen/arch/arm/mm.c             |  6 ------
>   xen/arch/arm/smpboot.c        |  2 --
>   5 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..39218cf15f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -83,6 +83,25 @@
>           isb
>   .endm
>
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +        mrc   CP32(\tmp, HSCTLR)
> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +        dsb
> +        mcr   CP32(\tmp, HSCTLR)
> +        /*
> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +         * before flushing the TLBs.
> +         */
> +        isb
> +        flush_xen_tlb_local \tmp
> +.endm
> +
>   /*
>    * Common register usage in this file:
>    *   r0  -
> @@ -254,6 +273,7 @@ secondary_switched:
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>   #endif
> +        pt_enforce_wxn
>   

Can you move ^^^ to before "#ifdef CONFIG_EARLY_PRINTK" so that the MMU 
related functionality are bundled together?

Also AFAIU, mov_w has not effect on pt_enforce_wxn().

So that I can create a function "enable_secondary_cpu_mm()" - similar to 
one you introduced for arm64

/* This will contain all the MMU related function for secondary cpu */

enable_secondary_cpu_mm:

bl    create_page_tables

mov_w lr, secondary_switched

....

flush_xen_tlb_local r0

pt_enforce_wxn r0

ENDPROC(enable_secondary_cpu_mm)


- Ayan

>           PRINT("- Ready -\r\n")
>           /* Jump to C world */
>           mov_w r2, start_secondary
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index a5271e3880..25028bdf07 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -31,6 +31,25 @@
>           isb
>   .endm
>
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +       mrs   \tmp, SCTLR_EL2
> +       orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +       dsb   sy
> +       msr   SCTLR_EL2, \tmp
> +       /*
> +        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +        * before flushing the TLBs.
> +        */
> +       isb
> +       flush_xen_tlb_local
> +.endm
> +
>   /*
>    * Macro to find the slot number at a given page-table level
>    *
> @@ -308,6 +327,8 @@ ENTRY(enable_secondary_cpu_mm)
>           bl    enable_mmu
>           mov   lr, x5
>
> +        pt_enforce_wxn x0
> +
>           /* Return to the virtual address requested by the caller. */
>           ret
>   ENDPROC(enable_secondary_cpu_mm)
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index bf2fe26f9e..a66aa219b1 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -216,8 +216,6 @@ extern void remove_early_mappings(void);
>   /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
>    * new page table */
>   extern int init_secondary_pagetables(int cpu);
> -/* Switch secondary CPUS to its own pagetables and finalise MMU setup */
> -extern void mmu_init_secondary_cpu(void);
>   /*
>    * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
>    * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f3ef0da0e3..3ee74542ba 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -322,12 +322,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>   #endif
>   }
>
> -/* MMU setup for secondary CPUS (which already have paging enabled) */
> -void mmu_init_secondary_cpu(void)
> -{
> -    xen_pt_enforce_wnx();
> -}
> -
>   #ifdef CONFIG_ARM_32
>   /*
>    * Set up the direct-mapped xenheap:
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index e107b86b7b..ade2c77cf9 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -359,8 +359,6 @@ void start_secondary(void)
>        */
>       update_system_features(&current_cpu_data);
>
> -    mmu_init_secondary_cpu();
> -
>       gic_init_secondary_cpu();
>
>       set_current(idle_vcpu[cpuid]);
> --
> 2.25.1
>
>

