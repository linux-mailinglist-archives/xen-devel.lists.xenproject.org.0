Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61135109D5A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 12:55:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZPd-0000vF-7C; Tue, 26 Nov 2019 11:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZZPc-0000vA-NE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 11:53:44 +0000
X-Inumbo-ID: 65af0010-1043-11ea-a39f-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65af0010-1043-11ea-a39f-12813bfff9fa;
 Tue, 26 Nov 2019 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574769224; x=1606305224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VPFvOgNdIJqu5XJWMAvR/TimybTq2JNQ892TFGK/OXA=;
 b=qpkvyQqul1PHuGf5RaUVrIO3pbMNjYN8prLrUs3Bt3uZULKdl/bo4vTo
 Wm5EYxlDWILGr91aHWDZ4OPoXVYbGxVxR4APrBdnN4JL4qw9Bek79BBba
 h+a4KU48JdiWCWzx7hgDVNfbbo6bnCBsg4h/qdRm2k12xkd0+Go61jqfs o=;
IronPort-SDR: Ew9fajRMZOdYX2B9XTa52sCChieCJ0CRRIH4XnicADMETgOiEHwDTcJDb+k2rF+jROC6HFCMsU
 T1JrKc3wDp8A==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="5873302"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Nov 2019 11:53:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id DAEF5A23B3; Tue, 26 Nov 2019 11:53:40 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 11:53:40 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 11:53:39 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 11:53:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Paul Durrant
 <pdurrant@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
Thread-Index: AQHVmim/PqWwzQhzO0ayjIqIEVnr3KedZXMAgAAB8YCAAAJMAA==
Date: Tue, 26 Nov 2019 11:53:38 +0000
Message-ID: <74ab58e96f50495ab00c5333a2070a9d@EX13D32EUC003.ant.amazon.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
 <61bf7695-dc31-b3ea-181a-0ed3c7591526@suse.com>
