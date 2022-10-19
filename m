Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609516053CE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 01:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426062.674277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olIEn-0007fj-T4; Wed, 19 Oct 2022 23:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426062.674277; Wed, 19 Oct 2022 23:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olIEn-0007dm-PS; Wed, 19 Oct 2022 23:12:37 +0000
Received: by outflank-mailman (input) for mailman id 426062;
 Wed, 19 Oct 2022 23:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoZG=2U=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1olIEm-0007dg-MI
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 23:12:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82fe4db0-5003-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 01:12:34 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 23:12:30 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::45b:5f00:6991:c7e]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::45b:5f00:6991:c7e%3]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 23:12:30 +0000
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
X-Inumbo-ID: 82fe4db0-5003-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBxDirxmDG4gKiq0WWvE3/4tM7PDw7emonIHCjGHPwXy7uIvq4nTd2bmMhKHxAndiBwO6QXGLrRcmEPDYyFj13AWT/A5kLOoMglmx+iyF0pwwljbN4B4nJ2YpqgJrn9pKh6F85+G9XECZgDkxB+K+fA36t7RGsi1MKzDS4Hspw10krQUNNTE1pY0PC5P0k+talFI+TzuD68KTEPtC3xIWVMaleduM2QChEVHAE4o45xMES76tR21EEHhyXa7ouzaitxEPQq4wV+MCzLVesbccUSX4BSHpn02OCdko9a1uJZDZL3j1KulIPjwmlZjJWLNS1WlbfDMeQAGX5ErVm/Tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cge5Yb2CzSD5Bu0WVHIFKjdDadxJS6eZRxLuDht1xKU=;
 b=iJqACC5pZUEgL3+sngHYNKvoUL5B0OZqbQdMiggKbWyq045yKZJ7kYYO1GUvjVFFhbY+58z1HzyzMD5q/M2wBkhVJZaMEud8m0SXXxf5dKBbAgVc/ZnMS4uv4AQvBQPBpF72zwrxgjnmy4D4j25AfyJyvIFF/54NsiI+WbVi7HocJe7pKDpv35pLZs1/ApLitpuVQ3q3u0XFTIHrATziyAmRkGTq29ktHMbSumXA29uIy+xARiAVOXnMrRNwQuPsWQbuVY6P3ETzxlYHsrUoGjKDIKDScg59dJhb0xAdb3Q5VDEdoz+0xZyg6A1OK6fQeR30cBLrkFjKXNLohGetmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cge5Yb2CzSD5Bu0WVHIFKjdDadxJS6eZRxLuDht1xKU=;
 b=DvDJfnkSMpqFxIzM9EZnjkQxW7H615G5tIIvoBY/cekTC53YWSYtHsEX9hawxadJSu4+GRuQ1HSGhsfJeJG8Pyv3zeMCRShd5k0mP9ooK39XmUMads/1x5IiVwWGboMmHEO9lsVGGunf2DcJTniA61rbwhcOZDHSIKBcki7OF9E=
From: "Garhwal, Vikram" <vikram.garhwal@amd.com>
To: Paul Durrant <xadimgnik@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
Thread-Topic: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
Thread-Index: AQHY4FQ0tVypMawM1ke4uV2W+2m2Q64V66+AgAB0FBU=
Date: Wed, 19 Oct 2022 23:12:30 +0000
Message-ID:
 <MW3PR12MB4409CDD81742B163D0DD11769F2B9@MW3PR12MB4409.namprd12.prod.outlook.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-7-vikram.garhwal@amd.com>
 <7b8e645c-90c7-a4ff-4405-51df6df2e508@xen.org>
