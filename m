Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE12179473
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:06:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WUS-0007Zg-In; Wed, 04 Mar 2020 16:03:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B1xp=4V=amazon.co.uk=prvs=325108782=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9WUQ-0007Zb-ST
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:03:19 +0000
X-Inumbo-ID: a9dd4a44-5e31-11ea-b74d-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9dd4a44-5e31-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583337798; x=1614873798;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=Fj/WnMmmhgI9POM9jEln5oxCUoGuWew5g7BZHXWRDEQ=;
 b=Kckr2gZxzpUsfwiCqqJ4LOCoArNCKSBYuSkUxJxsES5/Wyk8equPFYFx
 BJ08G5dbqorQFRo3F+3wtNCCDFEQSMiDAGcOEgVzh6i/ahNYhRIqeCQJQ
 75fIcf1XxR/s1pbTIoPjYvxbviSo2VNxF83tqyExxcsBENjMLjxGCHIPS U=;
IronPort-SDR: WBKYg2N4deKjcWFte6oskmks26vpjuUv0RmvPoG5E4gzwffiSMhy0QK5aolHQI0WcbquLkt5m3
 wKuu/RTOmsXw==
X-IronPort-AV: E=Sophos;i="5.70,514,1574121600"; d="scan'208";a="19760397"
Thread-Topic: [Xen-devel] [PATCH v5 1/2] docs/designs: Add a design document
 for non-cooperative live migration
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 04 Mar 2020 16:03:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2C721A24C0; Wed,  4 Mar 2020 16:03:04 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 4 Mar 2020 16:03:03 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Mar 2020 16:03:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 4 Mar 2020 16:03:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: 'Julien Grall' <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV4lvVR18jnq5V0Ea8B2MjpwLkSag4qWMAgAAB2RCAAAWIgIAABvqA
Date: Wed, 4 Mar 2020 16:03:02 +0000
Message-ID: <6f747ebcf7244553a8847062f1f0a50d@EX13D32EUC003.ant.amazon.com>
References: <20200213105325.3022-1-pdurrant@amazon.com>
 <20200213105325.3022-2-pdurrant@amazon.com>
 <d5051ee2-23b3-5df8-f734-8269c40824b6@xen.org>
 <70f368cbff184707a701828860e6c5ac@EX13D32EUC003.ant.amazon.com>
 <86b2f77c-583a-54e2-2a18-c379ac0983fb@xen.org>
In-Reply-To: <86b2f77c-583a-54e2-2a18-c379ac0983fb@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.41]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/2] docs/designs: Add a design document
 for non-cooperative live migration
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gK0hWTSBndWVzdHMgY2FuIGFscmVh
ZHkgYmUgbWlncmF0ZWQgb24gWGVuIHdpdGhvdXQgZ3Vlc3QgY28tb3BlcmF0aW9uIGJ1dCBvbmx5
DQo+ID4+PiAraWYgdGhleSBkb27igJl0IGhhdmUgUFYgZHJpdmVycyBpbnN0YWxsZWRbMV0gb3Ig
YXJlIGluIHBvd2VyIHN0YXRlIFMzLiBUaGUNCj4gPj4NCj4gPj4gUzMgaXMgdmVyeSBBQ1BJIGNl
bnRyaWMsIHNvIEkgd291bGQgcHJlZmVyIGlmIHdlIGF2b2lkIHRoZSB0ZXJtLiBJIHRoaW5rDQo+
ID4+IHRoZSBub24tQUNQSSBkZXNjcmlwdGlvbiBpcyAic3VzcGVuZCB0byBSQU0iLiBJIHdvdWxk
IGJlIE9LIGlzIHlvdQ0KPiA+PiBtZW50aW9uIFMzIGluIHBhcmVudGhlc2lzLg0KPiA+DQo+ID4g
SSdtIGFjdHVhbGx5IHB1bGxpbmcgdGhpcyBmcm9tIHRoZSB3YXkgdGhlIGNvZGUgaXMgY3VycmVu
dGx5IHdyaXR0ZW4sIHdoaWNoIGlzIGNsZWFybHkgcXVpdGUgeDg2DQo+IHNwZWNpZmljOg0KPiA+
DQo+ID4geGNfaHZtX3BhcmFtX2dldChDVFgtPnhjaCwgZG9taWQsIEhWTV9QQVJBTV9BQ1BJX1Nf
U1RBVEUsICZodm1fc19zdGF0ZSkNCj4gPiAuDQo+ID4gLg0KPiA+IC4NCj4gPiBpZiAoZHNwcy0+
dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0gJiYgKCFodm1fcHZkcnYgfHwgaHZtX3Nfc3Rh
dGUpKSB7DQo+ID4gICAgICBMT0dEKERFQlVHLCBkb21pZCwgIkNhbGxpbmcgeGNfZG9tYWluX3No
dXRkb3duIG9uIEhWTSBkb21haW4iKTsNCj4gPiAgICAgIHJldCA9IHhjX2RvbWFpbl9zaHV0ZG93
bihDVFgtPnhjaCwgZG9taWQsIFNIVVRET1dOX3N1c3BlbmQpOw0KPiA+ICAgICAgLg0KPiA+ICAg
ICAgLg0KPiA+IH0NCj4gPg0KPiA+IFNvIGFjdHVhbGx5IEkgc2hvdWxkIHNheSAnbm90IGluIHBv
d2VyIHN0YXRlIFMwJy4NCj4gDQo+IEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBjdXJyZW50IGNvZGUg
aXMgeDg2IHNwZWNpZmljLiBBcm0gd291bGQgbGlrZWx5DQo+IGhhdmUgYSBzaW1pbGFyIHJlcXVp
cmVtZW50IGFsdGhvdWdoIG5vdCBiYXNlZCBvbiBBQ1BJLg0KPiANCj4gSG93ZXZlciwgbXkgcG9p
bnQgaGVyZSBpcyBub3RoaW5nIGluIHRoZSBkb2N1bWVudCBzYXlzIGl0IGlzIGZvY3VzaW5nIG9u
DQo+IHg4NiBvbmx5LiBUaGUgY29uY2VwdCBpdHNlbGYgaXMgbm90IGFyY2ggc3BlY2lmaWMsIHRo
ZSBkb2N1bWVudCBpcw0KPiBtb3N0bHkgeDg2IGZyZWUgZXhjZXB0IGluIGEgY291cGxlIG9mIGJp
dHMuIFNvIEkgd291bGQgbGlrZSB0aGVtIHRvIGJlDQo+IHJld3JpdHRlbiBpbiBhbiBhcmNoLWFn
bm9zdGljIHdheS4NCj4gDQo+IE5vdGUgdGhhdCBJIGFtIG9rIHdpdGggYXJjaC1zcGVjaWZpYyBl
eGFtcGxlLg0KPiANCg0KU3VyZS4gSSdsbCB0cnkgbm90IHRvIGJlIHg4NiBzcGVjaWZpYyB3aGVy
ZSBpdCdzIG5vdCBuZWNlc3NhcnkuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
