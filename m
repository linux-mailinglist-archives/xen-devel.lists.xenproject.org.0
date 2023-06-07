Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652D726192
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544791.850797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tQC-0007yB-Gk; Wed, 07 Jun 2023 13:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544791.850797; Wed, 07 Jun 2023 13:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tQC-0007up-Cj; Wed, 07 Jun 2023 13:41:56 +0000
Received: by outflank-mailman (input) for mailman id 544791;
 Wed, 07 Jun 2023 13:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6tQA-0007uj-KG
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:41:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d265e2d-0539-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 15:41:49 +0200 (CEST)
Received: from MW4PR02CA0019.namprd02.prod.outlook.com (2603:10b6:303:16d::23)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 13:41:45 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::59) by MW4PR02CA0019.outlook.office365.com
 (2603:10b6:303:16d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 13:41:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 13:41:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:41:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:41:44 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 08:41:43 -0500
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
X-Inumbo-ID: 0d265e2d-0539-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWY62Z4yE5Ehv4Fa+nAoUrYfw6CHyqAiIc49iFRjkWLSmbkEBD3O4nLLqNT0kp0Gs0Yz2DMKAznpvFa3cR4WsT8WG4Si5qwqqv3s4tmQKg3tOYcRsxGjs/E/oljlzAU5BbZeblYkMPKz52/MPppYSO1dybiTrXueaQEu1rCALva29AEn1chyTdBBXbdmmaJE9EYibkLpNmcCNTLMPeR17hn+9yCUk9KQvdEpf99aqtwH2QnxluilW4SA2Lxade07rKXRr//rhutVYOV7ahV8Cr6Uu/2Rb3ZhEl9ZYAVSgRsv7O0LYG9a2w1CI13sCHvMdrQHSmvk9AC6ENP4Dh5ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v1FDPr2GuYUhQsWFjLxq2YKCqwiKSRq0redPbb5Ug4=;
 b=Cp3UClAPWRzBjRZ+WK9YdzOIQUK73pkEyRMp+vrzfWLkE2DdMwfo1tPSjt39nvCZt9guWvq0HhMktbIs2/r7rmOzl8c98UGss7IPjNcWhJcSkc274dYyFumJ1CKnkY9J7xmyrRSTJRa6clJWfMQ9cWP6GAAerpH4YWHat5txDkmZ7MGsLYtJXgD6rcUceIJKuiBGXNzmNW2p6nYG03fN83Vt4rzRJkCsi+sZMfqH7/XObDuBSmNEs8omSZOi4T2rAPBTjOQC8M2uk4ahOiG8n1Jur2heTWhgaPmm70Ugql2wS19nAx86KT2ZZQ2QoyWnQqOCiGQVqp+igbG4cptZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v1FDPr2GuYUhQsWFjLxq2YKCqwiKSRq0redPbb5Ug4=;
 b=sby/mt9K1MR54nqXzG8KQAPtyBwIyZJr0uJWECdQRjzSQ4796BuK2aMOy2Shtk9QVjhO+bngrvDtopxG5AWSrZwnciRmK49qw+JdG7aGhS4EQujeqn6LLXenhKmSSP66fYB68/1VhgitadCy64k5vypP3kqhzXIQon3DzHjcXjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <347c6352-83ed-bbd5-8569-97619fb4faf8@amd.com>
Date: Wed, 7 Jun 2023 09:41:37 -0400
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
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <e56be8a0-58a1-bb00-3b3f-8f90434dd315@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|DM8PR12MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: 45370726-04d5-4b52-2f80-08db675cef1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DdQs2JO3qn9LqYyXs1Rrk22ztH2dre/3Mw1Vxe8/YeI2gTFVUQRbkxRN8CM/prnR7C6q55GHPFwCP2QLh27OiZYqp1LeBY7+6DgENDOFEYr8gLt5G6OF/YWSrgoi1viDPSwQkMiY411cVFoOUoQspiq3QOoIYnEULfFyfiNtYJ7NnbpXmQdEqESwo6T5YdBLIv8BRWtoESdzE4zeXBowVGg9tLsSXU2aX9DdetPkf0YV8PJwsiqUyvi5JePmEGhrqPrpi9V+PqE0VmB7OGIDXdZtKZOLOFh6XYgCQdye5XkpJj2x02nTsOMhnZ3pcO3Mqy/poLjLVUZeJy3ZYFydddWgwwRdY4505L3SXX7EEJ/NUfBEi7vVAuISpXYY2/ClofKg/hJvC9Q42iUdyP8yfMKd8XlQzlUN+nIlzAiCp/7EULx4+VrHmCnODeP9gLebdNhrUPwA7qGTRCW0LWjKcmiKMJbLGvbxbwL6nakTgpZ+mc/YVKs5E8JUFxmqpdEiHeSdmFCx2cySutbOPw9c0iv4vsww9y3JViNhe6+Xlgo2NKHAxozMhwgKsh16qt8HSxg3+OhaQen6owtcTi6TKswk3v3u8l9d/A/VrWyuz5XHcBxzWeSW6ObIXL+Bfeva64cSuCIFWx51PPB51J2JD2jCaKXZ3qKTqLa6YoVmYuph390O6+4H2BDyvHeThbz5CGc2O/abbTmcuf1bl3YToqFEtiZXXGT0fbh2VSjAsrreWYCGGfD0unsPkfTantZIRbkUf3RopMP3YzjAw9OdkbvqdTQObNutqWENvA2XGa67NtuNUmeienGPX2I91zqN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(86362001)(16576012)(81166007)(82740400003)(83380400001)(54906003)(356005)(110136005)(47076005)(4326008)(336012)(426003)(70206006)(70586007)(6666004)(82310400005)(478600001)(2906002)(36756003)(186003)(40460700003)(36860700001)(2616005)(5660300002)(8936002)(41300700001)(8676002)(40480700001)(316002)(31696002)(44832011)(31686004)(26005)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:41:44.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45370726-04d5-4b52-2f80-08db675cef1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432

On 6/7/23 03:27, Julien Grall wrote:
> Hi Stewart,
> 
> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Improve readability of check for devices already registered with the SMMU with
>> legacy mmu-masters DT bindings by using is_protected.
> 
> I am unconvinced with this change because...
> 
>>
>> There are 2 device tree bindings for registering a device with the SMMU:
>> * mmu-masters (legacy, SMMUv1/2 only)
>> * iommus
>>
>> A device tree may include both mmu-masters and iommus properties (although it is
>> unnecessary to do so). When a device appears in the mmu-masters list,
>> np->is_protected and dev->iommu_fwspec both get set by the SMMUv1/2 driver. The
>> function iommu_add_dt_device() is subsequently invoked for devices that have an
>> iommus specification.
>>
>> The check as it was before this patch:
>>
>>    if ( dev_iommu_fwspec_get(dev) )
>>        return 0;
>>
>> and the new check:
>>
>>    if ( dt_device_is_protected(np) )
>>        return 0;
>>
>> are guarding against the same corner case: when a device has both mmu-masters
>> and iommus specifications in the device tree. The is_protected naming is more
>> descriptive.
>>
>> If np->is_protected is not set (i.e. false), but dev->iommu_fwspec is set, it is
>> an error condition, so return an error in this case.
>>
>> Expand the comment to further clarify the corner case.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v3->v4:
>> * new patch: this change was split from ("xen/arm: Move is_protected flag to struct device")
>> ---
>>   xen/drivers/passthrough/device_tree.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 1c32d7b50cce..d9b63da7260a 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -141,12 +141,17 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>           return -EINVAL;
>>
>>       /*
>> -     * The device may already have been registered. As there is no harm in
>> -     * it just return success early.
>> +     * Devices that appear in the legacy mmu-masters list may have already been
>> +     * registered with the SMMU. In case a device has both a mmu-masters entry
>> +     * and iommus property, there is no need to register it again. In this case
>> +     * simply return success early.
>>        */
>> -    if ( dev_iommu_fwspec_get(dev) )
>> +    if ( dt_device_is_protected(np) )
> ... we now have two checks and it implies that it would be normal for
> dt_device_is_protected() to be false and ...
> 
>>           return 0;
>>
>> +    if ( dev_iommu_fwspec_get(dev) )
> 
> ... this returning a non-zero value. Is there any other benefits with
> adding the two checks?

No, I can't think of any good rationale for the 2nd check. After splitting this change from the other patch ("xen/arm: Move is_protected flag to struct device"), I simply wanted to evaluate it on its own.

> If the others agree with the double check, then I think this should gain
> an ASSERT_UNREACHABLE() because AFAIU this is a programming error.

Right, if the 2nd check was justified, there should be an ASSERT_UNREACHABLE(), good point. But I don't think the 2nd check is justified.

If the 2nd check is dropped (keeping only the is_protected check), then do you think the change is justified?

>> +        return -EEXIST;
>> +
>>       /*
>>        * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>>        * from Linux.
> 
> Cheers,
> 
> -- 
> Julien Grall

