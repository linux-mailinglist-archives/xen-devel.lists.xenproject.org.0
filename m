Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E01AA96B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:11:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOil5-0000MM-V7; Wed, 15 Apr 2020 14:11:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zknx=57=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jOil4-0000M3-FE
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:11:18 +0000
X-Inumbo-ID: f8ed8358-7f22-11ea-b58d-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::726])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8ed8358-7f22-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zci6DVyspmqoQQFOykH09HqpiShFzkQlmWf9G59VB+Mkiv4o4EECjsanCR6bzf+3mckqpjDGZCVfXMVFFlaAFKRjalBeU+BvghRr9e5pIcWxpVST669iaZr77DaDyi5/E9ZSFSz8MaEl1eFn4OmW8D2tzYZT0Klk6SeOKlkUX/Y3mh8WTHOAJhLHjN/SaxHhmR/636nIA5hm3kInTHYMfDNZ5klf2j0WiePl7dTGkBT6HV3umqqAc8Wodm0hH1FSZI78zKzMut5VMeCflH4Y5Ubg4KDn2G7b8Ujjg77WlHDYJ2JHecipDOsMV1Plo6C/hO1wmOLHw2yHRQXAAtIAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lne7SihlhgpgTF9QM1IwW3SHzsZpnjI92w/BGjtPjX0=;
 b=ZNVNO/Eyh3ZFgrv03MoAABcEDHgzW0XFBuQH9dmUIIzfai3/7jAiQD670AlGwuE7luqn+ZEVzxbUCPCBbl8mSCtOwLThMCyapaygarZVvPDj86p9ATqz3e98HX/26ym7k9vtSehz+bF7EtoDfPwXcuBHWdBUvuePQZZOF1J12rI1yoJQcziue2FbhU1ron2xnGhWesaSYnC25u6/g3F/8sErw4Xypyvq7grmeFsxhy/eO1vdq/k/XR8Uw0tG/3nfBoaEnDDzIfJpYknxcVhJgeFck93AOVMDHjeOzkN7dZJ6zJw5nucInBDEWH/F0zn71sISaRhTrGE3+FRRFFsacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lne7SihlhgpgTF9QM1IwW3SHzsZpnjI92w/BGjtPjX0=;
 b=u8mMdqnkMxU/ggeNlhpK10Kg4qvI0O3AKC+AijSSyNjfmk7ncJhsdXerieZyZ2UhttlUF62nkbBlDKVsBu9/Wsufy+39zuZ8yYxzCZkLUTen0pxfQeLk1ZdYfpkKF71pt/WnT0NkOXlX9GKemDQ3jMQcBuEy8HpPOZIZf7bmZAg=
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB4930.eurprd02.prod.outlook.com (2603:10a6:20b:34::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 14:11:15 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 14:11:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH V1] Fix for Coverity ID: 1461759
Thread-Topic: [PATCH V1] Fix for Coverity ID: 1461759
Thread-Index: AQHWEy1HfbxtRzn/mUapOUDkpksJAqh6Nd+AgAAC1Zw=
Date: Wed, 15 Apr 2020 14:11:15 +0000
Message-ID: <AM6PR02MB52234AD1FCEF514332BA8D28ABDB0@AM6PR02MB5223.eurprd02.prod.outlook.com>
References: <20200415135313.12886-1-aisaila@bitdefender.com>,
 <20200415135943.rx6tqgdmyflyxuqv@debian>
