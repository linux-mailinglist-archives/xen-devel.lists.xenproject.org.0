Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1C1379EF
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 00:01:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq3E4-0003Nf-Dm; Fri, 10 Jan 2020 22:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oz4b=27=amazon.com=prvs=271b483db=anchalag@srs-us1.protection.inumbo.net>)
 id 1iq3E2-0003Na-CF
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 22:57:54 +0000
X-Inumbo-ID: 9d2fa51c-33fc-11ea-b89f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d2fa51c-33fc-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578697066; x=1610233066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0/XyXQpWFUZzSlB5MOZhzOIMG1mqXg6xXgJUXUnoc4g=;
 b=HpRg7L6kyY/tKCOEId024b+rJs8qBdmWTDPeKeajS6C+xVxJM0KM8g9w
 8wYn+RUQoEm00vlqTQy1qzKE9ly6VTRC7Lr0ybTjhY1zazIvqikAn1K7Z
 4pYQZ5gxdvjh5F834nEp6nXq1hj+6R1Qgf2EFH8jD+pTZhJABZHnCqICj Q=;
IronPort-SDR: 2zGeJmxU96KHcs6bmGOD93XlxOI4/U243ne6e0sIsBwLScQ5y97tciYM9GQN4g5euRqgKW5Nhv
 ZWFxOJ+lIK8Q==
X-IronPort-AV: E=Sophos;i="5.69,418,1571702400"; d="scan'208";a="19431249"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 10 Jan 2020 22:57:35 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 351E7A2B10; Fri, 10 Jan 2020 22:57:33 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 22:57:18 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 22:57:18 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 10 Jan 2020 22:57:17 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 0FA4940E65; Fri, 10 Jan 2020 22:57:18 +0000 (UTC)
Date: Fri, 10 Jan 2020 22:57:18 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200110225718.GA13573@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200109234050.GA26381@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <87zhevrupf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhevrupf.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH V2 09/11] xen: Clear IRQD_IRQ_STARTED
 flag during shutdown PIRQs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, vkuznets@redhat.com,
 davem@davemloft.net, dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDg6MTM6MTZQTSArMDEwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IEFuY2hhbCwKPiAKPiBBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNv
