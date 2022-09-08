Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52A5B1608
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 09:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402800.644687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCNK-0007hE-IE; Thu, 08 Sep 2022 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402800.644687; Thu, 08 Sep 2022 07:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCNK-0007eA-F9; Thu, 08 Sep 2022 07:55:02 +0000
Received: by outflank-mailman (input) for mailman id 402800;
 Thu, 08 Sep 2022 07:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWCNJ-0007e4-6o
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 07:55:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 880359ce-2f4b-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 09:54:58 +0200 (CEST)
Received: from BN1PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:e1::29)
 by SA1PR12MB6728.namprd12.prod.outlook.com (2603:10b6:806:257::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 8 Sep
 2022 07:54:54 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::3) by BN1PR12CA0024.outlook.office365.com
 (2603:10b6:408:e1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 07:54:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 07:54:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 02:54:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 02:54:07 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 8 Sep 2022 02:54:05 -0500
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
X-Inumbo-ID: 880359ce-2f4b-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0EjfMcsCFLEeQOPqwB6CsMEia5NtN2knlB7HD5mvfp3ljDfhkDstzPMvrI2RRoDn5JbOIpQn8pv020c+zhiJ3U9VnJVHiqNTp9dlJiFSd4e/ZxjGPV2NpsODfOX55nvJa2wCNtI+k7ik7rDE7Zt/C1JxqRjhrAeqYFsBPOq+zlxIjPZQZv+jjAuhElgMWtzDYy03RU8Ftq6HOGaDm/w6mTuJeRT40PX9vccfmKwzWHIlPi+UeLS9mKvkx7ltx4ThQMN1x2QBnymbH1Z9GnUP4fpMIRay5DxOZcsYTDkChhFA+lBbluw9pqTXV6klaKz9XcYvHo+Sn4D3Sh0ykDc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CCD+19MUQz8wzTNorP4jxNXc69xm5UP1Sl53heiAiI=;
 b=R3EtaZh5lOoRn7pT995ImZGQNEbYVOQ3fiOjnWBHsrUoJjVQRLa1dzYfTr/jgKFJyZctzB7s+jNJxhTInwQsqv41+9X+R6H9dFVt7lWHEYjcDY6DtgqYyoW2uGL/Hht9SPvDlqvjQB1r1TgESmOAGns4i16BedhIcWNOcCmK0OlPNzzot0jYJm5VkT38WQ1+cTJmTOMKVgTF8fHkr1KnxxWBHTvc3Tgc/laJlYsJJdYA6nEncebcNgMfcj7Mh3ky0WXMf+sCaGI7uU/MR/hFp8G+SYxZ39XaUQ+TXlFs7aCdd3EUbvUhamWGkcj3rXFs3afP4tuAGnFoMA1H9oUtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CCD+19MUQz8wzTNorP4jxNXc69xm5UP1Sl53heiAiI=;
 b=VJHVxFnG6SUWX1Gti+R+SksKdvr16Pqgt6zSWsI7C5GITL3y44Ku6xrZzOTuESEg2ivurN1yvEqNiPO9D3dXcQPqXmQ0o66IZDUK84zRBqQxnqGUHn5vVCN3YshcCyWFS6SI+OgTLUgPkcOf2Qd6YdQO8BLp0BX4hshBcC5qwFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <44cd9359-db40-c6e3-7398-220d27d72bdc@amd.com>
Date: Thu, 8 Sep 2022 09:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 2/4] docs, xen/arm: Introduce static heap memory
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Penny
 Zheng" <penny.zheng@arm.com>
