Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8A25D6CD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9G9-0003av-MQ; Fri, 04 Sep 2020 10:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0SP=CN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kE9G8-0003aq-L3
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:47:56 +0000
X-Inumbo-ID: 90971116-ff90-4cc7-bcab-3ff6759903c4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90971116-ff90-4cc7-bcab-3ff6759903c4;
 Fri, 04 Sep 2020 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599216474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RYyozOLjpOU+gJ42witiOyCmYMbffO1o2txKjOkJ6is=;
 b=MSsWiXBLVP8zVeGxkDINDB5/9MOnHogd3cNOnM6eoWilHEbc8lQJYkq+
 udqX7omwHTwidMFFXnndpKAFn1g3yK92AV3xLioG756yk0oCWQDpR/2f+
 dYPjisWPdGWA0L2qzkDC4Kg157a8Q6ARClvoiLehvNb6Zx3g8Iu9zmE/e E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: r+CJ+e92EsKX5rWseRcSQIU+fzWNgvF6NhCxoVwKOU1xVTYERx92RvhNOU4wJklIZ8RR4EbutR
 7jEaFw8daNkHlSZ/XrhJ3Ud9uVo7n5BiBrBoWs2Brz3dwUmrRHAQPrZ4LjCxRsYyKAEyjdjrN8
 E1DJc2iJSvfnL8fkoNHlEoQn8lp/nSpCco1t/UzbpZ9jyztsAdj6H7+aoWin4IMvN6Ww0KSsNI
 mTxajEfd/S9DdFgfWgEB8gb5mWg1Gexz9ZkpL1yBE1KcgVB0K5GsPN9UfXYxnfPX0ktwxVaVj/
 Y/k=
X-SBRS: 2.7
X-MesageID: 25981502
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="25981502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB3/yzw8fp0KZqj28P9BtV26NG3+fffacIGAlxnS0HGx/NyKpNZxKSlylci8jDVbFI796RtukiiorHplTUuY1hniBsYEtjT5pezkZwrgGbnjFWj0suMI3ZdV5mnPOvO0SgPdJzgVOVJsgHDE5ZKQ77ONSC3u/x+7aovMkglyPppOD+LkNLCQl/QBtrYNPHFpuOjn+Ez/wbkZGbiE+acxu8sTpFYnVvS4yvf+E866ANBMR5dJEd7Y+ni1x6lPN6t6br5QeRDrPMa6KpeBKYdeRrVQKK0Lv7g58Z15dAY4ArTdocEi3dxBYELuQrrjRmDLuIyCH3WOrBCcdqoLu0a9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYyozOLjpOU+gJ42witiOyCmYMbffO1o2txKjOkJ6is=;
 b=F7zSB6bZ4FiE/6AJwbCdFWaGxrtq3pgqq0RlN2LefyQzlS3cZiZ0GsW4k9in1GiWLKv0Yp+Z5LiFhCBYFfk/xzlpxALkms3A+o7bsR76YVd4CJBzrlYMwA8yOZl7c6Sllk/AL1eomrw9Vx8EvvOZpkriRdrFFAsXKyH4gyPSmlmt6gEOR51J2D6NtOeneqZsjzPB7XIO9XqagL6cOsF/dxVDetVlytFjTUycTygG+OZpAUkBVNK5xV2/zkOYgcMrfxgtjKGVpG9OppxUvNH9Kr56jl++K1uBJuuguBXIpDkz1QLbq03e61FR31MfJQ1vIOUX32gDfw9s62OImvRz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYyozOLjpOU+gJ42witiOyCmYMbffO1o2txKjOkJ6is=;
 b=g50nUCp4Nx4H/Hn0G0M9Zr8OGRPearCGiQ6BfdI+m/6i54YK1ETzPVdcZ+2ee9ZsWduwN69wwZIlvPQPDy5kfGIzNjhJvvq2UN1vJy1RSO9guIkxR6kx8x6ZyM5SQLTJS3k3RH5bg019f14PnnNQqFasOvQVVC6tj9jCplYMYVk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQhHT7mTtQgECZKsLV4pzAaalYRMuAgAAHmgA=
