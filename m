Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B732E623CBB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 08:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441505.695611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot251-0000J3-4u; Thu, 10 Nov 2022 07:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441505.695611; Thu, 10 Nov 2022 07:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot251-0000GP-1z; Thu, 10 Nov 2022 07:34:31 +0000
Received: by outflank-mailman (input) for mailman id 441505;
 Thu, 10 Nov 2022 07:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n6Q=3K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ot24y-0000GG-L3
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 07:34:29 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2086.outbound.protection.outlook.com [40.107.212.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 197e24bd-60ca-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 08:34:25 +0100 (CET)
Received: from BN9PR03CA0435.namprd03.prod.outlook.com (2603:10b6:408:113::20)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Thu, 10 Nov 2022 07:34:22 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::63) by BN9PR03CA0435.outlook.office365.com
 (2603:10b6:408:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Thu, 10 Nov 2022 07:34:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 07:34:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 01:34:21 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 10 Nov 2022 01:34:20 -0600
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
X-Inumbo-ID: 197e24bd-60ca-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjV4FvNN2fbJMsbly5GSFaF7ie7FHveEHYBk/65iyT4aqSHXjRmhim7aHdVgRLp6xwBCPYR2eRh8SWbIhDpuEuq5GM2/6pXz4l0I3MFxF59mF9NGzlH8yp0tX4AxKUUfElhVLf23eDL593XJlSb2S/HK1cL1DOPyH8jVA60bNoEOx3A9OJmZAh20VTs3IZyu403iQhGm+ikAh4sGn+AQJVeEv7mPdls8dSUw7DcvWXCTdx0pExIVnjxkFxUbWAgy9UprTM3KijlYomrOm8cWmeXcvBd6H+H+B80rv3UR1IDL2prLkzbXe06o8F5rxPNSAx596xh0nZkZN97YHEwCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivPN3JXOS4H52Q2GKOk3VRaS0bEO2/LWKmLNXiANbXY=;
 b=VQfIoTify1pS17FRpMc4NrIz4xfDQLTDxWUfdDYp2D4bmGXd9suFPcaR8y0ug2pODG3ZC91F/9JqDrlIKc4Egaggp8jyqJh3B+lrXWG81VwSuMwgZWyvJMe3B9jSgmT1rdmBxIFh+g1v2k26wYzf/X3Amc014ZmCYNA8aA1SuRdXMBPgmNyvvCb2qyGM1iH9jQLDOlmO4AGLBPFV73Pz+Ey+s/QcKni1Zi1rM0IdS+X/0sKER33H6IjLrW3cd2G+eIuhzfUwLPgWGQEZUdzq2JmwCW1TcQvXziLqmuQwWWendZF+Yfd+N4PkFXZzddM7uStLFL8/RPIq9TTZwBD0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivPN3JXOS4H52Q2GKOk3VRaS0bEO2/LWKmLNXiANbXY=;
 b=ioWMvg0/EGg0PxmFW3JtcB5aFo3bRUyLrYApu0KHtdd+15ykmRITgPDNTGA1EtfyotVICKYtXEp3dmOiDeMJ9r4CUR92QMqyrb6zz1aPVxq6TRSd+rV9CNVJrCc+Fiv19pPZui3xzfq4TbkR1yMNN/EVJOmX6aycIQmgboRs5Uc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
Date: Thu, 10 Nov 2022 08:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|DM4PR12MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: d87b0bd3-153e-48e3-c13e-08dac2edfc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2wrq54nRsBi/kT/z1udaWq2eM5gm1IqNnfb1ep03wfaYjFR8ZWG7HaIqRQBGco4nigEhe5XrszFLUewaaclbKx5DCuf5LhTmi5RIC2nYZmszodSVRPr/WBgcXWNalR8uNuQVVONCoxLNa94tVPR6dR0YIveE7fb0rIRlGiJii9+cGPVhq/PvaSo/iEBKVjQ+PpVQ20a3GbuDyI63PoN1PlIU0eoJEAK7DwqbtB7obrsMZ8FfD1K90bttWfV4USWd2C76ZJB3Q9zW9Ln9xFrCyFj0I9Ruye6cwySfVzlXp36q++a6GBkluuO57stEhrDOeo3iirEhYfe7v7b5JLjSsDCfVdr4W8F37JERgTSlJkjyuXiSN8AGZY+2cG9JUWXYwRmiCVmhPWngxbUmTwkfB5USe3MFCJcSHfG2FYo1U1BHfV8YA2w3wDSn0U0x6foTtchVvmVGpZzNi7hzx2fr3FgiTrjWRVM1Umyq5+MNw194WwQVlcIvsbDbgTsRF5t96IvnDVXhqE13NlyfIiqpdqRP6lMxiv9EhpQlVauSKXwYV8vRl2z1WG3RrN9HCkaYmf3wSFMO/Vum7fZrkZpqbxMqaxbKhv4yYTCg0ritLRUB7WNtN7h1zqHlhMlMaMglVqHMtC4M8umsX+kbEdMSZkGWYqkKo7PheMR/PrOJtZBxuwOSiOF6F9zBx0CCAUZDTnCU5AYT+DvZ393U5006h+qoFnDozDn2ci/FayCvBx4Gs4Oe010ElJfZhXBw84QOj8QaSZRV0WRXTCgteTPs2jbz4h/P1vq1ZDO81BruYLPywy7ptaAYlXNEOoKs0zd6yjZC07VlRrScWc5YF1M+PD/RGOJMJmFFH7O3U0ETLk7d5d4vcT5rRl6Ru7THasG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(44832011)(41300700001)(36756003)(8676002)(16576012)(70206006)(54906003)(4326008)(316002)(8936002)(40480700001)(70586007)(6916009)(2906002)(45080400002)(478600001)(5660300002)(36860700001)(47076005)(966005)(356005)(82740400003)(81166007)(53546011)(26005)(31696002)(86362001)(336012)(40460700003)(83380400001)(426003)(186003)(2616005)(31686004)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 07:34:21.7622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d87b0bd3-153e-48e3-c13e-08dac2edfc11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135

Hi Stefano,

On 10/11/2022 01:18, Stefano Stabellini wrote:
> 
> 
> On Mon, 7 Nov 2022, Michal Orzel wrote:
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
>>>>>  network bandwith and computing power of the machine where those are
>>>>>  created
>>>> This is not really an issue as the build of the containers occurs on the local
>>>> machines before pushing them to registry. Also, building the containers
>>>> will only be required for new Yocto releases.
>>>>
>>>>> - produced containers containing the cache have a size between 8 and
>>>>>  12GB depending on the architecture. We might need to store the build
>>>>>  cache somewhere else to reduce the size. If we choose to have one
>>>>>  single image, the needed size is around 20GB and we need up to 40GB
>>>>>  during the build, which is why I splitted them.
>>>>> - during the build and run, we use a bit more then 20GB of disk which is
>>>>>  over the allowed size in gitlab
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
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F686853939&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C2449f063e67341c3b95a08dac2b112a5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638036363027707274%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=EwTJrW2vuwQIugKc7mnzG9NNbsYLP6tw5UODzBMmPEE%3D&amp;reserved=0
> 
> When I tested the previous version of this series I built the
> containers natively on ARM64, so that is also an option.
> 
> 
>> Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
>> ```
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 5c620fefce59..52cccec6f904 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -65,6 +65,9 @@
>>      paths:
>>        - 'logs/*'
>>      when: always
>> +  needs: []
>> +  tags:
>> +    - x86_64
>>
>>  # Test jobs
>>  build-each-commit-gcc:
>> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>>    extends: .yocto-test
>>    variables:
>>      YOCTO_BOARD: qemuarm64
>> -  tags:
>> -    - arm64
>>
>>  yocto-qemuarm:
>>    extends: .yocto-test
>>    variables:
>>      YOCTO_BOARD: qemuarm
>> -  tags:
>> -    - arm32
>>
>>  yocto-qemux86-64:
>>    extends: .yocto-test
>>    variables:
>>      YOCTO_BOARD: qemux86-64
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
>>  - local users can build the containers on local machines that are almost always x86 based, in short period of time,
>>  - "everyone" can build/push the containers once there is a new Yocto release
>>  - slightly slower CI build time
>> 2) Build and run these containers for specific architectures:
>>  - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
>>  - faster CI build time (arm64 runner is faster than x86 one)
>>  - someone with arm64 based machine (not that common) would have to build and push the containers
>> 3) Try to use CI to build and push the containers to registry
>>  - it could be possible but what about local users
> 
> From a gitlab-ci perspective, given the runners we currently have, we
> have to go with option 2). We don't have enough resources available on
> the x86 runner to run the Yocto jobs on x86.
> 
That is what I reckon too. Running the Yocto build/test on CI using x86 runner will always be slower.
So, if we go with this solution, then the following is needed:
1. Modify test jobs so that yocto-qemu{arm64/arm} uses arm64 tag to be taken by arm64 runner and use tag x86_64 for yocto-qemux86-64.
2. Come up with a solution to build the yocto containers automatically for the above platforms + possibility to specify the platform for local users.
   Right now, these containers are being always build for the host machine platform, so without doing tricks like adding --platform or prefix to image name,
   one cannot build the Yocto containers that would be ready to be pushed to registry. We need to have a clean solution without requiring user to do tricks.

The only drawback of this solution is that the person building the yocto-qemu{arm64/arm} container and willing to push it to registry,
needs to have access to arm64 machine.

> 
>> Regardless of what we chose, we need to keep in mind that the biggest advantage to the Yocto build/run is that
>> it allows/should allow local users to perform basic testing for all the Xen supported architectures. This is because
>> everything happens in one place with one command.
> 
> That's right, but it should be possible to allow the Yocto containers to
> also build and run correctly locally on x86, right? The arm/x86 tag in
> test.yaml doesn't matter when running the containers locally anyway.

~Michal

