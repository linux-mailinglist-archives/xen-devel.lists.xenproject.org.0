Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B897AECFC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:31:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7h7q-00068o-Km; Tue, 10 Sep 2019 14:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7h7o-00068j-U2
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:28:08 +0000
X-Inumbo-ID: 3529c98c-d3d7-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3529c98c-d3d7-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568125687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vpB2TYETiH3Ffy3b00ofP1lOj8M2EjSGZ+0C1X5Fnzk=;
 b=MjUqEqbFHCIzb8clNPuI3+U3pceZe2k2MY/sJTe5YB6v6yAZsqL0h95S
 w92zIUo8T7PliaYya1u8KVjwmSHMaboJgj7O+zBKWFDJUinoR5rRpbLLJ
 uk+stRimIY8Vtev1xT9XYlnteAumNMocSSdHU5wuu4r3t1R+4r2L/xVX0 w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Xe3ATC17w3kWAjZ00gnoUOpsQ6vQa3NOcMlQE7o/c+kxlHx4QqczlQuA0sErV4fd73CmuVwYQ9
 UJZzbevUo70k+zukCMA2ioBqWW+p/fzBUycvcXA0WvEdpQqkT2a3hkMoM4HT7PIx1nKLN3he0A
 VvkAQVtE0kShIzr03ag4/1lUQpxXDWUcaWqlv7jquRnAn3dbeWjPlxQyr5Kzoy3ed8aNXOMCQa
 EOSgojw3/OlR1BRbGfvx2POoAj6ef/d/3yJB+0xUffn/h35bFLlhZfnSOV1zVEkqg3VUFJ9Chn
 yo0=
X-SBRS: 2.7
X-MesageID: 5615509
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5615509"
Date: Tue, 10 Sep 2019 16:28:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190910142800.rhndl6azi6y6uuc4@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-12-roger.pau@citrix.com>
 <eae52bcadc2e43f1926ab6447df113bd@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eae52bcadc2e43f1926ab6447df113bd@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 11/11] ioreq: provide support for
 long-running operations...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDQ6MTQ6MThQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAx
