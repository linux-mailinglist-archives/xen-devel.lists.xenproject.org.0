Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02292D0F4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756917.1165654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVkX-0001lB-C0; Wed, 10 Jul 2024 11:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756917.1165654; Wed, 10 Jul 2024 11:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVkX-0001jJ-7k; Wed, 10 Jul 2024 11:44:41 +0000
Received: by outflank-mailman (input) for mailman id 756917;
 Wed, 10 Jul 2024 11:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A5wT=OK=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sRVkV-0001iu-9O
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:44:39 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazolkn190100000.outbound.protection.outlook.com
 [2a01:111:f403:d111::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fe1362-3eb1-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:44:37 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA0PR02MB7484.namprd02.prod.outlook.com (2603:10b6:806:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 11:44:32 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 11:44:32 +0000
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
X-Inumbo-ID: c7fe1362-3eb1-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxDjBA8xvc7P+AEW5lvxIQpqqsmrILSxZ1NnPCysmK1XCwzKppY1IW8BIxpL2OgEzMraSQWbOFyNP3HVvxZppVJgYuwcxdNvf0lbo8ujIHXov90tuUNt2moRIYgigKQJlgRr37P1PRGlaCrEjCa7NCMMrLSxIcyLei8yf/CPWFXRktwvx3j4du5i32u6VbKMNCh505PMaxIPX/FEWoIigspqGXfEnLPCZFiu1CddQcYz/rTNRGk8lDnc6E7eL6sIvzjGYzmp3QAVZ2briuXFMxe89ozarCDn2JuWXp0DU3RBIOEHCt9JxxYco8yH3L+FJsvwlKZtioYVCQEk0BwQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8HcFnU9pa+fJ6q0TvQhpUVKoD56I5flWX6O6rUyvTs=;
 b=hZKSwHFAoH3LLZIVD13AYj/EUnnAFlYUGrpFYVlfCL4vqDHpmmdX2PaFV6FyIAUNaO8a97qqH2KVQSFHweI5DuC358RydqH+bg3QTbFCei4vpWDkn6Q0xoTbrA24jnXpbQ4KycCkUQVCStdjPAl4RLRoD0DjZLfkibNdPftt4YXMNWvPF4G7hoT9rlxSw0wkKsYLIziJhQpZhDyWPoxUs0etWA3yEnLQCZt6Yd/vixgoN+8aSbnOW7ino7sg5ahEWUDb1akxyt2Du0JUowsJYzADiFuDzJhamklt5pY/vYlVNps91FQcnK6nTpbMeVWKv3TSzi7eGfwnL2AED0ewLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8HcFnU9pa+fJ6q0TvQhpUVKoD56I5flWX6O6rUyvTs=;
 b=D5Qxl8cTLBL1SDWujDnMgfdEfusfxoGRMx6+42olxDR7PlJ0iL3vhWIEyRKVIk2M7DMql1wbQ+xHNIyyyu4sSUHN2ELynZ4XOuKLMZWxJ8BP7PtTdNqxDyPb6v6BKohmycGN0pMsrHExsZqKlnH4cc8SEm60Zy7NXb1YSg55nrMU58C+WQ7Ud19iAZA6mhJ/MHgDGwdLHFVh60qDJA+nW0KraPezZE921C2TYM7ZEpvvmMFWd7yV4rax4usMjNWP9Lv+XEaaCcS5pH6mz/tJSMPino8YwRFJDdlDIGQkkV+4v+VcjmowctH5wRRHmn6EUMbicv0R/5Fltm5s6G/zVg==
From: Michael Kelley <mhklinux@outlook.com>
To: =?utf-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, Christoph Hellwig
	<hch@lst.de>
CC: "mhkelley58@gmail.com" <mhkelley58@gmail.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Topic: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Index:
 AQHa0W7SFxxRPYjEqkS2vOXnJ50UvLHuHL6AgAAjwwCAAINYAIAAtMcAgABeFoCAAACIIA==
Date: Wed, 10 Jul 2024 11:44:32 +0000
Message-ID:
 <SN6PR02MB4157E5175E5EF9DEC6E2C610D4A42@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240708194100.1531-1-mhklinux@outlook.com>
	<20240709111013.6103d3f0@mordecai.tesarici.cz>	<20240709111812.GB4421@lst.de>
	<20240709210818.28116c53@meshulam.tesarici.cz>
	<20240710055520.GA25305@lst.de>
 <20240710133205.63858e7a@mordecai.tesarici.cz>
In-Reply-To: <20240710133205.63858e7a@mordecai.tesarici.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [TlaoygzF3ZThHBeuweFr3Sg9q/xQMgfX]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA0PR02MB7484:EE_
x-ms-office365-filtering-correlation-id: 7cd1b7a3-0807-4282-e124-08dca0d5aa56
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 MEDy3K69uQXazN9lV5gUzKmW8aDkSs6cq3VmFZE4do9hSgM4bBXLVt7wgTF9xztGgHY6TjtC/d0aVjNgRsnCI5v9IvB+W4E9tbcdFIhddIDywHhJ+P2GbMY+UU7oERnL4jAVwOYkOgji1Lx9SGOE3R4oA+w/FLHSS0LuUrqEnruTLKrUOA5n/Prn6+TBJRNkBXpG3cmgVgqfGgs6Jdg6WTRcgQZsf2muooKY4T7zPiG90u95E6MnVKly9JdChT0Z91QGfJTAQVpocFGcE1ZWZGekcyXCPbbWnLJCfFBzmG1JQZ1Q2bMu6u7sDz716ur1CE//WQspoD0zV3Z4t56bL0i0xP+5/nUptwQSXK8r2N4BPV85lX2WfuCNd2n7uLsNMxOT06immKCu/wVNsLc4pEvuh/LalADe5ikiFvNvqYV0Ri943EvKRZKwiruEGmHGaafLjf+sXwURihxU9IbAR4LeEuD/idEZEuP2RnUN+liz9A3bVsPDTWq/xGLZxUWxv+DHeu+aIhoyhqN7jnjzMZHt967LEYoU8a1iQwXyTJj5Ch+bvbuDlE5YVbwrvJFEFYBCs90Oko0Q0GS7910tTQoMrWJXX8jCj/2OOckFK4H98QFgqE1wPzXBdDhEULRUTuCbyiuzaUQK3lYkOvZdCQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDVjMldDaHNCRjhNMXVhUGVJamZZU1FMOUhZT1l3QjZqMWpYWEdCV3YzbldD?=
 =?utf-8?B?YkRNazM0WDF5VDRtcm1COEhmZzZlbnhHdFJNRVh1b1hDZ1dyaThwT3U2UVJ4?=
 =?utf-8?B?YjdDdy80UHVMbFN4UGQybzl2ZnNKSDcwbjIvOWx0QTRsMVlQelNRNjExRFhU?=
 =?utf-8?B?d3ZSSlZTYUdhVE1wS1Jkbm9OOFNTbnUvb1pYNkpvRk1FdWZSczRaalJwVXdx?=
 =?utf-8?B?SWhqRmM0Y1lwYU1RWmFWMlc2eUhpbEg4d2hPMVZtUW9LcWQzdWF3eWVWakIz?=
 =?utf-8?B?SUV5UDk0YmZEQ0QxR0FPNnhjbXVxU3htTmVnMmxoYm94b0E1TFVkeE9sUmxI?=
 =?utf-8?B?Q3h6MjROTUJNUmJPZ0dGS1NXUm9HcUJEQWFWMzRFUE1Uc1V4V2xZeHhnL1Bn?=
 =?utf-8?B?OWRnWU5KN0ZPeW9vZUhhYUhxY3dOdm9ucTZCLzlvbWp0aUJZK1Z1WlRJWEpx?=
 =?utf-8?B?SFJpV1J5aHp4eTN0RDBoelc1WUlqVVFzenkzd0N3dCtVemhOVWFqelV1TzRP?=
 =?utf-8?B?WUVVQTJVOUtsaVJRdk5oOWt0aCtpNzUydnpJSjBwRUJMQXhGdXBXNnFmZmVt?=
 =?utf-8?B?OENVUDVUY2R0aDg1UDJ4TU5jTm9jbTRjYjVzRWZNOGdDT2hmcnZtdzR3Ni9x?=
 =?utf-8?B?bVQ5eExGY3crZWtBRzBhZ21OS2JiNXJCZjA4M0lIdlIxZGlQNzcvYjVzc0Jq?=
 =?utf-8?B?MU1oV0dHVDBWRDBtS1p4dU0wOFd6Nm4rcE1vNEIxUjlBZzYwOHBWWE9aWGZ4?=
 =?utf-8?B?cXpVVjY1Z2FXMTRMdU83QkxuYWoraitnbmxMdi9jbkZrOGJibzdWRmRwM2s0?=
 =?utf-8?B?TjBqSnE4OVRhMWZwS3JLcURPY1JXb1E0U1N2a2NNcHhiOVYzaEdob0ZzQUVu?=
 =?utf-8?B?RkdING9RVzV0U1ZiL09BZEw2dndNMlNOME9nN0Z5ZHdBcE03eXRBRm1YSDFw?=
 =?utf-8?B?NXBPY3A4MDNqUVBmZ0cxN0hhTm95b1NBUFoxUjBBTExXRXZoTDhxWVBKVUdZ?=
 =?utf-8?B?WEpxbUdsMlE2RDVVL1RkSzZwQzNieTUyR0M4VHV5VkRZWWFha3RDdSsvcHJL?=
 =?utf-8?B?K1htbHV3WUZrNTkweTN6cFYrVGlaR1ZQUm5BVFFoa1ovajRFWTNxdHNjQ08v?=
 =?utf-8?B?ZlNVZnlzZW9sR29KWUVvYmd4Zm52LytFc2dNb3F3c0JGRFVZb3UxMkVtY0ls?=
 =?utf-8?B?cUlHSlFpS0tRYkZRUE04TkNDMXlTeHVCcEh4NHpxSldJb2F5Q0sxUFNuSEEv?=
 =?utf-8?B?UWxzM1RMbGtVbllxR3BOU21aWEVGRW5raUJ5MDhSS3lqWURhSnFCNHB4NWt0?=
 =?utf-8?B?dit5Z3krNXBqNm8xVlBoTnRvSUc5em4vaHVEb1FnNHI0dFNnTGExemJxMEc1?=
 =?utf-8?B?QnBMaXZJQ2ptdENhTEdvbnBnS3o5TEZHcnpSVllDTHhVNGEyeWV3VTlvSUpS?=
 =?utf-8?B?MXpQc2VTVVppMmFRTUhEVVVDMnV0UTB5T0s3K010cnZjR2o3anBjNGtISUkx?=
 =?utf-8?B?TEpvcDhrN1JvZGp5dHd0SXFnSURUc2hLWDRzcmtGK2RhMVZzeWFodllnZmZv?=
 =?utf-8?B?aHdGU2M4R3loeTdjaUZoaTQ3NzRmL3NqZ1NvVVdkSUdQeGMvSzIxYUI4ejVY?=
 =?utf-8?Q?NWM0aAeXCjnKXyCePPUssR+CcCZ08vcO1uCR1ZgE+x04=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd1b7a3-0807-4282-e124-08dca0d5aa56
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 11:44:32.5727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7484

RnJvbTogUGV0ciBUZXNhxZnDrWsgPHBldHJAdGVzYXJpY2kuY3o+IFNlbnQ6IFdlZG5lc2RheSwg
SnVseSAxMCwgMjAyNCA0OjMyIEFNDQo+IA0KPiBPbiBXZWQsIDEwIEp1bCAyMDI0IDA3OjU1OjIw
ICswMjAwDQo+IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToNCj4gDQo+ID4g
T24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDk6MDg6MThQTSArMDIwMCwgUGV0ciBUZXNhxZnDrWsg
d3JvdGU6DQo+ID4gPiBJJ20gY29uZnVzZWQuIElmIHlvdSdyZSBub3QgYSBiaWcgZmFuLCB3aHkg
YXJlIHdlIGVmZmVjdGl2ZWx5IGFkZGluZw0KPiA+ID4gdGhlbSB0byBtb3JlIHBsYWNlcyBub3cg
dGhhbiBiZWZvcmUgdGhlIHBhdGNoPw0KPiA+DQo+ID4gQmVjYXVzZSBJIGRpZG4ndCB3YW50IHRv
IHNlY29uZCBndWVzcyB0aGUgcGF0Y2ggYXV0aG9yIHRvbyBtdWNoLg0KPiANCj4gRmFpciBlbm91
Z2guIEkgZG9uJ3QgaGF2ZSBhbnkgcmVsZXZhbnQgdGVzdCBjYXNlcyBlaXRoZXIsIHNvIHdoZW4v
aWYNCj4gc29tZWJvZHkgZW5jb3VudGVycyBhbiBpc3N1ZSwgbGV0IHRoZW0gY2hhbmdlIGl0IHRo
ZW4uDQo+IA0KDQpXb3JrcyBmb3IgbWUuIEZXSVcsIEkgZG9uJ3QgaGF2ZSBhIHByZWZlcmVuY2Ug
ZWl0aGVyIHdheS4gSSB3YXMgdHJ5aW5nDQp0byBjYXJyeSBvdmVyIHRoZSBleGlzdGluZyBvY2N1
cnJlbmNlcyBvZiB1bmxpa2VseSgpIGFuZCBub3QgdG8gaW50cm9kdWNlDQpncmF0dWl0b3VzIGFu
ZCB1bnJlbGF0ZWQgY2hhbmdlcy4gQnV0IGJlY2F1c2Ugb2YgdGhlIGluY29uc2lzdGVuY2llcyBp
bg0KdGhlIHVzZSBvZiB1bmxpa2VseSgpIGluIHRoZSA5IG9jY3VycmVuY2VzIHRoYXQgd2VyZSBj
b2xsYXBzZWQgaW50byAzDQp3cmFwcGVycywgc29tZSBjaGFuZ2Ugd2FzIHVuYXZvaWRhYmxlLiBJ
IGRpZCBub3QgZG8gYW55IGFuYWx5c2lzIG9mDQp0aGUgZ2VuZXJhdGVkIGNvZGUgd2l0aCBhbmQg
d2l0aG91dCB1bmxpa2VseSgpIHRvIG1ha2UgYSBkZWNpc2lvbi4NCg0KTWljaGFlbA0K

