Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7E620C26
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 10:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439807.693874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osKrz-0004Dr-BF; Tue, 08 Nov 2022 09:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439807.693874; Tue, 08 Nov 2022 09:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osKrz-0004AX-7y; Tue, 08 Nov 2022 09:26:11 +0000
Received: by outflank-mailman (input) for mailman id 439807;
 Tue, 08 Nov 2022 09:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1osKrw-0004AR-RM
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 09:26:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c645918-5f47-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 10:26:02 +0100 (CET)
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by DM4PR12MB6208.namprd12.prod.outlook.com (2603:10b6:8:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 09:25:59 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::ec) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Tue, 8 Nov 2022 09:25:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Tue, 8 Nov 2022 09:25:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 03:25:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 01:25:27 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 8 Nov 2022 03:25:26 -0600
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
X-Inumbo-ID: 5c645918-5f47-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9k8zOUbsfiDDbV36XqkOguP/9Vv63O7OC0+VML39dqk8De0mMjU4i/LA0/A3g+Q5UClV7uT8Etux0LqbV9IQ8cLpc7Rzp5HA+4aoSPc8vepzCB2rjplorNSlpnoVDEMrz2S/bA3qmFPIYGL5snOZ6ftIXphRo+gVkdsdO2MqGbM0kQwB+EuMAI/SYGrsETk1DnCn3Su0coqy3X2PzBzKE0pzOSb21Xql+Yhza8NKzWKuHyhxpQ5JqqZLsOMYbXJO95um91y9uqV+4T3mR1rd0o6uhQn5wPuGTUo32esPUqJUmrxlou8gYljuKNCA+wg2u14uzlKVD88/u5JeZ8dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7Y0MyyARMq5DMZwJqAUPDAMgiVfUtjfsDipZCj8azI=;
 b=CBsJqb/pTK/WY/KVwDBU68M87eyUaBSTs6VVde/5dVlDRVpQpl8VtFCl8P+8YIoJ+ZFlKoSZq7BeoFlugJGhU9F9lvYUwJVxW118w0sR++UqzpbpfrR1zH7TGGlem7wNeNy1wGQ2FXG+ka2hyc05Yvzb7E8SIN3RnARHT5KtbYum8O+N6dvzcWyC3IwcgvshRZNTXsGacLUmcwAWQF73jtwazfkaAjowTrbuCJxuNTdAX6tLh6bOyLM+Zkt7+p/1UuUxpSHNrY1+q1ILvWSVlRizWLEeIpSYMSX1ibmzS15PUI186loFctPCFcLKT4+D304HqCsIvTX+GOFEMkujeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7Y0MyyARMq5DMZwJqAUPDAMgiVfUtjfsDipZCj8azI=;
 b=QMNP9+mOUzpiHRVKb3MGoMFbwnQCK1Y135mEq3PASHwbJWspPFnWD+6Xu2JAaf99o9iUiFMoz3XY7r7vB8wXEqYYzbaSjr0fkefb7AoC1aKOwCtt/U7X/NXO8wQTnsajelvcqijNoRjD3ej4O3QDetZqV4NeluUNCrfvb8Sj8uM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d7da70ea-b069-1580-f597-cb785d82346a@amd.com>
