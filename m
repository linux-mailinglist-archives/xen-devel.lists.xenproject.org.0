Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252964B055
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 08:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460215.718102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zaE-0005do-OF; Tue, 13 Dec 2022 07:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460215.718102; Tue, 13 Dec 2022 07:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zaE-0005c3-Kn; Tue, 13 Dec 2022 07:20:10 +0000
Received: by outflank-mailman (input) for mailman id 460215;
 Tue, 13 Dec 2022 07:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6nk=4L=amd.com=ViswaKrishnaRaveendra.Talabattula@srs-se1.protection.inumbo.net>)
 id 1p4zOO-00037x-HV
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 07:07:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcf72822-7ab4-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 08:07:54 +0100 (CET)
Received: from BYAPR12MB2965.namprd12.prod.outlook.com (2603:10b6:a03:ae::28)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 07:07:51 +0000
Received: from BYAPR12MB2965.namprd12.prod.outlook.com
 ([fe80::4199:c623:b14:c85e]) by BYAPR12MB2965.namprd12.prod.outlook.com
 ([fe80::4199:c623:b14:c85e%3]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 07:07:51 +0000
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
X-Inumbo-ID: dcf72822-7ab4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DitezrlVNW3Nt2idmCksIANteTxeE7kKHTS0tY4/BvXL/RmYMa7LP7RuDx4N+MG7HSjWWD+Auc5ri/CjSbAac97/DLfv3Fdd4hJIIijyIfXMGb6uwQR72WBt90fR9DYZFu6CGru7Msgh9OWyL5dw+ktPirzroWwZssFJM8bxvChwvaNkS6HKqkI/MEamcr2IbWNVhssKYckgY0TH5IlBmwPfYdJWKN71PFBdXl3SqoEmg6fTfsEkG0IgYG24isKp/jpoUZbLcwDyXBqUE+qnkHeFUaoc1juk+MRIXXEdrgyITIXrRTJoM/qG7FyTbKxK2pXU0dYgiEPw5NXNct7X4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkNm56gX205NR3Kx13eIMf6V5knKoKEdheKHf4nfcTU=;
 b=XHbpX/TBAq2PuC1KefWqL4P7KiBAIngfF8Ex3RzGyy7NiJZEZH/pJDRm2yhOCiZfNHl06SYCuA1r5pdsjqaOAXAxeRsBzfpSRtGhH+/8JalPcKp1qVQrhmeoAOvPFlxFjbQVLemOcn+k5ZMXIN1kgWAiO2gWewdgp5Qhkg/wGErVOBkgfOQTu3U321F+Bk3ePc2tOkkuO82apZ8TQI3eOjU28CgSToErmJbQWAWVkTojoGCPMfh+fQqOzoEFR6tyK9O+Glfa5taZn0G9giSk3MuwVWdSD0WwEJBialmfwUaY95wUM3C2nfllffkOtdFqdRSStaqiqjH6Tv0BThE2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkNm56gX205NR3Kx13eIMf6V5knKoKEdheKHf4nfcTU=;
 b=CoJSbnl7J3ihX2HX/NOMyNUtaVDPGDcr/hKPRWM5E2JRtjWlR6GTiRRJC+j/2alOQVh6Ppm0VpN/0zdT5b2ocUEOpwfYtU4fATpe5b9SCK6dAvw+1owW1VA8kMHl5iLl+MvBe63f2Bh4k8i+D7oAs6octAmMq4qaVr9XL/Otpxc=
From: "Talabattula, Viswa Krishna Raveendra"
	<ViswaKrishnaRaveendra.Talabattula@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Need help with xen boot time
Thread-Topic: Need help with xen boot time
Thread-Index: AdkOwZNegIGtvL5mSQSPZxvjL4IPfg==
Date: Tue, 13 Dec 2022 07:07:51 +0000
Message-ID:
 <BYAPR12MB29659BABDC30512BD9E18F50F2E39@BYAPR12MB2965.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-12-13T07:07:48Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=38eba48d-4df3-4164-ad92-a2d80b732a12;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB2965:EE_|BL1PR12MB5780:EE_
x-ms-office365-filtering-correlation-id: 90468913-e092-495b-58c4-08dadcd8bfb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DAv4uLKOssSxMK98Zd4VodKPqomJ2r8OBeaDtak6Ml41vqCtPx6irSP2MjzFdGXsBi8j6nshZ+/+DcvY5cGWGNfwc8Ck7780KaC9EE1DrEnmp342ZjUi2vlejXrk9UGHjW9VybGulPPeSUAyusAetuM2TTUDgsIX5stCU6Rpf6FInfYGDybozmMoGbeTJwj9IrAhSXgLkCJMgPemtxEYuQ+EC9LfcWJY8T2FK25FkDMfqKtVuercKWAyVtZaey+XroSHKJE65NqJD+/OUDsfl+LcNoyFPo00ZfuLUxLGBGfECWXQKTWA5wFORLU/DXvY2Ug9jlX0Cknue1VNvtbFggOn7kOyIeO8X0Mxjk6v3oR3dAnY9bsx9p0Q5Ep+uCMZ5htm6WZOrNs4H3zCjAaxLzDktI14AtRPIlxSXJEq3CNgkDlV4RF+Jd4UQVR3ef/L5GZtnW7elGAAcvM0y0xEm4qUrbC7r+wrlU0A63WFCHjQbr+bcyM3kCtTWm7czhcPYXvAZ7erCjlfqAPaMNI92B4w1sCbomYnIG9BWKV8D6PCOhjvFRSnjLTEEqLdld8aB7KZgefi67K+GJsRucZqE8KMOU5urHRxw6OlaMFhM9YOV/iWGzTL4cd3xGpHRE7v/XYwLaOHZkIL+BcfOiAro6fIAbUdH0Va5a/zggLXJgT/AiYbIAyrtMSY9GwM/gLWfcbD6vw6dF54A4WAJfzfBg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2965.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199015)(33656002)(38070700005)(26005)(6506007)(9686003)(478600001)(7696005)(71200400001)(38100700002)(86362001)(186003)(64756008)(5660300002)(8676002)(41300700001)(122000001)(52536014)(66556008)(76116006)(66476007)(66946007)(66446008)(8936002)(2906002)(55016003)(4744005)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vSniMZbZQrVbUbetmxVzN1BWqt4kmvKC8T78MvcsH1I8kAquqESZUqIH1B6x?=
 =?us-ascii?Q?rOe0oRT7DmS2KGSOzHkJBS4Kynyn6+4LEKGrF2kOyYL/JXyXp0PCmSvfv46S?=
 =?us-ascii?Q?gazKMMREDHoDnXT2BqezffL/QSjdqAAyzOKPB4uBvN7D+f/riloUwjQvm5NE?=
 =?us-ascii?Q?Ww75I/OgXjxEP2F+CDATFkX2KYI5xS5jtIzoB9mFkUc3TNWscEJp1fxjVjCp?=
 =?us-ascii?Q?3UnsAunoweP/A2a8BxJs9VUPwMOecv8wIucSvRiuB+KJDBB8bw9YSEmP8wij?=
 =?us-ascii?Q?SZ1bHdVnovmA0ExLOB2z/fSc6Ir8x57C1fqL+Da1jGRRZ5kPAhTiLq2t3yf5?=
 =?us-ascii?Q?jYdMVQqt4J2PeNs51gT6MifwxtyMMEZsFZoyNeM0nh6C/lRMRli71N5aqVZk?=
 =?us-ascii?Q?n0dSU4oh5v48GDoN1KpdNOG0K9Ngo2uzCTri2TVSmUsSCi/TvzOazSxn6/z9?=
 =?us-ascii?Q?tIXYJYUB8dJoxwRzLMNQ8yqVtlYT93OmffWAUitQl73K9FzJpxyXePIImqRF?=
 =?us-ascii?Q?yCSFFPFKssADCvfD7pXCmHgYLnfuOQ9Qa67PqgOsDkBjbyt3/vXdLDLJJYMj?=
 =?us-ascii?Q?6FAPhp0iAAaMN+vL2LDqh7FIZlDX3LrtUTdgGauEAdYHI5/VCYyp1RvWsgyz?=
 =?us-ascii?Q?XCjwtAL3lZqn7zV2/bYebYI3MCfnKhoH7dzIOTEJRkezct8RpRmFKBnf6htz?=
 =?us-ascii?Q?ZTwLb4LcBoHdwrbK/sMp2E0OfAi1YtLjQURr8ApwV8qyioFaUlwDO9pqs8n7?=
 =?us-ascii?Q?xIv1iz4ml3it7Hy2iHmsxEewzjb/Fwe8/M1h6ZwqFVDDlBhZZAsHnWKSAIVN?=
 =?us-ascii?Q?62a+KKBYl+RN5QbOwspgGQ1B1jymjMxeFR/Eje/+e3c42xA//9LTccwj9FQc?=
 =?us-ascii?Q?IkdV8bBSzsPFGtoKWlVsd7irPjuPcNJZE6S10Os954rkQ/YBOhssvcMC9YZv?=
 =?us-ascii?Q?3mNiAhlbwEbe4rZOkzXsJM7xF3xWwvjnSEvOmrrfZXSodod5eoEH5JcKQmrP?=
 =?us-ascii?Q?mUBVJPq4L3b1dyE9DoSc7mpETHnZRrrKuuGTsLLcmvOjAt9p8Tej1uEO/x5A?=
 =?us-ascii?Q?a1feTIVdXlED4d/fL2Bz7N4zm0tZjTLfWi8r7nU50KrDXk1IFQol6I9c0vaz?=
 =?us-ascii?Q?tQin893TEMPB0p68aIgeOooOMTy5q7byIsfo+5F9UyQ7MNdfYmRxX3cux4sh?=
 =?us-ascii?Q?EICfTxHjWPALoqoQcj7MxI2dikpCSbMqv6TwTm0pEGzGRLLijhTZNNFAsbmR?=
 =?us-ascii?Q?8+tizyg7RGPcfdTofDfPI2sbeUJZ+AbGcF9wYqdHHzyzxFglkNFsgBK8DglR?=
 =?us-ascii?Q?2wwZ2hcOEJmfHIx7LGQq7+TsPlWH9D+FhsgzF/SogE8Bj4XL2pki3BVnyMw7?=
 =?us-ascii?Q?/1aJQEQr4UesGEO2JeLcqQfpY8u5LMHPF52BpQlPwxHXzkJex9S4sxt/5k5r?=
 =?us-ascii?Q?NL0oy0vDX+6xZbtnupC0N2GoUJUDmN66OOPMDhhRz55bz7OQHXw8FHrP5AqL?=
 =?us-ascii?Q?q79wmEjNCBtyvp6a4pEETwNOA5093izBytiyBrWdW5hv+z9/swLTdNCLeZao?=
 =?us-ascii?Q?ifYTpef9bVa257IUS74rXfL0Rys/bA0nVAoPLzvA?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB29659BABDC30512BD9E18F50F2E39BYAPR12MB2965namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2965.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90468913-e092-495b-58c4-08dadcd8bfb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 07:07:51.3282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38eYZRoYFg7RKqwJiM2/gJr2My3eWjlLid5s65UlWi/jg3QJiH7O7ZkoKN22FY2gzogkEuDxJcPYGqcWWsnyeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

