Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485DABBEBD1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 18:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138322.1474055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5oP8-0003Za-Ai; Mon, 06 Oct 2025 16:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138322.1474055; Mon, 06 Oct 2025 16:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5oP8-0003XZ-81; Mon, 06 Oct 2025 16:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1138322;
 Mon, 06 Oct 2025 16:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5//=4P=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1v5oP6-0003XT-Gx
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 16:49:40 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa6608c-a2d4-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 18:49:34 +0200 (CEST)
Received: from DM6PR03MB4764.namprd03.prod.outlook.com (2603:10b6:5:183::31)
 by CH0PR03MB6081.namprd03.prod.outlook.com (2603:10b6:610:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:49:24 +0000
Received: from DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7]) by DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:49:23 +0000
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
X-Inumbo-ID: 6fa6608c-a2d4-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1ZD7spzRtbuGa13+Is93HuXnlHLWzWpexXz8QhOFP4JEk0Ukgdc8xgaAt8WXIinBXCXIav/nkHds+MfT2XRYeBnVPgFloy1zu0oCRIr2Jprhm7NnEjL0LoBKZFE8U9Tubq7oVndH5T00G5lOm7I9VQEcWwidyKgyZLVZoSflQHBQ/cbhahRj6d0Fq2Fbc1sufuhbteoS94dMY1do+FMc391Wk3ATlAMRQctYidi7zCrHQrC63X/guH7XbpUhf9iBOpT2tg3Snrh1nIJW2pVl858vLqStQOFpMd9h18Vdh2gdYjzvB+dBh3eSyGehogtZYxVK2L397AK0fp3US8Nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opz2DbRieaX88FQ8Gine2ZvtwrOd5y6GoTMO+PrJMjQ=;
 b=d2w9K6Op1cYei0179e5azrnZ9u1KIY+1EeKT/LG2lJMr2++Ywqgun+8dPWLRUPxl+f/QMHebB+oIc/zwP2LsFpZNbJVp3/u2uoTfuoQRbgaHyvvk5+yf6DMg9bMEOGFEo5CAOeBR2USTgPd2VIDn4Ja0xfGq2CJ71Iq/PUnUsVqfGPirWgDjnaLX+woUPQsUKPKCn3oFg5Nz4odb6WUhmUzJWA4/P4SNdQLSel1Qx+hh++akAzyf/MwwQuPALmJdHwNolyI8AzFRwHOb5fy1qEtA9MXGhIbfI1zVqerDuH2epNLBtpobxbMfXmbQZ8zyzv1c4abtyEEYusgn+3u70A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opz2DbRieaX88FQ8Gine2ZvtwrOd5y6GoTMO+PrJMjQ=;
 b=Qtn4YrG3YOcXQrdkXf/anhhMt6BGdibEF5TqqisU8Ei0PZC69GXDP3IgetTjKl1rt10CZEmgqkPKlSNBwIB/a2PE4zEDyPhSVQ7Aa8QwbeGVmde202k3agBAgXxqdGzVGsNZJAs6nk6jVWMRlz+vc8d935bhFBENgRj7cbtEQ2o=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<andrew.cooper@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH livepatch-build-tools] Treat constant sections as string
 sections
Thread-Topic: [PATCH livepatch-build-tools] Treat constant sections as string
 sections
Thread-Index: AQHcKIHp2PGJPzbswE2t8zYH/4MtebS1bcFS
Date: Mon, 6 Oct 2025 16:49:23 +0000
Message-ID:
 <DM6PR03MB4764D72D07BF22EA0B911A24F0E3A@DM6PR03MB4764.namprd03.prod.outlook.com>
