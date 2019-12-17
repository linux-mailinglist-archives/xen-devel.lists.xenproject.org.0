Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F4B122B5C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:22:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBo9-0007iV-Nl; Tue, 17 Dec 2019 12:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kw+E=2H=outlook.de=limitlessgreen@srs-us1.protection.inumbo.net>)
 id 1ihBo8-0007iQ-2o
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:18:32 +0000
X-Inumbo-ID: 50dea160-20c7-11ea-b6f1-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.92.67.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50dea160-20c7-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 12:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNFy7OMgWlIuNFcq0lqb3JJRRC00LUjatW2JCfwHM2FtT/CkxLV0mky29bgOBKTaX7YHUHGW7+VaPwMuzojTevsyZPeNNBn0y5W2a0CJ36ufus7nZ3NC3R/pSZ+OjwY2MyAqH2pXU3YIx+VbVhxq3wlRxmCam+WEG1HlKral2cZkLc8dkq0fIHZQmLVjkEINvk4W2WZCsH0YD6sftaOk0lA1naMJ82+pcaRxFMNCBD8qJDh0OPd+u/MFPVHW5nzyKaZnZ100lLH/M6OoSe1pQRTG4uLYeoQjzJGspTNu637bhtds2Pf0lswQ/K4AyiqjFExM+E0R5LfNbJDRSffsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKzIxtgfa5/qYiX1Mq5kHYuYks0OYlYDtwAKI/+7h3s=;
 b=U6oU7yVX05Lli1CyG1ji+3WQwHtcUVHkjx/CVVjp0cuhePdUYXiO6hvbxMp7iliGxmPsrP6StOrpc8pg9EJ6uPN/9B+dzySKBCONm245Lktks+WhRWd7wCyIAbmj+YjUs2dzP5+Ty1yX5Ur2Q+3eRWZwQW0Bots/yIImg23bAFIUcEOfofL3c+6BqYJdxhq0IDI1rRr+Z2yeUyY+9UymWpY355e4BAayGwJ/Tp7lGhTEjO1/4ajSSI9Azv/it27o9islxcBQb/fmqPwbHTGXc4pRgfwZpf6naaCkwlIDqptCi00l938yIstEDAyKFW/l64KEOIFts1S9NXxXH90shQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT008.eop-EUR02.prod.protection.outlook.com
 (10.152.10.54) by HE1EUR02HT157.eop-EUR02.prod.protection.outlook.com
 (10.152.11.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14; Tue, 17 Dec
 2019 12:18:20 +0000
Received: from DB7PR02MB3915.eurprd02.prod.outlook.com (10.152.10.59) by
 HE1EUR02FT008.mail.protection.outlook.com (10.152.10.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14 via Frontend Transport; Tue, 17 Dec 2019 12:18:20 +0000
Received: from DB7PR02MB3915.eurprd02.prod.outlook.com
 ([fe80::7d2c:a7af:dda:253d]) by DB7PR02MB3915.eurprd02.prod.outlook.com
 ([fe80::7d2c:a7af:dda:253d%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 12:18:20 +0000
From: Limitless Green <limitlessgreen@outlook.de>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Bug] panic on xen 4.11.2-pre
Thread-Index: AQHVtMzg4dZPc0Klc06nU/0vI7FbXqe+PocA
Date: Tue, 17 Dec 2019 12:18:20 +0000
Message-ID: <DB7PR02MB39152D11BBBD27101140C8D6BB500@DB7PR02MB3915.eurprd02.prod.outlook.com>
References: <DB7PR02MB391507E7E095742918311C48BB500@DB7PR02MB3915.eurprd02.prod.outlook.com>
 <26a6ef1b-71cf-3aa7-6172-0d94782ef28a@suse.com>
In-Reply-To: <26a6ef1b-71cf-3aa7-6172-0d94782ef28a@suse.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To DB7PR02MB3915.eurprd02.prod.outlook.com
 (2603:10a6:10:45::13)
x-incomingtopheadermarker: OriginalChecksum:4C58832E364867D659CC9F2B2AC2E0604A3FD4105689A1F4E58720D074BFD80E;
 UpperCasedChecksum:05CF1F46299A553FFBAD24516FFFFE09F2069E493A3D0E58234DE2D0C1C53465;
 SizeAsReceived:7318; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9b24EVmfLkCS5gZD1VarzLDBNULglVG5L7w46oVhflE=]
x-microsoft-original-message-id: <22857548-c056-e3a2-545f-68d44694a613@outlook.de>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 23d506a2-98a6-46a6-2428-08d782eb3454
x-ms-traffictypediagnostic: HE1EUR02HT157:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kttpWaGZEEPYBbB0PXgNV1h9a0B4kRxPZtGSij3L5Bb/J5i7O5lIisUhApJ6DZBTshHy4zoNxhoLvLWf0U5ClMgD2vMCParQGeLQOgCvA0FH5QYKOVisctlsgTxt54FcXjahSnCz0IGnTaRBCEhkupzL9zVIid7jfktjOo7T0h79L9R1/ad0FHB53Bq8WLKN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d506a2-98a6-46a6-2428-08d782eb3454
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 12:18:20.4508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT157
Subject: Re: [Xen-devel] [Bug] panic on xen 4.11.2-pre
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
Content-Type: multipart/mixed; boundary="===============0277683024093428086=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0277683024093428086==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms030603070102070705030108"

--------------ms030603070102070705030108
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

ty for the reply. I'm using the internal gfx of the Intel i3-8100. I=20
have ECC unbuffered RAM, but I thing this shouldn't be an issue. How can =

I get these packages? I used the xen-hypervisor-common package from the=20
debian buster repository. If I try to build it (debian too), I run into=20
errors. Is there a docker build environment or something?

Am 17.12.19 um 12:27 schrieb Jan Beulich:
> On 17.12.2019 11:02, Limitless Green wrote:
>> Hello,
>>
>> I was asked via IRC to post my issue here. I got the following through=

>> the debug interface:
>>
>>
>> 0x0000:0x00:0x1f.0x6: ROM: 0x10400 bytes at 0x7ffc7018
>> (XEN) Xen version 4.11.2-pre (Debian 4.11.1+92-g6c33308a8d-2) (pkg-xen=
-devel@lists.alioth.debian.org) (gcc (Debian 8.3.0-7) 8.3.0) debug=3Dn  M=
on Jun 24 10:10:11 UTC 2019
>> (XEN) Bootloader: GRUB 2.02+dfsg1-20
>> (XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=3D=
115200,8n1 console=3Dcom1,vga no-real-mode edd=3Doff
>> (XEN) Xen image load base address: 0x79e00000
>> (XEN) Video information:
>> (XEN)  VGA is graphics mode 1360x768, 32 bpp
>> (XEN) Disc information:
>> (XEN)  Found 0 MBR signatures
>> (XEN)  Found 3 EDD information structures
>> (XEN) EFI RAM map:
>> (XEN)  0000000000000000 - 000000000009f000 (usable)
>> (XEN)  000000000009f000 - 0000000000100000 (reserved)
>> (XEN)  0000000000100000 - 0000000040000000 (usable)
>> (XEN)  0000000040000000 - 0000000040400000 (reserved)
>> (XEN)  0000000040400000 - 000000007bcbd000 (usable)
>> (XEN)  000000007bcbd000 - 000000007bcbe000 (ACPI NVS)
>> (XEN)  000000007bcbe000 - 000000007bcbf000 (reserved)
>> (XEN)  000000007bcbf000 - 000000007bd8e000 (usable)
>> (XEN)  000000007bd8e000 - 000000007bd8f000 (reserved)
>> (XEN)  000000007bd8f000 - 0000000083947000 (usable)
>> (XEN)  0000000083947000 - 0000000084717000 (reserved)
>> (XEN)  0000000084717000 - 0000000084794000 (ACPI data)
>> (XEN)  0000000084794000 - 0000000089834000 (ACPI NVS)
>> (XEN)  0000000089834000 - 0000000089eff000 (reserved)
>> (XEN)  0000000089eff000 - 0000000089f00000 (usable)
>> (XEN)  0000000089f00000 - 000000008f800000 (reserved)
>> (XEN)  00000000e0000000 - 00000000f0000000 (reserved)
>> (XEN)  00000000fe000000 - 00000000fe011000 (reserved)
>> (XEN)  00000000fec00000 - 00000000fec01000 (reserved)
>> (XEN)  00000000fee00000 - 00000000fee01000 (reserved)
>> (XEN)  00000000ff000000 - 0000000100000000 (reserved)
>> (XEN)  0000000100000000 - 000000086c800000 (usable)
>> (XEN) ACPI: RSDP 84730000, 0024 (r2 FUJ   )
>> (XEN) ACPI: XSDT 847300A8, 00D4 (r1 FUJ    D3644-B1 10600000 AMI     1=
0013)
>> (XEN) ACPI: FACP 84750FE8, 0114 (r6 FUJ    D3644-B1 10600000 AMI     1=
0013)
>> (XEN) ACPI: DSDT 84730210, 20DD1 (r2 FUJ    D3644-B1 10600000 INTL 201=
60527)
>> (XEN) ACPI: FACS 89833080, 0040
>> (XEN) ACPI: APIC 84751100, 0084 (r4 FUJ    D3644-B1 10600000 AMI     1=
0013)
>> (XEN) ACPI: FPDT 84751188, 0044 (r1 FUJ    D3644-B1 10600000 AMI     1=
0013)
>> (XEN) ACPI: FIDT 847511D0, 009C (r1    FUJ D3644-B1 10600000 AMI     1=
0013)
>> (XEN) ACPI: MCFG 84751270, 003C (r1 FUJ    D3644-B1 10600000 MSFT     =
  97)
>> (XEN) ACPI: SSDT 847512B0, 1B1C (r2 CpuRef  CpuSsdt     3000 INTL 2016=
0527)
>> (XEN) ACPI: SSDT 84752DD0, 31C6 (r2 SaSsdt  SaSsdt      3000 INTL 2016=
0527)
>> (XEN) ACPI: HPET 84755F98, 0038 (r1 FUJ    D3644-B1 10600000 AMI   100=
0013)
>> (XEN) ACPI: SSDT 84755FD0, 13FD (r2  INTEL xh_cfsd4        0 INTL 2016=
0527)
>> (XEN) ACPI: UEFI 847573D0, 0042 (r1 FUJ    D3644-B1 10600000 AMI   100=
0013)
>> (XEN) ACPI: LPIT 84757418, 0094 (r1 FUJ    D3644-B1 10600000 AMI   100=
0013)
>> (XEN) ACPI: SSDT 847574B0, 27DE (r2 FUJ    PtidDevc     1000 INTL 2016=
0527)
>> (XEN) ACPI: SSDT 84759C90, 14E2 (r2 FUJ    TbtTypeC        0 INTL 2016=
0527)
>> (XEN) ACPI: DBGP 8475B178, 0034 (r1 FUJ    D3644-B1 10600000 AMI   100=
0013)
>> (XEN) ACPI: DBG2 8475B1B0, 0054 (r0 FUJ    D3644-B1 10600000 AMI   100=
0013)
>> (XEN) ACPI: DMAR 8475B208, 00C8 (r1 INTEL  EDK2            2       100=
0013)
>> (XEN) ACPI: SSDT 8475B2D0, 0144 (r2 Intel  ADebTabl     1000 INTL 2016=
0527)
>> (XEN) ACPI: TPM2 8475B418, 0034 (r4 FUJ    D3644-B1        1 AMI      =
   0)
>> (XEN) ACPI: ASF! 8475B450, 00A0 (r32 FUJ    D3644-B1 10600000 AMI   10=
00013)
>> (XEN) ACPI: SSDT 8475B4F0, 01A4 (r2 FUJ    Gabi0002        2 INTL 2016=
0527)
>> (XEN) ACPI: SSDT 8475B698, 00BB (r2 FUJ    Gabi0001        2 INTL 2016=
0527)
>> (XEN) ACPI: WSMT 8475B758, 0028 (r1 FUJ    D3644-B1 10600000 AMI     1=
0013)
>> (XEN) System RAM: 32508MB (33289104kB)
>> (XEN) No NUMA configuration found
>> (XEN) Faking a node at 0000000000000000-000000086c800000
>> (XEN) Domain heap initialised
>> (XEN) Xen WARN at mm.c:5627
>> (XEN) ----[ Xen-4.11.2-pre  x86_64  debug=3Dn   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d08028e3d0>] ioremap+0xc0/0xd0
>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
>> (XEN) rax: 0000000000000001   rbx: 0000000000000000   rcx: ffff82d0805=
6bc3c
>> (XEN) rdx: ffff82d08056ba84   rsi: 0000000000000000   rdi: 00000000000=
00000
>> (XEN) rbp: 0000000000400000   rsp: ffff82d08044fd38   r8:  00000000000=
01000
>> (XEN) r9:  0000000000000001   r10: 0000000000000000   r11: 00000000000=
00000
>> (XEN) r12: ffff82d0803b8000   r13: 0000000100000000   r14: 00000001000=
00000
>> (XEN) r15: ffff82d080423db8   cr0: 0000000080050033   cr4: 00000000000=
000a0
>> (XEN) cr3: 000000007a244000   cr2: 0000000000000000
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000=
00000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d08028e3d0> (ioremap+0xc0/0xd0):
>> (XEN)  0f 1f 84 00 00 00 00 00 <0f> 0b e9 60 ff ff ff 66 0f 1f 84 00 0=
0 00 00 00
>> (XEN) Xen stack trace from rsp=3Dffff82d08044fd38:
>> (XEN)    0000000000000000 0000000000000000 00007d2000000000 0000000000=
7efce4
>> (XEN)    000000004fffffff ffff82d0803d9682 ffff82d0803b4da0 0000000000=
7efce4
>> (XEN)    030005504fffffff ffff82d000201540 ffff82d08026b3a0 0000003600=
0000aa
>> (XEN)    00000000007efce4 ffff82d0803e5508 ffff83000009dfb0 ffff830000=
09df80
>> (XEN)    fffffffffffff001 ffff83000009df00 0000000000000019 000000007a=
1b9601
>> (XEN)    0000000000000000 0000000001f44000 ffffffff00000000 0000000000=
86c800
>> (XEN)    ffff83000009df80 ffff82d080423bb0 0000000000000001 0000000000=
000001
>> (XEN)    0000000000000001 0000000000000001 0000000000000002 0000000000=
000002
>> (XEN)    0000000000000002 000000000009df80 0000000000589000 0000000000=
588180
>> (XEN)    00000000000001ff 00000000000001ff 0000000000000000 ffffffd080=
448000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000004
>> (XEN)    0000000800000000 000000010000006e 0000000000000003 0000000000=
0002f8
>> (XEN)    0000000000000000 0000000000000000 000000003fbcebe0 000000003f=
f25577
>> (XEN)    0000000000000000 000000007a3bbe04 000000007a1b822e ffff82d080=
2000f3
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d08028e3d0>] ioremap+0xc0/0xd0
>> (XEN)    [<ffff82d0803d9682>] vesa_init+0x62/0x200
>> (XEN)    [<ffff82d08026b3a0>] vesa.c#lfb_flush+0/0x20
>> (XEN)    [<ffff82d0803e5508>] __start_xen+0x2408/0x2f80
>> (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x60
> I'm pretty sure this one is taken care of in 4.11.3; it looks like your=

> gfx card has its frame buffer at an address which is a multiple pf 4Gb.=

> The later crash may then be a result of the earlier issue here. Please
> retry with 4.11.3, and in case this still fails please also try with
> 4.13.0-rc5, if at all possible.
>
> Jan


--------------ms030603070102070705030108
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
DTE5MTIxNzEyMTgxOFowLwYJKoZIhvcNAQkEMSIEIAPvyQY84hSJufq1wYpP9+B/xP4NFIcv
ZXqi5Q/vJ3lHMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAK
BggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYI
KoZIhvcNAwICASgwgbMGCSsGAQQBgjcQBDGBpTCBojCBjTELMAkGA1UEBhMCSVQxEDAOBgNV
BAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xIzAhBgNVBAoMGkFjdGFs
aXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50
aWNhdGlvbiBDQSBHMgIQVXOCsw2VZ98H+TPuE14tLDCBtQYLKoZIhvcNAQkQAgsxgaWggaIw
gY0xCzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4g
UGlldHJvMSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEsMCoGA1UEAwwj
QWN0YWxpcyBDbGllbnQgQXV0aGVudGljYXRpb24gQ0EgRzICEFVzgrMNlWffB/kz7hNeLSww
DQYJKoZIhvcNAQEBBQAEggEApG0RixQNosMBZs/pXiUe5skGF10OEAzfyebb9aXW9qFjI6gQ
T9Sn90hnC9e7GdQs6Y+tgXdTL2F/Q3hXeUVRQ03kLCYHIyprNYa19jx6/G3PY7x+9i6OoSoH
2KcPZgVtnOlnzvHHmTzGNYV560CYaUUYmuGF1TI6WptVSqUKmxQMv7tNhUA6c/PvDpNNj5+0
yKMYxEGlvI+Mf1A0kaSZr/o8RD77U0zESeKrr+6hgeVou54PpAPltWYXaYjOgAcXAyyPi4g+
kNAQUDI+sXz4NNnCVA579mcbZgnfmd70mvZKOSdDR6jyE4V3TB8XvCJuWgPshQEDk4IjIIQX
22SEYgAAAAAAAA==

--------------ms030603070102070705030108--


--===============0277683024093428086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0277683024093428086==--

