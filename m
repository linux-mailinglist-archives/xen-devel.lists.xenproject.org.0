Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A0FAE89E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:48:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ddL-0000rh-Hu; Tue, 10 Sep 2019 10:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7ddK-0000rc-Al
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 10:44:26 +0000
X-Inumbo-ID: f4a318ec-d3b7-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4a318ec-d3b7-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568112265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ORIdyGEWGldDFqYoRwNC8qdpIc2DYkMJv8ctPTBq4XI=;
 b=NGWYCjUcGIEInifkvEXD4uMonAq0sBFhefdpTZMPgzEDKX5HFKqv2gHH
 q4NOcWrsinsCJb+GIMrWuLyOWVKxSyZUMLvec5DYjXLiGvj/gOPPZz0ms
 TjMMmL5C4lIYdwumJHufAbrrjuZ+3lyRfA1kHFOjDCeS4YtAzcryomwpu 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5w8ORXWM8gXxqP1pe//bzyluJHexAmyg8dhKVQjt9wr9ZNkRNg5cihUUSsMgvzDS2TW+9+XHCx
 wBym0iGmHZB6Zo4mKXwnYo2eSEreCoL5a+XR7OrlkOuyh8Hx/rKIjQwQjmJjjeXYaaOslVZcPj
 vwiIr8NGJNIg5dnlHfBYw29UEspf8bCHGUfFeZ7kV98ndnzZDH+UND7SNW6rHKmJqMmscfeqLD
 gk2985mndFuZ5gclcgdYL494iZedLqYvYT72kLe9+Xtpmx3zY+iQC1yufG6q7eFWVlEURZnk2G
 K/w=
X-SBRS: 2.7
X-MesageID: 5413572
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5413572"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 01/11] ioreq: fix hvm_all_ioreq_servers_add_vcpu fail
 path cleanup
Thread-Index: AQHVYnKwXKcNObHIYUmMOM+OmK6EkackxCgA
Date: Tue, 10 Sep 2019 10:44:21 +0000
Message-ID: <862f837fb5604af18a37d9c1ac1726d6@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMDEvMTFdIGlvcmVxOiBmaXggaHZtX2FsbF9pb3JlcV9zZXJ2ZXJzX2Fk
ZF92Y3B1IGZhaWwgcGF0aCBjbGVhbnVwDQo+IA0KPiBUaGUgbG9vcCBpbiBGT1JfRUFDSF9JT1JF
UV9TRVJWRVIgaXMgYmFja3dhcmRzIGhlbmNlIHRoZSBjbGVhbnVwIG9uDQo+IGZhaWx1cmUgbmVl
ZHMgdG8gYmUgZG9uZSBmb3J3YXJkcy4NCj4gDQo+IEZpeGVzOiA5N2E1YTNlMzAxNjEgKCd4ODYv
aHZtL2lvcmVxOiBtYWludGFpbiBhbiBhcnJheSBvZiBpb3JlcSBzZXJ2ZXJzIHJhdGhlciB0aGFu
IGEgbGlzdCcpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KDQpHb29kIHNwb3QhDQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAg
LSBOZXcgaW4gdGhpcyB2ZXJzaW9uLg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEu
YyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaW9yZXEuYw0KPiBpbmRleCBhNzljYWJiNjgwLi42OTJiNzEwYjAyIDEwMDY0NA0K
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9pb3JlcS5jDQo+IEBAIC0xMTk1LDcgKzExOTUsNyBAQCBpbnQgaHZtX2FsbF9pb3JlcV9zZXJ2
ZXJzX2FkZF92Y3B1KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgIHJl
dHVybiAwOw0KPiANCj4gICBmYWlsOg0KPiAtICAgIHdoaWxlICggaWQtLSAhPSAwICkNCj4gKyAg
ICB3aGlsZSAoIGlkKysgIT0gTUFYX05SX0lPUkVRX1NFUlZFUlMgKQ0KPiAgICAgIHsNCj4gICAg
ICAgICAgcyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwgaWQpOw0KPiANCj4gLS0NCj4gMi4yMi4wDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
