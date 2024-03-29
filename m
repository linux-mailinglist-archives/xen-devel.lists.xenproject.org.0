Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29987891317
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 06:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699239.1091963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq4Wp-0002jh-Nk; Fri, 29 Mar 2024 05:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699239.1091963; Fri, 29 Mar 2024 05:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq4Wp-0002gy-Kv; Fri, 29 Mar 2024 05:11:47 +0000
Received: by outflank-mailman (input) for mailman id 699239;
 Fri, 29 Mar 2024 05:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rRkc=LD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rq4Wo-0002gs-09
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 05:11:46 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4904925-ed8a-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 06:11:43 +0100 (CET)
Received: from DS7PR06CA0007.namprd06.prod.outlook.com (2603:10b6:8:2a::25) by
 SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 05:11:39 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::5f) by DS7PR06CA0007.outlook.office365.com
 (2603:10b6:8:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40 via Frontend
 Transport; Fri, 29 Mar 2024 05:11:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 29 Mar 2024 05:11:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 29 Mar
 2024 00:11:38 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 00:11:36 -0500
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
X-Inumbo-ID: d4904925-ed8a-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYOJoTKfmJEVvdXpIzRlr8oS675lSe6INAgk5mM4X54ltLXpA122OQ0/3m/uOtVjM7aczJsir9kYYWGqlDi0kpOAf3M+GH06lL9XiJsMgJGnykuGC7KzGvrADIsd+gUtql42gvHW0bweqrPablzwy2mQxBX2nWnFJrc7Kt1ezNYVZYC7tMU4XbUJQTguxn3kBnC0UmP+dfVSOZ1nM+KPrgjlSYPD8MOoNPrILUQQgLkE5nP06IJGuPmvxYg7ktWjEmpIbp+2A4jpG8W8cfhD9i3mLGN3CgakO/j7/P7sdZ7H8kD0kD9b7xv7A4lfIVMibp2Ks407urN31c8cHIM+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7+PLlvFg7Nofnqolse5PAMGywO21EmhjtEznZSwR/k=;
 b=LdoBlqHx0v06WsDYLg9UIaHYXxQA0+Gx1xRTfmoYNTKRW4gxAwlTp/d7SSE2BOkbi0DRPp8O7jh1FvsDRicMII8FbpJnx499+GxBJhdWYm1xoDoNVuc+juN8mbKYlhkDzuLSnG1UHNyrdncBoq2qVYN6qQrStyHgKkYFD5trCekncPdhN+YdPKYmZE0NzegFmtI3I2cPaqTy4bb5V23/ho92jqm4SpMetfA1qYYdc1LhhWK6suksUdKLYj9RqTsf1Mezcd2QFH7YsJhJhG2ie2fIhfbT8FxtwoYlY1dQRSbrVo/86TJwV1tjyzcsTRtLoEqXWMnJhC3xGIerW4MsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7+PLlvFg7Nofnqolse5PAMGywO21EmhjtEznZSwR/k=;
 b=akWXY2t/xV//zjmHHuguKcDQ5kDNdg7N+lEiAeSyp8jkhcMky/4cV36oQOgogHM6p91+UfyMK8lyKruTv7nOQpB75OtZfPq1oA4I6WW2cbgLhM4+KhM6xHs1kGgli2tZp751DuReQa8nTl2jQnRSQfiN/GyI83qQrrUI8QLs648=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b1393dbe-42c2-4839-8ca3-7dc71fe72969@amd.com>
Date: Fri, 29 Mar 2024 13:11:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: f3896863-f3fa-4785-74aa-08dc4faeb744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Nh55+o7ZpOuk+htNxWGX5YpEloMrP03KT2ig2dlDsdsUPWi37T2LO7bIoqqudPVvyhEDU5HNglJwdUznxNeGBpan9PY7GnXIbeScILXfJXEMhtcH1FChlTYjnlhZOwqFSKIDRCaEJv9CiNXUsYnJACZwi7YcjrpZywPGs5+IJbwTxzs4s919+64kEdiYSw8MQUTFl6YMq08js+tZUPZ0SWm8kFuIxeqk3vmXpqTjR4t/rcpHOSeHm7KSjOtL8cAbJouD4sfFRyMlqjKVhUyH4QCnK4TdQ4zNTvVgmlp+aPaFG2HJ5E9VXZuqhDsplMf2vf48QXj4iU0MhvKLz9XzegxIhv52Wsn62L9i/HYoIgPyx24gFvlbq5gGYAYEDWrh8d+rxMDCxhfofrrVxkXSB6RtPPDGc6ldJaEZ8IilHMbKbo0lb5gla/plh3P4Elzs91N9T/cQ8k5zgNlaaPRAkmLuGFJXsFgtwzvlPqdSTHMVfKv70bdoRTmTEPZZ/F+HlsxG045YgYyuhY38lXO3dXybf1hcrb7v5VjSAPMsElcsxQsgSyRd+RKOeXHZnsWbwcqgCrndKiM6NsNZF8OS7Ji4dtO9FdoV6e7JpAo0+AFO2iud8CUq5VVv32+Og68dQ9eM7GgFOlpt+UvIK8qS1OuM7sFOutPXZgLmp2DZA42oB5Lk/9yp9HVy6MVJo8D/jfbZCaNewm0pR6CTbwA/LS3em4YEsyELFu17gU1uwrpm5X85vpP1cgfE9yEOxuf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 05:11:39.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3896863-f3fa-4785-74aa-08dc4faeb744
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026

Hi Jan,

On 3/12/2024 1:07 AM, Jan Beulich wrote:
>> +/*
>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>> + * or static allocation.
>> + */
>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>   #endif
> If this is for populate_physmap only, then other sub-ops need to reject
> its use.
>
> I have to admit I'm a little wary of allocating another flag here and ...
>
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -205,6 +205,8 @@ struct npfec {
>>   #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>   #define _MEMF_no_scrub    8
>>   #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>> +#define _MEMF_force_heap_alloc 9
>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>   #define _MEMF_node        16
>>   #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>   #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
> ... here - we don't have that many left. Since other sub-ops aren't
> intended to support this flag, did you consider adding another (perhaps
> even arch-specific) sub-op instead?

While revisiting this comment when trying to come up with a V3, I 
realized adding a sub-op here in the same level as 
XENMEM_populate_physmap will basically duplicate the function 
populate_physmap() with just the "else" (the non-1:1 allocation) part, 
also a similar xc_domain_populate_physmap_exact() & co will be needed 
from the toolstack side to call the new sub-op. So I am having the 
concern of the duplication of code and not sure if I understand you 
correctly. Would you please elaborate a bit more or clarify if I 
understand you correctly? Thanks!

Kind regards,
Henry

> Jan


