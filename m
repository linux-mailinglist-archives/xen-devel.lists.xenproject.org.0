Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654A5126BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315433.534176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgC-0005R5-Cu; Wed, 27 Apr 2022 23:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315433.534176; Wed, 27 Apr 2022 23:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgC-0005Pq-4M; Wed, 27 Apr 2022 23:02:40 +0000
Received: by outflank-mailman (input) for mailman id 315433;
 Wed, 27 Apr 2022 20:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uiE5=VF=xilinx.com=stefanos@srs-se1.protection.inumbo.net>)
 id 1njnrR-0006eW-VX
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 20:02:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e78e8d-c664-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 22:02:04 +0200 (CEST)
Received: from MN2PR02MB6735.namprd02.prod.outlook.com (2603:10b6:208:1d7::9)
 by DM6PR02MB6202.namprd02.prod.outlook.com (2603:10b6:5:1f6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 20:02:00 +0000
Received: from MN2PR02MB6735.namprd02.prod.outlook.com
 ([fe80::644a:36a0:8412:7bf2]) by MN2PR02MB6735.namprd02.prod.outlook.com
 ([fe80::644a:36a0:8412:7bf2%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 20:02:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e7e78e8d-c664-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO17iOMgZgG9HZL22JUBhEhx3QsvPHB+rc8RRSq8c4eUWaeJmNg4JYBNu8W6Qru1OGEllsWoYtsfI8WGoWt024/2wdN0WXnX5x4cvGzqN3SpXG1pim7EzrxRJp2OFgaLONUpUJw8nhyk/iII9I8+K6nTakXK+aHCAWdydqmX8gsKkBtid5uEbwbHYhbUn5lEsmk2aPy8yIXpbjCxUJdA9xVAzWmZoe8dIVuN1DXh/K92oYxDo8eBNtsEggRlGo1bQyXk93jVKmy1dUfCFicL1c9xd0rWPGsrj3gdMA7Kry/YFlI7fnAbqYmCYF12tY4K5vaNMNrlFlbiea/MVihaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFBFzP+PLhAST/K7s7g7cso+IG34XV4WSITyCAz2l5Y=;
 b=oKImo8AY+UA1nf7w/CqAiOeXtpfJK+RPlbPeNcxd3MnbtpF1vfGPURFNQpxG3oMQqsIH4RZWxNHa5F029/QUnJVVXWp/K/qluc3uW0icEJ7u+olH1a5iaPAYqqI5+mVU7OOHkKA8o+pHj1LjX9c1790kOVDhYV9hYYXP3abC5beBIjSnfeJfgHzbakx9uEnzsFC9x2iutvsScVK/Y8NKRvl0pb+ZKntZJniZZ1gNSVqYicoBpcfRkx92Nh0K0ronOzZ3xisXS59+GYJkC5D0/IoFpzbYvHXQYiRxEyXSdSKLRqUP0qBJeiwIfKWbWCF2BGUyPpF0tsK0vUyW47ZiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFBFzP+PLhAST/K7s7g7cso+IG34XV4WSITyCAz2l5Y=;
 b=GBf4vJ2VxpjEZk83LqZgAd/5dP6cKxdq8FCoQaBdrWuCTNnZhBEpqYiViEbNRdw7QAzZQzOvMdu/hDEFMviHOsCPoEFjIgilh950DwPK6KsbarfM1e2nKIxMAXOCvx4KChypHSPv10tAI8lGQ8I++5pKQkm7+EZvFK+AzKUhRHo=
From: Stefano Stabellini <stefanos@xilinx.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "julien@xen.org" <julien@xen.org>,
	"Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "jgrall@amazon.co.uk" <jgrall@amazon.co.uk>
CC: Artem Mygaiev <Artem_Mygaiev@epam.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>
Subject: Xen and MISRA C
Thread-Topic: Xen and MISRA C
Thread-Index: AdhacUrlvS+VJZZQSkqstKYTX0mVww==
Date: Wed, 27 Apr 2022 20:02:00 +0000
Message-ID:
 <MN2PR02MB6735E566BE6BF5B740836111A0FA9@MN2PR02MB6735.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-exchange-calendar-series-instance-id:
 BAAAAIIA4AB0xbcQGoLgCAAAAADx6M1KcVrYAQAAAAAAAAAAEAAAANOH5Ssr/q9GjEWLMGO4ivY=
x-ms-traffictypediagnostic:
 MN2PR02MB6735:EE_MeetingMessage|DM6PR02MB6202:EE_MeetingMessage
x-ms-office365-filtering-correlation-id: 9d8a64ae-de6b-4328-9158-08da2888ca66
x-microsoft-antispam-prvs:
 <DM6PR02MB620248FD2E967173069AE6E4A0FA9@DM6PR02MB6202.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /lRwVZlaG3FEYNF1zG/q11mt9U+JBYGtwCjO3vH1JlYX2Cm4nRUdWKMlYCwQq6+FvALUIh1HSLS9d60oFzG0hRPAIQOrAdeRhrQcw17uAre7/Vpek1UzPdZwTDnvGSrOwwFGzTJqwRrZ6jYPPoGvMaKTVjGZDvRx2obM2iWXqEh2l8+vqqbQDuMPvhC27GPnlN3ghgDuO2SaOZ1oqvrMOyf0ELKazmrYA3U120RAFhhG0iq1kLmFBomw6cA/vUmlpSpnEt5ApKGs1VLDJTZhy4DDKHxacFiSng/AU7J358vrLZ/nQaO2aI15C694gMdjuQi+6HaKVOs7JpoL4s1WNSc1yrCJBD5YjVrIM4UbuRrv0aBiPCDMtP+aesTzzBhkr8vuRIah29gmE0UzEXrAQWSwK3NCWT7IvGStjHPHipuc5dbmvhqsaAKftlLyKWkES5qouAMPRyzr1YuORZefGyzaG9ODgY+atotqSKzSYjy05IhtENP3yE0bg4/1ubJOjRbo4TJo7O/lGftvm68fgLf4qFftVubmcSgu21bPMM38CdYpfoXxspukY9PwRg1eBhEt/gHeeFD4SSbP6gA24AQVPjPIvM/hBmtO+dsvh/cS8EmNnfmZsBkUOQn+H20kV7sfkqc/kHxfl9dwRlRIm8p6uXUKm8g8a6MC/XMzTmSkZ6PKIE8Eoo4Cc3fmZMgGZ09p9bqRIaeCXJeaAUKn9tKWRNQBQBowpXUGeawDax0s0GTkRvpM4sMxRcBy3WVtAI77Gx0FHZvU76U3z0NMYznZfKYDa0/q5BfZpnJ+giV43vQZwaKrQtSxVAp2wVKkLastMo3QtZ8zfZ7Olh5Nsg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB6735.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(4326008)(9686003)(64756008)(122000001)(66476007)(66556008)(66446008)(38070700005)(52536014)(76116006)(8676002)(26005)(966005)(166002)(71200400001)(316002)(55016003)(5660300002)(110136005)(3480700007)(91956017)(8936002)(508600001)(7416002)(86362001)(7696005)(6506007)(40140700001)(2906002)(186003)(33656002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/wmCrOySTcJgTOCS8HWNYoKwDAojnAppQtXxZRLaxlrR/1SANexSwLAiTP?=
 =?iso-8859-1?Q?iFjiHYaBleBVNo6i6VdM25P/VJ+CVagD4CgD6lOXukW+im1RVPrl8X5pOi?=
 =?iso-8859-1?Q?y7Jgt20HXNCQfPxcbTwAqtXzsGdyiJhNP8dQ3DFGh86XXwO9qgCa3GtCqJ?=
 =?iso-8859-1?Q?fr+JjwcElrEjLAnIflMH14PqrYhcB+IyGGm58KZ8n4MziIRXrBs7+fPUnH?=
 =?iso-8859-1?Q?60FQFXkey2+ODXpS2Sfh5lTaGwiWtZB2zJYM0vIKOasfgeys4L6AXzTQAj?=
 =?iso-8859-1?Q?a0KgfWov4Snw4sbh4cZvJ+YOazQRhM3DiNfMOFH6pZIr8fyG+hcg3bg2rk?=
 =?iso-8859-1?Q?FtAiSoNN8VOSBMy59KG46sY4EMRtC33D19nG5w83ozZPzv2dFG2h0RDYx1?=
 =?iso-8859-1?Q?54gPGq/LwTYOoBiBZuBV5fRowJ3oO9rQjc3rO6h9yQqQZY82T5xMZNNQsY?=
 =?iso-8859-1?Q?gSAYoVrsYsuf5WukTF5yREPZrYpx71P5Gpb/4Ci8bs9xvJAaCEDGfBvyGV?=
 =?iso-8859-1?Q?Nho3FhGbEUJfrMX8aF5+HQsKT98lKHMk4Com3aFAqgOQx9sRBdu/Sx+8g7?=
 =?iso-8859-1?Q?467OW+3sT5iMrxRsj35IJ6TpTWsqwXYHIL4dO4MSx7fZXRAgarg+ua6OF2?=
 =?iso-8859-1?Q?B4npXwGgchaDz+lF9ETDYhEOLGcin8xHgqdLOFo3YIyiMTVicR1vQOcScO?=
 =?iso-8859-1?Q?UdHC0byndIyYMfKhebIi1dfEWm38cc7iX7YZGTcr4Y2zb1JY39r44RhIGn?=
 =?iso-8859-1?Q?wBTq9rt3yEHi7Ee1K1MxFmfjnu050ZJ7OblvukLDwy8lgI4F/ilr6FRwvW?=
 =?iso-8859-1?Q?5DCzHFri56qIFRY3awKK0v1wU1jiIHQg4aggK+VtfPV3/c3sDoX3w1vumU?=
 =?iso-8859-1?Q?gB9ZHo/2M0/ew4vvAigBxPKK1IVLF96Tt3nrAXHJjW6WAA4oylTGIEqhRb?=
 =?iso-8859-1?Q?IA7tiRx5S+1Iyr4Sj2YKoF8GBGPwZe3NxC1lnleH/rHgHNw5WDiJLF5nSg?=
 =?iso-8859-1?Q?cMb3g3itEutueg9mxTu4yXyZ4mGo7T2P1HGKIwjZxtNDtC6qSySkdGo0eN?=
 =?iso-8859-1?Q?EPKyt8aUu4to12xHUzR2oGXpWrt2GE1I+V+0Ob2rPH6meG98g7iLYoGfWl?=
 =?iso-8859-1?Q?IHK6+U52ojbxOp3pWawaOJ3Tb9jkYSZ2zXpm42ftefyz1lUkXlcODf1x4d?=
 =?iso-8859-1?Q?wlQZz8gvQI32TQGbUD5O+4qShejI4fgBuDU1iUdYXCjLDUfQMzaLQ2sbvU?=
 =?iso-8859-1?Q?i+KEkaPIY2OZ210l3FbuVfQ1Dm1r9RLG0Tpoy6YtuF/c9izd4EmUqPXOzV?=
 =?iso-8859-1?Q?lEkllGtcphzLUYKIeKMKxbJIj4hr6yoGqWJShkBLS2g38aPCgB8ByvkKXe?=
 =?iso-8859-1?Q?yfOONHH3ZuIp4lW4+JcezQbAMm+yrC8aSjzDvLMrvwJcQBONvBbFJTGpyU?=
 =?iso-8859-1?Q?8DY86rfGRO+w4spvLrFmeIWKp/MctT2sRU7NC0gjEhHc5EysG91X+LUNu8?=
 =?iso-8859-1?Q?Mei5DUbefy07a/qOiXGfZIBTQQ7xqjFMyqo+VwZP/ab5VBzZj+1VoNa2lP?=
 =?iso-8859-1?Q?2FGHy+qvmhM3I47WJTO/g3gcLjUEzqlBib8vwlO5gXjy9IsYCl6LVIN8Pq?=
 =?iso-8859-1?Q?Z7e1qwdEFWnclMyCwyAHpEaw1JH+PPWT1INC8Y9LCS44yE4LL1HK8fUDri?=
 =?iso-8859-1?Q?ULc4Mo46n1qoY4GgMWqTcQ4MkDdYMXNCNoZZgSPOKQ2ZjFKKI6yQ11s7GF?=
 =?iso-8859-1?Q?r3cJwUj8PqehV9it74xi6moZhm12QV94QNMtJ9LLfkpY/HkC/iFaGU6t7w?=
 =?iso-8859-1?Q?7PoaRGWN4A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MN2PR02MB6735E566BE6BF5B740836111A0FA9MN2PR02MB6735namp_"
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6735.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a64ae-de6b-4328-9158-08da2888ca66
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 20:02:00.2416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +BGAsKQ+fJ8KpgJpNcjlRQISEXrwfoOxEPTBr2dSNL4DfINzbjXJbHPuaqzA7eFvq/g8YVRbEhOz7MHwczIRYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6202

--_000_MN2PR02MB6735E566BE6BF5B740836111A0FA9MN2PR02MB6735namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


 Xen Community meeting to discuss MISRA C adoption in Xen
[https://st2.zoom.us/static/6.1.6144/image/new/ZoomLogo_110_25.png] <https:=
//zoom.us>
Hi there,
Stefano Stabellini is inviting you to a scheduled Zoom meeting.
Join Zoom Meeting<https://xilinx.zoom.us/j/92403591689?from=3Daddon>
Phone one-tap:  US: +16699006833,,92403591689#<tel:+16699006833,,9240359168=
9#> or +17209289299,,92403591689#<tel:+17209289299,,92403591689#>
Meeting URL:    https://xilinx.zoom.us/j/92403591689?from=3Daddon
Meeting ID:     924 0359 1689
Join by Telephone
For higher quality, dial a number based on your current location.
Dial:
US: +1 669 900 6833 or +1 720 928 9299 or +1 929 205 6099 or 888 475 4499 (=
Toll Free) or 833 548 0276 (Toll Free) or 833 548 0282 (Toll Free) or 877 8=
53 5257 (Toll Free)
India: +91 226 480 2722 or +91 22 71 279 525 or +91 406 480 2722 or +91 446=
 480 2722 or +91 806 480 2722 or +91 80 71 279 440 or +91 116 480 2722 or +=
91 22 48 798 004 or +91 224 879 8012 or +91 225 097 2742 or +91 225 097 274=
3 or +91 225 097 2744 or +91 225 097 2745 or 000 800 050 5050 (Toll Free) o=
r 000 800 001 4002 (Toll Free)
Ireland: +353 1 653 3895 or +353 6 163 9031 or +353 1 536 9320 or 1800 943 =
965 (Toll Free) or 1800 949 238 (Toll Free) or 1800 901 561 (Toll Free)
Singapore: +65 3165 1065 or +65 3158 7288 or 800 101 3814 (Toll Free) or 80=
0 852 6054 (Toll Free) or 1800 407 5602 (Toll Free)
Meeting ID:     924 0359 1689
International numbers<https://xilinx.zoom.us/u/adNNo1nqsl>
Join from a Video Conference room system
Meeting ID:     924 0359 1689
US:     92403591689@global.zoomcrc.com
APAC:   92403591689@global.zoomcrc.com
India:  92403591689@global.zoomcrc.com
Europe:         92403591689@global.zoomcrc.com
SIP:    92403591689@zoomcrc.com

--_000_MN2PR02MB6735E566BE6BF5B740836111A0FA9MN2PR02MB6735namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<span>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
</span>
<div class=3D"elementToProof"><span><a class=3D"x_MsoNormal">&nbsp;</a></sp=
an>Xen Community meeting to discuss MISRA C adoption in Xen</div>
<span>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" st=
yle=3D"font-size:13px; color:#39394d; font-family:Arial; background-color:#=
f4f5f9; width:100%; height:100%; padding-bottom:10px">
<tbody>
<tr>
</tr>
</tbody>
</table>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" st=
yle=3D"font-size:13px; color:#39394d; font-family:Arial; background-color:#=
f4f5f9; width:100%; height:100%; padding-bottom:10px">
<tbody>
<tr>
<td style=3D"vertical-align:top">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" st=
yle=3D"width:592px">
<tbody>
<tr>
<td style=3D"">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" st=
yle=3D"margin-left:0px; margin-right:0px; width:100%; background-color:#fff=
fff; padding-bottom:37px">
<tbody>
<tr>
<td style=3D"padding-top:30px; padding-bottom:10px; background-color:#f4f5f=
9"><a href=3D"https://zoom.us"><img width=3D"110" height=3D"25" border=3D"0=
" style=3D"border-style:solid" src=3D"https://st2.zoom.us/static/6.1.6144/i=
mage/new/ZoomLogo_110_25.png">
</a></td>
</tr>
<tr>
<td style=3D"padding-left:28px; padding-right:28px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" st=
yle=3D"width:100%; font-size:13px; color:#39394d; font-family:Arial">
<tbody>
<tr>
<td colspan=3D"2" style=3D"vertical-align:top; padding-top:57px; padding-bo=
ttom:10px">
Hi there,</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"vertical-align:top; line-height:25px">Stefano St=
abellini is inviting you to a scheduled Zoom meeting.
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"background-color:#ffffff; padding-top:20px; line=
-height:34px; padding-bottom:8px">
<a href=3D"https://xilinx.zoom.us/j/92403591689?from=3Daddon" target=3D"_bl=
ank" style=3D"font-size:25px; font-weight:400; color:#2d8cff">Join Zoom Mee=
ting</a>
</td>
</tr>
<tr>
<td style=3D"height:18px; width:22%; vertical-align:top; line-height:20px">=
Phone one-tap:
</td>
<td style=3D"vertical-align:top; line-height:20px; padding-bottom:5px">US: =
<a href=3D"tel:+16699006833,,92403591689#">
+16699006833,,92403591689#</a> or <a href=3D"tel:+17209289299,,92403591689#=
">+17209289299,,92403591689#</a>
</td>
</tr>
<tr>
<td style=3D"height:18px; width:22%; vertical-align:top; line-height:20px">=
Meeting URL:
</td>
<td style=3D"vertical-align:top; line-height:20px"><a href=3D"https://xilin=
x.zoom.us/j/92403591689?from=3Daddon" target=3D"_blank" style=3D"font-size:=
13px; font-weight:400; color:#39394d">https://xilinx.zoom.us/j/92403591689?=
from=3Daddon</a>
</td>
</tr>
<tr>
<td style=3D"height:18px; width:22%; vertical-align:top">Meeting ID: </td>
<td style=3D"vertical-align:top">924 0359 1689</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-family:Arial; font-size:16px; font-weight:6=
00; line-height:25px; color:#39394d; padding-top:20px; padding-bottom:9px">
Join by Telephone </td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-size:13px; color:#39394d; font-family:Arial=
; vertical-align:top; line-height:20px">
For higher quality, dial a number based on your current location. </td>
</tr>
<tr>
<td style=3D"width:22%; font-size:13px; color:#39394d; font-family:Arial; v=
ertical-align:top; line-height:20px">
Dial: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:10px">
<br>
US: +1 669 900 6833 or +1 720 928 9299 or +1 929 205 6099 or 888 475 4499 (=
Toll Free) or 833 548 0276 (Toll Free) or 833 548 0282 (Toll Free) or 877 8=
53 5257 (Toll Free)<br>
India: +91 226 480 2722 or +91 22 71 279 525 or +91 406 480 2722 or +91 446=
 480 2722 or +91 806 480 2722 or +91 80 71 279 440 or +91 116 480 2722 or +=
91 22 48 798 004 or +91 224 879 8012 or +91 225 097 2742 or +91 225 097 274=
3 or +91 225 097 2744 or +91 225
 097 2745 or 000 800 050 5050 (Toll Free) or 000 800 001 4002 (Toll Free)<b=
r>
Ireland: +353 1 653 3895 or +353 6 163 9031 or +353 1 536 9320 or 1800 943 =
965 (Toll Free) or 1800 949 238 (Toll Free) or 1800 901 561 (Toll Free)<br>
Singapore: +65 3165 1065 or +65 3158 7288 or 800 101 3814 (Toll Free) or 80=
0 852 6054 (Toll Free) or 1800 407 5602 (Toll Free)
</td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
Meeting ID: </td>
<td style=3D"vertical-align:top; font-size:13px; color:#39394d; font-family=
:Arial; line-height:20px; padding-bottom:10px">
924 0359 1689</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-size:13px; color:#39394d; font-family:Arial=
; vertical-align:top; line-height:20px">
<a href=3D"https://xilinx.zoom.us/u/adNNo1nqsl" target=3D"_blank" style=3D"=
font-size:13px; font-weight:400; color:#39394d">International numbers</a></=
td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-family:Arial; font-size:16px; font-weight:6=
00; line-height:25px; color:#39394d; padding-top:20px; padding-bottom:9px">
Join from a Video Conference room system </td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
Meeting ID: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
924 0359 1689</td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
US: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
92403591689@global.zoomcrc.com </td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
APAC: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
92403591689@global.zoomcrc.com </td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
India: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
92403591689@global.zoomcrc.com </td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
Europe: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
92403591689@global.zoomcrc.com </td>
</tr>
<tr>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; width:22%; v=
ertical-align:top; line-height:20px">
SIP: </td>
<td style=3D"font-size:13px; color:#39394d; font-family:Arial; vertical-ali=
gn:top; line-height:20px; padding-bottom:5px">
92403591689@zoomcrc.com </td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<a name=3D"x_zEnd"></a></span>
</body>
</html>

--_000_MN2PR02MB6735E566BE6BF5B740836111A0FA9MN2PR02MB6735namp_
Content-Type: text/calendar; charset="utf-8"; method=REQUEST
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOk1pY3Jvc29mdCBFeGNoYW5n
ZSBTZXJ2ZXIgMjAxMA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQ0KVFpJRDpQYWNpZmlj
IFN0YW5kYXJkIFRpbWUNCkJFR0lOOlNUQU5EQVJEDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0K
VFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJ
TlRFUlZBTD0xO0JZREFZPTFTVTtCWU1PTlRIPTExDQpFTkQ6U1RBTkRBUkQNCkJFR0lOOkRBWUxJ
R0hUDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0KVFpPRkZTRVRGUk9NOi0wODAwDQpUWk9GRlNF
VFRPOi0wNzAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJTlRFUlZBTD0xO0JZREFZPTJTVTtCWU1PTlRI
PTMNCkVORDpEQVlMSUdIVA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46VkVWRU5UDQpPUkdBTklaRVI7
Q049U3RlZmFubyBTdGFiZWxsaW5pOm1haWx0bzpzdGVmYW5vc0B4aWxpbnguY29tDQpBVFRFTkRF
RTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NO
PWpiZXVsaWNoQHMNCiB1c2UuY29tOm1haWx0bzpqYmV1bGljaEBzdXNlLmNvbQ0KQVRURU5ERUU7
Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1h
bmRyZXcuY29vDQogcGVyM0BjaXRyaXguY29tOm1haWx0bzphbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047
UlNWUD1UUlVFO0NOPWp1bGllbkB4ZW4NCiAub3JnOm1haWx0bzpqdWxpZW5AeGVuLm9yZw0KQVRU
RU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJV
RTtDTj1CZXJ0cmFuZC5NDQogYXJxdWlzQGFybS5jb206bWFpbHRvOkJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNU
SU9OO1JTVlA9VFJVRTtDTj1yb2dlci5wYXVADQogY2l0cml4LmNvbTptYWlsdG86cm9nZXIucGF1
QGNpdHJpeC5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURT
LUFDVElPTjtSU1ZQPVRSVUU7Q049amdyYWxsQGFtYQ0KIHpvbi5jby51azptYWlsdG86amdyYWxs
QGFtYXpvbi5jby51aw0KQVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1BcnRlbSBNeWdhDQogaWV2Om1haWx0bzpBcnRlbV9NeWdh
aWV2QGVwYW0uY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVE
Uy1BQ1RJT047UlNWUD1UUlVFO0NOPWdlb3JnZS5kdW4NCiBsYXBAY2l0cml4LmNvbTptYWlsdG86
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQ
QVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPXhlbi1kZXZlbEANCiBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzptYWlsdG86eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpBVFRFTkRF
RTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NO
PVJvYmVydG8gQmENCiBnbmFyYTptYWlsdG86cm9iZXJ0by5iYWduYXJhQGJ1Z3NlbmcuY29tDQpE
RVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpcbiBYZW4gQ29tbXVuaXR5IG1lZXRpbmcgdG8gZGlz
Y3VzcyBNSVNSQSBDIGFkb3ANCiB0aW9uIGluIFhlblxuW2h0dHBzOi8vc3QyLnpvb20udXMvc3Rh
dGljLzYuMS42MTQ0L2ltYWdlL25ldy9ab29tTG9nb18xMTBfMg0KIDUucG5nXSA8aHR0cHM6Ly96
b29tLnVzPlxuSGkgdGhlcmVcLFxuU3RlZmFubyBTdGFiZWxsaW5pIGlzIGludml0aW5nIHlvdSB0
DQogbyBhIHNjaGVkdWxlZCBab29tIG1lZXRpbmcuXG5Kb2luIFpvb20gTWVldGluZzxodHRwczov
L3hpbGlueC56b29tLnVzL2ovOTINCiA0MDM1OTE2ODk/ZnJvbT1hZGRvbj5cblBob25lIG9uZS10
YXA6ICBVUzogKzE2Njk5MDA2ODMzXCxcLDkyNDAzNTkxNjg5Izx0ZQ0KIGw6KzE2Njk5MDA2ODMz
XCxcLDkyNDAzNTkxNjg5Iz4gb3IgKzE3MjA5Mjg5Mjk5XCxcLDkyNDAzNTkxNjg5Izx0ZWw6KzE3
MjA5DQogMjg5Mjk5XCxcLDkyNDAzNTkxNjg5Iz5cbk1lZXRpbmcgVVJMOiAgICBodHRwczovL3hp
bGlueC56b29tLnVzL2ovOTI0MDM1OTENCiA2ODk/ZnJvbT1hZGRvblxuTWVldGluZyBJRDogICAg
IDkyNCAwMzU5IDE2ODlcbkpvaW4gYnkgVGVsZXBob25lXG5Gb3IgaGlnaA0KIGVyIHF1YWxpdHlc
LCBkaWFsIGEgbnVtYmVyIGJhc2VkIG9uIHlvdXIgY3VycmVudCBsb2NhdGlvbi5cbkRpYWw6XG5V
UzogKzEgDQogNjY5IDkwMCA2ODMzIG9yICsxIDcyMCA5MjggOTI5OSBvciArMSA5MjkgMjA1IDYw
OTkgb3IgODg4IDQ3NSA0NDk5IChUb2xsIEYNCiByZWUpIG9yIDgzMyA1NDggMDI3NiAoVG9sbCBG
cmVlKSBvciA4MzMgNTQ4IDAyODIgKFRvbGwgRnJlZSkgb3IgODc3IDg1MyA1Mg0KIDU3IChUb2xs
IEZyZWUpXG5JbmRpYTogKzkxIDIyNiA0ODAgMjcyMiBvciArOTEgMjIgNzEgMjc5IDUyNSBvciAr
OTEgNDA2IDQ4DQogMCAyNzIyIG9yICs5MSA0NDYgNDgwIDI3MjIgb3IgKzkxIDgwNiA0ODAgMjcy
MiBvciArOTEgODAgNzEgMjc5IDQ0MCBvciArOTENCiAgMTE2IDQ4MCAyNzIyIG9yICs5MSAyMiA0
OCA3OTggMDA0IG9yICs5MSAyMjQgODc5IDgwMTIgb3IgKzkxIDIyNSAwOTcgMjc0Mg0KICBvciAr
OTEgMjI1IDA5NyAyNzQzIG9yICs5MSAyMjUgMDk3IDI3NDQgb3IgKzkxIDIyNSAwOTcgMjc0NSBv
ciAwMDAgODAwIDA1DQogMCA1MDUwIChUb2xsIEZyZWUpIG9yIDAwMCA4MDAgMDAxIDQwMDIgKFRv
bGwgRnJlZSlcbklyZWxhbmQ6ICszNTMgMSA2NTMgMzgNCiA5NSBvciArMzUzIDYgMTYzIDkwMzEg
b3IgKzM1MyAxIDUzNiA5MzIwIG9yIDE4MDAgOTQzIDk2NSAoVG9sbCBGcmVlKSBvciAxOA0KIDAw
IDk0OSAyMzggKFRvbGwgRnJlZSkgb3IgMTgwMCA5MDEgNTYxIChUb2xsIEZyZWUpXG5TaW5nYXBv
cmU6ICs2NSAzMTY1IDEwDQogNjUgb3IgKzY1IDMxNTggNzI4OCBvciA4MDAgMTAxIDM4MTQgKFRv
bGwgRnJlZSkgb3IgODAwIDg1MiA2MDU0IChUb2xsIEZyZWUNCiApIG9yIDE4MDAgNDA3IDU2MDIg
KFRvbGwgRnJlZSlcbk1lZXRpbmcgSUQ6ICAgICA5MjQgMDM1OSAxNjg5XG5JbnRlcm5hdGlvbg0K
IGFsIG51bWJlcnM8aHR0cHM6Ly94aWxpbnguem9vbS51cy91L2FkTk5vMW5xc2w+XG5Kb2luIGZy
b20gYSBWaWRlbyBDb25mZXJlDQogbmNlIHJvb20gc3lzdGVtXG5NZWV0aW5nIElEOiAgICAgOTI0
IDAzNTkgMTY4OVxuVVM6ICAgICA5MjQwMzU5MTY4OUBnbG9iYWwNCiAuem9vbWNyYy5jb21cbkFQ
QUM6ICAgOTI0MDM1OTE2ODlAZ2xvYmFsLnpvb21jcmMuY29tXG5JbmRpYTogIDkyNDAzNTkxNjg5
QA0KIGdsb2JhbC56b29tY3JjLmNvbVxuRXVyb3BlOiAgICAgICAgIDkyNDAzNTkxNjg5QGdsb2Jh
bC56b29tY3JjLmNvbVxuU0lQOiAgDQogICA5MjQwMzU5MTY4OUB6b29tY3JjLmNvbVxuDQpVSUQ6
MDQwMDAwMDA4MjAwRTAwMDc0QzVCNzEwMUE4MkUwMDgwMDAwMDAwMEYxRThDRDRBNzE1QUQ4MDEw
MDAwMDAwMDAwMDAwMDANCiAwMTAwMDAwMDBEMzg3RTUyQjJCRkVBRjQ2OEM0NThCMzA2M0I4OEFG
Ng0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpYZW4gYW5kIE1JU1JBIEMNCkRUU1RBUlQ7VFpJRD1Q
YWNpZmljIFN0YW5kYXJkIFRpbWU6MjAyMjA1MDNUMDgwMDAwDQpEVEVORDtUWklEPVBhY2lmaWMg
U3RhbmRhcmQgVGltZToyMDIyMDUwM1QwOTAwMDANCkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6NQ0K
RFRTVEFNUDoyMDIyMDQyN1QyMDAxNTlaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q09ORklSTUVE
DQpTRVFVRU5DRTowDQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpodHRwczovL3hpbGlueC56b29t
LnVzL2ovOTI0MDM1OTE2ODk/ZnJvbT1hZGRvbg0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVO
Q0U6MA0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjIxMjA1Mzk2MzMNClgtTUlDUk9TT0ZU
LUNETy1CVVNZU1RBVFVTOlRFTlRBVElWRQ0KWC1NSUNST1NPRlQtQ0RPLUlOVEVOREVEU1RBVFVT
OkJVU1kNClgtTUlDUk9TT0ZULUNETy1BTExEQVlFVkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQtQ0RP
LUlNUE9SVEFOQ0U6MQ0KWC1NSUNST1NPRlQtQ0RPLUlOU1RUWVBFOjANClgtTUlDUk9TT0ZULUVW
RU5UUFJPUEVSVElFU1RPREVMRVRFOjANClgtTUlDUk9TT0ZULURPTk9URk9SV0FSRE1FRVRJTkc6
RkFMU0UNClgtTUlDUk9TT0ZULURJU0FMTE9XLUNPVU5URVI6RkFMU0UNClgtTUlDUk9TT0ZULUxP
Q0FUSU9ORElTUExBWU5BTUU6aHR0cHM6Ly94aWxpbnguem9vbS51cy9qLzkyNDAzNTkxNjg5P2Zy
b209YQ0KIGRkb24NClgtTUlDUk9TT0ZULUxPQ0FUSU9OU09VUkNFOk5vbmUNClgtTUlDUk9TT0ZU
LUxPQ0FUSU9OUzpbeyJEaXNwbGF5TmFtZSI6Imh0dHBzOi8veGlsaW54Lnpvb20udXMvai85MjQw
MzU5MTY4OQ0KID9mcm9tPWFkZG9uIlwsIkxvY2F0aW9uQW5ub3RhdGlvbiI6IiJcLCJMb2NhdGlv
blVyaSI6IiJcLCJMb2NhdGlvblN0cmVldCI6DQogIiJcLCJMb2NhdGlvbkNpdHkiOiIiXCwiTG9j
YXRpb25TdGF0ZSI6IiJcLCJMb2NhdGlvbkNvdW50cnkiOiIiXCwiTG9jYXRpb24NCiBQb3N0YWxD
b2RlIjoiIlwsIkxvY2F0aW9uRnVsbEFkZHJlc3MiOiIifV0NCkJFR0lOOlZBTEFSTQ0KREVTQ1JJ
UFRJT046UkVNSU5ERVINClRSSUdHRVI7UkVMQVRFRD1TVEFSVDotUFQxNU0NCkFDVElPTjpESVNQ
TEFZDQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=

--_000_MN2PR02MB6735E566BE6BF5B740836111A0FA9MN2PR02MB6735namp_--

