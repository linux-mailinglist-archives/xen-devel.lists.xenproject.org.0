Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E0104EC0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:09:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXiPF-0005yU-5h; Thu, 21 Nov 2019 09:05:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5bO=ZN=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1iXiPD-0005yN-Kh
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:05:39 +0000
X-Inumbo-ID: 13e488e4-0c3e-11ea-9631-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13e488e4-0c3e-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 09:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjIf3rFadWto2otr6lFn6d5WtVP9Us7g00SQnyTKjKycW8rci5Jvh8EOUzknEBagkY+dNrsATyNjmNw/65EDmBEsd1AOcl3gR2VJwqzF8Ihl+yqSqpmjHKbOH9SeWNqusQP0faQYmK8MFK1a+QyL4s080Oeo56QeahzqshfYWOdg13HXU2Zs6wxj7YbmdlcoMp26/4eYFuX7EFXLcG8ua8a2MprnXF87fHWAKo2GBvH9G9NKIEuqQba1CDwpTPP3Kb/BudVHU7Cat7XI+HzYiJhH+TVcfNjyFXK0cfTkIXHSTUM+bpGeYU91W1ra3DJse0bdv3ZCiA8LwfJhA9rDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+fqswc2KAYIB3mDKfkj0IX+kQgIO94LkOkPKb4NvVU=;
 b=IB/gBdYcby62ZbwjBITOm1jQbUuM6uZqjT0+D1fu4HUGDpwCYULpwPKtdNq0EOR3Me2GltfzG1+SyEpTH5hAr/WN15gEi82eBegXyBRGUjQByFCYT0Uv+Tjl/n0FSWisItmMkK2XJzinbYUiNVipavmjkPfKHQVe2WvixnTgr4QnlFjp3oDjuHCuglDG8iVL8eplmNSeKM9MsNLAZTNFaUjQvQ4J8v2/Q1UbBUZGjTRTx0RD//TQjIpONr7oEvC3B4MbBktY9rQbgw+mTm16sSLrnnx75FKQPMtrAnJWMJhQk2NE5OcbuI0N0kdzI3IkhxZ3Voxu+Rpidgg6D3M4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+fqswc2KAYIB3mDKfkj0IX+kQgIO94LkOkPKb4NvVU=;
 b=igiur2mW3PA0HuYJF3zWBeUYcNISxQRhTraQBrxEpDjUeVRnier7rYz9YAxUW8oTjfk5ve5+nFWEVjfNCMflhbtiYTEsa4eBG/AC9JBy1n+hG1LTZfsf1rTGOORFXl8FvAlzfG503oZJnDzQSoP9XCMY6Tr7aJ/2O88F2FQ0W/o=
