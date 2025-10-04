Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20866BB88F6
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 05:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137230.1473563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4sy4-0000LU-OE; Sat, 04 Oct 2025 03:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137230.1473563; Sat, 04 Oct 2025 03:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4sy4-0000Jc-L4; Sat, 04 Oct 2025 03:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1137230;
 Sat, 04 Oct 2025 03:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q86o=4N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v4sy2-0000JW-Or
 for xen-devel@lists.xenproject.org; Sat, 04 Oct 2025 03:29:55 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6301783e-a0d2-11f0-9d15-b5c5bf9af7f9;
 Sat, 04 Oct 2025 05:29:52 +0200 (CEST)
Received: from MN2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:208:a8::18)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Sat, 4 Oct
 2025 03:29:42 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::aa) by MN2PR12CA0005.outlook.office365.com
 (2603:10b6:208:a8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Sat,
 4 Oct 2025 03:29:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Sat, 4 Oct 2025 03:29:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Oct
 2025 20:29:41 -0700
Received: from [172.21.123.104] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Oct 2025 20:29:41 -0700
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
X-Inumbo-ID: 6301783e-a0d2-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i33zKxQwn33BsmFVbZVRsdPcwe4sCP9bsyOXXk3GSaOyiON9Xd98TIpJ9bexTyqYzRcnwHE81lE4P8840HJON/iYTsHOPgOP5Z5vxDDghrLprGhUT8Ldi1/uBu2A89yilXk1HI/nxQoobyvWxG47VSlgsdQKH48Dg9QDzEVZWBn+5odpx3ES8JZQB3LI8ZWv42FBfV+/NzAMi6f1zILfCIxNuJ9JoglK2ks0wtuwztzOjWRe1XYDiI/ysnpDX/Mqtdn97XeNMzNL7asPM0J+q9Dx7J0yep4eyGBPRH8roNjv/LIOPln/rs/LiO/3TVVJ1WHVFvDUtQMEWoRQvKosrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R1YFRXigT95lPv8yoX+NsZsTTWqclC+QUC8jHW5fdE=;
 b=kltMcIpiEjqW+VQqiKiud1MIlZohYnwUqBbyofz8R4Ce1q/uvOF3Zzlx/CtoVCC7eOMw6n3rRbUQklRakTFSrhnOAIczxVAzA0tz7AtFJf8oVsGC1ctWiXBnxnua+ZSFiyGDRar6zQSxUMmkhUERrWYu7efqWc9ZtR0Lm7AS3Ui1ozOfhl8bqY1bZTuZkes9o1+p3bWk8z/+Sk5pRKofxQ+c6MJyYlHEGVWf1wQhcA0prq/nw53D9NTsGs7KE/LGnW4vHgCK2wXLNKgW1NSOAidiYAh7NvGoNmBkw6BePxDyGv9+JJmX2XfG2ZLpD6xIS+SiDcXEftCNBR6Iglvlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R1YFRXigT95lPv8yoX+NsZsTTWqclC+QUC8jHW5fdE=;
 b=Vx9+ORlcW+3DZL+y28Xjdc2vMiFidONOTsIy8M8A+ZeTC/PMoPS2xIdCY1u/Ggqkes5qk8Y2UNv/GhfdV+ufxNmivvxUiuJfH4cAjZP8m0k72DilBVBVbE8TEbN2hjhqyMhIuM1zCtBdjhik9BYUMVHvJmAsMAE9kpxIw8P5xrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com>
Date: Fri, 3 Oct 2025 23:29:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250929084149.70560-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f5bf36-4ccc-49e8-c5ea-08de02f641a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|30052699003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTBjREhPMi9VVk1wZjEwUGN0SEFjS2FMQi9pWk5LTVVhMGNEVnUyS05yL3Zw?=
 =?utf-8?B?dkx4R2tua0JEck01REdNV0h4clIzMThOaStzOUlCank0Uy9hZ2ZRWTBNWkox?=
 =?utf-8?B?Z2lSYWFqMWxQY0dheStIb3VjMDdkaFhPZzNCemR0bjNSM2lrNCtVQ3JkazZw?=
 =?utf-8?B?QnFlbmI1WFVYN2lwOWhONTJ3WkxFbU1mVXVwUVpFV0g5N3FqRWZkNUhTS0V3?=
 =?utf-8?B?RzZsb2N5Mmx4bjB3UVJZNjhic2JGN3RQTkhTOWVwMWYvV085K2N5bXdyV3Ez?=
 =?utf-8?B?dWFwTU1PMmVBMUNvTUxnbEdBeld1cU5QRGFVTGlMQ0hsQ3EwRW5qM21lVHpo?=
 =?utf-8?B?Nm5GUjFHR2VzNlN4Wm10LzVPZjY3d084cHA5Y212WGdOV3d1dk5QLzN1UEIw?=
 =?utf-8?B?dVd5bm5jMEdrSHFKZDNmbWRDQm9wcit0bGhWdVZlRTVqS0hVVkd6Q0M1N1F6?=
 =?utf-8?B?YUFMclNVUkxCbkVxVjhWUHk1RVhDbW01b0tkUDgvbXZId2RQNWNNQjJMYkdW?=
 =?utf-8?B?NGNuby9GRmErcVV5c2lIeHM1cDZTYjFoMDdHbVp4cnZacjREbjZRbHlYZUNR?=
 =?utf-8?B?QzhvUXFaVzlSUHhlbjB0MXg1RnFRZ0VnTlRJYTFDMTFVT3hmbWJUeUFsZGE1?=
 =?utf-8?B?d0NXeHgyNFRzbTBMUzdQWVlSLzVTWmZYUXFIcUNDMVFxbEdVakFUUHBUSW1h?=
 =?utf-8?B?b05RdVEyVitLbTdGQTFTbFJ4cFpaa0hIVjNnYS96ekxEWklzRTBMYTlmS0c0?=
 =?utf-8?B?WHlyMVh5MnhwQWF5Q0tvN2twdVRJQW44L1dTaHNCbU9JTDV4aW5VQ2VLUTVh?=
 =?utf-8?B?VUdNSHU2RFBLZDJJc21Ga256UUdzUllzRGJ0a3pSSnRaaXh0V3VEajExdGdh?=
 =?utf-8?B?a1VzZFlBM0E2T0ltV3hZOWJ6NEpteE03RDNqYU5BMTRBaUlhVDdPUXBtZjNF?=
 =?utf-8?B?RU9YWmJyNVdlNDNIclBjeDVjZmVFZ1JEd1paUCtyd0hTQ1VZUURwVmVOT05P?=
 =?utf-8?B?eGhOK1VweG9KeXE0MWxPTnBKbFNicE12NjM1cjVrSHFpUTBIaUpqeWp2bmRH?=
 =?utf-8?B?VEJtTWpUODVBRXAyZUZyc0VIUWNRM2liczNEMlYxY1hxTUFTdzEwWi9HZ09R?=
 =?utf-8?B?SzJsVGhqSFgxLzBUWDEyVEVIUkRLWGQzeHhqb0U0NzkxVFZ1cHJsbmw5QWpT?=
 =?utf-8?B?dHBYUFlnMWtNcWNvVHNkNHlPcmk3aThoTTBxYmJLaE1ubXZpNmJSaE52R2V5?=
 =?utf-8?B?WkZaL1o3VXdQbG9MV2pENTIxTUJ2d2pjZWZMdXJlRmk3aVhLRktVL0tFWlFN?=
 =?utf-8?B?aDFFeHJIRVNzS2VlcVBJYVl2SHJQSVpqQnRzbHFEemRSUTcycmpxcHhESFMv?=
 =?utf-8?B?a0U0dXI2OFRUWGZ0QWNGN0diWXdJVFFHOTVqUURjQ1RnbDRDMFlORzBtU0E3?=
 =?utf-8?B?Wkd1Sy9PTWpVUUo3YzVyM1ZYMnI4N3ZPNVBtQlcxZTZMV0cyWEJXRXp3Y09H?=
 =?utf-8?B?WnZMNzc4Y2JGdSs1MUxscGRnbmNtMFhGeXp1NHNmSitqNS9kMko2eFExUVFH?=
 =?utf-8?B?UDJMTi93WGVsUURFMGl5Y3VuMG5LZGpQRVhSR3lXVVZVaUdBVWxkSThMMmpP?=
 =?utf-8?B?NzlianNRbDFXcDlQcXZpVzY3akJ0WU1IekRTTTNla3QvOUNXdlhZWTM1UE9S?=
 =?utf-8?B?VlJKY3dQUm1NYXZsUDRxU0lQbWVnMmljUzZCb1B3K2ppNXRLRjNiRjNwMS9U?=
 =?utf-8?B?VmNqV2J1K0oyK2VMY3FMeXEzQm1DUmRnZVV0alVzRStudzd3cDRmSWhPSUNj?=
 =?utf-8?B?YW1GdnBTamxjTkc4TC96dEVleHVFWXpsUmFZZUNaeWRYNXV2b3dCbVpKWUcx?=
 =?utf-8?B?czdoa1hTSUt0VGJ2YjFrM2Z4NHlPa1NpVm1nbktyQjlQS1ZLWFI5QmFHVjJx?=
 =?utf-8?B?Z1RLY0hsQzY3MWxneXFuSHZLSU84Zmx1NDlYNSsvNmVsc1RidEF3bGNGODdX?=
 =?utf-8?B?S2VQYU81RFdWenJpQk5VNHVjeHMreWRSdUUycnhWYkpYemtPNndORUs0WVg2?=
 =?utf-8?B?c3EzL3Ezb3pMWkNzc0hoVGs3VGZFRzRRWHdXaXUxY3U4SEpFSmhLWVVwc0lX?=
 =?utf-8?Q?aTgU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(30052699003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 03:29:41.9011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f5bf36-4ccc-49e8-c5ea-08de02f641a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

On 9/29/25 04:41, Roger Pau Monne wrote:
> I've had the luck to come across a PCI card that exposes a MSI-X capability
> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> 
> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> still use the address of such empty BAR (0) and attempt to crave a hole in

s/crave/carve/

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
> ---
> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> While not strictly a bugfix, I consider this a worthy improvement so that
> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> capabilities.  Hence I think this change should be considered for inclusion
> into 4.21.  There a risk of regressing on hardware that was already working
> with PVH, but given enough testing that should be minimal.
> ---
>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..8458955d5bbb 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
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

This assumes a type 0 header. For type 1 headers, bir values 2 and up are
also reserved.

> +        {
> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
> +                   &pdev->sbdf, name, bir);

Nit: placing the cleanup label at the end of the function and using 'rc' would
make it more amenable to future uses.

> + invalid:
> +            xfree(msix);
> +            return -ENODEV;
> +

Extraneous newline.

> +        }
> +
> +        type = bars[bir].type;
> +        if ( type != VPCI_BAR_MEM32 && type != VPCI_BAR_MEM64_LO )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
> +                   &pdev->sbdf, name, bir, type);
> +            goto invalid;
> +        }
> +
> +        if ( (uint64_t)offset + size > bars[bir].size )
> +        {
> +            printk(XENLOG_ERR
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