References: <20250918095203.19421-1-frediano.ziglio@citrix.com>
In-Reply-To: <20250918095203.19421-1-frediano.ziglio@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4764:EE_|CH0PR03MB6081:EE_
x-ms-office365-filtering-correlation-id: ff937a8b-9933-4e95-c828-08de04f84d8c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qk2JxwfGToPF8kw+GW4oqxJN3JANOOkzt4Svlsx+7Wpe/u+pCG8s+LRIwb?=
 =?iso-8859-1?Q?r3B24xVAzQlSU1spQCelLCm2i35Sbxvxi7sEX0TobEym5uGK+wkweT3TgO?=
 =?iso-8859-1?Q?Enj4R9KPL+hneCc48bxavN9Fke9oExMfwpyBKXzEUf5CJmme1yrrPcT2fp?=
 =?iso-8859-1?Q?aadlLlwHULXtj52hn8hk/f76llqThMz25Qx9YvhxSoOzf78zogifirlIZW?=
 =?iso-8859-1?Q?4hp3w/wPdnoZc/jG5mLFEjjXUPQm5ZPzky8gKrhL47acdIBF0kGGT3EZ+z?=
 =?iso-8859-1?Q?ZictubuvJD2kweKr8rDtvxGsQgz8GkzIkhwJ78hrkSPGd+vvmd8RKy3fl+?=
 =?iso-8859-1?Q?RCJkCAEHD8RbmJj2tID7tpDdx+hCruXjM8TygvQDEGndWBA7MYtxTHXDlL?=
 =?iso-8859-1?Q?YfouNRziBuNpJo4hSSJLdHPWmkwHZF43D1jIUhYVKIQH/nNDTx79VEBMoU?=
 =?iso-8859-1?Q?MAa7tIxQCaa6qfU4kRFo6Ef44n/8rUWRcTeW9HmwC6pmcGx8r3Vd7mNV8g?=
 =?iso-8859-1?Q?oRP9uWLv8mndEO0MA0LsjwAQjKJG2TlXi/F/hg71mVEZnkaDY6fi5xTSIw?=
 =?iso-8859-1?Q?ohV4LYbhHvTkclfbSNyeBztePWRl5YaILmSiCWNcIakP40RjiUXcyTcm/C?=
 =?iso-8859-1?Q?c8ZVZS0goYDCba8jXWKEyrvdrSHSglYD2WPsLB+Cuume4zu9y3CARDA3aD?=
 =?iso-8859-1?Q?CIw2klDRSC7CM+KYRunqmzlTXBd0sEPcytbtDns49WP4MBB55nXVVYPZZw?=
 =?iso-8859-1?Q?yq0M6sMIsXJKbqWnMEgFmMFwFJHJNiIMB+3/ldr7I1SNT8TONhp+Fma5TK?=
 =?iso-8859-1?Q?qef7IHc8LMwFtz0WqMMwVqHhbSQHbOBjdblQ0R5yPskgJKy6q43pEvIYuC?=
 =?iso-8859-1?Q?ENouv1wqwpl+YjmkDS861eX8xK15PzxMQ4dOfLgVatqcLUjDOPHa4G8QW+?=
 =?iso-8859-1?Q?PaF3DpZzPhkOV826APdpJOFwOOnbbAYH5PAax2yjgdPrNtbLPEdiMlj5X4?=
 =?iso-8859-1?Q?tYMLSzTaTjIhfsrzqI2Be3uJ93chLOM8wzQmpYhX0MlIuZqS3dnqi8ywzB?=
 =?iso-8859-1?Q?VrKlnOCvJoEogBAglme1Tep8Nkx9bwRIlPjk4DnpRqwFWhZzWpfX3U1suK?=
 =?iso-8859-1?Q?eomPnR76piVzy76vqpzU1480YfJmOgSDVi5Ry2jXufWjYwbUHFdQNukBFI?=
 =?iso-8859-1?Q?vWuOUuZeM3J7J9yMfZ14Vaxy1EqBAviHoVq+Le8Snvj1ToItU5VBDrDwvP?=
 =?iso-8859-1?Q?rnMAL4h3QGsGcOE9bn+7EwMVytfP6lZ0rzr2IjnDQAwt3ptvBobxACw4L5?=
 =?iso-8859-1?Q?PEW0zOx0oCz8dWFVXvvKtmwIvKy2126yDHmJirZ58k+YYSTb8azFdeqIGg?=
 =?iso-8859-1?Q?g3Y6zwkeZkN366JPSRBA8EKagmCmEL01rcoK0PDhqrx4xO/jhPmFBtb+Lh?=
 =?iso-8859-1?Q?SfxwzPlr3F62T+bVS4vsGZO8w7QQklXFI0xOmXwSdQwDsxsN7M2KoNr/sC?=
 =?iso-8859-1?Q?RYBQf0tw8neWorywYillF6swd3tjn6Vrs+B4BSEiBW6hVfRU2sI77HPo/N?=
 =?iso-8859-1?Q?wMioYthtITIbmr4Np9K0JaMZ2j8f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4764.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jC5IR4Ex57vIjYgaWlNVjfcAFUnQn2ZZbDAypzmptGSN8uLu/E+anLYCf+?=
 =?iso-8859-1?Q?UruMmYLArLzF/AdoulyDX8o2bnteQgCvyUWKN3CE+JD3Q+SE68uIN0hirz?=
 =?iso-8859-1?Q?rVwpX3fXzS5oK5BqfOi/GT9sB7bLZPNP53zqVdT24AygTMltaZzeYxI82P?=
 =?iso-8859-1?Q?ZmO8XUSXj0eBwpvRUbLn/Qjw1zhf9aEs7d4h28Mp4Z4AbqTVS1cZ/Q++Yj?=
 =?iso-8859-1?Q?S+sNOa4NE15Rizeg++jpw1ItUPg9JcoiQAgtR0Ao0T8tOSVLA8JzMKHllP?=
 =?iso-8859-1?Q?idLKUtYe1osu4nwPVl6kwKpw2wUrAlBCuBQMeBtrfxWmJvDq7lft2C6bUL?=
 =?iso-8859-1?Q?BByEw8XIC7Ih4R182o/1CHDxtQY5N6hAj4cnoEL4dIalk6b3djpqsgevVu?=
 =?iso-8859-1?Q?95qKSH0yc4MWfF4nxoXnNe9hkFPpwPhJj0CXcfsGR1Znk2hPcYVQ1KRr1k?=
 =?iso-8859-1?Q?EXGq64nSzAog7Fv9RsYe25YhM8ZPi6QmBF5SP4Me0k1E2wB1wzICB42Jk4?=
 =?iso-8859-1?Q?Fi0TvHcEs0ohPZFOs1pDFQFsGCu20qfGEowlLfdcozU/s9BJPuNrxAWH8U?=
 =?iso-8859-1?Q?Nwo35HCJdF/kkSIXbulD1yvnlXUtygKhU3q/CqSHct8MpG/fnwKfOKVGfu?=
 =?iso-8859-1?Q?l293u+2bWr7u5EjX9SMtsFfBG5W9lQ1MrKeLkirdlAFSCj34D9TJWTrG+1?=
 =?iso-8859-1?Q?cg0ZROZdu1tfLqR4oZBr3RAsfIb0i7XVGqfTRsmVSZBPxpINTuYxBeTCRm?=
 =?iso-8859-1?Q?yEGtbqVEeBxd46XeCdEX/xcxwePI2T81rR3JZIHMxSFv2ELevB41RJsb6T?=
 =?iso-8859-1?Q?0n/i+lD57Tt7B9PQ99yzB1F0SyP6FSF+NDHCeXQoWKULkQkO4P185e0nFE?=
 =?iso-8859-1?Q?frC7fVu2e8GSXNnC63ZitAQSlfOHwEzVTPr+Q0uTvhxk6hbfLO3N2Gz8vy?=
 =?iso-8859-1?Q?OtaAoLpVTzDqGE8Hj/7KDRcm7Jd6vWYK30JGzd/x8s108+ZL1wyFt+SrSL?=
 =?iso-8859-1?Q?awXFT7Dvf/D7/z4lulqbtZJzWO+uTMtg7xR24zKUijKqKzs/op9qqH96hU?=
 =?iso-8859-1?Q?bNE0Wo3UC0DS5RYGUiVr3fN244wYUX9OYeiHJ8Zdx9MTBCZo/yKSdeib8R?=
 =?iso-8859-1?Q?Dz/sNWVxiDp0ONDEQP01Gxl/F4hJRuIGHhD7D1P5txFKyimeOd8LtJFIvT?=
 =?iso-8859-1?Q?8RLo/zsr0/msU1MtlROSXYwrtDoJYGjElbC1tE7UIGSDt0hldVMTRD8Bwp?=
 =?iso-8859-1?Q?wpWyHgr/SxNm+dWZHYgfHPIy1t3g35RVBRQ2NMKu0cKLqwuSKjfypRC8+i?=
 =?iso-8859-1?Q?SfG7tp/vhoXzbWZ2668gQILolsb+ir/8qoq0NmN760m0D7fozoMKh+EJEc?=
 =?iso-8859-1?Q?yeeooKS8kt/Bx8THWhQ9NdRQ6Ps6UoTobaeabpvwmMjvydT2O7ftK0rbIc?=
 =?iso-8859-1?Q?Hgwrrxw1Ws9MFuGR2vmLvbbcIt9BRvn+rapkr3yD72GPUDqllmauPWmzCu?=
 =?iso-8859-1?Q?yDCMbBjuaMzZzQaFEnl9kCQLwavko7n406xVSkxCsCczdqMKhXj0P+ySHO?=
 =?iso-8859-1?Q?0P0PRE3hM4yxUQ9Bn2by/wYKTaQ4PqfV1INVn2xSe9jpeu/R/9Nq/GxiFF?=
 =?iso-8859-1?Q?l+H2YoP+9A+kQfqR5XnToaYUKZoJYF5lYB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4764.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff937a8b-9933-4e95-c828-08de04f84d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 16:49:23.2640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ayj9hO+uAOZJxFJfPaai/l7xGEo++4DHBq0OScWyTD+0p6MeEMd42SB4JIT9DyxQvqoYmbwuXigS6I20nWF8sPxFD1zwTfNHYN/j5vxV3pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6081

