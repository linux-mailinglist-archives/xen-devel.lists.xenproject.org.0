Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0C1213D3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 19:05:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iguh4-0001aF-Tj; Mon, 16 Dec 2019 18:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pcwt=2G=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1iguh3-0001aA-5s
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 18:02:05 +0000
X-Inumbo-ID: 294772f6-202e-11ea-93e8-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 294772f6-202e-11ea-93e8-12813bfff9fa;
 Mon, 16 Dec 2019 18:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhzoqQtA7Wo1jh7PG6nZpjr/pcc6MDg0k0d6EKImQjtigC04akM6Fw2zELoGOTwhyPSMb4hG3OJjtBtSkRv43pf76uZIby/f3R/og0ONMV0fUPJl4qv3ZUc7vahv8PFJ7hzmV5fmiY3FNggugv/RT9EK1e8DDlaHwh26W/fZ/KOjJa5XG20mWLTztQ0YJNczbCrw2As9N4tCakhu9LxjCRVuCdRBT4fHtDvOjdNe3OhyYFaw5mIogNsHz5LAZMncjXrUEpf6vD/ZZ+uxxeAyS93JlwRA5nC1rbcoFLNIUU3NrBlaNGQW2HWXqcrcAtKU8zjJz914vEKWpgExlbQqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSN7KCj+0Pz9kamq8gC+nbtZAkSSNDjsVPGp82op2B8=;
 b=Ojll0keqczzPlLS6dZdEGL/T85JoqrPL0VB1mvUbsOCZvYPm08vINqLSB0yOy3GOQ5JS/Jzb2fC9zIjWjFQUB8qWO4ILTm43pyjbaoZEqbj4A10sUtU9Xa625qsN8vJxgqj9+rteYGPtGcNvJJnXrDILnKf2jsTHhrvh5EmqIFhuOkBAvhARBVdBt8gRF1GM6u6Mkl8eWPZ3QASwtRgcwA28O10zwxmdzKLCUUfFw+OjlNM7WpXusIg520bdG+q5KmikI6pCKwDDx1Qd0SHKkw+U7Qjbfh5Vn0vOvu63ivSAgUhLr7PU2O/2By8gy3URv3VKXdedCRElwH3xb0VgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSN7KCj+0Pz9kamq8gC+nbtZAkSSNDjsVPGp82op2B8=;
 b=DiER2g1n/74v0rxo2wBxaM3jNUFsGNT7XpJl3Zb8fwONS639fAhit/kd0kjNLKMGAUoS3ziwkFZ8pVj/jmfGBLUrdvDzmp4mEd6ck4Pt5BA94MqSKalgk6XVJPIXGEXQa5cVKc2zuUhDwI2R12d0SmzPQ5EobexbqE86JG60Rgc=
