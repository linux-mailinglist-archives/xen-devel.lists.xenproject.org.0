Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF56A899
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 14:23:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnMRG-0000mY-Ti; Tue, 16 Jul 2019 12:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nepe=VN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hnMRF-0000mT-PP
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 12:20:09 +0000
X-Inumbo-ID: 0acd8726-a7c4-11e9-901d-378f70317634
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0acd8726-a7c4-11e9-901d-378f70317634;
 Tue, 16 Jul 2019 12:20:05 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tJIf8n7QDRvp2P0g7KYwiVjzwMqfXFDu6NyXvMNQiKDztsjmZ64o5Z12nHIrIeBUK5nWTdz1Nc
 7MDan2lPkfwUeytzsnuBM6l6qrWFRxCqQSfJ96OhAWvxdZfnxKQilEhyT2M2+vj2DY0HB+MjNe
 XqVq/Zw99tkzqxdf6OXUnAqYCPksmao/rCF+b2Y/TCVMQnt/3I9dZpkSCad05q8Ufark4RZ0hi
 lS26vD7NwoTjJiGBJOJQLZ/4bmHfMAh1VMRg013aWqgpsPuLuawRA/m8PURyY+9F9CUsQe9ifa
 4D8=
X-SBRS: 2.7
X-MesageID: 3086238
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3086238"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 4/4] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
Thread-Index: AQHVO7+fLNC7vKyrB0S+UB/uvG+TD6bM+heAgAAtwjA=
Date: Tue, 16 Jul 2019 12:20:01 +0000
Message-ID: <f268871abbaf41b3811bf3296578c592@AMSPEX02CL03.citrite.net>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-5-paul.durrant@citrix.com>
 <20190716112815.xulpw3gcoilqv43k@Air-de-Roger.citrite.net>
