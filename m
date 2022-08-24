Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A259FC27
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392623.631096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqiw-0001Rk-Vm; Wed, 24 Aug 2022 13:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392623.631096; Wed, 24 Aug 2022 13:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqiw-0001PI-So; Wed, 24 Aug 2022 13:47:14 +0000
Received: by outflank-mailman (input) for mailman id 392623;
 Wed, 24 Aug 2022 13:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsFi=Y4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oQqiu-0001PC-Et
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:47:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7c9d78-23b3-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:47:10 +0200 (CEST)
Received: from DS7PR03CA0160.namprd03.prod.outlook.com (2603:10b6:5:3b2::15)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 13:47:06 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::9b) by DS7PR03CA0160.outlook.office365.com
 (2603:10b6:5:3b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 13:47:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 13:47:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 08:47:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 06:46:56 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 24 Aug 2022 08:46:55 -0500
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
X-Inumbo-ID: 3f7c9d78-23b3-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnvYDfvjJ8gNvVWcg0kyRp32nKDwxnW8oZGU+QFVM66pIs2OiUBZhxf/qxcQS8YCe0YTRu8+cXV4drNOmvIRNC8EWjUXNCH7Gsqv2SnOnmRUZZQwIpgIDNl85UOc94NtPceBcOowBhhULl5a390DY1LEonuOkitPTg/3U/MUr2NrciAVYn2xem0MXuY28c/4bGgGrnelic48/pO0cPVXf/6Qbq5dBl4fdtrqbxzinsXXl7p+VOE43za6PdhsIlf8+SPOiLS6GeGefgvmrmnq+RKM5bkHOKhtmlvgDbKU5HljbNXld4Os6KkaNgxje0FJCUEPeG0tT5EHdtltNEfs8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ithhV0Zw5thfr7KB14KDGpgEJBLaYAqZ2ogToDYa2H8=;
 b=h3nIxZpE3yrNobemlN/V87BYbwb7RNKUKG9RrOyTZVWIldnyA89zBefa6Arq+XLADAWyOT9ecovDzDwu//NFvQkRxGOVi0PDYS40C53zZHkPaUccDD/XDrpqa1ZufovbTkM6biSyY/fxZUO4WIVH3MqTJzP8v3FxdexT+KoA6C5qPobxjwAviYX8b7KmluKw57kP2/14y2L6mCc1jWNgUAXef58ANzsUdgq2Tza8NxSBJDbJIe/izrRCmspu1fTkKH/7Dkk+IFnHZd/4qYHWo9uvbhcaZhz1KscEt2nehmSjfZ+a8Okg2TmmKKqwK4JKSW59+3dP7Zu2PbXFdVzQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ithhV0Zw5thfr7KB14KDGpgEJBLaYAqZ2ogToDYa2H8=;
 b=PeU7myESq1slqgUAUegd+UtEyXqEMZJKiQex23GGPEvk4kdGrGZ5YpBG8RqgpC1X8FG54NMvTcEAPkEda1XeojY++bbLmnDABbC5dtVHWG+xuW8GJ2Q8OEBUDV+wEIDiAhELVZYb7tY36QhtAVsvbW0HH6CuarpSl0hVPju4nn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
Date: Wed, 24 Aug 2022 15:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Penny
 Zheng" <penny.zheng@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220824073127.16762-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5b4708-56b5-4bcf-f4c1-08da85d72239
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmHQifyx2efAcTJBK2QqeDfSxvrdSD/YGXCVRO0j63qR+NVUCo6/88KPtQtfk9UabFOsHzqFkofxSWZ/4aLUQTxSZmfuGaseEw3Awn0MI2IH/Kgj8LCtIslpE6e4feVifpqcd3fVyXUPza3+pQtHXm3Ryye6bJF+lVn4qBMySw2I/AxW+KZG4ODaReEk4o3HALPOfQ2pe/6Z6MznI+fEBeFPMppbq2ue4djGekNA225fZhHShIB28VnfUTG6ui1oyXPN1tELfays2BX43I1TBG5/jTC8r6MDR/kvzesjGOyxKnSrNjRCjwXpkKdYVluhapWqW/YY2eyapakhlfGvivcC3KazCByZJhomfxtGXKHL0eWWLldRX45/KeQzhxdSmh6Qhim5bIM7E7sx/+v9t2ZlMaZkgUnXI+UKql7shLGv/flNaIsOhoz87YzWdzzpsOINvSs9W51IjTOyr5NGpfpPsHj0TkRSovGJ36/wyDrLvUBAS/XANj+zYoT3bh4pKd2q1vupBkIa3/WbIXRH09PSutl1VL37uHIbAwcjfVubww8gr5QPkoi8LcJit96jtLoLLMjTvCIyBmMUWkEPJHdRbgP0iF+b6u6F9CGisi2A/nEIVSzlaXwrd1XA4+CAYujshGmKF317/D2EuIQR33HWXlLXcavIVDHXKO0QgisdMDOD5LaFDceYKh4mWcbvK3bL7PSZQ8YsNLu56VL9H++nhtTc2uuxovAkmjbqQr9UsOUFfVt/IwcE/83F6fvQxAxC+XiZ7QM0ADQPjahgl8DLc5T21810zpT1uHoew78X0Mok7evkB0atft/FeagMfEP2S8MkggJQ0YaWvCPuEQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(40470700004)(36840700001)(46966006)(81166007)(54906003)(356005)(2906002)(40480700001)(110136005)(82310400005)(36860700001)(53546011)(36756003)(31686004)(26005)(16576012)(316002)(478600001)(5660300002)(186003)(83380400001)(2616005)(44832011)(41300700001)(336012)(8676002)(82740400003)(70206006)(40460700003)(4326008)(70586007)(426003)(31696002)(47076005)(8936002)(86362001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 13:47:06.4095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5b4708-56b5-4bcf-f4c1-08da85d72239
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109

Hi Henry,

On 24/08/2022 09:31, Henry Wang wrote:
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..e064f64d9a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,49 @@ device-tree:
> 
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
> +
> +
> +Reserved Heap Memory
> +====================
> +
> +The reserved heap memory (also known as the statically-configured heap) refers
> +to parts of RAM reserved in the beginning for heap. The memory is reserved by
I think we are missing "... in the beginning" of what.

> +configuration in the device tree using physical address ranges.
> +
> +The reserved heap memory declared in the device tree defines the memory areas
> +that will be reserved to be used exclusively as heap.
> +
> +- For Arm32, since there can be seperated heaps, the reserved heap will be used
Maybe "there are" instead of "there can be" as we do define for Arm32:
#define CONFIG_SEPARATE_XENHEAP 1
and I do not think we have some flexibility to change this.

> +for both domheap and xenheap.
> +- For Arm64, since domheap and xenheap are the same, the defined reserved heap
Instead of writing "since domheap and xenheap are the same" maybe it'd be better to write:
"For Arm64, as there is a single heap..."

> +areas shall always go to the heap allocator.
> +
> +The reserved heap memory is an optional feature and can be enabled by adding a
> +device tree property in the `chosen` node. Currently, this feature reuses the
> +static memory allocation device tree configuration.
> +
> +The dtb property should look like as follows:
> +
> +- property name
> +
> +    "xen,static-mem" (Should be used in the `chosen` node)
> +
> +- cells
> +
> +    Specify the start address and the length of the reserved heap memory.
> +    The number of cells for the address and the size should be defined
> +    using the properties `#xen,static-mem-address-cells` and
> +    `#xen,static-mem-size-cells` respectively.
> +
> +Below is an example on how to specify the reserved heap in device tree:
> +
> +    / {
> +        chosen {
> +            #xen,static-mem-address-cells = <0x2>;
> +            #xen,static-mem-size-cells = <0x2>;
> +            xen,static-mem = <0x0 0x30000000 0x0 0x40000000>;
Please add "..." here as this does not represent the complete working chosen node.

> +        };
> +    };
> +
> +RAM at 0x30000000 of 1G size will be reserved as heap.
> +
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ec81a45de9..33704ca487 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -64,7 +64,8 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>                                            const char *prop_name,
>                                            u32 address_cells, u32 size_cells,
> -                                          void *data, bool xen_domain)
> +                                          void *data, bool xen_domain,
> +                                          bool xen_heap)
>  {
>      const struct fdt_property *prop;
>      unsigned int i, banks;
> @@ -96,6 +97,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>          mem->bank[mem->nr_banks].start = start;
>          mem->bank[mem->nr_banks].size = size;
>          mem->bank[mem->nr_banks].xen_domain = xen_domain;
> +        mem->bank[mem->nr_banks].xen_heap = xen_heap;
>          mem->nr_banks++;
>      }
> 
> @@ -185,7 +187,7 @@ static int __init process_memory_node(const void *fdt, int node,
>                                        void *data)
>  {
>      return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
> -                                   data, false);
> +                                   data, false, false);
>  }
> 
>  static int __init process_reserved_memory_node(const void *fdt, int node,
> @@ -293,7 +295,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
>                       kind, start, domU);
>  }
> 
> -static void __init process_chosen_node(const void *fdt, int node,
> +static int __init process_chosen_node(const void *fdt, int node,
You do not really need to change the return type of this function.
Currently process_chosen_node just returns on an error condition so you could do the same.

>                                         const char *name,
>                                         u32 address_cells, u32 size_cells)
>  {
> @@ -301,16 +303,40 @@ static void __init process_chosen_node(const void *fdt, int node,
>      paddr_t start, end;
>      int len;
> 
> +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> +    {
> +        u32 address_cells = device_tree_get_u32(fdt, node,
> +                                                "#xen,static-mem-address-cells",
> +                                                0);
> +        u32 size_cells = device_tree_get_u32(fdt, node,
> +                                             "#xen,static-mem-size-cells", 0);
> +        int rc;
> +
> +        printk("Checking for reserved heap in /chosen\n");
> +        if ( address_cells < 1 || size_cells < 1 )
address_cells and size_cells cannot be negative so you could just check if there are 0.

> +        {
> +            printk("fdt: node `%s': invalid #xen,static-mem-address-cells or #xen,static-mem-size-cells\n",
> +                   name);
> +            return -EINVAL;
> +        }
> +
> +        rc = device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
> +                                     size_cells, &bootinfo.reserved_mem, false,
> +                                     true);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      printk("Checking for initrd in /chosen\n");
> 
>      prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
>      if ( !prop )
>          /* No initrd present. */
> -        return;
> +        return 0;
>      if ( len != sizeof(u32) && len != sizeof(u64) )
>      {
>          printk("linux,initrd-start property has invalid length %d\n", len);
> -        return;
> +        return -EINVAL;
This change breaks the current behavior and will result in triggering the printk in early_scan_node for parsing failure.
Is this intended? If so, you could mention this in the commit msg.

>      }
>      start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> 
> @@ -318,12 +344,12 @@ static void __init process_chosen_node(const void *fdt, int node,
>      if ( !prop )
>      {
>          printk("linux,initrd-end not present but -start was\n");
> -        return;
> +        return -EINVAL;
>      }
>      if ( len != sizeof(u32) && len != sizeof(u64) )
>      {
>          printk("linux,initrd-end property has invalid length %d\n", len);
> -        return;
> +        return -EINVAL;
>      }
>      end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> 
> @@ -331,12 +357,14 @@ static void __init process_chosen_node(const void *fdt, int node,
>      {
>          printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
>                    start, end);
> -        return;
> +        return -EINVAL;
>      }
> 
>      printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
> 
>      add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
> +
> +    return 0;
>  }
> 
>  static int __init process_domain_node(const void *fdt, int node,
> @@ -358,7 +386,8 @@ static int __init process_domain_node(const void *fdt, int node,
>                                       "#xen,static-mem-size-cells", 0);
> 
>      return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
> -                                   size_cells, &bootinfo.reserved_mem, true);
> +                                   size_cells, &bootinfo.reserved_mem, true,
> +                                   false);
>  }
> 
>  static int __init early_scan_node(const void *fdt,
> @@ -383,7 +412,7 @@ static int __init early_scan_node(const void *fdt,
>                device_tree_node_compatible(fdt, node, "multiboot,module" )))
>          process_multiboot_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
> -        process_chosen_node(fdt, node, name, address_cells, size_cells);
> +        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>          rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..6f97f5f06a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1038,8 +1038,9 @@ static int __init make_memory_node(const struct domain *d,
>      if ( mem->nr_banks == 0 )
>          return -ENOENT;
> 
> -    /* find first memory range not bound to a Xen domain */
> -    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> +    /* find first memory range not bound to neither a Xen domain nor heap */
> +    for ( i = 0; i < mem->nr_banks &&
> +                 (mem->bank[i].xen_domain || mem->bank[i].xen_heap); i++ )
>          ;
Could you please add an empty line here to improve readability?

>      if ( i == mem->nr_banks )
>          return 0;
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..e80f3d6201 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -27,6 +27,7 @@ struct membank {
>      paddr_t start;
>      paddr_t size;
>      bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +    bool xen_heap;   /* whether the memory bank is reserved as heap. */
>  };
> 
>  struct meminfo {
> --
> 2.17.1
> 
> 

~Michal

