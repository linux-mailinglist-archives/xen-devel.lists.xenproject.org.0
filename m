Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4B9138EE9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:19:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqwlz-0005jz-0F; Mon, 13 Jan 2020 10:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6am9=3C=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1iqwlx-0005ju-Tb
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 10:16:37 +0000
X-Inumbo-ID: c1289850-35ed-11ea-a2eb-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1289850-35ed-11ea-a2eb-bc764e2007e4;
 Mon, 13 Jan 2020 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TC8ktWymGRn+4RZ97AzmjSGIJ8ZQa/9bHdinVyx7ycg=; b=m9fa8+qyDpqOPF1lzJst9rx9Z
 tLwFtzUYhZGUGuR8ylDqhtV0deAG3/4U4pZ4AgRJFA6lwRXtlybu3cu/hdvzKNW/ASZqVK5bjR9d2
 dB7XKvGOnyW9pv/Y67GknqAc/nAWs4VILGEjXA7jXTMncEPOiTq6TypYHXj0QgKaIqi5fgFex9yJZ
 IvASIqOaazC2uF2dvArIiRK7ES6Kl+7TVLWEUsK0tXjYges7EwbOU342OUtpqfS9A/c/m7rVWvxz4
 eRT8VrqFpVq1r16TFS5UDVLUq8CAImRAiIt3vS+XPW6sqx8WuRLBIaIAqn0xz+Gg717mt5YWuj7XU
 NlJYa7ilg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwlY-0002xH-Vd; Mon, 13 Jan 2020 10:16:13 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0C901304121;
 Mon, 13 Jan 2020 11:14:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4D3C02B616422; Mon, 13 Jan 2020 11:16:09 +0100 (CET)
Date: Mon, 13 Jan 2020 11:16:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Eduardo Valentin <eduval@amazon.com>
Message-ID: <20200113101609.GT2844@hirez.programming.kicks-ass.net>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
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
Cc: konrad.wilk@oracle.co, x86@kernel.org, linux-mm@kvack.org, axboe@kernel.dk,
 pavel@ucw.cz, hpa@zytor.com, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, fllinden@amaozn.com, kamatam@amazon.com,
 mingo@redhat.com, xen-devel@lists.xenproject.org, sblbir@amazon.com,
 len.brown@intel.com, linux-pm@vger.kernel.org,
 Anchal Agarwal <anchalag@amazon.com>, bp@alien8.de, tglx@linutronix.de,
 jgross@suse.com, netdev@vger.kernel.org,
 Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDc6MzU6MjBBTSAtMDgwMCwgRWR1YXJkbyBWYWxlbnRp
