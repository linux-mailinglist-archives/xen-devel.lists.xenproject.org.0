Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C695695B24
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 08:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495006.765246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRq70-0004Y9-Pk; Tue, 14 Feb 2023 07:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495006.765246; Tue, 14 Feb 2023 07:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRq70-0004W0-N2; Tue, 14 Feb 2023 07:52:26 +0000
Received: by outflank-mailman (input) for mailman id 495006;
 Tue, 14 Feb 2023 07:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRq6z-0004VG-D5
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 07:52:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839546e8-ac3c-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 08:52:23 +0100 (CET)
Received: from MW4PR04CA0089.namprd04.prod.outlook.com (2603:10b6:303:6b::34)
 by MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 07:52:20 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::26) by MW4PR04CA0089.outlook.office365.com
 (2603:10b6:303:6b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 07:52:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Tue, 14 Feb 2023 07:52:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 01:52:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 01:52:18 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 14 Feb 2023 01:52:18 -0600
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
X-Inumbo-ID: 839546e8-ac3c-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/4+4cB6x6bQeClFZHgbX3ZF+ki7IhSv1VZ5hpJ6Eafmw5fgG1OM/TmJzEGpJ4NkPEOjktAYBBuEFYeMAharc0qwBe21hWEU8PSykTl9eqHVJ9NVXVZ3DstNzR28USie+VeayOjYSy7dtjeEotwpZlL8e3DzuL4SJir/vIiH/YraWNVeky6pJE446HN885LMwtXCLUwsMY6Lg1dgI34UQU1XeKcqMutc4hXK+raHxKRN6w1C6KUOH5t0DU32m4s++4Qt3O/VMoKORm2Hapjpygh8YEMyLUE8oZetb51+vlDoR2EhB67/hNAxjLnK5i3SHyB8n+0TFmYhAPO2M3gHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Rp3QHIazdVXBLCezcWIPqOQhG3XUpEGbOhHqnhMpfg=;
 b=mkVJQ+QiVF32dsMRap1BVv5V8yykbSpGdF9eWPoq+UVE2ZuVxLboNPTzuXvSNcaxPjr1hKuIBxRooOY1H2UJctXq8xPz5vn5GFx90t7NJTvcCQOG939GmIwy8gdP2YeOx4p6gzRtolzOHtId/oLRZZtFKJaRteMhNITsd1aENZ0NGws2geNLSMXkNdgRvUecaaFrvpLkBMlcIZfbi2sM7BnKjqAtrJARnWAeQTXz/Z0LDXpNtRCSLojaI3fszZMB7Jnwz6Hxg8wLXToAdIn2eH0CYo+N4qfshLssKUBhnLkga9aV3QZxjuyPQAba1YBc6rAOh7Y34EE5+4FLVj1/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Rp3QHIazdVXBLCezcWIPqOQhG3XUpEGbOhHqnhMpfg=;
 b=t/yczx4m2vn8I0k676gB9F9UaYwoQhs8v3VnHD9v667CIvUR6vDuxCfpy635vlLIumQyAy5C/YQAY9eNgwJqCzXWz/qb6ioG9js/U+OjiJrtWUYH3MknbB3t5GC/wzwhMcLabMKiDPZqPh6VhNQtHPoHgLlGXhnprHLwDdfIUzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <74d3f3db-9cb6-f944-50c2-5e94e2e342db@amd.com>
Date: Tue, 14 Feb 2023 08:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] automation: Add container and build jobs to run cppcheck
 analysis
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20230213142312.11806-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2302131551430.4661@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2302131551430.4661@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a227417-97fe-48eb-4eb0-08db0e60665f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uKy9AbCX6XHZrhVJxpRNsGiPo+xj+7Elk8ke+bKau9KWPgE1/3bnrCNy+zYTlKjz8oA3UHxDHOMCxHpaPOgpclRwelvbiVGgbsN4eKmVv/EwIBYg8HseBgVMnZg/DMTybFKRcrWibZXcumngmI2YrAoPn03qoUipLsJDONhKIMzMc1Bvzu6K0sp51TjHuwFgbBPw5C6qtbNKQg8ni54QTviytTv9jx7XKrJNatc4dtzNw2MHcvU2c/prLYiiVe7PNzq/idEbqrK+Rh0OGw8/RC08C8n+zlANdGoe1gT2JXFPbNBvkf+rbipMzw3w9aaYCw2JPPmRGUqSGdiclZ0mVc01wE3GrFK2iFtKS8SMIdE+NJ/RyRAYUZouW3IMWPULDSyae7v/VsKisfkB3rOmkK+j4nq8S34/x3038R+VbUp1GhTbL2AD55y/tzVHbNn8wGrexzmQFCLOVnXcmlx23CDfr++VvyGfHGR11IsMBWqGnrvBETBp9aE6vtIBkGGFS1BRKLzdIUrUUxa114PBRf+APqDD9fvjtuw0dfdx6YDiOGdzPmrbGUP3qnIW3m20Z6giadN+SYndn+WULyhTK8V5/CxsGuIpfVAs2vNW77unRjHzayoavVgTSoyUq2W1tD/e7+oepFm3z26aM8x57MilYTh0RahaPpkqm92xJrnwmOB9DBkEASh1C1EytMhTzUBvm0bgMRYBdZe9/MMmTzir+9od7aTlW9GA6oGHt7LXWDZmIumzegdIWvCy1zmQUD/ZY5KDOoT1cNP42PnXLUdjo6SfFf528VyzuIkKc+8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(53546011)(47076005)(82310400005)(82740400003)(31686004)(966005)(186003)(478600001)(26005)(2906002)(81166007)(356005)(40460700003)(83380400001)(426003)(86362001)(44832011)(36860700001)(54906003)(316002)(16576012)(41300700001)(31696002)(70206006)(36756003)(40480700001)(336012)(6916009)(5660300002)(8936002)(2616005)(4326008)(8676002)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 07:52:19.8666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a227417-97fe-48eb-4eb0-08db0e60665f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454

