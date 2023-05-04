Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3466F65BA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529581.824107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTQ4-0001K2-Gw; Thu, 04 May 2023 07:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529581.824107; Thu, 04 May 2023 07:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTQ4-0001Gs-Dx; Thu, 04 May 2023 07:30:28 +0000
Received: by outflank-mailman (input) for mailman id 529581;
 Thu, 04 May 2023 07:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puTQ2-0001Gf-Og
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:30:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87f718a7-ea4d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:30:24 +0200 (CEST)
Received: from DS7PR03CA0328.namprd03.prod.outlook.com (2603:10b6:8:2b::30) by
 PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 07:30:19 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::5d) by DS7PR03CA0328.outlook.office365.com
 (2603:10b6:8:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 07:30:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.27 via Frontend Transport; Thu, 4 May 2023 07:30:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 02:30:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 02:30:17 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 02:30:15 -0500
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
X-Inumbo-ID: 87f718a7-ea4d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV6gYA28E9DOfBjQk9A0XhceyM2C/8+TklkE1RLM354c9oyu/RYyEu9dp2epeIk/bMb2QzqGdQO7S6q4PCa25RP4IA6aQAUI7M4aZdMwrtFmF8FVDy9Nnm7nWarIYAcnpsIC5Wp9u9GQFupmxG8Yv15tKSLT2Rcdz/g4EsgQ6735/AghMkHQyq2kO1/WAGN7fd8YfmRHFCZoPaPZ+TekOSha3pNGXN17CPYj8bPRLiTjjC+UmBws0Vlq/NdvLYF45MtMVx/DFhQZP7tMVqGQ2n9lMS4F2C1FIiIBKuH23sQgvvL7+V/7IAoS8aA+YyzwrAVuXyxsA1zslkuJeg+6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lX6B3Pv3MVT8M+7HUeJq5+tI69DxXdfq+5n4o6/+Vt8=;
 b=gj43ETfFIwHvlSYgybRFHVrOXotPzPm7IF8tKPevEzzB3z8ohM82kdPkxvMydzv48qQaRpSwb4HZrIqmwNSZmV71IsfW1C5KVOgJofrrDUCjr4FdHRjTuJImf3vn3Rpt0fZxVPh+8Dm8jIJZQ0b344OmVH1hojyRcizAA3fAeWqZPP5LjYkHmSUm94JlQHYGgzd5Uv8kvGGXx0D+Bsp9dSgiZTDEVDGHRAMdu2lg46fgDy6MB/bhiP78CE04garUl1zUEdnvwxLzgs0yywnLFbrw4HFHTfZo86DJqXwl67Y6PG9/6YdhHf16lCfnnz5A7FaVzGq5yTQGM/nTcVZ3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX6B3Pv3MVT8M+7HUeJq5+tI69DxXdfq+5n4o6/+Vt8=;
 b=R1/wPWDfeusBSqWi7QVkXEIm5IylL6qXln2gxbHwnQl1ndCp1Bn2KpkVe4TR16NApGoy+LUAwUqzFwOC/iPycuW3ve269o8VPEqgkOdrCPW46JKkycAmbtrSFAPiHff/jkS4Tz45KPwQ1i3hLXG6Mh1NVBwsXUnRg708Ak2/DyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0c947418-9551-c5cc-7fa3-8569f08d4c25@amd.com>
Date: Thu, 4 May 2023 09:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 03/12] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-4-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230428175543.11902-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT044:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 80876131-7851-4e06-7add-08db4c71694f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z222BoF3KjJwJw1ysBbUfXFxGGWFDJ4lUjajOyxc5UjbCOmkYJWFcyz/qm75hpYbOIH2EBU1lhsbchWOLuslSCc6vYzZfTO5UjAB8Ya/ODsPOsr2eyi3qZlz5LZjbvml65If25KStByTtjswvvnFdRLWT7xu3fqWUrtadZUhoBPBpenQ8xN1CCNnHOdedUx1zhRMczociE0ueTj6yvb76OzhxfgqpWl46NJVdUFYzDxeGOopKDHaj6UcJlZZz8CPMlJDDOm7r7IvtCCdz5wT55KyAG1SseXceSpvft3sH1Nl8NjaCKao4XzzKcZHztRIwciAAlCW5ahtW/C1BO3wJZWZ4zgT05OICD38Z7wa3Q3QfhKYUTzPhW8tLvArn6SpURpKOnTgFb64ns41n42fM/9OY2CxgY6IqEvjxAHqJarHwP9qZsgbryWjsIm6OxlBBjzGK5YMwPEY5SUeNF8kb8Z+Q2fS+rvS/1CqmSWe1genr20vSMAT7mv7UFsko1vuN17MgBWMB7ZxlDBDTJJ/kM62bZB0CkK1MugMWx/xZmOgH/Yl66ejjFPJhzUIA3HmFDaa73q5Hrddt0uO32XYAdBWuEs48Y/8kbesPCP0IdfUq6kpxlz9TrkYNhx95vzVkeV6SVaTl3DJ5W7/TdbTJNcH98E8vE7QFyWr/QwM5kGK2VJ6qwC8jylkZRdXZmlQjApi3HAphAS4A44xUq7XT8v3RCgFnqBWu/d7gvCAy1M5Y9Ee8eSb+J/EqL5FuKV3pyaqjrl0OrNEAUC7j2QOSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(4326008)(70586007)(426003)(336012)(70206006)(53546011)(26005)(186003)(110136005)(2906002)(54906003)(16576012)(31686004)(478600001)(40460700003)(2616005)(81166007)(82740400003)(356005)(8676002)(8936002)(40480700001)(44832011)(31696002)(6666004)(86362001)(41300700001)(82310400005)(7416002)(5660300002)(47076005)(316002)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:30:18.4107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80876131-7851-4e06-7add-08db4c71694f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679


