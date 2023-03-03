Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF286A91E9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505593.778450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY08L-0000Xb-Px; Fri, 03 Mar 2023 07:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505593.778450; Fri, 03 Mar 2023 07:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY08L-0000VD-My; Fri, 03 Mar 2023 07:47:17 +0000
Received: by outflank-mailman (input) for mailman id 505593;
 Fri, 03 Mar 2023 07:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY08L-0000V7-0f
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:47:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d828016-b997-11ed-96ae-2f268f93b82a;
 Fri, 03 Mar 2023 08:47:15 +0100 (CET)
Received: from DS7PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:3b5::29)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 07:47:12 +0000
Received: from DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::da) by DS7PR03CA0054.outlook.office365.com
 (2603:10b6:5:3b5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 07:47:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT074.mail.protection.outlook.com (10.13.173.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 07:47:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 01:47:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 23:47:11 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 3 Mar 2023 01:47:10 -0600
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
X-Inumbo-ID: 9d828016-b997-11ed-96ae-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJtbGHkfuyQWFBEtxHLPJnZML9pp4TiQrlE0Ecu4pIShyD4wg53JJ4XB5B2pplnVx6DWvelpRz0/VYkyC0lj95Kydxln7o/M9x2rrNws3i61JmmRGv+0F34379cDuYrrbLHIoMIW8IOxtryV9Wlkl8CINsWiiU+/3HRN6JJ3yA4QsjJFZUjWBN4+egIy+HkZKBo3zrMZQGMQbFyguM4AHgTskix4QyjurxUQGTLqUUDh7zkpYfOgRjhtuQtLBoA4KMr5fB38dEqj0MC6QV9g/jouQOLYCJ+odD7XAJJ2Ps0hJ5YryxJJfFbq8sU5d9KnxYIqbtTluPmBVc+RJczbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn4C1Yj/tIGltVY4jm6mElx+EHGU2iU4XLtA8xwP7N4=;
 b=aK6kj94zfE44dNNh+zTwo2xc+Gn/UlA/GiAnKwDDxJNOTk7PVMDPGjKNNe/BNhVAN/PEeNy+0YTKR3NXH7JQMpgt5t5yWm1RURkYIxG9JpZMozoC3PgQ9z7XQZnKo7bdmXaRxRIOGP7XGtHnQRbifz9ZCU6wfEKpvjo4lvguIraW40kT0sQoFzIZQofzH33YlNp7svKRQaFbxaQCYCXsxPz/QWQDCJBitKrknCyBRBzFThof3XyEVfj4PeCY5s+AdgpfiSl+vbbzUBQ5EtPU/64BXsIQvks1KWljz8eW8cHTwH+B6L+iAojcXFmBIB9AY264vqPhCA8ad1yQ/LLl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cn4C1Yj/tIGltVY4jm6mElx+EHGU2iU4XLtA8xwP7N4=;
 b=HapOFE96/3DtAHDwKOVkUKlLW8/JEu0UsRg6S3me00ppiGPgjQu84SWUgRcVA9y9EzAnz73g345oM72mGPjcb7c9xIcziI5fslFKzm/wcOVrBP7MSxFG3m4bnstBWIgC9a7/s6we0TiXibMkJX9IJh3Grie6fScUy3yKBwegNqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6faaff70-e0ce-c691-5b1f-202a2c183e24@amd.com>
Date: Fri, 3 Mar 2023 08:47:09 +0100
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
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7696EEB381C01A703B5E431E92B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT074:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 729dbd50-731d-4510-2b6f-08db1bbb7fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IPXkMMMVY0gA8Oy4cc2yPtM/qpjJmJ3q3hRvSzdDr5COHslTuxn8w/uI4lxF67JWasD0nZc4qCR8DkiUPRy1b5TQkAZnfCJUymvDP/2X+QOs9bCn6Jmuic0PFkKexBMgl1WXdy32cdyOsK6/suz9rm6yjQU3fOXeByKQHAESnR8gn7A0IyjxJJ0EsKPwRWrybmmvYAQoMRmG4/JkIalY8mBJ5qHcPvlEBlxxwNQxY82eMxEEPZAxUvZHzebFUzAbVW6dxVV4x7u8+f+J/gqCn4ZTGcreRQ9aBO9M+8ZXl6k2Mu3yARoxYOMS5DEoeLHAjSfeWobtrrmfs/cCxH7QW3q5/72oPCTn7qLdKgNyKqanvoUm7Fahk/DF4ltPtFY4O8/ODLipq4kAQ4sp8qX3/ImqsjlEGE7FU5Z0H/6kjMTImCsVKiLjbJvJ/1DyjsYM9piNt9tVI4yy3osKz0uq3Z/cBjNqwsvHqQlHq0E3ZwzZqpANieljlVhRc0G0r0D1qIbn4b0ICrT3tJ+XA/wyO/pHA7S0s0LfUH68vie51SlBMOzggkC+0xxO2/84r7DqZhoVZBkJ+2jWLC/RcqvewXWidv09a5TBk+q3fd6T2Qgv3DfuecuNxu6FsoiuQ1YsNBR2myp0jIV5qfdzfNKPU8pyFOW3ka4jFXzco/2E6PX8CDkeTQUzJFOiNC1jWXjPjaDZjKBOvB2a1hEo79It9RcW+MIqLim3MGvmu7PKc/bVglC2LzO+HgZ1vXZM7vhhF4LfuA2NfQH4Z8Ld5iLqAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(16576012)(8676002)(82310400005)(70206006)(70586007)(2906002)(44832011)(316002)(8936002)(36756003)(40480700001)(4326008)(41300700001)(336012)(40460700003)(426003)(47076005)(83380400001)(26005)(86362001)(53546011)(186003)(2616005)(356005)(110136005)(31696002)(478600001)(54906003)(82740400003)(81166007)(36860700001)(5660300002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 07:47:12.0770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729dbd50-731d-4510-2b6f-08db1bbb7fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

Hi Jiamei,

On 03/03/2023 07:49, Jiamei Xie wrote:
> 
> 
> Hi Stefano,
> 
>> -----Original Message-----
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: Friday, March 3, 2023 9:51 AM
>> To: Jiamei Xie <Jiamei.Xie@arm.com>
>> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
>> sstabellini@kernel.org; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Doug Goldstein <cardoe@cardoe.com>
>> Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
>> static heap on qemu
>>
>> On Thu, 2 Mar 2023, jiamei.xie wrote:
>>> From: Jiamei Xie <jiamei.xie@arm.com>
>>>
>>> Create a new test job, called qemu-smoke-dom0less-arm64-gcc-staticheap.
>>>
>>> Add property "xen,static-heap" under /chosen node to enable static-heap.
>>> If the domU can start successfully with static-heap enabled, then this
>>> test pass.
>>>
>>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>>
>> Hi Jiamei, thanks for the patch!
>>
>>
>>> ---
>>>  automation/gitlab-ci/test.yaml                 | 16 ++++++++++++++++
>>>  .../scripts/qemu-smoke-dom0less-arm64.sh       | 18
>> ++++++++++++++++++
>>>  2 files changed, 34 insertions(+)
>>>
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index 1c5f400b68..5a9b88477a 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -133,6 +133,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-
>> staticmem:
>>>      - *arm64-test-needs
>>>      - alpine-3.12-gcc-debug-arm64-staticmem
>>>
>>> +qemu-smoke-dom0less-arm64-gcc-staticheap:
>>> + extends: .qemu-arm64
>>> + script:
>>> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
>> 2>&1 | tee ${LOGFILE}
>>> + needs:
>>> +   - *arm64-test-needs
>>> +   - alpine-3.12-gcc-arm64
>>> +
>>> +qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
>>> + extends: .qemu-arm64
>>> + script:
>>> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap
>> 2>&1 | tee ${LOGFILE}
>>> + needs:
>>> +   - *arm64-test-needs
>>> +   - alpine-3.12-gcc-debug-arm64
>>> +
>>>  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
>>>    extends: .qemu-arm64
>>>    script:
>>> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>> index 182a4b6c18..4e73857199 100755
>>> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>>> @@ -27,6 +27,11 @@ fi
>>>  "
>>>  fi
>>>
>>> +if [[ "${test_variant}" == "static-heap" ]]; then
>>> +    passed="${test_variant} test passed"
>>> +    domU_check="echo \"${passed}\""
>>> +fi
>>> +
>>>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>>>      # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
>>>      passed="${test_variant} test passed"
>>> @@ -128,6 +133,19 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>>>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >>
>> binaries/config
>>>  fi
>>>
>>> +if [[ "${test_variant}" == "static-heap" ]]; then
>>> +    # ImageBuilder uses the config file to create the uboot script. Devicetree
>>> +    # will be set via the generated uboot script.
>>> +    # The valid memory range is 0x40000000 to 0x80000000 as defined
>> before.
>>> +    # ImageBuillder sets the kernel and ramdisk range based on the file size.
>>> +    # It will use the memory range between 0x45600000 to 0x47AED1E8, so
>> set
>>> +    # memory range between 0x50000000 and 0x80000000 as static heap.
>>
>> I think this is OK. One suggestion to make things more reliable would be
>> to change MEMORY_END to be 0x50000000 so that you can be sure that
>> ImageBuilder won't go over the limit. You could do it just for this
>> test, which would be safer, but to be honest you could limit MEMORY_END
>> to 0x50000000 for all tests in qemu-smoke-dom0less-arm64.sh because it
>> shouldn't really cause any problems.
>>
> [Jiamei Xie]
> Thanks for your comments. I am a little confused about " to change MEMORY_END to be 0x50000000".
>  I set 0STATIC_HEAP="0x50000000 0x30000000" where is the start address. Why change MEMORY_END
>  to be 0x50000000?
Let me answer to that question so that you do not need to wait another day for Stefano.
ImageBuilder uses MEMORY_START and MEMORY_END from the cfg file as a range in which it can instruct
u-boot where to place the images. It is safer to set MEMORY_END to 0x50000000 rather than to 0xC0000000
because you will be sure that no image will be placed in a region that you defined as static heap.

~Michal


