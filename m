Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96806986A3E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 02:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804723.1215742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stcFQ-0006Ka-Lt; Thu, 26 Sep 2024 00:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804723.1215742; Thu, 26 Sep 2024 00:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stcFQ-0006HY-J9; Thu, 26 Sep 2024 00:20:44 +0000
Received: by outflank-mailman (input) for mailman id 804723;
 Thu, 26 Sep 2024 00:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uM/S=QY=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1stcFP-0006HL-0d
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 00:20:43 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29d5893e-7b9d-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 02:20:41 +0200 (CEST)
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9436.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 00:20:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7982.018; Thu, 26 Sep 2024
 00:20:35 +0000
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
X-Inumbo-ID: 29d5893e-7b9d-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGh8JEipHPKH7sFpcVJvj4s6h6WmHFBH3QhXw07mhpFvmnUAZgmoWy1P8lqTHbbt92AXJSpsF4x1CIcE/Kr5CqwUAoiVCGro+HN8+deMIJjx9g+xLKssGlAKEfe7ihcG+YsNv+yeX7tbcUP1VBZCrPLm5KfaCeMPTk3CMJd4hHXfAykqRm5+pTsr87hHPWc+omN3RxYa29hrjYItVOkv0GMU6TVmV2uCijI8JtjCYbJOeFCkqQExrW/iYAeWsubexFHi9La1/aIgs7HhCHLE3Ez7o20ZaNVmlUeE8ZdGxPdqthIYP2EgMEnHnWyTTugO4KjTUAcVW34gqhZkRHpucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wQzngAjyDCpAEm9BDiQHjp9IZuDuPO4nRXa0AkZYvs=;
 b=eWznF2AOc0rWFT96WntIFu9HTbZ4vRD4XK5YaEF9XY6OH3CyOaJriw/W8uwQrhDmJXNABd8hNWJJHznaGGxuU7n31/6+bGl3kLwm1kh5ZNUxUxsJxgB1/NC8nU0g+o0P4tl8xtsbYVwouh02ckx/N+6tgnGljtgT4+x/V8KDneLmUrIFB00PwZqLPpmz+scyd3/MxNAWUmrsRIcZHuNlQay4//VM1eyIOBdUJzOPB151hIK+rAJBnYEkpDmqq4DWKOo/j1toLAs/JlS0xGmu6qqXu6Gu2dz1N7pMjshVwmdbDk9acfqvVTyW8DvkxX9lC+QOe1zmj4G+rf+EJsjrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wQzngAjyDCpAEm9BDiQHjp9IZuDuPO4nRXa0AkZYvs=;
 b=hSJQ7T9h3MP/yWxgl8YMX3jdVC3YLjNce+Elva8npqBSzpBRcwhpDsbBSaGfomMmsoIh73bWXdDRJ5HDZSiD7nFySipZgq0r/tWbGIVlqDZ3kAxCGs7pYcghvFS2VVUWR0ojn/n7HnPXkc4Yp4V6J6pv0M/CiDutu8lmJ1djdT93eiKPPC03Y3O8l+W1Srl5kC4bkIe9xkQQsM33seGe8JuCurcVcwS1+dV7B2+R1SGR8DLUocVhZokLbwbs0ua0tTeoqMsfbHG4QLh/E7dwQKoyBuh+zQrpNYvuyUlFUUZHjehB919DravI5aMY3wCYq+4K37Okwz8sbjyYlYBDnQ==
From: Peng Fan <peng.fan@nxp.com>
To: Kelly Choi <kelly.choi@cloud.com>, xen-devel
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>
Subject: RE: [POLL] Interest in next Xen Project meetup (Cambridge)
Thread-Topic: [POLL] Interest in next Xen Project meetup (Cambridge)
Thread-Index: AQHbD1uMmzIMPtSrwkixpeFY+HR+N7JpNOgQ
Date: Thu, 26 Sep 2024 00:20:35 +0000
Message-ID:
 <PAXPR04MB8459A05A8841D93593D73DE2886A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <CAO-mL=wCxPT+QiDW0Cb-LTQrkcfNTT8Eo_2kWsWHLrKJkhs8Mw@mail.gmail.com>
