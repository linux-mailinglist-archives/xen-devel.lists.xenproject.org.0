Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BB5BD49E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 20:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408874.651719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaLH7-00033u-6F; Mon, 19 Sep 2022 18:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408874.651719; Mon, 19 Sep 2022 18:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaLH7-00030p-2U; Mon, 19 Sep 2022 18:13:45 +0000
Received: by outflank-mailman (input) for mailman id 408874;
 Mon, 19 Sep 2022 18:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/nH=ZW=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oaLH5-00030i-GY
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 18:13:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c90cb575-3846-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 20:13:40 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 18:13:35 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 18:13:35 +0000
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
X-Inumbo-ID: c90cb575-3846-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao7FsFtwPzM1iolLbeEMBBV9em/Kayt+EYJpiBNAJDr/JX94/NV5K6A+JBaPvXoxdyAB2QNf8qVfYjd0IONLg6IQyuL9xJ4DTY8yQ6JnoC3xFB4E8ikMLVmPHiRcCTPfU2YVnuBU827h4AuuVPZquD91RAT3A8v1HZcf0lDq5oG4RZrP/ux4duYmc+1IWr8zyyK9SJ46oo/Zbt4+wweKJAO5+pz5v95zxvcNGqc3r2Tj7xCysoEIWhaeTlRRstnbdl5tXhARwvWnQPfTw6krN/f7+G/N46CxeB+PcfWmvI5EHnMEjW10u9aUkyIWEtfd/NGZp1HRbgpLOhzTFiehFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TddeYItWX+tu+s2zTYHM1m3sYMGMLNbNHHAkbEEfq1s=;
 b=LrdD81KNupU9FNu2UdHVvlJBEpFbf8ygMOgYwMBtTRQMito1LZ+3rjdSajqrWCU7HKnmP+GFE1MbHyZyySlIdGKwdxn/rioWIf8T15kVlyaFe945l7lg3+B9N3A3ke2dZ7JNCRfYtlzy8bilgUpQaNJIVbOajTf6cJtZKq8O/qMg+U4sFmtTjZqkemtLM5ZuY0CEqQlGQbMY8ZOZht+eBQ0YL81yRwDmQckItOIWft/3x9Elc1Hskbb8dJTpqjM7Bsu5p7Hu7ytHAQzvA8GvOG3VnqR5eIzU+JDrmvOe2wA3MR5mentFrhRhaMWWZnG4FBBLcOL+8Uci9qmtMIboJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TddeYItWX+tu+s2zTYHM1m3sYMGMLNbNHHAkbEEfq1s=;
 b=10TTL+baKr2W0qsdXTlpMKVTIQ5fMO0alTfPS9tV3D+EUtILWv6loUUQwCD2sTVcy4E7TqS+N36WbErfZWOkC3hLDCOaXR3jNNZtwOPonG9oQbQL+U3J/uWYqCFvyxaE3PHhvFHxOr1ZxWypJwnFD4zyd4gbprcC+tuJ3o78GbM=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Mallela, RaghavendraPrasad (Raghavendra Prasad)"
	<RaghavendraPrasad.Mallela@amd.com>
Subject: where are xs APIs defined
Thread-Topic: where are xs APIs defined
Thread-Index: AdjMU0z+DCbAdhQcS5m0EtpwYKQWwA==
Date: Mon, 19 Sep 2022 18:13:35 +0000
Message-ID:
 <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-19T18:13:33Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=4fa26e8d-5e7f-412c-becf-e471622aa051;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4297:EE_|MN2PR12MB4502:EE_
