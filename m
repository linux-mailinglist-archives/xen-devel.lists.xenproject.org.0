Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD15E74DD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 09:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410618.653707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obd6m-00035Y-7L; Fri, 23 Sep 2022 07:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410618.653707; Fri, 23 Sep 2022 07:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obd6m-000332-4S; Fri, 23 Sep 2022 07:28:24 +0000
Received: by outflank-mailman (input) for mailman id 410618;
 Fri, 23 Sep 2022 07:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tkvz=Z2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obd6k-00032w-LD
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 07:28:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c093153-3b11-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 09:28:20 +0200 (CEST)
Received: from BN9PR03CA0155.namprd03.prod.outlook.com (2603:10b6:408:f4::10)
 by CH2PR12MB4873.namprd12.prod.outlook.com (2603:10b6:610:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 07:28:17 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::b0) by BN9PR03CA0155.outlook.office365.com
 (2603:10b6:408:f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 07:28:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 07:28:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 02:28:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 00:28:15 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 23 Sep 2022 02:28:14 -0500
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
X-Inumbo-ID: 4c093153-3b11-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUcRyXw1y8inGBOLfpKFvh2+qGdEMtvPKv9fd19VocyVOY0VHk0ZCrbEHzjo2k7KRAX6CbFQVnTSyxUvszkZGb1zspb9PCBuBQBg5Jr5MELFNpsiMXpmh8B6xuKPDoeMjRE74EQ1ja5IuCZ8nxrK4OI6PvCpP9n3Q707ZK4Cv50+QhMMN69Mu8pV2Sn8nC7V2F1PMMRIsOkoeD0PhCk5W4Tc14hJ2ulpKc4MXkh3hhkb2mJ3VDtKpIocbFYYi7MCETeQRaG45BYEfCcSdtlgStuptEcHJBTepI0RgRmC/CO7FogLVeOey+NDsjQ0usEEmAGKR3Zbzo18HrWYtwdysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWWDTpR9fV6b1ululcNbVcQjv7vwh4lAstAjc0J6pjc=;
 b=hQCmkT9Hj1ziNuTbndaE/l8L+G11aHPj8uESH1W2qVt7cyKVOsMvGrOWMnXSjv6KItferp93BKOm2ciCOinvtnftyR+GUg4B/SXkyDruIMgtmbaMWubdxbZRR0m2scEdgPH1N9W+lAkuBvCxaYX6KMrWnCsWQL3y0+rCCaq4bCTlTdvizZCv+IHR8kMCh9KNInU+iV2vz1nrrOcmDHcjCA6yUJki1QCNGpU5qpyOE0Cs2yOtXarnj38MEgMVOU1B32mYn/zS5OqB2JgduH3hpIyFxeKTmXiGYkWepQV1qOkHgpCO8yro5KTImJbelMwHwUqPnD+LAKPYpGWYm6RUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWWDTpR9fV6b1ululcNbVcQjv7vwh4lAstAjc0J6pjc=;
 b=cvI646cLoK5INW5+gWY+WlbV291hyAZigphCIPipCiUOGMDPhtoOOTxS+DtpJeoNm3qFMdbKOHNlVnum9ppm4rEvL9RQnoLPKS5ke1tFbZskjPaW1XHDP0jmJU7FRNJ49V5IRQZ29YsLDDrSat4dKm/04Vd8GTlKjih1hrC9Pxk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a9f2d91f-3aa7-4578-5181-21341d87ee7d@amd.com>
Date: Fri, 23 Sep 2022 09:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/9] automation: Use custom build jobs when extra config
 options are needed
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	<Henry.Wang@arm.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-2-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209221439550.65421@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209221439550.65421@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT016:EE_|CH2PR12MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: c304ce70-5c82-4f9d-7eb1-08da9d352f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3aW0uzFc9Cbrq8+O8XJsuxhL7Ixz4FcRL6FuhCAYM0NlEyLXvbYN8YR99Plsij72A78LnuXVzwxzhRWF9RWH0pYMHRb5BX4mgL/csBkO1ipQzn8fiWem/YSU3Q5Vz4YzpPjChJY976qt69LgBw9SJbFX6R2i1sMLpUYd5J67aINCtrhazE1Fon2f1dygQZEyi8XVzC+/xdtRJ1TwUsFKN5JVTrnY3Beib6WMNwi20SOq08WcDStzO3YdFMLOrZw8Yi1Jexz8At3WHqXKcgSzNH+Q+akgxYBMSoEBTTUcrTmTXQGT40VRXFjFJYuDqwT5vivEFLOBzU6ExRae0Q+3DVmN8i//RF7anQFcYtA97xTvhzI7MzWNW9o2YN8KmH6mduMBdyVUIYERDvvzVjepLGPO/ilFW2vPRMrvLVFI3e4n2S7Ur0IMjzWJeRe/DMDxbbpI7gKThcdF2gABnJoaQ96yfEKDoLUGnVpWgzK8td3AfIm5Zg1w7AQroz+nj8Vme5uprtr1i346a2Neaexz8ZYeWAb/DxrlOACc4hU61MoXlBbsh5+70G9lo+cL281CP+TvIkp43ylIW4MWVPQzQ9a5m58LNGw7mz3kA3hjH93bWrcq7EdMZ+k+tK5VFWPIWNNqiLEQhPGghq9ezQOPWPK9Hi9qLwltm2aTeyJkp/G9o+PFItKADZH7Q+5E8vS0bPNlB+GVCwD2AnLXAzWzTvXkS/8c2iFbn6eTtjKc06Sx7HzrxqkmkOw4fOaXf1i1fskzOp0UsJfBzycMPi2pIPKF5swDAm7AzF/jXP0gFeaQd5u8ho8uKVZr9sjL6gpB3FqBN02783SHDMZ5CdnfAdnm8RUTADEf9aIeWIRoy6I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(26005)(36860700001)(31686004)(8676002)(4326008)(16576012)(316002)(70586007)(70206006)(36756003)(40460700003)(41300700001)(31696002)(86362001)(8936002)(5660300002)(356005)(40480700001)(53546011)(82310400005)(83380400001)(336012)(82740400003)(44832011)(81166007)(186003)(2616005)(478600001)(54906003)(6916009)(966005)(426003)(47076005)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 07:28:17.3307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c304ce70-5c82-4f9d-7eb1-08da9d352f03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4873

