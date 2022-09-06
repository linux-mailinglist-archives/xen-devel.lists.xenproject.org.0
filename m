Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F05AF70F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400231.641934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIM-0006rO-QU; Tue, 06 Sep 2022 21:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400231.641934; Tue, 06 Sep 2022 21:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIM-0006in-Gt; Tue, 06 Sep 2022 21:39:46 +0000
Received: by outflank-mailman (input) for mailman id 400231;
 Tue, 06 Sep 2022 21:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQu+=ZJ=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oVgGX-0000Cs-F8
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2dc477e-2dd1-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:51:13 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 10:51:09 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:51:09 +0000
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
X-Inumbo-ID: d2dc477e-2dd1-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScqUo3pTSLIE0fK1pvhU2ZhQwHuUcU/wFpKzzrsMV1W/wFMOdsGYzjl0NWTmdx0HnH/xiF0xxZhAlRf+7G4aVpAbSRfOIBJZPTKPDooFuN+G27JqyJBQgNUA+AnBUGeImDhYp2DI9+fH4l/W7AQ83MdD5Ri+jkwvfUuby2mxI+tbBp1Awx3B+NHT/eULrF6X/psGiFY67aw6f4oh7JxIW+NKp0rrELvnOAPnsY+N2U9brXEYkQmd0hje0l33R9IqXZ6mtNgjHcjLfeyfWJJwBUgLHoF7qzzetiNSivjgICPpK96Tf+AqpqcerZSYx7PMEaBVSnvoGHC18xCIbJD/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmwWHSpQbfryGmhk5r8bJldYLtnloo1qnabN9mGlnpQ=;
 b=C7IxtzgKteO581cKfBme53pPT7dpC6y02TF/lL6LT/lPVI4U7o1GbOh0fsVF+7pioMvF1C1BR0wuRvHVbAhu/Y63oCnVgf+djue/3y1iYGzmM7x5VGvvz6WshMj3Yz2oyxKlhgbb5ckWDTtoOjR5YLQDN904e4SaZN21r1fKAiCSQUqIiL7u6Mm/LtA9D+QOJ92XCA9wFuSXSiLYeO8Mu4NB2YWn34crieO0rn4Hwef8LvL3lZbkqhxPW+K6/uKLSVcJplXBSiIJbzdKR/0uiIsDj/IJsF5kjLwbkzbkLs/nnd9ghl0I7hn7YoiZpQeJG8F4Io30U00JRiCrXCgpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmwWHSpQbfryGmhk5r8bJldYLtnloo1qnabN9mGlnpQ=;
 b=UN58jIYhkstmPhMuo96D13RhQUYcMApMWqunPLfy+mVyFF2h8OVxzOnHUbnU9UkuWq/J8cCI5sG0Fb4zIo89tbmeH7UcoUrJBkQPg0vBfUYC1uy+rZmmXcZDvHCtFjjPZnqtjZqds4NHK2FG+JFc0LfsCy9rsU6qNaJ09m56KYQ=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
CC: "al1img@gmail.com" <al1img@gmail.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "olekstysh@gmail.com" <olekstysh@gmail.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Subject: Re: Enable audio virtualization in Xen
Thread-Topic: Re: Enable audio virtualization in Xen
Thread-Index: AdjB3no6hd1w0/5IQgSmD9pfP52J3g==
Date: Tue, 6 Sep 2022 10:51:09 +0000
Message-ID:
 <DM6PR12MB42973A8000A347FE631FCA579F7E9@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-06T10:51:06Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=8c1f8858-b144-40bf-a6e1-9757941221e6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76032c41-e33c-4cde-0fbc-08da8ff5b517
