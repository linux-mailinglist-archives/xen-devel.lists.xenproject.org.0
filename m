Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D666495949
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 10:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzzIw-00019v-KM; Tue, 20 Aug 2019 08:15:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hE7f=WQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hzzIv-00019q-Ba
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 08:15:45 +0000
X-Inumbo-ID: b407a316-c322-11e9-8bf4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b407a316-c322-11e9-8bf4-12813bfff9fa;
 Tue, 20 Aug 2019 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566288944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7tbCmeUVqASDXw2NPKMO7PHEDkHJ0IVfAnWVTrjph/k=;
 b=BAGz6ZiYndBjD24L0CgE/V8/lxxyvcZCBq9e/EMFTjiFqLrfaAeZyWPy
 h6Q+cYHTc46HYtaArH1rhm2Ffc73Ru4cksHE7Rpq05veA+6jgeGOR1OdK
 o6fyFQlhQZa+UgccwsLfl/jS9kN139LpBx8ENudTE00fvx2DRbtLTmHVz s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K4F9HR7P88g6LSBHwIvA2NOC2GsOcbsNxnE58uhWr1spoXJIZt+vy3pWckgNLsTfZVZG7RfF3X
 UsZqiRJDQyr7lfivBYRbO+VzJuH22XZkK7rGuKgnDd0WAYvdQnQkfXfRMjcZ3O176aRNcg9lr5
 uggSMV5inZlQBn9HJa/yip2CQ3mpsmvGNBkJitpadHevHxXMvg6tXQOgFWS9BwZ+eyKd6R3sJE
 yL5krTA0GPawI6/8FxpbFA6uU/H/D2frXvdhJ17+QEKN7V/tYX6eoOk37OCaX3OVThPeUotD3j
 jJ0=
X-SBRS: 2.7
X-MesageID: 4461810
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4461810"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/2] xen: Switch parameter in get_page_from_gfn to use
 typesafe gfn
Thread-Index: AQHVVpot6fp7BZWpo0OWoBa8qrVIlqcDqeNA
Date: Tue, 20 Aug 2019 08:15:36 +0000
Message-ID: <f12512cce9d34cf7ab7cd3f94d756c74@AMSPEX02CL03.citrite.net>
References: <20190819142651.11058-1-julien.grall@arm.com>
 <20190819142651.11058-2-julien.grall@arm.com>
