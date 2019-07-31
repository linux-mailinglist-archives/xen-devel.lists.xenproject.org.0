Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36A7BF1D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmZC-00014r-8B; Wed, 31 Jul 2019 11:14:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc2w=V4=kpit.com=raushan.kumar@srs-us1.protection.inumbo.net>)
 id 1hsmZA-00014m-Sh
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:14:45 +0000
X-Inumbo-ID: 6422d463-b384-11e9-8980-bc764e045a96
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [40.107.138.59]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6422d463-b384-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 11:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cme9S5ULJ0opeRYgZ/aZKEbaaA9Gv3GZkynZ8lndngSXH44HWAGSdrPu1RFX9guJ9XrPlsTAtNUQIBR+SGqn1I5uFhFuFAbBn4NvpVEkaytaxzcjo6v5Ggms4F9hL6j0XyIqdGGtVmLV2OLFx89abGQYuia+NsxLZaXcqEcJ9fkH5u4I/jViX9Wy90Gu2MyR342cI310QRgJ/yPBQS17RtPzfIxFe0hFSDFzoCxYY0hcvllZH9vDj0EIHdmrWGSwqQDSlcge4GI/sn+RTw8DIl6XCVM3bNHZHPOzbqM/X2VMQt/Qeh2/N6A++YZ6VwR6Iqb8+zZ1URbC1ZGRBgTGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5btXPuIxfp5Y7hap5pYbrBLZjtCvJAkDE6CaJGgDHU=;
 b=krT4cHaqF7/6JXup1t6n8+6AXnegDB4hYp/fQKSl19kP7EY1HFLTzyULAjGh4shoPnG/6wA+Gq9HXLEW+Qbw0KYtIAg1HVQTW0a8bmCG5l0YNBILlbnMW6e8pKDUx80gJiuygWm4Li/bmTUBMuMRLgxcvecCBu+G9SjtvGmadQJfqOmS5uyS5aShytGbj5L33Gy/WTj/cJdscdB2eLC3QBINWUtnPDfzQ5QXVfwyxzfDOvPv9V3yVZhp13zPjFXnI2+NkaIaUKwmrLx/IejZATyVsO/wl5kpvfimEj8ZG/djL9wKXAe2nt752rWYsn3ooJgrIa7s4rQcNULDKZyy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=kpit.com;dmarc=pass action=none header.from=kpit.com;dkim=pass
 header.d=kpit.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5btXPuIxfp5Y7hap5pYbrBLZjtCvJAkDE6CaJGgDHU=;
 b=SS25p3VUiWgxzSYhZDRSKrE5Sv26LJZUOMWeTGt63dbJ+9dIEpRIe6Z+lR5q+NrHySlet4l5ld+XBlBoLq6cLGIdovIs2kXklCl8ygz96gstgyCwln0RfGps925kOQBfap4OoUZSX3lOX1ZpKA7vpVnhsFUOCoKeK3OXNaQHB0g=
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM (20.178.170.143) by
 BMXPR01MB3063.INDPRD01.PROD.OUTLOOK.COM (52.133.135.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Wed, 31 Jul 2019 11:14:34 +0000
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7]) by BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7%4]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:14:34 +0000
From: Raushan Kumar <Raushan.Kumar@kpit.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: XEN is not bringing 
Thread-Index: AQHVR5Br4yA5EdOjIkmwf1pjVGep2w==
Date: Wed, 31 Jul 2019 11:14:34 +0000
Message-ID: <BMXPR01MB27755F15C9300608C8E6C5C58FDF0@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Raushan.Kumar@kpit.com; 
x-originating-ip: [115.110.69.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e83f423d-8df6-4317-ae0e-08d715a84497
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BMXPR01MB3063; 
x-ms-traffictypediagnostic: BMXPR01MB3063:
x-microsoft-antispam-prvs: <BMXPR01MB306307B8399D1F024D5697918FDF0@BMXPR01MB3063.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(99286004)(71200400001)(486006)(14444005)(19627405001)(2351001)(476003)(14454004)(81156014)(4743002)(102836004)(316002)(86362001)(26005)(76116006)(7696005)(66066001)(68736007)(186003)(3846002)(6116002)(66476007)(66946007)(6606003)(55016002)(6506007)(2501003)(71190400001)(25786009)(64756008)(3480700005)(66446008)(478600001)(81166006)(6916009)(8936002)(6436002)(5640700003)(2906002)(54896002)(9686003)(7736002)(33656002)(5660300002)(66556008)(8676002)(74316002)(52536014)(256004)(53936002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB3063;
 H:BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 93+uWiS9tpNntmjtOuS0hlbcTJgbdVcaZPHPh56Wim8OaWSTMypTbSy2JikYm7qfb0AqtBcP232qwGdx4t5FfkUlLo2BwHZHFLEyB7ZmZCWea99B6JiGhHMx35Rth4B/j6ALWUewBNvYElz0od4ua6bxdsWWZ5PTI4H4V9GtbSxzySrx1uNUvCt69mQBfVXluQnmLFKAkgIxhXUGJmMbu0A0RhPYoaTkKaCP6MsQetkoFhqhjYXgd2f4JAYbYf/aFxnENL5VKy4NwRyscct6DBVPG5Msoizqe5Qoo/cq5kqE0qEbhM1pgzRn+EKaUj8GzfSPchHR0WpQz0Ku0pHqHI1brbgwVD/Yn+BgK0kZqgeDgLaxQSoZGk0rrRG926atk80NGFLInis4+MnrY9hj1/3jeatws6dQ+JB8FXAe8nU=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83f423d-8df6-4317-ae0e-08d715a84497
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 11:14:34.2686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: raushank@kpit.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3063
Subject: [Xen-devel] XEN is not bringing
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
Content-Type: multipart/mixed; boundary="===============5799523475512806271=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5799523475512806271==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB27755F15C9300608C8E6C5C58FDF0BMXPR01MB2775INDP_"

--_000_BMXPR01MB27755F15C9300608C8E6C5C58FDF0BMXPR01MB2775INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi team,


Could you please suggest me why kernel gets stuck at

[..]

"

(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 336kB init memory.
"
[..]


Please find the below log :-
U-Boot 2015.04 (Jul 23 2019 - 12:58:16)

CPU: Renesas Electronics R8A7795 rev 2.0
Board: H3ULCB
I2C:   ready
DRAM:  3.9 GiB
MMC:   sh-sdhi: 0, sh-sdhi: 1
In:    serial
Out:   serial
Err:   serial
Net:   Board Net Initialization Failed
No ethernet found.
Hit any key to stop autoboot:  0
=3D> ext2load mmc 0:2 0x48080000 /boot/xen.uImage
951696 bytes read in 49 ms (18.5 MiB/s)
=3D> ext2load mmc 0:2 0x48000000 /boot/xen.dtb
61568 bytes read in 11 ms (5.3 MiB/s)
=3D> ext2load mmc 0:2 0x7a000000 /boot/Image
15782400 bytes read in 662 ms (22.7 MiB/s)
=3D> bootm 0x48080000 - 0x48000000
## Booting kernel from Legacy Image at 48080000 ...
   Image Name:   XEN
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    951632 Bytes =3D 929.3 KiB
   Load Address: 78080000
   Entry Point:  78080000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000048000000, end 000000004801207f

Starting kernel ...

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000048000000 - 000000007fffffff
(XEN) RAM: 0000000500000000 - 000000053fffffff
(XEN) RAM: 0000000600000000 - 000000063fffffff
(XEN) RAM: 0000000700000000 - 000000073fffffff
(XEN)
(XEN) MODULE[0]: 0000000048000000 - 0000000048010000 Device Tree
(XEN) MODULE[1]: 000000007a000000 - 000000007c000000 Kernel
(XEN)  RESVD[0]: 0000000048000000 - 0000000048010000
(XEN)
(XEN)
(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuart=3Dserial0 dom0_=
max_vcpus=3D4
(XEN) PFN compression on bits 19...19
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "serial0", options ""
 Xen 4.13-unstable
(XEN) Xen version 4.13-unstable (aarch64-poky-linux-gcc (Linaro GCC 5.2-201=
5.11-2) 5.2.1 20151005) debug=3Dy  Tue Jul 30 12:23:51 IST 209
(XEN) Latest ChangeSet: Fri Jul 19 13:51:24 2019 +0200 git:66d11b9-dirty
(XEN) build-id: ed9351ffb11d753817e362e4bd6d189b3a2de317
(XEN) Processor: 411fd073: "ARM Limited", variant: 0x1, part 0xd07, rev 0x3
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001124 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 8333 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=3D00000000f1010000
(XEN)         gic_cpu_addr=3D00000000f1020000
(XEN)         gic_hyp_addr=3D00000000f1040000
(XEN)         gic_vcpu_addr=3D00000000f1060000
(XEN)         gic_maintenance_irq=3D25
(XEN) GICv2: Adjusting CPU interface base to 0xf102f000
(XEN) GICv2: 512 lines, 8 cpus, secure (IID 0200043b).
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
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Allocated console ring of 64 KiB.
(XEN) CPU0: Guest atomics will try 10 times before pausing the domain
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Adding cpu 1 to runqueue 0
(XEN) CPU1: Guest atomics will try 13 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000002 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Adding cpu 2 to runqueue 0
(XEN) CPU2: Guest atomics will try 9 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
- CPU 00000003 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Adding cpu 3 to runqueue 0
(XEN) CPU3: Guest atomics will try 9 times before pausing the domain
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
(XEN) Failed to bring up CPU4
(XEN) Failed to bring up CPU 4 (error -6)
(XEN) Bringing up CPU5
(XEN) Failed to bring up CPU5
(XEN) Failed to bring up CPU 5 (error -6)
(XEN) Bringing up CPU6
(XEN) Failed to bring up CPU6
(XEN) Failed to bring up CPU 6 (error -6)
(XEN) Bringing up CPU7
(XEN) Failed to bring up CPU7
(XEN) Failed to bring up CPU 7 (error -6)
(XEN) Brought up 4 CPUs
(XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
(XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594
(XEN) I/O virtualisation disabled
(XEN) alternatives: Patching with alt table 00000000002bbd90 -> 00000000002=
bc450
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 000000007a000000
(XEN) Allocating 1:1 mappings totalling 752MB for dom0:
(XEN) BANK[0] 0x0000004e000000-0x00000078000000 (672MB)
(XEN) BANK[1] 0x00000079000000-0x0000007a000000 (16MB)
(XEN) BANK[2] 0x0000007c000000-0x00000080000000 (64MB)
(XEN) Grant table range: 0x00000078080000-0x000000780c0000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 000000007a000000 to 000000004e080000-000000005008=
0000
(XEN) Loading dom0 DTB to 0x0000000056000000-0x000000005600e6e7
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 336kB init memory.

CTRL-A Z for help | 115200 8N1 | NOR | Minicom 2.7 | VT102 | Offline | ttyU=
SB0


Regards,
Raushan.

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB27755F15C9300608C8E6C5C58FDF0BMXPR01MB2775INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0">Hi team,&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Could you please suggest me why =
kernel gets stuck at&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">[..]</p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color:rgb(0,111,2=
01)">&quot;</span></p>
<div><span style=3D"color:rgb(0,111,201)">(XEN) *** Serial input to DOM0 (t=
ype 'CTRL-a' three times to switch input)</span></div>
<div><span style=3D"color:rgb(0,111,201)">(XEN) Freed 336kB init memory.</s=
pan></div>
<div><span style=3D"color:rgb(0,111,201)">&quot;</span></div>
<div>[..]</div>
<div><br>
</div>
<div><br>
</div>
<div>Please find the below log :-</div>
<div>
<div>U-Boot 2015.04 (Jul 23 2019 - 12:58:16)</div>
<div><br>
</div>
<div>CPU: Renesas Electronics R8A7795 rev 2.0</div>
<div>Board: H3ULCB</div>
<div>I2C:&nbsp; &nbsp;ready</div>
<div>DRAM:&nbsp; 3.9 GiB</div>
<div>MMC:&nbsp; &nbsp;sh-sdhi: 0, sh-sdhi: 1</div>
<div>In:&nbsp; &nbsp; serial</div>
<div>Out:&nbsp; &nbsp;serial</div>
<div>Err:&nbsp; &nbsp;serial</div>
<div>Net:&nbsp; &nbsp;Board Net Initialization Failed</div>
<div>No ethernet found.</div>
<div>Hit any key to stop autoboot:&nbsp; 0&nbsp;</div>
<div>=3D&gt; ext2load mmc 0:2 0x48080000 /boot/xen.uImage</div>
<div>951696 bytes read in 49 ms (18.5 MiB/s)</div>
<div>=3D&gt; ext2load mmc 0:2 0x48000000 /boot/xen.dtb</div>
<div>61568 bytes read in 11 ms (5.3 MiB/s)</div>
<div>=3D&gt; ext2load mmc 0:2 0x7a000000 /boot/Image</div>
<div>15782400 bytes read in 662 ms (22.7 MiB/s)</div>
<div>=3D&gt; bootm 0x48080000 - 0x48000000</div>
<div>## Booting kernel from Legacy Image at 48080000 ...</div>
<div>&nbsp; &nbsp;Image Name:&nbsp; &nbsp;XEN</div>
<div>&nbsp; &nbsp;Image Type:&nbsp; &nbsp;AArch64 Linux Kernel Image (uncom=
pressed)</div>
<div>&nbsp; &nbsp;Data Size:&nbsp; &nbsp; 951632 Bytes =3D 929.3 KiB</div>
<div>&nbsp; &nbsp;Load Address: 78080000</div>
<div>&nbsp; &nbsp;Entry Point:&nbsp; 78080000</div>
<div>&nbsp; &nbsp;Verifying Checksum ... OK</div>
<div>## Flattened Device Tree blob at 48000000</div>
<div>&nbsp; &nbsp;Booting using the fdt blob at 0x48000000</div>
<div>&nbsp; &nbsp;Loading Kernel Image ... OK</div>
<div>&nbsp; &nbsp;Using Device Tree in place at 0000000048000000, end 00000=
0004801207f</div>
<div><br>
</div>
<div>Starting kernel ...</div>
<div><br>
</div>
<div>- UART enabled -</div>
<div>- CPU 00000000 booting -</div>
<div>- Current EL 00000008 -</div>
<div>- Xen starting at EL2 -</div>
<div>- Zero BSS -</div>
<div>- Setting up control registers -</div>
<div>- Turning on paging -</div>
<div>- Ready -</div>
<div>(XEN) Checking for initrd in /chosen</div>
<div>(XEN) RAM: 0000000048000000 - 000000007fffffff</div>
<div>(XEN) RAM: 0000000500000000 - 000000053fffffff</div>
<div>(XEN) RAM: 0000000600000000 - 000000063fffffff</div>
<div>(XEN) RAM: 0000000700000000 - 000000073fffffff</div>
<div>(XEN)&nbsp;</div>
<div>(XEN) MODULE[0]: 0000000048000000 - 0000000048010000 Device Tree&nbsp;=
</div>
<div>(XEN) MODULE[1]: 000000007a000000 - 000000007c000000 Kernel&nbsp; &nbs=
p; &nbsp;&nbsp;</div>
<div>(XEN)&nbsp; RESVD[0]: 0000000048000000 - 0000000048010000</div>
<div>(XEN)&nbsp;</div>
<div>(XEN)&nbsp;</div>
<div>(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuart=3Dserial0 =
dom0_max_vcpus=3D4</div>
<div>(XEN) PFN compression on bits 19...19</div>
<div>(XEN) Domain heap initialised</div>
<div>(XEN) Booting using Device Tree</div>
<div>(XEN) Platform: Generic System</div>
<div>(XEN) Looking for dtuart at &quot;serial0&quot;, options &quot;&quot;<=
/div>
<div>&nbsp;Xen 4.13-unstable</div>
<div>
<div>(XEN) Xen version 4.13-unstable (aarch64-poky-linux-gcc (Linaro GCC 5.=
2-2015.11-2) 5.2.1 20151005) debug=3Dy&nbsp; Tue Jul 30 12:23:51 IST 209</d=
iv>
<div>(XEN) Latest ChangeSet: Fri Jul 19 13:51:24 2019 &#43;0200 git:66d11b9=
-dirty</div>
<div>(XEN) build-id: ed9351ffb11d753817e362e4bd6d189b3a2de317</div>
<div>(XEN) Processor: 411fd073: &quot;ARM Limited&quot;, variant: 0x1, part=
 0xd07, rev 0x3</div>
<div>(XEN) 64-bit Execution:</div>
<div>(XEN)&nbsp; &nbsp;Processor Features: 0000000000002222 000000000000000=
0</div>
<div>(XEN)&nbsp; &nbsp; &nbsp;Exception Levels: EL3:64&#43;32 EL2:64&#43;32=
 EL1:64&#43;32 EL0:64&#43;32</div>
<div>(XEN)&nbsp; &nbsp; &nbsp;Extensions: FloatingPoint AdvancedSIMD</div>
<div>(XEN)&nbsp; &nbsp;Debug Features: 0000000010305106 0000000000000000</d=
iv>
<div>(XEN)&nbsp; &nbsp;Auxiliary Features: 0000000000000000 000000000000000=
0</div>
<div>(XEN)&nbsp; &nbsp;Memory Model Features: 0000000000001124 000000000000=
0000</div>
<div>(XEN)&nbsp; &nbsp;ISA Features:&nbsp; 0000000000011120 000000000000000=
0</div>
<div>(XEN) 32-bit Execution:</div>
<div>(XEN)&nbsp; &nbsp;Processor Features: 00000131:00011011</div>
<div>(XEN)&nbsp; &nbsp; &nbsp;Instruction Sets: AArch32 A32 Thumb Thumb-2 J=
azelle</div>
<div>(XEN)&nbsp; &nbsp; &nbsp;Extensions: GenericTimer Security</div>
<div>(XEN)&nbsp; &nbsp;Debug Features: 03010066</div>
<div>(XEN)&nbsp; &nbsp;Auxiliary Features: 00000000</div>
<div>(XEN)&nbsp; &nbsp;Memory Model Features: 10201105 40000000 01260000 02=
102211</div>
<div>(XEN)&nbsp; ISA Features: 02101110 13112111 21232042 01112131 00011142=
 00011121</div>
<div>(XEN) Using SMC Calling Convention v1.0</div>
<div>(XEN) Using PSCI v1.0</div>
<div>(XEN) SMP: Allowing 8 CPUs</div>
<div>(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 8333 KHz</=
div>
<div>(XEN) GICv2 initialization:</div>
<div>(XEN)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic_dist_addr=3D00000000f101000=
0</div>
<div>(XEN)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic_cpu_addr=3D00000000f1020000=
</div>
<div>(XEN)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic_hyp_addr=3D00000000f1040000=
</div>
<div>(XEN)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic_vcpu_addr=3D00000000f106000=
0</div>
<div>(XEN)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic_maintenance_irq=3D25</div>
<div>(XEN) GICv2: Adjusting CPU interface base to 0xf102f000</div>
<div>(XEN) GICv2: 512 lines, 8 cpus, secure (IID 0200043b).</div>
<div>(XEN) XSM Framework v1.0.0 initialized</div>
<div>(XEN) Initialising XSM SILO mode</div>
<div>(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)</div>
<div>(XEN) Initializing Credit2 scheduler</div>
<div>(XEN)&nbsp; load_precision_shift: 18</div>
<div>(XEN)&nbsp; load_window_shift: 30</div>
<div>(XEN)&nbsp; underload_balance_tolerance: 0</div>
<div>(XEN)&nbsp; overload_balance_tolerance: -3</div>
<div>(XEN)&nbsp; runqueues arrangement: socket</div>
<div>(XEN)&nbsp; cap enforcement granularity: 10ms</div>
<div>(XEN) load tracking window length 1073741824 ns</div>
<div>(XEN) Adding cpu 0 to runqueue 0</div>
<div>(XEN)&nbsp; First cpu on runqueue, activating</div>
<div>(XEN) Allocated console ring of 64 KiB.</div>
<div>(XEN) CPU0: Guest atomics will try 10 times before pausing the domain<=
/div>
<div>(XEN) Bringing up CPU1</div>
<div>- CPU 00000001 booting -</div>
<div>- Current EL 00000008 -</div>
<div>- Xen starting at EL2 -</div>
<div>- Setting up control registers -</div>
<div>- Turning on paging -</div>
<div>- Ready -</div>
<div>(XEN) Adding cpu 1 to runqueue 0</div>
<div>(XEN) CPU1: Guest atomics will try 13 times before pausing the domain<=
/div>
<div>(XEN) CPU 1 booted.</div>
<div>(XEN) Bringing up CPU2</div>
<div>- CPU 00000002 booting -</div>
<div>- Current EL 00000008 -</div>
<div>- Xen starting at EL2 -</div>
<div>- Setting up control registers -</div>
<div>- Turning on paging -</div>
<div>- Ready -</div>
<div>(XEN) Adding cpu 2 to runqueue 0</div>
<div>(XEN) CPU2: Guest atomics will try 9 times before pausing the domain</=
div>
<div>(XEN) CPU 2 booted.</div>
<div>(XEN) Bringing up CPU3</div>
<div>- CPU 00000003 booting -</div>
<div>- Current EL 00000008 -</div>
<div>- Xen starting at EL2 -</div>
<div>- Setting up control registers -</div>
<div>- Turning on paging -</div>
<div>- Ready -</div>
<div>(XEN) Adding cpu 3 to runqueue 0</div>
<div>(XEN) CPU3: Guest atomics will try 9 times before pausing the domain</=
div>
<div>(XEN) CPU 3 booted.</div>
<div>(XEN) Bringing up CPU4</div>
<div>(XEN) Failed to bring up CPU4</div>
<div>(XEN) Failed to bring up CPU 4 (error -6)</div>
<div>(XEN) Bringing up CPU5</div>
<div>(XEN) Failed to bring up CPU5</div>
<div>(XEN) Failed to bring up CPU 5 (error -6)</div>
<div>(XEN) Bringing up CPU6</div>
<div>(XEN) Failed to bring up CPU6</div>
<div>(XEN) Failed to bring up CPU 6 (error -6)</div>
<div>(XEN) Bringing up CPU7</div>
<div>(XEN) Failed to bring up CPU7</div>
<div>(XEN) Failed to bring up CPU 7 (error -6)</div>
<div>(XEN) Brought up 4 CPUs</div>
<div>(XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID</div>
<div>(XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594</div>
<div>(XEN) I/O virtualisation disabled</div>
<div>(XEN) alternatives: Patching with alt table 00000000002bbd90 -&gt; 000=
00000002bc450</div>
<div>(XEN) *** LOADING DOMAIN 0 ***</div>
<div>(XEN) Loading d0 kernel from boot module @ 000000007a000000</div>
<div>(XEN) Allocating 1:1 mappings totalling 752MB for dom0:</div>
<div>(XEN) BANK[0] 0x0000004e000000-0x00000078000000 (672MB)</div>
<div>(XEN) BANK[1] 0x00000079000000-0x0000007a000000 (16MB)</div>
<div>(XEN) BANK[2] 0x0000007c000000-0x00000080000000 (64MB)</div>
<div>(XEN) Grant table range: 0x00000078080000-0x000000780c0000</div>
<div>(XEN) Allocating PPI 16 for event channel interrupt</div>
<div>(XEN) Loading zImage from 000000007a000000 to 000000004e080000-0000000=
050080000</div>
<div>(XEN) Loading dom0 DTB to 0x0000000056000000-0x000000005600e6e7</div>
<div>(XEN) Initial low memory virq threshold set at 0x4000 pages.</div>
<div>(XEN) Scrubbing Free RAM in background</div>
<div>(XEN) Std. Loglevel: All</div>
<div>(XEN) Guest Loglevel: All</div>
<div>(XEN) ***************************************************</div>
<div>(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.</div>
<div>(XEN) Please update your firmware.</div>
<div>(XEN) ***************************************************</div>
<div>(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.</div>
<div>(XEN) Please update your firmware.</div>
<div>(XEN) ***************************************************</div>
<div>(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.</div>
<div>(XEN) Please update your firmware.</div>
<div>(XEN) ***************************************************</div>
<div>(XEN) 3... 2... 1...&nbsp;</div>
<div>(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch in=
put)</div>
<div>(XEN) Freed 336kB init memory.</div>
<div><br>
</div>
<div>CTRL-A Z for help | 115200 8N1 | NOR | Minicom 2.7 | VT102 | Offline |=
 ttyUSB0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div>
<div><br>
</div>
<br>
</div>
Regards,</div>
<div>Raushan.</div>
<p></p>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB27755F15C9300608C8E6C5C58FDF0BMXPR01MB2775INDP_--


--===============5799523475512806271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5799523475512806271==--