In-Reply-To:
 <CAO-mL=wCxPT+QiDW0Cb-LTQrkcfNTT8Eo_2kWsWHLrKJkhs8Mw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9436:EE_
x-ms-office365-filtering-correlation-id: 412338d4-0e6f-4d21-c9dc-08dcddc10aa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pHCH2NXbXnzW3eyAY1DqZhWu0fzc0uxtnwyn15MXzjefVmxqCrayVu8FwDyT?=
 =?us-ascii?Q?RdpG327HkiKfWGOFkqrq9Zudqc7jLsCzWp3d/4zu89DT6tEZMj8gOC8PRC5n?=
 =?us-ascii?Q?4YvXsVtyTL7NjK0umWgBfMOK3OyArVGzCVEMx+K7PGhhDlShXRq/Ct8g+/NO?=
 =?us-ascii?Q?CQv72YPbl4KybdWpFBdl90nNWBd8lKxnZWuF912yD45INkDdLdCjHAEklZTi?=
 =?us-ascii?Q?lFKlRRUMc7ctJ9u2ZWxn8Ugr4E58zaRNEA/xo0HAa+0EIFIODI63g8xH842q?=
 =?us-ascii?Q?Zql3SUvQLHFuMKKLG7mZ34KSyN0lZW2INB3Yxo10RU/cws5GFa02dSYwKSej?=
 =?us-ascii?Q?BiaEUD467ydwjwempRGwzhk40ro2b1wMnzyBTWZMs4LzyFQhZWt58NOuaj9Y?=
 =?us-ascii?Q?qKunAOK9vZ8eIm/DvHRzrVjDdbgBZ47rMoiZQL4btLrruHglYPV4VS3bO72e?=
 =?us-ascii?Q?EspPNhXy31ZbpJgkFs33JJLJYYLZdUjVoAysckZiwekz29MiWZS9w+XiFOG1?=
 =?us-ascii?Q?jthJoe0ytS99XP4LJq6t7Mgc4CJrq0/Nlh9AkPF+zvOHw8asfi4Xoc4N4BGX?=
 =?us-ascii?Q?7WqElJOVujylXMJjOFg+qr9jv+mBWRSqkM0R76L+nPgN3bBNbp94+NnQDEOe?=
 =?us-ascii?Q?G5A6Fm/dVaCPvpWEQBeEm4GayZ9GPaEfP4FkeoxNKme4qeEx206/qke0hEOK?=
 =?us-ascii?Q?0tmI4MBRjUN7qkDhxj/8gEr5BmcSkdA0a4yK4KTwWF+I8YIfcvXQ63ctUp3d?=
 =?us-ascii?Q?wEpRXiWrk0maG6OMSGOYkXCEtEqPzgA1xJGWH2Gz1ISVglQIIwAQIM87FHzz?=
 =?us-ascii?Q?CperQqA1XBTiKqBQ+SNTzwuPxjr6snvGFfJD8UhCCMqNHRDfL6yswML+kNVU?=
 =?us-ascii?Q?WbDKoKH+NZjze+NROTE7rB4jU5zucGuSe1oGLzgFdDIi4YOLdeMAp/vlT7nT?=
 =?us-ascii?Q?j3lptxaRsfsDwkfqVqJt3nFSBXdmNgFtNmQlJ+PrAGbY/rM7vZdK/NR08r21?=
 =?us-ascii?Q?BVOVQoIOP4XpjzHOgFrK39CGqztoHO/ZhQ97XQlxlQvvio6A9ffpCRmfzz0K?=
 =?us-ascii?Q?umaOQBkp8GLihQ9fbmYX7891s7mpEi7F89xQU+krJFC3KXz7pOvEVzgAR030?=
 =?us-ascii?Q?yF5P54ERjDfvrO72l5vef/8PTlK8ASUQec+LZCE4XPdAPqigPqQyLhWiKTaO?=
 =?us-ascii?Q?nfpNp+gkpirmZemi8q6hxgEp8uR+cC3+iIxxURxI5i6qMa1QYtzwcWTZKdax?=
 =?us-ascii?Q?8l7WeltujBNnzw66eP+51kR6y2CWYXDOyIyQTZRWcobEUqn7L62PaJ/NbHT+?=
 =?us-ascii?Q?JfvXmLHclJ0i0AutHIt3iW5Vhmt8xj6qx5TWzQvAxy/I0g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F5YKiB6OoTRlB/aznZQyYG6fu10he1EBdoxO8wXibhkrD45p7c4UyLWFzmo3?=
 =?us-ascii?Q?OLhCQz/IbRBjWr/v1rqBCOp4tUvT1AFnlf3MMAm7RGmhE5sSEWHWh0ZS9kt5?=
 =?us-ascii?Q?OgPBe6ALmiWfjd9TeAPd2SQK2rYk895F1nfId9PVohqR6iEvVPLY6yh07aKz?=
 =?us-ascii?Q?uher9eK9K8++wZitDkdkBFHLglpZ3CKqFMgTBxg6jikztVaWf3YWMoaMy1xQ?=
 =?us-ascii?Q?JqaaoEi2+zcdEKZmRGh77WoX0H7PVTqJYP1FM839FC0dz5C89ZIyhTifAuXp?=
 =?us-ascii?Q?zvrZkk2Wga+Kkk89683tGt4sBCU9igQmNQohQTXsx1ro679B3NUCfWpK00cj?=
 =?us-ascii?Q?MV7QfLGvhKRv76rSO64ytu6XDsc6spK2izqvOZIVi1Yp65dWDY4PPjl/jWS9?=
 =?us-ascii?Q?Jd+52sb+JYj2GVF9wX9jeLdiYAiVzNzVphCj6SEfqnO3M5sSWfkytFeIa5CC?=
 =?us-ascii?Q?m/1d585C5T12mE6eRLhvmUx7+/dPCF6GHafaaimkJLyqs2zDPUnfkyOVK4A6?=
 =?us-ascii?Q?eIgyPXnAfp037F3vmfB/c82p2uRyC4Z/bTPvVDGnS5sDQ20SHjbMyjcfkf8O?=
 =?us-ascii?Q?PtHEvZf6GPEh1Z/FErVRhqyKMdtuQuDlVAX4+BJQdz1WQLfRuO2HBNHNDDgP?=
 =?us-ascii?Q?iAo0b4HRRwx/mc6xs0TiXusmihY1Rk1iJHgvcJ/a8mzfZN7D7RH/amwaP46J?=
 =?us-ascii?Q?tC93HXZQdpkfDw19qfA2+izopdqQ6kOWtZWnhg2pFy1nb1EdKDhoSOAdCBaP?=
 =?us-ascii?Q?FX1N8visW3J/Rq81gGCUwNOODtgs09hRV5n2E3gts+oXTmleHYqKNmybLrOs?=
 =?us-ascii?Q?0UWTDucMhnAxKK3Zz8WpKMHcs7cAqhJIH6R0XYrA2NYjGCm4+a5hTVrVGvKG?=
 =?us-ascii?Q?tnpYula6K2uKBZiJTG3V0q9e2POJAB5iOPgjDsSCdi03v0BhNlb+4ML55Wzd?=
 =?us-ascii?Q?9pH47deAxyRZAwgd4MjahRS1+IuEUQbLyGfKTUgtgDrqB7KqDO+Sd+Es1Dv9?=
 =?us-ascii?Q?wZAh/FsGku37ZA1+ZXgpP+GY5flHJ0r1bg2zAvDFa4Ouh2w0AzoOeo6iE3yQ?=
 =?us-ascii?Q?ex+yZSiih++jyoIHuTjy/MhsFdA0fTKOrCx+pYCbPLa0gWOZbDlkkY0a8EEV?=
 =?us-ascii?Q?Xjrf9Q/RVEH90lkW7lh+iGpLJ21ji0hQ4lhtIVUcS6s+aJQ0RkGFU1fslRBe?=
 =?us-ascii?Q?mMuEHc2OXFrj9A7id4H/JO9AmdJ3gJPy2vzD7oxYbTewk+rO0X4N+0VoYe2Z?=
 =?us-ascii?Q?koiDrdNacCwwNKmSbmcbQEivj1T0y8k70aIDqM5jt9iiCUD9frEdWXEaptHk?=
 =?us-ascii?Q?Qr0bfxk8hlzAFMQWbxCo8bwMYf/cX+EUNAIh5yGPz37lFpNLf5gTncXuITQb?=
 =?us-ascii?Q?upERHe7bBOd4pWsHsTlU5Ktpuqo1x74qKWu/jKjIyfYO/e8bNVmp/jwRfP1q?=
 =?us-ascii?Q?d+SUmA/R4+MGHftHf5rXR7dXiW90Cwn7cYju5ZP6X8HXT0Qqb7kf3dub6yrV?=
 =?us-ascii?Q?fRUIbcP+cxP2o3Av6O5uwVOhnY+GMRtNw75OOBav3ojL7VK8oRSEXpXKqnkh?=
 =?us-ascii?Q?Id15IzOwaM/uJoozcIE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PAXPR04MB8459A05A8841D93593D73DE2886A2PAXPR04MB8459eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412338d4-0e6f-4d21-c9dc-08dcddc10aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 00:20:35.6595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeYrjKa5TUPe/Uj4ntjzlIlRHmEKnHP7yBGmo5VAt3zVlGexzj1LzKyRBHRAzEvA3YyFkSRIE8zsqTWsbeBHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9436

