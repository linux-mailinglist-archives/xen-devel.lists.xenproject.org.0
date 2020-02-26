Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712981702C0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:39:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yjf-0002lf-8y; Wed, 26 Feb 2020 15:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6yje-0002la-6F
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:36:30 +0000
X-Inumbo-ID: c16299bf-58ad-11ea-9463-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c16299bf-58ad-11ea-9463-12813bfff9fa;
 Wed, 26 Feb 2020 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582731389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WlyGlrlqxGikGndrvaoQF4uvk+9o3yeqkEJc+67y3x8=;
 b=J0oYGpiSxjBIFeLl4PTMF4BX098IDHVXsst16mm2kfnoTAkJYgK9fQr5
 LftrSzk/W8kXBVy6fT6cNJlbXRVBBHh7QbeLp9syaoOp/NAFF6OXa8BYT
 zFugaFBr7JkfAaMnRhuTZ2cQXszJonVgfnLSp2e6dB2AdMUaI+cm+OofB g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WIc4HQUUO2FNwso5/uzUbHsuSvtdvLdsvI8JrCoSQlb8oTjRLoQXQpdtQjWPlUBMqLDD76agVo
 NJz3cdED+zHMcTrttmsLnABasH4vm1+Bt00NUCC9y1CWxr0WsQeUlGAt2UvP0OgCurIxmCk+5C
 BvhIzHg47lXeKwkyPdtVKUCwGWmaUbHK0bppEQhG5l/EUpp0GDB/4DLKORSrwgkg0580WN624q
 qpOBxuJ+YyFskJwh0OIlnuf6ddfxDv+4JfGRbgErdfKJCOWyF6nNhydkg376wsRpwvHNEqHMX8
 Fg0=
X-SBRS: 2.7
X-MesageID: 13400385
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13400385"
Date: Wed, 26 Feb 2020 16:36:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200226153621.GH24458@Air-de-Roger.citrite.net>
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
 <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDg6MjA6MzBBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gPiArc3RhdGljIGludCBwb3B1bGF0ZV9zcGVjaWFsX3BhZ2VzKHN0cnVjdCBk
