Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A925AC4509
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 02:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFSZQ-00051C-6I; Wed, 02 Oct 2019 00:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VXk2=X3=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iFSZO-000517-Bq
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 00:32:42 +0000
X-Inumbo-ID: 2292edcc-e4ac-11e9-9709-12813bfff9fa
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (unknown
 [40.107.81.75]) by localhost (Halon) with ESMTPS
 id 2292edcc-e4ac-11e9-9709-12813bfff9fa;
 Wed, 02 Oct 2019 00:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYqXDFDAqAvXR8piVmCu8C4QdX0pXhHKKu62uzh8ceFOLZwXpo6mOb59payw9o11iZPUFOLtk/DuZ+8FxLKgaL862nDo0zbyX18dVuBL4PBRcgBlo4D/WZSbqCwYuy0TAHXLv3pYiwdW6HA09OvF3W5+j3tubIxwgkSFgbi/KfKa2G26Q6ZPjDHFKswH4gKD2bw6w+neVp/AR/HIDrG82DG5j21sOl69824NBX/BmM1hvYOE1W5JkJLmssk+ZZw5He4UfUfTM23Dk1NfVepdVMp4lLBzvHiTW2cm0KugYQa5Svf3Q7WZxTGKEfQprc/+CGzbrUYW0xJf9K4uxrjfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIA2+4nhUsYSwZGADHDvJDLGFmIb3wLqU0s1wd6Hmik=;
 b=ggoJ1DyZk8SmSouvnLTgZlxRVoAR/uAkSvoOweZvjUvO6k3x9+R8XnDzQziZkdjuvW3YBq2sPCmN+GI/0m/UHH4KV5Qyv2neXN0A8DBdj8NsnakEarfdtrcHwffK2WT3uGlnRM081VDBKyyg4Pv0ZSfz4D/B1iR+Y6L9NXwPNL7K0d76ro4L6eaD0ZjGMmDGJJT5A6ET808mIrvjgvG/JlPxBwwPSGx6856DZzc9ArIThnHw4Vz2FAYryExmyfQUXU/b/KrL9HWtUp1reJNh58aWcDU8KvE2S+s9AzjqaHZpmHH2KOFhsy4o7pZp/AZRSzt5NQO1Y8WMx0RnBnx6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIA2+4nhUsYSwZGADHDvJDLGFmIb3wLqU0s1wd6Hmik=;
 b=UvKNhhYeOGx0mBFM7v9U0KWOnVw+JCg4/rjcobtCc29PBScyfyhaea4CGeA2OwAWb7Z4k0RwBy5uwI3CzRAMlXUkCZRt5OB5gOWBHmuH1GDUctAUdlBj8QBWeAhOWPbAXpaBpskcydT527TsFJFnUtSB69X4R52RFaSEaUsKz78=
Received: from BL0PR02CA0135.namprd02.prod.outlook.com (2603:10b6:208:35::40)
 by MN2PR02MB6991.namprd02.prod.outlook.com (2603:10b6:208:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.18; Wed, 2 Oct
 2019 00:32:35 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by BL0PR02CA0135.outlook.office365.com
 (2603:10b6:208:35::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17 via Frontend
 Transport; Wed, 2 Oct 2019 00:32:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Wed, 2 Oct 2019 00:32:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>) id 1iFSZG-0003zf-Md
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:32:34 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>) id 1iFSZB-00015H-Jv
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:32:29 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>) id 1iFSZB-00015C-6v
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:32:29 -0700
Date: Tue, 1 Oct 2019 17:32:29 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20191002003228.GA3940@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(478600001)(186003)(58126008)(26005)(316002)(2351001)(70206006)(2361001)(5660300002)(16586007)(235185007)(86362001)(36756003)(126002)(5024004)(106002)(71190400001)(426003)(7696005)(2616005)(5000100001)(476003)(486006)(336012)(44832011)(44144004)(8936002)(81156014)(568964002)(8676002)(9786002)(2906002)(21480400003)(1076003)(6916009)(33656002)(356004)(66576008)(70586007)(81166006)(2476003)(305945005)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB6991; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90c703cd-b0ae-479b-5673-08d746d00573
X-MS-TrafficTypeDiagnostic: MN2PR02MB6991:
X-Microsoft-Antispam-PRVS: <MN2PR02MB699182156A59E585871A0B46D79C0@MN2PR02MB6991.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssntAn/e/pZS8/r7qjTGcvqfrnmrkG7+Y+VXZbADsrgeAe5fWnuksWyb1APMALf6fykrW7uBQNMVZb444TgqzLMS2ZaIPQqgu8GDHR21RfsBKuGWpCIk1TRP2XZ3ki+gfNfZu4JHoPi6U+Bknv78MVuKoJ9WMEwbxIFvR0YwpdbVDmiR3iZAqLmS9kshQZYiYriXu04DNVlJsTTApyCAdha+CiJCHhNYZreRXnXPAG+OlOrc32RiXm7L85mROPyQQKxwRHTzHgauxVD1G7DA8Wn2uNU1mcqsOyEythO+1rpGGhxeZWNzLCuWaRIbP4mPbiujzkXwouBAk6bBM4dIh/7Ka/fkrrTR0f4n9p8JfIPmnmjTyeKFqrYuDE1KYGcmy0SxChiwdkl3ivWp1Ms3ogMxCM/sSZox1qY0wgn9KZM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 00:32:35.1988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c703cd-b0ae-479b-5673-08d746d00573
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6991
Subject: [Xen-devel] Errors with Loading Xen at a Certain Address
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

While testing some things out, I found a possible bug in Xen.  Xen would
successfully run when loaded (from u-boot) at some addresses but not
others.  I didn't observe this issue in 4.11 stable, so I did a bisect
and found that:
commit f60658c6ae47e74792e6cc48ea2effac8bb52826
Author: Julien Grall <julien.grall@arm.com>
Date:   Tue Dec 18 13:07:39 2018 +0000

    xen/arm: Stop relocating Xen

was what was causing it to fail when it was loaded to that certain
address.

I've attached the logs from a build from staging (about a week or so
ago) with both a passing and failing address.

-- 
Brian Woods

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="xen_good_addr.log"
Content-Transfer-Encoding: quoted-printable

PMU Firmware 2019.1	May 25 2019   06:57:33=0D
PMU_ROM Version: xpbr-v8.1.0-0=0D
NOTICE:  ATF running on XCZUUNKN/QEMU v4/RTL0.0 at 0xfffea000=0D
NOTICE:  BL31: Secure code at 0x60000000=0D
NOTICE:  BL31: Non secure code at 0x10080000=0D
NOTICE:  BL31: v2.0(release):xilinx-v2018.3-720-g80d1c790=0D
NOTICE:  BL31: Built : 06:54:23, May 25 2019=0D
PMUFW:	v1.1=0D
=0D
=0D
U-Boot 2019.01 (May 25 2019 - 06:55:09 +0000)=0D
=0D
Model: ZynqMP ZCU102 Rev1.0=0D
Board: Xilinx ZynqMP=0D
DRAM:  4 GiB=0D
EL Level:	EL2=0D
Chip ID:	unknown=0D
MMC:   mmc@ff170000: 0=0D
Loading Environment from SPI Flash... SF: Detected n25q512a with page size =
512 Bytes, erase size 128 KiB, total 128 MiB=0D
*** Warning - bad CRC, using default environment=0D
=0D
In:    serial@ff000000=0D
Out:   serial@ff000000=0D
Err:   serial@ff000000=0D
Model: ZynqMP ZCU102 Rev1.0=0D
Board: Xilinx ZynqMP=0D
Bootmode: JTAG_MODE=0D
Reset reason:	EXTERNAL =0D
Net:   ZYNQ GEM: ff0e0000, phyaddr c, interface rgmii-id=0D
eth0: ethernet@ff0e0000=0D
U-BOOT for xilinx-zcu102-2019_1=0D
=0D
BOOTP broadcast 1=0D
DHCP client bound to address 10.0.5.15 (1 ms)=0D
Hit any key to stop autoboot:  4 =08=08=08 0 =0D
ZynqMP> setenv serverip 10.0.5.2; tftpb 1280000 xen-qemu-mod.dtb; tftpb 0x8=
0000 yocto-Image; tftpb 4200000 xen-custom.ub; tftpb 9000000 yocto-rootfs.c=
pio.gz.ub; bootm 4200000 9000000 1280000 =0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-qemu-mod.dtb'.=0D
Load address: 0x1280000=0D
Loading: *=08###=0D
	 12.1 MiB/s=0D
