Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D715AA5B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 14:48:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1sKr-0007WZ-Kw; Wed, 12 Feb 2020 13:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tZ9R=4A=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1j1sKp-0007WO-DD
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 13:45:47 +0000
X-Inumbo-ID: f81c765c-4d9d-11ea-b759-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f81c765c-4d9d-11ea-b759-12813bfff9fa;
 Wed, 12 Feb 2020 13:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/EcSMbeBlPI25sC3DTJ6Ddc/V3QmE8jhnmtN0NZsaBb7YjrcEs5/R4FL+nKj6oZ1Vw85rra3t1IVqGAzdGG9ys+ecCD1L5K8aZ/j7X/axpjptsa52AQEHB5lyftuOFCyxtvH1kEENWIXphurcUYjCa5DAyKp1djfc/+AzCtXpnhMpHZvN9KV0aghqadtL9D0eNO54qyjjTToIdUsB2XoYY5J20lW0TPDosF+iVjTp+o5c2wAkkLM8B+fuOnAUmJYoLNdFjuN1ldlYvGzwDBmfvfuIZL0719sRKfXtEeLYc6ma/jsQjKkjvqzN3ACbOfXjpmDxDslCUocUb/kVMRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKmJYmrQev6JPLBLt31ENZtyjojok8ftRYKsGlgRkAg=;
 b=GHuX00X54cOQNw7DhNjzlHnIqrzAqJF4JdE+BTuaEyxYwrCv/EUIVymHGw7rG5nN+BFUIhpvtZfIb+EA01LWZntBblYVj3NWg43co2tF7XcGxZIr21KMYWcjsAL+WwFLhabZBJL4UPk5KWrpjQ58vDZqA2UUrhKftFEDRN3zR2Mefrex9JRtgPsVLt0Y4Bu2ROFW32Ui47UtYyTzGdRziGPpQ2dAlyUagiqvY84nkBn3hRDUZNdmHYpXeTggIX/6zVtYurl00zyO61DgKk9XKqclcTqgCHd1K0U3bWD/N15o/Ra7FfBfolRBc9NVtIt4rao2KFU+Wc2lMYttoGF4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKmJYmrQev6JPLBLt31ENZtyjojok8ftRYKsGlgRkAg=;
 b=QQtfEZJzZq5qXc/d0ET80M7/rQpYBcJbMz+YpQ2kYD01iU5b3xeIdy4OD5dsaG8pwat4vHsulcovJSTr+bS4BUqap2nTXXc8a9vFPiuJGneETfrz0ULxQis6tl7N6Q8QV3jbqO92l9qvmYInZItroVvPC/X6Vv++opRaQgaXSlM=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (20.178.205.21) by
 VI1PR04MB4957.eurprd04.prod.outlook.com (20.177.48.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.27; Wed, 12 Feb 2020 13:45:44 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f41c:72d1:8193:286e]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f41c:72d1:8193:286e%7]) with mapi id 15.20.2729.021; Wed, 12 Feb 2020
 13:45:44 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
