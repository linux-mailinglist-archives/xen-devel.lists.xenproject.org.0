Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1E6F802B
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 11:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530275.825805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1purtw-0004pB-R5; Fri, 05 May 2023 09:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530275.825805; Fri, 05 May 2023 09:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1purtw-0004m4-Nt; Fri, 05 May 2023 09:38:56 +0000
Received: by outflank-mailman (input) for mailman id 530275;
 Fri, 05 May 2023 09:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBOj=A2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1purtv-0004lV-1j
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 09:38:55 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a385b987-eb28-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 11:38:51 +0200 (CEST)
Received: from BY3PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:254::7)
 by DM4PR12MB6376.namprd12.prod.outlook.com (2603:10b6:8:a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 09:38:45 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:254:cafe::6b) by BY3PR05CA0002.outlook.office365.com
 (2603:10b6:a03:254::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.12 via Frontend
 Transport; Fri, 5 May 2023 09:38:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.27 via Frontend Transport; Fri, 5 May 2023 09:38:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 5 May
 2023 04:38:44 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 5 May 2023 04:38:43 -0500
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
X-Inumbo-ID: a385b987-eb28-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR6gtOXpoC57t0HCacBTkIHeDuFNTDtoOhiwMl1S0NB31Zn4mX3CMYIMp3JlhZ6GZlNDSfmvUyKUDonfMSg5LB8gQTnU8pILRCSPP5q/JpAI6LSW61NDAlmPvzBq7jFAXPHS+9EA+lVodYp7rkfT0tl0TN/gpwbyo9Vkn6A7D6iCihd7Q1+3/B9wMEbc3dTwDw87bri34AKT3TAxriEV0NRchR7RqJPDsVN62U+Iwt3/u0AmSrXA+8VEnG8oa+fLlzlwOZzc0ye2PIGguv7zgiqK+vyBqZ8BF4pDCRARUoqL5PFDPJ1Xn1nW6HjaNcH9LZp9CDCbEJNFpTrBDYYrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPitrE6wIpj4ueq7bKbBJIHgmndspWRUr4v1ZWtVluk=;
 b=ExaaTXL4SpZi/s7k8WmlxbtcM+xaJ3E4uIM8krilBukWqac2/7SPRCVLgFah8oK17zgwZ0Bq6rtDRbVSU0A+QBCHL5Q9a+PQbpLgfPeOTREPg4Ij9OqKT6HOPaKm7x5aTZdLlf2l0lmuOMF5G0z+p3non15qqLzK4macH6rgoNeTDBIliX1U24v0L00WjcUKv7hXdTUYOYcG8dv9t7G9qC2HIPGK7JE565XvUSAWhCD4tQB2+icVBMICMQELgQccG+jvRlQSHinxCem4uS123J2kMzlmz96Vl8Sv9BE2KQiMsgSvnbGN6+KLUUjHw+6f/1ezzWqB2NS3C1R1Wfz61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPitrE6wIpj4ueq7bKbBJIHgmndspWRUr4v1ZWtVluk=;
 b=QeekNrC1mQiY24zng4JUAsFn8nqY9QayZPQ5ESW+7cVzwnSZLdhqmKsBi4sMDyTK45qdDFjyhnj/+0GCT0iP3ECkcaRXUu4m1GMAEaYTU4Oh843af9pwsJoSyvDfAhseETinGFPb7OKTI1vS0aNmx5zXSEmmkF8IfoWuYOfTrus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <57937e19-e038-b36a-73aa-c2a95de7e525@amd.com>
Date: Fri, 5 May 2023 11:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 02/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230502233650.20121-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT019:EE_|DM4PR12MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: bb878aa9-5058-4563-07c8-08db4d4c8508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCaqO0KGybFwAdbjNwSE4DwJym2jIDSrvKBT+IDReINK/ahz6pTHvxsN9DVQsmuf5G34Sks9al3IQYKb4PqjswFhddO74zRPiP6guhuKnsCtskWB/sSmxLCSYIztGUCvn4r/r5y5TurnkJLr0x5qinHmxzBhhsHDp+ezCW+AezkEdn7QLCeazMTD2MtIfi/wBItuac+Hq8BqtVsx6RVRwiKidu1eiWUVjDbpqP8NQS0Pzdw0XFqcw9haP26cKfQsa+pCyeaH0QO4RmozFgEVJR9Otdr/HfUlyd+orhkpvaGXbgp7QYW9rZLtlWqvm8I5Vy7AEnpPtrUyRpQCybZzEwJFUXiyv/csrNmWImdH2aWiUoeyoAngYqyePKVs870+DkmJrGPxOerxLKO7oLdT5nMKiW5+p8ACpp2bHPgG6l2Tu9vLH/eADI/ekNAEKms6YtCaeQW2BJiZ+DO0XZF0bfpxM8Stxhqtl+2bz8V7eHms5EBiwH6Hhy8aVRnhczpazonKRh0YJkCKWsCuD49KH7zIli+ptIEVS3y1UMfkhqXPMUiMozzQHaXEP3myJqk9ZdUgjDCW24SDsB3s1MlOqRrArseX7YNJVMM+GtinBHX+/7SdWE+FcvosnhbEKipBMrqpZ7vQ+PCnFbCK09K2paPThrLPCklJiRkVlGbeo8sBOzcb7mKdRy33Ii2Nfvltri7sVWtBk/jnqWa6QLA7/6vvqlIKyrAKvOAFmxywKI1TLHKB4L0hLE2FcpYFPlxT1jvtG6qahS/vHj+TVso+9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(47076005)(83380400001)(2616005)(336012)(426003)(40460700003)(186003)(2906002)(40480700001)(36756003)(82310400005)(86362001)(31696002)(82740400003)(81166007)(356005)(36860700001)(41300700001)(8936002)(8676002)(5660300002)(44832011)(4326008)(70206006)(70586007)(316002)(478600001)(31686004)(53546011)(26005)(16576012)(110136005)(54906003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 09:38:44.7025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb878aa9-5058-4563-07c8-08db4d4c8508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6376


On 03/05/2023 01:36, Vikram Garhwal wrote:
> 
> 
> Change __unflatten_device_tree() return type to integer so it can propagate
> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
> memory allocation failure during boot.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
I think we are missing a Fixes tag.

> ---
>  xen/common/device_tree.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 5f7ae45304..fc38a0b3dd 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2056,8 +2056,8 @@ static unsigned long unflatten_dt_node(const void *fdt,
>   * @fdt: The fdt to expand
>   * @mynodes: The device_node tree created by the call
>   */
> -static void __init __unflatten_device_tree(const void *fdt,
> -                                           struct dt_device_node **mynodes)
> +static int __init __unflatten_device_tree(const void *fdt,
> +                                          struct dt_device_node **mynodes)
>  {
>      unsigned long start, mem, size;
>      struct dt_device_node **allnextp = mynodes;
> @@ -2078,6 +2078,8 @@ static void __init __unflatten_device_tree(const void *fdt,
> 
>      /* Allocate memory for the expanded device tree */
>      mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
> +    if ( !mem )
> +        return -ENOMEM;
> 
>      ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
> 
> @@ -2095,6 +2097,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>      *allnextp = NULL;
> 
>      dt_dprintk(" <- unflatten_device_tree()\n");
> +
> +    return 0;
>  }
> 
>  static void dt_alias_add(struct dt_alias_prop *ap,
> @@ -2179,7 +2183,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
> 
>  void __init dt_unflatten_host_device_tree(void)
>  {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
NIT: there should be a blank line between definitions and rest of the code

> +    if ( error )
> +        panic("__unflatten_device_tree failed with error %d\n", error);
> +
>      dt_alias_scan();
>  }
> 
> --
> 2.17.1
> 
> 

FWICS, patches 2 and 4 are not strictly related to DTBO and are fixing issues
and propagating errors which is always good. Therefore by moving them to the start
of the series, they could be merged right away reducing the number of patches to review.
At the moment, they can't be because patch 3 placed in-between is strictly related to the series.

@julien?

~Michal