done=0D
Bytes transferred =3D 38019 (9483 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'yocto-Image'.=0D
Load address: 0x80000=0D
Loading: *=08##############################################################=
###=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #########################################=0D
	 32.9 MiB/s=0D
done=0D
Bytes transferred =3D 18215424 (115f200 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-custom.ub'.=0D
Load address: 0x4200000=0D
Loading: *=08##############################################################=
###=0D
	 ####=0D
	 32.4 MiB/s=0D
done=0D
Bytes transferred =3D 984464 (f0590 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'yocto-rootfs.cpio.gz.ub'.=0D
Load address: 0x9000000=0D
Loading: *=08##############################################################=
###=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #####################=0D
	 32.7 MiB/s=0D
done=0D
Bytes transferred =3D 9569188 (9203a4 hex)=0D
## Booting kernel from Legacy Image at 04200000 ...=0D
   Image Name:   =0D
   Image Type:   AArch64 Linux Kernel Image (uncompressed)=0D
   Data Size:    984400 Bytes =3D 961.3 KiB=0D
   Load Address: 04200000=0D
   Entry Point:  04200000=0D
   Verifying Checksum ... OK=0D
## Loading init Ramdisk from Legacy Image at 09000000 ...=0D
   Image Name:   =0D
   Image Type:   AArch64 Linux RAMDisk Image (gzip compressed)=0D
   Data Size:    9569124 Bytes =3D 9.1 MiB=0D
   Load Address: 09000000=0D
   Entry Point:  09000000=0D
   Verifying Checksum ... OK=0D
## Flattened Device Tree blob at 01280000=0D
   Booting using the fdt blob at 0x1280000=0D
   Loading Kernel Image ... OK=0D
   Loading Ramdisk to 076df000, end 07fff364 ... OK=0D
   Loading Device Tree to 00000000076d2000, end 00000000076de482 ... OK=0D
=0D
Starting kernel ...=0D
=0D
 Xen 4.13-unstable=0D
(XEN) Xen version 4.13-unstable (woods@xilinx.com) (aarch64-unknown-linux-g=
nu-gcc (crosstool-NG 1.24.0.6-afaf7b9) 8.3.0) debug=3Dy  Wed Sep 25 16:02:2=
6 PDT 2019=0D
(XEN) Latest ChangeSet: Tue Sep 24 15:46:48 2019 +0000 git:4333876=0D
(XEN) build-id: a026a3bc865f1c93f67de50e71b7aea86f79e5b9=0D
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4=
=0D
(XEN) 64-bit Execution:=0D
(XEN)   Processor Features: 1100000000002222 0000000000000000=0D
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32=0D
(XEN)     Extensions: FloatingPoint AdvancedSIMD=0D
(XEN)   Debug Features: 0000000010305106 0000000000000000=0D
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000=0D
(XEN)   Memory Model Features: 0000000000001122 0000000000000000=0D
(XEN)   ISA Features:  0000000000011120 0000000000000000=0D
(XEN) 32-bit Execution:=0D
(XEN)   Processor Features: 00001231:00011011=0D
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle=0D
(XEN)     Extensions: GenericTimer Security=0D
(XEN)   Debug Features: 03010066=0D
(XEN)   Auxiliary Features: 00000000=0D
(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211=0D
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121=
=0D
(XEN) Using SMC Calling Convention v1.1=0D
(XEN) Using PSCI v1.1=0D
(XEN) SMP: Allowing 4 CPUs=0D
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz=0D
(XEN) GICv2 initialization:=0D
(XEN)         gic_dist_addr=3D00000000f9010000=0D
(XEN)         gic_cpu_addr=3D00000000f9020000=0D
(XEN)         gic_hyp_addr=3D00000000f9040000=0D
(XEN)         gic_vcpu_addr=3D00000000f9060000=0D
(XEN)         gic_maintenance_irq=3D25=0D
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000=0D
(XEN) GICv2: 192 lines, 4 cpus (IID 00000000).=0D
(XEN) XSM Framework v1.0.0 initialized=0D
(XEN) Initialising XSM SILO mode=0D
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)=0D
(XEN) Initializing Credit2 scheduler=0D
(XEN)  load_precision_shift: 18=0D
(XEN)  load_window_shift: 30=0D
(XEN)  underload_balance_tolerance: 0=0D
(XEN)  overload_balance_tolerance: -3=0D
(XEN)  runqueues arrangement: socket=0D
(XEN)  cap enforcement granularity: 10ms=0D
(XEN) load tracking window length 1073741824 ns=0D
(XEN) Allocated console ring of 32 KiB.=0D
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU1=0D
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU2=0D
(XEN) CPU 1 booted.=0D
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU3=0D
(XEN) CPU 2 booted.=0D
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Brought up 4 CPUs=0D
(XEN) CPU 3 booted.=0D
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID=0D
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558=0D
(XEN) smmu: /smmu@fd800000: probing hardware configuration...=0D
(XEN) smmu: /smmu@fd800000: SMMUv2 with:=0D
(XEN) smmu: /smmu@fd800000: 	stage 2 translation=0D
(XEN) smmu: /smmu@fd800000: 	stream matching with 48 register groups, mask =
0x7fff=0D
(XEN) smmu: /smmu@fd800000: 	16 context banks (0 stage-2 only)=0D
(XEN) smmu: /smmu@fd800000: 	Stage-2: 40-bit IPA -> 48-bit PA=0D
(XEN) smmu: /smmu@fd800000: registered 26 master devices=0D
(XEN) I/O virtualisation enabled=0D
(XEN)  - Dom0 mode: Relaxed=0D
(XEN) Interrupt remapping enabled=0D
(XEN) Adding cpu 0 to runqueue 0=0D
(XEN)  First cpu on runqueue, activating=0D
(XEN) Adding cpu 1 to runqueue 0=0D
(XEN) Adding cpu 2 to runqueue 0=0D
(XEN) Adding cpu 3 to runqueue 0=0D
(XEN) alternatives: Patching with alt table 00000000002c3e68 -> 00000000002=
c4528=0D
(XEN) *** LOADING DOMAIN 0 ***=0D
(XEN) Loading d0 kernel from boot module @ 0000000000080000=0D
(XEN) Loading ramdisk from boot module @ 00000000076df000=0D
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:=0D
(XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)=0D
(XEN) Grant table range: 0x00000004200000-0x00000004240000=0D
(XEN) smmu: /smmu@fd800000: d0: p2maddr 0x000000087bf9a000=0D
(XEN) Allocating PPI 16 for event channel interrupt=0D
(XEN) Loading zImage from 0000000000080000 to 0000000020080000-000000002318=
0000=0D
(XEN) Loading dom0 initrd from 00000000076df000 to 0x0000000028200000-0x000=
0000028b20364=0D
(XEN) Loading dom0 DTB to 0x0000000028000000-0x0000000028008db3=0D
(XEN) Initial low memory virq threshold set at 0x4000 pages.=0D
(XEN) Std. Loglevel: All=0D
(XEN) Guest Loglevel: All=0D
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)=
=0D
(XEN) Freed 332kB init memory.=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20=0D
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=0D
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]=0D=0D
[    0.000000] Linux version 4.19.0-xilinx-v2019.1 (oe-user@oe-host) (gcc v=
ersion 8.3.0 (GCC)) #1 SMP Mon Sep 16 21:16:49 UTC 2019=0D=0D
[    0.000000] Machine model: ZynqMP ZCU102 Rev1.0=0D=0D
[    0.000000] Xen 4.13 support found=0D=0D
[    0.000000] efi: Getting EFI parameters from FDT:=0D=0D
[    0.000000] efi: UEFI not found.=0D=0D
[    0.000000] cma: Reserved 256 MiB at 0x0000000050000000=0D=0D
[    0.000000] psci: probing for conduit method from DT.=0D=0D
[    0.000000] psci: PSCIv1.1 detected in firmware.=0D=0D
[    0.000000] psci: Using standard PSCI v0.2 function IDs=0D=0D
[    0.000000] psci: Trusted OS migration not required=0D=0D
[    0.000000] psci: SMC Calling Convention v1.1=0D=0D
[    0.000000] random: get_random_bytes called from start_kernel+0x94/0x3f8=
 with crng_init=3D0=0D=0D
[    0.000000] percpu: Embedded 23 pages/cpu @(____ptrval____) s53656 r8192=
 d32360 u94208=0D=0D
[    0.000000] Detected VIPT I-cache on CPU0=0D=0D
[    0.000000] CPU features: enabling workaround for ARM erratum 843419=0D=
=0D
[    0.000000] CPU features: enabling workaround for ARM erratum 845719=0D=
=0D
[    0.000000] Speculative Store Bypass Disable mitigation not required=0D=
=0D
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 25856=
0=0D=0D
[    0.000000] Kernel command line: console=3Dhvc0 earlycon=3Dxen earlyprin=
tk=3Dxen clk_ignore_unused=0D=0D
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 b=
ytes)=0D=0D
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 byte=
s)=0D=0D
[    0.000000] Memory: 727836K/1048576K available (10812K kernel code, 636K=
 rwdata, 5436K rodata, 832K init, 316K bss, 58596K reserved, 262144K cma-re=
served)=0D=0D
[    0.000000] rcu: Hierarchical RCU implementation.=0D=0D
[    0.000000] rcu: 	RCU event tracing is enabled.=0D=0D
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D=
4.=0D=0D
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4=0D=0D
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0=0D=0D
[    0.000000] arch_timer: cp15 timer(s) running at 65.00MHz (virt).=0D=0D
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0xefdb196da, max_idle_ns: 440795204367 ns=0D=0D
[    0.000187] sched_clock: 56 bits at 65MHz, resolution 15ns, wraps every =
2199023255550ns=0D=0D
[    0.014877] Console: colour dummy device 80x25=0D=0D
[    0.038027] console [hvc0] enabled=0D=0D
[    0.039888] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 130.00 BogoMIPS (lpj=3D260000)=0D=0D
[    0.041386] pid_max: default: 32768 minimum: 301=0D=0D
[    0.044785] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)=
=0D=0D
[    0.045963] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 b=
ytes)=0D=0D
[    0.095986] ASID allocator initialised with 32768 entries=0D=0D
[    0.125944] xen:grant_table: Grant tables using version 1 layout=0D=0D
[    0.128575] Grant table initialized=0D=0D
[    0.130614] xen:events: Using FIFO-based ABI=0D=0D
[    0.133101] Xen: initializing cpu0=0D=0D
[    0.136546] rcu: Hierarchical SRCU implementation.=0D=0D
[    0.144127] EFI services will not be available.=0D=0D
[    0.148328] smp: Bringing up secondary CPUs ...=0D=0D
(XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=0D
(XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=0D
(XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=0D
[    0.157088] Detected VIPT I-cache on CPU1=0D=0D
[    0.160631] Xen: initializing cpu1=0D=0D
[    0.161124] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]=
=0D=0D
[    0.176014] Detected VIPT I-cache on CPU2=0D=0D
[    0.177413] Xen: initializing cpu2=0D=0D
[    0.177683] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]=
=0D=0D
[    0.189775] Detected VIPT I-cache on CPU3=0D=0D
[    0.191512] Xen: initializing cpu3=0D=0D
[    0.191873] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]=
=0D=0D
[    0.196127] smp: Brought up 1 node, 4 CPUs=0D=0D
[    0.202335] SMP: Total of 4 processors activated.=0D=0D
[    0.203328] CPU features: detected: 32-bit EL0 Support=0D=0D
[    0.207121] CPU: All CPU(s) started at EL1=0D=0D
[    0.209995] alternatives: patching kernel code=0D=0D
[    0.241280] devtmpfs: initialized=0D=0D
[    0.274871] Duplicate name in base, renamed to "memory#1"=0D=0D
[    0.291631] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns=0D=0D
[    0.292955] futex hash table entries: 1024 (order: 4, 65536 bytes)=0D=0D
[    0.326137] xor: measuring software checksum speed=0D=0D
[    0.368712]    8regs     :  1570.000 MB/sec=0D=0D
[    0.411173]    8regs_prefetch:   670.000 MB/sec=0D=0D
[    0.453717]    32regs    :  1473.000 MB/sec=0D=0D
[    0.496061]    32regs_prefetch:  1487.000 MB/sec=0D=0D
[    0.496820] xor: using function: 8regs (1570.000 MB/sec)=0D=0D
[    0.497848] pinctrl core: initialized pinctrl subsystem=0D=0D
[    0.531356] NET: Registered protocol family 16=0D=0D
[    0.542985] audit: initializing netlink subsys (disabled)=0D=0D
[    0.551328] audit: type=3D2000 audit(0.480:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1=0D=0D
[    0.579037] vdso: 2 pages (1 code @ (____ptrval____), 1 data @ (____ptrv=
al____))=0D=0D
[    0.582688] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
=2E=0D=0D
[    0.609680] DMA: preallocated 256 KiB pool for atomic allocations=0D=0D
[    0.612524] xen:swiotlb_xen: Warning: only able to allocate 4 MB for sof=
tware IO TLB=0D=0D
[    0.626620] software IO TLB: mapped [mem 0x4d400000-0x4d800000] (4MB)=0D=
=0D
[    0.922838] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages=
=0D=0D
[    1.014553] raid6: int64x1  gen()   713 MB/s=0D=0D
[    1.094148] raid6: int64x1  xor()   451 MB/s=0D=0D
[    1.173144] raid6: int64x2  gen()   911 MB/s=0D=0D
[    1.253055] raid6: int64x2  xor()   517 MB/s=0D=0D
[    1.337241] raid6: int64x4  gen()  1439 MB/s=0D=0D
[    1.420751] raid6: int64x4  xor()   394 MB/s=0D=0D
[    1.501362] raid6: int64x8  gen()  1073 MB/s=0D=0D
[    1.588967] raid6: int64x8  xor()   483 MB/s=0D=0D
[    1.671314] raid6: neonx1   gen()   555 MB/s=0D=0D
[    1.755222] raid6: neonx1   xor()   327 MB/s=0D=0D
[    1.837742] raid6: neonx2   gen()   675 MB/s=0D=0D
[    1.917942] raid6: neonx2   xor()   351 MB/s=0D=0D
[    2.002178] raid6: neonx4   gen()   707 MB/s=0D=0D
[    2.086068] raid6: neonx4   xor()   378 MB/s=0D=0D
[    2.169306] raid6: neonx8   gen()   678 MB/s=0D=0D
[    2.256944] raid6: neonx8   xor()   324 MB/s=0D=0D
[    2.257797] raid6: using algorithm int64x4 gen() 1439 MB/s=0D=0D
[    2.258864] raid6: .... xor() 394 MB/s, rmw enabled=0D=0D
[    2.259623] raid6: using neon recovery algorithm=0D=0D
[    2.268414] xen:balloon: Initialising balloon driver=0D=0D
[    2.280389] SCSI subsystem initialized=0D=0D
[    2.286679] usbcore: registered new interface driver usbfs=0D=0D
[    2.289433] usbcore: registered new interface driver hub=0D=0D
[    2.292037] usbcore: registered new device driver usb=0D=0D
[    2.294868] media: Linux media interface: v0.10=0D=0D
[    2.296800] videodev: Linux video capture interface: v2.00=0D=0D
[    2.297925] pps_core: LinuxPPS API ver. 1 registered=0D=0D
[    2.299068] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>=0D=0D
[    2.301473] PTP clock support registered=0D=0D
[    2.302868] EDAC MC: Ver: 3.0.0=0D=0D
[    2.325066] zynqmp-ipi-mbox mailbox@ff990400: Probed ZynqMP IPI Mailbox =
driver.=0D=0D
[    2.332219] FPGA manager framework=0D=0D
[    2.339159] Advanced Linux Sound Architecture Driver Initialized.=0D=0D
[    2.355807] Bluetooth: Core ver 2.22=0D=0D
[    2.357352] NET: Registered protocol family 31=0D=0D
[    2.358190] Bluetooth: HCI device and connection manager initialized=0D=
=0D
[    2.359932] Bluetooth: HCI socket layer initialized=0D=0D
[    2.361133] Bluetooth: L2CAP socket layer initialized=0D=0D
[    2.362570] Bluetooth: SCO socket layer initialized=0D=0D
[    2.381595] clocksource: Switched to clocksource arch_sys_counter=0D=0D
[    2.387863] VFS: Disk quotas dquot_6.6.0=0D=0D
[    2.389835] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)=0D=0D
[    2.539774] NET: Registered protocol family 2=0D=0D
[    2.555479] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, =
8192 bytes)=0D=0D
[    2.557302] TCP established hash table entries: 8192 (order: 4, 65536 by=
tes)=0D=0D
[    2.558762] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)=
=0D=0D
[    2.560158] TCP: Hash tables configured (established 8192 bind 8192)=0D=
=0D
[    2.566089] UDP hash table entries: 512 (order: 2, 16384 bytes)=0D=0D
[    2.567470] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)=0D=
=0D
[    2.571551] NET: Registered protocol family 1=0D=0D
[    2.592826] RPC: Registered named UNIX socket transport module.=0D=0D
[    2.594557] RPC: Registered udp transport module.=0D=0D
[    2.595355] RPC: Registered tcp transport module.=0D=0D
[    2.595902] RPC: Registered tcp NFSv4.1 backchannel transport module.=0D=
=0D
[    2.614851] Trying to unpack rootfs image as initramfs...=0D=0D
[    4.740251] Freeing initrd memory: 9344K=0D=0D
[    4.765443] Initialise system trusted keyrings=0D=0D
[    4.770758] workingset: timestamp_bits=3D62 max_order=3D18 bucket_order=
=3D0=0D=0D
[    4.803719] NFS: Registering the id_resolver key type=0D=0D
[    4.805475] Key type id_resolver registered=0D=0D
[    4.806079] Key type id_legacy registered=0D=0D
[    4.806808] nfs4filelayout_init: NFSv4 File Layout Driver Registering...=
=0D=0D
[    4.808279] jffs2: version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.=0D=0D
[    6.453560] NET: Registered protocol family 38=0D=0D
[    6.607526] Key type asymmetric registered=0D=0D
[    6.608394] Asymmetric key parser 'x509' registered=0D=0D
[    6.610910] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)=0D=0D
[    6.612076] io scheduler noop registered=0D=0D
[    6.613116] io scheduler deadline registered=0D=0D
[    6.614108] io scheduler cfq registered (default)=0D=0D
[    6.614686] io scheduler mq-deadline registered=0D=0D
[    6.615223] io scheduler kyber registered=0D=0D
[    6.648343] OF: /amba/dma@fd500000: could not find phandle=0D=0D
[    6.650762] OF: /amba/dma@fd510000: could not find phandle=0D=0D
[    6.652047] OF: /amba/dma@fd520000: could not find phandle=0D=0D
[    6.654383] OF: /amba/dma@fd530000: could not find phandle=0D=0D
[    6.655616] OF: /amba/dma@fd540000: could not find phandle=0D=0D
[    6.657589] OF: /amba/dma@fd550000: could not find phandle=0D=0D
[    6.659022] OF: /amba/dma@fd560000: could not find phandle=0D=0D
[    6.660296] OF: /amba/dma@fd570000: could not find phandle=0D=0D
[    6.677808] xen:xen_evtchn: Event-channel device installed=0D=0D
[    8.679402] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled=0D=
=0D
[    8.888333] brd: module loaded=0D=0D
[    8.957493] loop: module loaded=0D=0D
[    8.975211] mtdoops: mtd device (mtddev=3Dname/number) must be supplied=
=0D=0D
[    8.984150] OF: /amba/spi@ff0f0000: could not find phandle=0D=0D
[    9.005750] libphy: Fixed MDIO Bus: probed=0D=0D
[    9.031025] tun: Universal TUN/TAP device driver, 1.6=0D=0D
[    9.051550] CAN device driver interface=0D=0D
[    9.065683] xen_netfront: Initialising Xen virtual ethernet driver=0D=0D
[    9.067527] usbcore: registered new interface driver asix=0D=0D
[    9.069506] usbcore: registered new interface driver ax88179_178a=0D=0D
[    9.071320] usbcore: registered new interface driver cdc_ether=0D=0D
[    9.073852] usbcore: registered new interface driver net1080=0D=0D
[    9.075284] usbcore: registered new interface driver cdc_subset=0D=0D
[    9.077488] usbcore: registered new interface driver zaurus=0D=0D
[    9.078861] usbcore: registered new interface driver cdc_ncm=0D=0D
[    9.097405] usbcore: registered new interface driver uas=0D=0D
[    9.098956] usbcore: registered new interface driver usb-storage=0D=0D
[    9.123263] rtc_zynqmp ffa60000.rtc: rtc core: registered ffa60000.rtc a=
s rtc0=0D=0D
[    9.126336] i2c /dev entries driver=0D=0D
[    9.168401] usbcore: registered new interface driver uvcvideo=0D=0D
[    9.170219] USB Video Class driver (1.1.1)=0D=0D
[    9.189011] Bluetooth: HCI UART driver ver 2.3=0D=0D
[    9.190300] Bluetooth: HCI UART protocol H4 registered=0D=0D
[    9.190887] Bluetooth: HCI UART protocol BCSP registered=0D=0D
[    9.193790] Bluetooth: HCI UART protocol LL registered=0D=0D
[    9.194212] Bluetooth: HCI UART protocol ATH3K registered=0D=0D
[    9.195268] Bluetooth: HCI UART protocol Three-wire (H5) registered=0D=0D
[    9.198265] Bluetooth: HCI UART protocol Intel registered=0D=0D
[    9.199806] Bluetooth: HCI UART protocol QCA registered=0D=0D
[    9.202233] usbcore: registered new interface driver bcm203x=0D=0D
[    9.203677] usbcore: registered new interface driver bpa10x=0D=0D
[    9.205870] usbcore: registered new interface driver bfusb=0D=0D
[    9.207416] usbcore: registered new interface driver btusb=0D=0D
[    9.207991] Bluetooth: Generic Bluetooth SDIO driver ver 0.1=0D=0D
[    9.210060] usbcore: registered new interface driver ath3k=0D=0D
[    9.215315] EDAC MC: ECC not enabled=0D=0D
[    9.219734] EDAC ZynqMP-OCM: ECC not enabled - Disabling EDAC driver=0D=
=0D
[    9.226639] cpu cpu0: failed to get clock: -2=0D=0D
[    9.227455] cpufreq-dt: probe of cpufreq-dt failed with error -2=0D=0D
[    9.233655] sdhci: Secure Digital Host Controller Interface driver=0D=0D
[    9.234310] sdhci: Copyright(c) Pierre Ossman=0D=0D
[    9.234782] sdhci-pltfm: SDHCI platform and OF driver helper=0D=0D
[    9.252074] ledtrig-cpu: registered to indicate activity on CPUs=0D=0D
[    9.256443] zynqmp_firmware_probe Platform Management API v1.1=0D=0D
[    9.258526] zynqmp_firmware_probe Trustzone version v1.0=0D=0D
[    9.416122] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: zynqmp pinc=
trl initialized=0D=0D
[   10.351793] zynqmp_clk_mux_get_parent() getparent failed for clock: lpd_=
wdt, ret =3D -22=0D=0D
[   10.374747] alg: No test for xilinx-zynqmp-aes (zynqmp-aes)=0D=0D
[   10.379006] zynqmp_aes zynqmp_aes: AES Successfully Registered=0D=0D
[   10.379006] =0D=0D=0D
[   10.395910] alg: No test for xilinx-keccak-384 (zynqmp-keccak-384)=0D=0D
[   10.411748] alg: No test for xilinx-zynqmp-rsa (zynqmp-rsa)=0D=0D
[   10.423719] usbcore: registered new interface driver usbhid=0D=0D
[   10.424338] usbhid: USB HID core driver=0D=0D
[   10.490912] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered=0D=
=0D
[   10.503819] usbcore: registered new interface driver snd-usb-audio=0D=0D
[   10.532250] pktgen: Packet Generator for packet performance testing. Ver=
sion: 2.75=0D=0D
[   10.569213] Initializing XFRM netlink socket=0D=0D
[   10.571617] NET: Registered protocol family 10=0D=0D
[   10.592010] Segment Routing with IPv6=0D=0D
[   10.597834] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver=0D=0D
[   10.607228] NET: Registered protocol family 17=0D=0D
[   10.608363] NET: Registered protocol family 15=0D=0D
[   10.611095] bridge: filtering via arp/ip/ip6tables is no longer availabl=
e by default. Update your scripts to load br_netfilter if you need this.=0D=
=0D
[   10.619177] can: controller area network core (rev 20170425 abi 9)=0D=0D
[   10.622296] NET: Registered protocol family 29=0D=0D
[   10.623320] can: raw protocol (rev 20170425)=0D=0D
[   10.624039] can: broadcast manager protocol (rev 20170425 t)=0D=0D
[   10.626776] can: netlink gateway (rev 20170425) max_hops=3D1=0D=0D
[   10.635096] Bluetooth: RFCOMM TTY layer initialized=0D=0D
[   10.638144] Bluetooth: RFCOMM socket layer initialized=0D=0D
[   10.639447] Bluetooth: RFCOMM ver 1.11=0D=0D
[   10.640526] Bluetooth: BNEP (Ethernet Emulation) ver 1.3=0D=0D
[   10.642514] Bluetooth: BNEP filters: protocol multicast=0D=0D
[   10.643292] Bluetooth: BNEP socket layer initialized=0D=0D
[   10.644150] Bluetooth: HIDP (Human Interface Emulation) ver 1.2=0D=0D
[   10.645902] Bluetooth: HIDP socket layer initialized=0D=0D
[   10.651298] 9pnet: Installing 9P2000 support=0D=0D
[   10.653393] Key type dns_resolver registered=0D=0D
[   10.675782] registered taskstats version 1=0D=0D
[   10.677688] Loading compiled-in X.509 certificates=0D=0D
[   10.685503] Btrfs loaded, crc32c=3Dcrc32c-generic=0D=0D
[   10.777889] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 42, base=
_baud =3D 2479910) is a xuartps=0D=0D
[   10.831149] of-fpga-region fpga-full: FPGA Region probed=0D=0D
[   10.855207] nwl-pcie fd0e0000.pcie: Link is UP=0D=0D
[   10.857587] nwl-pcie fd0e0000.pcie: host bridge /amba/pcie@fd0e0000 rang=
es:=0D=0D
[   10.859285] nwl-pcie fd0e0000.pcie:   MEM 0xe0000000..0xefffffff -> 0xe0=
000000=0D=0D
[   10.861504] nwl-pcie fd0e0000.pcie:   MEM 0x600000000..0x7ffffffff -> 0x=
600000000=0D=0D
[   10.878305] nwl-pcie fd0e0000.pcie: PCI host bridge to bus 0000:00=0D=0D
[   10.879776] pci_bus 0000:00: root bus resource [bus 00-ff]=0D=0D
[   10.881949] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xeffffff=
f]=0D=0D
[   10.882745] pci_bus 0000:00: root bus resource [mem 0x600000000-0x7fffff=
fff pref]=0D=0D
[   10.939267] xilinx-dpdma fd4c0000.dma: Xilinx DPDMA engine is probed=0D=
=0D
[   10.942636] OF: /amba/dma@fd500000: could not find phandle=0D=0D
[   10.952392] xilinx-zynqmp-dma fd500000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   10.955784] OF: /amba/dma@fd510000: could not find phandle=0D=0D
[   10.959604] xilinx-zynqmp-dma fd510000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   10.963155] OF: /amba/dma@fd520000: could not find phandle=0D=0D
[   10.967328] xilinx-zynqmp-dma fd520000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   10.972127] OF: /amba/dma@fd530000: could not find phandle=0D=0D
[   10.984219] xilinx-zynqmp-dma fd530000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   10.990969] OF: /amba/dma@fd540000: could not find phandle=0D=0D
[   10.998890] xilinx-zynqmp-dma fd540000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.003722] OF: /amba/dma@fd550000: could not find phandle=0D=0D
[   11.008451] xilinx-zynqmp-dma fd550000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.014072] OF: /amba/dma@fd560000: could not find phandle=0D=0D
[   11.018192] xilinx-zynqmp-dma fd560000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.022348] OF: /amba/dma@fd570000: could not find phandle=0D=0D
[   11.026906] xilinx-zynqmp-dma fd570000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.038217] xilinx-zynqmp-dma ffa80000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.047419] xilinx-zynqmp-dma ffa90000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.054780] xilinx-zynqmp-dma ffaa0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.060455] xilinx-zynqmp-dma ffab0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.067010] xilinx-zynqmp-dma ffac0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.073652] xilinx-zynqmp-dma ffad0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.078947] xilinx-zynqmp-dma ffae0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.085621] xilinx-zynqmp-dma ffaf0000.dma: ZynqMP DMA driver Probe succ=
ess=0D=0D
[   11.098980] xilinx-psgtr fd400000.zynqmp_phy: Lane:1 type:8 protocol:4 p=
ll_locked:yes=0D=0D
[   11.177334] zynqmp_clk_divider_set_rate() set divider failed for ams_ref=
_div1, ret =3D -13=0D=0D
[   11.288143] xilinx-dp-snd-codec fd4a0000.zynqmp-display:zynqmp_dp_snd_co=
dec0: Failed to get required clock freq=0D=0D
[   11.294376] xilinx-dp-snd-codec: probe of fd4a0000.zynqmp-display:zynqmp=
_dp_snd_codec0 failed with error -22=0D=0D
[   11.302811] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm0: Xilinx DisplayPort Sou=
nd PCM probed=0D=0D
[   11.309766] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm1: Xilinx DisplayPort Sou=
nd PCM probed=0D=0D
[   11.317681] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D=0D
[   11.322825] OF: graph: no port node found in /amba/zynqmp-display@fd4a00=
00=0D=0D
[   11.333499] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).=
=0D=0D
[   11.334622] [drm] No driver support for vblank timestamp query.=0D=0D
[   11.341007] xlnx-drm xlnx-drm.0: bound fd4a0000.zynqmp-display (ops 0xff=
ffff8008bcf5e0)=0D=0D
[   11.591223] Console: switching to colour frame buffer device 128x48=0D=0D
[   11.623881] zynqmp-display fd4a0000.zynqmp-display: fb0:  frame buffer d=
evice=0D=0D
[   11.632004] [drm] Initialized xlnx 1.0.0 20130509 for fd4a0000.zynqmp-di=
splay on minor 0=0D=0D
[   11.634724] zynqmp-display fd4a0000.zynqmp-display: ZynqMP DisplayPort S=
ubsystem driver probed=0D=0D
[   11.653595] xilinx-psgtr fd400000.zynqmp_phy: Lane:3 type:3 protocol:2 p=
ll_locked:yes=0D=0D
[   11.659283] ahci-ceva fd0c0000.ahci: AHCI 0001.0000 32 slots 2 ports 1.5=
 Gbps 0x3 impl platform mode=0D=0D