Thread-Index: AQHV4aq5xQnQHfhMdkCO+1lU3LD8+Q==
Date: Wed, 12 Feb 2020 13:45:44 +0000
Message-ID: <VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <VI1PR04MB5807A7F83F1B2763BD7EEB20F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5807A7F83F1B2763BD7EEB20F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f69ce9e-734a-4652-8001-08d7afc1dbae
x-ms-traffictypediagnostic: VI1PR04MB4957:|VI1PR04MB4957:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4957075E54FD2350F31EA45AF91B0@VI1PR04MB4957.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(189003)(199004)(86362001)(66446008)(26005)(54906003)(76116006)(66556008)(2940100002)(316002)(66476007)(66946007)(33656002)(6916009)(64756008)(6506007)(9686003)(7696005)(2906002)(186003)(45080400002)(4326008)(478600001)(71200400001)(5660300002)(44832011)(81166006)(52536014)(8676002)(966005)(8936002)(81156014)(55016002)(10126625002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4957;
 H:VI1PR04MB5807.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +D08mSDuBm7NYi+tcUlvQLM65fXZqe6W+Hc6gUQ9BZgRd4HL0eaK0XHVfcjgQNNQGNFVsnGRqPP1efsVpC7NgSr6hMOyAag3H/ob1g3jQFxnMaRIl/OXMFT4yKNQNPZXDcebpybWFhZP7Xh0aD1ZoNWgX0s/SaABeWSzs5jMzmfvmw5kUcDJ+ZOHuk2x7m+oQ8wrkrAt6KDcUMWfvFwu1wKuJ6Ucz6VyNS5c107qqontAtLanzYen6lhtyyLW9nCqVWh+KsYmZWBNvkjuiYT31A8lloFAjMsfUX0iUaY9x8g59laAGEd3T4WQdl9OlJ95FHbepwZ0BMyYjYjPf0XFiKwVfZbwX5pR+8ZtiH45qbCDZwCdmP6UQLfCotFEdPl/PdIik95GrMnbFxo4l/7p7nT8JbD5Mj5iIRfJu0wgGvpzwa6KSk9wcmPFGAS5gRvdBL61VS3rEgkAcyKNSJWulJk301vaps9yI9X0hm1DaftoZcnsETj42pVjr7XtVQizIVg2M5Tu4MULKnx6rKSCgH84mdBJY8Td2VePiPUcs+YIyl3myJ70nJ+NN2GbKprNLlhUMvMykJxgc2p2Zoyfw==
x-ms-exchange-antispam-messagedata: myCB+XGokoDg1QWSwGJx8N2MmRJt9FVrphlfUnY6RddfSA20w8+sWGt74WaC2uZpQI+B+sxzBxAuhnDgTZidGxSkMTaIpzFCSy+80O7PZ9BfRnKQUAw/TJqg8e6KQHYpimMrLs9LeYWFOyc1t6yG4w==
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f69ce9e-734a-4652-8001-08d7afc1dbae
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 13:45:44.3740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpCN64n05fTjWIEL24QnakBED3/HNqaTT6fucnfoGV+IdOponLDHCFoOVMxc546ZjCrMTwxek0J7ophLvdgI59qJOO66pbipReAVjkIxo/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4957
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Cc: Jorge Pereira <jorge.pereira@nxp.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2762865968602497794=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2762865968602497794==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0VI1PR04MB5807eurp_"

--_000_VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0VI1PR04MB5807eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[[ Sorry. Needed to send another mail because I forgot to add xen-devel lis=
ts to CC. ]]

Hello,

I applied your direct-map patch, Stefano, on top of RELEASE-4.13.0
Xen.

I also took your advice and used the Imagebuilder tool to setup my
u-boot environment. I modified the tool to allow SDCard booting and
tweaked the parameters a little to fit our platforms, also introducing
support to add "direct-map" parameter in specific /chosen/DomU node
and "xen,passthrough" in the host dts. The tool is very helpful and
allows me to quickly change the u-boot environment without manually
entering all the fdt formatting commands.

The dom0less booting is successful, however, when I try to passthrough
any device (I tried with ethernet card and uSDHC) I get a kernel panic
in DomU when it tries to probe the driver, because of an unhandled
fault:
(XEN) DOM1: [    3.883482] sdhci: Secure Digital Host Controller Interface =
driver
(XEN) DOM1: [    3.891021] sdhci: Copyright(c) Pierre Ossman
(XEN) DOM1: [    3.896389] sdhci-pltfm: SDHCI platform and OF driver helper
(XEN) DOM1: [    3.903298] Unhandled fault at 0xffffff800800d048
(XEN) DOM1: [    3.909021] Mem abort info:
(XEN) DOM1: [    3.912863]   ESR =3D 0x96000000
(XEN) DOM1: [    3.917019]   Exception class =3D DABT (current EL), IL =3D =
32 bits
(XEN) DOM1: [    3.924115]   SET =3D 0, FnV =3D 0
(XEN) DOM1: [    3.928206]   EA =3D 0, S1PTW =3D 0
(XEN) DOM1: [    3.932457] Data abort info:
(XEN) DOM1: [    3.936514]   ISV =3D 0, ISS =3D 0x00000000
(XEN) DOM1: [    3.941398]   CM =3D 0, WnR =3D 0
(XEN) DOM1: [    3.945481] swapper pgtable: 4k pages, 39-bit VAs, pgdp =3D =
(____ptrval____)
(XEN) DOM1: [    3.953532] [ffffff800800d048] pgd=3D00000000bfffe803, pud=
=3D00000000bfffe803, pmd=3D00000000bfffd803, pte=3D00e80000402f0f07
(XEN) DOM1: [    3.965278] Internal error: ttbr address size fault: 9600000=
0 [#1] PREEMPT SMP
(XEN) DOM1: [    3.973546] Modules linked in:
(XEN) DOM1: [    3.977709] Process swapper/0 (pid: 1, stack limit =3D 0x(__=
__ptrval____))
(XEN) DOM1: [    3.985525] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.5=
9-rt24+g00334f2 #1
(XEN) DOM1: [    3.993855] pstate: 60000005 (nZCv daif -PAN -UAO)
(XEN) DOM1: [    3.999755] pc : 0xffffff80083ac864
(XEN) DOM1: [    4.004354] lr : 0xffffff80083ac810
(XEN) DOM1: [    4.008955] sp : ffffff800800bba0
(XEN) DOM1: [    4.013382] x29: ffffff800800bba0 x28: 0000000000000000
(XEN) DOM1: [    4.019805] x27: ffffff800864f068 x26: ffffff80086ba000
(XEN) DOM1: [    4.026228] x25: ffffffc031564980 x24: ffffff800856e0c0
(XEN) DOM1: [    4.032651] x23: ffffffc03e8eec00 x22: ffffffc03e8eec10
(XEN) DOM1: [    4.039074] x21: ffffffc03e8bf500 x20: ffffffc03e8bf800
(XEN) DOM1: [    4.045497] x19: 0000000000000000 x18: ffffffffffffffff
(XEN) DOM1: [    4.051921] x17: 0000000000000000 x16: 0000000000000000
(XEN) DOM1: [    4.058344] x15: ffffff8008678548 x14: ffffffffffffffff
(XEN) DOM1: [    4.064767] x13: 0000000000000018 x12: 0101010101010101
(XEN) DOM1: [    4.071190] x11: 0000000000000020 x10: 0101010101010101
(XEN) DOM1: [    4.077613] x9 : 0000000000000000 x8 : ffffffc031564c00
(XEN) DOM1: [    4.084036] x7 : 0000000000000000 x6 : 000000000000003f
(XEN) DOM1: [    4.090459] x5 : 0000000000000002 x4 : ffffffc03e83b4c0
(XEN) DOM1: [    4.096883] x3 : 0000000000000000 x2 : 0000000000000000
(XEN) DOM1: [    4.103306] x1 : ffffffc03e8bf000 x0 : ffffff800800d048
(XEN) DOM1: [    4.109729] Call trace:
(XEN) DOM1: [    4.113290]  0xffffff80083ac864
(XEN) DOM1: [    4.117541]  0xffffff800832e3b8
(XEN) DOM1: [    4.121795]  0xffffff800832c49c
(XEN) DOM1: [    4.126047]  0xffffff800832c6bc
(XEN) DOM1: [    4.130301]  0xffffff800832c808
(XEN) DOM1: [    4.134554]  0xffffff800832a208
(XEN) DOM1: [    4.138807]  0xffffff800832bd38
(XEN) DOM1: [    4.143060]  0xffffff800832b5d8
(XEN) DOM1: [    4.147314]  0xffffff800832d1f0
(XEN) DOM1: [    4.151567]  0xffffff800832e318
(XEN) DOM1: [    4.155820]  0xffffff800861d5f8
(XEN) DOM1: [    4.160073]  0xffffff800808397c
(XEN) DOM1: [    4.164326]  0xffffff8008600db4
(XEN) DOM1: [    4.168580]  0xffffff80085078c0
(XEN) DOM1: [    4.172833]  0xffffff8008084c30
(XEN) DOM1: [    4.177091] Code: b9000ea0 d5033e9f f9400ea0 91012000 (b9000=
01f)
(XEN) DOM1: [    4.184298] ---[ end trace 7dc5f6b878cccbfa ]---
(XEN) DOM1: [    4.191546] Kernel panic - not syncing: Attempted to kill in=
it! exitcode=3D0x0000000b

I uploaded on pastebin.com the u-boot env settings [0], my device
passthrough partial dts [1], and the whole log of boot messages
from xen, Dom0 and DomU [2]. I also modified the guest address
layout and mapped the PL011 UART and GICv3 addresses to match
the physical ones, as well as setting the GUEST_GNTTAB_BASE and
GUEST_MAGIC_BASE to addresses before our board's RAM start address.
I updated the GUEST_RAM0_BASE and GUEST_RAM0_SIZE to match the
physical ones.

Maybe you could check if I did anything wrong, because I couldn't
figure it out.

[0] https://pastebin.com/As6PgVFf
[1] https://pastebin.com/j0NS4x5Z
[2] https://pastebin.com/TaZR8pii

Thank you once again for your support,
Andrei

--_000_VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0VI1PR04MB5807eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">[[ Sorry. Needed to send another mail because I forg=
ot to add xen-devel lists to CC. ]]<o:p></o:p></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I applied your direct-map patch, Stefano, on top of =
RELEASE-4.13.0<o:p></o:p></p>
<p class=3D"MsoNormal">Xen.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I also took your advice and used the Imagebuilder to=
ol to setup my<o:p></o:p></p>
<p class=3D"MsoNormal">u-boot environment. I modified the tool to allow SDC=
ard booting and<o:p></o:p></p>
<p class=3D"MsoNormal">tweaked the parameters a little to fit our platforms=
, also introducing<o:p></o:p></p>
<p class=3D"MsoNormal">support to add &#8220;direct-map&#8221; parameter in=
 specific /chosen/DomU node<o:p></o:p></p>
