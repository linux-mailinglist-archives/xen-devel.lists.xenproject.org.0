Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A59D16126A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:59:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fxJ-0000uK-K1; Mon, 17 Feb 2020 12:56:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4oX=4F=amazon.co.uk=prvs=30915cffa=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3fxH-0000uF-K9
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:56:55 +0000
X-Inumbo-ID: f9619480-5184-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9619480-5184-11ea-b0fd-bc764e2007e4;
 Mon, 17 Feb 2020 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581944215; x=1613480215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=APPTU3QCPgh5WppRkbWDo4WDPzL9lpa7ht2ScjPhS4w=;
 b=q33SIo8hFpZ8a+hVsy/S9CeDaC8ueEvKk+xNcTx/h9odmXuyrh2hQNSm
 Rf5zx1FIYQ1fgm0ZvSAXdqbTzUT9wk9egLRjnpsdqnuzxSJ21T9NzqDBb
 4ISjekDVa/UPKNB6k285Z1SEvXH3NBZQtmsreYlUxDjTaYTuWQZjf6Npg M=;
IronPort-SDR: XAFSb/+4fQYNLFSrAjCX0EjVlBnBvl8ClEzXvo4CAcj5D/Fjrl3uqWlEEjt0IMFwI2fYgdctnX
 4RG3+BUA3eSA==
X-IronPort-AV: E=Sophos;i="5.70,452,1574121600"; d="scan'208";a="17499596"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 17 Feb 2020 12:56:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id A5A84A26DB; Mon, 17 Feb 2020 12:56:42 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 17 Feb 2020 12:56:42 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 12:56:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 17 Feb 2020 12:56:41 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Thread-Index: AQHV4zM1ogAqmhu8Uk+hk4DrI15YB6ga58mggAReTYCAAAGhgIAABWowgAACU4CAAANjsIAAB9uAgAABmlA=
Date: Mon, 17 Feb 2020 12:56:40 +0000
Message-ID: <7a3c4fa944ad4012a3d36a45b0776067@EX13D32EUC003.ant.amazon.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian> <20200217114031.GF4679@Air-de-Roger>
 <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
 <20200217120813.GH4679@Air-de-Roger>
 <f712911e0b344bb1a260652b96260363@EX13D32EUC003.ant.amazon.com>
 <20200217124827.crnzaukfbnk5yxgw@debian>
In-Reply-To: <20200217124827.crnzaukfbnk5yxgw@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.60]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>, Xen
 Development List <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMTcgRmVicnVhcnkgMjAyMCAxMjo0OAo+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFhlbgo+IERldmVsb3BtZW50IExpc3QgPHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IE1pY2hhZWwgS2VsbGV5Cj4gPG1pa2VsbGV5
