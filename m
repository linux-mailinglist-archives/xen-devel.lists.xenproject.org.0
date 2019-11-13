Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A25FB1D3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:54:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUt3r-00037x-C4; Wed, 13 Nov 2019 13:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3r5a=ZF=amazon.com=prvs=213cc4842=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iUt3q-00037r-9E
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:51:54 +0000
X-Inumbo-ID: bf7957fc-061c-11ea-a230-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf7957fc-061c-11ea-a230-12813bfff9fa;
 Wed, 13 Nov 2019 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573653114; x=1605189114;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=npxhjvA+682baQGQWC7dqw71Ct1d/5xRp1sf+zI3Sp8=;
 b=tz923Wyj0MAtGiEUT3Cfr4lh9vaI/bf9+lNugs2el+qWMLi1Ex7lOMDO
 YmTo2zokIFm81D2eOUr0zWf7HjIlihxyY1jKFCtpZAyGxl5Ejg6Fpw61g
 5ZTwL4z3X3BHoMVEMoiPG+w1r/hoynqq4pcveL8YVxn3haRXs0QLfp+ia o=;
IronPort-SDR: 4jCvUcxiaBp2HfpTBu6G6zz5FfkyZHggLPJHaHXyQX7mnh+4QfezQutSEfdniewcKgnBYacvuh
 wvMUNBh/LVGQ==
X-IronPort-AV: E=Sophos;i="5.68,300,1569283200"; 
   d="scan'208";a="7227144"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Nov 2019 13:51:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 227B8221EAD
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 13:51:50 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:51:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:51:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 13 Nov 2019 13:51:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Durrant, Paul" <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] domain_create: honour global grant/maptrack frame
 limits...
Thread-Index: AQHVmijmkXyX3G407UypjXtu2UKVEKeJHoxw
Date: Wed, 13 Nov 2019 13:51:48 +0000
Message-ID: <57a6e3f262da4f258fba7142ebb4d615@EX13D32EUC003.ant.amazon.com>
References: <20191113134729.1121-1-pdurrant@amazon.com>
In-Reply-To: <20191113134729.1121-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnksIHRoZSBDYyBsaXN0IGdvdCBkcm9wcGVkLi4uIEknbGwgcmUtc2VuZC4KCiAgUGF1bAoK
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KPiBTZW50OiAxMyBOb3ZlbWJlciAyMDE5IDEzOjQ3Cj4gVG86IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBh
bWF6b24uY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZG9tYWluX2NyZWF0ZTogaG9ub3VyIGdsb2Jh
bCBncmFudC9tYXB0cmFjayBmcmFtZQo+IGxpbWl0cy4uLgo+IAo+IC4uLndoZW4gdGhlaXIgdmFs
dWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBjb25maWd1cmVkIGxpbWl0cy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gLS0t
Cj4gQWZ0ZXIgbWluaW5nIHRocm91Z2ggY29tbWl0cyBpdCBpcyBzdGlsbCB1bmNsZWFyIHRvIG1l
IGV4YWN0bHkgd2hlbiBYZW4KPiBzdG9wcGVkIGhvbm91cmluZyB0aGUgZ2xvYmFsIHZhbHVlcywg
YnV0IEkgcmVhbGx5IHRoaW5rIHRoaXMgY29tbWl0IHNob3VsZAo+IGJlIGJhY2stcG9ydGVkIHRv
IHN0YWJsZSB0cmVlcyBhcyBpdCB3YXMgYSBiZWhhdmlvdXJhbCBjaGFuZ2UgdGhhdCBjYW4KPiBj
YXVzZSBkb21VcyB0byBmYWlsIGluIG5vbi1vYnZpb3VzIHdheXMuCj4gLS0tCj4gIHhlbi9jb21t
b24vZG9tYWluLmMgfCAxNCArKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
b21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBpbmRleCA2MTExMTZjN2ZjLi5hYWQ2ZDU1
YjgyIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9u
L2RvbWFpbi5jCj4gQEAgLTMzNSw2ICszMzUsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3Jl
YXRlKGRvbWlkX3QgZG9taWQsCj4gICAgICBlbnVtIHsgSU5JVF93YXRjaGRvZyA9IDF1PDwxLAo+
ICAgICAgICAgICAgIElOSVRfZXZ0Y2huID0gMXU8PDMsIElOSVRfZ250dGFiID0gMXU8PDQsIElO
SVRfYXJjaCA9IDF1PDw1IH07Cj4gICAgICBpbnQgZXJyLCBpbml0X3N0YXR1cyA9IDA7Cj4gKyAg
ICB1bnNpZ25lZCBpbnQgbWF4X2dyYW50X2ZyYW1lcywgbWF4X21hcHRyYWNrX2ZyYW1lczsKPiAK
PiAgICAgIGlmICggY29uZmlnICYmIChlcnIgPSBzYW5pdGlzZV9kb21haW5fY29uZmlnKGNvbmZp
ZykpICkKPiAgICAgICAgICByZXR1cm4gRVJSX1BUUihlcnIpOwo+IEBAIC00NTYsOCArNDU3LDE3
IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKPiAgICAgICAg
ICAgICAgZ290byBmYWlsOwo+ICAgICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfZXZ0Y2huOwo+
IAo+IC0gICAgICAgIGlmICggKGVyciA9IGdyYW50X3RhYmxlX2luaXQoZCwgY29uZmlnLT5tYXhf
Z3JhbnRfZnJhbWVzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
ZmlnLT5tYXhfbWFwdHJhY2tfZnJhbWVzKSkgIT0gMCApCj4gKyAgICAgICAgLyoKPiArICAgICAg
ICAgKiBNYWtlIHN1cmUgdGhhdCB0aGUgY29uZmlndXJlZCB2YWx1ZXMgZG9uJ3QgcmVkdWNlIGFu
eQo+ICsgICAgICAgICAqIGdsb2JhbCBjb21tYW5kIGxpbmUgb3ZlcnJpZGUuCj4gKyAgICAgICAg
ICovCj4gKyAgICAgICAgbWF4X2dyYW50X2ZyYW1lcyA9IG1heChjb25maWctPm1heF9ncmFudF9m
cmFtZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4X2dyYW50X2Zy
YW1lcyk7Cj4gKyAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcyA9IG1heChjb25maWctPm1heF9t
YXB0cmFja19mcmFtZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRf
bWF4X21hcHRyYWNrX2ZyYW1lcyk7Cj4gKwo+ICsgICAgICAgIGlmICggKGVyciA9IGdyYW50X3Rh
YmxlX2luaXQoZCwgbWF4X2dyYW50X2ZyYW1lcywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMpKSAhPSAwICkKPiAgICAgICAgICAgICAg
Z290byBmYWlsOwo+ICAgICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfZ250dGFiOwo+IAo+IC0t
Cj4gMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
