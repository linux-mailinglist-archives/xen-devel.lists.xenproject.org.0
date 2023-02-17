Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91B69AF06
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 16:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497180.768073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT2Kh-0005mg-Ny; Fri, 17 Feb 2023 15:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497180.768073; Fri, 17 Feb 2023 15:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT2Kh-0005kx-L1; Fri, 17 Feb 2023 15:07:31 +0000
Received: by outflank-mailman (input) for mailman id 497180;
 Fri, 17 Feb 2023 15:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWIA=6N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pT2Kg-0005kr-SH
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 15:07:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eab::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cacb8624-aed4-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 16:07:29 +0100 (CET)
Received: from BN9PR03CA0641.namprd03.prod.outlook.com (2603:10b6:408:13b::16)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 15:07:25 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::39) by BN9PR03CA0641.outlook.office365.com
 (2603:10b6:408:13b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Fri, 17 Feb 2023 15:07:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.17 via Frontend Transport; Fri, 17 Feb 2023 15:07:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 09:07:24 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Feb 2023 09:07:23 -0600
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
X-Inumbo-ID: cacb8624-aed4-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik7CmFyl2bnfcyqb1wcNi2DNYyiryl87ZdcbMfzjCqlsujK7XCWOMRvAzSyu8o2ZBJLqLFFFzORHnYKE4LB+sg/uEKGAYer1Gx1Qfl4Ep0bsyBDQla8iIahd2avWCdO+r3ruAosRtuyGt+1d10S/Vezf8FhDAqqo5mu8E54VAq3tWReH7wC/tq/QLKkezKjbb891RpiUkXMVbC+qdAb3jfWsv7wChwYJhwDKtRTX60m6OxYlJIKdDpgoxIVVSnMsVD9KQXfcyhu2v0MyY05DNzeza92t2CiiLN4kt3sL+MsoBIJL9j7B7HeNeTzA5Wz+9h2juH/FK0VwMn6d+iqssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRyO2MHh+DbXteudkWsMRH33LpmXKYv4cQpLQ9NGpTc=;
 b=oTLfuue1xquO5/m82RbEAKcv4knX2EyDv8o3oCOf5WaRyp1qcS/yro5Mb1p+5Ai3ZRcee2CX/24QHuj+a5P22qGiCEvRED8wQt9q9A2cMp5N5qwcgGdweluOjkq/HV9dc4s/xCebCrKq0GvXOmorQ9HRtlNdRfA7fIOTIq5vfVNduRnPm8OcECLBhD/hHTQcHnEF4VbdAYD2W0f2m1ksYudnLX5YrHxh9mJRCw5iYr4iR0VQxT3u7kqf/XUWulEM+XF5/u2QXniPprRfJEN/GRy+nvqxr9fMVpLcFj1lQJRrjUcA7D1T4KAOOaA+RNj5OVLa6bB6rFpRFVHMjAbpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRyO2MHh+DbXteudkWsMRH33LpmXKYv4cQpLQ9NGpTc=;
 b=pPCqcjoVyP2+Dpb0knxnedkiXpjyOQv1r3l2heoURQrXldo6hnbPKpqWOJv0C+aSW2MUbcBQROe6EJvafM7DUmrCW2msE+NexifH+8HWzBvi4j3OiSaSIsm0HUYcmAIKTvQI85J+Dyn5tCtpgZ9UPUM10phC7vJWJREsigWeS4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3628a55d-908d-e943-4808-b40f7330ae67@amd.com>
Date: Fri, 17 Feb 2023 16:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 3/3] automation: expand arm32 dom0 test adding xl
 domain creation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
 <20230215220925.2313528-3-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230215220925.2313528-3-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caa8607-a0d7-4cc7-31ea-08db10f8ad5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jWiNP2qqDnIOQbtCswI05mhMYYBcqVmuXzW3BlsRkEnjmOs6V40gKFYGZ1gMRqzCgPgLCt3sihVUW6WnsCd7eR8jcLsh9zfpCiSP5mZQo9jsX2Xr93vRha1L8KrOXiPGJZLV2eZSXP5kh1c6AF9qYRuGZBleH/cIbp+93lpAqgsCmPKgRx8U3loE0c6tuAveTad67QvAvYW/tjb8P6a2I3x7rimhw32WzUbuu4EdC5Z2hKCiv3vrUcvCtnQeme4vqNhZoOYG42suJk00n88/e0auGBJyOR29LjMz+jM2v5WpyhbOaf0HuK5m+J/q3Wckh7i9n94yMGfEUaIuuaZgYEuwL8TG3v/j7W1jKTd9vbT39e9SDgzvjbs4J0ic0KxR8yIWM/8Y9+UUlU8/ezNPBc8n1rZGjA05fcUH+4FdokeguCKSQLa5Vbtm4dX4nyLnfXaOCJo1j7EthpSDRUHyAp285IbYpX53WMELR8Oh6PsJySf0hP414WZRsKchfN/VnCFNdvMJDhWgHSH+cujHjqthKDxWsiRRRaXNcLJEFyKK/LBe/wqUTuIP/EEGMOkV+8KGDFLlEL2uf2gY+0Y+0CuzhyWQXw9jo1QNgUk8btQB2JQLoo7i3BhUNQVM6XlzlN5OhxH7r5nRjL1KIAU8sjoCmk+izH1oEfJ+NTt8czFXeLINrIMSsXnCRBPXmGCnByTFcTYVcIOZ8bkaA+ElTRe7svtegKDzCmAWM0FA9ygFwc1pKvLNuwiy+FL+Uz0AjHAbTvJjZID9zf/hWADYJTFBup9AB++8d4PmdLx7gBsX0+T9cODk8+zsX4pH+EnuLTBsjHCdsNfoHl1MtXKNZJSRPxt+oceXb10tUhXc8U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(82740400003)(81166007)(36860700001)(82310400005)(31696002)(86362001)(356005)(36756003)(8936002)(5660300002)(44832011)(2906002)(40480700001)(53546011)(186003)(40460700003)(2616005)(426003)(336012)(47076005)(316002)(16576012)(70586007)(26005)(70206006)(8676002)(110136005)(4326008)(966005)(54906003)(41300700001)(478600001)(31686004)(1910800001)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:07:24.9219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caa8607-a0d7-4cc7-31ea-08db10f8ad5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458