<p class=3D"MsoNormal">and &#8220;xen,passthrough&#8221; in the host dts. T=
he tool is very helpful and<o:p></o:p></p>
<p class=3D"MsoNormal">allows me to quickly change the u-boot environment w=
ithout manually<o:p></o:p></p>
<p class=3D"MsoNormal">entering all the fdt formatting commands.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The dom0less booting is successful, however, when I =
try to passthrough<o:p></o:p></p>
<p class=3D"MsoNormal">any device (I tried with ethernet card and uSDHC) I =
get a kernel panic<o:p></o:p></p>
<p class=3D"MsoNormal">in DomU when it tries to probe the driver, because o=
f an unhandled<o:p></o:p></p>
<p class=3D"MsoNormal">fault:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.883482] sdhci: Sec=
ure Digital Host Controller Interface driver<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.891021] sdhci: Cop=
yright(c) Pierre Ossman<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.896389] sdhci-pltf=
m: SDHCI platform and OF driver helper<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.903298] Unhandled =
fault at 0xffffff800800d048<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.909021] Mem abort =
info:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.912863]&nbsp;&nbsp=
; ESR =3D 0x96000000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.917019]&nbsp;&nbsp=
; Exception class =3D DABT (current EL), IL =3D 32 bits<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.924115]&nbsp;&nbsp=
; SET =3D 0, FnV =3D 0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.928206]&nbsp;&nbsp=
; EA =3D 0, S1PTW =3D 0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.932457] Data abort=
 info:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.936514]&nbsp;&nbsp=