References: <20220908042538.27076-1-Henry.Wang@arm.com>
 <20220908042538.27076-3-Henry.Wang@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220908042538.27076-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|SA1PR12MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 599e6988-2538-4834-0194-08da916f6a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAg13Dj7QONfL1TaupAHC5DfXQ7uc5wl3b94HJlPPwDO7Ut0en3CYR81S59iKjuz+2oo4vTAO2Xhwno3ZHn+51QFOuEqGbv66mMTROJ4AxFEDrTPKv46eAXsvqD1qSZt/P+zkmirxb49NvytKI4CaMgbLxz57v4Dj2rz2DzwHBRf1WYZO/WvmrKq+1H3HXESjnCnhayytcIQqM5vRNlIjcMCSRXXgtV/q8lesS8a1HGreYpCiNZOknGuaQQal/sZun1dr1hfXyU/s51bWfbWb6ipn4bvyBavmGhSir3k4DbMkmEtFITECULkyvayiNCDXjEeEVYOtjXjIqoezyvfdMwT2labqeHfuQyJI6kKBfiafzbwwcJwUI3iI0sYKVvqYeiYFhmgRxrLD3xq7mZC3Ha6ZojAhbQPjeJH2Tk+gaBAUv6E2VICV77+VT07vw8yKGCQpRwN5bIDqx30RC2FkP9+pxKH91BxdXzlBduKrFYEUDs3fDBk7DOVGnbK5Cbl6axHSFZ4rhnUP9oMKK66AkeB479+CQqdf4Izx6zSlOSY/REQmH8whmSfPfzgXvKilsQnkuXgiofw/kaEkkGky0ghvkgAwtKOfYjMNUkjSNC81Zsxz11PPXGCLgQpry/+gv4ERlPZBYVnGC0eFEcLwuFyhK8sJ5MAwuoPMk/kdMVb4vL57XLZ/SWni/CfnjT+IE5zENBihE2UwkW32AAI9VFuB4rV+8EQTb70vIsdCUavQBPv1QAv0GhZoEbrirMf+MO4X3D3RyeRri4gfbyLN1N17cgLXdbcf848qWFRZTU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(40470700004)(46966006)(36840700001)(2616005)(47076005)(81166007)(26005)(86362001)(426003)(336012)(40460700003)(83380400001)(53546011)(186003)(356005)(41300700001)(36860700001)(31696002)(82740400003)(36756003)(54906003)(5660300002)(316002)(16576012)(70586007)(110136005)(40480700001)(966005)(8676002)(4326008)(70206006)(8936002)(31686004)(7416002)(478600001)(2906002)(44832011)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 07:54:53.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599e6988-2538-4834-0194-08da916f6a60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6728

Hi Henry,

On 08/09/2022 06:25, Henry Wang wrote:
> 
> This commit introduces the static heap memory, which is parts of RAM
> reserved in the beginning of the boot time for heap.
> 
> Firstly, since a new type of memory bank is needed for marking the
> memory bank solely as the heap, this commit defines `enum membank_type`
> and use this enum in function device_tree_get_meminfo(). Changes of
> code are done accordingly following the introduction of this enum.
> 
> Also, this commit introduces the logic to parse the static heap
> configuration in device tree. If the memory bank is reserved as heap
> through `xen,static-heap` property in device tree `chosen` node, the
> memory will be marked as static heap type.
> 
> A documentation section is added, describing the definition of static
> heap memory and the method of enabling the static heap memory through
> device tree at boot time.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> Changes from v4 to v5:
> - Use #address-cells and #size-cells for static heap, do not introduce
>   new address/size cells. Update the dt-binding accordingly.
> - Correct a typo in code comments.
> - Drop Stefano's acked-by as it is not valid.
> Changes from v3 to v4:
> - Change of wording in comments.
> - Add the static heap feature in SUPPORT.md as tech preview.
> Changes from v2 to v3:
> - Define `enum membank_type` properly, drop the typedef.
> - Rename the feature terminology to static heap.
> - Rename MEMBANK_MEMORY to MEMBANK_DEFAULT and MEMBANK_XEN_DOMAIN to
>   MEMBANK_STATIC_DOMAIN. Add comments to `enum membank_type`.
> - Correct typo, add the clarification of the static heap region
>   should contain enough memory below 4GB to cater 32-bit DMA for Arm32,
>   and add the 64KB alignment requirement in doc.
> - Add Stefano's Acked-by for device tree interface.
> Changes from v1 to v2:
> - Rename the device tree property to xen,static-heap to avoid confusion.
> - Change of commit msg and doc wording, correct typo in commit msg.
> - Do not change the process_chosen_node() return type.
> - Add an empty line in make_memory_node() memory type check to improve
>   readability.
> - Use enum membank_type to make the memory type cleaner.
> Changes from RFC to v1:
> - Rename the terminology to reserved heap.
> ---
>  SUPPORT.md                            |  7 ++++
>  docs/misc/arm/device-tree/booting.txt | 52 +++++++++++++++++++++++++++
>  xen/arch/arm/bootfdt.c                | 29 ++++++++++++---
>  xen/arch/arm/domain_build.c           |  8 +++--
>  xen/arch/arm/include/asm/setup.h      | 22 +++++++++++-
>  xen/arch/arm/setup.c                  |  2 +-
>  6 files changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 8e040d1c1e..b02a5d25ca 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -293,6 +293,13 @@ pre-defined by configuration using physical address ranges.
> 
>      Status, ARM: Tech Preview
> 
> +### Static Heap
> +
> +Allow reserving parts of RAM through the device tree using physical
> +address ranges as heap.
> +
> +    Status, ARM: Tech Preview
> +
>  ### Memory Sharing
> 
>  Allow sharing of identical pages between guests
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..a5062db217 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,55 @@ device-tree:
> 
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
> +
> +
> +Static Heap Memory
> +==================
> +
> +The static heap memory refers to parts of RAM reserved in the beginning of
> +boot time for heap. The memory is reserved by configuration in the device
> +tree using physical address ranges.
> +
> +The static heap memory declared in the device tree defines the memory areas
> +that will be reserved to be used exclusively as heap.
> +
> +- For Arm32, since there are separated heaps, the static heap will be used
> +for both domheap and xenheap. The admin should make sure that the static
> +heap region should contain enough memory below 4GB to cater 32-bit DMA.
> +
> +- For Arm64, since there is a single heap, the defined static heap areas
> +shall always go to the heap allocator.
> +
> +The static heap memory is an optional feature and can be enabled by adding
> +below device tree properties.
> +
> +The dtb should have the following properties:
> +
> +- xen,static-heap
> +
> +    Property under the top-level "chosen" node. It specifies the address
> +    and size of Xen static heap memory. Note that at least a 64KB
> +    alignment is required.
> +
> +- #address-cells and #size-cells
> +
> +    Specify the number of cells used for the address and size of the
> +    "xen,static-heap" property. Note that according to the device tree
> +    specification, the number of address cells and size cells of
> +    "xen,static-heap" is determined by the parent #address-cells and
> +    #size-cells of the top-level "chosen" node.
I am not sure we should put the information about #address-cells and #size-cells in that form.
Firstly because /chosen node is always a child of / node and according to specs [1]
the #address-cells and #size-cells are required properties for the root node.

