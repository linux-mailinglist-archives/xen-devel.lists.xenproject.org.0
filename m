Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9674A8D5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 04:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560159.875841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHb2h-0007hT-Pz; Fri, 07 Jul 2023 02:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560159.875841; Fri, 07 Jul 2023 02:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHb2h-0007eH-MA; Fri, 07 Jul 2023 02:17:55 +0000
Received: by outflank-mailman (input) for mailman id 560159;
 Fri, 07 Jul 2023 02:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHb2f-0007eB-OU
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 02:17:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7895b532-1c6c-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 04:17:50 +0200 (CEST)
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 02:17:45 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::34) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.12 via Frontend
 Transport; Fri, 7 Jul 2023 02:17:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 02:17:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 21:17:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 6 Jul 2023
 19:17:37 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 21:17:36 -0500
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
X-Inumbo-ID: 7895b532-1c6c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMQNMM4rmyzXtS5oRocjJihMDuYYjpH80gp34PM8m49gGrDQSahepdBwZJ5UNire5ymgIvU/MYZyeOQKIp2srDejBE8RUiQJSKcTBh+vXJVvUFJTCTyUP+wC8Wlv+Y9prr3r/Y32crpT2rxzX3xMIETm6VoW+wZJSujVfW7PjwLoywY5H869k9cb26Vl3/NEf37cHoByKUtMZGHffnkykRgl4bsmiXIYmiXxDyY2dH2VuBB89b6n04dWUYoPnPOcMO8u5ttflRo9/IjxHJAnb75DDf0feFPN8pETLgjo1odjkWds4MbjAC3oNRRXIiU3TXIl/A7fv93htSkWShpWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Laps7JFOLqZzyEb+PMJJMlJh89/v7ZERXiiKFYTSxsQ=;
 b=ft+c2YWeS/AHqE/cF7XGOjTSqKeIDNZGWmA1dREqXhreEy1EvT0TXC1r+A2jyW+OQoLM8ugL0w4jnWusr9a8xmyoEIuHHdpNFmNVedeGztkAfI++XdSHPN//ZDbG6BE9zW8AoVI2jCwFAKoYGu6hEG2CnglDAKpK1ruDCG+Iiywsg9I96zDfBafOg/z4hBjP/Favhk2CoYNRuv8k81eGOLBVXydrqU4+QO4lpyOdA2934TKTKV1aCt/OATp3mrp8ArYITH1DbBz2xrok8dymJWBzV4MMZnGvCGck/NTIIGsoAHgUdzrf79cHCgzyLwojCJBGts0AyEnegAzL+YLKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Laps7JFOLqZzyEb+PMJJMlJh89/v7ZERXiiKFYTSxsQ=;
 b=4bfoUGFYQqpDcBdnIqsIzLH2gswVWdbEAKg6kDRolYCTrxPKqoKBCD5yD/Hxxg5DcbacdKe+Oq4aZXDy/cM7s4XYP5sWkDxVytdg/rl59koKlsM6QaLmGnzQoh2WlDtnnyjkTW8gGst0Gu750XJVncIQ5OYnmVHAfoSJh5n+Kwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fb47ccdb-1413-f38f-b4fa-8f537055bc86@amd.com>
Date: Thu, 6 Jul 2023 22:17:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/7] xen/arm: Improve readability of check for
 registered devices
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-2-stewart.hildebrand@amd.com>
 <e56be8a0-58a1-bb00-3b3f-8f90434dd315@xen.org>
 <347c6352-83ed-bbd5-8569-97619fb4faf8@amd.com>
 <2503e5dc-66d7-2b6b-2de1-abe4cfd60e09@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2503e5dc-66d7-2b6b-2de1-abe4cfd60e09@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: e12f722c-5d8f-44f0-472f-08db7e905963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ymy1xKpCT9/oLSezik8nHhwKsUm7a9R83moPwcUOJ+6stbDw1xFxYkyGUhsLy8tUXN/phUjRUBKBWsHBUM75FRStcqXDYu4dn7WRurPLDTpNPaB7fSL261zFKazCwOKB99FveELRWS0rchW9+IigUdPdsmKclDj4YHN6pdiypm1xd+8zJU6b3Nw4KDGPTOT1P1mjPPbBf/IbMsDsHBniRZXR9NNTHqZyAFqeynP7cKFXO6Knb1+wbDO+iq0dfUAK/a2JHgz+T8fyW0SW90NkL/t6cC5Vt+++R5ofZMTaFUFxiTe3OKUyimtKsodPqWzSjDc/BVb8ZV9DuT3s1t5nBGafhRgVA8Ae/JVzhpKAEvyT3+c5HKiqkmlO4tiauzvnVa267GbUQLdByiwCt4LRQocXHhASW4xA5WoiKbhiqEj/okZAoWKiWJ4j6RogkpzhVjum0wP6EGaMRflcCveeONWekq0ld3i6VVYwLI3Vhn4emfeg36UYgQsDuSWRcieygbJYmjzyxWWpg+dDqLrjW/LIttwdAixShtuOcCICcJ8RXvNE6EDis/+4VfcrBe9/Lrxu3aEI8rLsGVfc5wzjKTx+e9Fg0HkA0/JvCM7VMTJzJLiXqKKhXrYG1JlndiopF34ZtrczCMymZeUGcJYrqhEbxXtdRFgPmot2Mxjs49QFY6iFNxH6zMcMmfityZTuUexQdVq89stRSMsI488VMrPDJHrk9FmOGUW3tw4t3MingzE35o17mNfgIK/erG4BGT2hqRrGyVvIGZP74FIxDHhIfQ1n/CUJ525QU32fkQQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(82310400005)(966005)(82740400003)(40460700003)(356005)(81166007)(336012)(47076005)(53546011)(83380400001)(40480700001)(2616005)(26005)(36860700001)(86362001)(31696002)(426003)(8676002)(5660300002)(186003)(36756003)(44832011)(54906003)(16576012)(110136005)(6666004)(478600001)(41300700001)(8936002)(70586007)(4326008)(316002)(70206006)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 02:17:44.1719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e12f722c-5d8f-44f0-472f-08db7e905963
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

