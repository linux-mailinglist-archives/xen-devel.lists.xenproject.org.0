Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2C62F026
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 09:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445494.700674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovx7k-0005YN-87; Fri, 18 Nov 2022 08:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445494.700674; Fri, 18 Nov 2022 08:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovx7k-0005WL-5D; Fri, 18 Nov 2022 08:53:24 +0000
Received: by outflank-mailman (input) for mailman id 445494;
 Fri, 18 Nov 2022 08:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovx7i-0005WD-Ir
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 08:53:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 721ce830-671e-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 09:53:19 +0100 (CET)
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 08:53:16 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::6d) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 08:53:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.9 via Frontend Transport; Fri, 18 Nov 2022 08:53:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 02:53:14 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 02:53:09 -0600
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
X-Inumbo-ID: 721ce830-671e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW74CBKz9q2PULbXpNIzKVf9LNyymMQZNx4P7IweS36Uo94xVKWI0USRpiae6TV0pjHjz0nBtK5eYK4IvvDFUUREHXt0+1NXaTUp/Ku53lREy1pJPU+NUcoNYkloH3yT+EVc7OzELqj1jkqOpcVHWOZEO/eMuJE7wBAhZtlxzrAsk8TJXMdcnvY2a9ufux/B+J53PaRb9Vloda8tihWZ3uqHveaGv9Fgxnov/oT2rO3nNsvUiWcxGYJMZOHS7z57ByJbnvlwIDLcWtJMmlh177U5WlKCfuHxScljcDZBITwY9HDtKUV/Xh3oA5PYZyZYRNVgvbq0VPzmnfT+l4MeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16cFksNDdMSBBWTW4A9NVEIxCll2RCqB1/c4Vyb7GO8=;
 b=ZlOxydkrKxhf0rjDnHLlM0SpEqzq0wZE1gjQ/qEqdnjPiLUPQd2OR5fDFp3fBjOjsQrKbr7ztZtnkS4rcJJ5mroGt7YwZnlwRPx2Pgrt/9s0I3vBy1ib5EFETKLNRgp/PHiodMf5ruxQUD/2YKb1zv4IzaZMtSm44XaAKTCakL00AMV0t5FwzaDPDsUvle/GmvKE57+S7usmEuLDkzTL5c/xiPBKvf8PTJ+HtLf2ZG/U0rnFC4Jgr/xB1mZazKcKGwQPncsNpk1rnclzCC3eg2b7EHF9Q9zxmFaApwB8UgdZkw8JrM1j8ZX8FaWUV+xMUFkLP2VgZPbZsSJpRLE88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16cFksNDdMSBBWTW4A9NVEIxCll2RCqB1/c4Vyb7GO8=;
 b=ZdJDMFqQTy7BFpmy0LFwGFAMQKo8KHusCQirijTvKsUWPX7W5H4+MJIYQugbKkkFPKSnq8yQSULp1lXOp1GraRXZI7JNtCWZMocaaETyHlf3nGMxq4dNBg7cpYCvhMXU3+nlasdNWaymcUVXKEP+XClE/QQEAhCn59053v8Q3Kk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <60ff35c3-0b3a-7c9f-edf5-0639056570d7@amd.com>
