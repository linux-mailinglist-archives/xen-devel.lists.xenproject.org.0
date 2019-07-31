Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D37C023
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmrC-0002jz-19; Wed, 31 Jul 2019 11:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mMRS=V4=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hsmrA-0002ju-I7
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:33:20 +0000
X-Inumbo-ID: fe021510-b386-11e9-81f7-274ccae5aa1d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fe021510-b386-11e9-81f7-274ccae5aa1d;
 Wed, 31 Jul 2019 11:33:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37FC344;
 Wed, 31 Jul 2019 04:33:17 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBD5F3F71F;
 Wed, 31 Jul 2019 04:33:16 -0700 (PDT)
Date: Wed, 31 Jul 2019 12:33:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190731123314.1216dd07@donnerap.cambridge.arm.com>
In-Reply-To: <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
 <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
 <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAzMSBKdWwgMjAxOSAxMjowMjoyMCArMDEwMApKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToKCkhpLAoKPiBPbiAzMC8wNy8yMDE5IDE4OjM1LCBBbmRyaWkg
QW5pc292IHdyb3RlOgo+ID4gCj4gPiBPbiAyNi4wNy4xOSAxMzo1OSwgSnVsaWVuIEdyYWxsIHdy
b3RlOiAgCj4gPj4gSGksCj4gPj4KPiA+PiBPbiAyNi8wNy8yMDE5IDExOjM3LCBBbmRyaWkgQW5p
c292IHdyb3RlOiAgCj4gPj4+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBh
bS5jb20+Cj4gPj4+Cj4gPj4+IE9uIEFSTTY0IHdlIGtub3cgZXhhY3RseSBpZiB0cmFwIGhhcHBl
bmVkIGZyb20gaHlwZXJ2aXNvciBvciBndWVzdCwgc28KPiA+Pj4gd2UgZG8gbm90IG5lZWQgdG8g
dGFrZSB0aGF0IGRlY2lzaW9uLiBUaGlzIHJlZHVjZXMgYSBjb25kaXRpb24gZm9yCj4gPj4+IGFs
bCBlbnRlcl9oeXBlcnZpc29yX2hlYWQgY2FsbHMgYW5kIHRoZSBmdW5jdGlvbiBjYWxsIGZvciB0
cmFwcyBmcm9tCj4gPj4+IHRoZSBoeXBlcnZpc29yIG1vZGUuICAKPiA+Pgo+ID4+IE9uZSBjb25k
aXRpb24gbG9zdCBidXQgLi4uICAKPiA+IAo+ID4gLi4uSW4gdGhlIGhvdCBwYXRoIChhY3R1YWxs
eSBhdCBhbnkgdHJhcCkuICAKPiAKPiBFdmVyeXRoaW5nIGlzIGluIHRoZSBob3QgcGF0aCBoZXJl
LCB5ZXQgdGhlcmUgYXJlIGEgbG90IG9mIG90aGVyIGJyYW5jaGVzLiBTbyAKPiB3aHkgdGhpcyBi
cmFuY2ggaW4gcGFydGljdWxhcj8KPiAKPiBBcyBJIGhhdmUgbWVudGlvbmVkIGEgZmV3IHRpbWVz
IGJlZm9yZSwgdGhlcmUgYXJlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSAKPiB0aGVvcnkgYW5k
IHRoZSBwcmFjdGljZS4gSW4gdGhlb3J5LCByZW1vdmluZyBhIGJyYW5jaCBsb29rcyBuaWNlLiBC
dXQgaW4gCj4gcHJhY3RpY2UgdGhpcyBtYXkgbm90IGJlIHRoZSBjYXNlLgo+IAo+IEluIHRoaXMg
cGFydGljdWxhciBjYXNlLCBJIGRvbid0IGJlbGlldmUgdGhpcyBpcyBnb2luZyB0byBoYXZlIGEg
cmVhbCBpbXBhY3Qgb24gCj4gdGhlIHBlcmZvcm1hbmNlLgo+IAo+IFRoZSBQU1RBVEUgaGFzIGJl
ZW4gc2F2ZWQgYSBmZXcgaW5zdHJ1Y3Rpb25zIGJlZm9yZSBpbiBjcHVfdXNlcl9yZWdzLCBzbyB0
aGVyZQo+IGFyZSBoaWdoIGNoYW5jZSB0aGUgdmFsdWUgd2lsbCBzdGlsbCBiZSBpbiB0aGUgTDEg
Y2FjaGUuCgpJIGFncmVlIG9uIHRoaXMsIGFuZCBzZWNvbmQgdGhlIGlkZWEgb2YgKm5vdCogbWlj
cm8tb3B0aW1pc2luZyBjb2RlIGp1c3QgZm9yIHRoZSBzYWtlIG9mIGl0LiBJZiB5b3UgaGF2ZSBu
dW1iZXJzIHRoYXQgYmFjayB0aGlzIHVwLCBpdCB3b3VsZCBiZSBhIGRpZmZlcmVudCBzdG9yeS4K
Cj4gVGhlIGNvbXBpbGVyIG1heSBhbHNvIGRlY2lkZSB0byBkbyB0aGUgZGlyZWN0IGJyYW5jaCB3
aGVuIG5vdCBpbiBndWVzdF9tb2RlLiBBIAo+IHRyYXAgZnJvbSB0aGUgaHlwZXJ2aXNvciBpcyBt
b3N0bHkgZm9yIGludGVycnVwdHMuIFNvIHRoZXJlIGFyZSBjaGFuY2UgdGhpcyBpcyAKPiBub3Qg
Z29pbmcgdG8gaGF2ZSBhIHJlYWwgaW1wYWN0IG9uIHRoZSBvdmVyYWxsIG9mIHRoZSBpbnRlcnJ1
cHQgaGFuZGxpbmcuCj4gCj4gSWYgeW91IGFyZSByZWFsbHkgd29ycnkgb2YgdGhlIGltcGFjdCBv
ZiBicmFuY2ggdGhlbiB0aGVyZSBhcmUgYSBmZXcgbW9yZSAKPiBpbXBvcnRhbnQgcGxhY2VzICh3
aXRoIGEgZ3JlYXRlciBiZW5lZml0cykgdG8gbG9vazoKPiAgICAgIDEpIEl0IHNlZW1zIHRoZSBj
b21waWxlciB1c2UgYSBqdW1wIHRhYmxlIGZvciB0aGUgc3dpdGNoIGNhc2UgaW4gCj4gZG9fdHJh
cF9ndWVzdF9zeW5jKCksIHNvIGl0IHdpbGwgcmVzdWx0IHRvIG11bHRpcGxlIGRpcmVjdCBicmFu
Y2ggZXZlcnl0aW1lLgoKSSBkb24ndCB0aGluayBpdCdzIHdvcnRoIHRvICJmaXgiIHRoaXMgaXNz
dWUuIFRoZSBjb21waWxlciBoYXMgZG9uZSB0aGlzIGZvciBhIHJlYXNvbiwgYW5kIEkgd291bGQg
Z3Vlc3MgaXQgZmlndXJlZCB0aGF0IHRoaXMgaXMgY2hlYXBlciB0aGFuIG90aGVyIHdheXMgb2Yg
c29sdmluZyB0aGlzLiBJZiB5b3UgYXJlIHJlYWxseSBwYXJhbm9pZCBhYm91dCB0aGlzLCBJIHdv
dWxkIHRyeSB0byBjb21waWxlIHRoaXMgd2l0aCB0dW5pbmcgZm9yIHlvdXIgcGFydGljdWxhciBj
b3JlICgtbXR1bmUpLCBzbyB0aGF0IHRoZSBjb21waWxlciBjYW4gdGhyb3cgaW4gbW9yZSBtaWNy
by1hcmNoaXRlY3R1cmFsIGtub3dsZWRnZSBhYm91dCB0aGUgY29zdCBvZiBjZXJ0YWluIGluc3Ry
dWN0aW9ucy4KCj4gICAgICAyKSBJbmRpcmVjdCBicmFuY2ggaGF2ZSBhIG5vbi1uZWdsaWdpYmxl
IGNvc3QgY29tcGFyZSB0byBkaXJlY3QgYnJhbmNoLiAKPiBUaGlzIGlzIGEgbG90IHVzZWQgaW4g
dGhlIGludGVycnVwdCBjb2RlIChzZWUgZ2ljX2h3X29wcy0+cmVhZF9pcnEoKSkuIEFsbCBvZiAK
PiB0aGVtIGFyZSBrbm93biBhdCBib290IHRpbWUsIHNvIHRoZXkgY291bGQgYmUgcmVwbGFjZSB3
aXRoIGRpcmVjdCBicmFuY2guIHg4NiAKPiByZWNlbnRseSBpbnRyb2R1Y2VkIGFsdGVybmF0aXZl
X2NhbGwoKSBmb3IgdGhpcyBwdXJwb3NlLiBUaGlzIGNvdWxkIGJlIHJlLXVzZWQgCj4gb24gQXJt
LgoKVGhpcyBpcyBpbmRlZWQgc29tZXRoaW5nIEkgd2FzIGFsd2F5cyB3b3JyaWVkIGFib3V0OiBJ
dCBsb29rcyBjaGVhcCBhbmQgZWxlZ2FudCBpbiB0aGUgQyBzb3VyY2UgY29kZSwgYnV0IGlzIHBv
dGVudGlhbGx5IGV4cGVuc2l2ZSBvbiBoYXJkd2FyZS4gVGhlIHBhcnRpY3VsYXIgc25pcHBldCBp
czoKLi4uCiAgMjQ5MDI0OiAgICAgICBkNTAzM2ZkZiAgICAgICAgaXNiCiAgMjQ5MDI4OiAgICAg
ICBmOTQwMWU4MCAgICAgICAgbGRyICAgICB4MCwgW3gyMCwgIzU2XQogIDI0OTAyYzogICAgICAg
Zjk0MDc4MDEgICAgICAgIGxkciAgICAgeDEsIFt4MCwgIzI0MF0KICAyNDkwMzA6ICAgICAgIDJh
MTMwM2UwICAgICAgICBtb3YgICAgIHcwLCB3MTkKICAyNDkwMzQ6ICAgICAgIGQ2M2YwMDIwICAg
ICAgICBibHIgICAgIHgxCi4uLgpJbiBjYXNlIG9mIGFuIGludGVycnVwdCwgdGhlIGZpcnN0IGxv
YWQgd2lsbCBwcm9iYWJseSBtaXNzIHRoZSBjYWNoZSwgYW5kIHRoZSBDUFUgaXMgc3R1Y2sgbm93
LCBiZWNhdXNlIGR1ZSB0byB0aGUgZGVwZW5kZW5jaWVzIGl0IGNhbid0IGRvIG11Y2ggZWxzZS4g
SXQgY2FuJ3QgZXZlbiBwcmVkaWN0IHRoZSBicmFuY2ggYW5kIHNwZWN1bGF0aXZlbHkgZXhlY3V0
ZSBhbnl0aGluZywgYmVjYXVzZSB0aGUgZGVzdGluYXRpb24gYWRkcmVzcyBpcyB5ZXQgYW5vdGhl
ciBkZXBlbmRlbnQgbG9hZCBhd2F5LgpUaGlzIG1pZ2h0IG5vdCBtYXR0ZXIgZm9yIGxpdHRsZSBj
b3JlcyBsaWtlIEE1M3MsIGJlY2F1c2UgdGhleSB3b3VsZG4ndCBzcGVjdWxhdGUgYW55d2F5LiBC
dXQgYmV0dGVyIGNvcmVzIChBNzIsIGZvciBpbnN0YW5jZSkgd291bGQgbW9zdCBsaWtlbHkgYmVu
ZWZpdCBmcm9tIGFuIG9wdGltaXNhdGlvbiBpbiB0aGlzIGFyZWEuCgpDaGVlcnMsCkFuZHJlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
