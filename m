Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C613B497
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 22:43:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irTuL-0005up-6s; Tue, 14 Jan 2020 21:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9HU=3D=nxp.com=jorge.pereira@srs-us1.protection.inumbo.net>)
 id 1irTuJ-0005uk-FI
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 21:39:27 +0000
X-Inumbo-ID: 4fff2138-3716-11ea-a2eb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fff2138-3716-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 21:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLLoKIaOeuCiy4bas4SUwnJ50CF2fgShzdQzoTEZ2RXUHNjt6TzrhpDArtOfqwBxwCN4E9Dj3pT3FUgb071gXFL1IzZMac2K/xQV5Se1jWzPEX2d8Ql6sm2HI3zjr1nai/O44Qo2JgGIlk6472bsgq/kcx9hyaeMsG3wrCIzx04OEtKGRPzpuD081/9U6zHDsodbQWpxP0+ba5Ju1g0TSR2URHQS3dUK21J3/fB7vQYEM1sEuQDGnKnKQ7zupPUIGMMi/5jG0xMJuCP30u4SFIJ8+IrVsvw5ibcEuJxW0fMlQHLRKBjeW64ERGqNvtyfuYSfrT5AmAq8r/8VKkIFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwG1TlyKlL+DXarZSULG7JD1O0Y1uF4SZ0xk4/a9j7E=;
 b=Q3nCwU0sMGNrr6C7bYhX/COX59HjFWevo20jNRmDluocRqg7gEXpBNgfJN84IKN0joPx7PohRXlJRWcQFS50LQ8aq9BRdlwy0zBpB6uxhdyLWTLarXM2sXuweVTCyfRmuKcave56/3mWSveGNZg56Ve9wttKFsh8X94pS5SBva3Rm5k7TPOiFL9gpCaDgmubgFiKuIeE96SKJvYJP2ZiA7juapbQSmo2f3kAJcIaCttIucnYocKzde3GegV5FQVduwQG6wcVyClmql4YIGJRVFCjjsjiqfrNGTRpF2ibqQIzZ3t5pT1Ec00uGdwti66eAxSTezABEAQGs5ElJQK/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwG1TlyKlL+DXarZSULG7JD1O0Y1uF4SZ0xk4/a9j7E=;
 b=Op+etyLK/UA74FhnoUkkyfE7aGq/GOoeHzYpnCjXaJucTK4F/cQXniVxCfO9vlKYor8YTg4LYhbNxWgeRrcwFfPZNZ5VbqhnmtbMW5auQ8KveBRLQWG4M4SDeGmXbwB2CK7QpliBnoo24I2bhau0QwyNQp2rFxuVjWZLsFpMBuI=
Received: from AM6PR04MB5094.eurprd04.prod.outlook.com (20.177.32.148) by
 AM6PR04MB5255.eurprd04.prod.outlook.com (20.177.33.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Tue, 14 Jan 2020 21:39:14 +0000
Received: from AM6PR04MB5094.eurprd04.prod.outlook.com
 ([fe80::fcdd:2e7:1a89:ecbd]) by AM6PR04MB5094.eurprd04.prod.outlook.com
 ([fe80::fcdd:2e7:1a89:ecbd%3]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 21:39:14 +0000
From: Jorge Pereira <jorge.pereira@nxp.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Having a DOM-U guest with 1:1 mapping in the second stage MMU.
Thread-Index: AdXLIqP6kZ9GrNU2S1+Q7w9nOZRIUw==
Date: Tue, 14 Jan 2020 21:39:14 +0000
Message-ID: <AM6PR04MB5094DE81655072BDA67F7922F0340@AM6PR04MB5094.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jorge.pereira@nxp.com; 
x-originating-ip: [93.3.33.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 246d5d4f-bd95-4ed5-0333-08d7993a3378
x-ms-traffictypediagnostic: AM6PR04MB5255:
x-microsoft-antispam-prvs: <AM6PR04MB525568B4F6BBAA2C097592E9F0340@AM6PR04MB5255.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(9326002)(7696005)(33656002)(478600001)(86362001)(52536014)(2906002)(81166006)(8676002)(186003)(4744005)(9686003)(44832011)(66946007)(5660300002)(81156014)(26005)(76116006)(66446008)(64756008)(66476007)(66556008)(8936002)(55016002)(6916009)(316002)(6506007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB5255;
 H:AM6PR04MB5094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AVkTbC760Fa9XxNj95q/ozIxttoHq4iDjjelLbhRsmYoFy2j1U3RlS4xgqZ0cRV5hXiYHDYDF3JAmBAymbfkAv/E2/ko3jNP3pDWP2eOr6a6NX1tF9zuTrg3TI6C3LgCmExTcm3MWZeOxIri3yuNmfj491JyTg7LyMv3Par/6Ivo3VogXWzcwdhm3ZWzPmzNmlkanT7V2JOvmFso0EFeQIDm6g+81i+KAbxv2TAcvlEFrD0TWxvdnGTchtjo0OOCtdmIEErCMZ97t3ISKvFVmJpfg+a6FIsjmawDoivMVIMI3sc1OtKNI/Ms71emYlWGFgAS1hBrrapH+yfvF/eF0M0QXbZ2bgeriQMLMI2By5kJYzw8ryZbhRcdvmw8yi0rexjxC1c6fleL1zjXblvjrhqhorSKrJN12OyDW+XPupGRiFWnwPImf3AVBFhrrHiK
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246d5d4f-bd95-4ed5-0333-08d7993a3378
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 21:39:14.5701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAomVqNQaU0MGnb4hqLjbwL/Lk3YftS/z6XWcdbxRzBhyb3jXNks7+lw3Vc6wwo/yt59ZuEHxeBEvCRjKOd/Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5255
Subject: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
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
Content-Type: multipart/mixed; boundary="===============6519321185241752627=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6519321185241752627==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB5094DE81655072BDA67F7922F0340AM6PR04MB5094eurp_"

--_000_AM6PR04MB5094DE81655072BDA67F7922F0340AM6PR04MB5094eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

I'm currently using XEN in order to run side-by-side a DOM-0 with a DOM-U g=
uest. My use-case scenario requires in the DOM-U direct access to some dma-=
capable devices such ethernet and some GPUs.

Since our target platform (i.MX8MM) does not support IOMMU, we can't assign=
 dma-capable devices to the DOM-U guest because XEN does not create 1:1 map=
ping for that guest in the 2nd stage MMU. So, guest-virtual addresses are d=
ifferent than the physical ones.

Is it possible to have 1:1 mapping for DOM-U guests? If not, I'm interested=
 to know what would be the estimated effort to support this feature?

Thanks in advance,

Cheers,
Jorge

--_000_AM6PR04MB5094DE81655072BDA67F7922F0340AM6PR04MB5094eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hi Guys,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m currently using XEN in order to run side-b=
y-side a DOM-0 with a DOM-U guest. My use-case scenario requires in the DOM=
-U direct access to some dma-capable devices such ethernet and some GPUs.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since our target platform (i.MX8MM) does not support=
 IOMMU, we can&#8217;t assign dma-capable devices to the DOM-U guest becaus=
e XEN does not create 1:1 mapping for that guest in the 2<sup>nd</sup> stag=
e MMU. So, guest-virtual addresses are different
 than the physical ones.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it possible to have 1:1 mapping for DOM-U guests?=
 If not, I&#8217;m interested to know what would be the estimated effort to=
 support this feature?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">Jorge<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM6PR04MB5094DE81655072BDA67F7922F0340AM6PR04MB5094eurp_--


--===============6519321185241752627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6519321185241752627==--