In-Reply-To: <7b8e645c-90c7-a4ff-4405-51df6df2e508@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4409:EE_|BY5PR12MB4226:EE_
x-ms-office365-filtering-correlation-id: 23df9e2d-1ba9-4906-e536-08dab2276581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pN5e24PcLSQ1cCvv38jyTr9A+zOgTE06H8eTvo7xUPz6Eb2U6TPH7glts8dQihw6dh411TJdErO9WwN62n38liv6zcLgHVBNVownh9opqEstGywg939mNYIxYMSQEK5YQN6dpTJySZJzYvWfyunS2R9M5rzPX6sz6lUzB9dPqJWjJ5BXVSO7uSxH0gF2shfLFFAV1S20OY4OdAo7ivlD4vUxYJYZp2SQHfy1sOfKgX/a/06GsaBQWeEmvKkXzat9liZiR+vNx/8EVoJeC86Ba63XPuaW4kTEU9RyqXyeg7cnppg02MdT+7w6OWbD2qdTZSC5Ddr2OKWznYf3WXAHEWopNN60FTykkEzToKAuPTfaI2iuE9zEWKlXSfjcjadGivck7tmC3GejRCS0pAIdI1ohWKIfA7wMMV14+WCLy5DocBPTuk9o9ZIm/euRmQj+3yp2ofaK81CELyjuPcDFtk/j0UvdXbXckQTlHcjMlAT9xGlvErJH8i27l0pAxkyrJ7krKdTbKcL5pPWuhPN34sGlXXjXrz2/T+Vqa/Sx/sDasJel4DvTqy7ySeEHzNSLgbO3pE3QtXjlYtoDxMzHnQM4ekh4W+K63Kj3WBa0hbhTIC37kCth9Nj5RRyBTmigQCj2xSOFEQy9pRqIoplAtALWP9x5wsI0w/pQEpUOPFPH8AMISRUNuY1HnNIzjWLb3rT6dnKT/MiITEel7VdFcrbbYAgRYTDkZFVBZXT/01XB84EXiO6J9x2++g+lUkTHCb0JTU4hrNV+1vKpGbGfwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(41300700001)(186003)(26005)(478600001)(64756008)(38070700005)(86362001)(2906002)(6506007)(53546011)(8936002)(33656002)(52536014)(9686003)(5660300002)(4326008)(7416002)(54906003)(38100700002)(7696005)(91956017)(110136005)(122000001)(316002)(76116006)(55016003)(71200400001)(8676002)(66446008)(66556008)(66476007)(83380400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7+NCEbcC+tFqf3LmBoXY8ba0iAf7md7PnaQ5vbJxfvT/UWwCICC+mEEGnC29?=
 =?us-ascii?Q?yV7HyH0oB5VOuXxApqOyC30wAuEMz2xnNWrPk8aAYjBJ/9wH7pohDwtyZ9Eq?=
 =?us-ascii?Q?n1c5IqQYPCBGQOFqxgAtJldGQR2MfYd+cgIbD5J2VYBxYVC+jYDwDJMiowhB?=
 =?us-ascii?Q?gaxMz7RLvawNbNikc1Q6F3h5aFR73g4xavl4cnLCnoATeQjQHTOvFg0O/Ug/?=
 =?us-ascii?Q?Wr+/3Y6s7RIj9Rcvd3oAK8vIEu9YTIxDxtZfpnoAT/jbySYO7OZtUVasZo4N?=
 =?us-ascii?Q?GNbM83UAeY0u2wyfl0UDpHY7pBTxXxxa3RxbkEX/lsKzQYMicVqoIK5ikccB?=
 =?us-ascii?Q?w8Lpe0/zeEoiHiE/3X478njUBP1b6q/DZeaqr6PztQ00rTDUQCRLTn+WSOkW?=
 =?us-ascii?Q?32wxTchWCDCI09KfdUEIvC+1Psm8qgm34l/I2OGKqqgHIKjH9aGJ+/l90QUA?=
 =?us-ascii?Q?1JNJpZZLqbi17fyZ3u9kTt4xAPajXTiMSsxFhQTkrk8spvtztTO5WEPp9oqU?=
 =?us-ascii?Q?dfY0X/vobj8QuKHqnU8JUg32wh9Qgy+WPXWJYBwlh+DmyeTvUHwmjn73EDUA?=
 =?us-ascii?Q?g6vlvK2tI/fFzUAuufC/dC/5gLnREThm1YMXSQu8H8PkQP9Q2ndhEiQfw5ZC?=
 =?us-ascii?Q?uRiODjlFPHwUWTFFNm/oNTH752qin2y8Agb1mUCPB8SWHwiCDWEfB3Qsr/Sg?=
 =?us-ascii?Q?gzne0gO90kmjKzGVzOX4SbCg/yDu+cYdNHxAX7RdcI/CwWRqWhIEBNzIU6J7?=
 =?us-ascii?Q?fVLrBW6EDPznfkR0JFbrN5h0yHBrafRB1z8ORAClvmGFicMlQJ6EyPaxkXDh?=
 =?us-ascii?Q?UUmtoTWbCdyYNEUBIGjQxUvAx8L9jPzuCgCAlGfHq71UdOrNWM0S2HtTOoyt?=
 =?us-ascii?Q?U9F3kS/yAVTXECHI5pwOiL0spq2+/Pfsql77z7lIGVVAJNiEgwGq8WXGr+bC?=
 =?us-ascii?Q?U7zocUBqRO2bpuy1j4y7GoDMMlQ517Px0C7DAu1RkCMPlIwE+8JFn7Tm/JKV?=
 =?us-ascii?Q?5m4NzDcHy8EaadsevzXJle4kUUZuBAIO38tyvYYLEMaOco6HYuqijA7m0N4E?=
 =?us-ascii?Q?qgCGQpkVKbFThjxq8EfJxFouIWbAfStjgN/lJiY66g1sc0nj6H9SwPpw9GGA?=
 =?us-ascii?Q?QLij892ronN+R5pQ0Jne+BlPJUAp/bOZywqNw3wLk0QXmlLIKQH/ZEe8AZu2?=
 =?us-ascii?Q?HqlrhH4IQUv9npY8FZZAnr/wXxEwY4ZQESwCsZL2D9Z0vcN64+Lxy7No3DnR?=
 =?us-ascii?Q?upXIP9g+6Sso7hkPvBdrNP27cwePAWicQxzRCnoxTG838tQiNuZPVXTDUDoi?=
 =?us-ascii?Q?UPDLKtaZICAMZa9BQ8xJXg9LndeYI+nrHQQcOZiJEd+9CoeCIGGRYebEdPah?=
 =?us-ascii?Q?q9jgvX4X3NVWe2UDHStilfSUjG4WUtHhZLXVGYCUMU6ihHvqT5NUhVqWDsav?=
 =?us-ascii?Q?SCb4fxHpLt7ovoEYE2EdKk8A9Hc3MMhP8Elsx6WOszMCbwDzRvpdTLAkWJiq?=
 =?us-ascii?Q?ov3mYNXTurlGl3mpf6foibGS4nxbJfKbYVFLIgnwSDoSv1liTH7az27vFFTc?=
 =?us-ascii?Q?PNCne5Z0UKT7ZS5Zkp4K051BqTAd2J7hVr/xWtoZustkqBIwR2I6ADUoa7hp?=
 =?us-ascii?Q?Ng=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB4409CDD81742B163D0DD11769F2B9MW3PR12MB4409namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23df9e2d-1ba9-4906-e536-08dab2276581
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 23:12:30.2354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8wLlyxRIG/7emrOSKcnd6OOAgQ79Ob1EdVKjAQVkEie357t2PX0klx7q76kfoWpfXvihaukOvP6E4vcSWVm1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

--_000_MW3PR12MB4409CDD81742B163D0DD11769F2B9MW3PR12MB4409namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Paul & Julien for reviewing. I will update this in v2.

Regards,
Vikram

From: Paul Durrant <xadimgnik@gmail.com>
Date: Wednesday, October 19, 2022 at 9:16 AM
To: Garhwal, Vikram <vikram.garhwal@amd.com>, qemu-devel@nongnu.org <qemu-d=
evel@nongnu.org>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>, Stefano Stabellini <s=
stabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Michael=
 S. Tsirkin <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>=
, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson=
@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, open list:X86 Xen CPUs=
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to hw/xen/xen-=
hvm-common.c
On 15/10/2022 06:07, Vikram Garhwal wrote:
[snip]
> +    qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state=
);
> +
> +    state->memory_listener =3D xen_memory_listener;
> +    memory_listener_register(&state->memory_listener, &address_space_mem=
ory);
> +
> +    state->io_listener =3D xen_io_listener;
> +    memory_listener_register(&state->io_listener, &address_space_io);
> +
> +    state->device_listener =3D xen_device_listener;
> +    QLIST_INIT(&state->dev_list);
> +    device_listener_register(&state->device_listener);
> +

