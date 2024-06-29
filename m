Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991891CE0A
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jun 2024 17:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750986.1158909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNaQy-0004n1-Vp; Sat, 29 Jun 2024 15:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750986.1158909; Sat, 29 Jun 2024 15:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNaQy-0004lW-SC; Sat, 29 Jun 2024 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 750986;
 Sat, 29 Jun 2024 15:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6MN=N7=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sNaQx-0004lF-As
 for xen-devel@lists.xenproject.org; Sat, 29 Jun 2024 15:56:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20808.outbound.protection.outlook.com
 [2a01:111:f403:2c12::808])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb759bf-3630-11ef-b4bb-af5377834399;
 Sat, 29 Jun 2024 17:56:13 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB9534.namprd02.prod.outlook.com (2603:10b6:8:f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sat, 29 Jun
 2024 15:55:58 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%2]) with mapi id 15.20.7698.033; Sat, 29 Jun 2024
 15:55:58 +0000
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
X-Inumbo-ID: 1bb759bf-3630-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQgjIYPNoZIrshjQtAzD+aUWSprqs50we9lJ6bObQAoU9kx+HTQcdPp77r0lYnScLFjKm2OnlS9EXTH8NlLLKlr6NOt6jIuJfTAXQp1xEOl1BEBHQrwoWzMH16wG/2A6bYHr+lK7ef+m97PKMHk7zZ5mqocwGqlAQG+3V8A/mfF9UdAhlzOknipp5rtVJYyZ9hy2zDEFpELJk8RWsba+N0d/tYQdaBGb3KC+NYsLb/n4F95DrVYiZ2J5tiyYqpiRnUwlAKKSEYHIhX6oA3tL6vQZATX2gu1cOULq36wm+J008DWGhDBaH+QyPpBQkYcZZJfrA2rd+0IIjBaq8bKRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ih/lzqmLSKQKwRjuRJf3js26Se1yyTSpbLLJfNn+ZM=;
 b=FtYUf8K/xAN8vLAHWJFv/OxskzkxthtlqzysUNMXH0Gf727NLS4xzJrFXPOtBpflV5iHwSBSp3CU3QBkQK5Re8pBExPn8SctyntYfhR0JTpmQckBJ13bdIT0JhW321GCH3DSQo2L2olNqRKWl51YfkwupFakYekW/v7qI2q8YgXCQvD93DGaUGuMbY2J6y/yeLhHn4s6pKFrznYa6DfsnUgFQToAmLw0AW8G/1SPIvg22KkVSamEHK+5ZJE6QpQ5vOY6mYLOKqZpm3O5CgkGarn+t/w1GAAvZa3WbEt2b18yQhGnLvZRMg2a6jykyn6Fpfu8uQOA1MJEULaEVl5Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ih/lzqmLSKQKwRjuRJf3js26Se1yyTSpbLLJfNn+ZM=;
 b=M29Cb6jWN91PLxnvdlOo5sIJYF0uq1aX6Y0WszNhlkxF4vtRZ1ss9AZdYFMtdi+sMR0d6bm55P0UNFde8lvrzyTM6F5cRHb5O+kw+rwr5pdcuFmtOKZ9CkOs76EZN+/dzeVwYqrpgnxC3+x3D92M49cIkY7eBV4apS2DK4kspEdL4trcozjnhfMIqF14/q6pCBV1CxffBwq1COpNwG87Oc/ZpVWLvfvu5bSSx/2pI5512TUgLbGt7DSaG36QqKGGcTH12nuDAdy6sHYBfnrFDIclyi7asMdW86Jg6G0keXJ2KprxL5QZrGypE4yp6MaGK/ap9pGe5AWuEJuXNpEckw==
From: Michael Kelley <mhklinux@outlook.com>
To: =?utf-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, "hch@lst.de"
	<hch@lst.de>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Topic: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Index:
 AQHauIjoJBWSrCyO6UWzcncSceBiMLHa1Z9wgABomICAAA3OAIAAhiSggAAJLYCAAAn5IIAA6tuAgAAdhQCAAhqHMA==
Date: Sat, 29 Jun 2024 15:55:58 +0000
Message-ID:
 <SN6PR02MB415781789CBD6597142BEC68D4D12@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
	<SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627060251.GA15590@lst.de>
	<20240627085216.556744c1@meshulam.tesarici.cz>
	<SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627152513.GA23497@lst.de>
	<SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240628060129.GA26206@lst.de>
 <20240628094708.3a454619@meshulam.tesarici.cz>
