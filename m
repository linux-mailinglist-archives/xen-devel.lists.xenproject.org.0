Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331EABC62AA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 19:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140067.1475198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Y7V-0002tV-2d; Wed, 08 Oct 2025 17:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140067.1475198; Wed, 08 Oct 2025 17:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Y7U-0002r0-Uf; Wed, 08 Oct 2025 17:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1140067;
 Wed, 08 Oct 2025 17:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dI6S=4R=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v6Y7T-0002qu-5D
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 17:38:31 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9943c7af-a46d-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 19:38:29 +0200 (CEST)
Received: from MN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:208:530::9)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Wed, 8 Oct
 2025 17:38:17 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::31) by MN0PR02CA0012.outlook.office365.com
 (2603:10b6:208:530::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 17:38:17 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 17:38:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 8 Oct
 2025 10:38:17 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Oct
 2025 12:38:17 -0500
Received: from [172.21.123.104] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Oct 2025 10:38:16 -0700
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
X-Inumbo-ID: 9943c7af-a46d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/X9hKVD9PsNlGtxMyfYo0Y/1rqukMpPAXkuJdxEawI9Ly/JPh8mIOWsEEyD/PC652pYyb98gNiQyoDQxKjz3vnv9DAppryIg/g9ptKT5DuAy5i37XtGnqAs4Lbw4uEvtXAd83xkuiAq4gMIsZ85ZwAbDdEZrGZduowXG1Zod91ZMpJX188gv0Ywm1abEaMbT429CWv9HNGjXmR0XW9QBgHVXc97I3n9h0rizXYztClM7fB6zPnlZWm4iWno4fNnz6qWBg7aZelP9MYuWnPjaTXKpb51mQp7c7nUPWWNdnZvbCIJhrWgDWBEXSELVieUP0pABqCpoluYFlqSnJ4WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+FQ2B8zhQgtkrrEXGAbcT0mPmJGcgoviLwpAuQlNaI=;
 b=yo0feGpO0/0S6I904gzI2RxzAkk0JtD7UBFFX64NSAyDcXLvewTwGmiKtY3Y5dHD+mBYn26IVoMPxM0V5AwGnMigjp5/tF4zq0wYonV2OxePbnnHa+7I4MXlq788Om8S9l5PFSHwpcalRUeI5nwj8Hf0ef9uPuWDtAV6aouzCasmQwaGubHGbgq0fbooMgwEt0yfAyXCytZm+pL/zj3+TT+WhUpLC8JiAh/ZHDKBD/uP7I2s5JmxOGGyPa/NnjeIWPFrA1P62LF4Z2Tiq5QAscvDcC58AVfdYCQOZ+6VLX97txnSxIR9KKf3FEtk8whN3thD9soReYzlz54PAJK72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+FQ2B8zhQgtkrrEXGAbcT0mPmJGcgoviLwpAuQlNaI=;
 b=vDZNr4UOK322Vv6ez7Y77H1afMprCdFZ2hxgJ8FgtwFsjeVc0n871shCxjXBWxTYKP7qHDbP8Br2frvBoWzayjP/VevXUUfryWA2yTkBKPeRziy3oVZ6xael1AeR+aPxYcqYKqX/5BzzuFQPVWmuZHXZj2VQobUJThYgWCzJ7Gk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7754ab37-4faa-476e-98e1-0417afca1e70@amd.com>
Date: Wed, 8 Oct 2025 09:17:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20251008143923.2557-1-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20251008143923.2557-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d26b78-0dde-416d-96fb-08de06917785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3lrK2c5QnpzY1JlM2g4ODBUM0dOQ21kSDZIdnJZaDlGbTgwbit0TGlycElJ?=
 =?utf-8?B?TitjQmttQUJqVGNGNUVYSjM0RDcxeDR4MXhkSDdiMFpkZXB3SS9jOWpwVXZV?=
 =?utf-8?B?eUtLYXdTRi82bjNlUnpDblU1d0lkcmU4OVc0akpqMHJlWVJKczR2ZHZYeGpM?=
 =?utf-8?B?L0l3S3IyYXlGeXgxbFhoYTM3bk8rRkNMYkJiejRIMEVRQUw4dzhqT0lzTThn?=
 =?utf-8?B?dHdWbWw0Qk5Zd0t1RVZVTUVVZEY5V3Y5UkUzOEZCa08zU25TTmtUR2svTFpx?=
 =?utf-8?B?S0p5RDAxVHdueU9DQ0NEQUxRU1dZZ1hjQytTRU5JSkVya3lQc3U1aCtsblNZ?=
 =?utf-8?B?MjZSY1pDQkNLN3hVeUtuU3BqTnFKMVFaSkpPWERFR2d0bkgrY05HNm9XMTEw?=
 =?utf-8?B?ZnFzUG5JaTdqZm1wWDdDdVdkMDRURjNaSUVVMkhtQlpIWFpRRTBmRmZpL1Bp?=
 =?utf-8?B?em5vY0pjM3ZBcE1pSkw2bTdLbzlBeHFYQm1aOWNoMWF6Um9NaURvbTlYSHBr?=
 =?utf-8?B?dWozN0RVVmcrbEl3R0FoUGZGTDNuTFBBaTN6NW05QkFseUkxMG1XOGh0Nnl3?=
 =?utf-8?B?OEdxSFd2R1NsV2UvZkNuSC9CbDdHZHlVd3hKaktjNW9oRmV5eC9MRVFKazNG?=
 =?utf-8?B?LzFGclBsSGJZSXdzR1FTTmQ2WWZxQ2Ezd3F4bTE5OUtaWHJsWEhqdExCc2JK?=
 =?utf-8?B?K0VHOGVKamNpbDhsYkN5UDM0UTU5aGROQURWMitXMXBLRmRmMDZuM0NkaTZk?=
 =?utf-8?B?VWI3KzhrT0lBaitoRnYweGhFQTg5SEFrZ0o1SDd0VXdVckpJSWJ6SU5CeVJ0?=
 =?utf-8?B?VThnaHcyMmJFZk9GRW12R24yaFBFbWsrN3lvOUo4NklmRzNob1NYNDc4aTZy?=
 =?utf-8?B?dDhQb1IwMjRRNzEvKzZZbVJUMksydjJqd1ZyZ09tMWdsUnZHckxQZW4rYjlw?=
 =?utf-8?B?SStyNkxoT2Y3aC9EL3J4MzI1NHlocWJOc2I4YnBFOGNGeW1rbnl1dktWclRj?=
 =?utf-8?B?N2tUc25BRFZxQWpGa3Q1VzhWQ09KaWZYR2lhRUp3cEFER1lqdmhRNWQ1VmVn?=
 =?utf-8?B?b094alVVajNyMWxNbVc0QlBjYmVwbWR3bVM2bzFvWHdNNW0wVmQyTTFPVXpo?=
 =?utf-8?B?NjdjV2ZkaEFaSXhINGNETUN0NVYrallzOEEzUHFhOWgyUnRmdmxCd09abzdr?=
 =?utf-8?B?N2JrdWprYlVsUmpNUWR3WW00aCtmZUV3VWxKOS85M2U1ZVhpYi9oY3lkL1Qx?=
 =?utf-8?B?NURaci9CQ1RGTnRYektBekxmVjR4eUwwOVR1bkVza1hLUm5MK2J0Y2VkbUpO?=
 =?utf-8?B?b2xnVUhFTU55QXBJbXJ4QzFYTUlnMERhejVOWUwyV2t2N0pkQkl1N3MzNFkx?=
 =?utf-8?B?dy9mbkx6WlJvZGVFM3Zod280eTU0a09LRWhWUlBoOVVINjlydVZRNlpyK01H?=
 =?utf-8?B?NzlrUm5YNHcyYkpCeGZEcmRTN0xERWVQSEtrTmFqQXVnK1ozVHVnTkxwNk9Z?=
 =?utf-8?B?bC83NDR6eWF4WWRQU041VVdBN1d3ODVycUJRNlpmV1FkS2pQa2t6bWZYMXlH?=
 =?utf-8?B?VWJFVWtYWURMQXIxWkd1aHk0WC96S0NNcmdEKy9tZkNPNWZiU1FjUHBnY25Q?=
 =?utf-8?B?aUlNQ3JXM2ZremEwM2ZzcjJKZ3dVeS9OVjI4REs4RkJhZFlaSC9GbkRpWURa?=
 =?utf-8?B?OTRadHl4WEdLbVUzblQ4UXdLaG41eWVmem1BdkpzVVlEVkp4S1Vzb1hBa1d0?=
 =?utf-8?B?UURVQ0JCUGVrcVhJNGd0NFN2S3MzWlFLRDY3cjBQR0N5M0h5UWJrRWIrWmR3?=
 =?utf-8?B?TnIra2NSMitIM3VSd09vVFBHZFYwN0M4c1VXTFoxR2xzVGRBWndqMjVBZmhS?=
 =?utf-8?B?ZHJoazB5RERmL2ZYVWUvWWtrV091eVFUK0hSb1lNRHNJZytxQW93M2tIZ05u?=
 =?utf-8?B?OHR5S0U2aUVBdG5ub3NOdWhZY1hFSXRoQWJib0sxWVNQRmt0akpoT3lScGoz?=
 =?utf-8?B?aUpyV09WaGhUVEU4eC9oTlhLYW81djNnamdpVlJldFRQblROQ0dpMWE3clNx?=
 =?utf-8?B?V3ZCdW1iUXN6c2pDcHgvaytOdWRhV1d5cEtGa3ZmY1h4a3dIYVdRN0wxMjd1?=
 =?utf-8?Q?muBE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 17:38:17.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d26b78-0dde-416d-96fb-08de06917785
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

On 10/8/25 10:39, Roger Pau Monne wrote:
> I've had the luck to come across a PCI card that exposes a MSI-X capability
> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> 
> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> still use the address of such empty BAR (0) and attempt to carve a hole in
> the p2m.  This leads to errors like the one below being reported by Xen:
> 
> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> 
> And the device left unable to enable memory decoding due to the failure
> reported by vpci_make_msix_hole().
> 
> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> tables are usable.  This requires checking that the BIR points to a
> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> target BAR.
> 
> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> EPYC 9965 processors.  The broken device is:
> 
> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> 
> There are multiple of those integrated controllers in the system, all
> broken in the same way.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v1:
>  - Introduce a DEVICE BUG prefix.
>  - Remove extra newline.
>  - Fix typo in commit message.
> ---
>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>  xen/include/xen/lib.h   |  3 +++
>  2 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..4ddcefbcb274 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c

Do we need to #include <xen/lib.h>?

> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      if ( !msix )
>          return -ENOMEM;
>  
> +    msix->tables[VPCI_MSIX_TABLE] =
> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> +    msix->tables[VPCI_MSIX_PBA] =
> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> +
> +    /* Check that the provided BAR is valid. */
> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
> +        unsigned int type;
> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
> +        unsigned int size =
> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
> +
> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
> +        {
> +            printk(XENLOG_ERR DEV_BUG_PREFIX
> +                   "%pp: MSI-X %s table with out of range BIR %u\n",
> +                   &pdev->sbdf, name, bir);
> + invalid:
> +            xfree(msix);
> +            return -ENODEV;
> +        }
> +
> +        type = bars[bir].type;
> +        if ( type != VPCI_BAR_MEM32 && type != VPCI_BAR_MEM64_LO )
> +        {
> +            printk(XENLOG_ERR DEV_BUG_PREFIX
> +                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
> +                   &pdev->sbdf, name, bir, type);
> +            goto invalid;
> +        }
> +
> +        if ( (uint64_t)offset + size > bars[bir].size )
> +        {
> +            printk(XENLOG_ERR DEV_BUG_PREFIX
> +                   "%pp: MSI-X %s table offset %#x size %#x outside of BAR%u size %#lx\n",
> +                   &pdev->sbdf, name, offset, size, bir, bars[bir].size);
> +            goto invalid;
> +        }
> +    }
> +
>      rc = vpci_add_register(pdev->vpci, control_read, control_write,
>                             msix_control_reg(msix_offset), 2, msix);
>      if ( rc )
> @@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      msix->max_entries = max_entries;
>      msix->pdev = pdev;
>  
> -    msix->tables[VPCI_MSIX_TABLE] =
> -        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> -    msix->tables[VPCI_MSIX_PBA] =
> -        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> -
>      for ( i = 0; i < max_entries; i++)
>      {
>          msix->entries[i].masked = true;
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index c434dd5f16e4..c4ac4823920f 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -60,6 +60,9 @@ static inline void
>  debugtrace_printk(const char *fmt, ...) {}
>  #endif
>  
> +/* Common log prefixes for platform related issues. */
> +#define DEV_BUG_PREFIX "DEVICE BUG: "
> +
>  extern void printk(const char *fmt, ...)
>      __attribute__ ((format (printf, 1, 2), cold));
>  void vprintk(const char *fmt, va_list args)