Received: from AM6PR04MB4246.eurprd04.prod.outlook.com (52.135.169.32) by
 AM6PR04MB6296.eurprd04.prod.outlook.com (20.179.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 18:02:01 +0000
Received: from AM6PR04MB4246.eurprd04.prod.outlook.com
 ([fe80::e052:2c12:209a:b3d2]) by AM6PR04MB4246.eurprd04.prod.outlook.com
 ([fe80::e052:2c12:209a:b3d2%3]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:02:01 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Xen ARM Dom0less passthrough without IOMMU
Thread-Index: AdW0NHh2M3zfc0eaRyiUiVp25xvkkg==
Date: Mon, 16 Dec 2019 18:02:00 +0000
Message-ID: <AM6PR04MB42465A5C5405FE85DA1F6FB0F9510@AM6PR04MB4246.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4422b8f3-ff10-4c0b-56f5-08d782520cfa
x-ms-traffictypediagnostic: AM6PR04MB6296:
x-microsoft-antispam-prvs: <AM6PR04MB6296BF8A2C06FA2E869E6776F9510@AM6PR04MB6296.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(42274003)(199004)(189003)(316002)(86362001)(8676002)(76116006)(26005)(71200400001)(33656002)(66446008)(55016002)(2906002)(9686003)(6916009)(478600001)(21615005)(66946007)(5660300002)(66476007)(66556008)(44832011)(6506007)(64756008)(186003)(81166006)(81156014)(52536014)(9326002)(8936002)(7696005)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB6296;
 H:AM6PR04MB4246.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LgH2aFxXVMaN+s7Q/Ewd+0geOoa60HGdbh0Vu+DvGf+baNODwqBPwCh5p1hGCF0HQPfAAoinHWnamXIYG+BiEEeUqNtbpl/luAfynaBP9LcrEVjak/KJJA5lE4LEDQw+gY+oPYUr7YjrABsvh6Oy0uxBDNz3OswD1jN6qcHAVBqn30k2TSmQW8wm2miJGc6F3ev3kSoKXxiRkBmumOMiqfbjEmS36pefd2fjEnl9cPJqNjng8aN6SJQWujFHCzYR/M4ZiayqOJULWaR0tEuXonivnhG2bJZ3P8cwrB6o5Nxi6hPmDpp8F0PEK2lkjnpNnFVeMKZRrIwgE5nYLmTLHGe/B+z9YGeQ8SDZXJX2qsdYxbPq9/5rQZ2ISMiyaKzVlxK+YrbmtHOvI4um3ZcaFUtVYLhgbHVxSVTnbxskSJIT61pr5PM3VmqPSeeSGF4HSPp4Z8Z7kvGxzYANJjBoxzERJo3nuF6WGG0aJcd/2ivZbVl6ReCJ7Qx3XNsGqit0TM0sse9gsoBr6DscqK7YwMqaU3B2ODaCRDSBUZaPrjA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4422b8f3-ff10-4c0b-56f5-08d782520cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:02:01.0667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4TPp6MerH7MjICShLsg5ZQ93JV+yxO2FgMtFUE3pnBzH8sAOqwnHtMp8E0gEHGqhX7ET6oqoXd5gAUiJpHRKz4yR34XkL1su4Fn1P6OVyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6296
Subject: [Xen-devel]  Xen ARM Dom0less passthrough without IOMMU
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
Content-Type: multipart/mixed; boundary="===============5521852722845181784=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5521852722845181784==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB42465A5C5405FE85DA1F6FB0F9510AM6PR04MB4246eurp_"

--_000_AM6PR04MB42465A5C5405FE85DA1F6FB0F9510AM6PR04MB4246eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is Andrei Cherechesu and I'm a Software Engineer at NXP
Semiconductors in the Automotive department, Linux BSP Team.
I would like to tell you have done a great job so far with Xen.

Thus, we have ported and integrated Xen ARM in the Linux BSP for our
boards.

Currently, we are trying to passthrough devices in order to statically
assign them to different DomUs at boot time (Dom0less configuration).

Our boards do not have an IOMMU and so our work is only possible
with the help of the patches submitted by Stefano Stabellini that
implemented "xen,force-assign-without-iommu" property in the
partial device trees used for passthrough.

I made a configuration in order to setup the dtb /chosen
node to boot a Dom0less VM in parallel with Dom0, with a
peripherical device statically assigned to it.

However, only if I advertise the passthrough dtb node in u-boot,
when I boot Xen, I am given the following error:

(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 00000000be800000
(XEN) Loading ramdisk from boot module @ 00000000b1000000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x000000d0000000-0x000000f0000000 (512MB)
(XEN) Grant table range: 0x00000080200000-0x00000080240000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 00000000be800000 to 00000000d0080000-00000000d093=
0008
(XEN) Loading dom0 initrd from 00000000b1000000 to 0x00000000d8200000-0x000=
00000e01fffff
(XEN) Loading dom0 DTB to 0x00000000d8000000-0x00000000d800596a
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) domain.c:322: IOMMU is not enabled
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Error creating domain domU1
(XEN) ****************************************

My Xen is taken from Stefano's tree (http://xenbits.xenproject.org/git-http=
/people/sstabellini/xen-unstable.git)
that he specified in this<https://lists.xenproject.org/archives/html/xen-de=
vel/2019-10/msg00414.html> thread index, and only has the additional commit=
s
that add support for our boards applied by myself.

From what I've read on the mailing lists, the Dom0less Device
Passthrough Without IOMMU feature is supported, at least,
on boards that do have a physical IOMMU but have some devices that
are not behind it.

My question is: In the way that it is currently implemented,
is the Dom0less Device Passthrough feature currently supported
on boards that do not have an IOMMU at all?

I can provide my complete u-boot environment config commands and
the Xen boot messages.

Thank you for your support,
Andrei Cherechesu

--_000_AM6PR04MB42465A5C5405FE85DA1F6FB0F9510AM6PR04MB4246eurp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My name is Andrei Cherechesu and I'm a Software Engi=
neer at NXP<o:p></o:p></p>
<p class=3D"MsoNormal">Semiconductors in the Automotive department, Linux B=
SP Team.<o:p></o:p></p>
<p class=3D"MsoNormal">I would like to tell you have done a great job so fa=
r with Xen.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thus, we have ported and integrated Xen ARM in the L=
inux BSP for our<o:p></o:p></p>
<p class=3D"MsoNormal">boards.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently, we are trying to passthrough devices in o=
rder to statically<o:p></o:p></p>
<p class=3D"MsoNormal">assign them to different DomUs at boot time (Dom0les=
s configuration).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our boards do not have an IOMMU and so our work is o=
nly possible<o:p></o:p></p>
<p class=3D"MsoNormal">with the help of the patches submitted by Stefano St=
abellini that<o:p></o:p></p>
<p class=3D"MsoNormal">implemented &quot;xen,force-assign-without-iommu&quo=
t; property in the<o:p></o:p></p>
<p class=3D"MsoNormal">partial device trees used for passthrough.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I made a configuration in order to setup the dtb /ch=
osen<o:p></o:p></p>
<p class=3D"MsoNormal">node to boot a Dom0less VM in parallel with Dom0, wi=
th a<o:p></o:p></p>
<p class=3D"MsoNormal">peripherical device statically assigned to it.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, only if I advertise the passthrough dtb nod=
e in u-boot,
<o:p></o:p></p>
<p class=3D"MsoNormal">when I boot Xen, I am given the following error:<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">(XEN) *** LOADING DOMAIN 0 ***<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Loading d0 kernel from boot module @ 00000000b=
e800000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Loading ramdisk from boot module @ 00000000b10=
00000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Allocating 1:1 mappings totalling 512MB for do=
m0:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) BANK[0] 0x000000d0000000-0x000000f0000000 (512=
MB)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Grant table range: 0x00000080200000-0x00000080=
240000<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Allocating PPI 16 for event channel interrupt<=
o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Loading zImage from 00000000be800000 to 000000=
00d0080000-00000000d0930008<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Loading dom0 initrd from 00000000b1000000 to 0=
x00000000d8200000-0x00000000e01fffff<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Loading dom0 DTB to 0x00000000d8000000-0x00000=
000d800596a<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Initial low memory virq threshold set at 0x400=
0 pages.<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Scrubbing Free RAM in background<o:p></o:p></p=
>
<p class=3D"MsoNormal">(XEN) Std. Loglevel: All<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Guest Loglevel: All<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) *** Serial input to DOM0 (type 'CTRL-a' three =
times to switch input)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) domain.c:322: IOMMU is not enabled <o:p></o:p>=
</p>
<p class=3D"MsoNormal">(XEN)<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) ****************************************<o:p><=
/o:p></p>
<p class=3D"MsoNormal">(XEN) Panic on CPU 0:<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) Error creating domain domU1<o:p></o:p></p>
<p class=3D"MsoNormal">(XEN) ****************************************<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My Xen is taken from Stefano&#8217;s tree (<a href=
=3D"http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.=
git">http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable=
.git</a>)<o:p></o:p></p>
<p class=3D"MsoNormal">that he specified in <a href=3D"https://lists.xenpro=
ject.org/archives/html/xen-devel/2019-10/msg00414.html">
this</a> thread index, and only has the additional commits<o:p></o:p></p>
<p class=3D"MsoNormal">that add support for our boards applied by myself.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From what I've read on the mailing lists, the Dom0le=
ss Device<o:p></o:p></p>
<p class=3D"MsoNormal">Passthrough Without IOMMU feature is supported, at l=
east,<o:p></o:p></p>
<p class=3D"MsoNormal">on boards that do have a physical IOMMU but have som=
e devices that
<o:p></o:p></p>
<p class=3D"MsoNormal">are not behind it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My question is: In the way that it is currently impl=
emented,<o:p></o:p></p>
<p class=3D"MsoNormal">is the Dom0less Device Passthrough feature currently=
 supported<o:p></o:p></p>
<p class=3D"MsoNormal">on boards that do not have an IOMMU at all?<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can provide my complete u-boot environment config =
commands and<o:p></o:p></p>
<p class=3D"MsoNormal">the Xen boot messages.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your support,<o:p></o:p></p>
<p class=3D"MsoNormal">Andrei Cherechesu<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM6PR04MB42465A5C5405FE85DA1F6FB0F9510AM6PR04MB4246eurp_--


--===============5521852722845181784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5521852722845181784==--

