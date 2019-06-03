Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296832D5D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjjm-0004pw-1e; Mon, 03 Jun 2019 09:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cTbP=UC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hXjjk-0004pr-Bo
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:58:40 +0000
X-Inumbo-ID: 267c86f2-85e6-11e9-9f2f-8fb4a3fc0d80
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 267c86f2-85e6-11e9-9f2f-8fb4a3fc0d80;
 Mon, 03 Jun 2019 09:58:35 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: b2uhS+U3k1pr0WrYfUxbKtiFw9YK09QM+gDZoq/yQbzy6f6MVF8jgtzMMj7XJVP6KPEsn/SelY
 VbSrDwqUCygCAsGaMalXKqKSyV4Al4gHAZzoR202A1vEOVvgMIg61SuoHgVN7z1c8YpYVoa6gX
 md/eEQt4WgnXv0ltrV0wCn/pMeksCiKSH0fxvxMcvvAQ1yQ6uNHe6QvF3bMrrsZiN+3XBjvK9f
 PQv6yOkF+vrPrfctF9fYLtrOvbrl/eXUDK0p36JmPNuKuW87/I9gmk9a5HONMKNJxbBD/boq0g
 jTw=
X-SBRS: 2.7
X-MesageID: 1233932
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1233932"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 5/5] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
Thread-Index: AQHVBaFS8SjHUgjrakaMBQvW0JvQ+qZrzi4AgB4LDuA=
Date: Mon, 3 Jun 2019 09:58:31 +0000
Message-ID: <e3c64e80f918475aab7109d2a5e51cf9@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-6-paul.durrant@citrix.com>
 <20190515090630.xz7yi4g67uc6hlnn@Air-de-Roger>
