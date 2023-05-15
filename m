Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A972702544
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 08:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534569.831688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyRyw-0003w2-Nt; Mon, 15 May 2023 06:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534569.831688; Mon, 15 May 2023 06:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyRyw-0003tE-Kf; Mon, 15 May 2023 06:46:54 +0000
Received: by outflank-mailman (input) for mailman id 534569;
 Mon, 15 May 2023 06:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HQr=BE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pyRyv-0003t6-M7
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 06:46:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44291080-f2ec-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 08:46:50 +0200 (CEST)
Received: from MW2PR2101CA0018.namprd21.prod.outlook.com (2603:10b6:302:1::31)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 06:46:46 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::16) by MW2PR2101CA0018.outlook.office365.com
 (2603:10b6:302:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.4 via Frontend
 Transport; Mon, 15 May 2023 06:46:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 06:46:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 01:46:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 01:46:32 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 01:46:30 -0500
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
X-Inumbo-ID: 44291080-f2ec-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvaPYCm/YWSl2rscrd+0iR0LjXjJmYkqXN+3HHnjl+gaJLoOfJAZhMsc/DA1p+c46ebuaT5lcAs+ealuHOWffuvfDYCEXu/ojNi3dB4olQJz4BTz6dmLVaptD64j7z9SoAO+fuip9/qaoBmESbBVmmPqXLndx/th0KUGVmfjrw3Y9zRUsZMBzNHi1OlnyhnvB2X2g9NmVKhRf9yHHIQRVc8DUYr3p0uEGh4i9mggi1QtEBVYUwO29JnLfX/SvXZx91Iqg9ucEjLQyYdc+7V35ETZfhaRer5G6oM87PAj1Mvm/1ZnuB0evOoz1SHnJti89binX+kXhegNP9oaPaoEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQjuZJ+G8w7Al9J6uPj6xfFtjYRtiwRu9tQGQhkRkYQ=;
 b=KqNQKocoYfph6c+Lb8uEyYbZp7580Zbdj1vfK6nyh8njFpQWiDzjLZiBcjAhNeJnDbFBXmKzSsLK5tiwEWT8N56/IVHjW17raCHcChUseJyl5/yEQpQ/BQmB0Oc0dHrYcgdbB8oDkON5Shb6ATDaulnmadi3V7m0+8bhjN6c6VTCXNGKlxfKidfIcyT0DcIqsZap8bQi/mmqOBq0wLlHsucJy12I80GFw8QvoZegJFEBr0CWLHsvP2rgbdSTEjviuDo7OvXKCmizu8HC95SqeSgPknDQqIFMHN3cO9otqEEN8tMKC9kpYy6htOZ9C4MSVes89ZjfMQHhp36pIVhyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQjuZJ+G8w7Al9J6uPj6xfFtjYRtiwRu9tQGQhkRkYQ=;
 b=xrb8gPYyMFplBoeOc8upQ8OCzti6eXTQ2P7/9l+7R2KiSYlpLuqzr94fulvZkFZnLePeQAvITG5tMPbdbX763BahDZhf9IHK4Tvlc6S+ycNHdLanLN3gwKuC+5sSgjSKlNvbIzWioDnUf67FCdRABkXirpN0VtS6b2EDeBIa8zk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2cdb4e1c-5151-f820-5ceb-35f782842393@amd.com>
Date: Mon, 15 May 2023 08:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
 <1dadc8b9-00be-55f9-e8b7-f867eacf20b1@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1dadc8b9-00be-55f9-e8b7-f867eacf20b1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c28288-e4c9-41fb-0fb8-08db55102650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VtMKZrN6H+5vwomrjYPRe7yyoo9+cyh8vQBjaV2ewxZnPmPql75TUAeC8l9dDOe6qwbHn6u/JJrGfPt2nCTvt3dmQQnJbUuXpqpXbiAxVNdMFPDD+2UrSdiaiVmHWP+JyhAtIm7EFEZt70bKjv3MTTzMb2mJaimalfWgbI8GUYuYfWOKmVzI0zxFx91G6piSsBHkpTitDr2p0xcT1OOEoQx6Z+73PLNkN76+Ak2vQonXo6nlz8ib5O1uRsw5hQbnarFHHAx04OR5moyc3855NVPw3Bby0Jowrd1jKJX5FSHbc6E703qDq4pHz82tABU4bDV8kwli5x5qgbLlyZZSDMXRsp0QRiXpvJuViByxwHTeKpj8w+zdJdpSRVp9pOZezPv6o1LEh9k7YTNu4Va3+9nj5YheXZqxTmDAmZJOr5fg7515SVtpTorYwRFeu6rKPxP/bLoK+HPwxAwoq5O/KUkucnYhmVJ07rauXAeCzIDHdhoUNtQGs+hv7bEseBeOWs+ywCoY6wMVKJIkwuDCMYLI1cHkFVm8oOmZOwP7K3qwCEZvU25+ovhpFl0W/mLPqIqMmkuEnnyBP29HjoZC8OOZ2gAd5bHM01ytLf2SILmUTxUFiNp5wTPESUFgPzjD9lTGLe4L4sOSiDxJefBqZgrarg9sUyDCMIVPPsgiEjRTiAXK/1xBwTV/RPZNrAcblhHtXjwtVcEb4UW22/Espk88VsIXHNrlEtn0u/lpIgLMKSn+ChABY62TrnB8HsecOHYW9FeLKBhu8VYTd4jbobIxJ+MMNTGCZ5AiwmyoSw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(47076005)(186003)(2616005)(41300700001)(31686004)(6666004)(426003)(53546011)(336012)(83380400001)(26005)(40460700003)(478600001)(16576012)(54906003)(110136005)(70206006)(70586007)(4326008)(82740400003)(40480700001)(81166007)(356005)(316002)(5660300002)(8676002)(8936002)(44832011)(86362001)(31696002)(2906002)(82310400005)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 06:46:45.1957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c28288-e4c9-41fb-0fb8-08db55102650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787

Hi Ayan,

On 12/05/2023 18:59, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 12/05/2023 15:35, Michal Orzel wrote:
>> At the moment, even in case of a SMMU being I/O coherent, we clean the
>> updated PT as a result of not advertising the coherency feature. SMMUv3
>> coherency feature means that page table walks, accesses to memory
>> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>>
>> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
>> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>>
>> The same restrictions apply, meaning that in order to advertise coherent
>> table walk platform feature, all the SMMU devices need to report coherency
>> feature. This is because the page tables (we are sharing them with CPU)
>> are populated before any device assignment and in case of a device being
>> behind non-coherent SMMU, we would have to scan the tables and clean
>> the cache.
>>
>> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
>> requires that all SMMUv3 devices support I/O coherency.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> There are very few platforms out there with SMMUv3 but I have never seen
>> a SMMUv3 that is not I/O coherent.
>> ---
>>   xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index bf053cdb6d5c..2adaad0fa038 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>>   };
>>   
>>   /* Start of Xen specific code. */
>> +
>> +/*
>> + * Platform features. It indicates the list of features supported by all
>> + * SMMUs. Actually we only care about coherent table walk, which in case of
>> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
>> + * section 3.15 and SMMU_IDR0.COHACC bit description).
>> + */
>> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
>> +
>>   static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>>   {
>>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> @@ -2708,8 +2717,12 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>>   	INIT_LIST_HEAD(&xen_domain->contexts);
>>   
>>   	dom_iommu(d)->arch.priv = xen_domain;
>> -	return 0;
>>   
>> +	/* Coherent walk can be enabled only when all SMMUs support it. */
>> +	if (platform_features & ARM_SMMU_FEAT_COHERENCY)
>> +		iommu_set_feature(d, IOMMU_FEAT_COHERENT_WALK);
>> +
>> +	return 0;
>>   }
>>   
> All good till here.
>>   static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>> @@ -2738,6 +2751,7 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>   				const void *data)
>>   {
>>   	int rc;
>> +	const struct arm_smmu_device *smmu;
>>   
>>   	/*
>>   	 * Even if the device can't be initialized, we don't want to
>> @@ -2751,6 +2765,14 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>   
>>   	iommu_set_ops(&arm_smmu_iommu_ops);
>>   
>> +	/* Find the just added SMMU and retrieve its features. */
>> +	smmu = arm_smmu_get_by_dev(dt_to_dev(dev));
>> +
>> +	/* It would be a bug not to find the SMMU we just added. */
>> +	BUG_ON(!smmu);
>> +
>> +	platform_features &= smmu->features;
>> +
> 
> Can you explain this change in the commit message ?
I think it is already explained by saying that in order to advertise the *platform* feature, all
SMMUs need to report it. If at least one doesn't, the feature is disabled. This is exactly
what this line is doing. It is comparing platform features with a just probed SMMU features (arm_smmu_dt_init()
is called for each SMMU).

~Michal

