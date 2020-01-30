Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A141414DDD1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:29:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBha-0007bW-8b; Thu, 30 Jan 2020 15:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ixBhY-0007bJ-PJ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:25:52 +0000
X-Inumbo-ID: cc8eda3a-4374-11ea-8396-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc8eda3a-4374-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580397952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XqiOUHcIIuPvyUVD4xWX18NpCR4SLpvqT6Q7w7iZH2Y=;
 b=WcypTDAb+SWO2RKozKWyd4p0QiyxC/CNG1eOmethVxW4lWXa1geD0ygO
 euQOnlmqoKi8jnWlHRQa3S0w3d9mmsgakm/Pl6hX2y6ke2+kvAZ8q7wv7
 5JPodnt0KZlclTZNuGqviaKywOMbxu/0Hk4A/XCWt6HyB8dnbtas6MYnD U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uCcwLcLkMENGcp1VyMAA82xNArE2uqPOcLcyzUWXuRSGW1f07g1+sIJbnt/VPVCJfpIrjMWyoA
 IER+Uu+SHNz/AsPwWq+JlA4AwbqqMAg8l2INnUaW2RMkvxGNp8xwAugu760eLFEMFwFoLggqJY
 fC34tMUySo2p22opgy2GAOvw1AOOR1vQHZEdslmw0aMQJaCAM8zSdH9B69PkKLfHJwdb1C5RC5
 T3yBz+VbdhYDpaDeg075FMQZyMA/eJHwBsrKCOARj1LOKYQFGXoVofUjBuATZ6iAaCoMfS60Fa
 xhk=
X-SBRS: 2.7
X-MesageID: 11861241
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11861241"
Date: Thu, 30 Jan 2020 16:25:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130152544.GQ4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
 <20200130142201.GO4679@Air-de-Roger>
 <20200130142526.en7vs26dsugbcq4k@debian>
 <20200130144704.GP4679@Air-de-Roger>
 <20200130150303.6ruexjz46grqdrxq@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130150303.6ruexjz46grqdrxq@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <liuwe@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6MDM6MDNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMzo0NzowNFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6MjU6MjZQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6MjI6MDFQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMjozOToyMFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBK
