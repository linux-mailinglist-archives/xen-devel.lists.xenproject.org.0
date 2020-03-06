Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AA17BC46
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:04:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABh6-0002Qk-0c; Fri, 06 Mar 2020 12:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jABh5-0002QW-4l
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:03:07 +0000
X-Inumbo-ID: 70a0b7f8-5fa2-11ea-8eb5-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70a0b7f8-5fa2-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583496187; x=1615032187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0gukDUGYd+kBLMP1hwl9XphylnvsDqxa1FOfrHy0E1I=;
 b=cNVvB6S9AoUjeBVBVSuULHmDwsZIIaB9BjDOpx6R/6y+HNbtC2LIjmuK
 N5RY+DHtzdT5pGhZseIOCRmNB+x+F6BKXyPlCnI+xTvgbJI/JN5H4HJye
 lM31gFzEZMkGusAVXsWALDyC/K/fV0JAsh8VbFpnOWRuR32uGjnXvjGyI 8=;
IronPort-SDR: MbkEi7FZPu/H/Y8jtQX0y/FZC2FNXV/MTIdBVjBka6MaiCa/4Urvmld2roqIDq0zCOdpnXOcF2
 o7GYIHVGvuSg==
X-IronPort-AV: E=Sophos;i="5.70,521,1574121600"; d="scan'208";a="21337085"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 06 Mar 2020 12:03:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2E6B8A232E; Fri,  6 Mar 2020 12:03:05 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 12:03:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 12:03:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 12:03:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "pdurrant@amzn.com" <pdurrant@amzn.com>
Thread-Topic: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
Thread-Index: AQHV865F9oqYd8Yxi0SONbHnj9wRM6g7dnfA
Date: Fri, 6 Mar 2020 12:03:03 +0000
Message-ID: <d49c47b701af4198bdb113dfe11ee08f@EX13D32EUC003.ant.amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-4-pdurrant@amzn.com>
 <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
In-Reply-To: <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.82]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gN
Cj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMTo1Ng0KPiBUbzogcGR1cnJhbnRAYW16bi5jb20NCj4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5j
b20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyAzLzZdIHg4
NiAvIHB2OiBkbyBub3QgdHJlYXQgUEdDX2V4dHJhIHBhZ2VzIGFzIFJBTSB3aGVuDQo+IGNvbnN0
cnVjdGluZyBkb20wDQo+IA0KPiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFudEBhbXpuLmNv
bSB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jDQo+ID4gKysr
IGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYw0KPiA+IEBAIC03OTIsNiArNzkyLDEwIEBA
IGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAg
IHsNCj4gPiAgICAgICAgICBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7DQo+ID4gICAg
ICAgICAgQlVHX09OKFNIQVJFRF9NMlAoZ2V0X2dwZm5fZnJvbV9tZm4obWZuKSkpOw0KPiA+ICsN
Cj4gPiArICAgICAgICBpZiAoIHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfZXh0cmEgKQ0KPiA+ICsg
ICAgICAgICAgICBjb250aW51ZTsNCj4gDQo+IFRoaXMgc3VyZWx5IGlzIGEgcGF0dGVybiwgaS5l
LiB0aGVyZSBhcmUgbW9yZSBzaW1pbGFyIGNoYW5nZXMgdG8NCj4gbWFrZTogdGJvb3RfZ2VuX2Rv
bWFpbl9pbnRlZ3JpdHkoKSBlLmcuIGlnbm9yZXMgZC0+eGVucGFnZV9saXN0LA0KPiBhbmQgaGVu
Y2Ugd2l0aCB0aGUgZ29hbCBvZiBjb252ZXJ0aW5nIHRoZSBzaGFyZWQgaW5mbyBwYWdlIHdvdWxk
DQo+IGFsc28gd2FudCBhZGp1c3RtZW50LiBGb3IgZHVtcF9udW1hKCkgaXQgbWF5IGJlIGxlc3Mg
aW1wb3J0YW50LA0KPiBidXQgaXQgd291bGQgc3RpbGwgbG9vayBtb3JlIGNvcnJlY3QgaWYgaXQg
dG9vIGdvdCBjaGFuZ2VkLg0KPiBhdWRpdF9wMm0oKSBtaWdodCBhcHBhcmVudGx5IGNvbXBsYWlu
IGFib3V0IHN1Y2ggcGFnZXMgKGFuZA0KPiBoZW5jZSBtaWdodCBiZSBhIHByb2JsZW0gd2l0aCB0
aGUgb25lIFBHQ19leHRyYSBwYWdlIFZNWCBkb21haW5zDQo+IG5vdyBoYXZlKS4gQW5kIHRoaXMg
aXMgb25seSBmcm9tIG1lIGxvb2tpbmcgYXQNCj4gcGFnZV9saXN0X2Zvcl9lYWNoKC4uLiwgJmQt
PnBhZ2VfbGlzdCkgY29uc3RydWN0czsgd2hvIGtub3dzDQo+IHdoYXQgZWxzZSB0aGVyZSBpcy4N
Cj4gDQoNClRob3NlIGFyZSBkZWFsdCB3aXRoIGJ5IHRoZSBpc19zcGVjaWFsX3BhZ2UoKSBwYXRj
aCBsYXRlciBvbiBJIHRoaW5rLiBJdCBkaWRuJ3Qgc2VlbSBhcHByb3ByaWF0ZSB0byB1c2UgdGhh
dCBtYWNybyBoZXJlIHRob3VnaCBzaW5jZSB3ZSBrbm93IHBhZ2VzIG9uIHRoZSBwYWdlIGxpc3Qg
Y2Fubm90IGJlIHhlbmhlYXAgcGFnZXMuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
