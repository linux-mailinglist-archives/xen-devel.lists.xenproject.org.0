Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884177E089B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 19:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627323.978291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyzM6-0003AM-QI; Fri, 03 Nov 2023 18:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627323.978291; Fri, 03 Nov 2023 18:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyzM6-00038h-N3; Fri, 03 Nov 2023 18:57:18 +0000
Received: by outflank-mailman (input) for mailman id 627323;
 Fri, 03 Nov 2023 18:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOuS=GQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qyzM4-00038b-Ne
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 18:57:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caeb077d-7a7a-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 19:57:11 +0100 (CET)
Received: from PH8PR05CA0017.namprd05.prod.outlook.com (2603:10b6:510:2cc::29)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 18:57:07 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6c) by PH8PR05CA0017.outlook.office365.com
 (2603:10b6:510:2cc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Fri, 3 Nov 2023 18:57:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 18:57:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 13:57:05 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 3 Nov 2023 13:57:04 -0500
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
X-Inumbo-ID: caeb077d-7a7a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCgXwkm1x1SbnSUxQlUE5m6i2X/XpIkTRbncLLiVF6B0n6uhPcUK/WVdwNKp/cweMQ/6xn2iRD+IUFbzyzz7Lp0MCicE4nu94pjN6hosqbnrri3nc/YBsqt+FtpH4dvhcNs5bNWSVY6UHWE1JHD4WfQHq2X2KDTGJIH8GEBGXxHmP5Cr7vmBY1KJOH8VnX3dc1wAqY82HpBY5XGBQbn7uNuX9paeOjR9liwnRTs4h0/G+gGPVhl9juPCauvXwh4lsz0DNMsXGkBt/wpiDmZaxfB8hIa30Y+U9wEO6QLsxEkUvXFycT8B9tbeAqNKpW/i+RpLiVvyEx79yjFz5/7sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+oasChRSyY8L4lzZUNHygl3p+RdmafvD9eLNDlUNPU=;
 b=cbUWSQrVBDm8AlcIocXEJLkhG+TEMLVQEZm7jTzCOtZSbcKrzsnQDqBPdulayxhHtKPVzPNsLDhD7en53ZtF61aT4yRswH+x8JygjoZMOrWqYFNWQWrtjb+Z//sk+EItYRrQfXWR/su9md6e/YgLCr+gtbJ5PXTX5iRVCNFzXrMcC88p1crB8eNWCL5KEtlslByg+SBGxCd4K4pXcOTiB+1QEdJDx4e7o1RpiW/21L06KAGwv14iBex1sAg0Av7cIWvUnMQM8WDenQ2wof69YyGO1pHOJxNOYj/X/7vhCbwC5z56a+Ld1ci4Pr37mO7JcB9WOusp6b0FSISDOQVr7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+oasChRSyY8L4lzZUNHygl3p+RdmafvD9eLNDlUNPU=;
 b=Gztp/vgeEsNlet3Cftc+dKgmXYIbCbrMHuj4/QTKvwUsC1HYybj4/T8NHcGVLRdJkNaQHWmdsyWeUxZCSIs7mzqAtP8dxfnRVWma6NYsKuUoaco7AkH5lcv+0CGXNQd4EK5DGq742aKOC1EA9Vrbo1Il9PsqnYwuKIOLT0de4uA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <955bfaeb-eb74-4f48-924e-cb3e290fe6c5@amd.com>
Date: Fri, 3 Nov 2023 14:57:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] iommu/arm: Add iommu_dt_xlate()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-3-stewart.hildebrand@amd.com>
 <31be8fc3-f156-4fd1-9700-2cadbcbec392@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <31be8fc3-f156-4fd1-9700-2cadbcbec392@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da4c009-c0b9-4fc7-b7e9-08dbdc9eacbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6afcpPcO38fa1MembjYXbcrZcEEpa5SjEcwN1nireKVBbNtB5+0nXsG6p5U3Kd6MzBS1REUjhy/7R53tvHF0H1D3rzfnOuL1+aHnW9kvic0S8qQh6Y3OrHjagctqS8xftq74ChAOnAwnX7kUVXh74BubbrVm42iez9wiJ/9zS+c72rtJM1defBQzjM7ZTbIdQTM6Xm2C26iMBPsfNk3VSMn7DeMKoJqKAnX1HqwR+sJheqYa1oP689L/k96fhxgtVVEa1UKxhXs1DtcFqsLU3HKf9lFNMP5PrGSqFt1yCUHXbAHyJ+LA3AJbEZ3n9jIVstxppGye/0mpE9eHGIQ3XJnLeD4CuSH27sb2uwNCfSkvcr6wedRRcMGY4Qb7GXJdtTKqjkFGSmz1VrhqFBfCgv+FZcX3rcUuG44n2fjSe4Io3HpV3Xz2EG/CdivmZxLnNXNCcqJusW+jBvSoCNTzxeEtXaDJVich8MwD/4aYPMrrvZ8EkgqMTgkJxVqrP44oZhkmxr2kwulVae2V1/Ml0E5OQNiJCmTGkYcQFje3X/vM1eG0RaFBTEKfyaEcU+tLZgtEGbhyhISjRixOga4gAUbOph1tb7sNVp6CIx3Ssdajd1z07Te2DXjD1NEDJVg/4VRYO4quYBwOsYnDQcDuwaeH1lYzfqjYyT5+JDP6etxEjJwKC+KR8VUKtX2/hafXYyQwLvV9UIJAo9zRNNryjebKeKe8BadFXoCT4eQYftYd4g4IKiZV+B4sKmcpXuZOThaHJOjneZNJwK7qpqcWxe7uc+TOGjbIhNB3DFr36gg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(26005)(2616005)(478600001)(36860700001)(53546011)(47076005)(336012)(426003)(2906002)(83380400001)(5660300002)(44832011)(41300700001)(966005)(110136005)(16576012)(8936002)(4326008)(54906003)(8676002)(70206006)(70586007)(316002)(86362001)(356005)(82740400003)(81166007)(31696002)(36756003)(31686004)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 18:57:06.3777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4c009-c0b9-4fc7-b7e9-08dbdc9eacbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

