Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96DA1376D1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 20:16:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipzj2-0001MF-M2; Fri, 10 Jan 2020 19:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drzZ=27=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ipzj1-0001MA-NN
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 19:13:39 +0000
X-Inumbo-ID: 4e31f074-33dd-11ea-a985-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e31f074-33dd-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 19:13:38 +0000 (UTC)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1ipzif-0003It-LL; Fri, 10 Jan 2020 20:13:17 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 067A6105BDB; Fri, 10 Jan 2020 20:13:16 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Anchal Agarwal <anchalag@amazon.com>
In-Reply-To: <20200109234050.GA26381@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Date: Fri, 10 Jan 2020 20:13:16 +0100
Message-ID: <87zhevrupf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [RFC PATCH V2 09/11] xen: Clear IRQD_IRQ_STARTED
 flag during shutdown PIRQs
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
Cc: konrad.wilk@oracle.co, eduval@amazon.com, peterz@infradead.org,
 x86@kernel.org, linux-mm@kvack.org, axboe@kernel.dk, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, len.brown@intel.com,
 linux-pm@vger.kernel.org, anchalag@amazon.com, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 fllinden@amazon.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5jaGFsLAoKQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+IHdyaXRlczoKPiBP
biBUaHUsIEphbiAwOSwgMjAyMCBhdCAwMTowNzoyN1BNICswMTAwLCBUaG9tYXMgR2xlaXhuZXIg
d3JvdGU6Cj4+IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPiB3cml0ZXM6Cj4+
IFNvIGVpdGhlciB5b3UgY2FuIGhhbmRsZSBpdCBwdXJlbHkgb24gdGhlIFhFTiBzaWRlIHdpdGhv
dXQgdG91Y2hpbmcgYW55Cj4+IGNvcmUgc3RhdGUgb3IgeW91IG5lZWQgdG8gY29tZSB1cCB3aXRo
IHNvbWUgd2F5IG9mIGxldHRpbmcgdGhlIGNvcmUgY29kZQo+PiBrbm93IHRoYXQgaXQgc2hvdWxk
IGludm9rZSBzaHV0ZG93biBpbnN0ZWFkIG9mIGRpc2FibGUuCj4+IAo+PiBTb21ldGhpbmcgbGlr
ZSB0aGUgY29tcGxldGVseSB1bnRlc3RlZCBwYXRjaCBiZWxvdy4KPgo+IFVuZGVyc3RhbmRhYmxl
LiBSZWFsbHkgYXBwcmVjaWF0ZSB0aGUgcGF0Y2ggc3VnZ2VzdGlvbiBiZWxvdyBhbmQgaSB3aWxs
IHRlc3QgaXQKPiBmb3Igc3VyZSBhbmQgc2VlIGlmIHRoaW5ncyBjYW4gYmUgZml4ZWQgcHJvcGVy
bHkgaW4gaXJxIGNvcmUgaWYgdGhhdHMgdGhlIG9ubHkKPiBvcHRpb24uIEluIHRoZSBtZWFud2hp
bGUsIEkgdHJpZWQgdG8gZml4IGl0IG9uIHhlbiBzaWRlIHVubGVzcyBpdCBnaXZlcyB5b3UgdGhl
IAo+IHNhbWUgZmVlbGluZyBhcyBhYm92ZT8gTVNJLXggYXJlIGp1c3QgZmluZSwganVzdCBpb2Fw
aWMgb25lcyBkb24ndCBnZXQgYW55IGV2ZW50Cj4gY2hhbm5lbCBhc3NzaWduZWQgaGVuY2UgZW5h
YmxlX2R5bmlycSBkb2VzIG5vdGhpbmcuIFRob3NlIG5lZWRzIHRvIGJlIHJlc3RhcnRlZC4KPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMv
eGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4gaW5kZXggMWJiMGI1MjJkMDA0Li4yZWQxNTJmMzU4
MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiAgICAg
KysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBAQCAtNTc1LDYgKzU3NSwx
MSBAQCBzdGF0aWMgdm9pZCBzaHV0ZG93bl9waXJxKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPgo+
IHN0YXRpYyB2b2lkIGVuYWJsZV9waXJxKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiB7Cj4gICAg
ICsvKmlvYXBpYyBpbnRlcnJ1cHRzIGRvbid0IGdldCBldmVudCBjaGFubmVsIGFzc2lnbmVkCj4g
ICAgICAgICsgKiBhZnRlciBiZWluZyBleHBsaWNpdGx5IHNodXRkb3duIGR1cmluZyBndWVzdAo+
ICAgICAgICArICogaGliZXJuYXRpb24uIFRoZXkgbmVlZCB0byBiZSByZXN0YXJ0ZWQqLwo+ICAg
ICAgICAgKyAgICAgICBpZighZXZ0Y2huX2Zyb21faXJxKGRhdGEtPmlycSkpCj4gICAgICAgICAr
ICAgICAgICAgICAgICAgc3RhcnR1cF9waXJxKGRhdGEpOwo+ICAgICBlbmFibGVfZHluaXJxKGRh
dGEpOwo+ICB9CgpJbnRlcmVzdGluZyBwYXRjaCBmb3JtYXQgOikKCkRvaW5nIHRoZSBzaHV0ZG93
biBmcm9tIHN5c2NvcmVfb3BzIGFuZCB0aGUgc3RhcnR1cCBjb25kaXRpb25hbGx5IGluIGEKdG90
YWx5IHVucmVsYXRlZCBmdW5jdGlvbiBpcyBub3QgcmVhbGx5IGludHVpdGl2ZS4KClNvIGVpdGhl
ciB5b3UgZG8gaXQgc3ltbWV0cmljYWxseSBpbiBYRU4gdmlhIHN5c2NvcmVfb3BzIGNhbGxiYWNr
cyBvcgp5b3UgbGV0IHRoZSBpcnEgY29yZSBjb2RlIGhlbHAgeW91IG91dCB3aXRoIHRoZSBwYXRj
aCBJIHByb3ZpZGVkCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
