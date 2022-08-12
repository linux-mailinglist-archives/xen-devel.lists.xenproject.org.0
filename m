Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8775590E08
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385481.621143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQxD-00013U-Gf; Fri, 12 Aug 2022 09:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385481.621143; Fri, 12 Aug 2022 09:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQxD-00010t-Da; Fri, 12 Aug 2022 09:27:43 +0000
Received: by outflank-mailman (input) for mailman id 385481;
 Fri, 12 Aug 2022 09:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoMS=YQ=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oMQxB-00010i-Ib
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:27:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01446b6e-1a21-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 11:27:39 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 09:27:35 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 09:27:35 +0000
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
X-Inumbo-ID: 01446b6e-1a21-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDve319+SC2fmmbxHobrYcUUekXivhKePVKReYLFzNHe9uZiKkShLeJDNKOZnU4Fphfs/yg3YV6SVvuOoV5I7/MmfZ7Va6qwuhN2PI+5cbNmgqomQqz5hMrjzKJvpGfACphvNUhvs9k8Z5Ct1McJf4eGn0ZHMPE72/v2q+d2UbMYXMWUVq9I4sW7R6jaPeHkcrdj9B32Ghg2iEidk2dny1iyW1hatBgR4O2NgtPv90wOQmBN+gN5x42kMObww3+bp9cKq4mzMNxpGZGvDcagi1fneSm/Kh/9ZRkEm1craBXN1siZGWYqv06R1OGRThY2f12m68Mjiwr10Zfl3D3Afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgerVAFZ6QMckO7cgIBFFLaTElKQrzw75uOKsoOsCNI=;
 b=WyLrDRC9WvdAHoCMeqGwghvtBPbv1fvaGRCq20qZqmT7iCEDPw5fCmMBPDF+J0CIfETt/tEeCE0/NBw0RDOGTVo/XEnkzBi8ES1D2eIFwigkeyzcA0dEQDSESL7qfPf+Xk62KiYIHqVXE1+SZWqccCJurYCMwgw2rNoO2dYN9KrCAAgJBdTAPWChCZVvA158xx23aahZNr6rZHJ2cMb5411bpol9PXDRUwb8mRvp1QiLIkj7SETntlMBk62QojgpadDexLR57W0dxfnrgNvoGz3ZWY5hP+eSf88ja5aASGa42Bku930ZUh1YK5n5Hsj194IT54lWIbyI3PLnVNmBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgerVAFZ6QMckO7cgIBFFLaTElKQrzw75uOKsoOsCNI=;
 b=mHDfukXIKYs45LUj/I8n7Eco5Wpo5sBmgEM1KmxYuYen8Vg0xOnPlh9dP3324p5aygEH957l+vEfZRQF/qFA9sTJ7DaIo61EMNwgKeoM9KgPTOEC6P6BbqneRLZkJgkeknCVfXL6H70QQjqEZEokHHIucZ1gkOezgJbIG5ejHTw=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>
Subject: Re: Enable audio virtualization in Xen
Thread-Topic: Re: Enable audio virtualization in Xen
Thread-Index: AdiuLIEpCE+lAIo1TNCmlHqdHV8UZw==
Date: Fri, 12 Aug 2022 09:27:35 +0000
Message-ID:
 <DM6PR12MB429763D0795CAB57F9F7206A9F679@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-12T09:27:31Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=13fe99a6-6d8f-4d70-b509-41cdf6e7d8b3;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08db1eed-27e6-49f8-8466-08da7c44e3fa