[   11.661161] ahci-ceva fd0c0000.ahci: flags: 64bit ncq only =0D=0D
[   11.691718] scsi host0: ahci-ceva=0D=0D
[   11.701756] scsi host1: ahci-ceva=0D=0D
[   11.706625] ata1: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x100 irq 40=0D=0D
[   11.707844] ata2: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x180 irq 40=0D=0D
[   11.713473] OF: /amba/spi@ff0f0000: could not find phandle=0D=0D
[   11.758795] m25p80 spi0.0: n25q512a (131072 Kbytes)=0D=0D
[   11.761881] 3 fixed-partitions partitions found on MTD device spi0.0=0D=
=0D
[   11.763015] Creating 3 MTD partitions on "spi0.0":=0D=0D
[   11.763926] 0x000000000000-0x000001e00000 : "boot"=0D=0D
[   11.783917] 0x000001e00000-0x000001e40000 : "bootenv"=0D=0D
[   11.802300] 0x000001e40000-0x000004240000 : "kernel"=0D=0D
[   11.928974] OF: /amba/ethernet@ff0e0000: could not find phandle=0D=0D
[   11.942285] macb ff0e0000.ethernet: Not enabling partial store and forwa=
rd=0D=0D
[   11.943803] macb: GEM doesn't support hardware ptp.=0D=0D
[   11.958257] libphy: MACB_mii_bus: probed=0D=0D
[   12.035793] ata2: SATA link down (SStatus 0 SControl 300)=0D=0D
[   12.042107] ata1: SATA link down (SStatus 0 SControl 300)=0D=0D
[   12.198649] Marvell 88E1118 ff0e0000.ethernet-ffffffff:0c: attached PHY =
driver [Marvell 88E1118] (mii_bus:phy_addr=3Dff0e0000.ethernet-ffffffff:0c,=
 irq=3DPOLL)=0D=0D
