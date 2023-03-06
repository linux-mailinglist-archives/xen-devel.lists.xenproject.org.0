Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712486AB99B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506821.780008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ725-0000Vc-58; Mon, 06 Mar 2023 09:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506821.780008; Mon, 06 Mar 2023 09:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ725-0000SF-1t; Mon, 06 Mar 2023 09:21:25 +0000
Received: by outflank-mailman (input) for mailman id 506821;
 Mon, 06 Mar 2023 09:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xdHg=66=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pZ723-0000S8-Ie
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:21:23 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40dd0198-bc00-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 10:21:20 +0100 (CET)
Received: from MW4PR03CA0215.namprd03.prod.outlook.com (2603:10b6:303:b9::10)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Mon, 6 Mar
 2023 09:21:17 +0000
Received: from CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::db) by MW4PR03CA0215.outlook.office365.com
 (2603:10b6:303:b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 09:21:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT101.mail.protection.outlook.com (10.13.175.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 09:21:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 03:21:15 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Mar 2023 03:21:14 -0600
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
X-Inumbo-ID: 40dd0198-bc00-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfU6scOlEUh11UFkWYR/z3smjYPsSvds8dTfQBwu6CgHhycLJt+kT4hlmi4OytxHOa1D0tVLNj5mWkCFJRpz2nfhgDOFVZRGstjCnvxohEWZCbr6GnrRX0E0Dx+y4cvFC345PaDs63MPj7ZkBOQISn/9+J9hkSbFEyJRpVzmkW0wUxsgonFUkE1Y7EJpmisUD+DMN8yBEiZbNQ/YgkqScTo6K40yZ0xamY75n/7jGsWWFM/R4rcfhGjqCE2Ty+cuHw2es+Ar1qsshzy05Eraz/yiLHQhH0At6Cf0hyWZ+DPx84v4Jq7cqSmnG6yK8L0IGkZhU/KhKTu5/ZjeLBCzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdA6tYqrbQehbY/cvhRFBCueCEkEptMAaW2S8APz5HQ=;
 b=RUgxCOUSBdvElYa1IRA/ZPJAbKV9HVZMBTs/HjBluEgad4jJtHImIjvNdMFUC5fFs3t3tr+o3SmNq9kq3sUttqd1V5EwfuPu/5EeuPePCuEpS0ju3wRQRN7MwWUev5FLWefw8cluCUSX3+rPBCzr2d1VCfTXQ53RrkXRfFyV8x5pOlSkfzhUIDQ6cd7Q1FchrDRdOz8Cz34FXE+xFQYa5i+WXU9fe3+5Jujn4Qf5YPpDyrkdFISoCY+y1l3qUk2cGCIy9DZmA1m4rN4Z2A5xK8e5c7ble5rhDaZaEqvH1L9Osb/Q4DJOMMo4cFK60gI7/G2tVXK1fYLr2mkQjPEI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdA6tYqrbQehbY/cvhRFBCueCEkEptMAaW2S8APz5HQ=;
 b=cu5PdZvCuTyj+Iwu0pmA6gZ9IpkDUpg/aHJ6md5FhRJPfpA87RenVqk7zI3ERl8DWwOHJVGAuFMCHddEr+NY0GJJBQxswlf9A40uroiPfacKggRZzdzFKk6MI4WBiy3Dxi679nMHxFqXrPBrfEwIDDxRxj3m6LbuQDqJt+xUSRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d0d816bf-a71e-5528-b4f4-626d82cdabac@amd.com>
Date: Mon, 6 Mar 2023 10:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
 <20230303235719.1181690-2-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230303235719.1181690-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT101:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3e9576-f3e9-4eba-8e60-08db1e2423cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bAMCRaTJ7gLHGA3a8dswGgApOFJtg23poOtHYwwL/evaajPVGD/xK4B/INIS5F7T39o6kLXgC5ME/Y31Y1xDeGwQnzOXzPkkZWB2mgKYcbb22/4iNLLnVqPV7/Wmv5a8B+wneJiTHovo/HEMMDgTpTDWGPt+axgwFk+eJApA8HMWrp8cg49xd5TQ3BbJbElK2Qjroczi5EWzDKeIkJJahw3pG36nO1cvwPWnazyu+1VQdbuz4JV6nXW2Qqqq/eCey+Q95dN/xTfg2K+liAG16tsnMQ1Xeb8urMbxPxCZMF2syU0bThVPDRU/+bZOrKANlOgePqYU/trJOZNe0UCCot90WGy/uXlP33HVFlAxiRl/jRlrUH1V0eERs6cZb3b5JMVp0JqL7wo70OVpedCXUKqEJZDR2OoxzsbwoMikE+7WURrBfOJQH89y6aslhkeVqOgKcijZwiTwdwTAFf+EIt0hEEB0kMi5jVhPabRdCIzsU3OoAr/2zIm5nCQmF+Kgz060oLv7YmeB5o/E+bj2PlvlyVQ62ttyxrBSOwL/sBBBy5gT97OstNnn8jYJ6Fovj0jYpI5gJDiO1MPUgxQVvKrIY61yq5DP4S6HhMX6vEDbw3088d5qFl0nE/baTFS0QBWtpRfmIHbRBRQPaZYS1eAAG80hP0N36HJ79d7zI3oMcc9BWEHsofAkv77e1WAgmXnYProbjsz5tWYvF6XQ68g7XnnT989Mqpdo16x+cr+jRCANRCQfCoiTQI+x9nSqJgT4JFey8LC8QshuBtaj0Fyl1cEndth1QFr9bSf7YUetzt4ik01obpVFZGPkqwiZa8rVOVGWVBmh50T0hBYHJfxEg0fM6B1vjWNry2Oen4c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(66899018)(84970400001)(2616005)(966005)(36860700001)(81166007)(82740400003)(36756003)(47076005)(31696002)(316002)(478600001)(16576012)(86362001)(356005)(54906003)(110136005)(82310400005)(31686004)(83380400001)(41300700001)(426003)(186003)(40460700003)(53546011)(26005)(336012)(2906002)(5660300002)(70586007)(8936002)(44832011)(8676002)(4326008)(70206006)(40480700001)(32563001)(36900700001)(43740500002)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 09:21:16.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e9576-f3e9-4eba-8e60-08db1e2423cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290

Hi Stefano,

On 04/03/2023 00:57, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The test prepares dom0 and domU binaries and boot artifacts, similarly
> to the existing QEMU test. (TBD: share preparation steps with the
> regular QEMU tests.)
> 
> However, instead of running the test inside QEMU as usual, it copies
> the binaries to the tftp server root, triggers a Xilinx ZCU102 board
> reboot, and connects to the real serial of the board.
> 
> For now and due to its novelty, allow_failure on the Xilinx hardware
> test, and only run the job on protected branches with XILINX_JOBS set to
> true (the "master" and "staging" on gitlab.com/xen-project/xen qualify).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - only execute the xilinx job on protected branches with XILINX_JOBS set
> to true
> ---
>  automation/gitlab-ci/test.yaml                |  22 ++++
>  .../scripts/xilinx-smoke-dom0less-arm64.sh    | 115 ++++++++++++++++++
>  2 files changed, 137 insertions(+)
>  create mode 100755 automation/scripts/xilinx-smoke-dom0less-arm64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1c5f400b68..8f94cad32c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -85,6 +85,28 @@ build-each-commit-gcc:
>    tags:
>      - x86_64
> 
> +xilinx-smoke-dom0less-arm64-gcc:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: ubuntu:xenial-xilinx
> +    LOGFILE: qemu-smoke-xilinx.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - xilinx
> +  script:
> +    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-arm64
> +  allow_failure: true
> +  only:
> +    variables:
> +      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> +
Surely we will want to have more tests running on our HW board.
For that, let's introduce a template and a job separately right away:

.xilinx-arm64:
  extends: .test-jobs-common
  variables:
    CONTAINER: ubuntu:xenial-xilinx
    LOGFILE: qemu-smoke-xilinx.log
  artifacts:
    paths:
      - smoke.serial
      - '*.log'
    when: always
  allow_failure: true
  only:
    variables:
      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
  tags:
    - xilinx


xilinx-smoke-dom0less-arm64-gcc:
  extends: .xilinx-arm64
  script:
    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
    - alpine-3.12-gcc-arm64


>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> new file mode 100755
> index 0000000000..180c8b5f1c
> --- /dev/null
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -0,0 +1,115 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +test_variant=$1
> +
> +if [ -z "${test_variant}" ]; then
> +    passed="ping test passed"
> +    domU_check="
> +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
> +    sleep 30
> +done
> +echo \"${passed}\"
> +"
> +fi
> +
> +# DomU
> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +echo "#!/bin/sh
> +
> +${domU_check}
> +/bin/sh" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +cd ..
> +rm -rf rootfs
Why do we create a domU rootfs in a different manner compared to qemu one?
I think this could be done using busybox (it would have to be installed in container)
and it would make it easier to share qemu/xilinx script.

> +
> +# DOM0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../binaries/dist/install/* .
> +
> +echo "#!/bin/bash
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +bash /etc/init.d/xencommons start
> +
> +/usr/local/lib/xen/bin/init-dom0less
> +
> +brctl addbr xenbr0
> +brctl addif xenbr0 eth0
> +ifconfig eth0 up
> +ifconfig xenbr0 up
> +ifconfig xenbr0 192.168.0.1
> +
> +xl network-attach 1 type=vif
> +${dom0_check}
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +cd ..
> +
> +
> +TFTP=/scratch/gitlab-runner/tftp
> +START=`pwd`
> +
> +# ImageBuilder
> +echo 'MEMORY_START="0"
> +MEMORY_END="0xC0000000"
This is incorrect for zcu102. It should be the end address of a first memory bank
which is 0x7ff00000.

> +
> +DEVICE_TREE="mpsoc.dtb"
Can we do something to expose this dtb so that everyone with no access to a runner can see it?
It will become necessary when we start introducing some passthrough test jobs.
Also, how about naming this: mpsoc_smmu.dtb to make it clear that we are running with IOMMU enabled?
In the future we might want to test both configurations, especially for static partitioning use cases.

> +XEN="xen"
> +DOM0_KERNEL="Image"
> +DOM0_RAMDISK="dom0-rootfs.cpio.gz"
> +XEN_CMD="console=dtuart dom0_mem=1024M"
With just "console=dtuart" we are relying on a presence of "stdout-path" under /chosen which is optional.
I would suggest: "console=dtuart dtuart=serial0"

> +
> +NUM_DOMUS=1
> +DOMU_KERNEL[0]="Image"
> +DOMU_RAMDISK[0]="domU-rootfs.cpio.gz"
> +DOMU_MEM[0]="1024"
> +
> +LOAD_CMD="tftpb"
> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"' > $TFTP/config
> +
> +cp -f binaries/xen $TFTP/
> +cp -f binaries/Image $TFTP/
> +cp -f binaries/dom0-rootfs.cpio.gz $TFTP/
> +cp -f binaries/domU-rootfs.cpio.gz $TFTP/
> +
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
> +
> +# restart the board
> +cd /scratch/gitlab-runner
> +bash zcu102.sh 2
> +sleep 5
> +bash zcu102.sh 1
> +sleep 5
> +cd $START
> +
> +# connect to serial
> +set +e
> +stty -F /dev/ttyUSB0 115200
> +timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial"
> +
> +set -e
> +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> +exit 0
> --
> 2.25.1
> 

Great job, this is awesome.

~Michal

