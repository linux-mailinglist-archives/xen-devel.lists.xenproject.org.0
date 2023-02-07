Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9368E0DE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 20:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491392.760470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPTIg-0004Uc-JK; Tue, 07 Feb 2023 19:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491392.760470; Tue, 07 Feb 2023 19:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPTIg-0004Rv-Fq; Tue, 07 Feb 2023 19:06:42 +0000
Received: by outflank-mailman (input) for mailman id 491392;
 Tue, 07 Feb 2023 19:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/b7B=6D=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pPTIe-0004Rp-Oz
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 19:06:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bdafef9-a71a-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 20:06:38 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 19:06:35 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%9]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 19:06:33 +0000
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
X-Inumbo-ID: 8bdafef9-a71a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/GDRoiF31LZeVsfRfi0jN86KhfadOD9trfnFiP3zNhnM0kobDv3sIG1EWD4I48atlEBVwkVkHQtxFa6K+FYcu1T1/6dgjK041A/cfHM2o6AsX071Tsor9GtkH++ZiFNHPcgfFkIrwmP32hJWOaqtO8ZTNMFhmKOgDl+MpdhaYS4S2OTkqLDN5WbosViGcyGCi1kH+HfeSJu9k3PWxovGQnFyszcQgmXpEmTYRyRIojcWNaJw0oaJhHOsybvwdkJ4ASxbrfQLlurvqYnuFagXXyc4EIjxqTFPR7XSG99Nh5+3qTVkiy+8GrvVoEaa6eXP4T5AzPju956GotFDefZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF/FKHSdGzAdLdfjLANUSzV2h8+sZCXFUOFGffZJzSU=;
 b=XzqJPCiPi0LKdpDhssx07p88UZi6NS0TzwXOXUFtN3X23i3iHR6eNIjd06KyLH4ODWtS8iS17DxY9bKO+rt3c3swOK5B34J7XKlRP4/m7FH0jWP0iSXoIQXhzqp+Hcz+SBHC+w8mVsUlEd2NymVMmGbNc8c3JAe5XQYHqZjoY1zw2uRDpWjImL/wRJ+VRYOklGacznd/GzB8Dp8e3WfS11AQEzOH5ZvFrn+RyXdzhCPo5C4kLYt4C70Ej+vwQHmjtSUWZamgR/eW5kc/83nNpbH2BXVCjIbmSj1bNJp6ovFKeJSFXaIeeTd7mh4S3oKZtT+QdIxQaYA4fROQ14BqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF/FKHSdGzAdLdfjLANUSzV2h8+sZCXFUOFGffZJzSU=;
 b=xjcdX3LzMaW+7dWBGGGBzp+xkE3rYs8bLYsDmRId6i8jgnZoqxMH9qOF3vqufA2BOUXeJNLVnqxtYTHtC5JWSMVNF2L2SamWrnf55EKxzpPVTURo33ZK9k/KO4vEhuDYptWbYLlE5KCIM6hF8KQL5vD5cxwyayx+Pd3HsD0dBtE=
From: "Garhwal, Vikram" <vikram.garhwal@amd.com>
To: David Woodhouse <dwmw2@infradead.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>
Subject: Re: [QEMU][PATCH v5 00/10] Introduce xenpvh machine for arm
 architecture
Thread-Topic: [QEMU][PATCH v5 00/10] Introduce xenpvh machine for arm
 architecture
Thread-Index: AQHZNcakEWW/7lvDjUSyrZ2SnjklJq7DThcAgACUN/M=
Date: Tue, 7 Feb 2023 19:06:33 +0000
Message-ID:
 <MW3PR12MB4409AF045F05F924718D884D9FDB9@MW3PR12MB4409.namprd12.prod.outlook.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <84ded117ebc6e8c72f4120df00d357a275da9eaf.camel@infradead.org>
