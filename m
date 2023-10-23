Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA227D2D80
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621099.967171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqnW-0001MW-S7; Mon, 23 Oct 2023 09:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621099.967171; Mon, 23 Oct 2023 09:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqnW-0001JD-P0; Mon, 23 Oct 2023 09:00:30 +0000
Received: by outflank-mailman (input) for mailman id 621099;
 Mon, 23 Oct 2023 09:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDcF=GF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1quqnV-0001Iq-VE
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:00:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e89::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bd2193b-7182-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:00:28 +0200 (CEST)
Received: from SA9PR13CA0064.namprd13.prod.outlook.com (2603:10b6:806:23::9)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 09:00:24 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::ab) by SA9PR13CA0064.outlook.office365.com
 (2603:10b6:806:23::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.15 via Frontend
 Transport; Mon, 23 Oct 2023 09:00:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 09:00:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 04:00:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 04:00:21 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 23 Oct 2023 04:00:02 -0500
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
X-Inumbo-ID: 9bd2193b-7182-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJJMWTnWnmwG4SzJqi/tcWf0c2UtWljQyYtPqIvgb44Q5FQvy2bYmak3Hx2SYOLCoubQ160KV4ZJKix8SJyrMaBLJz6ZS4xfX6ariaK0yOKEgc126Fw4VRv+ZhPC1HyVJBptPKKOAZ5/7hjJwUqmn8ZjL+7JOUxCzXLtfxr6Kc3aTIDgbGYtN+JuVgo7WvWm5eUt4I8OQfUC4wCRs1ZueY1cPDXqRKHvF2vrvd9SltzKxFiV56HcqZG4FkpP1Jj1yvkvXoB7lbMbGo/msOiSXGDBzXrcGcZpb6yyUw9fvO3o7ofWg/sWeNl3XQy2HOLcDx4WpewFFaHSTIWqZbe75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vube39Ka9BVyhP1vz/u0gAMi5EPqVvIMArcc279spGU=;
 b=iZ6AmanI2oRTmbXsk40KR1qUUBqgGC3a5CrTQM2jgFkdazcuwA1KqpuO0cPE/2R9j9jE0EqcWwpbifVAi25sU5yFT9rSsOe5U8u7SqRlOt5bLdqZ6SL5JPVF+v4kVZEAUHyEQbMWZFzd+bC8QF25xRcUiKXj7lkk7SXohxZ5XhJZcumeQAU89Ia3DwRl/nmxfL7RYCdCu73lyukUuwYjEoRL+MLLIJYi9iSy3wr7qjHwvRAx1CSJ9oKKjA3Rik6SyY9srZE5xmiaVeSMvf1Yw+nTOT4sJDuTb52tNHmvMFE/FDbFb7JEExPnwcOY5qvsFvUy3mev+HHNO1TFhi29ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vube39Ka9BVyhP1vz/u0gAMi5EPqVvIMArcc279spGU=;
 b=xSL15XF3ydUwBkOxxSi150wagpouNMPPubtvQm7B+aPFTps3m2yJnDhCCjdBd5/RSrVtUgeHkbh5mc8qmzqyAgKKtSVzswZJbaeIFLeXF+wiJaVUCG+5HRC1OGRbjZClC1Cq2TSOll8delIXJP4MjJtK2ZILJNtRN8yy9/yhd8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <755bb8c6-d386-405a-a825-34a0d5ba3816@amd.com>
Date: Mon, 23 Oct 2023 11:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] xen/arm: don't pass iommu properties to hwdom for
 iommu-map
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-2-stewart.hildebrand@amd.com>
 <31cdf500-959d-42cb-a1ce-bbee7cb5e251@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <31cdf500-959d-42cb-a1ce-bbee7cb5e251@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: b18a71d3-4bd0-4d01-3a91-08dbd3a67e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e9WRo3HxNaisn9i9xPRasKCRZ3YO/5GfY7tZ076eaHmPCAoN7AHaaNotdxHB+bZkwCG8TlUhw4Rdsz+yGHxKfhIr2AtbrgZi7PJ0RiLQWKY76a9yNM5GMC8o6wgWbX6D2KQXDha0+RRmIHz1QKerArFyM0lV8OWiTGpYCNMlWxypLTLgVv71D5dChj3Y5vRkyVx2EyOGjD2cdtvfwJjGQ45FPSH4aM9QspEvjD1PgwoNnLtjAobiD4B+zL/ehMqMu9C+YPlRPfQ1QFTr+LCTiEfi33+OPzGOCbeBr1HUNAudtWFl94y8KEG6VUImGH+QlhpGb3IQgfzy37c+rcVAZHEmBCQHGJUbk+v3jYAhyuse6kQxB8qwD+F7iP3bxi0n74uPhODhfoX4BLdc7eRdmBh1N1UPejeSnKQbgV7MyE7kQpUUSp/kWgOTYyRPc78YrUujpYA9XkQLpilF/uNZ4J1B3JcNrMwVyOlSdLqqJRvPu3yuMeHOON0DHSduuZE0aP1+pfbPzEJ1J2mFsvahD0rZfipa8gros73s22QkHmRLe708BrRbCv7fxMDAAsWnPc5oK0qyWHlqM1HlIt0KfOo8oUDr5Ni0k8nTgughV1cSLP0YDD4GcuQAdEqWeyPvPlljyLrPm1Td2Ry8LsRIqRi6Vt6Dkzedu1fa+XPPxfLQK7dQIWToIUDmHf1qHV1buwHpAc5sfTX+FhBGOOszsktqV8HyKEC0AWlxvu4SZplYDsEbP4sPYo0HAKYQLwcRPi/ZVNRLQD9iKrbyju+VWDiMY9t25AB5ffZEyWl/wPw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(356005)(81166007)(40480700001)(82740400003)(5660300002)(316002)(54906003)(16576012)(53546011)(478600001)(336012)(426003)(41300700001)(2616005)(26005)(4326008)(44832011)(8676002)(8936002)(70206006)(70586007)(110136005)(966005)(36860700001)(2906002)(47076005)(31696002)(86362001)(36756003)(31686004)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 09:00:23.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18a71d3-4bd0-4d01-3a91-08dbd3a67e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318