Hi Stefano,

On 15/02/2023 23:09, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As part of the arm32 dom0 test, also create a simple domU using xl. To
> do that, we need the toolstack installed in the dom0 rootfs. We switch
> to using the kernel and rootfs built by the Yocto arm32 job.
FWICS, you also use xen produced by the yocto build. This is why...

> 
> Remove the PCI node from the host device tree: it is unused but causes a
> Linux hang at boot.
> 
> Use xen-watchdog to trigger the domU creation for convience
> (/etc/local.d is not handled by rootfs.)
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - add yocto-qemuarm also to qemu-smoke-dom0-arm32-gcc-debug
> ---
>  automation/gitlab-ci/test.yaml              |  2 +
>  automation/scripts/qemu-smoke-dom0-arm32.sh | 50 ++++++++++++++++-----
>  2 files changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 9570085a60..77bb1c362d 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -172,6 +172,7 @@ qemu-smoke-dom0-arm32-gcc:
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32
> +    - yocto-qemuarm
> 
>  qemu-smoke-dom0-arm32-gcc-debug:
>    extends: .qemu-arm32
> @@ -180,6 +181,7 @@ qemu-smoke-dom0-arm32-gcc-debug:
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
> +    - yocto-qemuarm
... I think there is no need for debian-unstable-gcc-arm32 which was here to provide just a xen binary.
Also, with your change, it does not make sense to keep debug and non-debug versions of this job
as it does not apply to Yocto builds.

> 
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index 98e4d481f6..7a748bdf23 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -3,14 +3,37 @@
>  set -ex
> 
>  cd binaries
> -# Use the kernel from Debian
> -curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> -# Use a tiny initrd based on busybox from Alpine Linux
> -curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
> 
> +mkdir rootfs
> +cd rootfs
> +tar xvf ../xen-image-minimal-qemuarm.tar.bz2
> +mkdir -p ./root
> +echo "name=\"test\"
> +memory=400
> +vcpus=1
> +kernel=\"/root/zImage\"
> +ramdisk=\"/root/initrd.cpio.gz\"
> +extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
> +" > root/test.cfg
> +echo "#!/bin/bash
> +
> +xl list
> +
> +xl create -c /root/test.cfg
> +
> +" > ./root/xen.start
> +echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
> +
> +curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
>  mkdir rootfs
>  cd rootfs
>  tar xvzf ../initrd.tar.gz
> +find . | cpio -H newc -o | gzip > ../root/initrd.cpio.gz
> +cd ..
> +rm -rf rootfs
> +rm initrd.tar.gz
> +
> +cp ../zImage ./root
>  find . | cpio -H newc -o | gzip > ../initrd.gz
>  cd ..
> 
> @@ -20,22 +43,25 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>     -machine virt \
>     -machine virtualization=true \
>     -smp 4 \
> -   -m 1024 \
> +   -m 2048 \
>     -serial stdio \
>     -monitor none \
>     -display none \
>     -machine dumpdtb=virt.dtb
> 
> +# XXX disable pci to avoid Linux hang
> +fdtput virt.dtb -p -t s /pcie@10000000 status disabled
> +
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> -MEMORY_END="0x80000000"
> +MEMORY_END="0xC0000000"
> 
>  DEVICE_TREE="virt.dtb"
> -XEN="xen"
> -DOM0_KERNEL="vmlinuz"
> +XEN="xen-qemuarm"
> +DOM0_KERNEL="zImage"
>  DOM0_RAMDISK="initrd.gz"
> -DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
> -XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
> +DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/sbin/init"
> +XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0"
> 
With the introduction of dom0, I think it makes sense to grep for both dom0 prompt and domU prompt
just like we do for arm64.

~Michal


