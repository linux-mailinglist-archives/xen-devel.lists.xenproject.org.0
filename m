Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E7A18E28
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 10:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875830.1286247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taWqL-0006b8-7g; Wed, 22 Jan 2025 09:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875830.1286247; Wed, 22 Jan 2025 09:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taWqL-0006ZO-4h; Wed, 22 Jan 2025 09:16:13 +0000
Received: by outflank-mailman (input) for mailman id 875830;
 Wed, 22 Jan 2025 09:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTz=UO=daimlertruck.com=john_preetham.l@srs-se1.protection.inumbo.net>)
 id 1taWqJ-0006ZI-41
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 09:16:11 +0000
Received: from FR5P281CU006.outbound.protection.outlook.com
 (mail-germanywestcentralazlp170120004.outbound.protection.outlook.com
 [2a01:111:f403:c20c::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8379cde3-d8a1-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 10:16:08 +0100 (CET)
Received: from FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::5d)
 by FR3P281MB2479.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 09:16:06 +0000
Received: from FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ebcb:2ff2:50f7:cced]) by FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ebcb:2ff2:50f7:cced%7]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 09:16:06 +0000
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
X-Inumbo-ID: 8379cde3-d8a1-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goy/zAmwMCTYOs5HObmeZ4rrAIwh7OZkOksK8suGbFN8tE7IZr4p+xA+tcF3xhUdGA3lrwQYbmKaoNlAuWL26Ya3PkxcAZ0x/hXhFMAa/vuycLJ8xIv5Rfp+wXEj8Fv4tntVfcTbcuxu3f1x0RF9+77PCZVJNscnQDeoKmjJm+AN2/BxL1nSe1kmMo3nkqOFWjqAiS5DTJLmOputm/LpF9lzHH5l8o9K1cngc/cakKuo8KXD0F+7LkG134iqW/a8E2bDSg4eT5GeJscZywB8cHbLtOcsaz8I6HsL6ZbHqptuuqUTA9g+gBuTLto54rTOBSc2rn96JubJvghdObj6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JCkwHjvkVe47kj3/9kvU4Eu//s3c8eg2nnqgCch+Hc=;
 b=v+FQqMarm2JC53HwixlZ5fyJU5+FjT0CcNeNwLO57hF9/O/JVQ5DHzKh1RjXj464qNcCGx26ItpbyVK+s+484TNQ3rBtX2GO1aqr3/QNg/nZdFoFwuMnbxWOKBGpvtlvrBGgIVSwV00ShsM3gC5Xj3FqXN8R9anq1oDO/WrCfw37r++eAcrisTpMI8mKP+zc1w8e2oLZHiOHg0fsSIwGwDG1ntYsj/yKNrw/umYcgvGECMoYlZKq7mfF5xIDlPjmBjNEJB5d07tLFwKDSxL05K30mNRwB9qIXsPVZSFPfCtpF5VXc41YdRtkj7N/ry+CG4kossUP9ysx4JdMNzytPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=daimlertruck.com; dmarc=pass action=none
 header.from=daimlertruck.com; dkim=pass header.d=daimlertruck.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daimlertruck.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JCkwHjvkVe47kj3/9kvU4Eu//s3c8eg2nnqgCch+Hc=;
 b=QJ/4uBEOcJ9GSJYUozoEb8q9BcUM2/4VIemsszBUm0iU39PCCK4NpatC2TO82F5eDFmk6AI279kplr1Pt5kc98CHEmaA5ngP1LKTtLeiMiqGPGFKHM9UzNDmAjSxH+YKuPamTbpzJvYE+qBGfJ51EI41YTAchBNhIjbcDG6MCpODIIYXLSO0qJOsVZKajmYFqibIofYqXUl5tdOGhZ3rTBFFaAty7SimFpkKHwqoANGVt3uJhlzZy42mvsRG3hXGtjXWHdilAB1E59afOEPvo6jsRqOu/TuBKRKB6bXKt9LNAcrwKU7yow9fbi1aYKJxaerjN52JngloiWUpU9rdOQ==
