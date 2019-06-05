Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44ED359C0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:39:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSKw-0007Tb-4z; Wed, 05 Jun 2019 09:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYSKu-0007TU-MO
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:36:00 +0000
X-Inumbo-ID: 53b35444-8775-11e9-981b-9ba93ee137ea
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 53b35444-8775-11e9-981b-9ba93ee137ea;
 Wed, 05 Jun 2019 09:35:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52E96374;
 Wed,  5 Jun 2019 02:35:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 602423F690;
 Wed,  5 Jun 2019 02:35:57 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-8-julien.grall@arm.com>
 <5CF698EB0200007800235319@prv1-mh.provo.novell.com>
 <b85178eb-05ad-da33-3f97-9fdcdf65727b@arm.com>
 <5CF76BC30200007800235596@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b0f4d528-deee-b09c-3d0b-417c7b870c88@arm.com>
Date: Wed, 5 Jun 2019 10:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF76BC30200007800235596@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8wNi8yMDE5IDA4OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNC4w
Ni4xOSBhdCAxODoyMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gNi80LzE5
IDU6MTQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDMuMDYuMTkgYXQgMTg6MDMs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGEgY29uZmlnIG9wdGlvbiBIQVNfTTJQIHRvIHRlbGwgd2hldGhlciBhbgo+Pj4+IGFyY2hpdGVj
dHVyZSBpbXBsZW1lbnRzIHRoZSBNMlAuCj4+Pj4gICAgICAgLSBpb21tdV9od2RvbV9pbml0OiBG
b3Igbm93LCB3ZSByZXF1aXJlIHRoZSBNMlAgc3VwcG9ydCB3aGVuIHRoZSBJT01NVQo+Pj4+ICAg
ICAgIGlzIG5vdCBzaGFyaW5nIHRoZSBQMk0uCj4+Pj4gICAgICAgLSBtZW1vcnlfZXhjaGFuZ2U6
IFRoZSBoeXBlcmNhbGwgaXMgbWFya2VkIGFzIG5vdCBzdXBwb3J0ZWQgd2hlbiB0aGUKPj4+PiAg
ICAgICBNMlAgZG9lcyBub3QgZXhpc3QuCj4+Pgo+Pj4gQnV0IHdoZXJlJ3MgdGhlIGNvbm5lY3Rp
b24gYmV0d2VlbiB0aGVyZSBiZWluZyBNMlAgYW5kIHRoZQo+Pj4gYXZhaWxhYmlsaXR5IG9mIHRo
aXMgb3BlcmF0aW9uPyBJIHRoaW5rIEkndmUgc3VnZ2VzdGVkIHNvIGJlZm9yZToKPj4+IFdoeSBk
b24ndCB3ZSBzaW1wbHkgZGlzYWJsZSB0aGlzIG9wZXJhdGlvbiBmb3IgdHJhbnNsYXRlZAo+Pj4g
Z3Vlc3RzIChpbiBhbiBpbmRlcGVuZGVudCBwYXRjaCk/Cj4+Cj4+IEFuZCBJIGFuc3dlcmVkIHRo
YXQgbWZuX3RvX2dtZm4oKSBpcyB1c2VkIGluIHRoZSBmdW5jdGlvbi4gSSByZWFsbHkKPj4gZG9u
J3Qgd2FudCB0byBpbXBsZW1lbnQgdGhlIG1hY3JvIG9uIEFybSAoZXZlbiBpZiBpdCBpcyBkdW1t
eSkuCj4+Cj4+IFlvdSBoYXZlbid0IGFuc3dlcmVkIGJhY2sgdG8gdGhhdCBjb21tZW50IGFuZCBJ
IGFzc3VtZWQgdGhpcyB3YXMgZmluZQo+PiB3aXRoIHlvdS4uLgo+IAo+IFdlbGwsIEkgZ3Vlc3Mg
aXQgd2FzLCBidXQgc3VwcGx5aW5nIHRoZSAid2h5IiBpbiB0aGUgZGVzY3JpcHRpb24gKG9yCj4g
YXR0YWNoZWQgYXMgYSBicmllZiBjb21tZW50IHRvIHRoZSAjaWZkZWYpIHdvdWxkIGhhdmUgaGVs
cGVkCj4gYXZvaWQgcmUtcmFpc2luZyB0aGUgc2FtZSBxdWVzdGlvbi4gSG93ZXZlciwgdGhpbmtp
bmcgYWJvdXQgaXQKPiBhZ2FpbiBJJ20gbm90IHN1cmUgSSBhZ3JlZSB3aXRoICNpZmRlZi1pbmcg
b3V0IHRoZSBlbnRpcmUgKGxhcmdlKQo+IGZ1bmN0aW9uIGJvZHkgLSBJJ2QgcmVhbGx5IHByZWZl
ciB0aGUgYWx0ZXJuYXRpdmUgYXBwcm9hY2gKPiBzdWdnZXN0ZWQgYWJvdmUuCgpJIHdvdWxkIGFw
cHJlY2lhdGUgaWYgeW91IGNsYXJpZmllZCBpdCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiByYXRo
ZXIgdGhhbiAKZXhwZWN0aW5nIG1lIHRvIHVuZGVyc3RhbmQgdGhlIGhpZGRlbiBtZWFuaW5nLiBC
ZWNhdXNlIC4uLgoKPiAKPiBPciBvdGhlcndpc2UgSSdkIHNlZSB5ZXQgYW5vdGhlciBzZXBhcmF0
ZSBLY29uZmlnIG9wdGlvbgo+IGlkZW50aWZ5aW5nIHdoZXRoZXIgYW4gYXJjaCBzdXBwb3J0cyBu
b24tdHJhbnNsYXRlZCBtb2RlIGluIHRoZQo+IGZpcnN0IHBsYWNlLiBUaGF0IG9wdGlvbiB3b3Vs
ZCBzZWxlY3QgdGhlIE0yUCBvbmUgdGhlbiwgYXMgSSBjYW4ndAo+IHNlZSBob3cgb25lIHdvdWxk
IGdvIGFib3V0IHN1cHBvcnRpbmcgbm9uLXRyYW5zbGF0ZWQgZ3Vlc3RzCj4gd2l0aG91dCBNMlAu
IEluIHRoaXMgY2FzZSB5b3UnZCBhZGQgYW4gI2lmZGVmIGhlcmUgKHBsYWNlbWVudAo+IHN1Ympl
Y3QgdG8gZnVydGhlciBkaXNjdXNzaW9uOyBwZXJzb25hbGx5IEknZCBmYXZvciBpZiBpdCB3YXMg
cHV0Cj4gYXJvdW5kIGp1c3QgdGhlIHByb2JsZW1hdGljIGludm9jYXRpb24gb2YgbWZuX3RvX2dt
Zm4oKSwgd2l0aAo+IGEgc3VpdGFibGUgI2Vsc2U7IGFsdGVybmF0aXZlbHkgaGF2ZSBjb21tb24g
Y29kZSBwcm92aWRlIGEKPiBzdHViIG1mbl90b19nbWZuKCkpIF9hbmRfIGEgcGFnaW5nX21vZGVf
dHJhbnNsYXRlKCkgY2hlY2sKPiBuZWFyIHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLCB0aHVzIHlp
ZWxkaW5nIGNvbnNpc3RlbnQgYmVoYXZpb3IuCgouLi4gSSB3b3VsZCBoYXZlIGF2b2lkZWQgdG8g
d2FzdGUgdGltZSByZXNlbmRpbmcgdGhlIHNlcmllcyB3aXRob3V0IGFkZHJlc3NpbmcgCnlvdXIg
Y29uY2Vybi4KCkluIHRoaXMgY2FzZSwgSSB3aWxsIHN0cm9uZ2x5IG5hY2sgYW55IGRlZmluaXRp
b24gb2YgbWZuX3RvX2dtZm4oKSBpbiB0aGUgCm5vbi1NMlAgY2FzZS4gV2Ugc2F3IHRoZSBpbXBs
aWNhdGlvbiBvbiBBcm0gYW5kIEkganVzdCB3YW50IHRvIHNlZSB0aGUgbWFjcm8gCmNvbXBsZXRl
bHkgZGlzYXBwZWFyIGZyb20gQXJtLgoKRnVydGhlcm1vcmUsICNpZmRlZiBjaHVuayBvZiBjb2Rl
IG1lYW5zIHRoZXkgY29tcGxldGVseSBkaXNhcHBlYXIgZnJvbSB0aGUgY29kZSAKYmFzZSB3aXRo
b3V0IHRoZSBhaWQgb2YgdGhlIGNvbXBpbGVyIGl0c2VsZiAodmlhIG9wdGltaXphdGlvbikuIFRo
aXMgaXMgbGVzcyAKZXJyb3ItcHJvbmUgdGhhbiBhIHBvdGVudGlhbGx5IHdyb25nIGNoZWNrIGFu
ZCB3b3VsZCBhbHNvIGhlbHAgc2FmZXR5IApjZXJ0aWZpY2F0aW9uIGFzIHdlIGRvbid0IG5lZWQu
CgpTbyBJIHN0aWxsIGZhdm9yIHVzaW5nICNpZmRlZiBoZXJlLiBJIGNvdWxkIHJlcGxhY2UgYnkg
YSBzcGVjaWZpYyBLY29uZmlnIChzZWUgYSAKcHJldmlvdXMgYXR0ZW1wdCBbMV0pLgoKCj4gCj4g
SSBmaW5kIGl0IG9kZCB0aGF0IG5vIHN1Y2ggY2hlY2sgaXMgdGhlcmUgcmlnaHQgbm93LCBhcyB0
aGUgcHVibGljCj4gaGVhZGVyIGNsZWFybHkgc2F5cyB0aGlzIGlzIGEgUFYtb25seSBpbnRlcmZh
Y2UuCj4gCj4gTm90ZSB0aGF0IHdpdGggYSBwYWdpbmdfbW9kZV90cmFuc2xhdGUoKSBjaGVjayBh
dCB0aGUgdG9wIG9mCj4gdGhlIGZ1bmN0aW9uIChvciBldmVuIGF0IGl0cyBvbmx5IGNhbGwgc2l0
ZSkgdGhlIG9uZSB0b3dhcmRzIHRoZQo+IGVuZCBvZiB0aGUgZnVuY3Rpb24gc2hvdWxkIHRoZW4g
YmUgZGl0Y2hlZC4KClNlZSBhYm92ZSBteSBvcGluaW9uIG9uIHBhZ2luZ19tb2RlX3RyYW5zbGF0
ZSgpLgoKQ2hlZXJzLAoKWzFdIGh0dHBzOi8vbGlzdHMuZ3QubmV0L3hlbi9kZXZlbC80MTE1MzAK
Cj4gCj4gSmFuCj4gCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
