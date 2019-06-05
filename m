Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5535A11
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYSiA-0001iQ-3A; Wed, 05 Jun 2019 10:00:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYSi9-0001Z7-09
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:00:01 +0000
X-Inumbo-ID: ae0b006d-8778-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae0b006d-8778-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:00:00 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 03:59:59 -0600
Message-Id: <5CF7929D02000078002356CE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 03:59:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
 <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
 <5CF7727D02000078002355C9@prv1-mh.provo.novell.com>
 <a6b9a144-f3b6-2c32-eb23-01723ed760ae@arm.com>
In-Reply-To: <a6b9a144-f3b6-2c32-eb23-01723ed760ae@arm.com>
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

Pj4+IE9uIDA1LjA2LjE5IGF0IDExOjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzA2LzIwMTkgMDg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4wNi4x
OSBhdCAxODoxMSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDUvMzEvMTkg
MTA6NTMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEFjY29yZGluZyB0byBMaW51eCBjb21t
aXQgZTc1YmVmMmE0ZiAoImFybTY0OiBTZWxlY3QKPj4+PiBBUkNIX0hBU19GQVNUX01VTFRJUExJ
RVIiKSB0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVyIHRoZQo+Pj4+IHZhcmlhbnQg
dXNpbmcgb25seSBiaXR3aXNlIG9wZXJhdGlvbnMgb24gYXQgbGVhc3Qgc29tZSBoYXJkd2FyZSwg
YW5kIG5vCj4+Pj4gd29yc2Ugb24gb3RoZXIuCj4+Pj4KPj4+PiBTdWdnZXN0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IC0tLQo+Pj4+IFJGQzogVG8gYmUg
aG9uZXN0IEknbSBub3QgZnVsbHkgY29udmluY2VkIHRoaXMgaXMgYSB3aW4gaW4gcGFydGljdWxh
ciBpbgo+Pj4+ICAgICAgICB0aGUgaHdlaWdodDMyKCkgY2FzZSwgYXMgdGhlcmUncyBubyBhY3R1
YWwgc2hpZnQgaW5zbiB3aGljaCBnZXRzCj4+Pj4gICAgICAgIHJlcGxhY2VkIGJ5IHRoZSBtdWx0
aXBsaWNhdGlvbi4gRXZlbiBmb3IgaHdlaWdodDY0KCkgdGhlIGNvbXBpbGVyCj4+Pj4gICAgICAg
IGNvdWxkIGVtaXQgYmV0dGVyIGNvZGUgYW5kIGF2b2lkIHRoZSBleHBsaWNpdCBzaGlmdCBieSAz
MiAod2hpY2ggaXQKPj4+PiAgICAgICAgZW1pdHMgYXQgbGVhc3QgZm9yIG1lKS4KPj4+Cj4+PiBJ
IGNhbiBzZWUgbXVsdGlwbGljYXRpb24gaW5zdHJ1Y3Rpb24gdXNlZCBpbiBib3RoIGh3ZWlnaHQz
MigpIGFuZAo+Pj4gaHdlaWdodDY0KCkgd2l0aCB0aGUgY29tcGlsZXIgSSBhbSB1c2luZy4KPj4g
Cj4+IFRoYXQgaXMgZm9yIHdoaWNoIGV4YWN0IGltcGxlbWVudGF0aW9uPwo+IAo+IEEgc2ltcGxl
IGNhbGwgaHdlaWdodDY0KCkuCgpUaGF0J3MgYXMgYW1iaWd1b3VzIGFzIGl0IHdhcyBiZWZvcmU6
IEFyZSB5b3UgdGFsa2luZyBhYm91dAp1bi1wYXRjaGVkIGNvZGUgKGJlZm9yZSB0aGlzIHNlcmll
cyksIG9yIHBhdGNoZXMgdXAgdG8gYXQKbGVhc3QgdGhpcyBvbmUgYXBwbGllZC4gV2hhdCBJJ20g
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgaXMgaWYgeW91cgpjb21waWxlciBpcyBzbWFydCBlbm91Z2gg
dG8gdXNlIE1VTCB3aXRob3V0IHVzIHRlbGxpbmcgaXQgdG8uCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
