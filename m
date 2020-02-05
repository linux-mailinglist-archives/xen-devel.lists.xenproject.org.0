Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B144715320A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:39:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKsF-0007Vq-Mo; Wed, 05 Feb 2020 13:37:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKsE-0007Vi-2l
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:37:46 +0000
X-Inumbo-ID: b0dbcba2-481c-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0dbcba2-481c-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 13:37:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B918EAC84;
 Wed,  5 Feb 2020 13:37:44 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
 <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
 <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
 <eff7962d-c6e8-c185-43b6-5c851423cddd@suse.com>
 <59013bb7dbf9b79daa6dd280c4448418aa1fc56b.camel@infradead.org>
 <df6f5f23-ee65-f289-7dc4-5a42da931bf9@suse.com>
 <e418d66183d1ad8597458fa57d024641047a2de5.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00ee9b49-2a95-9305-846a-b395e37b8728@suse.com>
Date: Wed, 5 Feb 2020 14:37:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <e418d66183d1ad8597458fa57d024641047a2de5.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMjoyMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFdlZCwgMjAy
MC0wMi0wNSBhdCAxMTo0OSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFlldCwgYXMgeW91
IHNheSBlbHNld2hlcmUsIHdoZXRoZXIgYW4gTUZOIGhhcyBhbgo+PiBlbnRyeSBpbiBmcmFtZV90
YWJsZVtdIGlzIGVudGlyZWx5IHVuY2xlYXIsIHNvIHBlcm1pdHRpbmcgYm9vdC0KPj4gYWxsb2Nh
dG9yIHBhZ2VzIHRvIGJlIGZyZWVkIHZpYSBhbGxvY19kb21oZWFwX3BhZ2VzKCkgbmV2ZXJ0aGVs
ZXNzCj4+IHN0aWxsIGRvZXNuJ3QgbG9vayBhbnkgYmV0dGVyIGFuIGlkZWEgdG8gbWUuCj4gCj4g
SG0sIEkgZG9uJ3QgdGhpbmsgSSBzYWlkIHRoYXQsIGRpZCBJPyBUaGF0IHdvdWxkIGJlIGEgbmV3
IGFuZCBleGNpdGluZwo+IGNvbXBsaWNhdGlvbi4KPiAKPiBJIHRoaW5rIGV2ZXJ5IE1GTiBoYW5k
ZWQgb3V0IGJ5IHRoZSBib290IGFsbG9jYXRvciAqc2hvdWxkKiBoYXZlIGEKPiBjb3JyZXNwb25k
aW5nIGVudHJ5IGluIHRoZSBmcmFtZSB0YWJsZS4gQWxsIHRoZSBQRFggc2V0dXAgaXMgZG9uZSBm
b3IKPiB0aG9zZSBwYWdlcywganVzdCBhcyBpdCBpcyBmb3IgaGVhcCBwYWdlcy4gSW4gZmFjdCwg
c29tZSBvZiB0aGF0IHNldHVwCj4gaXMgKm9ubHkqIGRvbmUgaW4gaW5pdF9ib290X3BhZ2VzKCkg
cmlnaHQgbm93LCBhbmQgaWYgcGFnZSByYW5nZXMgZG9uJ3QKPiBnbyB0aHJvdWdoIHRoZSBib290
IGFsbG9jYXRvciBhbmQgZW5kIHVwIGJlaW5nIHRyYW5zZmVycmVkIHRvIHRoZSBoZWFwCj4gaW4g
ZW5kX2Jvb3RfYWxsb2NhdG9yKCksIHRoaW5ncyAobGlrZSBiYWRwYWdlcz0gb24gdGhlIGNvbW1h
bmQgbGluZSkKPiBkb24ndCB3b3JrIHJpZ2h0LgoKSSBndWVzcyBJIHNob3VsZCBoYXZlIHNhaWQg
IndoZXRoZXIgYW4gTUZOIGhhcyBhIHByb3Blcmx5IGluaXRpYWxpemVkCmVudHJ5IGluIGZyYW1l
X3RhYmxlW10gaXMgZW50aXJlbHkgdW5jbGVhciIuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