x-ms-traffictypediagnostic: CH2PR12MB4296:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0FBU4HxM/kp/lw2QPn09bHj4U2Z4yrYqz4ue0BRLby89Rkfmyrwi5Yjttg8JvsIJTZb3AR0/HLXETmeyZaW4y+mPOty2Ev+TUtKo/9oKyLAOzKv8X6yh6JXWKZRgA/9IPSfcY7EaAuKpXHOCki3/A7wyIqM0NBuvXSb0QP0yvyBax//tFgig1wIA6wpp5RXuoajcbHH0qu49xcXoA9WBHu/DohJ/NkHQQzsKTOcapZgxvEOW5T8CKKZJRA2tk1qk7RMjhrqi+gqPd/mptxYbdeIwilFTfU+wRe45gjLuX/+xf/zWxLEWmElpYvQTluMQTA3X5dJdYI6HdrfCkmnlQvx2CFwNdBCe1aymBoMY2I4Xm1gkePEcSPMRVLMHuonb4DaUH7R0SrvPvGPHS/xBkBnvNNrFMoGvbyTtBvhhnYs7gCwPZyQKsQUXUEnp7rUhyKX2Swvc907Pg9FBNnLmj1r3RFw1jhYIxgi+q95MrJuMx1N9WAMdP5BYnRMuqM2EWpl7nKkM680qdIiErjj3+8HmHm4IMBBgflXFnbwD7cXlri0ruJQbPomAJXOPzThoIT22VJwNBOBCDPtHvH6juH+5h7Ll5e1G4Q0nGZ3vpqGGtWyQN/3DUQE5L+tc7MFqig3iNEsT0G5iRQL29MX7pnnfF7YSOrvcHkOkb77kN5UyaJ2CoRXIMitClNy8HJlaxLE+NKujJ0u2CI1K92SyO3INFrFm82cZno2BK7mJgzd3DVYvNlpw4TdEWuNHqbYhRgp/fY6Q4KML+Z783iHQFVmQa/hsJTzAiFAwGyvucHVFke4IDKE0kfJ37Dj3fv+SoACywbXukPL9u3mfvoaqTQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(26005)(9686003)(166002)(316002)(122000001)(86362001)(4744005)(52536014)(38100700002)(478600001)(8936002)(33656002)(7696005)(6506007)(2906002)(38070700005)(5660300002)(4326008)(41300700001)(8676002)(64756008)(66946007)(66446008)(76116006)(55016003)(186003)(71200400001)(54906003)(66476007)(6916009)(66556008)(66574015)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c9Ae3HNag2HImHho0cDQwwgq/YNhjkoOAcpyTdh2Wb5N7Fy6qxerx0h66rzI?=
 =?us-ascii?Q?3VRPpP86NIwQr9r+/RqLVuNkW8te665ikXME9XyvlX3aaY9do7IFtoNxgOwT?=
 =?us-ascii?Q?b9p4ONosmfEPabs9wKRA+BLYCaPTXpWwEDuHltCIqCrJD4dsKiIBZfJ36B7L?=
 =?us-ascii?Q?Ir2FiiCmz7MXUJrTkQrUJbaiV9QhvgUhTN8Ogrib4igmpS3bk98KzRZc12E1?=
 =?us-ascii?Q?FI7wMj4VQcVh+MNvRDwz9hTZRL2xMfb0uP+Lm3xRgpmlK5/dzv8ABFFGxO+u?=
 =?us-ascii?Q?BOTOax1fvbNaGFl1q+zHHxrUYTYCBbqGIcXRPbVPLbOnKBwjwQcw9kAFA79T?=
 =?us-ascii?Q?bDuDWt2S+tpna2sMAW45pG7lV3T0RPJS/l9JDB/W8Hu7R9p/LKPKGZ1mEaKD?=
 =?us-ascii?Q?MlrKUGmZtTzLik8OHEsVX0no5BFtGd9ynmbIainAD8jjGTH/NE+bpeII9d5M?=
 =?us-ascii?Q?BdRxEFkeJ2SieLg95655yFgaRNYlbIJIq1RSw80/a7ovfHFAIZcLnSdKB+Ht?=
 =?us-ascii?Q?eFyx2awIR/qi1ZZCfSRAcL4BRF0ZvF0dRFXZ69AnYX59B86UrgG2Ycpy6LWq?=
 =?us-ascii?Q?pGd3C2gGs5QgpI92nDhuSjRgUkMzclZpe92Wl8kLgvlcSE6pMWyS+2xIXn0/?=
 =?us-ascii?Q?e0h2wWaN4fNeB/M1/XTf3ZJeZTRykp2WLU8t+QyReCiH8lIltnxaooj0SbMG?=
 =?us-ascii?Q?4WtGoLd6DB5Ucw+q4bKrL1S5LJWMtdIoy/DdcAHbNUle4cCPt+HXSlNQURKZ?=
 =?us-ascii?Q?4Ccj8VoG/OUnKLU+gz9KU+Tx8pGHyN0c1NJpIKu3GizYR2NYsF+XOYUQvyA7?=
 =?us-ascii?Q?5MQj71IkDY8aMJz6Hu4gbbO/7jvguamex+VMnJke9IDUdBAMt+Y4kSWR3U0P?=
 =?us-ascii?Q?G9tDqWQfQHTB7WL4+HgoUFVAq1AhiAUWjTViorVo+s7GX82MyK1pFxff4niz?=
 =?us-ascii?Q?P1Zuv7OCcDMqFIsS9qdJKmOFFfBHYNKY7+JTYSS5jygnmRqXTu0qaVXjFc70?=
 =?us-ascii?Q?Szp4wO4yd08kJfs0tq49RwR3sDCyb9Jwwjn2SiAaW9ZCVTsVg1WuA2dBlEqM?=
 =?us-ascii?Q?PbsigPDuNZ7Veuja5eJNNXwheSNUEOVcn/N7iEFL5d3GS6tpmO7XtJRUKogt?=
 =?us-ascii?Q?7uRCR9Jbivu8JdXnyodSk9DB/Web3I/+9lkwibBO+thxj1Qwwh+rJOfjMS2F?=
 =?us-ascii?Q?5FW96C4AlEwD15glhGQxmyyjz+ZYaUao+vfIaVytlCsJOi+vPdxWyIF0c7xP?=
 =?us-ascii?Q?DnYw6Lo9WD1OPJ6/eHpgeQzJN68QsHT7ZjXIWFaf9QHXMMSxlVCElZ6lZAfJ?=
 =?us-ascii?Q?eD5b9vtdXAHTcs0UtQbQD6t3nwWw7gm81J36QI5JbtT68fE6M5rh57vx3oYg?=
 =?us-ascii?Q?Cy4Je36BLCWdTXIIeyvTiSjmOB9ijJPYe2u6vy2u/SCMyTbLI2MRmIed/GSj?=
 =?us-ascii?Q?qamRhk3EQixz4zPdkc2goXxRpAyAVdx9B0WdZKmx1b6OlZN0Ru8UAAVzu+GM?=
 =?us-ascii?Q?dfn78g/SF54+RYlN1D1BS8Ir3QdaPqYBZvmqQ8qnXnjwBbdcSPKIxYyhovYp?=
 =?us-ascii?Q?+0oUebVVZQ8Un0ObMPRMFhiWkimDIlv0mLA3XnXa?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB429763D0795CAB57F9F7206A9F679DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08db1eed-27e6-49f8-8466-08da7c44e3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 09:27:35.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuoiIgS6YSzYst5UtmaixZYc00mdigmqZGFkRG6T28ThlLI66VAdaKjp73rf0hGReWAf24gUG8eapyPgWojzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296

