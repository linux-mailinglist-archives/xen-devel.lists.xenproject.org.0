Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3CCB025
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 22:29:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG7f3-0002cl-D2; Thu, 03 Oct 2019 20:25:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/SG=X4=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iG7f1-0002cg-EE
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 20:25:15 +0000
X-Inumbo-ID: e6a1d443-e61b-11e9-9739-12813bfff9fa
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.69.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6a1d443-e61b-11e9-9739-12813bfff9fa;
 Thu, 03 Oct 2019 20:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7ofAK+oEpBPoT8YIMutQOX8tas7sIsSOoECFdR3NNoGWACmdtmx1Crygk5Ue5havOjTD3GY08r7Xv4i57ZuZnGAxfNbjLwrNJrs2mRJvMUKy+AoZnKqOo2ihO2bHo9JXiitWdOPg3RJWtN7rz8gAs68YAcCGaEd8oNY39cjFJw8Up7lTW0IfHHoO3XYtw2FE2jzaW9bCbA9JBWW0IkFvAnzvILpOPRhuqch8xkSORqGfo2bqZyXyFhw7m0PIvKOWQ0fN+bniKN8R58CJuhSFUFgFrJmy2/lonUQ4TUfRgWP3B5EHnsbUKhPyCmanpBQXZgH0xn2G6D4S8Zja8j3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATtUfIhqmu3R7IH+6hwzoRjyfmkxWE2noHpgEOZ8CYM=;
 b=flR01q57b27Xh8NWfg+dtr9/P90Isf+x1sTPaHzWkdwDBK7WVWEpvc5QGq3dxYGkr5X3SgZy3CEJdqTf8fOHOt2EBeXmJfq640X0N/In2/Zt7ZaedqYaPwQi5WNDiMUkAMU5VLEXnS1SNlDMdJeS6JPcWRGfpQvzIe1i0BfmQdLhLPlfJneawO+gWpyzZ1Ik9TKjNv+/OyHYGuBNtq8oDLmhi404Vtp94jUZ8YCxqyCuSeHHZav9ANcYSVSqzLvU+5BDYolL6nhHaxyIv21Eb2imruWcsdySoCjYU2SesnpkMPdOCxUIYs5TeNwWmTi/ebPZSXFGv56PZJ9M3bzSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATtUfIhqmu3R7IH+6hwzoRjyfmkxWE2noHpgEOZ8CYM=;
 b=LQqfHX19MV89Ely95RrCYqVyYqJK0LBsE7WpvkX1ai7gIXJCbTTMc4b5WmZkIbkk75JgV13ggWTJg+DyxyNb6EX12fZ6tSqOep+rxwre+DgDZCZGApO5eFrNdCUe/inlLXeC4c5xX+oA06DGBLedj+d8wBlO03t+PXTNsLTEzQc=