In-Reply-To: <61bf7695-dc31-b3ea-181a-0ed3c7591526@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IE5vdmVtYmVyIDIwMTkgMTE6MzcNCj4gVG86IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAZ21haWwuY29tPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgeGVuLWRl
dmVsDQo+IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
WGVuLWRldmVsXSBbUEFUQ0hdIGRvbWFpbl9jcmVhdGU6IGhvbm91ciBnbG9iYWwNCj4gZ3JhbnQv
bWFwdHJhY2sgZnJhbWUgbGltaXRzLi4uDQo+IA0KPiBPbiAyNi4xMS4xOSAxMjozMCwgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+IE9uIFdlZCwgMTMgTm92IDIwMTkgYXQgMTM6NTUsIFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IC4uLndoZW4gdGhl
aXIgdmFsdWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBjb25maWd1cmVkIGxpbWl0
cy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPg0KPiA+PiAtLS0NCj4gPj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+ID4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+DQo+ID4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4NCj4gPj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IENjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+DQo+ID4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0K
PiA+Pg0KPiA+PiBBZnRlciBtaW5pbmcgdGhyb3VnaCBjb21taXRzIGl0IGlzIHN0aWxsIHVuY2xl
YXIgdG8gbWUgZXhhY3RseSB3aGVuIFhlbg0KPiA+PiBzdG9wcGVkIGhvbm91cmluZyB0aGUgZ2xv
YmFsIHZhbHVlcywgYnV0IEkgcmVhbGx5IHRoaW5rIHRoaXMgY29tbWl0DQo+IHNob3VsZA0KPiA+
PiBiZSBiYWNrLXBvcnRlZCB0byBzdGFibGUgdHJlZXMgYXMgaXQgd2FzIGEgYmVoYXZpb3VyYWwg
Y2hhbmdlIHRoYXQgY2FuDQo+ID4+IGNhdXNlIGRvbVVzIHRvIGZhaWwgaW4gbm9uLW9idmlvdXMg
d2F5cy4NCj4gPg0KPiA+IEFueSBvdGhlciBvcGluaW9ucyBvbiB0aGlzPyBBRkFJQ1QgcXVlc3Rp
b25zIGlzIHN0aWxsIG9wZW46DQo+ID4NCj4gPiAtIERvIHdlIGNvbnNpZGVyIG5vdCBob25vdXJp
bmcgdGhlIGNvbW1hbmQgbGluZSB2YWx1ZXMgdG8gYmUgYQ0KPiA+IHJlZ3Jlc3Npb24gKHNpbmNl
IGRvbVVzIHRoYXQgd291bGQgaGF2ZSB3b3JrZWQgYmVmb3JlIHdpbGwgbm8gbG9uZ2VyDQo+ID4g
d29yayBhZnRlciBhIGJhc2ljIHVwZ3JhZGUgb2YgWGVuKT8NCj4gPg0KPiA+ICAgIFBhdWwNCj4g
Pg0KPiA+PiAtLS0NCj4gPj4gICB4ZW4vY29tbW9uL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysr
LS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29t
bW9uL2RvbWFpbi5jDQo+ID4+IGluZGV4IDYxMTExNmM3ZmMuLmFhZDZkNTViODIgMTAwNjQ0DQo+
ID4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPj4gKysrIGIveGVuL2NvbW1vbi9kb21h
aW4uYw0KPiA+PiBAQCAtMzM1LDYgKzMzNSw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVh
dGUoZG9taWRfdCBkb21pZCwNCj4gPj4gICAgICAgZW51bSB7IElOSVRfd2F0Y2hkb2cgPSAxdTw8
MSwNCj4gPj4gICAgICAgICAgICAgIElOSVRfZXZ0Y2huID0gMXU8PDMsIElOSVRfZ250dGFiID0g
MXU8PDQsIElOSVRfYXJjaCA9DQo+IDF1PDw1IH07DQo+ID4+ICAgICAgIGludCBlcnIsIGluaXRf
c3RhdHVzID0gMDsNCj4gPj4gKyAgICB1bnNpZ25lZCBpbnQgbWF4X2dyYW50X2ZyYW1lcywgbWF4
X21hcHRyYWNrX2ZyYW1lczsNCj4gPj4NCj4gPj4gICAgICAgaWYgKCBjb25maWcgJiYgKGVyciA9
IHNhbml0aXNlX2RvbWFpbl9jb25maWcoY29uZmlnKSkgKQ0KPiA+PiAgICAgICAgICAgcmV0dXJu
IEVSUl9QVFIoZXJyKTsNCj4gPj4gQEAgLTQ1Niw4ICs0NTcsMTcgQEAgc3RydWN0IGRvbWFpbiAq
ZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLA0KPiA+PiAgICAgICAgICAgICAgIGdvdG8gZmFp
bDsNCj4gPj4gICAgICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfZXZ0Y2huOw0KPiA+Pg0KPiA+
PiAtICAgICAgICBpZiAoIChlcnIgPSBncmFudF90YWJsZV9pbml0KGQsIGNvbmZpZy0+bWF4X2dy
YW50X2ZyYW1lcywNCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25maWctPm1heF9tYXB0cmFja19mcmFtZXMpKSAhPQ0KPiAwICkNCj4gPj4gKyAgICAgICAgLyoN
Cj4gPj4gKyAgICAgICAgICogTWFrZSBzdXJlIHRoYXQgdGhlIGNvbmZpZ3VyZWQgdmFsdWVzIGRv
bid0IHJlZHVjZSBhbnkNCj4gPj4gKyAgICAgICAgICogZ2xvYmFsIGNvbW1hbmQgbGluZSBvdmVy
cmlkZS4NCj4gPj4gKyAgICAgICAgICovDQo+ID4+ICsgICAgICAgIG1heF9ncmFudF9mcmFtZXMg
PSBtYXgoY29uZmlnLT5tYXhfZ3JhbnRfZnJhbWVzLA0KPiA+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9wdF9tYXhfZ3JhbnRfZnJhbWVzKTsNCj4gPj4gKyAgICAgICAgbWF4X21h
cHRyYWNrX2ZyYW1lcyA9IG1heChjb25maWctPm1heF9tYXB0cmFja19mcmFtZXMsDQo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0X21heF9tYXB0cmFja19mcmFtZXMp
Ow0KPiA+PiArDQo+ID4+ICsgICAgICAgIGlmICggKGVyciA9IGdyYW50X3RhYmxlX2luaXQoZCwg
bWF4X2dyYW50X2ZyYW1lcywNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtYXhfbWFwdHJhY2tfZnJhbWVzKSkgIT0gMCApDQo+IA0KPiBTbyBiYXNpY2FsbHkgdGhl
IHBlci1kb21haW4gc2V0dGluZ3MgYXJlIGlnbm9yZWQuDQo+IA0KDQpCYXNpY2FsbHksIHllcy4N
Cg0KPiBUaGV5IGFyZSBub3QgYWxsb3dlZCB0byBiZSBzbWFsbGVyIHRoYW4gdGhlIGdsb2JhbCBs
aW1pdHMgKGR1ZSB0bw0KPiB1c2luZyBtYXgoKSkuDQo+IA0KPiBUaGV5IGFyZSBub3QgYWxsb3dl
ZCB0byBiZSBsYXJnZXIgdGhhbiB0aGUgZ2xvYmFsIGxpbWl0cyAoZHVlIHRvIHRoZQ0KPiB0ZXN0
IGluIGdyYW50X3RhYmxlX2luaXQoKS4NCj4gDQo+IFRoYXQgaXMgX25vdF8gdGhlIHB1cnBvc2Ug
b2YgYmVpbmcgYWJsZSB0byBjb250cm9sIHRoZSBzZXR0aW5ncyBwZXINCj4gZG9tYWluLg0KPiAN
Cg0KT2ssIGlmIGEgc3RyYWlnaHQtdXAgcmV0dXJuIHRvIG9sZCBiZWhhdmlvdXIgaXMgb3V0IHRo
ZW4gSSBndWVzcyA0LjEzIHdpbGwgY2FycnkgdGhlIHJlZ3Jlc3Npb24uDQoNCiAgUGF1bA0KDQo+
IA0KPiBKdWVyZ2VuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
