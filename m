Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73188A601B8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913459.1319496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoib-0006lK-KP; Thu, 13 Mar 2025 19:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913459.1319496; Thu, 13 Mar 2025 19:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoib-0006j2-HS; Thu, 13 Mar 2025 19:59:49 +0000
Received: by outflank-mailman (input) for mailman id 913459;
 Thu, 13 Mar 2025 19:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VEl=WA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tsoiZ-0006iu-Vk
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:59:48 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20628.outbound.protection.outlook.com
 [2a01:111:f403:2409::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a1108f-0045-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 20:59:44 +0100 (CET)
Received: from SJ0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:a03:33e::31)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 19:59:39 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6f) by SJ0PR03CA0056.outlook.office365.com
 (2603:10b6:a03:33e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Thu,
 13 Mar 2025 19:59:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 19:59:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 14:59:38 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Mar 2025 14:59:38 -0500
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
X-Inumbo-ID: b4a1108f-0045-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR1ynQv2YbXOF9ytjU4sCnkuaGZoBz9bqtw2Ni+gk0q6ohH8S6i0eA3x2jul7Yf13ldDu9iTg+ACLxdgWHYmEGOXiHRFXkIQLGma4aje/lkCAjbGsaYa5MXFFK9B0eiLrV4Nwqjhcss+PHW9GSM6qkgp9B/Zr5fVkpcR/8KYfamE3y3VdpfFFTY/DzRePKkKFy5dniKnDaTjhtwe7h1SlMs/rklyQ+inFfYKHVsmWEGCey9VG0hsnHtPmPVfalh33fnjmoJunxEDDKgkx8+gYTx1MSQBFVeYa3ZFmrkzZrltRcw4nXIXXPllEUV/0rfP/CucvYvFZCgx2ixboLDzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqfPq+mZmGNLseZ0eeM6hYKGvOqszUy0gCFXV0Axp3k=;
 b=Sl/Wj0FjGKjko+xHnvW7ZcZKUn1mC3v487hV+SGRwDWkmQNeRZ/1qtCcMvJFzLJhrc59G6gjRD1Dzz0mFzl+5m2nBPZDo6Hcz93GjVvh4rRXtO0CsGCsNRBGJHH3iWfSZuiWXx1CIQL5imTmq9etL1a267WNYZWZfTNJanJKY+F4i/3l9nAB9yezE2N6NXHKe6H6X6E3BVjO2G1nzXGaFYjLe8tTQrLvFHODct1eKPxuKtvVk/jj0QhfcG5vhaLTg10t4cpp0cf7srOEdztmmqF3vMo9SO6FHTqtoJpOQ1XsJHGgK8ZJJlT8NdwcIDVoYWLHWk7mH20ecQyRTfq/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqfPq+mZmGNLseZ0eeM6hYKGvOqszUy0gCFXV0Axp3k=;
 b=KKTjVc7ZPeVDjRXkBkw/uMNkM6ymXBCHxjHpgn5lzB7kTqUH+sxZbEQJs9RIaTRGTFD3IK3TQDYr0aw4ignoig9tlUYhzpt1TKCM45nhusNpI67w6x1Scb0pT8tslViX8il5XyfzNNkRxiY6cTF65Ht3VB1+J+7I2X+kg0+vb0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
Date: Thu, 13 Mar 2025 15:59:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 55537e00-3af8-44f5-ccc0-08dd62699691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjNMMVpjUzc4SDVVUzB2azNqZTUzY3k2UGhZaDBSd2tjb2FqWnlSVk5XZGVX?=
 =?utf-8?B?bXJ3SHZVVER1bGNNU3ltMkRXdEZ0dUtSQ0VndmkrTUgzVWN6U2NZb01vaDBR?=
 =?utf-8?B?NmJUKzZzNStLaElQbGcvK3lnOXFwS0JST3VTd09FVVR5VEdJMnVhVmZoSit1?=
 =?utf-8?B?b3gzdlhvL05Md2d1dGRaeVc3TWh6NGdmU1UybTVxWldsOWYwNmI2Mi9lZmVI?=
 =?utf-8?B?MmtrNUY5WVMxMytoMjhsZ0YyQ09jcFNTaVhCcVk5YzZwbkN5VHA1NkFxcWJT?=
 =?utf-8?B?QjFKUzU1S25qSWE5NURrYUUxY1ZaR2tFOVZrSE5yRFNVUFA5SVowRTRVcmtt?=
 =?utf-8?B?ZjRIbkVEaGVDQ1FwUk12b1FLQmlIbTBMaldZVE9NN09veFlnd0NqbGl3UE9B?=
 =?utf-8?B?RHhUKzMwbEk3UlBjakdFODdWeVdQb1JUTXRNWCtWUUl0WEdoUmNyNy8xb2xX?=
 =?utf-8?B?QlBQMmVNYm5JSVRyVDkxYVdQYVNNWjdsb09mTmxzeFYxVWo1WDJTeHByOEIr?=
 =?utf-8?B?RG1BZ3gyZkJ1WlFWeCtPN3p1WXhic2t4TE1lVWRnSnNEcUd0LzEyWHJZWHQ5?=
 =?utf-8?B?VTAwNlhNckRZTmp6TVYwaWVrQWlrbyt1UitKVTQrRm1hejNGM2ZjRnZSZjJE?=
 =?utf-8?B?a2JzbXNFcndGeENFNm5YL29BZmdQZ3ZGMExVb0k5TEZRWDdJdGd1NFdkMWhU?=
 =?utf-8?B?aE80RFcrZlVQZWF2ZzlJUXFxS0IxVW9ZRWNMdWFMNFVKYjBadlBPQXFob1RX?=
 =?utf-8?B?SUQ0SkhuMlZUUVJGRXRyVFQ2OHZJR2swcUZxQWIyY0plU0NGWHNZMUZ6a2tw?=
 =?utf-8?B?VEFJVURqaTc0Y1VzejJxcHRUcW16VWc4Z3ZhcDlQdWF6azMyOE13NDhES25C?=
 =?utf-8?B?d3ErTXQ1QmN3RTVOVGxiRHBOMGs2OEt5Z2pPTU93aXdlMGg1d2Vrc3k5bFdX?=
 =?utf-8?B?ajc4L1VkNEc4Wi9rNys2RGJTNThOQUovMmJoQldVSHpKeEFDWlJQcnUxTG1F?=
 =?utf-8?B?ZzAydU1ydHF5ei91RzVma2lDU3BNU2hPQUVaK2xWT3hiOXF6Q1V5S3lnWmov?=
 =?utf-8?B?cFRHWGozdUZ0QWF0cXhPL3hNdldPREJNQzFGRkNNSWV4b2FEbFdReVZaVXA2?=
 =?utf-8?B?VlRxTmdzRjNkY1NrM2RGVCtRLy95UG1OTnkrZXUxK1dja0RiK0FOamxOajZZ?=
 =?utf-8?B?aWZ2YldudWkyeGs3Zm1iRWo0Zkxtc3R6dzdzNit1TzlPTm00Q2NiSkNQOGdV?=
 =?utf-8?B?MnpuWE9ocndvM2M4MXM5NUJ6ZXJYdTlNZlR1cGM4Yy8wVStMeFEvdEMvL2JQ?=
 =?utf-8?B?TGh2bjFFYldvM21tMGZjNkQwalc5bEdLMmljOUJ4TTJDd3VXb0R6T2ZMd2NG?=
 =?utf-8?B?enMvTG90Rm0vdWwwRmFjM2FHMVVjNHVFcnJrVGZWMk1tcTJKMzZmc0d4Nklw?=
 =?utf-8?B?bkRzaE9BYVpxOG5LanlJRk1nSjV4VHRxUlJCSi9MYjhQcDRSTmY1NkpzYXJ0?=
 =?utf-8?B?Y2RqSis0WW9TN3dRTEd5dmJqNFJldjJPSFFzbUovUmJzVDJRVjd3RjVtRVdD?=
 =?utf-8?B?R2lGYXFFcEl1aEdlZWcya1hlUXl0d0F6TURMaERxdlJnS0l5MmlZM3B4ZGZi?=
 =?utf-8?B?VVRmSkxOSjhCNWJKNk8wTHJqdzB2M3h2NUk4eVdNTkFPNndTSk1DRGFMeFVB?=
 =?utf-8?B?ak82ZDUyNjByd2loTXJaM3dnZ2ZHT3VVYkZLSnpsUGk3dnBkRytabnEydWlZ?=
 =?utf-8?B?VTdvZkJjK0x0d0tSdkVoRzI0b3hOSXFVTWdtM0V5aWtKV1RCSlZRQmhCL3Br?=
 =?utf-8?B?MHU1Qnp5SEIzSmdlMUlYYW1DakdWMVZuQzcxZXh6RzZzUkJud2FTS2EzOC9x?=
 =?utf-8?B?Y2pJc2ZXV2NJMG96d0lRZGUzczJMQ2ZuOGlFblp0b2dHdG5kb0FzclBackN1?=
 =?utf-8?B?NzJtcnd2eko3c01NanhDd2h2cm9zandtdHI0SjE5UXgrR2xTV3ZVZE4xa2tQ?=
 =?utf-8?Q?aoM9UPto0LWu+ctlad2XNrzI+21chM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 19:59:39.2297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55537e00-3af8-44f5-ccc0-08dd62699691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930

On 2025-03-13 14:57, Andrii Sultanov wrote:
> Following on from 250d87dc, struct amd_iommu has its seg and bdf fields
> backwards with relation to pci_sbdf_t. Swap them around, and simplify the
> expressions regenerating an sbdf_t from seg+bdf.
> 
> Simplify ioapic_sbdf and bpet_sbdf along the way. Adjust functions
> taking seg and bdf fields of these structs to take pci_sbdf_t instead.
> Simplify comparisons similarly.

It's rather large.  Can this be sensibly split into smaller patches?

> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index 00e81b4b2a..6903b1bc5d 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -77,8 +77,14 @@ struct amd_iommu {
>       struct list_head list;
>       spinlock_t lock; /* protect iommu */
>   
> -    u16 seg;
> -    u16 bdf;
> +    union {
> +        struct {
> +            uint16_t bdf;
> +            uint16_t seg;

Are these still needed by the end of this patch?

> +        };
> +        pci_sbdf_t sbdf;
> +    };
> +
>       struct msi_desc msi;
>   
>       u16 cap_offset;

> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 5bdbfb5ba8..57efb7ddda 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -107,12 +107,12 @@ static void __init add_ivrs_mapping_entry(

> @@ -239,17 +239,17 @@ static int __init register_range_for_device(
>       unsigned int bdf, paddr_t base, paddr_t limit,
>       bool iw, bool ir, bool exclusion)
>   {
> -    int seg = 0; /* XXX */
> -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> +    pci_sbdf_t sbdf = { .seg = 0, .bdf = bdf };

Maybe retain the /* XXX */ to highlight that segment is hardcoded to 0.

> +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
>       struct amd_iommu *iommu;
>       u16 req;
>       int rc = 0;
>   
> -    iommu = find_iommu_for_device(seg, bdf);
> +    iommu = find_iommu_for_device(sbdf);
>       if ( !iommu )
>       {
>           AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
> -                       &PCI_SBDF(seg, bdf));
> +                       &(sbdf));

Please drop () for just &sbdf.

>           return 0;
>       }
>       req = ivrs_mappings[bdf].dte_requestor_id;
> @@ -263,9 +263,9 @@ static int __init register_range_for_device(
>           paddr_t length = limit + PAGE_SIZE - base;
>   
>           /* reserve unity-mapped page entries for device */
> -        rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir,
> +        rc = reserve_unity_map_for_device(sbdf.seg, bdf, base, length, iw, ir,

Another candidate for conversion?

>                                             false) ?:
> -             reserve_unity_map_for_device(seg, req, base, length, iw, ir,
> +             reserve_unity_map_for_device(sbdf.seg, req, base, length, iw, ir,
>                                             false);
>       }
>       else

> @@ -916,8 +916,8 @@ static int __init parse_ivhd_block(const struct acpi_ivrs_hardware *ivhd_block)
>                       ivhd_block->pci_segment_group, ivhd_block->info,
>                       ivhd_block->iommu_attr);
>   
> -    iommu = find_iommu_from_bdf_cap(ivhd_block->pci_segment_group,
> -                                    ivhd_block->header.device_id,
> +    iommu = find_iommu_from_bdf_cap(PCI_SBDF(ivhd_block->pci_segment_group,
> +                                    ivhd_block->header.device_id),

Please indent to match the end of "PCI_SBDF(".

>                                       ivhd_block->capability_offset);
>       if ( !iommu )
>       {
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> index 83c525b84f..dc3d2394a1 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
>               threshold |= threshold << 1;
>               printk(XENLOG_WARNING
>                      "AMD IOMMU %pp: %scompletion wait taking too long\n",
> -                   &PCI_SBDF(iommu->seg, iommu->bdf),
> +                   &(iommu->sbdf),

Please drop ().

>                      timeout_base ? "iotlb " : "");
>               timeout = 0;
>           }
> @@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
>       if ( !timeout )
>           printk(XENLOG_WARNING
>                  "AMD IOMMU %pp: %scompletion wait took %lums\n",
> -               &PCI_SBDF(iommu->seg, iommu->bdf),
> +               &(iommu->sbdf),

Please drop ().

>                  timeout_base ? "iotlb " : "",
>                  (NOW() - start) / 10000000);
>   }

> diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
> index cede44e651..7d60389500 100644
> --- a/xen/drivers/passthrough/amd/iommu_detect.c
> +++ b/xen/drivers/passthrough/amd/iommu_detect.c
> @@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
>       rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
>       if ( rt )
>           printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
> -               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
> +               &(iommu->sbdf), rt);

Please drop ().

>   
>       list_add_tail(&iommu->list, &amd_iommu_head);
>       rt = 0;
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index bb25b55c85..e2c205a857 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c

> @@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>       }
>   
>       pcidevs_lock();
> -    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
> +    iommu->msi.dev = pci_get_pdev(NULL, iommu->sbdf);
>       pcidevs_unlock();
>       if ( !iommu->msi.dev )
>       {
> -        AMD_IOMMU_WARN("no pdev for %pp\n",
> -                       &PCI_SBDF(iommu->seg, iommu->bdf));
> +        AMD_IOMMU_WARN("no pdev for %pp\n", &(iommu->sbdf));

Please drop ().

>           return 0;
>       }
>   