Received: from AM6PR03MB4919.eurprd03.prod.outlook.com (20.178.89.32) by
 AM6PR03MB4232.eurprd03.prod.outlook.com (20.177.36.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Thu, 21 Nov 2019 09:05:33 +0000
Received: from AM6PR03MB4919.eurprd03.prod.outlook.com
 ([fe80::a10c:e8a8:56b8:9a71]) by AM6PR03MB4919.eurprd03.prod.outlook.com
 ([fe80::a10c:e8a8:56b8:9a71%4]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 09:05:33 +0000
From: Andrii Anisov <Andrii_Anisov@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov
 <andrii.anisov@gmail.com>
Thread-Topic: [RFC 7/7] arm/gic-v3: add GIC version suffix to iomem range
 variables
Thread-Index: AQHVlINN4KWrn2fXKE6a8Sgjwi+91KeGfN2AgAPnIoCAClVAAIAAspS5
Date: Thu, 21 Nov 2019 09:05:33 +0000
Message-ID: <AM6PR03MB4919AB635A9A4DFD310C2E45E64E0@AM6PR03MB4919.eurprd03.prod.outlook.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-8-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
 <3884e2f3-b523-01ac-e3c3-d6229a91d703@gmail.com>,
 <alpine.DEB.2.21.1911201421430.25834@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911201421430.25834@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrii_Anisov@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fd1b891-e7fe-4637-d8ec-08d76e61f774
x-ms-traffictypediagnostic: AM6PR03MB4232:|AM6PR03MB4232:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 7
x-microsoft-antispam-prvs: <AM6PR03MB423258312D4664FDA71DB53FE64E0@AM6PR03MB4232.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(199004)(189003)(38564003)(6506007)(7736002)(81166006)(53546011)(26005)(71190400001)(71200400001)(316002)(76116006)(74316002)(186003)(64756008)(6246003)(66446008)(3846002)(25786009)(6116002)(4326008)(110136005)(102836004)(66476007)(66556008)(54906003)(55236004)(236005)(11346002)(446003)(105004)(66946007)(55016002)(9686003)(6306002)(54896002)(66066001)(7696005)(76176011)(99286004)(256004)(14444005)(8676002)(33656002)(80792005)(5660300002)(8936002)(478600001)(52536014)(86362001)(19627405001)(2906002)(6436002)(229853002)(606006)(81156014)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4232;
 H:AM6PR03MB4919.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NtGLEn83IQ8Ixhx6rqS6knQvHvDNrGPuh3OxWq23bOELCw7BLyTuQmsPCeuTc6hydn9Bw7GFz0LBG4Hie1a9++L6OQQue2Ea7mg3GjfvzBlUvMjXthtJpvx+a8lLaijWdgF3PfvU+qxdov7g+ZSSgkgWBvFKZfw9UF1RuGE4oqT5EiX6WT3kkelyDdJEipaSNp5o5flpWHGb1hhaKLTtPYFsPkdveK1EQsXqrDJueOleEkErpjLtz5asHid9klsHBd+40Ujq3NQ0JWIXiwCSwRzvOWdZmGclOKgQQsNpH1xQ5ZFi/5Vo/rSl0sI5ux79dZtQ3YU0wYgRIfnZE4j3DHyM1oyYoJPKXD1/ljisX5/ZYi0w5vhXtkj7aZU+IsA1qowT0of2OzR0eRNu4fBTUL0WX57SpFp+JHtq+RPtbPlhpGNRO7Iy/xmheTCfXIb2WQPd36cbSstJGO0B5ITzsOGxdPzWJaTJaTMvi/GxI4I=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd1b891-e7fe-4637-d8ec-08d76e61f774
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 09:05:33.7428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYqZrkzLKsdH6OsxP/Ftur4z5EXY3DjIkAxwA5pCuo1JW/6GK7lGz1bvhpOomGy8h2xEuFQpFdvMqtafL50i+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4232
Subject: Re: [Xen-devel] [RFC 7/7] arm/gic-v3: add GIC version suffix to
 iomem range variables
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
Cc: "lars.kurth.xen@gmail.com" <lars.kurth.xen@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "fusa-sig@lists.xenproject.org" <fusa-sig@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8267318722156899957=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8267318722156899957==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR03MB4919AB635A9A4DFD310C2E45E64E0AM6PR03MB4919eurp_"

--_000_AM6PR03MB4919AB635A9A4DFD310C2E45E64E0AM6PR03MB4919eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Stefano,

I suppose, in the discussion with ARM, it might be useful to come with exis=
ting support case numbers.
Here they are:

Case ID. sort descending<https://support.developer.arm.com/my-cases/?_ga=3D=
2.64479850.476004835.1574326833-426220411.1564048157#> Status. sort descend=
ing<https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476004835.=
1574326833-426220411.1564048157#>  Product. sort descending<https://support=
.developer.arm.com/my-cases/?_ga=3D2.64479850.476004835.1574326833-42622041=
1.1564048157#> Summary. sort descending<https://support.developer.arm.com/m=
y-cases/?_ga=3D2.64479850.476004835.1574326833-426220411.1564048157#> Creat=
ed On. sort descending<https://support.developer.arm.com/my-cases/?_ga=3D2.=
64479850.476004835.1574326833-426220411.1564048157#>      Updated on . sort=
 descending<https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.47=
6004835.1574326833-426220411.1564048157#>     Actions
CAS-138402-Y0Y9C3<https://support.developer.arm.com/case-details/?id=3D9c2b=
d9a0-8af1-e911-b862-28187887f93a>      Defect/Enhancement      ARM COMPILER=
 6  C style shift operators are missed among supported scatter file express=
ions     Oct-18-2019     Nov-19-2019
CAS-137352-T7F4V1<https://support.developer.arm.com/case-details/?id=3Dbacb=
8de4-92ea-e911-b862-28187887f93a>      More Information Needed DS-5 ARM COM=
PILER-6 ULTIMATE FL ARM Linker defined symbols are not counted as referred =
from a steering file.    Oct-09-2019     Nov-12-2019
CAS-138292-L5S0V0<https://support.developer.arm.com/case-details/?id=3Dc69f=
223a-ebf0-e911-b862-28187887f93a>      More Information Needed ARM COMPILER=
 6  Static data symbols, moved to init section, becomes global.     Oct-17-=
2019     Oct-24-2019
CAS-137357-Z7W3B8<https://support.developer.arm.com/case-details/?id=3Dcd97=
ea01-97ea-e911-b862-28187887f93a>      Defect/Enhancement      DS-5 ARM COM=
PILER-6 ULTIMATE FL ARM Compiler 6 compiles data only C file with SoftVFP a=
ttribute.        Oct-09-2019     Oct-18-2019
CAS-137359-V7G6W6<https://support.developer.arm.com/case-details/?id=3Dc921=
919d-97ea-e911-b862-28187887f93a>      Closed  DS-5 ARM COMPILER-6 ULTIMATE=
 FL How to rename sections using ARM Compiler 6 tools?      Oct-09-2019    =
 Oct-11-2019



ANDRII ANISOV

Lead Systems Engineer



Office: +380 44 390 5457<tel:+380%2044%20390%205457> x 66766<tel:66766>   C=
ell: +380 50 573 8852<tel:+380%2050%20573%208852>   Email: andrii_anisov@ep=
am.com<mailto:andrii_anisov@epam.com>

Kyiv, Ukraine (GMT+3)   epam.com<http://www.epam.com>



CONFIDENTIALITY CAUTION AND DISCLAIMER
This message is intended only for the use of the individual(s) or entity(ie=
s) to which it is addressed and contains information that is legally privil=
eged and confidential. If you are not the intended recipient, or the person=
 responsible for delivering the message to the intended recipient, you are =
hereby notified that any dissemination, distribution or copying of this com=
munication is strictly prohibited. All unintended recipients are obliged to=
 delete this message and destroy any printed copies.

________________________________
From: Stefano Stabellini <sstabellini@kernel.org>
Sent: Thursday, November 21, 2019 12:23 AM
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject=
.org <xen-devel@lists.xenproject.org>; Andrii Anisov <Andrii_Anisov@epam.co=
m>; Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epa=
m.com>; fusa-sig@lists.xenproject.org <fusa-sig@lists.xenproject.org>; lars=
.kurth.xen@gmail.com <lars.kurth.xen@gmail.com>
Subject: Re: [RFC 7/7] arm/gic-v3: add GIC version suffix to iomem range va=
riables

On Thu, 14 Nov 2019, Andrii Anisov wrote:
> Hello Stefano,
>
> On 11.11.19 22:59, Stefano Stabellini wrote:
> > this seems a very serious compiler bug.
>
> Yep.
>
> > This, together with the other bug described in the previous patch, make=
s
> > me think the ARMCC is not quite ready for showtime.
>
> Yet, this particular ARM Compiler version is safety certified and LTS.
>
> > Do you know if there
> > are any later version of the compiler that don't have these problems?
>
> I don't know, ARM did not say something special about it. As I know, the
> reason to take this compiler version was that it is the "latest and great=
est"
> safety certified
>
> > I would hate to introduce these workarounds
>
> I hated finding and publishing these workarounds, but here we are.
>
> The main question here is if XEN needs a tag "Support safety certified
> compiler" by the cost of accepting such workarounds.
> Then discuss how to reduce their stench.

Before we get to that point, maybe we can raise the issue with Arm using
our combined channels. I'll raise it internally at Xilinx, and we could
also discuss it during one of the next FuSa calls (list in CC).

--_000_AM6PR03MB4919AB635A9A4DFD310C2E45E64E0AM6PR03MB4919eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Stefano,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I suppose, in the discussion with ARM, it might be useful to come with exis=
ting support case numbers.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Here they are:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<table tabindex=3D"0" style=3D"box-sizing: border-box; border-spacing: 0px;=
 border-collapse: collapse; background-color: rgb(255, 255, 255); width: 11=
40px; max-width: 100%; margin-bottom: 20px; color: rgb(51, 51, 51); font-fa=
mily: Lato; font-size: 14px; font-weight: 300">
<thead style=3D"box-sizing: border-box">
<tr style=3D"box-sizing: border-box">
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 233px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Case ID<sp=
an style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1px; =
overflow: hidden; clip: rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 219px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Status<spa=
n style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1px; o=
verflow: hidden; clip: rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 236px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Product<sp=
an style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1px; =
overflow: hidden; clip: rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 153px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Summary<sp=
an style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1px; =
overflow: hidden; clip: rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 150px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Created On=
<span style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1p=
x; overflow: hidden; clip: rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th style=3D"box-sizing: border-box; padding: 8px; text-align: left; line-h=
eight: 1.42857; vertical-align: bottom; border-bottom: 2px solid rgb(221, 2=
21, 221); background-color: rgb(17, 128, 159); color: white; width: 109px">
<a href=3D"https://support.developer.arm.com/my-cases/?_ga=3D2.64479850.476=
004835.1574326833-426220411.1564048157#" style=3D"box-sizing: border-box; c=
ursor: pointer; font-weight: normal; font-size: 18px !important">Updated on=
<span>&nbsp;</span><span style=3D"box-sizing: border-box; top: 1px; display=
: inline-block; font-family: &quot;Font Awesome 5 Pro&quot;; font-weight: 9=
00; line-height: 1; text-rendering: auto"></span><span style=3D"box-sizing:=
 border-box; width: 1px; height: 1px; margin: -1px; overflow: hidden; clip:=
 rect(0px, 0px, 0px, 0px)">.
 sort descending</span></a></th>
<th tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; text-alig=
n: left; line-height: 1.42857; vertical-align: bottom; border-bottom: 2px s=
olid rgb(221, 221, 221); background-color: rgb(17, 128, 159); color: white;=
 width: 40px">
<span style=3D"box-sizing: border-box; width: 1px; height: 1px; margin: -1p=
x; overflow: hidden; clip: rect(0px, 0px, 0px, 0px)">Actions</span></th>
</tr>
</thead>
<tbody style=3D"box-sizing: border-box">
<tr style=3D"box-sizing: border-box; background-color: rgb(249, 249, 249)">
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 233px">
<a href=3D"https://support.developer.arm.com/case-details/?id=3D9c2bd9a0-8a=
f1-e911-b862-28187887f93a" title=3D"View details" style=3D"box-sizing: bord=
er-box; color: rgb(51, 122, 183); border-bottom: 1px dotted rgb(17, 128, 15=
9)">CAS-138402-Y0Y9C3</a></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px 8px 8px 35=
px; line-height: 1.42857; vertical-align: top; border-top: 1px solid rgb(22=
1, 221, 221); font-size: 19px">
Defect/Enhancement</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 236px">
ARM COMPILER 6</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; word-break: break-word; overflow-wrap: break-word !import=
ant">
C style shift operators are missed among supported scatter file expressions=
</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-18T12:35:32&#43;03:00" style=3D"box-sizing: borde=
r-box">Oct-18-2019</time></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-11-19" style=3D"box-sizing: border-box">Nov-19-2019<=
/time></td>
<td style=3D"box-sizing: border-box; padding: 8px; line-height: 1.42857; ve=
rtical-align: top; border-top: 1px solid rgb(221, 221, 221); font-size: 19p=
x">
</td>
</tr>
<tr style=3D"box-sizing: border-box">
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 233px">
<a href=3D"https://support.developer.arm.com/case-details/?id=3Dbacb8de4-92=
ea-e911-b862-28187887f93a" title=3D"View details" style=3D"box-sizing: bord=
er-box; color: rgb(51, 122, 183); border-bottom: 1px dotted rgb(17, 128, 15=
9)">CAS-137352-T7F4V1</a></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px 8px 8px 35=
px; line-height: 1.42857; vertical-align: top; border-top: 1px solid rgb(22=
1, 221, 221); font-size: 19px">
More Information Needed</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 236px">
DS-5 ARM COMPILER-6 ULTIMATE FL</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; word-break: break-word; overflow-wrap: break-word !import=
ant">
ARM Linker defined symbols are not counted as referred from a steering file=
.</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-09T15:47:04&#43;03:00" style=3D"box-sizing: borde=
r-box">Oct-09-2019</time></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-11-12" style=3D"box-sizing: border-box">Nov-12-2019<=
/time></td>
<td style=3D"box-sizing: border-box; padding: 8px; line-height: 1.42857; ve=
rtical-align: top; border-top: 1px solid rgb(221, 221, 221); font-size: 19p=
x">
</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(249, 249, 249)">
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 233px">
<a href=3D"https://support.developer.arm.com/case-details/?id=3Dc69f223a-eb=
f0-e911-b862-28187887f93a" title=3D"View details" style=3D"box-sizing: bord=
er-box; color: rgb(51, 122, 183); border-bottom: 1px dotted rgb(17, 128, 15=
9)">CAS-138292-L5S0V0</a></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px 8px 8px 35=
px; line-height: 1.42857; vertical-align: top; border-top: 1px solid rgb(22=
1, 221, 221); font-size: 19px">
More Information Needed</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 236px">
ARM COMPILER 6</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; word-break: break-word; overflow-wrap: break-word !import=
ant">
Static data symbols, moved to init section, becomes global.</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-17T17:34:30&#43;03:00" style=3D"box-sizing: borde=
r-box">Oct-17-2019</time></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-24" style=3D"box-sizing: border-box">Oct-24-2019<=
/time></td>
<td style=3D"box-sizing: border-box; padding: 8px; line-height: 1.42857; ve=
rtical-align: top; border-top: 1px solid rgb(221, 221, 221); font-size: 19p=
x">
</td>
</tr>
<tr style=3D"box-sizing: border-box">
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 233px">
<a href=3D"https://support.developer.arm.com/case-details/?id=3Dcd97ea01-97=
ea-e911-b862-28187887f93a" title=3D"View details" style=3D"box-sizing: bord=
er-box; color: rgb(51, 122, 183); border-bottom: 1px dotted rgb(17, 128, 15=
9)">CAS-137357-Z7W3B8</a></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px 8px 8px 35=
px; line-height: 1.42857; vertical-align: top; border-top: 1px solid rgb(22=
1, 221, 221); font-size: 19px">
Defect/Enhancement</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 236px">
DS-5 ARM COMPILER-6 ULTIMATE FL</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; word-break: break-word; overflow-wrap: break-word !import=
ant">
ARM Compiler 6 compiles data only C file with SoftVFP attribute.</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-09T16:16:31&#43;03:00" style=3D"box-sizing: borde=
r-box">Oct-09-2019</time></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-18" style=3D"box-sizing: border-box">Oct-18-2019<=
/time></td>
<td style=3D"box-sizing: border-box; padding: 8px; line-height: 1.42857; ve=
rtical-align: top; border-top: 1px solid rgb(221, 221, 221); font-size: 19p=
x">
</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(249, 249, 249)">
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 233px">
<a href=3D"https://support.developer.arm.com/case-details/?id=3Dc921919d-97=
ea-e911-b862-28187887f93a" title=3D"View details" style=3D"box-sizing: bord=
er-box; color: rgb(51, 122, 183); border-bottom: 1px dotted rgb(17, 128, 15=
9)">CAS-137359-V7G6W6</a></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px 8px 8px 35=
px; line-height: 1.42857; vertical-align: top; border-top: 1px solid rgb(22=
1, 221, 221); font-size: 19px">
Closed</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; width: 236px">
DS-5 ARM COMPILER-6 ULTIMATE FL</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px; word-break: break-word; overflow-wrap: break-word !import=
ant">
How to rename sections using ARM Compiler 6 tools?</td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-09T16:20:52&#43;03:00" style=3D"box-sizing: borde=
r-box">Oct-09-2019</time></td>
<td tabindex=3D"0" style=3D"box-sizing: border-box; padding: 8px; line-heig=
ht: 1.42857; vertical-align: top; border-top: 1px solid rgb(221, 221, 221);=
 font-size: 19px">
<time datetime=3D"2019-10-11" style=3D"box-sizing: border-box">Oct-11-2019<=
/time></td>
</tr>
</tbody>
</table>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>
<p style=3D"font-family:&quot;Times New Roman&quot;; margin-right:0px; marg=
in-left:0px; padding:0px">
<b><span style=3D"font-family:Arial,sans-serif; color:rgb(57,194,215); text=
-transform:uppercase"><font size=3D"2">ANDRII ANISOV</font></span></b></p>
<p style=3D"font-family:&quot;Times New Roman&quot;; margin-right:0px; marg=
in-left:0px; padding:0px">
<b><span style=3D"font-family:Arial,sans-serif; color:rgb(70,69,71)"><font =
size=3D"2">Lead Systems Engineer</font></span></b></p>
<p style=3D"margin-right:0px; margin-left:0px; padding:0px; font-family:Ari=
al,sans-serif; line-height:5pt">
<font size=3D"2">&nbsp;</font></p>
<p style=3D"font-family:&quot;Times New Roman&quot;; margin-right:0px; marg=
in-left:0px; padding:0px">
<font size=3D"2"><b><span style=3D"font-family:Arial,sans-serif; color:rgb(=
102,102,102)">Office:&nbsp;</span></b><span style=3D"font-family:Arial,sans=
-serif; color:rgb(102,102,102)"><a tabindex=3D"0" href=3D"tel:&#43;380 44 3=
90 5457" style=3D"color:rgb(102,102,102); text-decoration:none; border-styl=
e:none">&#43;380
 44 390 5457</a></span>&nbsp;<b><span style=3D"font-family:Arial,sans-serif=
; color:rgb(102,102,102)">x</span></b>&nbsp;<span style=3D"font-family:Aria=
l,sans-serif; color:rgb(102,102,102)"><a tabindex=3D"0" href=3D"tel:66766" =
style=3D"color:rgb(102,102,102); text-decoration:none; border-style:none">6=
6766</a></span>&nbsp;&nbsp;&nbsp;<b><span style=3D"font-family:Arial,sans-s=
erif; color:rgb(102,102,102)">Cell:&nbsp;</span></b><span style=3D"font-fam=
ily:Arial,sans-serif; color:rgb(102,102,102)"><a tabindex=3D"0" href=3D"tel=
:&#43;380 50 573 8852" style=3D"color:rgb(102,102,102); text-decoration:non=
e; border-style:none">&#43;380
 50 573 8852</a></span>&nbsp;&nbsp;&nbsp;<b><span style=3D"font-family:Aria=
l,sans-serif; color:rgb(102,102,102)">Email:&nbsp;</span></b><span style=3D=
"font-family:Arial,sans-serif; color:rgb(102,102,102); text-transform:lower=
case"><a tabindex=3D"0" href=3D"mailto:andrii_anisov@epam.com" style=3D"col=
or:rgb(102,102,102); text-decoration:none; border-style:none">andrii_anisov=
@epam.com</a></span></font></p>
<p style=3D"font-family:&quot;Times New Roman&quot;; margin-right:0px; marg=
in-left:0px; padding:0px">
<font size=3D"2"><b><span style=3D"font-family:Arial,sans-serif; color:rgb(=
102,102,102)">Kyiv</span></b><b><span style=3D"font-family:Arial,sans-serif=
; color:rgb(102,102,102)">,</span></b>&nbsp;<b><span style=3D"font-family:A=
rial,sans-serif; color:rgb(102,102,102)">Ukraine&nbsp;</span></b><span styl=
e=3D"font-family:Arial,sans-serif; color:rgb(102,102,102)">(GMT&#43;3)</spa=
n>&nbsp;&nbsp;&nbsp;<b><span style=3D"font-family:Arial,sans-serif; color:r=
gb(102,102,102)"><a tabindex=3D"0" href=3D"http://www.epam.com" style=3D"co=
lor:rgb(102,102,102); text-decoration:none; border-style:none">epam.com</a>=
</span></b></font></p>
<p style=3D"margin-right:0px; margin-left:0px; padding:0px; font-family:Ari=
al,sans-serif; line-height:10pt">
<font size=3D"2">&nbsp;</font></p>
<p style=3D"font-family:&quot;Times New Roman&quot;; margin-right:0px; marg=
in-left:0px; padding:0px">
<span style=3D"font-family:Arial,sans-serif; color:rgb(153,153,153)"><font =
size=3D"2">CONFIDENTIALITY CAUTION AND DISCLAIMER<br>
This message is intended only for the use of the individual(s) or entity(ie=
s) to which it is addressed and contains information that is legally privil=
eged and confidential. If you are not the intended recipient, or the person=
 responsible for delivering the
 message to the intended recipient, you are hereby notified that any dissem=
ination, distribution or copying of this communication is strictly prohibit=
ed. All unintended recipients are obliged to delete this message and destro=
y any printed copies.</font></span></p>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Stefano Stabellini &l=
t;sstabellini@kernel.org&gt;<br>
<b>Sent:</b> Thursday, November 21, 2019 12:23 AM<br>
<b>To:</b> Andrii Anisov &lt;andrii.anisov@gmail.com&gt;<br>
<b>Cc:</b> Stefano Stabellini &lt;sstabellini@kernel.org&gt;; xen-devel@lis=
ts.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;; Andrii Anisov &lt=
;Andrii_Anisov@epam.com&gt;; Julien Grall &lt;julien@xen.org&gt;; Volodymyr=
 Babchuk &lt;Volodymyr_Babchuk@epam.com&gt;; fusa-sig@lists.xenproject.org
 &lt;fusa-sig@lists.xenproject.org&gt;; lars.kurth.xen@gmail.com &lt;lars.k=
urth.xen@gmail.com&gt;<br>
<b>Subject:</b> Re: [RFC 7/7] arm/gic-v3: add GIC version suffix to iomem r=
ange variables</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 14 Nov 2019, Andrii Anisov wrote:<br>
&gt; Hello Stefano,<br>
&gt; <br>
&gt; On 11.11.19 22:59, Stefano Stabellini wrote:<br>
&gt; &gt; this seems a very serious compiler bug.<br>
&gt; <br>
&gt; Yep.<br>
&gt; <br>
&gt; &gt; This, together with the other bug described in the previous patch=
, makes<br>
&gt; &gt; me think the ARMCC is not quite ready for showtime.<br>
&gt; <br>
&gt; Yet, this particular ARM Compiler version is safety certified and LTS.=
<br>
&gt; <br>
&gt; &gt; Do you know if there<br>
&gt; &gt; are any later version of the compiler that don't have these probl=
ems?<br>
&gt; <br>
&gt; I don't know, ARM did not say something special about it. As I know, t=
he<br>
&gt; reason to take this compiler version was that it is the &quot;latest a=
nd greatest&quot;<br>
&gt; safety certified<br>
&gt; <br>
&gt; &gt; I would hate to introduce these workarounds<br>
&gt; <br>
&gt; I hated finding and publishing these workarounds, but here we are.<br>
&gt; <br>
&gt; The main question here is if XEN needs a tag &quot;Support safety cert=
ified<br>
&gt; compiler&quot; by the cost of accepting such workarounds.<br>
&gt; Then discuss how to reduce their stench.<br>
<br>
Before we get to that point, maybe we can raise the issue with Arm using<br=
>
our combined channels. I'll raise it internally at Xilinx, and we could<br>
also discuss it during one of the next FuSa calls (list in CC).<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR03MB4919AB635A9A4DFD310C2E45E64E0AM6PR03MB4919eurp_--


--===============8267318722156899957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8267318722156899957==--

