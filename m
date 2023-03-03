Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5D6A947A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505699.778584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY25K-0007Nr-JQ; Fri, 03 Mar 2023 09:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505699.778584; Fri, 03 Mar 2023 09:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY25K-0007LV-Fg; Fri, 03 Mar 2023 09:52:18 +0000
Received: by outflank-mailman (input) for mailman id 505699;
 Fri, 03 Mar 2023 09:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY25I-0006kg-Ay
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:52:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135cdf82-b9a9-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 10:52:15 +0100 (CET)
Received: from MW4PR03CA0114.namprd03.prod.outlook.com (2603:10b6:303:b7::29)
 by BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 09:52:08 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::15) by MW4PR03CA0114.outlook.office365.com
 (2603:10b6:303:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Fri, 3 Mar 2023 09:52:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 09:52:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 03:52:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 03:52:06 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 3 Mar 2023 03:52:05 -0600
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
X-Inumbo-ID: 135cdf82-b9a9-11ed-96af-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoL1oDxvGbuiQMYePszC0+9FVk5pO4ESCfsEAaDhuBdByzdWysqSQDKGXrEqCjXvLnKgEIPndS0UdSWuCI/se3zFBelpFhTBBybdHt7u7ZCsyu9BgKt13XkQnOC5HL/aQi+Se5K3EHb//xgfY/lv31jidVoQOZNSJ+jPrkqh9nTQWqqaL3qN+SwWUHd9XvIgQdarOCzrFKIXJhmko/jhaMwUjDJAmmlCqyCiEYxgGPhWCycGZMVC9PUDi4fX2EOdhPM6oBQF+ifYqMHJUxnisUdwesFIZDn7ZsMpALakvSdwTbNatqdP2ck4vkRemhprx1Vu3PQZlu7Gq9e7LUUyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbws6XEjTz3OHN+hyX3XASeiSb1CULjlNqWzestCVpE=;
 b=ZxNxHzPiFE0s7KTrLGUVtfu01O1M1qyDnWUro1JaUAm8tgps8gnE/HLN3mNNg5rXbR98bLx43UvusNy47lq6SPSWXsVCs4X8+K7nN4zxv5RVALyK9OZnk/4/kHV5v9V9BOMpJ65OlkU5x1ZslvieFEF09Nk5nMxevHQd/ln5EK126m59teTsbq3KYgZqedPK5143Q7ErkwZaBYszS0IDR5/7Frr0s1BhahU0zgx59gPLWCedsOLxDeq/6spM7bVH0Aho41+zVmSTmdYxYq1fCm/LqglQIWhcPLlVslzuWm8mXNQ9W8xS4MkV2yVrr8p+HgX9bvfvaJ0ejIomuJRSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbws6XEjTz3OHN+hyX3XASeiSb1CULjlNqWzestCVpE=;
 b=DGO3539XckMfpeVdg8M03xFaA+ls4Z/5NFKC4HcC7GgBonVRRCCcVF9mf25ZtpIzIXPZMQFD1GplYtGKO040FVfDQWyK/tB3xgi7pIglHNCiSYMuWEZ6jxaf4r9adh2BH8NuGpba8hVm/jqReNr7s377NXKxS4ImXEpppDTgp4E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a6873a10-6456-018f-243c-e492fcb6c42a@amd.com>
Date: Fri, 3 Mar 2023 10:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
 static heap on qemu
To: Jiamei Xie <Jiamei.Xie@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Wei
 Chen" <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <20230302044421.136068-1-jiamei.xie@arm.com>
 <20230302044421.136068-2-jiamei.xie@arm.com>
 <alpine.DEB.2.22.394.2303021748290.863724@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7696EEB381C01A703B5E431E92B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <6faaff70-e0ce-c691-5b1f-202a2c183e24@amd.com>
 <AS8PR08MB76962E558A1408184734098E92B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB76962E558A1408184734098E92B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT037:EE_|BL1PR12MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5416f061-c251-49d9-d46a-08db1bccf390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+pkiDm/gUJCGQXma75zumES7oNfGbee0mIBfHjAy6czKWdSRXERgqfFE4O8pEyr8V1I2NgGKRoUF8QuEV9RCPCn3vu5VwOsDwFNgRiXAQ/4IrIFrsmZSB6P8ya73C/VVfDGUhuCRt9VzGmK15fB9//1QJhpQP/y4DQ18fBZKyNux60YIntofyKr9SJkTHlwrqgkO4vY//YD1qbuDGeJch2zUbj5NSL46V0HKpic5oEzXQBae0lawEdLHQ9WBqKndqWYgfIwHQaFJ1iUk+TEaBWzUcBqzd4T7mhwuifAiJ9ipBGKTs4N3ehyk4TD+GRkTfvVI8WjA4d5Wmr5puergun74+M1ce91E36T40wvaHPsUOR5XXW9igWq8zopeOkDg5htK8FLjo5rhnRFzX1C9oebn/C9GxrAkPS8LqczTRzMd87VkZVIYHKDQH2W5e3vu7tDFSUpfuNmdwZdEGN9XIFe6/bwPIMfs/FVrgediyug81fhWRuvMsBIxDQ6dldUwRLXkD4XmgM3ewN5ID4AqtQXEVmptlEbdVDHnmXiwywmLY2WCbvz+VuOWtajll7ptUKdfexGcM4d06n2EYHwWMqOyW7d2BLLWyGZMd/wB0bgNjsaWGjM5MHm1IyCOZgPA6H6nnFgg3ilKKi0s6TujrDy6F7TdFUqJBc4hkCLHj3mvX/BzsAWfPlIi9Z4HuIH4U5ZtDqLzUaPj5DubDrJ+gCGRy2gKII/n8jTgr3bWl9lV59d74H6wL0fk/gdNubCbQLQFyNinQy2eiOfnonP1Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(46966006)(40470700004)(36840700001)(16576012)(316002)(478600001)(47076005)(110136005)(54906003)(83380400001)(81166007)(44832011)(2906002)(5660300002)(82740400003)(36756003)(86362001)(31696002)(82310400005)(356005)(4326008)(426003)(70206006)(40460700003)(70586007)(8676002)(40480700001)(41300700001)(36860700001)(8936002)(336012)(31686004)(26005)(2616005)(186003)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 09:52:07.5284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5416f061-c251-49d9-d46a-08db1bccf390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127

Hi Jiamei,

On 03/03/2023 10:13, Jiamei Xie wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>> Sent: Friday, March 3, 2023 3:47 PM
>> To: Jiamei Xie <Jiamei.Xie@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
>> Bertrand Marquis <Bertrand.Marquis@arm.com>; Doug Goldstein
>> <cardoe@cardoe.com>
>> Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
>> static heap on qemu
>>
>> Hi Jiamei,
>>
>> On 03/03/2023 07:49, Jiamei Xie wrote:
>>>
>>>
>>> Hi Stefano,
>>>
>>>> -----Original Message-----
>>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>>> Sent: Friday, March 3, 2023 9:51 AM
>>>> To: Jiamei Xie <Jiamei.Xie@arm.com>
>>>> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
>>>> sstabellini@kernel.org; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>>>> Doug Goldstein <cardoe@cardoe.com>
>>>> Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
>>>> static heap on qemu
>>>>
>>>> On Thu, 2 Mar 2023, jiamei.xie wrote:
>>>>> From: Jiamei Xie <jiamei.xie@arm.com>
>>>>>
>>>>> Create a new test job, called qemu-smoke-dom0less-arm64-gcc-
>> staticheap.
>>>>>
>>>>> Add property "xen,static-heap" under /chosen node to enable static-heap.
>>>>> If the domU can start successfully with static-heap enabled, then this
>>>>> test pass.
>>>>>
>>>>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>>>>
>>>> Hi Jiamei, thanks for the patch!
>>>>
>>>>
>>>>> ---
>>>>>  automation/gitlab-ci/test.yaml                 | 16 ++++++++++++++++
>>>>>  .../scripts/qemu-smoke-dom0less-arm64.sh       | 18
>>>> ++++++++++++++++++
>>>>>  2 files changed, 34 insertions(+)
>>>>>
>>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-
>> ci/test.yaml
>>>>> index 1c5f400b68..5a9b88477a 100644
>>>>> --- a/automation/gitlab-ci/test.yaml
>>>>> +++ b/automation/gitlab-ci/test.yaml
>>>>> @@ -133,6 +133,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-
>>>> staticmem:
>>>>>      - *arm64-test-needs
>>>>>      - alpine-3.12-gcc-debug-arm64-staticmem
>>>>>
>>>>> +qemu-smoke-dom0less-arm64-gcc-staticheap:
>>>>> + extends: .qemu-arm64
>>>>> + script:
>>>>> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
>>>> 2>&1 | tee ${LOGFILE}
>>>>> + needs:
>>>>> +   - *arm64-test-needs
>>>>> +   - alpine-3.12-gcc-arm64
>>>>> +
>>>>> +qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
>>>>> + extends: .qemu-arm64
>>>>> + script:
>>>>> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
>>>> 2>&1 | tee ${LOGFILE}
>>>>> + needs:
>>>>> +   - *arm64-test-needs
>>>>> +   - alpine-3.12-gcc-debug-arm64
>>>>> +
>>>>>  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
>>>>>    extends: .qemu-arm64
>>>>>    script:
>>>>> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>>> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>>>> index 182a4b6c18..4e73857199 100755
>>>>> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>>>> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>>>> @@ -27,6 +27,11 @@ fi
>>>>>  "
>>>>>  fi
>>>>>
>>>>> +if [[ "${test_variant}" == "static-heap" ]]; then
>>>>> +    passed="${test_variant} test passed"
>>>>> +    domU_check="echo \"${passed}\""
>>>>> +fi
>>>>> +
>>>>>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>>>>>      # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
>>>>>      passed="${test_variant} test passed"
>>>>> @@ -128,6 +133,19 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>>>>>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base}
>> ${domu_size}\"" >>
>>>> binaries/config
>>>>>  fi
>>>>>
>>>>> +if [[ "${test_variant}" == "static-heap" ]]; then
>>>>> +    # ImageBuilder uses the config file to create the uboot script.
>> Devicetree
>>>>> +    # will be set via the generated uboot script.
>>>>> +    # The valid memory range is 0x40000000 to 0x80000000 as defined
>>>> before.
>>>>> +    # ImageBuillder sets the kernel and ramdisk range based on the file
>> size.
>>>>> +    # It will use the memory range between 0x45600000 to 0x47AED1E8,
>> so
>>>> set
>>>>> +    # memory range between 0x50000000 and 0x80000000 as static
>> heap.
>>>>
>>>> I think this is OK. One suggestion to make things more reliable would be
>>>> to change MEMORY_END to be 0x50000000 so that you can be sure that
>>>> ImageBuilder won't go over the limit. You could do it just for this
>>>> test, which would be safer, but to be honest you could limit MEMORY_END
>>>> to 0x50000000 for all tests in qemu-smoke-dom0less-arm64.sh because it
>>>> shouldn't really cause any problems.
>>>>
>>> [Jiamei Xie]
>>> Thanks for your comments. I am a little confused about " to change
>> MEMORY_END to be 0x50000000".
>>>  I set 0STATIC_HEAP="0x50000000 0x30000000" where is the start address.
>> Why change MEMORY_END
>>>  to be 0x50000000?
>> Let me answer to that question so that you do not need to wait another day
>> for Stefano.
>> ImageBuilder uses MEMORY_START and MEMORY_END from the cfg file as a
>> range in which it can instruct
>> u-boot where to place the images. It is safer to set MEMORY_END to
>> 0x50000000 rather than to 0xC0000000
>> because you will be sure that no image will be placed in a region that you
>> defined as static heap.
> 
> Got it, thanks!  Another question,  set MEMORY_END=0x50000000 for all test cases or just this test cases ? Currently I run the test case manually without xen gitlab ci enviroment . If set this for all test cases, all test cases should be tested.
You can set it globally as it will be helpful also for static-mem and other test cases should not be impacted.
Before pushing any commit related to CI, the maintainer shall check that it does not cause any issues
by running the pipeline on his account before committing a patch.

~Michal

