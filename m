Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C699460687A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427048.675888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olafq-00059c-Nz; Thu, 20 Oct 2022 18:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427048.675888; Thu, 20 Oct 2022 18:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olafq-00057p-LE; Thu, 20 Oct 2022 18:53:46 +0000
Received: by outflank-mailman (input) for mailman id 427048;
 Thu, 20 Oct 2022 18:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bBSw=2V=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1olafo-00057j-W0
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:53:45 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e9b07a-50a8-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 20:53:41 +0200 (CEST)
Received: from BL1PR13CA0295.namprd13.prod.outlook.com (2603:10b6:208:2bc::30)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 18:53:38 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::4f) by BL1PR13CA0295.outlook.office365.com
 (2603:10b6:208:2bc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.18 via Frontend
 Transport; Thu, 20 Oct 2022 18:53:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 18:53:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 13:53:37 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 20 Oct 2022 13:53:36 -0500
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
X-Inumbo-ID: 83e9b07a-50a8-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2Vu9Iw0pk+XceZ0sTl7qjHHNx27+ulSPnPeIWL7RvJPXPAUls9edEDEdVPcbaouOKarXB/DccbbwmDET7Yc9QGe8Nv4SWxypLRSPPzpQYBAbghxCguziWATpVPO/mzuZkvhILYvnZNYJEKtt31ucLPqXHpC91jAwYenbkCBb69ajDu8dgUCbjPqenN47jz8uo6xdzHibxED0OQxapm3Gwknu9KdzNyocZ1El3aVAxLHI3ISYk5orLg5PZv/XuKJig5d8ikpvAzmlM+Dx2gG5LxgySR6EL/gsA1IVXvfzA+x1Fnbbl1eTJuTcvkp49n5wfOvx/x99vofDRCrc63NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY40rWtfgZZEHFVqcwLpqmRZm31oyWIoQcE/PUfLX4k=;
 b=gDyXIOUxT7B881mW33LlOgLznzWT0aUR7w2dQ1NNW/k3mwDu9nWjVXCTcxh0VkizmH6Te6srBXiwT3rOJneZVPpbpYBAu/vuPJMqPIPW6vp9m328y7KlpLr1dl8Iguom0kOcfIrUcvO4dWXfUHG2V4aEVm9hqEB0R4IZ3vgl6fSdk5JqzsB2kJMvy+Kx3OlIPBXiBOMBxTIKE/erbl54taDV3lfFiOQyxb6VI9JaBgNC48ZXweufunVgmm455Kh6LP7/ZKiZW0jEIPlNm31m+icJxxHixq0sm8+to/dxgXUrFGBMlGcd/Dsh/VKBOcSoUI2weie44pDGB/ej0MikpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY40rWtfgZZEHFVqcwLpqmRZm31oyWIoQcE/PUfLX4k=;
 b=pBZln3GPPDBA/3Q51x5pDZQLhTtUx0kAyRxmuuVxptXF3uvLXhZP3T8WHKk0VWgmGssLxkEepCC9rGsdHecQV5+ZDlMJwXlgGkzkYBmmucebYP4qpncaW/fi2V5PMjCmI3j5OExZGtdstLxmSolkF3pTT9XcbISdXjIDVtdgbNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dda3b199-55ac-d557-b934-c070db8a371e@amd.com>
Date: Thu, 20 Oct 2022 14:53:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <20221014200926.15250-1-stewart.hildebrand@amd.com>
 <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8824e6-4051-4327-5aeb-08dab2cc65f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z33Gc6XwL1fyXyl5PSTb77rj6aZxqePrGGZroraPNTXkjLzc0i6vTHx6FZlToR8Ic5F1IgGboaX6aDc9lfey2kWBcTOjumUEl/GjYTdo3iX9xQZ0w2g3zhkBamoAkSNERNt0IJS8p0tGGpJGQ4YVzgSbqyOgSmYoIiJ46c5g7E+nOQ8PAeTX0Rxz9qi68zkNZ9D+td/3s6LU1B4fLPh6GnI+Jtrt/0m3L90osTcPbLmNI+9+KoJOSkZZQG2JuKQOztn+Lenu+hdRDxRzmND1bcJispG1bDi6R+e5jg703/e8ZYgWL8ocRD84kQ4kghB+DRQGckTdxmDC5R8jMbrCpDquztLVl5/XyKZBKsVegVE9HnGIGuMLJWrH8MmN07bLdvXZX3z8ik+GHDOK+TdVlM+7mfGCxFwvP9Vit/pZuBVyD58BVou3Kq2vMtFgV0/uR6//n6lk7/loMSFfeHuTYUm5XuK/+EMeTs0qt5snVsJn5tVld2NnjORbwIWpHfe4ZojVYTGP7FcbvEPM41qJ7K1v0UQsIIPa9/0DzTAVSvgRlYi8PKKS9fgPOuHTfqF+hFPOFFUgsWi+pzKF5QEz68bT2cu8hk/MEkg4drIy1QHzU8+itRRA+qgBjOaeKwaQC5wSiPjL1V15ghklgV3zAXXxRIja1x7S4NHLO0GghLLrO7Ngt8ZjQ4uT8ybdl4eoDjNFMNdsLj41fkCR9BujMcdjEKO0wlTh5+zlLxB4W81AoBTa0/xW0sRGco9ykWaGhBPP9/Vg4iD8wtnGL+fj/fD8CZRRNPLNYlgwQwLjFpOjgGFSW9f/GB3ABcm16lroF5rRTrpQIO27HLmagsszXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(4326008)(5660300002)(2906002)(70206006)(44832011)(54906003)(8676002)(8936002)(70586007)(81166007)(316002)(110136005)(356005)(83380400001)(40480700001)(41300700001)(26005)(82740400003)(16576012)(36860700001)(53546011)(478600001)(86362001)(426003)(47076005)(336012)(82310400005)(186003)(2616005)(40460700003)(31696002)(31686004)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 18:53:37.9593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8824e6-4051-4327-5aeb-08dab2cc65f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

On 10/20/22 14:19, Julien Grall wrote:
> Hi Stewart,

Hi Julien,

> I nearly missed this one because it was threaded under v1. In the
> future, would you be able to send new version in a separate thread? This
> makes easier to track it.

I will keep this in mind for next time.

> On 14/10/2022 21:09, Stewart Hildebrand wrote:
>> All functions in domain_build.c should be marked __init. This was
>> spotted when building the hypervisor with -Og.
>>
>> Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices

I missed parenthesis and quotes around the referenced commit. To keep it in the same format as other Fixes: tags, can you please add during commit (pending release ack)?

>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Henry, this patch is fixing a potential build failure on some compiler
> (at the moment we are relying on the compiler to inline
> handle_linux_pci_domain). AFAIU, the problem was introduced in Xen 4.17.
> Would you be happy if we include it in the release?
> 
> Cheers,
> 
>>
>> ---
>> v1 -> v2:
>>    Add Fixes: tag
>>    Add patch description
>> ---
>>   xen/arch/arm/domain_build.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 61cda8e843..fc2961895b 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1051,8 +1051,8 @@ static void __init assign_static_memory_11(struct domain *d,
>>    * The current heuristic assumes that a device is a host bridge
>>    * if the type is "pci" and then parent type is not "pci".
>>    */
>> -static int handle_linux_pci_domain(struct kernel_info *kinfo,
>> -                                   const struct dt_device_node *node)
>> +static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>> +                                          const struct dt_device_node *node)
>>   {
>>       uint16_t segment;
>>       int res;
> 
> -- 
> Julien Grall

