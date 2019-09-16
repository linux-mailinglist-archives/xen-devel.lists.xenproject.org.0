Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6618B3D45
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9sWL-0004Bm-Kj; Mon, 16 Sep 2019 15:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aiU4=XL=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i9sWJ-0004Bc-Q3
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:02:27 +0000
X-Inumbo-ID: fe92500e-d892-11e9-95ee-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe92500e-d892-11e9-95ee-12813bfff9fa;
 Mon, 16 Sep 2019 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568646146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sPGY7G1rufDujX9dWcyI5SDRuF/dRaGQpHCzQMF+/B8=;
 b=gqQ6NSV1rEy8VuNJd6Ly6RJDeGf6hK+RyhpmyVkywbWQ+E3/Cc1f8h0a
 y5pDBmgAEk0uA/TgbDuYA2RTUIuFwK2witRlV3y8t68J3sjkr5qSQj7A+
 RgaswrBkEKmkpwIO9TQXVg3Uam0kzamhHV4ueXKR/NnUnXVNHZ64zaAtj Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: liaGGEu8pr0VbsA++2BDw2lCHCqWVu/xO5Lq35NuTaIndfJLRTMEMz/QNXZ1T7+AAdCxSLnqtl
 Wzxe7EX/IMGtmiSP2VwuA41dYEVA78/PiL0xo4P7BXzATPr6QwR2hkMBxUFQKgX+5pKejeXGof
 lV9yfkP2fQdwDWn/Tc5S5pMxoHXUI4fjJwhpr0255EAlJJu2NLwrTNdBrYL1CNu6kF187Ua0u+
 GXCrAMRG3nqOZEisQoM0tNVaDjTq7aUYq/GSTOIDZV3ZN9TXkFIyu0AiGvU0Q1YxlVGLvxQBLR
 1CI=
X-SBRS: 2.7
X-MesageID: 5820357
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,513,1559534400"; 
   d="scan'208";a="5820357"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH v12 6/6] introduce a 'passthrough' configuration option
 to xl.cfg...
Thread-Index: AQHVbHDvn5jHVxPMFkKSD7X9lZILUacuNUaAgAAvVrA=
Date: Mon, 16 Sep 2019 15:02:21 +0000
Message-ID: <e0920d285aab46f4b5fe68fa95be4cac@AMSPEX02CL03.citrite.net>
References: <20190916092708.2624-1-paul.durrant@citrix.com>
 <20190916140549.GH1308@perard.uk.xensource.com>
