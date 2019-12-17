Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A112284D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 11:07:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ih9gZ-0003pO-6e; Tue, 17 Dec 2019 10:02:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kw+E=2H=outlook.de=limitlessgreen@srs-us1.protection.inumbo.net>)
 id 1ih9gX-0003pJ-NH
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 10:02:33 +0000
X-Inumbo-ID: 565ecc0e-20b4-11ea-8e89-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.92.70.19]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 565ecc0e-20b4-11ea-8e89-12813bfff9fa;
 Tue, 17 Dec 2019 10:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caochwU0VU4Kl03xEy9UPztPeWHDjsNxrw4i5E3miy0pt4J4bVU1ObYcrO+m37UVRX9bbrOm49WRo7kNTubiQXy6eH360GMA/Psi3fPQ4IprUhV4BsGKMc2O61RcJzD5yppjEmqcPTaUYM/JvqTmWDjJ/tQ1h9Q6eCjc29yM/Icah/6RRuxNtROJC91ocqGRC1Rdnp0oscG5oBC9lfQrxRwVlUENk5PxtpVKd8i9vgyPSqARF9P7IaAxKG1wRrOGWUmwVj62Xl4Pt5zapAOY4UkLdVBUwLCsFxJUlzjJ0D8I8je695lu4rAEEYe6qS1n61eDVLYDc5W71EguxzttPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL/A/b4KKj15P0q1DmlBDPRvyebLcE3bhw7aNjThzQg=;
 b=irBmo/pZT6MSSXPiAznnMJ/A+8hJ93lKV7UhPo/rDT3CbfsahKjEjc0wfQAvgoOgQsckSu3LYyjUhGnyy3mbE58fTrAEKu92V3XxcDP08AA4GSqOkWnx5oeaEgxjfEW7yuh9WfsAIuPK7znVTCkp40tLsqurAaqlf4meRwDZqQ3iN00Riq5V5NwH7hfT2sOELstmAY277lvyL+Oe7vffSK2DAEP7QjGDa/40NC9kE1CuEJZyleR+ybu1QI0NVLfYO0qR3UpM4/IRyr4SILoiYFSZVtQhCWwz4PM4CitSc2WY6FL2j7DdMLc5e9Bi+bCf3N+9MPR+kUOkYi1gRskqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (10.152.16.54) by AM5EUR03HT119.eop-EUR03.prod.protection.outlook.com
 (10.152.17.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Tue, 17 Dec
 2019 10:02:29 +0000
Received: from DB7PR02MB3915.eurprd02.prod.outlook.com (10.152.16.53) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18 via Frontend Transport; Tue, 17 Dec 2019 10:02:29 +0000
Received: from DB7PR02MB3915.eurprd02.prod.outlook.com
 ([fe80::7d2c:a7af:dda:253d]) by DB7PR02MB3915.eurprd02.prod.outlook.com
 ([fe80::7d2c:a7af:dda:253d%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 10:02:28 +0000
From: Limitless Green <limitlessgreen@outlook.de>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel][Bug] panic on xen 4.11.2-pre
Thread-Index: AQHVtMEX9FZl2FKIekSEJ9MlAXedpg==
Date: Tue, 17 Dec 2019 10:02:28 +0000
Message-ID: <DB7PR02MB391507E7E095742918311C48BB500@DB7PR02MB3915.eurprd02.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) To DB7PR02MB3915.eurprd02.prod.outlook.com
 (2603:10a6:10:45::13)
x-incomingtopheadermarker: OriginalChecksum:204C82AA280F32B2CFBE06DB0F7AFC7D316EB8665D2C9DD0225CBE090501E089;
 UpperCasedChecksum:EA7BDC6A665B4F07BCC77C5F209496A7D0EB107BD0DB79A694A56F8102097807;
 SizeAsReceived:7136; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9sQTSieQCJ8K6em+hSMWayIa/yR+zp2PopliUU1NpiM=]
x-microsoft-original-message-id: <cc9317cd-838a-1437-48dd-7e77ea9aac27@outlook.de>
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 87557c20-d102-4639-cf35-08d782d83963
x-ms-traffictypediagnostic: AM5EUR03HT119:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1b3SdsyWT+MCFItsgDc5OjYO2+YmFTFMvLjMd//U6lvQwd8GLnMj6jx4Cd7t1N1zjSVtrTET7COzFBDej5wuaWx6SpLD3V0Sig1ExerVRk8InDRRBWkMHaQaT7UX0UxDuQxh6SYHqFfy02qNWtl4Lv7CuWTS/WQyLv9yQ76dCz/uGZJneQXagPDLsEHU6hGU
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87557c20-d102-4639-cf35-08d782d83963
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 10:02:28.6831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT119
Subject: [Xen-devel] [Bug] panic on xen 4.11.2-pre
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
Content-Type: multipart/mixed; boundary="===============0801474038617508600=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0801474038617508600==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms050005010306060301020700"

