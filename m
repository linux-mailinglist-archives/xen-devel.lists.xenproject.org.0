Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EF772290
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578280.905714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyW1-0008OY-Ng; Mon, 07 Aug 2023 11:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578280.905714; Mon, 07 Aug 2023 11:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyW1-0008Mr-KY; Mon, 07 Aug 2023 11:35:13 +0000
Received: by outflank-mailman (input) for mailman id 578280;
 Mon, 07 Aug 2023 11:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNd=DY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qSyVz-0008Ml-He
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:35:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 757a7637-3516-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:35:07 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9342.eurprd08.prod.outlook.com (2603:10a6:20b:599::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:35:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 11:35:03 +0000
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
X-Inumbo-ID: 757a7637-3516-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZU0oHg7W/QhaqWt1x+7uBaTNP0dGAbbjnJYD+Tei9qAdy75x1n1Nl1K22CQfEy8js92Q7AK3gq0MAqAUQoc/tY0V7HrKFU7AU9qYWGQEMvJ6g6XP39KitF4Q5vanYyh6oevBWfLvA2EKDZP/faqX3v38oSP+BD1yxbj5BbegKCG+CyqiDqfUeJTzTrI/ZUEV1Nl7mQUAxKgrYgpHKNkjgAMc2CEj0Lmeqp46CS2PsFEkGbLFuEt1DoecIcIxuNWoXhbapbXXpsN3sszPFoFIzOYxmdnIOABoHw5wG7nThu/8jbxJI2twy9c0MlCwql8V8RKr1ZJzm3SitzTaPXyC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9Xh2J+G7yaEExzXYEPJ4NEpZIPbtKmtGktwx/+Ubao=;
 b=SXnuxvq2pGvWXk0dP4pDVhirtr2PSjp4h4WNuGjxei51ezoxMJFx/FVra9umCiOgJBK6ENfTdKvBsu/xZcrxcVx7+UydJeyw91QuG3Lvk/db6KeFYKn94gf7XOCLXUZZiL1+/ccM4q2WTxW0otLE8bjdqLrguAd7Lkf7Y0onWSeONKB2ek56fkAAf0x59LUH4AVZ/5sekS49vVQ5WlCtAZdRNgcVBFQaM6fr4wSAwVOmDeoDdNygVNjYGsyEZIRfWhqBvq6Jb6GxACncpcU/w6mlS8YH19VfUG05TO3b7hasQl2MN57zIVdGJ/inRVOssKPesABQ3mVTI8qdd33Dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9Xh2J+G7yaEExzXYEPJ4NEpZIPbtKmtGktwx/+Ubao=;
 b=DnRaXWeFlciqdWuCJ61a6YdNxdV0lrC0BFdZ9paJcYdotB/AOzTOuzDRbUbpiRAYCqCp2DZWepSneCQcA4iHW10SmYVX2tDRyWJXcnS+Dt0F0BeaHDLp2XOWSt7OCYJjYXbIwpj1GJRlSrSCMZBrWOdAICFnif8eevaYyJ9CSdU=
From: Henry Wang <Henry.Wang@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng
	<Penny.Zheng@arm.com>
Subject: RE: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Topic: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Index: AQHZxCqBtZIUxf7FmUaIEyO8EPs3TK/euu6AgAABikA=
Date: Mon, 7 Aug 2023 11:35:03 +0000
Message-ID:
 <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
In-Reply-To: <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2732F28F699DCF42ACF7F0FD3714C47A.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|AS2PR08MB9342:EE_
x-ms-office365-filtering-correlation-id: 8dcce9de-8988-487e-1bb3-08db973a5758
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +af4QVeV2GtkEuEKrwOwWxSG3wlMuq6k94f0IszX9x88tXrrPsGGTz8sxo7FQMnn9Ced1e7EqUQ1FK9fo9WH2gSNOJH5W3HWapmzlGPg8C+fMOjaZaGB+Wmgyc9QYxNflj9AmnZzdjm8ZXejSEcfGNs8soHsSuGqmNA82kxtvG0RS+KP+B6aFVhku6m40lzxVZFQQrC0dne6hcAi71MVIkkIm8aQ588MHL06ce5UNWHbbbPsndVKDbm59XWkmlC/Drd3sNh/Fggtv/ZHwCdlO6y75KNw/LN5AYYvOmw1SbLfSNPccWI8kQGJV8uc4eevqEkVsGPoYOmM2LMofkTejUtVSDE7HE6nJvZjtPyf50XwxtPjAr2HX/B6JzZnhLp5BhumUqvp387izfsaUvyDbJOVOo2NGQpZRWZB1FLmpFoj0vUQpfdKoOax+ALgUsbmWG+5yNxP18Vj0uK4f5S3ww0/tesTeSMlkmHB9oNQMKfTMi7j5i+QFSVeWlzRHiOmi/1RoD7Um7K+8Yi4kasKclwcAJfV0ax/rLqCXaXfsqR5/yqpQs6WxhKJp+w7J1vS/Y8HrfXS1RGX1XgOJeiZwhYxPIUodWFdORqMin+29qs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(41300700001)(52536014)(478600001)(6506007)(8676002)(8936002)(26005)(38100700002)(7696005)(5660300002)(83380400001)(2906002)(110136005)(54906003)(71200400001)(38070700005)(55016003)(316002)(966005)(66556008)(66446008)(122000001)(66476007)(64756008)(76116006)(66946007)(4326008)(9686003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z09ZampHRk1qWUZ3VzgweEV0K0NFUVNCc0lOQ2xYR29SWkhGb1pFTm1DaXhF?=
 =?utf-8?B?OSswc2UyU1dyeSswSlNtbkdSbnRBV0Z4UGF1T0I4ejJHQ0p6aFFhelZNdkRr?=
 =?utf-8?B?SEM4TVBwbzBHSGxFNGc5UnJLOUFpOWVKaG1MQ3p0ZHIvUE5XaFoyUXdtZ25u?=
 =?utf-8?B?dldtVFZ0Tnh5OE5CVEx0bHhISmQ2dWoxZDhCQUZoRnFJWWxSZmNmN2FSQk1t?=
 =?utf-8?B?VmthcXpyKzlWOGZUc05IUEovUERodVA5b0s4NG1tWGh4dzVsK3BycGdja2hL?=
 =?utf-8?B?Y0hubC83cXBaaFNGTWUvVysxM1BXUGp0Z0hXOTZKSER0VU1jRHBhQlBMdzhn?=
 =?utf-8?B?ajRzWXgwKzVzUVFvMVUrdlpsWXpnM0FCaTM3NFRXMzgwRFV1bytFZy9zb2I4?=
 =?utf-8?B?eDZieTIraWJTMkt2c0dJK1RXbUZBdllTNEtHRVdDeVBYdkR0SUdqaWJRN0Mx?=
 =?utf-8?B?aVlnZjNISjIyVzkvb05SdlFOcmpOb1BNTUV5RkE4dEd6UG1CQ2dKK1hVckVC?=
 =?utf-8?B?Mkt0L2Q3V2Jha2NiZmdDM1kwNkRZSmhjNi9qT3lVK1pzR0RaUzRGNFdRQnls?=
 =?utf-8?B?SWRRMjlTRmNOaENiaG1rSFVobjhiZ3hrcHBWeHFwWnZMSm1UZXEwV1BqbHNr?=
 =?utf-8?B?cUgvL2xBS3B0ZGc0UGJKRkEvbjNCQ2tIWWJ1RFE0SG9nY0VoQUJBOXZHdldU?=
 =?utf-8?B?NUdWdXVudUxvQnlHVmFzWDBMeFltQU5ZaDQvODZBTWxHV1pHSVljNE5wcWRs?=
 =?utf-8?B?Qit3RGoyajVWZU9QQlJQT2cxY0FyQ0J6U24xZGRTTm1ha2Z1a0lYcXVjY3cx?=
 =?utf-8?B?VWp0NFNrcEJpekFUendENWFXS3R1UndjYjZUN2tENjFLL2ZodjRoT1g1b3Nr?=
 =?utf-8?B?M0VqbDlXUXM3ZGhMMmdsaXJhYkZiK0FpK3JkaTE3TWlvQ2t0Qml0VnBwNUtl?=
 =?utf-8?B?Y3VHRHlpT2IvS3FERXBWMndjMVVYVVRjTlVmRzhIZkc5SUpHS2psaitiQzN4?=
 =?utf-8?B?S3UzZVk4TjVlbEZtVHM0a3drL1ErNXUyZ0tIQmFjTkprNk41Y05vd2gwS2pE?=
 =?utf-8?B?dU9vOXh1d2RZYjQ5Yyt1MHBMLzIxLzNybk5JdDR6YmkvNWJCR2cyK2prK1JS?=
 =?utf-8?B?V3RzNVJnZ2xDRnJYZDJoZHJaQmovTEFmYUlOZXA4aGVtMy9zUmRiQVBYblFk?=
 =?utf-8?B?cWNUN2ZxVEpUSUE3a1I4WjNHRWhwT0Y4bVNVaGZ4MVMxdk9xeEdRUEJ0V0p0?=
 =?utf-8?B?NllKSDl3M2FNWEJPWTNCV2pFTStlbFNYYUJ2UzlhM3J3enRiV3JjQnczbzhw?=
 =?utf-8?B?cXlUYW8yMG9CaUQ2OVV4eDBYd2s3TkNnaGMzbTdpK3lDRlUxRGJ1T29Dc1VI?=
 =?utf-8?B?aGxsc0RPVytFTnRDVktESkRUU3NqTWtzRW9nMXJKRVlGckpmemFMUWlCNUtp?=
 =?utf-8?B?R1hEcHdBeURLZHVtcDlobWVEcjA1dnZDRHllOEtFQzhIN2JzR2tBOUFDRTcy?=
 =?utf-8?B?bkpYZU5JVnFpVXk1WTZNeVpKMVViZDBDNHhoZi9lbGwwVE1wVGkwYzBFeTZi?=
 =?utf-8?B?ZEd4eWVyZmExRkdOYkJ5Nmd2N2RoUnA0WUZ5aCtLYW1UMi9rT0ovYlVJQklR?=
 =?utf-8?B?SjRZeWN0YmRhN3ZHQVJsTFFaUkh0SVRySGZVUlRCa2dHallsTGdrSm1DQWwx?=
 =?utf-8?B?cmN6emQxNEFBVHo5aC84ZCt3Sm5YN291Y2pEelAwRlBLdlVES2RCZ2VNdmVG?=
 =?utf-8?B?dFVSTW1qaU5pV2FlYTY2YzFYTFo5dzZKdnI5Qy9KbWkzTWVoK0ZYdnE5eG5D?=
 =?utf-8?B?bWRhVFZqZU1ZVnBqVEZadUR4UElXVVBTZFp5L0NMMkdHUGZYOHZGZkNPTkxJ?=
 =?utf-8?B?VWxlbmoxVmZPVkVnZ1lvUW9JQ0tUMDJZNkpqOU9mWlpUTFJDaW01a091VHY3?=
 =?utf-8?B?TkVIQ05QbTJFV2NLRFE3dGs2SFpwV1JZK2oySEltZEg1Qnh0UjhyMTV6dlV1?=
 =?utf-8?B?aFBoUWhwbUMwOTNkMEloZmh3R1A3bVYrOE42RXpMZmtWL1RwUWxhbTI4U0Zh?=
 =?utf-8?B?eC9kTDZ2eHBjamZWWVZJbkdieDF3bzRlWnM3enBYQnR1RzlqcjRaOTkzRUVJ?=
 =?utf-8?Q?Xpxu35DYNIlGcwt9PlDc9pOJn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcce9de-8988-487e-1bb3-08db973a5758
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 11:35:03.2116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxOg62nQBz2WvbUn9Qc1gjJbXBGoDJfWPJWC2UWS/WuF0DqCO/Zqhdgjm6g+OBm9ikArwkDhT7sFvQ8gP3RrpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9342

SGkgQXlhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLSANCj4gSGkgSGVucnksDQo+
IA0KPiA+IEF0IHRoZSBtb21lbnQsIG9uIE1NVSBzeXN0ZW0sIGVuYWJsZV9tbXUoKSB3aWxsIHJl
dHVybiB0byBhbg0KPiA+IGFkZHJlc3MgaW4gdGhlIDE6MSBtYXBwaW5nLCB0aGVuIGVhY2ggcGF0
aCBpcyByZXNwb25zaWJsZSB0bw0KPiA+IHN3aXRjaCB0byB2aXJ0dWFsIHJ1bnRpbWUgbWFwcGlu
Zy4gVGhlbiByZW1vdmVfaWRlbnRpdHlfbWFwcGluZygpDQo+ID4gaXMgY2FsbGVkIG9uIHRoZSBi
b290IENQVSB0byByZW1vdmUgYWxsIDE6MSBtYXBwaW5nLg0KPiA+DQo+ID4gU2luY2UgcmVtb3Zl
X2lkZW50aXR5X21hcHBpbmcoKSBpcyBub3QgbmVjZXNzYXJ5IG9uIE5vbi1NTVUgc3lzdGVtLA0K
PiA+IGFuZCB3ZSBhbHNvIGF2b2lkIGNyZWF0aW5nIGVtcHR5IGZ1bmN0aW9uIGZvciBOb24tTU1V
IHN5c3RlbSwgdHJ5aW5nDQo+ID4gdG8ga2VlcCBvbmx5IG9uZSBjb2RlZmxvdyBpbiBhcm02NC9o
ZWFkLlMsIHdlIG1vdmUgcGF0aCBzd2l0Y2ggYW5kDQo+ID4gcmVtb3ZlX2lkZW50aXR5X21hcHBp
bmcoKSBpbiBlbmFibGVfbW11KCkgb24gTU1VIHN5c3RlbS4NCj4gPg0KPiA+IEFzIHRoZSByZW1v
dmVfaWRlbnRpdHlfbWFwcGluZyBzaG91bGQgb25seSBiZSBjYWxsZWQgZm9yIHRoZSBib290DQo+
ID4gQ1BVIG9ubHksIHNvIHdlIGludHJvZHVjZSBlbmFibGVfYm9vdF9jcHVfbW0oKSBmb3IgYm9v
dCBDUFUgYW5kDQo+ID4gZW5hYmxlX3NlY29uZGFyeV9jcHVfbW0oKSBmb3Igc2Vjb25kYXJ5IENQ
VXMgaW4gdGhpcyBwYXRjaC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWku
Y2hlbkBhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVu
Z0Bhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4NCj4gDQo+IFdpdGggdHdvIGNvbW1lbnRzDQo+IA0KPiBSZXZpZXdlZC1ieTogQXlhbiBL
dW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IA0KPiBUZXN0ZWQtYnk6
IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPg0KDQpUaGFua3Ms
IGFuZC4uLg0KDQo+IA0KPiA+ICsvKg0KPiA+ICsgKiBFbmFibGUgbW0gKHR1cm4gb24gdGhlIGRh
dGEgY2FjaGUgYW5kIHRoZSBNTVUpIGZvciBzZWNvbmRhcnkgQ1BVcy4NCj4gPiArICogVGhlIGZ1
bmN0aW9uIHdpbGwgcmV0dXJuIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcHJvdmlkZWQgaW4gTFIg
KGUuZy4gdGhlDQo+ID4gKyAqIHJ1bnRpbWUgbWFwcGluZykuDQo+ID4gKyAqDQo+ID4gKyAqIElu
cHV0czoNCj4gPiArICogICBsciA6IFZpcnR1YWwgYWRkcmVzcyB0byByZXR1cm4gdG8uDQo+ID4g
KyAqDQo+ID4gKyAqIENsb2JiZXJzIHgwIC0geDUNCj4gPiArICovDQo+ID4gK2VuYWJsZV9zZWNv
bmRhcnlfY3B1X21tOg0KPiBJIHdpbGwgcHJlZmVyICJlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbXUi
IGFzIGl0IGlzIE1NVSBzcGVjaWZpYy4gQW5kIC4uLg0KDQouLi5hY3R1YWxseSB0aGlzIGFzIHdl
bGwgYXMuLi4NCg0KPiA+ICsvKg0KPiA+ICsgKiBFbmFibGUgbW0gKHR1cm4gb24gdGhlIGRhdGEg
Y2FjaGUgYW5kIHRoZSBNTVUpIGZvciB0aGUgYm9vdCBDUFUuDQo+ID4gKyAqIFRoZSBmdW5jdGlv
biB3aWxsIHJldHVybiB0byB0aGUgdmlydHVhbCBhZGRyZXNzIHByb3ZpZGVkIGluIExSIChlLmcu
IHRoZQ0KPiA+ICsgKiBydW50aW1lIG1hcHBpbmcpLg0KPiA+ICsgKg0KPiA+ICsgKiBJbnB1dHM6
DQo+ID4gKyAqICAgbHIgOiBWaXJ0dWFsIGFkZHJlc3MgdG8gcmV0dXJuIHRvLg0KPiA+ICsgKg0K
PiA+ICsgKiBDbG9iYmVycyB4MCAtIHg1DQo+ID4gKyAqLw0KPiA+ICtlbmFibGVfYm9vdF9jcHVf
bW06DQo+IA0KPiBwcmVmZXIgImVuYWJsZV9ib290X2NwdV9tbXUiIGFzIGl0IGlzIE1NVSBzcGVj
aWZpYyBhcyB3ZWxsLg0KDQouLi50aGlzLCBhcmUgdGhlIG5hbWUgc3VnZ2VzdGVkIGJ5IEp1bGll
biBpbiBbMV0sIHNvIHByb2JhYmx5IEkgd2lsbCBzdGljaw0KdG8gdGhlc2UgbmFtZXMsIHVubGVz
cyBoZSB3b3VsZCBwcmVmZXIgdGhlIHByb3Bvc2VkIG5hbWVzLiBJIHdvdWxkDQpwZXJzb25hbGx5
IHByZWZlciB0aGUgbmFtZXMgdGhhdCBKdWxpZW4gc3VnZ2VzdGVkIHRvbywgYmVjYXVzZSBmcm9t
DQp0aGUgY29tbWVudHMgYWJvdmUgdGhlc2UgdHdvIGZ1bmN0aW9ucywgdGhlc2UgZnVuY3Rpb25z
IG5vdCBvbmx5DQplbmFibGUgdGhlIE1NVSwgYnV0IGFsc28gdHVybiBvbiB0aGUgZC1jYWNoZSwg
aGVuY2UgYSBtb3JlIGdlbmVyaWMNCm5hbWUgKHVzaW5nICJtbSIpLCBpcyBtb3JlIGFwcHJvcHJp
YXRlIGhlcmUgSSBndWVzcy4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZl
bC9jMTBiYzI1NC1hZDc5LWRhZGEtZDVmYi05ZWU2MTk5MzRmZmJAeGVuLm9yZy8NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gLSBBeWFuDQo=