Hi,

On 20/10/2023 20:48, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 04/10/2023 15:55, Stewart Hildebrand wrote:
>> A device tree node for a PCIe root controller may have an iommu-map property [1]
>> with a phandle reference to the SMMU node, but not necessarily an iommus
>> property. In this case, we want to treat it the same as we currently handle
>> devices with an iommus property: don't pass the iommu related properties to
>> hwdom.
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
>>
>> Reported-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>> v4->v5:
>> * new patch
>> ---
>>   xen/arch/arm/domain_build.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 24c9019cc43c..7da254709d17 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1135,6 +1135,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>        * should be skipped.
>>        */
>>       iommu_node = dt_parse_phandle(node, "iommus", 0);
>> +    if ( !iommu_node )
>> +        iommu_node = dt_parse_phandle(node, "iommu-map", 1);
>>       if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
>>           iommu_node = NULL;
> 
> I was looking at the history to understand why we decided to not always
> hide the properties.
> 
> AFAICT, this was mainly to avoid removing the master properties but
> keeping the IOMMU nodes in the DT. However, in reality, I don't expect
> the IOMMU to function properly in dom0 (in particular when grants are
> used for DMA).
> 
> Looking at the bindings, it turns out that all the IOMMU using the
> generic bindigns would contain the property #iommu-cells. So we could
> remove any device with such property.
> 
> This would not work for IOMMU bindings not using the generic one. AFAIK,
> this is only legacy SMMUv{1,2} binding so we could filter them by
> compatible.
> 
> With that we would unconditionally remove the properties iommu-* and
> avoid increasing the complexity.
> 
> Any thoughts?
I think it is a good idea to skip all IOMMU nodes and properties and not only the ones
recognized by Xen. I realized that it may have an impact on Rahul's RFC vSMMU series
but I checked the patches and impact is negligible. As for supporting legacy bindings, I think
we would be good if we search for #iommu-cells || mmu-masters.

~Michal