--------------ms050005010306060301020700
Content-Type: multipart/alternative;
 boundary="------------7D74F62766765915774C3773"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7D74F62766765915774C3773
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

I was asked via IRC to post my issue here. I got the following through=20
the debug interface:


0x0000:0x00:0x1f.0x6: ROM: 0x10400 bytes at 0x7ffc7018
(XEN) Xen version 4.11.2-pre (Debian 4.11.1+92-g6c33308a8d-2) (pkg-xen-de=
vel@lists.alioth.debian.org) (gcc (Debian 8.3.0-7) 8.3.0) debug=3Dn  Mon =
Jun 24 10:10:11 UTC 2019
(XEN) Bootloader: GRUB 2.02+dfsg1-20
(XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=3D11=
5200,8n1 console=3Dcom1,vga no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x79e00000
(XEN) Video information:
(XEN)  VGA is graphics mode 1360x768, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 3 EDD information structures
(XEN) EFI RAM map:
(XEN)  0000000000000000 - 000000000009f000 (usable)
(XEN)  000000000009f000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000040000000 (usable)
(XEN)  0000000040000000 - 0000000040400000 (reserved)
(XEN)  0000000040400000 - 000000007bcbd000 (usable)
(XEN)  000000007bcbd000 - 000000007bcbe000 (ACPI NVS)
(XEN)  000000007bcbe000 - 000000007bcbf000 (reserved)
(XEN)  000000007bcbf000 - 000000007bd8e000 (usable)
(XEN)  000000007bd8e000 - 000000007bd8f000 (reserved)
(XEN)  000000007bd8f000 - 0000000083947000 (usable)
(XEN)  0000000083947000 - 0000000084717000 (reserved)
(XEN)  0000000084717000 - 0000000084794000 (ACPI data)
(XEN)  0000000084794000 - 0000000089834000 (ACPI NVS)
(XEN)  0000000089834000 - 0000000089eff000 (reserved)
(XEN)  0000000089eff000 - 0000000089f00000 (usable)
(XEN)  0000000089f00000 - 000000008f800000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000086c800000 (usable)
(XEN) ACPI: RSDP 84730000, 0024 (r2 FUJ   )
(XEN) ACPI: XSDT 847300A8, 00D4 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FACP 84750FE8, 0114 (r6 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: DSDT 84730210, 20DD1 (r2 FUJ    D3644-B1 10600000 INTL 201605=
27)
(XEN) ACPI: FACS 89833080, 0040
(XEN) ACPI: APIC 84751100, 0084 (r4 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FPDT 84751188, 0044 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FIDT 847511D0, 009C (r1    FUJ D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: MCFG 84751270, 003C (r1 FUJ    D3644-B1 10600000 MSFT       9=
7)
(XEN) ACPI: SSDT 847512B0, 1B1C (r2 CpuRef  CpuSsdt     3000 INTL 2016052=
7)
(XEN) ACPI: SSDT 84752DD0, 31C6 (r2 SaSsdt  SaSsdt      3000 INTL 2016052=
7)
(XEN) ACPI: HPET 84755F98, 0038 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: SSDT 84755FD0, 13FD (r2  INTEL xh_cfsd4        0 INTL 2016052=
7)
(XEN) ACPI: UEFI 847573D0, 0042 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: LPIT 84757418, 0094 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: SSDT 847574B0, 27DE (r2 FUJ    PtidDevc     1000 INTL 2016052=
7)
(XEN) ACPI: SSDT 84759C90, 14E2 (r2 FUJ    TbtTypeC        0 INTL 2016052=
7)
(XEN) ACPI: DBGP 8475B178, 0034 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: DBG2 8475B1B0, 0054 (r0 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: DMAR 8475B208, 00C8 (r1 INTEL  EDK2            2       100001=
3)
(XEN) ACPI: SSDT 8475B2D0, 0144 (r2 Intel  ADebTabl     1000 INTL 2016052=
7)
(XEN) ACPI: TPM2 8475B418, 0034 (r4 FUJ    D3644-B1        1 AMI         =
0)
(XEN) ACPI: ASF! 8475B450, 00A0 (r32 FUJ    D3644-B1 10600000 AMI   10000=
13)
(XEN) ACPI: SSDT 8475B4F0, 01A4 (r2 FUJ    Gabi0002        2 INTL 2016052=
7)
(XEN) ACPI: SSDT 8475B698, 00BB (r2 FUJ    Gabi0001        2 INTL 2016052=
7)
(XEN) ACPI: WSMT 8475B758, 0028 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) System RAM: 32508MB (33289104kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-000000086c800000
(XEN) Domain heap initialised
(XEN) Xen WARN at mm.c:5627
(XEN) ----[ Xen-4.11.2-pre  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08028e3d0>] ioremap+0xc0/0xd0
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: 0000000000000001   rbx: 0000000000000000   rcx: ffff82d08056bc=
3c
(XEN) rdx: ffff82d08056ba84   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 0000000000400000   rsp: ffff82d08044fd38   r8:  00000000000010=
00
(XEN) r9:  0000000000000001   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: ffff82d0803b8000   r13: 0000000100000000   r14: 00000001000000=
00
(XEN) r15: ffff82d080423db8   cr0: 0000000080050033   cr4: 00000000000000=
a0
(XEN) cr3: 000000007a244000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08028e3d0> (ioremap+0xc0/0xd0):
(XEN)  0f 1f 84 00 00 00 00 00 <0f> 0b e9 60 ff ff ff 66 0f 1f 84 00 00 0=
0 00 00
(XEN) Xen stack trace from rsp=3Dffff82d08044fd38:
(XEN)    0000000000000000 0000000000000000 00007d2000000000 00000000007ef=
ce4
(XEN)    000000004fffffff ffff82d0803d9682 ffff82d0803b4da0 00000000007ef=
ce4
(XEN)    030005504fffffff ffff82d000201540 ffff82d08026b3a0 0000003600000=
0aa
(XEN)    00000000007efce4 ffff82d0803e5508 ffff83000009dfb0 ffff83000009d=
f80
(XEN)    fffffffffffff001 ffff83000009df00 0000000000000019 000000007a1b9=
601
(XEN)    0000000000000000 0000000001f44000 ffffffff00000000 000000000086c=
800
(XEN)    ffff83000009df80 ffff82d080423bb0 0000000000000001 0000000000000=
001
(XEN)    0000000000000001 0000000000000001 0000000000000002 0000000000000=
002
(XEN)    0000000000000002 000000000009df80 0000000000589000 0000000000588=
180
(XEN)    00000000000001ff 00000000000001ff 0000000000000000 ffffffd080448=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
004
(XEN)    0000000800000000 000000010000006e 0000000000000003 0000000000000=
2f8
(XEN)    0000000000000000 0000000000000000 000000003fbcebe0 000000003ff25=
577
(XEN)    0000000000000000 000000007a3bbe04 000000007a1b822e ffff82d080200=
0f3
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN) Xen call trace:
(XEN)    [<ffff82d08028e3d0>] ioremap+0xc0/0xd0
(XEN)    [<ffff82d0803d9682>] vesa_init+0x62/0x200
(XEN)    [<ffff82d08026b3a0>] vesa.c#lfb_flush+0/0x20
(XEN)    [<ffff82d0803e5508>] __start_xen+0x2408/0x2f80
(XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x60
(XEN)
(XEN) vesafb: framebuffer at 0, mapped to 0xffff82c000201000, using 4096k=
, total 4096k
(XEN) vesafb: mode is 1360x768x32, linelength=3D5440, font 8x14
(XEN) vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 158 (0x9e), Stepping 11 (r=
aw 000906eb)
(XEN) SMBIOS 3.2 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[1:1804], status[1:1800]
(XEN) ACPI: Invalid sleep control/status register data: 0:0x8:0x3 0:0x8:0=
x3
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 89833080/0000000000000=
000, using 32
(XEN) ACPI:             wakeup_vec[8983308c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 840 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_cluster.
(XEN) ----[ Xen-4.11.2-pre  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d0803e56fe>] __start_xen+0x25fe/0x2f80
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 00000000000000=
40
(XEN) rdx: 000000000000003f   rsi: 0000000000000008   rdi: 00000000000000=
00
(XEN) rbp: bad0bad0bad0bad0   rsp: ffff82d08044fda8   r8:  00000000000000=
00
(XEN) r9:  ffff82d0805877e0   r10: ffff82d0805724e0   r11: ffff82d0804340=
00
(XEN) r12: 0000000000000000   r13: 0000000000000003   r14: ffff82d0804363=
e0
(XEN) r15: 0000000000000002   cr0: 0000000080050033   cr4: 00000000000000=
a0
(XEN) cr3: 000000007a244000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0803e56fe> (__start_xen+0x25fe/0x2f80):
(XEN)  8d 50 ff 48 89 54 dd f8 <83> 65 00 fe 48 8b 34 24 48 89 ef e8 e2 9=
5 ff ff
(XEN) Xen stack trace from rsp=3Dffff82d08044fda8:
(XEN)    ffff83000009dfb0 ffff830000000000 fffffffffffff001 ffff83000009d=
f00
(XEN)    0000000000000019 000000007a1b9601 0000000000000000 0000000001f44=
000
(XEN)    ffffffff00000000 000000000086c800 ffff83000009df80 ffff82d080423=
bb0
(XEN)    0000000000000001 0000000000000001 0000000000000001 0000000000000=
001
(XEN)    0000000000000002 0000000000000002 0000000000000002 000000000009d=
f80
(XEN)    0000000000589000 0000000000588180 00000000000001ff 0000000000000=
1ff
(XEN)    0000000000000000 ffffffd080448000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000004 0000000800000000 0000000100000=
06e
(XEN)    0000000000000003 00000000000002f8 0000000000000000 0000000000000=
000
(XEN)    000000003fbcebe0 000000003ff25577 0000000000000000 000000007a3bb=
e04
(XEN)    000000007a1b822e ffff82d0802000f3 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000e01000000=
000
(XEN)    ccccccccccccc000 0000000000000000 00000000000000a0 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d0803e56fe>] __start_xen+0x25fe/0x2f80
(XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x60
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL TRAP: vector =3D 12 (stack error)
(XEN) [error_code=3D0000]
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.


I hope, you can help.
Green



--------------7D74F62766765915774C3773
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hello,</p>
    <p><span class=3D"tlid-translation translation" lang=3D"en"><span
          title=3D"" class=3D"">I was asked via IRC to post my issue here=
=2E </span></span><span
        class=3D"tlid-translation translation" lang=3D"en"><span title=3D=
""
          class=3D""><span class=3D"tlid-translation translation" lang=3D=
"en"><span
              title=3D"" class=3D"">I got the following </span></span></s=
pan></span><span
        class=3D"tlid-translation translation" lang=3D"en"><span title=3D=
""
          class=3D""><span class=3D"tlid-translation translation" lang=3D=
"en"><span
              title=3D"" class=3D""><span class=3D"tlid-translation
                translation" lang=3D"en"><span title=3D"" class=3D"">thro=
ugh</span></span>
              the debug interface:</span></span></span></span></p>
    <p><span class=3D"tlid-translation translation" lang=3D"en"><span
          title=3D"" class=3D""><span class=3D"tlid-translation translati=
on"
            lang=3D"en"><span title=3D"" class=3D""><br>
            </span></span></span></span></p>
    <pre>0x0000:0x00:0x1f.0x6: ROM: 0x10400 bytes at 0x7ffc7018
(XEN) Xen version 4.11.2-pre (Debian 4.11.1+92-g6c33308a8d-2) (<a class=3D=
"moz-txt-link-abbreviated" href=3D"mailto:pkg-xen-devel@lists.alioth.debi=
an.org">pkg-xen-devel@lists.alioth.debian.org</a>) (gcc (Debian 8.3.0-7) =
8.3.0) debug=3Dn  Mon Jun 24 10:10:11 UTC 2019
(XEN) Bootloader: GRUB 2.02+dfsg1-20
(XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=3D11=
5200,8n1 console=3Dcom1,vga no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x79e00000
(XEN) Video information:
(XEN)  VGA is graphics mode 1360x768, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 3 EDD information structures
(XEN) EFI RAM map:
(XEN)  0000000000000000 - 000000000009f000 (usable)
(XEN)  000000000009f000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000040000000 (usable)
(XEN)  0000000040000000 - 0000000040400000 (reserved)
(XEN)  0000000040400000 - 000000007bcbd000 (usable)
(XEN)  000000007bcbd000 - 000000007bcbe000 (ACPI NVS)
(XEN)  000000007bcbe000 - 000000007bcbf000 (reserved)
(XEN)  000000007bcbf000 - 000000007bd8e000 (usable)
(XEN)  000000007bd8e000 - 000000007bd8f000 (reserved)
(XEN)  000000007bd8f000 - 0000000083947000 (usable)
(XEN)  0000000083947000 - 0000000084717000 (reserved)
(XEN)  0000000084717000 - 0000000084794000 (ACPI data)
(XEN)  0000000084794000 - 0000000089834000 (ACPI NVS)
(XEN)  0000000089834000 - 0000000089eff000 (reserved)
(XEN)  0000000089eff000 - 0000000089f00000 (usable)
(XEN)  0000000089f00000 - 000000008f800000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000086c800000 (usable)
(XEN) ACPI: RSDP 84730000, 0024 (r2 FUJ   )
(XEN) ACPI: XSDT 847300A8, 00D4 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FACP 84750FE8, 0114 (r6 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: DSDT 84730210, 20DD1 (r2 FUJ    D3644-B1 10600000 INTL 201605=
27)
(XEN) ACPI: FACS 89833080, 0040
(XEN) ACPI: APIC 84751100, 0084 (r4 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FPDT 84751188, 0044 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: FIDT 847511D0, 009C (r1    FUJ D3644-B1 10600000 AMI     1001=
3)
(XEN) ACPI: MCFG 84751270, 003C (r1 FUJ    D3644-B1 10600000 MSFT       9=
7)
(XEN) ACPI: SSDT 847512B0, 1B1C (r2 CpuRef  CpuSsdt     3000 INTL 2016052=
7)
(XEN) ACPI: SSDT 84752DD0, 31C6 (r2 SaSsdt  SaSsdt      3000 INTL 2016052=
7)
(XEN) ACPI: HPET 84755F98, 0038 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: SSDT 84755FD0, 13FD (r2  INTEL xh_cfsd4        0 INTL 2016052=
7)
(XEN) ACPI: UEFI 847573D0, 0042 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: LPIT 84757418, 0094 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: SSDT 847574B0, 27DE (r2 FUJ    PtidDevc     1000 INTL 2016052=
7)
(XEN) ACPI: SSDT 84759C90, 14E2 (r2 FUJ    TbtTypeC        0 INTL 2016052=
7)
(XEN) ACPI: DBGP 8475B178, 0034 (r1 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: DBG2 8475B1B0, 0054 (r0 FUJ    D3644-B1 10600000 AMI   100001=
3)
(XEN) ACPI: DMAR 8475B208, 00C8 (r1 INTEL  EDK2            2       100001=
3)
(XEN) ACPI: SSDT 8475B2D0, 0144 (r2 Intel  ADebTabl     1000 INTL 2016052=
7)
(XEN) ACPI: TPM2 8475B418, 0034 (r4 FUJ    D3644-B1        1 AMI         =
0)
(XEN) ACPI: ASF! 8475B450, 00A0 (r32 FUJ    D3644-B1 10600000 AMI   10000=
13)
(XEN) ACPI: SSDT 8475B4F0, 01A4 (r2 FUJ    Gabi0002        2 INTL 2016052=
7)
(XEN) ACPI: SSDT 8475B698, 00BB (r2 FUJ    Gabi0001        2 INTL 2016052=
7)
(XEN) ACPI: WSMT 8475B758, 0028 (r1 FUJ    D3644-B1 10600000 AMI     1001=
3)
(XEN) System RAM: 32508MB (33289104kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-000000086c800000
(XEN) Domain heap initialised
(XEN) Xen WARN at mm.c:5627
(XEN) ----[ Xen-4.11.2-pre  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[&lt;ffff82d08028e3d0&gt;] ioremap+0xc0/0xd0
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
(XEN) rax: 0000000000000001   rbx: 0000000000000000   rcx: ffff82d08056bc=
3c
(XEN) rdx: ffff82d08056ba84   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 0000000000400000   rsp: ffff82d08044fd38   r8:  00000000000010=
00
(XEN) r9:  0000000000000001   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: ffff82d0803b8000   r13: 0000000100000000   r14: 00000001000000=
00
(XEN) r15: ffff82d080423db8   cr0: 0000000080050033   cr4: 00000000000000=
a0
(XEN) cr3: 000000007a244000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around &lt;ffff82d08028e3d0&gt; (ioremap+0xc0/0xd0):
(XEN)  0f 1f 84 00 00 00 00 00 &lt;0f&gt; 0b e9 60 ff ff ff 66 0f 1f 84 0=
0 00 00 00 00
(XEN) Xen stack trace from rsp=3Dffff82d08044fd38:
(XEN)    0000000000000000 0000000000000000 00007d2000000000 00000000007ef=
ce4
(XEN)    000000004fffffff ffff82d0803d9682 ffff82d0803b4da0 00000000007ef=
ce4
(XEN)    030005504fffffff ffff82d000201540 ffff82d08026b3a0 0000003600000=
0aa
(XEN)    00000000007efce4 ffff82d0803e5508 ffff83000009dfb0 ffff83000009d=
f80
(XEN)    fffffffffffff001 ffff83000009df00 0000000000000019 000000007a1b9=
601
(XEN)    0000000000000000 0000000001f44000 ffffffff00000000 000000000086c=
800
(XEN)    ffff83000009df80 ffff82d080423bb0 0000000000000001 0000000000000=
001
(XEN)    0000000000000001 0000000000000001 0000000000000002 0000000000000=
002
(XEN)    0000000000000002 000000000009df80 0000000000589000 0000000000588=
180
(XEN)    00000000000001ff 00000000000001ff 0000000000000000 ffffffd080448=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
004
(XEN)    0000000800000000 000000010000006e 0000000000000003 0000000000000=
2f8
(XEN)    0000000000000000 0000000000000000 000000003fbcebe0 000000003ff25=
577
(XEN)    0000000000000000 000000007a3bbe04 000000007a1b822e ffff82d080200=
0f3
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN) Xen call trace:
(XEN)    [&lt;ffff82d08028e3d0&gt;] ioremap+0xc0/0xd0
(XEN)    [&lt;ffff82d0803d9682&gt;] vesa_init+0x62/0x200
(XEN)    [&lt;ffff82d08026b3a0&gt;] vesa.c#lfb_flush+0/0x20
(XEN)    [&lt;ffff82d0803e5508&gt;] __start_xen+0x2408/0x2f80
(XEN)    [&lt;ffff82d0802000f3&gt;] __high_start+0x53/0x60
(XEN)=20
(XEN) vesafb: framebuffer at 0, mapped to 0xffff82c000201000, using 4096k=
, total 4096k
(XEN) vesafb: mode is 1360x768x32, linelength=3D5440, font 8x14
(XEN) vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 158 (0x9e), Stepping 11 (r=
aw 000906eb)
(XEN) SMBIOS 3.2 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[1:1804], status[1:1800]
(XEN) ACPI: Invalid sleep control/status register data: 0:0x8:0x3 0:0x8:0=
x3
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 89833080/0000000000000=
000, using 32
(XEN) ACPI:             wakeup_vec[8983308c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 840 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_cluster.
(XEN) ----[ Xen-4.11.2-pre  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[&lt;ffff82d0803e56fe&gt;] __start_xen+0x25fe/0x2f80
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 00000000000000=
40
(XEN) rdx: 000000000000003f   rsi: 0000000000000008   rdi: 00000000000000=
00
(XEN) rbp: bad0bad0bad0bad0   rsp: ffff82d08044fda8   r8:  00000000000000=
00
(XEN) r9:  ffff82d0805877e0   r10: ffff82d0805724e0   r11: ffff82d0804340=
00
(XEN) r12: 0000000000000000   r13: 0000000000000003   r14: ffff82d0804363=
e0
(XEN) r15: 0000000000000002   cr0: 0000000080050033   cr4: 00000000000000=
a0
(XEN) cr3: 000000007a244000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around &lt;ffff82d0803e56fe&gt; (__start_xen+0x25fe/0x2f80=
):
(XEN)  8d 50 ff 48 89 54 dd f8 &lt;83&gt; 65 00 fe 48 8b 34 24 48 89 ef e=
8 e2 95 ff ff
(XEN) Xen stack trace from rsp=3Dffff82d08044fda8:
(XEN)    ffff83000009dfb0 ffff830000000000 fffffffffffff001 ffff83000009d=
f00
(XEN)    0000000000000019 000000007a1b9601 0000000000000000 0000000001f44=
000
(XEN)    ffffffff00000000 000000000086c800 ffff83000009df80 ffff82d080423=
bb0
(XEN)    0000000000000001 0000000000000001 0000000000000001 0000000000000=
001
(XEN)    0000000000000002 0000000000000002 0000000000000002 000000000009d=
f80
(XEN)    0000000000589000 0000000000588180 00000000000001ff 0000000000000=
1ff
(XEN)    0000000000000000 ffffffd080448000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000004 0000000800000000 0000000100000=
06e
(XEN)    0000000000000003 00000000000002f8 0000000000000000 0000000000000=
000
(XEN)    000000003fbcebe0 000000003ff25577 0000000000000000 000000007a3bb=
e04
(XEN)    000000007a1b822e ffff82d0802000f3 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000e01000000=
000
(XEN)    ccccccccccccc000 0000000000000000 00000000000000a0 0000000000000=
000
(XEN)    0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [&lt;ffff82d0803e56fe&gt;] __start_xen+0x25fe/0x2f80
(XEN)    [&lt;ffff82d0802000f3&gt;] __high_start+0x53/0x60
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL TRAP: vector =3D 12 (stack error)
(XEN) [error_code=3D0000]
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.</pre>
    <p><span class=3D"tlid-translation translation" lang=3D"en"><span
          title=3D"" class=3D""><br>
        </span></span></p>
    <p><span class=3D"tlid-translation translation" lang=3D"en"><span
          title=3D"" class=3D"">I hope, you can help.<br>
          Green<br>
        </span></span></p>
    <p><span class=3D"tlid-translation translation" lang=3D"en"><span
          title=3D"" class=3D""><br>
        </span></span></p>
  </body>
</html>

--------------7D74F62766765915774C3773--

--------------ms050005010306060301020700
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
C4MwggT4MIID4KADAgECAhBVc4KzDZVn3wf5M+4TXi0sMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRy
bzEjMCEGA1UECgwaQWN0YWxpcyBTLnAuQS4vMDMzNTg1MjA5NjcxLDAqBgNVBAMMI0FjdGFs
aXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEcyMB4XDTE5MTIxNzA5MjYyOFoXDTIwMTIx
NzA5MjYyOFowJDEiMCAGA1UEAwwZbGltaXRsZXNzZ3JlZW5Ab3V0bG9vay5kZTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBAKnvnlf03TvmWIdOXlB3coQCLEaUr9tDnGfedrmE
HLs2dndM/5Jt2yvy6kd7XZ16Z6BDAxoy+F2tpk68o/TlRGXU50WjYB8W80/83plKy3BQcb7E
E3Xy8xNaL19ypwxxSgqYKnnemMgHNDwcY4/6e3NyDTq6QG/f6mXPvFEo5++MRYB82V4vQ+fY
BJewnTcnHqoGQC2Wd27VHAAhCQh8fvv3Cnuo/UzHF91PVCxOaIhjU1cVzpBbEXej7U7m00V7
MnN0PBss8mjGJohHv+dPcIRdfkPn5MtzErrjssRU05/A/sENM8q06z0RNneM+SVDnEeQ/5Y/
dZ7JG0p4QlAfVisCAwEAAaOCAbowggG2MAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUa/KN
nmjBJQQfUTRX9hZclOpNaRowfgYIKwYBBQUHAQEEcjBwMDsGCCsGAQUFBzAChi9odHRwOi8v
Y2FjZXJ0LmFjdGFsaXMuaXQvY2VydHMvYWN0YWxpcy1hdXRjbGlnMjAxBggrBgEFBQcwAYYl
aHR0cDovL29jc3AwOS5hY3RhbGlzLml0L1ZBL0FVVEhDTC1HMjAkBgNVHREEHTAbgRlsaW1p
dGxlc3NncmVlbkBvdXRsb29rLmRlMEcGA1UdIARAMD4wPAYGK4EfARgBMDIwMAYIKwYBBQUH
AgEWJGh0dHBzOi8vd3d3LmFjdGFsaXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggr
BgEFBQcDAgYIKwYBBQUHAwQwSAYDVR0fBEEwPzA9oDugOYY3aHR0cDovL2NybDA5LmFjdGFs
aXMuaXQvUmVwb3NpdG9yeS9BVVRIQ0wtRzIvZ2V0TGFzdENSTDAdBgNVHQ4EFgQU+m26vzUw
BAYxqsPz/DIlbn0hR4AwDgYDVR0PAQH/BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4IBAQBQMJwj
DW/2gMVrgVx6LixsFOItJNUwLyMDz9TuNt/VwP3UEQ6toH5sfTn+XLt6QPeZiLeffBKCPNWx
ns17xbR1yFNtnHINN7Se7jfprfXUGuq2DvMleLh3JB+65MdebBq8F8yv3Awxp0/CK52OqKHb
bOFml8DMTAseDNCZFGLZg3EsDQdEa75mz6tLHxbWNPGQL1kZFQI/EURhucwN9D8NGZobfM/p
P6MmkUBC8jrNhzq+VicnPhAsdTya69a25NVEpI45/Ntw5YrdV1OPFwSUTA66s2/VQ+y1pOaY
dLGqkKXq/VPuv4feYQXLDLTfjZBRAxPJy1BOAtz1fRUrYxRiMIIGgzCCBGugAwIBAgIQT94Q
S+2VW96LrWWHzEFe4zANBgkqhkiG9w0BAQsFADBrMQswCQYDVQQGEwJJVDEOMAwGA1UEBwwF
TWlsYW4xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MScwJQYDVQQDDB5B
Y3RhbGlzIEF1dGhlbnRpY2F0aW9uIFJvb3QgQ0EwHhcNMTkwOTIwMDcxMjA1WhcNMzAwOTIy
MTEyMjAyWjCBjTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBv
bnRlIFNhbiBQaWV0cm8xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSww
KgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBALdoc3rZPNQv+9xnyj3OlHz/iRnO2hpj8xlHkCdYKNwn
RabAT6J0RA11A3ZkQiEZEw66B99ES7Ezv9IRBYmIwsr720lUptObF5L3yVzl3nzaittXwWsq
+CQoDEci1cKkWF5SiO22+Np2Epu2HFxkw5nXMnZibrqnC6hUGsFogTDUUVRIuLlublwWYFhp
qvDaCh//ucRgRW3+rTU1nBoT1XHkXrLsCteefjoh+o01tNTWvGi4+3OyABidGPXuoYh7UbYX
1u0sG1O8rO92t5zV7/Cr/Vza9EbySh6DrCqsY333sNxikKzFyBwebZv43t1xJyMVE/CRt7BL
JOyHxd1Yq0sCAwEAAaOCAf4wggH6MA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUUtiI
OsifeGbtifN7OHCUyQICNtAwQQYIKwYBBQUHAQEENTAzMDEGCCsGAQUFBzABhiVodHRwOi8v
b2NzcDA1LmFjdGFsaXMuaXQvVkEvQVVUSC1ST09UMEUGA1UdIAQ+MDwwOgYEVR0gADAyMDAG
CCsGAQUFBwIBFiRodHRwczovL3d3dy5hY3RhbGlzLml0L2FyZWEtZG93bmxvYWQwJwYDVR0l
BCAwHgYIKwYBBQUHAwIGCCsGAQUFBwMEBggrBgEFBQcDCTCB4wYDVR0fBIHbMIHYMIGWoIGT
oIGQhoGNbGRhcDovL2xkYXAwNS5hY3RhbGlzLml0L2NuJTNkQWN0YWxpcyUyMEF1dGhlbnRp
Y2F0aW9uJTIwUm9vdCUyMENBLG8lM2RBY3RhbGlzJTIwUy5wLkEuJTJmMDMzNTg1MjA5Njcs
YyUzZElUP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q7YmluYXJ5MD2gO6A5hjdodHRwOi8v
Y3JsMDUuYWN0YWxpcy5pdC9SZXBvc2l0b3J5L0FVVEgtUk9PVC9nZXRMYXN0Q1JMMB0GA1Ud
DgQWBBRr8o2eaMElBB9RNFf2FlyU6k1pGjAOBgNVHQ8BAf8EBAMCAQYwDQYJKoZIhvcNAQEL
BQADggIBAGBEuhmiq3L7DkGaRMG6FTm9na4v3ya3KW+xkhFvSZgPinqeBi5qfV+dCL/BCuO/
JMH9mgI5z57DnYiLQC3CIHnEtalcTfhGPleRgjRMuFQLAeYM5UAZiiPT+D8S7faZ0CZ3glRL
w51QTGQJZSC+bN7mgoiBG/HmGahvLWjlkjNZ6o6AmVC3HIV1mGowamiYNEVDmen+SAdJW9uh
wP+xFFZodZ0lYJQ6FHg+3pSDVx6YdM94n9e9tlMnXKB+CY92WmPXbUOMCUjYUmTsxEu9lJEu
sHv+eehThrO6HiVrkHvEathHnkhphpYmSlG2KOIwfwtqJjJ9C+EMCOcDDa1ndhUTVFMMTAZm
yWLRGg0U0O9hzwPA520ZL0Q0iZI7E6KlOmaQZQX+LORMK4V6hVW9qzPZhgjw2SYux8N8vAWA
/3d4ky+j1uVIzk0qRXJ0iD+B1uTyOjEx15fmm+mowp7ycOhNUxi4d8ycqb+QkPBbZtM+zCi7
eWa9hOI6I2V3mZ9bFKUqonWcqfZhvy2DEZhzJLYQ0Zw5ztrR7+fmDjuHFBG07eQcMBOUT46q
L7J3ncneUooyCvpNTAlxSzE3xEc96lDd4v38Lnl3BsuIxH9p/xb2LBGNxgR12QjFVj33wX25
fyE47PUPTRt+2wBJv5oNsjatNjS4w20CCoLfVtGgVPUrMYIEFzCCBBMCAQEwgaIwgY0xCzAJ
BgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4gUGlldHJv
MSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEsMCoGA1UEAwwjQWN0YWxp
cyBDbGllbnQgQXV0aGVudGljYXRpb24gQ0EgRzICEFVzgrMNlWffB/kz7hNeLSwwDQYJYIZI
AWUDBAIBBQCgggJFMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTE5MTIxNzEwMDIxMFowLwYJKoZIhvcNAQkEMSIEIHqrARYIPKPg7qImmqEWcupoZ9p9qF/D
fKkYXn7e8Ml/MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAK
BggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYI
KoZIhvcNAwICASgwgbMGCSsGAQQBgjcQBDGBpTCBojCBjTELMAkGA1UEBhMCSVQxEDAOBgNV
BAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xIzAhBgNVBAoMGkFjdGFs
aXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50
aWNhdGlvbiBDQSBHMgIQVXOCsw2VZ98H+TPuE14tLDCBtQYLKoZIhvcNAQkQAgsxgaWggaIw
gY0xCzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4g
UGlldHJvMSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEsMCoGA1UEAwwj
QWN0YWxpcyBDbGllbnQgQXV0aGVudGljYXRpb24gQ0EgRzICEFVzgrMNlWffB/kz7hNeLSww
DQYJKoZIhvcNAQEBBQAEggEAE1NTzN3cXm3kkQ3A3RlgLGt4qQyV48SzJou0qWudBrdP+JQ/
C93MxM31M9q/nz7oQh162qOEywx8gknMSIgiGVwQoFXmt0G5nvdJ1GBd8zjKwl2wM0CgqFy8
B4Odt6c+MMGIkiEtIMREtEzZg3sK2+Gmk+CLefiVm90iZvwW5BYA7TEhK50L1bZo2uTTebdr
dhUOI8MYXwm5AqCe51oOd/aXjtM59+M+UKwa5YcnhjPqs3DopU5n8XC8q9IbPLuhi/DvAm2Y
X0b5nvYqz6YpfAXIZpvqDC0cD+NvoY3VHAu/ZqqXLcsSUt5olbUPPu25kAprI3OcGZjCo3kj
jYCfwgAAAAAAAA==

--------------ms050005010306060301020700--


--===============0801474038617508600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0801474038617508600==--

