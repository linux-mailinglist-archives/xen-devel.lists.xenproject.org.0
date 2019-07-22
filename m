Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D800F70996
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpdlw-0008W4-LE; Mon, 22 Jul 2019 19:14:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rrjn=VT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hpdlu-0008Vz-P9
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:14:54 +0000
X-Inumbo-ID: fb49d242-acb4-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb49d242-acb4-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0Aa1oppo5fgpAqfdlhMZ/Y4FyX3KZF6G5NCMud93Ao=; b=tFFSxg0Nh2G+2z2wXW0kiyQe9
 pI4T7G3Po/BYJUF/dTPfTtYTgQHndHYOd2T3x5vPyfQZtBEJDEV7Xt5vAcjXDgaWEw4hezIOsAWe3
 A2p+EpI6mVaVlp/IsZk/mF7nTueQPBJ6AbJtJqubeRcoEmKj/FJop4YqiSX6x8lknsw8kuXc0WRQb
 nyIaiojxTFS93l+DLFa2hieuFTcZY00msSqMv6iMkyx2kCLXLEHLo8StTtaVB+666J8E/BchkXa4r
 5Q13HKIfQNErihSnxd261MYESBOoNhZz9yo+v99LWxzP2Es2+1OW+GCzOXThbLpB1IJqJw8ZXTNka
 kw4vEbxfw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpdlc-00068v-1I; Mon, 22 Jul 2019 19:14:36 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id D99D6980C6E; Mon, 22 Jul 2019 21:14:33 +0200 (CEST)
