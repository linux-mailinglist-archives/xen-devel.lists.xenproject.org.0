Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47378C40C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592156.924799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxeI-0005CS-85; Tue, 29 Aug 2023 12:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592156.924799; Tue, 29 Aug 2023 12:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxeI-00058x-57; Tue, 29 Aug 2023 12:16:46 +0000
Received: by outflank-mailman (input) for mailman id 592156;
 Tue, 29 Aug 2023 12:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qaxeG-0004tN-Oh
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:16:44 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9710384-4665-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:16:42 +0200 (CEST)
Received: from CY5PR20CA0010.namprd20.prod.outlook.com (2603:10b6:930:3::11)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Tue, 29 Aug 2023 12:16:37 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::52) by CY5PR20CA0010.outlook.office365.com
 (2603:10b6:930:3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Tue, 29 Aug 2023 12:16:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 12:16:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 07:16:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 05:16:36 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 07:16:35 -0500
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
X-Inumbo-ID: e9710384-4665-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUkvdwgkT1Y14KVy6XxIA6CsVhmqYYjC18wNzlaYpzbVostXreS9hjbGjCnFCGh5h15LkuXyEbTJP1SmojQtB6viXVGztFDubpSgxFF9FRd7bUUlb+qrV/SewtIiCUJGcObCfB3xg5ipy4oJ6nc3BXuXJw/lhQ+Gs2hsSjucS+So/cB5UOABBCs1FmGBfIqmoKAtOUnILgSq7y2AQaMI605WJKRK/lWuXP/wKFWl5ZLC7AXddQkb6AiZsap0PnYUYJevTrvK2XRiyHFwcZ2gIJDuaR8TnhcowUGEv4TdI7JOGjvAdfUG1gEIFMnsGaPj1/YQX5Xxe/bJWL9YwDMUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fT3Pn5TQ734dKiH5jmNphyOJnE+DG9OcQwnsII6vXdY=;
 b=K8aefOQPP2ABhm8FhMPhT/VN0rZ/3cuowDyyU88eZkhdpPM9PNzUBeHbvUhlQzBt/izX+pRkWhHA3K3T4vCHuNkM9GGT85oTc7JgoUffYZLzFwZp3mXI90sRQrdKUVNku8BoscU3Xpvh7Qqptw3hPvxTbi1bZhC6zMX/CsLSBD3VQeLaOOS1kFXe+M36MtoFSbYabsxPCx4+UqD8OggiqcDIYqOIrq7QlFxX2m1Pko/BeVd9AIHPaNMHddgLDh9V6tFgkROIvkEQt/0pkdrq2ig0an+ZQYoK/6LWR1/EamY5PjvF9WiwpFpm3AijFpDVPZAZvt9ZoFFqsxNx4M0gOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fT3Pn5TQ734dKiH5jmNphyOJnE+DG9OcQwnsII6vXdY=;
 b=oJ5NnAK9nrYzxl9Uqm82GkIaIzW3kYEPcZ0L0IQFnLOsrE/zWk34sjoKKwuTjtwXNGMupllUgohA2oY1MuTbFQ6RJ7V1YO5uuwl3U1K/nYBWzVYcsMy3IET2IUbG0ar0+5u6IKQ6e0VLYR57nhTOxfVIcUkRvZubICk/U3q0Uvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0d7ef46a-209e-757f-f4fe-c24e0949ddce@amd.com>
Date: Tue, 29 Aug 2023 14:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 15/20] arm/asm/setup.h: Update struct
 map_range_data to add rangeset.
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-16-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd8529c-4cd9-4a64-b341-08dba889cb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wG7FXekAqsXd/k5ZNzzkR9ZreFbfM6F+zZcwL0nKrXqAppPvF+cdfQ0j97+9JU0UpnYev6FG+PUXkwQF+zW77l2n6aj6kwafbrMJJFlU6eQHZYyIgvQU40GeZOwfBEdpYT3xif/wbc5wrY952kPSZPG7PD9jsnj/SeR1aLYlqOcpR1wUxyN97Ixy2c14XYb8cNeZ4+Ja+C9H7XKRVngOHrvBBq3D9C0OW8T5gdB/WenbbZa89dMvDyhoUQ6LED50as8B5GxMuKUFL2BUrFw5PER0Z+I4Pqy3ll/t0d1IQB7qSPwL2irMsy027J6K+vveBjQnwsQ4tH0rgyRqHEAX5IkK2/3XWE58MnX+7gQBtysz/F/MJEGiJLTUfuMckzhHF1b0QxqvOLeoCy1OxXHOrMeLZkKb3HuIXlbLbkfPY0H7swx5ZY8jOuLKdB/0l1qXUiHgnPK4eG4ilXt94l0KQi3i+lkdd0efRYaWuiUggjD1OINDSbw7Bc+bnwUPxPhKmOiiSwbZHVf1dY8R1ziFRNuwnCWqxeo1GU6d3GBagqQQ7xQCDtKmvfq9rrp6GJgG6qOXkYZDE7G62oLHYUtu+lcth/seLppPd3A6+IAKhKVZcWYlfOCShZ9j+SJW41KZXaoCtmj8WhV9eVfNthz4F4TA6ZslFjcWy5fwIN4bTkoKUQPgypZxKzZDjSk1NSItw2OBkUCjpU8B1kL28KqPv8HwiBoDz4NFhXBZOuUL3BJJlpMPTJsyadkwNRXtWe98NiRLFqkLYV4eNYlejTwGoxu18+av+eDgc7ckf5e2pSGabpymx1CKeZbUCO1hKQjK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(31686004)(82740400003)(36756003)(40460700003)(31696002)(86362001)(356005)(81166007)(40480700001)(36860700001)(47076005)(2616005)(478600001)(2906002)(426003)(26005)(336012)(83380400001)(53546011)(110136005)(8936002)(70586007)(41300700001)(54906003)(70206006)(44832011)(8676002)(4326008)(5660300002)(16576012)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:16:37.1966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd8529c-4cd9-4a64-b341-08dba889cb03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216