In-Reply-To: <20190819142651.11058-2-julien.grall@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gU2VudDogMTkgQXVndXN0IDIwMTkgMTU6MjcKPiBUbzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBW
b2xvZHlteXIKPiBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPEdlb3Jn
ZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29t
PjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsKPiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Owo+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPjsgU3Vy
YXZlZQo+IFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQnJp
YW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+OyBQYXVsIER1cnJhbnQKPiA8UGF1bC5EdXJy
YW50QGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjQgMS8y
XSB4ZW46IFN3aXRjaCBwYXJhbWV0ZXIgaW4gZ2V0X3BhZ2VfZnJvbV9nZm4gdG8gdXNlIHR5cGVz
YWZlIGdmbgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IE9ubHkgcmVh
c29uYWJsZSBjbGVhbi11cHMgYXJlIGRvbmUgaW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qgd2lsbCB1
c2UgX2dmbgo+IGZvciB0aGUgdGltZSBiZWluZy4KPiAKPiBUaGUgY29kZSBpbiBnZXRfcGFnZV9m
cm9tX2dmbiBpcyBzbGlnaHRseSByZXdvcmtlZCB0byBhbHNvIGhhbmRsZSBhIGJhZAo+IGJlaGF2
aW9yIGJlY2F1c2UgaXQgaXMgbm90IHNhZmUgdG8gdXNlIG1mbl90b19wYWdlKC4uLikgYmVjYXVz
ZQo+IG1mbl92YWxpZCguLi4pIHN1Y2NlZWRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCi4uLiB3aXRoIGEgZmV3IHN1Z2dlc3Rpb25zIGJlbG93
IC4uLgoKW3NuaXBdCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4v
YXJjaC94ODYvaHZtL2h2bS5jCj4gaW5kZXggMDI5ZWVhM2I4NS4uMjM2YmQ2ZWQzOCAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwo+IEBAIC0yMTY4LDcgKzIxNjgsNyBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9u
ZyB2YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCj4gIHsKPiAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3Vy
cmVudDsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4gLSAgICB1bnNpZ25l
ZCBsb25nIGdmbiwgb2xkX3ZhbHVlID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbMF07Cj4gKyAgICB1
bnNpZ25lZCBsb25nIG9sZF92YWx1ZSA9IHYtPmFyY2guaHZtLmd1ZXN0X2NyWzBdOwo+ICAgICAg
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiAKPiAgICAgIEhWTV9EQkdfTE9HKERCR19MRVZFTF9W
TU1VLCAiVXBkYXRlIENSMCB2YWx1ZSA9ICVseCIsIHZhbHVlKTsKPiBAQCAtMjIyMyw3ICsyMjIz
LDggQEAgaW50IGh2bV9zZXRfY3IwKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbWF5X2RlZmVy
KQo+ICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX2hhcChkKSApCj4gICAgICAgICAgewo+ICAg
ICAgICAgICAgICAvKiBUaGUgZ3Vlc3QgQ1IzIG11c3QgYmUgcG9pbnRpbmcgdG8gdGhlIGd1ZXN0
IHBoeXNpY2FsLiAqLwo+IC0gICAgICAgICAgICBnZm4gPSB2LT5hcmNoLmh2bS5ndWVzdF9jclsz
XSA+PiBQQUdFX1NISUZUOwo+ICsgICAgICAgICAgICBnZm5fdCBnZm4gPSBnYWRkcl90b19nZm4o
di0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pOwo+ICsKPiAgICAgICAgICAgICAgcGFnZSA9IGdldF9w
YWdlX2Zyb21fZ2ZuKGQsIGdmbiwgTlVMTCwgUDJNX0FMTE9DKTsKPiAgICAgICAgICAgICAgaWYg
KCAhcGFnZSApCj4gICAgICAgICAgICAgIHsKPiBAQCAtMjMxNSw3ICsyMzE2LDcgQEAgaW50IGh2
bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbWF5X2RlZmVyKQo+ICAgICAgewo+
ICAgICAgICAgIC8qIFNoYWRvdy1tb2RlIENSMyBjaGFuZ2UuIENoZWNrIFBEQlIgYW5kIHVwZGF0
ZSByZWZjb3VudHMuICovCj4gICAgICAgICAgSFZNX0RCR19MT0coREJHX0xFVkVMX1ZNTVUsICJD
UjMgdmFsdWUgPSAlbHgiLCB2YWx1ZSk7Cj4gLSAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21f
Z2ZuKHYtPmRvbWFpbiwgdmFsdWUgPj4gUEFHRV9TSElGVCwKPiArICAgICAgICBwYWdlID0gZ2V0
X3BhZ2VfZnJvbV9nZm4odi0+ZG9tYWluLCBnYWRkcl90b19nZm4odmFsdWUpLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBQMk1fQUxMT0MpOwoKSSB0aGluayB5b3Ug
Y2FuIHJlZHVjZSB0aGUgc2NvcGUgb2YgJ3BhZ2UnIGFib3ZlIGluIHRoZSBzYW1lIHdheSB5b3Ug
ZGlkIHdpdGggJ2dmbicgYWJvdmUKCj4gICAgICAgICAgaWYgKCAhcGFnZSApCj4gICAgICAgICAg
ICAgIGdvdG8gYmFkX2NyMzsKCltzbmlwXQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gaW5kZXggMDA2MDMxMGQ3
NC4uMzhiZGVmMDg2MiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gQEAgLTY3NCw3ICs2NzQsNyBAQCBz
dGF0aWMgaW50IHZteF9yZXN0b3JlX2NyMF9jcjMoCj4gICAgICB7Cj4gICAgICAgICAgaWYgKCBj
cjAgJiBYODZfQ1IwX1BHICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIHBhZ2UgPSBnZXRf
cGFnZV9mcm9tX2dmbih2LT5kb21haW4sIGNyMyA+PiBQQUdFX1NISUZULAo+ICsgICAgICAgICAg
ICBwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4odi0+ZG9tYWluLCBnYWRkcl90b19nZm4oY3IzKSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIFAyTV9BTExPQyk7
CgpIZXJlIGFsc28geW91IGNhbiByZWR1Y2UgdGhlIHNjb3BlIG9mICdwYWdlJyAoYWx0aG91Z2gg
b25seSBpbnRvIHRoZSBzY29wZSBqdXN0IG91dHNpZGUgdGhlICdpZicpCgo+ICAgICAgICAgICAg
ICBpZiAoICFwYWdlICkKPiAgICAgICAgICAgICAgewoKW3NuaXBdCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA3NTMxNDA2NTQzLi5m
OGUyYjZmOTIxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKPiBAQCAtMjA4Myw3ICsyMDgzLDcgQEAgc3RhdGljIGludCBtb2RfbDFfZW50
cnkobDFfcGdlbnRyeV90ICpwbDFlLCBsMV9wZ2VudHJ5X3QgbmwxZSwKPiAgICAgICAgICAgICAg
cDJtX3F1ZXJ5X3QgcSA9IGwxZV9nZXRfZmxhZ3MobmwxZSkgJiBfUEFHRV9SVyA/Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSA6IFAyTV9BTExP
QzsKPiAKPiAtICAgICAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKHBnX2RvbSwgbDFl
X2dldF9wZm4obmwxZSksICZwMm10LCBxKTsKPiArICAgICAgICAgICAgcGFnZSA9IGdldF9wYWdl
X2Zyb21fZ2ZuKHBnX2RvbSwgX2dmbihsMWVfZ2V0X3BmbihubDFlKSksICZwMm10LCBxKTsKPiAK
CidsMWVfZ2V0X3BmbihubDFlKScgaXMgcmVwZWF0ZWQgMyB0aW1lcyB3aXRoaW4gdGhpcyBzY29w
ZSBBRkFJQ1Qgc28gcHJvYmFibHkgd29ydGggYSBsb2NhbCB2YXJpYWJsZSB3aGlsZSB5b3UncmUg
aW4gdGhlIG5laWdoYm91cmhvb2QsIHRvIHJlZHVjZSB2ZXJib3NpdHkuCgo+ICAgICAgICAgICAg
ICBpZiAoIHAybV9pc19wYWdlZChwMm10KSApCj4gICAgICAgICAgICAgIHsKCltzbmlwXQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcGh5c2Rldi5jIGIveGVuL2FyY2gveDg2L3BoeXNkZXYu
Ywo+IGluZGV4IDNhM2MxNTg5MGIuLjRmM2Y0Mzg2MTQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L3BoeXNkZXYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPiBAQCAtMjI5LDcg
KzIyOSw4IEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcpCj4gICAgICAgICAgICAgIGJyZWFrOwo+IAo+ICAgICAgICAgIHJldCA9
IC1FSU5WQUw7Cj4gLSAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGN1cnJlbnQtPmRv
bWFpbiwgaW5mby5nbWZuLCBOVUxMLCBQMk1fQUxMT0MpOwo+ICsgICAgICAgIHBhZ2UgPSBnZXRf
cGFnZV9mcm9tX2dmbihjdXJyZW50LT5kb21haW4sIF9nZm4oaW5mby5nbWZuKSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgUDJNX0FMTE9DKTsKCidjdXJyZCcgaGFz
IGFjdHVhbGx5IGJlZW4gZGVmaW5lZCBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBzbyBpZiB5
b3UgbG9zZSB0aGUgJ2N1cnJlbnQtPmRvbWFpbicgeW91IGNhbiByZS1mbG93IHRoaXMgYmFjayBv
bnRvIG9uZSBsaW5lIEkgdGhpbmsuCgo+ICAgICAgICAgIGlmICggIXBhZ2UgKQo+ICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgICBpZiAoICFnZXRfcGFnZV90eXBlKHBhZ2UsIFBHVF93cml0
YWJsZV9wYWdlKSApCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
