Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA69B223F4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078539.1439573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullpL-00089U-2F; Tue, 12 Aug 2025 10:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078539.1439573; Tue, 12 Aug 2025 10:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullpK-00086b-VL; Tue, 12 Aug 2025 10:01:54 +0000
Received: by outflank-mailman (input) for mailman id 1078539;
 Tue, 12 Aug 2025 10:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYq2=2Y=daimlertruck.com=john_preetham.l@srs-se1.protection.inumbo.net>)
 id 1ulljD-00044d-8u
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:55:35 +0000
Received: from BEUP281CU002.outbound.protection.outlook.com
 (mail-germanynorthazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c20b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d564bb2-7762-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 11:55:34 +0200 (CEST)
Received: from FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c5::14)
 by BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b18::65f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:55:31 +0000
Received: from FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
 ([fe80::521f:afa1:ffd4:28a7]) by FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
 ([fe80::521f:afa1:ffd4:28a7%6]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 09:55:31 +0000
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
X-Inumbo-ID: 7d564bb2-7762-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1lpUQTzkp9PTvnRuVggTft0nbuUEvyrnSu0P7H3qzHfOAXhHZu9JW4OqFQM5781LEuHATuD85Xe8B7LXyc0JZR9Z2e02JGx9yW352auKNvgxgPgOk/IpORQA4Spe7KitXeichvSqDGNDkDbHgAmgMPo+oYZUbjIKgAKDVhsDV87PENJTORZbxWRy7Gi+MckkiyAX9adkVVxD3RlnXIItGORRBuYhfYA6/y1YqhQ2UHEKO/JeXH4qqraabppa1A9seFqwxJrOBVKNO3wiHPDbVdZJQt37v+8ZW9kocn5wlabUPrQgoatMZdSwgx4y76kotOX48OsVLuY/hvCC362hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWpKoRzPSZ0v4yJwOeNPSbysAhX7rexIHDkU6UApfKA=;
 b=XlTF/GeZ+sVkvm5QzXzKal6D2nMnRrfBBi23+VAIXe0FRC/X4ZMJP7h5O25v32RQkRPaRbK9jG/zUtY6v2BhQkgyn6c7k1rMCq6On+ruygtQsOW/J3Oh86oeavKRY8Alykdi8L5HNFjX3iymeShFOxlJg0vZM8bomH5RT8Vhcw+k5ufq1KF5qaKZxa5QSRQnjkxeO9gZIPR316LVaf++NkBrRuQatyemfD9Yy4lUWCTfuNUnSv3we9c+FL46rHKXsrA7+EkTCWyDdqnp6Wy1n7l80Ds9Ln1NMmrNXApb7ujQdjqgIg+VE2DQmfcFMq+5OFZMSB6B6qFSkthridzRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=daimlertruck.com; dmarc=pass action=none
 header.from=daimlertruck.com; dkim=pass header.d=daimlertruck.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daimlertruck.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWpKoRzPSZ0v4yJwOeNPSbysAhX7rexIHDkU6UApfKA=;
 b=ZhcqbnnOAD7YIUVop2Vu3hV8MiYDrvR/Yj5jDEKWhOfQbE64Wh3qe1dfDVd2YWyqEUiloCwBde3x7LBAo4KyXyOIRJlYgwr2ijBdgusxWd12U0z/iQMQC6aqW0iB9pWz+tEHxbnrmCUhoz91uEBBFD9CTTBQPaKx3L3PL8jdN0aEIEWaxbsZJ1nrFjv0IP8qyZMyjCUuQLWBL+ngQv1zP163ajc5irRsiKsiUC9qSgU5B81yG7ehQi8WCzP8EtzliduRFOxoDAOcaAxlLsZObSvdnIVh2hf9N1LiueskmtIzMt0LtXWEbzLBEEby9EcNPqUE56gVPrZfhLtWCFNShQ==
From: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Guide for Launching Full Linux VM on Xen (R-Car H3e Board)
Thread-Topic: Guide for Launching Full Linux VM on Xen (R-Car H3e Board)
Thread-Index: AdwGxJHMR8DoUPPTRqabQOx00R9z8wEqpIlA
Date: Tue, 12 Aug 2025 09:55:31 +0000
Message-ID:
 <FR6P281MB3484B232D3995BC4C79D25F4B82BA@FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM>
References:
 <FR6P281MB3484EDA4C66DFB8C1F9A26FEB82DA@FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To:
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
x-ms-traffictypediagnostic: FR6P281MB3484:EE_|BE1PPF7DB70B163:EE_
x-ms-office365-filtering-correlation-id: 221f29be-580c-4029-6e86-08ddd9865fb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AnfK24V+wwVp3i5ECDX+I0MOlhnRhgOgltYgYXNi000bGIfe9tnkyjxZs45U?=
 =?us-ascii?Q?65qrezMD3kQjA664fYYW/vV3l66QOSIt5sQ7YfSyappqgL499w+WwE+Ww9/F?=
 =?us-ascii?Q?gT3X0VhiMLqeIrLp+NpPyJvBZI5MmwEK3g4UFj69lA2VrLixpxfA+fu507EA?=
 =?us-ascii?Q?+6S0pBMmqL2Sje30IDBjWUUqGXZmbjPWYwWNMg4Qg0k+WY/5xmVW08PY10aq?=
 =?us-ascii?Q?2j1E/5GS+D9ra3U+kgzvtXASlEBfkwa4Uko5Sx/tZyyYEpzfjC/2e593JOZd?=
 =?us-ascii?Q?OPSmBzy4pAlnUJCUdN8DS7LlpDjbtsel9H+bSxrGJGREnJNl8dpyox/RTYnm?=
 =?us-ascii?Q?6MuccCVefB9nMMkmg1YV8zkkNFIAzDgG6uUbGlzwq/Jly+NBV+PFGuhFk6eG?=
 =?us-ascii?Q?KjE0Ews9665Fzt6tG6ZjwSGAr6OXPnLoL4S3DV7JWe0Ofvk2J4aw6sRbZET7?=
 =?us-ascii?Q?8HY6N6tUTiBgq85HXQEWXAVGU7ib3OSDo49KTqOAR5CVPfVid+ikwWSh3rJW?=
 =?us-ascii?Q?GS26LoXZZaM+ZH4cqc+6UPByIbGnrS6g4VOnxFGIZpmruL1Uy4ubukR6mpKz?=
 =?us-ascii?Q?WhDoowbxQEEYyAhjcOcuM+AV2+2IegoH9hr2lcV7ooxSkunJ9BEoCTQbGimw?=
 =?us-ascii?Q?dFogWh5JdUKkrstn3RsvllzzCGWMeOufQLZip3NACVXeQwTC9TJIuDNwu691?=
 =?us-ascii?Q?zFKfKIc9QuKonYDf9ENhcrRDr3ZLiljBKzdNwuLEI25lQ6KQTE4V4yka5EoO?=
 =?us-ascii?Q?BKGF8dtj/qTVzIFKknX+kYpK+61vrzPBoAraqmmlWBJakgKlFqENmQn55rfb?=
 =?us-ascii?Q?qQkFYAtU619tId3cr3kxrSKdO7lhkWCxTZy8In5QYLsWm5JQuIhc6W32PS5P?=
 =?us-ascii?Q?ee6+mmNskhJd2UMD9MhmLGvBgl4ciV7oEZEH3ZFyylzNvqWTfYLqSE/B8cc9?=
 =?us-ascii?Q?Cymj9ETchSkARcq5kaM4lz0kOOYpnlFtRUdW0NWA2LVbpiEynvy0NTEfaSaa?=
 =?us-ascii?Q?NJx9SUiAW4ZP12lYhufhmNYYN5wscUwUdGMjG4onTJcCWka78ZF9+V9X2Xqo?=
 =?us-ascii?Q?S8KFd1fMujfGvnGEzOdOFEsxbXEZ/i7WUS42xKHRDZH9MHo+gVRYO/v6DszZ?=
 =?us-ascii?Q?HWaOfEMtmjXh/if5erdGerAuNwHsV5h+e7b+TGR+V03dVsaNVxB7X72U9Nko?=
 =?us-ascii?Q?vZSfV/KsdB8IReJUQ2dO1lK2ssooTawMI02Q8eYIc1zGhn5y75wH0GWRyBm1?=
 =?us-ascii?Q?rABKq0vO1QgRoVk1C4uVsvA78ldf784T2Rkcxqw+eEE1Tv0BtaTe5vF0aYUu?=
 =?us-ascii?Q?UrLf0IYMUkInD3IrBeKqP2cyuRP/vmV/Zy/Ip9M2pLlDiqY62oqznb27pw9M?=
 =?us-ascii?Q?YGLYWSlOJkQvrR59lgmT0h3wIHzzDBcbAuDeDBtGXxXbF2rr3FaLxhQYEEsX?=
 =?us-ascii?Q?i6BZY7lPSV+mxerlCsDoqYACxMOEM9TE8wdm70rD5mi7c6vmMs7oBr2DOEUs?=
 =?us-ascii?Q?VyBDRKrgHMlMFJY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OxCFuw8v+1SqXclTms3FrmQ52EB9gg56utmLNmMxwK/VLavSWjZWvl/fJ5P3?=
 =?us-ascii?Q?ArrGTp8oCoAB5nCbomAFglRwQqeRnJQP4ezpPNJwFPHveGVU7gKvMbzDT+ys?=
 =?us-ascii?Q?KUyZn8hi6ief/KRvkP7QI9t9N+cS62Tiaw9QcfmRyVW7UQ4MTTzxfeEJTiuT?=
 =?us-ascii?Q?65blJ9KDfEW/vRthoMO3ClvASR8L8tDGhoMw+0pBDT4EWyYq8bupnRu8V6Fk?=
 =?us-ascii?Q?2Z5S26iuVepqZzUIP2PLbzGGg1me12McXs4t/MxhTQaCj3N/PyO07U/opnLu?=
 =?us-ascii?Q?f/itu8o4PFRgcT8DjM0iqOGpqxQByTSYyz+gyPFHc3US1l5qu6yqA+yDqdE/?=
 =?us-ascii?Q?COoPsLvY7LLRkmehfuPOsdh1n1Pkr39B8yRY8IjdQf2GuH9GsRuaBGAb6QS/?=
 =?us-ascii?Q?cA5BqdcMFUbuie/D2PWSAVpgez1QLieD0hTCKOQWALLEwVTZkRRLexGWoTbH?=
 =?us-ascii?Q?7BReeFLiJWwm/7m5rkcPfl1VZyEDwuaEd6xv1MHFy0EXFSd18ERssZWqILob?=
 =?us-ascii?Q?Ut9QdKAqg7RWuemm36FXU+oFo3Bi6OG9NJzpB3XUN4lRlFUx9o0QxGFGwRWe?=
 =?us-ascii?Q?+3oKTG0uSzTvgAoz25ntLW7TY3lUijBgzGBOm/RMXWRxXrJBbAE1yQpM2Oy4?=
 =?us-ascii?Q?OPP+YnU6vIkpf92O9x2JuOuDwbqo6ZmB9nJK2MWR+pdrKiG2aJvBaeyv5RyL?=
 =?us-ascii?Q?ubHEyi6b92abkrTvFeQ26stWFIJhUrazF3xcDwUAKg1QEQveFV6VeoSznSMg?=
 =?us-ascii?Q?07wk7iDLq56LD6lXEXj3ThwDtJIyxaqkTLQf4otUDguiAk0xVge3bOZCaprD?=
 =?us-ascii?Q?PfRQ0uHzc4yzykWJSe5P3+3CfsV6VqPEmyNa1OtpZQsHAmWnXaHs5WmrBZA0?=
 =?us-ascii?Q?GOFDClH+KMxuB48ER8sYI6T6qGxVL0MyJ8HS6rKK9Xn5UGYRNBZdB1nKE6LR?=
 =?us-ascii?Q?RcWJ1U0KMs8Gm7PxXn3FcDRKlZG+hAC06R8Hu2FOhVO0qjSZP2KWI2MSC4r1?=
 =?us-ascii?Q?wu8WbxtVYBuNq4q3X8hYzTPrLOf3VoCEhm/oHBJyUOTG98garL2qw2VS+G1r?=
 =?us-ascii?Q?nzqEoqDDAWZpmnq8BOfxyiTqqst0IIFnDSa+85dkX354Al3GZPQSOfaHuGzL?=
 =?us-ascii?Q?9WfmOk5LAYi+ydJ/DkqfrmdF9WXjC7j4+Vt3ICp7DQVyNruqIof3DMy6JPXi?=
 =?us-ascii?Q?oqLg5PAWJRCoctJ4DpkCE9xXt5XQMF4SVfXdtLVWErlq1EB2S8Qmz7jxP0hq?=
 =?us-ascii?Q?RahSuBPD8XInnKT3D2gAYjZR4HmdpliuRM6hHNeSF6glmTKMF5PwWqyv6aJW?=
 =?us-ascii?Q?lgTlODNJU0nA1KUSFcDaHeHndKboWz5aXWJDmWlT7luNdInotnIuMqIkjik5?=
 =?us-ascii?Q?voLEWfTnN+058PII7c3/19VooWWsV3jpJFtRzNL+VA+b5Kf60BVIGpVSt1Eh?=
 =?us-ascii?Q?+pFXTHxblKGwMlq5ymxodKndGVykwgNGyj4daHAHKGpw8bkJKZog/E59rslw?=
 =?us-ascii?Q?zQqUxzo2Psd0ilHtNVi9uvBWR873orJSwuSpVd3IqqFnIt/AuVcmFRNyCvCY?=
 =?us-ascii?Q?C3inA+upsnxOGqXmEt+Vs5/0N9zk+vw4puyF5Ckf?=
Content-Type: multipart/alternative;
	boundary="_000_FR6P281MB3484B232D3995BC4C79D25F4B82BAFR6P281MB3484DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: daimlertruck.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB3484.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 221f29be-580c-4029-6e86-08ddd9865fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 09:55:31.0962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 505cca53-5750-4134-9501-8d52d5df3cd1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTRovlwNZH1KL/0qYvJrA94mHzJb9t0J69C9+6c8nLZupATFbMR6wQQy41amHZ6LynOJ3aMG3Yp30NaQcWTxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1PPF7DB70B163

--_000_FR6P281MB3484B232D3995BC4C79D25F4B82BAFR6P281MB3484DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,
Is there any update on my request?

Regards,
John Preetham L

From: L, John Preetham (893)
Sent: 06 August 2025 16:55
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: xen-devel@lists.xenproject.org
Subject: Guide for Launching Full Linux VM on Xen (R-Car H3e Board)


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


--_000_FR6P281MB3484B232D3995BC4C79D25F4B82BAFR6P281MB3484DEUP_
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
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<p class=3D"MsoNormal">Hi Volodymyr,<br>
Is there any update on my request?<br>
<br>
Regards,<br>
John Preetham L<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none;mso-fareast-lan=
guage:EN-IN">From:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none;mso-fareast-=
language:EN-IN">
 L, John Preetham (893) <br>
<b>Sent:</b> 06 August 2025 16:55<br>
<b>To:</b> Volodymyr Babchuk &lt;volodymyr_babchuk@epam.com&gt;<br>
<b>Cc:</b> xen-devel@lists.xenproject.org<br>
<b>Subject:</b> Guide for Launching Full Linux VM on Xen (R-Car H3e Board)<=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_FR6P281MB3484B232D3995BC4C79D25F4B82BAFR6P281MB3484DEUP_--

