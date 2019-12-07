Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC6115DE9
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 19:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ideh5-0000Yq-7O; Sat, 07 Dec 2019 18:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A7Ws=Z5=amazon.com=prvs=2375c008b=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ideh3-0000YS-Ax
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 18:20:37 +0000
X-Inumbo-ID: 440bac0e-191e-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 440bac0e-191e-11ea-b6f1-bc764e2007e4;
 Sat, 07 Dec 2019 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575742837; x=1607278837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3U0+VDzr3GlU71uQQzDBDP2Ng+tYesjvqnsdF8fCr7g=;
 b=KD9d3nu6jHymOuG/LfDyPoKDiN9enzUohqhN0WKg4lR7P68FubG15pdz
 76G1p6OiAHmozzYTSOfBxiIVKBCHkYyPMyPWPvVI+JGu4YeDsdyNm0AAg
 T54UUqABX9lwZLA12rahy6LTDnvCwciVE1cKaozo7sSQ6g3O5ZWjJm9DM Y=;
IronPort-SDR: p8PyjBA27EWQ+Lz/zaMmCNWzs4MejzgQZszUETjBTuKNHjQXYt/vQ1QbAlfttWClKhfmmRH874
 5PwZ5yy+Is6g==
X-IronPort-AV: E=Sophos;i="5.69,288,1571702400"; 
   d="scan'208";a="7491669"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Dec 2019 18:20:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id C6130141664; Sat,  7 Dec 2019 18:20:34 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 18:20:33 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 18:20:33 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Sat, 7 Dec 2019 18:20:33 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] x86/mm: factor out the code for shattering an l3 PTE
