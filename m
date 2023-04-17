Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3A6E3D4B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 04:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521710.810508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poEDJ-0005Hw-H2; Mon, 17 Apr 2023 02:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521710.810508; Mon, 17 Apr 2023 02:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poEDJ-0005FP-DQ; Mon, 17 Apr 2023 02:03:29 +0000
Received: by outflank-mailman (input) for mailman id 521710;
 Mon, 17 Apr 2023 02:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDUx=AI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1poEDI-0005FJ-Fb
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 02:03:28 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0950f951-dcc4-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 04:03:26 +0200 (CEST)
Received: from DM6PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:100::46)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Mon, 17 Apr
 2023 02:03:22 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::23) by DM6PR03CA0069.outlook.office365.com
 (2603:10b6:5:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 02:03:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 02:03:20 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 16 Apr
 2023 21:03:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 16 Apr
 2023 19:03:20 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 16 Apr 2023 21:03:19 -0500
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
X-Inumbo-ID: 0950f951-dcc4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On2SCcY6aju3Jng6z40Qs4oriGZ1xQNrxQlyD+CstrQcq8DhmCAqiGl1/aeG61PcMWpvSm6Vj1/dpmdXilZIepQ6O97hnkDZdk4WeuSzj8oijPWA0PdwjoIU6ndCRvUo0SGVQZdfa0YV3HAb9+zr+YLSauZPElkWvAPKt+64ecmiYywwpvHuMoORfcj1N/YD6FhqD4r+UbWCEpX0aNsKyMpydDBidqgAR30ShzSgCASY4VQuyns5hDyJHrD+b15ynYPGLySeJ1FIEWWtJgFjkPFEcEE4Lx5Ypr4P+UUJMWblAN9EaIO5j1dDHKR+Iq3/xWWM/U0oLMjeAD4qSelGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB7rQPXzigjksR8cneF7KMo407F4iVd+/nvEuzD/dHE=;
 b=jflfrYobF/4cG6Y5nVmwbWVyXeAyLs1Gip5Eg/AL+WsC0ifPDE07zsjX8MH6rGOfYvYBa0s0VVCub9snfd4dnVhjsWdCqbE6H24D0h8BlzZLOLCPRqRd4NYRe8gWmjn5vacwXqVoSm/9rl6EQZQY9GE6YmV3cd0c1EFeLjiUMpxrfoJT7q5X6YY1gyXs5PLu0bUQhMkZizGwVZTMNhBzVRoQDsSSysQZJ0sXP2M5hnRNg9lRZsEYZpDxhztCqKGdt4Z3bsI0BL0z8vOm5QAv2OhVgxDsH49eWNNs7sRyH8b9FHlGKlrgS3ZuBBa8ErJoSydVnQFEn0ooI6R+6oI2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB7rQPXzigjksR8cneF7KMo407F4iVd+/nvEuzD/dHE=;
 b=xDY7sP8KXF1IWuEKwJsnHFPfiloxNuMxOxEytLkSy+ueG+plgE9hLkIu1PdSwd1r36K6pzf4EpdPV2YAd6ctKN7K1+pz6XTon6m7wobPaTuiWFa1XncaExDjque+MV9q8MVR24EmXfSrhtVqioQ3BhVDHK21OwW1jtZfDCbDTus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3833c906-8d88-d35d-b9dd-b70d5f7a9fa7@amd.com>
Date: Sun, 16 Apr 2023 22:03:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] xen/arm: fix unitialized use warning
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-4-stewart.hildebrand@amd.com>
 <5fb567c5-1e82-a048-1cfe-f6f69e0b5ebc@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5fb567c5-1e82-a048-1cfe-f6f69e0b5ebc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 652a7c9e-3a95-4db0-17ed-08db3ee7eb64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/hvSZwuGv1r4fGOEgT2unE07Wn/HLbH+qmH/4gfOk5BzqFdkoOnyhjKQ44Z3UBlk8/JK0nP0+evw2HkJVWekfv9tUyC5sVLPHa9P1Y43lpUcXLjSmt44tsmh8ZED/ek5SGh6cKNorS7JtMj5VhtrHCXczBQbcauKzvZOet/0YXsHysUUmsJ+u6NR9Y3EYO7IJYr2Jo/qqFeoU6biajXhpPATeQ7d2jh8P2cWi1EQW87uQxvYO2P4rrQLHbYU+fpSxO9w5WSLAvIOATSfSrkS97C32oI192hoSnDBit7vV6tgQWcEq1pVoazdz4AH9gVHAU56M+Z/ENgfau3ahv3bVJxz0IxQW7/9M6yXe24m7OfT7IZGIOcHfjLF46B+9/skHXULXegGnzMGw2hPuxA21IW0L7Y9J2V/MRLfJKXphQmG4M46VHbLsDvRzau/Ty5NMfuuwP7QGAF9jOMMS2eQcTrYs1kjQxQ6UAkUK1aRhdIJJcVdQ+IjU4ImefXjDdSAVPdDeH1oajEyAqtOaDiDXola3NyZ7SB8+IMaddlUepFFZc9qRaQwxPrFSvh55NL/OcCJYMCx12Lw4O0RgKB5OGd5DxNWWp6ku1IuTHfWTpdDmHODek/iXsE3LvDu3k2UdKs0puXwnyUnAMtI3WdpiaNc01WzfUkuxkIorOcsY6TbhJHdMimusmYxCtYclEJeFuSGsxyWY7UPZb0np+sVVh6WkiLFniF6yqcpEpyfb4QyXKeQVbG4yDOxpUuDzfvI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(47076005)(40460700003)(31686004)(36756003)(41300700001)(4326008)(54906003)(8676002)(70206006)(966005)(16576012)(110136005)(70586007)(316002)(81166007)(478600001)(86362001)(31696002)(336012)(2616005)(83380400001)(26005)(53546011)(426003)(5660300002)(2906002)(82310400005)(40480700001)(36860700001)(8936002)(44832011)(82740400003)(186003)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 02:03:20.9848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 652a7c9e-3a95-4db0-17ed-08db3ee7eb64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990

On 4/16/23 08:53, Julien Grall wrote:
> Hi Stewart,

Hi Julien,

> On 14/04/2023 19:57, Stewart Hildebrand wrote:
>> When building the hypervisor with -Og, we encounter the following error:
> 
> Is this with GCC 12 as well?

Yes. If my memory serves me correctly this particular one occurs with both GCC 11 and 12.

>> arch/arm/domain_build.c: In function ‘make_cpus_node’:
>> arch/arm/domain_build.c:2040:12: error: ‘clock_valid’ may be used uninitialized [-Werror=maybe-uninitialized]
>>   2040 |         if ( clock_valid )
>>        |            ^
>> arch/arm/domain_build.c:1947:10: note: ‘clock_valid’ was declared here
>>   1947 |     bool clock_valid;
>>        |          ^~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Fix it by initializing the variable.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> See previous discussion here
>> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00741.html
>> ---
>>   xen/arch/arm/domain_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 4f9d4f9d8867..18b350734a8e 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1944,7 +1944,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>>       /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
>>       char buf[13];
>>       u32 clock_frequency;
>> -    bool clock_valid;
>> +    bool clock_valid = false;
> 
> NIT: I would add "Keep the compiler happy with -Og"
> 
> I am happy to add it while committing if you agree.

Yes, please do. Thanks.

> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 
> -- 
> Julien Grall