Date: Fri, 4 Sep 2020 10:47:48 +0000
Message-ID: <45CECAE8-2E29-435F-BE2C-5F00A2AD9A9D@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
In-Reply-To: <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dabd71c-2e34-4b49-cd0b-08d850bff73a
x-ms-traffictypediagnostic: SJ0PR03MB5581:
x-microsoft-antispam-prvs: <SJ0PR03MB5581C868804F2FB23C4AF98B992D0@SJ0PR03MB5581.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1C5R3W1SZZ6+5AIqlR1sppt0uJKZyFwGehTc6PQphczNT1cORBhwU4s//kU5M3EjOKOQ1hMOHgZgluOpUAoFXpZ9S0/IYvEa2h2vb6brijDHuO5yOIotNlCJbXWQ44VxaM9tlhIf0KSRLeOw5vlcCsXUrH70s1Wb+BKOKrpl5P7BX/TqdDq6EgZNNDAjcQqSVgFp8xTtXRkedkwI1+3J+HdncZbYUuEkUxV5ImVLZ7TmLXpzwETOW9YA5+dCH3uW+9DErzouYcbCRUlZ5OL1F8dssO6JPpfNUQiI4glWuJGBtY5HVxmUTehXqxbNdDVhGu70I8Sf/I0uWW46R+wZK6WsTtxOYu1KvCmbO32v3J4qrGWgdOudG0C9zk4U0ciized/PZxUGGVmwuWQmKuC1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(26005)(55236004)(6916009)(5660300002)(36756003)(186003)(53546011)(6486002)(66476007)(478600001)(2906002)(66946007)(966005)(66556008)(91956017)(64756008)(83380400001)(6506007)(76116006)(66446008)(33656002)(8936002)(86362001)(6512007)(4326008)(316002)(8676002)(2616005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Yn+Q4uStPPg6XLk6UmEsBqu4f2OzxiwXaITzpfSIaf8gJTvxcy1K/x3ccDiWq2FTUXewz+qCwJtyk3UBDYm2WDPDtCQy3SwDVMouZ2FVL3wjkTzDAqF+EGGfsDtNgMmWoQIGldZEwW5Mv1dR9DBRlKPvX4JP+RtTqApYEJS8/mZjjcfYgxYoFNSLEkXlGDxphS2aR6ULR29KV7Yz3BUQeNuQLUwX2DSClKFCJeEyWTJAmDPu3malTHOCVs2qVzTEUXW6caHinRDKBOHNjVBBodN0izkkUCcui7GpVrEOhgRMpJhZVqLziRBLi1gIXpOzYO3kCjEtbeX67p7n4VkyV/5b+MAwQECyGxHihP4ln/VenUs5gnI7EfmiCzxhj9IC9KTVXMA/r9od+zt/PT2C48MjeTwEGsZbG3ZYSovzfHx+Y9bOVMn9zrdyt6Bw9hUd4ZGQ9qsWCuK42AYOVZZGPEEuBdBD3nYdYuxJsb4nq2ljDgmU9czUr9qAPcTx68Q4TeMFIibR2FgZNHXZy3qwetI/iDc13uBDy2C0NgaGmWfPpGseGPJM3XY9SZEtE6QyRVvDnNlUnj2UB+dO/plM9ubMPonmVbEawEMLAakZKjI8yjDMgh4knCoYj3dsG0dlh9qTACjG8qQRb6kOqg9ONA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F1C5AEAD1642B4DAC2D5CA1CA323853@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dabd71c-2e34-4b49-cd0b-08d850bff73a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 10:47:48.8157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAXaHJHvk0ze69Har+eYBMYkurSJ1uF/nDwjuLeHwM3Y0MpGrw8S4oMxNmvuCM5D0M5D6LLkL3TZZBVN44Egu7gvz7bQID2tWB9MWBSqwMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5581
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDQsIDIwMjAsIGF0IDExOjIwIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDQuMDkuMjAyMCAxMTo1NCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IEF0IHRoZSBjb21tdW5pdHkgY2FsbCBsYXN0IG1vbnRoIGFzIHdlbGwgYXMg
dGhpcywgd2UgZGlzY3Vzc2VkIHdoZXRoZXIgdG8gY29udGludWUgdGhlIOKAnEdpdGxhYiBleHBl
cmltZW504oCdLiAgSXQgd2FzIGdlbmVyYWxseSBhZ3JlZWQgdGhhdCByZXZpZXdpbmcgSnVlcmdl
buKAmXMgbG9uZyBzZXJpZXMgd2FzIGZhaXJseSBzdWItb3B0aW1hbCwgYW5kIHRoYXQgZW1haWwg
d2FzIG1vcmUgc3VpdGVkIHRvIHRoYXQgc29ydCBvZiBzZXJpZXMuDQo+PiANCj4+IFRoYXQgc2Fp
ZCwgdGhlcmUgd2FzIGdlbmVyYWwgYWdyZWVtZW50IHRoYXQgcmVxdWlyaW5nIGFsbCBwYXRjaGVz
IHRvIGdvIHRocm91Z2ggZW1haWwgd2FzIGdvaW5nIHRvIGxpbWl0IGNvbnRyaWJ1dGlvbiwgcGFy
dGljdWxhcmx5IG9mIG9uZS1vZmYg4oCcZHJpdmUtYnnigJ0gY29udHJpYnV0aW9ucy4gIEFzIHN1
Y2gsIGl0IHdhcyBwcm9wb3NlZCB0aGF0IHdlIGNvbnNpZGVyIGFsbG93aW5nIGJvdGggR2l0bGFi
IFBScywgYW5kIGVtYWlsOiB0aGF0IGZvciBvbmUtb2ZmIG9yIHNob3J0IHNlcmllcywgR2l0bGFi
IFBScyB3b3VsZCBiZSBhY2NlcHRlZCwgYnV0IHRoYXQgZm9yIGxvbmdlciBzZXJpZXMgYW5kL29y
IGxvbmdlciB0ZXJtIGNvbnRyaWJ1dG9ycywgd2Ugd291bGQgZW5jb3VyYWdlIHBlb3BsZSB0byBz
d2l0Y2ggdG8gcGF0Y2hib21iaW5nIHRoZSBtYWlsaW5nIGxpc3QuDQo+PiANCj4+IFdlIGRlY2lk
ZWQgdG8gY29udGludWUgdGhlIOKAnEdpdGxhYiBFeHBlcmltZW504oCdLCBidXQgd2l0aCBzaG9y
dCBQUnMuICBBcyBzdWNoLCBBbmR5IENvb3BlciBoYXMgcG9zdGVkIHR3byBQUnM6DQo+PiANCj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vLS9tZXJnZV9yZXF1ZXN0cy8yDQo+
IA0KPiBUaGlzIGxvb2tzIHRvIGJlIGNvbmZ1c2luZywgdG8gbWUgYXQgbGVhc3QuIEZvbGxvd2lu
ZyB0aGlzIGxpbmsgSQ0KPiBjYW4ndCBzZWUgdGhlIGFjdHVhbCBjaGFuZ2UgZGlyZWN0bHkuIEZv
bGxvd2luZyBlaXRoZXIgb2YgdGhlIGxpbmtzDQo+IGFmdGVyICJSZXF1ZXN0IHRvIG1lcmdlIiBn
aXZlcyBhIDQwNCBlcnJvciAoYWZ0ZXIgZ2l0bGFiIG5vdCBiZWluZw0KPiBhYmxlIHRvIHNpZ24g
bWUgaW4gdmlhIEdvb2dsZSwgYnV0IHRoZW4gYmVpbmcgYWJsZSB0byBzaWduIG1lIGluDQo+IHZp
YSBnaXRodWIpIG9uIGJvdGgNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9w
ZW9wbGUvYW5keWhocC94ZW4NCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3Bs
ZS9hbmR5aGhwL3hlbi8tL3RyZWUveGVuLXB2LXNlZ2Jhc2UNCj4gDQo+IFRoZXJlJ3MgYWxzbyBh
biBlbmRsZXNzbHkgY2lyY2xpbmcga2luZC1vZi1pY29uIG5leHQgdG8gIkNoZWNraW5nDQo+IHBp
cGVsaW5lIHN0YXR1cyIsIGluZGljYXRpbmcgdG8gbWUgdGhlIHBhZ2UgdHJpZXMgdG8gbG9hZCBz
b21lDQo+IGluZm9ybWF0aW9uLCBidXQgY2FuJ3QgcXVpdGUgY29tcGxldGUgZG9pbmcgc28uDQoN
Ckl0IHNvdW5kcyBsaWtlIHdlIGNvdWxkIHVzZSBhIOKAnEdpdGxhYiBmb3IgZ2l0LXNlbmQtZW1h
aWwgdXNlcnPigJ0gZ3VpZGUuIDotKQ0KDQpJIGhhdmVu4oCZdCB1c2VkIGEgUFIgc3lzdGVtIGV4
dGVuc2l2ZWx5LCBidXQgaXQgc2VlbXMgbGlrZSBmb3IgbW9zdCBQUi1iYXNlZCBzeXN0ZW1zIHRo
ZXJl4oCZcyBsZXNzIGFuIGVtcGhhc2lzIG9uIHJldmlld2luZyBlYWNoIGluZGl2aWR1YWwgY29t
bWl0LCBhbmQgbW9yZSBvZiBhbiBlbXBoYXNpcyBvbiBzZWVpbmcgdGhlIGVmZmVjdCBvZiBhbGwg
dGhlIGNvbW1pdHMgdG9nZXRoZXIuICBUaGF0IGN1bHR1cmUgYWZmZWN0cyBob3cgdGhlIHRvb2xz
IGFyZSBkZXNpZ25lZC4NCg0KU28gaWYgeW91IGdvIHRvIHRoZSBtZXJnZSByZXF1ZXN0LCBqdXN0
IHVuZGVyIHRoZSB0aXRsZSB0aGVyZSBhcmUgc29tZSB0YWJzLiAg4oCcQ29tbWl0c+KAnSB3aWxs
IGdpdmUgeW91IGEgbGlzdCBvZiBhbGwgdGhlIGluZGl2aWR1YWwgY29tbWl0cy4gIOKAnENoYW5n
ZXPigJ0gd2lsbCBzaG93IHlvdSBhIGdyYXBoaWNhbCBkaWZmIG9mIGFsbCB0aGUgY2hhbmdlcyBp
biB0aGUgc2VyaWVzIHRvZ2V0aGVyLg0KDQpUaGUgVUkgZm9yIHRoZSBwaXBlbGluZSBmYWlsdXJl
IGlzIGRlZmluaXRlbHkgc3ViLW9wdGltYWwgYXQgdGhlIG1vbWVudC4gIFRoZSBiZXN0IHdheSB0
byBzZWUgdGhlIHBpcGVsaW5lIGZhaWx1cmUgaXMgdG8gZWl0aGVyIGNsaWNrIHRoZSByZWQgY2ly
Y2xlZCBYLCBvciB0aGUgcGlwZWxpbmUgbnVtYmVyIGxpbmsuICBGb3IgbWUgdGhhdCBwcmV0dHkg
cXVpY2tseSBzaG93cyB1cCBhIGxpc3Qgb2YgdGhlIENJIGJ1aWxkcyBhbmQgdGVzdHMsIHdpdGgg
dGhlIGZhaWxlZCBvbmVzIGhpZ2hsaWdodGVkIGluIHJlZC4NCg0KT25lIG90aGVyIHN1Yi1vcHRp
bWFsIHRoaW5nIGF0IHRoZSBtb21lbnQgaXMgdGhhdCB0aGUgdGVzdGluZyBzZWVtcyB0byBiZSBk
b25lIG9mZiBvZiBBbmR54oCZcyB0cmVlOyBzbyBpZiB5b3UgY2xpY2sgdGhlIHBpcGVsaW5lLCB5
b3UgZW5kIHVwIG9uIGEgZGlmZmVyZW50IHRyZWUsIGFuZCBzdWRkZW5seSB0aGUg4oCcbWVyZ2Ug
cmVxdWVzdHPigJ0gdGFiIG9uIHRoZSBsZWZ0IGRvZXNu4oCZdCBzaG93IGFueSBtZXJnZSByZXF1
ZXN0cyBhbnkgbW9yZTsgeW91IGhhdmUgdG8gY2xpY2sgYXJvdW5kIHRvIGdldCBiYWNrIHRvIHRo
ZSBtYWluIHRyZWUuICBQcmVzdW1hYmx5IHRoYXTigJlzIHNvbWV0aGluZyB3ZSBjb3VsZCBjaGFu
Z2UuDQoNCj4gSSBhbHNvIHdvbmRlciBob3cgb25lIGlzIHRvIGJlY29tZSBhd2FyZSBvZiBwZW5k
aW5nIG1lcmdlIHJlcXVlc3RzLg0KPiBGb3IgdGhlIG9uZXMgaGVyZSwgeW91ciBtYWlsIHdhcyB0
aGUgb25seSBpbmRpY2F0aW9uIHNvIGZhciB0aGF0DQo+IHRoZXkgZXhpc3RlZC4gSSBob3BlIHRo
ZSBhbnN3ZXIgdG8gdGhpcyBpcyBub3QgZ29pbmcgdG8gYmUgdG8gcG9sbA0KPiBnaXRsYWIuY29t
LiBJJ20gc29ycnkgaWYgSSdtIG1ha2luZyBuZXdiaWUgbWlzdGFrZXMgb3IgYXNzdW1wdGlvbnMN
Cj4gaGVyZSwgYnV0IGFzIGZhciBhcyBnaXRsYWIgZ29lcyBJJ20gYWZyYWlkIEkgYW0uDQo+IA0K
PiBBcyBpdCBzdGFuZHMgSSdtIGFmcmFpZCBJJ2xsIGJlIGFibGUgdG8gc2VlIHdoYXQgaXMgcHJv
cG9zZWQgdG8gYmUNCj4gY29tbWl0dGVkIChhbmQgYWZhaWNzIGFsc28gYXBwcm92ZWQgYWxyZWFk
eSkgb25seSB3aGVuIGl0IGhpdHMgdGhlDQo+IHN0YWdpbmcgdHJlZS4NCg0KV2VsbCBvbmUgc2lt
cGxlIHRoaW5nIHRvIGRvIGlzIGF0IHRoZSB0b3Agb2YgdGhlIFhlblByb2plY3QsIG5leHQgdG8g
dGhlIOKAnFN0YXLigJ0gYW5kIOKAnEZvcmvigJ0gYnV0dG9ucywgdGhlcmXigJlzIGEgYmVsbCBp
Y29uIHdpdGggYSBkcm9wZG93biBtZW51LiAgWW91IGNhbiBjbGljayB0aGUgZHJvcGRvd24gYW5k
IHNlbGVjdCDigJxjdXN0b23igJ0uICBJ4oCZdmUganVzdCBzZXQgaXQgdG8gZW1haWwgbWUgd2hl
biB0aGVyZeKAmXMgYSBuZXcgbWVyZ2UgcmVxdWVzdC4NCg0KSWYgdGhlIHZvbHVtZSBvZiBwYXRj
aGVzIGluY3JlYXNlcyAob3IgaWYgZmlsdGVyaW5nIGJlY29tZXMgbW9yZSBvZiBhbiBpc3N1ZSks
IHRoZW4gd2UgbWlnaHQgYWRkIGEgYm90IHRvIGxvb2sgYXQgdGhlIGNvbnRlbnRzIG9mIHRoZSBw
YXRjaCBhbmQgdGFnIHRoZSBhcHByb3ByaWF0ZSBwZW9wbGUgKHBlcmhhcHMgZXh0ZW5kaW5nIE1B
SU5UQUlORVJTIHRvIGluY2x1ZGUgZ2l0bGFiIHVzZXJuYW1lcyBvciBzb21ldGhpbmcpLg0KDQpJ
dOKAmXMgY2VydGFpbmx5IGRpZmZlcmVudCwgYnV0IEkgdGhpbmsgaXTigJlzIHdvcnRoIGdpdmlu
ZyBhIGdvb2QgdHJ5IGJlZm9yZSB3ZSBkZWNpZGUgdG8gcmVqZWN0IGl0Lg0KDQogLUdlb3JnZQ==

