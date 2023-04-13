Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1786E157F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520943.809108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn33I-0008OA-BY; Thu, 13 Apr 2023 19:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520943.809108; Thu, 13 Apr 2023 19:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn33I-0008LF-8d; Thu, 13 Apr 2023 19:56:16 +0000
Received: by outflank-mailman (input) for mailman id 520943;
 Thu, 13 Apr 2023 19:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbVr=AE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pn33G-00078B-AH
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:56:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e88::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d549394-da35-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 21:56:12 +0200 (CEST)
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by BL1PR12MB5046.namprd12.prod.outlook.com (2603:10b6:208:313::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 19:56:09 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::79) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 19:56:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 19:56:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 14:56:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 14:56:08 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 14:56:07 -0500
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
X-Inumbo-ID: 3d549394-da35-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKvKgSveCPYfmptBtizcv0+TImHvFUaC3+4DNvXAJHMAOlcJkIOtZq+moW0RcPDIJXW42cMd/2c/bHI+zTmv63NpsVrhmYLyYRQ403iZV80aF+1DNKlPtZgUAsCVhuXLppziDZogOyzy/JNn9UMLWBOR8PP6XSy1/DMb/bRta7nNdAlh7XGs6TkOGcsIfnSGIb4QK41dZe//my3OsOaevxdSXJ4K3QSEBRICcON+jKnl+9ro43T/b44iQsdNeP2nid9R+DKZYAbFwOTXFL20F3oYFC5lJaFs+ruoJIDtu8OCrFnyHqt2ZhzybS376zjuCzb5XBGo9moSrO9ab8JONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXg/prYLx5EALCUgzFznssa0CZnjCJteDGfMgsf99ZQ=;
 b=ORGV0J4x6cWye8nLtorjcK4G9eEAIntvY9tMg2MeVU2pzkgmvtXFygRUCsWWdZgKJjNSKhR5GWvZdd2pg4iRnbsD2euq/igAgBn601l2+btAUauSFqyo1gdZO+pU6Bt/7OeUGMZpKNVMdg5BmdQYk3vOi0tVSne6CpkdHdwkiKAwPL23DR+Cvus+kih+E6pteZQkULCMzeLM8Sl0dbFzDfW1RgFk6n6H4rARQTlbPdSFI2sl+qrCIGgPWFIepvSPdhh6Nz+2fGtBkY94DWx/hgmkPIOBn+hhrWihjFnojTwGa1NMRX5bbHkaGAPAAiH0okJ43RiPC5NcJlqGIqA1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXg/prYLx5EALCUgzFznssa0CZnjCJteDGfMgsf99ZQ=;
 b=z5nW4dgCeAW+XqcEeNlGq2Jq/9p7bvRazwtvtGvI+PPwMJLD6PpDDFUgve2QDUH07hgtt0rmJXe5cBXKlSN95k+KUt5VCYoNyX8j9Oxa11w1VGaQEwiOU4efHII5ah4WCMdE8/rF5E4giITcwlSvetUuN95YTbZIKlF/nQXwMSA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8acf5625-a60e-0357-6ba0-96af35930c17@amd.com>
