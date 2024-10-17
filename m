Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE39A3120
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 01:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821399.1235201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ZWG-00010G-2k; Thu, 17 Oct 2024 23:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821399.1235201; Thu, 17 Oct 2024 23:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ZWF-0000xg-W2; Thu, 17 Oct 2024 23:02:59 +0000
Received: by outflank-mailman (input) for mailman id 821399;
 Thu, 17 Oct 2024 23:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1ZWE-0000xa-L5
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 23:02:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1e89397-8cdb-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 01:02:57 +0200 (CEST)
Received: from BL1P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::31)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 23:02:50 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2c7:cafe::b) by BL1P222CA0026.outlook.office365.com
 (2603:10b6:208:2c7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 23:02:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Thu, 17 Oct 2024 23:02:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:02:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:02:49 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 18:02:48 -0500
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
X-Inumbo-ID: f1e89397-8cdb-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtTYJrXRKxSIYghynvQYpU+DhidnRGHneNMbZ2xBni2eNMLNecMfMdh1nKfr2jjNdw9bdM0fHDYWwn+W94MsVp/t9CgOml1WFh+b7t0R8gG4hw/NvuAv+yk0xgCZY2qDymuEHVLkNu8tjT1DhiFm7g2MP9QnY5YjzncJ6P9gVOh0TjXYiLd4/5sRrVGzibmqh+fwMPWAEUAzZS5g9gzL4BPZxItQH1IgZzU/iXfMgPQ2JHN7dBrwbmInqAXX+lCF/NeZDg298VACgZ2kVB3+2+VbcchR58Nl6iIDUAeIZLQuFpA6u7liQ2a8KLnW5uCRHFhQqHjgN5xWGfCH+xcJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlssxS5dA+B8fy3sNYL4ak5z1TyaBT3rNYJ2kxgo62g=;
 b=t1Ojzk8lg/XQAJhy8OTmwvzmu6LsIZJr3NwcmC9+sSLwGregKxrEiXRuOAdyg6wImnL+LIH/fCRSN+t7T8ZNeyGT9bEoWQZ6CQD+cx4dVD/4mT6Ql5jMhfSBAmNtPM9f+S5MzshiqNtITN7bFCLr4wxrMnXZ7NkBrXfL+zAhm2YHvupgiDioOx8wDAAethZKAErKZVguVHWFlMmOdsXBhOV3yajOpxIZjT68Nd5jc2i0ZbTWXAWWKLpjyXX3tRUnr8F51uI9at7vPtkwKbwu052/YTyXnp+MczFEv5kr5r7GQSxgByhOoRU03Av71NECJqzZL4UItV1FTwsqrisRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlssxS5dA+B8fy3sNYL4ak5z1TyaBT3rNYJ2kxgo62g=;
 b=UnnU+uN/4X1M0rhsJs9Bg05DpjIosZtqApy069eivD31+YCpowKgFJdSFSoONOkJg6g2hOhWcQpxqQmb1W56jPghPU1GDltWZ0Qbdqp2jLIxBJCjKtVVahTEcFLy/i1zPL2Bs6PI8U3H9P4LeeiGJ26c0jIo2wgaqMmzpBPJG9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <73783f6f-c041-4190-bed3-f2cebd2e57b2@amd.com>
Date: Thu, 17 Oct 2024 19:02:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/44] x86/boot: convert mod refs to boot_module mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-9-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6513af6b-6719-4d93-df6e-08dceeffd327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dllMQmxmQzNuOWlkc2N4WHQ0TGpKajJndVk5Qk15MDBERXl2b1B2Y1BjREc2?=
 =?utf-8?B?U09aRkVRelpTeUhGUGpmVk9zQUcxbGxoTEN3VEVTMW9TUkI3U1F5T0ZPUHVZ?=
 =?utf-8?B?VTM1NTdQeUJhZXZ4MERNRmtxcTIyUW83Mk5IWm8rNjRQM09lY1ErSm85Q0xP?=
 =?utf-8?B?M0ttYWphUlJFOUdYaWo0ejFBakJnYW05RkU1NkNDMDNyREJKNmF1N2lFZzVi?=
 =?utf-8?B?STBpZ1l2eGFIR29UT0FsYnF3S3NkeXg5TmpUeDJxaGdjTHlGbnA2aVdNYUF2?=
 =?utf-8?B?UElRQkYzNnBNMC9KS25yYksyQ1NGRXdkV3MyYytmT09JRXlId3pDUjJackRj?=
 =?utf-8?B?OGhpb09SRk5WL3dGZ2Z4cUp6Mjg2WEZUbU9OVkxRcFBnQUJ4VGFtVlNFTFpM?=
 =?utf-8?B?OWp5TWlVZm9ZMmZGWm5EeHdPWm9Kc2xpTnNJd1NiTERZcFNvOWlocXNIZ1VY?=
 =?utf-8?B?T2VCczNyQXpVUWxsK0RKWDFFQS9GeW5QNHh1Q1dTOXdFdmhYR29YNG9zeVBt?=
 =?utf-8?B?VnBDVmRpRkFKaTJSeHhzVVordGFYQTJaL2tLbW5RczNkNVBKSk1UenhTUThN?=
 =?utf-8?B?YTV2akhteEhBRmRuNjJrUDFBWEtCVUhDTFFEcW1qU0g0cExhSEZxM3NpcWRZ?=
 =?utf-8?B?cE9XcGN2aHFFR2pKblhMNmhIbWhpNkxFbVV4RktvZ05VZDRNS3dVM1RjMWtw?=
 =?utf-8?B?MVR4WFJTRlh2NEEwRTdCQit3QzF3Q2k2VkxYY1lWcS9BVkQ3NWIwM29ObVVC?=
 =?utf-8?B?ZGlFMkhIcGdsSWRFSXVNSXQ3cUZBMmlBK0tzYzJzakZkcDlpRzV5c3cvdzNO?=
 =?utf-8?B?WXNyT093RE1RVnhkR3p0cnp4a3NLOVFONE51U3NVOHNOYjNIZHVteTYyaW1L?=
 =?utf-8?B?OWx3SWxxNjE3ZHhpYlh6OTBYd0taVE5Rc08veVpicWlpWWl0OVdVQU9RRzQv?=
 =?utf-8?B?cjI0ZlRxUG5Pb3dGREx5WTZYZ3NHeUlnaUVWL0E3SmhQaTNTdEFkK25qUWo2?=
 =?utf-8?B?ZGhOVWNSbzFoeVhXa1k3ZUdXZjJuRWQ2Y2xYZnV2THhXK0FycWV4c1FFNXZ6?=
 =?utf-8?B?cU8rSE8xVERvckgwNFppMHYvN3FDcENvRkQrZGNMdDFYTEs4OG1jZ3hYY0F6?=
 =?utf-8?B?N2oxazlhMVptMWszRG5ORThGWHk4OWkxQVJnSkh5dGFSNjNCRGRieGNPc3Nr?=
 =?utf-8?B?czJjdzQxMVVaYkRUT1RLdFVRWEpBNEJwQWtERjJhT2ZEaDZ1VFhCZmlvWURz?=
 =?utf-8?B?U0tRSTI2dkp5Q096S1NjVUY2YTExSXRqVHIwZVZXK1JyY3gvZjVkTzhPclVm?=
 =?utf-8?B?SklLVkNPNzlLS2ZZNGNLQStxcUVhV0FVNFpJck5OY2phQXR2TGlBVUxmaWtK?=
 =?utf-8?B?ZFU0Qll6QmJaM0N1WGtHZHJTUkNGRnpiZzFubG1yR0lqSG0xWjVlTXRqVEhS?=
 =?utf-8?B?K09Ga2VZR1YrQUhXM0g0OERGeHpvQ0xmaUcwSEY4VWZqeFV4cC9vd01nOG8r?=
 =?utf-8?B?SUdYdUdsaktGY2RVTzJNNktYeXRsYmVjUTBYR3Q4RUNYc2JCWmtOeGxhSzRM?=
 =?utf-8?B?NnUxZ1I2WFRjQjkrL0NpTjk0Vks4RU9tY2pEMGN2eHZWdS9OQkM5eUFaLzdq?=
 =?utf-8?B?VlRKSGNUTmtWZW9RclFTc3dNVkhpMHpKR1hwcm9pU2kyOEpNNDdTdUtmNHFt?=
 =?utf-8?B?Vkl3c082eGtOWmxFTEpnSkdvMWNGdFpIa1pxcWxQbUdvUzNBSWY5aFllRUkv?=
 =?utf-8?B?MTA3V1lvbFBYaDVTb2lldEFmV2h3UlhZK0NFT1RIS1MwUDE0TGUwRm5qdFJL?=
 =?utf-8?B?aFRZVncxaUUzT25lTGRrcy9KKzBxSmxiMjh3TzlLTzRvZjhoYWhvdXVjNlpv?=
 =?utf-8?B?eFFkdXlvVDJ4TDZLQUZUVWNnQzUxYktXK1dMZEhUVnFxT3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:02:50.5507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6513af6b-6719-4d93-df6e-08dceeffd327
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840

