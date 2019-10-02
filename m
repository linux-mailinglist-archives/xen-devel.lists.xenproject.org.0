Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC7C9141
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 21:00:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFjnq-0001lM-6j; Wed, 02 Oct 2019 18:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VXk2=X3=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iFjno-0001lC-3O
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:56:44 +0000
X-Inumbo-ID: 5db173c0-e546-11e9-97fb-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::604]) by localhost (Halon) with ESMTPS
 id 5db173c0-e546-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 18:56:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6MWjSoEq3iAITdtTNz0pXtCZRQ3BMEw5lNQQmBofUDoO8aj8F+Jev8Sao133Patz/VB/pmHuoyQ0kM7dJFaYqJ3y1mEMQF8ehdcTF3XUMdvzvzNgWPPqv2hNjf/0qgkQciXlM6UV+aXZ7uiXWeedG7zG0wPWAW3TXj7GqAxui6Zrj4BW0Y+PczA1WqidgRrYyWVEWqKj5cX+sHWAnovHWyb7M1gzP3ACvdo0ES7yvTs+H65g0v5ZfbAGEcCsZPmlTOCLc5cgU50avRWgDIImTzfZAe6R47UYY1wkZTDBFbPUNPQCnDgLWD82p2JXt0IX09p7cySFZhkxOeRUo3Udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiwWArnwvtWAZWyAgdgE7nuSwKP+8tlLfW5A4efP/Vg=;
 b=YlBYyURooFYJYrpGQ2v69zYdqTAMuTpXaitRz7h5D4IkyyoZYct0kQWGXK5ih8FmnG4/QVbicqliBh7jyYXQiEPzbtJSf+A/+d4sZO44BCcesW/4RRkw0PVUZDSj035qSDpyKCEjQgxv4aJjUHLc3IR8VJe8ZZLKDw1ddNPJAyhv234JKKx9hf41ZKY+z6g1SNE5gwwozUB6DKFpxFk4DHFCReMF6kr5nBZMiYHyjtU4k8/eVfwxosvrn2nF8tD3oUVvA/G0ZIrwzY41PXjb7/5iWTLaDotLV3jGWC3VszQWOMG1VxLKYpC6R7LRTakyXfir2koL4VSSeTr+TMOIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiwWArnwvtWAZWyAgdgE7nuSwKP+8tlLfW5A4efP/Vg=;
 b=m1NSjIr9La1gdbZ37avjOs7akSrgTAe3ycX3yUj0NA/E3tuvVz93pjG8LLo7LGUR6CRr8Yw3JE/OTUB2D0En2kCx7nxa1y/pZUwZSp7RhuR12fit8t74mz5tMdcjo0R/C0hUnG3NaMI2Rnw7dAUVoApnUd0v/6nLYc6wFI3p5+s=