<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">&gt; From:&nbsp;Frediano Ziglio&nbsp;</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">&gt; Sent:&nbsp;Thursday, September 18, 2025 10:51 AM</div><div =
class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, A=
ptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0);">&gt; To:&nbsp;xen-devel@lists.xenproject.org&nbsp;</div><di=
v class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">&gt; Cc:&nbsp;Frediano Ziglio ; Ross Lagerwall ; Konrad R=
zeszutek Wilk ; Andrew Cooper ; Roger Pau Monne&nbsp;</div><div class=3D"el=
ementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFont=
Service, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">&gt; Subject:&nbsp;[PATCH livepatch-build-tools] Treat constant sectio=
ns as string sections</div><div class=3D"elementToProof" style=3D"font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; &nbsp;</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">&gt; Newer compiler can put some constant strings inside constan=
t</div><div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);">&gt; sections (.rodata.cstXX) instead of string=
 sections (.rodata.str1.XX).</div><div class=3D"elementToProof" style=3D"fo=
nt-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; This causes the=
 produced live patch to not apply when such</div><div class=3D"elementToPro=
of" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; =
strings are produced.</div><div class=3D"elementToProof" style=3D"font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; So treat the constant =
sections as string ones.</div><div class=3D"elementToProof" style=3D"font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"=
elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFo=
ntService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">Are you sure it was a string and not something else? As far as I can=
</div><div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">tell GCC chooses the section in categorize_decl_=
for_section() which</div><div class=3D"elementToProof" style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">doesn't appear to ever put co=
nstant strings in .rodata.cst.</div><div class=3D"elementToProof" style=3D"=
font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div cla=
ss=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Apto=
s_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">In any case if we have a reference to a constant in .rodata.cs=
t then the</div><div class=3D"elementToProof" style=3D"font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">section _does_ need to be included in =
its entirety, though it makes me</div><div class=3D"elementToProof" style=
=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">wonder if is_r=
odata_str_section is the best place for this check.</div><div class=3D"elem=
entToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSe=
rvice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;"><br></div><div class=3D"elementToProof" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">&gt;&nbsp;</div><div class=3D"elementToPr=
oof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt;=
 Signed-off-by: Frediano Ziglio&nbsp;</div><div class=3D"elementToProof" st=