x-ms-office365-filtering-correlation-id: abb30ab4-5911-43ce-ba1f-08da9a6aab02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dt5Clkw5WE2r9fgdjIz6nDYt9c1XYPf/KXKqgSc/wh2rqBNDr8mlSP+UbSvl1KzrK1c1nCPXu/l+K7+3nMaYyGNcpMHBnNHijPpPTx7V8gQk5NaBZJABZ6xQUCuw5WjjTGS7XR7SCaEx8pwQy3cRfd3bxk8bSH9CJcgApU4A2CVvYz0JEWvSyHZI/WYqp7q2ymOCeXUwJPQu9sYXGnqZlWtt9OVy8p55sORAI2sJFCOe+MdYw4AB22k3kydV4W+8Vee1I3nJdVP/4diaZo2itU35cZ/qUSAJNtSrPwQOGRA9zLYFLpD1dEcJYy2Z9iColmNllAhaVpFePtBMxb/iaEi13w7eB5IHJu23AdOeW4PKgRlyRc+zlLprf2heVEP8/TunPd7IKTTXAZaSkh0/hpHjYP5Ucmer6jm9MfrGeMSfxDCx6xNy2Rprd26N5jilVlFXI2EDWtcMr3hh2EkhlhTwcGpApgyVKmfoGacH4S3oPvNVjLjlsYQclZge7s0OOMc7FMFC6vhA6+wwPH1LcWN66M8IvWqzxzuRrrmKNcSiQTXIQXOQ4RwZDNd0ebu6aCID/XRbzQTmevhe0DhDCZHB+zUoappk2EeNf6AgYpdB/JXQLu2nD1OJu8CBq7FYs6++Pll921ZsFxzPTAPo8BbslujxHx7ahThIGSCH/KJr3YiKnBbZzHMcU1L8wamX6JWyy3cOZDu6nhpSPIfjcEEIuuAmOpcBWwkuA/kj/a1Abhx6UvWxysYw894WRg1jh0EX0YutWF/GeYQZH9cKVw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(2906002)(38070700005)(7696005)(41300700001)(64756008)(6506007)(55016003)(4326008)(33656002)(8676002)(76116006)(66446008)(66476007)(66946007)(83380400001)(6916009)(558084003)(66556008)(316002)(52536014)(71200400001)(5660300002)(186003)(8936002)(86362001)(478600001)(38100700002)(26005)(9686003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/daG2VB6oOLGaVXMFAennk9l9ZIXu2Z6RY8P5UH4wFeWM5YXb8kxzNumifvO?=
 =?us-ascii?Q?dk3mNC7F19FsORUJ/3475IaGR/ONlH4LkWa6yuo5gaztoPDISTHhl5bz8Sn+?=
 =?us-ascii?Q?ZGZ6bqEIlDzPAuPNaS3U6kGPuPI4mVBnx322Kbc33IJjtpEU5yMBgyss9thk?=
 =?us-ascii?Q?CKwyAhLCPtbK083Axz52a1VZ7mUpOt8z3XcS/LqtnqZv66IL0TTit90/IZQc?=
 =?us-ascii?Q?aTnT6YgrzvHVltB1UuAUbHWsHJGW+/POok4L5k6dDt1oevrWYXPP4GdXqrKk?=
 =?us-ascii?Q?JR7EnFtjhPcbtFYd4CPTDDrNTERtK8eRikilWymFAO81oLsLZlWjPwTxWGNS?=
 =?us-ascii?Q?1nAqAgFp7I86lgdo5/m+afUXcbaRJ/0pS/5yrgDhBXbV6x68pv6C1qTK4gdK?=
 =?us-ascii?Q?tfOh7x+fRAEbKmho2okfoAanGujegZMCSZoxW+lDZrVyViTl5vzk2t+kHrJJ?=
 =?us-ascii?Q?iau4jiAh6bVgYp71WaPWrj/P6nLEXd3bwvQko1owzbP+hf2orlcspkZ6bhPA?=
 =?us-ascii?Q?6SHxQf2zZMKnRG2XXCKqY7L3yX3ZDo2k8TR13g8SPE5hUwdSs8Pk7nPLXq5U?=
 =?us-ascii?Q?fmi9oujxsD6sUh/gyfF2mJmUoEhSEPOBHj+1EXdIEGcAPKCF9XJA2EkvNf1P?=
 =?us-ascii?Q?ZV0//pArl3ozFO1aKmOoV/9NOifsbMwI+643SIy5eQgyTwBf7Nzeuo659aK/?=
 =?us-ascii?Q?XitdVgcmkMhZPudSdhf2ZplWa/5C3EE4M1g5/xI49wbgGJn/RF7JMi5ighov?=
 =?us-ascii?Q?cTmqhXDI7A/1Wa5fsKpG9Dw5okbN58OZ5ao/RXCqliemKKNkZKMRc6B6hCnm?=
 =?us-ascii?Q?G7js6u5z+cfZ/cBXobdyg2ApHcnIdU8k3zLd67t6BTnW2j8DsjZFA9xun6PN?=
 =?us-ascii?Q?SvlEyuLaxcHHB1WrbI/ICEyFrkLUwz+dDIexWpZc+PUjFhnIzyPYKoVx/8Xv?=
 =?us-ascii?Q?ulMhNMvafI+FOW4MquY1jS+OWXI1VcMDkLbuLt5klRu1ZPJqBebUZV0zFFoj?=
 =?us-ascii?Q?ytGoArId697vLv++sVTuRwWUpwAtoU8Tqeb87VvZ3a38+78nhq7Pc3+HdDKY?=
 =?us-ascii?Q?Li7laAVszdTmP74ZKHGS5OMjKIhBWRhmraoQYDRA761vKglq89qu8Uw6WOZv?=
 =?us-ascii?Q?BCFo8LqgUf126fabZud/8D0MU65tX8xQQMnRd0sPOriuDmKNHGM+u8BzQXka?=
 =?us-ascii?Q?hD8ASTxA5axLg7aE+lYg6enuNNStOhyE5VhCZK4Nd75QIOnOxyPxd98kvzJI?=
 =?us-ascii?Q?N0kJN3Alsjlax4HJfxNeTHdkobWIQmcbCDTQQ+mWXKaIq7YW0/bTa2zglVFN?=
 =?us-ascii?Q?7wpZfeJRaGioVezWhsfhZzj+5eco7DOzYPymvdgeeVL1gbe2b6TW0A/N2H4d?=
 =?us-ascii?Q?zv2JCb32WNZb0hOmyK34WYblVeHCOnXHuagzD50g5NGE32CwQ6IP4XT2DxLT?=
 =?us-ascii?Q?p7GQP5gJdaTdDQnPgCxw2TexQJbU51bDp5MiC1Uh5pRI7/6/ABFx6IMq+8EJ?=
 =?us-ascii?Q?f6qRp63PDOxHespClZD8y1jimNwEbHYWWJ33uNrEzWGGF4yCPOcTagC430Dx?=
 =?us-ascii?Q?Fr4ahcWgS7yLcil+j2kteO9YyL3CXUV61/6pU5iL?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4297953EB76ED8376286F8199F4D9DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb30ab4-5911-43ce-ba1f-08da9a6aab02
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 18:13:35.2483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AviVDwRDyiiS/pW6VVNcZMIlh3WVL5nqiq/A075oFk3XPRojewwNfpEKFU63ghWLhIXKTL1DRtVmHu2uI7m14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502

--_000_DM6PR12MB4297953EB76ED8376286F8199F4D9DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hello,

I am looking for the source code where Xenstore access APIs like xs_open(),=
 xs_read() are defined.
Please help.

Regards,
Jyotirmoy


--_000_DM6PR12MB4297953EB76ED8376286F8199F4D9DM6PR12MB4297namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am looking for the source code where Xenstore acce=
ss APIs like xs_open(), xs_read() are defined.<o:p></o:p></p>
<p class=3D"MsoNormal">Please help. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB4297953EB76ED8376286F8199F4D9DM6PR12MB4297namp_--