biB3cm90ZToKPiBIZXkgUGV0ZXIsCj4gCj4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6NTA6
MTFBTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAwNywgMjAy
MCBhdCAxMTo0NToyNlBNICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90ZToKPiA+ID4gRnJvbTog
RWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+Cj4gPiA+IAo+ID4gPiBTeXN0ZW0g
aW5zdGFiaWxpdHkgYXJlIHNlZW4gZHVyaW5nIHJlc3VtZSBmcm9tIGhpYmVybmF0aW9uIHdoZW4g
c3lzdGVtCj4gPiA+IGlzIHVuZGVyIGhlYXZ5IENQVSBsb2FkLiBUaGlzIGlzIGR1ZSB0byB0aGUg
bGFjayBvZiB1cGRhdGUgb2Ygc2NoZWQKPiA+ID4gY2xvY2sgZGF0YSwgYW5kIHRoZSBzY2hlZHVs
ZXIgd291bGQgdGhlbiB0aGluayB0aGF0IGhlYXZ5IENQVSBob2cKPiA+ID4gdGFza3MgbmVlZCBt
b3JlIHRpbWUgaW4gQ1BVLCBjYXVzaW5nIHRoZSBzeXN0ZW0gdG8gZnJlZXplCj4gPiA+IGR1cmlu
ZyB0aGUgdW5mcmVlemluZyBvZiB0YXNrcy4gRm9yIGV4YW1wbGUsIHRocmVhZGVkIGlycXMsCj4g
PiA+IGFuZCBrZXJuZWwgcHJvY2Vzc2VzIHNlcnZpY2luZyBuZXR3b3JrIGludGVyZmFjZSBtYXkg
YmUgZGVsYXllZAo+ID4gPiBmb3Igc2V2ZXJhbCB0ZW5zIG9mIHNlY29uZHMsIGNhdXNpbmcgdGhl
IHN5c3RlbSB0byBiZSB1bnJlYWNoYWJsZS4KPiA+IAo+ID4gPiBUaGUgZml4IGZvciB0aGlzIHNp
dHVhdGlvbiBpcyB0byBtYXJrIHRoZSBzY2hlZCBjbG9jayBhcyB1bnN0YWJsZQo+ID4gPiBhcyBl
YXJseSBhcyBwb3NzaWJsZSBpbiB0aGUgcmVzdW1lIHBhdGgsIGxlYXZpbmcgaXQgdW5zdGFibGUK
PiA+ID4gZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgcmVzdW1lIHByb2Nlc3MuIFRoaXMgd2lsbCBm
b3JjZSB0aGUKPiA+ID4gc2NoZWR1bGVyIHRvIGF0dGVtcHQgdG8gYWxpZ24gdGhlIHNjaGVkIGNs
b2NrIGFjcm9zcyBDUFVzIHVzaW5nCj4gPiA+IHRoZSBkZWx0YSB3aXRoIHRpbWUgb2YgZGF5LCB1
cGRhdGluZyBzY2hlZCBjbG9jayBkYXRhLiBJbiBhIHBvc3QKPiA+ID4gaGliZXJuYXRpb24gZXZl
bnQsIHdlIGNhbiB0aGVuIG1hcmsgdGhlIHNjaGVkIGNsb2NrIGFzIHN0YWJsZQo+ID4gPiBhZ2Fp
biwgYXZvaWRpbmcgdW5uZWNlc3Nhcnkgc3luY3Mgd2l0aCB0aW1lIG9mIGRheSBvbiBzeXN0ZW1z
Cj4gPiA+IGluIHdoaWNoIFRTQyBpcyByZWxpYWJsZS4KPiA+IAo+ID4gVGhpcyBtYWtlcyBubyBm
cmlnZ2luZyBzZW5zZSB3aGF0IHNvIGJsb29keSBldmVyLiBJZiB0aGUgY2xvY2sgaXMKPiA+IHN0
YWJsZSwgd2UgZG9uJ3QgY2FyZSBhYm91dCBzY2hlZF9jbG9ja19kYXRhLiBXaGVuIGl0IGlzIHN0
YWJsZSB5b3UgZ2V0Cj4gPiBhIGxpbmVhciBmdW5jdGlvbiBvZiB0aGUgVFNDIHdpdGhvdXQgY29t
cGxpY2F0ZWQgYml0cyBvbi4KPiA+IAo+ID4gV2hlbiBpdCBpcyB1bnN0YWJsZSwgb25seSB0aGVu
IGRvIHdlIGNhcmUgYWJvdXQgdGhlIHNjaGVkX2Nsb2NrX2RhdGEuCj4gPiAKPiAKPiBZZWFoLCBt
YXliZSB3aGF0IGlzIG5vdCBjbGVhciBoZXJlIGlzIHRoYXQgd2UgY292ZXJpbmcgZm9yIHNpdHVh
dGlvbgo+IHdoZXJlIGNsb2NrIHN0YWJpbGl0eSBjaGFuZ2VzIG92ZXIgdGltZSwgZS5nLiBhdCBy
ZWd1bGFyIGJvb3QgY2xvY2sgaXMKPiBzdGFibGUsIGhpYmVybmF0aW9uIGhhcHBlbnMsIHRoZW4g
cmVzdG9yZSBoYXBwZW5zIGluIGEgbm9uLXN0YWJsZSBjbG9jay4KClN0aWxsIGNvbmZ1c2VkLCB3
aG8gbWFya3MgdGhlIHRoaW5nIHVuc3RhYmxlPyBUaGUgcGF0Y2ggc2VlbXMgdG8gc3VnZ2VzdAp5
b3UgZG8geW91cnNlbGYsIGJ1dCBpdCBpcyBub3QgYXQgYWxsIGNsZWFyIHdoeS4KCklmIFRTQyBy
ZWFsbHkgaXMgdW5zdGFibGUsIHRoZW4gaXQgbmVlZHMgdG8gcmVtYWluIHVuc3RhYmxlLiBJZiB0
aGUgVFNDCnJlYWxseSBpcyBzdGFibGUgdGhlbiB0aGVyZSBpcyBubyBwb2ludCBpbiBtYXJraW5n
IGlzIHVuc3RhYmxlLgoKRWl0aGVyIHdheSBzb21ldGhpbmcgaXMgb2ZmLCBhbmQgeW91J3JlIG5v
dCB0ZWxsaW5nIG1lIHdoYXQuCgo+ID4gPiBSZXZpZXdlZC1ieTogRXJpayBRdWFuc3Ryb20gPHF1
YW5zdHJvQGFtYXpvbi5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBGcmFuayB2YW4gZGVyIExpbmRl
biA8ZmxsaW5kZW5AYW1hem9uLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEJhbGJpciBTaW5naCA8
c2JsYmlyQGFtYXpvbi5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBNdW5laGlzYSBLYW1hdGEgPGth
bWF0YW1AYW1hem9uLmNvbT4KPiA+ID4gVGVzdGVkLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5jaGFs
YWdAYW1hem9uLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1
dmFsQGFtYXpvbi5jb20+Cj4gPiA+IC0tLQo+ID4gCj4gPiBOQUssIHRoZSBjb2RlIHZlcnkgbXVj
aCByZWxpZXMgb24gbmV2ZXIgZ2V0dGluZyBtYXJrZWQgc3RhYmxlIGFnYWluCj4gPiBhZnRlciBp
dCBnZXRzIHNldCB0byB1bnN0YWJsZS4KPiA+IAo+IAo+IFdlbGwgYWN0dWFsbHksIGF0IHRoZSBQ
TV9QT1NUX0hJQkVSTkFUSU9OLCB3ZSBkbyB0aGUgY2hlY2sgYW5kIHNldCBzdGFibGUgaWYKPiBr
bm93biB0byBiZSBzdGFibGUuCj4gCj4gVGhlIGlzc3VlIG9ubHkgcmVhbGx5IGhhcHBlbnMgZHVy
aW5nIHRoZSByZXN0b3JhdGlvbiBwYXRoIHVuZGVyIHNjaGVkdWxpbmcgcHJlc3N1cmUsCj4gd2hp
Y2ggdGFrZXMgZm9yZXZlciB0byBmaW5pc2gsIGFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0Lgo+
IAo+IERvIHlvdSBzZWUgYSBiZXR0ZXIgc29sdXRpb24gZm9yIHRoaXMgaXNzdWU/CgpJIHN0aWxs
IGhhdmUgbm8gY2x1ZSB3aGF0IHlvdXIgYWN0dWFsIHByb2JsZW0gaXMuIFlvdSBzYXkgc2NoZWR1
bGluZwpnb2VzIHdvYmJseSBiZWNhdXNlIHNjaGVkX2Nsb2NrX2RhdGEgaXMgc3RhbGUsIGJ1dCB3
aGVuIHN0YWJsZSB0aGF0CmRvZXNuJ3QgbWF0dGVyLgoKU28gd2hhdCBpcyB0aGUgYWN0dWFsIHBy
b2JsZW0/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
