Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC317025A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:28:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yZg-0001ka-H4; Wed, 26 Feb 2020 15:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6yZe-0001kU-Ln
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:26:10 +0000
X-Inumbo-ID: 4f0877d6-58ac-11ea-9462-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f0877d6-58ac-11ea-9462-12813bfff9fa;
 Wed, 26 Feb 2020 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582730768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0pmCs/VvEwQzSW8ndZjitMEdGAFh1MyhZJUNUSSDnO4=;
 b=DFrr2mlEgd2WBcCNphdNvLTajKSFFKc04j0Ba04rSXPuhpbnj6mHJXDY
 SJUZg4LhASl72J144mPPbmM2uknbACZ5rDjRNhykuw1uEJXePnK1gmnS8
 Gvz/YmZQJ5+xiyMnPCmYoeEpD170EJyLVchcV8bTpkrB45Eiw+yYK+66k U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sdOvr+S5+x1uSwm64TY1otEFoLldcmvJYpeMT9kZ80k+YrlEPldVJTnKuh6dr53aPH+gqF+xtf
 TUgvN8T5Z6UpdxszH4HOMmgRGdXJV3mcKnEsUj2Qb8Kfje/SVwOkWHLjKXT8XTEW0F9Uo/RJ5Z
 86cOidMq/mnacL37MJSXy0Xb2uL4tYMKc+pgYotwBHWgSrfPdofVdQiNuxCd9kF3F5qdBaPKYI
 XgTQpUQXkR0K3FsxAUfOZPQRKz/m/2DYNRmLMfbspHas795DAQc7KxaJExwQ2IEPO9tueg7/F3
 +3c=