Date: Tue, 8 Nov 2022 10:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <DBC5A7D4-2826-4F9A-80C4-CE84679530B7@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <DBC5A7D4-2826-4F9A-80C4-CE84679530B7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|DM4PR12MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: b591c091-18af-402b-74c5-08dac16b3e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ybra6xpC3hC5SPCwhNw24gIsAuqrMEvDDziRvX+KGUR/BHaO3nV/2reiEO0iFxj8YC4NczqidTqKXCwnP5J9YB7u2gJ2Zi3QweVP1Xw7pE+cU50T8nOJmEEaPzRFp0BEZmn9XvqjcPxHlLP5bA6rLkSBQ0/QRbUwfbiBEb7E5FXGWPyu7xMNMcN+M5q2dqxoFIYvFABLjrrkE/okcRlfgcHV/lj6a3cg4/vgfTrvMGtkFDM8xLhRVEJ1O2vKk8eYyla3qJuKKF9JCNw6T9kfxhA812yRE1z/r5az43fT4MV2JYcJhEanlOtxLg2Z2tb99utbqW5XvBLVkxWmr7APzZLZI/ZPzpxqs9VsWH60wzwUTM2zN6ZuJVp7tjS26JcpzTcDPzEZVvy1vI9x2rzNZbB336bn5Y62CoxTInpXF7O+rhFOcDYF1nfPzapn/ECSpq1jWfRvpwJMbt3mch/oxpvG1zwaDoPCcpk49nCogt2cV7fshJ9qAgEpq02VYd9+TdpluTjqonKVj4mA/gXj1DyY8vYNIkKmEw6WtkhqAG/+qdyo33HkDf6yHbIm1GIIPez74S/CkCd5ljxkpRL11kD4QsqGY9V9BMlMUsUzzJpjwKRDs4Vp43YPppIUmnmHMGaQY2XNfQMAOevwIytL3MR6IEs+RImJWUAyPTgY8qdJ+Nd8IIHgfXjRu5R/LH0rMNlLtN3a+HLcBrQdF1yryAtyQyf5Kz1h0/7c8GEKm8VV6TrNejiYi4+vsG3GbW2ijf42BMXL81gAnDsU+yZLh95k3fRsJveJuwsoGGtfcBnnPHIZNFjCrEzR/209i3xPtzu7ek+JgGofEs/IGIYybuy4vil368Kv18YyVMX4OsQ1H9eA/b2xzVgo7hr1YapmaRHLlhwMI5gR1V4okS43Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(70206006)(26005)(40480700001)(70586007)(44832011)(336012)(2616005)(4326008)(36756003)(8676002)(41300700001)(8936002)(186003)(5660300002)(53546011)(426003)(40460700003)(86362001)(31696002)(2906002)(36860700001)(83380400001)(47076005)(82310400005)(316002)(45080400002)(966005)(82740400003)(478600001)(31686004)(81166007)(356005)(54906003)(6916009)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 09:25:57.7457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b591c091-18af-402b-74c5-08dac16b3e57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6208

Hi Bertrand,

