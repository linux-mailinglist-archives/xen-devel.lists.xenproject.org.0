Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C30150877
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:34:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycln-00056f-8L; Mon, 03 Feb 2020 14:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iycll-00056X-K6
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:32:09 +0000
X-Inumbo-ID: f5012368-4691-11ea-b211-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5012368-4691-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580740329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c0MBQ4c/XK7VUiO3hDROp8LLQG9BzZX2Ip946VYRgRs=;
 b=NKzcxl5l3FrqGHewFietoqHm6IT7CnJKtLFykxcAVWYMvIlKx0J0BS73
 FQay9MqAYq9yXYYbHthfSBac61zk8bjS7d9EEIdmmO8ThjvkW0YPkGMVA
 8D/UXBKAfiSvD68cLV1lbcYdxzDgArSwDR+Lue7TBoOLcbKzUIJFbCcDi U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g4wuctgnFEnngo1N3vn7wzQa+c2YPUIxMkOsUG51BpC/3ZJHfiBW7FM3BSTWFInb/y+XGiWrJH
 zN/0OwkLsrNhEDWdPq3iUmf+36cIofZkYoErDmUt5Ba2I3Ll2Mp5WTEOSZX0ws/RYQ+vr+XC66
 Q5Q455JPho2qoP30Xo4/1nhyM0fXOZOzcfFK+eLXtwsiFUhb8N3uFBdstbOC5yTPfagUCn1Zue
 n+9mzctMOAU0dETNq81COkCFQZGtDUXVhEJmzaybS9cazYXamSiphO6ToHE5H3SrzeAFu7CsNg
 +ZU=
