Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA4C8A00
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:44:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFetb-0004qb-2X; Wed, 02 Oct 2019 13:42:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFetZ-0004qP-E2
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:42:21 +0000
X-Inumbo-ID: 74ab098c-e51a-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 74ab098c-e51a-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 13:42:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C41EAACA4;
 Wed,  2 Oct 2019 13:42:19 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
 <9b3f955c-ad76-601f-2b58-fa9dc4608c72@suse.com>
 <924f41b2-7779-9c56-9b71-56523756ecdc@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5650904d-b616-5ee7-216a-a0ac28d7426d@suse.com>
Date: Wed, 2 Oct 2019 15:42:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <924f41b2-7779-9c56-9b71-56523756ecdc@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, james@dingwall.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxNToyNCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEwLzIvMTkg
Mzo0MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAxLjEwLjIwMTkgMTc6MTYsIEJvcmlz
IE9zdHJvdnNreSB3cm90ZToKPj4+IEN1cnJlbnRseSBleGVjdXRpb24gb2YgcGFuaWMoKSBjb250
aW51ZXMgdW50aWwgWGVuJ3MgcGFuaWMgbm90aWZpZXIKPj4+ICh4ZW5fcGFuaWNfZXZlbnQoKSkg
aXMgY2FsbGVkIGF0IHdoaWNoIHBvaW50IHdlIG1ha2UgYSBoeXBlcmNhbGwgdGhhdAo+Pj4gbmV2
ZXIgcmV0dXJucy4KPj4+Cj4+PiBUaGlzIG1lYW5zIHRoYXQgYW55IG5vdGlmaWVyIHRoYXQgaXMg
c3VwcG9zZWQgdG8gYmUgY2FsbGVkIGxhdGVyIGFzCj4+PiB3ZWxsIGFzIHNpZ25pZmljYW50IHBh
cnQgb2YgcGFuaWMoKSBjb2RlIChzdWNoIGFzIHBzdG9yZSB3cml0ZXMgZnJvbQo+Pj4ga21zZ19k
dW1wKCkpIGlzIG5ldmVyIGV4ZWN1dGVkLgo+PiBCYWNrIGF0IHRoZSB0aW1lIHdoZW4gdGhpcyB3
YXMgaW50cm9kdWNlZCBpbnRvIHRoZSBYZW5vTGludXggdHJlZSwKPj4gSSB0aGluayB0aGlzIGJl
aGF2aW9yIHdhcyBpbnRlbnRpb25hbCBmb3IgYXQgbGVhc3QgRG9tVS1zLiBJIHdvbmRlcgo+PiB3
aGV0aGVyIHlvdSB3b3VsZG4ndCB3YW50IHlvdXIgY2hhbmdlIHRvIGZ1cnRoZXIgZGlzdGluZ3Vp
c2ggRG9tMAo+PiBhbmQgRG9tVSBiZWhhdmlvci4KPiAKPiBEbyB5b3UgcmVtZW1iZXIgd2hhdCB0
aGUgcmVhc29uIGZvciB0aGF0IHdhcz8KCkkgY2FuIG9ubHkgZ3Vlc3MgdGhhdCB0aGUgdGhpbmtp
bmcgcHJvYmFibHkgd2FzIHRoYXQgZS5nLiBleHRlcm5hbApkdW1waW5nIChieSB0aGUgdG9vbCBz
dGFjaykgd291bGQgYmUgbW9yZSByZWxpYWJsZSAoaW5jbHVkaW5nIGJ1dApub3QgbGltaXRlZCB0
byB0aGlzIG1lYW5pbmcgbGVzcyBjaGFuZ2Ugb2Ygc3RhdGUgZnJvbSB3aGVuIHRoZQpvcmlnaW5h
bCBjcmFzaCByZWFzb24gd2FzIGRldGVjdGVkKSB0aGFuIGhhdmluZyB0aGUgZG9tYWluIGR1bXAK
aXRzZWxmLgoKPiBJIHRoaW5rIGhhdmluZyBhYmlsaXR5IHRvIGNhbGwga21zZ19kdW1wKCkgb24g
YSBwYW5pYyBpcyBhIHVzZWZ1bCB0aGluZwo+IHRvIGhhdmUgZm9yIGRvbVVzIGFzIHdlbGwuIEJl
c2lkZXMsIHRoZXJlIG1heSBiZSBvdGhlciBmdW5jdGlvbmFsaXR5Cj4gYWRkZWQgcG9zdC1ub3Rp
ZmllcnMgaW4gcGFuaWMoKSBpbiB0aGUgZnV0dXJlLiBPciBhbm90aGVyIG5vdGlmaWVyIG1heQo+
IGJlIHJlZ2lzdGVyZWQgbGF0ZXIgd2l0aCB0aGUgc2FtZSBsb3dlc3QgcHJpb3JpdHkuCj4gCj4g
SXMgdGhlcmUgYSBkb3duc2lkZSBpbiBhbGxvd2luZyBkb21VcyB0byBmYWxsIHRocm91Z2ggcGFu
aWMoKSBhbGwgdGhlCj4gd2F5IHRvIGVtZXJnZW5jeV9yZXN0YXJ0KCk/CgpTZWUgYWJvdmUuCgo+
Pj4gVGhlcmUgaXMgbm8gcmVhc29uIGZvciB4ZW5fcGFuaWNfZXZlbnQoKSB0byBiZSB0aGlzIGxh
c3QgcG9pbnQgaW4KPj4+IGV4ZWN1dGlvbiBzaW5jZSBwYW5pYygpJ3MgZW1lcmdlbmN5X3Jlc3Rh
cnQoKSB3aWxsIGNhbGwgaW50bwo+Pj4geGVuX2VtZXJnZW5jeV9yZXN0YXJ0KCkgZnJvbSB3aGVy
ZSB3ZSBjYW4gcGVyZm9ybSBvdXIgaHlwZXJjYWxsLgo+PiBEaWQgeW91IGNvbnNpZGVyLCBhcyBh
biBhbHRlcm5hdGl2ZSwgdG8gbG93ZXIgdGhlIG5vdGlmaWVyJ3MKPj4gcHJpb3JpdHk/Cj4gCj4g
SSBkaWRuJ3QgYnV0IHRoYXQgd291bGRuJ3QgaGVscCB3aXRoIHRoZSBvcmlnaW5hbCBwcm9ibGVt
IHRoYXQgSmFtZXMKPiByZXBvcnRlZCAtLS0gd2UnZCBzdGlsbCBub3QgZ2V0IHRvIGttc2dfZHVt
cCgpIGNhbGwuCgpUcnVlLiBJIGd1ZXNzIG1vcmUgY29udHJvbCBvdmVyIHRoZSBiZWhhdmlvciBu
ZWVkcyB0byBiZSBnaXZlbiB0bwp0aGUgYWRtaW4sIGFzIGVpdGhlciBhcHByb2FjaCBoYXMgaXRz
IHVwLSBhbmQgZG93bnNpZGVzCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