Hi Stefano,

On 14/02/2023 00:56, Stefano Stabellini wrote:
> 
> 
> On Mon, 13 Feb 2023, Michal Orzel wrote:
>> Add a debian container with cppcheck installation routine inside,
>> capable of performing cppcheck analysis on Xen-only build including
>> cross-builds for arm32 and arm64.
>>
>> Populate build jobs making use of that container to run cppcheck
>> analysis to produce a text report (xen-cppcheck.txt) containing the list
>> of all the findings.
>>
>> This patch does not aim at performing any sort of bisection. Cppcheck is
>> imperfect and for now, our goal is to at least be aware of its reports,
>> so that we can compare them with the ones produced by better tools and
>> to be able to see how these reports change as a result of further
>> infrastructure improvements (e.g. exception list, rules exclusion).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks for the patch, very nice!
> 
> 
>> ---
>> For those interested in, here is a sample pipeline:
>> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
>> ---
>>  .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
>>  automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
>>  automation/scripts/build                      | 11 ++++-
>>  3 files changed, 87 insertions(+), 1 deletion(-)
>>  create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile
>>
>> diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
>> new file mode 100644
>> index 000000000000..39bcc50673c8
>> --- /dev/null
>> +++ b/automation/build/debian/unstable-cppcheck.dockerfile
>> @@ -0,0 +1,37 @@
>> +FROM debian:unstable
>> +LABEL maintainer.name="The Xen Project" \
>> +      maintainer.email="xen-devel@lists.xenproject.org"
>> +
>> +ENV DEBIAN_FRONTEND=noninteractive
>> +ENV CPPCHECK_VERSION=2.7
>> +ENV USER root
>> +
>> +RUN mkdir /build
>> +WORKDIR /build
>> +
>> +# dependencies for cppcheck and Xen-only build/cross-build
>> +RUN apt-get update && \
>> +    apt-get --quiet --yes install \
>> +        build-essential \
>> +        curl \
>> +        python-is-python3 \
>> +        libpcre3-dev \
>> +        flex \
>> +        bison \
>> +        gcc-arm-linux-gnueabihf \
>> +        gcc-aarch64-linux-gnu
>> +
>> +# cppcheck release build (see cppcheck readme.md)
>> +RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
>> +    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
>> +    cd cppcheck-"$CPPCHECK_VERSION" && \
>> +    make install -j$(nproc) \
>> +        MATCHCOMPILER=yes \
>> +        FILESDIR=/usr/share/cppcheck \
>> +        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
>> +
>> +# clean
>> +RUN apt-get autoremove -y && \
>> +    apt-get clean && \
>> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* && \
>> +    rm -rf cppcheck-"$CPPCHECK_VERSION"* "$CPPCHECK_VERSION".tar.gz
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index a053c5c7325d..c8831ccbec7a 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -7,6 +7,7 @@
>>      paths:
>>        - binaries/
>>        - xen-config
>> +      - xen-cppcheck.txt
>>        - '*.log'
>>        - '*/*.log'
>>      when: always
>> @@ -145,6 +146,23 @@
>>    variables:
>>      <<: *gcc
>>
>> +.arm64-cross-build-tmpl:
>> +  <<: *build
>> +  variables:
>> +    XEN_TARGET_ARCH: arm64
>> +  tags:
>> +    - x86_64
>> +
>> +.arm64-cross-build:
>> +  extends: .arm64-cross-build-tmpl
>> +  variables:
>> +    debug: n
>> +
>> +.gcc-arm64-cross-build:
>> +  extends: .arm64-cross-build
>> +  variables:
>> +    <<: *gcc
>> +
>>  .arm64-build-tmpl:
>>    <<: *build
>>    variables:
>> @@ -679,6 +697,28 @@ archlinux-current-gcc-riscv64-debug-randconfig:
>>      EXTRA_FIXED_RANDCONFIG:
>>        CONFIG_COVERAGE=n
>>
>> +# Cppcheck analysis jobs
>> +
>> +debian-unstable-gcc-cppcheck:
>> +  extends: .gcc-x86-64-build
>> +  variables:
>> +    CONTAINER: debian:unstable-cppcheck
>> +    CPPCHECK: y
>> +
>> +debian-unstable-gcc-arm32-cppcheck:
>> +  extends: .gcc-arm32-cross-build
>> +  variables:
>> +    CONTAINER: debian:unstable-cppcheck
>> +    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
>> +    CPPCHECK: y
>> +
>> +debian-unstable-gcc-arm64-cppcheck:
>> +  extends: .gcc-arm64-cross-build
>> +  variables:
>> +    CONTAINER: debian:unstable-cppcheck
>> +    CROSS_COMPILE: /usr/bin/aarch64-linux-gnu-
>> +    CPPCHECK: y
>> +
>>  ## Test artifacts common
>>
>>  .test-jobs-artifact-common:
>> diff --git a/automation/scripts/build b/automation/scripts/build
>> index f2f5e55bc04f..c219752d553e 100755
>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -38,7 +38,16 @@ cp xen/.config xen-config
>>  # Directory for the artefacts to be dumped into
>>  mkdir binaries
>>
>> -if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>> +if [[ "${CPPCHECK}" == "y" ]]; then
>> +    # Cppcheck analysis invokes Xen-only build.
> 
> Given that when $CPPCHECK == y we are doing a hypervisor-only build,
> what do you think of also specifying $HYPERVISOR_ONLY == y in these
> cases?
> 
> We could set both CPPCHECK=y and HYPERVISOR_ONLY=y in build.yaml and
> then here also check for both.
Well, these are just cosmetic changes not impacting anything important, so
if you want, I am ok to explicitly set HYPERVISOR_ONLY=y for cppcheck jobs.

> 
> 
>> +    # Known limitation: cppcheck generates inconsistent reports when running
>> +    # in parallel mode, therefore do not specify -j<n>.
> 
> I take you tried -j$(nproc) on gitlab-ci and didn't work well? I tested
> -j$(nproc) in my native arm64 environment and seemed to work well.
Both me and Luca agreed on the fact that the reports are inconsistent when
running cppcheck analysis with -j$(nproc). It is not that it would fail to create
a report. Instead, there will be some internal cppcheck errors present in a report.
Therefore, to minimize the risk of producing incorrect list of findings it is best
not to specify -j<n>.

> 
> 
>> +    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
>> +
>> +    # Preserve artefacts
>> +    cp xen/xen binaries/xen
>> +    cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
>> +elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>>      # Xen-only build
>>      make -j$(nproc) xen
>>
>> --
>> 2.25.1
>>

~Michal

