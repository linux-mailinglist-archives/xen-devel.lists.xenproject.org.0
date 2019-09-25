Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A9BDC6A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:52:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4r5-0003Rt-62; Wed, 25 Sep 2019 10:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4r3-0003Ro-So
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:49:05 +0000
X-Inumbo-ID: 0e229a10-df82-11e9-962f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 0e229a10-df82-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569408530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iF2QXZAm5BMFgZu3MbFwgI06SqWtpWBtT6bm/pvKKlE=;
 b=ihA734oppdSGwMfq1WZ8WLTXIDSosCfQFUp47q4BhjNfc98MQPZ3dokr
 lJ/pbh+gISH6ReTBpB9ugz2AhpW3O2pLeuuqKQ6PWNbdYHUVpdzkCPUuJ
 We48dsqqMY7BITRChDVkkkehm5hS4OMXUz9/S3/yXI+tM4zApeqH2d9pz 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Eui23DqsK0zB6r2+nbQ4Lt4U2G6Din8L0pIq0Z+efOHBo6dZoST8yuMWdiVGnotxj8w8oAcHEK
 ShPGAGIOzn8jf6d98TVNuL832voo8YI9RlZhFR49UyYWyN1xXOfnclxmAD4fh5TtdNi4usMshr
 4wwPilycjgMS8omXXgEglikCisuRWkwy701/dTekjT6UtD2H0j1ZcRRlyWk1k3S2I4/nnxaMLy
 5j409kNPLTZgWfn6UxK16B05A5H/pDp4LCB2EfhWWM1cPowX0JEqB824lUseAwet0z4da5Xu08
 Oaw=
X-SBRS: 2.7
X-MesageID: 6043755
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6043755"
Date: Wed, 25 Sep 2019 12:48:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925104842.hmvoo4477ennkj77@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-8-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-8-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 7/8] x86: introduce
 CONFIG_HYPERV and hyperv directory
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MzBBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB1c2UgdGhlIHNhbWUgY29kZSBzdHJ1Y3R1cmUgYXMgd2UgZGlkIGZvciBYZW4gY29kZS4K
PiAKPiBBcyBzdGFydGVycywgZGV0ZWN0IEh5cGVyLVYgaW4gcHJvYmVfaHlwZXJ2LiBNb3JlIGNv
bXBsZXgKPiBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgYWRkZWQgbGF0ZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2
L0tjb25maWcgICAgICAgICAgICAgICB8ICA5ICsrKysrCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9N
YWtlZmlsZSAgICAgICAgfCAgMSArCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZp
bGUgfCAgMSArCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCA2MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYyAgICB8ICAzICstCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaCAgICAgICAgfCAg
MSArCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCA0OCArKysrKysrKysr
KysrKysrKysrKysrKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L2h5cGVydi5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi5oCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2Fy
Y2gveDg2L0tjb25maWcKPiBpbmRleCA1ODRiZGMxYmI4Li5jNWE5M2JhYmZlIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiBA
QCAtMTYzLDYgKzE2MywxNSBAQCBlbmRjaG9pY2UKPiAgY29uZmlnIEdVRVNUCj4gIAlib29sCj4g
IAo+ICtjb25maWcgSFlQRVJWX0dVRVNUCj4gKwlkZWZfYm9vbCBuCj4gKwlzZWxlY3QgR1VFU1QK
PiArCXByb21wdCAiSHlwZXItViBHdWVzdCIKPiArCS0tLWhlbHAtLS0KPiArCSAgU3VwcG9ydCBm
b3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcgdW5kZXIgSHlwZXItVi4KPiArCj4g
KwkgIElmIHVuc3VyZSwgc2F5IE4uCj4gKwo+ICBjb25maWcgWEVOX0dVRVNUCj4gIAlkZWZfYm9v
bCBuCj4gIAlzZWxlY3QgR1VFU1QKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L01h
a2VmaWxlIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlCj4gaW5kZXggZjYzZDY0YmJlZS4u
ZjE2NDE5Njc3MiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKPiAr
KysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKPiBAQCAtMSwzICsxLDQgQEAKPiAgb2Jq
LXkgKz0gaHlwZXJ2aXNvci5vCj4gIAo+ICtzdWJkaXItJChDT05GSUdfSFlQRVJWX0dVRVNUKSAr
PSBoeXBlcnYKPiAgc3ViZGlyLSQoQ09ORklHX1hFTl9HVUVTVCkgKz0geGVuCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L01ha2VmaWxlCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi42ODE3MDEwOWE5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvTWFrZWZpbGUKPiBAQCAtMCwwICsxIEBACj4gK29iai15ICs9IGh5cGVydi5vCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi40ODhlOWMxNGEzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMCwwICsxLDYzIEBACj4gKy8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPiArICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKyAq
Cj4gKyAqIFN1cHBvcnQgZm9yIGRldGVjdGluZyBhbmQgcnVubmluZyB1bmRlciBIeXBlci1WLgo+
ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsgKiB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+
ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ICsgKgo+ICsgKiBUaGlz
IHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxp
ZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQg
YSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+ICsgKiBhbG9uZyB3aXRo
IHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+
Lgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ICsgKi8KPiArI2lu
Y2x1ZGUgPHhlbi9pbml0Lmg+Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gKwo+ICti
b29sIF9fcmVhZF9tb3N0bHkgaHlwZXJ2X2d1ZXN0OwoKc3RhdGljPwoKPiArCj4gK2Jvb2wgX19p
bml0IHByb2JlX2h5cGVydih2b2lkKQo+ICt7Cj4gKyAgICB1aW50MzJfdCBlYXgsIGVieCwgZWN4
LCBlZHg7Cj4gKwo+ICsgICAgaWYgKCBoeXBlcnZfZ3Vlc3QgKQo+ICsgICAgICAgIHJldHVybiB0
cnVlOwo+ICsKPiArICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZlYngsICZlY3gsICZlZHgp
Owo+ICsgICAgaWYgKCAoZWJ4ID09IDB4NzI2MzY5NGQpICYmIC8qICJNaWNyIiAqLwo+ICsgICAg
ICAgICAoZWN4ID09IDB4NjY2ZjczNmYpICYmIC8qICJvc29mIiAqLwo+ICsgICAgICAgICAoZWR4
ID09IDB4NzY0ODIwNzQpICkgIC8qICJ0IEh2IiAqLwo+ICsgICAgICAgIGh5cGVydl9ndWVzdCA9
IHRydWU7Cj4gKwo+ICsgICAgcmV0dXJuIGh5cGVydl9ndWVzdDsKPiArfQo+ICsKPiArdm9pZCBf
X2luaXQgaHlwZXJ2X3NldHVwKHZvaWQpCj4gK3sKPiArfQo+ICsKPiArdm9pZCBoeXBlcnZfYXBf
c2V0dXAodm9pZCkKPiArewo+ICt9Cj4gKwo+ICt2b2lkIGh5cGVydl9yZXN1bWUodm9pZCkKPiAr
ewo+ICt9CgpTZWVtcyBraW5kIG9mIHBvaW50bGVzcyB0byBhZGQgdGhvc2UgZHVtbXkgaHlwZXJ2
XyBmdW5jdGlvbnMsIEFGQUlDVAp0aGV5IGRvbid0IGhhdmUgYW55IGNhbGxlcnMgeWV0PwoKSSB3
b3VsZCBwcmVmZXIgdGhhdCB5b3UgaW50cm9kdWNlIHN1Y2ggZHVtbXkgY2FsbGVycyB3aGVuIHRo
ZXkgYXJlCnVzZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
