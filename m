Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BD113D5C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 09:52:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icmno-0004c9-Mo; Thu, 05 Dec 2019 08:48:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icmnm-0004c3-Kl
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 08:47:58 +0000
X-Inumbo-ID: efee4246-173b-11ea-a0d2-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efee4246-173b-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575535678; x=1607071678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0FD8vFjHbmcZcVVUAicSj3qwDXdLMp0mxbp5jU66fFY=;
 b=AZBvxsuZbhVHt8Elwcl9WIYXkEGqy9FD8h5rRa4SDVXK9u+J5MknwRMr
 IWJIi3YCi5veKwgKHef4LfA1RLSly0QWzmu48q2f3Izae0Ah0/8F83bEk
 66G+QsLqk4TrXkL63D52u5xLVDMERvKmUnJNaBKqV2TPs4nOC1r+lt9JV 4=;
IronPort-SDR: fIVviYbp775Y1eSktDMau2AeUPR+2jKcOnK1oREWrm9Zuormikls8fNzSFhL6ao0appu0XLcXR
 AeIepsp/l7DQ==
X-IronPort-AV: E=Sophos;i="5.69,280,1571702400"; 
   d="scan'208";a="7175736"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 05 Dec 2019 08:47:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id BE60828220F; Thu,  5 Dec 2019 08:47:57 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 08:47:56 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 08:47:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 08:47:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: xen-unstable (4.14 to be): Assertion '!preempt_count()' failed
 at preempt.c:36
Thread-Index: AQHVq0gs0iaAahn/90Sz4WescIAJd6erOn+A
Date: Thu, 5 Dec 2019 08:47:55 +0000
Message-ID: <3ccdae5d7e3e4c178413d2d22f483efb@EX13D32EUC003.ant.amazon.com>
References: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
 <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
 <08b761ad-c84b-3dad-2dd1-f9b69b0fe2a7@eikelenboom.it>
 <62b58da082e449eb960bada0ea34e3f9@EX13D32EUC003.ant.amazon.com>
 <c9ef56d9-9220-72e5-8ea6-0bd87436991b@suse.com>
In-Reply-To: <c9ef56d9-9220-72e5-8ea6-0bd87436991b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTkgMDg6NDQNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBTYW5kZXIgRWlrZWxlbmJvb20g
PGxpbnV4QGVpa2VsZW5ib29tLml0PjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ow0KPiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IHhlbi11bnN0YWJsZSAoNC4xNCB0
byBiZSk6IEFzc2VydGlvbiAnIXByZWVtcHRfY291bnQoKScNCj4gZmFpbGVkIGF0IHByZWVtcHQu
YzozNg0KPiANCj4gT24gMDUuMTIuMjAxOSAwOTozNSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4g
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPiA+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ID4gQEAgLTE2OTYsMTYgKzE2OTYsMTIgQEAgaW50IGlv
bW11X2RvX3BjaV9kb21jdGwoDQo+ID4NCj4gPiAgICAgICAgICBwY2lkZXZzX2xvY2soKTsNCj4g
PiAgICAgICAgICByZXQgPSBkZXZpY2VfYXNzaWduZWQoc2VnLCBidXMsIGRldmZuKTsNCj4gPiAt
ICAgICAgICBpZiAoIGRvbWN0bC0+Y21kID09IFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNl
ICkNCj4gPiArICAgICAgICBpZiAoIHJldCAmJiBkb21jdGwtPmNtZCA9PSBYRU5fRE9NQ1RMX3Rl
c3RfYXNzaWduX2RldmljZSApDQo+ID4gICAgICAgICAgew0KPiA+IC0gICAgICAgICAgICBpZiAo
IHJldCApDQo+ID4gLSAgICAgICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfR19JTkZPDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIiUwNHg6JTAyeDolMDJ4
LiV1IGFscmVhZHkgYXNzaWduZWQsIG9yIG5vbi0NCj4gZXhpc3RlbnRcbiIsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2
Zm4pKTsNCj4gPiAtICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4gLSAgICAgICAg
ICAgIH0NCj4gPiAtICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfR19JTkZPDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXUg
YWxyZWFkeSBhc3NpZ25lZCwgb3Igbm9uLQ0KPiBleGlzdGVudFxuIiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7DQo+
ID4gKyAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4gICAgICAgICAgfQ0KPiANCj4gQnV0
IHRoaXMgc2VlbXMgd3JvbmcgLSB5b3UnZCBlbmQgdXAgY2FsbGluZyBhc3NpZ25fZGV2aWNlKCkg
ZXZlbg0KPiBmb3IgdGhlIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNlIGNhc2UsIHdoZW4g
cmV0IGlzIDAuIEFsbCB3ZQ0KPiB3YW50IGlzIHRvIGRlbGV0ZSB0aGUgYnJlYWsgc3RhdGVtZW50
IGFmYWljdC4NCj4gDQoNCkFoLCB5ZXM7IHRoYXQgbG9naWMgaXMgcXVpdGUgY29uZnVzaW5nLiBU
aGUgcGF0Y2ggc2hvdWxkIGluZGVlZCBiZToNCg0KLS0tODwtLS0NCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
DQppbmRleCBjZWQwYzI4ZTRmLi5jMDdhNjM5ODFhIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpA
QCAtMTcwNSw3ICsxNzA1LDYgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoDQogICAgICAgICAg
ICAgICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbikp
Ow0KICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KICAgICAgICAgICAgIH0NCi0gICAg
ICAgICAgICBicmVhazsNCiAgICAgICAgIH0NCiAgICAgICAgIGVsc2UgaWYgKCAhcmV0ICkNCiAg
ICAgICAgICAgICByZXQgPSBhc3NpZ25fZGV2aWNlKGQsIHNlZywgYnVzLCBkZXZmbiwgZmxhZ3Mp
Ow0KLS0tODwtLS0NCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