As Julien said, these do not belong here. These are the (current and
legacy) PV backend setup functions; they most certainly have nothing to
do with device emulation.

   Paul

--_000_MW3PR12MB4409CDD81742B163D0DD11769F2B9MW3PR12MB4409namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks Paul &amp; J=
ulien for reviewing. I will update this in v2.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Vikram<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:0in;mar=
gin-bottom:12.0pt;margin-left:.5in">
<b><span style=3D"font-size:12.0pt;color:black">From: </span></b><span styl=
e=3D"font-size:12.0pt;color:black">Paul Durrant &lt;xadimgnik@gmail.com&gt;=
<br>
<b>Date: </b>Wednesday, October 19, 2022 at 9:16 AM<br>
<b>To: </b>Garhwal, Vikram &lt;vikram.garhwal@amd.com&gt;, qemu-devel@nongn=
u.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc: </b>Stabellini, Stefano &lt;stefano.stabellini@amd.com&gt;, Stefano =
Stabellini &lt;sstabellini@kernel.org&gt;, Anthony Perard &lt;anthony.perar=
d@citrix.com&gt;, Michael S. Tsirkin &lt;mst@redhat.com&gt;, Marcel Apfelba=
um &lt;marcel.apfelbaum@gmail.com&gt;, Paolo Bonzini &lt;pbonzini@redhat.co=
m&gt;,
 Richard Henderson &lt;richard.henderson@linaro.org&gt;, Eduardo Habkost &l=
