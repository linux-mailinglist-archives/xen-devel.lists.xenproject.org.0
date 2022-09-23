Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF95E7510
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 09:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410638.653732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdMJ-0006Fi-TI; Fri, 23 Sep 2022 07:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410638.653732; Fri, 23 Sep 2022 07:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdMJ-0006DW-Pp; Fri, 23 Sep 2022 07:44:27 +0000
Received: by outflank-mailman (input) for mailman id 410638;
 Fri, 23 Sep 2022 07:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tkvz=Z2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obdMI-0006DQ-BO
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 07:44:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad0c297-3b13-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 09:44:24 +0200 (CEST)
Received: from DM6PR14CA0065.namprd14.prod.outlook.com (2603:10b6:5:18f::42)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.17; Fri, 23 Sep 2022 07:44:21 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::46) by DM6PR14CA0065.outlook.office365.com
 (2603:10b6:5:18f::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 07:44:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 07:44:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 02:44:20 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 23 Sep 2022 02:44:19 -0500
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
X-Inumbo-ID: 8ad0c297-3b13-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUK8NTrI7t6w8Hwu7TCAq96rA7L405hy3MlmFmHe59eFnQ4wnM0qX+RxBeYNoixrAGbUBR3gAPrD/Rg51tgMX4XF6IDDMVxJFwgSCS68Ji3Cctu3Ebr0R75TFrpr9g+h39HACKgmTEWW2ml/E0weVqumVsQhKpb6Eb/Kg+up5NvQF7Oq9yorKMitMULRPur/Vbimq+w8URP45Bt7cFhMSvvUoJGq7lpCRFXBIaue3uyaMiCCLrQ1KJozCPRhJv3lQ1rGjXiV4JWW9apE7NZogLezsi9+z1RFdhBc3qpuucbh8FZYE7aFYFrHMeUWSkztsR6m7i93VUVTbXfrDG3Pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os2vQ3DTgGcdZs4Q12QVtYakO9kEEaDsgBLkmsjjjwY=;
 b=Zj0m+IFf7fx3bYkf9KEhsDWZtZjSlJDB93Eel7+DLhJ6TIgWodLD3fr2HOsiytxlPKgztIqCqSugregWrQBLci4HG1gjR2NimOXBlMInCcVO3TYopamjJ1KlF+tVEgpwwMuddZEH2M6d9MHGejZnABO1RGDHny7jnGph8b8gqtSYFnqL+Zc6b/SW8ppNFigmyD5sJGo0d9JYKc/Q3gyFgtkwhC1G69U37L+/kN1zqxBayUPXDBqjpDCghJDBDaZ5wZo3LiorZbUgzej1Quy2n8gKKb+tstEwjcaK136v9Ksacs9+uElwsAhnYgu+G8mThChb/uef+CEKbbm7/xZaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os2vQ3DTgGcdZs4Q12QVtYakO9kEEaDsgBLkmsjjjwY=;
 b=E+5OMfyUXfqgvnR0xQvvBWc4YFH5aBgv2Xxr4vv+jkBasBNfUflkFBKYbjOhPTwtf3tGTUmDBv34skccZ/Cv4N7gTbA+r4aFGsCxYY4JuDNxiP8AcdrVnt87GvNXHEmRkooZ0716G6I9Pk8k59uGmMHQyi3HpmDc95fyPc3qSVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2ca7482d-65a9-8ac4-c6ad-2157a5d4f6b6@amd.com>
Date: Fri, 23 Sep 2022 09:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/9] automation: Add debug versions of Arm tests
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-4-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209221444340.65421@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209221444340.65421@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 443f480d-6d13-4cdb-41a5-08da9d376dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LCKDmqdxJWe4zvrp3K7ZHH7ZDBkI0xbFOH/HCtfkSnzsjri32Cl+Yc594BJbg6rsGKkt037N1ZaseH0u3J2u8n15iKtqoe3C2GG+OeI+Lh0aMo1MbVrwsv+d7aFIT0Qllh1KZjHnK5BBKfXytTmlQP3hQ7w/LRqkAKDaqiqZ2BNG4PF8ph5k2n6DfYhnIQjIfxzKINX6DRUu1HnUB5vAaZU5qEoTNf2Dzz4WMHryWNdChQ3JfNlxsC2xeiPU/xtgnVJoJTM2i8uvV76ghfEPjtoJDfwgwpSF0hrbHstddy7yOh3nEbunkbnVaKaJ+9BqwQs6BVb8h4DB/s00b3OiyQIhT/oR+65qkcLnO/ULKanpQBA4aHYGm8pi+JvxRwEv4sq7SMfdvwjkbwmTdIDwdkwj3F89qKN0P67H1l6I60HMTcQYa32RNFS/Nz/O0FG376XaRiy04xoj2z29sTd3iKePReV3alve0mMes4VY4s1Q0Q99IDMrWhZStQG2vhQbuQ6qH6k+qvW6bbMi/TS7UftPp0ClFj39qJn2v+B7Hp0o2A7gLud9BRByDD7vU28OLvcOxtKUZlroPD65HIbOkAjgO2OWNe1XwqZlAgqgAik+Gx40a6Wy+JyVboAa3F/i8cIATRfb2ykMTEv3Lu+SAarJ8Lyv6FPjr+s8tr/FuNChILQ61jVidZ9HmM2mvfww6uaNJFLmHDwZcaljWKRg8igh3cVmFJlvLxIZ9TMFg+sA4CtDXNWR8PKcxR2B2j6RcFgbh94fiVKA1Lv4RegFeRfrA29cqopuq7WfN10/xAI3N3JMmZXUFjYgaQIegR1VeACaHvu7ueKWFGDMf+gXYRUwAwKpNGhPBLYxApGyLPWqQA1MOJk4x1f3ifCdxvbals3gif0wdlN3aFVee9W45g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(316002)(31686004)(40480700001)(36860700001)(45080400002)(478600001)(356005)(54906003)(31696002)(4326008)(86362001)(8676002)(83380400001)(82740400003)(426003)(47076005)(36756003)(44832011)(70586007)(6916009)(966005)(26005)(41300700001)(81166007)(5660300002)(336012)(2906002)(8936002)(40460700003)(82310400005)(70206006)(2616005)(16576012)(53546011)(186003)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 07:44:21.5462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 443f480d-6d13-4cdb-41a5-08da9d376dc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886

