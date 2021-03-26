Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7634B492
	for <lists+xen-devel@lfdr.de>; Sat, 27 Mar 2021 06:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102093.195725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQ1vO-00030n-R1; Sat, 27 Mar 2021 05:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102093.195725; Sat, 27 Mar 2021 05:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQ1vO-000307-M9; Sat, 27 Mar 2021 05:55:54 +0000
Received: by outflank-mailman (input) for mailman id 102093;
 Fri, 26 Mar 2021 20:42:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTOz=IY=studenti.unirc.it=enza.cannizzo.279@srs-us1.protection.inumbo.net>)
 id 1lPtHn-0002tc-Ab
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 20:42:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b02475f-1ffa-4f49-a48e-0a70368f85a8;
 Fri, 26 Mar 2021 20:42:24 +0000 (UTC)
Received: from AM4PR05MB3331.eurprd05.prod.outlook.com (2603:10a6:205:c::27)
 by AM0PR05MB4194.eurprd05.prod.outlook.com (2603:10a6:208:57::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 20:42:21 +0000
Received: from AM4PR05MB3331.eurprd05.prod.outlook.com
 ([fe80::59bd:9a92:960:5ef3]) by AM4PR05MB3331.eurprd05.prod.outlook.com
 ([fe80::59bd:9a92:960:5ef3%5]) with mapi id 15.20.3955.024; Fri, 26 Mar 2021
 20:42:21 +0000
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
X-Inumbo-ID: 1b02475f-1ffa-4f49-a48e-0a70368f85a8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLvR5QF9RJVvUNUU7kkVJMpYMYnIjSXMbmxTqtvH7AojNQLn6Zm1kKNOWGqy793d9EtCx+52W2rDU2hauJhw2AkRJYjTxrJBjfQC23wF074cdOHmz3TV92am6w3/R7TaxB0bTIfkqKyWR313Qd10iKcjAf0xIKdOtyRCoPv7dQX7Ug2Jw70iBlCaPQzGlg2FwFPdRWx2FqnbI2UQ7ANNDdT948JwdxOm6Z11ePwq67KiMB3ch71qPqMMxRILbDrzAvRS/VmSrczzxHgqpBUPBz0fZ4NWsVwfUWtsRAItd20UbJel1CB+NABQlWqCSh/ygbK5Ar+gcsxDBVyKqIgqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr9/se05Dia+TZu3JXE+OY8rtBbSU1/VV2K41EnpdK0=;
 b=X05EvS0qxgDDOBQoE4cdq29yZ6AukXl3b42Z8ThEuH5dTzo1jJJldJsKZ4/BLsFL67KEE0eep9FgdHYbHO3wpCvmD3evbpyj/OLQT6LhvwlQd97mdHp+rieqMcUKd07fYlDqdKW6RcTcKzbxgSGlx4GUZcdFK8PB8MZnd7uNyon+UZiQclySr8X85PVtb6K7W6stCs4ah9CbY6Ez44DWJTHXbFGQU7dOW7hEMdxk0F/wZMxCAEk06GOvGNRs0uSgRtAQ97Mn/rSu9zABvmgOfdlcLhzxGFtxT+sn2+AurHZWiZqHe+qgqOU+0llaGFFL/R09cWmaQO5yQIVB0N/Tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studenti.unirc.it; dmarc=pass action=none
 header.from=studenti.unirc.it; dkim=pass header.d=studenti.unirc.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentiunirc.onmicrosoft.com; s=selector2-studentiunirc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr9/se05Dia+TZu3JXE+OY8rtBbSU1/VV2K41EnpdK0=;
 b=bKBsxBGJkxlpYeUZltSYXApyOBQWeeDg11CpQUmqr82mBj6pMla1IoqdyeLKdyna5DORTNxiCMeiPkKkk6NYfm1N4+/l3m+OkNIpxuWT0ZqdLlGzU5Rl6Pz6ST8PcRrtBmBQCNxL7hC0uKD4m22966QbVua94KJhytgRHvQj1PY=
From: Enza Cannizzo <enza.cannizzo.279@studenti.unirc.it>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: info
Thread-Topic: info
Thread-Index: AQHXIoAqtleliyZb+EKQ53q+Ka7KYg==
Date: Fri, 26 Mar 2021 20:42:20 +0000
Message-ID:
 <AM4PR05MB33312D885F3CEA0B4DD82DB3AC619@AM4PR05MB3331.eurprd05.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=studenti.unirc.it;
x-originating-ip: [93.147.237.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be10a498-8f47-462d-af1b-08d8f097a75b
x-ms-traffictypediagnostic: AM0PR05MB4194:
x-microsoft-antispam-prvs:
 <AM0PR05MB4194C8BCFCE8C9E60A5920C3AC619@AM0PR05MB4194.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9LqH/Qck78l+tHBqoybHr7qjhGBmq+pqdXqvKTkunWvWSG52V2pa3tlC/LOWcZLUPpSrX7PVI+8AKt9K6WpaYqBBr6pQW9QM1gnQiH2Ipn/f9rh4q9BAaSm0e5iv2/KMWpknUO61r6pRMdgONFjUr+VvtpzxBv3FJ4EM7fg5yI/m53dtJZYgTSmFbDfdmVj152KY01/Y+hNujQbbuIm6UbKcWQQxhIcD5dbGUrP+mlbb5LTYMk9DYpJm05VNceEUZ89aqQOcreU0gyaAcEsUh6q0IVpqQ4N5Z9jI/xp2oyalP63ITMjz/Dr1iBPWDbrTnwImt9VOZXzKF0w//eilpISbHPMUsOgX3JdDduiMJVzOd8oxbenigA71uBny9tbAz3jLIWOw/w9XBNCh5Uiu9Bauooamh9oEtJPtBi2tU0cL4481ACew2mTGVkGDOIkos+cRUa4cqc1m0ZDL3pmnVPpnjex5Zt9sKqV1gUxfzJX0rmyRWRsKUpOHRW47Pjap2njmEih5M7csI/yFVs3lrvBI19cSsyY9LA2gx9snzpMbGMEELc6H+6ev8YGdq6fTZuIaCR45J/XXa64Jt9EKLpFtBqv+b9kCB/JeGXD5h4j2J414ghhwiPPq4sRSHplKP1ETADlleZcsIOAzeZVXlPGePIaKK2cqMOmbCueE4rTWaxCZX96TUu7A5fseEJXD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR05MB3331.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(136003)(366004)(376002)(346002)(4744005)(76116006)(478600001)(186003)(64756008)(91956017)(66946007)(9686003)(66446008)(66556008)(71200400001)(66476007)(55016002)(86362001)(7116003)(3480700007)(52536014)(6916009)(6506007)(38100700001)(19627405001)(316002)(2906002)(786003)(8676002)(7696005)(26005)(8936002)(33656002)(5660300002)(220243001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?qtqyrWqNNy3Bp+6xHvayo2RtvuHGLuM0BX9D8IcCNVHCYr5LE1gF8+3qYR?=
 =?iso-8859-1?Q?Bkmxg6DG+9pcMwvRQadZRd4F0jQPlN+PUTnJUbfcy0M5ugT+pU3y5E2tRi?=
 =?iso-8859-1?Q?jhcVO1+MJ5uTzJQChuim2Pm/eT6OsqPpE3ibo/+hj+pPKXUUcupsUpuHiz?=
 =?iso-8859-1?Q?Y7ClXDS2J9Q2PF50SaSGJBbedNBeWpW69CjotqrEwKfMws3iiKAUw1R3CA?=
 =?iso-8859-1?Q?UzUUafoN17a8BP4+28szhshw2LP7+gvV3pfT/4SP+LpfQ7YWCcqj6xD8mq?=
 =?iso-8859-1?Q?SctW2LhLQXjpWDho9o6W27JAUT2eqDz8MKk20vutnuVdcKnQqegGLx9HgO?=
 =?iso-8859-1?Q?noIi5ycs+y7AH6dyuY2WPomgCMC4Rr1NNwPRFQz8yvOJq5CE86T5b7XsG1?=
 =?iso-8859-1?Q?uJ2YMl+gTBfM8nIhxIR4TSgJyTnQ+rqa41LB1DVezAS+XTaNLI/qmQ3U01?=
 =?iso-8859-1?Q?bjyeNEG4jfAgEebsgikFrMgU64dviu3jPZ19CsBj/KIJwWlEYe3wndulmr?=
 =?iso-8859-1?Q?OQr2rbWkIOtP5jPIOmFae041jwR+qeJ3ns4Hr28FY8O/0T6D1dS6C+Ygsl?=
 =?iso-8859-1?Q?b9O7rBzio/HFrcBw4kooalYWUkJIFbtU5szEkeszmyNOEVBHBt0GGzioup?=
 =?iso-8859-1?Q?fokgAdT6RLCPvq/ClU5QCpU/k9vas2/nB104JvY/VS/LEHy22DuGXTfelM?=
 =?iso-8859-1?Q?mWSZ+dwEPc18Lgj3b/uiRXWJ+DkBzmwsLET3av3/jA4xwCB3tOzeQCrquv?=
 =?iso-8859-1?Q?VyU090tWw0JNKZC94s9R0plImE/HgSirg/75uYGPCpxzEnuDyICPGM+z67?=
 =?iso-8859-1?Q?jtWfRC6gVRIDDY1i4IXQ5e18kRIThjXcRtBob5rcwgnpT2Uz1hIMHf2X4V?=
 =?iso-8859-1?Q?Rr0qv2VvdZMRTqjirFcuzG4btHNokko3fhyLYwNi8sVUo7T00K4oGHor9N?=
 =?iso-8859-1?Q?qMq5pqZFPJxLGkCNtDCP4V9DI25+iQwDzMlqyKFBp/iOy6jVKd1kh6RebY?=
 =?iso-8859-1?Q?mqyWlIbg8lmdhhUYErjQ9DVTjs6WNk9AphwWakCQrRyYpj3rgZM73mJm1B?=
 =?iso-8859-1?Q?f4px+QKDtF9kksolurldM4Fp2wucyEaFOqJ1YD6h8bPDBIUXaS3kvDsodH?=
 =?iso-8859-1?Q?Bx4NzVAxKsM1TRGWxAfRmL+LGdGSN5X0+F4Y59oO9ktOLatupaXfzj+hNb?=
 =?iso-8859-1?Q?ielrQzEWv+otUeLCWCyQWHFsOgQ1ebzMhlvDaLAy3A2tVdyaIyBaVDp5H4?=
 =?iso-8859-1?Q?eXlZzVdu3VmaSTaXRSWd1mj3VcDkCGocpNmmSpnZpUaaqlXqyKB8BANQPr?=
 =?iso-8859-1?Q?jlPB8r1+tqjA4EcW4FVs3KJTjMcLb7xbnS6DtBP5c7KLoFg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AM4PR05MB33312D885F3CEA0B4DD82DB3AC619AM4PR05MB3331eurp_"
MIME-Version: 1.0
X-OriginatorOrg: studenti.unirc.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR05MB3331.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be10a498-8f47-462d-af1b-08d8f097a75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 20:42:20.9787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 81907402-e440-42c1-8197-5e0d0609e005
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1ZEpVCzX87bMpgIsBq//DgV5pyZGAfBEE6wgyes7PuxvbjkFbzqgA1MCu1TfyritSTh13ZUP3Hj2EsP0UEsFcJpmMyiX4mJzguHmwFXMhI0eaF5Hs05+Qtnd6p7+SJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4194

--_000_AM4PR05MB33312D885F3CEA0B4DD82DB3AC619AM4PR05MB3331eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, I'm using xen project v 4.13.0 and I have to cross compile it for arm 6=
4. I tried the complete compiling process with success but when I try to cr=
oss compile it returns errors in the tools compiling process.
I also tried to cross compile only the hypervisor and it's ok:
> ./configure
> make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3D /path/

but with make dist XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3D /path/
it returns errors related to libraries in tools module. So I would like to =
ask if there is something I just do wrong or it's not possible to cross com=
pile the whole xen project. I'm sorry I'm at the beginning with xen cross c=
ompile.
Thank you anyway.

--_000_AM4PR05MB33312D885F3CEA0B4DD82DB3AC619AM4PR05MB3331eurp_
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
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">Hi, I'm using xen project v 4.13.0 and I have to cross =
compile it for arm 64. I tried the complete compiling process with success =
but when I try to cross compile it
 returns errors in the tools compiling process.</span>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I also tried to cross compile only the hypervisor and it's ok:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
&gt; ./configure</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
&gt; make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3D /path/</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
but with make dist XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3D /path/</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
it returns errors related to libraries in tools module. So I would like to =
ask if there is something I just do wrong or it's not possible to cross com=
pile the whole xen project. I'm sorry I'm at the beginning with xen cross c=
ompile.</div>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">Thank you anyway.</span><br>
</div>
</body>
</html>

--_000_AM4PR05MB33312D885F3CEA0B4DD82DB3AC619AM4PR05MB3331eurp_--

