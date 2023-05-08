Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278686FB020
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531505.827248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw04w-0005VX-2v; Mon, 08 May 2023 12:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531505.827248; Mon, 08 May 2023 12:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw04v-0005TN-VA; Mon, 08 May 2023 12:34:57 +0000
Received: by outflank-mailman (input) for mailman id 531505;
 Mon, 08 May 2023 12:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0X6=A5=amd.com=RaghavendraPrasad.Mallela@srs-se1.protection.inumbo.net>)
 id 1pw03o-0003kR-3C
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:33:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92141580-ed9c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:33:45 +0200 (CEST)
Received: from MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13)
 by BL0PR12MB5009.namprd12.prod.outlook.com (2603:10b6:208:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:33:41 +0000
Received: from MN0PR12MB6079.namprd12.prod.outlook.com
 ([fe80::e454:fcba:69ae:728f]) by MN0PR12MB6079.namprd12.prod.outlook.com
 ([fe80::e454:fcba:69ae:728f%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 12:33:41 +0000
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
X-Inumbo-ID: 92141580-ed9c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/QLxgqsx5B1hvVHaVJ3JEwWLaXBDFG+ertJ0/kjccuo3BeW4I2nZRA3gUAYjtCPwmGI2qjb7IaTQ6261CQErMFIQKkB3jr6Y0RvJE7pj7z0bUBI3ccfRHja0suVZxjF5ISrwKy10J5lK1m0fhZofIGSUc8934itBmxMeWVNl7ZTxMDQbohqlLPdppP8CXjZDCLo6oaD3YMN2scFp5pjL0iZ38+lsmupDsEB4nuDDwYmQuwDKokuy+qEjNlUFylchVMQo3OIVcf+5czOKj4zuL6LvuqqYsnbh6/uVIAU1DqfRv0KE2Q3lfFnBQgz8Cq4M/rrU8l2QffGg0cW1eGBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYqWbYuXDvj6TSNImC7BXmYK/ywqaOpoS6YFN0CCBBw=;
 b=AzoPsgTKOfXS9fQGUbWCw9lpvEZcwQeqDYHQFQoEKwlDKXsaFybDQCRz7pSssCK6mSPlMuJ9ktyBgeQPbNtO1UYtwEtJbEglPXfV0eexoe5YiXJ/EBLuqwcHhWZua1MB2egJD5bHZrRPOlvoK7DBL2Yg26v15AykgggQ+660B2ciSZl+EGEgbtycltTgkWTZHbN4xoQSWvWhnif7puCVng74voCnjwHE2Rp3+hsOmyGPR5mFjgfnNjs6qaIIYoGIziGJLChCJLcaCZJGwb+SwG2RxSa9p89veGnpFIJ7NNFHqvTaZnE7PibyqzXUnj54gi1v8gmFWZmjVZ5wnbWByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYqWbYuXDvj6TSNImC7BXmYK/ywqaOpoS6YFN0CCBBw=;
 b=5L+W9vKai6y9mPcOCmien2x6k/bCmqPxLj+GMf3pH6RjYxLbClagWYSOUsScwaAeNtZIlP+3BEkhhSa4vNEdhCYUu99u1in1UUzu4I15yftqwIndnsCfxpA8Z5xi7yprewaPP2XjPqrgzs7QdEMq4ZgmauA6XrNRH9kHw3VXjf4=
From: "Mallela, RaghavendraPrasad (Raghavendra Prasad)"
	<RaghavendraPrasad.Mallela@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
CC: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>
Subject: Camera Virtualization
Thread-Topic: Camera Virtualization
Thread-Index: AdmBp7+i8bgPkutESA2yV0wZFwMI9w==
Date: Mon, 8 May 2023 12:33:41 +0000
Message-ID:
 <MN0PR12MB6079CF8A38A6EB9FA7B97F29F5719@MN0PR12MB6079.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-08T12:33:39Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=fe803404-e6b6-4be7-b52d-f6f8ca114558;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6079:EE_|BL0PR12MB5009:EE_
x-ms-office365-filtering-correlation-id: c0ec9681-896f-4378-8597-08db4fc074c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7CqGVRd1TziMRAyaXfFX6brV28XOtGeMKE9L9uaGdATBAa/r/ReQCzv1kJQ6X6HvtXGttrSCt1znIDzfTAInzPgzIB4/eD2mqsAkf8vGLmu9i8lBUfxU6CzqjW04hf6EZaGUXLknNV3WwoZLLcNfGayhbWEZfzf+AFtr93RrHSeyyb2VyJ1W8dx4ICd5L2v/GBD7MWHzLUq5nAoAxTZs7n3aUPn6fLHfEQ/b4eKhx+9iVninb3xjOYdqBKobsiGFOtQtIV6AxUSAjMPzUw4ofj4OMw1OP6VKn2BbEYP4PsHoIo9MrLkT5KXYdGMkJoh2T46knmxJqdf/LqCi1IouDY/JsJ+uoU6exMOOfquUuhfWh+5kiRjfEa0PM1dxfLIXiJanohsR3GKs1EycL+9ZXg9bWUe9pySpsdS5MldgIEWHms4K6V4cuaCq6RZcUqROO9H3tofcD2QseFlVNwWAk5kk7yvHYz3WFAzGsm7njbHRySDFSof3wQaJLXsbjepX8Nh3MyEZfKEQoRhkTMfBm9GupqmVajRTE0k/ZnyKCwFalI9B04VAJhfaFgK4S4b1YTlN7JRNpXTY05cwF7CiszVM/Q99esA7+9xRngbl+OnZZm/c3v1J1Toi1AbCTjM0r7i63Eqv9/8xy8XuUKwnRQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6079.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(4744005)(2906002)(7116003)(52536014)(5660300002)(38070700005)(166002)(38100700002)(122000001)(33656002)(86362001)(3480700007)(55016003)(54906003)(110136005)(6506007)(9686003)(478600001)(186003)(26005)(450100002)(966005)(7696005)(71200400001)(316002)(8936002)(66446008)(64756008)(66556008)(8676002)(41300700001)(66476007)(76116006)(66946007)(4326008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IzWGawMNeW1P6N030XyAlNkislZcCAhLPLVVnCIwYgTbGG2/GvN2w564Pbcg?=
 =?us-ascii?Q?RLGBF73FPV0cVzN4q1tcYDdCPWI/6hyYiC5R8umrc9oNdwm0YD+kQlnR4tZm?=
 =?us-ascii?Q?xeTr00oALwstHnCGeOpNgzjRzwtRajPj7tUV4f7JVwmEC+jR85jnrc9NW1rR?=
 =?us-ascii?Q?Xa6sdr7R3uY1Qv5si3m+5NnQ2IldJZgSjGbOcTxOWAa+nEZuDj0rnMe7d8nh?=
 =?us-ascii?Q?9Z/m8Aw8tqhfSjK32eZYlDwkZ+bOOROneXob7PK8yKF7EznlTM7jV3BwCADX?=
 =?us-ascii?Q?xRT5ishTv2IX1GBG3KQFP9csF+BV6AhjhsSbxk8cA2KQb/FJs/ghE8VngNeq?=
 =?us-ascii?Q?Nsh6M1hUX9g/e3m8DcpHYhk0ZWDl/gWt4mW2mhQMuRGOyA/mg7dDAuyu3Lf0?=
 =?us-ascii?Q?RYBAQ6hwwGnM2J3Lpj6I4qJLv5nSALvM5F9pXbgvjZC97ctxAMcgKDGbX2QD?=
 =?us-ascii?Q?+LNlbbuViBVydbZbo7Cg0iD/k044ZxhMZLUKvyl80YrlBRrIDqf47Lix0LB6?=
 =?us-ascii?Q?EgUbXDkjh3oOGcfE92nlZ8HrCmWRbmUfwv/pRKLbrqFbAvFGsw09vnbtuV9p?=
 =?us-ascii?Q?g/HZb15sWd7tuoCRSO+yMoBcttB4OPeCWjeYj12xMAMvMvZS6u+HOyqyavVV?=
 =?us-ascii?Q?qJ54DWEOaRnSUaQfhpEfi6ymRJEbEaUCBpbak+E1dwtZyoF8OXBO+U796eYq?=
 =?us-ascii?Q?YHad8egdeKRbRdIqQ9pCYgC5LCjWTNWQ63Y7uhAuf6XhAHG/fX8wxGa9qJjJ?=
 =?us-ascii?Q?0v6Sh4dYdwu4vCq66ZLpeDiD0icCFlQvUnIcfl02FAEEy3kkmWJ4uczqMDuU?=
 =?us-ascii?Q?0K2caCBvyEd6Yh/oMBRewAzmyof829lWFcyKmj4WT/3U7KQCCooJVgjp8pVQ?=
 =?us-ascii?Q?lmlh40CYXCyATltaWIFvZ46ZRG+OQgSUhR1KzNpHCTDVn9pyIXs+lxQreFtH?=
 =?us-ascii?Q?NJ5Xj5ZcTZr635WhJenEg2SHT5faAj3nTiuJ35SOoJAXRc3TuC0ZnxaAeHWs?=
 =?us-ascii?Q?9tc4Muqw/wz5tLXCJJIL2bu9quTERyuLbCqplm8hYOZQ5FT49duve5AGaQQ8?=
 =?us-ascii?Q?uRnk6CbrqErDbMklQKCxFMjnD/aTwrrbxbhIruj6a4oCBkCQJ7IBpkcXQUTp?=
 =?us-ascii?Q?yhXzNJocCvh/wfZvKuhQCAb8eDKs+9QgZELyvq+icw07LJ2wxAeI18S+cw4R?=
 =?us-ascii?Q?RyrceKtnvzvYgT9/q/vMK/a56IUmkXpYIKGrkWQ3UTujL0M+vreHOBWSDZz2?=
 =?us-ascii?Q?jnCZpxi9+N8RtOfuYuCVbXCRzoxqhDYxijvn72+BUBuN3Bc80jNUI4n7UgcP?=
 =?us-ascii?Q?yW4rCzrokjEl1Pw7HQp5gBnke1/aeP0damjtj1c4lpRtinIewc6vOhYj2xMz?=
 =?us-ascii?Q?muQz+OqU1KIHhdDRiqXvC2obGQmxIZOHn+bcycJvXJcORxIGPqJSxkxwTUAI?=
 =?us-ascii?Q?0yclQPAbmXUHipy2jGQ3dtyc/5mAUrEzMHIvpI7Sh6kcsvgw2knRmbQQ9Zxn?=
 =?us-ascii?Q?FJ5aDd06/T7Ie3hbYQBODeQHLvIOIiq+9JEL66hOY/eIOMVVlJW8s+zUJtUM?=
 =?us-ascii?Q?XY2CuwFeyTcp7VdKLAE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MN0PR12MB6079CF8A38A6EB9FA7B97F29F5719MN0PR12MB6079namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6079.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ec9681-896f-4378-8597-08db4fc074c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 12:33:41.3813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTNvPclckLvaOzMb5JN27HTLFjZrPvjEI3x828bea4pVVUZXwKBeuni0D85yi5ULaDc1pDvhhqGoD5I4tfLXMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5009

--_000_MN0PR12MB6079CF8A38A6EB9FA7B97F29F5719MN0PR12MB6079namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]


Hello all,

We want to virtualize the camera that uses the V4L2 Linux drivers i.e.., wa=
nted to use the Camera APP in DOMU.
Searched online and found 2 approaches to virtualize the camera.

FE and BE:
FrontEnd Driver is available at https://github.com/andr2000/linux/commits/c=
amera_front_v1/drivers/media/xen
BackEnd Driver is available at https://github.com/andr2000/camera_be

VirtIO Implementation:
Collabora implemented the VirtIO Camera implementation and is available at =
 https://gitlab.collabora.com/collabora/virtio-camera

Does anyone used above implementations?
Please guide us on which approach is best to use for Camera Virtualization?

Raghavendra M

--_000_MN0PR12MB6079CF8A38A6EB9FA7B97F29F5719MN0PR12MB6079namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p class=3D"msipheaderdf3d92d6" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly - General]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We want to virtualize the camera that uses the V4L2 =
Linux drivers i.e.., wanted to use the Camera APP in DOMU.<o:p></o:p></p>
<p class=3D"MsoNormal">Searched online and found 2 approaches to virtualize=
 the camera.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>FE and BE:<o:p></o:p></b></p>
<p class=3D"MsoNormal">FrontEnd Driver is available at <a href=3D"https://g=
ithub.com/andr2000/linux/commits/camera_front_v1/drivers/media/xen">
https://github.com/andr2000/linux/commits/camera_front_v1/drivers/media/xen=
</a><o:p></o:p></p>
<p class=3D"MsoNormal">BackEnd Driver is available at <a href=3D"https://gi=
thub.com/andr2000/camera_be">
https://github.com/andr2000/camera_be</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>VirtIO Implementation</b>:<o:p></o:p></p>
<p class=3D"MsoNormal">Collabora implemented the VirtIO Camera implementati=
on and is available at &nbsp;<a href=3D"https://gitlab.collabora.com/collab=
ora/virtio-camera">https://gitlab.collabora.com/collabora/virtio-camera</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone used above implementations?<o:p></o:p></=
p>
<p class=3D"MsoNormal">Please guide us on which approach is best to use for=
 Camera Virtualization?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Raghavendra M<o:p></o:p></p>
</div>
</body>
</html>

--_000_MN0PR12MB6079CF8A38A6EB9FA7B97F29F5719MN0PR12MB6079namp_--

