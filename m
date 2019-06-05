Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B135802
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 09:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYQZa-0004Ma-57; Wed, 05 Jun 2019 07:43:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYQZY-0004MV-KK
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 07:43:00 +0000
X-Inumbo-ID: 88c24038-8765-11e9-87ca-4fa4ec73bbdc
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88c24038-8765-11e9-87ca-4fa4ec73bbdc;
 Wed, 05 Jun 2019 07:42:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 01:42:56 -0600
Message-Id: <5CF7727D02000078002355C9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 01:42:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
 <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
In-Reply-To: <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE4OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMTA6NTMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBY2NvcmRpbmcgdG8g
TGludXggY29tbWl0IGU3NWJlZjJhNGYgKCJhcm02NDogU2VsZWN0Cj4+IEFSQ0hfSEFTX0ZBU1Rf
TVVMVElQTElFUiIpIHRoaXMgaXMgYSBmdXJ0aGVyIGltcHJvdmVtZW50IG92ZXIgdGhlCj4+IHZh
cmlhbnQgdXNpbmcgb25seSBiaXR3aXNlIG9wZXJhdGlvbnMgb24gYXQgbGVhc3Qgc29tZSBoYXJk
d2FyZSwgYW5kIG5vCj4+IHdvcnNlIG9uIG90aGVyLgo+PiAKPj4gU3VnZ2VzdGVkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBSRkM6IFRvIGJlIGhvbmVz
dCBJJ20gbm90IGZ1bGx5IGNvbnZpbmNlZCB0aGlzIGlzIGEgd2luIGluIHBhcnRpY3VsYXIgaW4K
Pj4gICAgICAgdGhlIGh3ZWlnaHQzMigpIGNhc2UsIGFzIHRoZXJlJ3Mgbm8gYWN0dWFsIHNoaWZ0
IGluc24gd2hpY2ggZ2V0cwo+PiAgICAgICByZXBsYWNlZCBieSB0aGUgbXVsdGlwbGljYXRpb24u
IEV2ZW4gZm9yIGh3ZWlnaHQ2NCgpIHRoZSBjb21waWxlcgo+PiAgICAgICBjb3VsZCBlbWl0IGJl
dHRlciBjb2RlIGFuZCBhdm9pZCB0aGUgZXhwbGljaXQgc2hpZnQgYnkgMzIgKHdoaWNoIGl0Cj4+
ICAgICAgIGVtaXRzIGF0IGxlYXN0IGZvciBtZSkuCj4gCj4gSSBjYW4gc2VlIG11bHRpcGxpY2F0
aW9uIGluc3RydWN0aW9uIHVzZWQgaW4gYm90aCBod2VpZ2h0MzIoKSBhbmQgCj4gaHdlaWdodDY0
KCkgd2l0aCB0aGUgY29tcGlsZXIgSSBhbSB1c2luZy4KClRoYXQgaXMgZm9yIHdoaWNoIGV4YWN0
IGltcGxlbWVudGF0aW9uPyBXaGF0IEkgd2FzIHJlZmVycmluZyB0byBhcwoiY291bGQgZW1pdCBi
ZXR0ZXIgY29kZSIgd2FzIHRoZSBtdWx0aXBsaWNhdGlvbi1mcmVlIHZhcmlhbnQsIHdoZXJlCnRo
ZSBjb21waWxlciBmYWlscyB0byByZWNvZ25pemUgKGFmYWljdCkgYW5vdGhlciBvcHBvcnR1bml0
eSB0byBmb2xkCmEgc2hpZnQgaW50byBhbiBhcml0aG1ldGljIGluc3RydWN0aW9uOgoKCWFkZAl4
MCwgeDAsIHgwLCBsc3IgIzQKCWFuZAl4MCwgeDAsICMweGYwZjBmMGYwZjBmMGYwZgoJYWRkCXgw
LCB4MCwgeDAsIGxzciAjOAoJYWRkCXgwLCB4MCwgeDAsIGxzciAjMTYKPj4+CWxzcgl4MSwgeDAs
ICMzMgo+Pj4JYWRkCXcwLCB3MSwgdzAKCWFuZAl3MCwgdzAsICMweGZmCglyZXQKCkFmYWljdCB0
aGUgdHdvIG1hcmtlZCBpbnNucyBjb3VsZCBiZSByZXBsYWNlZCBieQoKCWFkZAl4MCwgeDAsIHgw
LCBsc3IgIzMyCgpXaXRoIHRoZXJlIG9ubHkgYSBzZXF1ZW5jZSBvZiBhZGQtcyByZW1haW5pbmcs
IEknbSBoYXZpbmcKZGlmZmljdWx0eSBzZWVpbmcgaG93IHRoZSB1c2Ugb2YgbXVsK2xzciB3b3Vs
ZCBhY3R1YWxseSBoZWxwOgoKCWFkZAl4MCwgeDAsIHgwLCBsc3IgIzQKCWFuZAl4MCwgeDAsICMw
eGYwZjBmMGYwZjBmMGYwZgoJbW92CXgxLCAjMHgxMDEwMTAxMDEwMTAxMDEKCW11bAl4MCwgeDAs
IHgxCglsc3IJeDAsIHgwLCAjNTYKCXJldAoKQnV0IG9mIGNvdXJzZSBJIGtub3cgbm90aGluZyBh
Ym91dCB0aHJvdWdocHV0IGFuZCBsYXRlbmN5Cm9mIHN1Y2ggYWRkLXMgd2l0aCBvbmUgb2YgdGhl
aXIgb3BlcmFuZHMgc2hpZnRlZCBmaXJzdC4gQW5kCnllcywgdGhlIHZhcmlhbnQgdXNpbmcgbXVs
IGlzLCBjb21wYXJpbmcgd2l0aCB0aGUgYmV0dGVyCm9wdGltaXplZCBjYXNlLCBzdGlsbCBvbmUg
aW5zbiBzbWFsbGVyLgoKPiBJIHdvdWxkIGV4cGVjdCB0aGUgY29tcGlsZXIgY291bGQgZWFzaWx5
IHJlcGxhY2UgYSBtdWx0aXBseSBieSBhIHNlcmllcyAKPiBvZiBzaGlmdCBidXQgaXQgd291bGQg
YmUgbW9yZSBkaWZmaWN1bHQgdG8gZG8gdGhlIGludmVydC4KPiAKPiBBbHNvLCB0aGlzIGhhcyBi
ZWVuIGluIExpbnV4IGZvciBhIHllYXIgbm93LCBzbyBJIGFtIGFzc3VtaW5nIExpbnV4IAo+IGZv
bGtzIGFyZSBoYXBweSB3aXRoIGNoYW5nZXMgKENDaW5nIFJvYmluIGp1c3QgaW4gY2FzZSBJIG1p
c3NlZCAKPiBhbnl0aGluZykuIFRoZXJlZm9yZSBJIGFtIGhhcHB5IHRvIGdpdmUgaXQgYSBnbyBv
biBYZW4gYXMgd2VsbC4KCkluIHdoaWNoIGNhc2UgLSBjYW4gSSB0YWtlIHRoaXMgYXMgYW4gYWNr
LCBvciBkbyB5b3Ugd2FudCB0byBmaXJzdApwdXJzdWUgdGhlIGRpc2N1c3Npb24/CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
