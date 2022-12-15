Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CAC64DCBB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 15:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463452.721627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oxg-0007bL-AP; Thu, 15 Dec 2022 14:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463452.721627; Thu, 15 Dec 2022 14:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oxg-0007YZ-7V; Thu, 15 Dec 2022 14:11:48 +0000
Received: by outflank-mailman (input) for mailman id 463452;
 Thu, 15 Dec 2022 14:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q86o=4N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p5oxd-0007YT-Ra
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 14:11:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 657c8db7-7c82-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 15:11:42 +0100 (CET)
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by IA1PR12MB8406.namprd12.prod.outlook.com (2603:10b6:208:3da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 14:11:40 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::a9) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 14:11:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 14:11:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 08:11:39 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 08:11:38 -0600
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
X-Inumbo-ID: 657c8db7-7c82-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZIixFTJezEdTkszbGje2oSPAZ5EzqOW6UPtlrLzxyYQtfXyqCQ5x/7tjsDI/NG1EDMlgsX6LTi1CSTCPp2chNnpdXD+PhWLUPJcj2bOKVCEabTH9ii5c6Tvg/2CoOyoCHhX5jV+vcZ+FlXhIMyXLldduGqELeH/e21JPKp6t86do7BTAoaXYC9+W+VmaCZeoqf6z+y2dBntEk8RI2bpavZWtiOchZtfKCY3P9u50W/AGVK7upDRE+ju/yeR9wZc+89kMH2ULejdqoxxl+2aw6myt1OuaqvEvcWqsox12rKncCpgnzjjdCesHJFaIOp5J9eBq5j4u1Jh++TPgfxu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNVfxjfHJSNLJATCzMSqQBCV7zGKI0OdeLeko8mZFbg=;
 b=K4ksxnFx9OxE68+KZ5sK0Sizyr+Bb2Ih4VnQ/S9r6SE6enuEvUp4NPdi5tfXnJuf1bsLmVw77uLI6jRXIqea/WLFgJITskhsPCrGJWDXyW7dlMQjuFiTfrY9ZKN+b8CLX1jSH9kP0BwPjpYBUlboInahIPtc2BmuljCkxs9LXrL5g/uReeiVYgBndvGbTbbIFqWaNq5EN03I4Hu3C4kqNM2Mqt7/i/UAPCMiLBvZRN50/ocyaV1a93cQA5Ehg/ASr0lMjBc+HwNPTFK3UiofMiSSHH7EFOFiGPd8cwOVybZgItYnKmA7iL3mj9xKbHwVh1snAA+Bz9NGKxhe7aGBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNVfxjfHJSNLJATCzMSqQBCV7zGKI0OdeLeko8mZFbg=;
 b=dxGS+WZKLRZCAITvKbbxn3PjDEl8rkjQE1pXbn7DicdbQ/CvQHzrxVR6ZYP1b1gsDEsjKlhJbQGLxFLP32R5+Sv6917HS4a7unn64nnjU6qMrg6p5amCwhby1lgc+qI0e7H2j9ANcL3bbnCvZqmlCQu9XuEmMA3fy7GEn0dS2Cs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <41f62567-b05a-26b7-ace1-21745d61b729@amd.com>
Date: Thu, 15 Dec 2022 09:11:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
 <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: c932e6da-3f06-45a9-e5ec-08dadea6492f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H6+c25lEZ48dBvIASvLmH5nAkDYeAaurqMr8GeWjrrS2bbeSKbpXHqhhK3nfdIGR+FoJITa5u9SpH0RfydtGCUVGt+/V8ThcYD9UQdPl3bT8AErcxgTWMW75ZOHgsPs8+3JZ9zEnCiywQPURBckY99sVQftZkAYQY2Ew9CoW4rABq+dwSbk0wWNNYwww4raaOGlNA20Nx3NzkI7azl5ZJTIt7TCS/wIiUqqa+HNBzbNCXbQWt6hWUFKipn6nx3O3t2fKDfNmwFTxDK3VEo7d5aV/Cq2g8JBV3mID/Rdo9S7XFiGtdu9xHzQWzt5eOXh59dUhkTbANo8YMifF2/APdVufcQ9n7YRPagM+5hIZgrFlFwvMslGGdEOPbhDzan4aZZJKPYS8RE13eFF9VNm99DCB1VtxkNN+dQ8mvmwwgdu8qg5Jgxn6bj93fOL1lWZbAaQ8q6IXjvrR05QnIJHcR9f547IzARuzytZU6fe2jwCsHy4nHBqPGuEGoq8/gWLsnVsjDhXj/71tOdLM6Do2musflRdliwJkGCejbVM7BO888fa1KoO9W8ozoBbd0qUXtwXth4QjWv9b/1eLa5Z4AU7rbosL2XF3o+QizqXSxX2j56LVIoOYMmOD3MOPe9RcRryDpYBM8Mp3cdO4YZZqpKUaWYIC2FzrGmXS+Xso6LMZ6mU3N3TLr5Uwrae7OomUPTH93Jy3f9rWFDTGFzrAJkc/HyaVc2Fo+i0jyFU+3KDRItryhng82vjdGAudB0BBUpSSnlLbO4nFmjKQzoEavg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(316002)(54906003)(16576012)(110136005)(31686004)(40460700003)(478600001)(426003)(47076005)(6666004)(186003)(53546011)(70206006)(82740400003)(36756003)(26005)(336012)(4326008)(70586007)(2906002)(36860700001)(44832011)(81166007)(5660300002)(2616005)(8676002)(8936002)(86362001)(82310400005)(41300700001)(356005)(31696002)(40480700001)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 14:11:39.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c932e6da-3f06-45a9-e5ec-08dadea6492f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406

On 12/15/22 06:34, Julien Grall wrote:
> Hi Stewart,
> 
> I was about to commit this patch when I noticed the placement of the
> attribute doesn't match what we are usually doing in Xen.
> 
> On 13/12/2022 18:18, Stewart Hildebrand wrote:
>> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
>> following build error:
>>
>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>                     ^
>>
>> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
>> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
>> helpful in the future if the PASID feature is to be implemented. Add the
>> attribute __maybe_unused to the function.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v1->v2:
>> Add __maybe_unused attribute instead of removing
>> ---
>>   xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 9c9f4630090e..0cdc862f96d1 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>>       return 0;
>>   }
>>
>> +__maybe_unused
>>   static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
> 
> The attribute should be placed after "void". I.e.:
> 
> static void __maybe_unused arm_smmu_disable_pasid(...)

I had initially tried placing it exactly where you suggest in the first draft of v2 of this patch. However, the line would then exceed 72 characters (actual 81 characters):

static void __maybe_unused arm_smmu_disable_pasid(struct arm_smmu_master *master)

So I found myself juggling with how best to wrap it. How about a newline after the __maybe_unused attribute?

static void __maybe_unused
arm_smmu_disable_pasid(struct arm_smmu_master *master)

and similarly for the 2nd occurrence:

static inline void __maybe_unused
arm_smmu_disable_pasid(struct arm_smmu_master *master) { }

There is precedent for this style of wrapping in xen/common/sched/credit2.c.