In-Reply-To: <84ded117ebc6e8c72f4120df00d357a275da9eaf.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4409:EE_|SN7PR12MB6765:EE_
x-ms-office365-filtering-correlation-id: bf54ded0-b047-4cff-6fd6-08db093e6d79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 S1ghSw58pf4+n7MHuMMv8U/1mvcZu+8aY0dAgTsELfOXv+FNm9jBZfIOU5MqV3JFuFIZlbqlrV+nq2D7ttXoecy8Lg9SzK62rWplcKq9bbB05hxjqSFt1p0iVGQC8tfjrAcYqPR3VevSH12gQGv28J5LATI/QIQfBIyzhfbyiDY+RiygipGsDaVhEvjKaodhbbJHQGpBP+zknvdxN3riE58GmmR8lUrOtwb3UH7I7+3FR88Rfx6mHjp+FipBQRcYCuGDNOMtWKqQK1Csvi2zCxW3LY1Th2zGm2N8+SL6ZHTb28KLrGiPxuZ5yxOMi3yUp+nlTWUiaoX47S9/TG/ZhFa6gxXMmaqmeh+JsCNACwdogNOQnIpKcdxWFFHfBKCQ5QsDzJOZV5uksTsLGxniWK+FqBdsw3JjFMjGbrrsjwXrsZA8oW/sSL3jQ3PtEab7ocyeIxR7Sd0mGMtK/jc9JD0TfE7fVxQvzqgm8HXkJTvkiak9lXfEWWBUPu8LyocPbn2WgNzD2w8uWHvkMzAB8nOi4Y1oPDmR6SwtywIqc+ayaY+/lALpyGdvxDWGEhgSPbDMFTnGTwyvog3bTtFz5FFvmopTPPHWFo7i84LAH1RVsLcLrgCLaaX3FJdpFKYnF9uZtZ18ZgK0WEDqjsSMeiLEVNyDJ+v0lHIpIk19YrJ8JKBo6VWdxne3EV8JDeVDfYYMJ+4/Mo9JP8o8aNrsGAiza1AUo/duDmsPLpzooyk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(186003)(966005)(6506007)(53546011)(26005)(38070700005)(478600001)(9686003)(33656002)(122000001)(38100700002)(166002)(316002)(9326002)(52536014)(41300700001)(71200400001)(55016003)(8936002)(5660300002)(110136005)(7696005)(66446008)(2906002)(54906003)(64756008)(66556008)(83380400001)(66476007)(66946007)(91956017)(86362001)(8676002)(4326008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J8eP6TiP5I7/4+ntETLs3/mOGnbC1DjFxiFT9iCSfjWzAqLzXszLiWU7JDXo?=
 =?us-ascii?Q?Ho9dxszGu0F1KHdxvPoMypXWOt/jKEpRcS3Ogvq/hltHvgrLwcmDETsKhEjq?=
 =?us-ascii?Q?bfk6eYpkFq9vuQyvB1wOm6wkKiJiU26C3XPzmSDSUqFOdvWKB2Th/3JtNeKR?=
 =?us-ascii?Q?5/0w2DgyQjUGyuqTFVFnM3pr3YXkHjWRngkguCq2xb3LyL2hsYzT0nz428Jj?=
 =?us-ascii?Q?s5Kyk1uPEZma7XXQE4WZaGnUzwbc558FmtEqbTLxvmCHqBzALlaGJ3PlobdA?=
 =?us-ascii?Q?C2EenSls1AE2fA2ZsAu7AWtGoe12J3/+DUKM4pyoRVwKKLPj89WnviN2S7QM?=
 =?us-ascii?Q?Y8K+hz4RTbX0agp3S1beObjQZjEb2V8krw8j1M0LpX4Q5pw1KbKXtdVUNv7j?=
 =?us-ascii?Q?0n9muQJTGRsvJnvxtTnHKEa7ByKl+OjfkEpr1F+vuPFKSb7n4vr4xdOEqTac?=
 =?us-ascii?Q?xd8G05R+M+/pLSwTeIyL53TbZjJ2iAzB13flOFZ/Z5BZ3b7nD2e75mai7ze4?=
 =?us-ascii?Q?I3deKE7Dhyjym7ep/vVsFFw1ERj41FlpC403lDADrn/uHJDyfT0jTdgjO4fo?=
 =?us-ascii?Q?p51UFDkdpY0JbTc89vix2SS300T3bunOdeX6Wy9xPOSGfVm6SR7nDjsrZlxC?=
 =?us-ascii?Q?Lt3hQzN+oGXRgRny+cg9oI8c8EMk3RokQa6V9L2b4PmeNtLrtLnA5ICmCc/k?=
 =?us-ascii?Q?1avJpJHInVFWT/RsHSxMLQgqGumX4PXWsoENFA3RXPUEfajhCWfjiSdn1/WY?=
 =?us-ascii?Q?S4DdtFqGjY302+WN20FMVuPJ5lhSQwwoSE3ibks18jcfM5bv3pKXaE5fKZT2?=
 =?us-ascii?Q?+ivPC22Zt860n9is8Y+y6AvqvSFJeKdrx+O2bEDbXPSJhSIi8mFFDHyAvnPf?=
 =?us-ascii?Q?XM47/oM8d/FwJh1sp6rLIT6vM9Rv1DKIuiisBHiKxJbNIhcJivlAxQ/VCQAF?=
 =?us-ascii?Q?TZEN5Rt5197YPepfj/fjR5e84JRxnW4kX8IrI1hPcb9RD3wCzYk/tKDArMl/?=
 =?us-ascii?Q?l96jOtnmLodvD7UFLk2+iy4CewtGsHQop97RCCuaUR+8Oa4v80Q4hhPRX8OY?=
 =?us-ascii?Q?MOcLR046o/abKMUwI4PzJbcAt/Bb2im1fekR4lCG3TMk24iJa2YGF/66einR?=
 =?us-ascii?Q?OTtKvNfu3SWMyaqL99xKX5UQU1vGGjgeMwjtGGYto7A0/WzIig81TNaQ++Hu?=
 =?us-ascii?Q?m+Qs56zE7P01EAUIo1mmDAYY7zMGDQnVfvyytUcC8o2gujAGwV3xg2Z2fXRT?=
 =?us-ascii?Q?Lw5esno1o++Dj2jiHhBgtSvzJy7Nu10jo2DOPVACeELjdvrzNBZdZIpCtiuN?=
 =?us-ascii?Q?iLo2OFMGc93jlloVZsC9ewaMo8vyED+oNAb75FxUaibwSLgBQT8E0OaNB8nY?=
 =?us-ascii?Q?kIMuae2rPdD0gGIOAl5IpTskFw+dPVVkx6fML+EZlZIOmPmsC1uWwIwTyuBA?=
 =?us-ascii?Q?jQn1ldsd4iSPSdUtO+4Q9OHvTj0B1RM7Xty/LWL+32f8IANSndZk5StRtZXO?=
 =?us-ascii?Q?fs40tstw5zk7q+NM0YuamjxI1UmWX//CQJRCEaNGt0gdyOMPN/mi6ZBOAvaj?=
 =?us-ascii?Q?kWiYkyygtgG0xAjUsB64GHqoB8dsE/7QkV3bwzZ3PI02p53qkcCOzeoPvM4i?=
 =?us-ascii?Q?fA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB4409AF045F05F924718D884D9FDB9MW3PR12MB4409namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf54ded0-b047-4cff-6fd6-08db093e6d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 19:06:33.1885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgpOi1hzlmeAx/woEgskTAdZCJUxbdti1loBI07ZX0fVs5T66ltMxztkS2pedXRFLenx6kkFQqRnGhYCnHeHCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765

--_000_MW3PR12MB4409AF045F05F924718D884D9FDB9MW3PR12MB4409namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi David,
I forked the QEMU latest master branch and added these 10 patches.

Branch Link: https://github.com/gvikram31/qemu

Please let me know if I misunderstood your request.

Regards,
vikram

On 2/7/23, 2:13 AM, "David Woodhouse" <dwmw2@infradead.org> wrote:
On Tue, 2023-01-31 at 14:51 -0800, Vikram Garhwal wrote:
>
> Hi,
> This series add xenpvh machine for aarch64. Motivation behind creating xe=
npvh
> machine with IOREQ and TPM was to enable each guest on Xen aarch64 to hav=
e it's
> own unique and emulated TPM.
>
> This series does following:
>     1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so th=
ose can
>        be used for aarch64.
>     2. We added a minimal xenpvh arm machine which creates an IOREQ serve=
r and
>        support TPM.
>
> Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
> moving old code to new place which was not QEMU code style compatible.
> No new add code was added.

Is there a git tree for this, please? I'd like to check for conflicts
with the Xen-on-KVM emulation support which I'm also hoping to get in
for 8.0.




--_000_MW3PR12MB4409AF045F05F924718D884D9FDB9MW3PR12MB4409namp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
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
<p class=3D"MsoNormal">Hi David,<o:p></o:p></p>
<p class=3D"MsoNormal">I forked the QEMU latest master branch and added the=
se 10 patches.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Branch Link: <a href=3D"https://github.com/gvikram31=
/qemu">https://github.com/gvikram31/qemu</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know if I misunderstood your request.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">vikram<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:0in;mar=
gin-bottom:12.0pt;margin-left:.5in">
On 2/7/23, 2:13 AM, &quot;David Woodhouse&quot; &lt;dwmw2@infradead.org&gt;=
 wrote:<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">On Tue, 2023-01-31 at 14:=
51 -0800, Vikram Garhwal wrote:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; Hi,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; This series add xenp=
vh machine for aarch64. Motivation behind creating xenpvh<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; machine with IOREQ a=
nd TPM was to enable each guest on Xen aarch64 to have it's<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; own unique and emula=
ted TPM.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; This series does fol=
lowing:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; &nbsp;&nbsp;&nbsp; 1=
. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; be used for aarch64.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; &nbsp;&nbsp;&nbsp; 2=
. We added a minimal xenpvh arm machine which creates an IOREQ server and<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; support TPM.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; Also, checkpatch.pl =
fails for 03/12 and 06/12. These fails are due to<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; moving old code to n=
ew place which was not QEMU code style compatible.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&gt; No new add code was =
added.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Is there a git tree for t=
his, please? I'd like to check for conflicts<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">with the Xen-on-KVM emula=
tion support which I'm also hoping to get in<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">for 8.0.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_MW3PR12MB4409AF045F05F924718D884D9FDB9MW3PR12MB4409namp_--

