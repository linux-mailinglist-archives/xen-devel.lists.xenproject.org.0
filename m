Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1420CF5FD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 11:27:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHljA-0007h8-On; Tue, 08 Oct 2019 09:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHlj8-0007h1-SV
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 09:24:18 +0000
X-Inumbo-ID: 5a252d45-e9ad-11e9-97c7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a252d45-e9ad-11e9-97c7-12813bfff9fa;
 Tue, 08 Oct 2019 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570526638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/DRtfVxgdxi2tbGd0OPhtOCqWQ20KL91GW9ZuAwphYc=;
 b=SQJb8DKkvnyu0wAkPIqrogli4ysUpsUT2aYEFTbYdtkr6v/1fXx6ahh+
 YjdIoNcNG/FtKL/rcjZTiGTlDD+BJ8qrWL6MqOXQdQIJei8EyyfSq39fj
 jWDbnknRYwhTCo5YZC6a9+DZ5a3ZyBKZVRBb2vqQ52QpSfLtyy/bSGWVH 8=;
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
IronPort-SDR: KwwVkXA9pYA0FjFtgBItWtOvmh12tBlmz+M5vHqrPqw46PHXCV/iaggNTxXyJRDaVXcfObdF1k
 /+KQ6frW0L1YE80KjEpk79BsEfSVO32DQrseH+RBD5o04x1KpRjR99bIbkeYlzm5hwufPcPUt+
 KXBSCdSIOtlxUAi/6E0llvPhxf4wF1SlzaU6tPk2XjFzlufRym34f4U8phwjw2vYBqJkIJmN3e
 W8dnhVzbj+s2TL2Fku8j+hBF1YP9iyCaTuj8NwuZ/P77wXnummXscfi2Zig7WeYg1nv+L5YPWA
 X8o=