In-Reply-To: <20190515090630.xz7yi4g67uc6hlnn@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/5] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDE1IE1heSAyMDE5IDEwOjA3Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0gg
NS81XSBpb21tdSAvIHBjaTogcmUtaW1wbGVtZW50IFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91
cC4uLgo+IAo+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDAyOjI0OjAzUE0gKzAxMDAsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+IC4uLiB1c2luZyB0aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3Ry
dWN0dXJlLgo+ID4KPiA+IEJlY2F1c2UgJ3NpYmxpbmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJz
IG9mIHRoZSBzYW1lIGlvbW11X2dyb3VwLAo+ID4gaW1wbGVtZW50IHRoZSBkb21jdGwgYnkgbG9v
a2luZyB1cCB0aGUgcmVsZXZhbnQgaW9tbXVfZ3JvdXAgYW5kIHdhbGtpbmcKPiA+IHRoZSBtZW1i
ZXJzaGlwIGxpc3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA2
NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgfCA0NyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAgfCAgMiArKwo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9pb21tdS5jCj4gPiBpbmRleCAxMTMxOWZiYWFlLi40OTE0MGM2NTJlIDEwMDY0
NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gQEAgLTcyOSw2ICs3MjksNzEgQEAgaW50
IGlvbW11X2dyb3VwX2Fzc2lnbihzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICAgICAgcmV0dXJu
IDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgc3RydWN0IGlvbW11X2dyb3VwICppb21tdV9ncm91
cF9sb29rdXAodWludDE2X3Qgc2VnLCB1aW50OF90IGJ1cywKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBkZXZmbikKPiAKPiBDb3VsZCB5
b3UgdXNlIHBjaV9zYmRmX3QgdG8gcGFzcyB0aGUgU0JERj8KPiAKClByb2JhYmx5LCBJJ2Qgbm90
IG5vdGljZWQgaXRzIGV4aXN0ZW5jZSBzbyBJJ2xsIHVzZSBpdCB3aGVuIEkgY2FuLgoKPiA+ICt7
Cj4gPiArICAgIHVuc2lnbmVkIGludCBpZCA9IDA7Cj4gPiArICAgIHN0cnVjdCBpb21tdV9ncm91
cCAqZ3JwOwo+ID4gKwo+ID4gKyAgICB3aGlsZSAoIHJhZGl4X3RyZWVfZ2FuZ19sb29rdXAoJmlv
bW11X2dyb3VwcywgKHZvaWQgKiopJmdycCwgaWQsIDEpICkKPiA+ICsgICAgewo+ID4gKyAgICAg
ICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4gPiArCj4gPiArICAgICAgICBsaXN0X2Zvcl9lYWNo
X2VudHJ5ICggcGRldiwgJmdycC0+ZGV2c19saXN0LCBncnBkZXZzX2xpc3QgKQo+ID4gKyAgICAg
ICAgICAgIGlmICggcGRldi0+c2VnID09IHNlZyAmJiBwZGV2LT5idXMgPT0gYnVzICYmCj4gPiAr
ICAgICAgICAgICAgICAgICBwZGV2LT5kZXZmbiA9PSBkZXZmbiApCj4gPiArICAgICAgICAgICAg
ICAgIHJldHVybiBncnA7Cj4gPiArCj4gPiArICAgICAgICBpZCA9IGdycC0+aWQgKyAxOwo+ID4g
KyAgICB9Cj4gPiArCj4gPiArICAgIHJldHVybiBOVUxMOwo+ID4gK30KPiA+ICsKPiA+ICtpbnQg
aW9tbXVfZ2V0X2RldmljZV9ncm91cChzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMs
IHU4IGRldmZuLAo+IAo+IFVzaW5nIHBjaV9zYmRmX3Qgd291bGQgYmUgYmV0dGVyIGhlcmUgdG8g
cGFzcyB0aGUgU0JERiBJTU8sIG9yCj4gdWludDxzaXplPl90LCBvciBqdXN0IHBsYWluIHVuc2ln
bmVkIGludC4KPiAKPiBBbHNvLCBJIHdvbmRlciBhYm91dCB0aGUgdXNlZnVsbmVzcyBvZiB0aGUg
ZG9tYWluIHBhcmFtZXRlciwgc2hvdWxkbid0Cj4geW91IGRvIHRoZSBvd25lcnNoaXAgY2hlY2sg
c29tZXdoZXJlIGVsc2UgKGlmIHJlcXVpcmVkKSBhbmQgaGF2ZSB0aGlzCj4gZnVuY3Rpb24ganVz
dCBjaGVjayB0aGUgSU9NTVUgZ3JvdXAgb2YgYSBnaXZlbiBQQ0kgIGRldmljZT8KPiAKPiAoTm90
ZSB5b3UgcHJvYmFibHkgd2FudCB0byBjb25zdGlmeSB0aGUgZG9tYWluIHBhcmFtZXRlciBpZiBp
dCBuZWVkcyB0bwo+IHN0YXkpLgoKWWVzIGFuZCBuby4gVGhpcyBpcyB0aGUgaW1wbGVtZW50YXRp
b24gb2YgYW4gZXhpc3RpbmcgZG9tY3RsIHNvIGl0J3Mgc2VtYW50aWNzIGFyZSBiYWtlZCBpbi4g
SSB0aGluayBJIGNhbiB1c2UgcGNpX3NiZGZfdCBidXQgdGhlIGRvbWFpbiBwYXJhbWV0ZXIgbmVl
ZHMgdG8gc3RheS4KCj4gCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0dVRVNU
X0hBTkRMRV82NCh1aW50MzIpIGJ1ZiwgaW50IG1heF9zZGV2cykKPiA+ICt7Cj4gPiArICAgIHN0
cnVjdCBpb21tdV9ncm91cCAqZ3JwOwo+ID4gKyAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsKPiA+
ICsgICAgaW50IGkgPSAwOwo+IAo+IEl0IHNlZW1zIGxpa2UgdGhpcyBzaG91bGQgYmUgdW5zaWdu
ZWQgaW50Pwo+IAoKWWVzLCBJIGd1ZXNzIGl0IGNvdWxkIGJlLgoKPiA+ICsKPiA+ICsgICAgcGNp
ZGV2c19sb2NrKCk7Cj4gPiArCj4gPiArICAgIGdycCA9IGlvbW11X2dyb3VwX2xvb2t1cChzZWcs
IGJ1cywgZGV2Zm4pOwo+ID4gKyAgICBpZiAoICFncnAgKQo+ID4gKyAgICB7Cj4gPiArICAgICAg
ICBwY2lkZXZzX3VubG9jaygpOwo+ID4gKyAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgIH0KPiA+
ICsKPiA+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZncnAtPmRldnNfbGlzdCwg
Z3JwZGV2c19saXN0ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgdWludDMyX3Qgc2JkZjsKPiA+
ICsKPiA+ICsgICAgICAgIGlmICggaSA+PSBtYXhfc2RldnMgKQo+ID4gKyAgICAgICAgICAgIGJy
ZWFrOwo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCBwZGV2LT5kb21haW4gIT0gZCApCj4gPiArICAg
ICAgICAgICAgY29udGludWU7Cj4gPiArCj4gPiArICAgICAgICBzYmRmID0gUENJX1NCREYzKHBk
ZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbik7Cj4gPiArCj4gPiArICAgICAgICBpZiAo
IHhzbV9nZXRfZGV2aWNlX2dyb3VwKFhTTV9IT09LLCBzYmRmKSApCj4gPiArICAgICAgICAgICAg
Y29udGludWU7Cj4gPiArCj4gPiArICAgICAgICBpZiAoIHVubGlrZWx5KGNvcHlfdG9fZ3Vlc3Rf
b2Zmc2V0KGJ1ZiwgaSwgJnNiZGYsIDEpKSApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAgICAg
ICAgcGNpZGV2c191bmxvY2soKTsKPiA+ICsgICAgICAgICAgICByZXR1cm4gLTE7Cj4gCj4gLUVG
QVVMVD8KPiAKClllcy4uLiB0aGVuIEkgY2FuIGdldCByaWQgb2YgdGhlIG92ZXJyaWRlIG9mIHRo
ZSByZXQgdmFsdWUgaW4gdGhlIGNhbGxpbmcgY29kZS4KCiAgUGF1bAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
