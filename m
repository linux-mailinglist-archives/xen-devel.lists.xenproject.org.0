Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C276408C3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452058.709879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17M0-0005Us-7r; Fri, 02 Dec 2022 14:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452058.709879; Fri, 02 Dec 2022 14:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17M0-0005SL-4A; Fri, 02 Dec 2022 14:49:28 +0000
Received: by outflank-mailman (input) for mailman id 452058;
 Fri, 02 Dec 2022 14:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC9X=4A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p17Ly-0005SF-N4
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:49:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 822a15bc-7250-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 15:49:23 +0100 (CET)
Received: from DS7PR03CA0266.namprd03.prod.outlook.com (2603:10b6:5:3b3::31)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 14:49:20 +0000
Received: from DS1PEPF0000E64C.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::f0) by DS7PR03CA0266.outlook.office365.com
 (2603:10b6:5:3b3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 14:49:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64C.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 14:49:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 08:49:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 08:49:17 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Dec 2022 08:49:16 -0600
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
X-Inumbo-ID: 822a15bc-7250-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2qjx4jsigROle6nYzX8UCqv2/ydHea0hJFz/cSdNdyuDgEpdl31rI1psAjUZ/am9VRuf3/wm3UVWtV4P9Sh/L89rTO+ER1QjcynRPSZ1tpxJgHReBjTLlgpxzzI1nH7pXp0yovPP4tvxwR5MHGCrDkuY0bvD3XcDDdj7piLrHXaCgm95V5VaU/HrHRaOrrW17MDICvw9B4gFYbye39myaqU04ArbWlO9kqjgWyjPVFapm/3MRFrDdIiNTPpjULn0RAWfVaI4+ubL5umkD+mEXBYOSDLdqVDip3TvfVCLmwx4d+oOKbW2seA9qX81h6Tb7gnkE3LO6vCimx7s13mAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4pOKOEfP6FBR6fBVQNAbtjElKPPEKFpz84xFOABCAs=;
 b=Q9o5b4zh+LorPzNa2+/wsYOVXwe3ESpP0beHjfNsgKUkHsBk/a/5DQ6gYlaY1mHenGeOUHLIj1JEbBd3t5QlTtU4Cc7EyK8lPa4NRtRXB/efiixqURs19ZLZgCBr8dP3llf3w5WfT11ocOLGyJEo3/jTX0whroJ0mDtUzk2dZFZ20ysyqlWOD/erobt9kFrVnpFB+EoGoOrDgVLwaJYWxC2aiv0Nx/yNLayioPIEeUGqJ+rQbGumf0EFTWTwRKrPiVqxx1ZJzC4VeBjjC44dhlKLSIjQF/TYPZzrdR3+feu7A/thRfZpNHchWzqrG2pHI8xOEGdDbaIvczq4IuOBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4pOKOEfP6FBR6fBVQNAbtjElKPPEKFpz84xFOABCAs=;
 b=wzuc0GdjuT3IyOhKhc9fRwhnPaHNQds6X1pF+xsTBfsYom0jn6MdTno73QVkxy6AVQBKUisNCbjjNW1LRj34KF6k1qbjr9oDRTzuHEERpLplPlQwbmLqfNBNsPdrM4ahoTyV3LoxnrS3K3gkEPGeqzMPzbuwa3heSpLWR3gJqFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c4abb3b5-a6a7-2af1-08d5-4f3a6695d69a@amd.com>
Date: Fri, 2 Dec 2022 15:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 21/21] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <127da5a0d4300e083b8840a4f3a0d2d63bde5b6f.1669888522.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <127da5a0d4300e083b8840a4f3a0d2d63bde5b6f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64C:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa66ce6-125e-422a-0500-08dad474649b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0WCpBtdz0mLfB7Daj3wm4wzzci1sJWoU892CEpavZaNo7riGZo5M7xnVHxwna7u8rDCkVfbxUFsUmDVcGapzZiaF45duXxxeNV1AcviGJT1GEhU2TodE2gzYhfkgrRDBN5RDM8mVVkDlZtaUyFsbrsEs5hfD/X49R2ySF98LtNAtrP7TrDRcTvH2Mwq8tRy+EFi2K7AT4iG9ktCBJFgHg3U358pef0TTJdXEDcw3txqMcwNOH3G6E99bOtwy1t7zC/IbGGw6QKZt94nn2EJ72lGUtc8Pj6A8N5CsTEeDa57ltSl5XuqbcZyGjiih2Gg4STC0tvPw8yJYZQJMGfK4s9n/vzInZB6ZnyWCG/SVGAZnZn43pnQpoZ33CDB73L1ZvvDKoFJTNwcRTAKbkay7Swp3mpW5yLJIXfB1eUOwnTSwSgcmMIkKxVotiA1o5Rp+t83E9MEgbGJv7dlrkxyGhvE5QzjaQdT6fLUQJm92Lc46UqPIi+0JnVH8z96/MkB8aE3HgGDOaeZwvOS/7R9kVlzAjTQgK0cZrtz8XYYOBgWksigZMwziVwAzDBJQlTkhd/0zf/dppIhoMAw/Tfl68NCObwhFo5qIVKD9ru68OT6um0FFDQSMVEeYA44KuUOZjiGCN5s0III2FUTsNQh+hs5WD9pf1696YHh3dpzGTlkRA90G1pplBLXbDKjt+nKqIlSv0aV10/T9K2ynEuwq243W/R9nsU8KMQ8GSmskF62Kd9Zh/EdL7udRUB5CGFZYaXJ+YGoxYhSh9iDv22fUNEDFh2pgUwVy98INqt9MWSA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(70206006)(40480700001)(53546011)(82310400005)(36756003)(82740400003)(478600001)(40460700003)(70586007)(356005)(8676002)(26005)(81166007)(54906003)(336012)(316002)(4326008)(86362001)(16576012)(44832011)(110136005)(8936002)(47076005)(5660300002)(41300700001)(426003)(186003)(31696002)(2616005)(31686004)(83380400001)(2906002)(36860700001)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 14:49:19.3022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa66ce6-125e-422a-0500-08dad474649b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> To configure IOMMU in guest for passthrough devices, user will need to
> copy the unmodified "iommus" property from host device tree to partial
> device tree. To enable the dom0 linux kernel to confiure the IOMMU
> correctly replace the phandle in partial device tree with virtual
> IOMMU phandle when "iommus" property is set.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7cd99a6771..afb3e76409 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3235,7 +3235,35 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>      return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>  }
> 
> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
> +static void modify_pfdt_node(void *pfdt, int nodeoff)
> +{
> +    int proplen, i, rc;
> +    const fdt32_t *prop;
> +    fdt32_t *prop_c;
> +
> +    prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
> +    if ( !prop )
> +        return;
> +
> +    prop_c = xzalloc_bytes(proplen);
> +
> +    for ( i = 0; i < proplen / 8; ++i )
> +    {
> +        prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> +        prop_c[i * 2 + 1] = prop[i * 2 + 1];
> +    }
> +
> +    rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> +    if ( rc )
> +    {
> +        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT");
> +        return;
> +    }
> +
> +    return;
> +}
> +
> +static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>                                   int nodeoff,
>                                   uint32_t address_cells, uint32_t size_cells,
>                                   bool scan_passthrough_prop)
> @@ -3261,6 +3289,7 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>      node_next = fdt_first_subnode(pfdt, nodeoff);
>      while ( node_next > 0 )
>      {
> +        modify_pfdt_node(pfdt, node_next);
You do not protect this call in any way and there is no check inside it whether viommu is enabled or not.
This means that even with viommu disabled, if a user copies the iommus property to partial dtb
(which is understandable as the flow is to copy almost everything), you will perform the phandle replacement.
I do not think we should do that (no need for an extra code).

>          scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>                         scan_passthrough_prop);
>          node_next = fdt_next_subnode(pfdt, node_next);
> --
> 2.25.1
> 
> 

~Michal