If we want to still mention it I would just write under xen,static-heap:
"Number of address and size cells for the xen,static-heap property is determined
by the root node #address-cells/#size-cells".

> +
> +Below is an example on how to specify the static heap in device tree:
> +
> +    / {
> +        #address-cells = <0x2>;
> +        #size-cells = <0x2>;
> +        ...
> +        chosen {
> +            xen,static-heap = <0x0 0x30000000 0x0 0x40000000>;
> +            ...
> +        };
> +    };
> +
> +RAM starting from the host physical address 0x30000000 of 1GB size will
> +be reserved as static heap.
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 1a79b969af..3c98c00981 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -64,7 +64,7 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>                                            const char *prop_name,
>                                            u32 address_cells, u32 size_cells,
> -                                          void *data, bool xen_domain)
> +                                          void *data, enum membank_type type)
>  {
>      const struct fdt_property *prop;
>      unsigned int i, banks;
> @@ -95,7 +95,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>              continue;
>          mem->bank[mem->nr_banks].start = start;
>          mem->bank[mem->nr_banks].size = size;
> -        mem->bank[mem->nr_banks].xen_domain = xen_domain;
> +        mem->bank[mem->nr_banks].type = type;
>          mem->nr_banks++;
>      }
> 
> @@ -185,7 +185,7 @@ static int __init process_memory_node(const void *fdt, int node,
>                                        void *data)
>  {
>      return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
> -                                   data, false);
> +                                   data, MEMBANK_DEFAULT);
>  }
> 
>  static int __init process_reserved_memory_node(const void *fdt, int node,
> @@ -301,6 +301,26 @@ static int __init process_chosen_node(const void *fdt, int node,
>      paddr_t start, end;
>      int len;
> 
> +    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
> +    {
> +        int rc;
> +
> +        printk("Checking for static heap in /chosen\n");
> +        if ( address_cells < 1 || size_cells < 1 )
> +        {
> +            printk("fdt: node `%s': invalid #address-cells or #size-cells\n",
> +                   name);
> +            return -EINVAL;
> +        }
This check is now the direct copy of the one in device_tree_get_meminfo so please remove it
to avoid code duplication.

~Michal

[1] https://devicetree-specification.readthedocs.io/en/v0.3/devicenodes.html