; ISV =3D 0, ISS =3D 0x00000000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.941398]&nbsp;&nbsp=
; CM =3D 0, WnR =3D 0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.945481] swapper pg=
table: 4k pages, 39-bit VAs, pgdp =3D (____ptrval____)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.953532] [ffffff800=
800d048] pgd=3D00000000bfffe803, pud=3D00000000bfffe803, pmd=3D00000000bfff=
d803, pte=3D00e80000402f0f07<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.965278] Internal e=
rror: ttbr address size fault: 96000000 [#1] PREEMPT SMP<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.973546] Modules li=
nked in:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.977709] Process sw=
apper/0 (pid: 1, stack limit =3D 0x(____ptrval____))<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.985525] CPU: 0 PID=
: 1 Comm: swapper/0 Not tainted 4.19.59-rt24&#43;g00334f2 #1<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.993855] pstate: 60=
000005 (nZCv daif -PAN -UAO)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 3.999755] pc : 0xfff=
fff80083ac864<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.004354] lr : 0xfff=
fff80083ac810<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.008955] sp : fffff=
f800800bba0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.013382] x29: fffff=
f800800bba0 x28: 0000000000000000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.019805] x27: fffff=
f800864f068 x26: ffffff80086ba000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.026228] x25: fffff=
fc031564980 x24: ffffff800856e0c0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.032651] x23: fffff=
fc03e8eec00 x22: ffffffc03e8eec10<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.039074] x21: fffff=
fc03e8bf500 x20: ffffffc03e8bf800<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [ &nbsp;&nbsp;&nbsp;4.045497] x19: 00000=
00000000000 x18: ffffffffffffffff<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.051921] x17: 00000=
00000000000 x16: 0000000000000000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.058344] x15: fffff=
f8008678548 x14: ffffffffffffffff<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.064767] x13: 00000=
00000000018 x12: 0101010101010101<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.071190] x11: 00000=
00000000020 x10: 0101010101010101<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.077613] x9 : 00000=
00000000000 x8 : ffffffc031564c00<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.084036] x7 : 00000=
00000000000 x6 : 000000000000003f<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.090459] x5 : 00000=
00000000002 x4 : ffffffc03e83b4c0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.096883] x3 : 00000=
00000000000 x2 : 0000000000000000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.103306] x1 : fffff=
fc03e8bf000 x0 : ffffff800800d048<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.109729] Call trace=
:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.113290]&nbsp; 0xff=
ffff80083ac864<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.117541]&nbsp; 0xff=
ffff800832e3b8<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.121795]&nbsp; 0xff=
ffff800832c49c<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.126047]&nbsp; 0xff=
ffff800832c6bc<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.130301]&nbsp; 0xff=
ffff800832c808<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.134554]&nbsp; 0xff=
ffff800832a208<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.138807]&nbsp; 0xff=
ffff800832bd38<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.143060]&nbsp; 0xff=
ffff800832b5d8<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.147314]&nbsp; 0xff=
ffff800832d1f0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.151567]&nbsp; 0xff=
ffff800832e318<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.155820]&nbsp; 0xff=
ffff800861d5f8<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.160073]&nbsp; 0xff=
ffff800808397c<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.164326]&nbsp; 0xff=
ffff8008600db4<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.168580]&nbsp; 0xff=
ffff80085078c0<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.172833]&nbsp; 0xff=
ffff8008084c30<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.177091] Code: b900=
0ea0 d5033e9f f9400ea0 91012000 (b900001f)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.184298] ---[ end t=
race 7dc5f6b878cccbfa ]---<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) DOM1: [&nbsp;&nbsp;&nbsp; 4.191546] Kernel pan=
ic - not syncing: Attempted to kill init! exitcode=3D0x0000000b<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I uploaded on pastebin.com the u-boot env settings [=
0], my device<o:p></o:p></p>
<p class=3D"MsoNormal">passthrough partial dts [1], and the whole log of bo=
ot messages<o:p></o:p></p>
<p class=3D"MsoNormal">from xen, Dom0 and DomU [2]. I also modified the gue=
st address<o:p></o:p></p>
<p class=3D"MsoNormal">layout and mapped the PL011 UART and GICv3 addresses=
 to match<o:p></o:p></p>