On 6/29/23 17:47, Julien Grall wrote:
> Hi,
> 
> Sorry for the late answer.
> 
> On 07/06/2023 14:41, Stewart Hildebrand wrote:
>> On 6/7/23 03:27, Julien Grall wrote:
>>> Hi Stewart,
>>>
>>> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Improve readability of check for devices already registered with the SMMU with
>>>> legacy mmu-masters DT bindings by using is_protected.
>>>
>>> I am unconvinced with this change because...
>>>
>>>>
>>>> There are 2 device tree bindings for registering a device with the SMMU:
>>>> * mmu-masters (legacy, SMMUv1/2 only)
>>>> * iommus
>>>>
>>>> A device tree may include both mmu-masters and iommus properties (although it is
>>>> unnecessary to do so). When a device appears in the mmu-masters list,
>>>> np->is_protected and dev->iommu_fwspec both get set by the SMMUv1/2 driver. The
>>>> function iommu_add_dt_device() is subsequently invoked for devices that have an
>>>> iommus specification.
>>>>
>>>> The check as it was before this patch:
>>>>
>>>>     if ( dev_iommu_fwspec_get(dev) )
>>>>         return 0;
>>>>
>>>> and the new check:
>>>>
>>>>     if ( dt_device_is_protected(np) )
>>>>         return 0;
>>>>
>>>> are guarding against the same corner case: when a device has both mmu-masters
>>>> and iommus specifications in the device tree. The is_protected naming is more
>>>> descriptive.
>>>>
>>>> If np->is_protected is not set (i.e. false), but dev->iommu_fwspec is set, it is
>>>> an error condition, so return an error in this case.
>>>>
>>>> Expand the comment to further clarify the corner case.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>> v3->v4:
>>>> * new patch: this change was split from ("xen/arm: Move is_protected flag to struct device")
>>>> ---
>>>>    xen/drivers/passthrough/device_tree.c | 11 ++++++++---
>>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>>>> index 1c32d7b50cce..d9b63da7260a 100644
>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>> @@ -141,12 +141,17 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>>            return -EINVAL;
>>>>
>>>>        /*
>>>> -     * The device may already have been registered. As there is no harm in
>>>> -     * it just return success early.
>>>> +     * Devices that appear in the legacy mmu-masters list may have already been
>>>> +     * registered with the SMMU. In case a device has both a mmu-masters entry
>>>> +     * and iommus property, there is no need to register it again. In this case
>>>> +     * simply return success early.
>>>>         */
>>>> -    if ( dev_iommu_fwspec_get(dev) )
>>>> +    if ( dt_device_is_protected(np) )
>>> ... we now have two checks and it implies that it would be normal for
>>> dt_device_is_protected() to be false and ...
>>>
>>>>            return 0;
>>>>
>>>> +    if ( dev_iommu_fwspec_get(dev) )
>>>
>>> ... this returning a non-zero value. Is there any other benefits with
>>> adding the two checks?
>>
>> No, I can't think of any good rationale for the 2nd check. After splitting this change from the other patch ("xen/arm: Move is_protected flag to struct device"), I simply wanted to evaluate it on its own.
>>
>>> If the others agree with the double check, then I think this should gain
>>> an ASSERT_UNREACHABLE() because AFAIU this is a programming error.
>>
>> Right, if the 2nd check was justified, there should be an ASSERT_UNREACHABLE(), good point. But I don't think the 2nd check is justified.
>>
>> If the 2nd check is dropped (keeping only the is_protected check), then do you think the change is justified?
> 
> To be honest not with the current justification. I don't view the new
> check better than the other in term of readability.
> 
> Is this the only reason you want to switch to dt_device_is_protected()?

It was switched originally in the downstream I cherry-picked the patch ("xen/arm: Move is_protected flag to struct device") [1] from, where the rationale for the change wasn't explicitly written. Improving readability was the only rationale I could think of.

Anyway, I will drop this change for the next revision of this series. Hmm. The comment may still want to be expanded though... But I feel improving the comment alone should not be part of this series.

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/59753aac77528a584d3950936b853ebf264b68e7#9e9e9f5f577b2b9fc19d92dcefe7580c7c3af744