b21haW4gKmNkKQo+ID4gPiArewo+ID4gPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oY2QpOwo+ID4gPiArICAgIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
cGFyYW1zW10gPQo+ID4gPiArICAgIHsKPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX1NUT1JFX1BG
TiwKPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX0lPUkVRX1BGTiwKPiA+ID4gKyAgICAgICAgSFZN
X1BBUkFNX0JVRklPUkVRX1BGTiwKPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX0NPTlNPTEVfUEZO
Cj4gPiA+ICsgICAgfTsKPiA+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ID4gKwo+ID4gPiAr
ICAgIGZvciAoIGk9MDsgaTw0OyBpKysgKQo+ID4KPiA+IE5pdDogY2FuIHlvdSBwbGVhc2UgYWRk
IHNvbWUgc3BhY2VzIGFyb3VuZCB0aGUgb3BlcmF0b3JzPwo+IAo+IFN1cmUuCj4gCj4gPgo+ID4g
PiArICAgIHsKPiA+ID4gKyAgICAgICAgdWludDY0X3QgdmFsdWUgPSAwOwo+ID4gPiArICAgICAg
ICBtZm5fdCBuZXdfbWZuOwo+ID4gPiArICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgIGlmICggaHZtX2dldF9wYXJhbShjZCwgcGFyYW1zW2ldLCAm
dmFsdWUpIHx8ICF2YWx1ZSApCj4gPiA+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKwo+
ID4gPiArICAgICAgICBpZiAoICEocGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShjZCwgMCkpICkK
PiA+ID4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICsgICAgICAg
IG5ld19tZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKPiA+ID4gKyAgICAgICAgc2V0X2dwZm5fZnJv
bV9tZm4obWZuX3gobmV3X21mbiksIHZhbHVlKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICByZXR1
cm4gcDJtLT5zZXRfZW50cnkocDJtLCBfZ2ZuKHZhbHVlKSwgbmV3X21mbiwgUEFHRV9PUkRFUl80
SywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fcncsIHAybS0+
ZGVmYXVsdF9hY2Nlc3MsIC0xKTsKPiA+Cj4gPiBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgdG8gY29w
eSB0aGUgY29udGVudHMgZnJvbSB0aGUgcGFyZW50IHBhZ2UgaGVyZS4KPiAKPiBUaGUgdG9vbHN0
YWNrIHNpbXBseSBjbGVhcnMgdGhlc2UgcGFnZXMgZHVyaW5nIHJlc3RvcmUgc28gSSdtIG5vdCBz
dXJlCj4gKHNlZSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJs
b2I7Zj10b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYztoPTNmNzgyNDhmMzJmZWMy
MzlkYjc3YjBlNDgzYjAxOTUyMTFlNmI5NzQ7aGI9SEVBRCNsNjEpLgo+IEkgZG9uJ3Qgc2VlIHdo
eSB5b3Ugd291bGQgaGF2ZSB0byBjbGVhciB0aGUgcGFnZXMgZmlyc3QgaWYgdGhleSBnZXQKPiBv
dmVyd3JpdHRlbiBieSBzYXZlZCB2ZXJzaW9ucyBsYXRlci4gT3IgdGhlc2UgcGFnZXMgYXJlIGV4
cGVjdGVkIHRvIGJlCj4gdG9ybi1kb3duIGJ5IHRoZSBzYXZlL3Jlc3RvcmUgYXdhcmUgZ3Vlc3Rz
PwoKR3Vlc3RzIHVzaW5nIHRob3NlIHBhZ2VzIGtub3cgdGhleSBhcmUgdG9ybiBkb3duIGR1cmlu
ZyBzdXNwZW5kL3Jlc3VtZQphbmQgZXhwZWN0IHRvIGZpbmQgYSBjbGVhbiBzdGF0ZSB3aGVuIHJl
c3VtaW5nLiBUaGF0J3Mgbm90IHRoZSBjYXNlIHdpdGgKZm9ya2luZyBob3dldmVyLCBhcyB0aGUg
Z3Vlc3QgaXMgY29tcGxldGVseSB1bmF3YXJlIG9mIHRoZSBmb3JrCmhhcHBlbmluZy4KCk9uZSB0
aGluZyBJJ20gbm90IHN1cmUgb2YgaXMgd2hldGhlciB0aGUgYmFja2VuZHMgKHhlbnN0b3JlZCwK
eGVuY29uc29sZWQpIHdpbGwgY29wZSB3aXRoIHRob3NlIHBhZ2VzIGJlaW5nIGFscmVhZHkgcG9w
dWxhdGVkIG9uCmd1ZXN0IGNyZWF0aW9uLgoKQUZBSUNUIGFub3RoZXIgaXNzdWUgaXMgdGhhdCB4
ZW5zdG9yZSB3YXRjaGVzIGFyZSBub3QgY29waWVkIG92ZXIgZnJvbQp0aGUgcGFyZW50LCBzbyBh
bnkgd2F0Y2hlcyB0aGUgcGFyZW50IG1pZ2h0IGhhdmUgc2V0IHdpbGwgbm90IGZpcmUgb24KdGhl
IGNoaWxkLiBUaGF0IHdvdWxkIHJlcXVpcmUgc29tZSBraW5kIG9mIGludGVyYWN0aW9uIHdpdGgg
eGVuc3RvcmVkCmluIG9yZGVyIHRvIHJlcXVlc3QgYSBndWVzdCBzdGF0ZSB0byBiZSBjb3BpZWQg
b3ZlciB0byBhbm90aGVyIGd1ZXN0LgoKPiA+ID4gK3N0YXRpYyBpbnQgZm9yayhzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiA+ID4gK3sKPiA+ID4gKyAgICBpbnQgcmMgPSAt
RUJVU1k7Cj4gPiA+ICsKPiA+ID4gKyAgICBpZiAoICFjZC0+Y29udHJvbGxlcl9wYXVzZV9jb3Vu
dCApCj4gPiA+ICsgICAgICAgIHJldHVybiByYzsKPiA+ID4gKwo+ID4gPiArICAgIC8qCj4gPiA+
ICsgICAgICogV2Ugb25seSB3YW50IHRvIGdldCBhbmQgcGF1c2UgdGhlIHBhcmVudCBvbmNlLCBu
b3QgZWFjaCB0aW1lIHRoaXMKPiA+ID4gKyAgICAgKiBvcGVyYXRpb24gaXMgcmVzdGFydGVkIGR1
ZSB0byBwcmVlbXB0aW9uLgo+ID4gPiArICAgICAqLwo+ID4gPiArICAgIGlmICggIWNkLT5wYXJl
bnRfcGF1c2VkICkKPiA+ID4gKyAgICB7Cj4gPiA+ICsgICAgICAgIGlmICggIWdldF9kb21haW4o
ZCkgKQo+ID4gPiArICAgICAgICB7Cj4gPiA+ICsgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsKPiA+ID4gKyAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiA+ICsgICAgICAgIH0K
PiA+ID4gKwo+ID4gPiArICAgICAgICBkb21haW5fcGF1c2UoZCk7Cj4gPiA+ICsgICAgICAgIGNk
LT5wYXJlbnRfcGF1c2VkID0gdHJ1ZTsKPiA+ID4gKyAgICAgICAgY2QtPm1heF9wYWdlcyA9IGQt
Pm1heF9wYWdlczsKPiA+ID4gKyAgICAgICAgY2QtPm1heF92Y3B1cyA9IGQtPm1heF92Y3B1czsK
PiA+ID4gKyAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAvKiB0aGlzIGlzIHByZWVtcHRpYmxlIHNv
IGl0J3MgdGhlIGZpcnN0IHRvIGdldCBkb25lICovCj4gPiA+ICsgICAgaWYgKCAocmMgPSBmb3Jr
X2hhcF9hbGxvY2F0aW9uKGNkLCBkKSkgKQo+ID4gPiArICAgICAgICBnb3RvIGRvbmU7Cj4gPiA+
ICsKPiA+ID4gKyAgICBpZiAoIChyYyA9IGJyaW5nX3VwX3ZjcHVzKGNkLCBkKSkgKQo+ID4gPiAr
ICAgICAgICBnb3RvIGRvbmU7Cj4gPiA+ICsKPiA+ID4gKyAgICBpZiAoIChyYyA9IGh2bV9jb3B5
X2NvbnRleHRfYW5kX3BhcmFtcyhjZCwgZCkpICkKPiA+ID4gKyAgICAgICAgZ290byBkb25lOwo+
ID4gPiArCj4gPiA+ICsgICAgaWYgKCAocmMgPSBwb3B1bGF0ZV9zcGVjaWFsX3BhZ2VzKGNkKSkg
KQo+ID4gPiArICAgICAgICBnb3RvIGRvbmU7Cj4gPiA+ICsKPiA+ID4gKyAgICBmb3JrX3RzYyhj
ZCwgZCk7Cj4gPgo+ID4gSSB0aGluayB5b3UgbmVlZCB0byBjb3B5IHRoZSBjb250ZW50cyBvZiB0
aGUgc2hhcmVkIGluZm8gcGFnZSBmcm9tIHRoZQo+ID4gcGFyZW50IGludG8gdGhlIGNoaWxkLCBv
ciBlbHNlIHlvdSBhcmUgZGlzY2FyZGluZyBhbnkgcGVuZGluZyBldmVudAo+ID4gY2hhbm5lbHMu
IFlvdSBzaG91bGQgYWxzbyBtYXAgc3VjaCBzaGFyZWQgaW5mbyBwYWdlIGludG8gdGhlIHNhbWUg
Z2ZuCj4gPiBhcyB0aGUgcGFyZW50Lgo+ID4KPiAKPiBJJ2xsIGxvb2sgaW50byBpdCwgdGhhbmtz
IQoKT2gsIGFuZCB0aGUgUFYgdGltZXIgc3RhdGUgc2hvdWxkIGFsc28gYmUgY29waWVkIG92ZXIs
IHNvIHRoYXQgUFYKdGltZXIgaW50ZXJydXB0cyBhcmUgbm90IGxvc3QuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
