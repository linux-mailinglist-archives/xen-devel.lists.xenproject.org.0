Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224E56BD19
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 17:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363564.594165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qN1-00088L-2G; Fri, 08 Jul 2022 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363564.594165; Fri, 08 Jul 2022 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qN0-00085b-Uu; Fri, 08 Jul 2022 15:58:18 +0000
Received: by outflank-mailman (input) for mailman id 363564;
 Fri, 08 Jul 2022 15:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l84e=XN=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1o9qLY-0007T3-KR
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 15:56:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 911815c1-fed6-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 17:56:46 +0200 (CEST)
Received: from DS7PR03CA0352.namprd03.prod.outlook.com (2603:10b6:8:55::32) by
 BYAPR12MB3287.namprd12.prod.outlook.com (2603:10b6:a03:131::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 15:56:41 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::bf) by DS7PR03CA0352.outlook.office365.com
 (2603:10b6:8:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21 via Frontend
 Transport; Fri, 8 Jul 2022 15:56:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 15:56:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 8 Jul
 2022 10:56:40 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 8 Jul 2022 10:56:40 -0500
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
X-Inumbo-ID: 911815c1-fed6-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpRt3J9Ij2zBL3S/SeMc8LkgGmvl3mhNXHSRZUCRtQ+C4svFqiGwXr9HwO2YzwjweeGpKnn/wbGKO5Bm8nMiOERVo4EuYO9GXSAmivGplU11bMCACfqhqcT1NMywOCNgYFVmNLtsBhReII+sylB65sJ0SysPr1hw19Is8ksDisa3tc/1xI018qsIk4toP7R/HK+yXROesw3kDf6rIbHu5rkAcG3xGSTUh/t5k0zudEymsgBJ0whqprYK1YXSlZ+DZtqhcGnSfsVPL/uxJMwuGzb/OuoGBvMq3+Fd0kS8nSUvFR1KhX2Y9klxirrfMMkV+qTBBFOQm7Kvw1QpiXdq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YJM34CVvXAVx0+lmZ8dGXo6zj0lalqIn4kh4SnWjsY=;
 b=DhIAzsMdmI8wt/u0sVZlnnUzuY7ws9v8HGyc4Yl7I/GYasYwhdNe/7O3UXFmR2411i+dvllMhCuIBPz3S8d+rURNXhPqAbCljxHtwbrxeqiN32PKeamIeyb2hWUq2U4lcnQxudd5y8mkbdzyKT4CN9PMjbnAbPSLty9M4MJdVsf4NGCKhA6WvPAhtlDKpNgt9Ic3gp/IiTkyASn+aAFtQKrdcKhXtkg/h2Upt9Z0Azqx2JF3QH8EFp67csv/CdwveyCmtmOuYzmdoLFAptLwSHhwavTKEUAPXRTLgO1FthNvcQHpKojihngSR+ad1dmdnm5emrPylPKs7dfkD3U0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YJM34CVvXAVx0+lmZ8dGXo6zj0lalqIn4kh4SnWjsY=;
 b=yHx5hJsv0WcQkwWIj2GQpsc1sSSf3Z1TatLXyLKmEu+pZXI5OU+zoMj7s3vNTTwSkciyMt+VbXp9+1ixHONI9xnooquoOdGpTv3paLAGt+zD29nduANkic6KueTDfuSAyFcL4N+P26ZEuNdE5PNk3J5Uan1wAocjsBAOarJjMuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 8 Jul 2022 08:56:39 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
In-Reply-To: <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207080850510.2354836@ubuntu-linux-20-04-desktop>
References: <20220707203803.798317-1-burzalodowa@gmail.com> <20220707203803.798317-3-burzalodowa@gmail.com> <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org> <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
 <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f95cbff-5525-4974-9c4c-08da60fa7335
X-MS-TrafficTypeDiagnostic: BYAPR12MB3287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DCP+FyPDxrABPXSnr4n2p6W4X2tQE/tWaO8su141gB79MUEz7pJbQLM1Kpty?=
 =?us-ascii?Q?Nj8qtjj37KmvWe5Kls7wYaHyr7Ttpzf7GACsCYooF5LQvKjEqFSiSKlc165Y?=
 =?us-ascii?Q?kc+ZmeJt24gVOCg+UssumEVwSyQcaf+ol4w5vKppoo4e5LUel/RB2TP5jzkv?=
 =?us-ascii?Q?P6zftD5RRoQM65snIXaZN/E4nWyImWk/zFdWdTqwf+bqGGa7xkpKXWzk0sQk?=
 =?us-ascii?Q?2c9YGDk55J0dme8nyj+RTS/iNC+a3Zh0qvZC0ZcCwylpHxaY24113nYstmOt?=
 =?us-ascii?Q?Bl4h0qAg9/H5YAWh3CXTr2mnRQ7si/haRg3trJbJ3EkHfUwVcK5NIYSxNB9U?=
 =?us-ascii?Q?IL6Ql58dFHzCGM7GCsuFyotbpKtZAwBxvP2gBZmcu/9zoupZpOVsqyVSgxAk?=
 =?us-ascii?Q?10UOnmiTm4myFoRjqFoNZjuLx3ClRg6xroihw1SwTkgmeNI0vlNdwT4iGpfR?=
 =?us-ascii?Q?p6fO8rqfxp2+A/4wadZZNRf6fkqcvbSFlxvCjEhZJjoGq45ZETlRpKzaD9ri?=
 =?us-ascii?Q?2rcD4Cekp7ZlkbuhXJ9FRldcd1K2Vi0zHNAbpKK3ezGtgEKkEuTBjwxKQfbW?=
 =?us-ascii?Q?A7cmyoHhSsgmFeX+I9WTiiGVXRiTfeQqq7+XWDT9FOiizEnJbNmhEkiGSygx?=
 =?us-ascii?Q?l+ejU/iZYA8IDa9IL2ejeotVgtiuim/YdNfkcygNqo9a5w2CW9IZFX34GV5t?=
 =?us-ascii?Q?bk6IHMHnuNdu2BDbCwRke5H2UPDeqFIkayEFvs8t+wzT4Ero9QJ5ABIXiXry?=
 =?us-ascii?Q?bY8995FwthHd3AWr/Pn3mFIq6G4mtkzH6mPt/EmdsNeT5+ijCfUuVXkOmuNh?=
 =?us-ascii?Q?8Sftp+QtSWesr8L2AikFzPjmrCPHKm5oBqN8RrleNTbqgCiVr6ndMkHwR408?=
 =?us-ascii?Q?V/113ntCW3ECiLyHAng8ld32JPSa6BeX37PZvAXXbMVCfQi5t7x9hY/kEPFU?=
 =?us-ascii?Q?jKZSiaJp4hlAlvqLZLldK4FAZ8Xl8bnum08UXgufT2SxxEF5hr07OkNC4gEX?=
 =?us-ascii?Q?ny11?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(7916004)(346002)(136003)(396003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(40460700003)(82310400005)(426003)(47076005)(966005)(6916009)(316002)(26005)(9686003)(186003)(41300700001)(54906003)(336012)(86362001)(40480700001)(44832011)(356005)(81166007)(36860700001)(33716001)(8676002)(2906002)(83380400001)(34020700004)(53546011)(478600001)(4326008)(70586007)(5660300002)(82740400003)(8936002)(70206006)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:56:41.6236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f95cbff-5525-4974-9c4c-08da60fa7335
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3287

On Fri, 8 Jul 2022, Xenia Ragiadakou wrote:
> On 7/8/22 02:05, Stefano Stabellini wrote:
> > On Thu, 7 Jul 2022, Julien Grall wrote:
> > > Hi Xenia,
> > > 
> > > On 07/07/2022 21:38, Xenia Ragiadakou wrote:
> > > > Add an arm subdirectory under automation/configs for the arm specific
> > > > configs
> > > > and add a config that enables static allocation.
> > > > 
> > > > Modify the build script to search for configs also in this subdirectory
> > > > and
> > > > to
> > > > keep the generated xen binary, suffixed with the config file name, as
> > > > artifact.
> > > > 
> > > > Create a test job that
> > > > - boots xen on qemu with a single direct mapped dom0less guest
> > > > configured
> > > > with
> > > > statically allocated memory
> > > > - verifies that the memory ranges reported in the guest's logs are the
> > > > same
> > > > with the provided static memory regions
> > > > 
> > > > For guest kernel, use the 5.9.9 kernel from the tests-artifacts
> > > > containers.
> > > > Use busybox-static package, to create the guest ramdisk.
> > > > To generate the u-boot script, use ImageBuilder.
> > > > Use the qemu from the tests-artifacts containers.
> > > > 
> > > > Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> > > > ---
> > > >    automation/configs/arm/static_mem          |   3 +
> > > >    automation/gitlab-ci/test.yaml             |  24 +++++
> > > >    automation/scripts/build                   |   4 +
> > > >    automation/scripts/qemu-staticmem-arm64.sh | 114
> > > > +++++++++++++++++++++
> > > >    4 files changed, 145 insertions(+)
> > > >    create mode 100644 automation/configs/arm/static_mem
> > > >    create mode 100755 automation/scripts/qemu-staticmem-arm64.sh
> > > > 
> > > > diff --git a/automation/configs/arm/static_mem
> > > > b/automation/configs/arm/static_mem
> > > > new file mode 100644
> > > > index 0000000000..84675ddf4e
> > > > --- /dev/null
> > > > +++ b/automation/configs/arm/static_mem
> > > > @@ -0,0 +1,3 @@
> > > > +CONFIG_EXPERT=y
> > > > +CONFIG_UNSUPPORTED=y
> > > > +CONFIG_STATIC_MEMORY=y
> > > > \ No newline at end of file
> > > 
> > > Any particular reason to build a new Xen rather enable
> > > CONFIG_STATIC_MEMORY in
> > > the existing build?
> > > 
> > > > diff --git a/automation/scripts/build b/automation/scripts/build
> > > > index 21b3bc57c8..9c6196d9bd 100755
> > > > --- a/automation/scripts/build
> > > > +++ b/automation/scripts/build
> > > > @@ -83,6 +83,7 @@ fi
> > > >    # Build all the configs we care about
> > > >    case ${XEN_TARGET_ARCH} in
> > > >        x86_64) arch=x86 ;;
> > > > +    arm64) arch=arm ;;
> > > >        *) exit 0 ;;
> > > >    esac
> > > >    @@ -93,4 +94,7 @@ for cfg in `ls ${cfg_dir}`; do
> > > >        rm -f xen/.config
> > > >        make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg}
> > > > defconfig
> > > >        make -j$(nproc) -C xen
> > > > +    if [[ ${arch} == "arm" ]]; then
> > > > +        cp xen/xen binaries/xen-${cfg}
> > > > +    fi
> > > 
> > > This feels a bit of a hack to be arm only. Can you explain why this is not
> > > enabled for x86 (other than this is not yet used)?
> > > 
> > > >    done
> > > > diff --git a/automation/scripts/qemu-staticmem-arm64.sh
> > > > b/automation/scripts/qemu-staticmem-arm64.sh
> > > > new file mode 100755
> > > > index 0000000000..5b89a151aa
> > > > --- /dev/null
> > > > +++ b/automation/scripts/qemu-staticmem-arm64.sh
> > > > @@ -0,0 +1,114 @@
> > > > +#!/bin/bash
> > > > +
> > > > +base=(0x50000000 0x100000000)
> > > > +size=(0x10000000 0x10000000)
> > > 
> > >  From the name, it is not clear what the base and size refers too. Looking
> > > a
> > > bit below, it seems to be referring to the domain memory. If so, I would
> > > suggest to comment and rename to "domu_{base, size}".
> > > 
> > > > +
> > > > +set -ex
> > > > +
> > > > +apt-get -qy update
> > > > +apt-get -qy install --no-install-recommends u-boot-qemu \
> > > > +                                            u-boot-tools \
> > > > +                                            device-tree-compiler \
> > > > +                                            cpio \
> > > > +                                            curl \
> > > > +                                            busybox-static
> > > > +
> > > > +# DomU Busybox
> > > > +cd binaries
> > > > +mkdir -p initrd
> > > > +mkdir -p initrd/bin
> > > > +mkdir -p initrd/sbin
> > > > +mkdir -p initrd/etc
> > > > +mkdir -p initrd/dev
> > > > +mkdir -p initrd/proc
> > > > +mkdir -p initrd/sys
> > > > +mkdir -p initrd/lib
> > > > +mkdir -p initrd/var
> > > > +mkdir -p initrd/mnt
> > > > +cp /bin/busybox initrd/bin/busybox
> > > > +initrd/bin/busybox --install initrd/bin
> > > > +echo "#!/bin/sh
> > > > +
> > > > +mount -t proc proc /proc
> > > > +mount -t sysfs sysfs /sys
> > > > +mount -t devtmpfs devtmpfs /dev
> > > > +/bin/sh" > initrd/init
> > > > +chmod +x initrd/init
> > > > +cd initrd
> > > > +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
> > > > +cd ../..
> > > > +
> > > > +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> > > > +curl -fsSLO
> > > > https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> > > > +
> > > > +./binaries/qemu-system-aarch64 -nographic \
> > > > +    -M virtualization=true \
> > > > +    -M virt \
> > > > +    -M virt,gic-version=2 \
> > > > +    -cpu cortex-a57 \
> > > > +    -smp 2 \
> > > > +    -m 8G \
> > > > +    -M dumpdtb=binaries/virt-gicv2.dtb
> > > > +
> > > > +#dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
> > > > +
> > > > +# ImageBuilder
> > > > +rm -rf imagebuilder
> > > > +git clone https://gitlab.com/ViryaOS/imagebuilder
> > > > +
> > > > +echo "MEMORY_START=\"0x40000000\"
> > > > +MEMORY_END=\"0x0200000000\"
> > > > +
> > > > +DEVICE_TREE=\"virt-gicv2.dtb\"
> > > > +
> > > > +XEN=\"xen-static_mem\"
> > > > +XEN_CMD=\"console=dtuart earlyprintk xsm=dummy\"
> > > 
> > > AFAIK, earlyprintk is not an option for Xen on Arm (at least). It is also
> > > not
> > > clear why you need to pass xsm=dummy.
> > > 
> > > > +
> > > > +NUM_DOMUS=1
> > > > +DOMU_MEM[0]=512
> > > > +DOMU_VCPUS[0]=1
> > > > +DOMU_KERNEL[0]=\"Image\"
> > > > +DOMU_RAMDISK[0]=\"initrd.cpio.gz\"
> > > > +DOMU_CMD[0]=\"earlyprintk console=ttyAMA0\"
> > > > +DOMU_STATIC_MEM[0]=\"${base[0]} ${size[0]} ${base[1]} ${size[1]}\"
> > > > +
> > > > +UBOOT_SOURCE=\"boot.source\"
> > > > +UBOOT_SCRIPT=\"boot.scr\"" > binaries/imagebuilder_config
> > > > +
> > > > +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c
> > > > binaries/imagebuilder_config
> > > > +
> > > > +# Run the test
> > > > +rm -f qemu-staticmem.serial
> > > > +set +e
> > > > +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source
> > > > 0x40000000"| \
> > > > +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
> > > > +    -M virtualization=true \
> > > > +    -M virt \
> > > > +    -M virt,gic-version=2 \
> > > > +    -cpu cortex-a57 \
> > > > +    -smp 2 \
> > > > +    -m 8G \
> > > > +    -no-reboot \
> > > > +    -device virtio-net-pci,netdev=vnet0 -netdev
> > > > user,id=vnet0,tftp=binaries
> > > > \
> > > > +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
> > > > +    -dtb ./binaries/virt-gicv2.dtb \
> > > > +    |& tee qemu-staticmem.serial
> > > > +
> > > > +set -e
> > > 
> > > A lot of the code above is duplicated from qemu-smoke-arm64.sh. I think it
> > > would be better to consolidate in a single script. Looking briefly
> > > throught
> > > the existing scripts, it looks like it is possible to pass arguments (see
> > > qemu-smoke-x86-64.sh).
> >   One idea would be to make the script common and "source" a second
> > script or config file with just the ImageBuilder configuration because
> > it looks like it is the only thing different.
> > 
> > 
> > > > +
> > > > +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || exit 1
> > > > +
> > > > +for ((i=0; i<${#base[@]}; i++))
> > > > +do
> > > > +    start="$(printf "0x%016x" ${base[$i]})"
> > > > +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
> > > > +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
> > > > +    if test $? -eq 1
> > > > +    then
> > > > +        exit 1
> > > > +    fi
> > > > +done
> > > 
> > > Please add a comment on top to explain what this is meant to do. However,
> > > I
> > > think we should avoid relying on output that we have written ourself. IOW,
> > > relying on Xen/Linux to always write the same message is risky because
> > > they
> > > can change at any time.
> > 
> > Especially if we make the script common, then we could just rely on the
> > existing check to see if the guest started correctly (no special check
> > for static memory).
> 
> In this case, how the test will verify that the static memory configuration
> has been taken into account and has not just been ignored?

There is no simple way that I can think of.

We can trust that it worked, without checking that the ranges were
actually static as requested.

We can parse the Xen output like you did, although if it changes then
the test will break.

Or we could add a script to detect and print specific output but I
don't know if there is something under /proc or /sys that we could
simply "cat" from bash to check it.

If there is a simple way to do this by cat'ing /proc or /sys then I
think that would be great. Otherwise I think we could do as you did in
this patch, which is not perfect but it works and if something changes
in the Xen output we'll detect it right away given that gitlab-ci is run
pre-commit.

