Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9020C5F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 18:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIq8-0007SB-VE; Thu, 16 May 2019 16:02:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRIq8-0007S2-1B
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:02:40 +0000
X-Inumbo-ID: 05d60b1c-77f4-11e9-a83f-5b1b0bb540c7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05d60b1c-77f4-11e9-a83f-5b1b0bb540c7;
 Thu, 16 May 2019 16:02:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 10:02:35 -0600
Message-Id: <5CDD8999020000780022FD30@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 10:02:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <20190516154513.GS1502@mail-itl>
 <20190516154655.20162-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20190516154655.20162-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4] xen: fix handling framebuffer located
 above 4GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE3OjQ2LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gc29tZSBtYWNoaW5lcyAoZm9yIGV4YW1wbGUgVGhpbmtwYWQgUDUyKSwg
VUVGSSBHT1AgcmVwb3J0cwo+IGZyYW1lYnVmZmVyIGxvY2F0ZWQgYWJvdmUgNEdCICgweDQwMDAw
MDAwMDAgb24gdGhhdCBtYWNoaW5lKS4gVGhpcwo+IGFkZHJlc3MgZG9lcyBub3QgZml0IGluIHt4
ZW4sZG9tMH1fdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLmxmYl9iYXNlCj4gZmllbGQsIHdo
aWNoIGlzIDMyYml0LiBUaGUgb3ZlcmZsb3cgaGVyZSBjYXVzZSBhbGwga2luZCBvZiBtZW1vcnkK
PiBjb3JydXB0aW9uIHdoZW4gYW55dGhpbmcgdHJpZXMgdG8gd3JpdGUgc29tZXRoaW5nIG9uIHRo
ZSBzY3JlZW4sCj4gc3RhcnRpbmcgd2l0aCB6ZXJvaW5nIHRoZSB3aG9sZSBmcmFtZWJ1ZmZlciBp
biB2ZXNhX2luaXQoKS4KPiAKPiBGaXggdGhpcyBzaW1pbGFyIHRvIGhvdyBpdCdzIGRvbmUgaW4g
TGludXg6IGFkZCBleHRfbGZiX2Jhc2UgZmllbGQgYXQKPiB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3R1
cmUsIHRvIGhvbGQgdXBwZXIgMzJiaXRzIG9mIHRoZSBhZGRyZXNzLiBTaW5jZSB0aGUKPiBmaWVs
ZCBpcyBhZGRlZCBhdCB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3R1cmUsIGl0IHdpbGwgd29yayB3aXRo
IG9sZGVyCj4gTGludXggdmVyc2lvbnMgdG9vIChvdGhlciB0aGFuIHVzaW5nIHBvc3NpYmx5IHRy
dW5jYXRlZCBhZGRyZXNzIC0gbm8KPiB3b3JzZSB0aGFuIHdpdGhvdXQgdGhpcyBjaGFuZ2UpLiBU
aGFua3MgdG8gQUJJIGNvbnRhaW5pbmcgc2l6ZSBvZiB0aGUKPiBzdHJ1Y3R1cmUgKHN0YXJ0X2lu
Zm8uY29uc29sZS5kb20wLmluZm9fc2l6ZSksIExpbnV4IGNhbiBkZXRlY3Qgd2hlbgo+IHRoaXMg
ZmllbGQgaXMgcHJlc2VudCBhbmQgdXNlIGl0IGFwcHJvcHJpYXRlbHkgdGhlbi4KPiAKPiBTaW5j
ZSB0aGlzIGNoYW5nZSBwdWJsaWMgaW50ZXJmYWNlIGFuZCB1c2UgX19YRU5fSU5URVJGQUNFX1ZF
UlNJT05fXywKPiBidW1wIF9fWEVOX0xBVEVTVF9JTlRFUkZBQ0VfVkVSU0lPTl9fLgo+IAo+IE5v
dGU6IGlmL3doZW4gYmFja3BvcnRpbmcgdGhpcyBjaGFuZ2UgdG8gWGVuIDw9IDQuMTIsICNpZiBp
biB4ZW4uaCBuZWVkcwo+IHRvIGJlIGV4dGVuZGVkIHdpdGggIiB8fCBkZWZpbmVkKF9fWEVOX18p
Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1h
cmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
