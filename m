Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A117357FE9A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 13:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374514.606586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwWP-0002rc-Hp; Mon, 25 Jul 2022 11:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374514.606586; Mon, 25 Jul 2022 11:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwWP-0002p4-EH; Mon, 25 Jul 2022 11:45:13 +0000
Received: by outflank-mailman (input) for mailman id 374514;
 Mon, 25 Jul 2022 11:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZFJ=X6=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oFvwX-0007QK-VK
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 11:08:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e1d20e1-0c0a-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 13:08:05 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by MN0PR12MB5738.namprd12.prod.outlook.com (2603:10b6:208:371::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 11:08:02 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::d183:d8e4:a6a8:e814]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::d183:d8e4:a6a8:e814%8]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 11:08:02 +0000
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
X-Inumbo-ID: 0e1d20e1-0c0a-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPVgGqYILFVynq+nivA00pGVEZv8ay+LpfHy06dTzQnb7aru/brTjITnuCBGsuObU9FdTv4u76z4f1vJ6lHBo98O0DLzsXlpCOJsJ4wPRd+Hz9+iWuwLLqUTceAUD85ZWi0C1D5SJOzL/VbFZffqWDAR+smZKo2FBNVTkey+7WHpYEswCZIh5sL+M4ZDVhoN82ku26S1D9rIwyI9wRiSLmrpKsNM4X8Ey0LIAujKgCSz/fIuci+rtHvSzMcr6lrDyitjOUliFPicmr8qrw1rqzq60XS66/y5qUr1NjhG0mrY5oEO8n82eONSCnoOZazK+CeOD69lWuh7D0Pb6435Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pE36YuDFr8dBcDQe1VFdtWB/yKy+888/RgE0jLo6Ec=;
 b=g2LnAtgaKfOQWN30toqn88/JaXI+9VYJ4HWotfZLWzpq9KviPID9l1599WYCA3N8e/qlSasuwBq+93LvVb5Ykx++hGbSkIWe6C1JmXufkgys322GN8A82ads7FS9snxAFIctuF1I1/nrahU8iGI/h8u7tvLActZaWvFjSWWoCNlcV7nySelqKO+YDHgea9Aidv9SEGeaYvYxjML3sAiJFGUDc/UwjplHLbXRbkyGcRNcHzlFp+viee1yfVgwLE4K6kvFpbCDzZ2MGTPNIedi7ezD6ZB3ol43IzaL8N0DV9b9cC5xOQGaCXAZ7Kdc4BUNxDcPRPAmebcMZz/dyWnLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pE36YuDFr8dBcDQe1VFdtWB/yKy+888/RgE0jLo6Ec=;
 b=5Z8p+fBHsXpVzqp0NBwpyVeLYmiglUQMi8KFLzvP5WxWTuJsuiemaU1uAw9fTgeo6kmC8VbOgEsyufaNFKyxx0gr0cBftaXZ32/YjIN8r0nxWTTz5YNuakQDh5isRbdOQkwe4nYXVBf+tZavabWHx/og9l0d23zZORQQlOINiNk=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Enable audio virtualization in Xen
Thread-Topic: Enable audio virtualization in Xen
Thread-Index: AdigFizJpGeQu9pXSearK44pKRlEjg==
Date: Mon, 25 Jul 2022 11:08:02 +0000
Message-ID:
 <DM6PR12MB4297AA9CE29208A979437D889F959@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-25T11:08:00Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7d5c4f99-97b2-458f-bee6-d48e42e127b1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0944b6a-4e07-45d0-798f-08da6e2df0e9