On 2024-10-17 13:02, Daniel P. Smith wrote:
> To allow a slow conversion of x86 over to struct boot_module, start with
> replacing all references to module_t mod, only in setup.c, to the mod element
> of struct boot_module. These serves twofold, first to allow the incremental
> transition from module_t fields to struct boot_module fields. The second is to
> allow the conversion of function definitions from taking module_t parameters to
> accepting struct boot_module as needed when a transitioned field will be
> accessed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - rewrote commit message
> - coding style changes
> - added comment for initial_images assignment
> ---
>   xen/arch/x86/setup.c | 64 +++++++++++++++++++++++++-------------------
>   1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 11e1027d72dd..1b56eaf26efe 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -1460,9 +1465,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>                * move mod[0], we incorporate this as extra space at the start.
>                */
>               struct boot_module *bm = &bi->mods[j];
> -            unsigned long size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
> +            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
>   
> -            if ( mod[j].reserved )
> +            if ( bi->mods[j].mod->reserved )

Use bm->mod->reserved here?

>                   continue;
>   
>               /* Don't overlap with other modules (or Xen itself). */

> @@ -1591,8 +1598,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>                   map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
>                   for ( j = 0; j < bi->nr_modules; ++j )
>                   {
> -                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
> -                                   mod[j].mod_end;
> +                    uint64_t end = pfn_to_paddr(
> +                                   bi->mods[j].mod->mod_start) +

pfn_to_paddr and mod_start can fit on one line

> +                                   bi->mods[j].mod->mod_end;
>   
>                       if ( map_e < end )
>                           map_e = end;
> @@ -1666,11 +1674,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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

Indent PFN_UP since it's a continuation of the previous argument?

> +        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
> +            _mfn(bi->mods[i].mod->mod_start),
> +            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>       }
>   
>   #ifdef CONFIG_KEXEC

Regards,
Jason