Date: Mon, 22 Jul 2019 21:14:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Message-ID: <20190722191433.GD6698@worktop.programming.kicks-ass.net>
References: <20190719005837.4150-1-namit@vmware.com>
 <20190719005837.4150-5-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719005837.4150-5-namit@vmware.com>
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
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDU6NTg6MzJQTSAtMDcwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiBAQCAtNzA5LDggKzcxNiw5IEBAIHZvaWQgbmF0aXZlX2ZsdXNoX3RsYl9vdGhlcnMoY29u
c3Qgc3RydWN0IGNwdW1hc2sgKmNwdW1hc2ssCj4gIAkgKiBkb2luZyBhIHNwZWN1bGF0aXZlIG1l
bW9yeSBhY2Nlc3MuCj4gIAkgKi8KPiAgCWlmIChpbmZvLT5mcmVlZF90YWJsZXMpIHsKPiAtCQlz
bXBfY2FsbF9mdW5jdGlvbl9tYW55KGNwdW1hc2ssIGZsdXNoX3RsYl9mdW5jX3JlbW90ZSwKPiAt
CQkJICAgICAgICh2b2lkICopaW5mbywgMSk7Cj4gKwkJX19zbXBfY2FsbF9mdW5jdGlvbl9tYW55
KGNwdW1hc2ssIGZsdXNoX3RsYl9mdW5jX3JlbW90ZSwKPiArCQkJCQkgZmx1c2hfdGxiX2Z1bmNf
bG9jYWwsCj4gKwkJCQkJICh2b2lkICopaW5mbywgMSk7Cj4gIAl9IGVsc2Ugewo+ICAJCS8qCj4g
IAkJICogQWx0aG91Z2ggd2UgY291bGQgaGF2ZSB1c2VkIG9uX2VhY2hfY3B1X2NvbmRfbWFzaygp
LAo+IEBAIC03MzcsNyArNzQ1LDggQEAgdm9pZCBuYXRpdmVfZmx1c2hfdGxiX290aGVycyhjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywKPiAgCQkJaWYgKHRsYl9pc19ub3RfbGF6eShjcHUp
KQo+ICAJCQkJX19jcHVtYXNrX3NldF9jcHUoY3B1LCBjb25kX2NwdW1hc2spOwo+ICAJCX0KPiAt
CQlzbXBfY2FsbF9mdW5jdGlvbl9tYW55KGNvbmRfY3B1bWFzaywgZmx1c2hfdGxiX2Z1bmNfcmVt
b3RlLAo+ICsJCV9fc21wX2NhbGxfZnVuY3Rpb25fbWFueShjb25kX2NwdW1hc2ssIGZsdXNoX3Rs
Yl9mdW5jX3JlbW90ZSwKPiArCQkJCQkgZmx1c2hfdGxiX2Z1bmNfbG9jYWwsCj4gIAkJCQkJICh2
b2lkICopaW5mbywgMSk7Cj4gIAl9Cj4gIH0KCkRvIHdlIHJlYWxseSBuZWVkIHRoYXQgX2xvY2Fs
L19yZW1vdGUgZGlzdGluY3Rpb24/IElTVFIgeW91IGhhZCBhIHBhdGNoCnRoYXQgZnJvYmJlZCBm
bHVzaF90bGJfaW5mbyBpbnRvIHRoZSBjc2QgYW5kIHRoYXQgZ2F2ZSBzcGFjZQpjb25zdHJhaW50
cywgYnV0IEknbSBub3Qgc2VlaW5nIHRoYXQgaGVyZSAocHJvYmFibHkgYSB3aXNlLCBnZXQgc3R1
ZmYKbWVyZ2VkIGV0Yy4uKS4KCnN0cnVjdCBfX2NhbGxfc2luZ2xlX2RhdGEgewogICAgICAgIHN0
cnVjdCBsbGlzdF9ub2RlICAgICAgICAgIGxsaXN0OyAgICAgICAgICAgICAgICAvKiAgICAgMCAg
ICAgOCAqLwogICAgICAgIHNtcF9jYWxsX2Z1bmNfdCAgICAgICAgICAgIGZ1bmM7ICAgICAgICAg
ICAgICAgICAvKiAgICAgOCAgICAgOCAqLwogICAgICAgIHZvaWQgKiAgICAgICAgICAgICAgICAg
ICAgIGluZm87ICAgICAgICAgICAgICAgICAvKiAgICAxNiAgICAgOCAqLwogICAgICAgIHVuc2ln
bmVkIGludCAgICAgICAgICAgICAgIGZsYWdzOyAgICAgICAgICAgICAgICAvKiAgICAyNCAgICAg
NCAqLwoKICAgICAgICAvKiBzaXplOiAzMiwgY2FjaGVsaW5lczogMSwgbWVtYmVyczogNCAqLwog
ICAgICAgIC8qIHBhZGRpbmc6IDQgKi8KICAgICAgICAvKiBsYXN0IGNhY2hlbGluZTogMzIgYnl0
ZXMgKi8KfTsKCnN0cnVjdCBmbHVzaF90bGJfaW5mbyB7CiAgICAgICAgc3RydWN0IG1tX3N0cnVj
dCAqICAgICAgICAgbW07ICAgICAgICAgICAgICAgICAgIC8qICAgICAwICAgICA4ICovCiAgICAg
ICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgc3RhcnQ7ICAgICAgICAgICAgICAgIC8qICAg
ICA4ICAgICA4ICovCiAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgZW5kOyAgICAg
ICAgICAgICAgICAgIC8qICAgIDE2ICAgICA4ICovCiAgICAgICAgdTY0ICAgICAgICAgICAgICAg
ICAgICAgICAgbmV3X3RsYl9nZW47ICAgICAgICAgIC8qICAgIDI0ICAgICA4ICovCiAgICAgICAg
dW5zaWduZWQgaW50ICAgICAgICAgICAgICAgc3RyaWRlX3NoaWZ0OyAgICAgICAgIC8qICAgIDMy
ICAgICA0ICovCiAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAgZnJlZWRfdGFibGVz
OyAgICAgICAgIC8qICAgIDM2ICAgICAxICovCgogICAgICAgIC8qIHNpemU6IDQwLCBjYWNoZWxp
bmVzOiAxLCBtZW1iZXJzOiA2ICovCiAgICAgICAgLyogcGFkZGluZzogMyAqLwogICAgICAgIC8q
IGxhc3QgY2FjaGVsaW5lOiA0MCBieXRlcyAqLwp9OwoKSUlSQyB3aGF0IHlvdSBkaWQgd2FzIG1h
a2Ugdm9pZCAqX19jYWxsX3NpbmdsZV9kYXRhOjppbmZvIHRoZSBsYXN0Cm1lbWJlciBhbmQgYSB1
bmlvbiB1bnRpbCB0aGUgZnVsbCBjYWNoZWxpbmUgc2l6ZSAoNjQpLiBHaXZlbiB0aGUgYWJvdmUK
dGhhdCB3b3VsZCBnZXQgdXMgMjQgYnl0ZXMgZm9yIGNzZCwgbGVhdmluZyB1cyA0MCBmb3IgdGhh
dApmbHVzaF90bGJfaW5mby4KCkJ1dCB0aGVuIHdlIGNhbiBzdGlsbCBkbyBzb21ldGhpbmcgbGlr
ZSB0aGUgYmVsb3csIHdoaWNoIGRvZXNuJ3QgY2hhbmdlCnRoaW5ncyBhbmQgc3RpbGwgZ2V0cyBy
aWQgb2YgdGhhdCBkdWFsIGZ1bmN0aW9uIGNydWQsIHNpbXBsaWZ5aW5nCnNtcF9jYWxsX2Z1bmN0
aW9uX21hbnkgYWdhaW4uCgpJbmRleDogbGludXgtMi42L2FyY2gveDg2L2luY2x1ZGUvYXNtL3Rs
YmZsdXNoLmgKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0gbGludXgtMi42Lm9yaWcvYXJjaC94ODYvaW5jbHVkZS9h
c20vdGxiZmx1c2guaAorKysgbGludXgtMi42L2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKQEAgLTU0Niw4ICs1NDYsOSBAQCBzdHJ1Y3QgZmx1c2hfdGxiX2luZm8gewogCXVuc2lnbmVk
IGxvbmcJCXN0YXJ0OwogCXVuc2lnbmVkIGxvbmcJCWVuZDsKIAl1NjQJCQluZXdfdGxiX2dlbjsK
LQl1bnNpZ25lZCBpbnQJCXN0cmlkZV9zaGlmdDsKLQlib29sCQkJZnJlZWRfdGFibGVzOworCXVu
c2lnbmVkIGludAkJY3B1OworCXVuc2lnbmVkIHNob3J0CQlzdHJpZGVfc2hpZnQ7CisJdW5zaWdu
ZWQgY2hhcgkJZnJlZWRfdGFibGVzOwogfTsKIAogI2RlZmluZSBsb2NhbF9mbHVzaF90bGIoKSBf
X2ZsdXNoX3RsYigpCkluZGV4OiBsaW51eC0yLjYvYXJjaC94ODYvbW0vdGxiLmMKPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0gbGludXgtMi42Lm9yaWcvYXJjaC94ODYvbW0vdGxiLmMKKysrIGxpbnV4LTIuNi9hcmNo
L3g4Ni9tbS90bGIuYwpAQCAtNjU5LDYgKzY1OSwyNyBAQCBzdGF0aWMgdm9pZCBmbHVzaF90bGJf
ZnVuY19yZW1vdGUodm9pZCAqCiAJZmx1c2hfdGxiX2Z1bmNfY29tbW9uKGYsIGZhbHNlLCBUTEJf
UkVNT1RFX1NIT09URE9XTik7CiB9CiAKK3N0YXRpYyB2b2lkIGZsdXNoX3RsYl9mdW5jKHZvaWQg
KmluZm8pCit7CisJY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICpmID0gaW5mbzsKKwllbnVt
IHRsYl9mbHVzaF9yZWFzb24gcmVhc29uID0gVExCX1JFTU9URV9TSE9PVERPV047CisJYm9vbCBs
b2NhbCA9IGZhbHNlOworCisJaWYgKGYtPmNwdSA9PSBzbXBfcHJvY2Vzc29yX2lkKCkpIHsKKwkJ
bG9jYWwgPSB0cnVlOworCQlyZWFzb24gPSAoZi0+bW0gPT0gTlVMTCkgPyBUTEJfTE9DQUxfU0hP
T1RET1dOIDogVExCX0xPQ0FMX01NX1NIT09URE9XTjsKKwl9IGVsc2UgeworCQlpbmNfaXJxX3N0
YXQoaXJxX3RsYl9jb3VudCk7CisKKwkJaWYgKGYtPm1tICYmIGYtPm1tICE9IHRoaXNfY3B1X3Jl
YWQoY3B1X3RsYnN0YXRlLmxvYWRlZF9tbSkpCisJCQlyZXR1cm47CisKKwkJY291bnRfdm1fdGxi
X2V2ZW50KE5SX1RMQl9SRU1PVEVfRkxVU0hfUkVDRUlWRUQpOworCX0KKworCWZsdXNoX3RsYl9m
dW5jX2NvbW1vbihmLCBsb2NhbCwgcmVhc29uKTsKK30KKwogc3RhdGljIGJvb2wgdGxiX2lzX25v
dF9sYXp5KGludCBjcHUpCiB7CiAJcmV0dXJuICFwZXJfY3B1KGNwdV90bGJzdGF0ZV9zaGFyZWQu
aXNfbGF6eSwgY3B1KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
