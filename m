Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98811AE3F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 15:49:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if3G1-0005rf-20; Wed, 11 Dec 2019 14:46:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if3Fz-0005rZ-U1
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 14:46:28 +0000
X-Inumbo-ID: 027b9b96-1c25-11ea-8b5d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 027b9b96-1c25-11ea-8b5d-12813bfff9fa;
 Wed, 11 Dec 2019 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576075588; x=1607611588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yX3oSoR6TBImS5lRmB1xGYyR2f+Pk/mDp104+QOmgJo=;
 b=lx4vUFUf5drnr1kDOSAWoQSfJy977atCPheTYDK3jscaxMEyPkYylE39
 sKVh+IayINuSuFBYNYxDav52dES5ddAxZAqupb+Jp9u7VkQ/uyyNqhQeO
 iB8bZC4QqvKW9zSVbkiutzxFR5lpezuU63p/1Hbn0KpjRR+bZ9Ia42SKC A=;
IronPort-SDR: uLasZyrwu23OcFpkaOLsIOM+tba5m6FMNk0q33Ru+puHsXunBhnLqx7ggbGHQnk93w2f7fgB7f
 OjmZdDQku2KA==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="12919276"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 11 Dec 2019 14:46:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 05480A1D09; Wed, 11 Dec 2019 14:46:13 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 14:46:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 14:46:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 14:46:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 4/4] xen-blkback: support dynamic unbind/bind
Thread-Index: AQHVr02/5BDvv90j7UOwWq+aSG/tNqe0wbIAgAABJICAAED8cA==
Date: Wed, 11 Dec 2019 14:46:11 +0000
Message-ID: <c5a9cf1d080046b0b2d9e9a5579aeb75@EX13D32EUC003.ant.amazon.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-5-pdurrant@amazon.com>
 <20191211104550.GJ980@Air-de-Roger>
 <93f85e6b45eb4286b34ae12ea726038c@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <93f85e6b45eb4286b34ae12ea726038c@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.172]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen-blkback: support dynamic
 unbind/bind
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi0NCj4gPiBibGti
YWNrL3hlbmJ1cy5jDQo+ID4gPiBpbmRleCBlOGM1YzU0ZTFkMjYuLjEzZDA5NjMwYjIzNyAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMNCj4gPiA+
ICsrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMNCj4gPiA+IEBAIC0xODEs
NiArMTgxLDggQEAgc3RhdGljIGludCB4ZW5fYmxraWZfbWFwKHN0cnVjdCB4ZW5fYmxraWZfcmlu
Zw0KPiA+ICpyaW5nLCBncmFudF9yZWZfdCAqZ3JlZiwNCj4gPiA+ICB7DQo+ID4gPiAgCWludCBl
cnI7DQo+ID4gPiAgCXN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmID0gcmluZy0+YmxraWY7DQo+ID4g
PiArCXN0cnVjdCBibGtpZl9jb21tb25fc3JpbmcgKnNyaW5nX2NvbW1vbjsNCj4gPiA+ICsJUklO
R19JRFggcnNwX3Byb2QsIHJlcV9wcm9kOw0KPiA+ID4NCj4gPiA+ICAJLyogQWxyZWFkeSBjb25u
ZWN0ZWQgdGhyb3VnaD8gKi8NCj4gPiA+ICAJaWYgKHJpbmctPmlycSkNCj4gPiA+IEBAIC0xOTEs
NDYgKzE5Myw2NiBAQCBzdGF0aWMgaW50IHhlbl9ibGtpZl9tYXAoc3RydWN0IHhlbl9ibGtpZl9y
aW5nDQo+ID4gKnJpbmcsIGdyYW50X3JlZl90ICpncmVmLA0KPiA+ID4gIAlpZiAoZXJyIDwgMCkN
Cj4gPiA+ICAJCXJldHVybiBlcnI7DQo+ID4gPg0KPiA+ID4gKwlzcmluZ19jb21tb24gPSAoc3Ry
dWN0IGJsa2lmX2NvbW1vbl9zcmluZyAqKXJpbmctPmJsa19yaW5nOw0KPiA+ID4gKwlyc3BfcHJv
ZCA9IFJFQURfT05DRShzcmluZ19jb21tb24tPnJzcF9wcm9kKTsNCj4gPiA+ICsJcmVxX3Byb2Qg
PSBSRUFEX09OQ0Uoc3JpbmdfY29tbW9uLT5yZXFfcHJvZCk7DQo+ID4gPiArDQo+ID4gPiAgCXN3
aXRjaCAoYmxraWYtPmJsa19wcm90b2NvbCkgew0KPiA+ID4gIAljYXNlIEJMS0lGX1BST1RPQ09M
X05BVElWRToNCj4gPiA+ICAJew0KPiA+ID4gLQkJc3RydWN0IGJsa2lmX3NyaW5nICpzcmluZzsN
Cj4gPiA+IC0JCXNyaW5nID0gKHN0cnVjdCBibGtpZl9zcmluZyAqKXJpbmctPmJsa19yaW5nOw0K
PiA+ID4gLQkJQkFDS19SSU5HX0lOSVQoJnJpbmctPmJsa19yaW5ncy5uYXRpdmUsIHNyaW5nLA0K
PiA+ID4gLQkJCSAgICAgICBYRU5fUEFHRV9TSVpFICogbnJfZ3JlZnMpOw0KPiA+ID4gKwkJc3Ry
dWN0IGJsa2lmX3NyaW5nICpzcmluZ19uYXRpdmUgPQ0KPiA+ID4gKwkJCShzdHJ1Y3QgYmxraWZf
c3JpbmcgKilyaW5nLT5ibGtfcmluZzsNCj4gPg0KPiA+IEkgdGhpbmsgeW91IGNhbiBjb25zdGlm
eSBib3RoIHNyaW5nX25hdGl2ZSBhbmQgc3JpbmdfY29tbW9uIChhbmQgdGhlDQo+ID4gb3RoZXIg
aW5zdGFuY2VzIGJlbG93KS4NCj4gDQo+IFllcywgSSBjYW4gZG8gdGhhdC4gSSBkb24ndCB0aGlu
ayB0aGUgbWFjcm9zIHdvdWxkIG1pbmQuDQo+IA0KDQpTcG9rZSB0byBzb29uLiBUaGV5IGRvIG1p
bmQsIG9mIGNvdXJzZSwgYmVjYXVzZSB0aGUgc3JpbmcgcG9pbnRlciBpbiB0aGUgZnJvbnQvYmFj
ayByaW5nIGlzIG5vdCAoYW5kIHNob3VsZCBub3QpIGJlIGNvbnN0LiBJIGNhbiBjb25zdCBzcmlu
Z19jb21tb24gYnV0IG5vIG90aGVycy4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