On 10/24/23 14:39, Julien Grall wrote:
> Hi Stewart,
> 
> On 04/10/2023 15:55, Stewart Hildebrand wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Move code for processing DT IOMMU specifier to a separate helper.
>> This helper will be re-used for adding PCI devices by the subsequent
>> patches as we will need exact the same actions for processing
>> DT PCI-IOMMU specifier.
>>
>> While at it introduce NO_IOMMU to avoid magic "1".
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v4->v5:
>> * rebase on top of "dynamic node programming using overlay dtbo" series
>> * move #define NO_IOMMU 1 to header
>> * s/these/this/ inside comment
>>
>> v3->v4:
>> * make dt_phandle_args *iommu_spec const
>> * move !ops->add_device check to helper
>>
>> v2->v3:
>> * no change
>>
>> v1->v2:
>> * no change
>>
>> downstream->v1:
>> * trivial rebase
>> * s/dt_iommu_xlate/iommu_dt_xlate/
>>
>> (cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
>>   the downstream branch poc/pci-passthrough from
>>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>   xen/drivers/passthrough/device_tree.c | 48 +++++++++++++++++----------
>>   xen/include/xen/iommu.h               |  2 ++
>>   2 files changed, 32 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 075fb25a3706..159ace9856c9 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
>>       return 0;
>>   }
>>
>> +static int iommu_dt_xlate(struct device *dev,
>> +                          const struct dt_phandle_args *iommu_spec)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
> 
> NIT: Rather than calling iommu_get_ops(), how about passing the ops as a
> parameter of iommu_dt_xlate()?

Yes, will do.

> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

> 
> Cheers,
> 
> -- 
> Julien Grall

