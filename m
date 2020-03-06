Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D617C8B3
	for <lists+xen-devel@lfdr.de>; Sat,  7 Mar 2020 00:08:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAM11-0005XI-1H; Fri, 06 Mar 2020 23:04:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=11Lf=4X=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1jAM0z-0005XD-Jv
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 23:04:21 +0000
X-Inumbo-ID: cf447cca-5ffe-11ea-8eb5-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf447cca-5ffe-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 23:04:19 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jAM0Y-0005gY-Ev; Sat, 07 Mar 2020 00:03:54 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id C92FA104088; Sat,  7 Mar 2020 00:03:52 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Anchal Agarwal <anchalag@amazon.com>, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, x86@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net, len.brown@intel.com,
 pavel@ucw.cz, peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 anchalag@amazon.com, xen-devel@lists.xenproject.org, vkuznets@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 fllinden@amaozn.com, benh@kernel.crashing.org
In-Reply-To: <e782c510916c8c05dc95ace151aba4eced207b31.1581721799.git.anchalag@amazon.com>
Date: Sat, 07 Mar 2020 00:03:52 +0100
Message-ID: <87ftelaxwn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [RFC PATCH v3 07/12] genirq: Shutdown irq chips in
 suspend/resume during hibernation
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+IHdyaXRlczoKCj4gVGhlcmUgYXJl
IG5vIHBtIGhhbmRsZXJzIGZvciB0aGUgbGVnYWN5IGRldmljZXMsIHNvIGR1cmluZyB0ZWFyIGRv
d24KPiBzdGFsZSBldmVudCBjaGFubmVsIDw+IElSUSBtYXBwaW5nIG1heSBzdGlsbCByZW1haW4g
aW4gdGhlIGltYWdlIGFuZAo+IHJlc3VtZSBtYXkgZmFpbC4gVG8gYXZvaWQgYWRkaW5nIG11Y2gg
Y29kZSBieSBpbXBsZW1lbnRpbmcgaGFuZGxlcnMgZm9yCj4gbGVnYWN5IGRldmljZXMsIGFkZCBh
IG5ldyBpcnFfY2hpcCBmbGFnIElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORCB3aGljaAo+IHdo
ZW4gZW5hYmxlZCBvbiBhbiBpcnEtY2hpcCBlLmcgeGVuLXBpcnEsIGl0IHdpbGwgbGV0IGNvcmUg
c3VzcGVuZC9yZXN1bWUKPiBpcnEgY29kZSB0byBzaHV0ZG93biBhbmQgcmVzdGFydCB0aGUgYWN0
aXZlIGlycXMuIFBNIHN1c3BlbmQvaGliZXJuYXRpb24KPiBjb2RlIHdpbGwgcmVseSBvbiB0aGlz
Lgo+IFdpdGhvdXQgdGhpcywgaW4gUE0gaGliZXJuYXRpb24sIGluZm9ybWF0aW9uIGFib3V0IHRo
ZSBldmVudCBjaGFubmVsCj4gcmVtYWlucyBpbiBoaWJlcm5hdGlvbiBpbWFnZSwgYnV0IHRoZXJl
IGlzIG5vIGd1YXJhbnRlZSB0aGF0IHRoZSBzYW1lCj4gZXZlbnQgY2hhbm5lbCBudW1iZXJzIGFy
ZSBhc3NpZ25lZCB0byB0aGUgZGV2aWNlcyB3aGVuIHJlc3RvcmluZyB0aGUKPiBzeXN0ZW0uIFRo
aXMgbWF5IGNhdXNlIGNvbmZsaWN0IGxpa2UgdGhlIGZvbGxvd2luZyBhbmQgcHJldmVudCBzb21l
Cj4gZGV2aWNlcyBmcm9tIGJlaW5nIHJlc3RvcmVkIGNvcnJlY3RseS4KClRoZSBhYm92ZSBpcyBq
dXN0IGFuIGFnZ2xvbWVyYXRpb24gb2Ygd29yZHMgYW5kIGFjcm9ueW1zIGFuZCBzb21lIG9mCnRo
ZXNlIHNlbnRlbmNlcyBkbyBub3QgZXZlbiBtYWtlIHNlbnNlLiBBbnlvbmUgd2hvIGlzIG5vdCBh
d2FyZSBvZiBldmVudApjaGFubmVscyBhbmQgd2hhdGV2ZXIgWEVOaXNtcyB5b3UgdGFsayBhYm91
dCB3aWxsIGJlIGVudGlyZWx5CmNvbmZ1c2VkLiBDaGFuZ2Vsb2dzIHJlYWxseSBuZWVkIHRvIGJl
IHVuZGVyc3RhbmRhYmxlIGZvciBtZXJlIG1vcnRhbHMKYW5kIHRoZXJlIGlzIG5vIHNwYWNlIHJl
c3RyaWN0aW9uIHNvIGFjcm9ueW1zIGNhbiBiZSB3cml0dGVuIG91dC4KClNvbWV0aGluZyBsaWtl
IHRoaXM6CgogIE1hbnkgbGVnYWN5IGRldmljZSBkcml2ZXJzIGRvIG5vdCBpbXBsZW1lbnQgcG93
ZXIgbWFuYWdlbWVudCAoUE0pCiAgZnVuY3Rpb25zIHdoaWNoIG1lYW5zIHRoYXQgaW50ZXJydXB0
cyByZXF1ZXN0ZWQgYnkgdGhlc2UgZHJpdmVycyBzdGF5CiAgaW4gYWN0aXZlIHN0YXRlIHdoZW4g
dGhlIGtlcm5lbCBpcyBoaWJlcm5hdGVkLgoKICBUaGlzIGRvZXMgbm90IG1hdHRlciBvbiBiYXJl
IG1ldGFsIGFuZCBvbiBtb3N0IGh5cGVydmlzb3JzIGJlY2F1c2UgdGhlCiAgaW50ZXJydXB0IGlz
IHJlc3RvcmVkIG9uIHJlc3VtZSB3aXRob3V0IGFueSBub3RpY2FibGUgc2lkZSBlZmZlY3RzIGFz
CiAgaXQgc3RheXMgY29ubmVjdGVkIHRvIHRoZSBzYW1lIHBoeXNpY2FsIG9yIHZpcnR1YWwgaW50
ZXJydXB0IGxpbmUuCgogIFRoZSBYRU4gaW50ZXJydXB0IG1lY2hhbmlzbSBpcyBkaWZmZXJlbnQg
YXMgaXQgbWFpbnRhaW5zIGEgbWFwcGluZwogIGJldHdlZW4gdGhlIExpbnV4IGludGVycnVwdCBu
dW1iZXIgYW5kIGEgWEVOIGV2ZW50IGNoYW5uZWwuIElmIHRoZQogIGludGVycnVwdCBzdGF5cyBh
Y3RpdmUgb24gaGliZXJuYXRpb24gdGhpcyBtYXBwaW5nIGlzIHByZXNlcnZlZCBidXQKICB0aGVy
ZSBpcyB1bmZvcnR1bmF0ZWx5IG5vIGd1YXJhbnRlZSB0aGF0IG9uIHJlc3VtZSB0aGUgc2FtZSBl
dmVudAogIGNoYW5uZWxzIGFyZSByZWFzc2lnbmVkIHRvIHRoZXNlIGRldmljZXMuIFRoaXMgY2Fu
IHJlc3VsdCBpbiBldmVudAogIGNoYW5uZWwgY29uZmxpY3RzIHdoaWNoIHByZXZlbnQgdGhlIGFm
ZmVjdGVkIGRldmljZXMgZnJvbSBiZWluZwogIHJlc3RvcmVkIGNvcnJlY3RseS4KCiAgT25lIHdh
eSB0byBzb2x2ZSB0aGlzIHdvdWxkIGJlIHRvIGFkZCB0aGUgbmVjZXNzYXJ5IHBvd2VyIG1hbmFn
ZW1lbnQKICBmdW5jdGlvbnMgdG8gYWxsIGFmZmVjdGVkIGxlZ2FjeSBkZXZpY2UgZHJpdmVycywg
YnV0IHRoYXQncyBhCiAgcXVlc3Rpb25hYmxlIGVmZm9ydCB3aGljaCBkb2VzIG5vdCBwcm92aWRl
IGFueSBiZW5lZml0cyBvbiBub24tWEVOCiAgZW52aXJvbm1lbnRzLgoKICBUaGUgbGVhc3QgaW50
cnVzaXZlIGFuZCBtb3N0IGVmZmljaWVudCBzb2x1dGlvbiBpcyB0byBwcm92aWRlIGEKICBtZWNo
YW5pc20gd2hpY2ggYWxsb3dzIHRoZSBjb3JlIGludGVycnVwdCBjb2RlIHRvIHRlYXIgZG93biB0
aGVzZQogIGludGVycnVwdHMgb24gaGliZXJuYXRpb24gYW5kIGJyaW5nIHRoZW0gYmFjayB1cCBh
Z2FpbiBvbiByZXN1bWUuIFRoaXMKICBhbGxvd3MgdGhlIFhFTiBldmVudCBjaGFubmVsIG1lY2hh
bmlzbSB0byBhc3NpZ24gYW4gYXJiaXRyYXJ5IGV2ZW50CiAgY2hhbm5lbCBvbiByZXN1bWUgd2l0
aG91dCBhZmZlY3RpbmcgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlc2UKICBkZXZpY2VzLgogIAog
IEZvcnR1bmF0ZWx5IGFsbCB0aGVzZSBkZXZpY2UgaW50ZXJydXB0cyBhcmUgaGFuZGxlZCBieSBh
IGRlZGljYXRlZCBYRU4KICBpbnRlcnJ1cHQgY2hpcCBzbyB0aGUgY2hpcCBjYW4gYmUgbWFya2Vk
IHRoYXQgYWxsIGludGVycnVwdHMgY29ubmVjdGVkCiAgdG8gaXQgYXJlIGhhbmRsZWQgdGhpcyB3
YXkuIFRoaXMgaXMgcHJldHR5IG11Y2ggaW4gbGluZSB3aXRoIHRoZSBvdGhlcgogIGludGVycnVw
dCBjaGlwIHNwZWNpZmljIHF1aXJrcywgZS5nLiBJUlFDSElQX01BU0tfT05fU1VTUEVORC4KCiAg
QWRkIGEgbmV3IHF1aXJrIGZsYWcgSVJRQ0hJUF9TSFVURE9XTl9PTl9TVVNQRU5EIGFuZCBhZGQg
c3VwcG9ydCBmb3IKICBpdCB0aGUgY29yZSBpbnRlcnJ1cHQgc3VzcGVuZC9yZXN1bWUgcGF0aHMu
CgpIbW0/Cgo+IFNpZ25lZC1vZmYtYnk6IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24u
Y29tPgo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
CgpOb3QgdGhhdCBJIGNhcmUgbXVjaCwgYnV0IG5vdyB0aGF0IEkndmUgd3JpdHRlbiBib3RoIHRo
ZSBwYXRjaCBhbmQgdGhlCmNoYW5nZWxvZyB5b3UgbWlnaHQgY2hhbmdlIHRoYXQgYXR0cmlidXRp
b24gc2xpZ2h0bHkuIEZvciBjb21wbGV0ZW5lc3MKc2FrZToKCiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KClRoYW5rcywKCiAgICAgICAgdGdseAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
