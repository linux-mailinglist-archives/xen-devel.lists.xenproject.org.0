Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC2975F57
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 08:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqu6R-0005cm-Bk; Fri, 26 Jul 2019 06:53:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V6Fd=VX=kpit.com=raushan.kumar@srs-us1.protection.inumbo.net>)
 id 1hqtgW-0003Ko-0f
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 06:26:32 +0000
X-Inumbo-ID: 4d21bb45-af6e-11e9-8980-bc764e045a96
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [40.107.138.84]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4d21bb45-af6e-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 06:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYpPpQpc9nC1FLVhxYsaECPnojKM6NyHKhsFyF3A6WsP0Gcwm/sCyb6FiwDUXoNSkyhbeubVPF0tIXreBkiyn29q27m5EN2Z6a3Z/hz+TfQ3wLBLfazrM2zFcNw8LThfKEwmSx0kB/mxB3yD7GneNvDCWoPe+XKmUgjuEmSQhfTEEqflOw67acNCU9lUOXuX0yojuZQ8JsixcsGG0eGhwWZFMsP4L3zEfyaour+bMB4Z0V02YXMKoxcdtxUb+KFL6UjgaSKp7M6McDDI5PF7WJluEHhflXbGUmHElVzO5OS4oK9iLXbrulWwzY6M/JI54O/NghNyqCT73V9maQlvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRe4P6kUCk0uFaPmxlhLDHkNtAk8l3gVeaO/yy/VNxU=;
 b=fx9qtrLVPjNl2+LZBp+28E0gCMgWzxgPJoPp+y4zZm51yUjhWUBbtEUFAln1fdrSYbAdlf2RAQ+U/7ae+4t2yLEC3BQjC/Esi262+4MgqJYzc3/HY5hc21v+lL9WjEojyndgxWoL9jVZQ+1U8vm1nri+Omms+Joir1rh9D62msU/MyoL7FhaTyGYop9Ue8QxrlHr/3JsJQ7u2M5JdurVyLPHYcBX2+FaFPXa2pim7I6eK2Y0hvE/sM1eo2xAklurUfKXQDfMajdHVouizA1L5OdNGg6Alv+mxQHiLEQywBC7wsmSrFwGU66B7A5kGhIKUxYtHPlZ7bt51J6NlTVkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=kpit.com;dmarc=pass action=none header.from=kpit.com;dkim=pass
 header.d=kpit.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRe4P6kUCk0uFaPmxlhLDHkNtAk8l3gVeaO/yy/VNxU=;
 b=g1J811K89+lVHWeYZoV4dPkCoH3YFJbX40Onrr6cyti7YTzwVhNfXtiDYNRVUZri/DmPdsS0/QYSDioJwGpOkmYMBdhDIoKxrjuQOQpjXQp6tfNsli5rKMv/CxgFNza151t/P1EAwp4Cn5VpTMGOHwDPqHckIYRVfrKtL08cH/o=
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM (20.178.170.143) by
 BMXPR01MB2951.INDPRD01.PROD.OUTLOOK.COM (52.133.135.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.11; Fri, 26 Jul 2019 06:26:25 +0000
Received: from BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7]) by BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7cb7:a3cd:3751:adc7%4]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 06:26:25 +0000
From: Raushan Kumar <Raushan.Kumar@kpit.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Assign dedicated CPU to domain
Thread-Index: AdVDenbAEcdYgDmURkO34xNpwwLmTQ==
Date: Fri, 26 Jul 2019 06:26:25 +0000
Message-ID: <BMXPR01MB27756A5FB61F20E8035AE7E58FC00@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Raushan.Kumar@kpit.com; 
x-originating-ip: [115.110.69.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91ce457a-5b92-4bc3-7951-08d711922fb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BMXPR01MB2951; 
x-ms-traffictypediagnostic: BMXPR01MB2951:
x-microsoft-antispam-prvs: <BMXPR01MB2951C6EB7C96B02E6D3460C08FC00@BMXPR01MB2951.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(6306002)(25786009)(54896002)(9686003)(99286004)(53936002)(55016002)(5640700003)(86362001)(2351001)(4744005)(66066001)(256004)(14444005)(6436002)(68736007)(66476007)(64756008)(66446008)(6916009)(66574012)(66946007)(66556008)(33656002)(8676002)(76116006)(81156014)(81166006)(8936002)(316002)(486006)(71200400001)(478600001)(14454004)(71190400001)(52536014)(7736002)(3846002)(790700001)(74316002)(6116002)(5660300002)(186003)(2906002)(102836004)(26005)(6506007)(2501003)(476003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB2951;
 H:BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aBGRQ6yYPvaBTznLuIln4yBUsTk3PH2D1tfs02udUfPnpj0Zmt+MZ0sAMylR5BBMbFLQb+kLBiDWzdLsFKFCM4oVDMICMFoqe89vBFqYGRRfm2TfXEvk+rTq3v+Ym0IxQ5Yrf5wjsnn14mKJFZUOSP1uGF9JVja6CeNY3nmDb4enoufGYDPK0CV/swGSKxZ8e7eb4zAtboWE7qanqKsWKUjutibv+s66srZN2nZ3syzK1ezYeavH+jycM6OL7+V//ElQewA5mMajAHoUf/YngvPKuTKik0wWakD1zpdUX20NO0mcKkyuff9HU0gyem6qbSbGgTZ8m7kJBd9y86MXiiLSpwEbKwIvkZyg515OM85NRuRMZAGUrE9bN9FYm+kDX5Y6swt1rlyK0leU6z7mlQsrAz0Iv1tWMFWdTnrlNdk=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ce457a-5b92-4bc3-7951-08d711922fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 06:26:25.4111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: raushank@kpit.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2951
X-Mailman-Approved-At: Fri, 26 Jul 2019 06:53:18 +0000
Subject: [Xen-devel] Assign dedicated CPU to domain
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
Content-Type: multipart/mixed; boundary="===============0025458577629836521=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0025458577629836521==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB27756A5FB61F20E8035AE7E58FC00BMXPR01MB2775INDP_"

--_000_BMXPR01MB27756A5FB61F20E8035AE7E58FC00BMXPR01MB2775INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team,

I am beginner for XEN platform and curious to know how to assign specific C=
PU to dom0 and domU?
Could you please provide me any relevant link for same? I have two CPU ARCH=
 Cortex -A57 and Cortex A-53  and I want to assign dom0 to Cortex -A57 and =
cross check that Is it assign to same or not?


Please provide me link .

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

--_000_BMXPR01MB27756A5FB61F20E8035AE7E58FC00BMXPR01MB2775INDP_
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
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
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
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal">Hi team, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am beginner for XEN platform and curious to know h=
ow to assign specific CPU to dom0 and domU?<o:p></o:p></p>
<p class=3D"MsoNormal">Could you please provide me any relevant link for sa=
me? I have two CPU ARCH Cortex &#8211;A57 and Cortex A-53&nbsp; and I want =
to assign dom0 to Cortex &#8211;A57 and cross check that Is it assign to sa=
me or not?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please provide me link .<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Raushan.<o:p></o:p></p>
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

--_000_BMXPR01MB27756A5FB61F20E8035AE7E58FC00BMXPR01MB2775INDP_--


--===============0025458577629836521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0025458577629836521==--

