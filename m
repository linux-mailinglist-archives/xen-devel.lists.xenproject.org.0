Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E801F8AC61A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709775.1108768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoWv-0005cJ-5V; Mon, 22 Apr 2024 07:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709775.1108768; Mon, 22 Apr 2024 07:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoWv-0005ZY-1x; Mon, 22 Apr 2024 07:56:01 +0000
Received: by outflank-mailman (input) for mailman id 709775;
 Mon, 22 Apr 2024 07:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqOW=L3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ryoWt-0005ZQ-Fq
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:55:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01d31f4-007d-11ef-9e3a-7da7ca7a9ce9;
 Mon, 22 Apr 2024 09:55:57 +0200 (CEST)
Received: from BLAPR03CA0038.namprd03.prod.outlook.com (2603:10b6:208:32d::13)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 07:55:54 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::64) by BLAPR03CA0038.outlook.office365.com
 (2603:10b6:208:32d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Mon, 22 Apr 2024 07:55:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Mon, 22 Apr 2024 07:55:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Apr
 2024 02:55:53 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 02:55:52 -0500
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
X-Inumbo-ID: c01d31f4-007d-11ef-9e3a-7da7ca7a9ce9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr+eH4ghBYvyzJmsvGxiwnP1fqnmBcJpXQiu5IpVB0oZVECIGxrlEUU9jT5hlWWR54ktdRmtQDDBHYqf94aoe9Rrzc9eDbLwMD7zyCdxLQ3jsNZgK1ZO1DjfyktoWhY5vKFVPeQEiWaoLJ9IWY1HgG0JylYOcFEpxPO84BGw/0VQUfaKVkgmHUJmJkFHxkrDcIcOlzBQ4XZPve3SdB7ErPNYNmPxIYbbM7Fs2zkEpf7Vmqu/OUuxCcBTEs6E50EoEvaFIgqiO55ZwO8ynJ8JZu8HFVjBm56PEjvYbK5/TN/D83pqi9MrCczBKqgtyc25QoFbWocIn4VQ12MQKRuvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm+YWRwenv1ye/VHvqGEkNrQrzdHPLKDUQ9EWoI53tA=;
 b=fiIStNjz11nnxKzZetJRLMVQH+/11QnAilYaaN0Jaqdxvihj8kr5LhsKwsFvQC1+s+l3A3D3+TaZLtnU+doSkv9KFI1cT5PMsLkbVwfSbmkwN8iQ5WQEwckGV0Hqb8Pv/2At05aXnI/VFIAeQUFSI08U2oO0OyoxumcvPtI9P7Vze/9oHy8Uh/Qb2KtxFVssYc4bKWb2drRFjtLHxHovTn5EYoWXpRghATc2MroDQzx2xq1iqtdOXQzElhUEc8xoERCKlmcdBm6gXdYzmsL7Ms+Jl0ZKKddsw77ZqiiOb4e3rtOJrKL5juU0iYawoSx9zXCyXAaa0w3mY/jjeV0AtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+YWRwenv1ye/VHvqGEkNrQrzdHPLKDUQ9EWoI53tA=;
 b=yP7iAIa63iw1uRiumD+YNk48s/UCmTJ9a18shX4oUgT4fTYf3CQA6wFRH0P9XTuvyzmaAurSejfS6v1h+ZgHsNRoabJnhmS9lHEDfIPGMXMDgkjwOh+dVqGytOx5/tmXKxePw8Qp3ilxC8+TNZf/XfLqqddzqsVzV39Lkm7Rr2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
Date: Mon, 22 Apr 2024 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240418073652.3622828-13-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: ec767eec-fa70-4077-4dd9-08dc62a1a2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEx1WWhxN1l3M0FaMTB5bTlVNiswMzFheU82MXdmajRXREh4MzZxM2x2Z2hT?=
 =?utf-8?B?VXhjRVhEZVhPdFp2WG9rSmV5MjJCUGNaVTVsZHNKNmoxSVMrM2xGWDRJb2x1?=
 =?utf-8?B?amMrTFRzSzBrVndLaHBXQlh6eHcrZndCZDMzRDRuNWNCMFdqQ2pJQ09DMm9O?=
 =?utf-8?B?dHdiOURiL2FFZE52d0dFRTNYWDYrQ1NQdE9IUFpQSnN1UzJjV2x2cktGajNQ?=
 =?utf-8?B?YXJGVGUwNHB2QjdSV0I1MkJkTDdSMXJKTDNIRWxneXBvS0xuaXROeFhPMnE5?=
 =?utf-8?B?elh5bEp3MnQvYXJCVzhBcDJQOHEweVdMV1V2R3hUcFZQaXhrOTZSdzg5SlpZ?=
 =?utf-8?B?dDZZaWwxVkRhNFY3N0JUT014QWtCSzZ4RGlvMXpwU3o0MWp4SDdMeHMrcnZV?=
 =?utf-8?B?YytUNHdqR3NOWWZIT1hRZ2hOL09CeHFNZEhUbk81MWNYdEtLZzg1OXFCOEt0?=
 =?utf-8?B?SXUyUVl2anFVQnM4QWpkZFNTZk10NitHMVJDaFRkY002TjY4eDUzRWgxNXdy?=
 =?utf-8?B?UXkzelNxMEFEYitVNkFwNGhtV2FrWm02T0tTUXFmaThDRWp6dFZkOUljUWlz?=
 =?utf-8?B?VWlYUGgvTVFMckVkajNCUWZKOHMrM0lzSkloVjJpMkVDeUxDb0VZc0gxVVJ5?=
 =?utf-8?B?T2VlR2RFamsvS3lXMUU4a0twcm10RXN2MWk0UEV3OFFjYTZqMmMraFRUblJC?=
 =?utf-8?B?aFF5SXRBTWRtVTF4UmtXRndQcmd4OVQ3TldZNExST2xxamQxMXZjQlpHa1lt?=
 =?utf-8?B?bWlvdzFTRFJLV3loNGhtRGtKekRmYVdGUWpzSkR4WWY2ODl2VDVub1dyWlpr?=
 =?utf-8?B?NzcvUDVBbzRvZkRycGxoVmxadEpEbXpUeklidXJYU1BRRytlUXNHbjlObWlV?=
 =?utf-8?B?TlNhRmVXRFpDbXp4blJnTDI2bWxJY0R2NjdDVmRhSjh1RHpDSUtaSEFzYXlQ?=
 =?utf-8?B?VklKaHViR3RBbXl0Z3RmSTFEZVdLb1JCVEJMYWF4VnBQR00vZzBMTjlmZ1ND?=
 =?utf-8?B?V3JLVnhieEhvUG5VdGlZaGdRblREdnVOOWQ0aXZaVG8xbW9WY290TTdZazlx?=
 =?utf-8?B?VUxkZTVCaXBwZldJTWhLeDJJN05QZ0p2TzRpUUZPSGJ1YU12OE5mTFdQc1Zn?=
 =?utf-8?B?MUluTWVPSGQwcTJ5U2xrWXJScEozdWNjMyt3ZHBWRmZBNVQrbFVuTHc0S3Fi?=
 =?utf-8?B?OGVnbUlCTlQraDMxVW1TRXdSbEtmVHp0aVpsWGxmdTEydVV4ZldROFBOck52?=
 =?utf-8?B?ZGFWY0JBMTNQRG5nTi8zZmQ2OFE1SThpQncrRnhXci9sck1uMXlIRTBaY3lF?=
 =?utf-8?B?MWF0OGI0ZkVPS1BxcEt1SitqVGlaTGV3UWNFc01vczlQRTFya2dacXR2Uysv?=
 =?utf-8?B?RXMzNFN0SG1VRFhldURlNVViVDVscytTSFhRRnF1RTc3T1g4aDhxVm5YK3N5?=
 =?utf-8?B?di83cExQUzBmTXVaamswMEF0b3F4eTdqS3FMcFRzQ3JaUWVYQ3c0NDJGTi92?=
 =?utf-8?B?bDBMRHdVdXNzY1laanUvSFVsWlJlNUxBOWtXUE8ySHF3bVNMcGNMNVVxNHUr?=
 =?utf-8?B?NXlHM0pLeVNXczVYekRqbW5UbU84b2NTYXJDWHZWeGd1bkpDeEZGWlZ3L251?=
 =?utf-8?B?M1kyVmNWT3lSaStLWDRndVFRbHdtTGpSZ2xjbnR1QTF2aWovODRyclgvWTNV?=
 =?utf-8?B?MlN4T2hYZ3R6YldLMlFYQitVTDAyRklRVzFaS2oveXpYaGIzMlpzYTB3ejI5?=
 =?utf-8?B?SlJ6MG1WRkRKRk5CTEdDZmhBcCtFbzRCZFF0SHZyTSt6UEE2ZjA1aDErY3Jv?=
 =?utf-8?Q?EdZeRDT+/gdiz1TxCUE87tfn9pRqA22GvIdSk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 07:55:53.9985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec767eec-fa70-4077-4dd9-08dc62a1a2ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794

Hi Luca,

On 18/04/2024 09:36, Luca Fancellu wrote:
> 
> 
> Currently Xen is not exporting the static shared memory regions
> to the device tree as /memory node, this commit is fixing this
> issue.
> 
> Given that now make_memory_node needs a parameter 'struct kernel_info'
> in order to call the new function shm_mem_node_fill_reg_range,
> take the occasion to remove the unused struct domain parameter.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v3:
>  - removed previous patch that was merging the intervals, rebase
>    changes.
> v2:
>  - try to use make_memory_node, don't add overlapping ranges of
>    memory, commit message changed.
> v1:
>  - new patch
> ---
> ---
>  xen/arch/arm/dom0less-build.c           |  2 +-
>  xen/arch/arm/domain_build.c             | 34 +++++++++++++++++--------
>  xen/arch/arm/include/asm/domain_build.h |  2 +-
>  xen/arch/arm/include/asm/static-shmem.h | 15 +++++++++++
>  xen/arch/arm/static-shmem.c             | 23 +++++++++++++++++
>  5 files changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 51cf03221d56..74f053c242f4 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -642,7 +642,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
> 
> -    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +    ret = make_memory_node(kinfo, addrcells, sizecells,
>                             kernel_info_get_mem(kinfo));
>      if ( ret )
>          goto err;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 68532ddc084c..15f888169c4e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -756,15 +756,14 @@ int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
>      return fdt_begin_node(fdt, buf);
>  }
> 
> -int __init make_memory_node(const struct domain *d,
> -                            void *fdt,
> -                            int addrcells, int sizecells,
> -                            const struct membanks *mem)
> +int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                            int sizecells, const struct membanks *mem)
>  {
> +    void *fdt = kinfo->fdt;
>      unsigned int i;
>      int res, reg_size = addrcells + sizecells;
>      int nr_cells = 0;
> -    __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
> +    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
>      __be32 *cells;
> 
>      if ( mem->nr_banks == 0 )
> @@ -797,14 +796,28 @@ int __init make_memory_node(const struct domain *d,
>          if ( mem->bank[i].type == MEMBANK_STATIC_DOMAIN )
>              continue;
> 
> -        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
> -                   i, start, start + size);
> -
>          nr_cells += reg_size;
>          BUG_ON(nr_cells >= ARRAY_SIZE(reg));
>          dt_child_set_range(&cells, addrcells, sizecells, start, size);
>      }
> 
> +    /*
> +     * static shared memory banks need to be listed as /memory node, so when
> +     * this function is handling the normal memory, add the banks.
> +     */
> +    if ( mem == kernel_info_get_mem(kinfo) )
> +        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
> +                                    sizecells);
> +
> +    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
> +    {
> +        u64 start = dt_read_number(cells, addrcells);
We should no longer use Linux derived types like u64. Use uint64_t.

> +        u64 size = dt_read_number(cells + addrcells, sizecells);
> +
> +        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
i is unsigned so the correct format specifier should be %u

> +    }
> +
>      dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
> 
>      res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
> @@ -1783,7 +1796,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          if ( res )
>              return res;
> 
> -        res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +        res = make_memory_node(kinfo, addrcells, sizecells,
>                                 kernel_info_get_mem(kinfo));
>          if ( res )
>              return res;
> @@ -1794,8 +1807,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>           */
>          if ( reserved_mem->nr_banks > 0 )
>          {
> -            res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
> -                                   reserved_mem);
> +            res = make_memory_node(kinfo, addrcells, sizecells, reserved_mem);
>              if ( res )
>                  return res;
>          }
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 026d975da28e..45936212ca21 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -14,7 +14,7 @@ int make_chosen_node(const struct kernel_info *kinfo);
>  int make_cpus_node(const struct domain *d, void *fdt);
>  int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>                           int addrcells, int sizecells);
> -int make_memory_node(const struct domain *d, void *fdt, int addrcells,
> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>                       int sizecells, const struct membanks *mem);
>  int make_psci_node(void *fdt);
>  int make_timer_node(const struct kernel_info *kinfo);
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 7495a91e7a31..3b6569e5703f 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -3,10 +3,15 @@
>  #ifndef __ASM_STATIC_SHMEM_H_
>  #define __ASM_STATIC_SHMEM_H_
> 
> +#include <xen/types.h>
>  #include <asm/kernel.h>
> +#include <asm/setup.h>
> 
>  #ifdef CONFIG_STATIC_SHM
> 
> +/* Worst case /memory node reg element: (addrcells + sizecells) */
> +#define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
> +
>  int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>                            int sizecells);
> 
> @@ -37,8 +42,14 @@ int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
>  int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>                                int sizecells);
> 
> +void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
> +                                 int *nr_cells, int addrcells, int sizecells);
> +
>  #else /* !CONFIG_STATIC_SHM */
> 
> +/* Worst case /memory node reg element: (addrcells + sizecells) */
> +#define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
> +
>  static inline int make_resv_memory_node(const struct kernel_info *kinfo,
>                                          int addrcells, int sizecells)
>  {
> @@ -86,6 +97,10 @@ static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
>      return 0;
>  }
> 
> +static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
> +                                               __be32 *reg, int *nr_cells,
> +                                               int addrcells, int sizecells) {};
> +
>  #endif /* CONFIG_STATIC_SHM */
> 
>  #endif /* __ASM_STATIC_SHMEM_H_ */
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c85f60dd1bf7..07c93a820508 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> 
> +#include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/rangeset.h>
>  #include <xen/sched.h>
> @@ -668,6 +669,28 @@ int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
>      return res;
>  }
> 
> +void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
> +                                        __be32 *reg, int *nr_cells,
> +                                        int addrcells, int sizecells)
> +{
> +    const struct membanks *mem = &kinfo->shm_mem.common;
> +    unsigned int i;
> +    __be32 *cells;
> +
> +    BUG_ON(!nr_cells || !reg);
> +
> +    cells = &reg[*nr_cells];
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        u64 start = mem->bank[i].start;
ditto

Rest LGTM:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