X-SBRS: 2.7
X-MesageID: 6595127
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6595127"
Date: Tue, 8 Oct 2019 11:23:44 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008092344.GB66437@Air-de-Roger>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDM6MzM6NDNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMTAuMjAxOSAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2VzIGl0IHN0aWNreSBh
Y3Jvc3MKPiA+IGFzc2lnbiBhbmQgZGVhc3NpZ24gY2FsbHMsIHdoaWNoIG1lYW5zIHRoYXQgb25j
ZSBhIGd1ZXN0IGZvcmNlcyBYZW4gdG8KPiA+IHNldCBob3N0X21hc2thbGwgdGhlIG1hc2thbGwg
Yml0IGlzIG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPiA+IGNhbGwgdG8gUEhZU0RF
Vk9QX3ByZXBhcmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCj4gPiBzaG91
bGRuJ3QgYmUgcGFydCBvZiB0aGUgbm9ybWFsIGZsb3cgd2hlbiBkb2luZyBQQ0kgcGFzc3Rocm91
Z2gsIGFuZAo+ID4gaGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2ln
bmluZyBpbiBvcmRlciB0byBwcmV2ZW50Cj4gPiBob3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBv
dmVyIGZyb20gcHJldmlvdXMgYXNzaWduYXRpb25zLgo+ID4gCj4gPiBOb3RlIHRoYXQgb3RoZXIg
bWFzayBmaWVsZHMsIGxpa2UgZ3Vlc3RfbWFza2VkIG9yIHRoZSBlbnRyeSBtYXNrYml0Cj4gPiBh
cmUgYWxyZWFkeSByZXNldCB3aGVuIHRoZSBtc2l4IGNhcGFiaWxpdHkgaXMgaW5pdGlhbGl6ZWQu
Cj4gCj4gSSB0YWtlIGl0IHlvdSBtZWFuIGEgZ3Vlc3QgYWN0aW9uIGhlcmUsIGFzIFBIWVNERVZP
UF9wcmVwYXJlX21zaXggaXMKPiBzcGVjaWZpY2FsbHkgYWJvdXQgc2V0dGluZyB1cCB0aGUgYWN0
dWFsIGhhcmR3YXJlJ3Mgb25lPwoKUmlnaHQsIG9yIGFueSBwYXRoIHRoYXQgY2FsbHMgaW50byBt
c2l4X2NhcGFiaWxpdHlfaW5pdCAoaWU6IFFFTVUKcmVxdWVzdGluZyB0byBtYXAgYSBQSVJRIHRv
IGFuIE1TSVggZW50cnkgd2lsbCBhbHNvIGNhbGwgaW50bwptc2l4X2NhcGFiaWxpdHlfaW5pdCku
Cgo+IFRoaXMgaGFwcGVucwo+IHF1aXRlIGEgYml0IGxhdGVyIHRob3VnaCwgaS5lLiAtPmd1ZXN0
X21hc2thbGwgbWF5IG5lZWQgZXhwbGljaXRseQo+IHNldHRpbmcgYXQgdGhlIHNhbWUgdGltZSBh
cyB5b3UgY2xlYXIgLT5ob3N0X21hc2thbGwuIEZ1cnRoZXJtb3JlIC4uLgo+ID4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jCj4gPiBAQCAtMTUwNCw3ICsxNTA0LDEwIEBAIHN0YXRpYyBpbnQgYXNzaWduX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxh
ZykKPiA+ICAgICAgfQo+ID4gIAo+ID4gICAgICBpZiAoIHBkZXYtPm1zaXggKQo+ID4gKyAgICB7
Cj4gPiAgICAgICAgICBtc2l4dGJsX2luaXQoZCk7Cj4gPiArICAgICAgICBwZGV2LT5tc2l4LT5o
b3N0X21hc2thbGwgPSBmYWxzZTsKPiA+ICsgICAgfQo+IAo+IC4uLiBkb2luZyBqdXN0IHRoaXMg
d291bGQgdmlvbGF0ZSBhbiBhc3N1bWVkIHByb3BlcnR5OiBJdCBvdWdodCB0bwo+IGJlIGZpbmUg
dG8gYXNzZXJ0IGF0IGV2ZXJ5IGVudHJ5IG9yIGV4aXQgcG9pbnQgdGhhdCB0aGUgcGh5c2ljYWwK
PiBtYXNrYWxsIGJpdCBvZiBhbiBNU0ktWC1lbmFibGVkIGRldmljZSBpcyB0aGUgbG9naWNhbCBP
UiBvZgo+IC0+aG9zdF9tYXNrYWxsIGFuZCAtPmd1ZXN0X21hc2thbGwuCgpJcyB0aGlzIHN0aWxs
IHZhbGlkIGF0IHRoaXMgcG9pbnQsIGV2ZW4gd2l0aG91dCBteSBwYXRjaD8KClRoZSBoYXJkd2Fy
ZSBkb21haW4gc2hvdWxkIGhhdmUgcGVyZm9ybWVkIGEgcmVzZXQgb2YgdGhlIGRldmljZSwgc28K
dGhlIHN0YXRlIG9mIHRoZSBtYXNrYWxsIGhhcmR3YXJlIGJpdCBzaG91bGQgYmUgdHJ1ZSwgcmVn
YXJkbGVzcyBvZgp0aGUgcHJldmlvdXMgc3RhdGUgb2YgZWl0aGVyIHRoZSBndWVzdF9tYXNrYWxs
IG9yIHRoZSBob3N0X21hc2thbGwKYml0cy4KCj4gSS5lLiBJIHNlZSB0aGUgZm9sbG93aW5nCj4g
b3B0aW9uczoKPiAKPiAxKSB5b3VyIHZhcmlhbnQgYWNjb21wYW5pZWQgYnkgdXBkYXRpbmcgb2Yg
dGhlIGhhcmR3YXJlIGJpdCwKPiAKPiAyKQo+IAo+ICAgICAgICAgcGRldi0+bXNpeC0+Z3Vlc3Rf
bWFza2FsbCA9IHBkZXYtPm1zaXgtPmhvc3RfbWFza2FsbDsKPiAgICAgICAgIHBkZXYtPm1zaXgt
Pmhvc3RfbWFza2FsbCA9IGZhbHNlOwo+IAo+IGxlYXZpbmcgdGhlIGhhcmR3YXJlIGJpdCBhbG9u
ZSwgYXMgdGhlIGFib3ZlIHRyYW5zZm9ybWF0aW9uCj4gd291bGRuJ3QgY2hhbmdlIHdoYXQgaXQn
cyBzdXBwb3NlZCB0byBiZSBzZXQgdG8sCj4gCj4gMykKPiAKPiAgICAgICAgIHBkZXYtPm1zaXgt
Pmd1ZXN0X21hc2thbGwgPSB0cnVlOwo+ICAgICAgICAgcGRldi0+bXNpeC0+aG9zdF9tYXNrYWxs
ID0gZmFsc2U7Cj4gCj4gYWxvbmdzaWRlIHNldHRpbmcgdGhlIGJpdCBpbiBoYXJkd2FyZSAoaWYg
bm90IGFscmVhZHkgc2V0KSwKClRoYXQgc2VlbXMgbGlrZSB0aGUgYmVzdCBvcHRpb24gSU1PLCBz
aW5jZSBpdCdzIHRoZSByZXNldCBzdGF0ZSBvZiB0aGUKZGV2aWNlLCBhbmQgc2hvdWxkIGJlIHRo
ZSBleHBlY3RlZCBvbmUgd2hlbiBhc3NpZ25pbmcgYSBkZXZpY2UgdG8gYQpndWVzdC4KCj4gCj4g
NCkKPiAKPiAgICAgICAgIHBkZXYtPm1zaXgtPmd1ZXN0X21hc2thbGwgPSBmYWxzZTsKPiAgICAg
ICAgIHBkZXYtPm1zaXgtPmhvc3RfbWFza2FsbCA9IGZhbHNlOwo+IAo+IGFsb25nc2lkZSBjbGVh
cmluZyB0aGUgYml0IGluIGhhcmR3YXJlIChpZiBub3QgYWxyZWFkeSBjbGVhciksCj4gcmVseWlu
ZyBvbiBhbGwgZW50cmllcyBiZWluZyBpbmRpdmlkdWFsbHkgbWFza2VkICh3aGljaCBvdWdodAo+
IHRvIGJlIHRoZSBzdGF0ZSBhZnRlciB0aGUgaW5pdGlhbCBtc2l4X2NhcGFiaWxpdHlfaW5pdCgp
KS4KPiAKPiBJbiBhbGwgY2FzZXMgdGhlIG9wZXJhdGlvbiB3b3VsZCBsaWtlbHkgYmV0dGVyIGJl
IGRvbmUgYnkKPiBjYWxsaW5nIGEgZnVuY3Rpb24gdG8gYmUgcHV0IGluIHg4Ni9tc2kuYy4KCk1h
eWJlIG5hbWUgaXQgcGNpX3Jlc2V0X21zaXhfc3RhdGU/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