[   12.201283] macb ff0e0000.ethernet eth0: Cadence GEM rev 0x40070106 at 0=
xff0e0000 irq 25 (00:0a:35:00:22:01)=0D=0D
[   12.209855] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM=0D=0D
[   12.218817] xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM=0D=0D
[   12.227413] xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM=0D=0D
[   12.235184] xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM=0D=0D
[   12.355418] OF: /amba/usb0@ff9d0000/dwc3@fe200000: could not find phandl=
e=0D=0D
[   12.364085] dwc3 fe200000.dwc3: Failed to get clk 'ref': -2=0D=0D
[   12.387237] dwc3 fe200000.dwc3: Configuration mismatch. dr_mode forced t=
o gadget=0D=0D
[   12.389498] dwc3 fe200000.dwc3: this is not a DesignWare USB3 DRD Core=
=0D=0D
[   12.391165] dwc3 fe200000.dwc3: failed to initialize core=0D=0D
[   12.432037] pca953x 0-0020: 0-0020 supply vcc not found, using dummy reg=
ulator=0D=0D
[   12.435311] pca953x 0-0020: Linked as a consumer to regulator.0=0D=0D
[   12.450872] pca953x 0-0021: 0-0021 supply vcc not found, using dummy reg=
ulator=0D=0D
[   12.452052] pca953x 0-0021: Linked as a consumer to regulator.0=0D=0D
[   12.481056] ina2xx 3-0040: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.490833] ina2xx 3-0041: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.498810] ina2xx 3-0042: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.506734] ina2xx 3-0043: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.515770] ina2xx 3-0044: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.524179] ina2xx 3-0045: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.531713] ina2xx 3-0046: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.539135] ina2xx 3-0047: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.547721] ina2xx 3-004a: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.558475] ina2xx 3-004b: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.560204] i2c i2c-0: Added multiplexed i2c bus 3=0D=0D
[   12.572260] ina2xx 4-0040: power monitor ina226 (Rshunt =3D 2000 uOhm)=
=0D=0D
[   12.582877] ina2xx 4-0041: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.591273] ina2xx 4-0042: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.598863] ina2xx 4-0043: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.607568] ina2xx 4-0044: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.615698] ina2xx 4-0045: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.623637] ina2xx 4-0046: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.631058] ina2xx 4-0047: power monitor ina226 (Rshunt =3D 5000 uOhm)=
=0D=0D
[   12.633609] i2c i2c-0: Added multiplexed i2c bus 4=0D=0D
[   12.671705] max20751 5-0072: Failed to identify chip capabilities=0D=0D
[   12.683220] max20751 5-0073: Failed to identify chip capabilities=0D=0D
[   12.684374] i2c i2c-0: Added multiplexed i2c bus 5=0D=0D
[   12.688412] i2c i2c-0: Added multiplexed i2c bus 6=0D=0D
[   12.690222] pca954x 0-0075: registered 4 multiplexed busses for I2C mux =
pca9544=0D=0D
[   12.692209] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 27=0D=0D
[   12.749448] at24 7-0054: 1024 byte 24c08 EEPROM, writable, 1 bytes/write=
=0D=0D
[   12.751221] i2c i2c-1: Added multiplexed i2c bus 7=0D=0D
[   12.758081] i2c i2c-1: Added multiplexed i2c bus 8=0D=0D
[   12.795535] si570 9-005d: registered, current frequency 300000000 Hz=0D=
=0D
[   12.798892] i2c i2c-1: Added multiplexed i2c bus 9=0D=0D
[   12.842746] si570 10-005d: registered, current frequency 148500000 Hz=0D=
=0D
[   12.845526] i2c i2c-1: Added multiplexed i2c bus 10=0D=0D
[   12.851693] si5324 11-0069: si5328 probed=0D=0D
[   12.959905] si5324 11-0069: si5328 probe successful=0D=0D
[   12.962602] i2c i2c-1: Added multiplexed i2c bus 11=0D=0D
[   12.967159] i2c i2c-1: Added multiplexed i2c bus 12=0D=0D
[   12.971903] i2c i2c-1: Added multiplexed i2c bus 13=0D=0D
[   12.975988] i2c i2c-1: Added multiplexed i2c bus 14=0D=0D
[   12.977810] pca954x 1-0074: registered 8 multiplexed busses for I2C swit=
ch pca9548=0D=0D
[   12.986526] i2c i2c-1: Added multiplexed i2c bus 15=0D=0D
[   12.993749] i2c i2c-1: Added multiplexed i2c bus 16=0D=0D
[   12.998045] i2c i2c-1: Added multiplexed i2c bus 17=0D=0D
[   13.011805] i2c i2c-1: Added multiplexed i2c bus 18=0D=0D
[   13.016105] i2c i2c-1: Added multiplexed i2c bus 19=0D=0D
[   13.022575] i2c i2c-1: Added multiplexed i2c bus 20=0D=0D
[   13.030834] i2c i2c-1: Added multiplexed i2c bus 21=0D=0D
[   13.039436] i2c i2c-1: Added multiplexed i2c bus 22=0D=0D
[   13.040192] pca954x 1-0075: registered 8 multiplexed busses for I2C swit=
ch pca9548=0D=0D
[   13.043055] cdns-i2c ff030000.i2c: 400 kHz mmio ff030000 irq 28=0D=0D
[   13.059767] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer at (____pt=
rval____) with timeout 60s=0D=0D
[   13.071290] cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer at (____pt=
rval____) with timeout 10s=0D=0D
[   13.155397] OF: /amba/mmc@ff170000: could not find phandle=0D=0D
[   13.225799] mmc0: SDHCI controller on ff170000.mmc [ff170000.mmc] using =
ADMA 64-bit=0D=0D
[   13.256193] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D=0D
[   13.263536] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D=0D
[   13.305681] input: gpio-keys as /devices/platform/gpio-keys/input/input0=
=0D=0D
[   13.319376] rtc_zynqmp ffa60000.rtc: setting system clock to 2019-09-25 =
23:11:02 UTC (1569453062)=0D=0D
[   13.321397] of_cfs_init=0D=0D
[   13.322618] of_cfs_init: OK=0D=0D
[   13.323972] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database=0D=0D
[   13.332430] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D=0D
[   13.640023] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'=
=0D=0D
[   13.642385] clk: Not disabling unused clocks=0D=0D
[   13.643172] ALSA device list:=0D=0D
[   13.643558]   No soundcards found.=0D=0D
[   13.653880] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2=0D=0D
[   13.656345] cfg80211: failed to load regulatory.db=0D=0D
[   13.735227] Freeing unused kernel memory: 832K=0D=0D
[   13.773488] Run /init as init process=0D=0D
=0DINIT: version 2.88 booting=0D=0D=0D
[   13.983079] random: fast init done=0D=0D
Starting udev=0D=0D
[   16.738379] udevd[1953]: starting version 3.2.7=0D=0D
[   16.750045] random: udevd: uninitialized urandom read (16 bytes read)=0D=
=0D
[   16.755853] random: udevd: uninitialized urandom read (16 bytes read)=0D=
=0D
[   16.758589] random: udevd: uninitialized urandom read (16 bytes read)=0D=
=0D
[   16.816342] udevd[1953]: specified group 'kvm' unknown=0D=0D
[   16.886994] udevd[1954]: starting eudev-3.2.7=0D=0D
[   17.079037] udevd[1954]: specified group 'kvm' unknown=0D=0D
[   18.047529] urandom_read: 3 callbacks suppressed=0D=0D
[   18.048148] random: udevd: uninitialized urandom read (16 bytes read)=0D=
=0D
[   19.929071] random: udevd: uninitialized urandom read (16 bytes read)=0D=
=0D
[   37.429717] random: dd: uninitialized urandom read (512 bytes read)=0D=0D
Configuring packages on first boot....=0D=0D=0D
 (This may take several minutes. Please do not power off the machine.)=0D=
