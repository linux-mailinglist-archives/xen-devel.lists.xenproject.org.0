Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9D6989C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:51:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn3Db-0003Oh-QI; Mon, 15 Jul 2019 15:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hn3DZ-0003OW-SJ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:48:45 +0000
X-Inumbo-ID: 060dfec0-a718-11e9-9512-337b102d028d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 060dfec0-a718-11e9-9512-337b102d028d;
 Mon, 15 Jul 2019 15:48:43 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DCydWCRkz0+Oelrjr027paoVmkBjHDKLYzSy0j43PYy8ioNiILxjWhZqZsbCkfk7ty20czzJYT
 wUVpFahkBq3THB/hacFkoCVL0QfYHs4Lt//p3uHfHd9/Rb2gBjgtZ4DdvMOaKsAgLNMmmudxT9
 X7UDYr7NQm6rQNr4xTjsPrq+tL6h8j9Ew08+gUDx8+Nfqqm42aXiLQwe7QBtG/obLbHnLz/lGW
 /mPUDEQ6tolnP4c5NCfsFDXRQJftgUgfIgI+yho/jpJGV+tFd3KAgUHo3GJnDvobNp+pXzlUd7
 Wx4=
X-SBRS: 2.7
X-MesageID: 3056580
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3056580"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/4] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
Thread-Index: AQHVOwoJr8fkRy1st0OAtL5K9rG48qbLsTQAgAAh2DA=
Date: Mon, 15 Jul 2019 15:48:40 +0000
Message-ID: <c275619d25a545b1abc7df1869df506e@AMSPEX02CL03.citrite.net>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-5-paul.durrant@citrix.com>
 <20190715154602.mndwawkgavs7mbqg@Air-de-Roger.citrite.net>
In-Reply-To: <20190715154602.mndwawkgavs7mbqg@Air-de-Roger.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/4] iommu / pci: re-implement
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMTUgSnVseSAyMDE5IDE2OjQ2Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgNC80XSBpb21tdSAvIHBjaTogcmUtaW1wbGVtZW50
IFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cC4uLgo+IAo+IE9uIE1vbiwgSnVsIDE1LCAyMDE5
IGF0IDAxOjM3OjEwUE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IC4uLiB1c2luZyB0
aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3RydWN0dXJlLgo+ID4KPiA+IEJlY2F1c2UgJ3NpYmxp
bmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJzIG9mIHRoZSBzYW1lIGlvbW11X2dyb3VwLAo+ID4g
aW1wbGVtZW50IHRoZSBkb21jdGwgYnkgbG9va2luZyB1cCB0aGUgaW9tbXVfZ3JvdXAgb2YgdGhl
IHBkZXYgd2l0aCB0aGUKPiA+IG1hdGNoaW5nIFNCREYgYW5kIHRoZW4gZmluZGluZyBhbGwgdGhl
IGFzc2lnbmVkIHBkZXZzIHRoYXQgYXJlIGluIHRoZQo+ID4gZ3JvdXAuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiA+IC0tLQo+
ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Cj4gPiB2MjoKPiA+ICAt
IFJlLWltcGxlbWVudCBpbiB0aGUgYWJzZW5jZSBvZiBhIHBlci1ncm91cCBkZXZzIGxpc3QuCj4g
PiAgLSBNYWtlIHVzZSBvZiBwY2lfc2JkZl90Lgo+ID4gLS0tCj4gPiAgeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvZ3JvdXBzLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgfCA1MSArKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11Lmgg
ICAgICAgICAgfCAgMiArKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
NDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2dyb3Vwcy5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiA+IGluZGV4
IDFhMmY0NjFjODcuLjZkODA2NGU0ZjQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9ncm91cHMuYwo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBz
LmMKPiA+IEBAIC0xMiw4ICsxMiwxMiBAQAo+ID4gICAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCj4gPiAgICovCj4gPgo+ID4gKyNpbmNsdWRlIDx4ZW4vZ3Vl
c3RfYWNjZXNzLmg+Cj4gPiAgI2luY2x1ZGUgPHhlbi9pb21tdS5oPgo+ID4gKyNpbmNsdWRlIDx4
ZW4vcGNpLmg+Cj4gPiAgI2luY2x1ZGUgPHhlbi9yYWRpeC10cmVlLmg+Cj4gPiArI2luY2x1ZGUg
PHhlbi9zY2hlZC5oPgo+ID4gKyNpbmNsdWRlIDx4c20veHNtLmg+Cj4gPgo+ID4gIHN0cnVjdCBp
b21tdV9ncm91cCB7Cj4gPiAgICAgIHVuc2lnbmVkIGludCBpZDsKPiA+IEBAIC04MSw2ICs4NSw0
NiBAQCBpbnQgaW9tbXVfZ3JvdXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB2b2lkICph
cmcpCj4gPiAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAraW50IGlvbW11X2dldF9kZXZp
Y2VfZ3JvdXAoc3RydWN0IGRvbWFpbiAqZCwgcGNpX3NiZGZfdCBzYmRmLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQodWludDMyKSBidWYsIGludCBt
YXhfc2RldnMpCj4gCj4gbWF4X3NkZXZzIHNob3VsZCBiZSB1bnNpZ25lZCBBRkFJQ1QsIGJ1dCBp
dCBzZWVtcyB0byBiZSBjb21wbGV0ZWx5Cj4gdW51c2VkLiBJIHRoaW5rIHlvdSB3YW50IHRvIGRv
Li4uCj4gCj4gPiArewo+ID4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycCA9IE5VTEw7Cj4g
PiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Owo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaSA9IDA7
Cj4gPiArCj4gPiArICAgIHBjaWRldnNfbG9jaygpOwo+ID4gKwo+ID4gKyAgICBmb3JfZWFjaF9w
ZGV2ICggZCwgcGRldiApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIGlmICggcGRldi0+c2JkZi5z
YmRmID09IHNiZGYuc2JkZiApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAgICAgICAgZ3JwID0g
cGRldi0+Z3JwOwo+ID4gKyAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgfQo+ID4gKyAg
ICB9Cj4gPiArCj4gPiArICAgIGlmICggIWdycCApCj4gPiArICAgICAgICBnb3RvIG91dDsKPiA+
ICsKPiA+ICsgICAgZm9yX2VhY2hfcGRldiAoIGQsIHBkZXYgKQo+ID4gKyAgICB7Cj4gCj4gaWYg
KCBpID09IG1heF9zZGV2cyApCj4gewo+ICAgICBwY2lkZXZzX3VubG9jaygpOwo+ICAgICByZXR1
cm4gLUVOT1NQQzsKPiB9CgpPaCwgSSdtIHN1cmUgSSB1c2VkIHRvIGhhdmUgdGhhdC4uLiBJIGRv
bid0IGtub3cgaG93IGl0IGdvdCBkcm9wcGVkLiBJdCBjZXJ0YWlubHkgbmVlZHMgdG8gYmUgdGhl
cmUuCgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
