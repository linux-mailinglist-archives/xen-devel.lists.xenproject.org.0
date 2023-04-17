Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494646E4526
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521928.810927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM2n-0002en-KN; Mon, 17 Apr 2023 10:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521928.810927; Mon, 17 Apr 2023 10:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM2n-0002cW-HX; Mon, 17 Apr 2023 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 521928;
 Mon, 17 Apr 2023 10:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poM2m-0002cQ-1P
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:25:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dbf2682-dd0a-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:25:04 +0200 (CEST)
Received: from MW2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:907:1::14)
 by BN9PR12MB5161.namprd12.prod.outlook.com (2603:10b6:408:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:24:58 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::84) by MW2PR16CA0037.outlook.office365.com
 (2603:10b6:907:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 10:24:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 10:24:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 05:24:56 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 05:24:55 -0500
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
X-Inumbo-ID: 1dbf2682-dd0a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFY/t/I3XCuk11zRNnfx5nhvhs90dOH5ZdTA90ZMKnpyte8zz4NfNnzaWXNCK9auPtvyvG6yJMwOih1dIAWixwMMu4jTz0RWIPlCVCuKuHAfAH8oNj38DM0BcQlrL4U0P7NzIqlpcAEisH4AAi9Xcy0iHFar0aHHTMa5JzNGvQPt1xTiiE/rI5tKQ0J6gZneBLMxdV3cckE5+uMF5PiRNlG/kJhRrq7y2u3Wq02YBxiINgZ50KbtO0SMm3SXnBUJG5NNE6VV9nKWQrxJdXvrWBm3DgkVNCVXTEMSdoI2aehDPkE8C7sKvztIr0TLKx/WTK7y33HeBP3+yaUK/sWeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXXrP4sb1wUWjuiRCJUdQCZtqL4Tq1RBkstGbhiltNk=;
 b=YaMTFBQjwrGwg03P3x6Uj5gJjtGrbBeZ0GHRh1hwVIe818BASM4XstGcBC9qBSciwRUDY6PQFbRfgTumWmCYR4QU5fQ3TvZYCSsLXryoVkc4PfDv+YsMGd/Gl4zrnWNDJpx6a/ZX5bS2dNHWEGsoyStYtF5ngG7ZboGWcg9p019Nu+iJ0LpHAmdJ85Ijsp9Cfp09oe2tF5md59ZmCj2CA/vTaFwX913ffFy8p+t0N9m3SMqH8OVkF4aN0NDCrvQJxSDV3y/htMElDQyDBvadHDZMnGdHCgPK3wizRqeLJzluV153wsBnszKfEhO4y+z6M99/D4bIxNKMEn6UYuRX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXXrP4sb1wUWjuiRCJUdQCZtqL4Tq1RBkstGbhiltNk=;
 b=A9XBS7dCCXEoATotLg7UAuJCJSvCUtztXSRI01IB3HuEV5Q9beKLNoH8YVyzduhYeE3FI2GNM7NPPqkvI1Lqg6W2rcA8r6We3jJbjg4c5fdU/bapaBOzavjKAjVt55Mf4VJuFd6J7ahssKG0ut0AMgjfxgEsD84J8x1+GvInt8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9382acbd-3c98-3407-ba1f-f02e1e6751a1@amd.com>
Date: Mon, 17 Apr 2023 12:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 07/17] xen/smmu: Add remove_device callback for
 smmu_iommu ops
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-8-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|BN9PR12MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: bff5f1fd-5dd5-49ec-c7eb-08db3f2dfe4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UqbwVaAKd40RBud6+7/L8DorYMLjchyaWINwWbASR+prZPT/IKSTioKW3exMz2ds6vm9HmwwaLYVmK1uZ0TPtO0rhup/2qgrDx2lNLoasaF5Wcq60O79a0T00ErXIibAQ7R89HoW9f6/SrEGvcWbeeymUdoUk98hapq7VKqFuDQpgNBq804fZTtzOA5BDCGT6VQ78JBFLpAmdUzcjdtQaYPqvpr4YmIBaUzTLkuKlZl+CiUIKeKXDyRi30X/HVSGABSAjkYvxcYyeTL5i7QTBaEI+Xv1mobMnFSZyL/cnP01eihO4zgYC7qZCNlW2lYtXHBhP2uF5ZhXdPPnhV7mrz49wdEPHTZhKnkWjWKQI67dLm8AM7TFb3tZepdhRm7vhoRR9R4nIQ3xZnjfntZPSNGqJbq1xsRHFloBXIeN4fbrpqSWoi7piw2Rcyl6hn1tYdR/QgrJVfsRr7Zw/f0GzgAb7rbxwOM3egETrjdDInrj7lK2+LjsKyEkzVoIJzg/G0Nq2zv8sK0mUgKhIt6Rp28ayIvyA9MHcYHAOLpY8B7W5vm601xI03duO9GY4O7zCHfRVgM4nUCw2s2mWNM4ToPyhp3E/U6GIMCO7OuhGuGFNm1qFuGBSaLdG86SBstCTjZlSjn7mnIiYOv1mXzMTwI7gmsRKYli/2/kZ4oucxReP8Dn0tXu40Uo8wf27fmQebYpW5QAvLscpwrDYTVZBVtxMzEBgOctJnaBlqXU3fp/J+PVz4HAwcGY2lLg0QpH9d97Lh4WF7Ocq56yo07dRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(426003)(5660300002)(44832011)(82310400005)(2616005)(336012)(86362001)(47076005)(83380400001)(53546011)(186003)(31696002)(356005)(26005)(82740400003)(81166007)(36860700001)(8936002)(8676002)(110136005)(54906003)(478600001)(16576012)(40480700001)(41300700001)(316002)(40460700003)(36756003)(4326008)(70206006)(70586007)(31686004)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:24:57.4214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff5f1fd-5dd5-49ec-c7eb-08db3f2dfe4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5161

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Add remove_device callback for removing the device entry from smmu-master using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Remove the SMMU master
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/drivers/passthrough/arm/smmu.c | 56 ++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 0a514821b3..14e15f1bc6 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -816,6 +816,19 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
>         return 0;
>  }
> 
> +static int remove_smmu_master(struct arm_smmu_device *smmu,
> +                             struct arm_smmu_master *master)
> +{
> +       if (!smmu->masters.rb_node) {
> +               ASSERT_UNREACHABLE();
> +               return -ENOENT;
> +       }
> +
> +       rb_erase(&master->node, &smmu->masters);
> +
> +       return 0;
> +}
> +
>  static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>                                          struct device *dev,
>                                          struct iommu_fwspec *fwspec)
> @@ -853,6 +866,32 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>         return insert_smmu_master(smmu, master);
>  }
> 
> +static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
> +                                        struct device *dev)
> +{
> +       struct arm_smmu_master *master;
> +       struct device_node *dev_node = dev_get_dev_node(dev);
> +       int ret;
> +
> +       master = find_smmu_master(smmu, dev_node);
> +       if (master == NULL) {
> +               dev_err(dev,
> +                       "No registrations found for master device %s\n",
> +                       dev_node->name);
> +               return -EINVAL;
> +       }
> +
> +       ret = remove_smmu_master(smmu, master);
This patch looks good although I remember seeing Julien advising you that it would be beneficial
for the SMMU driver itself to check if device is not currently used before you remove it (even though
you have this check in iommu_remove_dt_device(). I could not find your answer to this.

NIT: No need for a blank line here if the next instruction is checking the ret value.

With the above things clarified:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

