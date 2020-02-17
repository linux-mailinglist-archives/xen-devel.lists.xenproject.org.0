Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A116147F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 15:24:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3hGt-0000x6-Ef; Mon, 17 Feb 2020 14:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4oX=4F=amazon.co.uk=prvs=30915cffa=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3hGr-0000x0-N5
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 14:21:13 +0000
X-Inumbo-ID: bfb6b4de-5190-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb6b4de-5190-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581949273; x=1613485273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wi5RGq264KnLYQmRX3jtWLQY54CYOsH7mLZ4Kus+olg=;
 b=mT09FbtTJfOnbzL+vPwhJudwoW6tkOVG3YZ0i1adprXFTMZ+YkCunOIc
 MHoohKkcQvMRnf8O4ej5+BBR5tqDzq6PwnOrPAVWzhIQ5e4cPxRl+P79A
 sUQvS3vUw50AJnTGm8LBrhFTLCcs21Og7YWlB4RhDEhcEy7G8/flysVcm 0=;
IronPort-SDR: vV5xhavt67+V+p0pj8NPLeOb4MqWUgyB0uWruAS6p4wGJOhk0nKoWda3Ygi4a5/5KzqOX6lSxN
 ZdRmJhTywaYA==
X-IronPort-AV: E=Sophos;i="5.70,452,1574121600"; d="scan'208";a="26880508"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Feb 2020 14:21:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7830EA2B9D; Mon, 17 Feb 2020 14:21:08 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 17 Feb 2020 14:21:08 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 14:21:07 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 17 Feb 2020 14:21:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 0/7] xl/libxl: domid allocation/preservation changes
Thread-Index: AQHV2EdfkT2/QYKI80+AMhozcEd71qgfil7g
Date: Mon, 17 Feb 2020 14:21:06 +0000
Message-ID: <422d613f712e4cb9adaa6c7890b6e07d@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
In-Reply-To: <20200131150149.2008-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 0/7] xl/libxl: domid
 allocation/preservation changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE1OjAyCj4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47Cj4gR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSWFuIEphY2tzb24KPiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IEphc29uCj4gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IEtvbnJhZAo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IFN1YmplY3Q6IFtQQVRDSCB2NSAwLzddIHhsL2xpYnhsOiBk
b21pZCBhbGxvY2F0aW9uL3ByZXNlcnZhdGlvbiBjaGFuZ2VzCj4gCj4gUGF1bCBEdXJyYW50ICg3
KToKPiAgIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBvZiBJTlZBTElEX0RPTUlEIHRvIHRoZSBBUEkK
PiAgIGxpYnhsX2NyZWF0ZTogbWFrZSAnc29mdCByZXNldCcgZXhwbGljaXQKPiAgIGxpYnhsOiBn
ZW5lcmFsaXNlIGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaygpCj4gICBsaWJ4bDogYWRkIGlu
ZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFuZCBxdWVyeSAncmVjZW50JyBkb21pZHMKPiAgIGxpYnhs
OiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zIHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRv
bWlkCj4gICB4bC5jb25mOiBpbnRyb2R1Y2UgJ2RvbWlkX3BvbGljeScKPiAgIHhsOiBhbGxvdyBk
b21pZCB0byBiZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUKPiAKPiAgZG9j
cy9tYW4veGwuMS5wb2QuaW4gICAgICAgICAgfCAgMTQgKysrCj4gIGRvY3MvbWFuL3hsLmNvbmYu
NS5wb2QgICAgICAgIHwgIDEwICsrCj4gIHRvb2xzL2V4YW1wbGVzL3hsLmNvbmYgICAgICAgIHwg
ICA0ICsKPiAgdG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMgfCAgMzAgKysrKysKPiAgdG9v
bHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgfCAgMTUgKystCj4gIHRvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jICAgIHwgMTI1ICsrKysrKysrKysrKysrLS0tLS0KPiAgdG9vbHMvbGlieGwvbGli
eGxfZGV2aWNlLmMgICAgfCAgIDQgKy0KPiAgdG9vbHMvbGlieGwvbGlieGxfZGlzay5jICAgICAg
fCAgMTIgKy0KPiAgdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgICAgfCAgIDIgKy0KPiAgdG9v
bHMvbGlieGwvbGlieGxfZG9tLmMgICAgICAgfCAgMTIgKy0KPiAgdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMgICAgfCAyMTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICB0
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jICB8ICA2NyArKysrKysrLS0tLQo+ICB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oICB8ICAzMCArKystLQo+ICB0b29scy9saWJ4bC9saWJ4bF9t
ZW0uYyAgICAgICB8ICAgOCArLQo+ICB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgICB8ICAg
NCArLQo+ICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgICB8ICAgMSArCj4gIHRvb2xzL2xp
YnhsL2xpYnhsX3VzYi5jICAgICAgIHwgICA4ICstCj4gIHRvb2xzL3hsL3hsLmMgICAgICAgICAg
ICAgICAgIHwgIDEwICsrCj4gIHRvb2xzL3hsL3hsLmggICAgICAgICAgICAgICAgIHwgICAyICsK
PiAgdG9vbHMveGwveGxfY21kdGFibGUuYyAgICAgICAgfCAgIDYgKy0KPiAgdG9vbHMveGwveGxf
bWlncmF0ZS5jICAgICAgICAgfCAgMTUgKystCj4gIHRvb2xzL3hsL3hsX3NhdmVyZXN0b3JlLmMg
ICAgIHwgIDE5ICsrLQo+ICB0b29scy94bC94bF91dGlscy5oICAgICAgICAgICB8ICAgMiAtCj4g
IHRvb2xzL3hsL3hsX3ZtY29udHJvbC5jICAgICAgIHwgICAzICsKPiAgeGVuL2luY2x1ZGUvcHVi
bGljL3hlbi5oICAgICAgfCAgIDMgKwo+ICAyNSBmaWxlcyBjaGFuZ2VkLCA1MTcgaW5zZXJ0aW9u
cygrKSwgMTA3IGRlbGV0aW9ucygtKQo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBKYXNvbiBBbmRyeXVrIDxqYW5k
cnl1a0BnbWFpbC5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+IC0tCj4gMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
