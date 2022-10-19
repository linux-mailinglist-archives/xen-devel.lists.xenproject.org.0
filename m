Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F57603DDF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 11:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425675.673647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol52b-000567-48; Wed, 19 Oct 2022 09:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425675.673647; Wed, 19 Oct 2022 09:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol52b-00053n-06; Wed, 19 Oct 2022 09:07:09 +0000
Received: by outflank-mailman (input) for mailman id 425675;
 Wed, 19 Oct 2022 09:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFyQ=2U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ol52Y-00053h-Uc
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 09:07:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 664904e6-4f8d-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 11:07:05 +0200 (CEST)
Received: from MW4PR04CA0227.namprd04.prod.outlook.com (2603:10b6:303:87::22)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 09:07:02 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::59) by MW4PR04CA0227.outlook.office365.com
 (2603:10b6:303:87::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 09:07:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 09:07:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 04:07:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 04:06:38 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 04:06:37 -0500
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
X-Inumbo-ID: 664904e6-4f8d-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nyyn6//JrE9e/On1w/ZQ5kryvvmc+Qh7a1AqsYGHrLcs12NJHkQQKF3bFrtj9E8/2NZlpUP1VxMbF5RpqfEL8R2VFsSL3nB8D5xkX/eRqiqboDJyovhdn86re7U3J9JWGTaZJJ7Zn3/eN+Qh+W29cf5+qwU+iRk7W6Z1lO13rgWZPapNZH1hpyN1dTrb2UQ9Qu99oKrP9WxCvrjDKitzMqsmgdVWlLXTNbiRW1jdbmm1uwsx46QM17kz8SPoGh/OBUJi/vP9Vrpwx/4weeUuM9w97sYqeD+dk5OvxkXnZsHRxYLErrjoUsBuZFlVC82HT+f/S6ECE6/aMTOi9N5ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2pVKOxocZIZCBd4njKlEy+jDzbfa8B8TJzQnz4hs1E=;
 b=iQip9Uc+a6/bqerxVcp4XmVn6Dxxfd+8tkskEpMp6+k6w0nOsVnpKOq0CEXC5kX7H97URsEGvlqbPqiL+nz0y2eP8nPxX2YJcfLOQ4P7fNyFUkOEaLclRKigGroVQVvbWz32flCc9Fw5v2jQzeu/k5kNrCJnqF/LRogf4clkIw17ZCLo4YoKqXFRDnJxyMku/LWWCy/mzdL443QPdLSDjidSvSBI3Yo01/XgD7lInhEwdGgbVjK1zTYrKp8SloKpy0a9pyLjxczj+EBnH7nNcQ7VnGYqO/W3H5CSO7g+eA/lS4NtLRtoDGl8083lT5u2qnJQd1lqR8SeBrjBT/UClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2pVKOxocZIZCBd4njKlEy+jDzbfa8B8TJzQnz4hs1E=;
 b=uVwLCOKucjC1ODU4HPa7XVp//aja5VF6i1h+e2rdunMmSFLHDDLdPIczMWHUWwoAkTTmgqG7wkHPf+2SsmiFpfkGY8DA225193BPUFTcrZP8zeNOJSUd1wUy+z0qLDEaQLfbSyQh2pI3bFJjGaJPa+eNgzIv1EPOSzx2a4nHRzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <56155bff-6229-05a4-7221-cd6aa5a1de8b@amd.com>
Date: Wed, 19 Oct 2022 11:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
 <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
 <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bba205-df68-4a82-776e-08dab1b148c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+iJXzDyd1lkU9emUuGgdLcriBrOVwMlmOC76RWc4I79ddVMvyb86Prd3huWyIjeXBNJxv1ylSPPtAHjPxkQfFNi8Eyu7TsOdtfdYvCkUfowZkThfd0+5y52eBkseP4JMQ/2LtNxPmb/k7w0/5t1xg8fMI+Ac/2x+KYPGm09piR+2UgwQF9cFEcnHnBJTCTUZ4LTWhHVfgj2v4deX5sfU4w0SJ0svTYN4oTOHjFhMMqxAwjJWi4WjMrr67oUE95QPSxlNHgkk6AmP2J9NcWaR5B6EaiMKe0W+BsUliMoQiDu4Ta+2wOEM91pYR56ROgJJ/DiHOy3MBTDtYLKdfpUbaK8BPpo2ZlSLWdyaR4Bt89WBsXCe6jf8/xiCsRosVYgjLjBchP5bcMjqeZKP9Vb0KiecpFRvSCL5U6zY6kzLsYRYlbsliZVY/tCi6wTcUIH4V2TeJVL2u/ix/jOtqcig9AtW0PWul0ySrqz3LSCVV1YUM5bPU3pX9yhVVtX+Ccnw8YvJ7K/VwiSHZF8p0IjiOzwYxZ/5VzC+QBLjQJSTf+mlFzU2DqKzURjB5ipT4XJIleQfqHkpnHkydpTTDPyy9ClvPO6kR1EQz+Ppc+Pi2kyslHKYZswM1bczhsbHvQC4/cB7c8S5881atb9YIfzmrY6ju1Ab8on7JWKsDvZlMgNoabV/x3HnF5AKD2PV0JhX+WiRhh5DLrTi3LHQ+lGFp2IBME+fjlnzBbCUa7/EI09dIlwiTOucO6Y0NsvGXAYPtl8duBwWFwoUmzRp+/T95t0e253swgr11ViXoYeixN4GC08TGYATC+vPrgr3P66w1cm3Lpm14zdXAAXZnvemxCrQSGzdCzU9zCBGRsz2pu17xiNinbIcaJvzh3fYmYjAvb1nNkyzpbWP0tergccFg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(31686004)(478600001)(45080400002)(83380400001)(86362001)(31696002)(84970400001)(966005)(70586007)(36756003)(70206006)(53546011)(8676002)(316002)(41300700001)(26005)(16576012)(8936002)(44832011)(6916009)(4326008)(54906003)(5660300002)(40480700001)(47076005)(426003)(82310400005)(2616005)(2906002)(40460700003)(186003)(336012)(82740400003)(356005)(36860700001)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:07:01.3274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bba205-df68-4a82-776e-08dab1b148c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127

Hi Stefano,

On 19/10/2022 02:02, Stefano Stabellini wrote:
> 
> 
> On Mon, 17 Oct 2022, Stefano Stabellini wrote:
>> It should be
>>
>> BB_NUMBER_THREADS="2"
>>
>> but that worked! Let me a couple of more tests.
> 
> I could run successfully a Yocto build test with qemuarm64 as target in
> gitlab-ci, hurray! No size issues, no build time issues, everything was
> fine. See:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193051236&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C75ea919bbde249e1bac408dab1654960%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017345841386870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=oWrGVbloqkJoOxvvxTr55RbKVzd3YmS4iiLPyxDZCYY%3D&amp;reserved=0
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193083119&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C75ea919bbde249e1bac408dab1654960%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017345841386870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2BXf3ZB1bsVi8K%2BzEEe1Dhpg0GSohpseogff12GaK3Gw%3D&amp;reserved=0
> 
> I made the appended changes in top of this series.
> 
> - I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
>   registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64
> - for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
>   xen.git, not from a copy stored inside a container
> - when building the kirkstone-qemuarm64 container the first time
>   (outside of gitlab-ci) I used COPY and took the script from the local
>   xen.git tree
> - after a number of tests, I settled on: BB_NUMBER_THREADS="8" more than
>   this and it breaks on some workstations, please add it
> - I am running the yocto build on arm64 so that we can use the arm64
>   hardware to do it in gitlab-ci
> 
> Please feel free to incorporate these changes in your series, and add
> corresponding changes for the qemuarm32 and qemux86 targets.
> 
> I am looking forward to it! Almost there!
> 
> Cheers,
> 
> Stefano
> 
> 
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> index 0d31dad607..16f1dcc0a5 100755
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
>  # Save some disk space
>  INHERIT += "rm_work"
> 
> +# Reduce number of jobs
> +BB_NUMBER_THREADS="8"
> +
>  EOF
> 
>      if [ "${do_localsrc}" = "y" ]; then
> diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> index f279a7af92..aea3fc1f3e 100644
> --- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> +++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
> @@ -16,7 +16,8 @@ ARG target=qemuarm64
> 
>  # This step can take one to several hours depending on your download bandwith
>  # and the speed of your computer
> -RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
> +COPY ./build-yocto.sh /
> +RUN /build-yocto.sh --dump-log $target
> 
>  FROM $from_image
> 
> diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/build/yocto/kirkstone.dockerfile
> index 367a7863b6..ffbd91aa90 100644
> --- a/automation/build/yocto/kirkstone.dockerfile
> +++ b/automation/build/yocto/kirkstone.dockerfile
> @@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
>               /home/$USER_NAME/xen && \
>      chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
> 
> -# Copy the build script
> -COPY build-yocto.sh /home/$USER_NAME/bin/
> -
>  # clone yocto repositories we need
>  ARG yocto_version="kirkstone"
>  RUN for rep in \
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ddc2234faf..4b8bcde252 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_BOOT_TIME_CPUPOOLS=y
> 
> +yocto-kirkstone-qemuarm64:
> +  stage: build
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  script:
> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` qemuarm64
> +  variables:
> +    CONTAINER: yocto:kirkstone-qemuarm64
> +  artifacts:
> +    paths:
> +      - '*.log'
> +      - '*/*.log'
The above lines are not needed as the logs/* below will handle them all (logs are only stored in logs/).

> +      - 'logs/*'
> +    when: always
> +  tags:
> +    - arm64
> +
build-yocto.sh performs both build and run actions. I think it'd be better to move this into test.yaml in that case.
The best would be to create one build job (specifying --no-run) in build.yaml and one test job (specifying --no-build) in test.yaml.
This however would probably require marking path build/tmp/deploy/***/qemuarm64 as an build artifact. The question then is
whether having this path would be enough for runqemu (Bertrand's opinion needed).

Apart from that there is an aspect of Yocto releases and the containers/tests names.
Yocto needs to be up-to-date in order to properly build Xen+tools.
This basically means that we will need to update the containers once
per Yocto release. The old containers would still need to be stored in our CI container registry
so that we can use CI for older versions of Xen. However, updating the containers would also require
modifying the existing tests (for now we have e.g. yocto-kirkstone-qemuarm64 but in a month we will have
to change them to yocto-langdale-qemuarm64). In a few years time this will result in several CI jobs
that are the same but differ only in name/container. I would thus suggest to name the CI jobs like this:
yocto-qemuarm64 (without yocto release name) and define the top-level YOCTO_CONTAINER variable to store
the current yocto release container. This will solve the issue I described above.


~Michal