Date: Thu, 13 Apr 2023 15:56:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/8] xen/arm: remove shm holes for extended regions
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
 <20230223054105.2357217-7-Penny.Zheng@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230223054105.2357217-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|BL1PR12MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afb3ce7-df12-4448-8161-08db3c59204f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+sDDAf96tcihFXdlvmuq81wW/cEbMtSBl04tDuA/qK6iKYMgmmZFU9ebWTLz/YCnyNGwlwuYNoUqgcwDZRQ4aWtMSzoMmHBWUGGtZ14j8Gprq2k+JuhgaiIP6NgVPEKKfUkDemhte8d/0Ll5eFh7vAVP7r/YNbfM9y/3TU592Twb8a4uTswKCCy08YuFQzXzJFdij1h1+otXb2EkyocMuF0n57NVPzVHbl6zGqqFgZipoTxvFHV4XaubRR5PJmQR4/zN11b2dacWlkSJ/Rb13S5rs3wnEz69tP2xW1wJ/duCHizhhN+apNsB7IxLqiMRO3/KHzCxKMbuQzzCrnK+fN1iQRRYCo4dAfP2UVWjlLX0v4NekcvH4aRqz6wXms0aNnjDAzD7gqG/8o0vLezEZTaOD3S6TQwzZgKC4SKwC4/PKkDfb2H22G3y39akQIVu0BObh8+7c/iHIKeHR0WLx+QJwericvTribVsoQCVUw5Ox4LIYsJAnpxcmA/dk0kULcUsSlWLC7W6bz2jz7/rJcj8d8a+UWs5HxSvBXmMvq6OQH+9nm5VjZ3x/j+uEumlMQ7lZgumuaIG5qku2zbpLTIXokz+vxAVeqwIU/5HzisNi9ZvY0lxb4Ma3DJxsaDbi6pz1xHs8X5nbODJdTjZKe0bKVCg8hzu9WnppOpx8NRGgt+Zu8YhZqZlVHpQEhL9pM58qn81k+rpHBmVRM6+AkwMIh6ZqTpLFWZiP6HIqR12GXhrX62c8kb4pvQOK8p+eGqWxB9P4t09AEbG0gLPRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(336012)(36860700001)(70586007)(426003)(70206006)(47076005)(83380400001)(2616005)(54906003)(26005)(110136005)(16576012)(478600001)(186003)(53546011)(44832011)(2906002)(36756003)(5660300002)(81166007)(356005)(41300700001)(4326008)(82740400003)(40460700003)(82310400005)(40480700001)(316002)(31696002)(8676002)(86362001)(8936002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 19:56:09.4425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afb3ce7-df12-4448-8161-08db3c59204f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5046

Hi Penny

On 2/23/23 00:41, Penny Zheng wrote:
> Static shared memory acts as reserved memory in guest, so it shall be
> excluded from extended regions.
> 
> Extended regions are taken care of under three different scenarios:
> normal DomU, direct-map domain with iommu on, and direct-map domain
> with iommu off.
> 
> For normal DomU, we create a new function "remove_shm_holes_for_domU", to
> firstly transfer original outputs into the format of "struct rangeset",
> then use "remove_shm_from_rangeset" to remove static shm from them.
> 
> For direct-map domain with iommu on, after we get guest shm info from "kinfo",
> we use "remove_shm_from_rangeset" to remove static shm.
> 
> For direct-map domain with iommu off, as static shm has already been taken
> care of through reserved memory banks, we do nothing.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> - new commit
> ---
>  xen/arch/arm/domain_build.c | 94 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9b4aabaf22..4cd1e3d433 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1914,6 +1914,32 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>      return 0;
>  }
> 
> +static int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
> +                                           struct rangeset *rangeset)
> +{
> +    unsigned int i;
> +
> +    /* Remove static shared memory regions */
> +    for ( i = 0; i < kinfo->shminfo.nr_banks; i++ )
> +    {
> +        struct membank membank = kinfo->shminfo.bank[i].membank;
> +        paddr_t start, end;
> +        int res;
> +
> +        start = membank.start;
> +        end = membank.start + membank.size - 1;
> +        res = rangeset_remove_range(rangeset, start, end);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> +                   start, end);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Find the holes in the Host DT which can be exposed to Dom0 as extended
>   * regions for the special memory mappings. In order to calculate regions
> @@ -1922,6 +1948,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
> + * - Static shared memory regions, which are described by special property
> + *   "xen,static-shm"
>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct meminfo *ext_regions)
> @@ -1997,6 +2025,14 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>          }
>      }
> 
> +    /* Remove static shared memory regions */
> +    if ( kinfo->shminfo.nr_banks != 0 )
> +    {
> +        res = remove_shm_from_rangeset(kinfo, mem_holes);
> +        if ( res )
> +            goto out;
> +    }
> +
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;
>      res = rangeset_report_ranges(mem_holes, start, end,
> @@ -2012,6 +2048,62 @@ out:
>      return res;
>  }
> 
> +static int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> +                                            struct meminfo *orig_ext)
> +{
> +    struct rangeset *guest_holes;
> +    unsigned int i = 0, tail;
> +    int res;
> +    paddr_t start, end;
> +
> +    /* No static shared memory region. */
> +    if ( kinfo->shminfo.nr_banks == 0 )
> +        return 0;
> +
> +    dt_dprintk("Remove static shared memory holes for extended regions of DomU\n");
> +
> +    guest_holes = rangeset_new(NULL, NULL, 0);
> +    if ( !guest_holes )
> +        return -ENOMEM;
> +
> +    for ( ; i < orig_ext->nr_banks; i++ )
> +    {
> +        start = orig_ext->bank[i].start;
> +        end = start + orig_ext->bank[i].size - 1;
> +
> +        res = rangeset_add_range(guest_holes, start, end);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove static shared memory regions */
> +    res = remove_shm_from_rangeset(kinfo, guest_holes);
> +    if ( res )
> +        goto out;
> +
> +    tail = orig_ext->nr_banks - 1;
> +    start = orig_ext->bank[0].start;
> +    end = orig_ext->bank[tail].start + orig_ext->bank[tail].size - 1;
> +
> +    /* Reset original extended regions to hold new value */
> +    orig_ext->nr_banks = 0;
> +    res = rangeset_report_ranges(guest_holes, start, end,
> +                                 add_ext_regions, orig_ext);
> +    if ( res )
> +        orig_ext->nr_banks = 0;
> +    else if ( !orig_ext->nr_banks )
> +        res = -ENOENT;
> +
> +out:
> +    rangeset_destroy(guest_holes);
> +
> +    return res;
> +}
> +
>  static int __init find_domU_holes(const struct kernel_info *kinfo,
>                                    struct meminfo *ext_regions)
>  {
> @@ -2039,7 +2131,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>          res = 0;
>      }
> 
> -    return res;
> +    return remove_shm_holes_for_domU(kinfo, ext_regions);

We are no longer using "res" anywhere in this function, so the variable may be removed.

arch/arm/domain_build.c: In function ‘find_domU_holes’:

arch/arm/domain_build.c:2114:9: warning: variable ‘res’ set but not used [-Wunused-but-set-variable]

 2114 |     int res = -ENOENT;

      |         ^~~

>  }
> 
>  static int __init make_hypervisor_node(struct domain *d,
> --
> 2.25.1
> 
> 

