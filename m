Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE25675168
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481539.746499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInwI-0005eO-Hl; Fri, 20 Jan 2023 09:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481539.746499; Fri, 20 Jan 2023 09:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInwI-0005b5-Eo; Fri, 20 Jan 2023 09:44:02 +0000
Received: by outflank-mailman (input) for mailman id 481539;
 Fri, 20 Jan 2023 09:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pInwG-0005az-Fl
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:44:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f563583d-98a6-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 10:43:57 +0100 (CET)
Received: from BN9PR03CA0311.namprd03.prod.outlook.com (2603:10b6:408:112::16)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 09:43:54 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::64) by BN9PR03CA0311.outlook.office365.com
 (2603:10b6:408:112::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Fri, 20 Jan 2023 09:43:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 09:43:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 03:43:53 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 01:43:53 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 03:43:52 -0600
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
X-Inumbo-ID: f563583d-98a6-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kh4gYoYfOJKpPxNMYIppQhuKQKCY0hsYGqTHor0C8uiYU5xYEjetX/tIqzIerXUqC/EKDP4/kTAlKsrEf4h/0ld1SI/kZLx6rEqXu7lSdm5NqTKDplUYLbKAUZ14K7bCVEg+6u0AyeFz1NGEm/1sngJ0MKv7uktiLwnk5SsGir/LjBkrWznsIBqBC/IlVve+0amnTY15HYcaLBjhQ/TBqaBNSNvF/lwdiAm7BDWVcsUoW49SPdUunwMuyYuERe3oYs5Dw8e+36084Thuds3EvUR+C4zX/krdKlEtvE9Nekb5SqMdX1lGwlrTKP/zU2r4wYt2TydScscIXGKFul2pJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWMcQnwg73M7b3DbzEeTvxUa631JmsT6z26jDjgYwC4=;
 b=dVVi1CNFnzLlVZcmFjQUTwTjFbJ5HZcgbu3ZvHFEOaCoQyPlY2H3GhRqCyOEyAnpbGhJoT5YzJ3lsnbERadwM9MmVR4f4jXWWagTX4lDguDwo6aGpP0E91LUBTEvSia2sm5j1GDPOP2xA+Od820ZveCugsqZpuot4VHAmjANchJr8B2kyFtPgo+xJqmJmTJJV1VgIXnHxdFBgBw0SB0o5qaZbsMKlVhzb5ah9UYkd8j/fn07Rm3mDUGnmJnqf6cOwJE6AwX5OX4YZmcGN7RRwBksX0aSNcR3RZWPACBXTQwdYBsLaUDJqzeJQBoegTUFgccIy+AHTbNqhdne82qzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWMcQnwg73M7b3DbzEeTvxUa631JmsT6z26jDjgYwC4=;
 b=xGS7rbGCZIPo/DRv+6htLOUjVz6r1Uyh7yvaVdSyHhl7PZplW+fXUSO3gtKt8VoDwRf/fhT8gmhU41HCRQDlzx+DhirolsusVBRryNJKsuQSZw5mXEhkbz2/GWYz0LyMrG5hA5sGdpK90HRa/OTr2cggng3rlSfO57R55WusfeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <36821aa0-4e88-57f7-3f8b-35ba0529fabf@amd.com>
Date: Fri, 20 Jan 2023 10:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] xen/arm: Reduce redundant clear root pages when
 teardown p2m
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-2-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230116015820.1269387-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff2dc9e-4aac-4304-4fbd-08dafacad829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7CbRYqm6wF32V0QyMajvvJJkGTcO6sEmI1rJ26PUcHM4CLc6680gk+9UkoV/ku4DS0xBhMG3rwVSJdy06PbGFKjEVnISHoD3Hd9kPMDZLXFxOBSAXjyXS0NOLXofyidXWrH/7qVce95QevVWzkGZfW1/U0S795cVXdUW6LmJTamUWojg+d36TH7VEfkKhbQ9M+XAIPhGSEYujsT649KL0bknM2g3O+HaVpGeVhqIxDNPRrqeAXY15LaXMdWjtcIvOpW7PmGGW+VRLrWw0mdA+t+RF27AJQck0gPwode1Ffdw3nB2zFKsWxpgA2Mt3FLbt5NsykvsyuWC6pOepBlWwUc7VxBUQSutOQ1bptQ4+0c+S61SZ3Jst7g1q4lmxqt3O+Ei7xwJxg655r4n+bJKiX98+OB0lw0Ox29HAafyVMmaYACcmJJ3Yv6phPAdNzXbbGnzplrmAU6j39HC1TQZFdLmSh3Lt5J+YE8fIYxBc6owFIaG1OyOp+zYm0gqsFKI9PM/ikch7aFP88SqFtYYQcPz+rKtbxJNQjZkq3GkONnKaeOmvZgg2XEbmow8ctRKc5qY6eztPkmWYl0qKIwHwuArqC1Q1j9kNk+If4oxhr5JZ24lFu7C/hHMXMF7OaL8N+z3JhBlCNWNU9z/JOt83ni+szvVyMa3M6KyBXC1+CwwImnKS8x03IbtQT9648qHBeTSAxFZ0s8WAAmppY0RkYewGS5u83NHb+eWSfwcXHN7rBr4GmesPRLSnwdjw+3tengtvJKhLNGUghIAAxiHcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(31686004)(82310400005)(36756003)(36860700001)(83380400001)(478600001)(31696002)(44832011)(2906002)(316002)(16576012)(54906003)(40460700003)(82740400003)(41300700001)(110136005)(47076005)(40480700001)(336012)(186003)(26005)(2616005)(53546011)(426003)(4326008)(81166007)(8936002)(86362001)(5660300002)(356005)(8676002)(70206006)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 09:43:54.2801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff2dc9e-4aac-4304-4fbd-08dafacad829
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069