X-SBRS: 2.7
X-MesageID: 11846156
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="11846156"
Date: Mon, 3 Feb 2020 15:32:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200203143201.GY4679@Air-de-Roger>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-5-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131174930.31045-5-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 04/11] x86/hypervisor: provide
 hypervisor_fixup_e820
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBBbmQgaW1wbGVtZW50IHRoZSBob29rIGZvciBYZW4gZ3Vlc3QuCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2U4
MjAuYyAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyAgICAgICAgfCA2ICsrKysrKwo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hl
bi5jICAgICAgICAgICB8IDcgKysrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaCB8IDYgKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBi
L3hlbi9hcmNoL3g4Ni9lODIwLmMKPiBpbmRleCAzODkyYzljZmI3Li4yMjE5YzYzODYxIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5j
Cj4gQEAgLTY5MCw4ICs2OTAsOCBAQCB1bnNpZ25lZCBsb25nIF9faW5pdCBpbml0X2U4MjAoY29u
c3QgY2hhciAqc3RyLCBzdHJ1Y3QgZTgyMG1hcCAqcmF3KQo+ICAKPiAgICAgIG1hY2hpbmVfc3Bl
Y2lmaWNfbWVtb3J5X3NldHVwKHJhdyk7Cj4gIAo+IC0gICAgaWYgKCBwdl9zaGltICkKPiAtICAg
ICAgICBwdl9zaGltX2ZpeHVwX2U4MjAoJmU4MjApOwo+ICsgICAgaWYgKCBjcHVfaGFzX2h5cGVy
dmlzb3IgKQo+ICsgICAgICAgIGh5cGVydmlzb3JfZTgyMF9maXh1cCgmZTgyMCk7Cj4gIAo+ICAg
ICAgcHJpbnRrKCIlcyBSQU0gbWFwOlxuIiwgc3RyKTsKPiAgICAgIHByaW50X2U4MjBfbWVtb3J5
X21hcChlODIwLm1hcCwgZTgyMC5ucl9tYXApOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IGlu
ZGV4IGU3MmM5MmZmZGYuLjVmZDQzM2M4ZDQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydmlzb3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMK
PiBAQCAtNjYsNiArNjYsMTIgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+ICAgICAg
ICAgIG9wcy0+cmVzdW1lKCk7Cj4gIH0KPiAgCj4gK3ZvaWQgX19pbml0IGh5cGVydmlzb3JfZTgy
MF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPiArewo+ICsgICAgaWYgKCBvcHMgJiYgb3Bz
LT5lODIwX2ZpeHVwICkKPiArICAgICAgICBvcHMtPmU4MjBfZml4dXAoZTgyMCk7Cj4gK30KPiAr
Cj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiAgICogbW9kZTogQwo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94
ZW4uYwo+IGluZGV4IGQ1MGY4NmJhZTcuLjQ1ZTU0ZGZiYmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMKPiBAQCAtMzE2LDExICszMTYsMTggQEAgc3RhdGljIHZvaWQgcmVzdW1lKHZvaWQpCj4gICAg
ICAgICAgcHZfY29uc29sZV9pbml0KCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBl
ODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQo+ICt7Cj4gKyAgICBpZiAoIHB2X3NoaW0g
KQo+ICsgICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMChlODIwKTsKPiArfQo+ICsKPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7Cj4gICAgICAubmFtZSA9ICJYZW4i
LAo+ICAgICAgLnNldHVwID0gc2V0dXAsCj4gICAgICAuYXBfc2V0dXAgPSBhcF9zZXR1cCwKPiAg
ICAgIC5yZXN1bWUgPSByZXN1bWUsCj4gKyAgICAuZTgyMF9maXh1cCA9IGU4MjBfZml4dXAsCj4g
IH07Cj4gIAo+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCB4Z19wcm9iZSh2
b2lkKQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3Iu
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gaW5kZXggYjUwMzg1
NGM1Yi4uYjY2Y2IyODMzMyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydmlzb3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5oCj4gQEAgLTE5LDYgKzE5LDggQEAKPiAgI2lmbmRlZiBfX1g4Nl9IWVBFUlZJU09SX0hfXwo+
ICAjZGVmaW5lIF9fWDg2X0hZUEVSVklTT1JfSF9fCj4gIAo+ICsjaW5jbHVkZSA8YXNtL2U4MjAu
aD4KPiArCj4gIHN0cnVjdCBoeXBlcnZpc29yX29wcyB7Cj4gICAgICAvKiBOYW1lIG9mIHRoZSBo
eXBlcnZpc29yICovCj4gICAgICBjb25zdCBjaGFyICpuYW1lOwo+IEBAIC0yOCw2ICszMCw4IEBA
IHN0cnVjdCBoeXBlcnZpc29yX29wcyB7Cj4gICAgICBpbnQgKCphcF9zZXR1cCkodm9pZCk7Cj4g
ICAgICAvKiBSZXN1bWUgZnJvbSBzdXNwZW5zaW9uICovCj4gICAgICB2b2lkICgqcmVzdW1lKSh2
b2lkKTsKPiArICAgIC8qIEZpeCB1cCBlODIwIG1hcCAqLwo+ICsgICAgdm9pZCAoKmU4MjBfZml4
dXApKHN0cnVjdCBlODIwbWFwICplODIwKTsKPiAgfTsKPiAgCj4gICNpZmRlZiBDT05GSUdfR1VF
U1QKPiBAQCAtMzYsNiArNDAsNyBAQCBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQp
Owo+ICB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7Cj4gIGludCBoeXBlcnZpc29yX2FwX3Nl
dHVwKHZvaWQpOwo+ICB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwo+ICt2b2lkIGh5cGVy
dmlzb3JfZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCk7Cj4gIAo+ICAjZWxzZQo+ICAK
PiBAQCAtNDYsNiArNTEsNyBAQCBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmh5cGVydmlzb3Jf
cHJvYmUodm9pZCkgeyByZXR1cm4gTlVMTDsgfQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2
aXNvcl9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9Cj4gIHN0YXRpYyBpbmxp
bmUgaW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsg
cmV0dXJuIDA7IH0KPiAgc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQp
IHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KPiArc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlz
b3JfZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsgfQoKQXJlIHlvdSBzdXJlIHRoZSBhc3NlcnQgaGVyZSBpcyBmaW5lPwoKQ29uc2lkZXIgWGVu
IHJ1bm5pbmcgbmVzdGVkIG9uIGFub3RoZXIgaHlwZXJ2aXNvciwgYW5kIGJ1aWx0IHdpdGhvdXQK
Q09ORklHX0dVRVNUIGVuYWJsZWQsIEkgdGhpbmsgdGhlIGFib3ZlIGFzc2VydCB3b3VsZCB0cmln
Z2VyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