--_000_DM6PR12MB429763D0795CAB57F9F7206A9F679DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hello Christopher,

Thank you so much for your reply. I will execute your steps and first try t=
o enable pulse audio as you have mentioned.
Later I will try to enable ALSA which is my final requirement.

Meanwhile, I was reading up on virtio-snd and found some patches in the int=
ernet. However, those patches are not
present in the qemu source code (https://gitlab.com/qemu-project/qemu.git).=
 Do you know

  1.  If virtio-snd front end driver is another option to enable audio in H=
VM guest with Qemu/ALSA as backend in dom0?
  2.  If yes, how is it different from xen front end drivers?

Also, regarding enabling Xen PV audio front end device drivers, you have me=
ntioned that I need to enable backend using libxenbe and snd_be. Does it me=
an, in this case, Qemu is not involved in the audio backend? Any pointers t=
o understand this overall architecture (Xen PV audio front end driver/snd_b=
e/qemu/ALSA) will be extremely helpful.

Regards,
Jyotirmoy


--_000_DM6PR12MB429763D0795CAB57F9F7206A9F679DM6PR12MB4297namp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1934046225;
	mso-list-type:hybrid;
	mso-list-template-ids:669693626 611103012 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">Hello Christopher,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you so much for your reply. I will execute you=
r steps and first try to enable pulse audio as you have mentioned.<o:p></o:=
p></p>
<p class=3D"MsoNormal">Later I will try to enable ALSA which is my final re=
quirement.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Meanwhile, I was reading up on virtio-snd and found =
some patches in the internet. However, those patches are not<o:p></o:p></p>
<p class=3D"MsoNormal">present in the qemu source code (<a href=3D"https://=
gitlab.com/qemu-project/qemu.git">https://gitlab.com/qemu-project/qemu.git<=
/a>). Do you know<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">If virtio-snd front end driver is another option to enable audio in H=
VM guest with Qemu/ALSA as backend in dom0?<o:p></o:p></li><li class=3D"Mso=
ListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">If yes, ho=
w is it different from xen front end drivers?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, regarding enabling Xen PV audio front end devi=
ce drivers, you have mentioned that I need to enable backend using libxenbe=
 and snd_be. Does it mean, in this case, Qemu is not involved in the audio =
backend? Any pointers to understand
 this overall architecture (Xen PV audio front end driver/snd_be/qemu/ALSA)=
 will be extremely helpful.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB429763D0795CAB57F9F7206A9F679DM6PR12MB4297namp_--

