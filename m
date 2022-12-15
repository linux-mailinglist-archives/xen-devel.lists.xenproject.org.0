Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8B64DD59
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463473.721659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5psV-0007oc-4C; Thu, 15 Dec 2022 15:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463473.721659; Thu, 15 Dec 2022 15:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5psV-0007mW-0r; Thu, 15 Dec 2022 15:10:31 +0000
Received: by outflank-mailman (input) for mailman id 463473;
 Thu, 15 Dec 2022 15:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q86o=4N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p5psT-0007mO-5u
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:10:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a85a961-7c8a-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 16:10:27 +0100 (CET)
Received: from BN9PR03CA0500.namprd03.prod.outlook.com (2603:10b6:408:130::25)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 15:10:23 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::76) by BN9PR03CA0500.outlook.office365.com
 (2603:10b6:408:130::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 15:10:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 15:10:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:10:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:10:22 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 09:10:21 -0600
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
X-Inumbo-ID: 9a85a961-7c8a-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N56WXOCn8V5Ua0UP8C+NbVZCJ7RIEJ0Zu8HSW/gfNSZnPiFEPcoLseI74EdTCNKL7OoBoM44pwV/XQ215Ao05WDlmEup6Av+j8Lip9OTYQEmgdSNWO3cqdqZJgi24hWedeeTLcWxOV+/B6w2dQXNN1co2JjRz6VJE5pUr6APZfaSO49q95RS99AdQcw5qgib7TRibJ67ovaFiLZDF1nWFy5D02b8UxWEuKOW9zBoNAunXi5GQdV14UbDLLHzEFXqNYQUhhwX4rBCkMYzxDVUGcIHKHwpgVVmKOGuq/+PWo6ui3mmmXEsc0uP/T0+TenRJa+aiCnPVfiK6rhv3b/X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW5ieDq7PQVDXpdgwcHO2YEH0ChyPV5Z6HolbEIvhx4=;
 b=B0y7872delMUatk6RquGOhxqciF98bGjPYKFUzIOBBq24TiSpwidanWvqTFsf9vS79//Eq/d3J1RV3SEjUfVXcEf/pqyUIJYy6Sm11FIbgXmQfZqGwpciz20H/LeEX+JhQplIaTI1Mt5JRSV+LC99HLgSRo4DEaWNqdxux9IKxJ5YO95/xXRnx8v4o5jvw991GzVfNnkXPjw1H7i7a4mvoqQHZVuErI1InC9loaKNcQQ61/7IoXiGwFKRZIJ2rH3h+DfwHV+StqMetgzBlKyZoQpqQZCcp37mVBEQU7p3pEXSS47ILoI5VO6mue5xup4vdeQaFj3dwyRr9f4PFBINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW5ieDq7PQVDXpdgwcHO2YEH0ChyPV5Z6HolbEIvhx4=;
 b=bRuLr5suwXh6dhamYcaEN7+Gv8+SlSdkHgounumO2QRb0956NAz5VEfGThdvpJjpPFW0Nq/ibDNrxC6brqD125s3KrzsiJzi9J1Y8qakeQUHvzg9UBLGrtTCEXVtcm0zNV8QPZZKKr1GgcrUvBhZxYJ5vaitJ1z22rAhXOSorWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3e47feec-8a78-887e-ecbc-c2bd81e62bb5@amd.com>
Date: Thu, 15 Dec 2022 10:10:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
 <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
 <41f62567-b05a-26b7-ace1-21745d61b729@amd.com>
 <16bf9934-1f50-4694-253c-32fa35f0b097@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <16bf9934-1f50-4694-253c-32fa35f0b097@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT039:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eaa6ef-90cd-4c7c-6900-08dadeae7d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZJYx/PSB2VNI9GHm0ZXtrw2CcNrVQz5cpuGsxbZ3q8tdKrtPZzun0j/0ocdYttphr00svnOdmm8wUgaSvmO+6fs3HUqH7Gqqixg0pBGXG/YPtw2rfw8sT57ag/tQeWK5huToE+oDQ2Hm+1pFeoZCoU2DPMSv+dvAAv1qJh7LzshpghR8r0KjPVnbQxrgbCkLH1xrVx5Hc5lEMuAJeZ8o4Lx9EKrAAzXy7YFJCzYO7SgQDjjJ92T0JKZgsnTFVjbjCVCAy7XJisE5gfcYJ/FknHUjRRffw0VMIQMdFD/p87YZIKw8Yydynh3Bj4s0W+nsnTNp/kXNKawO7H7WqZBkKZKqMCDWaotMis2zJqUYBoeoFcLq4Xcf2v/xzvXAbUrVcxwm1MnIe8bRzNmEhegn8pSBomUr34YAVDeVxiiNA7Ct+fi8+P4DChyDDeaSVOJcuN8TpjPSTQ/8rYYVYk7G/4k9wHvXdT06zE4vByQeF0nBNqBEO+QypYUtvb8MHzVLzqgMmFw7rW8TRkOZMvayLji9TB0zXwNSsImVr7BSQVkRplOzfzZcmidQIOaIK+XKjU/l/cfxLZkI57lY1W9uzDwz5SHBIRxYyx0WxJaEBx7kuSQ3/JJ0KbrrqmPf3TjyLgGF6+xAnRqhLcxTjWq1CfHIW6vcUQVW1nsC4nEiflHlbkA7Ekh0WL7dvfOOnRHTMWEeNX9lb2vClyDsIR/mPxAgNcEl/64xVYi8en3hcYd9b33V+Vbd4h+ZYgvlkdvsuEyZLH+FLCfWrSym6vteA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(16576012)(44832011)(316002)(83380400001)(356005)(110136005)(40460700003)(426003)(47076005)(8936002)(36756003)(336012)(5660300002)(41300700001)(81166007)(70206006)(70586007)(2616005)(8676002)(4326008)(82740400003)(36860700001)(478600001)(82310400005)(31696002)(54906003)(86362001)(31686004)(186003)(53546011)(26005)(2906002)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:10:23.2402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eaa6ef-90cd-4c7c-6900-08dadeae7d38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

On 12/15/22 09:51, Julien Grall wrote:
> Hi Stewart,
> 
> On 15/12/2022 14:11, Stewart Hildebrand wrote:
>> On 12/15/22 06:34, Julien Grall wrote:
>>> Hi Stewart,
>>>
>>> I was about to commit this patch when I noticed the placement of the
>>> attribute doesn't match what we are usually doing in Xen.
>>>
>>> On 13/12/2022 18:18, Stewart Hildebrand wrote:
>>>> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
>>>> following build error:
>>>>
>>>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
>>>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>>>                      ^
>>>>
>>>> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
>>>> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
>>>> helpful in the future if the PASID feature is to be implemented. Add the
>>>> attribute __maybe_unused to the function.
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>> v1->v2:
>>>> Add __maybe_unused attribute instead of removing
>>>> ---
>>>>    xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> index 9c9f4630090e..0cdc862f96d1 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> @@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>>>>        return 0;
>>>>    }
>>>>
>>>> +__maybe_unused
>>>>    static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>>
>>> The attribute should be placed after "void". I.e.:
>>>
>>> static void __maybe_unused arm_smmu_disable_pasid(...)
>>
>> I had initially tried placing it exactly where you suggest in the first draft of v2 of this patch. However, the line would then exceed 72 characters (actual 81 characters):
> 
> This doesn't change the problem here but the limit is 80 characters per
> line rather than 72.
> 
>>
>> static void __maybe_unused arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>
>> So I found myself juggling with how best to wrap it. How about a newline after the __maybe_unused attribute?
>>
>> static void __maybe_unused
>> arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>
>> and similarly for the 2nd occurrence:
>>
>> static inline void __maybe_unused
>> arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>
>> There is precedent for this style of wrapping in xen/common/sched/credit2.c.
> 
> Ah! I didn't realize the line would have been too long. In this case,
> the newline after __maybe_unused is the way to go.

Ok, I will send a v3 with this change.

Rahul - may I retain your R-b tag in v3?