t;eduardo@habkost.net&gt;, open list:X86 Xen CPUs &lt;xen-devel@lists.xenpr=
oject.org&gt;<br>
<b>Subject: </b>Re: [PATCH v1 06/12] xen-hvm: move common functions to hw/x=
en/xen-hvm-common.c<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:0in;mar=
gin-bottom:12.0pt;margin-left:.5in">
<span style=3D"font-size:11.0pt">On 15/10/2022 06:07, Vikram Garhwal wrote:=
<br>
[snip]<br>
&gt; +&nbsp;&nbsp;&nbsp; qemu_add_vm_change_state_handler(xen_hvm_change_st=
ate_handler, state);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; state-&gt;memory_listener =3D xen_memory_listener;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; memory_listener_register(&amp;state-&gt;memory_lis=
tener, &amp;address_space_memory);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; state-&gt;io_listener =3D xen_io_listener;<br>
&gt; +&nbsp;&nbsp;&nbsp; memory_listener_register(&amp;state-&gt;io_listene=
r, &amp;address_space_io);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; state-&gt;device_listener =3D xen_device_listener;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; QLIST_INIT(&amp;state-&gt;dev_list);<br>
&gt; +&nbsp;&nbsp;&nbsp; device_listener_register(&amp;state-&gt;device_lis=
tener);<br>
&gt; +<br>
<br>
As Julien said, these do not belong here. These are the (current and <br>
legacy) PV backend setup functions; they most certainly have nothing to <br=
>
do with device emulation.<br>
<br>
&nbsp;&nbsp; Paul<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MW3PR12MB4409CDD81742B163D0DD11769F2B9MW3PR12MB4409namp_--

