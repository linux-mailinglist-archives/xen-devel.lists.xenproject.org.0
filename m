Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3003165F53
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:57:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4mHs-000099-Rz; Thu, 20 Feb 2020 13:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1oA1=4I=amazon.co.uk=prvs=31285a090=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4mHr-000094-93
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:54:43 +0000
X-Inumbo-ID: 8b8c39cc-53e8-11ea-ade5-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b8c39cc-53e8-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582206883; x=1613742883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g4ijhDYuJ3ncYPOAmJGJ2XO3GIUAd9gN9Tr0CE9zfpo=;
 b=D9OSskmKSuaREWKivcs2RQsBmgpKHcmaG5Ma52tXxjVXy9tON2VIqo8x
 sxvPITLpBuw5NnHpCb6TUJdexSQ20tijL7DwY086L06b7KfM//xs60f6w
 EMVwqKIBGzaRCdZs8Sgw9t+yOfHazCjQHuE6gJIRSa9mX21whyxwJZBC6 E=;
IronPort-SDR: i3n99YIbcDxWB3rJtRrCLdb70ZCl5dnSfu60gvIz1jYU0aalW/Uq6GB7epg09S20gthREigk4s
 Rq348+Ihhxtg==
X-IronPort-AV: E=Sophos;i="5.70,464,1574121600"; d="scan'208";a="17318865"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Feb 2020 13:54:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1DF23A2DDB; Thu, 20 Feb 2020 13:54:17 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 20 Feb 2020 13:54:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 20 Feb 2020 13:54:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 20 Feb 2020 13:54:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [Xen-devel] [PATCH v3 19/20] Let cpu_[physical]_memory() calls
 pass a boolean 'is_write' argument
Thread-Index: AQHV5+7vcjjW/3OJHE2x9C8aUbSeQqgkGmwg
Date: Thu, 20 Feb 2020 13:54:15 +0000
Message-ID: <3879f3fc2c3641a28412938601327bb7@EX13D32EUC003.ant.amazon.com>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-20-philmd@redhat.com>
In-Reply-To: <20200220130548.29974-20-philmd@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.112]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 19/20] Let cpu_[physical]_memory() calls
 pass a boolean 'is_write' argument
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>, Igor
 Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kNCj4gU2VudDogMjAgRmVicnVhcnkgMjAyMCAxMzowNg0KPiBUbzogUGV0
ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgcWVtdS1kZXZlbEBub25nbnUu
b3JnDQo+IENjOiBGYW0gWmhlbmcgPGZhbUBldXBob24ubmV0PjsgRG1pdHJ5IEZsZXl0bWFuDQo+
IDxkbWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgTWljaGFl
bCBTLiBUc2lya2luDQo+IDxtc3RAcmVkaGF0LmNvbT47IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+OyBHZXJkIEhvZmZtYW5uDQo+IDxrcmF4ZWxAcmVkaGF0LmNvbT47IEVkZ2FyIEUu
IElnbGVzaWFzIDxlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXR0aGV3IFJvc2F0bw0KPiA8bWpyb3NhdG9A
bGludXguaWJtLmNvbT47IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgRGF2aWQgSGlsZGVuYnJhbmQN
Cj4gPGRhdmlkQHJlZGhhdC5jb20+OyBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT47
IENocmlzdGlhbg0KPiBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT47IEhlcnbD
qSBQb3Vzc2luZWF1DQo+IDxocG91c3NpbkByZWFjdG9zLm9yZz47IE1hcmNlbCBBcGZlbGJhdW0g
PG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPjsNCj4gQW50aG9ueSBQZXJhcmQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bGVrc2FuZGFyIFJpa2FsbyA8YWxla3NhbmRhci5yaWthbG9AcnQtDQo+IHJrLmNvbT47IFJpY2hh
cmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0K
PiA8cGhpbG1kQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29t
PjsgVGhvbWFzIEh1dGgNCj4gPHRodXRoQHJlZGhhdC5jb20+OyBFZHVhcmRvIEhhYmtvc3QgPGVo
YWJrb3N0QHJlZGhhdC5jb20+OyBTdGVmYW4gV2VpbA0KPiA8c3dAd2VpbG5ldHouZGU+OyBBbGlz
dGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPjsgUmljaGFyZA0KPiBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVu
Lm9yZz47DQo+IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT47IHFlbXUtczM5MHhA
bm9uZ251Lm9yZzsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+OyBKb2huIFNub3cNCj4gPGpzbm93QHJlZGhhdC5jb20+OyBEYXZpZCBHaWJz
b24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT47IElnb3INCj4gTWl0c3lhbmtvIDxpLm1p
dHN5YW5rb0BnbWFpbC5jb20+OyBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47DQo+
IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+OyBxZW11LXBwY0Bub25nbnUub3JnOyBQ
YW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRl
dmVsXSBbUEFUQ0ggdjMgMTkvMjBdIExldCBjcHVfW3BoeXNpY2FsXV9tZW1vcnkoKSBjYWxscw0K
PiBwYXNzIGEgYm9vbGVhbiAnaXNfd3JpdGUnIGFyZ3VtZW50DQo+IA0KPiBVc2UgYW4gZXhwbGlj
aXQgYm9vbGVhbiB0eXBlLg0KPiANCj4gVGhpcyBjb21taXQgd2FzIHByb2R1Y2VkIHdpdGggdGhl
IGluY2x1ZGVkIENvY2NpbmVsbGUgc2NyaXB0DQo+IHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3
X2NvbnN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5v
cmc+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