=0D=0D
Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...=0D=0D=0D
update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continuing=
)=0D=0D=0D
 Removing any system startup links for run-postinsts ...=0D=0D=0D
  /etc/rcS.d/S99run-postinsts=0D=0D=0D
=0DINIT: Entering runlevel: 5=0D=0D=0D=0D
Configuring network interfaces... [   42.089608] IPv6: ADDRCONF(NETDEV_UP):=
 eth0: link is not ready=0D=0D
udhcpc: started, v1.30.1=0D=0D=0D
udhcpc: sending discover=0D=0D=0D
[   43.202444] macb ff0e0000.ethernet eth0: link up (100/Full)=0D=0D
[   43.204166] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready=0D=0D
udhcpc: sending discover=0D=0D=0D
udhcpc: sending select for 10.0.5.15=0D=0D=0D
udhcpc: lease of 10.0.5.15 obtained, lease time 86400=0D=0D=0D
/etc/udhcpc.d/50default: Adding DNS 10.0.5.3=0D=0D=0D
done.=0D=0D=0D
Starting Dropbear SSH server: [   47.689556] random: dropbearkey: uninitial=
ized urandom read (32 bytes read)=0D=0D
Generating 2048 bit rsa key, this may take a while...=0D=0D=0D
Public key portion is:=0D=0D=0D
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmxEx8MqHJk6dl+uPH6JYn6sQJo0+Bf9qqpPe=
WzNHV/8CLtKnohuuv2aKj+Y1Nhi969+OYef9SY7KM6Gttb7i45a3tqtSomML/Ccnn26LcANdO9D=
kAoX48oukdRDIdqKIirD8c0eiKbj48oVcNcmoXfprIIKqnQktpk1y5tzX7dQJ8/8X5sBQ7BUw1p=
QuoToipO9hhjz+d5Yow+F8TfcmsI/2ffpPCjGy9jZll/h19YnLf7f16pNxm+GT5lOqIyxQr3BUn=
V4nYVhUG9Ae3Ke5pL9H/kX11saiGt21abwILSL8ek4IxqDWQADPmJuoJ42Jo6Znv8twY0BKCKsM=
cb+07 root@zcu102-zynqmp=0D=0D=0D
Fingerprint: sha1!! bf:ed:5d:2a:0e:fc:e6:6c:9b:db:3a:74:ba:91:12:f4:11:92:3=
6:d8=0D=0D=0D
dropbear.=0D=0D=0D
Starting syslogd/klogd: done=0D=0D=0D
Starting /usr/sbin/xenstored...=0D=0D=0D
Setting domain 0 name, domid and JSON config...=0D=0D=0D
WARNING: Failed to open connection to gnttab=0D=0D=0D
Done setting up Dom0=0D=0D=0D
Starting xenconsoled...=0D=0D=0D
Starting QEMU as disk backend for dom0=0D=0D=0D
/etc/rc5.d/S80xencommons: line 73: /usr/bin/qemu-system-i386: No such file =
or directory=0D=0D=0D
Starting domain watchdog daemon: xenwatchdogd startup=0D=0D=0D
=0D=0D=0D
[done]=0D=0D=0D
=0D=0D=0D
Poky (Yocto Project Reference Distro) 2.7.1 zcu102-zynqmp /dev/hvc0=0D=0D
=0D=0D=0D
=0Dzcu102-zynqmp login: root=0D=0D
rroot@zcu102-zynqmp:~# root=08 =08=08 =08=08 =08=08 =08powerof=07f=0D=0D
=07=0D=0D=0D
Broadcast message from root@zcu102-zynqmp (hvc0) (Wed Sep 25 23:11:53 2019)=
:=0D=0DThe system is going down for system halt NOW!=0D=0D=0D
root@zcu102-zynqmp:~# =0DINIT: Switching to runlevel: 0=0D=0D=0D
=0DINIT: Sending processes the TERM signal=0D=0D=0D
logout=0D=0D
Stopping Dropbear SSH server: stopped /usr/sbin/dropbear (pid 2194)=0D=0D
dropbear.=0D=0D
Stopping syslogd/klogd: stopped syslogd (pid 2202)=0D=0D
stopped klogd (pid 2205)=0D=0D
done=0D=0D
Deconfiguring network interfaces... [   68.520044] IPv6: ADDRCONF(NETDEV_UP=
): eth0: link is not ready=0D=0D
[   68.535851] macb ff0e0000.ethernet eth0: link up (100/Full)=0D=0D
[   68.550329] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready=0D=0D
done.=0D=0D
Stopping xenconsoled=0D=0D
Stopping QEMU=0D=0D
WARNING: Not stopping xenstored, as it cannot be restarted.=0D=0D
Stopping domain watchdog daemon: xenwatchdogd stop=0D=0D
=0D=0D
Shutting down Xen domains:[done]=0D=0D
Sending all processes the TERM signal...=0D=0D
Sending all processes the KILL signal...=0D=0D
Unmounting remote filesystems...=0D=0D
Deactivating swap...=0D=0D
Unmounting local filesystems...=0D=0D
[   82.799302] Console: switching to colour dummy device 80x25=0D=0D
[   82.847327] reboot: Power down=0D=0D
(XEN) Hardware Dom0 halted: halting machine=0D

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xen_bad_addr.log"
Content-Transfer-Encoding: quoted-printable