On 08/11/2022 09:42, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 7 Nov 2022, at 07:50, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Bertrand and Stefano,
>>
>> On 31/10/2022 16:00, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> This patch series is a first attempt to check if we could use Yocto in
>>>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>>>>
>>>>> The first patch is creating a container with all elements required to
>>>>> build Yocto, a checkout of the yocto layers required and an helper
>>>>> script to build and run xen on qemu with yocto.
>>>>>
>>>>> The second patch is creating containers with a first build of yocto done
>>>>> so that susbsequent build with those containers would only rebuild what
>>>>> was changed and take the rest from the cache.
>>>>>
>>>>> The third patch is adding a way to easily clean locally created
>>>>> containers.
>>>>>
>>>>> This is is mainly for discussion and sharing as there are still some
>>>>> issues/problem to solve:
>>>>> - building the qemu* containers can take several hours depending on the
>>>>> network bandwith and computing power of the machine where those are
>>>>> created
>>>> This is not really an issue as the build of the containers occurs on the local
>>>> machines before pushing them to registry. Also, building the containers
>>>> will only be required for new Yocto releases.
>>>>
>>>>> - produced containers containing the cache have a size between 8 and
>>>>> 12GB depending on the architecture. We might need to store the build
>>>>> cache somewhere else to reduce the size. If we choose to have one
>>>>> single image, the needed size is around 20GB and we need up to 40GB
>>>>> during the build, which is why I splitted them.
>>>>> - during the build and run, we use a bit more then 20GB of disk which is
>>>>> over the allowed size in gitlab
>>>> As we could see during v2 testing, we do not have any space restrictions
>>>> on the Xen GitLab and I think we already decided to have the Yocto
>>>> integrated into our CI.
>>>
>>> Right, I should have modified this chapter to be coherent with your latest tests.
>>> Sorry for that.
>>>
>>>>
>>>> I will do some testing and get back to you with results + review.
>> I did some testing and here are the results:
>>
>> In the current form this series will fail when running CI because the Yocto containers
>> are based on "From ubuntu:22.04" (there is no platform prefix), which means that the containers
>> are built for the host architecture (in my case and in 99% of the cases of the local build it will
>> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means that all the test jobs would need
>> to specify x86_64 as a tag when keeping the current behavior.
>> After I built all the containers on my x86 machine, I pushed them to registry and the pipeline was successful:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F686853939&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C097e7825c8834c412e8008dac16526bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638034937437190896%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=MNo1wYRgxehJ0SJOeGxNR6U%2Fd68zERPgYfLbpHya%2B2Y%3D&amp;reserved=0
>>
>> Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
>> ```
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 5c620fefce59..52cccec6f904 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -65,6 +65,9 @@
>>     paths:
>>       - 'logs/*'
>>     when: always
>> +  needs: []
>> +  tags:
>> +    - x86_64
>>
>> # Test jobs
>> build-each-commit-gcc:
>> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>>   extends: .yocto-test
>>   variables:
>>     YOCTO_BOARD: qemuarm64
>> -  tags:
>> -    - arm64
>>
>> yocto-qemuarm:
>>   extends: .yocto-test
>>   variables:
>>     YOCTO_BOARD: qemuarm
>> -  tags:
>> -    - arm32
>>
>> yocto-qemux86-64:
>>   extends: .yocto-test
>>   variables:
>>     YOCTO_BOARD: qemux86-64
>> -  tags:
>> -    - x86_64
>> ```
>>
>> Now, the logical way would be to build x86 yocto container for x86, arm64 for arm64 and arm32 on arm64 or x86.
>> I tried building the container qemuarm64 specifying target arm64 on x86. After 15h, only 70% of the Yocto build
>> was completed and there was an error with glibc (the local build of the container for the host arch takes on my machine max 2h).
>> This enormous amount of time is due to the qemu docker emulation that happens behind the scenes (I checked on 2 different machines).
>>
>> So we have 3 solutions:
>> 1) Build and run these containers for/on x86_64:
>> - local users can build the containers on local machines that are almost always x86 based, in short period of time,
>> - "everyone" can build/push the containers once there is a new Yocto release
>> - slightly slower CI build time
>> 2) Build and run these containers for specific architectures:
>> - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
>> - faster CI build time (arm64 runner is faster than x86 one)
>> - someone with arm64 based machine (not that common) would have to build and push the containers
>> 3) Try to use CI to build and push the containers to registry
>> - it could be possible but what about local users
> 
> I might have a solution 4.
> The containers we pushed to gitlab are publicly accessible ?
Yes, they are:
https://gitlab.com/xen-project/xen/container_registry/3539006

> Shouldn’t we push both versions there and then document how someone can retrieve and use those containers instead of building them ?
> 
WRT retrieving, we already have a section describing it under automation/build/README.md

I'm not sure about pushing both versions to registry, due to the following:
 - occupying twice the same size (instead of 30GB per release we would have 60GB, imagine the size after a few years),
 - necessity to build twice the same containers for each release (someone would have to have access to both x86 and arm64 machines to do the build),
 - necessity to introduce different naming for containers (to differentiate the machine) where in fact, CI would always use one subset.

We should not worry about the local users, because once the containers are in registry (no matter the platform they were built for),
downloading the containers will take less time than building them. We will not benefit anything from having containers for different platforms.
The only problem is with building them on x86 for arm64 (other way around is not supported by qemu-user-static). But this is something that
may be problematic only for person willing to push to registry, because as you said, the normal users can pull them instead of build them.

> This way we will do the push but a normal user would just retrieve the containers and use them so building time would have less impact and we could build both flavours of the containers.
> 
>>
>> Regardless of what we chose, we need to keep in mind that the biggest advantage to the Yocto build/run is that
>> it allows/should allow local users to perform basic testing for all the Xen supported architectures. This is because
>> everything happens in one place with one command.
> 
> Agree.
> 
> Bertrand
> 
>>
>> ~Michal
> 

~Michal