From: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Request for Documentation on Bringing Up Xen on R-Car H3e (H3ULCB)
Thread-Topic: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Index: AdtsrjaU74AF3fZpR/+NK9h56D1xZg==
Date: Wed, 22 Jan 2025 09:16:06 +0000
Message-ID:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ActionId=3b8ad166-c234-4542-ba61-c22bd0df4fcb;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_ContentBits=0;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Enabled=true;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Method=Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_Name=DT_Standard;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SetDate=2025-01-22T09:12:17Z;MSIP_Label_b97ea58d-47e6-47cc-9ab7-39ab03def869_SiteId=505cca53-5750-4134-9501-8d52d5df3cd1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=daimlertruck.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2PPF86245AF1B:EE_|FR3P281MB2479:EE_
x-ms-office365-filtering-correlation-id: 6ec58d0d-6bed-460f-15da-08dd3ac566ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?q/O0fo13vXDyvkEJ0aJlSDbqf1uorvW7TboPKBTJz4SZDnUMjfIgWzoC9788?=
 =?us-ascii?Q?Q2cDHPpT5wkugdiUR9771Sav5VT/ehdb/7T/AOIb9ErUzJnERyecq0hqb/kd?=
 =?us-ascii?Q?m5lZNdrUuJaZ6rbLkVWQYjgx1EVbT+Ie3XYzY42BPvdkyE1g64EX5pVb19kA?=
 =?us-ascii?Q?cZCHJ00UJnyHTE40uRmcZ3Pcz0mvh4lM6kuHqc/qEk0czvpDI+Y9ZGggyMka?=
 =?us-ascii?Q?pLc4dQx/wSiTVsp5O4+eQ6meYNjneDdeN7XWLNsWZtJ9elRtSOmBvy3gh4wn?=
 =?us-ascii?Q?Ouu700l1dRCtZPZeKDsgaVxNCHCGCpKf4we6VDMCuHuvtDUqmay+Fp5JMSg+?=
 =?us-ascii?Q?M+fofL3kyvChBiMBJes+Q/qloQyd3Z3lkLzBJ9cZwN1TL57Om8arQdKMYJad?=
 =?us-ascii?Q?sr6oTn1u+vcnGIh+sVdirvR0V1xOGi5Cp83CtdZ1R4Kxpa4SI4dnTyidvXYz?=
 =?us-ascii?Q?pMAgBu6nN/KLaIodTGlvMwn8REQLwCMkrcXxs45nxjlx8GuDysG/Fs/hEJl3?=
 =?us-ascii?Q?vYYAQSa2kbaj+GjGWPvMrCm7tDLtZ9xeC0a+hfbDZFEEqnRBFCXCRjrbu9jL?=
 =?us-ascii?Q?pf4zMHcqBOZx6hRL9HcSFDBp+LhyWi4Gl5u7kcqW1qUwb2ANbpbF3JMid6Sb?=
 =?us-ascii?Q?X0e/dq6vQ9JxzVMd9hsvO1pTSfnzOx+Blvz/pqTXlfQy5Lr5H3XEip+pImTt?=
 =?us-ascii?Q?+IZ3q9UhRvRS5bpnAKUv1l3pHA8q6D8wmptEspAAuX81i/AsP/MLo0XBWgSD?=
 =?us-ascii?Q?PyBzeVqJ4bBilB/9eYsfAZsFurgH4h0oNNLKsJoSveh9g0ihHGbAsMK0IvQd?=
 =?us-ascii?Q?t/vvF6W9toodU8oy4VbrS8+UnJZQ/GnawdGWEwJh21tQvyiSc0OOU0BGQLta?=
 =?us-ascii?Q?R43VV5qH9kKDKfBghA+9xFoE7ZNuwJGnB6mcu/CBW8H2zKHdgFYGaFyIcz9e?=
 =?us-ascii?Q?NKU/g3bpMX1diuS3wpsSEY5yNrV/mO6vYr0r/zsMAZU2NhHEw/R9o0LkDZ5Q?=
 =?us-ascii?Q?oyhNbTSnrZsmQnzAbGuI2j9BE3el6gmAV+SWCAf7qTJaOChhVDbuinBU51oz?=
 =?us-ascii?Q?hzX0nSVwngvtGw1NYceB9baOBR9wyCCIG1uUKmZrd2h3IqC9Ua/Q0vega2GW?=
 =?us-ascii?Q?vkm/ajC6Gcs6hrgCrWI6AySHMUhCXAS+wSlWIOsUjMfcuZkOZ0DDaxi/3EoL?=
 =?us-ascii?Q?/iwA7kExHnkadCx+VvCauBBc5Dj7KJ9pF1AYkCw1kzvVhZc9vBC4Jpdj0n8U?=
 =?us-ascii?Q?jJfLrcvMsSXJgtFBX96gM8JWMZcXMOSrznHAzxjqbMVjRvD0KPucupfllo+2?=
 =?us-ascii?Q?njklY/D7KusKnC/kRxg3KRLXH6eZWu1E1DG6DUyRnMTjFp5595mrJei7B5SV?=
 =?us-ascii?Q?Aw/JeuZNadHLZWZjTafPkbJEF6MSVjPYEDilcSNX5JrOlzhHnHYVtiwVtDaR?=
 =?us-ascii?Q?jQCcDKRmWLjXN/iAX/e6zgQ3yYaUb7qW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uxZLS3Lc6VFHjmtkosu9Cqik3zlirpAQHxDZxnEOVl89cdAhLWRCOIca7xAu?=
 =?us-ascii?Q?H7PVNoNSEw2qe9Ao04pnBrQectZ6hzoYzzxELkHPKPfDT58YlhHnl9+uV+a5?=
 =?us-ascii?Q?TirR2ZzP95tZJFj/Xl1bWyUhRR0f7PLupEC6nwVoGkxb5JU6Y+vBfcrHdhoB?=
 =?us-ascii?Q?nIFQw0uZchLOjP6SktT9F9pJ13oXWHPbCd+hMoHH3ILnDf1vQvXuyI89tR0Q?=
 =?us-ascii?Q?xy+Hn5gZviPszqUgmhOke9p+xvK9HdhSB4otPfXMJb/Hr5zHzc+OpU6+kvSa?=
 =?us-ascii?Q?RzhSnKe4iDh0j+224NV+dpFfTJd/FBD7TLK6olS0+2VJJ2B3nkcHqg8Di39E?=
 =?us-ascii?Q?5XfFLkfCXNYcb4a6lsvgwIZZvVqfjcwNO7gbqWonyDSebw8tU+wi4VURDDE3?=
 =?us-ascii?Q?eRLFmGQP7EfVKMZ8xBwVyezqa9tW6NN62CC1dI+syvczCMl9OlYry63XrvwZ?=
 =?us-ascii?Q?sU5zvRfVaSIZJqmHM4tTy/EmnJs/QkJPlz9hRn+rNDJGOrzaaCcgZUl8ogJC?=
 =?us-ascii?Q?4RyRKAkwT9pihZ8l6VshtsatCf68o1QO0ZbxHNsrDGbK2vxEij2NIi23qLGi?=
 =?us-ascii?Q?3c8YRN011Oosqa+PaepFK38n0tIkB0Eldng8FVTUrdOnKq1ZPJBgtgBM1XUD?=
 =?us-ascii?Q?I5874CjIl01e6EmrMXmPBLYQp7VhQeKEvFNhDG1l7IKL5layVV49vDMPzc6n?=
 =?us-ascii?Q?ZDLa4VzFMXKfO7+gikJg6tkcyKznhxNGSEzwx/xI2cTs/yGIt1TdeZcfEw0y?=
 =?us-ascii?Q?c5UeHBjZ8dujlQ4/eAPAAzP2XrcfkKTInUW3Mp5HrOWbPs5tT+Z+KLWQKDvt?=
 =?us-ascii?Q?s495FdaskMpRSeIPs5vvXaUX05pg5kpbN4ZTp94TNyAMSewbrHNy5WSM2H8R?=
 =?us-ascii?Q?5jmfWJw5TRgxzyMGicjG1F2BVjAJDiB9sWblpeXtXtQ9P8VkX7CyB3mOJazB?=
 =?us-ascii?Q?ZmAdWnWQ4f9PnhOSfC2EqN59oRf3IMdcygD+oENdfMOvDPodTkmtXUJYL28j?=
 =?us-ascii?Q?cOITXtxgHXMoZ55qn0oo0qd6cp66RxtimpZ1P6/OykGYf/DV6kd3b7NxV/BW?=
 =?us-ascii?Q?b/5QTMSnc++GdubJRs0eRedSiMqIewNAw7t/25tTSwUNerVxPH01MXVxoCLo?=
 =?us-ascii?Q?BviO3SxpiyEyKm6cPdMzk0M3er99ybhIQ3k9pbsSNIjI5d2hMig9Xhz1qI+I?=
 =?us-ascii?Q?K2Km4drf+hXQTrqjaDcTw2wCOYLhnTPVBPk/w2OmFAjeBqtpPI8kilKiPF3r?=
 =?us-ascii?Q?4Fax5PX6lY/jgPWmK4s6HXo7GbhHT4kmeLow5FXYYId1q+YZMYwAKzWomGwI?=
 =?us-ascii?Q?ymtBVC7Y4qSOOu629YbLoJPin4Bhe2g4Pr457NJsioAAX2l6lKHm7YpXZrOW?=
 =?us-ascii?Q?h/F11qQnnvFPViwrFf2LR00vyHL2++WKqjdxRYDtrKWoTEuJo592Yy40roDG?=
 =?us-ascii?Q?Elp9gvM9em1MXZuGIPZGOCfp4uMXETqJTDZltVFUSET2tutCbe/pOUg+r2t9?=
 =?us-ascii?Q?awjDk9yiFq+cppUbqOImpHAjWR3jZh8Ma84DkDY3WOKHgPC5t4AYbwZLOrMK?=
 =?us-ascii?Q?4CJT6qd6BIx5sukWvEk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12FR2PPF86245AF1B_"
