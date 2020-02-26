Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AB1703DC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:12:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zGo-0007Nl-6r; Wed, 26 Feb 2020 16:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6zGm-0007NV-F5
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:10:44 +0000
X-Inumbo-ID: 8a089f19-58b2-11ea-947c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a089f19-58b2-11ea-947c-12813bfff9fa;
 Wed, 26 Feb 2020 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582733444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZVFpqg2U9bFkuw3L15/blSWkjmz/0mQNV3iwXK2Buhw=;
 b=I9/hHP5p05cbYx19HSrSnaHJxVZKizj9d6Qo3zUGK8w2u7BJhmZk0nM1
 Pwc9z6qpPKjoRWBwfLhXV3y+kMR/3h63ma/+/Ga/rf5yPdgdzPCPKGrk0
 gg7ghBXwAXmVvrKvnbsvvy8IZyDDx0rUOs/mGt0NpmaV7B0JUptb4ErIm U=;
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
IronPort-SDR: CXVallMrjpmRdxhf2RzXqnHexvGBRpckxyOQ0mJYGb8XRIsrCNuLPtKFQ7oDNpMiyHkcLeF246
 Da0dH2RMgjP+bOcfgQfXWyrtqwvC9x04thJHBYnIX9nqFi6Pd8NW2kid37LoPP9LR5dpRj+JSq
 3/Ox1cMeax72QB6rzKDVVsm4dvgDOskGcqk5xfEweyyj/YMz/rNNhQCAio1zSWrWDPiaTIpq0r
 SFH327w698rBRGbHEeOx0skEtRy0av0trTYCqS7RnDJRHL5MwrXHuhQwzL+WDfqv1IawUynL9A
 7Xc=
X-SBRS: 2.7
X-MesageID: 13033152
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13033152"
Date: Wed, 26 Feb 2020 17:10:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200226161036.GJ24458@Air-de-Roger.citrite.net>
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
 <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
 <20200226153621.GH24458@Air-de-Roger.citrite.net>
 <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v10 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDg6NTg6MDVBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDg6MzYgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgRmViIDI2LCAy