Received: from MN2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:208:fc::14)
 by SN6PR02MB5342.namprd02.prod.outlook.com (2603:10b6:805:71::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Thu, 3 Oct
 2019 20:25:10 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by MN2PR02CA0001.outlook.office365.com
 (2603:10b6:208:fc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.26 via Frontend
 Transport; Thu, 3 Oct 2019 20:25:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Thu, 3 Oct 2019 20:25:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG7ev-0006P3-D7; Thu, 03 Oct 2019 13:25:09 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG7eq-0007wk-7z; Thu, 03 Oct 2019 13:25:04 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x93KOwYN029812; 
 Thu, 3 Oct 2019 13:24:58 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG7ek-0007qC-MW; Thu, 03 Oct 2019 13:24:58 -0700
Date: Thu, 3 Oct 2019 13:24:58 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <Julien.Grall@arm.com>
Message-ID: <20191003202457.GA4040@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com>
 <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
 <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(199004)(189003)(1076003)(36386004)(235185007)(9786002)(356004)(16586007)(6916009)(44832011)(33656002)(8676002)(44144004)(76176011)(53546011)(7696005)(26005)(8936002)(2906002)(86362001)(106002)(305945005)(11346002)(36756003)(70586007)(70206006)(66576008)(58126008)(54906003)(2476003)(4326008)(476003)(486006)(126002)(2616005)(446003)(186003)(81156014)(81166006)(426003)(336012)(71190400001)(229853002)(316002)(5024004)(6246003)(21480400003)(568964002)(478600001)(5660300002)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5342; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee2aa881-fee3-4cf2-f8bd-08d7483fc9e3
X-MS-TrafficTypeDiagnostic: SN6PR02MB5342:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5342BCB6ABD501BDCD9BF25CD79F0@SN6PR02MB5342.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bm5a7w2oCXdRDkkx/I4WDSqm4yLCrdRb0LD8AZeeXD1IgUJlPa1oDC65GPrpCnDrbJ/hSDmSQOdq394ZllQQYnEwAmV0WUKeIaASz7If2/t0zduon+oCr5jxDzBRocdfgfHPc7y/gpablahLZtB53EGHp8vnIPDNrk6x272bGA+A/UPevXQqo5/tAfo1e+iPkmjRLinC67VF10ygFKkXooOzv2JkgzvML88ZHzo3Zm59D75SSsUWLGDC4k4AlnvIqATO6bd3KSS/hajt8Yoj/jghojfB1EPxge0gp63oO1tZ9pKEEcRkh/cX2mwEOzBW3av1E4aMF8WmAU66iFEJcQ3t/iN981WQfzX3T/rJCGp4duvTrf5yDSKJF36ufDKP4dl9bZqo1zy8pg3XsIZNDPjW7Xbz5E6vkjRua3e8kH4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 20:25:10.0042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2aa881-fee3-4cf2-f8bd-08d7483fc9e3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5342
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
Cc: Brian Woods <brian.woods@xilinx.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 07:23:23PM +0000, Julien Grall wrote:
> Hi,
> 
> On 03/10/2019 19:15, Brian Woods wrote:
> > On Thu, Oct 03, 2019 at 06:08:45PM +0100, Julien Grall wrote:
> > (XEN) BW_DEBUG: .6 count_info=0x0000000000000000
> > (XEN) Domain heap initialised
> > (XEN) BW_DEBUG: 01 count_info=0x0180000000000000
> > 
> > Those debug messages sandwich end_boot_allocator() in start_xen().
> 
> hmmm, looking back at the thread, the WARN_ON() I suggested is actually 
> incorrect. :/ Sorry for that. It should be:
> 
> WARN_ON(mfn_x(page_to_mfn(pg + i)) == 0x01533);
> 
> Note the "i" instead of "1".
> 
> If the WARN_ON() is triggered between the two calls, then it would mean 
> we are giving page to the boot allocator.
> 
> This would imply that next_modules() or dt_unreserved_regions() is not 
> working as expected (i.e. carving out any modules).
> 
> Also, could you send your log with early printk enabled?
> 
> Cheers,
> 
> -- 
> Julien Grall

Attached are the log and diff.

There's a WARN_ON() between the two debug printks calls I shared above.

-- 
Brian Woods

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xen-git_52633db2c5ed-p8-bad_addr.log"
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
	 6 MiB/s=0D
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
	 36.6 MiB/s=0D
done=0D
Bytes transferred =3D 18215424 (115f200 hex)=0D
Using ethernet@ff0e0000 device=0D
TFTP from server 10.0.5.2; our IP address is 10.0.5.15=0D
Filename 'xen-custom.ub'.=0D
Load address: 0x1400000=0D
Loading: *=08##############################################################=
###=0D
	 ####=0D
	 22.4 MiB/s=0D
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
	 36.4 MiB/s=0D
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
- UART enabled -=0D
- Boot CPU booting -=0D
- Current EL 00000008 -=0D
- Initialize CPU -=0D
- Turning on paging -=0D
- Zero BSS -=0D
- Ready -=0D
(XEN) Checking for initrd in /chosen=0D
(XEN) Initrd 00000000076df000-0000000007fff364=0D
(XEN) RAM: 0000000000000000 - 000000007fefffff=0D
(XEN) RAM: 0000000800000000 - 000000087fffffff=0D
(XEN) =0D
(XEN) MODULE[0]: 0000000001400000 - 00000000015328f1 Xen         =0D
(XEN) MODULE[1]: 00000000076d2000 - 00000000076dc080 Device Tree =0D
(XEN) MODULE[2]: 00000000076df000 - 0000000007fff364 Ramdisk     =0D
(XEN) MODULE[3]: 0000000000080000 - 0000000003180000 Kernel      =0D
(XEN)  RESVD[0]: 00000000076d2000 - 00000000076dc000=0D
(XEN)  RESVD[1]: 00000000076df000 - 0000000007fff364=0D
(XEN) =0D
(XEN) =0D
(XEN) Command line: console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1G bootscr=
ub=3D0 timer_slop=3D0=0D
(XEN) PFN compression on bits 19...22=0D
(XEN) BW_DEBUG: 00 count_info=3D0x0000000000000000=0D
(XEN) BW_DEBUG: .3 count_info=3D0x0000000000000000=0D
(XEN) BW_DEBUG: .6 count_info=3D0x0000000000000000=0D
(XEN) Xen WARN at page_alloc.c:1392=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021c144 page_alloc.c#free_heap_pages+0x144/0x614=0D
(XEN) LR:     0180000000000000=0D
(XEN) SP:     00000000002efcc0=0D
(XEN) CPSR:   600003c9 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 000000080004a328  X1: 0000000000000000  X2: 000000080004a328=
=0D
(XEN)      X3: 0000000000001533  X4: 00000000002a34b8  X5: 00000000002a3000=
=0D
(XEN)      X6: 00000000002a3000  X7: 00000000002a3000  X8: 0080000000000000=
=0D
(XEN)      X9: 0000000000001533 X10: 6db6db6db6db6db7 X11: fffffff800000000=
=0D
(XEN)     X12: 0000000000000001 X13: 0000000000001533 X14: 0000000000001533=
=0D
(XEN)     X15: 000000000007ffff X16: 00000000002a3488 X17: 0000000000000001=
=0D
(XEN)     X18: 000000007dda9de8 X19: 0000000000000000 X20: 0000000000000000=
=0D
(XEN)     X21: 000000080004a328 X22: 0000000000000000 X23: 0000000047ffffff=
=0D
(XEN)     X24: 00000000002a3000 X25: 3d3d3d3d3d3d3d3d X26: 00000000002a3000=
=0D
(XEN)     X27: 00000000002a3000 X28: 00000000002a3000  FP: 00000000002efcc0=
=0D
(XEN) =0D
(XEN)   VTCR_EL2: 00000000=0D
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
(XEN) Xen stack trace from sp=3D00000000002efcc0:=0D
(XEN)    00000000002efd30 000000000021e900 000000080004a328 000000000000000=
0=0D
(XEN)    00000000002fad40 000000000000619f 00000000002a3488 000000080004a32=
8=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 000000010000000d 00000000002efda0 00000000002a6db=
c=0D
(XEN)    0000000000000001 00000000002c8000 00000000002a34b8 00000000002a300=
0=0D
(XEN)    00000000002a3000 00000000002a3000 0000000000000002 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 00000000002efda0 00000000002fad9=
0=0D
(XEN)    00000000002efde0 00000000002b8e60 0000000000001533 000000080000000=
0=0D
(XEN)    00000000002a3000 00000000002a3000 00000000002a3000 fefefefefefeff0=
9=0D
(XEN)    000000007dd9e890 00000000002001b4 0000000001400000 000000000120000=
0=0D
(XEN)    00000000076d2000 0000000000000000 0000000000400000 000000000000000=
3=0D
(XEN)    0000000000000001 0000000000000000 0000000001400000 000000000140004=
0=0D
(XEN)    0000000000000000 00000000002a63b8 00000000002d03c0 00000000002d03d=
8=0D
(XEN)    00000000076d2000 000000000000a080 0000000000000000 000000000000000=
0=0D
(XEN)    0000000000000000 0000000300000000 0000000000000000 00000040fffffff=
f=0D
(XEN)    0000000000000400 0000000000000000 0000000000000000 000000000000000=
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
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=0D
(XEN) Xen call trace:=0D
(XEN)    [<000000000021c144>] page_alloc.c#free_heap_pages+0x144/0x614 (PC)=
=0D
(XEN)    [<0180000000000000>] 0180000000000000 (LR)=0D
(XEN)    [<000000000021e900>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<00000000002a6dbc>] end_boot_allocator+0x114/0x21c=0D
(XEN)    [<00000000002b8e60>] start_xen+0x47c/0x108c=0D
(XEN)    [<00000000002001b4>] arm64/head.o#primary_switched+0xc/0x2c=0D
(XEN) =0D
(XEN) Domain heap initialised=0D
(XEN) BW_DEBUG: 01 count_info=3D0x0180000000000000=0D
(XEN) Booting using Device Tree=0D
(XEN) Platform: Xilinx ZynqMP=0D
(XEN) BW_DEBUG: 02 count_info=3D0x0180000000000000=0D
(XEN) Looking for dtuart at "serial0", options ""=0D
 Xen 4.13-unstable=0D
(XEN) Xen version 4.13-unstable (woods@xilinx.com) (aarch64-unknown-linux-g=
nu-gcc (crosstool-NG 1.24.0.6-afaf7b9) 8.3.0) debug=3Dy  Thu Oct  3 12:59:1=
8 PDT 2019=0D
(XEN) Latest ChangeSet: Thu Sep 26 11:03:08 2019 +0100 git:52633db-dirty=0D
(XEN) build-id: 15b5303bb7014b2f2e5973278c679dac8b3bd1c8=0D
(XEN) BW_DEBUG:2.5 count_info=3D0x0180000000000000=0D
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
(XEN) BW_DEBUG: 03 count_info=3D0x0180000000000000=0D
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz=0D
(XEN) GICv2 initialization:=0D
(XEN)         gic_dist_addr=3D00000000f9010000=0D
(XEN)         gic_cpu_addr=3D00000000f9020000=0D
(XEN)         gic_hyp_addr=3D00000000f9040000=0D
(XEN)         gic_vcpu_addr=3D00000000f9060000=0D
(XEN)         gic_maintenance_irq=3D25=0D
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000=0D
(XEN) GICv2: 192 lines, 4 cpus (IID 00000000).=0D
(XEN) BW_DEBUG: 04 count_info=3D0x0180000000000000=0D
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
(XEN) BW_DEBUG: 05 count_info=3D0x0180000000000000=0D
(XEN) Allocated console ring of 32 KiB.=0D
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU1=0D
- CPU 00000001 booting -=0D
- Current EL 00000008 -=0D
- Initialize CPU -=0D
- Turning on paging -=0D
- Ready -=0D
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU2=0D
(XEN) CPU 1 booted.=0D
- CPU 00000002 booting -=0D
- Current EL 00000008 -=0D
- Initialize CPU -=0D
- Turning on paging -=0D
- Ready -=0D
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Bringing up CPU3=0D
(XEN) CPU 2 booted.=0D
- CPU 00000003 booting -=0D
- Current EL 00000008 -=0D
- Initialize CPU -=0D
- Turning on paging -=0D
- Ready -=0D
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain=0D
(XEN) Brought up 4 CPUs=0D
(XEN) CPU 3 booted.=0D
(XEN) BW_DEBUG: 06 count_info=3D0x0180000000000000=0D
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
(XEN) BW_DEBUG: 07 count_info=3D0x0180000000000000=0D
(XEN) BW_DEBUG: 08 count_info=3D0x0180000000000000=0D
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
(XEN) BW_DEBUG: 09 count_info=3D0x0180000000000000=0D
(XEN) Initial low memory virq threshold set at 0x4000 pages.=0D
(XEN) Std. Loglevel: All=0D
(XEN) Guest Loglevel: All=0D
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)=
=0D
(XEN) BW_DEBUG: 10 count_info=3D0x0180000000000000=0D
(XEN) BW_DEBUG: 11 count_info=3D0x0180000000000000=0D
(XEN) Xen WARN at page_alloc.c:1392=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021c144 page_alloc.c#free_heap_pages+0x144/0x614=0D
(XEN) LR:     0180000000000000=0D
(XEN) SP:     00008000fbff7d10=0D
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 000000080004a328  X1: 0000000000000000  X2: 000000080004a328=
=0D
(XEN)      X3: 0000000000001533  X4: 00000000002a34b8  X5: 00000000002a3000=
=0D
(XEN)      X6: 00000000002a3000  X7: 00000000002a3000  X8: 0080000000000000=
=0D
(XEN)      X9: 0000000000001533 X10: 6db6db6db6db6db7 X11: fffffff800000000=
=0D
(XEN)     X12: 0000000000000001 X13: 0000000000001533 X14: 0000000000001533=
=0D
(XEN)     X15: 000000000007ffff X16: 00000000002a3488 X17: 0000000000000001=
=0D
(XEN)     X18: 000000007dda9de8 X19: 0000000000000000 X20: 0000000000000000=
=0D
(XEN)     X21: 000000080004a328 X22: 0000000000000000 X23: 0000000047ffffff=
=0D
(XEN)     X24: 00000000002a3000 X25: 3d3d3d3d3d3d3d3d X26: 00000000002a3000=
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
(XEN)    00008000fbff7d80 000000000021e900 000000080004a328 00000000000014b=
3=0D
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c0=
0=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 000000010000000d 00008000fbff7df0 000000000021eb2=
4=0D
(XEN)    0000000000000002 0000000000000002 0000000000080000 000000000318000=
0=0D
(XEN)    000000000021ea90 00000000002fa000 0000000003180000 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad9=
0=0D
(XEN)    00008000fbff7e00 00000000002b83ec 00008000fbff7e50 00000000002b890=
4=0D
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b=
8=0D
(XEN)    00000000002d03c0 000000000021ea90 00000000076df000 0000000007fff36=
4=0D
(XEN)    00008000fbff7ea0 0000000000260a3c 00000000002a2000 000000080004a32=
8=0D
(XEN)    00000000002a3000 00000000002a3000 00000000002a3000 00008000fbf9d00=
0=0D
(XEN)    00000000002a3000 0000000000260a38 00000000002efde0 00000000002b99a=
c=0D
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
(XEN)    [<000000000021c144>] page_alloc.c#free_heap_pages+0x144/0x614 (PC)=
=0D
(XEN)    [<0180000000000000>] 0180000000000000 (LR)=0D
(XEN)    [<000000000021e900>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<000000000021eb24>] init_domheap_pages+0x94/0x9c=0D
(XEN)    [<00000000002b83ec>] 00000000002b83ec=0D
(XEN)    [<00000000002b8904>] 00000000002b8904=0D
(XEN)    [<0000000000260a3c>] setup.c#init_done+0x10/0x20=0D
(XEN)    [<00000000002b99ac>] 00000000002b99ac=0D
(XEN) =0D
(XEN) pg[0] MFN 01533 c=3D0x180000000000000 o=3D0 v=3D0x7ffff t=3D0=0D
(XEN) Xen BUG at page_alloc.c:1424=0D
(XEN) ----[ Xen-4.13-unstable  arm64  debug=3Dy   Not tainted ]----=0D
(XEN) CPU:    0=0D
(XEN) PC:     000000000021c1a8 page_alloc.c#free_heap_pages+0x1a8/0x614=0D
(XEN) LR:     000000000021c1a8=0D
(XEN) SP:     00008000fbff7d10=0D
(XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)=0D
(XEN)      X0: 00000000002a1558  X1: 00000000000001c1  X2: 0000000000000000=
=0D
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000012=
=0D
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f=
=0D
(XEN)      X9: 731f646b61606d54 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101=
=0D
(XEN)     X12: 0000000000000008 X13: 000000000027c8c0 X14: 0000000000000020=
=0D
(XEN)     X15: 0000000000000000 X16: 00000000002a3488 X17: 0000000000000001=
=0D
(XEN)     X18: 000000007dda9de8 X19: 0000000000000000 X20: 0000000000000000=
=0D
(XEN)     X21: 000000080004a328 X22: 0000000000000000 X23: 0000000047ffffff=
=0D
(XEN)     X24: 00000000002a3000 X25: 3d3d3d3d3d3d3d3d X26: 00000000002a3000=
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
(XEN)    00008000fbff7d80 000000000021e900 000000080004a328 00000000000014b=
3=0D
(XEN)    00000000002fad40 0000000000003100 00000000002a3488 0000000800001c0=
0=0D
(XEN)    0000000000000000 00000000000fff00 00000000002d03c0 6db6db6db6db6db=
7=0D
(XEN)    00000000002a10f8 000000010000000d 00008000fbff7df0 000000000021eb2=
4=0D
(XEN)    0000000000000002 0000000000000002 0000000000080000 000000000318000=
0=0D
(XEN)    000000000021ea90 00000000002fa000 0000000003180000 00000000000fff0=
0=0D
(XEN)    00000000002d03c0 ffffffffffffffff 0000000000000001 00000000002fad9=
0=0D
(XEN)    00008000fbff7e00 00000000002b83ec 00008000fbff7e50 00000000002b890=
4=0D
(XEN)    00000000002d0408 0000000000000003 0000000000080000 00000000002a34b=
8=0D
(XEN)    00000000002d03c0 000000000021ea90 00000000076df000 0000000007fff36=
4=0D
(XEN)    00008000fbff7ea0 0000000000260a3c 00000000002a2000 000000080004a32=
8=0D
(XEN)    00000000002a3000 00000000002a3000 00000000002a3000 00008000fbf9d00=
0=0D
(XEN)    00000000002a3000 0000000000260a38 00000000002efde0 00000000002b99a=
c=0D
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
(XEN)    [<000000000021c1a8>] page_alloc.c#free_heap_pages+0x1a8/0x614 (PC)=
=0D
(XEN)    [<000000000021c1a8>] page_alloc.c#free_heap_pages+0x1a8/0x614 (LR)=
=0D
(XEN)    [<000000000021e900>] page_alloc.c#init_heap_pages+0x3d4/0x564=0D
(XEN)    [<000000000021eb24>] init_domheap_pages+0x94/0x9c=0D
(XEN)    [<00000000002b83ec>] 00000000002b83ec=0D
(XEN)    [<00000000002b8904>] 00000000002b8904=0D
(XEN)    [<0000000000260a3c>] setup.c#init_done+0x10/0x20=0D
(XEN)    [<00000000002b99ac>] 00000000002b99ac=0D
(XEN) =0D
(XEN) =0D
(XEN) ****************************************=0D
(XEN) Panic on CPU 0:=0D
(XEN) Xen BUG at page_alloc.c:1424=0D
(XEN) ****************************************=0D
(XEN) =0D
(XEN) Reboot in five seconds...=0D

--lrZ03NoBR/3+SXJZ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="debug.patch"

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 65552da..4d27cc3 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -915,6 +915,8 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
            frametable_size - (nr_pdxs * sizeof(struct page_info)));
 
     frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
