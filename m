Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF4604215
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 12:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425729.673748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6hk-0002lN-Gg; Wed, 19 Oct 2022 10:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425729.673748; Wed, 19 Oct 2022 10:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6hk-0002j4-DQ; Wed, 19 Oct 2022 10:53:44 +0000
Received: by outflank-mailman (input) for mailman id 425729;
 Wed, 19 Oct 2022 10:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFyQ=2U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ol6hi-0002iy-5v
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 10:53:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491dd5d2-4f9c-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 12:53:39 +0200 (CEST)
Received: from DM6PR06CA0012.namprd06.prod.outlook.com (2603:10b6:5:120::25)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 10:53:35 +0000
Received: from DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::12) by DM6PR06CA0012.outlook.office365.com
 (2603:10b6:5:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 10:53:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT091.mail.protection.outlook.com (10.13.173.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 10:53:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 05:53:34 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 05:53:33 -0500
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
X-Inumbo-ID: 491dd5d2-4f9c-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rnl3ClUJ/lpbAC3B6upya6zEz0LsslFVDEy3FANrwI6m9oAUggNUSXA0WjUNDG//MHmYSZW5tIzh1maxcE2eYZLYuJw2qXykv5EQzoV45TMnH62+LPYUHpEi18MvdV1FnJ7kyHcQuTuAVP7SNSGZw0h5mHxSBwdDtKpdGZpuSU2TJk9anOGA4PMuXpq0tmnnwfy6yZ8nsd6UsBSexA4lvarVpc+et82bZayw0hoA4qSd+fAfk38koHm8rOgZwOoq1qmbj9ihrh/qgWhFEqg1DxQiVU2h+f8050RFbWWLZ0PotmfJ80rOsqYrDE700Q9VMomEXmPDg5cbKxx+RUKHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJEKRS8WmOl0dAIwJpZNbxPA3SHbecZxZanXz44Smps=;
 b=M6B8arCpdYhD78SGHCzYYhRJ1CdfhbdYFrftmrxnbrus6o3jy2t3KchIhSeNksSvauHK140/AQz/i3thtTI2zDGWseJmnY6yqYgS+Idw0eDl2R07HtXThFQAkk5MTdLwOjYRyyoncVeMQXxavrBo8g2adRsk85zCt9qgH+gMEGBnu30FqUYDyDAKHoBo0mjl7F5eu+L0OCOLzJGhQ07dbWdoBnc/EEP1QqdXelI/15JXeYoAgs2A+BkJvpLndopgyYddYo7jmlooz78qPF4o7iha+bXAvcGjuJ8fob3ISu0akn9bNcfvkoV/m3KsbiuepTrdi8QhKaFTaau+mRjEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJEKRS8WmOl0dAIwJpZNbxPA3SHbecZxZanXz44Smps=;
 b=g8ODJo5/Fapx30MSXIzPlNUOEq/+8Weuv+UtrT8+g4AUNXsND83+hNjI6nGj2WiiwuGkb3P9zwHluP29uu9+j8jvbgP7UVYyi08PkXEhJJRHB15iDiwWiWqfQitzHBUK7BgUa+eFBM6Y/IuP2pBiTtRORqdFNA2OHUiA28N86rk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a1d2ab41-0d30-5d34-5a42-fb74b68d30f4@amd.com>
Date: Wed, 19 Oct 2022 12:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
 <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
 <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
 <56155bff-6229-05a4-7221-cd6aa5a1de8b@amd.com>
 <0070D1D1-F579-4E11-8A27-62D3D92DE896@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0070D1D1-F579-4E11-8A27-62D3D92DE896@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT091:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d819a8-6d94-433c-3eb6-08dab1c02bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imhg8S4KfChdi0TudOLpCW+JUURRYslmhc5rOQgQCZAx+c30GPM9DBtedfMCMabjU52iiVEajQtZXS0lSSKnM8awgVngHTwiu+y3jKmoHKvK7n7BmQnATuYNv2AMJicWH0fPo1hLjszPOLkMhELRJSPfng3fJNZdXepz7/ATkk6P7dPHrWJzLyRFZLgn9SkE33tumirGArJSG2Plh6vPV8moJENb1A8fPu4H+XRqMByXWV6N9piMkbKm3qOfQUZZxFJ5F5qwxiyfx4Qk7g53jmaS26SzyLV3k+mbQrs5MpNXPFS8DIk3KoRNfvNikvDa4yGpS/OYa6/2vNNHrGjvtt3cWuLoiCUBjzQCVxaEm+bOOPCsyeEtOUHFCachEMl+A9+ZF/OCE1mx+j7ng9a14RHphVA5y2aA73BgQcL/5lUH5fRTn8Az+FP++kVW7p34VuaQ4BVk18erf5JX/6vI7hBB0kpO8FKGYfMzCY+JuMgDJgTe34U59GQ5KIW1+1if2j7xeCdtSgZJFPnz0Y/bqi70AtHHJrprZQi5m4IkvwfW/EYwxbTIctSnFvGJYpNSUK7ZhYyN72YpDkI1QwVxFeHLPyqc8be6N54PysaeRSiZoL32VySDsPZwZxgSuxdtKzfqCO8yxF5Bn7SrWSu25ZUVRHxS5ebixh+TrbCECi2zPt74YrAFvbriGG+UKj4diEjBu1rAHcHiTOOMl5nk36K2LP7HQOX51opMlFjIsCGJrx7VLNuBg5Oe9r71k+iqORjgYvl3NWm3o0eYYixmy0DG6etzK7r4ri/SkDB2az1NKZ+VBGNx/QwE9XFRzN51Pvw2Pne3kDzka5s+KCe1ZBlEk6Z3cL9QIay+kJOizVKza7M4kJFwqFNcLsbXteQaMT0DFSabLsl8/KcOG+1UJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(44832011)(4326008)(6916009)(5660300002)(54906003)(53546011)(8676002)(70586007)(70206006)(36756003)(16576012)(8936002)(316002)(26005)(41300700001)(36860700001)(81166007)(82740400003)(356005)(82310400005)(2616005)(40480700001)(426003)(47076005)(40460700003)(336012)(186003)(2906002)(31696002)(86362001)(83380400001)(478600001)(31686004)(45080400002)(966005)(84970400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 10:53:35.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d819a8-6d94-433c-3eb6-08dab1c02bc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190

Hi Bertrand,

On 19/10/2022 12:40, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 19 Oct 2022, at 10:06, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Stefano,
>>
>> On 19/10/2022 02:02, Stefano Stabellini wrote:
>>>
>>>
>>> On Mon, 17 Oct 2022, Stefano Stabellini wrote:
>>>> It should be
>>>>
>>>> BB_NUMBER_THREADS="2"
>>>>
>>>> but that worked! Let me a couple of more tests.
>>>
>>> I could run successfully a Yocto build test with qemuarm64 as target in
>>> gitlab-ci, hurray! No size issues, no build time issues, everything was
>>> fine. See:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193051236&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C5f7fc3a161fe44b5954808dab1be5c3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017728406088513%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=2mb3N26wiz39RJNSA4KoIOt%2BG9X7EMDOWIpfKc2ZZOc%3D&amp;reserved=0
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193083119&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C5f7fc3a161fe44b5954808dab1be5c3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017728406088513%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=QhTFefS8NU1f7oLemB0Vtn%2BDCD%2BCnq1v1gEmlKCJt84%3D&amp;reserved=0
>>>
>>> I made the appended changes in top of this series.
>>>
>>> - I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
>>>  registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64
>>> - for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
>>>  xen.git, not from a copy stored inside a container
>>> - when building the kirkstone-qemuarm64 container the first time
>>>  (outside of gitlab-ci) I used COPY and took the script from the local
>>>  xen.git tree
>>> - after a number of tests, I settled on: BB_NUMBER_THREADS="8" more than
>>>  this and it breaks on some workstations, please add it
>>> - I am running the yocto build on arm64 so that we can use the arm64
>>>  hardware to do it in gitlab-ci
>>>
>>> Please feel free to incorporate these changes in your series, and add
>>> corresponding changes for the qemuarm32 and qemux86 targets.
>>>
>>> I am looking forward to it! Almost there!
>>>
>>> Cheers,
>>>
>>> Stefano
>>>
>>>
>>> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
>>> index 0d31dad607..16f1dcc0a5 100755
>>> --- a/automation/build/yocto/build-yocto.sh
>>> +++ b/automation/build/yocto/build-yocto.sh
>>> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
>>> # Save some disk space
>>> INHERIT += "rm_work"
>>>
>>> +# Reduce number of jobs
>>> +BB_NUMBER_THREADS="8"
>>> +
>>> EOF
>>>
>>>     if [ "${do_localsrc}" = "y" ]; then
>>> diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
>>> index f279a7af92..aea3fc1f3e 100644
>>> --- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
>>> +++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
>>> @@ -16,7 +16,8 @@ ARG target=qemuarm64
>>>
>>> # This step can take one to several hours depending on your download bandwith
>>> # and the speed of your computer
>>> -RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
>>> +COPY ./build-yocto.sh /
>>> +RUN /build-yocto.sh --dump-log $target
>>>
>>> FROM $from_image
>>>
>>> diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/build/yocto/kirkstone.dockerfile
>>> index 367a7863b6..ffbd91aa90 100644
>>> --- a/automation/build/yocto/kirkstone.dockerfile
>>> +++ b/automation/build/yocto/kirkstone.dockerfile
>>> @@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
>>>              /home/$USER_NAME/xen && \
>>>     chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
>>>
>>> -# Copy the build script
>>> -COPY build-yocto.sh /home/$USER_NAME/bin/
>>> -
>>> # clone yocto repositories we need
>>> ARG yocto_version="kirkstone"
>>> RUN for rep in \
>>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>>> index ddc2234faf..4b8bcde252 100644
>>> --- a/automation/gitlab-ci/build.yaml
>>> +++ b/automation/gitlab-ci/build.yaml
>>> @@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>>>     EXTRA_XEN_CONFIG: |
>>>       CONFIG_BOOT_TIME_CPUPOOLS=y
>>>
>>> +yocto-kirkstone-qemuarm64:
>>> +  stage: build
>>> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
>>> +  script:
>>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
>>> +  variables:
>>> +    CONTAINER: yocto:kirkstone-qemuarm64
>>> +  artifacts:
>>> +    paths:
>>> +      - '*.log'
>>> +      - '*/*.log'
>> The above lines are not needed as the logs/* below will handle them all (logs are only stored in logs/).
> 
> Ack
> 
>>
>>> +      - 'logs/*'
>>> +    when: always
>>> +  tags:
>>> +    - arm64
>>> +
>> build-yocto.sh performs both build and run actions. I think it'd be better to move this into test.yaml in that case.
>> The best would be to create one build job (specifying --no-run) in build.yaml and one test job (specifying --no-build) in test.yaml.
>> This however would probably require marking path build/tmp/deploy/***/qemuarm64 as an build artifact. The question then is
>> whether having this path would be enough for runqemu (Bertrand's opinion needed).
> 
> This will not be enough to run qemu as the qemu binary and its dependencies are in the build artifacts and not in deploy.
> Splitting the build and run is not a good idea because the size of the artifact between the 2 will be huge.
> 
>>
>> Apart from that there is an aspect of Yocto releases and the containers/tests names.
>> Yocto needs to be up-to-date in order to properly build Xen+tools.
>> This basically means that we will need to update the containers once
>> per Yocto release. The old containers would still need to be stored in our CI container registry
>> so that we can use CI for older versions of Xen. However, updating the containers would also require
>> modifying the existing tests (for now we have e.g. yocto-kirkstone-qemuarm64 but in a month we will have
>> to change them to yocto-langdale-qemuarm64). In a few years time this will result in several CI jobs
>> that are the same but differ only in name/container. I would thus suggest to name the CI jobs like this:
>> yocto-qemuarm64 (without yocto release name) and define the top-level YOCTO_CONTAINER variable to store
>> the current yocto release container. This will solve the issue I described above.
> 
> I think we have no other way around this and we will need to have one Yocto release supported by Xen officially so
> we will have to keep old docker images for old releases of Xen and move to newer versions of Yocto in staging when
> it is needed.
> 
> We have to find a way for gitlab-ci to use the build.yaml contained inside the tree that is to be tested somehow so that gitlab would automatically take the right one.
> Which means that build.yaml will be different between branches and contain the right version for the current branch.
> 

What I suggest is that with each new yocto release, we add new docker container files and push them to registry.
So we will end up in a registry having e.g. (arm64 as an example):
- kirkstone-qemuarm64
- langdale-qemuarm64
We maintain only the one group of CI jobs whose names are generic (yocto-qemuarm64).
After adding new containers for a new Yocto release, we modify the YOCTO_RELEASE variable
to point to the latest yocto release containers.

test.yaml:
...
# Yocto test jobs
variables:
  YOCTO_RELEASE: "kirkstone"

yocto-qemuarm64:
  extends: .test-jobs-common
  script:
    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
  variables:
    CONTAINER: yocto:${YOCTO_RELEASE}-qemuarm64
  artifacts:
    paths:
      - 'logs/*'
    when: always
  tags:
    - arm64

This means that:
- on the current staging branch the YOCTO_RELEASE points to the latest containers (for the latest yocto release)
- on the old stable branches the YOCTO_RELEASE points to the old containers (for the old yocto release).

~Michal