MDIwIGF0IDA4OjIwOjMwQU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gPiA+
ICtzdGF0aWMgaW50IHBvcHVsYXRlX3NwZWNpYWxfcGFnZXMoc3RydWN0IGRvbWFpbiAqY2QpCj4g
PiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dl
dF9ob3N0cDJtKGNkKTsKPiA+ID4gPiA+ICsgICAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBw
YXJhbXNbXSA9Cj4gPiA+ID4gPiArICAgIHsKPiA+ID4gPiA+ICsgICAgICAgIEhWTV9QQVJBTV9T
VE9SRV9QRk4sCj4gPiA+ID4gPiArICAgICAgICBIVk1fUEFSQU1fSU9SRVFfUEZOLAo+ID4gPiA+
ID4gKyAgICAgICAgSFZNX1BBUkFNX0JVRklPUkVRX1BGTiwKPiA+ID4gPiA+ICsgICAgICAgIEhW
TV9QQVJBTV9DT05TT0xFX1BGTgo+ID4gPiA+ID4gKyAgICB9Owo+ID4gPiA+ID4gKyAgICB1bnNp
Z25lZCBpbnQgaTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgZm9yICggaT0wOyBpPDQ7IGkr
KyApCj4gPiA+ID4KPiA+ID4gPiBOaXQ6IGNhbiB5b3UgcGxlYXNlIGFkZCBzb21lIHNwYWNlcyBh
cm91bmQgdGhlIG9wZXJhdG9ycz8KPiA+ID4KPiA+ID4gU3VyZS4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+ID4gKyAgICB7Cj4gPiA+ID4gPiArICAgICAgICB1aW50NjRfdCB2YWx1ZSA9IDA7Cj4gPiA+
ID4gPiArICAgICAgICBtZm5fdCBuZXdfbWZuOwo+ID4gPiA+ID4gKyAgICAgICAgc3RydWN0IHBh
Z2VfaW5mbyAqcGFnZTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgIGlmICggaHZtX2dl
dF9wYXJhbShjZCwgcGFyYW1zW2ldLCAmdmFsdWUpIHx8ICF2YWx1ZSApCj4gPiA+ID4gPiArICAg
ICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICBpZiAoICEo
cGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShjZCwgMCkpICkKPiA+ID4gPiA+ICsgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgIG5ld19tZm4g
PSBwYWdlX3RvX21mbihwYWdlKTsKPiA+ID4gPiA+ICsgICAgICAgIHNldF9ncGZuX2Zyb21fbWZu
KG1mbl94KG5ld19tZm4pLCB2YWx1ZSk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICBy
ZXR1cm4gcDJtLT5zZXRfZW50cnkocDJtLCBfZ2ZuKHZhbHVlKSwgbmV3X21mbiwgUEFHRV9PUkRF
Ul80SywKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3J3
LCBwMm0tPmRlZmF1bHRfYWNjZXNzLCAtMSk7Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHlvdSBh
bHNvIG5lZWQgdG8gY29weSB0aGUgY29udGVudHMgZnJvbSB0aGUgcGFyZW50IHBhZ2UgaGVyZS4K
PiA+ID4KPiA+ID4gVGhlIHRvb2xzdGFjayBzaW1wbHkgY2xlYXJzIHRoZXNlIHBhZ2VzIGR1cmlu
ZyByZXN0b3JlIHNvIEknbSBub3Qgc3VyZQo+ID4gPiAoc2VlIGh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVf
eDg2X2h2bS5jO2g9M2Y3ODI0OGYzMmZlYzIzOWRiNzdiMGU0ODNiMDE5NTIxMWU2Yjk3NDtoYj1I
RUFEI2w2MSkuCj4gPiA+IEkgZG9uJ3Qgc2VlIHdoeSB5b3Ugd291bGQgaGF2ZSB0byBjbGVhciB0
aGUgcGFnZXMgZmlyc3QgaWYgdGhleSBnZXQKPiA+ID4gb3ZlcndyaXR0ZW4gYnkgc2F2ZWQgdmVy
c2lvbnMgbGF0ZXIuIE9yIHRoZXNlIHBhZ2VzIGFyZSBleHBlY3RlZCB0byBiZQo+ID4gPiB0b3Ju
LWRvd24gYnkgdGhlIHNhdmUvcmVzdG9yZSBhd2FyZSBndWVzdHM/Cj4gPgo+ID4gR3Vlc3RzIHVz
aW5nIHRob3NlIHBhZ2VzIGtub3cgdGhleSBhcmUgdG9ybiBkb3duIGR1cmluZyBzdXNwZW5kL3Jl
c3VtZQo+ID4gYW5kIGV4cGVjdCB0byBmaW5kIGEgY2xlYW4gc3RhdGUgd2hlbiByZXN1bWluZy4g
VGhhdCdzIG5vdCB0aGUgY2FzZSB3aXRoCj4gPiBmb3JraW5nIGhvd2V2ZXIsIGFzIHRoZSBndWVz
dCBpcyBjb21wbGV0ZWx5IHVuYXdhcmUgb2YgdGhlIGZvcmsKPiA+IGhhcHBlbmluZy4KPiA+Cj4g
PiBPbmUgdGhpbmcgSSdtIG5vdCBzdXJlIG9mIGlzIHdoZXRoZXIgdGhlIGJhY2tlbmRzICh4ZW5z
dG9yZWQsCj4gPiB4ZW5jb25zb2xlZCkgd2lsbCBjb3BlIHdpdGggdGhvc2UgcGFnZXMgYmVpbmcg
YWxyZWFkeSBwb3B1bGF0ZWQgb24KPiA+IGd1ZXN0IGNyZWF0aW9uLgo+ID4KPiA+IEFGQUlDVCBh
bm90aGVyIGlzc3VlIGlzIHRoYXQgeGVuc3RvcmUgd2F0Y2hlcyBhcmUgbm90IGNvcGllZCBvdmVy
IGZyb20KPiA+IHRoZSBwYXJlbnQsIHNvIGFueSB3YXRjaGVzIHRoZSBwYXJlbnQgbWlnaHQgaGF2
ZSBzZXQgd2lsbCBub3QgZmlyZSBvbgo+ID4gdGhlIGNoaWxkLiBUaGF0IHdvdWxkIHJlcXVpcmUg
c29tZSBraW5kIG9mIGludGVyYWN0aW9uIHdpdGggeGVuc3RvcmVkCj4gPiBpbiBvcmRlciB0byBy
ZXF1ZXN0IGEgZ3Vlc3Qgc3RhdGUgdG8gYmUgY29waWVkIG92ZXIgdG8gYW5vdGhlciBndWVzdC4K
PiAKPiBTb3VuZHMgbGlrZSBpdCBtb3N0IGxpa2VseSB3b3VsZCBuZWVkIHRvIGJlIGhhbmRsZWQg
aWYgdGhlIGd1ZXN0IHVzZXMKPiB0aGVtLiBJJ20gbm90IHN1cmUgaWYgYSBkZWZhdWx0IExpbnV4
IEhWTSBndWVzdCB1c2VzIHRoZW0gdGhvdWdoLgoKTGludXggUFZIVk0gZG9lcyB1c2UgeGVuc3Rv
cmUgd2F0Y2hlcyB0byBtb25pdG9yIGJhY2tlbmQgc3RhdGUKY2hhbmdlcywgYnV0IGl0IHdvdWxk
IHJlcXVpcmUgYSBub24tdHJpdmlhbCBhbW91bnQgb2Ygd29yayB0byBjbG9uZQp0aGUgc3RhdGUg
b2YgUFYgZGV2aWNlcywgc28gSSBndWVzcyBpdCdzIHNvbWV0aGluZyB0byBiZSBsZWZ0IGFzIGEK
VE9ETyBpdGVtLgoKPiBBCj4gV2luZG93cyBIVk0gZ3Vlc3Qgd2l0aG91dCB0aGUgUFYgZHJpdmVy
cyBpcyBjZXJ0YWlubHkgbm90IFhlbiBhd2FyZSBzbwo+IHRoZXJlIHRoaW5ncyBhbHJlYWR5IHdv
cmsganVzdCBmaW5lIGFuZCB0aGF0IGlzIG91ciBwcmltYXJ5IHRhcmdldCBmb3IKPiBvdXIgdXNl
LWNhc2UuIFBWSFZNL1BWSCBMaW51eCBndWVzdHMgYXJlIG5vdC4gU28gdGhhdCdzIHJlYWxseSBv
dXRzaWRlCj4gdGhlIHNjb3BlIG9mIHdoYXQgSSBjYW4gY29udHJpYnV0ZSBhdCB0aGUgbW9tZW50
LgoKU3VyZS4KCkNhbiB5b3UgcGxlYXNlIGFkZCBhIFRPRE8gaXRlbSBoZXJlIHRvIG5vdGUgdGhh
dCB0aGUgY29udGVudHMgb2YgdGhvc2UKc3BlY2lhbCBwYWdlcyBsaWtlbHkgbmVlZCB0byBiZSBj
b3BpZWQgb3ZlciwgYW5kIHRoYXQgdGhlIHN0YXRlIG9mIFBWCmRldmljZXMgYW5kIGludGVyZmFj
ZXMgdGhhdCByZWx5IG9uIGJhY2tlbmRzIHJ1bm5pbmcgaW4gdXNlcnNwYWNlIGlzCm5vdCBoYW5k
bGVkIGF0IGFsbC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