Hi Stefano,

On 22/09/2022 23:40, Stefano Stabellini wrote:
> 
> 
> On Thu, 22 Sep 2022, Michal Orzel wrote:
>> Currently, all the arm64 defconfig build jobs, regardless of the
>> container used, end up building Xen with the extra config options
>> specified in the main build script (e.g. CONFIG_EXPERT,
>> CONFIG_STATIC_MEMORY). Because these options are only needed for
>> specific test jobs, the current behavior of the CI is incorrect
>> as we add the extra options to all the defconfig builds. This means
>> that on arm64 there is not a single job performing proper defconfig build.
>>
>> To fix this issue, add custom build jobs each time there is a need for
>> building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
>> variable to be used by these jobs to store the required options. This
>> variable will be then read by the main build script to modify the .config
>> file. This will also help users to understand what is needed to run specific
>> test.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> This patch could actually be consider to be taken for 4.17 release.
>> The reason why is because currently our CI for arm64 does not even
>> peform clean defconfig build which is quite crucial target to be tested.
>> Performing builds always with EXPERT and UNSUPPORTED is not something so
>> beneficial for release tests. This is up to the release manager.
> 
> + Henry
> 
> I agree this should go in 4.17, so that gitlab-ci can test non-DEBUG
> builds on ARM.
> 
Do you mean the whole series should go in?
I'm ok with that, even though I only marked this patch as the one that should go in
as it can be seen as a fix. But I can also see the benefits of merging the whole series.

> 
>> ---
>>  automation/gitlab-ci/build.yaml | 15 +++++++++++++++
>>  automation/gitlab-ci/test.yaml  |  4 ++--
>>  automation/scripts/build        |  8 ++------
>>  3 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index 720ce6e07ba0..a39ed72aac6d 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -566,6 +566,21 @@ alpine-3.12-gcc-debug-arm64:
>>    variables:
>>      CONTAINER: alpine:3.12-arm64v8
>>
>> +alpine-3.12-gcc-arm64-staticmem:
>> +  extends: .gcc-arm64-build
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    EXTRA_XEN_CONFIG: |
> 
> Why the "|" ?
> 
> I was trying to look for its documentation in the gitlab yaml docs but
> couldn't find it.
> 
By default gitlab variables are one liners so that they can store one key:value pair.
If you want to define a variable storing multiple values (in this case we want to
store multi-line string because of .config format) you need to use |. You can check [1].

> 
>> +      CONFIG_EXPERT=y
>> +      CONFIG_UNSUPPORTED=y
>> +      CONFIG_STATIC_MEMORY=y
>> +
>> +alpine-3.12-gcc-arm64-boot-cpupools:
>> +  extends: .gcc-arm64-build
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>>
>>  ## Test artifacts common
>>
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index d899b3bdbf7a..4f96e6e322de 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
>>    script:
>>      - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>>    needs:
>> -    - alpine-3.12-gcc-arm64
>> +    - alpine-3.12-gcc-arm64-staticmem
>>      - alpine-3.12-arm64-rootfs-export
>>      - kernel-5.19-arm64-export
>>      - qemu-system-aarch64-6.0.0-arm64-export
>> @@ -107,7 +107,7 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>>    script:
>>      - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
>>    needs:
>> -    - alpine-3.12-gcc-arm64
>> +    - alpine-3.12-gcc-arm64-boot-cpupools
>>      - alpine-3.12-arm64-rootfs-export
>>      - kernel-5.19-arm64-export
>>      - qemu-system-aarch64-6.0.0-arm64-export
>> diff --git a/automation/scripts/build b/automation/scripts/build
>> index 2f15ab3198e6..7d441cedb4ae 100755
>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -15,12 +15,8 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>>      hypervisor_only="y"
>>  else
>> -    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
>> -        echo "
>> -CONFIG_EXPERT=y
>> -CONFIG_UNSUPPORTED=y
>> -CONFIG_STATIC_MEMORY=y
>> -CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
>> +    if [ -n "${EXTRA_XEN_CONFIG}" ]; then
> 
> NIT: for uniformity with rest of the file use
> 
>   if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> 
Ok, will do in v2.

> 
>> +        echo "${EXTRA_XEN_CONFIG}" > xen/.config
>>          make -j$(nproc) -C xen olddefconfig
>>      else
>>          make -j$(nproc) -C xen defconfig
>> --
>> 2.25.1
>>

~Michal

[1] https://docs.gitlab.com/ee/ci/variables/#store-multiple-values-in-one-variable

