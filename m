Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC5709C8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:35:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpe3T-0001jA-82; Mon, 22 Jul 2019 19:33:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rrjn=VT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hpe3S-0001j5-0Y
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:33:02 +0000
X-Inumbo-ID: 8376c242-acb7-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8376c242-acb7-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zw0OzLY2qkyLgMJYZmR8YfjGW2oVP8VhhsbR5Yd/A7w=; b=TqldDQQlZ5ZIvVudiXOATvg8+6
 99A+Mn8ucymBMPFhYx39j7RhwEqzKlskYs7uBA2fXig+Bxy7FrABNjSPOmH4GIcSvZhdDn6/2+ZsJ
 VUg6cZbX8pBbqtj2bpRyU9Hzp/nnIWZowUX2X0jd2bLQuCjO1IrSHkq7ZpEA2agi1YNRwmTRLLboh
 67TOwpPTag0FdERZ4yZ/3XiWzg/K9OYALvLZ0986XmDMNqvH4LVlmKnnhtNsUUIsaVZ0eY6sn+2NN
 AtPJRQxOZ5Fl/h2Qzpox5vkgD09aPBondQwxq2tWQ+ZSFyHsqkgVr0smD7+AfjWNC6hLNxOuTf5H+
 UtPXJ1DA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpe3J-0006Hn-Eh; Mon, 22 Jul 2019 19:32:53 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id A1F78980C59; Mon, 22 Jul 2019 21:32:51 +0200 (CEST)
Date: Mon, 22 Jul 2019 21:32:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Message-ID: <20190722193251.GF6698@worktop.programming.kicks-ass.net>
References: <20190719005837.4150-1-namit@vmware.com>
 <20190719005837.4150-5-namit@vmware.com>
 <20190722191433.GD6698@worktop.programming.kicks-ass.net>
 <58DA0841-33C2-4D16-A671-08064A15001C@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58DA0841-33C2-4D16-A671-08064A15001C@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v3 4/9] x86/mm/tlb: Flush remote and local
 TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDc6Mjc6MDlQTSArMDAwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiA+IE9uIEp1bCAyMiwgMjAxOSwgYXQgMTI6MTQgUE0sIFBldGVyIFppamxzdHJhIDxwZXRl
cnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cgo+ID4gQnV0IHRoZW4gd2UgY2FuIHN0aWxsIGRvIHNv
bWV0aGluZyBsaWtlIHRoZSBiZWxvdywgd2hpY2ggZG9lc24ndCBjaGFuZ2UKPiA+IHRoaW5ncyBh
bmQgc3RpbGwgZ2V0cyByaWQgb2YgdGhhdCBkdWFsIGZ1bmN0aW9uIGNydWQsIHNpbXBsaWZ5aW5n
Cj4gPiBzbXBfY2FsbF9mdW5jdGlvbl9tYW55IGFnYWluLgoKPiBOaWNlISBJIHdpbGwgYWRkIGl0
IG9uIHRvcCwgaWYgeW91IGRvbuKAmXQgbWluZCAoaW5zdGVhZCBzcXVhc2hpbmcgaXQpLgoKTm90
IGF0IGFsbC4KCj4gVGhlIG9yaWdpbmFsIGRlY2lzaW9uIHRvIGhhdmUgbG9jYWwvcmVtb3RlIGZ1
bmN0aW9ucyB3YXMgbW9zdGx5IHRvIHByb3ZpZGUKPiB0aGUgZ2VuZXJhbGl0eS4KPiAKPiBJIHdv
dWxkIGNoYW5nZSB0aGUgbGFzdCBhcmd1bWVudCBvZiBfX3NtcF9jYWxsX2Z1bmN0aW9uX21hbnko
KSBmcm9tIOKAnHdhaXTigJ0KPiB0byDigJxmbGFnc+KAnSB0aGF0IHdvdWxkIGluZGljYXRlIHdo
ZXRoZXIgdG8gcnVuIHRoZSBmdW5jdGlvbiBsb2NhbGx5LCBzaW5jZSBJCj4gZG9u4oCZdCB3YW50
IHRvIGNoYW5nZSB0aGUgc2VtYW50aWNzIG9mIHNtcF9jYWxsX2Z1bmN0aW9uX21hbnkoKSBhbmQg
ZGVjaWRlCj4gd2hldGhlciB0byBydW4gdGhlIGZ1bmN0aW9uIGxvY2FsbHkgcHVyZWx5IGJhc2Vk
IG9uIHRoZSBtYXNrLiBMZXQgbWUga25vdyBpZgo+IHlvdSBkaXNhZ3JlZS4KCkFncmVlZC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