On 25/08/2023 10:02, Vikram Garhwal wrote:
> Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
> node addition/removal operations. With overlay operations, new IRQs and IOMEMs
> are added in dt_host and routed. While removing overlay nodes, nodes are remove
s/remove/removed/

> from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
> IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
> IOMEM and IRQ ranges for overlay remove ops.
> 
> Dynamic overlay node add/remove will be introduced in follow-up patches.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/device.c            | 43 +++++++++++++++++++++++++-------
>  xen/arch/arm/domain_build.c      |  4 +--
>  xen/arch/arm/include/asm/setup.h |  5 +++-
>  3 files changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 857f171a27..9df37abac8 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -165,6 +165,14 @@ int map_range_to_domain(const struct dt_device_node *dev,
>      dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>                 addr, addr + len, mr_data->p2mt);
>  
> +    if ( mr_data->iomem_ranges )
> +    {
> +        res = rangeset_add_range(mr_data->iomem_ranges, paddr_to_pfn(addr),
> +                                 paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
paddr_to_pfn_aligned()?

> +        if ( res )
> +            return res;
> +    }
> +
>      return 0;
>  }
>  
> @@ -178,9 +186,10 @@ int map_range_to_domain(const struct dt_device_node *dev,
>   */
>  int handle_device_interrupts(struct domain *d,
This needs to be renamed as stated in one of the first patches.

>                               struct dt_device_node *dev,
> -                             bool need_mapping)
> +                             bool need_mapping,
> +                             struct rangeset *irq_ranges)
>  {
> -    unsigned int i, nirq;
> +    unsigned int i, nirq, irq;
>      int res;
>      struct dt_raw_irq rirq;
>  
> @@ -208,17 +217,24 @@ int handle_device_interrupts(struct domain *d,
>              continue;
>          }
>  
> -        res = platform_get_irq(dev, i);
> -        if ( res < 0 )
> +        irq = platform_get_irq(dev, i);
platform_get_irq() can return negative and you even have a check for < 0 below.
So you cannot assign it to unsigned.

> +        if ( irq < 0 )
>          {
>              printk(XENLOG_ERR "Unable to get irq %u for %s\n",
>                     i, dt_node_full_name(dev));
> -            return res;
> +            return irq;
>          }
>  
> -        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> +        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
>          if ( res )
>              return res;
> +
> +        if ( irq_ranges )
> +        {
> +            res = rangeset_add_singleton(irq_ranges, irq);
> +            if ( res )
> +                return res;
> +        }
>      }
>  
>      return 0;
> @@ -249,6 +265,11 @@ static int map_dt_irq_to_domain(const struct dt_device_node *dev,
>      }
>  
>      res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
> +    if ( res )
> +        return res;
> +
> +    if ( mr_data->irq_ranges )
> +        res = rangeset_add_singleton(mr_data->irq_ranges, irq);
>  
>      return res;
>  }
> @@ -289,7 +310,8 @@ static int map_device_children(const struct dt_device_node *dev,
>   *  - Assign the device to the guest if it's protected by an IOMMU
>   *  - Map the IRQs and iomem regions to DOM0
>   */
> -int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
> +int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
> +                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges)
You modified a function but the corresponding prototype change is missing.

>  {
>      unsigned int naddr;
>      unsigned int i;
> @@ -304,10 +326,13 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt)
>       *     pci_host_bridge_mappings().
>       */
>      struct map_range_data mr_data = {
> +        .d = d,
There's something wrong. I can see that you removed this line in patch no. 3. Why?
I don't see any reason so please fix it (otherwise code state from patch 3 to 15 is broken since nothing else sets mr_data.d).
When moving the code (which you should just copy/paste), do not perform any modification (unless mentioned otherwise).
Also, each patch in a series (except rare occasions) should not cause any build/runtime failure.

~Michal