--_000_PAXPR04MB8459A05A8841D93593D73DE2886A2PAXPR04MB8459eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kelly,

Wonder whether there will be recording or notes for this and public later?

Thanks,
Peng.

From: Xen-users <xen-users-bounces@lists.xenproject.org> On Behalf Of Kelly=
 Choi
Sent: Wednesday, September 25, 2024 10:59 PM
To: xen-devel <xen-devel@lists.xenproject.org>; xen-users@lists.xenproject.=
org
Subject: [POLL] Interest in next Xen Project meetup (Cambridge)

Hi all,

Quick poll to gather interest for next Xen Project/Zephyr meetup in Cambrid=
ge.
Date: 24th October 2024

We are also seeking two speakers for demos/lightning talks.

Could you reply with a +1 if interested in attending?
Just looking to gather numbers for now.

Kelly Choi
Community Manager
Xen Project<https://xenproject.org/>

--_000_PAXPR04MB8459A05A8841D93593D73DE2886A2PAXPR04MB8459eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Hi Kelly,<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Wonder whether ther=
e will be recording or notes for this and public later?<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Peng.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Xen-users &lt;xen-users-bounces@lists.x=
enproject.org&gt;
<b>On Behalf Of </b>Kelly Choi<br>
<b>Sent:</b> Wednesday, September 25, 2024 10:59 PM<br>
<b>To:</b> xen-devel &lt;xen-devel@lists.xenproject.org&gt;; xen-users@list=
s.xenproject.org<br>
<b>Subject:</b> [POLL] Interest in next Xen Project meetup (Cambridge)<o:p>=
</o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Quick poll to gather interest for next Xen Project/Z=
ephyr meetup in Cambridge.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><b>Date: 24th October 2024</b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">We are also seeking two speakers for demos/lightning=
 talks.&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Could you reply with a +1 if interested in attending=
?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Just looking to gather numbers for now.&nbsp;<o:p></=
o:p></p>
</div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Kelly Choi<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888">Community Manager<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888"><a href=3D"https://xen=
project.org/" target=3D"_blank">Xen Project</a><o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_PAXPR04MB8459A05A8841D93593D73DE2886A2PAXPR04MB8459eurp_--

