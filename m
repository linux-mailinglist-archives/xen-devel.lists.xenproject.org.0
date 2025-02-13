Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F1A340DD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887605.1297070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZg4-0007N1-JB; Thu, 13 Feb 2025 13:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887605.1297070; Thu, 13 Feb 2025 13:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZg4-0007Kk-GT; Thu, 13 Feb 2025 13:54:52 +0000
Received: by outflank-mailman (input) for mailman id 887605;
 Thu, 13 Feb 2025 13:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tiZg3-0007Ke-NI
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:54:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f403:2613::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17800a2d-ea12-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 14:54:49 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB9660.eurprd03.prod.outlook.com
 (2603:10a6:10:42c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 13:54:44 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 13:54:44 +0000
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
X-Inumbo-ID: 17800a2d-ea12-11ef-abfc-e33de0ed8607
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlFumUkv0l2wke5d1/IgotEOJBFvlwZQZM/M2yTni9Z6/VbjEzop+dyUiD/XvnXMoWb+EBJy60PeHFoI8HzVkukocMgmzu8lAoULy4NifufaaW4zzMIBpcy0AWvOzfGH0DW2MSstx/vLlJHo/46AvZL1hniAiByCKkEzIzp5QyfMqTBXXisw82BiQuJHIV1AlgRt0PI32gG8o2T0x7m6PnfdH7ONl2fKLG0WAv1qbFqoKw9FePsyKjcpwqpPti0hnyDK4hc0yCZCYruRY40JgadFCKY97NkTEORRlg0Hu+E/UPdm0ApaCJKIJcd9Z0pEiCyyonNwv6rhVZIHUHFCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFcx6vx2UPOZ6eTOWkl/n8AP9GIOB/UFi8cB3Hqkzb0=;
 b=c1WhZruQaakZV6oguHciuIeNrTNJD3PQf2Nhb4/MM54UtNo+0irBz1h3m1h9l2i7D6I9/MvmmphHE2vW+q+JRnEo+B8MHkbJUJFtPZERnJs6YUvEkExzgO297u/byDUGIkI0JMhTU4j4Ah+YoVMUeE35c9b+F94byQMPunxBGcS7T5Kdt5NL9E4dltrWNpXwZDu/S5aZupX+wd1wJ73DlGq5xJvEYwws37mv1A5Ti0zsCbPM3LYrAn3oY2yUlL2KdYk0HdT2mlx6R1u5kCza54YucKaUmlPtTnDCUYvKGOsMRxFzNXuczheRKtobuhNFQDI9HIPyilzX5LwZ2yTc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFcx6vx2UPOZ6eTOWkl/n8AP9GIOB/UFi8cB3Hqkzb0=;
 b=eRcEZhhqZsJ4KntYzZZg3JN4q4mT/3SeqBtrxAMjQBZJsxRbQsFB4mTBttJWmFFl7xhTmmMxkrlpIrl2zC8ypwj5CDsPl84ykkFpzHsKgBp4lT8Q0NoJ4zSuDMPjttuz6XaLnF7G0y8M/nrdUWj4DqQNuPCniKnXP7tn9gqA4coS8eDy890ODcExo1rZHvTaEc3bmfSa8edfgdyUZfpbb30H8Ncet3MDsTJXMiPGdpWFyNiMkwZcsRuMukvOYxIcnNV8ycXvFudaTFWigSEYExYMQyHx8SFQzCg+YAAEaYmG7O1Gezoi60eGpCVUpNvbYfYyP93SrBEc1tIbb9wg2Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v4 0/4] Add/enable stack protector
Thread-Topic: [PATCH v4 0/4] Add/enable stack protector
Thread-Index: AQHbZmdIqFRlN4liEkCW5YXjsR8R9A==
Date: Thu, 13 Feb 2025 13:54:44 +0000
Message-ID: <87pljmymos.fsf@epam.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
	<5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com>
