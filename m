Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53522624030
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 11:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441761.695814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot50s-0007Kw-KS; Thu, 10 Nov 2022 10:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441761.695814; Thu, 10 Nov 2022 10:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot50s-0007IX-H8; Thu, 10 Nov 2022 10:42:26 +0000
Received: by outflank-mailman (input) for mailman id 441761;
 Thu, 10 Nov 2022 10:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n6Q=3K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ot50q-0007IR-E8
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 10:42:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab5b1fd-60e4-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 11:42:21 +0100 (CET)
Received: from CY5PR17CA0052.namprd17.prod.outlook.com (2603:10b6:930:12::30)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 10:42:18 +0000
Received: from CY4PEPF0000B8EA.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::fc) by CY5PR17CA0052.outlook.office365.com
 (2603:10b6:930:12::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Thu, 10 Nov 2022 10:42:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EA.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Thu, 10 Nov 2022 10:42:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 04:42:17 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 10 Nov 2022 04:42:16 -0600
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
X-Inumbo-ID: 5ab5b1fd-60e4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cp882Mgrg18cj46MZeMmVLuDGMOpXZ5fQaCp87ky+BdGrgTx0vGuRp1ooNowrgFhhTsemC2focEgZo9pKRUbg/SbnJTE/cn5nYwGBGOU0/NgUzXHXIhLLxDM+OlpAclZxOVoC7t/LhucKMRbBBEu0Z7Mdszv/qQDpQpv6A6SZtADvIRnspLFvNy/9oE3W9PBGwuumU0EKERHsIjU0sFHgXLUgApxijjHfzZDOysxw6SLKa0Et9z1Os68VJOntLIlacHEwO8RONxnov+J1srbTS+jN0xQwCubM5l7bS+mE4libtkK/bCkGYDUdm1SXaLOB3VEXXLeKbEmC7uEJ7gQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wpK/MZduZEZ5kc8kxQotTlW3ZytiACOd0D/Vt6r81U=;
 b=O7psCbXVYeGBZHlPshzFTFOlJg5z6UfASFpuaopn0sYmRlm6Wpk12MUvEbWjHVYBmSD6mn/DZ9T0g+vdfHt5g5C/5jJGfh5FxW8paPT7PqsRaBA3PxpJ/9v6IqQ4BLCn9eC97gcynMvNyL6mEB0CukObnZURynmQYVQJhesMWDB+fH2UfyS8Bq4eoAm4CNrXDVKReqfQiON8VgHBV+RNI5WsqjZXsHwc3X1ojzuxcowrLeh2Q9hX/RuEUWdqs2l9R+Is/qKttcl8jViTwzB+Myis3pxmssdy4D3u9IQ7FXPzEDcQh5pYYDm9LySriNir3XnurQ1kf/Dvm38ghk8mow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wpK/MZduZEZ5kc8kxQotTlW3ZytiACOd0D/Vt6r81U=;
 b=HjzCQMjB0br7P8522q6DmMmw2kGBCoUAmMq6vQGuRnwJouLZz58XK3mvgfb1clMs7oAA0CL3H3+ZWxammlbEECEA+/XL0niyA54sgUy02esjUpVLaOYkMK9iid+KjZaOY0OcFFyPEvhcTdsL0PUAPZvrm4z7+SW2sG97c/XI1Wg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4e486399-8e17-9663-d29a-6edad331d84a@amd.com>
Date: Thu, 10 Nov 2022 11:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
 <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
 <1C829AF9-8DFF-47FA-8334-09A31AA9B069@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1C829AF9-8DFF-47FA-8334-09A31AA9B069@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EA:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 8890dc42-85e5-4015-b090-08dac3083ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i2Jyc2vB06db3303LYBPzL/sGQINV1X1jNF5QaUj7s2Rm/uXglhQEVILVNqajQwR/zRGWWM2f3OltAWgYUTS9MY2rhuekpb5J4PKKlXZhoX61HtohrWQFG0QETRmGCDxnqGw/SLr0gEnbT16cvqp0vFbYZdiOlhu7k7JdtlyYUeh819cDIWSVKFag8aJsZ5gRX8TNYL4Ti3+a9CcMGfmBageJl90AUaOsNtOZ5oj54nMXXXoD/co58R9wjV+03sVDL3wlj1VvEgAmedglYbFdYWdoTxdeOyg0rpf9Gj7Oz4o8vcn02HPmaywwtkczpKEg68EvRR7ypNbCx9dOtw0M9lT6kVPok8W2dr5VQidaQEhUR+T5GUochrGM2c8UIu14FxfPT+/PVV550IbWDQzymG5MSUiqo38v7KH49nZpsjKEuMfeAzKfG7s4fYG78GhDJbOn33LgKPJB89NxEisOWnZquWYAFv7RuhUj4TIfme3tV2ZYajnHTMMVxf1hcoQqQlw7tjT2Hv2X/FGGKSS5FrkHTZq7de5UMwebnCEFrLUWaVYhiXRsAtK55xhSb5oEaxvn2d9B3C3nyvIcOwk4y/EnlqovGa07F2e5uBaN/4ctADEJ+BhYpDNntO06m68Flhsrl/YtNs/jWrFL/djJ42AGGFJ+9cF3bWf9mFZtYvMxuJvXMI0x44+AXLB8+hMiU2D4Wzk9cHxiT04rNRAc9wk4nUf/IWp+I6s/DMfr7UBe4cIjt7Xg9woYA3REoITh2CFuxMpLr5M5xHFCXhQfqeHnASqlhEtvMxP9E4M/ETgcEkGkS1eRPatqGZb6IaQcU0JfLa9eXMxhbmu/rBJb83WhZHvIbu+fquQmva+u35n6RYOh55fTiQejDi6QIy7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(44832011)(966005)(70206006)(41300700001)(8676002)(6916009)(70586007)(54906003)(16576012)(53546011)(316002)(4326008)(40480700001)(8936002)(5660300002)(45080400002)(478600001)(36860700001)(47076005)(2906002)(36756003)(82740400003)(81166007)(26005)(31696002)(336012)(40460700003)(426003)(186003)(83380400001)(86362001)(356005)(2616005)(31686004)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 10:42:17.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8890dc42-85e5-4015-b090-08dac3083ced
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461

Hello,

On 10/11/2022 11:08, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 10 Nov 2022, at 07:34, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Stefano,
>>
>> On 10/11/2022 01:18, Stefano Stabellini wrote:
>>>
>>>
>>> On Mon, 7 Nov 2022, Michal Orzel wrote:
>>>> Hi Bertrand and Stefano,
>>>>
>>>> On 31/10/2022 16:00, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> Hi Bertrand,
>>>>>>
>>>>>> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>> This patch series is a first attempt to check if we could use Yocto in
>>>>>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>>>>>>
>>>>>>> The first patch is creating a container with all elements required to
>>>>>>> build Yocto, a checkout of the yocto layers required and an helper
>>>>>>> script to build and run xen on qemu with yocto.
>>>>>>>
>>>>>>> The second patch is creating containers with a first build of yocto done
>>>>>>> so that susbsequent build with those containers would only rebuild what
>>>>>>> was changed and take the rest from the cache.
>>>>>>>
>>>>>>> The third patch is adding a way to easily clean locally created
>>>>>>> containers.
>>>>>>>
>>>>>>> This is is mainly for discussion and sharing as there are still some
>>>>>>> issues/problem to solve:
>>>>>>> - building the qemu* containers can take several hours depending on the
>>>>>>> network bandwith and computing power of the machine where those are
>>>>>>> created
>>>>>> This is not really an issue as the build of the containers occurs on the local
>>>>>> machines before pushing them to registry. Also, building the containers
>>>>>> will only be required for new Yocto releases.
>>>>>>
>>>>>>> - produced containers containing the cache have a size between 8 and
>>>>>>> 12GB depending on the architecture. We might need to store the build
>>>>>>> cache somewhere else to reduce the size. If we choose to have one
>>>>>>> single image, the needed size is around 20GB and we need up to 40GB
>>>>>>> during the build, which is why I splitted them.
>>>>>>> - during the build and run, we use a bit more then 20GB of disk which is
>>>>>>> over the allowed size in gitlab
>>>>>> As we could see during v2 testing, we do not have any space restrictions
>>>>>> on the Xen GitLab and I think we already decided to have the Yocto
>>>>>> integrated into our CI.
>>>>>
>>>>> Right, I should have modified this chapter to be coherent with your latest tests.
>>>>> Sorry for that.
>>>>>
>>>>>>
>>>>>> I will do some testing and get back to you with results + review.
>>>> I did some testing and here are the results:
>>>>
>>>> In the current form this series will fail when running CI because the Yocto containers
>>>> are based on "From ubuntu:22.04" (there is no platform prefix), which means that the containers
>>>> are built for the host architecture (in my case and in 99% of the cases of the local build it will
>>>> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means that all the test jobs would need
>>>> to specify x86_64 as a tag when keeping the current behavior.
>>>> After I built all the containers on my x86 machine, I pushed them to registry and the pipeline was successful:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F686853939&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ccc0a420856c64224e78208dac3037b95%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638036716985754450%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ARpspaYQlf7gujC11cS4dnR275cCJ6tMRC2J0FyhFIM%3D&amp;reserved=0
>>>
>>> When I tested the previous version of this series I built the
>>> containers natively on ARM64, so that is also an option.
>>>
>>>
>>>> Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
>>>> ```
>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>>> index 5c620fefce59..52cccec6f904 100644
>>>> --- a/automation/gitlab-ci/test.yaml
>>>> +++ b/automation/gitlab-ci/test.yaml
>>>> @@ -65,6 +65,9 @@
>>>>     paths:
>>>>       - 'logs/*'
>>>>     when: always
>>>> +  needs: []
>>>> +  tags:
>>>> +    - x86_64
>>>>
>>>> # Test jobs
>>>> build-each-commit-gcc:
>>>> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemuarm64
>>>> -  tags:
>>>> -    - arm64
>>>>
>>>> yocto-qemuarm:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemuarm
>>>> -  tags:
>>>> -    - arm32
>>>>
>>>> yocto-qemux86-64:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemux86-64
>>>> -  tags:
>>>> -    - x86_64
>>>> ```
>>>>
>>>> Now, the logical way would be to build x86 yocto container for x86, arm64 for arm64 and arm32 on arm64 or x86.
>>>> I tried building the container qemuarm64 specifying target arm64 on x86. After 15h, only 70% of the Yocto build
>>>> was completed and there was an error with glibc (the local build of the container for the host arch takes on my machine max 2h).
>>>> This enormous amount of time is due to the qemu docker emulation that happens behind the scenes (I checked on 2 different machines).
>>>>
>>>> So we have 3 solutions:
>>>> 1) Build and run these containers for/on x86_64:
>>>> - local users can build the containers on local machines that are almost always x86 based, in short period of time,
>>>> - "everyone" can build/push the containers once there is a new Yocto release
>>>> - slightly slower CI build time
>>>> 2) Build and run these containers for specific architectures:
>>>> - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
>>>> - faster CI build time (arm64 runner is faster than x86 one)
>>>> - someone with arm64 based machine (not that common) would have to build and push the containers
>>>> 3) Try to use CI to build and push the containers to registry
>>>> - it could be possible but what about local users
>>>
>>> From a gitlab-ci perspective, given the runners we currently have, we
>>> have to go with option 2). We don't have enough resources available on
>>> the x86 runner to run the Yocto jobs on x86.
>>>
>> That is what I reckon too. Running the Yocto build/test on CI using x86 runner will always be slower.
>> So, if we go with this solution, then the following is needed:
>> 1. Modify test jobs so that yocto-qemu{arm64/arm} uses arm64 tag to be taken by arm64 runner and use tag x86_64 for yocto-qemux86-64.
>> 2. Come up with a solution to build the yocto containers automatically for the above platforms + possibility to specify the platform for local users.
>>   Right now, these containers are being always build for the host machine platform, so without doing tricks like adding --platform or prefix to image name,
>>   one cannot build the Yocto containers that would be ready to be pushed to registry. We need to have a clean solution without requiring user to do tricks.
>>
>> The only drawback of this solution is that the person building the yocto-qemu{arm64/arm} container and willing to push it to registry,
>> needs to have access to arm64 machine.
> 
> I think we need to find a solution working for both possibilities.
> And we also need a solution so that one can have both kind of images so the host machine should be encoded in the container name somehow.
> 
>>
>>>
>>>> Regardless of what we chose, we need to keep in mind that the biggest advantage to the Yocto build/run is that
>>>> it allows/should allow local users to perform basic testing for all the Xen supported architectures. This is because
>>>> everything happens in one place with one command.
>>>
>>> That's right, but it should be possible to allow the Yocto containers to
>>> also build and run correctly locally on x86, right? The arm/x86 tag in
>>> test.yaml doesn't matter when running the containers locally anyway.
> 
> All in all, test.yaml only matter for gitlab.
> Maybe we could have it supporting both cases but only use one ?
> 
> Cheers
> Bertrand
> 
>>
>> ~Michal
> 

I think we are trying to over engineer this problem. We want to start using it asap and this is what we should care about.
If we start going into details, like adding more and more code (e.g take into consideration the fact that qemu emulation
works only on x86 and what about users having arm64 machine), we will start creating a mess.

CURRENT BEHAVIOR:
All the containers are build for the host machine architecture.
For me, it can stay as a default behavior so that all the local users can make use of it.

WHAT WE WANT:
The default behavior like above and the possibility to specify the platform the containers will be build for.
This is so that we can build the containers for arm on x86 and use it for registry to be used by CI.

RESULT:
Default behavior is used by local users allowing to perform relatively quick build and test.
Possibility to specify the platform is used by the person building and pushing the containers for CI runners.

We do not need any duplication in containers' naming or in test.yaml test jobs.
Test jobs specify tags to link the job with a proper runner and that is why the registry should
only have containers built for proper runners' architectures.

~Michal