x-ms-traffictypediagnostic: SJ1PR12MB6217:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 I8gwHKbLtApv6ZVE2OnA5oOoKElw9QdpfXdb0jTE650dEUf4rghNim22rRLu+g5nPwEzxQ+2deQm9YWsFpq5p4faXzlzT8AIsmsepFjiYJ7IxQQ9SKxubPx3jx/HgzqjkBZYx5DE4oUWBcLR40ss0Q6YbHiCJeGRUYPAFnZDt8+l/gIuWZecCyamFMHqvfevGJOBMEzUcWASsDeZ5gIU9oH3EqTPEXFx76tGoqRmyK3gxOJiq1ls8Q1+i2Y/azpxyDBy9tb7FtmVu9lMrHY5eyDPH6e9IWDZ2yaUh8DULkMaUjJOiwkgfwZrYSx5QNCATmC1ljNExd2jPG6Ok5PwLUl7us+zVs54AdPj7WE/mfnpAawJDZ7rn5M/40IiA99ZDuhY++16DHbm+GwS+DIFImQuQijxOO9/eLCpbG8hmelSdbVBzzE3+gNaISDj3qrJb4qQScEPOIY3NBaebKcEmeSqHcdLUxwz9YXTPKWXaTbwPChVMtrPjg8ljqjHFN1Iih4PSeGx7cisfTXnMLcGq3J8Gb/1Q/txMti9BLHFTrIHrAv6ci7ofLqKkaylq8HqWJb99zfLnvNHhALcJ5Jf6EkkMVpaqUhaUb7uLwwgVt0cPRbW4AeHquCQNCnQ45/PjOMkFZOo95djdgGWv/OAIOpE2mJoMQmCusfw3xV/qH9MbOCuXbBV6uqPYUbMIYzVckEeGNocBwajhZf2G15jiOHIgOQJRNa8udPDmrkmhi0bIcBrNtOf0TnRCqC35RBl1x9PpMulMRvsZud3VR+8yw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(86362001)(6200100001)(26005)(4326008)(9686003)(6506007)(8676002)(2906002)(7696005)(4744005)(41300700001)(6862004)(186003)(64756008)(66556008)(66446008)(33656002)(38100700002)(5660300002)(478600001)(8936002)(122000001)(52536014)(54906003)(71200400001)(38070700005)(66946007)(76116006)(55016003)(316002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tHe2XJJiHipcYwFlAQMfL/pP0nh/dz+WD/+xSSxDsGJjsL8WWB7ccAyjI2zG?=
 =?us-ascii?Q?csqh68h8wVrqv3NoI/0nao6b/0aT1HBmtfEnnJj1t5j3i69ZjWBXK6FkzhXP?=
 =?us-ascii?Q?SkYf0H1x77tI6F3WPlQfQRvRhG/oDHCayDXYKe4rauTFKhPvXBzgFcfvrwFa?=
 =?us-ascii?Q?R2oUSPKRnhaiVHFdeK+4rKIgY25VOk3heRqHOI7ZwCYlW3XBt41doF0wFzZG?=
 =?us-ascii?Q?XO/Wh8GK31WNpFLzG+dLp2gsg6wqDabJDlPgpgkOSCZSMgdvta5NM+1twfOr?=
 =?us-ascii?Q?m0UAb8QSPvKgI7MEweIWhUbieyh5wR3bDYcd0gXJu+foVr4oibvxxZh1OFm7?=
 =?us-ascii?Q?NkqwDXN2BhnrQP+mEsJiXlXnsr7k52Wot6UnSITdzuRkFVEXx6qXF4LCOb4H?=
 =?us-ascii?Q?5rEVCSJeA5KT1AzUQYri5cfrIAvye9XOFkC3F0GK0cQzNny+QpNWEtrxXtTn?=
 =?us-ascii?Q?Gy/ccJCEdoMBZsyVnB/i8q4nMorMPHN88LC83rECLoslZFVgePGEpqWpPzG2?=
 =?us-ascii?Q?K2nxxuil4f4as7dhDdPKNBoKXMMiyMkBANrXYLqTXN/7aN7Q0gJd/cNESU2A?=
 =?us-ascii?Q?l8o3NEsCbYrPSFSA1S3li4f5KXysrG5kfUwLn13Pu1maljVEMl3esqvxZ/8P?=
 =?us-ascii?Q?rv5ZPQ8flI3OMMeGMHwLLOs56owxgdHAZM5G/TAfxs6zgolnlEyAi8JG5X+s?=
 =?us-ascii?Q?hfeZCbNCZSOac45AWRxLkjp+/6KPG/2TvjzSIsSBIBysjMd2PJBB43iE9peV?=
 =?us-ascii?Q?8guofHPkpiuElWCM3s2wOf4Stw/QdqPvLaZiYWiUWt2V3PMwArK4iUSmcbXH?=
 =?us-ascii?Q?Ywcmg9WYPgYolIVRbwbQ1motAp+tEVc4lofVqDBR20871dYRACLoZBYNynd2?=
 =?us-ascii?Q?hyVsGlxTC1dYHkOwN0WTJTmPJ9AH3ZOzRcI8zEQkVAfLxbn2OzvNA1lfW6jO?=
 =?us-ascii?Q?3hmsicqSs4lKk7nLs/A11gQOZxO4N/05T1DQStWyZQgWl8Fp6td5aJWIz7b/?=
 =?us-ascii?Q?0mnfECmM9fffHxdXDLyE032+HZS6NSWvL12bfPoJPr7g9xqW+M4agOl+R2Wj?=
 =?us-ascii?Q?YybGN/2aTE4JtC/HgPziTQLz6CHcpFu5XSUL3v3xynk9S7VyE4RWhMK3KKYw?=
 =?us-ascii?Q?0DzdEFMrkd1nuRAGrlbhMtI11gGFxT29el6Ld468p8Yxde/LXcuDwuzwIoKt?=
 =?us-ascii?Q?xkkXKbCgS48buq34HFwknwKQy0Bf6CWjOCIqPFcJJFX1oDMXmdiWtjiz/nr+?=
 =?us-ascii?Q?XauBenbti1//TOFKWrD1gV2jJlcIU3oi0GbBB9kWENp4rhh9UomC3RoBldsW?=
 =?us-ascii?Q?zQ98gwsrm+HMK/m1V5FgRhLvvyKbgpxprr0HlPpiRF3/zclXinBenes0KjYg?=
 =?us-ascii?Q?8TU2MdVwsKbxaKtNwCiDtWIelmzrmpPFWnntl2kdKCaDjI7jc6LMx/uWWxBN?=
 =?us-ascii?Q?M1sXXPMm/FrAqh1cjgMpaaPVXMXZT86GtkQ9bzLeUf5pwJ+yvQgi21tJKawI?=
 =?us-ascii?Q?JkMzujlQRU8hrNHCTaIfgNjEgkpF81RYgZP3keTPt/mwG6Q0YdRWE98Ofje1?=
 =?us-ascii?Q?2+G7zBU9zx2OXVm+vQFtfrjhHJYSsiSRMGX+4LgD?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB42973A8000A347FE631FCA579F7E9DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76032c41-e33c-4cde-0fbc-08da8ff5b517
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 10:51:09.4137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdfZjSdniEfS7wg1pxPBfTb2uijC2UX/D8OhrSo/SCmDsxp2LQ3iFF/eOJINp2Hasb7dhAg/OXTHTeWmHIrGZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

--_000_DM6PR12MB42973A8000A347FE631FCA579F7E9DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]