In-Reply-To: <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> (Andrew
	Cooper's message of "Tue, 14 Jan 2025 09:32:45 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB9660:EE_
x-ms-office365-filtering-correlation-id: 5935b4aa-14c4-4faf-1d8e-08dd4c35f895
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ekgpAhMrM6ZmnNAqN93a8JT82IcpTYMMJ012sMOqQeojQC1LY8UIXpB8fx?=
 =?iso-8859-1?Q?vXTywwON2pAvG0CeI5ul0FbTze4IDjBF7YTJOJg2CNf/EItNiJ5XLHpo4F?=
 =?iso-8859-1?Q?lEz+LKxIaIvzDDq/j6wrrgDl7NiTHjtpTMsUZ9NHJfZuvYs0NLBzBGhASD?=
 =?iso-8859-1?Q?3nDkrgd4xtK0e0Q2FIZq0ZRKrPQ1Ajad78HxkDVCfX2elJ+fpr4ns1DjU2?=
 =?iso-8859-1?Q?xAKCK4uISnSX0Q3oH0S46Ch/oth4h0evvqIcFmS1XxM+t/lCUZQlB9GkuM?=
 =?iso-8859-1?Q?lAQhxbAMPpAIaXzqpOdFwgJSTs8ShPA9UXi5l0nig6Juaf46ERdwTTB2WH?=
 =?iso-8859-1?Q?QXojj0esICOEj9zWII4az2ExZKi3VJar0TvhWolNsOEXmAwODnVXwf3KHb?=
 =?iso-8859-1?Q?tb7RwrCSkbErhIaTdp8D6oeTSQ4uW/6pRsrSSIorjEfq00N1UNzxJ1akwD?=
 =?iso-8859-1?Q?A9iZuniiCaT0P1lUrpDOW/MFJz67GyF8QWmd3ZLz2lW8r01Bem7YTlBQIa?=
 =?iso-8859-1?Q?b2TmZC1aQrvlZmJBnEB2zFi2r2VULN7zbzVKQRUKNpium5pqsxxIqu/nth?=
 =?iso-8859-1?Q?393B045jE0rvTc8ttXLIMYbyq8RhksRxZGy/+u2UaAA6J280K16m3ux4of?=
 =?iso-8859-1?Q?ijr9YFOih2IglwFzR/spcGvuVm5QjNnmZP8NYBZSWJZNzPLkSqtQQCBWJ2?=
 =?iso-8859-1?Q?w+geAKOh6d5bRgqqfh5WRFLTd9sx9cSFE+l+WGOFjxu+giPAGu5FwPYYs3?=
 =?iso-8859-1?Q?0wjKp3MwKPWSd/POzqgy6Zx3OGOWrTcoLbOW6bNaamKtaUtPobVDrAGRX/?=
 =?iso-8859-1?Q?xjEVFh1YdXYKWfm2xW4i14G2qIClzUQC1WPn6MT+8ix9LMtuWMgxzmwU7k?=
 =?iso-8859-1?Q?+3sJC+7f3u+wZ02uO9gGUOpAhY8oGH2m2B9PAhQhcx3nV3DeL7719vT8Tq?=
 =?iso-8859-1?Q?lHQovcEoV7M0Yg7kuUezQoV5KYqk3Gl68v9KtQeifCC5fo0MPxGFBrZtF6?=
 =?iso-8859-1?Q?s3SlDl+R1QapyfYIRetYka4bAoRsXKyc5i4S0eIHtt0XPTd6MnxssHH8no?=
 =?iso-8859-1?Q?mEwBg3w4f9Gu36jPquEq35fG0DcRxqkVVHeWqhjZE7j6uogIkS0SPpS4NA?=
 =?iso-8859-1?Q?/zV7snOy5M5WG+2wJwoC+y9zmPF85EbXAQJwcw2KbJNqTyFAKBD1Miu3Yc?=
 =?iso-8859-1?Q?sffv4qPnvDU0eWuxeCruJ8WYs29KaG6G7oSkdo+OKHUI3KSErcHDpp9zDu?=
 =?iso-8859-1?Q?rat6iIaXzVz5gfxg/fAKsnz1khYsaj2vw6tNlQ4sNceGTixNixZ4cHwKDU?=
 =?iso-8859-1?Q?dfR8iCwpzi8qmaCAQLhwz6GMF7c2TVVeS8lzgd6Bm5QuvQ186XRVz8vMb4?=
 =?iso-8859-1?Q?KDR9v/QvyewHucn2x+h46w5H5euSEH5GBPhGZe06tLKUH/fRe2lPwUDOak?=
 =?iso-8859-1?Q?MzUBLhLFOAJRS2QhqN2nRBRGA+L8xMf8BSj1uurrTra0pLVr5zhGTnX7MU?=
 =?iso-8859-1?Q?zuajdxNvd/CjlAl5W5IQBh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7VppSIMtp1rIjZt7yA7vTJnu4Ics9SnSgJelWrNw5gxSmm6oJFpL3m2vne?=
 =?iso-8859-1?Q?ymDVSxdwUwkTk+3kIrsEA8/k7dNZEXN4NpSO3h8GRh156Dgvk1Te6+uls1?=
 =?iso-8859-1?Q?bVlR9+SEY1yOBzA9R+IwbtLCl9zqd+LCrEjkG/9pMlDV6MTVynG3m8ebXT?=
 =?iso-8859-1?Q?bOEGQYwn94bpdN3kzEs9PLcOUebHcJJAHwCfedDVej7yVstpmEGanwZcKE?=
 =?iso-8859-1?Q?VxBCt4/Ss3in8RT/F6fPHuZ8t7QDt5VpNEVXm/3AvWv5jJm723fIFG+Z0P?=
 =?iso-8859-1?Q?QQ+xF3pYdsiM8Z8BDe5XMtVB9QV5rQNEMb4r2DiNGZtFwZ+JGaKhb6iHhi?=
 =?iso-8859-1?Q?Ht03fZJqZ7E+tHlkLkcuwvTWSNCY1RbTBzLGJSAlaQa6mFYVBAentqZRXB?=
 =?iso-8859-1?Q?QOMf3XywfY+fuvCs9HXfqVXpFUHDbQ2Owj1hTjn2oPcnjjjrSr35mZ1lJ0?=
 =?iso-8859-1?Q?zuknap06lwf6l6nI9gZT/N1ETKcvoGNWDIBzSCaf9AGiEimRi1rEkr5eOe?=
 =?iso-8859-1?Q?5VQVO8Sn06vgHSkUJeEHdACc/jWOZ6CDLPGdMcbrhGEZYFYgj+u/mxFJyt?=
 =?iso-8859-1?Q?6C7+DSZND6zUCZtvthIVbIWfksSYH3tpzX1fr3tTTLR0eOF1FVaZyUf0Zh?=
 =?iso-8859-1?Q?c+A3jtEHb/9z7ZvHPRzCabv66Gt+DwbxV5KgiNJPx6oN6M1OU6mq50mohX?=
 =?iso-8859-1?Q?G2ZZYMUVvVnsovBoeF3uKSj+MGbLFy7nDwZLNCYueVgFGWIfyWcdB9shFI?=
 =?iso-8859-1?Q?37uy8sMr/JGhD7L6iMCM4WKhueBehYTRLZVR8JvCeGW5mYkPdvKJC7732l?=
 =?iso-8859-1?Q?2+KF6zU/ZbHsBP8hVWzDeUCwMBbOMRBdUaZvN2oAeHOXs34hs85N62ty0/?=
 =?iso-8859-1?Q?bB3QvEYERtXi0iVmqfmWAR/p4/Pjbk66dBqFaBKjUBYrruuNdUzlap1QYM?=
 =?iso-8859-1?Q?reaSX6wPVijCiIxt629hCBYwJBSebc1znlMNai3SUO6ENO1su8mwksasfW?=
 =?iso-8859-1?Q?RthznFgCgkXR6hnRazawk+zwq2bhmydN/4WoXCgQlLoM/dIdQBUASRLLK/?=
 =?iso-8859-1?Q?gmoArDlXzfPfXl350W/642eCNSSPFaD0XIn5IDUc1vCnN140u4NRHs7ClD?=
 =?iso-8859-1?Q?aspcJe1z75t0vXYWtNX11wfSyAmBnw6+yG16oLSivIuqiuCfAcPYDuafb7?=
 =?iso-8859-1?Q?/cW5+7UZnkFm0ao+rFOhV3jhbwEzNrejqyR7FC0cee+IRcPD3eq7TQxN6f?=
 =?iso-8859-1?Q?0LmxhezJHsQg3BAg9B9zLSQAuXoeoD+hw1r+FYCr42SH5jCG/03V2inoUO?=
 =?iso-8859-1?Q?lO4j96nfCaaVKN8ra4Hcbr6bRuVdN4N8v6ocZeTQjm09YN6uMJnZuOpi63?=
 =?iso-8859-1?Q?oEEcOb2+1PrafIka4gKHihL+MiZs38vovQxV/kYF8/JuPQjAtHIYtx2fdj?=
 =?iso-8859-1?Q?Y0g86cnfaJcsanGJ9y4BJ+K2MYfgsf0jEuMraVCnOqgygNdNdKd8FAcJga?=
 =?iso-8859-1?Q?wbmbfvXsYjmC2veaME85WOSnVlK0zqZc3ZyjYwyzwVgMl0iyXc3j7D/STT?=
 =?iso-8859-1?Q?L5lsqbHY9IoZlgXjct4u8O2kaFxL+45yI6EOnpFUVuEc5Mk7dXxq89Sf0c?=
 =?iso-8859-1?Q?7DXFvxIDwGNekjwtt1YIfETrjJqpz06PEh5NvcVsk34KKAPXMJ7879dA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5935b4aa-14c4-4faf-1d8e-08dd4c35f895
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 13:54:44.3400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HO5z75q9CnbuUOLVfWlmHtLXWDb3jGq5saM6kYw+nwx2vn1HkFN2fJkVyA5/Q3DAgEhSyFBv1DGCTkeG3GTHPlMv8tz2YUYSlaV3aDl5Iso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9660


Hi Andrew,

Andrew Cooper <andrew.cooper3@citrix.com> writes:

> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>> Volodymyr Babchuk (4):
>>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>   xen: common: add ability to enable stack protector
>>   xen: arm: enable stack protector feature
>>   CHANGELOG.md: Mention stack-protector feature
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> There's one minor formatting error which can be fixed on commit.
>
> ~Andrew

Thanks for the review. I noticed that this series is not committed. Is
there anything else required from my side?

--=20
WBR, Volodymyr=

