Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF675327E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 09:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563513.880727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCrK-0001vH-N7; Fri, 14 Jul 2023 07:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563513.880727; Fri, 14 Jul 2023 07:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCrK-0001tZ-Jz; Fri, 14 Jul 2023 07:04:58 +0000
Received: by outflank-mailman (input) for mailman id 563513;
 Fri, 14 Jul 2023 07:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSc+=DA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qKCrI-0001si-Hh
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 07:04:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eab::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba8bc954-2214-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 09:04:53 +0200 (CEST)
Received: from DM6PR02CA0102.namprd02.prod.outlook.com (2603:10b6:5:1f4::43)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.27; Fri, 14 Jul 2023 07:04:49 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::bd) by DM6PR02CA0102.outlook.office365.com
 (2603:10b6:5:1f4::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Fri, 14 Jul 2023 07:04:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Fri, 14 Jul 2023 07:04:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 02:04:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 14 Jul
 2023 00:04:48 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 14 Jul 2023 02:04:46 -0500
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
X-Inumbo-ID: ba8bc954-2214-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S36bVp3W8wnfJK/5awi0/ENvMxU9OJoNqyzbTVyDZ6SledleYSemh0ETKdgedRGZM17l4Khfc+DoM1ar9hRuu2i5gtgS0Q0HjBe30B9QH/wo3maLETp435kssVsJ2EQeSvO9dPy4DXtvWSLYVjILwahoSOzgzKjJCPObL2jB5KAs5Z8svKxRN8l76dzTTPL0reP5HZmOwsazxZT/KxriP3BxFLZN1p8WMAoHzNCxXSgcgJQm4vHXrJUn0BK9kAnPBdEm0mi/V4NFb3OLLQXbgW8k+OQguIz4QDI3XwLuS6jj1oX27qCiYl5VLziJc+u1k4cfzfTL7Kl6/OVXjexQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXrvwGb8dSFJ8qc6mgpnsoDY3de+1hPw34SHHHbfNAA=;
 b=NHlvJvAAsTU7G1hagFHYwSNBs8rLt6j0fgRcoxiOACvum7iM532JT1qO9U0xLfh0MGegBhb6qymbokZmpioTBX/ud6ZGRIT1qmS2gTPcYxws9QBdp/Edpr8lPTGn29tDxhPjge+3WLr76R3YKD39bxBupbuc4p5BAXKO+AMA33yQSuufHQqSmNawMtCqWv4s8FsWl+fGmrdjFxy07EtPk6vYRZ9VfQe7yfERQqsWDJuwPjRpoAYF5V2o2wrM8982K7wfKUcgz8MEzE7xMaJ85Ercleuu+Hx0BP38li43Z9bRqOYd67vP4VJmWX2qlFSLDbrecu9//Bnya2xEmT/UUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXrvwGb8dSFJ8qc6mgpnsoDY3de+1hPw34SHHHbfNAA=;
 b=kFr4IvqezLobxIZfHy64VqiTpe8zJbFMATt1X7TpknIFnFlBRMV0qjpX9oc7OCJETaf8ue7WOhloiwd4xUKexP45LLbAaVahSdb174Fofe4yspO0ltAH9SQo/ec9PNejmD2iIWDRe2ueSevL7F73jffZvHhU0ePFa0u4SySoKBs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4ba51e3c-d6c4-5d0d-1517-fceebbe516e6@amd.com>
Date: Fri, 14 Jul 2023 09:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
 <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
 <b39b19a4-9649-173b-bb05-518702d05873@amd.com>
 <66997c9c-d0d9-fce3-e5bd-a4f41cf0de91@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <66997c9c-d0d9-fce3-e5bd-a4f41cf0de91@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcb1ac1-faac-4ef0-bff7-08db84389cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GbVl3a5rKh3FPMcBFCmpr9lpU0trLvtliu2S8gz5MCXrsiIFEo5rZj9bo8MxpNXB8sMwxe4ZYj+mbfkZ3FIGIwBSVF67+BA9dcSXL19oIU9FhKN2lAmAzmmAEXOWKV4xG/G63Oxsilvzv5GYE6jgPmOHfwmJ9uMVkBMe8Y0dvk+ZvVFoLCZ93kJOCcey+Aa0KtDUrcfbolh0DaQcrRuWQGUQLgGyDtx8ZY8hflu6dfK7my8x/bJq6whGjcYi98hhzqVpZQaGOQbUzV90F1wj6KGSdbZ8kHt7zS6AdHirH8SOmULk/eGlgNO2cgWPEXa0+4Q0AXSHiZIMyyIa2AJl9vyj/eEbzl4UXfijnudpMmB6SB62Uad/VHMitb6WkOPxJFROxQw0a61STcp6F/Nz6U7ZOgOZThmvvrej5aw27FfGXHNZ/YgBDoPwL3ex/Ld7K/RYI4iGNpTZ6CFMcVEwb3NvsG3C0uWYUKXprami77+uaelfx6iWQMA82tqYKAlgqwDBv5z4WUrStUvra4z19cNn/4T4O90EzVhGK/NqUSuS+lCU2jJ0oDtHqgDTLESW6ixohcNWx0aXBCsLL2c9WrxPRflZD+0WSKgipBZDz3PItM9JkYzh4aDgCRsm2OvUz8UNx8/uXjVrHsN/PzrW/BrY79j82S0dVF+mcbAMIVrw85N9RCUZBXlbSx79t7dFYSzo6p7miplSQ4ew8JVYkw/w4Z/O1r0c5xCPQEX6Po44TI67FJfYgBhEsF8NXchR1a24JiFHyBZxdxD4rFd1EAoOFJg7xMkS3Bid7EM6UpvGfOc//YCv32Zbayvz8TsY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(4326008)(70206006)(70586007)(82310400005)(356005)(81166007)(31696002)(86362001)(186003)(26005)(53546011)(36860700001)(82740400003)(47076005)(83380400001)(336012)(426003)(2616005)(36756003)(478600001)(110136005)(54906003)(40480700001)(16576012)(41300700001)(31686004)(5660300002)(8676002)(8936002)(15650500001)(44832011)(316002)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 07:04:48.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcb1ac1-faac-4ef0-bff7-08db84389cf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

Hi Julien,

On 13/07/2023 20:15, Julien Grall wrote:
> 
> 
> On 12/07/2023 08:01, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
>>
>> On 11/07/2023 18:07, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 11/07/2023 09:29, Michal Orzel wrote:
>>>> At the moment, we limit the allocation size when creating a domU dtb to
>>>> 4KB, which is not enough when using a passthrough dtb with several nodes.
>>>> Improve the handling by accounting for a dtb bootmodule (if present)
>>>> size separately, while keeping 4KB for the Xen generated nodes (still
>>>> plenty of space for new nodes). Also, cap the allocation size to 2MB,
>>>> which is the max dtb size allowed.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Note for the future:
>>>> As discussed with Julien, really the best way would be to generate dtb directly
>>>> in the guest memory, where no allocation would be necessary. This of course
>>>> requires some rework. The solution in this patch is good enough for now and
>>>> can be treated as an intermediated step to support dtb creation of various
>>>> sizes.
>>>
>>> Thanks for summarizing our discussion :).
>>>
>>>> ---
>>>>    xen/arch/arm/domain_build.c | 18 +++++++++++++-----
>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index f2134f24b971..1dc0eca37bd6 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -3257,14 +3257,15 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>>>>    }
>>>>
>>>>    /*
>>>> - * The max size for DT is 2MB. However, the generated DT is small, 4KB
>>>> - * are enough for now, but we might have to increase it in the future.
>>>> + * The max size for DT is 2MB. However, the generated DT is small (not including
>>>> + * domU passthrough DT nodes whose size we account separately), 4KB are enough
>>>> + * for now, but we might have to increase it in the future.
>>>>     */
>>>>    #define DOMU_DTB_SIZE 4096
>>>>    static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>>>    {
>>>>        int addrcells, sizecells;
>>>> -    int ret;
>>>> +    int ret, fdt_size = DOMU_DTB_SIZE;
>>>
>>> Can fdt_size be unsigned?
>> I used int because by looking at all the fdt_create() calls in our codebase
>> we seem to use int and not unsigned.
> 
> This is a bit of a mess because xmalloc_bytes() is expecting an unsigned
> long parameter. So we have some inconsistency here and we need to chose
> a side.
> 
> My preference would be to use the 'unsigned int/long' because the value
> is not meant to be negative.
> 
> Also, I used min() that does strict type checking
>> and SZ_2M is int. So if you want, I can use unsigned int but will also have to use
>> MIN() macro instead not to do type checking (I cannot use MB(2) as it has ULL type
>> and do not want to use min() with cast).
> 
> By "use min() with cast", do you mean using min_t()? I would be OK with
> using MIN().
> 
>> Also, are you OK with the rest of the code?
> 
> The rest is fine to me. Anyway, I am OK with this patch as-is. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks. So, let's keep it as is and one day we may just choose a side
and do refactoring globally for consistency.

~Michal