YW4gMzAsIDIwMjAgYXQgMDE6MzI6MjZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+ID4gPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mjg6MzZQTSArMDAwMCwgV2Vp
IExpdSB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMTowODow
N1BNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gIC8q
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgKiBMb2NhbCB2YXJpYWJsZXM6Cj4gPiA+ID4gPiA+ID4gPiA+
ICAgKiBtb2RlOiBDCj4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
eGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4gPiA+ID4gPiBpbmRl
eCA5N2Y5YzA3ODkxLi44ZTAyYjRjNjQ4IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS94
ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTMyOSw2ICszMjksMTAgQEAgU0VDVElP
TlMKPiA+ID4gPiA+ID4gPiA+ID4gICAgZWZpID0gLjsKPiA+ID4gPiA+ID4gPiA+ID4gICNlbmRp
Zgo+ID4gPiA+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0hZ
UEVSVl9HVUVTVAo+ID4gPiA+ID4gPiA+ID4gPiArICBodl9oY2FsbF9wYWdlID0gQUJTT0xVVEUo
X19maXhfeF90b192aXJ0KDEpKTsKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSSBh
c3N1bWUgdGhlcmUncyBubyB3YXkgdG8gdXNlIEZJWF9YX0hZUEVSVl9IQ0FMTCBiZWNhdXNlIGl0
J3MgYW4KPiA+ID4gPiA+ID4gPiA+IGVudW0/Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQW5kIHRo
ZSB0cmljayB0byBnZW5lcmF0ZSBhIHN5bWJvbCBkaWRuJ3Qgd29yayBlaXRoZXIuCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBBbmQgeW91IG11c3QgZGVmaW5lIHRoYXQgc3ltYm9sIGluIHRoZSBs
aW5rZXIgc2NyaXB0PyBJdCBkb2Vzbid0IHNlZW0KPiA+ID4gPiA+ID4gdG8gYmUgdXNlZCBhdCBs
aW5rIHRpbWUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGRvbid0IGZvbGxv
dy4gSSB3aXNoIEkgY291bGQgZGVmaW5lIGFuZCB1c2UgYSBzeW1ib2wgaW4gdGhlIGxpbmtlcgo+
ID4gPiA+ID4gc2NyaXB0IGJ1dCBjb3VsZG4ndC4KPiA+ID4gPiAKPiA+ID4gPiBJdCdzIGxpa2Vs
eSBteSBmYXVsdCwgYXMgSSBoYXZlbid0IGJlZW4gZm9sbG93aW5nIHRoZSBwYXRjaCBzZXJpZXMg
aW4KPiA+ID4gPiB0aGF0IG11Y2ggZGV0YWlsLiBJIGFzc3VtZSB0aGlzIGlzIGRvbmUgaW4gb3Jk
ZXIgdG8gZ2VuZXJhdGUgYmV0dGVyCj4gPiA+ID4gY29kZSwgcmF0aGVyIHRoYW4gZG9pbmcgc29t
ZXRoaW5nIGxpa2U6Cj4gPiA+ID4gCj4gPiA+ID4gdm9pZCAqaHZfaGNhbGxfcGFnZSA9IGZpeF94
X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKTsKPiA+ID4gPiAKPiA+ID4gPiBJbiBhIEMgZmls
ZSBzb21ld2hlcmUgd2hlbiB0aGUgaHlwZXJjYWxsIHBhZ2UgaXMgc2V0dXA/Cj4gPiA+IAo+ID4g
PiBBbmRyZXcgd2FudGVkIGJhZGx5IHRvIGJlIGFibGUgdG8gdXNlIGRpcmVjdCBjYWxsIGluIHRo
ZSBoeXBlcmNhbGwKPiA+ID4gZnVuY3Rpb25zLiBUaGlzIGlzIHdoYXQgd2UgbWFuYWdlZCB0byBj
b21lIHVwIHdpdGggc28gZmFyLgo+ID4gPiAKPiA+ID4gSSB0aGluayB3aGF0IHlvdSB3cm90ZSB3
aWxsIHN0aWxsIHJlc3VsdCBpbiBhbiBpbmRpcmVjdCBjYWxsLgo+ID4gPiAKPiA+ID4gKFRoZSBt
YWpvcml0eSBvZiBteSB0aW1lIHNwZW50IG9uIHRoaXMgc2VyaWVzIGhhcyBiZWVuIGV4dGVuZGlu
ZyBYZW4gdG8KPiA+ID4gZG8gbW9yZSB0aGFuIGl0IGNvdWxkIGJlZm9yZS4pCj4gPiAKPiA+IEFj
aywgc29ycnkgdG8gYm90aGVyIHlvdSB3aXRoIHF1ZXN0aW9ucyB5b3UgaGF2ZSBhbHJlYWR5IGFu
c3dlcmVkLiBOb3QKPiAKPiBObyB3b3JyaWVzLiBJIHZhbHVlIHlvdXIgZmVlZGJhY2suIEFuZCBo
YXZpbmcgbW9yZSBwZW9wbGUgdW5kZXJzdGFuZAo+IHdoYXQgaXMgZ29pbmcgb24gaXMgaW1wb3J0
YW50IHRvIHRoZSBwcm9qZWN0Lgo+IAo+ID4gc3VyZSB3aGV0aGVyIGRlZmluaW5nIGh2X2hjYWxs
X3BhZ2UgYXMgYSBnbG9iYWwgY29uc3Qgd291bGQgbWFrZSBtdWNoCj4gPiBkaWZmZXJlbmNlLiBD
b3VsZCB5b3UgbWF5YmUgdXNlIHNvbWV0aGluZyBsaWtlIGFsdGVybmF0aXZlX3ZjYWxsCj4gPiBw
YXRjaGluZyB0byBnZXQgcmlkIG9mIHRoZSBpbmRpcmVjdGlvbj8KPiAKPiBUcmllZCB0aGF0IGFu
ZCBkaWRuJ3Qgd29yayBlaXRoZXIuIDotKAoKSG93IGRvIHlvdSBjaGVjayB3aGV0aGVyIHRoZXJl
J3MgYW4gaW5kaXJlY3QgY2FsbCBvciBub3Qgd2hlbiB1c2luZwphbHRlcm5hdGl2ZV92Y2FsbD8K
Ckl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGluIHRoYXQgY2FzZSB0aGUgcGF0Y2hpbmcgd2ls
bCBoYXBwZW4gYXQKcnVudGltZSwgYW5kIGhlbmNlIHRoZSBnZW5lcmF0ZWQgYXNzZW1ibHkgY29k
ZSB3b3VsZCBzdGlsbCB1c2UgYW4KaW5kaXJlY3QgY2FsbCwgYnV0IG9uY2UgcGF0Y2hlZCBhdCBy
dW50aW1lIGl0IHNob3VsZCBiZWNvbWUgYSBkaXJlY3QKY2FsbC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
