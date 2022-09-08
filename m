Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB35B1A2A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403087.645067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEve-0003PO-Id; Thu, 08 Sep 2022 10:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403087.645067; Thu, 08 Sep 2022 10:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEve-0003Mk-FK; Thu, 08 Sep 2022 10:38:38 +0000
Received: by outflank-mailman (input) for mailman id 403087;
 Thu, 08 Sep 2022 10:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWEvd-0003Me-Jj
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:38:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e3b917-2f62-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 12:38:35 +0200 (CEST)
Received: from MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::9) by
 IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Thu, 8 Sep
 2022 10:38:30 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::85) by MW4P221CA0004.outlook.office365.com
 (2603:10b6:303:8b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 10:38:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 10:38:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 05:38:27 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 8 Sep 2022 05:38:26 -0500
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
X-Inumbo-ID: 63e3b917-2f62-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+ijwsWoAot9edRjMgiGrioy2uBzD3Yeb6DOls9CliTXLbs8Iq8WIWmqRUWIZH2UHj4DtXe0KA7OEKlbRZh62pt6SD/YUSm4zDzHTfM4CqM80bRuUtRZfbbszBcQIHWvKfwkWDD3PsimZ9rhnT5TQcWv0WLf9XCOsO8Th+T2l3tK44wjixIqE5laq1Jv9/d+5H1QgfcR+N1WCUVXZLbCSb9OOz995ZPXJ0IpJps6dP3P7q8V3P1MVih61gMKpZF30f5NmA/6HzzEyg4/ejduKJPsK5gASbHUwFbrzYxYuUW7aZeKMdooHFzjnwmEuQHO+2SmqdilHcXnqXRaz+vl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSPQwkZwO6weRR9TEn5yme3ZUfJgCSm+hREkI4rQk1c=;
 b=T/weolQFVrT4pi/TxHqksSD8fHP30tiIeHADW22IRHrzmGdJIXzrqONYFSPxkYqxRmAuEWGPhs/DCIEpihrEiGxtWVYZpr7sNSdP6eWFAs/kyT0zYwEZrTKj75qvoN4CmVZxWGTk5qyShpikTu2IRzB9lXufwYMFXZ/kCtudb9+iFO/lwZu4HZYXBTWYm3LK5/iVk4wKhh61d1CRuhB5cn8Y1ty1RYsMYu2znm0RBIzTZXVEA4+n7D9+v6JX7i2xgIqiIpSMfkLdh0tpazwmRavZ79bo1webhmjZ0FvGWM6eoCbaf92GFmBGqP/y8GbB+Ftb4AnsySSWkVLysp7j/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSPQwkZwO6weRR9TEn5yme3ZUfJgCSm+hREkI4rQk1c=;
 b=STcJWMsE9BraKMpl+VgREj4eu6+7IULd8K7qVj8IM2a8qR6cdJryu6W2/WXbQGM1ZhlH1RHskCYlYK4yyJuZAxI/0xg1wPIRfDP7uRa3ZOz/guq1LBUyhGk8L0NlgaEPbh9ls1gpA3HQRKu/ThJlzYPUDMPFsPaT2smkXWUJ+4s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f9874353-6060-61b1-3faa-9698f85c7ac4@amd.com>
Date: Thu, 8 Sep 2022 12:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220908093129.30124-1-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220908093129.30124-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT056:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d0fdf0-62d7-47d3-8b84-08da91864534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5t5Xw/gWMqzDfrKOtoIkcs7r6uhGo9S3Nr4J5vP+/FMtwmDvwpAaW2MQYwNir457D2mIYtQ/wjIEa2+rRsFvFWpSLyNceEKCXJUBia7MMcwhfw1Wgy9mKiqMbNnoboFjkXX5jxqj7llIXICd02P1h55v4iWuyRZ4cTHQjS4VDCaH7gtmHGoWIpLWXfuvbLMXHjpsT+LnQGh5QqLo+TT8g9bsCN7Ak3v2vofcI5jqxLOlDU0dwMSn+owZQvcdsfCdbK37Q667X/zXwDaIDE0MyLJLfnKBeCPF3r6s5n9j1SfoKLAQBeAh8g2xeenyu1+I+hf0Jf+mmCfvCoCO/pibGdniqKpcBglFZpenoBm7n7kTJseRnvI74zD3hlOxWMV0IKzNfw3pivXi0jk5wcn5gvQhO/+0CZjGrxCDiIoamhRp9jWSU48OFC8ZRdRxzJiF+/ZqvGOiPlO6+qR6FGe+te54HK5pF12u36pU8Uo0aYRLKxXPqgTWnNOdmshvO0WxeFLfE/quny//pG7wOIq+Vxj2/EU+MOxRkGfbY+4bAatH/qj2kysvzE2/lEpr8g5wIDe5wU9e3GBz2aYdmpif6yZLETTrOV29FysVlfBfyj1tRwHUXG93be4YjiPKdDtI3/kJ19dJrMwf6mSpoMsERY/1kRX1F45fofijMAneX8ZhlZePk/2yE13PjHW8Ez7z5N4veO4m6T8/UHgJmElBOm2bGOCrnbVdrKhovfWn+u/ofoxSy0JmRjPayT0gUnzWQ9eh7imFMShLJr7tqo5UgXt+qBWIlSC+W4FOv8zdNYu3556TS3MFkYac6Atui5XzzRJtUJdo+XAZjTIBYISPQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(40460700003)(4326008)(86362001)(31696002)(2616005)(426003)(83380400001)(186003)(81166007)(47076005)(82740400003)(356005)(36860700001)(336012)(8676002)(26005)(70586007)(70206006)(2906002)(316002)(110136005)(478600001)(8936002)(5660300002)(82310400005)(40480700001)(54906003)(16576012)(44832011)(31686004)(36756003)(41300700001)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:38:29.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d0fdf0-62d7-47d3-8b84-08da91864534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

Hi Henry,

On 08/09/2022 11:31, Henry Wang wrote:
> 
> In order to keep consistency in the device tree binding, there is
> no need for static memory allocation feature to define a specific
> set of address and size cells for "xen,static-mem" property.
> 
> Therefore, this commit reuses the regular #{address,size}-cells
> for parsing the device tree "xen,static-mem" property. Update
> the documentation accordingly.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 13 ++++++-------
>  docs/misc/arm/passthrough-noiommu.txt |  7 +++----
>  xen/arch/arm/bootfdt.c                |  5 -----
>  xen/arch/arm/domain_build.c           | 16 ++--------------
>  4 files changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..12d77e3b26 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -339,15 +339,15 @@ kernel will be able to discover the device.
> 
> 
>  Static Allocation
> -=============
> +=================
> 
>  Static Allocation refers to system or sub-system(domains) for which memory
>  areas are pre-defined by configuration using physical address ranges.
> 
>  Memory can be statically allocated to a domain using the property "xen,static-
>  mem" defined in the domain configuration. The number of cells for the address
> -and the size must be defined using respectively the properties
> -"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> +and the size must be defined respectively by the parent node properties
> +"#address-cells" and "#size-cells".
> 
>  The property 'memory' is still needed and should match the amount of memory
>  given to the guest. Currently, it either comes from static memory or lets Xen
> @@ -362,14 +362,13 @@ device-tree:
> 
>      / {
>          chosen {
> +            #address-cells = <0x1>;
> +            #size-cells = <0x1>;
> +            ...
>              domU1 {
>                  compatible = "xen,domain";
> -                #address-cells = <0x2>;
> -                #size-cells = <0x2>;
Why did you remove this set if it relates to the childs of domU1 (e.g. kernel, ramdisk) and not to domU1 itself?

>                  cpus = <2>;
>                  memory = <0x0 0x80000>;
> -                #xen,static-mem-address-cells = <0x1>;
> -                #xen,static-mem-size-cells = <0x1>;
>                  xen,static-mem = <0x30000000 0x20000000>;
>                  ...
>              };
> diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
> index 3e2ef21ad7..69b8de1975 100644
> --- a/docs/misc/arm/passthrough-noiommu.txt
> +++ b/docs/misc/arm/passthrough-noiommu.txt
> @@ -33,14 +33,13 @@ on static allocation in the device-tree:
> 
>  / {
>         chosen {
> +               #address-cells = <0x1>;
> +               #size-cells = <0x1>;
> +               ...
>                 domU1 {
>                         compatible = "xen,domain";
> -                       #address-cells = <0x2>;
> -                       #size-cells = <0x2>;
The same here.

>                         cpus = <2>;
>                         memory = <0x0 0x80000>;
> -                       #xen,static-mem-address-cells = <0x1>;
> -                       #xen,static-mem-size-cells = <0x1>;
>                         xen,static-mem = <0x30000000 0x20000000>;
>                         direct-map;
>                         ...
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ec81a45de9..cd264793d5 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -352,11 +352,6 @@ static int __init process_domain_node(const void *fdt, int node,
>          /* No "xen,static-mem" present. */
>          return 0;
> 
> -    address_cells = device_tree_get_u32(fdt, node,
> -                                        "#xen,static-mem-address-cells", 0);
> -    size_cells = device_tree_get_u32(fdt, node,
> -                                     "#xen,static-mem-size-cells", 0);
> -
>      return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
>                                     size_cells, &bootinfo.reserved_mem, true);
>  }
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b76a84e8f5..258d74699d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -563,21 +563,9 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
>      const struct dt_property *prop;
> 
>      prop = dt_find_property(node, "xen,static-mem", NULL);
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> -                               addr_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-address-cells\".\n");
> -        return -EINVAL;
> -    }
> 
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> -                               size_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-size-cells\".\n");
> -        return -EINVAL;
> -    }
> +    *addr_cells = dt_n_addr_cells(node);
> +    *size_cells = dt_n_size_cells(node);
There is a type mismatch here as e.g. addr_cells is u32 and dt_n_addr_cells return type is int.
But I don't think this can be harmful and also it's strange for me that dt_n_addr_cells
is defined to return int given that it either returns 2 or be32_to_cpup, which means it should return u32.

> 
>      *cell = (const __be32 *)prop->value;
>      *length = prop->length;
> --
> 2.17.1
> 
> 
Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