On 28/04/2023 19:55, Ayan Kumar Halder wrote:
> 
> 
> dt_device_get_address() can accept uint64_t only for address and size.
> However, the address/size denotes physical addresses. Thus, they should
> be represented by 'paddr_t'.
> Consequently, we introduce a wrapper for dt_device_get_address() ie
> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
> invokes dt_device_get_address() after converting address/size to
> uint64_t.
> 
> The reason for introducing this is that in future 'paddr_t' may not
> always be 64-bit. Thus, we need an explicit wrapper to do the type
> conversion and return an error in case of truncation.
> 
> With this, callers can now invoke dt_device_get_paddr().
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7b..2163cf26d0 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -955,6 +955,45 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
>      return 0;
>  }
> 
> +int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
> +                        paddr_t *addr, paddr_t *size)
> +{
> +    uint64_t dt_addr, dt_size;
> +    int ret;
> +
> +    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
> +    if ( ret )
> +        return ret;
> +
> +    if ( !addr )
Because of this ...

> +        return -EINVAL;
> +
> +    if ( addr )
you should drop this.

> +    {
> +        if ( dt_addr != (paddr_t)dt_addr )
> +        {
> +            printk("Error: Physical address 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
> +                   dt_addr, dev->name, sizeof(paddr_t));
> +            return -ERANGE;
> +        }
> +
> +        *addr = dt_addr;
> +    }
> +
> +    if ( size )
> +    {
> +        if ( dt_size != (paddr_t)dt_size )
> +        {
> +            printk("Error: Physical size 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
> +                   dt_size, dev->name, sizeof(paddr_t));
> +            return -ERANGE;
> +        }
> +
> +        *size = dt_size;
> +    }
> +
> +    return ret;
> +}
> 
>  int dt_for_each_range(const struct dt_device_node *dev,
>                        int (*cb)(const struct dt_device_node *,
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 5f8f61aec8..ce25b89c4b 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -585,6 +585,19 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>   */
>  const struct dt_device_node *dt_get_parent(const struct dt_device_node *node);
> 
> +/**
> + * dt_device_get_paddr - Resolve an address for a device
> + * @device: the device whose address is to be resolved
> + * @index: index of the address to resolve
> + * @addr: address filled by this function
> + * @size: size filled by this function
> + *
> + * This function resolves an address, walking the tree, for a give
s/give/given

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

