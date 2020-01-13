Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A984913913E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 13:46:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqz3z-0001nS-NK; Mon, 13 Jan 2020 12:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6am9=3C=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1iqz3x-0001nN-Nj
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 12:43:21 +0000
X-Inumbo-ID: 40679c42-3602-11ea-b89f-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40679c42-3602-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cl+a0Ksq5P2uxep+vtJZs+gr7i53uKQU6pt50ip33jo=; b=fcyw21hMSWLKxkn0vyj9yS8LY
 wTdB37m/bjABnGDJO3uV2yMcbzG0G9laSW8+lt2vO7890PInmOvbiEQOdxO9qLd5WROVTvEIH8bLg
 EANxWyZetCLm5G8Ikg53/8ubDWoDT1G2/VqkzbZJcE/TZjPcxXLers49AKrdse34lF5o4YG16a+0A
 C6dKSoxpr0MbLEWEW7aMfP90uKKBo1LNmKIJpJ1BeqRR6GdzFNSbxD4jJUn/mYqv6RkmQyX3XI/sB
 jZO1ErhSAKvhw+JvB/Paj64HFq+2BVsRVpS1ImhPasWC+CTBvY2Yf/ll0Ewpk4tuJWoeHvEJfTnoC
 OBKuZRRag==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqz3S-0004AK-FT; Mon, 13 Jan 2020 12:42:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56D1D304121;
 Mon, 13 Jan 2020 13:41:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AD5752B6B2F94; Mon, 13 Jan 2020 13:42:47 +0100 (CET)
Date: Mon, 13 Jan 2020 13:42:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Singh, Balbir" <sblbir@amazon.com>
Message-ID: <20200113124247.GG2827@hirez.programming.kicks-ass.net>
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
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
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>, "Valentin,
 Eduardo" <eduval@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com"
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTE6NDM6MThBTSArMDAwMCwgU2luZ2gsIEJhbGJpciB3
cm90ZToKPiBGb3IgeW91ciBvcmlnaW5hbCBjb21tZW50LCBqdXN0IHdhbnRlZCB0byBjbGFyaWZ5
IHRoZSBmb2xsb3dpbmc6Cj4gCj4gMS4gQWZ0ZXIgaGliZXJuYXRpb24sIHRoZSBtYWNoaW5lIGNh
biBiZSByZXN1bWVkIG9uIGEgZGlmZmVyZW50IGJ1dCBjb21wYXRpYmxlCj4gaG9zdCAodGhlc2Ug
YXJlIFZNIGltYWdlcyBoaWJlcm5hdGVkKQo+IDIuIFRoaXMgbWVhbnMgdGhlIGNsb2NrIGJldHdl
ZW4gaG9zdDEgYW5kIGhvc3QyIGNhbi93aWxsIGJlIGRpZmZlcmVudAo+IAo+IEluIHlvdXIgY29t
bWVudHMgYXJlIHlvdSBtYWtpbmcgdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgaG9zdChzKSBpcy9h
cmUgdGhlCj4gc2FtZT8gSnVzdCBjaGVja2luZyB0aGUgYXNzdW1wdGlvbnMgYmVpbmcgbWFkZSBh
bmQgYmVpbmcgb24gdGhlIHNhbWUgcGFnZSB3aXRoCj4gdGhlbS4KCkkgd291bGQgZXhwZWN0IHRo
aXMgdG8gYmUgdGhlIHNhbWUgcHJvYmxlbSB3ZSBoYXZlIGFzIHJlZ3VsYXIgc3VzcGVuZCwKYWZ0
ZXIgcG93ZXIgb2ZmIHRoZSBUU0Mgd2lsbCBoYXZlIGJlZW4gcmVzZXQsIHNvIHJlc3VtZSB3aWxs
IGhhdmUgdG8Kc29tZWhvdyBicmlkZ2UgdGhhdCBnYXAuIEkndmUgbm8gaWRlYSBpZi9ob3cgaXQg
ZG9lcyB0aGF0LgoKSSByZW1lbWJlciBzb21lIEJJT1NlcyBoYWQgY3JhenkgVFNDIGlkZWFzIGZv
ciBzdXNwZW5kMnJhbSwgYW5kIHdlIGdyZXcKdHNjX3Jlc3RvcmVfc2NoZWRfY2xvY2tfc3RhdGUo
KSBmb3IgaXQuCgpQbGF5aW5nIGNyYXp5IGdhbWVzIGxpa2Ugd2hhdCB5b3UncmUgZG9pbmcganVz
dCBpc24ndCBpdCB0aG91Z2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