bT4gd3JpdGVzOgo+ID4gT24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDE6MDc6MjdQTSArMDEwMCwg
VGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+ID4+IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6
b24uY29tPiB3cml0ZXM6Cj4gPj4gU28gZWl0aGVyIHlvdSBjYW4gaGFuZGxlIGl0IHB1cmVseSBv
biB0aGUgWEVOIHNpZGUgd2l0aG91dCB0b3VjaGluZyBhbnkKPiA+PiBjb3JlIHN0YXRlIG9yIHlv
dSBuZWVkIHRvIGNvbWUgdXAgd2l0aCBzb21lIHdheSBvZiBsZXR0aW5nIHRoZSBjb3JlIGNvZGUK
PiA+PiBrbm93IHRoYXQgaXQgc2hvdWxkIGludm9rZSBzaHV0ZG93biBpbnN0ZWFkIG9mIGRpc2Fi
bGUuCj4gPj4gCj4gPj4gU29tZXRoaW5nIGxpa2UgdGhlIGNvbXBsZXRlbHkgdW50ZXN0ZWQgcGF0
Y2ggYmVsb3cuCj4gPgo+ID4gVW5kZXJzdGFuZGFibGUuIFJlYWxseSBhcHByZWNpYXRlIHRoZSBw
YXRjaCBzdWdnZXN0aW9uIGJlbG93IGFuZCBpIHdpbGwgdGVzdCBpdAo+ID4gZm9yIHN1cmUgYW5k
IHNlZSBpZiB0aGluZ3MgY2FuIGJlIGZpeGVkIHByb3Blcmx5IGluIGlycSBjb3JlIGlmIHRoYXRz
IHRoZSBvbmx5Cj4gPiBvcHRpb24uIEluIHRoZSBtZWFud2hpbGUsIEkgdHJpZWQgdG8gZml4IGl0
IG9uIHhlbiBzaWRlIHVubGVzcyBpdCBnaXZlcyB5b3UgdGhlIAo+ID4gc2FtZSBmZWVsaW5nIGFz
IGFib3ZlPyBNU0kteCBhcmUganVzdCBmaW5lLCBqdXN0IGlvYXBpYyBvbmVzIGRvbid0IGdldCBh
bnkgZXZlbnQKPiA+IGNoYW5uZWwgYXNzc2lnbmVkIGhlbmNlIGVuYWJsZV9keW5pcnEgZG9lcyBu
b3RoaW5nLiBUaG9zZSBuZWVkcyB0byBiZSByZXN0YXJ0ZWQuCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2
ZW50c19iYXNlLmMKPiA+IGluZGV4IDFiYjBiNTIyZDAwNC4uMmVkMTUyZjM1ODE2IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiA+ICAgICArKysgYi9k
cml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwo+ID4gQEAgLTU3NSw2ICs1NzUsMTEgQEAg
c3RhdGljIHZvaWQgc2h1dGRvd25fcGlycShzdHJ1Y3QgaXJxX2RhdGEgKmRhdGEpCj4gPgo+ID4g
c3RhdGljIHZvaWQgZW5hYmxlX3BpcnEoc3RydWN0IGlycV9kYXRhICpkYXRhKQo+ID4gewo+ID4g
ICAgICsvKmlvYXBpYyBpbnRlcnJ1cHRzIGRvbid0IGdldCBldmVudCBjaGFubmVsIGFzc2lnbmVk
Cj4gPiAgICAgICAgKyAqIGFmdGVyIGJlaW5nIGV4cGxpY2l0bHkgc2h1dGRvd24gZHVyaW5nIGd1
ZXN0Cj4gPiAgICAgICAgKyAqIGhpYmVybmF0aW9uLiBUaGV5IG5lZWQgdG8gYmUgcmVzdGFydGVk
Ki8KPiA+ICAgICAgICAgKyAgICAgICBpZighZXZ0Y2huX2Zyb21faXJxKGRhdGEtPmlycSkpCj4g
PiAgICAgICAgICsgICAgICAgICAgICAgICBzdGFydHVwX3BpcnEoZGF0YSk7Cj4gPiAgICAgZW5h
YmxlX2R5bmlycShkYXRhKTsKPiA+ICB9Cj4gCj4gSW50ZXJlc3RpbmcgcGF0Y2ggZm9ybWF0IDop
CkFwcGFyZW50bHkgdmltIGFuZCBtZSBydXNoaW5nIHRocm91Z2ggdGhlIGVtYWlsIFtkaWQgbm90
IGZvcm1hdCB0aGUgcGF0Y2hdCndlcmUgdGhlIGN1bHByaXQgYW5kIEkgb25seSBjYXVnaHQgaXQg
YWZ0ZXIgc2VuZGluZyBhbiBlbWFpbAo+IAo+IERvaW5nIHRoZSBzaHV0ZG93biBmcm9tIHN5c2Nv
cmVfb3BzIGFuZCB0aGUgc3RhcnR1cCBjb25kaXRpb25hbGx5IGluIGEKPiB0b3RhbHkgdW5yZWxh
dGVkIGZ1bmN0aW9uIGlzIG5vdCByZWFsbHkgaW50dWl0aXZlLgo+IApJIGFncmVlIHRvIHRoZSBw
b2ludCB0aGF0IHN0aWxsIHRoZSBzdGFydHVwIGlzIG5vdCBhcyBzeW5jaHJvbm91cyAKdG8gc2h1
dGRvd24gaG93ZXZlciwgZW5hYmxlX3BpcnEgaXMgc3RpbGwgaW52b2tlZCBkdXJpbmcgaXJxX3N0
YXJ0dXAKZm9yIHhlbiBzcGVjaWZpYyBjb2RlIGFuZCBJIHdhcyB0cnlpbmcgdG8gcmV1c2UgdGhl
IGNvZGUgcGF0aCB0byBmaXggCndpdGhpbiB4ZW4uIEJhc2ljYWxseSBib3Jyb3dpbmcgZnJvbSB3
aGF0IHRoaXMgY29tbWl0IFtjb21taXQgMDIwZGI5ZDNdCmNoYW5nZWQuIE5vdCBzdXJlIGlmIHRo
aXMgY291bGQgaGF2ZSBicm9rZW4gdW5kZXIgYW55IG90aGVyIGVudmlyb25tZW50CnRob3VnaCA6
KAoKQnV0IGFueXdheXMgSSB0aGluayB0aGUgcGF0Y2ggeW91IHN1Z2dlc3RlZCBpcyBtdWNoIG1v
cmUgY2xlYW4gYW5kIAppbnR1aXRpdmUuCgo+IFNvIGVpdGhlciB5b3UgZG8gaXQgc3ltbWV0cmlj
YWxseSBpbiBYRU4gdmlhIHN5c2NvcmVfb3BzIGNhbGxiYWNrcyBvcgo+IHlvdSBsZXQgdGhlIGly
cSBjb3JlIGNvZGUgaGVscCB5b3Ugb3V0IHdpdGggdGhlIHBhdGNoIEkgcHJvdmlkZWQKPiAKSW4g
bXkgdW5kZXJzdGFuZGluZywgaXQgbWF5IG5vdCBiZSB0aGUgcmlnaHQgdGhpbmcgYXMgc3lzY29y
ZSBzdHVmZiBydW5zCndpdGggb25lIGNwdSBvbmxpbmUgYW5kIGRpc2FibGVkIGludGVycnVwdHMu
IEFsc28gSSBkaWQgdHJ5IGl0IGluIHRoZSBwYXN0IAphbmQgZmFpbGVkIGhvcnJpYmx5IHVubGVz
cyB0aGVyZSBpcyBhbnkgc21hcnRlciB3YXkgb2YgZG9pbmcgaXQuCkl0IHNob3VsZCBjb3JyZWN0
bHkgYmUgZG9uZSBpbiBzdXNwZW5kL3Jlc3VtZSBkZXZpY2VzIGFzIGFyZSBvdGhlciBkZXZpY2Ug
CmludGVycnVwdHMuCgpJIGRpZCB0ZXN0IHRoZSBwYXRjaCB5b3Ugc3VnZ2VzdGVkIGFuZCBpdCB3
b3Jrcy4KSSBoYXZlbid0IGRvbmUgbGFyZ2Ugc2NhbGUgdGVzdGluZyBidXQgaXQgbG9va3MgbGlr
ZSBpdCBtYXkganVzdCB3b3JrIGZpbmUuCkkgd2lsbCBzZW5kIG91dCBhbiB1cGRhdGVkIHBhdGNo
IGZvciBzaHV0ZG93bi9zdGFydHVwIG9mIHBpcnEgYWZ0ZXIgSSBkbyBzb21lCm1vcmUgdGVzdGlu
ZyBhbmQgd2lsbCBkcm9wIHBhdGNoZXMgcmVsYXRlZCB0byBzaHV0ZG93bi9zdGFydHVwIG9mIHBp
cnFzIGZyb20gCnRoZSBvcmlnaW5hbCBzZXJpZXMuCgpUaGFua3MsCgpBbmNoYWwKCj4gVGhhbmtz
LAo+IAo+ICAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
