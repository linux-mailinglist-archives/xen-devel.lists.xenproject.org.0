Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF96427CA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453532.711133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29wU-0003jU-ES; Mon, 05 Dec 2022 11:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453532.711133; Mon, 05 Dec 2022 11:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29wU-0003hO-Bd; Mon, 05 Dec 2022 11:47:26 +0000
Received: by outflank-mailman (input) for mailman id 453532;
 Mon, 05 Dec 2022 11:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p29wS-0003h6-Ru
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:47:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e6436e-7492-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 12:47:23 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB3PR08MB8820.eurprd08.prod.outlook.com (2603:10a6:10:438::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 11:47:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Mon, 5 Dec 2022
 11:47:21 +0000
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
X-Inumbo-ID: 94e6436e-7492-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iboywLYPVRucaoaknzy8DD7GEwjSMpMsBYlU2bEc+UoPDNGMlkIQxkMAg6AEfTIX+FShsp/2qEKoNNf/xQPombNGKxjQLhDnkh+RV/TtDFY8oJAut0C9JwyIAGpQQVwIagxhhyqHrAvNzgsWRxBB6PPyibQg/e5D3MhofUndURPTSvCJ2LwaN+rwYV67wiWBtmR27Xi22FSNGE6aRMOu4P9/C3riQuInKfFPHCTruHXS1u508zEsigW11h7QegpBnTUyyXAHRNbkjYzDY76MoxGmo+H2Zdxfo5eELbrVUgtS+1nL5bYuz2tuIEAcwiwqDnFakKQ8rzA9FBqkCEz9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcrG6XFkoyOBIHU154ykMpQAvoFsYBVdvllXmH4mjCs=;
 b=Uv9aiZUjfZObY8ZObIcKz4dMpxUbZki+UFwU5YeealAYxFRcljhL0Wv6+A4EobBJRaB9bI1gwW0PvPsJGXtpkM+DY8cVjKxZAjwFGJXzZB6/4E2GVXmrX2N3CqL7YnL36LHex1xyMqjG2NizrUviy4roKZr61Mnfq2jHT0cWknPlUmen6Ave39+p+9AJ+HHSn8Clk5oc0oG8FGYDjJ7MwKWUyfEkUVf3pUeJ19iPL+MvbKBmm0VusyMFVay2uxCHNSJ/3rdUO1FGxYryWRkHzk0DN57+XthmUETgC0ktJsLQwt939UillrnOFPnssaKv/3UBn1e8nSNedARKHptNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcrG6XFkoyOBIHU154ykMpQAvoFsYBVdvllXmH4mjCs=;
 b=kCXLS9BXMjfzJTDDqK71imVc8YUe8DPG07ZVNd6wCEkQ2iHMkvetZH8SsOqi3To0IPMRQJevBLssiRayecwmZg4d0+u3uBV28EKb1P3WG49KL9VJZUtazY8Tet6o6ZaZ8x35huVA/rKVIFm7QiOu7ScmCmlK0WEqeGjzQIhms+8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Topic: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Index:
 AQHZADhFhRdqD5Su4EO+T+vPnuMlg65PXSeAgAmHn8CABlJugIAAAE2ggAAGKQCAAABhMA==
Date: Mon, 5 Dec 2022 11:47:21 +0000
Message-ID:
 <AS8PR08MB7991754BF46DBD4C2094CEF092189@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
 <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <4e89184f-2e47-8205-1af5-7b2bb5431926@xen.org>
 <AS8PR08MB79910DD6A46EB01C61E0C3C592189@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <68644044-a2ea-25b4-a400-422540ae29df@xen.org>
In-Reply-To: <68644044-a2ea-25b4-a400-422540ae29df@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 744A9A705D9E084AA8E31314A8DF680B.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DB3PR08MB8820:EE_
x-ms-office365-filtering-correlation-id: c5bbbbe8-0f9f-49d6-b613-08dad6b67800
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ApqcoDefh+ogT6UQCA+Ncmpkaap9w2V2OG1OBl9Qsyvmk3Xq0WRApClThH3tyzOQR7ni6GO5W8MVi4sZ6uLDpNukTQbV9SlN4QYc+WvNF6VE4AcNfXca2JAhzuJw4LXNWK/y0h+uAwmM0X1hvvcizwHdCeA/FvDEJjaxzSbEGT8llw9bdrATyDBeelcgbj/wZYELCcH2vntypSHaaf1dZA6wsfzyVNCc1JxWH7oNcBVt01TvxR+nsNh9YYnmeH5qShnyCUZE4t6Iwi3Y6WKLdx7MPdJvVR9KOKg7nq8b8u8DyxIWPTQx4zZAHi9VoP9DWn1sSjZDBoHXUt/dBEZiU1Yz0ELrXtMWyRGj+QDMYWeUtTLK3E+M6ebYsGWuEEi5fH75mrgF/Uv7TRYg/0yZOW0LGPoMhbMPpiwN3AApIPN7dL6360NPAS3Wj9WHleqePL5YeB90AeE+r/5ncepKerj+9La5ARJNn8CArzVIdCfH1kmhYLZihiP9iAsZOFpMT1BBhfWmTXLIHDdM71pB6PF3gZkvH+OuKctEftckg9JAzWJ2arEpk7hTGqNLesrGB9NNIW65cIREXWNIJOKFgH3dvZM9DSNJQtBTnF8q27XYfFTjmcARW5BhTGVkKhpKo8rl21QDvwGufKhvSFXqdS0PIrvRQy6Pi9i2jeSthCYquJnfe8Wl+YU0tJkiKSsLPjo46IsXRI6eOW1dVYaLeg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(376002)(366004)(346002)(396003)(451199015)(38070700005)(38100700002)(4326008)(66446008)(66556008)(66946007)(2906002)(8936002)(64756008)(66476007)(55016003)(76116006)(8676002)(478600001)(52536014)(83380400001)(122000001)(33656002)(4744005)(86362001)(41300700001)(316002)(110136005)(54906003)(186003)(5660300002)(9686003)(6506007)(71200400001)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3A2UHZNMHFPT3VIanNnb3NDcm90Yys4Uk90SjcydFNVN3ZLcTlheGtQSGZz?=
 =?utf-8?B?Vm5xR05JcE9iczh5YVg4b3l3ZmVxREY5K0gzeGZ0MWNEWnlCbmV6b1dSWG5a?=
 =?utf-8?B?UXl4REZqYzh0TE1pS3BhYWZnTTN3WVlQUWlWUlBqR0FiZFJWNWpLd202Y09y?=
 =?utf-8?B?MmczRS9SYXFwTjJpRmFYZzNJbWU1SmV5WXdTS01yeHIxSDZGM0x3Q2ZkQkxV?=
 =?utf-8?B?TXRwZmgxVGU0SERuK1U2VUQzbHdDcFIxRktLRWJtUDU2K20xdUJHRHdxQURS?=
 =?utf-8?B?UEFZc1ZGNWNLLzEwNWlHZDRrdEs5TDBhalFvSXg0cHNWUFpnTmJDbjdXaGUz?=
 =?utf-8?B?U1ltSGNEVXRyVmQxQkxsMi9vVEkxQWVQTHJSV24zaVpCN3l6VDNjWjhkRWVJ?=
 =?utf-8?B?R0FMTTV1bTh1MURyOXIxbkJFUGFVRlVxNFpJdndIa29KZmQwT0QwQnFMYnZy?=
 =?utf-8?B?ai8yNys4NHVOMmZiT0sydHFjTnllbFpwTkdUTXh6QlkxSkVKYTc2YlQyc0RC?=
 =?utf-8?B?YTIvaUtFZHArTk1qQUF4UVlyR3FuUkViRGE4NnYyYXluWVN0ZXIzT2ljYTFN?=
 =?utf-8?B?TEdhQWNHR1lnVXdaZ0Mxd3dmQlJMVXRySlhTNy9rR2tLM0s2ZGxRUllRTGll?=
 =?utf-8?B?dnI4TGhIN3VaWFpRWkIxWmZsT2ZTSUtaS1FybGxxZW4zeUFUN0FTQ3lKOXpX?=
 =?utf-8?B?ODdySER1aEdZdFJPcnA1aHhzcUQxMUF4bThNVXVvTzNxVHRxTis1TUNrcTBm?=
 =?utf-8?B?allBYitoTFhPbDVLeTdCcUN4anlpU1B5QXV6NXZJMEp4N3BYQ1JmRlZPREZa?=
 =?utf-8?B?a0VNbVBSVVdVWEcrbGJNZGpQZkhrcThydHlPK0xaZm1VOFM1L1A3cmx5aXZt?=
 =?utf-8?B?QjNGdFp3TUx2M3E2WFpVUHZKU1dpMTdsT1JtOEdMSW42ZDJUK2JtRTNiQWNS?=
 =?utf-8?B?UkxDTG9YTHl4RmpEZGFiTk5JT2QwcTlUemFDVHpGcWNFTTBETUlDek8vdjV4?=
 =?utf-8?B?MmVpQmhXbDcvampsMld5UUI1S3Q0ZG5iMzRISTFGY294RGJaOUhvcUwyOURw?=
 =?utf-8?B?a2pEMGltMkVHVnV0VDdCc3laOVFLOUZ5MUs3NzE1bDZBck1VY2FTcGdhUDM1?=
 =?utf-8?B?blI4dUx2b1FxS3BUZmsxU09PR092djJsS0Rjdkc5QW5LZjZpZEhoeDRqNi9G?=
 =?utf-8?B?c1hBaHREZjczbWJ2UjZpRXpKUXUwTU44REIvR1hOWEtUZjJaaTEvMktMa0pN?=
 =?utf-8?B?aU5LWEZFaVZYdmtMNmRkQXFBK2lzWnd0bmo1R2RBTkhmcngwM244dGdadG1D?=
 =?utf-8?B?WDZyMVQxRGpYb24yRmR0SExoK3N0T3I2UlQ5cVZpQ1dqeFV5MWxvMi85UitD?=
 =?utf-8?B?QzNla0p3R2JpY1pqbmoxWXZiWDF3RXl1WENVemdUdnhLN3FRTmMwbGNrOXIy?=
 =?utf-8?B?bE4yV2dYRCtGNWl3N2M1bmQzMDhTTzl6czl0NVEvc3ZsWjAydG8xdDVYVzJX?=
 =?utf-8?B?MHVqVVYxdURlMVNkL3p2OVk4Ulk5ZmNqd1BVSWtKSWNHa1ZJVDRwZi9CY21s?=
 =?utf-8?B?QTlTQkExTjRreDU4THBnMmlaMnQweWNSUzNTRGR0NzU4emdTRTdiMUpNdHRo?=
 =?utf-8?B?UVk0aDVxQ1dpMEpDd0U0bWVUSTRXbHgwOU5QcGw2SGhiaHN0bkRyM2xtLy9Y?=
 =?utf-8?B?OFVSOFlmbEFkdjM5VnU4bGNQd2p3b3ZuNTd6bm1aOWwvOUg4NmRjMDRId0dJ?=
 =?utf-8?B?Z3pGY2NzUUNycTNZZU1lQ3VCWFZwNDlBa0t5OFJyeDJlcFlGZ0xRNkFGN2JT?=
 =?utf-8?B?V3AwRmo3cVdOaDNncTFSQjh6SSt4M0VaQ2gxbk96RndXcTZpNTBZb1pqc1Rp?=
 =?utf-8?B?MytiRlBaTTBOUTFxMlRoQmIzUHhZTU9tTUJ4c1VucXVwcSsxU0hrNTZ2OElC?=
 =?utf-8?B?b0cwaEZJSXV4blFTL3hzeGdTN0xuaEdmNG9lTDZERFZSOU14UTNpK0VodGlX?=
 =?utf-8?B?d1dmU0IxNUIrdUk1R2l3aVNjMG9yOGQ5M3BEUGI5WDRNbHl5UTdpMVZnNito?=
 =?utf-8?B?R1BPZThrMWpsUi9FTU9UNllmc2VMQUtuS0tRaGk2aXJOdDh6R0cxaTRhU3ZB?=
 =?utf-8?Q?o8/i72fX5M0/LtrfkqQQQhrcU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bbbbe8-0f9f-49d6-b613-08dad6b67800
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 11:47:21.1582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rt/SPGLGK3ZpcnAE4pd6Fe6q+WDdT2DB59EqY2P4HOviBTYdA7drg7doZ5Lyos7hRSKHjFRyri9Li45GOm67HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8820

SGkgSnVsaWVuLA0KDQo+ID4gU3BlYWtpbmcgb2YgdGhlIGNoZWNrbGlzdCBhbmQgbWF5YmUgaXQg
aXMgc2xpZ2h0bHkgb2ZmIHRvcGljOiBXaWxsIGl0IGJvdGhlcg0KPiA+IHlvdSBvciBvdGhlciBt
YWludGFpbmVycyBpZiBJIHNlbmQgYSBwYXRjaCB0byByZW1vdmUgdGhlICJxZW11LWl3aiINCj4g
PiBzZWN0aW9uIGluIHRoZSBicmFuY2ggbGlzdD8gQWNjb3JkaW5nIHRvIHRoZSBkaXNjdXNzaW9u
IHdpdGggSWFuIFsxXSwgSSB0aGluaw0KPiA+IHRoaXMgY2FuIGJlIHNhZmVseSBkcm9wcGVkLCBh
bmQgSSBhbSBhc2tpbmcgYmVjYXVzZSBJIHRoaW5rIHRoaXMgaW5kZWVkDQo+ID4gY2F1c2VzIHNv
bWUgY29uZnVzaW9uIGluIHRoZSA0LjE3IGJyYW5jaGluZyBwcm9jZXNzLg0KPiBUaGVyZSBhcmUg
YSBmZXcgYml0cyBpbiB0aGUgYnJhbmNoIGNoZWNrbGlzdCB0aGF0IG5lZWRzIHRvIGJlIHVwZGF0
ZWQuDQo+IFRoaXMgaW5jbHVkZSByZW1vdmluZyB0aGUgc2VjdGlvbiAicWVtdS1pd2ouZ2l0Ii4g
SSB3aWxsIGFpbSB0byBzZW5kIHRoZQ0KPiBzZXJpZXMgdGhpcyB3ZWVrLg0KDQpDb29sLiBUaGFu
a3MgZm9yIHlvdXIgdGltZSA6KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