> @@ -1543,14 +1540,14 @@ static void invalidate_all_domain_pages(void)
>   static int cf_check _invalidate_all_devices(
>       u16 seg, struct ivrs_mappings *ivrs_mappings)
>   {
> -    unsigned int bdf;
> +    pci_sbdf_t sbdf = { .seg = seg, .bdf = 0 };

.bdf = 0 isn't necessary as it will be set to 0 by default.

>       u16 req_id;
>       struct amd_iommu *iommu;
>   
> -    for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
> +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; sbdf.bdf++ )

I'd either set it or just drop the comment.

>       {
> -        iommu = find_iommu_for_device(seg, bdf);
> -        req_id = ivrs_mappings[bdf].dte_requestor_id;
> +        iommu = find_iommu_for_device(sbdf);
> +        req_id = ivrs_mappings[sbdf.bdf].dte_requestor_id;
>           if ( iommu )
>           {
>               /*
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> index 9abdc38053..0c91125ec0 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c

> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index dde393645a..17070904fa 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -694,17 +694,16 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
>   int cf_check amd_iommu_get_reserved_device_memory(
>       iommu_grdm_t *func, void *ctxt)
>   {
> -    unsigned int seg = 0 /* XXX */, bdf;
> -    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> +    pci_sbdf_t sbdf = {0};

Just " = {};"

> +    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
>       /* At least for global entries, avoid reporting them multiple times. */
>       enum { pending, processing, done } global = pending;
>   
> -    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
> +    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; ++sbdf.bdf )

Like earlier, change to code or remove comment.

>       {
> -        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
> -        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
> -        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
> -        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
> +        const struct ivrs_unity_map *um = ivrs_mappings[sbdf.bdf].unity_map;
> +        unsigned int req = ivrs_mappings[sbdf.bdf].dte_requestor_id;
> +        const struct amd_iommu *iommu = ivrs_mappings[sbdf.bdf].iommu;
>           int rc;
>   
>           if ( !iommu )

> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index d00697edb3..16bab0f948 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -32,35 +32,35 @@ static bool __read_mostly init_done;
>   
>   static const struct iommu_init_ops _iommu_init_ops;
>   
> -struct amd_iommu *find_iommu_for_device(int seg, int bdf)
> +struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf)
>   {
> -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
> +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);

Adding:
unsigned int bdf = sbdf.bdf

here would eliminate all the sbdf.bdf use below.

Thanks,
Jason

>   
> -    if ( !ivrs_mappings || bdf >= ivrs_bdf_entries )
> +    if ( !ivrs_mappings || sbdf.bdf >= ivrs_bdf_entries )
>           return NULL;
>   
> -    if ( unlikely(!ivrs_mappings[bdf].iommu) && likely(init_done) )
> +    if ( unlikely(!ivrs_mappings[sbdf.bdf].iommu) && likely(init_done) )
>       {
> -        unsigned int bd0 = bdf & ~PCI_FUNC(~0);
> +        unsigned int bd0 = sbdf.bdf & ~PCI_FUNC(~0);
>   
> -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != bdf )
> +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != sbdf.bdf )
>           {
>               struct ivrs_mappings tmp = ivrs_mappings[bd0];
>   
>               tmp.iommu = NULL;
>               if ( tmp.dte_requestor_id == bd0 )
> -                tmp.dte_requestor_id = bdf;
> -            ivrs_mappings[bdf] = tmp;
> +                tmp.dte_requestor_id = sbdf.bdf;
> +            ivrs_mappings[sbdf.bdf] = tmp;
>   
>               printk(XENLOG_WARNING "%pp not found in ACPI tables;"
> -                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, bdf));
> +                   " using same IOMMU as function 0\n", &sbdf);
>   
>               /* write iommu field last */
> -            ivrs_mappings[bdf].iommu = ivrs_mappings[bd0].iommu;
> +            ivrs_mappings[sbdf.bdf].iommu = ivrs_mappings[bd0].iommu;
>           }
>       }
>   
> -    return ivrs_mappings[bdf].iommu;
> +    return ivrs_mappings[sbdf.bdf].iommu;
>   }
>   
>   /*

