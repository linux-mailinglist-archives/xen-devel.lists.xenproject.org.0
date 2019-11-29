Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15B10D59A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:18:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafCD-0004OW-1a; Fri, 29 Nov 2019 12:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iafCB-0004OJ-Jf
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:16:23 +0000
X-Inumbo-ID: 0e9043fa-12a2-11ea-a3e4-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e9043fa-12a2-11ea-a3e4-12813bfff9fa;
 Fri, 29 Nov 2019 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575029783; x=1606565783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cee/yOjh6ZpBwyeLFaKQzceF1KatF6QwJve14+TGWNg=;
 b=Heqf5lMsHznAllxcXCGi32bir12ZX5mPdMH/UVyDrxyUCXA9KXV1sWeM
 MEeZUmm0j5GfFYvfCrunevn502+Wytqes/yd4EwKMqoHslrzDOYyug8ZT
 thAu3mJvpum0CsTcyBVbAgHnJnI2cmh0S5R7jPvZqqtAQJS5R/Y1MbS1i o=;
IronPort-SDR: 03H6+KTATpQtNuUJZiHQWwcjgAVizRaKlU/7thzxfNrxwyQyfelQAuODRiV6OHHyFJb6MkjXl+
 LXJ4onVuKF2g==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="6854910"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 29 Nov 2019 12:16:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7713DA2777; Fri, 29 Nov 2019 12:16:20 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 12:16:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 12:16:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 12:16:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] xen-blkback: allow module to be cleanly unloaded
Thread-Index: AQHVpqiPN+OVVFahFEu3tG0tj9ZAZ6eiCq+AgAAFMRA=
Date: Fri, 29 Nov 2019 12:16:18 +0000
Message-ID: <783331c9c731497490f537318fafadd0@EX13D32EUC003.ant.amazon.com>
References: <20191129113131.1954-1-pdurrant@amazon.com>
 <6d0a90f6-3def-a970-6dca-8d1f3eb66c1c@suse.com>
In-Reply-To: <6d0a90f6-3def-a970-6dca-8d1f3eb66c1c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen-blkback: allow module to be cleanly
 unloaded
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTE6NTYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgSmVucyBBeGJvZQ0KPiA8YXhib2VAa2VybmVsLmRrPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4tYmxr
YmFjazogYWxsb3cgbW9kdWxlIHRvIGJlIGNsZWFubHkgdW5sb2FkZWQNCj4gDQo+IE9uIDI5LjEx
LjIwMTkgMTI6MzEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0gYS9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jDQo+ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay94ZW5idXMuYw0KPiA+IEBAIC0xNzMsNiArMTczLDggQEAgc3RhdGljIHN0cnVjdCB4ZW5fYmxr
aWYgKnhlbl9ibGtpZl9hbGxvYyhkb21pZF90DQo+IGRvbWlkKQ0KPiA+ICAJaW5pdF9jb21wbGV0
aW9uKCZibGtpZi0+ZHJhaW5fY29tcGxldGUpOw0KPiA+ICAJSU5JVF9XT1JLKCZibGtpZi0+ZnJl
ZV93b3JrLCB4ZW5fYmxraWZfZGVmZXJyZWRfZnJlZSk7DQo+ID4NCj4gPiArCV9fbW9kdWxlX2dl
dChUSElTX01PRFVMRSk7DQo+ID4gKw0KPiA+ICAJcmV0dXJuIGJsa2lmOw0KPiA+ICB9DQo+ID4N
Cj4gPiBAQCAtMzIwLDYgKzMyMiw4IEBAIHN0YXRpYyB2b2lkIHhlbl9ibGtpZl9mcmVlKHN0cnVj
dCB4ZW5fYmxraWYgKmJsa2lmKQ0KPiA+DQo+ID4gIAkvKiBNYWtlIHN1cmUgZXZlcnl0aGluZyBp
cyBkcmFpbmVkIGJlZm9yZSBzaHV0dGluZyBkb3duICovDQo+ID4gIAlrbWVtX2NhY2hlX2ZyZWUo
eGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYpOw0KPiA+ICsNCj4gPiArCW1vZHVsZV9wdXQoVEhJU19N
T0RVTEUpOw0KPiA+ICB9DQo+IA0KPiBJIHJlYWxpemUgdGhlcmUgYXJlIHZhcmlvdXMgZXhhbXBs
ZSBvZiB0aGlzIGluIHRoZSB0cmVlLCBidXQNCj4gaXNuJ3QgdGhpcyBhIGZsYXdlZCBhcHByb2Fj
aD8gX19tb2R1bGVfZ2V0KCkgKG5vciBldmVuDQo+IHRyeV9tb2R1bGVfZ2V0KCkpIHdpbGwgcHJl
dmVudCBhbiB1bmxvYWQgYXR0ZW1wdCBhaGVhZCBvZiBpdA0KPiBnZXR0aW5nIGludm9rZWQsIHdo
aWxlIGV4ZWN1dGlvbiBpcyBhbHJlYWR5IGluIHRoaXMgbW9kdWxlJ3MNCj4gLnRleHQgc2VjdGlv
bi4NCg0KR29vZCBwb2ludC4gVGhhdCBkb2VzIGFwcGVhciB0byBiZSBhIHJhY2UuDQoNCj4gSSB0
aGluayB0aGUgeGVuYnVzIGRyaXZlciBzaG91bGQgZG8gdGhpcw0KPiBiZWZvcmUgY2FsbGluZyAt
PnByb2JlKCksIGluIGNhc2Ugb2YgaXRzIGZhaWx1cmUsIGFuZCBhZnRlcg0KPiBhIHN1Y2Nlc3Nm
dWwgY2FsbCB0byAtPnJlbW92ZSgpLg0KPiANCg0KVGhhdCBkb2VzIHNvdW5kIGJldHRlci4gSSds
bCBzZWUgaWYgSSBjYW4gcGljayB1cCBvdGhlciBvY2N1cnJlbmNlcyAoY2VydGFpbmx5IG5ldGJh
Y2spIGFuZCBmaXguDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
