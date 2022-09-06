Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA145AF713
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400244.641966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIS-0008DH-Ro; Tue, 06 Sep 2022 21:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400244.641966; Tue, 06 Sep 2022 21:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIS-0007tU-7p; Tue, 06 Sep 2022 21:39:52 +0000
Received: by outflank-mailman (input) for mailman id 400244;
 Tue, 06 Sep 2022 21:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BE3u=ZJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVgGw-0000Cs-1s
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a48817ac-2dc4-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 11:16:52 +0200 (CEST)
Received: from MW4PR03CA0060.namprd03.prod.outlook.com (2603:10b6:303:8e::35)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 09:16:53 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::84) by MW4PR03CA0060.outlook.office365.com
 (2603:10b6:303:8e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Tue, 6 Sep 2022 09:16:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 09:16:53 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 04:16:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 02:16:49 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 6 Sep 2022 04:16:48 -0500
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
X-Inumbo-ID: a48817ac-2dc4-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zrcud4zjm0uLzTOtZtqnpcTpBxy39XYDL4qU2Touq1z8gGCjPNSjxNhwN3myTikb0aWtEA3vUCK+BZyknARs+VwiDZrJAr0kAEnc7VFjST0p31cv/9DaCi25SiSuJ2HiwXy6WzRJQ5wcUeHqG7hxibJfJZzUt50yXYOzKNjq0XPGchGbstiascCPRJ3un77gLjmagumJoKwfndMPTa5PNLowg0incw2FW0C8ZAtnuNgDAmWAT1BV/vFOLaHKhhDxWKitd5RAmROptyk0zNYf4liH4p8hx66PF2XLjkEIo8Qan0OQ6/fiLO3OrMpsMn/rlpKxxVJ3N6qAUk7MVWLyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcADeNm6ohzugDn4jUd/ihSrmEXvgLlWBWbXBvvAnoE=;
 b=dMbXrn6E0y5QcDPTveZ1CVcAHaV1Rcm8Ywq5bWK3s4Ff61Ka4meYj2/CGKFC3NbnlVxqEzxmQSE6VLhdohgZwZxefFlPyEXmbyV3uuxGR7xm8w2SOsg2kb0bioRv1tbuRyB3W2p1Vqt1zmvsrV5q0825GGN3geZ/VDaccUSxgpIuBZCeafsbRs2yhtDntRuQBgvdPLMRPCItyzp75NI/SUhKK3N3sjHoMf7c/g/Ogg1ViJKpQDinUtym8f72TlenXMTsvt9togFHCbohHYUpR9j2KJF4sXspAsaSW/xuDyB8WRfvj+o6ZjK3GemmGDqf7h0NqVb+vf0663nwDIs7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcADeNm6ohzugDn4jUd/ihSrmEXvgLlWBWbXBvvAnoE=;
 b=V43bjm45nuh3hVpbS2VH+IEXRlX7/TW4jWgrZvyzi209+IsoBca2vJ9HLQypesix3VVKcGzMwPmJUSrDHLbJ1xSWwqsSXFfuTnmjN7pzaqmUTVzcffeZw3g4xIYOKqH9KCz2Sg2yTgOPVF1BU2mcUsZD3i9MIzLU8rvDkji0qdk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <606db72f-2283-6e37-4920-a21da1d70b3d@amd.com>
Date: Tue, 6 Sep 2022 11:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-4-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209021645160.3931@ubuntu-linux-20-04-desktop>
 <98b712c1-2a02-9baa-b816-3c28cccaf74e@amd.com>
 <alpine.DEB.2.22.394.2209051552230.3931@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209051552230.3931@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfdd8f3-0238-4bf3-9ac6-08da8fe889f5
X-MS-TrafficTypeDiagnostic: CH2PR12MB4327:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0GoFJ9vkGCYiJ0cSolY6ywRgY0cqIpqbgT9R3K4Baw6uRq9ALt8ga8VZB77LthXac7tTyIIfB9cg6BbHNQi2CEfOzd+3XSRakWMjhC+CqBnRd5vEH9+H2M4+OmjBV84+ae4vCdFnFnegRYHXseEqGL042+dfX6rXboqnEmddrCvcGjq2uDAQGREq1OIcLVBhMlNmVVd6wXklZVGWAPFHu+4vYAGqhAitHR6jElL5tPmxpmuUqi4tgqkH830eNQrGmCo1lbgLXlshDNIwfqijtHElRx5V/E4s9XwRNnVrqfVwkochwNgKHy88quqVsGWkCWNR5tPUmQyhnpiw7MF1qj9sYM6/Dl/8Ec0KFE2uvfgEh2T1n2+VfP73jy2hr/xaZn3FBp/hc2/ldXtjlHcoELTIcmQ/qR3SsVpClTVAVlC2ChtncfycL8h02djm9dqHae5O7qDbnXWwK9QFJNl5q0E+H1Q3Cwf8avGtZgDCOysqx+cWIPEfuaTWIahMvZKdw/Gy5V9eVS/sDR9ca9H8TYRhoB2H/8JIogSXGXZy5081o64kZMUUKVVdSjojkw0D3R/3ONbMLgPw/A9R2AwNE9LNXhMxfiw1+fc+6aGk90IEiUdtAzO4xiQnx2BzgUvRJBQLIcG7/Nx2W4wc/uZysvUTBYoq0iFCt6Iyes2wmA9HvGcO6Qd9pUHHxlkvnVxfcXbcUE88MUui+8rdtJm/KLE0RV2UaRgDcgQia//OAJ/pR8T62I85BtUy94i4X5gypaqXqM1YCi8GCuk5vkm6gJUZuJAflEybK6mCpEO/ixC1t3gkfBY8wcfwBHgS9f3cjP3vbcFujDj9Uow8mtrMB8uOqIOQTICdPO7qx23gzq0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(26005)(2616005)(83380400001)(336012)(40480700001)(2906002)(44832011)(8936002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(426003)(47076005)(31686004)(53546011)(478600001)(186003)(82310400005)(36860700001)(40460700003)(356005)(70586007)(6916009)(8676002)(54906003)(4326008)(316002)(16576012)(70206006)(82740400003)(81166007)(157313001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:16:53.4230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfdd8f3-0238-4bf3-9ac6-08da8fe889f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327

Hi Stefano,

On 06/09/2022 01:21, Stefano Stabellini wrote:
> 
> On Mon, 5 Sep 2022, Michal Orzel wrote:
>> Hi Stefano,
>>
>> On 03/09/2022 01:49, Stefano Stabellini wrote:
>>>
>>>
>>> Currently this test fails with:
>>>
>>> + fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
>>> + [[ boot-cpupools == \b\o\o\t\-\c\p\u\p\o\o\l\s ]]
>>> ++ fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle
>>> Error at 'phandle': FDT_ERR_NOTFOUND
>> My bad. The qemu version used by CI does not generate phandles for cpus.
>> So the fix is very straightforward and requires putting custom phandle for cpu@1.
>>
>> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
>> index c2184850293c..158d5665d71d 100755
>> --- a/automation/scripts/qemu-smoke-arm64.sh
>> +++ b/automation/scripts/qemu-smoke-arm64.sh
>> @@ -50,8 +50,9 @@ fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
>>
>>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>>      # Create cpupool node and assign it to domU0
>> -    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
>> +    cpu_phandle="0xfffffe"
>>      cpupool_phandle="0xffffff"
>> +    fdtput binaries/virt-gicv2.dtb -p -t x /cpus/cpu@1 phandle $cpu_phandle
>>      fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
>>      fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
>>      fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
> 
> 
>>> Given my other comment below, I would leave this code as is.
>>>
>>>
>>>> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
>>>> +    # Create cpupool node and assign it to domU0
>>>> +    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
>>>> +    cpupool_phandle="0xffffff"
>>>> +    fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
>>>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
>>>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
>>>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/domU0 domain-cpupool $cpupool_phandle
>>>> +
>>>> +    # Check if domU0 (id=1) is assigned to Pool-1
>>>> +    passed="${test_variant} test passed"
>>>> +    dom0_check="if xl list -c 1 | grep -q Pool-1; then echo ${passed}; fi"
>>>> +fi
>>>
>>> I would prefer to keep the device tree editing here to a minimum and
>>> instead add boot-cpupool support in ImageBuilder and add CPUPOOL* config
>>> options to the existing config file for ImageBuilder created in this
>>> file below. This way, we keep this test cleaner and we help more the
>>> user by proving a way to set boot-cpupools more easily in general, also
>>> useful outside gitlab-ci.
>>
>> I agree that ImageBuilder is a great tool. However, I would opt for keeping what I did because of the following:
>> - current release schedule (we could benefit from having a test for 4.17 feature instead of waiting for the corresponding
>>   change to be done in ImageBuilder first and tested),
>> - test is already prepared and requires just a trivial fix,
>> - we should not enforce users willing to add tests to gitlab-ci to always prepare the ImageBuilder changes first.
>>   ImageBuilder is not meant to support all the features strictly because some of them require too much
>>   end-user knowledge and digging into device tree (it should stay as simple as possible),
>> - all in all we need to have a way to modify the dtb and fdtput is certainly better than sed as it does not
>>   require additional steps for decompilation/compilation and its commands look more clean than using sed transformation.
>>
>> Let me know what you think.
>>
>> On a side note, I can add boot-time cpupools support in ImageBuilder to my TODO list so that we can check if this is something
>> ImageBuilder should support. If yes, we can modify this test after the release.
> 
> 
> Yeah, ImageBuilder doesn't necessarely need to support every feature.
> However, a tool (if not ImageBuilder, Lopper, or a new ImageBuilder
> script) should support CPUPOOLs to enable the user.
> 
> You are right that ImageBuilder is not necessarely tied with gitlab-ci.
> This is especially true once we start doing more interface-level
> testing, such as hypercalls fuzzing with XTF. We are not going to be
> able to use ImageBuilder to trigger every possible device tree boot time
> combination, especially the ones that are invalid. We want to be able to
> test Xen with invalid device tree input as well.
> 
> In addition to interface-level testing, we need user-level testing to
> test features the way we expect a user to use them. This is what
> ImageBuilder is for and that is why it has been used today in gitlab-ci.
> On ARM today we only have user-level testing in gitlab-ci, but I'd love
> to have more interface-level testing, which will surely require more
> device tree manipulations outside of ImageBuilder.
> 
> - user-level tests -> ImageBuilder, common valid configurations
> - interface-level tests -> not ImageBuilder, various valid and invalid
>                            configurations, maybe automatically generated?
>                            Device tree manipulations expected in gitlab-ci.
> 
> 
> In my view, this test belongs to the "user-level test" category, this is
> why I would prefer if it was done using the same tool that we expect the
> user to use. Ideally, it would be ImageBuilder because that is the tool
> that we have used so far (but it could be a new script under
> ImageBuilder or Lopper).
> 
> But I understand deadlines, release schedule, etc., so if you think it
> cannot be done properly using ImageBuilder in 2-3 days, then I would
> take this patch as is, and we can revisit it in the future as you
> suggested. I am OK with that too.

Ok, let me see if I can come up with a clean solution in the ImageBuilder.

~Michal