<p class=3D"MsoNormal">the physical ones, as well as setting the GUEST_GNTT=
AB_BASE and<o:p></o:p></p>
<p class=3D"MsoNormal">GUEST_MAGIC_BASE to addresses before our board's RAM=
 start address.<o:p></o:p></p>
<p class=3D"MsoNormal">I updated the GUEST_RAM0_BASE and GUEST_RAM0_SIZE to=
 match the<o:p></o:p></p>
<p class=3D"MsoNormal">physical ones.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Maybe you could check if I did anything wrong, becau=
se I couldn't<o:p></o:p></p>
<p class=3D"MsoNormal">figure it out.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[0] <a href=3D"https://pastebin.com/As6PgVFf">https:=
//pastebin.com/As6PgVFf</a><o:p></o:p></p>
<p class=3D"MsoNormal">[1] <a href=3D"https://pastebin.com/j0NS4x5Z">https:=
//pastebin.com/j0NS4x5Z</a><o:p></o:p></p>
<p class=3D"MsoNormal">[2] <a href=3D"https://pastebin.com/TaZR8pii">https:=
//pastebin.com/TaZR8pii</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you once again for your support,<o:p></o:p></p=
>
<p class=3D"MsoNormal">Andrei<o:p></o:p></p>
</div>
</body>
</html>

--_000_VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0VI1PR04MB5807eurp_--


--===============2762865968602497794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2762865968602497794==--