Date: Fri, 18 Nov 2022 09:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] automation: Create Yocto docker images
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1668677493.git.bertrand.marquis@arm.com>
 <6d48a0f83324d2f42597d43c41ce72d6d80150e6.1668677493.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6d48a0f83324d2f42597d43c41ce72d6d80150e6.1668677493.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: d11daa66-ec0d-4468-35b8-08dac9425486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sVmtCfkBeNHN/jSJskDf2qa1Axz0STg2KRu+hmvPI/VTz26t6b7sNdho9GEDcQSbbVHih60CUFhAKI72NPvkIUpZllGpkG5Tk73HCA6+jPmBlvj5ujUIZNUfkD95IQcji3irQ/7vmWKPWbChfVxgQ8ME2a+KKEIhsYzG79WWvFOrtPypp/DqLviGieAY3V7q31wakD6lPDAlZ/EHn2xhspsYgjIseNheC0LsJR4ga0RlDMLuZIsoUq9Aldu42hlyTYGxK39GloWxBDpfn51Nev4xlv7eQQRAXqfjWyBepgTPILA+sdSq6bC42093jcVVjBd4PF/xLxM9nZbM7W4fnMbmx/Voqzj4G9ilWxEh0NVo9Ns483jWFqpEt5dlE16pz/v3VubMlReJ/sdkvRoO67OvgpZW2VP1Q7/yZm/YfgUzEhgxCmJG2EwW3gVXExz+vaia269D0Ek+Kw1O9u1SyXaG8Z2z1ZlBWcsg7CPKG/ESS4j6zwfQuiG86uGbn6xTNGYYvLYaWScElq7I2IEJC3bbn09KN3UJ2a9Cr6mCE2t5rIgK2uBj1nrKaDTdZ3uzZh30Iw6g1dE3WhF2bBRV/UF9TrvTeA03CLzZApVYY7J+KY5nArJnnrUkILEJEXzhCNoFUCrBNMDIsmL2XtNnKwHZK04/PHFNHV/QED484jOHpq1DN2Y/inRReXp8G1P2OGKOrVcZXG/+Aqe7SIn5NWZpfJeqwWAmDG1sVAmfDXy/ZO0d4jpRYaKBQSBpNhzEUEHligGKxzpo2V9a/7NOZOB3odZYgOYuHghx98G2KoFxxl8WW79Up4nIL0UJRc0hLNfIHGTbljbtM+IAHjMVkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(31696002)(316002)(53546011)(36860700001)(16576012)(8936002)(2616005)(186003)(82310400005)(8676002)(966005)(84970400001)(70586007)(70206006)(4326008)(5660300002)(54906003)(40480700001)(44832011)(81166007)(83380400001)(26005)(40460700003)(110136005)(36756003)(356005)(426003)(82740400003)(478600001)(31686004)(336012)(86362001)(2906002)(30864003)(47076005)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:53:14.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11daa66-ec0d-4468-35b8-08dac9425486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690

Hi Bertrand,

Just, some minor comments.

On 17/11/2022 10:39, Bertrand Marquis wrote:
> 
> 
> Add containers suitable to run yocto kirkstone build based on ubuntu
> 22.04. It contains all packages required by Yocto and a checkout of the
> layers required to build Xen with Yocto.
> 
> Add a generic docker image template to be used to automatically generate
> docker files for different configurations:
> - specific yocto version
> - different targets (qemu arm, arm64 and x86)
> - different host platforms (x86 or arm64)
> 
> During a call to 'make all', only the images for the current host
> platform will be generated.
This looks like a stale comment. The reason being, in the new version, by default
we build the images for the architectures expected by the CI and its runners
to match the current workflow.

> If needed, images for an other host platform can be generated manually
> by calling the right make target (see make help).
> 
> Add a build script to build and run xen on qemu using Yocto.
> The script supports arm32, arm64 and x86_64 and checks that dom0 is
> properly booting. At this stage this does not run any guest on top of
> dom0. The script is to be executed in one of the docker images to build
> and run a system using a Xen source tree.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - Rework the system to have one dockerfile template from which make will
> generate the required dockerfiles for the wanted configuration
That is great.

