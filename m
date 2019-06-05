Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF72359FA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSas-0001AJ-FF; Wed, 05 Jun 2019 09:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYSar-0001AC-7y
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:52:29 +0000
X-Inumbo-ID: 9ed22372-8777-11e9-9521-0fed1df61533
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ed22372-8777-11e9-9521-0fed1df61533;
 Wed, 05 Jun 2019 09:52:25 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /iKya6Wd8Al3anQZ9cvyBHPtguj93JY4HcByLi72t5j4mh5Zw8RjodiUxlTugiyHTS6eJJ6w3X
 MUXey0DTLAFuUU1QCgH/MsIxRLwhkeDEbyvOPsMJgOoPAlJNcmG+K/994SjU4HiGA9SwjxCogv
 ny/U9eZ/9DUQLIKoiqE325uI4IZuiLmsy8isZFiLVwv6XN+U1nr2T1Xjjzl1M7JADZKwZDtUAK
 xxBHbs1P2LuoLhUyKdwb+4Z9IKNnCxIGxzQvFelmNWdbXb8NwAmMXTm1KJx7w3d/CgmfFq8aMI
 ROE=
X-SBRS: 2.7
X-MesageID: 1314391
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1314391"
Date: Wed, 5 Jun 2019 11:52:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190605094615.pvop4jfhzlr5yu6d@Air-de-Roger>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
 <5CF66BCE0200007800235184@prv1-mh.provo.novell.com>
 <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
 <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
 <5CF7772302000078002355F1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF7772302000078002355F1@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDI6MDI6NDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjA2LjE5IGF0IDA5OjU1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4gT24gMDQuMDYuMTkgYXQgMTg6MjAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDc6MDI6MDZBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4+ID4+PiBPbiAwNC4wNi4xOSBhdCAxMDo0OCwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+Pj4gPiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAwNzowMDoy
NUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gPj4gVGhpcyByZXZlcnRzIGNvbW1p
dCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVkNTZmOTJhYjI1LiBUaGUgY2hhbmdlCj4g
Pj4+ID4+IHdhcyByZWR1bmRhbnQgd2l0aCBhbWRfaW9tbXVfZGV0ZWN0X29uZV9hY3BpKCkgYWxy
ZWFkeSBjYWxsaW5nCj4gPj4+ID4+IHBjaV9yb19kZXZpY2UoKS4KPiA+Pj4gPj4gCj4gPj4+ID4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Pj4gPiAK
PiA+Pj4gPiBJIHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUgc3F1YXNoZWQgdG9nZXRoZXIgd2l0aCB5
b3VyIGBBTUQvSU9NTVU6IGRvbid0Cj4gPj4+ID4gImFkZCIgSU9NTVVzYCBwYXRjaCwgb3IgZWxz
ZSBQVkggZG9tMCB3aWxsIGJyZWFrIGJlY2F1c2UKPiA+Pj4gPiB1cGRhdGVfcGFnaW5nX21vZGUg
d2lsbCBmaW5kIGRldmljZXMgbm90IGJlaGluZCBhbiBJT01NVSBhc3NpZ25lZCB0bwo+ID4+PiA+
IGRvbTAsIHRodXMgcmV0dXJuaW5nIGFuIGVycm9yIGFuZCBjcmFzaGluZyBkb20wLgo+ID4+PiAK
PiA+Pj4gSSd2ZSB0YWtlbiBhbm90aGVyIGxvb2sgKHdoaWxlIGNvcnJlY3RpbmcgdGhlIG90aGVy
IHBhdGNoLCBub3cgc2VudAo+ID4+PiBhcyB2Mik6IHVwZGF0ZV9wYWdpbmdfbW9kZSgpIGl0ZXJh
dGVzIG92ZXIgYWxsIGRldmljZXMgdGhlIGRvbWFpbgo+ID4+PiBvd25zLiBUaGUgSU9NTVUgb25l
cywgaGF2aW5nIGJlZW4gc3ViamVjdCBvZiBhbiBlYXJseQo+ID4+PiBwY2lfcm9fZGV2aWNlKCks
IHNob3VsZCBuZXZlciBlbmQgdXAgb24gRG9tMCdzIGxpc3QuIEFuZCBsb29raW5nIGF0Cj4gPj4+
IHRoZSBjb2RlIEkgYWxzbyBjYW4ndCAtIGZvciBub3cgYXQgbGVhc3QgLSBzZWUgaG93IHRoZXkg
Y291bGQgZ2V0Cj4gPj4+IG1vdmVkIHRoZXJlLiBJbiBmYWN0IEkndmUgdmVyaWZpZWQgdGhhdCB0
aGV5IHRha2UgdGhlICJvdmVycmlkZSIKPiA+Pj4gcGF0aCBpbiBfc2V0dXBfaHdkb21fcGNpX2Rl
dmljZXMoKS4KPiA+PiAKPiA+PiBBcyB5b3UgcmVhbGl6ZWQgdGhpcyBjb21taXQgd2FzIGluZGVl
ZCBwYXBlcmluZyBvdmVyIGFuIGV4aXN0aW5nIGlzc3VlCj4gPj4gZWxzZXdoZXJlLiBXaGVuIEkg
ZGlkIHRoaXMgcGF0Y2ggSSBkaWRuJ3QgcmVhbGl6ZQo+ID4+IGFtZF9pb21tdV9kZXRlY3Rfb25l
X2FjcGkgd2FzIGNhbGxpbmcgcGNpX3JvX2RldmljZS4KPiA+PiAKPiA+PiBUaGUgaXNzdWUgaXMg
dGhhdCB3aGVuIHBjaV9yb19kZXZpY2UgZ2V0cyBjYWxsZWQgYnkKPiA+PiBhbWRfaW9tbXVfZGV0
ZWN0X29uZV9hY3BpIGRvbV94ZW4gaGFzIG5vdCBiZWVuIGNyZWF0ZWQgeWV0LCBzbwo+ID4+IHBk
ZXYtPmRvbWFpbiBlbmRzIHVwIGJlaW5nIE5VTEwuCj4gPiAKPiA+IFdlbGwsIHRoYXQncyBiZWlu
ZyBmaXhlZCBieSAiYWRqdXN0IHN5c3RlbSBkb21haW4gY3JlYXRpb24gKGFuZCBjYWxsIGl0Cj4g
PiBlYXJsaWVyIG9uIHg4NikiIChub3RlIHRoYXQgaXQncyAic3BlY2lhbCIgcmF0aGVyIHRoYW4g
InN5c3RlbSIgaW4gdGhlCj4gPiBwb3N0ZWQgdmVyc2lvbikuIHBkZXYtPmRvbWFpbiByZW1haW5p
bmcgdG8gYmUgTlVMTCByZWFsbHkgaXMgdGhlCj4gPiBzbWFsbGVyIG9mIHRoZSBwcm9ibGVtczsg
YWNjZXNzaW5nIGRvbV94ZW4tPmFyY2gucGRldl9saXN0IGlzIHRoZQo+ID4gd29yc2UgcGFydCBo
ZXJlLgo+ID4gCj4gPiBPbmUgdGhpbmcgaXMgY3VyaW91cyB0aG91Z2g6IFNvIGZhciBJIHRob3Vn
aHQgSSB3b3VsZCBoYXZlIHNjcmV3ZWQKPiA+IHVwIHRoaW5ncyBieSBoYXZpbmcgYW1kX2lvbW11
X2RldGVjdF9vbmVfYWNwaSgpIGNhbGxlZCBlYXJsaWVyLAo+ID4gYXMgbWVudGlvbmVkIGluIHRo
YXQgcGF0Y2gncyBkZXNjcmlwdGlvbi4gWW91ciBjaGFuZ2UgdGhhdCBJJ2QgbGlrZQo+ID4gdG8g
cmV2ZXJ0IHByZWRhdGVzIHRoYXQgdGhvdWdoIGJ5IHNldmVyYWwgbW9udGhzLCBzbyBJJ20gZ2V0
dGluZwo+ID4gdGhlIGltcHJlc3Npb24gdGhlIGlzc3VlIGhhcyBiZWVuIG9sZGVyLiBBcyBhIHJl
c3VsdCB0aGUgcmFuZ2Ugb2YKPiA+IHZlcnNpb25zIHRvIGJhY2twb3J0IHRoaXMgdG8gbWF5IGhh
dmUgdG8gZ3Jvdy4KPiAKPiBBbmQgbm8sIEkgY2Fubm90IGNvbmZpcm0gdGhpcyBhcyB0aGUgb3Jp
Z2luYWwgKDQuMTIpIGJlaGF2aW9yOiBUaGVyZQo+IEkgc2VlIGlvbW11X3NldHVwKCkgZ2V0dGlu
ZyBjYWxsZWQgYSBmZXcgbGluZXMgYWZ0ZXIKPiBhcmNoX2luaXRfbWVtb3J5KCkuIFRoZXJlZm9y
ZSBJJ20gc3RpbGwgdW5jbGVhciB3aGF0IGV4YWN0IHByb2JsZW0KPiB0aGUgcGNpX2hpZGVfZGV2
aWNlKCkgYWRkaXRpb24gd2FzIHJlYWxseSBtZWFudCB0byBmaXguCgpBRkFJQ1QgdGhpcyB3YXMg
YW4gZXJyb3Igb24gbXkgc2lkZSwgdGhlIGNvbW1pdCB0aGF0IGZpeGVkIHRoZQp1cGRhdGVfcGFn
aW5nX21vZGUgcmVsYXRlZCBpc3N1ZSBpcyA0MjUwYTQ0MTYyMjVjLCBhbmQgYjZiZDAyYjdhODc3
IGlzCnBsYWluIHdyb25nIHVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcuCgpQVkggZG9tMCBB
TUQgc3VwcG9ydCBpbiA0LjExIGlzIG5vdCB3b3JraW5nIGFuZCBpdCdzIG5vdCBlYXN5IHRvCmJp
c2VjdCB0aGUgY2hhbmdlcyBiZXR3ZWVuIDQuMTEgYW5kIDQuMTIgaW4gdGhhdCBzdGF0ZS4KCkZv
ciB0aGUgcmV2ZXJ0OgoKQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
