Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF9E6BC7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 06:17:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOxLb-0007SE-8N; Mon, 28 Oct 2019 05:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZpHj=YU=wustl.edu=oren.bell@srs-us1.protection.inumbo.net>)
 id 1iOl7w-0004Df-2L
 for xen-devel@lists.xenproject.org; Sun, 27 Oct 2019 16:10:48 +0000
X-Inumbo-ID: 43f2bca4-f8d4-11e9-beca-bc764e2007e4
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (unknown
 [104.47.46.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43f2bca4-f8d4-11e9-beca-bc764e2007e4;
 Sun, 27 Oct 2019 16:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRV+IVitfrLabkoeu4BnUllbkZYezTqri6ThNjLix/eQOglQo4GXdymKrpkCuLLatsQXC61k0br7bJILoQIzA85PvpDMWfQatqsjZUODh+lEMeqsXxEDYCwJA+jwjcD7jDi9zSDg3bgI0MPoxemJ+RNxk0TW1RlhM6n7HfoXwfYo+Ko6Eit2uvkAh0cZF1nY2i3r6X1B4D/z6YTdCMWvnHu2v9ClQ9Gel3v/Eabpx09YS9EFRiwDe3cwhJGEeJvCxKo2tx85scLbrIS5GouvMUVgoJ9Ln78TA66ESBFypqeczOjtMOBxJUWlCTu7WX/N1Y/oW9X4al09jMMDGXbsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fyz2kIrlzM4Tlu+6yelRvTO4V24g2ZyA68vZx7zu10=;
 b=Kiq2fqaeti8ulL1ALLNW/Mk3eHQKn67WRtOkp1ulLTyEHEyub1CApFyGdGUn3Qzp+Q3G79dk+jlPywXCnvIAkBOKYTKrVQNoNQGLcJQsCwBBhM9r4K8OZh6ngL95q/Qkr/y6tb43Pqg+dLP/NtfUv/annWVgrCOfRQr7cMyTQabnbbNciyEPSyjYBqPlQZpfDQF1OlGRBnrH80GiEHIP8jBb+7i9V1GYjBUr/TcSFl8U42ivZx6hSMJH5+ru8lO3PsJwhG5j3uIoUMEXjVpvV4je6dtgeT6ErkE8grmgpm7Kua5xEtBsRypNeX4RkpwMNIfY8xB0n7vVZ6d0+l9URg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wustl.edu; dmarc=pass action=none header.from=wustl.edu;
 dkim=pass header.d=wustl.edu; arc=none
Received: from SN6PR02MB4719.namprd02.prod.outlook.com (52.135.113.216) by
 SN6PR02MB5293.namprd02.prod.outlook.com (52.135.104.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sun, 27 Oct 2019 16:10:00 +0000
Received: from SN6PR02MB4719.namprd02.prod.outlook.com
 ([fe80::b96f:40be:9447:4dba]) by SN6PR02MB4719.namprd02.prod.outlook.com
 ([fe80::b96f:40be:9447:4dba%3]) with mapi id 15.20.2387.025; Sun, 27 Oct 2019
 16:10:00 +0000
From: "Bell, Oren" <oren.bell@wustl.edu>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
Thread-Index: AQHVjN9Jz8ZYVdlqdkGT46MhTzcVOg==
Date: Sun, 27 Oct 2019 16:09:59 +0000
Message-ID: <SN6PR02MB47196DB277CAFEA9B4D5FD51F6670@SN6PR02MB4719.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oren.bell@wustl.edu; 
x-originating-ip: [193.37.253.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0582c21-6946-434b-7286-08d75af81e2c
x-ms-traffictypediagnostic: SN6PR02MB5293:
x-microsoft-antispam-prvs: <SN6PR02MB529351E9075EA1B979781680F6670@SN6PR02MB5293.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0203C93D51
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(2906002)(3846002)(5660300002)(8936002)(33656002)(88552002)(71190400001)(71200400001)(4744005)(9686003)(55016002)(5640700003)(186003)(8676002)(74316002)(81166006)(81156014)(786003)(7736002)(6116002)(14454004)(54896002)(6436002)(316002)(86362001)(76116006)(2501003)(75432002)(6916009)(99286004)(66066001)(102836004)(26005)(6506007)(7696005)(256004)(25786009)(105004)(2351001)(476003)(66946007)(486006)(19627405001)(66476007)(66556008)(64756008)(66446008)(478600001)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5293;
 H:SN6PR02MB4719.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wustl.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2KBAiXjdW4efZ5456SXWPDl/w9MC0eEE/zcMO/VaNF6xbvJAxFjIAP8un+bWnAM1Z5v8blU4rALLTXEemxy+cagAWn0oWxfKA6VNy0ELZio/dSjeZyIxOliQHPdE/DR7SJlMvbCZLcGrHZifkXcerCh4OgiIoYsQVY+GmYUK1h/6ZZs6eAqrdr+Jtj49MSfthu8os8x76FH/jbdk0OQjw4sWv/J36WM1ULRRjfAONyMzsEKZg0kV0K+Q9Zf1C3hYSmkhAaDQzB0jXIww0GN6GpMVSVjua1or9ByW8KdHNAUaLN8Zn9E7bD6kLWfZJ5Z9GjSu2rf1yzJMKOxSPz5OXTAorW1bo0eG9qCV4Njwl7N1PUqbkSyC9jw2nfj2DorjyyMzMWCE/RjhjqTdpFihWBgp6nHXM3xhOfY+oBKHPEA8VR7X/IfNW2qumlvYhKE
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wustl.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f0582c21-6946-434b-7286-08d75af81e2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2019 16:09:59.9633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ccca3b5-71cd-4e6d-974b-4d9beb96c6d6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yi66uFpbAZwU7bTtBCQL1vc5tSConYZisp3QGz6/wkknKRH5rj+HjjS0/ClBtrDBEdUQvcgz/ywmyc2uhQX4yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5293
X-Mailman-Approved-At: Mon, 28 Oct 2019 05:13:41 +0000
Subject: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
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
Content-Type: multipart/mixed; boundary="===============4776134138193268879=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4776134138193268879==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR02MB47196DB277CAFEA9B4D5FD51F6670SN6PR02MB4719namp_"

--_000_SN6PR02MB47196DB277CAFEA9B4D5FD51F6670SN6PR02MB4719namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've encountered an issue where installing Xen >4.10 on a Dell Optiplex wil=
l break the onboard NIC. This issue persists if the computer is booted with=
out Xen, after OS reinstall, and even if removing the SSD and HDD completel=
y to boot from a LiveUSB. The only way to fix the issue is to install Windo=
ws 10 on the machine. This appears to "fix" the firmware of the NIC. After =
reinstalling Ubuntu, the NIC continues to work (until Xen is installed agai=
n).

This bug was confirmed with both Xen 4.10 and 4.12 installed on Ubuntu 18.0=
4.

If this is a known issue, is there some "in-work patch" I can be pointed to=
?

--_000_SN6PR02MB47196DB277CAFEA9B4D5FD51F6670SN6PR02MB4719namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
I've encountered an issue where installing Xen &gt;4.10 on a Dell Optiplex =
will break the onboard NIC. This issue persists if the computer is booted w=
ithout Xen, after OS reinstall, and even if removing the SSD and HDD comple=
tely to boot from a LiveUSB. The only
 way to fix the issue is to install Windows 10 on the machine. This appears=
 to &quot;fix&quot; the firmware of the NIC. After reinstalling Ubuntu, the=
 NIC continues to work (until Xen is installed again).</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
This bug was confirmed with both Xen 4.10 and 4.12 installed on Ubuntu 18.0=
4.</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
If this is a known issue, is there some &quot;in-work patch&quot; I can be =
pointed to?</div>
</div>
</body>
</html>

--_000_SN6PR02MB47196DB277CAFEA9B4D5FD51F6670SN6PR02MB4719namp_--


--===============4776134138193268879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4776134138193268879==--

