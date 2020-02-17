Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD1161190
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:04:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3f5e-0003TF-6B; Mon, 17 Feb 2020 12:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4oX=4F=amazon.co.uk=prvs=30915cffa=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3f5d-0003T7-F2
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:01:29 +0000
X-Inumbo-ID: 39f75aa0-517d-11ea-bfd8-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39f75aa0-517d-11ea-bfd8-12813bfff9fa;
 Mon, 17 Feb 2020 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581940888; x=1613476888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3e3dyytCKiWJbPT81nFgl9RxEsf2UUbLrY4IXI32fNA=;
 b=lU+ggy1Fdpj1FvF/2uZs+Jz2AIEd0XJt27UmWsjv974lkcRVNfuvNkL9
 yxahTuIYbgO16QDgLkBTvqTKttnK9wqqr4m3hy9GiX6dpAkE83gTwLYzN
 zU1nkXMQe7eQAXtmAb9ceJsc0Jzkzqcqgf+MuSaxF0BG9DmEa7udhH2qh U=;
IronPort-SDR: lEgvIraZEBNAMbAkYCwHB8iieAk3QYTYUfv01rVvOkLj0dxC8X4JdVFziYmFqBqkv0MWZiPdrj
 YWgiRJxjGU4w==
X-IronPort-AV: E=Sophos;i="5.70,452,1574121600"; d="scan'208";a="17098540"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 17 Feb 2020 12:01:25 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3C522A2189; Mon, 17 Feb 2020 12:01:24 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 17 Feb 2020 12:01:24 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 12:01:23 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 17 Feb 2020 12:01:23 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Thread-Topic: [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Thread-Index: AQHV4zM1ogAqmhu8Uk+hk4DrI15YB6ga58mggAReTYCAAAGhgIAABWow
Date: Mon, 17 Feb 2020 12:01:23 +0000
Message-ID: <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian> <20200217114031.GF4679@Air-de-Roger>
In-Reply-To: <20200217114031.GF4679@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.60]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMTcgRmVicnVhcnkgMjAyMCAxMTo0MQ0KPiBU
bzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jby51az47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tDQo+IGRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBX
ZWkNCj4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIHg4Ni9oeXBlcnY6IHNrZWxldG9uIGZvciBMMCBh
c3Npc3RlZCBUTEIgZmx1c2gNCj4gDQo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDExOjM0OjQx
QU0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6DQo+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMDQ6
NTU6NDRQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwu
Y29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQ0KPiA+ID4gPiBTZW50OiAxNCBGZWJydWFyeSAyMDIw
IDEzOjM0DQo+ID4gPiA+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnPg0KPiA+ID4gPiBDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1p
Y3Jvc29mdC5jb20+OyBEdXJyYW50LCBQYXVsDQo+ID4gPiA+IDxwZHVycmFudEBhbWF6b24uY28u
dWs+OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQ0KPiA+ID4gPiA8d2xA
eGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIN
Cj4gPiA+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIvM10geDg2
L2h5cGVydjogc2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQg0KPiBmbHVzaA0KPiA+ID4gPg0K
PiA+ID4gPiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2gu
IFRoZSBob29rIG5lZWRzIHRvDQo+ID4gPiA+IGNoZWNrIGlmIHByZXJlcXVpc2l0ZXMgYXJlIG1l
dC4gSWYgdGhleSBhcmUgbm90IG1ldCwgaXQgcmV0dXJucyBhbg0KPiBlcnJvcg0KPiA+ID4gPiBu
dW1iZXIgdG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVzaGVzLg0KPiA+ID4gPg0KPiA+ID4gPiBJ
bnRyb2R1Y2UgYSBuZXcgdmFyaWFibGUgdG8gaW5kaWNhdGUgaWYgaHlwZXJjYWxsIHBhZ2UgaXMg
cmVhZHkuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9NYWtlZmlsZSAgfCAgMSArDQo+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L2h5cGVydi5jICB8IDE3ICsrKysrKysrKysrKw0KPiA+ID4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysNCj4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvdGxiLmMgICAgIHwgNDENCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMNCj4gPiA+ID4NCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUNCj4g
PiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlDQo+ID4gPiA+IGluZGV4
IDY4MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUNCj4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9NYWtlZmlsZQ0KPiA+ID4gPiBAQCAtMSArMSwyIEBADQo+ID4gPiA+ICBvYmoteSAr
PSBoeXBlcnYubw0KPiA+ID4gPiArb2JqLXkgKz0gdGxiLm8NCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMNCj4gPiA+ID4gYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jDQo+ID4gPiA+IGluZGV4IDcwZjRjZDVhZTAuLmY5ZDFm
MTFhZTMgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMNCj4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYw0K
PiA+ID4gPiBAQCAtMzMsNiArMzMsOCBAQCBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lk
ICosIGh2X2lucHV0X3BhZ2UpOw0KPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFko
dm9pZCAqLCBodl92cF9hc3Npc3QpOw0KPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NU
TFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7DQo+ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMg
Ym9vbCBfX3JlYWRfbW9zdGx5IGh2X2hjYWxsX3BhZ2VfcmVhZHk7DQo+ID4gPiA+ICsNCj4gPiA+
ID4gIHN0YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9pZCh2b2lkKQ0KPiA+ID4gPiAgew0K
PiA+ID4gPiAgICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307DQo+ID4gPiA+IEBAIC0x
MTksNiArMTIxLDggQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZv
aWQpDQo+ID4gPiA+ICAgICAgQlVHX09OKCFoeXBlcmNhbGxfbXNyLmVuYWJsZSk7DQo+ID4gPiA+
DQo+ID4gPiA+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBB
R0VfU0hJRlQpOw0KPiA+ID4NCj4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBj
b21waWxlciBiYXJyaWVyIGhlcmU/DQo+ID4gPg0KPiA+DQo+ID4gT0suIEkgd2lsbCBhZGQgYSB3
cml0ZSBiYXJyaWVyIGhlcmUuDQo+IA0KPiBIbSwgc2hvdWxkbid0IHN1Y2ggYmFycmllciBiZSBw
YXJ0IG9mIHNldF9maXhtYXBfeCBpdHNlbGY/DQo+IA0KDQpOb3QgcmVhbGx5LCBmb3IgdGhlIHB1
cnBvc2UgSSBoYWQgaW4gbWluZC4gVGhlIGh2X2hjYWxsX3BhZ2VfcmVhZHkgZ2xvYmFsIGlzIHNw
ZWNpZmljIHRvIHRoaXMgY29kZSBhbmQgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIHBhZ2UgaXMg
YWN0dWFsbHkgcmVhZHkgYmVmb3JlIHRoZSBjb2RlIHNheXMgaXQgaXMuDQoNCiAgUGF1bA0KDQo+
IE5vdGUgdGhhdCBtYXBfcGFnZXNfdG9feGVuIGFscmVhZHkgcGVyZm9ybXMgYXRvbWljIHdyaXRl
cy4NCj4gDQo+IFJvZ2VyLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