Hi Stefano,

On 22/09/2022 23:53, Stefano Stabellini wrote:
> 
> 
> On Thu, 22 Sep 2022, Michal Orzel wrote:
>> At the moment, all the tests are executed on non-debug Xen builds.
>> To improve the coverage (e.g. we might catch some asserts), add new
>> test jobs using debug Xen builds.
> 
> This is interesting. On one hand, I agree it is good to test DEBUG and
> non-DEBUG builds in runtime tests too, on the other hand I am worried
> about our test capacity.

We still have plenty of capacity. We can add many more Arm tests because
Arm machine is very powerful. I reckon that adding more x86 tests would
have a performance impact but not the other way around. See below.

> 
> I take you have tried a few pipelines -- are the additional tests
> causing the pipeline to take longer? Do we still have "room" because x86
> is slower? What's your thinking?
> 

With the additional tests introduced by this patch one cannot observe any
impact for the performance. I ran several tests and the pipeline finishes
in the same time or faster.

Performance comparison:
current master: 92 jobs (82 minutes, 19 seconds)
master + my series: 103 jobs (79 minutes, 40 seconds)

That said, let's improve the coverage and add these non-debug tests for Arm.

> One idea would be to only do:
> - qemu-alpine-arm64-gcc-debug
> - qemu-smoke-arm64-gcc-debug
> 
> and not the others
> 
> 
>> Take the opportunity to increase RAM size for QEMU from 1GB to 2GB
>> in qemu-smoke-arm64.sh as the debug builds take more space and we might
>> end up in a situation when there is not enough free space (especially
>> during a static memory test that reserves some region in the middle).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/gitlab-ci/build.yaml        | 16 +++++
>>  automation/gitlab-ci/test.yaml         | 93 ++++++++++++++++++++++++++
>>  automation/scripts/qemu-smoke-arm64.sh |  6 +-
>>  3 files changed, 112 insertions(+), 3 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index d931441b910a..6ce92531f61f 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -587,6 +587,15 @@ alpine-3.12-gcc-arm64-staticmem:
>>        CONFIG_UNSUPPORTED=y
>>        CONFIG_STATIC_MEMORY=y
>>
>> +alpine-3.12-gcc-debug-arm64-staticmem:
>> +  extends: .gcc-arm64-build-debug
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_EXPERT=y
>> +      CONFIG_UNSUPPORTED=y
>> +      CONFIG_STATIC_MEMORY=y
>> +
>>  alpine-3.12-gcc-arm64-boot-cpupools:
>>    extends: .gcc-arm64-build
>>    variables:
>> @@ -594,6 +603,13 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_BOOT_TIME_CPUPOOLS=y
>>
>> +alpine-3.12-gcc-debug-arm64-boot-cpupools:
>> +  extends: .gcc-arm64-build-debug
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>> +
>>  ## Test artifacts common
>>
>>  .test-jobs-artifact-common:
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 4f96e6e322de..1b51030c6175 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -44,6 +44,25 @@ qemu-alpine-arm64-gcc:
>>    tags:
>>      - arm64
>>
>> +qemu-alpine-arm64-gcc-debug:
>> +  extends: .test-jobs-common
>> +  variables:
>> +    CONTAINER: debian:unstable-arm64v8
>> +  script:
>> +    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>> +  needs:
>> +    - alpine-3.12-gcc-debug-arm64
>> +    - alpine-3.12-arm64-rootfs-export
>> +    - kernel-5.19-arm64-export
>> +    - qemu-system-aarch64-6.0.0-arm64-export
>> +  artifacts:
>> +    paths:
>> +      - smoke.serial
>> +      - '*.log'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
>>  qemu-alpine-x86_64-gcc:
>>    extends: .test-jobs-common
>>    variables:
>> @@ -81,6 +100,25 @@ qemu-smoke-arm64-gcc:
>>    tags:
>>      - arm64
>>
>> +qemu-smoke-arm64-gcc-debug:
>> +  extends: .test-jobs-common
>> +  variables:
>> +    CONTAINER: debian:unstable-arm64v8
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>> +  needs:
>> +    - alpine-3.12-gcc-debug-arm64
>> +    - alpine-3.12-arm64-rootfs-export
>> +    - kernel-5.19-arm64-export
>> +    - qemu-system-aarch64-6.0.0-arm64-export
>> +  artifacts:
>> +    paths:
>> +      - smoke.serial
>> +      - '*.log'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
>>  qemu-smoke-arm64-gcc-staticmem:
>>    extends: .test-jobs-common
>>    variables:
>> @@ -100,6 +138,25 @@ qemu-smoke-arm64-gcc-staticmem:
>>    tags:
>>      - arm64
>>
>> +qemu-smoke-arm64-gcc-debug-staticmem:
>> +  extends: .test-jobs-common
>> +  variables:
>> +    CONTAINER: debian:unstable-arm64v8
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>> +  needs:
>> +    - alpine-3.12-gcc-debug-arm64-staticmem
>> +    - alpine-3.12-arm64-rootfs-export
>> +    - kernel-5.19-arm64-export
>> +    - qemu-system-aarch64-6.0.0-arm64-export
>> +  artifacts:
>> +    paths:
>> +      - smoke.serial
>> +      - '*.log'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
>>  qemu-smoke-arm64-gcc-boot-cpupools:
>>    extends: .test-jobs-common
>>    variables:
>> @@ -119,6 +176,25 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>>    tags:
>>      - arm64
>>
>> +qemu-smoke-arm64-gcc-debug-boot-cpupools:
>> +  extends: .test-jobs-common
>> +  variables:
>> +    CONTAINER: debian:unstable-arm64v8
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
>> +  needs:
>> +    - alpine-3.12-gcc-debug-arm64-boot-cpupools
>> +    - alpine-3.12-arm64-rootfs-export
>> +    - kernel-5.19-arm64-export
>> +    - qemu-system-aarch64-6.0.0-arm64-export
>> +  artifacts:
>> +    paths:
>> +      - smoke.serial
>> +      - '*.log'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
>>  qemu-smoke-arm32-gcc:
>>    extends: .test-jobs-common
>>    variables:
>> @@ -136,6 +212,23 @@ qemu-smoke-arm32-gcc:
>>    tags:
>>      - arm64
>>
>> +qemu-smoke-arm32-gcc-debug:
>> +  extends: .test-jobs-common
>> +  variables:
>> +    CONTAINER: debian:unstable-arm64v8
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
>> +  needs:
>> +    - debian-unstable-gcc-arm32-debug
>> +    - qemu-system-aarch64-6.0.0-arm32-export
>> +  artifacts:
>> +    paths:
>> +      - smoke.serial
>> +      - '*.log'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
>>  qemu-smoke-x86-64-gcc:
>>    extends: .test-jobs-common
>>    variables:
>> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
>> index f803835779f4..dea26c6c0a8f 100755
>> --- a/automation/scripts/qemu-smoke-arm64.sh
>> +++ b/automation/scripts/qemu-smoke-arm64.sh
>> @@ -52,7 +52,7 @@ curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cf6b0b8fabb02478b009c08da9ce4eac9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994804254367719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=jgGdO93kLoieg6UqajFWYAsufvvv5mZVYHD%2B7fUW7ME%3D&amp;reserved=0
>>  ./binaries/qemu-system-aarch64 \
>>     -machine virtualization=true \
>>     -cpu cortex-a57 -machine type=virt \
>> -   -m 1024 -smp 2 -display none \
>> +   -m 2048 -smp 2 -display none \
>>     -machine dumpdtb=binaries/virt-gicv2.dtb
>>
>>  # XXX disable pl061 to avoid Linux crash
>> @@ -117,7 +117,7 @@ cd ..
>>
>>  # ImageBuilder
>>  echo 'MEMORY_START="0x40000000"
>> -MEMORY_END="0x80000000"
>> +MEMORY_END="0xC0000000"
>>
>>  DEVICE_TREE="virt-gicv2.dtb"
>>  XEN="xen"
>> @@ -158,7 +158,7 @@ timeout -k 1 240 \
>>  ./binaries/qemu-system-aarch64 \
>>      -machine virtualization=true \
>>      -cpu cortex-a57 -machine type=virt \
>> -    -m 1024 -monitor none -serial stdio \
>> +    -m 2048 -monitor none -serial stdio \
>>      -smp 2 \
>>      -no-reboot \
>>      -device virtio-net-pci,netdev=n0 \
> 
> The changes to qemu-smoke-arm64.sh make sense, but could you move them
> to a separate patch in case we need to do any backports?

Ok, I will do a prerequisite patch for that one.

> 
> Also I would change MEMORY_END to 0xC0000000 in qemu-alpine-arm64.sh too
> for uniformity.

I already did that in patch [6/9] automation: qemu-alpine-arm64: Cleanup and fixes.

~Michal

