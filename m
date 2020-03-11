Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C5181C52
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3FZ-0007ky-UM; Wed, 11 Mar 2020 15:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC3FZ-0007kt-6V
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:26:25 +0000
X-Inumbo-ID: aac543be-63ac-11ea-b34e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aac543be-63ac-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583940384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3qcKLkFehgtIuJXaxeMEZjupTy+b3U9QcUUIitq9hjQ=;
 b=DBazm00936dfa95vHlaR44g3q4gwgX6RyPC/U9u7O3tZhsWmMd577h5A
 tVAbXUG54mLJ3yegg7++RyM8Umf92mvw6HOdXZEka+8jVt9GHlZHuaRG6
 /Vvrn46r18kCn9/r7EQPMOaVVCVB9OaSaqDPCzTzHwd2LqvItDm/wQNqc M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Wk5h+8QhDJbsz/XFgT0ctu7APMg6IRb5GCnUEL0VgXbRb24OAirCnghZla9jaUcC5g+WjO/jtd
 /sOrAjiH0JBGTU7oXLIk0A/R8ky6JspHmNc18on/13AgFRUqMAjAkJnOQ3Eghwt1sY5bFZlcu3
 xJXxdRz8yZ5IjR3etd4K4z4d7+9r2dWykWR6go/KT7JY2IId2Y/WuhoQyNDZeSSVDTZxzPEzc4
 Rgl/JyZOrnrRU6y1D6PZag4u/6448mld9lLY5icjEfftEwExLKdTYxh1aHpNdlhY9mZ9j5BEfO
 XOQ=