MIME-Version: 1.0
X-OriginatorOrg: daimlertruck.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec58d0d-6bed-460f-15da-08dd3ac566ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 09:16:06.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 505cca53-5750-4134-9501-8d52d5df3cd1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpiAXrE2BBslroTD79Jd2MrZKPwbcvJ9AVEUKt982NFslFc6zEJm1FKalR6czItLzmfY8MrP6+gPW0BmZU106w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2479

--_000_FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12FR2PPF86245AF1B_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Xen Community,

I hope this message finds you well.

I am currently working on a project that involves bringing up Xen on the Re=
nesas R-Car H3e (H3ULCB) platform. I am seeking guidance on where I can fin=
d the proper documentation for this process. Specifically, I am looking for=
 comprehensive documentation that covers everything from scratch to the end=
, including the required versions and any specific configurations.

Could anyone point me to the relevant resources or share any documentation =
that might be helpful?

Thank you in advance for your assistance.

Best regards,
John Preetham L


If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.


--_000_FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12FR2PPF86245AF1B_
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
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:#FAFAFA">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424">Dear Xen Community,<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:#FAFAFA;overflow-wrap: break-word;font-variant-lig=
atures: normal;font-variant-caps: normal;orphans: 2;text-align:start;widows=
: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;text-=
decoration-style: initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424">I hope this message finds you well.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:#FAFAFA;overflow-wrap: break-word;font-variant-lig=
atures: normal;font-variant-caps: normal;orphans: 2;text-align:start;widows=
: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;text-=
decoration-style: initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424">I am currently working on a project that involves bringing =
up Xen on the Renesas R-Car H3e (H3ULCB) platform. I am seeking guidance on=
 where I can find the proper documentation for
 this process. Specifically, I am looking for comprehensive documentation t=
hat covers everything from scratch to the end, including the required versi=
ons and any specific configurations.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:#FAFAFA;overflow-wrap: break-word;font-variant-lig=
atures: normal;font-variant-caps: normal;orphans: 2;text-align:start;widows=
: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;text-=
decoration-style: initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424">Could anyone point me to the relevant resources or share an=
y documentation that might be helpful?<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:12.0pt;ma=
rgin-left:0in;background:#FAFAFA;overflow-wrap: break-word;font-variant-lig=
atures: normal;font-variant-caps: normal;orphans: 2;text-align:start;widows=
: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;text-=
decoration-style: initial;text-decoration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424">Thank you in advance for your assistance.<br>
<br>
<span style=3D"background:#FAFAFA">Best regards,<br>
John Preetham L</span><o:p></o:p></span></p>
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

--_000_FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12FR2PPF86245AF1B_--