--_000_BYAPR12MB29659BABDC30512BD9E18F50F2E39BYAPR12MB2965namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi All,

I am Raveendra .Currently I am working on  xen hypervisor with Ubuntu 22.04=
 .Compared to Native ubuntu kernel ,dom0 with xen is taking around 1.8s mor=
e to boot.
I used system-analyze tool for calculating boot time.
Can any body publish the boot time of xen that you are observing, also is t=
here anyway to optimize the xen boot time,related to xen build or any comma=
nd line options.

Thanks,
Raveendra

--_000_BYAPR12MB29659BABDC30512BD9E18F50F2E39BYAPR12MB2965namp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p class=3D"msipheaderdf3d92d6" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly - General]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am Raveendra .Currently I am working on &nbsp;xen =
hypervisor with Ubuntu 22.04 .Compared to Native ubuntu kernel ,dom0 with x=
en is taking around 1.8s more to boot.
<o:p></o:p></p>
<p class=3D"MsoNormal">I used system-analyze tool for calculating boot time=
.<o:p></o:p></p>
<p class=3D"MsoNormal">Can any body publish the boot time of xen that you a=
re observing, also is there anyway to optimize the xen boot time,related to=
 xen build or any command line options.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Raveendra<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR12MB29659BABDC30512BD9E18F50F2E39BYAPR12MB2965namp_--