yle=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri=
, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; ---</d=
iv><div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">&gt; &nbsp;create-diff-object.c | 6 ++++++</div><di=
v class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">&gt; &nbsp;1 file changed, 6 insertions(+)</div><div clas=
s=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">&gt;&nbsp;</div><div class=3D"elementToProof" style=3D"font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; diff --git a/create-d=
iff-object.c b/create-diff-object.c</div><div class=3D"elementToProof" styl=
e=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; index 7e=
6138b..7acaf88 100644</div><div class=3D"elementToProof" style=3D"font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">&gt; --- a/create-diff-obje=
ct.c</div><div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">&gt; +++ b/create-diff-object.c</div><div cl=
ass=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: r=
gb(0, 0, 0);">&gt; @@ -1446,11 +1446,16 @@ static bool is_rodata_str_sectio=
n(const char *name)</div><div class=3D"elementToProof" style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"eleme=
ntToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Can you update the comment at the top of this function?</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);"><br></div><div class=3D"elementToProof" style=3D"font-family: Ap=
tos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-seri=
f; font-size: 12pt; color: rgb(0, 0, 0);">&gt; &nbsp;{</div><div class=3D"e=
lementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFon=
tService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0);">&gt; &nbsp;#define GCC_5_SECTION_NAME ".rodata.str1."</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">&gt; &nbsp;#define GCC_6_SECTION_NAME ".str1."</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">&gt; +#define GCC_CSTR ".rodata.cst"</div><div class=3D"elementT=
oProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServic=
e, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><=
br></div><div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">What does CSTR stand for? May call it GCC_CON=
STANT_SECTION_NAME instead?</div><div class=3D"elementToProof" style=3D"fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">Ross</div>=

