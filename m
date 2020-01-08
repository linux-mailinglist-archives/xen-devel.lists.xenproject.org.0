Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D611B133FAF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:53:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8vW-0001SQ-AC; Wed, 08 Jan 2020 10:51:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PFu/=25=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1ip8vU-0001SL-Rx
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:51:00 +0000
X-Inumbo-ID: bbe6a0b8-3204-11ea-bf56-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbe6a0b8-3204-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UqJ+/pT3izXu8kjYbbiezAa/YocSHtlN1XVLHEFRKJs=; b=h1hY+k92RryrIdTBhr5FexAw8
 O11fOafKK2pe28cad9xN3w5YC34MHOc8hOWB8aSF5ZjC4dagLW4Ma/0kLVb7woD8LikhFaOmCggkJ
 tGj6ZF/m8LSvTqTKZyMP0PiFTtEWolCan0If+IvY/U+RhWEd59XTazjWez3mvFGUqz2I2uaQnIthm
 xWGbmTwjpUTQg2ojRszkMLE7I3h5arSfW5f/vsqoPHTlTF8hBF73JlvH3LaJ8cmVuHmk/ZkvZDPlJ
 6rlLIighU6yX4hf5dztz9In1qHEMM4u/Z2M90C6vdcHgH9EOOe687bUXiPyWnDC+dNrkWrcOJJgAm
 fc6jza4hg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip8uo-00019z-P9; Wed, 08 Jan 2020 10:50:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DE995300693;
 Wed,  8 Jan 2020 11:48:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AF2B320B79C98; Wed,  8 Jan 2020 11:50:11 +0100 (CET)
Date: Wed, 8 Jan 2020 11:50:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Anchal Agarwal <anchalag@amazon.com>
Message-ID: <20200108105011.GY2827@hirez.programming.kicks-ass.net>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system
 instability in hibernation
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
Cc: konrad.wilk@oracle.co, eduval@amazon.com, x86@kernel.org,
 linux-mm@kvack.org, axboe@kernel.dk, pavel@ucw.cz, hpa@zytor.com,
 tglx@linutronix.de, sstabellini@kernel.org, fllinden@amaozn.com,
 kamatam@amazon.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 sblbir@amazon.com, len.brown@intel.com, linux-pm@vger.kernel.org, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTE6NDU6MjZQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwg
d3JvdGU6Cj4gRnJvbTogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+Cj4gCj4g
U3lzdGVtIGluc3RhYmlsaXR5IGFyZSBzZWVuIGR1cmluZyByZXN1bWUgZnJvbSBoaWJlcm5hdGlv
biB3aGVuIHN5c3RlbQo+IGlzIHVuZGVyIGhlYXZ5IENQVSBsb2FkLiBUaGlzIGlzIGR1ZSB0byB0
aGUgbGFjayBvZiB1cGRhdGUgb2Ygc2NoZWQKPiBjbG9jayBkYXRhLCBhbmQgdGhlIHNjaGVkdWxl
ciB3b3VsZCB0aGVuIHRoaW5rIHRoYXQgaGVhdnkgQ1BVIGhvZwo+IHRhc2tzIG5lZWQgbW9yZSB0
aW1lIGluIENQVSwgY2F1c2luZyB0aGUgc3lzdGVtIHRvIGZyZWV6ZQo+IGR1cmluZyB0aGUgdW5m
cmVlemluZyBvZiB0YXNrcy4gRm9yIGV4YW1wbGUsIHRocmVhZGVkIGlycXMsCj4gYW5kIGtlcm5l
bCBwcm9jZXNzZXMgc2VydmljaW5nIG5ldHdvcmsgaW50ZXJmYWNlIG1heSBiZSBkZWxheWVkCj4g
Zm9yIHNldmVyYWwgdGVucyBvZiBzZWNvbmRzLCBjYXVzaW5nIHRoZSBzeXN0ZW0gdG8gYmUgdW5y
ZWFjaGFibGUuCgo+IFRoZSBmaXggZm9yIHRoaXMgc2l0dWF0aW9uIGlzIHRvIG1hcmsgdGhlIHNj
aGVkIGNsb2NrIGFzIHVuc3RhYmxlCj4gYXMgZWFybHkgYXMgcG9zc2libGUgaW4gdGhlIHJlc3Vt
ZSBwYXRoLCBsZWF2aW5nIGl0IHVuc3RhYmxlCj4gZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgcmVz
dW1lIHByb2Nlc3MuIFRoaXMgd2lsbCBmb3JjZSB0aGUKPiBzY2hlZHVsZXIgdG8gYXR0ZW1wdCB0
byBhbGlnbiB0aGUgc2NoZWQgY2xvY2sgYWNyb3NzIENQVXMgdXNpbmcKPiB0aGUgZGVsdGEgd2l0
aCB0aW1lIG9mIGRheSwgdXBkYXRpbmcgc2NoZWQgY2xvY2sgZGF0YS4gSW4gYSBwb3N0Cj4gaGli
ZXJuYXRpb24gZXZlbnQsIHdlIGNhbiB0aGVuIG1hcmsgdGhlIHNjaGVkIGNsb2NrIGFzIHN0YWJs
ZQo+IGFnYWluLCBhdm9pZGluZyB1bm5lY2Vzc2FyeSBzeW5jcyB3aXRoIHRpbWUgb2YgZGF5IG9u
IHN5c3RlbXMKPiBpbiB3aGljaCBUU0MgaXMgcmVsaWFibGUuCgpUaGlzIG1ha2VzIG5vIGZyaWdn
aW5nIHNlbnNlIHdoYXQgc28gYmxvb2R5IGV2ZXIuIElmIHRoZSBjbG9jayBpcwpzdGFibGUsIHdl
IGRvbid0IGNhcmUgYWJvdXQgc2NoZWRfY2xvY2tfZGF0YS4gV2hlbiBpdCBpcyBzdGFibGUgeW91
IGdldAphIGxpbmVhciBmdW5jdGlvbiBvZiB0aGUgVFNDIHdpdGhvdXQgY29tcGxpY2F0ZWQgYml0
cyBvbi4KCldoZW4gaXQgaXMgdW5zdGFibGUsIG9ubHkgdGhlbiBkbyB3ZSBjYXJlIGFib3V0IHRo
ZSBzY2hlZF9jbG9ja19kYXRhLgoKPiBSZXZpZXdlZC1ieTogRXJpayBRdWFuc3Ryb20gPHF1YW5z
dHJvQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEZyYW5rIHZhbiBkZXIgTGluZGVuIDxmbGxp
bmRlbkBhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCYWxiaXIgU2luZ2ggPHNibGJpckBhbWF6
b24uY29tPgo+IFJldmlld2VkLWJ5OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNv
bT4KPiBUZXN0ZWQtYnk6IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEVkdWFyZG8gVmFsZW50aW4gPGVkdXZhbEBhbWF6b24uY29tPgo+IC0tLQoK
TkFLLCB0aGUgY29kZSB2ZXJ5IG11Y2ggcmVsaWVzIG9uIG5ldmVyIGdldHRpbmcgbWFya2VkIHN0
YWJsZSBhZ2FpbgphZnRlciBpdCBnZXRzIHNldCB0byB1bnN0YWJsZS4KCj4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9zY2hlZC9jbG9jay5jIGIva2VybmVsL3NjaGVkL2Nsb2NrLmMKPiBpbmRleCAxMTUy
MjU5YTRjYTAuLjM3NGQ0MGU1YjFhMiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvc2NoZWQvY2xvY2su
Ywo+ICsrKyBiL2tlcm5lbC9zY2hlZC9jbG9jay5jCj4gQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0
aWMgdm9pZCBfX3NjZF9zdGFtcChzdHJ1Y3Qgc2NoZWRfY2xvY2tfZGF0YSAqc2NkKQo+ICAJc2Nk
LT50aWNrX3JhdyA9IHNjaGVkX2Nsb2NrKCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIF9fc2V0
X3NjaGVkX2Nsb2NrX3N0YWJsZSh2b2lkKQo+ICt2b2lkIHNldF9zY2hlZF9jbG9ja19zdGFibGUo
dm9pZCkKPiAgewo+ICAJc3RydWN0IHNjaGVkX2Nsb2NrX2RhdGEgKnNjZDsKPiAgCj4gQEAgLTIz
Niw3ICsyMzYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBzY2hlZF9jbG9ja19pbml0X2xhdGUodm9p
ZCkKPiAgCXNtcF9tYigpOyAvKiBtYXRjaGVzIHtzZXQsY2xlYXJ9X3NjaGVkX2Nsb2NrX3N0YWJs
ZSgpICovCj4gIAo+ICAJaWYgKF9fc2NoZWRfY2xvY2tfc3RhYmxlX2Vhcmx5KQo+IC0JCV9fc2V0
X3NjaGVkX2Nsb2NrX3N0YWJsZSgpOwo+ICsJCXNldF9zY2hlZF9jbG9ja19zdGFibGUoKTsKPiAg
Cj4gIAlyZXR1cm4gMDsKPiAgfQo+IC0tIAo+IDIuMTUuMy5BTVpOCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