x-ms-traffictypediagnostic: MN0PR12MB5738:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8kQVsv45sr0ssnsJ+z/RKwXpQt4MX8GsqFoAxhaC1rwHt0zkKTUltF2XpbBoOofh5AlmdR+TkzzpjulnqH5U5vK45N+iXgGCXV9wfhiyZRXJefnpx9MvDNJ6OFfOMHZ98L90H26SVGAadU/r7tsrL6P7O0sO/7+4+h2Z4g+ki4sr063GVQTXGPrQ7965ofiY9SI+XZ4lcZpfTiKdYlj7L786wQHDlo049B3247MKdnDnTM3+H9pGfScVtIhxXfxvdVGaWBClllXZC/yIKfSOK401BRa7DR4wi+IVa25laNEJjJCZ7BCBUNNjJaJPkLZB3AQDq2hWmTjSL64xf8Vgo8FeD8hleiJ4j6U33gr3AiLKtPUmnbDBXYDHbIC6cnPKAAdGIZGQodzgRr087Ek7PPqzc7saxmKts6XCyjCUCNHtXB9HOur1AjIQGglX/ex+5W9+TYm9d+1CPrBcm8TdoJmGyhGIVua9zO5b8hv4RC1mHAmLeiHELD+YSRUfW1RldY5bZ4fTJJ9GI4X7DUh5eYq0bH1K8iAf4rUloTzll7nWLwTVk01arDXw0WzwKlXwG8QzNqKtEFxWCZhuodV/e0Lns3zbXADQ+eY0nPq9Up+umditvpUxQr54LTuDYIonowK2wFa+a07W1Alt8s7XW2q74uCrp4wqv/d4pEXp+LathQzGx7RiPFGu8LqsHbSQ5wsHa1hLS4Hqro+RKTKG0OWba1BLj+uXTGqCB2aIWL7htgQZHYRm1ph5DcB+Ncazxz/XKhNcXdwYT6wTe2sHErpJAr50aSN+4w2JBb2fTRFxxaZOVW2hjkpsqqXYHW1X
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(38100700002)(8676002)(5660300002)(86362001)(55016003)(478600001)(71200400001)(122000001)(4744005)(76116006)(66476007)(64756008)(66446008)(52536014)(8936002)(66556008)(66946007)(33656002)(186003)(6506007)(26005)(41300700001)(9686003)(7696005)(316002)(6916009)(2906002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yd0dbIYciRFAYaZVjogPw+njC0cl+WEQsxIwPoKyoszS6wMBHt0jnUWnJ+o6?=
 =?us-ascii?Q?uIPyPHrn1yt6DxWESTfAUr53xaqVCfnjnTQAEEapRxETjthIGwphMqW+RRli?=
 =?us-ascii?Q?lb8J5dMqP4lN9jomBSZcVbisAOxwhHsBugU+o4rlM2Er0GjdwLReLfo/S4Vx?=
 =?us-ascii?Q?ZuzHCC+07MCjJq8uT1jgGJQ+xWw9OleYykzSGeWBmyEas2zf5ygBLosHa1t2?=
 =?us-ascii?Q?hPljeEOG7cHL7pQ991hdmXlZaVQJQPUlypQ2cMjcg3BfGMc7A+8naUV+rHoy?=
 =?us-ascii?Q?V2eAAos0a7HeX1UHRIDpGo72JnLjpO4ZpxhyBbC2JYR+P/3qjAYiTKduHT6B?=
 =?us-ascii?Q?YjeoE0t58BOuVuVpnPjbTiff4CMHLV3BUbb7hs1uIsevfYohGt3cm7EqHLc/?=
 =?us-ascii?Q?cGe4BxjSw1RRl/84Ayr6uGR1GvIV7KfY+MRrJOq59rlJn9xFMvsWKY012TYD?=
 =?us-ascii?Q?5u9Rk9c/IW9lGsbJBeGoVHtkbpo8zsPTRUqiauCfQIxZB9nvgXcsI5LMCpN/?=
 =?us-ascii?Q?pTPz/LtNHw7gFOhL6O7AD8Qov3WZ2c9P9oZM28R6dySGHvpN7iJhRjCrdjnH?=
 =?us-ascii?Q?pEMtoGNNecRDlKn/AquEEegkMyg5dBaka8c9dSHRWK7k4AuBq0vXafDIzkeE?=
 =?us-ascii?Q?aEKy1lD5/KSGCkSWgvYFJ/PqEOdhan10aHlBQyIFxm5je/iA+4M0J/5Mcnnc?=
 =?us-ascii?Q?RICfzMcABLjJxVAT/eXZlUfoyEZrQP6tDqXGNMAKBlzEHiO/+pAzeatvji7M?=
 =?us-ascii?Q?HSPkHOBHZoUPSAzGPc02g6Ehm860gwyl9EwiR/P9likRWiKBkdDht16/l7h0?=
 =?us-ascii?Q?nc1gXwUDyZxtcg2c9mjPDq//pDzn0Hf/TIJc2o1t5ILl6NYaVYUeq+jNEtdu?=
 =?us-ascii?Q?iFzLt3Z078uPM+aAaAtpW3e+e5flKgdQuHKuJe33PqmX+ZWktsydIbBn/6bz?=
 =?us-ascii?Q?iH3n1uoU6W7Mrq3YOwAkC1lKKtEnoDVY+a9/HHB+4w1wvyl/miLcCb4Oqkrr?=
 =?us-ascii?Q?iQFW8QEhx1MkKmwl31d41L2IY8fu8RntWwia1FEPhJm0/RCt/7NasU20JE+G?=
 =?us-ascii?Q?yfPLwdrhG9RUoM8jZ1bYIHK80JeX0BTfnl1/CXy1O8ey0yRNzyr6FeyCZU2R?=
 =?us-ascii?Q?VKfnnRC8LVsvx0f8aqWogQEICA6wmztAhHiE6IBx6zAxLgU+MdR1R1R0LNMr?=
 =?us-ascii?Q?Ll9PvE+ONhQnufxVvYtLoLQW0tfo1jB9EWCaXTjDPvIH+kQrua0L4FEACFYV?=
 =?us-ascii?Q?tmuUqJIGJ7Q8VENE506pa9y73pz2d/vaw12poxEPr69uQL6XAelu9P4NijjW?=
 =?us-ascii?Q?JxwQXHy+90t6IiCZD7LinbptpoF5ZMBQ8FtBq7r426WtiRp4MBPRZHBN3Xly?=
 =?us-ascii?Q?Sj78DQJ2k8n/413k/OOOTdue9B/n6jEhEUTL9hhXPbJs7YHgap39D48+Ny0A?=
 =?us-ascii?Q?jnhWx4xhajsB7PH9x4Lfo0o8cgM2u2FmDfssGVAoYTTiKVNJF+f1iCyQ3IWG?=
 =?us-ascii?Q?HtovTP46NMzjmFbIot8pRaiqt7KxawMfM2hWpwUr1wdAzjaufTn9pgLHjoVq?=
 =?us-ascii?Q?FytSWmj4ZHdgEbHCH93Egnz+sMGteXz3lfi6Bj3/?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4297AA9CE29208A979437D889F959DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0944b6a-4e07-45d0-798f-08da6e2df0e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 11:08:02.0606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yZgSywADXfhpThqgkYjLoRWGZvjYJWwcpyfYfXCNqNLUn4zw7eUNnjPwBdR/LmHcoS+cDPUYq1Qzeaxg5jjsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5738

--_000_DM6PR12MB4297AA9CE29208A979437D889F959DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi all,

I am using ubuntu as dom 0 and also dom U (HVM). I want to play audio from =
"dom U" Ubuntu. I am new to Xen/virtualization in general.
From various reading I understood that I need to take following approach:


  1.  Use Xen front end ALSA driver in dom U
  2.  Use Qemu to connect to the backend ALSA driver in Dom 0

Can you please let me know if this approach is fine? If yes, I have followi=
ng questions:


  1.  Do I need to recompile Ubuntu to support Xen front end ALSA driver? O=
r will Ubuntu iso file already have it enabled?
  2.  Ho do I configure Qemu to enable backend driver?

Regards,
Jyotirmoy


--_000_DM6PR12MB4297AA9CE29208A979437D889F959DM6PR12MB4297namp_
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:361640008;
	mso-list-type:hybrid;
	mso-list-template-ids:-355573052 1768343624 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
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
@list l1
	{mso-list-id:1757941558;
	mso-list-type:hybrid;
	mso-list-template-ids:-1182106530 1172707152 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using ubuntu as dom 0 and also dom U (HVM). I w=
ant to play audio from &#8220;dom U&#8221; Ubuntu. I am new to Xen/virtuali=
zation in general.<o:p></o:p></p>
<p class=3D"MsoNormal">From various reading I understood that I need to tak=
e following approach:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo1">Use Xen front end ALSA driver in dom U<o:p></o:p></li><li class=3D"Ms=
oListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo1">Use Qemu =
to connect to the backend ALSA driver in Dom 0<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please let me know if this approach is fine?=
 If yes, I have following questions:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">Do I need to recompile Ubuntu to support Xen front end ALSA driver? O=
r will Ubuntu iso file already have it enabled?<o:p></o:p></li><li class=3D=
"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo2">Ho do =
I configure Qemu to enable backend driver?
<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB4297AA9CE29208A979437D889F959DM6PR12MB4297namp_--