Thread-Index: AQHVrF21b0nGZoxzuEyyzE+1Myq9k6eu/UmA
Date: Sat, 7 Dec 2019 18:20:32 +0000
Message-ID: <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
In-Reply-To: <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.53]
Content-ID: <620280941027D14E9A898CBDDE3D0FDD@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LA0KDQpPbiBGcmksIDIwMTktMTItMDYgYXQgMTc6NTAgKzAwMDAsIEFuZHJldyBD
b29wZXIgd3JvdGU6DQo+IE9uIDA2LzEyLzIwMTkgMTU6NTMsIEhvbmd5YW4gWGlhIHdyb3RlOg0K
PiA+IG1hcF9wYWdlc190b194ZW4gYW5kIG1vZGlmeV94ZW5fbWFwcGluZ3MgYXJlIHBlcmZvcm1p
bmcgYWxtb3N0DQo+ID4gZXhhY3RseQ0KPiA+IHRoZSBzYW1lIG9wZXJhdGlvbnMgd2hlbiBzaGF0
dGVyaW5nIGFuIGwzIFBURSwgdGhlIG9ubHkgZGlmZmVyZW5jZQ0KPiA+IGJlaW5nIHdoZXRoZXIg
d2Ugd2FudCB0byBmbHVzaC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3l4aWFAYW1hem9uLmNvbT4NCj4gDQo+IEp1c3QgZm9yIHJldmlld2luZyBwdXJwb3Nlcywg
aG93IGRvZXMgdGhpcyByZWxhdGUgdG8geW91ciBvdGhlcg0KPiBwb3N0ZWQNCj4gc2VyaWVzLiAg
SXMgaXQgaW5kZXBlbmRlbnQsIGEgcHJlcmVxdWlzaXRlLCBvciBkb2VzIGl0IGRlcGVuZCBvbiB0
aGF0DQo+IHNlcmllcz8NCg0KVGhpcyBpcyBpbmRlcGVuZGVudC4gT3RoZXIgc2VyaWVzIEkgcG9z
dGVkIHdpbGwgdG91Y2ggYSBsb3Qgb2YgUFRFDQpmdW5jdGlvbnMsIGFuZCBhcyBKYW4gc3VnZ2Vz
dGVkLCBpdCB3b3VsZCBiZSBuaWNlIHRvIHJlZmFjdG9yIHNvbWUgb2YNCnRoZSBsb25nIGFuZCBj
b21wbGljYXRlZCBvbmVzIGJlZm9yZSBjaGFuZ2luZyB0aGVtLCB3aGljaCBjb3VsZCBhbHNvDQpw
cmVwYXJlIHVzIGZvciA1LWxldmVsIHBhZ2luZyBpbiB0aGUgZnV0dXJlLiBBbHRob3VnaCBpZiB0
aGVzZQ0KcmVmYWN0b3JpbmcgcGF0Y2hlcyBnZXQgaW4sIEkgbmVlZCB0byByZWJhc2UgdGhlIHNl
cmllcyBJIHBvc3RlZA0KYmVmb3JlLg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICB4ZW4vYXJjaC94ODYv
bW0uYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
PiAtLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJj
aC94ODYvbW0uYw0KPiA+IGluZGV4IDdkNGRkODBhODUuLjQyYWFhYTEwODMgMTAwNjQ0DQo+ID4g
LS0tIGEveGVuL2FyY2gveDg2L21tLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiA+
IEBAIC01MTUxLDYgKzUxNTEsNDMgQEAgbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5z
aWduZWQgbG9uZw0KPiA+IHYpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVzaF9h
cmVhX2xvY2FsKChjb25zdCB2b2lkICopdiwgZikgOiBcDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICBmbHVzaF9hcmVhX2FsbCgoY29uc3Qgdm9pZCAqKXYsIGYpKQ0KPiA+ICANCj4gPiAr
LyogU2hhdHRlciBhbiBsMyBlbnRyeSBhbmQgcG9wdWxhdGUgbDIuIElmIHZpcnQgaXMgcGFzc2Vk
IGluLCBhbHNvDQo+ID4gZG8gZmx1c2guICovDQo+ID4gK3N0YXRpYyB2b2lkIHNoYXR0ZXJfbDNl
KGwzX3BnZW50cnlfdCAqcGwzZSwgbDJfcGdlbnRyeV90ICpsMnQsDQo+ID4gKyAgICAgICAgdW5z
aWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tpbmcpDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVk
IGludCBpOw0KPiA+ICsgICAgbDNfcGdlbnRyeV90IG9sM2UgPSAqcGwzZTsNCj4gPiArDQo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQ0KPiA+ICsg
ICAgICAgIGwyZV93cml0ZShsMnQgKyBpLA0KPiA+ICsgICAgICAgICAgICAgICAgICBsMmVfZnJv
bV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKGkgPDwgUEFHRVRBQkxFX09SREVSKSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGwzZV9nZXRfZmxhZ3Mob2wzZSkpKTsNCj4gDQo+IFRoZSBQVEUgbWFjcm9zIGFy
ZSBlc3BlY2lhbGx5IHBvb3IgZm9yIGdlbmVyYXRlZCBhc20sIGFuZCBpbiBjYXNlcw0KPiBsaWtl
DQo+IHRoaXMsIEknZCBsaWtlIHRvIGltcHJvdmUgdGhpbmdzLg0KPiANCj4gSW4gcGFydGljdWxh
ciwgSSBiZWxpZXZlIHRoZSBmb2xsb3dpbmcgY29kZSBoYXMgaWRlbnRpY2FsIGJlaGF2aW91cjoN
Cj4gDQo+IGwyX3BnZW50cnlfdCBubDJlID0gbDJlX2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRl
KG9sM2UpKTsNCj4gDQo+IGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkr
KywgbmwyZS5sMiArPQ0KPiBQQUdFVEFCTEVfT1JERVIgKQ0KPiAgICAgbDJlX3dyaXRlKGwydCAr
IGksIG5sMmUpOw0KPiANCj4gKGFsdGhvdWdoIHNvbWVvbmUgcGxlYXNlIGRvdWJsZSBjaGVjayBt
eSBsb2dpYykgYW5kIHJhdGhlciBiZXR0ZXIgYXNtDQo+IGdlbmVyYXRpb24uICAoSSBhbHNvIGV4
cGVjdCB0aGVyZSB0byBiZSBzb21lIGRpc2N1c3Npb24gb24gd2hldGhlcg0KPiB1c2luZw0KPiBu
MmxlLmwyIGRpcmVjdGx5IGlzIHNvbWV0aGluZyB3ZSdkIHdhbnQgdG8gc3RhcnQgZG9pbmcuKQ0K
PiANCg0KSSBiZWxpZXZlIGl0IHNob3VsZCBiZSBubDJlLmwyICs9IDE8PChQQUdFVEFCTEVfT1JE
RVIrUEFHRV9TSElGVCkgPw0KQWx0aG91Z2ggdGhlIGNvZGUgcmFyZWx5IHRvdWNoZXMgdGhlIGZp
ZWxkICgubDIpIGRpcmVjdGx5LCBzbyBtYXliZSB1c2UNCnRoZSBtYWNyb3MgKGdldF9pbnRwdGUg
LT4gYWRkIC0+IGZyb21faW50cHRlKSBmb3IgY29uc2lzdGVuY3k/IFRoZXkNCnNob3VsZCBwcm9k
dWNlIHRoZSBzYW1lIGNvZGUgaWYgdGhlIGNvbXBpbGVyIGlzIG5vdCB0b28gc3R1cGlkLg0KDQo+
ID4gKw0KPiA+ICsgICAgaWYgKCBsb2NraW5nICkNCj4gPiArICAgICAgICBzcGluX2xvY2soJm1h
cF9wZ2Rpcl9sb2NrKTsNCj4gPiArICAgIGlmICggKGwzZV9nZXRfZmxhZ3Mob2wzZSkgJiBfUEFH
RV9QUkVTRU5UKSAmJg0KPiA+ICsgICAgICAgICAobDNlX2dldF9mbGFncyhvbDNlKSAmIF9QQUdF
X1BTRSkgKQ0KPiANCj4gVGhlcmUgaXMgYSBzdWJ0bGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
cmlnaW5hbCBjb2RlLCBhbmQgdGhlDQo+IHJlZmFjdG9yZWQgY29kZSwgYW5kIGl0IGRlcGVuZHMg
b24gdGhlIG1lbW9yeSBiYXJyaWVyIGZyb20NCj4gc3Bpbl9sb2NrKCkuDQo+IA0KPiBQcmV2aW91
c2x5LCBpdCB3YXMgcmUtcmVhZCBmcm9tIG1lbW9yeSBhZnRlciB0aGUgbG9jaywgd2hlcmVhcyBu
b3cgaXQNCj4gaXMNCj4gbGlrZWx5IHRoZSBzdGFsZSB2ZXJzaW9uIGZyb20gYmVmb3JlIG1hcF9w
Z2RpciB3YXMgbG9ja2VkLg0KPiANCj4gRWl0aGVyIHlvdSBjYW4gZ28gYmFjayB0byB0aGUgb2xk
IHZlcnNpb24gYW5kIHVzZSAqcGwzZSwgb3INCj4gYWx0ZXJuYXRpdmVseSB1c2U6DQo+IA0KPiAg
ICAgaWYgKCBsb2NraW5nICkNCj4gICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsN
Cj4gICAgIG9sM2UgPSBBQ0NFU1NfT05DRSgqcGwzZSk7DQo+ICAgICBpZiAoIC4uLg0KPiANCj4g
dG8gbWFrZSBpdCBjbGVhciB0aGF0IGEgcmVyZWFkIGZyb20gbWVtb3J5IGlzIHJlcXVpcmVkLg0K
PiANCg0KR29vZCBwb2ludC4gVGhhbmtzLg0KDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgbDNl
X3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZnJvbV9tZm4odmlydF90b19tZm4obDJ0KSwNCj4gDQo+
IFRoaXMgd291bGQgcHJvYmFibHkgZ2VuZXJhdGUgYmV0dGVyIGFzbSBieSB1c2luZyB0aGUgbWFk
ZHIgdmFyaWFudHMNCj4gc28NCj4gd2UgZG9uJ3QgaGF2ZSBhIGRvdWJsZSBzaGlmdC4NCj4gDQoN
ClJpZ2h0LiBJIGNhbiBjaGFuZ2UgdGhhdC4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09SKSk7DQo+ID4gKyAgICAgICAg
bDJ0ID0gTlVMTDsNCj4gPiArICAgIH0NCj4gPiArICAgIGlmICggbG9ja2luZyApDQo+ID4gKyAg
ICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsNCj4gPiArICAgIGlmICggdmlydCAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzID0NCj4g
PiArICAgICAgICAgICAgRkxVU0hfVExCIHwgRkxVU0hfT1JERVIoMiAqIFBBR0VUQUJMRV9PUkRF
Uik7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggKGwzZV9nZXRfZmxhZ3Mob2wzZSkgJiBfUEFH
RV9HTE9CQUwpICkNCj4gPiArICAgICAgICAgICAgICAgIGZsdXNoX2ZsYWdzIHw9IEZMVVNIX1RM
Ql9HTE9CQUw7DQo+ID4gKyAgICAgICAgZmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFncyk7DQo+
ID4gKyAgICB9DQo+ID4gKyAgICBpZiAoIGwydCApDQo+ID4gKyAgICAgICAgZnJlZV94ZW5fcGFn
ZXRhYmxlKGwydCk7DQo+IA0KPiBUaGlzIHN1cmVseSBuZWVkcyB0byBOVUxMIG91dCBsMnQsIGp1
c3Qgc28gdGhlIGNhbGxlciBkb2Vzbid0IGdldCBhbnkNCj4gY2xldmVyIGlkZWFzIGFuZCBlbmRz
IHVwIHdpdGggYSB1c2UtYWZ0ZXItZnJlZT8NCj4gDQo+IH5BbmRyZXcNCg0KaG1tLi4uIGlmIHdl
IHdhbnQgdG8gbWFrZSB0aGUgbnVsbGlmaWNhdGlvbiB2aXNpYmxlIHRvIHRoZSBjYWxsZXIgd2UN
Cm1pZ2h0IG5lZWQgdG8gcGFzcyAmLiBJIHdvbmRlciBpZiBpdCBtYWtlcyBzZW5zZSB0byBzaW1w
bHkgbW92ZSB0aGUNCm1lbW9yeSBhbGxvY2F0aW9uIG9mIHBsMmUgaW50byBzaGF0dGVyX2wzZSBh
cyB3ZWxsLCBzbyB0aGF0IHRoZSBjYWxsZXINCmNhbm5vdCBoYXZlIGFueSBpZGVhcy4NCg0KVGhh
bmtzLA0KSG9uZ3lhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