Hi Henry,

On 16/01/2023 02:58, Henry Wang wrote:
> 
> 
> Currently, p2m for a domain will be teardown from two paths:
> (1) The normal path when a domain is destroyed.
> (2) The arch_domain_destroy() in the failure path of domain creation.
> 
> When tearing down p2m from (1), the part to clear and clean the root
> is only needed to do once rather than for every call of p2m_teardown().
> If the p2m teardown is from (2), the clear and clean of the root
> is unnecessary because the domain is not scheduled.
> 
> Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
> do the clear and clean of the root, and move this logic outside of
> p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
> check can be dropped.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> Was: [PATCH v2] xen/arm: Reduce redundant clear root pages when
> teardown p2m. Picked to this series with changes in original v1:
> 1. Introduce a new PROGRESS for p2m_clear_root_pages() to avoid
>    multiple calling when p2m_teardown() is preempted.
> 2. Move p2m_force_tlb_flush_sync() to p2m_clear_root_pages().
> ---
>  xen/arch/arm/domain.c          | 12 ++++++++++++
>  xen/arch/arm/include/asm/p2m.h |  1 +
>  xen/arch/arm/p2m.c             | 34 ++++++++++++++--------------------
>  3 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 99577adb6c..961dab9166 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -959,6 +959,7 @@ enum {
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> +    PROG_p2m_root,
>      PROG_p2m,
>      PROG_p2m_pool,
>      PROG_done,
> @@ -1021,6 +1022,17 @@ int domain_relinquish_resources(struct domain *d)
>          if ( ret )
>              return ret;
> 
> +    PROGRESS(p2m_root):
> +        /*
> +         * We are about to free the intermediate page-tables, so clear the
> +         * root to prevent any walk to use them.
The comment from here...
> +         * The domain will not be scheduled anymore, so in theory we should
> +         * not need to flush the TLBs. Do it for safety purpose.
> +         * Note that all the devices have already been de-assigned. So we don't
> +         * need to flush the IOMMU TLB here.
> +         */
to here does not make a lot of sense in this place and should be moved to p2m_clear_root_pages
where a user can see the call to p2m_force_tlb_flush_sync.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

