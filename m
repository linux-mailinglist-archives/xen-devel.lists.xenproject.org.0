Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6542C83FD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 13:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41079.74205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kji6r-00063L-8U; Mon, 30 Nov 2020 12:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41079.74205; Mon, 30 Nov 2020 12:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kji6r-00062i-4n; Mon, 30 Nov 2020 12:16:49 +0000
Received: by outflank-mailman (input) for mailman id 41079;
 Mon, 30 Nov 2020 12:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBYl=FE=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kji6p-00062H-Tv
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 12:16:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 591ac46f-45b7-48d4-bf2d-89e9cb00ab6e;
 Mon, 30 Nov 2020 12:16:46 +0000 (UTC)
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
X-Inumbo-ID: 591ac46f-45b7-48d4-bf2d-89e9cb00ab6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606738606;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RGaoivVpLl6U9E9xdyq9SBGAoGEAgDGE+pZ5sloPuvA=;
  b=LzxhhegQpZGjd5CmN6XEcLAx3LeJOT6jNPP8zK1onG4A7KLKZwLKVLX8
   EDtrKWh0pcFOc8uuVwba6KXw5gnDPwwJk50H62ZPB1THVy4qWSWwGcfMG
   n97wZjqxqJ5sIVr305fzWqcUd98VvxjXtV7RWmSAV3F6JrP07YuEpr0ed
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6yNIasUQmUag/a5XE8qCNC/aCn0Qjxa9Pdfm3owyTNwYIDbH3QBZZUowFh1cN1+55ZPY/PthP7
 xZvrOxSYBv7tAXpP55oAD5fxMpk8udk7mG8hp8NtdSc5SnAQvyRoVLOmXGP3Wi86ze6SF9feGc
 1Sj++WIMyHgtl1Ah3DtVjgVRaFaznkLVdX9SL5jqsBq3cUtJbd3YioAXSCy6AKOXlfE8iA4s5h
 KuSAG0GGCSZXZP5uhgODyn2/WzoIawjAUngZrqxtKR83wHl7kgdPrddN4sYnjNkILsBy+YyRQu
 Wtk=
X-SBRS: None
X-MesageID: 32122689
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,381,1599537600"; 
   d="scan'208";a="32122689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsT0mKFM1VaMFkeBZNCaa/CCRv9iEVbjFqq5DNQGr0U0ySEHZhvbL+gMqH/dygcWSLmQed0mLEuC8VTmO//aoJUOOgG31gdGIydZxOaqebzf+GSKkTrjZ/1o5mF6tWSu1sO3aCCwUGyoNv+xjqVg84ROw/kB7vEVk3t9yqCWvSdxbkGNEHokjfPMeBLwSch1FHCZ6YsLVqrNVbs+LeaS6xkBJYUrSeoEfV9pZFjEM4AI92HEM0WNI0OKJVO2U938HYEZXlQT9EMM2pdnB5qW5xF/cMP3mE1ZXL/YWiSzPZsOaF1Ubgf3Zv0foOTsn9xpvftGBGp9SLvddX6TooHKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGaoivVpLl6U9E9xdyq9SBGAoGEAgDGE+pZ5sloPuvA=;
 b=bznFUHH+bgdXWjSaYjrlkXoDKdzn5R1FCV6AH97ur3jad2C99RCe8hSKApdsC1Xfgs7tyjXYJE1uTBkNyaCkL5z7rNfPYGjjAYTdb5nDKIIow6Srv+Xbw31FXj+CwDGXsX1IQSHoZbYK+87gRcl6vhGD5FQrOG6y6YT64fG5P+m715HrQXLi59pXVIOPaQnxKr7QNe3dvzmVK92X+6jx0Gnz/ZXgF93bt9UUxwP7l6j4XYjGPh8qqEU5efU1/rhb9jIp6N1DK/mSaUoICZEMEVIje/wsOv+Uq6KAAm1hLXZMv2ih6AaCfPpKlOsKXEbxeO5JKt8JQFgb3E8F2X6KSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGaoivVpLl6U9E9xdyq9SBGAoGEAgDGE+pZ5sloPuvA=;
 b=NoaxjU+z/lcVNoJrfH1wWwVi6taewVEa08+3QLSalitHye2rmTBhM6WrXs6LW0wNwHeErGbFoR+on22DrNlSngh1znmHUoJww3WMq5F9/scJNZWwGZLlfyAu+wEJv4cm4waZQz5nXFCl/uookKwgjOu6ENR82D0n8QiuoI2CIGE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: [ANNOUNCE] Call for agenda items for December 2020 Community Call
 @ 16:00 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for December 2020 Community
 Call @ 16:00 UTC
Thread-Index: AQHWxLPI3g+PARWmhEi8Mt/igt/QK6ngfPmAgAAe7oA=
Date: Mon, 30 Nov 2020 12:16:40 +0000
Message-ID: <49AA35F9-5056-4D42-AE1D-5A478B0CDF7B@citrix.com>
References: <6A1AC739-EB53-4996-A99B-EE68358E70DB@citrix.com>
 <6da4cd56-7364-bc6e-24d8-02976dbd637d@suse.com>
