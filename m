Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72835781
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 09:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYQ7p-0001NU-2p; Wed, 05 Jun 2019 07:14:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYQ7n-0001NP-JG
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 07:14:19 +0000
X-Inumbo-ID: 85d12a6e-8761-11e9-83ed-77313a24d256
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85d12a6e-8761-11e9-83ed-77313a24d256;
 Wed, 05 Jun 2019 07:14:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 01:14:13 -0600
Message-Id: <5CF76BC30200007800235596@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 01:14:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-8-julien.grall@arm.com>
 <5CF698EB0200007800235319@prv1-mh.provo.novell.com>
 <b85178eb-05ad-da33-3f97-9fdcdf65727b@arm.com>
In-Reply-To: <b85178eb-05ad-da33-3f97-9fdcdf65727b@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 07/14] xen: Introduce HAS_M2P config and
 use to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE4OjIyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvNC8xOSA1OjE0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDMuMDYuMTkg
YXQgMTg6MDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGlu
dHJvZHVjZXMgYSBjb25maWcgb3B0aW9uIEhBU19NMlAgdG8gdGVsbCB3aGV0aGVyIGFuCj4+PiBh
cmNoaXRlY3R1cmUgaW1wbGVtZW50cyB0aGUgTTJQLgo+Pj4gICAgICAtIGlvbW11X2h3ZG9tX2lu
aXQ6IEZvciBub3csIHdlIHJlcXVpcmUgdGhlIE0yUCBzdXBwb3J0IHdoZW4gdGhlIElPTU1VCj4+
PiAgICAgIGlzIG5vdCBzaGFyaW5nIHRoZSBQMk0uCj4+PiAgICAgIC0gbWVtb3J5X2V4Y2hhbmdl
OiBUaGUgaHlwZXJjYWxsIGlzIG1hcmtlZCBhcyBub3Qgc3VwcG9ydGVkIHdoZW4gdGhlCj4+PiAg
ICAgIE0yUCBkb2VzIG5vdCBleGlzdC4KPj4gCj4+IEJ1dCB3aGVyZSdzIHRoZSBjb25uZWN0aW9u
IGJldHdlZW4gdGhlcmUgYmVpbmcgTTJQIGFuZCB0aGUKPj4gYXZhaWxhYmlsaXR5IG9mIHRoaXMg
b3BlcmF0aW9uPyBJIHRoaW5rIEkndmUgc3VnZ2VzdGVkIHNvIGJlZm9yZToKPj4gV2h5IGRvbid0
IHdlIHNpbXBseSBkaXNhYmxlIHRoaXMgb3BlcmF0aW9uIGZvciB0cmFuc2xhdGVkCj4+IGd1ZXN0
cyAoaW4gYW4gaW5kZXBlbmRlbnQgcGF0Y2gpPwo+IAo+IEFuZCBJIGFuc3dlcmVkIHRoYXQgbWZu
X3RvX2dtZm4oKSBpcyB1c2VkIGluIHRoZSBmdW5jdGlvbi4gSSByZWFsbHkgCj4gZG9uJ3Qgd2Fu
dCB0byBpbXBsZW1lbnQgdGhlIG1hY3JvIG9uIEFybSAoZXZlbiBpZiBpdCBpcyBkdW1teSkuCj4g
Cj4gWW91IGhhdmVuJ3QgYW5zd2VyZWQgYmFjayB0byB0aGF0IGNvbW1lbnQgYW5kIEkgYXNzdW1l
ZCB0aGlzIHdhcyBmaW5lIAo+IHdpdGggeW91Li4uCgpXZWxsLCBJIGd1ZXNzIGl0IHdhcywgYnV0
IHN1cHBseWluZyB0aGUgIndoeSIgaW4gdGhlIGRlc2NyaXB0aW9uIChvcgphdHRhY2hlZCBhcyBh
IGJyaWVmIGNvbW1lbnQgdG8gdGhlICNpZmRlZikgd291bGQgaGF2ZSBoZWxwZWQKYXZvaWQgcmUt
cmFpc2luZyB0aGUgc2FtZSBxdWVzdGlvbi4gSG93ZXZlciwgdGhpbmtpbmcgYWJvdXQgaXQKYWdh
aW4gSSdtIG5vdCBzdXJlIEkgYWdyZWUgd2l0aCAjaWZkZWYtaW5nIG91dCB0aGUgZW50aXJlIChs
YXJnZSkKZnVuY3Rpb24gYm9keSAtIEknZCByZWFsbHkgcHJlZmVyIHRoZSBhbHRlcm5hdGl2ZSBh
cHByb2FjaApzdWdnZXN0ZWQgYWJvdmUuCgpPciBvdGhlcndpc2UgSSdkIHNlZSB5ZXQgYW5vdGhl
ciBzZXBhcmF0ZSBLY29uZmlnIG9wdGlvbgppZGVudGlmeWluZyB3aGV0aGVyIGFuIGFyY2ggc3Vw
cG9ydHMgbm9uLXRyYW5zbGF0ZWQgbW9kZSBpbiB0aGUKZmlyc3QgcGxhY2UuIFRoYXQgb3B0aW9u
IHdvdWxkIHNlbGVjdCB0aGUgTTJQIG9uZSB0aGVuLCBhcyBJIGNhbid0CnNlZSBob3cgb25lIHdv
dWxkIGdvIGFib3V0IHN1cHBvcnRpbmcgbm9uLXRyYW5zbGF0ZWQgZ3Vlc3RzCndpdGhvdXQgTTJQ
LiBJbiB0aGlzIGNhc2UgeW91J2QgYWRkIGFuICNpZmRlZiBoZXJlIChwbGFjZW1lbnQKc3ViamVj
dCB0byBmdXJ0aGVyIGRpc2N1c3Npb247IHBlcnNvbmFsbHkgSSdkIGZhdm9yIGlmIGl0IHdhcyBw
dXQKYXJvdW5kIGp1c3QgdGhlIHByb2JsZW1hdGljIGludm9jYXRpb24gb2YgbWZuX3RvX2dtZm4o
KSwgd2l0aAphIHN1aXRhYmxlICNlbHNlOyBhbHRlcm5hdGl2ZWx5IGhhdmUgY29tbW9uIGNvZGUg
cHJvdmlkZSBhCnN0dWIgbWZuX3RvX2dtZm4oKSkgX2FuZF8gYSBwYWdpbmdfbW9kZV90cmFuc2xh
dGUoKSBjaGVjawpuZWFyIHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLCB0aHVzIHlpZWxkaW5nIGNv
bnNpc3RlbnQgYmVoYXZpb3IuCgpJIGZpbmQgaXQgb2RkIHRoYXQgbm8gc3VjaCBjaGVjayBpcyB0
aGVyZSByaWdodCBub3csIGFzIHRoZSBwdWJsaWMKaGVhZGVyIGNsZWFybHkgc2F5cyB0aGlzIGlz
IGEgUFYtb25seSBpbnRlcmZhY2UuCgpOb3RlIHRoYXQgd2l0aCBhIHBhZ2luZ19tb2RlX3RyYW5z
bGF0ZSgpIGNoZWNrIGF0IHRoZSB0b3Agb2YKdGhlIGZ1bmN0aW9uIChvciBldmVuIGF0IGl0cyBv
bmx5IGNhbGwgc2l0ZSkgdGhlIG9uZSB0b3dhcmRzIHRoZQplbmQgb2YgdGhlIGZ1bmN0aW9uIHNo
b3VsZCB0aGVuIGJlIGRpdGNoZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