In-Reply-To: <20240628094708.3a454619@meshulam.tesarici.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [0i+Lk+rVKmCvrjzEiZ5d4TzSqbjXxGjV]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB9534:EE_
x-ms-office365-filtering-correlation-id: 1333d74f-347b-44ec-9c51-08dc9853f78d
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|3412199025|102099032|440099028|56899033;
x-microsoft-antispam-message-info:
 QZkWcOKsfpZYuhYxrWIjqW6qI0Bh3Qd6oR3wi2xyYQHks9QUO7vSSYxijjuHVjSIBV7qTkxyLCHEWBB5ozc20LZVFrUvWMr4YnXiWudiwCmAmU5uc6caaGar027XsPTXXtfq/2MxPsHI0jmbysdAJKFD+JMc6wwe3w4e6/FZDNQFS7O0z7tY1I5ZsSSr6EnWNjkq15GobEi5rdE0dm8K+dq7wTsXGZWkPRr5jDkSBdSWsyr6rnGIlc0iAimUEI2Ur3142Po9vYIwZ654wKi287ilkSZPfGJOOCcGsuVqyupDDnkvXneH+jXIYUpOJsDMWJTNdfJn6PrPLFOjYEYfEUpSmC4shkgHN741O7q2oLrfoXrdGsWDyobyttxXcY2qCrZx1fkD23TpcRQ3zzxPQi2FpcBswR6EtZzKudtNW74l189ES4iLn8lg49WdmzxXf64SwD/sdak2jjPlD+i/pIUNQ9kN9xDnqDE7swdtcZvTJ8BUrzp7buXS7vwqszH8bhe7gTWf/U45UI3cMrEuLXYaGTpq3tQsdwS0UtTFWf2q6f3sfJZ9r3i3Ua2pRVBCeahq8o7Y1hl+5wIeyugAHlOxCaEpxSnwzpctfLbGfVaTLydWtBj4Rn6BAhGB2Zwd
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?My9sWUE5eTMySHZ5czhqWEs2bUMxb2I4OGcyWm5ScEgxYVN2aVZmMXJlVDlT?=
 =?utf-8?B?ai9PVkFGblpFVk1EMTU4b29CRmxYSUV0MnBwZ043NU5YT2wxTkdnV2RPc29R?=
 =?utf-8?B?eE56TUZFdTJHa0s5QkZzdWpXcWRhRy9hbkx3MktKelgwOG9rVmF0SG5ZQ09L?=
 =?utf-8?B?YTBPMXJJZHU5ZmFyVXN2VFNEeHB1WGZMNUxDYjVBMWMyVFJrVXJzQVJmY3lS?=
 =?utf-8?B?cENqb3kzT0RRemY2TzZQNkhuTllxaXA1blYzN1Z2dEtJQ28xTEd6Z2I0U2gv?=
 =?utf-8?B?S2s0dEoxUXJOcittYWVySWRyR1ZuR1VqY0FiZmF2eXlTM2Jxb3R0MndyUXRI?=
 =?utf-8?B?RWhLT3ZmenRhVUhEenhYSS9jOXU3K0c2cjdUUWNBdHl5ZXpxMlVCUUttUXFH?=
 =?utf-8?B?OVBRVWxYZ2NpSEcwaEkzbDk0bkFvcEt5R2xuVmxkTlZ1WDZCY2w1ZnNybUJN?=
 =?utf-8?B?czNGZFoyTkxhM0xNajlGWThHYjZ4V2ppMmlLOXhYM25vbGI3TS9nN2g5N00y?=
 =?utf-8?B?UytYUjJiSldzL2gyZ0NuUEtHV1ZNQkFIZGEvbmE4Q3piVkUxQ1J1S2pkVUJz?=
 =?utf-8?B?TWp2RDlqTUZ3czlpWkREQjA2R1drRlJVZy9naWRhWXFONHk4NzFXQkVKZk1n?=
 =?utf-8?B?TFo5L0lmbmp2bnBiMHQyaVZSbWYrbE5nVVR3bFFrZGdhRVpvWUorRFZ5aXF2?=
 =?utf-8?B?aWlUUENjSElTSFlOaGRHdFdOQ0dMZFFwSHNEcjlUYkpkNmNrS05lb2lyQXZT?=
 =?utf-8?B?cnY3UXFvUWkzVGZaeWh2UHRRckJWamx6UG1NS01OUlFvcGpHd250aG92Y3Zl?=
 =?utf-8?B?OHgzSHdrZ0hkcHVCUGN4TjlFMmhnTTI2VXVpRkVuSXd3Q0hhL2t1WkNCUUZP?=
 =?utf-8?B?cXlsNFpNVDh2bXJZR05EOFFONHZpSDhtVWNnMWZ1VU1rOVFUaVUrZ09LaDBu?=
 =?utf-8?B?engrSEVTanJZazBTdTJ3Ukw3UXBRbDNpaUYzd0N6WnVQYVprSzUwWkZCY1lW?=
 =?utf-8?B?TmdIU2ovaHVXUTFhbGxuYk91NlhudmFoamY1RElHQnN1Qm45SEkxVlUxUmUv?=
 =?utf-8?B?OCt4Z01JOGt5U1lHaUFENENOVm9zdDBuYzZJcGQwV0ltWTduK29TOEsvZWts?=
 =?utf-8?B?a0xsUmdxMGVHS0xMMXh2N29abitnODNueHkzZDdGUzAxZnk3bWZ4K2k2bG5m?=
 =?utf-8?B?Sm9OSlBUeXc3ZTR0MmRqZHppN2ovU1c2cDl4UDdBMU02TFBhTFB3THNRUGxk?=
 =?utf-8?B?UzZMbDhYWDJOckpIT0QvRzdaWGQybEFxTVMxNlJKbE42NU5MSC9iNWFMb29K?=
 =?utf-8?B?aGlCRDVjOTZpZkxjZEtQWXZkSmRoVUdSWHRXZUVJUjh5NU4xczJHUjFMckdU?=
 =?utf-8?B?RzZUMmNDRm9jRk9kck13MmovbGJWdWh3VloyVWM1bXdnU0JXMDB1czJRbmRH?=
 =?utf-8?B?WnI0aW1BNmlZR2Nwa0R3V1huUEp0cndxZXdwL3ZIUnFjQW52cDFQYzFaRjVv?=
 =?utf-8?B?VDgwYWx3VkJuOHViRXo1SDFjeTZXN2RJck4zei9YeFgvdC94cWFqbVY2QWZx?=
 =?utf-8?B?V0g4cXpuMC8zZWd4azNmMHRxSy9Lb2ptd0l6UHd6MUxOR0xaNDRqMldGK0V5?=
 =?utf-8?Q?8D+cgk53DyiAzKhxPOWTEr1gXbFqvjlvGXKu7CwLiQe4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1333d74f-347b-44ec-9c51-08dc9853f78d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 15:55:58.2241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9534