PMU Firmware 2019.1	May 25 2019   06:57:33=0D
PMU_ROM Version: xpbr-v8.1.0-0=0D
NOTICE:  ATF running on XCZUUNKN/QEMU v4/RTL0.0 at 0xfffea000=0D
NOTICE:  BL31: Secure code at 0x60000000=0D
NOTICE:  BL31: Non secure code at 0x10080000=0D
NOTICE:  BL31: v2.0(release):xilinx-v2018.3-720-g80d1c790=0D
NOTICE:  BL31: Built : 06:54:23, May 25 2019=0D
PMUFW:	v1.1=0D
=0D
=0D
U-Boot 2019.01 (May 25 2019 - 06:55:09 +0000)=0D
=0D
Model: ZynqMP ZCU102 Rev1.0=0D
Board: Xilinx ZynqMP=0D
DRAM:  4 GiB=0D
EL Level:	EL2=0D
Chip ID:	unknown=0D
MMC:   mmc@ff170000: 0=0D
Loading Environment from SPI Flash... SF: Detected n25q512a with page size =
512 Bytes, erase size 128 KiB, total 128 MiB=0D
*** Warning - bad CRC, using default environment=0D
=0D
In:    serial@ff000000=0D
Out:   serial@ff000000=0D
Err:   serial@ff000000=0D
Model: ZynqMP ZCU102 Rev1.0=0D
Board: Xilinx ZynqMP=0D
Bootmode: JTAG_MODE=0D
Reset reason:	EXTERNAL =0D
Net:   ZYNQ GEM: ff0e0000, phyaddr c, interface rgmii-id=0D
eth0: ethernet@ff0e0000=0D
U-BOOT for xilinx-zcu102-2019_1=0D
=0D
BOOTP broadcast 1=0D
DHCP client bound to address 10.0.5.15 (2 ms)=0D
Hit any key to stop autoboot:  4 =08=08=08 3 =08=08=08 0 =0D
ZynqMP> setenv serverip 10.0.5.2; tftpb 1280000 xen-qemu-mod.dtb; tftpb 0x8=
0000 yocto-Image; tftpb 1400000 xen-custom.ub; tftpb 9000000 yocto-rootfs.c=
pio.gz.ub; bootm 1400000 9000000 1280000 =0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-qemu-mod.dtb'.=0D
Load address: 0x1280000=0D
Loading: *=08###=0D
	 18.1 MiB/s=0D
