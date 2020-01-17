Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35214067C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:41:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isO4z-0006Ju-KO; Fri, 17 Jan 2020 09:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZlyK=3G=amazon.co.uk=prvs=278c75273=pdurrant@srs-us1.protection.inumbo.net>)
 id 1isO4x-0006Jp-OQ
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:38:11 +0000
X-Inumbo-ID: 0e8d0fe6-390d-11ea-b89f-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e8d0fe6-390d-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579253883; x=1610789883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6MFOPC5dOwzQgUSERuWIXddb2KOnmzNXmro03eWyREs=;
 b=bKIikJ9RXBMe0Gyv2QtrJOm6WgCVvNtmGYgaJHF8bmUPblnGi2xDAjcB
 GEV2I1rvQlhfXjYixtnUx91pDg6ACNHzRJ3p8V2fQQ/80YwHy1MLEcmCl
 W4p90Mac0qrAaVd0kUAv7X8BI05TNi68hz6IyeAGgPCEHFnhdOEt45a1y A=;
IronPort-SDR: VUX2m/uSYeHAB3VnG1IgSDwTtQpNcJrEulU4fofdxgb1mphh6zkPweMo8TrdElPGoYpgfTcd40
 NObxrH0nysIg==
X-IronPort-AV: E=Sophos;i="5.70,329,1574121600"; d="scan'208";a="11945845"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 17 Jan 2020 09:38:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id A238DA25B2; Fri, 17 Jan 2020 09:38:00 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 09:38:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 09:37:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 17 Jan 2020 09:37:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v3 4/6] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHVzFBoLAnvKVVhW06F0xOPMrYEQKftnwCAgAD5nnA=
Date: Fri, 17 Jan 2020 09:37:58 +0000
Message-ID: <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <24096.44311.441643.264877@mariner.uk.xensource.com>
In-Reply-To: <24096.44311.441643.264877@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.74]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE2IEphbnVhcnkgMjAyMCAxOTozNgo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkCj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsKPiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Owo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gamFuZHJ5dWtA
Z21haWwuY29tCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzZdIGxpYnhsOiBhbGxvdyBjcmVh
dGlvbiBvZiBkb21haW5zIHdpdGggYQo+IHNwZWNpZmllZCBvciByYW5kb20gZG9taWQKPiAKPiBI
aS4gIFRoaXMgYnJvYWRseSBjb250YWlucyB3aGF0IEkgZXhwZWN0ZWQsIGJ1dDoKPiAKPiBQYXVs
IER1cnJhbnQgd3JpdGVzICgiW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNyZWF0aW9uIG9m
IGRvbWFpbnMgd2l0aAo+IGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZCIpOgo+IAo+ID4gKyAg
ICAgICAgZm9yICg7Oykgewo+ID4gKyAgICAgICAgICAgIGlmIChpbmZvLT5kb21pZCA9PSBSQU5E
T01fRE9NSUQpIHsKPiA+ICsgICAgICAgICAgICAgICAgdWludDE2X3QgdjsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgICAgLyogUmFuZG9taXplIGxvd2VyIG9yZGVyIGJ5dGVzICovCj4gPiArICAg
ICAgICAgICAgICAgIHJldCA9IGxpYnhsX19yYW5kb21fYnl0ZXMoZ2MsICh2b2lkICopJnYsIHNp
emVvZih2KSk7Cj4gPiArICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgIHYgJj0gRE9NSURf
TUFTSzsKPiA+ICsgICAgICAgICAgICAgICAgaWYgKCFsaWJ4bF9kb21pZF92YWxpZF9ndWVzdCh2
KSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgbGlieGxfX2lzX3JldGlyZWRfZG9taWQoZ2Ms
IHYpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiArCj4gPiArICAgICAg
ICAgICAgICAgICpkb21pZCA9IHY7Cj4gPiArICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAg
ICAgICAgIHJldCA9IHhjX2RvbWFpbl9jcmVhdGUoY3R4LT54Y2gsIGRvbWlkLCAmY3JlYXRlKTsK
PiA+ICsgICAgICAgICAgICBpZiAocmV0ID09IDAgfHwgZXJybm8gIT0gRUVYSVNUIHx8IGluZm8t
PmRvbWlkICE9Cj4gUkFORE9NX0RPTUlEKQo+ID4gKyAgICAgICAgICAgICAgICBicmVhazsKPiA+
ICsgICAgICAgIH0KPiAKPiBJIHRoaW5rIHRoaXMgaGFzIGEgcmFjZS4KPiAKPiAgIFRocmVhZCBB
LCBpbiBkb21haW4gZGVzdHJveSAgICAgICAgICAgVGhyZWFkIEIsIGluIGNvZGUgYWJvdmUKPiAK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNob29zZSBkb21pZCBW
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGVjayBWIGluIHJl
Y2VudCBkb21pZCBsaXN0Cj4gCj4gICAgICBhZGQgViB0byByZWNlbnQgZG9taWQgbGlzdAo+ICAg
ICAgZGVzdHJveSBkb21haW4gViBpbiBYZW4KPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNyZWF0ZSBkb21haW4gViBpbiBYZW4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlIGNvbnN0cnVjdGluZyBWCj4gCj4gVGhy
ZWFkIEIgaW1wcm9wZXJseSBjb25zdHJ1Y3RzIGEgbmV3IGd1ZXN0IHVzaW5nIFYsIGV4cG9zaW5n
IGFueW9uZQo+IHdobyB3YXMgdGFsa2luZyBhYm91dCBWIGEgbW9tZW50IGFnbyB0byBidWdzLiAg
U29tZSBjb2RlIG1pZ2h0IGV2ZW4KPiBmYWlsIHRvIHNwb3QgdGhlIGludGVydmFsIHdoZXJlIFYg
ZG9lcyBub3QgZXhpc3QgYW5kIGNhcnJ5IG9uIHRhbGtpbmcKPiB0byB0aGUgbmV3IFYgYXMgaWYg
aXQgd2VyZSB0aGUgb2xkIG9uZS4uLgo+IAo+IEkgdGhpbmsgdGhlcmUgYXJlIG9ubHkgdHdvIHBv
c3NpYmxlIHNvbHV0aW9uczoKPiAKPiAgIC0gQ2hlY2sgdGhlIGRvbWFpbidzIGVudHJ5IGluIHRo
ZSByZWNlbnQgbGlzdCAqYWZ0ZXIqIGNyZWF0aW5nCj4gICAgIHRoZSBkb21haW4gaW4gWGVuLiAg
VGhpcyBpbnZvbHZlcyBhY2NlcHRpbmcgdGhhdCB3ZSB3aWxsCj4gICAgIHJldXNlIHRoZSBkb21p
ZCBidXQgb25seSBmb3IgYSBkb21haW4gd2UgYXJlIGluIHRoZSBlYXJseQo+ICAgICBzdGFnZXMg
b2YgY29uc3RydWN0aW5nLCBzbyBob3BlZnVsbHkgd2l0aG91dCBiYWQgY29uc2VxdWVuY2U/Cj4g
Cj4gICAtIFRha2UgdGhlIHJlY2VudCBkb21pZCBsb2NrLgo+IAoKT3IgdGFrZSBhIGdsb2JhbCBm
aWxlIGxvY2sgaW4gbGlieGwgYXJvdW5kIGRvbWFpbiBjcmVhdGlvbiBhbmQgZGVzdHJ1Y3Rpb24/
Cgo+IEFsc28sIGl0IHNlZW1zIHRvIG1lIHRoYXQgd2Ugc2hvdWxkIGNoZWNrIHRoZSByZWNlbnQg
ZG9taWQgbGlzdCBpZiB3ZQo+IGxldCBYZW4gY2hvb3NlIHRoZSBkb21pZC4gIE1heWJlIHRoYXQg
Y2FuIGJlIGluIGEgc3Vic2VxdWVudCBwYXRjaC4uLgo+IAoKV2VsbCwgd2UgY291bGQgc29sdmUg
YWxsIHRoaXMsIHJlbW92ZSB0aGUgbmVlZCBmb3IgYSBmaWxlIGFuZCBhbGwgdGhlIGFzc29jaWF0
ZWQgY29tcGxleGl0eSBieSBzaW1wbHkga2VlcGluZyBoaXN0b3J5IGluc2lkZSB0aGUgaHlwZXJ2
aXNvci4gSSBkb24ndCBrbm93IGhvdyB0aGUgWGVuIG1haW50YWluZXJzIHdpbGwgZmVlbCBhYm91
dCB0aGF0IHRob3VnaCwgYXMgWGVuIGl0c2VsZiBzaG91bGRuJ3QgaGF2ZSBhIHByb2JsZW0gd2l0
aCBlYWdlciBkb21pZCByZS11c2UuCgogIFBhdWwKCj4gVGhhbmtzLAo+IElhbi4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