RnJvbTogUGV0ciBUZXNhxZnDrWsgPHBldHJAdGVzYXJpY2kuY3o+IFNlbnQ6IEZyaWRheSwgSnVu
ZSAyOCwgMjAyNCAxMjo0NyBBTQ0KPiANCj4gViBGcmksIDI4IEp1biAyMDI0IDA4OjAxOjI5ICsw
MjAwDQo+ICJoY2hAbHN0LmRlIiA8aGNoQGxzdC5kZT4gbmFwc8Ohbm86DQo+IA0KPiA+IE9uIFRo
dSwgSnVuIDI3LCAyMDI0IGF0IDA0OjAyOjU5UE0gKzAwMDAsIE1pY2hhZWwgS2VsbGV5IHdyb3Rl
Og0KPiA+ID4gPiA+IENvbmNlcHR1YWxseSwgaXQncyBzdGlsbCBiZWluZyB1c2VkIGFzIGEgYm9v
bGVhbiBmdW5jdGlvbiBiYXNlZCBvbg0KPiA+ID4gPiA+IHdoZXRoZXIgdGhlIHJldHVybiB2YWx1
ZSBpcyBOVUxMLiAgUmVuYW1pbmcgaXQgdG8gc3dpb3RsYl9nZXRfcG9vbCgpDQo+ID4gPiA+ID4g
bW9yZSBhY2N1cmF0ZWx5IGRlc2NyaWJlcyB0aGUgcmV0dXJuIHZhbHVlLCBidXQgb2JzY3VyZXMg
dGhlDQo+ID4gPiA+ID4gaW50ZW50IG9mIGRldGVybWluaW5nIGlmIGl0IGlzIGEgc3dpb3RsYiBi
dWZmZXIuICBJJ2xsIHRoaW5rIGFib3V0IGl0Lg0KPiA+ID4gPiA+IFN1Z2dlc3Rpb25zIGFyZSB3
ZWxjb21lLg0KPiA+ID4gPg0KPiA+ID4gPiBKdXN0IGtlZXAgaXNfc3dpb3RsYl9idWZmZXIgYXMg
YSB0cml2aWFsIGlubGluZSBoZWxwZXIgdGhhdCByZXR1cm5zDQo+ID4gPiA+IGJvb2wuDQo+ID4g
Pg0KPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nLiAgQ291
bGQgeW91IGVsYWJvcmF0ZSBhIGJpdD8NCj4gPiA+IGlzX3N3aW90bGJfYnVmZmVyKCkgY2FuJ3Qg
YmUgdHJpdmlhbCB3aGVuIENPTkZJR19TV0lPVExCX0RZTkFNSUMNCj4gPiA+IGlzIHNldC4NCj4g
Pg0KPiA+IENhbGwgdGhlIG1haW4gZnVuY3Rpb24gdGhhdCBmaW5kcyBhbmQgcmV0dW5zIHRoZSBw
b29sIHN3aW90bGJfZmluZF9wb29sLA0KPiA+IGFuZCB0aGVuIGhhdmUgYSBpc19zd2lvdGxiX2J1
ZmZlciB3cmFwcGVyIHRoYXQganVzdCByZXR1cm5zIGJvb2wuDQo+ID4NCj4gDQo+IEkgc2VlLiBU
aGF0J3Mgbm90IG15IHBvaW50LiBBZnRlciBhcHBseWluZyBNaWNoYWVsJ3MgcGF0Y2gsIHRoZSBy
ZXR1cm4NCj4gdmFsdWUgaXMgYWx3YXlzIHVzZWQsIGV4Y2VwdCBoZXJlOg0KPiANCj4gYm9vbCBk
bWFfZGlyZWN0X25lZWRfc3luYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgZG1hX2Fk
ZHIpDQo+IHsNCj4gCXJldHVybiAhZGV2X2lzX2RtYV9jb2hlcmVudChkZXYpIHx8DQo+IAkgICAg
ICAgaXNfc3dpb3RsYl9idWZmZXIoZGV2LCBkbWFfdG9fcGh5cyhkZXYsIGRtYV9hZGRyKSk7DQo+
IH0NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBvbmUgb2NjdXJyZW5jZSBpbiB0aGUgZW50aXJl
IHNvdXJjZSB0cmVlIGlzIHdvcnRoIGENCj4gc2VwYXJhdGUgaW5saW5lIGZ1bmN0aW9uLg0KPiAN
Cj4gSWYgbm9ib2R5IGhhcyBhIGJldHRlciBpZGVhLCBJJ20gbm90IHJlYWxseSBvZmZlbmRlZCBi
eSBrZWVwaW5nIHRoZQ0KPiBvcmlnaW5hbCBuYW1lLCBpc19zd2lvdGxiX2J1ZmZlcigpLiBJdCB3
b3VsZCBqdXN0IGJlY29tZSB0aGUgb25seQ0KPiBmdW5jdGlvbiB3aGljaCBzdGFydHMgd2l0aCAi
aXNfIiBhbmQgcHJvdmlkZXMgbW9yZSBpbmZvcm1hdGlvbiBpbiB0aGUNCj4gcmV0dXJuIHZhbHVl
IHRoYW4gYSBzaW1wbGUgeWVzL25vLCBhbmQgSSB0aG91Z2h0IHRoZXJlIG11c3QgYmUgYW4NCj4g
dW53cml0dGVuIGNvbnZlbnRpb24gYWJvdXQgdGhhdC4NCj4gDQoNClVubGVzcyB0aGVyZSBpcyBm
dXJ0aGVyIGRpc2N1c3Npb24gb24gdGhpcyBwb2ludCwgSSdsbCBqdXN0IGtlZXAgdGhlIG9yaWdp
bmFsDQoiaXNfc3dpb3RsYl9idWZmZXIoKSIgaW4gdjIuDQoNCk1pY2hhZWwNCg==