NzoxNAo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFu
ZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgR2VvcmdlIER1bmxhcAo+ID4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBK
YWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT47Cj4gPiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBUaW0K
PiA+IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTEvMTFd
IGlvcmVxOiBwcm92aWRlIHN1cHBvcnQgZm9yIGxvbmctcnVubmluZyBvcGVyYXRpb25zLi4uCj4g
PiAKPiA+IC4uLmFuZCBzd2l0Y2ggdlBDSSB0byB1c2UgdGhpcyBpbmZyYXN0cnVjdHVyZSBmb3Ig
bG9uZyBydW5uaW5nCj4gPiBwaHlzbWFwIG1vZGlmaWNhdGlvbiBvcGVyYXRpb25zLgo+ID4gCj4g
PiBUaGlzIGFsbG93cyB0byBnZXQgcmlkIG9mIHRoZSB2UENJIHNwZWNpZmljIG1vZGlmaWNhdGlv
bnMgZG9uZSB0bwo+ID4gaGFuZGxlX2h2bV9pb19jb21wbGV0aW9uIGFuZCBhbGxvd3MgZ2VuZXJh
bGl6aW5nIHRoZSBzdXBwb3J0IGZvcgo+ID4gbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMgdG8gb3Ro
ZXIgaW50ZXJuYWwgaW9yZXEgc2VydmVycy4gU3VjaCBzdXBwb3J0Cj4gPiBpcyBpbXBsZW1lbnRl
ZCBhcyBhIHNwZWNpZmljIGhhbmRsZXIgdGhhdCBjYW4gYmUgcmVnaXN0ZXJzIGJ5IGludGVybmFs
Cj4gPiBpb3JlcSBzZXJ2ZXJzIGFuZCB0aGF0IHdpbGwgYmUgY2FsbGVkIHRvIGNoZWNrIGZvciBw
ZW5kaW5nIHdvcmsuCj4gPiBSZXR1cm5pbmcgdHJ1ZSBmcm9tIHRoaXMgaGFuZGxlciB3aWxsIHBy
ZXZlbnQgdGhlIHZjcHUgZnJvbSBydW5uaW5nCj4gPiB1bnRpbCB0aGUgaGFuZGxlciByZXR1cm5z
IGZhbHNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAg
ICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ID4gIHhlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMgICAgICB8IDYxICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
PiA+ICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAgICAgfCAgOCArKysrLQo+ID4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaCB8ICAzICstCj4gPiAgeGVuL2luY2x1ZGUveGVuL3Zw
Y2kuaCAgICAgICAgIHwgIDYgLS0tLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9u
cygrKSwgNDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+IGluZGV4IDMzYzU2Yjg4
MGMuLmNhYTUzZGZhODQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMK
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4gQEAgLTIzOSwxNiArMjM5LDQ4
IEBAIGJvb2wgaGFuZGxlX2h2bV9pb19jb21wbGV0aW9uKHN0cnVjdCB2Y3B1ICp2KQo+ID4gICAg
ICBlbnVtIGh2bV9pb19jb21wbGV0aW9uIGlvX2NvbXBsZXRpb247Cj4gPiAgICAgIHVuc2lnbmVk
IGludCBpZDsKPiA+IAo+ID4gLSAgICBpZiAoIGhhc192cGNpKGQpICYmIHZwY2lfcHJvY2Vzc19w
ZW5kaW5nKHYpICkKPiA+IC0gICAgewo+ID4gLSAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVM
RV9TT0ZUSVJRKTsKPiA+IC0gICAgICAgIHJldHVybiBmYWxzZTsKPiA+IC0gICAgfQo+ID4gLQo+
ID4gLSAgICBGT1JfRUFDSF9FWFRFUk5BTF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpCj4gPiArICAg
IEZPUl9FQUNIX0lPUkVRX1NFUlZFUihkLCBpZCwgcykKPiA+ICAgICAgewo+ID4gICAgICAgICAg
c3RydWN0IGh2bV9pb3JlcV92Y3B1ICpzdjsKPiA+IAo+ID4gKyAgICAgICAgaWYgKCBodm1faW9y
ZXFfaXNfaW50ZXJuYWwoaWQpICkKPiA+ICsgICAgICAgIHsKPiAKPiBJIHdvbmRlciB3aGV0aGVy
IGl0IHdvdWxkIGJlIG5lYXRlciBieSBzYXlpbmc6Cj4gCj4gICAgICAgICAgICBpZiAoICFodm1f
aW9yZXFfaXNfaW50ZXJuYWwoaWQpICkKPiAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAKPiBo
ZXJlIHRvIGF2b2lkIHRoZSBpbmRlbnRhdGlvbiBiZWxvdy4KCkknbSBub3Qgc3VyZSBJIGZvbGxv
dy4gVGhpcyBsb29wIGRvZXMgd29yayBmb3IgYm90aCB0aGUgaW50ZXJuYWwgYW5kCnRoZSBleHRl
cm5hbCBpb3JlcSBzZXJ2ZXJzLCBhbmQgaGVuY2Ugc2tpcHBpbmcgZXh0ZXJuYWwgc2VydmVycyB3
b3VsZApwcmV2ZW50IHRoZSBpdGVyYXRpb24gb3ZlciBpb3JlcV92Y3B1X2xpc3QgZG9uZSBiZWxv
dyBmb3IgZXh0ZXJuYWwKc2VydmVycy4KCj4gCj4gPiArICAgICAgICAgICAgaWYgKCB2aW8tPmlv
X3JlcS5zdGF0ZSA9PSBTVEFURV9JT1JFUV9JTlBST0NFU1MgKQo+ID4gKyAgICAgICAgICAgIHsK
PiA+ICsgICAgICAgICAgICAgICAgaW9yZXFfdCByZXEgPSB2aW8tPmlvX3JlcTsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICAgICogQ2hlY2sgYW5kIGNv
bnZlcnQgdGhlIFBJTy9NTUlPIGlvcmVxIHRvIGEgUENJIGNvbmZpZyBzcGFjZQo+ID4gKyAgICAg
ICAgICAgICAgICAgKiBhY2Nlc3MuCj4gPiArICAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAg
ICAgICAgICAgICBjb252ZXJ0X3BjaV9pb3JlcShkLCAmcmVxKTsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICAgaWYgKCBzLT5oYW5kbGVyKHYsICZyZXEsIHMtPmRhdGEpID09IFg4NkVNVUxfUkVU
UlkgKQo+ID4gKyAgICAgICAgICAgICAgICB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAvKgo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICogTmVlZCB0byByYWlzZSBhIHNjaGVkdWxlciBpcnEg
aW4gb3JkZXIgdG8gcHJldmVudCB0aGUKPiA+ICsgICAgICAgICAgICAgICAgICAgICAqIGd1ZXN0
IHZjcHUgZnJvbSByZXN1bWluZyBleGVjdXRpb24uCj4gPiArICAgICAgICAgICAgICAgICAgICAg
Kgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICogTm90ZSB0aGlzIGlzIG5vdCByZXF1aXJlZCBm
b3IgZXh0ZXJuYWwgaW9yZXEgb3BlcmF0aW9ucwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICog
YmVjYXVzZSBpbiB0aGF0IGNhc2UgdGhlIHZjcHUgaXMgbWFya2VkIGFzIGJsb2NrZWQsIGJ1dAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICogdGhpcyBjYW5ub3QgYmUgZG9uZSBmb3IgbG9uZy1y
dW5uaW5nIGludGVybmFsCj4gPiArICAgICAgICAgICAgICAgICAgICAgKiBvcGVyYXRpb25zLCBz
aW5jZSBpdCB3b3VsZCBwcmV2ZW50IHRoZSB2Y3B1IGZyb20gYmVpbmcKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAqIHNjaGVkdWxlZCBhbmQgdGh1cyB0aGUgbG9uZyBydW5uaW5nIG9wZXJhdGlv
biBmcm9tCj4gPiArICAgICAgICAgICAgICAgICAgICAgKiBmaW5pc2hpbmcuCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgIHJhaXNlX3NvZnRpcnEo
U0NIRURVTEVfU09GVElSUSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPiArICAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgLyogRmlu
aXNoZWQgcHJvY2Vzc2luZyB0aGUgaW9yZXEuICovCj4gPiArICAgICAgICAgICAgICAgIGlmICgg
aHZtX2lvcmVxX25lZWRzX2NvbXBsZXRpb24oJnZpby0+aW9fcmVxKSApCj4gPiArICAgICAgICAg
ICAgICAgICAgICB2aW8tPmlvX3JlcS5zdGF0ZSA9IFNUQVRFX0lPUkVTUF9SRUFEWTsKPiA+ICsg
ICAgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgdmlvLT5pb19yZXEu
c3RhdGUgPSBTVEFURV9JT1JFUV9OT05FOwo+IAo+IElNTyB0aGUgYWJvdmUgaXMgYWxzbyBuZWF0
ZXIgYXM6Cj4gCj4gICAgIHZpby0+aW9fcmVxLnN0YXRlID0gaHZtX2lvcmVxX25lZWRzX2NvbXBs
ZXRpb24oJnZpby0+aW9fcmVxKSA/Cj4gICAgICAgICAgICAgICAgICAgICAgICAgU1RBVEVfSU9S
RVNQX1JFQURZIDogU1RBVEVfSU9SRVFfTk9ORTsKPiAKPiA+ICsgICAgICAgICAgICB9Cj4gPiAr
ICAgICAgICAgICAgY29udGludWU7Cj4gPiArICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5ICggc3YsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnMtPmlvcmVxX3ZjcHVfbGlzdCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaXN0X2VudHJ5ICkKClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