X-SBRS: 2.7
X-MesageID: 13054499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13054499"
Date: Wed, 26 Feb 2020 16:25:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200226152556.GG24458@Air-de-Roger.citrite.net>
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <628c5cdc73c589e45a19cc0ddb5cf972b00eb3dd.1582658216.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <628c5cdc73c589e45a19cc0ddb5cf972b00eb3dd.1582658216.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v10 2/3] x86/mem_sharing: reset a fork
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMTE6MTc6NTZBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEltcGxlbWVudCBoeXBlcmNhbGwgdGhhdCBhbGxvd3MgYSBmb3JrIHRvIHNoZWQg
YWxsIG1lbW9yeSB0aGF0IGdvdCBhbGxvY2F0ZWQKPiBmb3IgaXQgZHVyaW5nIGl0cyBleGVjdXRp
b24gYW5kIHJlLWxvYWQgaXRzIHZDUFUgY29udGV4dCBmcm9tIHRoZSBwYXJlbnQgVk0uCj4gVGhp
cyBhbGxvd3MgdGhlIGZvcmtlZCBWTSB0byByZXNldCBpbnRvIHRoZSBzYW1lIHN0YXRlIHRoZSBw
YXJlbnQgVk0gaXMgaW4gYQo+IGZhc3RlciB3YXkgdGhlbiBjcmVhdGluZyBhIG5ldyBmb3JrIHdv
dWxkIGJlLiBNZWFzdXJlbWVudHMgc2hvdyBhYm91dCBhIDJ4Cj4gc3BlZWR1cCBkdXJpbmcgbm9y
bWFsIGZ1enppbmcgb3BlcmF0aW9ucy4gUGVyZm9ybWFuY2UgbWF5IHZhcnkgZGVwZW5kaW5nIGhv
dwo+IG11Y2ggbWVtb3J5IGdvdCBhbGxvY2F0ZWQgZm9yIHRoZSBmb3JrZWQgVk0uIElmIGl0IGhh
cyBiZWVuIGNvbXBsZXRlbHkKPiBkZWR1cGxpY2F0ZWQgZnJvbSB0aGUgcGFyZW50IFZNIHRoZW4g
Y3JlYXRpbmcgYSBuZXcgZm9yayB3b3VsZCBsaWtlbHkgYmUgbW9yZQo+IHBlcmZvcm1hbnQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNv
bT4KPiAtLS0KPiB2MTA6IGltcGxlbWVudGVkIGh5cGVyY2FsbCBjb250aW51YXRpb24gc2ltaWxh
ciB0byB0aGUgZXhpc3RpbmcgcmFuZ2Vfc2hhcmUgb3AKPiAtLS0KPiAgeGVuL2FyY2gveDg2L21t
L21lbV9zaGFyaW5nLmMgfCAxMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
ICB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggICB8ICAgNCArKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEyOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMKPiBpbmRleCA4ZWUzN2U2OTQzLi5hYTQzNThhYWU0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMKPiBAQCAtMTY3Myw3ICsxNjczLDYgQEAgc3RhdGljIGludCBmb3JrKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ICAgICAgICAgIGRvbWFpbl9wYXVzZShkKTsKPiAgICAg
ICAgICBjZC0+cGFyZW50X3BhdXNlZCA9IHRydWU7Cj4gICAgICAgICAgY2QtPm1heF9wYWdlcyA9
IGQtPm1heF9wYWdlczsKPiAtICAgICAgICBjZC0+bWF4X3ZjcHVzID0gZC0+bWF4X3ZjcHVzOwo+
ICAgICAgfQo+ICAKPiAgICAgIC8qIHRoaXMgaXMgcHJlZW1wdGlibGUgc28gaXQncyB0aGUgZmly
c3QgdG8gZ2V0IGRvbmUgKi8KPiBAQCAtMTcwNCw2ICsxNzAzLDkxIEBAIHN0YXRpYyBpbnQgZm9y
ayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiAgICAgIHJldHVybiByYzsK
PiAgfQo+ICAKPiArLyoKPiArICogVGhlIGZvcmsgcmVzZXQgb3BlcmF0aW9uIGlzIGludGVuZGVk
IHRvIGJlIHVzZWQgb24gc2hvcnQtbGl2ZWQgZm9ya3Mgb25seS4KPiArICovCj4gK3N0YXRpYyBp
bnQgZm9ya19yZXNldChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCwKPiArICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtZW1fc2hhcmluZ19vcF9mb3JrX3Jlc2V0ICpmcikK
PiArewo+ICsgICAgaW50IHJjID0gMDsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluKiBwMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oY2QpOwo+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgKnRtcDsK
PiArICAgIHVuc2lnbmVkIGxvbmcgbGlzdF9wb3NpdGlvbiA9IDAsIHByZWVtcHRfY291bnQgPSAw
LCBzdGFydCA9IGZyLT5vcGFxdWU7Cj4gKwo+ICsgICAgZG9tYWluX3BhdXNlKGNkKTsKPiArCj4g
KyAgICBwYWdlX2xpc3RfZm9yX2VhY2hfc2FmZShwYWdlLCB0bXAsICZjZC0+cGFnZV9saXN0KQo+
ICsgICAgewo+ICsgICAgICAgIHAybV90eXBlX3QgcDJtdDsKPiArICAgICAgICBwMm1fYWNjZXNz
X3QgcDJtYTsKPiArICAgICAgICBnZm5fdCBnZm47Cj4gKyAgICAgICAgbWZuX3QgbWZuOwo+ICsg
ICAgICAgIGJvb2wgc2hhcmVkID0gZmFsc2U7Cj4gKwo+ICsgICAgICAgIGxpc3RfcG9zaXRpb24r
KzsKPiArCj4gKyAgICAgICAgLyogUmVzdW1lIHdlcmUgd2UgbGVmdCBvZiBiZWZvcmUgcHJlZW1w
dGlvbiAqLwo+ICsgICAgICAgIGlmICggc3RhcnQgJiYgbGlzdF9wb3NpdGlvbiA8IHN0YXJ0ICkK
PiArICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgIG1mbiA9IHBhZ2VfdG9fbWZu
KHBhZ2UpOwo+ICsgICAgICAgIGlmICggbWZuX3ZhbGlkKG1mbikgKQo+ICsgICAgICAgIHsKPiAr
Cj4gKyAgICAgICAgICAgIGdmbiA9IG1mbl90b19nZm4oY2QsIG1mbik7Cj4gKyAgICAgICAgICAg
IG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbl94KGdmbiksICZwMm10LCAmcDJt
YSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIE5VTEwsIGZh
bHNlKTsKPiArCj4gKyAgICAgICAgICAgIGlmICggcDJtX2lzX3JhbShwMm10KSAmJiAhcDJtX2lz
X3NoYXJlZChwMm10KSApCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIC8qIHRh
a2UgYW4gZXh0cmEgcmVmZXJlbmNlLCBtdXN0IHdvcmsgZm9yIGEgc2hhcmVkIHBhZ2UgKi8KPiAr
ICAgICAgICAgICAgICAgIGlmKCAhZ2V0X3BhZ2UocGFnZSwgY2QpICkKPiArICAgICAgICAgICAg
ICAgIHsKPiArICAgICAgICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiArICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgIH0KPiAr
Cj4gKyAgICAgICAgICAgICAgICBzaGFyZWQgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICAgcHJl
ZW1wdF9jb3VudCArPSAweDEwOwo+ICsKPiArICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAg
ICAgICAgICAgKiBNdXN0IHN1Y2NlZWQsIGl0J3MgYSBzaGFyZWQgcGFnZSB0aGF0IGV4aXN0cyBh
bmQKPiArICAgICAgICAgICAgICAgICAqIHRodXMgaXRzIHNpemUgaXMgZ3VhcmFudGVlZCB0byBi
ZSA0ayBzbyB3ZSBhcmUgbm90IHNwbGl0dGluZwo+ICsgICAgICAgICAgICAgICAgICogbGFyZ2Ug
cGFnZXMuCj4gKyAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgIHJjID0gcDJt
LT5zZXRfZW50cnkocDJtLCBnZm4sIElOVkFMSURfTUZOLCBQQUdFX09SREVSXzRLLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1faW52YWxpZCwgcDJtX2FjY2Vzc19y
d3gsIC0xKTsKPiArICAgICAgICAgICAgICAgIEFTU0VSVCghcmMpOwo+ICsKPiArICAgICAgICAg
ICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsKPiArICAgICAgICAgICAgICAgIHB1dF9w
YWdlKHBhZ2UpOwo+ICsgICAgICAgICAgICB9Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICBp
ZiAoICFzaGFyZWQgKQo+ICsgICAgICAgICAgICBwcmVlbXB0X2NvdW50Kys7Cj4gKwo+ICsgICAg
ICAgIC8qIFByZWVtcHQgZXZlcnkgMk1pQiAoc2hhcmVkKSBvciAzMk1pQiAodW5zaGFyZWQpIC0g
YXJiaXRyYXJ5LiAqLwo+ICsgICAgICAgIGlmICggcHJlZW1wdF9jb3VudCA+PSAweDIwMDAgKQo+
ICsgICAgICAgIHsKPiArICAgICAgICAgICAgaWYgKCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygp
ICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgcmMgPSAtRVJFU1RBUlQ7Cj4g
KyAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICBw
cmVlbXB0X2NvdW50ID0gMDsKPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCBy
YyApCj4gKyAgICAgICAgZnItPm9wYXF1ZSA9IGxpc3RfcG9zaXRpb247Cj4gKyAgICBlbHNlIGlm
ICggIShyYyA9IGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcyhjZCwgZCkpICkKPiArICAgICAg
ICBmb3JrX3RzYyhjZCwgZCk7CgpZb3UgYWxzbyBuZWVkIHRvIHJlc2V0IHRoZSBjb250ZW50cyBv
ZiB0aGUgc3BlY2lhbCBwYWdlcywgdGhlCnZjcHVfaW5mbyBwYWdlcyBhbmQgdGhlIHNoYXJlZF9p
bmZvIHBhZ2UgaW4gb3JkZXIgdG8gbWF0Y2ggdGhlIHN0YXRlCnRoZSBWTSB3YXMgaW4gd2hlbiBm
b3JraW5nLgoKUFYgdGltZXJzIHNob3VsZCBhbHNvIGJlIHJlc2V0IHRvIHBhcmVudCdzIHN0YXRl
IEFGQUlDVCwgb3IgZWxzZSB5b3UKd2lsbCBnZXQgc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4K
CkluIGZhY3QgeW91IHNob3VsZCBjaGVjayBhZ2FpbnN0IHRoZSBzdGF0ZSBvZiB0aGUgcGFyZW50
LCBiZWNhdXNlIHRoZQpmb3JrIG1pZ2h0IGhhdmUgY2hhbmdlZCB0aGUgcG9zaXRpb24gb2YgdGhl
IHNoYXJlZCBpbmZvIG9yIGFueSBvdGhlcgpvZiB0aG9zZSBtYWdpYyBhcmVhcywgYW5kIHRoYXQg
c2hvdWxkIGJlIHJldmVydGVkIHRvIHRoZSBzdGF0ZSB0aGV5CmFyZSBpbiB0aGUgcGFyZW50LgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