In-Reply-To: <20200415135943.rx6tqgdmyflyxuqv@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-originating-ip: [82.77.232.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 859b6298-7a6b-43e0-38d6-08d7e146dc57
x-ms-traffictypediagnostic: AM6PR02MB4930:|AM6PR02MB4930:
x-microsoft-antispam-prvs: <AM6PR02MB4930C611FED709D667BCE7A0ABDB0@AM6PR02MB4930.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(366004)(39860400002)(376002)(136003)(396003)(478600001)(66556008)(66476007)(76116006)(91956017)(64756008)(66446008)(86362001)(66946007)(52536014)(7696005)(26005)(71200400001)(53546011)(33656002)(4326008)(8936002)(55016002)(54906003)(316002)(19627405001)(4744005)(5660300002)(6916009)(6506007)(186003)(8676002)(81156014)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9URQFGJLGVFhT94skQGw22wwyjysQ3OLZiHaaqeN1PXJXLaskufvExcKVUBVmrquHuQBXY/0DIGe1aOINwo7xS3BCgW9GFHsWMwe1DGi9Y6kAbsu17/JX+3G/BAKIjpvIuixN88ZAG1S0cVi5J2XO3v5aoq75j6wD1MutplxJjrMAMZI6xRO1YoEHTHLPlwrqoiVC/XaI0fA5bLEaDINYC9fS8eMj+8YiLifsHDzzFur5PKHRHSHDA8JQPRjIafUtRztWgkbGJ3IeFyMGGifb8aqiEbWXkD9bGkI9VG+3t7IQRgKIblruJKKYdzH5CGPE5HhG84oSgeok2ySzDnv8FZv2JxKbPv4EAnKGpwQzFoKx/ExXjE1d5xV3xuGTYF+rzdc5Lr6Mr0VeVV9/YF4njQuluuxM+KO664vO5tU67bjMfNsHsDFmLDTMq85Jz9
x-ms-exchange-antispam-messagedata: IW4zWp+IZXWaQlsGvtnnDcS4YGNE5ggLb5TFi/satjw0ObUWQdQBP12OxU4i0PiXBiUUK8aVI8ttnpjXwjm06nJCSIKrntiJFaY4uOi+ClZs+9MQDpevmZYsTSdB8s017qk5v7F4zcqJvnIbwU83gA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM6PR02MB52234AD1FCEF514332BA8D28ABDB0AM6PR02MB5223eurp_"
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859b6298-7a6b-43e0-38d6-08d7e146dc57
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 14:11:15.5849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvZXxictfMVOgMgnWq/iOeANHl1RuYuXQZP7blMMiRVyveNbIjODd462H0nmzWX2pVAvDdaRP2nlUoRIFB8jLrQGbTG4mSeIG0eFYOpL7Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4930
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_AM6PR02MB52234AD1FCEF514332BA8D28ABDB0AM6PR02MB5223eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Wei L=
iu <wl@xen.org>
Sent: Wednesday, April 15, 2020 4:59 PM
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Roger =
Pau Monn=E9 <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Jan Beulich <jbeu=
lich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH V1] Fix for Coverity ID: 1461759

On Wed, Apr 15, 2020 at 04:53:13PM +0300, Alexandru Isaila wrote:
> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>

Thanks, but Roger already posted a fix for this.

Sorry about the late reaction to this, I did no check my email.

Alex

--_000_AM6PR02MB52234AD1FCEF514332BA8D28ABDB0AM6PR02MB5223eurp_
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
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Xen-devel &lt;xen-dev=
el-bounces@lists.xenproject.org&gt; on behalf of Wei Liu &lt;wl@xen.org&gt;=
<br>
<b>Sent:</b> Wednesday, April 15, 2020 4:59 PM<br>
<b>To:</b> Alexandru Stefan ISAILA &lt;aisaila@bitdefender.com&gt;<br>
<b>Cc:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;; Roger Pau Monn=E9 &lt;roger.pau@citrix.com&gt;; Wei Liu &lt;wl@xen.o=
rg&gt;; Jan Beulich &lt;jbeulich@suse.com&gt;; Andrew Cooper &lt;andrew.coo=
per3@citrix.com&gt;<br>
<b>Subject:</b> Re: [PATCH V1] Fix for Coverity ID: 1461759</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Wed, Apr 15, 2020 at 04:53:13PM &#43;0300, Alex=
andru Isaila wrote:<br>
&gt; Signed-off-by: Alexandru Isaila &lt;aisaila@bitdefender.com&gt;<br>
<br>
Thanks, but Roger already posted a fix for this.<br>
<br>
Sorry about the late reaction to this, I did no check my email.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Alex</div>
</span></font></div>
</body>
</html>

--_000_AM6PR02MB52234AD1FCEF514332BA8D28ABDB0AM6PR02MB5223eurp_--