In-Reply-To: <20190716112815.xulpw3gcoilqv43k@Air-de-Roger.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 4/4] iommu / pci: re-implement
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
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMTYgSnVseSAyMDE5IDEyOjI4Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgNC80XSBpb21tdSAvIHBjaTogcmUtaW1wbGVtZW50
IFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cC4uLgo+IAo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5
IGF0IDExOjE2OjU3QU0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IC4uLiB1c2luZyB0
aGUgbmV3IGlvbW11X2dyb3VwIGluZnJhc3RydWN0dXJlLgo+ID4KPiA+IEJlY2F1c2UgJ3NpYmxp
bmcnIGRldmljZXMgYXJlIG5vdyBtZW1iZXJzIG9mIHRoZSBzYW1lIGlvbW11X2dyb3VwLAo+ID4g
aW1wbGVtZW50IHRoZSBkb21jdGwgYnkgbG9va2luZyB1cCB0aGUgaW9tbXVfZ3JvdXAgb2YgdGhl
IHBkZXYgd2l0aCB0aGUKPiA+IG1hdGNoaW5nIFNCREYgYW5kIHRoZW4gZmluZGluZyBhbGwgdGhl
IGFzc2lnbmVkIHBkZXZzIHRoYXQgYXJlIGluIHRoZQo+ID4gZ3JvdXAuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiA+IC0tLQo+
ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Cj4gPiB2MzoKPiA+ICAt
IE1ha2UgJ21heF9zZGV2cycgcGFyYW1ldGVyIGluIGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoKSB1
bnNpZ25lZC4KPiA+ICAtIEFkZCBtaXNzaW5nIGNoZWNrIG9mIG1heF9zZGV2cyB0byBhdm9pZCBi
dWZmZXIgb3ZlcmZsb3cuCj4gPgo+ID4gdjI6Cj4gPiAgLSBSZS1pbXBsZW1lbnQgaW4gdGhlIGFi
c2VuY2Ugb2YgYSBwZXItZ3JvdXAgZGV2cyBsaXN0Lgo+ID4gIC0gTWFrZSB1c2Ugb2YgcGNpX3Ni
ZGZfdC4KPiA+IC0tLQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jIHwgNDYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMgICAgfCA1MSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgfCAgMyArKysKPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9ncm91cHMuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gPiBpbmRleCBjNmQwMDk4MGI2Li40ZTZlODAy
MmMxIDEwMDY0NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKPiA+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jCj4gPiBAQCAtMTIsOCArMTIs
MTIgQEAKPiA+ICAgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxz
Lgo+ID4gICAqLwo+ID4KPiA+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ID4gICNp
bmNsdWRlIDx4ZW4vaW9tbXUuaD4KPiA+ICsjaW5jbHVkZSA8eGVuL3BjaS5oPgo+ID4gICNpbmNs
dWRlIDx4ZW4vcmFkaXgtdHJlZS5oPgo+ID4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiA+ICsj
aW5jbHVkZSA8eHNtL3hzbS5oPgo+ID4KPiA+ICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgewo+ID4gICAg
ICB1bnNpZ25lZCBpbnQgaWQ7Cj4gPiBAQCAtODEsNiArODUsNDggQEAgaW50IGlvbW11X2dyb3Vw
X2Fzc2lnbihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdm9pZCAqYXJnKQo+ID4gICAgICByZXR1cm4g
MDsKPiA+ICB9Cj4gPgo+ID4gK2ludCBpb21tdV9nZXRfZGV2aWNlX2dyb3VwKHN0cnVjdCBkb21h
aW4gKmQsIHBjaV9zYmRmX3Qgc2JkZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBY
RU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgYnVmLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBtYXhfc2RldnMpCj4gPiArewo+ID4gKyAgICBzdHJ1Y3QgaW9t
bXVfZ3JvdXAgKmdycCA9IE5VTEw7Cj4gPiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Owo+ID4g
KyAgICB1bnNpZ25lZCBpbnQgaSA9IDA7Cj4gPiArCj4gPiArICAgIHBjaWRldnNfbG9jaygpOwo+
ID4gKwo+ID4gKyAgICBmb3JfZWFjaF9wZGV2ICggZCwgcGRldiApCj4gPiArICAgIHsKPiA+ICsg
ICAgICAgIGlmICggcGRldi0+c2JkZi5zYmRmID09IHNiZGYuc2JkZiApCj4gPiArICAgICAgICB7
Cj4gPiArICAgICAgICAgICAgZ3JwID0gcGRldi0+Z3JwOwo+ID4gKyAgICAgICAgICAgIGJyZWFr
Owo+ID4gKyAgICAgICAgfQo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIGlmICggIWdycCApCj4g
PiArICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgZm9yX2VhY2hfcGRldiAoIGQsIHBk
ZXYgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICBpZiAoIHhzbV9nZXRfZGV2aWNlX2dyb3VwKFhT
TV9IT09LLCBwZGV2LT5zYmRmLnNiZGYpIHx8Cj4gPiArICAgICAgICAgICAgIHBkZXYtPmdycCAh
PSBncnAgKQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4gKyAgICAgICAgaWYg
KCBpIDwgbWF4X3NkZXZzICYmCj4gCj4gQUZBSUNUIHlvdSBhcmUgYWRkaW5nIHRoZSBjaGVjayBo
ZXJlIGluIG9yZGVyIHRvIGtlZXAgY3VycmVudAo+IGJlaGF2aW91cj8KClllcy4KCj4gQnV0IGlz
bid0IGl0IHdyb25nIHRvIG5vdCByZXBvcnQgdG8gdGhlIGNhbGxlciB0aGF0IHRoZSBidWZmZXIg
d2FzCj4gc21hbGxlciB0aGFuIHJlcXVpcmVkLCBhbmQgdGhhdCB0aGUgcmV0dXJuZWQgcmVzdWx0
IGlzIHBhcnRpYWw/CgpHaXZlbiB0aGF0IHRoZXJlIGlzIHplcm8gZG9jdW1lbnRhdGlvbiBJIHRo
aW5rIHlvdXIgZ3Vlc3MgaXMgYXMgZ29vZCBhcyBtaW5lIGFzIHRvIHdoYXQgaW50ZW50aW9uIG9m
IHRoZSBpbXBsZW1lbnRvciB3YXMuCgo+IAo+IEkgZG9uJ3Qgc2VlIGFueSB3YXkgYSBjYWxsZXIg
Y2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhIHJlc3VsdCB0aGF0Cj4gdXNlcyB0aGUgZnVsbCBi
dWZmZXIgYW5kIG9uZSB0aGF0J3MgYWN0dWFsbHkgcGFydGlhbCBkdWUgdG8gc21hbGxlcgo+IHRo
YW4gcmVxdWlyZWQgYnVmZmVyIHByb3ZpZGVkLiBJIHRoaW5rIHRoaXMgZnVuY3Rpb24gc2hvdWxk
IHJldHVybgo+IC1FTk9TUEMgZm9yIHN1Y2ggY2FzZS4KCkknZCBwcmVmZXIgdG8gc3RpY2sgdG8g
dGhlIHByaW5jaXBsZSBvZiBubyBjaGFuZ2UgaW4gYmVoYXZpb3VyLiBUQkggSSBoYXZlIG5vdCBm
b3VuZCBhbnkgY2FsbGVyIG9mIHhjX2dldF9kZXZpY2VfZ3JvdXAoKSBhcGFydCBmcm9tIGEgcHl0
aG9uIGJpbmRpbmcgYW5kIHdobyBrbm93cyB3aGF0IHBpZWNlIG9mIGFudGlxdWF0ZWQgY29kZSBt
aWdodCBzaXQgb24gdGhlIG90aGVyIHNpZGUgb2YgdGhhdC4gRldJVyB0aGF0IGNvZGUgc2V0cyBt
YXhfc2RldnMgdG8gMTAyNCBzbyBpdCdzIHVubGlrZWx5IHRvIHJ1biBvdXQgb2Ygc3BhY2Ugc28g
YW4gRU5PU1BDIG1pZ2h0IGJlIG9rLiBTdGlsbCwgSSdkIGxpa2UgdG8gaGVhciBtYWludGFpbmVy
IG9waW5pb25zIG9uIHRoaXMuCgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
