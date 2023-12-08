Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75219809F1E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650463.1016014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX0z-00023T-GL; Fri, 08 Dec 2023 09:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650463.1016014; Fri, 08 Dec 2023 09:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX0z-000213-Da; Fri, 08 Dec 2023 09:19:21 +0000
Received: by outflank-mailman (input) for mailman id 650463;
 Fri, 08 Dec 2023 09:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBX0y-00020x-21
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:19:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc423a8e-95aa-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:19:17 +0100 (CET)
Received: from CY8PR19CA0020.namprd19.prod.outlook.com (2603:10b6:930:44::17)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 09:19:10 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::47) by CY8PR19CA0020.outlook.office365.com
 (2603:10b6:930:44::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 09:19:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.26 via Frontend Transport; Fri, 8 Dec 2023 09:19:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 03:19:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 8 Dec
 2023 01:19:09 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 03:19:07 -0600
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
X-Inumbo-ID: dc423a8e-95aa-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB2QgUFnpWXefSH4eunQd0P0srZ4nQMpP6YSGZoryE7SKJ6z9bUUqXzuiG2CFrnZ4EtTrmA8Rv98o6zzE1hI4O+8shFloUqvP6yDi0JEbfci7m1AtsTV0FtI/vlzPIn0v5XDxelzkibG0ads78nHMIYfSWfIxmVwoA0Q3QZgqY+PDJi7voQvy5TVFu0fT3/63N+UOGuXcEkxm2UBg8nBe1zXXvxFerehmX3UwM96LIEErI4xunnEe7bcY2H3ekSUCqgKxLPqbKwvfwOdoAlq7TRuZtTrG50uG84KNeUgDUsuWVXhaIDaBjpUMnEcGYY+TOBKiJxiPaD7uGsGh6jW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJD279BdY/h6Bh6XxJjY9t1e4huNc1eDhltX5XrNZz8=;
 b=PhjmpEbbgjugfQoDODhJpE6kxBiL6r4LuVoz4nMeb+K0w8+SDTrwxqL1m/hlAq9eT3fZ77spcV/CL5c5eSKRJjcZX60OtGTR/hcgbWVkruwMpPfDEN0gJMx76d8hHkkIjooGFpA2F/tp/XWL+vjJ1efWO4LO5GkG0hcV4yKsEkMx5bhduuL4ny9GxaXeCpJ9hsJWk6ZfQ2z7eIAj/pfqDfWYv1pvHRUOfPeqhstxrM0wH3wZmdACWNxPT36yXWCHIB9VqdmrGpH9/vL4RFqXfcDG37ofr8lmPZkglyNLZGoh48gn9jXZmxXh/Z+KIeAlragEi59cRWJr3+BswNZ4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJD279BdY/h6Bh6XxJjY9t1e4huNc1eDhltX5XrNZz8=;
 b=ocICzshtArkQJZsQQWecsTkMzSoJC8WCb+bIZ157cNJm334cpkDRPIOiCrAmCjeJNhhh0ag0AysiR4BO5rLNNJN94h8gbq5fi6mEp+aUn9ILIzThskn1WKr1RcrsK3RhN5KAUanG12RqO/j7ovBCZmmQ2SPERRBMv5clpV738Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8c420801-9fae-420d-b4c8-b30a0e5cb024@amd.com>
Date: Fri, 8 Dec 2023 10:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] automation: Add the arm64 FVP build and Dom0 smoke
 test jobs
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-6-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231208054637.1973424-6-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 864a25fd-df05-4da6-c7a8-08dbf7cebc85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8OKFV/MJ8/1WY1nIBn3TLM1Xxl5uqHlng/ha4S9iRcdw1Amv56yO5WugzmuVVPDammnkqjfwP/OAsJjT+U5lB2bU0zuBM9XdgKU3dwwu7MyOGs8e665lILLesUUtJGaX1sp+/MjA2cG9xZ+Qjy4JfNTBzVuBqIGIR/vgWwD8HGFqJnAwwkq6If/3pua1G3e6bH83UFHKf17Fz1ZWX/xI4I2YdyeCBpw6Eod0EfyoztMaMVQN7VcmlT17lMnmBhm+8UjqPY0R3B7i/wYmRYlXhGiJ5ORuKgfLjTqCKvr/O0E+Am71fM6cp45yK+hx1iCvgvU2Irsh69ZSlxOwk6uSnZgNchW+Y6WiV/M21O1QvdXV4RDbCd/JTR/lL+m8ZSWI9pNMe+Tyx4kegwKWKEOejpHGkM1vL+pZBW3byUjmEAgoWrCxH7f3hW2Ru2trUH5/hwM19QWDAUrIO7hYAn7j0wsarsCcFzb4b0MVejj2NYb4vkrlP7hXSbiS8WyUIjGPJXlPrLygAyAowroa32y+gdQ32P4QTDCQXeM93+aRE0Qi0X5Gck0ZSXIic96MNnxv6YuihZKhxhC66ByCHxeFqtdnAR2kW2SNlHVg/XPohZnQvQFm4TFloleNxGv4sC5Jui97A/P+TuddcispaPemzYnCHrka+RTacleJkK5jZ3TwS+LppsvUoWGkZzhV+goxJZfddAVGb4NO6AO42L5a/+moAidwPGHPOBAQyVD5Hz2t2e9r7TaAAm2uNji5C21G+pb813kKAF+z1G8BV+XLxT6w9Kr/PjzNaGlRmERHVWw1IbUOZDF/lNNoCb9DW/xuVAyr57Oov9XFIzUiCPA6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799012)(186009)(46966006)(36840700001)(40470700004)(40480700001)(84970400001)(31686004)(40460700003)(36860700001)(41300700001)(2906002)(5660300002)(16576012)(36756003)(8676002)(4326008)(316002)(356005)(426003)(110136005)(81166007)(478600001)(53546011)(31696002)(2616005)(8936002)(70586007)(82740400003)(54906003)(26005)(70206006)(47076005)(86362001)(44832011)(83380400001)(966005)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:19:10.0014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864a25fd-df05-4da6-c7a8-08dbf7cebc85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

