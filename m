Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB2359A7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:28:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSAI-0006Y0-Q9; Wed, 05 Jun 2019 09:25:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYSAG-0006XG-KV
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:25:00 +0000
X-Inumbo-ID: c95542d3-8773-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c95542d3-8773-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 09:24:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1F76A78;
 Wed,  5 Jun 2019 02:24:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8E6B3F690;
 Wed,  5 Jun 2019 02:24:56 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
 <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
 <5CF7727D02000078002355C9@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a6b9a144-f3b6-2c32-eb23-01723ed760ae@arm.com>
Date: Wed, 5 Jun 2019 10:24:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7727D02000078002355C9@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 3/4] Arm64: further speed-up to
 hweight{32, 64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDYvMjAxOSAwODo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDQuMDYuMTkgYXQgMTg6MTEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDUv
MzEvMTkgMTA6NTMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQWNjb3JkaW5nIHRvIExpbnV4
IGNvbW1pdCBlNzViZWYyYTRmICgiYXJtNjQ6IFNlbGVjdAo+Pj4gQVJDSF9IQVNfRkFTVF9NVUxU
SVBMSUVSIikgdGhpcyBpcyBhIGZ1cnRoZXIgaW1wcm92ZW1lbnQgb3ZlciB0aGUKPj4+IHZhcmlh
bnQgdXNpbmcgb25seSBiaXR3aXNlIG9wZXJhdGlvbnMgb24gYXQgbGVhc3Qgc29tZSBoYXJkd2Fy
ZSwgYW5kIG5vCj4+PiB3b3JzZSBvbiBvdGhlci4KPj4+Cj4+PiBTdWdnZXN0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFJGQzogVG8gYmUgaG9u
ZXN0IEknbSBub3QgZnVsbHkgY29udmluY2VkIHRoaXMgaXMgYSB3aW4gaW4gcGFydGljdWxhciBp
bgo+Pj4gICAgICAgIHRoZSBod2VpZ2h0MzIoKSBjYXNlLCBhcyB0aGVyZSdzIG5vIGFjdHVhbCBz
aGlmdCBpbnNuIHdoaWNoIGdldHMKPj4+ICAgICAgICByZXBsYWNlZCBieSB0aGUgbXVsdGlwbGlj
YXRpb24uIEV2ZW4gZm9yIGh3ZWlnaHQ2NCgpIHRoZSBjb21waWxlcgo+Pj4gICAgICAgIGNvdWxk
IGVtaXQgYmV0dGVyIGNvZGUgYW5kIGF2b2lkIHRoZSBleHBsaWNpdCBzaGlmdCBieSAzMiAod2hp
Y2ggaXQKPj4+ICAgICAgICBlbWl0cyBhdCBsZWFzdCBmb3IgbWUpLgo+Pgo+PiBJIGNhbiBzZWUg
bXVsdGlwbGljYXRpb24gaW5zdHJ1Y3Rpb24gdXNlZCBpbiBib3RoIGh3ZWlnaHQzMigpIGFuZAo+
PiBod2VpZ2h0NjQoKSB3aXRoIHRoZSBjb21waWxlciBJIGFtIHVzaW5nLgo+IAo+IFRoYXQgaXMg
Zm9yIHdoaWNoIGV4YWN0IGltcGxlbWVudGF0aW9uPwoKQSBzaW1wbGUgY2FsbCBod2VpZ2h0NjQo
KS4KCj4gV2hhdCBJIHdhcyByZWZlcnJpbmcgdG8gYXMKPiAiY291bGQgZW1pdCBiZXR0ZXIgY29k
ZSIgd2FzIHRoZSBtdWx0aXBsaWNhdGlvbi1mcmVlIHZhcmlhbnQsIHdoZXJlCj4gdGhlIGNvbXBp
bGVyIGZhaWxzIHRvIHJlY29nbml6ZSAoYWZhaWN0KSBhbm90aGVyIG9wcG9ydHVuaXR5IHRvIGZv
bGQKPiBhIHNoaWZ0IGludG8gYW4gYXJpdGhtZXRpYyBpbnN0cnVjdGlvbjoKPiAKPiAJYWRkCXgw
LCB4MCwgeDAsIGxzciAjNAo+IAlhbmQJeDAsIHgwLCAjMHhmMGYwZjBmMGYwZjBmMGYKPiAJYWRk
CXgwLCB4MCwgeDAsIGxzciAjOAo+IAlhZGQJeDAsIHgwLCB4MCwgbHNyICMxNgo+Pj4+IAlsc3IJ
eDEsIHgwLCAjMzIKPj4+PiAJYWRkCXcwLCB3MSwgdzAKPiAJYW5kCXcwLCB3MCwgIzB4ZmYKPiAJ
cmV0Cj4gCj4gQWZhaWN0IHRoZSB0d28gbWFya2VkIGluc25zIGNvdWxkIGJlIHJlcGxhY2VkIGJ5
Cj4gCj4gCWFkZAl4MCwgeDAsIHgwLCBsc3IgIzMyCgpJIGFtIG5vdCBhIGNvbXBpbGVyIGV4cGVy
dC4gQW55d2F5IHRoaXMgbGlrZWx5IGRlcGVuZHMgb24gdGhlIHZlcnNpb24gb2YgdGhlIApjb21w
aWxlciB5b3UgYXJlIHVzaW5nLiBUaGV5IGFyZSBiZWNvbWluZyBzbWFydGVyIGFuZCBzbWFydGVy
LgoKPiAKPiBXaXRoIHRoZXJlIG9ubHkgYSBzZXF1ZW5jZSBvZiBhZGQtcyByZW1haW5pbmcsIEkn
bSBoYXZpbmcKPiBkaWZmaWN1bHR5IHNlZWluZyBob3cgdGhlIHVzZSBvZiBtdWwrbHNyIHdvdWxk
IGFjdHVhbGx5IGhlbHA6Cj4gCj4gCWFkZAl4MCwgeDAsIHgwLCBsc3IgIzQKPiAJYW5kCXgwLCB4
MCwgIzB4ZjBmMGYwZjBmMGYwZjBmCj4gCW1vdgl4MSwgIzB4MTAxMDEwMTAxMDEwMTAxCj4gCW11
bAl4MCwgeDAsIHgxCj4gCWxzcgl4MCwgeDAsICM1Ngo+IAlyZXQKPiAKPiBCdXQgb2YgY291cnNl
IEkga25vdyBub3RoaW5nIGFib3V0IHRocm91Z2hwdXQgYW5kIGxhdGVuY3kKPiBvZiBzdWNoIGFk
ZC1zIHdpdGggb25lIG9mIHRoZWlyIG9wZXJhbmRzIHNoaWZ0ZWQgZmlyc3QuIEFuZAo+IHllcywg
dGhlIHZhcmlhbnQgdXNpbmcgbXVsIGlzLCBjb21wYXJpbmcgd2l0aCB0aGUgYmV0dGVyID4gb3B0
aW1pemVkIGNhc2UsIHN0aWxsIG9uZSBpbnNuIHNtYWxsZXIuClRoZSBjb21taXQgbWVzc2FnZSBp
biBMaW51eCAoYW5kIFJvYmluJ3MgYW5zd2VyKSBpcyBwcmV0dHkgY2xlYXIuIEl0IG1heSBpbXBy
b3ZlIApvbiBzb21lIGNvcmUgYnV0IGRvZXMgbm90IG1ha2UgaXQgd29yc3Qgb24gb3RoZXIuCgo+
IAo+PiBJIHdvdWxkIGV4cGVjdCB0aGUgY29tcGlsZXIgY291bGQgZWFzaWx5IHJlcGxhY2UgYSBt
dWx0aXBseSBieSBhIHNlcmllcwo+PiBvZiBzaGlmdCBidXQgaXQgd291bGQgYmUgbW9yZSBkaWZm
aWN1bHQgdG8gZG8gdGhlIGludmVydC4KPj4KPj4gQWxzbywgdGhpcyBoYXMgYmVlbiBpbiBMaW51
eCBmb3IgYSB5ZWFyIG5vdywgc28gSSBhbSBhc3N1bWluZyBMaW51eAo+PiBmb2xrcyBhcmUgaGFw
cHkgd2l0aCBjaGFuZ2VzIChDQ2luZyBSb2JpbiBqdXN0IGluIGNhc2UgSSBtaXNzZWQKPj4gYW55
dGhpbmcpLiBUaGVyZWZvcmUgSSBhbSBoYXBweSB0byBnaXZlIGl0IGEgZ28gb24gWGVuIGFzIHdl
bGwuCj4gCj4gSW4gd2hpY2ggY2FzZSAtIGNhbiBJIHRha2UgdGhpcyBhcyBhbiBhY2ssIG9yIGRv
IHlvdSB3YW50IHRvIGZpcnN0Cj4gcHVyc3VlIHRoZSBkaXNjdXNzaW9uPwoKSSB3aWxsIGNvbW1p
dCBpdCBsYXRlciBvbiB3aXRoIGFub3RoZXIgYnVuY2ggb2YgcGF0Y2hlcy4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