In-Reply-To: <20190916140549.GH1308@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v12 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDE2IFNlcHRlbWJlciAyMDE5IDE1OjA2Cj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
Q2hyaXN0aWFuIExpbmRpZwo+IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRy
ZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwKPiA8anVsaWVuLmdyYWxsQGFy
bS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFZvbG9keW15
cgo+IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMiA2LzZdIGlu
dHJvZHVjZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8geGwuY2ZnLi4u
Cj4gCj4gT24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMTA6Mjc6MDhBTSArMDEwMCwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIv
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiA+IGluZGV4IDU5ZGJjYjUwYTAuLjdhZmFlODE0
MzIgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiA+IEBAIC0zMCw2ICszMCwxMiBAQAo+ID4gIGlu
dCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9j
cmVhdGVfaW5mbyAqY19pbmZvKQo+ID4gIHsKPiA+ICsgICAgbGlieGxfcGh5c2luZm8gaW5mbzsK
PiA+ICsgICAgaW50IHJjID0gbGlieGxfZ2V0X3BoeXNpbmZvKENUWCwgJmluZm8pOwo+ID4gKwo+
ID4gKyAgICBpZiAocmMpCj4gPiArICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4gKwo+IAo+IEkg
dGhpbmsgdGhpcyBodW5rIHdvdWxkIGJlIG1vcmUgcmVhZGFibGUgaWYgaXQgd2FzIHdyaXR0ZW46
Cj4gICAgIGludCByYzsKPiAKPiAgICAgcmMgPSBsaWJ4bF9nZXRfcGh5c2luZm8oQ1RYLCAmaW5m
byk7Cj4gICAgIGlmIChyYykKPiAgICAgICAgIHJldHVybiByYzsKPiAKPiBPdGhlcndpc2UsIHRo
ZSBjaGVjayBmb3IgZXJyb3IgaXMgYWxvbmUgd2hpY2ggbWlnaHQgbWVhbiAid2UgYXJlIGluIGEK
PiBjYWxsYmFjayBmdW5jdGlvbiBhbmQgY2hlY2sgZm9yIHJjIHBhc3NlZCBieSBwYXJhbWV0ZXIi
IG9yIHRoYXQgaXQncyBhCj4gc3RyYXkgY2hlY2suCj4gCj4gPiBAQCAtNjIsNiArNjIsMTIgQEAg
aW50IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+
ID4gICAgICBpZiAoIWNfaW5mby0+c3NpZHJlZikKPiA+ICAgICAgICAgIGNfaW5mby0+c3NpZHJl
ZiA9IFNFQ0lOSVRTSURfRE9NVTsKPiA+Cj4gPiArICAgIGlmIChpbmZvLmNhcF9odm1fZGlyZWN0
aW8pIHsKPiA+ICsgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSAoKGNfaW5mby0+dHlwZSA9
PSBMSUJYTF9ET01BSU5fVFlQRV9QVikgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIWluZm8uY2FwX2lvbW11X2hhcF9wdF9zaGFyZSkgPwo+ID4gKyAgICAgICAgICAgIExJ
QlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQgOiBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVDsKPiA+
ICsgICAgfQo+IAo+IEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBkbyB0aGF0LiBUaGlzIHdpbGwgb3Zl
cndyaXRlIHRoZSB2YWx1ZSB0aGF0IHdhcyBpbgo+IGNfaW5mbyBiZWZvcmUgKHRoYXQgYSB1c2Vy
IGFzIHNldCkuIFRoZSBfc2V0ZGVmYXVsdCgpIGZ1bmN0aW9uIGlzIG9ubHkKPiBjYWxsZWQgYWZ0
ZXIgY19pbmZvIGhhdmUgYmVlbiBmaWxsZWQgYnkgdXNlcnMgb2YgdGhlIGxpYnhsLCBpdCBvbmx5
IGhhcwo+IHRvIGNoYW5nZSB0aGUgdmFsdWUgaWYgaXQgd2FzIHRoZSBkZWZhdWx0LgoKT2gsIHdo
YXQgYSB1c2VmdWwgc2VtYW50aWMuCgo+IGNfaW5mby0+cGFzc3Rocm91Z2ggaGFzIG5vCj4gZGVm
YXVsdCB2YWx1ZSwgc28gaXQncyBub3QgcG9zc2libGUgdG8ga25vdyB3aGF0IGEgdXNlciB3YW50
cy4KPiAKPiBXaGF0IGFib3V0IGFkZGluZyAiZGVmYXVsdCI9PTAgaW4gbGlieGxfcGFzc3Rocm91
Z2ggZW51bT8KCkkgZ3Vlc3MgdGhhdCdzIHByb2JhYmx5IHRoZSBvbmx5IG9wdGlvbiwgYnV0IHRo
ZXJlIGlzIHN0aWxsIHRoZSBwcm9ibGVtIG9mIHRoZSBwYWdlIHRhYmxlIG1lbW9yeSBvdmVyaGVh
ZC4gSSBndWVzcyBJJ2QgaGF2ZSB0byBhc3N1bWUgdGhlIHdvcnN0IGNhc2UgZm9yICdkZWZhdWx0
Jy4gVGhhdCBzZXBhcmF0aW9uIGJldHdlZW4gY3JlYXRlIGluZm8gYW5kIGJ1aWxkIGluZm8gaXMg
cmVhbGx5IHVuaGVscGZ1bC4KCj4gCj4gPiAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGli
eGxfdHlwZXMuaWRsCj4gPiBpbmRleCBkNTJjNjNiNmIwLi4yMmYwNTcxMWUzIDEwMDY0NAo+ID4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gPiArKysgYi90b29scy9saWJ4bC9s
aWJ4bF90eXBlcy5pZGwKPiA+IEBAIC0yNjMsNiArMjYzLDEyIEBAIGxpYnhsX3ZrYl9iYWNrZW5k
ID0gRW51bWVyYXRpb24oInZrYl9iYWNrZW5kIiwgWwo+ID4gICAgICAoMiwgIkxJTlVYIikKPiA+
ICAgICAgXSkKPiA+Cj4gPiArbGlieGxfcGFzc3Rocm91Z2ggPSBFbnVtZXJhdGlvbigicGFzc3Ro
cm91Z2giLCBbCj4gPiArICAgICgwLCAiZGlzYWJsZWQiKSwKPiA+ICsgICAgKDEsICJzeW5jX3B0
IiksCj4gPiArICAgICgyLCAic2hhcmVfcHQiKSwKPiA+ICsgICAgXSkKPiA+ICsKPiA+ICAjCj4g
PiAgIyBDb21wbGV4IGxpYnhsIHR5cGVzCj4gPiAgIwo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hs
L3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jCj4gPiBpbmRleCAyOTNmNWY3MzBlLi40
YjJiYWEwNDAzIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4gKysrIGIv
dG9vbHMveGwveGxfcGFyc2UuYwo+ID4gQEAgLTE0NjEsNiArMTQ2MSwxMDcgQEAgdm9pZCBwYXJz
ZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdfc291cmNlLAo+ID4gKyAgICBpZiAoeGx1
X2NmZ19nZXRfc3RyaW5nKGNvbmZpZywgInBhc3N0aHJvdWdoIiwgJmJ1ZiwgMCkpIHsKPiA+ICsg
ICAgICAgIGJ1ZiA9IChkX2NvbmZpZy0+bnVtX3BjaWRldnMgfHwgZF9jb25maWctPm51bV9kdGRl
dnMpCj4gPiArICAgICAgICAgICAgPyAiZW5hYmxlZCIgOiAiZGlzYWJsZWQiOwo+ID4gKyAgICB9
Cj4gPiArCj4gPiArICAgIGlmICghc3RybmNtcChidWYsICJlbmFibGVkIiwgc3RybGVuKGJ1Zikp
KSB7Cj4gCj4gRG8geW91IGludGVuZCB0byBoYXZlICJwYXNzdGhyb3VnaD0nJyIgYmVlbiB0aGUg
ZXF1aXZhbGVudCBvZgo+ICJwYXNzdGhyb3VnaD0nZW5hYmxlZCciIGluIHRoZSBjb25maWcgZmls
ZSA/Cj4gKHNhbWUgd2l0aCAiZSIsICJlbiIsICJlbmEiLCAuLi4pCgpObywgSSBndWVzcyBub3Q7
IEknbGwgZml4IHRoYXQuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