Hi Henry,

On 08/12/2023 06:46, Henry Wang wrote:
> 
> 
> Add a job in the build stage to export the TF-A, U-Boot and the
> device tree for the FVP platform from the test artifact container.
> 
> Add a FVP smoke test job in the test stage to do the same test as
> the `qemu-smoke-dom0-arm64-gcc` job.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with a remark...

> ---
> v2:
> - Add Stefano's Reviewed-by tag.
> 
> Although it does not affect the functionality, I am still quite
> confused about why the logs displayed by GitLab UI, for
> example [1], is much less than the actual output (saved in the
> artifacts, see [2]). Had a discussion with Michal on Matrix
> and we agree that the log in gitlab UI is usually capped.
> 
> [1] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5690876361
> [2] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5690876361/artifacts/file/smoke.serial
> ---
>  automation/gitlab-ci/build.yaml | 17 +++++++++++++++++
>  automation/gitlab-ci/test.yaml  | 22 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30cced..89d2f01302 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -344,6 +344,23 @@ kernel-6.1.19-export:
>    tags:
>      - x86_64
> 
> +armfvp-uboot-tfa-2023.10-2.9.0-arm64-export:
> +  extends: .test-jobs-artifact-common
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/armfvp-uboot-tfa:2023.10-2.9.0-arm64v8
> +  script:
> +    - |
> +       mkdir binaries && \
> +       cp /bl1.bin binaries/bl1.bin && \
> +       cp /fip.bin binaries/fip.bin && \
> +       cp /fvp-base-gicv3-psci-1t.dtb binaries/fvp-base-gicv3-psci-1t.dtb
> +  artifacts:
> +    paths:
> +      - binaries/bl1.bin
> +      - binaries/fip.bin
> +      - binaries/fvp-base-gicv3-psci-1t.dtb
> +  tags:
> +    - arm64
> +
>  # Jobs below this line
> 
>  # Build jobs needed for tests
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 6aabdb9d15..47e00d0a0b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -96,6 +96,19 @@
>    tags:
>      - xilinx
> 
> +.fvp-arm64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:bookworm-arm64v8-fvp
> +    LOGFILE: fvp-smoke-arm64.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  .adl-x86-64:
>    extends: .test-jobs-common
>    variables:
> @@ -459,3 +472,12 @@ qemu-smoke-ppc64le-powernv9-gcc:
>    needs:
>      - qemu-system-ppc64-8.1.0-ppc64-export
>      - debian-bullseye-gcc-ppc64le-debug
> +
> +fvp-smoke-dom0-arm64-gcc-debug:
> +  extends: .fvp-arm64
> +  script:
> +    - ./automation/scripts/fvp-base-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
This would imply the need for qemu-system-aarch64-6.0.0-arm64-export which you don't need.
I think you could do:

.fvp-arm64-test-needs: &fvp-arm64-test-needs
  - alpine-3.18-arm64-rootfs-export
  - kernel-5.19-arm64-export
  - armfvp-uboot-tfa-2023.10-2.9.0-arm64-export

and then reference this in your job. This will be reused by other FVP tests in the future.

~Michal