> - add support for different host architectures
> - Merge the generation system into one single dockerfile
> - Merge patches 1 and 2 in a single patch
> - Introduce CONTAINERS_EXTRA to have extra containers not built by
> default (for those not used by CI but useful to users)
> Changes in v3:
> - limit number of jobs in yocto by default to 8 and add --num-jobs
> option to the script to set a custom number of jobs
> - do not copy anymore the build-yocto.sh script inside the main image so
> that the current one in the repository is used when running
> Changes in v2:
> - add a --dump-log command line option to build-yocto.sh script to dump
> the logs if an error occurs.
> Changes in v1:
> - add --image command line argument to build-yocto.sh to allow building
> something different than xen-image-minimal.
> - modify dockerfile to have one layer per line and make it easier to add
> other. I kept the for loop to keep the number of docker steps lower
> - update commit message to warn that no guest are tested.
> - fix build-yocto script to properly return with an error if expect
> script ends up in timeout or EOF.
> ---
>  automation/build/Makefile                  |  14 +-
>  automation/build/yocto/build-yocto.sh      | 349 +++++++++++++++++++++
>  automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>  automation/build/yocto/yocto.inc           |  41 +++
>  4 files changed, 516 insertions(+), 2 deletions(-)
>  create mode 100755 automation/build/yocto/build-yocto.sh
>  create mode 100644 automation/build/yocto/yocto.dockerfile.in
>  create mode 100644 automation/build/yocto/yocto.inc
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index a4b2b85178cf..72a5335baec1 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -1,13 +1,18 @@
> 
>  # the base of where these containers will appear
>  REGISTRY := registry.gitlab.com/xen-project/xen
> -CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
> +CONTAINERS = $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*.dockerfile)))
> +CONTAINERS_EXTRA =
>  DOCKER_CMD ?= docker
> 
> +include yocto/yocto.inc
> +
>  help:
>         @echo "Builds containers for building Xen based on different distros"
>         @echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>         @$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
> +       @echo "Extra containers (not built using make all):"
> +       @$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>         @echo "To push container builds, set the env var PUSH"
> 
>  %: %.dockerfile ## Builds containers
> @@ -16,5 +21,10 @@ help:
>                 $(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>         fi
> 
> -.PHONY: all
> +.PHONY: all clean
>  all: $(CONTAINERS)
> +
> +# Remove generated dockerfiles for yocto
> +clean:
> +       rm -f yocto/*.dockerfiles
Are these files needed after make is completed?
If not, maybe to avoid having some untracked files in the tree, they could be removed after make is done?

> +
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> new file mode 100755
> index 000000000000..d0c93dfaffe0
> --- /dev/null
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -0,0 +1,349 @@
> +#!/bin/bash
> +#
> +# Yocto meta virtualization build and run script
> +#
> +# This script is building Yocto xen-image-minimal for qemu targets and run
> +# them using runqemu inside yocto to check that dom0 is booting properly
Missing dot at the end of a sentence.

> +# The build is using a local xen source tree so that specific patches can be
> +# tested.
> +# In order to optimize the build time, a build cache is used so that only xen
> +# packages and its dependencies are rebuilt (qemu and final image mainly).
> +#
> +
> +# Directories
> +YOCTODIR="$HOME/yocto-layers"
> +CACHEDIR="$HOME/yocto-cache"
> +LOGDIR="$HOME/logs"
> +XENDIR="$HOME/xen"
> +BUILDDIR="$HOME/build"
> +
> +# what yocto bsp we support
> +TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
> +VERBOSE="n"
> +TARGETLIST=""
> +BUILDJOBS="8"
> +
> +# actions to do
> +do_clean="n"
> +do_build="y"
> +do_run="y"
> +do_localsrc="n"
> +do_dump="n"
> +build_result=0
> +
> +# layers to include in the project
> +build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
> +                 meta-openembedded/meta-oe meta-openembedded/meta-python \
> +                 meta-openembedded/meta-filesystems \
> +                 meta-openembedded/meta-networking meta-virtualization"
> +
> +# yocto image to build
> +build_image="xen-image-minimal"
> +
> +function print_progress() {
> +    echo -n "$(date +%T) $*"
> +}
> +
> +function run_task() {
> +    local task_name="$1"
> +    local task_target="$2"
> +
> +    task_log="${task_name//project_}-${task_target}"
> +
> +    mkdir -p "${LOGDIR}"
> +    print_progress
> +    echo -n "${task_name//project_} ${task_target}: "
> +    if [ "${VERBOSE}" = "n" ]; then
> +        $@ > "${LOGDIR}/${task_log}.log" 2>&1
> +    else
> +        $@ 2>&1 | tee "${LOGDIR}/${task_log}.log"
> +    fi
> +
> +    if [ ${?} -ne 0 ]; then
> +        echo "Error"
> +        build_result=$((build_result+1))
> +        if [ "${do_dump}" = "y" ]; then
> +            echo
> +            echo "############ LOGS-START ############"
> +            cat "${LOGDIR}/${task_log}.log"
> +            echo "############  LOGS-END  ############"
> +            echo
> +        fi
> +        return 1
> +    else
> +        echo "OK"
> +        return 0
> +    fi
> +}
> +
> +function project_create() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    (
> +        # init yocto project
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
> +
> +        # add needed layers
> +        for layer in ${build_layerlist}; do
> +            bitbake-layers add-layer ${YOCTODIR}/${layer} || exit 1
> +        done
> +    ) || return 1
> +
> +    # customize project configuration
> +    cat <<EOF >> "${destdir}/conf/local.conf"
> +# Yocto BSP
> +MACHINE = "${target}"
> +
> +# Use local cache to reuse previous builds results
> +SSTATE_DIR = "${CACHEDIR}/sstate-cache"
> +DL_DIR = "${CACHEDIR}/downloads"
> +
> +# Enable xen and virtualization
> +DISTRO_FEATURES = " virtualization xen ipv4"
> +
> +# Speed up run by not generating ssh host keys
> +IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
> +
> +# Save some disk space
> +INHERIT += "rm_work"
> +
> +# Reduce number of jobs
> +BB_NUMBER_THREADS="${BUILDJOBS}"
> +
> +EOF
> +
> +    if [ "${do_localsrc}" = "y" ]; then
> +        XENVERS=$(grep -e "^XEN_REL" \
> +            "${YOCTODIR}"/meta-virtualization/recipes-extended/xen/xen_*.bb \
> +            2> /dev/null | tr -d ' ' | tr -d '?' | tr -d '"' \
> +            | sed -e "s/.*=//" | sort -V | tail -n 1)
> +
> +        XENBASE=$(dirname "$(realpath -m "${XENDIR}")")
> +        XENSUB=$(basename "$(realpath -m "${XENDIR}")")
> +
> +        cat <<EOF >> "${destdir}/conf/local.conf"
> +# Use local sources for xen and xen-tools
> +FILESEXTRAPATHS:prepend:pn-xen := "${XENBASE}:"
> +FILESEXTRAPATHS:prepend:pn-xen-tools := "${XENBASE}:"
> +
> +SRC_URI:pn-xen = "file://${XENSUB}/;subdir=local-xen/"
> +SRC_URI:pn-xen-tools = "file://${XENSUB}/;subdir=local-xen/"
> +
> +PREFERRED_VERSION:pn-xen = "${XENVERS}%"
> +PREFERRED_VERSION:pn-xen-tools = "${XENVERS}%"
> +
> +S:pn-xen = "\${WORKDIR}/local-xen/${XENSUB}"
> +S:pn-xen-tools = "\${WORKDIR}/local-xen/${XENSUB}"
> +
> +SRCREV:pn-xen = "\${AUTOREV}"
> +SRCREV:pn-xen-tools = "\${AUTOREV}"
> +
> +SRCPV:pn-xen = "1"
> +SRCPV:pn-xen-tools = "1"
> +
> +# Disable all QA errors as the recipe is not up to date with changes in Xen
> +# when we use local sources
> +ERROR_QA:pn-xen = "arch"
> +ERROR_QA:pn-xen-tools = "arch"
> +
> +EOF
> +    fi
> +}
> +
> +function project_build() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    (
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
> +
> +        bitbake "${build_image}" || exit 1
> +    ) || return 1
> +}
> +
> +function project_clean() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    rm -rf "${destdir}"
> +}
> +
> +function project_run() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +    (
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}" > /dev/null 2>&1
> +
> +        /usr/bin/expect <<EOF
> +set timeout 100
> +spawn bash -c "runqemu serialstdio nographic slirp"
> +
> +expect_after {
> +    -re "(.*)\r" {
> +        exp_continue
> +    }
> +    timeout {send_user "ERROR-Timeout!\n"; exit 1}
> +    eof {send_user "ERROR-EOF!\n"; exit 1}
> +}
> +
> +# wait initial login
> +expect -re ".* login: "
> +send "root\r"
> +expect -re "root@.*# "
> +
> +EOF
> +    exit $?
> +    ) || return 1
> +}
> +
> +function help() {
> +    cat <<EOF
> +Usage: ${0} [TARGET1] [TARGET2]
> +
> +This script is build the yocto xen-image-minimal for different qemu targets
> +and is running it after.
> +Without any target specified, all supported targets are done.
> +
> +Options:
> +  -h, --help       Print this help
> +  -v, --verbose    Verbose build
> +  --list-target    List supported targets
> +  --clean          Clean existing project before starting
> +  --no-build       Do not build (to run an already built project)
> +  --no-run         Do not run
> +  --num-jobs=NUM   Define the number of parallel jobs in Yocto.
> +                   Default: ${BUILDJOBS}
> +  --dump-log       On error, dump the logs on the console
> +  --image=IMG      Yocto image or package to build
> +                   Default: xen-image-minimal
> +  --xen-dir=DIR    path to xen hypervisor source tree
> +                   if not provide, normal yocto version of xen is built
> +                   Default: ${XENDIR}
> +  --out-dir=DIR    directory where to create the projectss
> +                   Default: ${BUILDDIR}
> +  --log-dir=DIR    directory to store logs
> +                   Default: ${LOGDIR}
> +  --cache-dir=DIR  directory where to take and store build cache
> +                   Default: ${CACHEDIR}
> +  --layer-dir=DIR  directory containing the checkout of yocto layers
> +                   Default: ${YOCTODIR}
> +EOF
> +}
> +
> +for OPTION in "$@"
> +do
> +    case ${OPTION} in
> +        -h|--help)
> +            help
> +            exit 0
> +            ;;
> +        -v|--verbose)
> +            VERBOSE="y"
> +            ;;
> +        --list-targets)
> +            echo "${TARGET_SUPPORTED}"
> +            exit 0
> +            ;;
> +        --clean)
> +            do_clean="y"
> +            ;;
> +        --no-build)
> +            do_build="n"
> +            ;;
> +        --no-run)
> +            do_run="n"
> +            ;;
> +        --dump-log)
> +            do_dump="y"
> +            ;;
> +        --num-jobs=*)
> +            BUILDJOBS="${OPTION#*=}"
> +            ;;
> +        --image=*)
> +            build_image="${OPTION#*=}"
> +            ;;
> +        --xen-dir=*)
> +            XENDIR="${OPTION#*=}"
> +            if [ ! -e "${XENDIR}/xen/Makefile" ]; then
> +                echo "No Xen source tree in ${XENDIR}"
> +                exit 1
> +            fi
> +            do_localsrc="y"
> +            ;;
> +        --out-dir=*)
> +            BUILDDIR="${OPTION#*=}"
> +            ;;
> +        --log-dir=*)
> +            LOGDIR="${OPTION#*=}"
> +            ;;
> +        --cache-dir=*)
> +            CACHEDIR="${OPTION#*=}"
> +            ;;
> +        --layer-dir=*)
> +            YOCTODIR="${OPTION#*=}"
> +            ;;
> +        --*)
> +            echo "Invalid option ${OPTION}"
> +            help
> +            exit 1
> +            ;;
> +        *)
> +            if echo "${TARGET_SUPPORTED}" | grep -q -w "${OPTION}"; then
> +                TARGETLIST="${TARGETLIST} ${OPTION}"
> +            else
> +                echo "Unsupported target ${OPTION}"
> +                exit 1
> +            fi
> +            ;;
> +    esac
> +done
> +
> +# if no target is specified build all targets
> +if [ -z "${TARGETLIST}" ]; then
> +    TARGETLIST="${TARGET_SUPPORTED}"
> +fi
> +
> +mkdir -p "${CACHEDIR}"
> +mkdir -p "${LOGDIR}"
> +mkdir -p "${BUILDDIR}"
> +
> +# Make sure we have an absolute path
> +YOCTODIR=$(realpath -m "${YOCTODIR}")
> +CACHEDIR=$(realpath -m "${CACHEDIR}")
> +BUILDDIR=$(realpath -m "${BUILDDIR}")
> +LOGDIR=$(realpath -m "${LOGDIR}")
> +if [ "${do_localsrc}" = "y" ]; then
> +    XENDIR=$(realpath -m "${XENDIR}")
> +fi
> +
> +# Check that we have all the layers we need
> +for f in ${build_layerlist}; do
> +    if [ ! -f "${YOCTODIR}/${f}/conf/layer.conf" ]; then
> +        echo "Layer ${f} missing in ${YOCTODIR}"
> +        exit 1
> +    fi
> +done
> +
> +for f in ${TARGETLIST}; do
> +    if [ "${do_clean}" = "y" ]; then
> +        run_task project_clean ${f}
> +    fi
> +    if [ ! -f ${BUILDDIR}/${f}/conf/local.conf ]; then
> +        run_task project_create ${f}
> +    fi
> +    if [ -f ${BUILDDIR}/${f}/conf/local.conf ]; then
> +        if [ "${do_build}" = "y" ]; then
> +            run_task project_build ${f}
> +        fi
> +        if [ "${do_run}" = "y" ]; then
> +            run_task project_run ${f}
> +        fi
> +
> +    fi
> +done
> +
> +print_progress "Build Complete (${build_result} errors)"
> +echo
> +exit ${build_result}
> +
> diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
> new file mode 100644
> index 000000000000..5350bb2b87b7
> --- /dev/null
> +++ b/automation/build/yocto/yocto.dockerfile.in
> @@ -0,0 +1,114 @@
> +# Docker file to create an environment to build yocto with virtualization
> +#
> +# Arguments that can be passed during image creation using --build-arg:
> +# "host_uid=$(id -u)": to use current user uid for build user in the image
> +# "host_gid=$(id -g)": to use current user gid for build user in the image
> +# "ubuntu_version=VERS": to select the ubuntu version number
Is is the case, that this dockerfile and the packages installed will work on any
version of ubuntu we will pass here? If not, maybe we should just stick to 22.04 and
not give the user the opportunity to change this.

> +
> +# Use standard ubuntu minimal
> +ARG ubuntu_version=22.04
> +From ##DOCKERPLAT##ubuntu:$ubuntu_version AS base
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +# Install minimal ubuntu requirements for yocto and other tools we need
> +# See https://docs.yoctoproject.org/4.0.1/brief-yoctoprojectqs/index.html#build-host-packages
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        gawk \
> +        wget \
> +        git \
> +        diffstat \
> +        unzip \
> +        texinfo \
> +        gcc \
> +        build-essential \
> +        chrpath \
> +        socat \
> +        cpio \
> +        python3 \
> +        python3-pip \
> +        python3-pexpect \
> +        xz-utils \
> +        debianutils \
> +        iputils-ping \
> +        python3-git \
> +        python3-jinja2 \
> +        libegl1-mesa \
> +        libsdl1.2-dev \
> +        python3-subunit \
> +        mesa-common-dev \
> +        zstd \
> +        liblz4-tool \
> +        file \
> +        vim \
> +        bison \
> +        expect \
> +        locales \
> +        liblz4-tool \
> +        zstd \
> +        openssl \
> +        libssl3 \
> +        ca-certificates \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Use bash as shell
> +RUN rm /bin/sh && ln -s bash /bin/sh
> +
> +# Fix local for yocto
> +RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
> +    LANG=en_US.UTF-8
> +ENV LANG en_US.UTF-8
> +ENV LC_ALL en_US.UTF-8
> +
> +# Create a user for the build (we don't want to build as root)
> +ENV USER_NAME docker-build
> +ARG host_uid=1000
> +ARG host_gid=1000
> +RUN groupadd -g $host_gid $USER_NAME && \
> +    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME
> +
> +# Switch to our user instead of root and start in its home
> +USER $USER_NAME
> +WORKDIR /home/$USER_NAME
> +
> +# Create needed directories
> +RUN mkdir -p /home/$USER_NAME/yocto-layers \
> +             /home/$USER_NAME/yocto-cache \
> +             /home/$USER_NAME/logs \
> +             /home/$USER_NAME/bin \
> +             /home/$USER_NAME/xen && \
> +    chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
> +
> +# clone yocto repositories we need
> +RUN for rep in \
> +                https://github.com/openembedded/meta-openembedded \
> +                https://git.yoctoproject.org/poky \
> +                https://git.yoctoproject.org/meta-virtualization \
> +            ; do \
> +        git -C /home/$USER_NAME/yocto-layers \
> +            clone -b ##YOCTOVERSION## --single-branch $rep; \
> +    done
> +
> +# The builder stage is building an initial cache state that we include in the
> +# final image
> +From base AS builder
> +
> +# This step can take one to several hours depending on your download bandwith
> +# and the speed of your computer
> +COPY ./build-yocto.sh /
> +RUN /build-yocto.sh --dump-log ##YOCTOTARGET##
> +
> +From base
> +
> +# Only copy the cache status
> +COPY --from=builder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yocto-cache/.
> +
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
> new file mode 100644
> index 000000000000..04076bc8d174
> --- /dev/null
> +++ b/automation/build/yocto/yocto.inc
> @@ -0,0 +1,41 @@
> +# This makefile generates the docker files for Yocto builds
> +# The containers for the current architecture are the one built using make all
> +# To build containers for a different architecture, you need to call make for
> +# the image you want explicitely
Could you please add a dot at the end of each sentence above. This will improve readability.

> +# The containers are named this way:
> +# YOCTOVERSION-TARGET for x86_64 hosts
> +# YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
> +
> +# Yocto versions we are currently using
> +YOCTO_VERSION = kirkstone
> +
> +# Yocto BSPs we want to build for
> +YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
> +
> +# Supported Host platforms (host architecture specific ones)
To avoid mismatch \wrt platform vs architecture I would stick to the latter one.
In the docker world, arm64v8 is an architecture whereas linux/arm64/v8 is a platform.

> +YOCTO_HOSTS = amd64 arm64v8
> +
> +# Architecture we want to use in gitlab CI (depends on runners arch)
> +CI_ARCH = arm64v8
> +
> +define GEN_DOCKER
> +# Make all is generating what we want in the CI
> +ifeq ($(CI_ARCH),$(3))
> +CONTAINERS += yocto/$(1)-$(2)$(4)
> +else
> +CONTAINERS_EXTRA += yocto/$(1)-$(2)$(4)
> +endif
> +
> +yocto/$(1)-$(2)$(4).dockerfile: yocto/yocto.dockerfile.in
> +       echo > $$@
> +       cat $$< | \
> +           sed -e "s,##YOCTOVERSION##,$(1),g" | \
> +           sed -e "s,##YOCTOTARGET##,$(2),g" | \
> +           sed -e "s,##DOCKERPLAT##,$(3)/,g" > $$@
> +
> +endef
> +
> +$(eval $(foreach vers,$(YOCTO_VERSION),\
> +    $(foreach tar,$(YOCTO_TARGETS),\
> +    $(foreach hst,$(YOCTO_HOSTS),\
> +    $(call GEN_DOCKER,$(vers),$(tar),$(hst),$(if $(filter amd64,$(hst)),,-$(hst)))))))
This could be aligned under first foreach. Also I think there is no need to try to shorten the version,target,host.

> --
> 2.25.1
> 

~Michal