I am continuously getting following log when I play a file in Dom U:

06.09.22 16:16:38.071 | XenEvtchn | DBG - Notify event channel, port: 76
06.09.22 16:16:38.096 | AlsaPcm | DBG - Frame: 0, bytes: 0, state: 3
06.09.22 16:16:38.096 | RingBuffer | DBG - Send event, port: 32, prod: 704,=
 cons: 704, num event

Frame and bytes cannot be 0 for every frame, right? Can this be the issue? =
What could be the reason for this?


Regards,
Jyotirmoy


--_000_DM6PR12MB42973A8000A347FE631FCA579F7E9DM6PR12MB4297namp_
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
@font-face
	{font-family:-apple-system;}
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
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:white">
<span style=3D"font-size:10.5pt;font-family:-apple-system;color:#24292F">I =
am continuously getting following log when I play a file in Dom U:<o:p></o:=
p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:white;box-sizing: border-box;font-variant-ligature=
s: normal;font-variant-caps: normal;orphans: 2;text-align:start;widows: 2;-=
webkit-text-stroke-width: 0px;text-decoration-thickness: initial;text-decor=
ation-style: initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:-apple-system;color:#24292F">06=
.09.22 16:16:38.071 | XenEvtchn | DBG - Notify event channel, port: 76<br>
06.09.22 16:16:38.096 | AlsaPcm | DBG - Frame: 0, bytes: 0, state: 3<br>
06.09.22 16:16:38.096 | RingBuffer | DBG - Send event, port: 32, prod: 704,=
 cons: 704, num event<o:p></o:p></span></p>
<p style=3D"margin:0in;background:white;box-sizing: border-box;font-variant=
-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align:start;wi=
dows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;t=
ext-decoration-style: initial;text-decoration-color: initial;word-spacing:0=
px">
<span style=3D"font-size:10.5pt;font-family:-apple-system;color:#24292F">Fr=
ame and bytes cannot be 0 for every frame, right? Can this be the issue? Wh=
at could be the reason for this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB42973A8000A347FE631FCA579F7E9DM6PR12MB4297namp_--