QG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxp
Y2gKPiA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSB4ODYvaHlwZXJ2OiBza2Vs
ZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gCj4gT24gTW9uLCBGZWIgMTcsIDIwMjAg
YXQgMTI6MjE6MDlQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gPiA+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjAgMTI6MDgKPiA+ID4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiA+ID4gQ2M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQo+ID4gPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29t
PjsKPiBXZWkKPiA+ID4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3Cj4gQ29vcGVyCj4gPiA+IDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10geDg2L2h5cGVydjog
c2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQgo+IGZsdXNoCj4gPiA+Cj4gPiA+IE9uIE1vbiwg
RmViIDE3LCAyMDIwIGF0IDEyOjAxOjIzUE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4g
PiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gRnJvbTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gPiBTZW50OiAxNyBGZWJy
dWFyeSAyMDIwIDExOjQxCj4gPiA+ID4gPiBUbzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+ID4g
PiA+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBYZW4gRGV2ZWxv
cG1lbnQgTGlzdAo+IDx4ZW4tCj4gPiA+ID4gPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47
IE1pY2hhZWwgS2VsbGV5Cj4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Owo+ID4gPiBXZWkKPiA+
ID4gPiA+IExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT47IEFuZHJldwo+ID4gPiBDb29wZXIKPiA+ID4gPiA+IDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIHg4Ni9oeXBl
cnY6IHNrZWxldG9uIGZvciBMMCBhc3Npc3RlZAo+IFRMQgo+ID4gPiBmbHVzaAo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDExOjM0OjQxQU0gKzAwMDAsIFdlaSBM
aXUgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0IDA0OjU1OjQ0UE0g
KzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gPiA+ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5A
Z21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQo+ID4gPiA+ID4gPiA+ID4gU2VudDogMTQg
RmVicnVhcnkgMjAyMCAxMzozNAo+ID4gPiA+ID4gPiA+ID4gVG86IFhlbiBEZXZlbG9wbWVudCBM
aXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gPiA+ID4gPiA+ID4gPiBDYzog
TWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBEdXJyYW50LCBQYXVsCj4g
PiA+ID4gPiA+ID4gPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFdlaQo+IExpdQo+ID4gPiA+ID4gPiA+ID4gPHdsQHhlbi5vcmc+OyBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA+ID4gPiA+ID4g
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPiA+ID4gPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiA+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIv
M10geDg2L2h5cGVydjogc2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkCj4gVExCCj4gPiA+ID4gPiBm
bHVzaAo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEltcGxlbWVudCBhIGJhc2ljIGhv
b2sgZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaC4gVGhlIGhvb2sKPiBuZWVkcwo+ID4gPiB0bwo+
ID4gPiA+ID4gPiA+ID4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFy
ZSBub3QgbWV0LCBpdAo+IHJldHVybnMKPiA+ID4gYW4KPiA+ID4gPiA+IGVycm9yCj4gPiA+ID4g
PiA+ID4gPiBudW1iZXIgdG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVzaGVzLgo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0
ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcwo+IHJlYWR5Lgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiA+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlICB8ICAxICsKPiA+ID4gPiA+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jICB8IDE3ICsrKysrKysrKysrKwo+ID4gPiA+ID4gPiA+ID4gIHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgIDQgKysrCj4gPiA+ID4gPiA+ID4gPiAgeGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MQo+ID4gPiA+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYz
IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gPiA+ID4g
PiA+ID4gPiBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ID4g
PiA+IGluZGV4IDY4MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiAt
LS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gPiAr
KysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gPiBA
QCAtMSArMSwyIEBACj4gPiA+ID4gPiA+ID4gPiAgb2JqLXkgKz0gaHlwZXJ2Lm8KPiA+ID4gPiA+
ID4gPiA+ICtvYmoteSArPSB0bGIubwo+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiA+IGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gPiA+ID4gaW5kZXggNzBmNGNkNWFl
MC4uZjlkMWYxMWFlMyAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiA+IEBAIC0zMyw2ICszMyw4IEBAIERF
RklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwKPiA+ID4gaHZfaW5wdXRfcGFnZSk7Cj4g
PiA+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9h
c3Npc3QpOwo+ID4gPiA+ID4gPiA+ID4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2ln
bmVkIGludCwgaHZfdnBfaW5kZXgpOwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ICtz
dGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IGh2X2hjYWxsX3BhZ2VfcmVhZHk7Cj4gPiA+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ID4gPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lk
KHZvaWQpCj4gPiA+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+ID4gICAgICB1bmlvbiBodl9n
dWVzdF9vc19pZCBpZCA9IHt9Owo+ID4gPiA+ID4gPiA+ID4gQEAgLTExOSw2ICsxMjEsOCBAQCBz
dGF0aWMgdm9pZCBfX2luaXQKPiA+ID4gc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ID4g
PiA+ID4gPiA+ICAgICAgQlVHX09OKCFoeXBlcmNhbGxfbXNyLmVuYWJsZSk7Cj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gICAgICBzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxM
LCBtZm4gPDwgUEFHRV9TSElGVCk7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTaG91bGRu
J3QgdGhpcyBoYXZlIGF0IGxlYXN0IGEgY29tcGlsZXIgYmFycmllciBoZXJlPwo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9LLiBJIHdpbGwgYWRkIGEgd3JpdGUgYmFycmll
ciBoZXJlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhtLCBzaG91bGRuJ3Qgc3VjaCBiYXJyaWVyIGJl
IHBhcnQgb2Ygc2V0X2ZpeG1hcF94IGl0c2VsZj8KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBO
b3QgcmVhbGx5LCBmb3IgdGhlIHB1cnBvc2UgSSBoYWQgaW4gbWluZC4gVGhlIGh2X2hjYWxsX3Bh
Z2VfcmVhZHkKPiA+ID4gZ2xvYmFsIGlzIHNwZWNpZmljIHRvIHRoaXMgY29kZSBhbmQgd2UgbmVl
ZCB0byBtYWtlIHN1cmUgdGhlIHBhZ2UgaXMKPiA+ID4gYWN0dWFsbHkgcmVhZHkgYmVmb3JlIHRo
ZSBjb2RlIHNheXMgaXQgaXMuCj4gPiA+Cj4gPiA+IEJ1dCBhbnl0aGluZyB0aGF0IG1vZGlmaWVz
IHRoZSBwYWdlIHRhYmxlcyBzaG91bGQgYWxyZWFkeSBoYXZlIGEKPiA+ID4gYmFycmllciBpZiBy
ZXF1aXJlZCBpbiBvcmRlciB0byBwcmV2ZW50IGFjY2Vzc2VzIGZyb20gYmVpbmcgbW92ZWQKPiA+
ID4gYWhlYWQgb2YgaXQsIG9yIGVsc2UgdGhpbmdzIHdvdWxkIGNlcnRhaW5seSBnbyB3cm9uZyBp
biBtYW55IG90aGVyCj4gPiA+IHBsYWNlcz8KPiA+Cj4gPiBPaC4gSSdtIG5vdCBzYXlpbmcgdGhh
dCB3ZSBkb24ndCBuZWVkIGEgYmFycmllciB0aGVyZSB0b28gKGFuZCBtb3JlCj4gPiB0aGFuIGEg
Y29tcGlsZXIgb25lIGluIHRoYXQgY2FzZSkuCj4gPgo+IAo+IFRoZSBhcmd1bWVudCBSb2dlciBo
YXMgaXMgdGhhdCBzZXRfZml4bWFwX3ggYWxzbyBjb250YWlucyBzdHJvbmcgZW5vdWdoCj4gYmFy
cmllcnMgdG8gcHJldmVudCBoY2FsbF9wYWdlX3JlYWR5IHRvIGJlIHNldCBiZWZvcmUgcGFnZSB0
YWJsZSBpcwo+IGNvcnJlY3RseSBzZXQgdXAuCj4gCj4gU2luY2UgeW91IGFza2VkIGZvciBpdCwg
dGhlcmUgbXVzdCBiZSBzb21ldGhpbmcgb24geW91ciBtaW5kIHRoYXQKPiBwcm9tcHRlZCB0aGlz
IChtYXliZSBpdCBpcyBzaW1wbHkgYmVjYXVzZSB5b3Ugd2VyZSBiaXR0ZW4gYnkgc2ltaWxhcgo+
IHRoaW5ncyBhbmQgd2FudHMgdG8gYmUgZXh0cmEgc3VyZSwgbWF5YmUgeW91IHRoaW5rIGl0IGlz
IGhhcmRlciB0byBncmFzcAo+IHRoZSBzaWRlIGVmZmVjdCBvZiBzZXRfZml4bWFwX3gsIG1heWJl
IHNvbWV0aGluZyBlbHNlKS4KPiAKPiBDb2RlIGlzIHdyaXR0ZW4gdG8gYmUgcmVhZCBieSBodW1h
bnMgYWZ0ZXIgYWxsLiBJIHdvdWxkIHJhdGhlciBiZSBtb3JlCj4gZXhwbGljaXQgLyByZWR1bmRh
bnQgdG8gbWFrZSBodW1hbnMgaGFwcHkgdGhhbiB0byBzYXZlIGEgcG90ZW50aWFsCj4gYmFycmll
ciAvIHNvbWUgdHlwaW5nIGluIGEgY29kZSBwYXRoLgoKSWYgc2V0X2ZpeG1hcF94KCkgaXMgYSBi
YXJyaWVyaW5nIG9wZXJhdGlvbiwgYW5kIHRoYXQgaXMgcmVhc29uYWJseSBvYnZpb3VzIChmcm9t
IGNvbW1lbnRzIG9yIGN1cnNvcnkgZXhhbWluYXRpb24gb2YgdGhlIGNvZGUpIHRoZW4gdGhhdCdz
IGZpbmUuIEkgaGF2ZSBpbmRlZWQgYmVlbiBiaXR0ZW4gYnkgdGhpcyBraW5kIG9mIHRoaW5nIGlu
IHdyaXRpbmcgUFYgZHJpdmVycyBzbyBqdXN0IHdhbnRlZCB0byBlbnN1cmUgd2UgZGlkbid0IHJ1
biBpbnRvIGl0IGhlcmUuCgogIFBhdWwKCj4gCj4gV2VpLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