+
+    printk("BW_DEBUG: 00 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
 }
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index fca7e68..c0ef166 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -829,11 +829,17 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_mm();
 
+    printk("BW_DEBUG: .3 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+    printk("BW_DEBUG: .6 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     end_boot_allocator();
 
+    printk("BW_DEBUG: 01 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /*
      * The memory subsystem has been initialized, we can now switch from
      * early_boot -> boot.
@@ -858,6 +864,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     platform_init();
 
+    printk("BW_DEBUG: 02 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     preinit_xen_time();
 
     gic_preinit();
@@ -866,6 +874,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     console_init_preirq();
     console_init_ring();
 
+    printk("BW_DEBUG:2.5 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
     processor_id();
 
     smp_init_cpus();
@@ -873,6 +882,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", cpus);
     nr_cpu_ids = cpus;
 
+    printk("BW_DEBUG: 03 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
@@ -887,6 +898,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     tasklet_subsys_init();
 
+   printk("BW_DEBUG: 04 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     if ( xsm_dt_init() != 1 )
         warning_add("WARNING: SILO mode is not enabled.\n"
                     "It has implications on the security of the system,\n"
@@ -904,6 +917,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_system_domains();
 
+    printk("BW_DEBUG: 05 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     local_irq_enable();
     local_abort_enable();
 
@@ -928,6 +943,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk("Brought up %ld CPUs\n", (long)num_online_cpus());
     /* TODO: smp_cpus_done(); */
 
+    printk("BW_DEBUG: 06 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     setup_virt_paging();
 
     rc = iommu_setup();
@@ -943,6 +960,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     apply_alternatives_all();
     enable_errata_workarounds();
 
+    printk("BW_DEBUG: 07 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /* Create initial domain 0. */
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
@@ -963,9 +982,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
+    printk("BW_DEBUG: 08 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     if ( construct_dom0(dom0) != 0)
         panic("Could not set up DOM0 guest OS\n");
 
+    printk("BW_DEBUG: 09 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     heap_init_late();
 
     init_trace_bufs();
@@ -974,6 +997,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     console_endboot();
 
+    printk("BW_DEBUG: 10 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
@@ -983,6 +1008,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     domain_unpause_by_systemcontroller(dom0);
 
+    printk("BW_DEBUG: 11 count_info=0x%016lx\n", mfn_to_page(_mfn(0x01533))->count_info);
+
     /* Switch on to the dynamically allocated stack for the idle vcpu
      * since the static one we're running on is about to be freed. */
     memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7cb1bd3..95e874d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1389,6 +1389,8 @@ static void free_heap_pages(
 
     for ( i = 0; i < (1 << order); i++ )
     {
+        WARN_ON(mfn_x(page_to_mfn(pg + i)) == 0x01533);
+
         /*
          * Cannot assume that count_info == 0, as there are some corner cases
          * where it isn't the case and yet it isn't a bug:

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--lrZ03NoBR/3+SXJZ--