In-Reply-To: <6da4cd56-7364-bc6e-24d8-02976dbd637d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a424b4-9334-4125-91d3-08d89529cb51
x-ms-traffictypediagnostic: BYAPR03MB3638:
x-microsoft-antispam-prvs: <BYAPR03MB36381CCC4AA19ABB994EC0A399F50@BYAPR03MB3638.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bwAHMMaEY6xMU458M2psVxQ2OWiINfYT4hWpgel9tfQIK/JWd5UprMxYRjn4Re7znONmI0Lasfd4Gz8FyVyPAaERaI98AhsKi4mWrI5J+3O2VOoTChn+oGrOoy5Y8fPnOg9lZAHQ5r8FW05tH1AjYsH6NwyKRxkUdT4SJDlznTTs0o0ANXDGBMfwwagCZNfbmhNnbj0a4zqEtg8WtU9O6SwrCltMU7ZlStSPV2XeVdEZwE585wTkc68W1psu3gqTHyET50YBoy45fHe3SFYGUzGYNsqxeCDZcTDBJCt7CQt+meZsrz4xtMtiZ9OpQ6qhI/GbEB4awPvu/V3VwE+y7Sp1ZYPcszAJNN6Yp/erZeYsMPbO904WeVlo7QGoeiHRPTLo5L0LH7NaHEjc2xnPpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(8676002)(5660300002)(55236004)(8936002)(83380400001)(6486002)(33656002)(478600001)(2616005)(2906002)(316002)(966005)(86362001)(6512007)(66446008)(4326008)(64756008)(91956017)(66946007)(66476007)(6916009)(71200400001)(6506007)(36756003)(53546011)(76116006)(66556008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N1kxWDQzOTF0ZmhaWEY4QkYvalpORnc4UzErMlRPK1ZjZHhuV0VlejdHRFlL?=
 =?utf-8?B?aFZXd1A0U2sxSmYvc2hVcStMYTBheEFJcnh2WGU1MnZKMHJBcUVNbDhNRUdq?=
 =?utf-8?B?Qk9ZdUV0dnpqSkVHc2dLTWFyTkszSnk0dUwvWVlvSTg3Q3NiZFBTTmhlWEI0?=
 =?utf-8?B?ZndaZVJYK0NvV0pXVTF3WWtHeE8wc3piTkh0RStDRlZqZ0pjVjhXeDBLT1Ba?=
 =?utf-8?B?dmNjRmZEOTI0Vld6aDFQaFY4R1FnZXNEK3JiM3JyUlMrTDJJRU9hZjcxeDVK?=
 =?utf-8?B?VEdvbnBtK3J4MjdxRG9zMVRMQU9sWkZCdWZuQjhMUWZ1dmx6eC90K284RnBk?=
 =?utf-8?B?SkVTbFZERjBsMExwVURSeEJuZTVwNDhGNGMxamdlZXViYkRsd3FPcGthTjZJ?=
 =?utf-8?B?TDNxcnJMLzVySk96UlgvYytBMkgxbFFvR3JGMUNIY1VrMTg2Y1hmVXhyR21n?=
 =?utf-8?B?eG5IVFJrSm93d0pwaEdXTjF4SUZadmw0dFFpMk9INXY5WVpHbWtxeVRSb0Ni?=
 =?utf-8?B?K2MydGtlWE1uUGJZdzNLTkcySWdWQWZLTE5SMDFmaVpMR0VkWGlWd2p1SGt3?=
 =?utf-8?B?bVIyeXNEbUNjU0FRelhSWUhNZDFTNEg3c3dWV0ZjckZsVkVEWmRJa1ZTQ3Bi?=
 =?utf-8?B?eEVZWkRTVTgyTnVkRGs2WVhreVlBOFJzU1hXTFBNZllEbVlWRkxyNEVkNkZz?=
 =?utf-8?B?UStUdllSU3RLUjdDRCtYMkhPNzFyZDBhZjhBUGJjRHdZUS80ZnRxTE0wOUxI?=
 =?utf-8?B?a0xSc0Uvb2tJdUhJMkd4YnVkMnh2OHYzeG1DMUV6b3NzUXlXeDRDK2pCL2h4?=
 =?utf-8?B?dmVyU0Mzdm81aGhsbWtTNTdUaTZYSmlNZk1qWnZDVU1BVHc1dmNUTWNveHFI?=
 =?utf-8?B?N0o4Z1p6VDdBZmN4VHJPNVJ6ZVQxZEgzY2RZb1pSMTQ1WG9VOFhjamZNcVZx?=
 =?utf-8?B?ODZ6WEpoaXJER2FkSDJVY3VLWStPZWQxZlloYlRqVkIxc0xWWk43TW5mT3Rr?=
 =?utf-8?B?RnBTeEt5b1gxU0dLbE1IdGdmVmxJTHBTdUV0UnkrZERZQVJoMjRyRElmNkpV?=
 =?utf-8?B?ZVlOTTZDK1pUdkU3NW5oMVFxcXMvY1hXeXNnUDBMTjF6M2xMMnUwRnVzS0xh?=
 =?utf-8?B?UDZJb0lHTzZmRG5GZGZuWFgxUXh3bk1OcFRwRmFZUWNrWDdMSXNsamUrYkhz?=
 =?utf-8?B?d1lCcGdWYWo2TlRZaWpiOTJySUYyd01pTVpmR285bTlUcnQvSDhHc0hNZzFS?=
 =?utf-8?B?UUo5RG9sSUxHeDNvZnQ0cTlYSEt2OVlJQng2S3BhTlMvam1nTXUxS0YrYUky?=
 =?utf-8?Q?HN7uVbtnJgS80M8x/Xz9xkJuqScOMy/+Ah?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AAC1EF8C62FC245B4AD6D374600F2C9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a424b4-9334-4125-91d3-08d89529cb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 12:16:40.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAfzS4B8bgTLe5c+hMSY0xQQwmFkVwokbbozt//xzRjVTP3+lhqsYFYeCAXtt5ampnKX2PfdqbiSP+Etz6iOLtwtHDbF8o7fkEFA08ITY7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3638
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTm92IDMwLCAyMDIwLCBhdCAxMDoyNSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI3LjExLjIwMjAgMTI6NTIsIEdlb3JnZSBEdW5s
YXAgd3JvdGU6DQo+PiBUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQu
ZnIvcGFkLyMvMi9wYWQvZWRpdC9PUE41NXJYYU9uY3VwdVd1SHh0ZGR6V0ovIGFuZCB5b3UgY2Fu
IGVkaXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlz
IG1haWwgZGlyZWN0bHkuDQo+IA0KPiBUaGUgIk5ldyBzZXJpZXMgLyBzZXJpZXMgcmVxdWlyaW5n
IGF0dGVudGlvbiIgc2VjdGlvbiBpcyBnb25lLiBXYXMNCj4gdGhpcyBpbnRlbnRpb25hbD8gSWYg
bm90LCBJIHdvdWxkIGhhdmUgd2FudGVkIHRvIHByb3Bvc2UgdGhhdCBpdGVtcw0KPiBmcm9tIHRo
YXQgbGlzdCB3aGljaCB3ZSBkaWRuJ3QgZ2V0IHRvIG9uIHRoZSBwcmV2aW91cyBjYWxsIGJlDQo+
IGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRlZC4gQWNjb3JkaW5nIHRvIG15IG9ic2VydmF0aW9uIGl0
IGlzIG1vcmUNCj4gbGlrZWx5IHRoYW4gbm90IHRoYXQgbm90aGluZyB3b3VsZCBoYXZlIGNoYW5n
ZWQgaW4gdGhlaXIgc3RhdHVzLg0KPiBIZW5jZSBpdCBtYXkgYmUgZWFzaWVyIHRvIHRha2Ugb25l
IG9mZiB0aGUgbGlzdCBpZiBpbmRlZWQgaXQgaGFzDQo+IGdvdCB1bnN0YWxsZWQuDQoNCk9vcHMg
4oCUIEkgbWVhbnQgdG8gZGVsZXRlIHRoZSBjb250ZW50LCBidXQgbm90IHRoZSBoZWFkZXIuDQoN
CkhvcGVmdWxseSDigJxub3QgZ2V0dGluZyB0byB0aGF0IHBhcnQgb2YgdGhlIGNhbGzigJ0gc2hv
dWxkIGJlIHJhcmU7IGJ1dCB5ZXMsIGNvcHlpbmcgaXQgb3ZlciAocGVyaGFwcyB3aXRoIGEgY29s
b3IgdG8gaW5kaWNhdGUgdGhhdCBpdOKAmXMgYmVlbiBjYXJyaWVkIG92ZXIgZnJvbSBsYXN0IHRp
bWUpIHNvdW5kcyByZWFzb25hYmxlLiAgSeKAmWxsIGRvIHRoYXQuDQoNCg0KPj4gIyMgRGlhbCBp
biBkZXRhaWxzDQo+PiBXZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dlb3JnZUR1bmxhcA0K
Pj4gDQo+PiBZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KPj4gQWNjZXNz
IENvZGU6IDE2OC02ODItMTA5DQo+PiANCj4+IENoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4
NA0KPj4gR2VybWFueTogKzQ5IDY5MiA1NzM2IDczMTcNCj4gDQo+IEZyb20gbGFzdCBtb250aCdz
IG1lZXRpbmc6DQo+IA0KPiAgIEdlcm1hbnk6ICs0OSA3MjEgOTg4MSA0MTYxDQoNClRoYW5rcy4g
IEnigJlkIHVwZGF0ZSBpdCBpbiBteSB0ZW1wbGF0ZSwgYnV0IGl0IGxvb2tzIGxpa2UgQ2l0cml4
IGlzIGdvaW5nIHRvIGJlIHN3aXRjaGluZyBhd2F5IGZyb20gR1RNIGFueXdheS4NCg0KIC1HZW9y
Z2U=