Received: from MWHPR02CA0006.namprd02.prod.outlook.com (2603:10b6:300:4b::16)
 by MN2PR02MB5999.namprd02.prod.outlook.com (2603:10b6:208:10d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:56:36 +0000
Received: from CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by MWHPR02CA0006.outlook.office365.com
 (2603:10b6:300:4b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:56:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT026.mail.protection.outlook.com (10.152.75.157) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Wed, 2 Oct 2019 18:56:36 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFjnf-0002OX-IP; Wed, 02 Oct 2019 11:56:35 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFjna-0006bQ-HB; Wed, 02 Oct 2019 11:56:30 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x92IuHOm032719; 
 Wed, 2 Oct 2019 11:56:17 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFjnN-0006ae-NN; Wed, 02 Oct 2019 11:56:17 -0700
Date: Wed, 2 Oct 2019 11:56:17 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191002185617.GA2644@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(199004)(189003)(106002)(1076003)(486006)(44832011)(11346002)(126002)(2616005)(446003)(70586007)(9786002)(426003)(336012)(305945005)(8676002)(70206006)(66576008)(81166006)(81156014)(5660300002)(6916009)(33656002)(36756003)(476003)(235185007)(356004)(6246003)(5024004)(14444005)(568964002)(478600001)(54906003)(186003)(21480400003)(26005)(53546011)(316002)(7696005)(44144004)(2476003)(71190400001)(229853002)(58126008)(36386004)(2906002)(86362001)(8936002)(4326008)(16586007)(76176011)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB5999; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a38575-24a3-4fe7-6c94-08d7476a401e
X-MS-TrafficTypeDiagnostic: MN2PR02MB5999:
X-Microsoft-Antispam-PRVS: <MN2PR02MB599963CEF6696FDE12458F1ED79C0@MN2PR02MB5999.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k66ACWf/JG1PmTFjlrs3z+vUGEHQ0GETxSnULwPgzHhrPlMCFGV8+ebyCpjWTk/F26aYSJl8xnfaE0NxppbTGEv2ho+AnZdg2X/rH0qUh8GDsoBJt6svHPWLZux5OGKIz8HN4d/3EjizajIxyiW1tgSwoeU2w6Ggp3Au+9HAIgRiOBwMbAm63cDnptUclzi2fDR0odqy71NkfMACY78sQI0yapkZ8mvsdhq5746SCmLpW4F5DOeiwdFIFlPJ3yFlaIE4XrDW3urwaiEI7vmiRkpEhKjPu7yj1Ba2DJSfI7bCx/7pYPoPnKUzm+5AAB6GIcWU8I8hDjt57Dt59zbSRwO0kQ7DUaBxdtI2Tg5qeai1TGlFh5QuTGU0X8XzXyGVOAj8L0RIgZvsk0X5LY0dkrg3ATnGBuUTWo2NDjSgdvo=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:56:36.0883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a38575-24a3-4fe7-6c94-08d7476a401e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5999
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/2/19 5:52 PM, Julien Grall wrote:
>On 10/2/19 1:32 AM, Brian Woods wrote:
>>Hello,
>
>Hi Brian,
>
>Thank you for report.
>
>I guess this Arm specific, right? If so, please try to CC
>the relevant maintainers and possibly add "arm" in the
>subject to avoid any delay (Xen-Devel has quite an high
>volume of e-mail!).
>
>May I also ask to avoiding sending attachment on the mailing
>list and  instead upload the log somewhere (e.g. pastebin,
>your own webserver...)?
>

I did include all the ARM maintainers, although I forgot to CC
Volodymyr.  Sorry about that.  Also, I'm not sure if this is strictly an
ARM or general Xen bug so I left ARM.  I guess I should have mentioned
that in the email though.

I prefer having them as attachments due to the fact I can see everything
in mutt. Although if there's a strong community consensus that logs
shouldn't be emailed as attachments, I will start using a pastebin like
service to post them.

>>
>>While testing some things out, I found a possible bug in Xen.  Xen would
>>successfully run when loaded (from u-boot) at some addresses but not
>>others.  I didn't observe this issue in 4.11 stable, so I did a bisect
>>and found that:
>>commit f60658c6ae47e74792e6cc48ea2effac8bb52826
>>Author: Julien Grall <julien.grall@arm.com>
>>Date:   Tue Dec 18 13:07:39 2018 +0000
>>
>>      xen/arm: Stop relocating Xen
>>
>>was what was causing it to fail when it was loaded to that certain
>>address.
>
>This patch is basically changing how Xen is using the
>physical address space. So it exercise more part of Xen
>code and most likely a red-herring :).
>
>However, the logs are quite interesting:
>
>(XEN) pg[0] MFN 01533 c=0x180000000000000 o=0 v=0x7ffff t=0
>
>If I am not mistaken, the page state is PGC_state_free.
>So this seems to suggest that the page were already
>handed over to the allocator.
>
>Would you mind to apply the patch below and paste the log?
>
>Hopefully, you see see two WARN_ON() before Xen is crashing.
>
>Note the patch is assuming the MFN will stay the same after
>the patch has been applied. If not, you may need to slightly
>tweak it.
>
>diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>index 7cb1bd368b..4bf0dbc727 100644
>--- a/xen/common/page_alloc.c
>+++ b/xen/common/page_alloc.c
>@@ -1389,6 +1389,9 @@ static void free_heap_pages(
>      for ( i = 0; i < (1 << order); i++ )
>      {
>+
>+        WARN_ON(mfn_x(page_to_mfn(pg + 1)) == 0x01533);
>+
>          /*
>           * Cannot assume that count_info == 0, as there are some corner cases
>           * where it isn't the case and yet it isn't a bug:
>
>Cheers,
>
>-- 
>Julien Grall

Attached are the logs of loading patched Xen at the good and bad
address.  It appears the MFN has stayed the same, although there's only
one WARN message for both the good and bad address.

-- 
Brian Woods

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="xen-git_52633db2c5ed-patched-good_addr.log"
Content-Transfer-Encoding: quoted-printable

PMU Firmware 2019.1	May 25 2019   06:57:33
PMU_ROM Version: xpbr-v8.1.0-0
NOTICE:  ATF running on XCZUUNKN/QEMU v4/RTL0.0 at 0xfffea000
NOTICE:  BL31: Secure code at 0x60000000
NOTICE:  BL31: Non secure code at 0x10080000
NOTICE:  BL31: v2.0(release):xilinx-v2018.3-720-g80d1c790
NOTICE:  BL31: Built : 06:54:23, May 25 2019
PMUFW:	v1.1


U-Boot 2019.01 (May 25 2019 - 06:55:09 +0000)

Model: ZynqMP ZCU102 Rev1.0
Board: Xilinx ZynqMP
DRAM:  4 GiB
EL Level:	EL2
Chip ID:	unknown
MMC:   mmc@ff170000: 0
Loading Environment from SPI Flash... SF: Detected n25q512a with page size =
512 Bytes, erase size 128 KiB, total 128 MiB
*** Warning - bad CRC, using default environment

In:    serial@ff000000
Out:   serial@ff000000
Err:   serial@ff000000
Model: ZynqMP ZCU102 Rev1.0
Board: Xilinx ZynqMP
Bootmode: JTAG_MODE
Reset reason:	EXTERNAL=20
Net:   ZYNQ GEM: ff0e0000, phyaddr c, interface rgmii-id
eth0: ethernet@ff0e0000
U-BOOT for xilinx-zcu102-2019_1

BOOTP broadcast 1
DHCP client bound to address 10.0.5.15 (1 ms)
Hit any key to stop autoboot:  4 =08=08=08 3 =08=08=08 0=20
ZynqMP> setenv serverip 10.0.5.2; tftpb 1280000 xen-qemu-mod.dtb; tftpb 0x8=
0000 yocto-Image; tftpb 4200000 xen-custom-patched-ga.ub; tftpb 9000000 yoc=
to-rootfs.cpio.gz.ub; bootm 4200000 9000000 1280000
Using ethernet@ff0e0000 device
TFTP from server 10.0.5.2; our IP address is 10.0.5.15
Filename 'xen-qemu-mod.dtb'.
Load address: 0x1280000
Loading: *=08###
	 18.1 MiB/s
done
Bytes transferred =3D 38019 (9483 hex)
Using ethernet@ff0e0000 device
TFTP from server 10.0.5.2; our IP address is 10.0.5.15
Filename 'yocto-Image'.
Load address: 0x80000
Loading: *=08##############################################################=
###
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #########################################
	 41.3 MiB/s
done
Bytes transferred =3D 18215424 (115f200 hex)
Using ethernet@ff0e0000 device
TFTP from server 10.0.5.2; our IP address is 10.0.5.15
Filename 'xen-custom-patched-ga.ub'.
Load address: 0x4200000
Loading: *=08##############################################################=
###
	 ####
	 42.7 MiB/s
done
Bytes transferred =3D 984464 (f0590 hex)
Using ethernet@ff0e0000 device
TFTP from server 10.0.5.2; our IP address is 10.0.5.15
Filename 'yocto-rootfs.cpio.gz.ub'.
Load address: 0x9000000
Loading: *=08##############################################################=
###
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #################################################################
	 #####################
	 41.5 MiB/s
done
Bytes transferred =3D 9569188 (9203a4 hex)
## Booting kernel from Legacy Image at 04200000 ...
   Image Name:  =20
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    984400 Bytes =3D 961.3 KiB
   Load Address: 04200000
   Entry Point:  04200000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 09000000 ...
   Image Name:  =20
   Image Type:   AArch64 Linux RAMDisk Image (gzip compressed)
   Data Size:    9569124 Bytes =3D 9.1 MiB
   Load Address: 09000000
   Entry Point:  09000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 01280000
   Booting using the fdt blob at 0x1280000
   Loading Kernel Image ... OK
   Loading Ramdisk to 076df000, end 07fff364 ... OK
   Loading Device Tree to 00000000076d2000, end 00000000076de482 ... OK

Starting kernel ...

 Xen 4.13-unstable
(XEN) Xen version 4.13-unstable (woods@xilinx.com) (aarch64-unknown-linux-g=
nu-gcc (crosstool-NG 1.24.0.6-afaf7b9) 8.3.0) debug=3Dy  Wed Oct  2 11:10:2=
9 PDT 2019
(XEN) Latest ChangeSet: Thu Sep 26 11:03:08 2019 +0100 git:52633db-dirty
(XEN) build-id: e6c172151e22766c92205cb9562ec14b33c7b6ed
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 1100000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00001231:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 4 CPUs
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=3D00000000f9010000
(XEN)         gic_cpu_addr=3D00000000f9020000
(XEN)         gic_hyp_addr=3D00000000f9040000
(XEN)         gic_vcpu_addr=3D00000000f9060000
(XEN)         gic_maintenance_irq=3D25
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000
(XEN) GICv2: 192 lines, 4 cpus (IID 00000000).
(XEN) XSM Framework v1.0.0 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Allocated console ring of 32 KiB.
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain
(XEN) Bringing up CPU1
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain
(XEN) Bringing up CPU2
(XEN) CPU 1 booted.
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
(XEN) Bringing up CPU3
(XEN) CPU 2 booted.
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain
(XEN) Brought up 4 CPUs
(XEN) CPU 3 booted.
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) smmu: /smmu@fd800000: probing hardware configuration...
(XEN) smmu: /smmu@fd800000: SMMUv2 with:
(XEN) smmu: /smmu@fd800000: 	stage 2 translation
(XEN) smmu: /smmu@fd800000: 	stream matching with 48 register groups, mask =
0x7fff
(XEN) smmu: /smmu@fd800000: 	16 context banks (0 stage-2 only)
(XEN) smmu: /smmu@fd800000: 	Stage-2: 40-bit IPA -> 48-bit PA
(XEN) smmu: /smmu@fd800000: registered 26 master devices
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) alternatives: Patching with alt table 00000000002c3e78 -> 00000000002=
c4538
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000000080000
(XEN) Loading ramdisk from boot module @ 00000000076df000
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)
(XEN) Grant table range: 0x00000004200000-0x00000004240000
(XEN) smmu: /smmu@fd800000: d0: p2maddr 0x000000087bf9a000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000000080000 to 0000000020080000-000000002318=
0000
(XEN) Loading dom0 initrd from 00000000076df000 to 0x0000000028200000-0x000=
0000028b20364
(XEN) Loading dom0 DTB to 0x0000000028000000-0x0000000028008db3
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Xen WARN at page_alloc.c:1393
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     000000000021bf74 page_alloc.c#free_heap_pages+0x15c/0x648
(XEN) LR:     0000000047ffffff
(XEN) SP:     00008000fbff7d10
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000001533  X1: 0000000000000000  X2: 000000080004a2f0
(XEN)      X3: 0000000000001533  X4: 0000000000001533  X5: 00000000002a34b8
(XEN)      X6: 00000000002a3000  X7: 00000000002a3000  X8: 00000000002a3000
(XEN)      X9: 0080000000000000 X10: 0000000000001533 X11: 0000000000000001
(XEN)     X12: 000000000007ffff X13: 0000000000000000 X14: 0000000000000000
(XEN)     X15: 00000000002a3488 X16: 0000000000000001 X17: 00000000002bcf54
(XEN)     X18: 0180000000000000 X19: 0000000000000000 X20: 000000080004a2f0
(XEN)     X21: 0000000000000000 X22: 00000000002a3000 X23: 6db6db6db6db6db7
(XEN)     X24: fffffff800000000 X25: 3d3d3d3d3d3d3d3d X26: 00000000002a3000
(XEN)     X27: 00000000002a3000 X28: 00000000002a3000  FP: 00008000fbff7d10
(XEN)=20
(XEN)   VTCR_EL2: 80023558
(XEN)  VTTBR_EL2: 0000000000000000
(XEN)=20
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 0000000000000038
(XEN)  TTBR0_EL2: 000000000432c000
(XEN)=20
(XEN)    ESR_EL2: f2000001
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN)=20
(XEN) Xen stack trace from sp=3D00008000fbff7d10:
(XEN)    00008000fbff7d80 000000000021e74c 000000080004a2f0 00000000000014b2
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c00
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db7
(XEN)    00000000002a10f8 000000010000000d 00008000fbff7df0 000000000021e970
(XEN)    0000000000000002 0000000000000002 0000000000080000 0000000003180000
(XEN)    000000000021e8dc 00000000002fa000 0000000003180000 00000000000fff00
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad90
(XEN)    00008000fbff7e00 00000000002b8398 00008000fbff7e50 00000000002b88b0
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b8
(XEN)    00000000002d03c0 000000000021e8dc 00000000076df000 0000000007fff364
(XEN)    00008000fbff7ea0 00000000002609dc 00000000002a2000 0000000000000004
(XEN)    00000000002a2380 000000000032d430 0000000000000004 0000000000296e40
(XEN)    0000000000000002 00000000002609d8 00000000002efde0 00000000002b9518
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<000000000021bf74>] page_alloc.c#free_heap_pages+0x15c/0x648 (PC)
(XEN)    [<0000000047ffffff>] 0000000047ffffff (LR)
(XEN)    [<000000000021e74c>] page_alloc.c#init_heap_pages+0x3d4/0x564
(XEN)    [<000000000021e970>] init_domheap_pages+0x94/0x9c
(XEN)    [<00000000002b8398>] 00000000002b8398
(XEN)    [<00000000002b88b0>] 00000000002b88b0
(XEN)    [<00000000002609dc>] setup.c#init_done+0x10/0x20
(XEN)    [<00000000002b9518>] 00000000002b9518
(XEN)=20
(XEN) Freed 332kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]=0D
[    0.000000] Linux version 4.19.0-xilinx-v2019.1 (oe-user@oe-host) (gcc v=
ersion 8.3.0 (GCC)) #1 SMP Mon Sep 16 21:16:49 UTC 2019=0D
[    0.000000] Machine model: ZynqMP ZCU102 Rev1.0=0D
[    0.000000] Xen 4.13 support found=0D
[    0.000000] efi: Getting EFI parameters from FDT:=0D
[    0.000000] efi: UEFI not found.=0D
[    0.000000] cma: Reserved 256 MiB at 0x0000000050000000=0D
[    0.000000] psci: probing for conduit method from DT.=0D
[    0.000000] psci: PSCIv1.1 detected in firmware.=0D
[    0.000000] psci: Using standard PSCI v0.2 function IDs=0D
[    0.000000] psci: Trusted OS migration not required=0D
[    0.000000] psci: SMC Calling Convention v1.1=0D
[    0.000000] random: get_random_bytes called from start_kernel+0x94/0x3f8=
 with crng_init=3D0=0D
[    0.000000] percpu: Embedded 23 pages/cpu @(____ptrval____) s53656 r8192=
 d32360 u94208=0D
[    0.000000] Detected VIPT I-cache on CPU0=0D
[    0.000000] CPU features: enabling workaround for ARM erratum 843419=0D
[    0.000000] CPU features: enabling workaround for ARM erratum 845719=0D
[    0.000000] Speculative Store Bypass Disable mitigation not required=0D
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 25856=
0=0D
[    0.000000] Kernel command line: console=3Dhvc0 earlycon=3Dxen earlyprin=
tk=3Dxen clk_ignore_unused=0D
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 b=
ytes)=0D
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 byte=
s)=0D
[    0.000000] Memory: 727836K/1048576K available (10812K kernel code, 636K=
 rwdata, 5436K rodata, 832K init, 316K bss, 58596K reserved, 262144K cma-re=
served)=0D
[    0.000000] rcu: Hierarchical RCU implementation.=0D
[    0.000000] rcu: 	RCU event tracing is enabled.=0D
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D=
4.=0D
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4=0D
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0=0D
[    0.000000] arch_timer: cp15 timer(s) running at 65.00MHz (virt).=0D
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0xefdb196da, max_idle_ns: 440795204367 ns=0D
[    0.000217] sched_clock: 56 bits at 65MHz, resolution 15ns, wraps every =
2199023255550ns=0D
[    0.016276] Console: colour dummy device 80x25=0D
[    0.045345] console [hvc0] enabled=0D
[    0.047368] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 130.00 BogoMIPS (lpj=3D260000)=0D
[    0.049836] pid_max: default: 32768 minimum: 301=0D
[    0.053384] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)=
=0D
[    0.054906] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 b=
ytes)=0D
[    0.105654] ASID allocator initialised with 32768 entries=0D
[    0.125498] xen:grant_table: Grant tables using version 1 layout=0D
[    0.127075] Grant table initialized=0D
[    0.129687] xen:events: Using FIFO-based ABI=0D
[    0.131356] Xen: initializing cpu0=0D
[    0.135383] rcu: Hierarchical SRCU implementation.=0D
[    0.143323] EFI services will not be available.=0D
[    0.146956] smp: Bringing up secondary CPUs ...=0D
(XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
[    0.156590] Detected VIPT I-cache on CPU1=0D
[    0.159640] Xen: initializing cpu1=0D
[    0.160434] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]=0D
[    0.176509] Detected VIPT I-cache on CPU2=0D
[    0.178259] Xen: initializing cpu2=0D
[    0.178630] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]=0D
[    0.190621] Detected VIPT I-cache on CPU3=0D
[    0.192847] Xen: initializing cpu3=0D
[    0.193330] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]=0D
[    0.198181] smp: Brought up 1 node, 4 CPUs=0D
[    0.204911] SMP: Total of 4 processors activated.=0D
[    0.205552] CPU features: detected: 32-bit EL0 Support=0D
[    0.210224] CPU: All CPU(s) started at EL1=0D
[    0.212376] alternatives: patching kernel code=0D
[    0.247484] devtmpfs: initialized=0D
[    0.283311] Duplicate name in base, renamed to "memory#1"=0D
[    0.300316] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns=0D
[    0.302974] futex hash table entries: 1024 (order: 4, 65536 bytes)=0D
[    0.337438] xor: measuring software checksum speed=0D
[    0.381803]    8regs     :  1587.000 MB/sec=0D
[    0.425268]    8regs_prefetch:   684.000 MB/sec=0D
[    0.468792]    32regs    :  1565.000 MB/sec=0D
[    0.511673]    32regs_prefetch:  1465.000 MB/sec=0D
[    0.512346] xor: using function: 8regs (1587.000 MB/sec)=0D
[    0.513401] pinctrl core: initialized pinctrl subsystem=0D
[    0.551434] NET: Registered protocol family 16=0D
[    0.566202] audit: initializing netlink subsys (disabled)=0D
[    0.576336] audit: type=3D2000 audit(0.492:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1=0D
[    0.606916] vdso: 2 pages (1 code @ (____ptrval____), 1 data @ (____ptrv=
al____))=0D
[    0.608857] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
=2E=0D
[    0.638635] DMA: preallocated 256 KiB pool for atomic allocations=0D
[    0.641464] xen:swiotlb_xen: Warning: only able to allocate 4 MB for sof=
tware IO TLB=0D
[    0.656432] software IO TLB: mapped [mem 0x4d400000-0x4d800000] (4MB)=0D
[    1.010642] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages=
=0D
[    1.108077] raid6: int64x1  gen()   677 MB/s=0D
[    1.189932] raid6: int64x1  xor()   558 MB/s=0D
[    1.272320] raid6: int64x2  gen()   874 MB/s=0D
[    1.353864] raid6: int64x2  xor()   615 MB/s=0D
[    1.434753] raid6: int64x4  gen()  1112 MB/s=0D
[    1.517246] raid6: int64x4  xor()   424 MB/s=0D
[    1.597107] raid6: int64x8  gen()   874 MB/s=0D
[    1.677083] raid6: int64x8  xor()   494 MB/s=0D
[    1.757937] raid6: neonx1   gen()   490 MB/s=0D
[    1.839161] raid6: neonx1   xor()   332 MB/s=0D
[    1.923838] raid6: neonx2   gen()   657 MB/s=0D
[    2.004087] raid6: neonx2   xor()   391 MB/s=0D
[    2.083694] raid6: neonx4   gen()   669 MB/s=0D
[    2.163533] raid6: neonx4   xor()   388 MB/s=0D
[    2.243046] raid6: neonx8   gen()   629 MB/s=0D
[    2.322797] raid6: neonx8   xor()   357 MB/s=0D
[    2.323419] raid6: using algorithm int64x4 gen() 1112 MB/s=0D
[    2.324423] raid6: .... xor() 424 MB/s, rmw enabled=0D
[    2.325388] raid6: using neon recovery algorithm=0D
[    2.331974] xen:balloon: Initialising balloon driver=0D
[    2.343275] SCSI subsystem initialized=0D
[    2.349000] usbcore: registered new interface driver usbfs=0D
[    2.350431] usbcore: registered new interface driver hub=0D
[    2.352342] usbcore: registered new device driver usb=0D
[    2.354163] media: Linux media interface: v0.10=0D
[    2.355835] videodev: Linux video capture interface: v2.00=0D
[    2.357489] pps_core: LinuxPPS API ver. 1 registered=0D
[    2.357906] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>=0D
[    2.358849] PTP clock support registered=0D
[    2.359852] EDAC MC: Ver: 3.0.0=0D
[    2.381642] zynqmp-ipi-mbox mailbox@ff990400: Probed ZynqMP IPI Mailbox =
driver.=0D
[    2.388510] FPGA manager framework=0D
[    2.393739] Advanced Linux Sound Architecture Driver Initialized.=0D
[    2.407536] Bluetooth: Core ver 2.22=0D
[    2.409051] NET: Registered protocol family 31=0D
[    2.409642] Bluetooth: HCI device and connection manager initialized=0D
[    2.411229] Bluetooth: HCI socket layer initialized=0D
[    2.411953] Bluetooth: L2CAP socket layer initialized=0D
[    2.412979] Bluetooth: SCO socket layer initialized=0D
[    2.429505] clocksource: Switched to clocksource arch_sys_counter=0D
[    2.434739] VFS: Disk quotas dquot_6.6.0=0D
[    2.435712] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)=0D
[    2.664359] NET: Registered protocol family 2=0D
[    2.679482] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, =
8192 bytes)=0D
[    2.681257] TCP established hash table entries: 8192 (order: 4, 65536 by=
tes)=0D
[    2.682673] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)=0D
[    2.683800] TCP: Hash tables configured (established 8192 bind 8192)=0D
[    2.687963] UDP hash table entries: 512 (order: 2, 16384 bytes)=0D
[    2.690009] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)=0D
[    2.693157] NET: Registered protocol family 1=0D
[    2.711877] RPC: Registered named UNIX socket transport module.=0D
[    2.713600] RPC: Registered udp transport module.=0D
[    2.714257] RPC: Registered tcp transport module.=0D
[    2.714825] RPC: Registered tcp NFSv4.1 backchannel transport module.=0D
[    2.731335] Trying to unpack rootfs image as initramfs...=0D
[    4.803118] Freeing initrd memory: 9344K=0D
[    4.826910] Initialise system trusted keyrings=0D
[    4.832770] workingset: timestamp_bits=3D62 max_order=3D18 bucket_order=
=3D0=0D
[    4.863940] NFS: Registering the id_resolver key type=0D
[    4.865607] Key type id_resolver registered=0D
[    4.866221] Key type id_legacy registered=0D
[    4.866824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...=
=0D
[    4.868225] jffs2: version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.=0D
[    6.435890] NET: Registered protocol family 38=0D
[    6.578906] Key type asymmetric registered=0D
[    6.579757] Asymmetric key parser 'x509' registered=0D
[    6.582136] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)=0D
[    6.583175] io scheduler noop registered=0D
[    6.583724] io scheduler deadline registered=0D
[    6.585119] io scheduler cfq registered (default)=0D
[    6.585695] io scheduler mq-deadline registered=0D
[    6.586162] io scheduler kyber registered=0D
[    6.616098] OF: /amba/dma@fd500000: could not find phandle=0D
[    6.618237] OF: /amba/dma@fd510000: could not find phandle=0D
[    6.619290] OF: /amba/dma@fd520000: could not find phandle=0D
[    6.621126] OF: /amba/dma@fd530000: could not find phandle=0D
[    6.622448] OF: /amba/dma@fd540000: could not find phandle=0D
[    6.623486] OF: /amba/dma@fd550000: could not find phandle=0D
[    6.625236] OF: /amba/dma@fd560000: could not find phandle=0D
[    6.626526] OF: /amba/dma@fd570000: could not find phandle=0D
[    6.641848] xen:xen_evtchn: Event-channel device installed=0D
[    8.355867] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled=0D
[    8.530569] brd: module loaded=0D
[    8.620346] loop: module loaded=0D
[    8.637359] mtdoops: mtd device (mtddev=3Dname/number) must be supplied=
=0D
[    8.645730] OF: /amba/spi@ff0f0000: could not find phandle=0D
[    8.667006] libphy: Fixed MDIO Bus: probed=0D
[    8.689995] tun: Universal TUN/TAP device driver, 1.6=0D
[    8.713929] CAN device driver interface=0D
[    8.726478] xen_netfront: Initialising Xen virtual ethernet driver=0D
[    8.728323] usbcore: registered new interface driver asix=0D
[    8.731938] usbcore: registered new interface driver ax88179_178a=0D
[    8.733854] usbcore: registered new interface driver cdc_ether=0D
[    8.734950] usbcore: registered new interface driver net1080=0D
[    8.735979] usbcore: registered new interface driver cdc_subset=0D
[    8.738710] usbcore: registered new interface driver zaurus=0D
[    8.740138] usbcore: registered new interface driver cdc_ncm=0D
[    8.757551] usbcore: registered new interface driver uas=0D
[    8.759160] usbcore: registered new interface driver usb-storage=0D
[    8.778957] rtc_zynqmp ffa60000.rtc: rtc core: registered ffa60000.rtc a=
s rtc0=0D
[    8.782224] i2c /dev entries driver=0D
[    8.823428] usbcore: registered new interface driver uvcvideo=0D
[    8.823978] USB Video Class driver (1.1.1)=0D
[    8.842880] Bluetooth: HCI UART driver ver 2.3=0D
[    8.843614] Bluetooth: HCI UART protocol H4 registered=0D
[    8.844239] Bluetooth: HCI UART protocol BCSP registered=0D
[    8.847159] Bluetooth: HCI UART protocol LL registered=0D
[    8.847927] Bluetooth: HCI UART protocol ATH3K registered=0D
[    8.849308] Bluetooth: HCI UART protocol Three-wire (H5) registered=0D
[    8.851237] Bluetooth: HCI UART protocol Intel registered=0D
[    8.852348] Bluetooth: HCI UART protocol QCA registered=0D
[    8.854281] usbcore: registered new interface driver bcm203x=0D
[    8.855322] usbcore: registered new interface driver bpa10x=0D
[    8.857047] usbcore: registered new interface driver bfusb=0D
[    8.858321] usbcore: registered new interface driver btusb=0D
[    8.859154] Bluetooth: Generic Bluetooth SDIO driver ver 0.1=0D
[    8.861216] usbcore: registered new interface driver ath3k=0D
[    8.865246] EDAC MC: ECC not enabled=0D
[    8.868148] EDAC ZynqMP-OCM: ECC not enabled - Disabling EDAC driver=0D
[    8.873982] cpu cpu0: failed to get clock: -2=0D
[    8.874693] cpufreq-dt: probe of cpufreq-dt failed with error -2=0D
[    8.880159] sdhci: Secure Digital Host Controller Interface driver=0D
[    8.881536] sdhci: Copyright(c) Pierre Ossman=0D
[    8.881881] sdhci-pltfm: SDHCI platform and OF driver helper=0D
[    8.896109] ledtrig-cpu: registered to indicate activity on CPUs=0D
[    8.900253] zynqmp_firmware_probe Platform Management API v1.1=0D
[    8.902029] zynqmp_firmware_probe Trustzone version v1.0=0D
[    9.039752] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: zynqmp pinc=
trl initialized=0D
[    9.748137] zynqmp_clk_mux_get_parent() getparent failed for clock: lpd_=
wdt, ret =3D -22=0D
[    9.763240] alg: No test for xilinx-zynqmp-aes (zynqmp-aes)=0D
[    9.766820] zynqmp_aes zynqmp_aes: AES Successfully Registered=0D
[    9.766820] =0D=0D
[    9.778483] alg: No test for xilinx-keccak-384 (zynqmp-keccak-384)=0D
[    9.787719] alg: No test for xilinx-zynqmp-rsa (zynqmp-rsa)=0D
[    9.795869] usbcore: registered new interface driver usbhid=0D
[    9.796326] usbhid: USB HID core driver=0D
[    9.858271] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered=0D
[    9.870760] usbcore: registered new interface driver snd-usb-audio=0D
[    9.895771] pktgen: Packet Generator for packet performance testing. Ver=
sion: 2.75=0D
[    9.928398] Initializing XFRM netlink socket=0D
[    9.931239] NET: Registered protocol family 10=0D
[    9.950959] Segment Routing with IPv6=0D
[    9.955471] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver=0D
[    9.965184] NET: Registered protocol family 17=0D
[    9.966169] NET: Registered protocol family 15=0D
[    9.967579] bridge: filtering via arp/ip/ip6tables is no longer availabl=
e by default. Update your scripts to load br_netfilter if you need this.=0D
[    9.972192] can: controller area network core (rev 20170425 abi 9)=0D
[    9.974563] NET: Registered protocol family 29=0D
[    9.975252] can: raw protocol (rev 20170425)=0D
[    9.975758] can: broadcast manager protocol (rev 20170425 t)=0D
[    9.977123] can: netlink gateway (rev 20170425) max_hops=3D1=0D
[    9.981998] Bluetooth: RFCOMM TTY layer initialized=0D
[    9.983012] Bluetooth: RFCOMM socket layer initialized=0D
[    9.983736] Bluetooth: RFCOMM ver 1.11=0D
[    9.984250] Bluetooth: BNEP (Ethernet Emulation) ver 1.3=0D
[    9.985566] Bluetooth: BNEP filters: protocol multicast=0D
[    9.986232] Bluetooth: BNEP socket layer initialized=0D
[    9.986774] Bluetooth: HIDP (Human Interface Emulation) ver 1.2=0D
[    9.987383] Bluetooth: HIDP socket layer initialized=0D
[    9.991231] 9pnet: Installing 9P2000 support=0D
[    9.992011] Key type dns_resolver registered=0D
[   10.012281] registered taskstats version 1=0D
[   10.013850] Loading compiled-in X.509 certificates=0D
[   10.023245] Btrfs loaded, crc32c=3Dcrc32c-generic=0D
[   10.098624] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 42, base=
_baud =3D 2479910) is a xuartps=0D
[   10.146727] of-fpga-region fpga-full: FPGA Region probed=0D
[   10.166876] nwl-pcie fd0e0000.pcie: Link is UP=0D
[   10.168137] nwl-pcie fd0e0000.pcie: host bridge /amba/pcie@fd0e0000 rang=
es:=0D
[   10.170369] nwl-pcie fd0e0000.pcie:   MEM 0xe0000000..0xefffffff -> 0xe0=
000000=0D
[   10.171373] nwl-pcie fd0e0000.pcie:   MEM 0x600000000..0x7ffffffff -> 0x=
600000000=0D
[   10.186511] nwl-pcie fd0e0000.pcie: PCI host bridge to bus 0000:00=0D
[   10.187575] pci_bus 0000:00: root bus resource [bus 00-ff]=0D
[   10.188827] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xeffffff=
f]=0D
[   10.189815] pci_bus 0000:00: root bus resource [mem 0x600000000-0x7fffff=
fff pref]=0D
[   10.217470] xilinx-dpdma fd4c0000.dma: Xilinx DPDMA engine is probed=0D
[   10.219360] OF: /amba/dma@fd500000: could not find phandle=0D
[   10.227686] xilinx-zynqmp-dma fd500000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.230458] OF: /amba/dma@fd510000: could not find phandle=0D
[   10.238046] xilinx-zynqmp-dma fd510000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.239811] OF: /amba/dma@fd520000: could not find phandle=0D
[   10.243651] xilinx-zynqmp-dma fd520000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.246315] OF: /amba/dma@fd530000: could not find phandle=0D
[   10.250006] xilinx-zynqmp-dma fd530000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.251912] OF: /amba/dma@fd540000: could not find phandle=0D
[   10.255609] xilinx-zynqmp-dma fd540000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.258499] OF: /amba/dma@fd550000: could not find phandle=0D
[   10.262115] xilinx-zynqmp-dma fd550000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.264056] OF: /amba/dma@fd560000: could not find phandle=0D
[   10.267843] xilinx-zynqmp-dma fd560000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.270607] OF: /amba/dma@fd570000: could not find phandle=0D
[   10.274170] xilinx-zynqmp-dma fd570000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.283101] xilinx-zynqmp-dma ffa80000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.288214] xilinx-zynqmp-dma ffa90000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.293746] xilinx-zynqmp-dma ffaa0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.298550] xilinx-zynqmp-dma ffab0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.303042] xilinx-zynqmp-dma ffac0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.307991] xilinx-zynqmp-dma ffad0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.313378] xilinx-zynqmp-dma ffae0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.318320] xilinx-zynqmp-dma ffaf0000.dma: ZynqMP DMA driver Probe succ=
ess=0D
[   10.329804] xilinx-psgtr fd400000.zynqmp_phy: Lane:1 type:8 protocol:4 p=
ll_locked:yes=0D
[   10.397093] zynqmp_clk_divider_set_rate() set divider failed for ams_ref=
_div1, ret =3D -13=0D
[   10.482227] xilinx-dp-snd-codec fd4a0000.zynqmp-display:zynqmp_dp_snd_co=
dec0: Failed to get required clock freq=0D
[   10.485461] xilinx-dp-snd-codec: probe of fd4a0000.zynqmp-display:zynqmp=
_dp_snd_codec0 failed with error -22=0D
[   10.491249] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm0: Xilinx DisplayPort Sou=
nd PCM probed=0D
[   10.496176] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm1: Xilinx DisplayPort Sou=
nd PCM probed=0D
[   10.502904] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D
[   10.507728] OF: graph: no port node found in /amba/zynqmp-display@fd4a00=
00=0D
[   10.515543] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).=
=0D
[   10.516280] [drm] No driver support for vblank timestamp query.=0D
[   10.522798] xlnx-drm xlnx-drm.0: bound fd4a0000.zynqmp-display (ops 0xff=
ffff8008bcf5e0)=0D
[   10.758976] Console: switching to colour frame buffer device 128x48=0D
[   10.790492] zynqmp-display fd4a0000.zynqmp-display: fb0:  frame buffer d=
evice=0D
[   10.800163] [drm] Initialized xlnx 1.0.0 20130509 for fd4a0000.zynqmp-di=
splay on minor 0=0D
[   10.803223] zynqmp-display fd4a0000.zynqmp-display: ZynqMP DisplayPort S=
ubsystem driver probed=0D
[   10.819834] xilinx-psgtr fd400000.zynqmp_phy: Lane:3 type:3 protocol:2 p=
ll_locked:yes=0D
[   10.825846] ahci-ceva fd0c0000.ahci: AHCI 0001.0000 32 slots 2 ports 1.5=
 Gbps 0x3 impl platform mode=0D
[   10.827139] ahci-ceva fd0c0000.ahci: flags: 64bit ncq only =0D
[   10.858637] scsi host0: ahci-ceva=0D
[   10.871948] scsi host1: ahci-ceva=0D
[   10.878216] ata1: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x100 irq 40=0D
[   10.879253] ata2: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x180 irq 40=0D
[   10.883469] OF: /amba/spi@ff0f0000: could not find phandle=0D
[   10.967945] m25p80 spi0.0: n25q512a (131072 Kbytes)=0D
[   10.971015] 3 fixed-partitions partitions found on MTD device spi0.0=0D
[   10.971889] Creating 3 MTD partitions on "spi0.0":=0D
[   10.973253] 0x000000000000-0x000001e00000 : "boot"=0D
[   10.991685] 0x000001e00000-0x000001e40000 : "bootenv"=0D
[   11.003866] 0x000001e40000-0x000004240000 : "kernel"=0D
[   11.119185] OF: /amba/ethernet@ff0e0000: could not find phandle=0D
[   11.131974] macb ff0e0000.ethernet: Not enabling partial store and forwa=
rd=0D
[   11.134034] macb: GEM doesn't support hardware ptp.=0D
[   11.147079] libphy: MACB_mii_bus: probed=0D
[   11.206720] ata2: SATA link down (SStatus 0 SControl 300)=0D
[   11.211945] ata1: SATA link down (SStatus 0 SControl 300)=0D
[   11.378354] Marvell 88E1118 ff0e0000.ethernet-ffffffff:0c: attached PHY =
driver [Marvell 88E1118] (mii_bus:phy_addr=3Dff0e0000.ethernet-ffffffff:0c,=
 irq=3DPOLL)=0D
[   11.380341] macb ff0e0000.ethernet eth0: Cadence GEM rev 0x40070106 at 0=
xff0e0000 irq 25 (00:0a:35:00:22:01)=0D
[   11.390180] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM=0D
[   11.398335] xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM=0D
[   11.403935] xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM=0D
[   11.410755] xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM=0D
[   11.524153] OF: /amba/usb0@ff9d0000/dwc3@fe200000: could not find phandl=
e=0D
[   11.531584] dwc3 fe200000.dwc3: Failed to get clk 'ref': -2=0D
[   11.559665] dwc3 fe200000.dwc3: Configuration mismatch. dr_mode forced t=
o gadget=0D
[   11.563198] dwc3 fe200000.dwc3: this is not a DesignWare USB3 DRD Core=0D
[   11.564318] dwc3 fe200000.dwc3: failed to initialize core=0D
[   11.602413] pca953x 0-0020: 0-0020 supply vcc not found, using dummy reg=
ulator=0D
[   11.605391] pca953x 0-0020: Linked as a consumer to regulator.0=0D
[   11.627293] pca953x 0-0021: 0-0021 supply vcc not found, using dummy reg=
ulator=0D
[   11.629484] pca953x 0-0021: Linked as a consumer to regulator.0=0D
[   11.686379] ina2xx 3-0040: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.695040] ina2xx 3-0041: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.703031] ina2xx 3-0042: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.710657] ina2xx 3-0043: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.719314] ina2xx 3-0044: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.727333] ina2xx 3-0045: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.737689] ina2xx 3-0046: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.746597] ina2xx 3-0047: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.755405] ina2xx 3-004a: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.766625] ina2xx 3-004b: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.769373] i2c i2c-0: Added multiplexed i2c bus 3=0D
[   11.784198] ina2xx 4-0040: power monitor ina226 (Rshunt =3D 2000 uOhm)=0D
[   11.792171] ina2xx 4-0041: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.803184] ina2xx 4-0042: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.813571] ina2xx 4-0043: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.821859] ina2xx 4-0044: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.830188] ina2xx 4-0045: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.839667] ina2xx 4-0046: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.851624] ina2xx 4-0047: power monitor ina226 (Rshunt =3D 5000 uOhm)=0D
[   11.854226] i2c i2c-0: Added multiplexed i2c bus 4=0D
[   11.904851] max20751 5-0072: Failed to identify chip capabilities=0D
[   11.932196] max20751 5-0073: Failed to identify chip capabilities=0D
[   11.935110] i2c i2c-0: Added multiplexed i2c bus 5=0D
[   11.939197] i2c i2c-0: Added multiplexed i2c bus 6=0D
[   11.940073] pca954x 0-0075: registered 4 multiplexed busses for I2C mux =
pca9544=0D
[   11.942937] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 27=0D
[   11.999065] at24 7-0054: 1024 byte 24c08 EEPROM, writable, 1 bytes/write=
=0D
[   12.001758] i2c i2c-1: Added multiplexed i2c bus 7=0D
[   12.007717] i2c i2c-1: Added multiplexed i2c bus 8=0D
[   12.059690] si570 9-005d: registered, current frequency 300000000 Hz=0D
[   12.063051] i2c i2c-1: Added multiplexed i2c bus 9=0D
[   12.121008] si570 10-005d: registered, current frequency 148500000 Hz=0D
[   12.122840] i2c i2c-1: Added multiplexed i2c bus 10=0D
[   12.129826] si5324 11-0069: si5328 probed=0D
[   12.287060] si5324 11-0069: si5328 probe successful=0D
[   12.289462] i2c i2c-1: Added multiplexed i2c bus 11=0D
[   12.293672] i2c i2c-1: Added multiplexed i2c bus 12=0D
[   12.297890] i2c i2c-1: Added multiplexed i2c bus 13=0D
[   12.301478] i2c i2c-1: Added multiplexed i2c bus 14=0D
[   12.301998] pca954x 1-0074: registered 8 multiplexed busses for I2C swit=
ch pca9548=0D
[   12.311443] i2c i2c-1: Added multiplexed i2c bus 15=0D
[   12.315759] i2c i2c-1: Added multiplexed i2c bus 16=0D
[   12.321810] i2c i2c-1: Added multiplexed i2c bus 17=0D
[   12.334666] i2c i2c-1: Added multiplexed i2c bus 18=0D
[   12.338986] i2c i2c-1: Added multiplexed i2c bus 19=0D
[   12.343388] i2c i2c-1: Added multiplexed i2c bus 20=0D
[   12.347989] i2c i2c-1: Added multiplexed i2c bus 21=0D
[   12.352448] i2c i2c-1: Added multiplexed i2c bus 22=0D
[   12.354005] pca954x 1-0075: registered 8 multiplexed busses for I2C swit=
ch pca9548=0D
[   12.355843] cdns-i2c ff030000.i2c: 400 kHz mmio ff030000 irq 28=0D
[   12.366545] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer at (____pt=
rval____) with timeout 60s=0D
[   12.374440] cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer at (____pt=
rval____) with timeout 10s=0D
[   12.453831] OF: /amba/mmc@ff170000: could not find phandle=0D
[   12.538264] mmc0: SDHCI controller on ff170000.mmc [ff170000.mmc] using =
ADMA 64-bit=0D
[   12.566543] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D
[   12.571620] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D
[   12.607038] input: gpio-keys as /devices/platform/gpio-keys/input/input0=
=0D
[   12.619691] rtc_zynqmp ffa60000.rtc: setting system clock to 2019-10-02 =
18:20:00 UTC (1570040400)=0D
[   12.621436] of_cfs_init=0D
[   12.622383] of_cfs_init: OK=0D
[   12.623829] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database=0D
[   12.631679] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: ASoC: CPU DAI (null) not registered=0D
[   12.862218] random: fast init done=0D
[   12.926338] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'=0D
[   12.927737] clk: Not disabling unused clocks=0D
[   12.929489] ALSA device list:=0D
[   12.930085]   No soundcards found.=0D
[   12.939427] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2=0D
[   12.941786] cfg80211: failed to load regulatory.db=0D
[   13.015749] Freeing unused kernel memory: 832K=0D
[   13.058596] Run /init as init process=0D
=0DINIT: version 2.88 booting=0D=0D
Starting udev=0D
[   15.606551] udevd[1953]: starting version 3.2.7=0D
[   15.616897] random: udevd: uninitialized urandom read (16 bytes read)=0D
[   15.622933] random: udevd: uninitialized urandom read (16 bytes read)=0D
[   15.625146] random: udevd: uninitialized urandom read (16 bytes read)=0D
[   15.678010] udevd[1953]: specified group 'kvm' unknown=0D
[   15.735912] udevd[1954]: starting eudev-3.2.7=0D
[   16.264333] udevd[1954]: specified group 'kvm' unknown=0D
[   16.764968] urandom_read: 3 callbacks suppressed=0D
[   16.767822] random: udevd: uninitialized urandom read (16 bytes read)=0D
[   17.403232] random: udevd: uninitialized urandom read (16 bytes read)=0D
[   22.451641] hrtimer: interrupt took 21946539 ns=0D
[   33.878490] random: dd: uninitialized urandom read (512 bytes read)=0D
Configuring packages on first boot....=0D=0D
 (This may take several minutes. Please do not power off the machine.)=0D=0D
Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...=0D=0D
update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continuing=
)=0D=0D
 Removing any system startup links for run-postinsts ...=0D=0D
  /etc/rcS.d/S99run-postinsts=0D=0D
=0DINIT: Entering runlevel: 5=0D=0D=0D
Configuring network interfaces... [   37.854981] IPv6: ADDRCONF(NETDEV_UP):=
 eth0: link is not ready=0D
udhcpc: started, v1.30.1=0D=0D
udhcpc: sending discover=0D=0D
[   38.950846] macb ff0e0000.ethernet eth0: link up (100/Full)=0D
[   38.952122] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready=0D
udhcpc: sending discover=0D=0D
udhcpc: sending select for 10.0.5.15=0D=0D
udhcpc: lease of 10.0.5.15 obtained, lease time 86400=0D=0D
/etc/udhcpc.d/50default: Adding DNS 10.0.5.3=0D=0D
done.=0D=0D
Starting Dropbear SSH server: [   43.219974] random: dropbearkey: uninitial=
ized urandom read (32 bytes read)=0D
Generating 2048 bit rsa key, this may take a while...=0D=0D
Public key portion is:=0D=0D
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDn35aPVMyUXAyftLf4UMbZRdACsWmQ4c5S4Ai=
4QXcbsCT1ngfKnwhojNH7MBG7ElrI6DeyP5PTGxsM85TyCdU2HXMfJAcC8p+Ly8xq1jPjBV3t/f=
UD/4t1mJ1BUL8SDPEXYJYNq8wyDoSqQ+NnGZIke6uf40vsjnfgSEYuaCOePyDLSjrhO7SkbZdY/=
F4ffTSSGYS5phluPWIAgz87m8g50JKWQZIi99vrGR7N7my8yxMxSlAwMKXpO0Oj1qmaF7J86Jjf=
ZEXu+Tz+xNYYlHUK6+1o1tZTK4yVphn9fOmoRLBWwyiPtQLiiqx4B2I1yAgMXrQPcLI2Qz8IH6N=
DVOhV root@zcu102-zynqmp=0D=0D
Fingerprint: sha1!! 75:11:3a:1c:83:8c:0d:fc:91:4d:09:18:bc:ac:32:cc:5a:0e:4=
e:44=0D=0D
dropbear.=0D=0D
Starting syslogd/klogd: done=0D=0D
Starting /usr/sbin/xenstored...=0D=0D
Setting domain 0 name, domid and JSON config...=0D=0D
WARNING: Failed to open connection to gnttab=0D=0D
Done setting up Dom0=0D=0D
Starting xenconsoled...=0D=0D
Starting QEMU as disk backend for dom0=0D=0D
/etc/rc5.d/S80xencommons: line 73: /usr/bin/qemu-system-i386: No such file =
or directory=0D=0D
Starting domain watchdog daemon: xenwatchdogd startup=0D=0D
=0D=0D
[done]=0D=0D
=0D=0D
Poky (Yocto Project Reference Distro) 2.7.1 zcu102-zynqmp /dev/hvc0=0D
=0D=0D
=0Dzcu102-zynqmp login:=20
--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xen-git_52633db2c5ed-patched-bad_addr.log"
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
0000 yocto-Image; tftpb 1400000 xen-custom-patched-ba.ub; tftpb 9000000 yoc=
to-rootfs.cpio.gz.ub; bootm 1400000 9000000 1280000=0D
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
	 44.9 MiB/s=0D
done=0D
Bytes transferred =3D 18215424 (115f200 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-custom-patched-ba.ub'.=0D
Load address: 0x1400000=0D
Loading: *=08##############################################################=
###=0D
	 ####=0D
	 40.8 MiB/s=0D
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
	 42.1 MiB/s=0D
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
nu-gcc (crosstool-NG 1.24.0.6-afaf7b9) 8.3.0) debug=3Dy  Wed Oct  2 11:10:2=
9 PDT 2019=0D
(XEN) Latest ChangeSet: Thu Sep 26 11:03:08 2019 +0100 git:52633db-dirty=0D
(XEN) build-id: e6c172151e22766c92205cb9562ec14b33c7b6ed=0D
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
(XEN) alternatives: Patching with alt table 00000000002c3e78 -> 00000000002=
c4538=0D
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
(XEN) Xen WARN at page_alloc.c:1393=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021bf74 page_alloc.c#free_heap_pages+0x15c/0x648=0D
(XEN) LR:     0000000047ffffff=0D
(XEN) SP:     00008000fbff7d10=0D
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 0000000000001533  X1: 0000000000000000  X2: 000000080004a2f0=
=0D
(XEN)      X3: 0000000000001533  X4: 0000000000001533  X5: 00000000002a34b8=
=0D
(XEN)      X6: 00000000002a3000  X7: 00000000002a3000  X8: 00000000002a3000=
=0D
(XEN)      X9: 0080000000000000 X10: 0000000000001533 X11: 0000000000000001=
=0D
(XEN)     X12: 000000000007ffff X13: 0000000000000000 X14: 0000000000000000=
=0D
(XEN)     X15: 00000000002a3488 X16: 0000000000000001 X17: 00000000002bcf54=
=0D
(XEN)     X18: 0180000000000000 X19: 0000000000000000 X20: 000000080004a2f0=
=0D
(XEN)     X21: 0000000000000000 X22: 00000000002a3000 X23: 6db6db6db6db6db7=
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
(XEN)    00008000fbff7d80 000000000021e74c 000000080004a2f0 00000000000014b=
2=0D
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c0=
0=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 000000010000000d 00008000fbff7df0 000000000021e97=
0=0D
(XEN)    0000000000000002 0000000000000002 0000000000080000 000000000318000=
0=0D
(XEN)    000000000021e8dc 00000000002fa000 0000000003180000 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad9=
0=0D
(XEN)    00008000fbff7e00 00000000002b8398 00008000fbff7e50 00000000002b88b=
0=0D
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b=
8=0D
(XEN)    00000000002d03c0 000000000021e8dc 00000000076df000 0000000007fff36=
4=0D
(XEN)    00008000fbff7ea0 00000000002609dc 00000000002a2000 000000000000000=
4=0D
(XEN)    00000000002a2380 000000000032d430 0000000000000004 0000000000296e4=
0=0D
(XEN)    0000000000000002 00000000002609d8 00000000002efde0 00000000002b951=
8=0D
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
(XEN)    [<000000000021bf74>] page_alloc.c#free_heap_pages+0x15c/0x648 (PC)=
=0D
(XEN)    [<0000000047ffffff>] 0000000047ffffff (LR)=0D
(XEN)    [<000000000021e74c>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<000000000021e970>] init_domheap_pages+0x94/0x9c=0D
(XEN)    [<00000000002b8398>] 00000000002b8398=0D
(XEN)    [<00000000002b88b0>] 00000000002b88b0=0D
(XEN)    [<00000000002609dc>] setup.c#init_done+0x10/0x20=0D
(XEN)    [<00000000002b9518>] 00000000002b9518=0D
(XEN) =0D
(XEN) pg[0] MFN 01533 c=3D0x180000000000000 o=3D0 v=3D0x7ffff t=3D0=0D
(XEN) Xen BUG at page_alloc.c:1425=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021bff4 page_alloc.c#free_heap_pages+0x1dc/0x648=0D
(XEN) LR:     000000000021bff4=0D
(XEN) SP:     00008000fbff7d10=0D
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 00000000002a1558  X1: 0000000000000108  X2: 0000000000000000=
=0D
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000012=
=0D
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f=
=0D
(XEN)      X9: 731f646b61606d54 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101=
=0D
(XEN)     X12: 0000000000000008 X13: 000000000027c8c0 X14: 0000000000000020=
=0D
(XEN)     X15: 0000000000000000 X16: 0000000000000001 X17: 00000000002bcf54=
=0D
(XEN)     X18: 0180000000000000 X19: 0000000000000000 X20: 000000080004a328=
=0D
(XEN)     X21: 0000000000000000 X22: 00000000002a3000 X23: 6db6db6db6db6db7=
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
(XEN)    00008000fbff7d80 000000000021e74c 000000080004a328 00000000000014b=
3=0D
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c0=
0=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 000000010000000d 00008000fbff7df0 000000000021e97=
0=0D
(XEN)    0000000000000002 0000000000000002 0000000000080000 000000000318000=
0=0D
(XEN)    000000000021e8dc 00000000002fa000 0000000003180000 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad9=
0=0D
(XEN)    00008000fbff7e00 00000000002b8398 00008000fbff7e50 00000000002b88b=
0=0D
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b=
8=0D
(XEN)    00000000002d03c0 000000000021e8dc 00000000076df000 0000000007fff36=
4=0D
(XEN)    00008000fbff7ea0 00000000002609dc 00000000002a2000 000000000000000=
4=0D
(XEN)    00000000002a2380 000000000032d430 0000000000000004 0000000000296e4=
0=0D
(XEN)    0000000000000002 00000000002609d8 00000000002efde0 00000000002b951=
8=0D
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
(XEN)    [<000000000021bff4>] page_alloc.c#free_heap_pages+0x1dc/0x648 (PC)=
=0D
(XEN)    [<000000000021bff4>] page_alloc.c#free_heap_pages+0x1dc/0x648 (LR)=
=0D
(XEN)    [<000000000021e74c>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<000000000021e970>] init_domheap_pages+0x94/0x9c=0D
(XEN)    [<00000000002b8398>] 00000000002b8398=0D
(XEN)    [<00000000002b88b0>] 00000000002b88b0=0D
(XEN)    [<00000000002609dc>] setup.c#init_done+0x10/0x20=0D
(XEN)    [<00000000002b9518>] 00000000002b9518=0D
(XEN) =0D
(XEN) =0D
(XEN) ****************************************=0D
(XEN) Panic on CPU 0:=0D
(XEN) Xen BUG at page_alloc.c:1425=0D
(XEN) ****************************************=0D
(XEN) =0D
(XEN) Reboot in five seconds...=0D

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--QKdGvSO+nmPlgiQ/--

