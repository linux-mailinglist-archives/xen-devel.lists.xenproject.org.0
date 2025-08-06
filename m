Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D6B1C4CB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 13:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071644.1435063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcGR-0003GB-RZ; Wed, 06 Aug 2025 11:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071644.1435063; Wed, 06 Aug 2025 11:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcGR-0003D4-OS; Wed, 06 Aug 2025 11:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1071644;
 Wed, 06 Aug 2025 11:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=re9T=2S=daimlertruck.com=john_preetham.l@srs-se1.protection.inumbo.net>)
 id 1ujcGQ-0003Cy-8w
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 11:24:58 +0000
Received: from FR4P281CU032.outbound.protection.outlook.com
 (mail-germanywestcentralazlp170120004.outbound.protection.outlook.com
 [2a01:111:f403:c20c::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb4814e0-72b7-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 13:24:57 +0200 (CEST)
Received: from FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c5::14)
 by BEXP281MB0213.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 11:24:55 +0000
Received: from FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
 ([fe80::521f:afa1:ffd4:28a7]) by FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
 ([fe80::521f:afa1:ffd4:28a7%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 11:24:55 +0000
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
X-Inumbo-ID: fb4814e0-72b7-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4K75y2UpGFml8+NdyQI+VKr8BMUtDKdWpuQ4ExbkpNrlKisBV2wcB1kSksr95jP+AbkjwCErKl2AacW8uNifrpGxoaaIa12YAR3Z2UMTltf8qB0+j5KW6XIWmstTdgzX5pCcLXqE5y0lGqZH0PXlxrta1474YTOZRl2aw9D5VfLVqN/QDKIdlnhVVFtYTtcVcozCTHzzTkY+sSQVB1XbPQPvY5Wm/+yJf7R6X9FyoxGkyZMXMBxvqPZFKJ8NGI9uTsWHU3utTiN1LKlY9suD3qek8cNBVJX/2APfDyAXLmHDtGoZU2j4cJ3sX2BMu2/oqUgHoeSsOJAAAd0WdqRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOF4KpFn8aZaJ2m32YLtfdPASMyXe6DDgoQRXfxIqUA=;
 b=TLb/s9xI7s4pjs4DOkpvFml2R7MZg13eVYDEUhq0jlCQmdh36H2pp4vhoipNdC4fDL/mOb4k+T1VtAM3Giym7+YMCZWQScLcLKSAA7jSK494/s777g7ftyBz9EhKw5LNKx1T4b7N04JzvzZ/8fUNzrZVNwwBkMMB5FLbjIMcBJjBRxB7BFEIdVpFiNzQha6HrnumibN576RwLowCEmqQ4SElED1e5jN+Knvx5BJDbo4Jv1VE/gTXHT/hPr0SpBOjSLi2uvGlOhlGHJypBjJa7iXSvnxLEWIOcJ3F+mukxOJ6/cf64mmz50lWmSDVLO+axSz/aG2kIwHWWBGaq2AxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=daimlertruck.com; dmarc=pass action=none
 header.from=daimlertruck.com; dkim=pass header.d=daimlertruck.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daimlertruck.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOF4KpFn8aZaJ2m32YLtfdPASMyXe6DDgoQRXfxIqUA=;
 b=Lt7ukgibJJuAh1+QuG9zsy6wy3hSoXfJNbNTO2HAjkuSeGjh7Mm7khDcY3nkZWndvPhW6d6hjubVaDo+WO9ZXi1lvHaR2qpUQsVQdeZSZnluAJHE7Xq0HeBjt4xb3uaaKJtNz35i2UrBwT9u9VaXVZy4UTNQQsU8Xih9zQt6zW1JmCDxCs90IuV5gEVSc+IK8N9+PSDEX8DlaahH/r1Xf0Kp49Q9McWhNjVAEwB9CrjyFUpBSvXJ7IwHq3BGF3C+GgQ22PrE2fabf5bJmIiINQcDNx9Tcs9quK3Da5GH4Ex28Zqp9cBKD+DzAUDoVx2FODGwRYViuM+GlGrGJNUcQA==
From: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Guide for Launching Full Linux VM on Xen (R-Car H3e Board)
Thread-Topic: Guide for Launching Full Linux VM on Xen (R-Car H3e Board)
Thread-Index: AdwGxJHMR8DoUPPTRqabQOx00R9z8w==
Date: Wed, 6 Aug 2025 11:24:55 +0000
Message-ID:
 <FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DA@FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ActionId=10540eeb-c066-4f81-aa0f-0984c3a798db;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ContentBits=0;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Enabled=true;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Method=Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Name=DT_Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SetDate=2025-08-06T11:23:02Z;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SiteId=505cca53-5750-4134-9501-8d52d5df3cd1;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=daimlertruck.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB3484:EE_|BEXP281MB0213:EE_
x-ms-office365-filtering-correlation-id: aec31e4a-8a57-434d-f8af-08ddd4dbde68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TPNlEbnIOrzaX4a/vZ0Li8YrYvGfpwpu9Lwn3bDs4Jr1sXGT1/HDj2BL9Cdq?=
 =?us-ascii?Q?8yyBWnmlxkzMTF6JTkrl+iM3/ofTpey0ejhtiDqUnj5hGQtqeT4ECb5waIkg?=
 =?us-ascii?Q?gipCFwKEGVT7eFPoRFQrK1h4l6Cc4f0aMDeGo9CMMTZyaWKv6FxgLEqkuRlt?=
 =?us-ascii?Q?ecxX7KX2ZiGD/RCl5pO1RVjoz/1z1d8KehnJSk8uxHYvKm7xfyYcBJFtnFuC?=
 =?us-ascii?Q?TjlzTMB7hjMhD3Rh/n3zuIQc4ag/TZuO6UIFxfwhzji7bw0EHzA9RM7C/8gs?=
 =?us-ascii?Q?0vRR0+WmT3TsICgbDoDeAUqLLhuJ7htEj1fHm2hP+2ZUDRzC3aYfnuDJFUPh?=
 =?us-ascii?Q?MbtgBmctzU3rEN67J05IqNWU6KjA1pnLQi3C+Ermnq4wtSpNavZifC5d42Bx?=
 =?us-ascii?Q?j6J871LHv8IYXHBdlf2SFmBdqqbrL9OajOuR5U5MFbHtQCPw0k4soKXJsjqu?=
 =?us-ascii?Q?w6ETIYM6l3w9Z5j58B4cLKIk77b7LdrRu6i9IaHxluMb4ZOvd2h9RRHfZVfp?=
 =?us-ascii?Q?lBg7Wy2PE4O37bZxkebBX9bQDnoA2/c/2lPyjcDuWFkumgyqEM6KYTDPUwQB?=
 =?us-ascii?Q?dC/RAEOD/fQD90L7TV+Ky2hJukL3nrU8US1nZQt1hdijM4bDrafMomIJNVQ0?=
 =?us-ascii?Q?PsiRc3vuAoocgoPaaI/oc5li5KeYlEho7lPS/YYmXlvUbP1zsG9RC4NydDh/?=
 =?us-ascii?Q?nLD4H1T/Ug+kuTf5rYqL1uaKGQJphXCWwm73ivWMZFB0DOg0lUgZ/RgxpF6U?=
 =?us-ascii?Q?/hEa4VhjMZAQPRwPoWNdB/cw28PYZ4NEr7CWc/oQ/NiFdHQpuP0UEUSXA0HA?=
 =?us-ascii?Q?a0KUG+Szakk+mMJ6/4MOGueJsjsYvx3i06reEUPGVc2Kxi3FIab0Z/kE3IVq?=
 =?us-ascii?Q?FLHRM8tKuKopprVTy+NdUrJ2qjW2XIhUXFqepmQZrcsJOTGvZJ7RsLw1EaFi?=
 =?us-ascii?Q?bqBJXCtAvF7Ldhq9TGuNtXta1G5E3okGTc5b5OZ1FsNrXfjbbRdHMXPGIOQz?=
 =?us-ascii?Q?y1YIDZfIrEfpCt6pmaTmfFAITTXUFy31ww3KPnKfBSQKxS6kKEEPOtskW7+I?=
 =?us-ascii?Q?itL+LZ0TxEvxzCSD5AdSfIELS1aF8NS6xaLCKtaCEZ89jq/J7RSdx+KTIH97?=
 =?us-ascii?Q?GFJrlZq2fjGCHC8TkXr8lOgJJhBMxe99vwJB1wg86zUtGBsdJWcQNAILaZOC?=
 =?us-ascii?Q?6HO2mUQcLJPu2pVZXDQh93+xhxeHtHxdxB3DwYqSOHUkOOUjjAWRBFQg/Kan?=
 =?us-ascii?Q?xP80dqLXnkSA7kUH0H9jw0oCuQlUIpq+5G9ocl029imS6+7tlhMtnsiDyP6T?=
 =?us-ascii?Q?HVoQ4K0Bp8oeC1ZVgarNADB62D28DGIoCSiIj9bJ3eCUL1oII1sSq5xcKj63?=
 =?us-ascii?Q?5DDDgzmct01YHnK6x7OB6dM5l1q9XDM09uZH7OILYSY7nllMqZe6yP5g45IX?=
 =?us-ascii?Q?7mQuqloldeX7WLU6PT6+fnBZCBs1AENN9X9qhAhZZ1xh2b5+Y8ocFg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?htzDLWJy8wJHxSGzVWG0T36xijQSU82QNweCfM3Fjg0TgszJO9LItb2HAxe5?=
 =?us-ascii?Q?/v73t5gImMBgkLDpucoAFs5MiWuLpcv6GViZaZHKLH8uv3CD9P9C9b62D8nm?=
 =?us-ascii?Q?M/xQIhO3fSpGWKPlYxltcY38UticRhSc4boK0Xwb0YlMb/faMvoM1Gor958Q?=
 =?us-ascii?Q?j1IhXe8RPPEc75Bfsr2aRnc4k/WnCg/YEyvoPgSAe5haGY6/EMIc5PPCYBHx?=
 =?us-ascii?Q?YsZVFh88yJ0f/cPBcPzV37DOfObzf14Ha0NyCUGtrwmRmJwaFKyAe/a7abDv?=
 =?us-ascii?Q?cXh3YxpmBzrFt/S1BwXOP1qR1faE2CjnzDmpbcS1ghqoAtzChiR7vr/peqAV?=
 =?us-ascii?Q?gCHXDr2CXr8SywJQXgsoEw1Y8u/M7ZwObpHkJ/Qtu9mLnOKV+PZGB2yTwOEh?=
 =?us-ascii?Q?CFnexrLHoTNY3UDj6E79Y38fnv6R0PJzNXM7o1shGNRqaUU5wik2xD+J3AJV?=
 =?us-ascii?Q?hjqAhhsBUXKh8OqrZNLMkV8Li9jcX/7mT8CBO9cPJt/VsHXe8r+mfQ7VK8f6?=
 =?us-ascii?Q?5VzSHX3dsGbD+UssM44RsW6x/ZqNJdyxSvs5Ya5beVBkqILwbf2VEEoXLFyG?=
 =?us-ascii?Q?nAjR8YrXWlsJHodlMfpVp4dbUI5GsQ5vwUawpF7AvWLkXwWgjjk9LASDPZbl?=
 =?us-ascii?Q?bftAovPVnmHGZVlI0dSnEmh4TvR9JZKlFN+xTn/OMyqG27VYyGprqLYzOzM1?=
 =?us-ascii?Q?5dXK8whlstifkvCyw2864QDhDTu3FQ/A/rXCbLykETvuOk31bQIclD3TKyGc?=
 =?us-ascii?Q?S84AOifvw18t5v/CAuTj90tDwXUMzDh0IHmSWPRLhlAnhcC0hpMmjFaf/EDy?=
 =?us-ascii?Q?P8k3YQaJ0yfHQTkizpw3dskwYhvbStq7HIpEDyKLr2c6jQuHBcD5v+xOU5pS?=
 =?us-ascii?Q?8gUbUX7Yv6RRfyJvpHC/IesnDiLB5Li+Lcu8dCTzAjQm5Ezaw5IV2lD4slvP?=
 =?us-ascii?Q?h0ntXPzrGiq357X0kswVxU8NB6vJiQxt5LtUJ+hH/mcScgpky2jhfiCDg8GG?=
 =?us-ascii?Q?ohnGfl2xfNd+kuw8Im3RkZ6/USof6sN+hSbP525pyfZlTtv07tbfMGdO+I0I?=
 =?us-ascii?Q?7+axwKoY2V+I36sFwOkLZs0h3C/klb1l8jEUVEH8vq9hUWuqnNymu9yUbGyo?=
 =?us-ascii?Q?ev/CNi1UrkrrV2UnQpZ44lpUSuhA2jdwzfwK4pCTru+ufcTpLSbErLTlnnYE?=
 =?us-ascii?Q?6tEwgGakNg+n+CW5G0TuhytNCC38mRrFdu3yy7zbpg3m14T/2ztfmvLHu0/l?=
 =?us-ascii?Q?qSyVKN9A+uxSCz29JI4xsUVmEzmRbroCWZJL0APP0VGc8aNx+fSPIMbmhcV2?=
 =?us-ascii?Q?1SN7P5YkRgB6/L0gM9DXGkNR1FExl+nsYhv8My9A03XzG1AxVr2tUPb2Yl+Y?=
 =?us-ascii?Q?CO1KJINPFQmdFOWXADyLAigzNXAHd5yNU7yN1G3jqBtKSwCB0U/ZkIkM8fOg?=
 =?us-ascii?Q?L9YtTPo0js5XemRiIOFqp/kzXR+8Wz4d14zL1esevtAHslMQnYy0+Befpt0D?=
 =?us-ascii?Q?yhYnWuBmFY5WORryIz6kP2Fy0cKgl7EjPGVFQhiCp9nGx7lp0QWdkAZLubmM?=
 =?us-ascii?Q?e1LG5jnK5VwU7RyBfOLFEHpOM8TXoWAsydnTdWhk?=
Content-Type: multipart/alternative;
	boundary="_000_FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DAFR6P281MB3484DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: daimlertruck.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aec31e4a-8a57-434d-f8af-08ddd4dbde68
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 11:24:55.0687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 505cca53-5750-4134-9501-8d52d5df3cd1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bpvai/yfG22N3ITY2Jl45BZ8HGy4qMCeTlG9dBoSVZ44Ru8lLkFhiKBqjTbphGxO9K6isNSXNUGcBnWsc2UN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0213

--_000_FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DAFR6P281MB3484DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,


I'm currently working with the R-Car H3e board and exploring Xen virtualiza=
tion on this platform. While I've found resources related to dom0 and domU =
configurations, I'm specifically looking for guidance on building and launc=
hing a full-fledged Linux VM on Xen-beyond the domd setup.

Are there any official or community-maintained guides or examples tailored =
for ARM-based platforms like the R-Car H3e that walk through setting up a s=
tandalone Linux VM with full capabilities (networking, storage, graphical i=
nterface, etc.)?

Any help or direction would be greatly appreciated.

Best regards,
John Preetham


If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.


--_000_FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DAFR6P281MB3484DEUP_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi Volodymyr,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m currently working with the R-Car H3e board=
 and exploring Xen virtualization on this platform. While I&#8217;ve found =
resources related to dom0 and domU configurations, I&#8217;m specifically l=
ooking for guidance on building and launching a full-fledged
 Linux VM on Xen&#8212;beyond the domd setup.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Are there any official or community-maintained guide=
s or examples tailored for ARM-based platforms like the R-Car H3e that walk=
 through setting up a standalone Linux VM with full capabilities (networkin=
g, storage, graphical interface, etc.)?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any help or direction would be greatly appreciated.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">John Preetham<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//DE">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<font face=3D"sans-serif, Arial, Helvetica" size=3D"-1" color=3D"#808080"><=
br>
If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.<br>
<br>
</font>
</table>
</body>
</html>

--_000_FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DAFR6P281MB3484DEUP_--