done=0D
Bytes transferred =3D 38019 (9483 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'yocto-Image'.=0D
Load address: 0x80000=0D
Loading: *=08##############################################################=
###=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #########################################=0D
	 36.4 MiB/s=0D
done=0D
Bytes transferred =3D 18215424 (115f200 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-custom.ub'.=0D
Load address: 0x1400000=0D
Loading: *=08##############################################################=
###=0D
	 ####=0D
	 36.1 MiB/s=0D
done=0D
Bytes transferred =3D 984464 (f0590 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'yocto-rootfs.cpio.gz.ub'.=0D
Load address: 0x9000000=0D
Loading: *=08##############################################################=
###=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #################################################################=0D
	 #####################=0D
	 37.1 MiB/s=0D
done=0D
Bytes transferred =3D 9569188 (9203a4 hex)=0D
## Booting kernel from Legacy Image at 01400000 ...=0D
   Image Name:   =0D
   Image Type:   AArch64 Linux Kernel Image (uncompressed)=0D
   Data Size:    984400 Bytes =3D 961.3 KiB=0D
   Load Address: 01400000=0D
   Entry Point:  01400000=0D
   Verifying Checksum ... OK=0D
## Loading init Ramdisk from Legacy Image at 09000000 ...=0D
   Image Name:   =0D
   Image Type:   AArch64 Linux RAMDisk Image (gzip compressed)=0D
   Data Size:    9569124 Bytes =3D 9.1 MiB=0D
   Load Address: 09000000=0D
   Entry Point:  09000000=0D
   Verifying Checksum ... OK=0D
## Flattened Device Tree blob at 01280000=0D
   Booting using the fdt blob at 0x1280000=0D
   Loading Kernel Image ... OK=0D
   Loading Ramdisk to 076df000, end 07fff364 ... OK=0D
   Loading Device Tree to 00000000076d2000, end 00000000076de482 ... OK=0D
=0D
Starting kernel ...=0D
=0D
 Xen 4.13-unstable=0D
(XEN) Xen version 4.13-unstable (woods@xilinx.com) (aarch64-unknown-linux-g=
nu-gcc (crosstool-NG 1.24.0.6-afaf7b9) 8.3.0) debug=3Dy  Wed Sep 25 16:02:2=
6 PDT 2019=0D
(XEN) Latest ChangeSet: Tue Sep 24 15:46:48 2019 +0000 git:4333876=0D
(XEN) build-id: a026a3bc865f1c93f67de50e71b7aea86f79e5b9=0D
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4=
=0D
(XEN) 64-bit Execution:=0D
(XEN)   Processor Features: 1100000000002222 0000000000000000=0D
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32=0D
(XEN)     Extensions: FloatingPoint AdvancedSIMD=0D
(XEN)   Debug Features: 0000000010305106 0000000000000000=0D
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000=0D
(XEN)   Memory Model Features: 0000000000001122 0000000000000000=0D
(XEN)   ISA Features:  0000000000011120 0000000000000000=0D
(XEN) 32-bit Execution:=0D
(XEN)   Processor Features: 00001231:00011011=0D
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle=0D
(XEN)     Extensions: GenericTimer Security=0D
(XEN)   Debug Features: 03010066=0D
(XEN)   Auxiliary Features: 00000000=0D
(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211=0D
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121=
=0D
(XEN) Using SMC Calling Convention v1.1=0D
(XEN) Using PSCI v1.1=0D
(XEN) SMP: Allowing 4 CPUs=0D
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz=0D
(XEN) GICv2 initialization:=0D
(XEN)         gic_dist_addr=3D00000000f9010000=0D
(XEN)         gic_cpu_addr=3D00000000f9020000=0D
(XEN)         gic_hyp_addr=3D00000000f9040000=0D
(XEN)         gic_vcpu_addr=3D00000000f9060000=0D
(XEN)         gic_maintenance_irq=3D25=0D
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000=0D
(XEN) GICv2: 192 lines, 4 cpus (IID 00000000).=0D
(XEN) XSM Framework v1.0.0 initialized=0D
(XEN) Initialising XSM SILO mode=0D
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)=0D
(XEN) Initializing Credit2 scheduler=0D
(XEN)  load_precision_shift: 18=0D
(XEN)  load_window_shift: 30=0D
(XEN)  underload_balance_tolerance: 0=0D
(XEN)  overload_balance_tolerance: -3=0D
(XEN)  runqueues arrangement: socket=0D
(XEN)  cap enforcement granularity: 10ms=0D
(XEN) load tracking window length 1073741824 ns=0D
(XEN) Allocated console ring of 32 KiB.=0D
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU1=0D
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU2=0D
(XEN) CPU 1 booted.=0D
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU3=0D
(XEN) CPU 2 booted.=0D
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Brought up 4 CPUs=0D
(XEN) CPU 3 booted.=0D
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID=0D
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558=0D
(XEN) smmu: /smmu@fd800000: probing hardware configuration...=0D
(XEN) smmu: /smmu@fd800000: SMMUv2 with:=0D
(XEN) smmu: /smmu@fd800000: 	stage 2 translation=0D
(XEN) smmu: /smmu@fd800000: 	stream matching with 48 register groups, mask =
0x7fff=0D
(XEN) smmu: /smmu@fd800000: 	16 context banks (0 stage-2 only)=0D
(XEN) smmu: /smmu@fd800000: 	Stage-2: 40-bit IPA -> 48-bit PA=0D
(XEN) smmu: /smmu@fd800000: registered 26 master devices=0D
(XEN) I/O virtualisation enabled=0D
(XEN)  - Dom0 mode: Relaxed=0D
(XEN) Interrupt remapping enabled=0D
(XEN) Adding cpu 0 to runqueue 0=0D
(XEN)  First cpu on runqueue, activating=0D
(XEN) Adding cpu 1 to runqueue 0=0D
(XEN) Adding cpu 2 to runqueue 0=0D
(XEN) Adding cpu 3 to runqueue 0=0D
(XEN) alternatives: Patching with alt table 00000000002c3e68 -> 00000000002=
c4528=0D
(XEN) *** LOADING DOMAIN 0 ***=0D
(XEN) Loading d0 kernel from boot module @ 0000000000080000=0D
(XEN) Loading ramdisk from boot module @ 00000000076df000=0D
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:=0D
(XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)=0D
(XEN) Grant table range: 0x00000001400000-0x00000001440000=0D
(XEN) smmu: /smmu@fd800000: d0: p2maddr 0x000000087bf9a000=0D
(XEN) Allocating PPI 16 for event channel interrupt=0D
(XEN) Loading zImage from 0000000000080000 to 0000000020080000-000000002318=
0000=0D
(XEN) Loading dom0 initrd from 00000000076df000 to 0x0000000028200000-0x000=
0000028b20364=0D
(XEN) Loading dom0 DTB to 0x0000000028000000-0x0000000028008db3=0D
(XEN) Initial low memory virq threshold set at 0x4000 pages.=0D
(XEN) Std. Loglevel: All=0D
(XEN) Guest Loglevel: All=0D
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)=
=0D
(XEN) pg[0] MFN 01533 c=3D0x180000000000000 o=3D0 v=3D0x7ffff t=3D0=0D
(XEN) Xen BUG at page_alloc.c:1422=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021bfcc page_alloc.c#free_heap_pages+0x1b4/0x5ec=0D
(XEN) LR:     000000000021bfcc=0D
(XEN) SP:     00008000fbff7d10=0D
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 00000000002a1558  X1: 0000000000000068  X2: 0000000000000000=
=0D
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000012=
=0D
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f=
=0D
(XEN)      X9: 731f646b61606d54 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101=
=0D
(XEN)     X12: 0000000000000008 X13: 000000000027c8c0 X14: 0000000000000020=
=0D
(XEN)     X15: 0000000000000000 X16: 00000000002a3000 X17: 00000000002a3000=
=0D
(XEN)     X18: 00000000002a3000 X19: 0000000000000000 X20: 0000000000000000=
=0D
(XEN)     X21: 000000080004a328 X22: 0000000000000000 X23: 6db6db6db6db6db7=
=0D
(XEN)     X24: fffffff800000000 X25: 3d3d3d3d3d3d3d3d X26: 00000000002a3000=
=0D
(XEN)     X27: 00000000002a3000 X28: 00000000002a3000  FP: 00008000fbff7d10=
=0D
(XEN) =0D
(XEN)   VTCR_EL2: 80023558=0D
(XEN)  VTTBR_EL2: 0000000000000000=0D
(XEN) =0D
(XEN)  SCTLR_EL2: 30cd183d=0D
(XEN)    HCR_EL2: 0000000000000038=0D
(XEN)  TTBR0_EL2: 000000000152c000=0D
(XEN) =0D
(XEN)    ESR_EL2: f2000001=0D
(XEN)  HPFAR_EL2: 0000000000000000=0D
(XEN)    FAR_EL2: 0000000000000000=0D
(XEN) =0D
(XEN) Xen stack trace from sp=3D00008000fbff7d10:=0D
(XEN)    00008000fbff7d80 000000000021e6f0 000000080004a328 00000000000014b=
3=0D
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c0=
0=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 0000000d002a1118 00008000fbff7df0 000000000021e91=
4=0D
(XEN)    0000000000000002 0000000000000002 0000000000080000 000000000318000=
0=0D
(XEN)    000000000021e880 00000000002fa000 0000000003180000 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad9=
0=0D
(XEN)    00008000fbff7e00 00000000002b8354 00008000fbff7e50 00000000002b886=
c=0D
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b=
8=0D
(XEN)    00000000002d03c0 000000000021e880 00000000076df000 0000000007fff36=
4=0D
(XEN)    00008000fbff7ea0 00000000002609dc 00000000002a2000 000000000000000=
4=0D
(XEN)    00000000002a2380 000000000032d430 0000000000000004 0000000000296e5=
8=0D
(XEN)    0000000000000002 00000000002609d8 00000000002efde0 00000000002b94d=
4=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000000000000=0D
(XEN) Xen call trace:=0D
(XEN)    [<000000000021bfcc>] page_alloc.c#free_heap_pages+0x1b4/0x5ec (PC)=
=0D
(XEN)    [<000000000021bfcc>] page_alloc.c#free_heap_pages+0x1b4/0x5ec (LR)=
=0D
(XEN)    [<000000000021e6f0>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<000000000021e914>] init_domheap_pages+0x94/0x9c=0D
(XEN)    [<00000000002b8354>] 00000000002b8354=0D
(XEN)    [<00000000002b886c>] 00000000002b886c=0D
(XEN)    [<00000000002609dc>] setup.c#init_done+0x10/0x20=0D
(XEN)    [<00000000002b94d4>] 00000000002b94d4=0D
(XEN) =0D
(XEN) =0D
(XEN) ****************************************=0D
(XEN) Panic on CPU 0:=0D
(XEN) Xen BUG at page_alloc.c:1422=0D
(XEN) ****************************************=0D
(XEN) =0D
(XEN) Reboot in five seconds...=0D

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--VS++wcV0S1rZb1Fb--

