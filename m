Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E146AD2E6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 07:56:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Cay-0004sX-VX; Mon, 09 Sep 2019 05:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jhf9=XE=kpit.com=dhananjay.joshi@srs-us1.protection.inumbo.net>)
 id 1i7Ca1-0004qn-4U
 for xen-devel@lists.xen.org; Mon, 09 Sep 2019 05:51:13 +0000
X-Inumbo-ID: d256125a-d2c5-11e9-b299-bc764e2007e4
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [40.107.138.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d256125a-d2c5-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 05:51:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEBnVzpgkGgOJJ5FjZdyx8powhKlIPdQ3Gb5WPcpCiP6MZv9jIrhezqdM4jyt1meoFLR0OczCiIijQHzzBVxCMW+f3wlDiYYUDCR91RzetGzjUZyOS1zyG9o1TCxKbx0U7cMA2Iijgn21nDUGRshi2y8riyTAFeif5826n59p1coOm53i/nTKxLe5eNkTxIu6l94Ne85/rGLcBpJYcJc1I3F5/DuncG9qqovapIeETjDsM4kENVjl0T7H9Ns4ibwRiALHrnxZ/z0vslwsoAj9dhsmoVmJcmD8jnRjUZ/bSbNKnZ5IPmeDkHuBbkH6pepjSv59gIIaw7oMRjggjONbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho126F0VSohJkW3jX8hgfR1UIKCJQgnVVWnYzAbIJgk=;
 b=lGA10apMF+Gu/2OP0hmizGINf8WcLzI+R93eMnH/sCKkkIU8ffVvFZOUmgYBeurU4HEwC4fNotY7C4uLRkKAPclCvgr8oMX42Y2YfrITkUChIR6wBMnbxLlaO7QAcK09FVG0/Uo+8Zdv1g7v9Z3pN5usBzS95kBlWTwhJUlaCOiRTrlk6y+7C+OhYeWYuQDMCuqZitJ9D8wMbgx90c/tAYD6ZqPCwm+7b3feZFqfU+mHohLyTy5S8ZDWkQk6rNQtIALSi+/2ppuLe24Ifko4AN+oLn/acMW6B/ef52VF40kBTThdKPZfAGnj91tp4c8flpVz6BODBQk7MfoDd0Ph5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho126F0VSohJkW3jX8hgfR1UIKCJQgnVVWnYzAbIJgk=;
 b=Q2UXCPnI/S647yGtmzP3LVQWdPOA8OPKr3GcijF4AEZc14BjpfgQYD64xocGMqr9P51jdDscgVzMQi4Cht6IN6gQ7oTIOPH6kD0P5n+5VlNFP/G82/qKZUkkJVQAI4+fP3gBBRcIuHTZBjKi3xZvgDqrUg2VcbFBC9ddDLgQpZM=
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM (20.178.172.15) by
 BM1PR01MB2673.INDPRD01.PROD.OUTLOOK.COM (20.178.175.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 05:51:06 +0000
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2541:c2bb:6f76:d29a]) by BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2541:c2bb:6f76:d29a%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 05:51:06 +0000
From: Dhananjay Joshi <Dhananjay.Joshi@kpit.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Thread-Topic: Running xen on Rpi3
Thread-Index: AQHVZtJ3BiCxFUbAJ0WIYRix5ujswA==
Date: Mon, 9 Sep 2019 05:51:05 +0000
Message-ID: <BM1PR01MB2545F19A84B189C28591F33094B70@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dhananjay.Joshi@kpit.com; 
x-originating-ip: [103.243.227.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dc79990-ed7d-4116-f51e-08d734e9b4dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BM1PR01MB2673; 
x-ms-traffictypediagnostic: BM1PR01MB2673:
x-microsoft-antispam-prvs: <BM1PR01MB267329FF3E63B4418919787C94B70@BM1PR01MB2673.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(26005)(6436002)(186003)(74316002)(6916009)(71190400001)(81156014)(102836004)(81166006)(105004)(476003)(8676002)(2351001)(486006)(6116002)(3846002)(71200400001)(66556008)(8936002)(7736002)(19627405001)(99286004)(76116006)(52536014)(316002)(66476007)(86362001)(66946007)(64756008)(66446008)(66574012)(4744005)(7696005)(256004)(14444005)(5640700003)(55016002)(54896002)(9686003)(53936002)(2501003)(6506007)(25786009)(33656002)(2906002)(478600001)(14454004)(66066001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BM1PR01MB2673;
 H:BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jbq7Hl1vl9F+/vyYPQvwZkSDgy818QioJjV7ZUioEjkQ6cicNXHJpRAD3RK/6AibUa3itlYaWAjzdxxRL1by8rIZ/JxOj/PNEGHhR0nTEhgqyqUxsNxP1tyDDjsrP+OcAjLn+FFrRl+AMGLW0naMlyiMdXyvQwx3UUL6kWiqm+pwy0Gs6KqIn4J20FXkpkzAq1mkxHyVNvphJMnGwVrmvQK7uhexjlbh13926D7U5X+3fWvdPY/mAC4I9Go2iF1rXB3EkpNhRLxJmahco7f9Ag+24YqHokprKFyhfCogDJrNgIm9h+69JJcDckvWtRqUfU9mc0uBsQDbPLeZoV0y11tum3A50p2mfjCSfWUr2cCXgEz75ccWdYipOOHb/64JYM6zz13Hzd+0sHCmh3tiQBUTjAYIVQ9cAJDqcBCYkSQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc79990-ed7d-4116-f51e-08d734e9b4dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 05:51:05.3313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6LRvy7DyEwr+/WjM87sq4tGgPfAMRbt2i0h0aWzlc0m4StkSSji0DYwten4iIis2t9mW9X4qkMhoHOHYmji0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2673
X-Mailman-Approved-At: Mon, 09 Sep 2019 05:52:11 +0000
Subject: [Xen-devel] Running xen on Rpi3
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
Content-Type: multipart/mixed; boundary="===============0695954021028111407=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0695954021028111407==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB2545F19A84B189C28591F33094B70BM1PR01MB2545INDP_"

--_000_BM1PR01MB2545F19A84B189C28591F33094B70BM1PR01MB2545INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
Does anyone has successfully ported xen on RPI3 ?
I have tried it with ubuntu 18.04 installed on RPI3 , but xen is not bootin=
g with EFI grub.

Any pointer will help here.

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BM1PR01MB2545F19A84B189C28591F33094B70BM1PR01MB2545INDP_
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
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Does anyone has successfully ported xen on RPI3 ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have tried it with ubuntu 18.04 installed on RPI3 , but xen is not bootin=
g with EFI grub.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Any pointer will help here.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
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

--_000_BM1PR01MB2545F19A84B189C28591F33094B70BM1PR01MB2545INDP_--


--===============0695954021028111407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0695954021028111407==--