X-SBRS: 2.7
X-MesageID: 13784271
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13784271"
Date: Wed, 11 Mar 2020 15:26:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200311152613.GJ2152@perard.uk.xensource.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <7720f54e-7ef7-9dae-dfdb-38b89a0892a6@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7720f54e-7ef7-9dae-dfdb-38b89a0892a6@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDI6MTg6MjBQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCBiL2Rv
Y3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+ID4gaW5kZXggODllMDgxZTUxZWFmLi5jNjE5
NzMwMTMwOTcgMTAwNjQ0Cj4gPiAtLS0gYS9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQK
PiA+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+ID4gQEAgLTEsNjQgKzEs
MzkgQEAKPiA+ICAgSG93IHRvIGVuYWJsZSBlYXJseSBwcmludGsKPiA+IC1FYXJseSBwcmludGsg
Y2FuIG9ubHkgYmUgZW5hYmxlZCBpZiBkZWJ1Zz15LiBZb3UgbWF5IHdhbnQgdG8gZW5hYmxlIGl0
IGlmCj4gPiAteW91IGFyZSBkZWJidWdpbmcgY29kZSB0aGF0IGV4ZWN1dGVzIGJlZm9yZSB0aGUg
Y29uc29sZSBpcyBpbml0aWFsaXplZC4KPiA+ICtFYXJseSBwcmludGsgY2FuIG9ubHkgYmUgZW5h
YmxlZCBpZiBDT05GSUdfREVCVUc9eS4gIFlvdSBtYXkgd2FudCB0byBlbmFibGUKPiAKPiBOSVQ6
IEFGQUlDVCwgdGhlIGZpbGUgaXMgdXNpbmcgb25lIHNwYWNlIGFmdGVyIGZ1bGwgc3RvcC4gSSB3
b3VsZCBsaWtlIHRvCj4ga2VlcCBpdCBsaWtlIHRoYXQgZm9yIGNvbnNpc3RlbmN5IDopLgoKU291
bmQgZ29vZCwgSSBzaG91bGQgbG9vayBhdCBob3cgdG8gZml4IG15IHZpbSBjb25maWd1cmF0aW9u
IHNvIGl0IHN0b3AKYWRkaW5nIGV4dHJhIHNwYWNlcyA6LSgKCjpzZXQgbm9qb2luc3BhY2VzCgpX
b24ndCBoYXBwZW4gYWdhaW4gOi0pLgoKPiA+IGRpZmYgLS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1
ZyBiL3hlbi9LY29uZmlnLmRlYnVnCj4gPiBpbmRleCBiMzUxMWU4MWEyNzUuLmVlNmVlMzNiNjli
ZSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCj4gPiArKysgYi94ZW4vS2NvbmZp
Zy5kZWJ1Zwo+ID4gQEAgLTEyOCw2ICsxMjgsOCBAQCBjb25maWcgWE1FTV9QT09MX1BPSVNPTgo+
ID4gICAJICBQb2lzb24gZnJlZSBibG9ja3Mgd2l0aCAweEFBIGJ5dGVzIGFuZCB2ZXJpZnkgdGhl
bSB3aGVuIGEgYmxvY2sgaXMKPiA+ICAgCSAgYWxsb2NhdGVkIGluIG9yZGVyIHRvIHNwb3QgdXNl
LWFmdGVyLWZyZWUgaXNzdWVzLgo+ID4gK3NvdXJjZSAiYXJjaC8kKFNSQ0FSQ0gpL0tjb25maWcu
ZGVidWciCj4gCj4gVG8gZG91YmxlIGNoZWNrLCB0aGlzIG1lYW5zIHRoYXQgZWFybHlwcmludGsg
Y2FuIGJlIHNlbGVjdGVkIGluIEVYUEVSVCBtb2RlCj4gbm93LiBIb3dldmVyLCBpbiB0aGUgZG9j
dW1lbnQgZWFybHktcHJpbnRrLnR4dCwgdGhlIGZlYXR1cmUgaXMgc2FpZCB0byBvbmx5Cj4gYmUg
ZW5hYmxlZCB3aXRoIENPTkZJR19ERUJVRz15Lgo+IAo+IEkgbGlrZSB0aGUgaWRlYSBvZiBhbGxv
d2luZyBhIHVzZXIgdG8gZW5hYmxlIGVhcmx5cHJpbnRrIGluIEVYUEVSVCBtb2RlCj4gKHNvbWUg
ZWFybHkgYm9vdCBidWcgbWF5IG9ubHkgb2NjdXIgaW4gbm9uLWRlYnVnIGJ1aWxkKS4gU28gSSBh
bSBoYXBweSB0bwo+IGtlZXAgdGhlIGNvZGUgbGlrZS4gQ2FuIHlvdSB1cGRhdGUgdGhlIGRvYyBh
Y2NvcmRpbmdseT8KCldpbGwgZG8uCgo+ID4gKwo+ID4gICBlbmRpZiAjIERFQlVHIHx8IEVYUEVS
VAo+ID4gICBlbmRtZW51Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcuZGVi
dWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZy5kZWJ1Zwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmZiMjFlOGFjMjBhCj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZy5kZWJ1Zwo+ID4gQEAgLTAsMCArMSwyODcgQEAK
PiA+ICtjaG9pY2UKPiA+ICsJYm9vbCAiRWFybHkgcHJpbnRrIgo+ID4gKwlvcHRpb25hbAo+ID4g
KwloZWxwCj4gPiArCQlZb3UgbWF5IHdhbnQgdG8gZW5hYmxlIGVhcmx5IHByaW50ayBpZiB5b3Ug
YXJlIGRlYnVnZ2luZyBjb2RlCj4gPiArCQl0aGF0IGV4ZWN1dGVzIGJlZm9yZSB0aGUgY29uc29s
ZSBpcyBpbml0aWFsaXplZC4KPiA+ICsKPiA+ICsJCU5vdGUgdGhhdCBzZWxlY3RpbmcgdGhpcyBv
cHRpb24gd2lsbCBsaW1pdCBYZW4gdG8gYSBzaW5nbGUgVUFSVAo+ID4gKwkJZGVmaW5pdGlvbi4g
QXR0ZW1wdGluZyB0byBib290IFhlbiBpbWFnZSBvbiBhIGRpZmZlcmVudAo+ID4gKwkJcGxhdGZv
cm0gKndpbGwgbm90IHdvcmsqLCBzbyB0aGlzIG9wdGlvbiBzaG91bGQgbm90IGJlIGVuYWJsZQo+
ID4gKwkJZm9yIFhlbnMgdGhhdCBhcmUgaW50ZW5kZWQgdG8gYmUgcG9ydGFibGUuCj4gPiArCj4g
PiArCQlDaG9vc2Ugb25lIG9mIHRoZSBVQVJUIGRyaXZlcnMgZm9yIGVhcmx5IHByaW50aywgdGhl
biB5b3UnbGwKPiA+ICsJCWhhdmUgdG8gc3BlY2lmeSB0aGUgcGFyYW1ldGVycywgbGlrZSB0aGUg
YmFzZSBhZGRyZXNzLgo+ID4gKwo+ID4gKwkJQWx0ZXJuYXRpdmVseSwgdGhlcmUgYXJlIHBsYXRm
b3JtIHNwZWNpZmljIG9wdGlvbnMgd2hpY2ggd2lsbAo+ID4gKwkJaGF2ZSBkZWZhdWx0IHZhbHVl
cyBmb3IgdGhlIHZhcmlvdXMgcGFyYW1ldGVycy4KPiAKPiBXb3VsZCBpdCBiZSB3b3J0aCB0byBt
ZW50aW9uIHN1Y2ggb3B0aW9ucyBhcmUgZGVwcmVjYXRlZD8KClllcywgSSBzaG91bGQgbWVudGlv
biB0aGF0IGhlcmUuIChBbmQgcHJvYmFibHkgaW4gdGhlIGVhcmx5LXByaW50ay50eHQKZG9jIGFz
IHdlbGwuKQoKSG93IGFib3V0OgogICAgQWx0ZXJuYXRpdmVseSwgdGhlcmUgYXJlIHBsYXRmb3Jt
IHNwZWNpZmljIG9wdGlvbnMgd2hpY2ggd2lsbAogICAgaGF2ZSBkZWZhdWx0IHZhbHVlcyBmb3Ig
dGhlIHZhcmlvdXMgcGFyYW1ldGVycy4gQnV0IHN1Y2ggb3B0aW9uIGFyZQogICAgZGVwcmVjYXRl
ZCBhbmQgd2lsbCBzb29uIGJlIHJlbW92ZWQuCgpPciBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGln
aGxpZ2h0IHRoZSBmYWN0IHRoYXQgdGhleSBhcmUgZGVwcmVjYXRlZCwgc28KbWF5YmUgdGhlIGZv
bGxvd2luZyB3b3VsZCBiZSBiZXR0ZXI6CiAgICBEZXByZWNhdGVkOiBBbHRlcm5hdGl2ZWx5LCB0
aGVyZSBhcmUgcGxhdGZvcm0gc3BlY2lmaWMgb3B0aW9ucyB3aGljaAogICAgd2lsbCBoYXZlIGRl
ZmF1bHQgdmFsdWVzIGZvciB0aGUgdmFyaW91cyBwYXJhbWV0ZXJzLiBCdXQgc3VjaCBvcHRpb24K
ICAgIHdpbGwgc29vbiBiZSByZW1vdmVkLgoKCgo+ID4gKwo+ID4gKwljb25maWcgRUFSTFlfUFJJ
TlRLX0JSQ00KPiA+ICsJCWJvb2wgIkVhcmx5IHByaW50ayB3aXRoIDgyNTAgb24gQnJvYWRjb20g
NzQ0NUQwIGJvYXJkcyB3aXRoIEExNSBwcm9jZXNzb3JzIgo+ID4gKwkJc2VsZWN0IEVBUkxZX1VB
UlRfODI1MAo+IAo+IEkgbm90aWNlZCBiZWxvdyB5b3UgYWRkZWQgImRlcGVuZHMgb24gQVJNXzY0
IiBvbiB0aGUgWGlsaW54IFNvQy4gSW4gZ2VuZXJhbCwKPiBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRp
b25zIGFyZSB0aWVkIHRvIGVpdGhlciBhcm0zMiBvciBhcm02NCwgZXZlbiBpZiB0aGUKPiBVQVJU
ICJkcml2ZXIiIGlzIGFyY2ggYWdub3N0aWMuCgpUaG9zZSAiZGVwZW5kcyIgYXJlIG9ubHkgdGhl
cmUgYmVjYXVzZSB0aGUgZWFybHkgdWFydCBkcml2ZXIgaXMgb25seQphdmFpbGFibGUgZm9yIG9u
ZSBhcmNoLiAiZGVidWctY2FkZW5jZS5pbmMiIGNhbiBvbmx5IGJlIGZvdW5kIGluCiJhcmNoL2Fy
bS9hcm02NC8iLCBub3QgaW4gYXJtMzIsIGZvciBleGFtcGxlLgoKPiBZb3UgY291bGQgdGVjaG5p
Y2FsbHkgYm9vdCBYZW4gb24gQXJtIDMyLWJpdCBvbiBBcm12OCBIVyBwcm92aWRlZCB0aGV5Cj4g
c3VwcG9ydCAzMi1iaXQgYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwsIGJ1dCB3ZSBuZXZlciBzdXBw
b3J0ZWQgdGhpcyBjYXNlLiBTbwo+IEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIGFk
ZCBkZXBlbmRzIG9uIGVhY2ggZWFybHlwcmludGsuIFN0ZWZhbm8sCj4gYW55IG9waW5pb25zPwo+
IAo+ID4gK2NvbmZpZyBFQVJMWV9VQVJUX0JBU0VfQUREUkVTUwo+ID4gKwlkZXBlbmRzIG9uIEVB
UkxZX1BSSU5USwo+ID4gKwloZXggIkVhcmx5IHByaW50aywgcGh5c2ljYWwgYmFzZSBhZGRyZXNz
IG9mIGRlYnVnIFVBUlQiCj4gPiArCWRlZmF1bHQgMHg4N2UwMjQwMDAwMDAgaWYgRUFSTFlfUFJJ
TlRLX1RIVU5ERVJYCj4gCj4gWW91IGFyZSBhbGxvd2luZyBFQVJMWV9QUklOVEtfVEhVTkRFUlgg
dG8gYmUgc2VsZWN0ZWQgb24gQXJtMzIgcGxhdGZvcm0gYnV0Cj4gdGhlIGFkZHJlc3MgaXMgYWJv
dmUgNEcuIEkgc3VzcGVjdCB0aGlzIHdvdWxkIGJyZWFrIHJhbmRjb25maWcgYnVpbGQuCgpnY2Mg
ZG9lc24ndCBzZWVtcyB0byBjb21wbGFpbiA6LSkuCgooSSBtZWFuICJhcm0tbm9uZS1lYWJpLWdj
YyAoQXJjaCBSZXBvc2l0b3J5KSA5LjIuMCIpCgpCdXQgSSBjYW4gaGF2ZSB0aHVuZGVyeCBkZXBl
bmRzIG9uIGFybV82NC4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
