Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7CC2B5B5
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 14:48:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVF0G-0002VH-Dz; Mon, 27 May 2019 12:45:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdqI=T3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hVF0E-0002VC-FI
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 12:45:22 +0000
X-Inumbo-ID: 4943cb77-807d-11e9-8980-bc764e045a96
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4943cb77-807d-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 12:45:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e2so8044215wrv.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 05:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2cYYgwiWVJJBJqLCSUSB4vY9rqs6lWWDF70rTeYp2I=;
 b=WvHBUJLt0b/4BOlgWwI/eBag/6ntWR3HZFNUpgJkeO3kSv+VOqMptm/+15qw5jB5yA
 ksYD0XhrKUFRWEnXrNl2nqEFZqtvOU5ojFuKNqW7QnQeH1YPwtx01EpCmUFb+qLeUdR7
 ttLwMCJtYIUWnLZt1SaswWcJ0m5o7NYGzh7G6bMWy6Jpy/yL5lgwhT+3N/c9/yC7wQVQ
 s3LxS+9r+cpKmG6gKt0yut60/sUSLD+AIgNnZyrC3KdLc1Jw8fBQGXquB+9bbX27ZhzC
 KV1Fwyr2Zvq2AGR9rci1mg3iigflwf/debnpUb3qzIAxjZ3+jU/zMciZ9eEmgxdjkmBP
 +LRQ==
X-Gm-Message-State: APjAAAX9pGPUkj9Q6i3NyTIAfUYSfwv71a/z01vV/DebazlcXLnE0PGu
 6tTKMmY2Zdn9hzXAoi3p+HjX1b/Pipc=
X-Google-Smtp-Source: APXvYqygU7qP4o2dkcY70xoK+YyGPQ+ieDW7hA+ZGXuE8LRMvLdpuQeC+BnMGifi0won+RJCrdExpA==
X-Received: by 2002:adf:bc94:: with SMTP id g20mr21574548wrh.206.1558961119322; 
 Mon, 27 May 2019 05:45:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c92d:f9e8:f150:3553?
 ([2001:b07:6468:f312:c92d:f9e8:f150:3553])
 by smtp.gmail.com with ESMTPSA id o20sm13139362wro.2.2019.05.27.05.45.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:45:18 -0700 (PDT)
To: Peter Zijlstra <peterz@infradead.org>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
 <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
 <20190527094710.GU2623@hirez.programming.kicks-ass.net>
 <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
 <20190527123206.GC2623@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81a67fa3-309d-79cc-5009-5c4908b18ba3@redhat.com>
Date: Mon, 27 May 2019 14:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527123206.GC2623@hirez.programming.kicks-ass.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDUvMTkgMTQ6MzIsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDI3
LCAyMDE5IGF0IDEyOjIxOjU5UE0gKzAyMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4+IE9uIDI3
LzA1LzE5IDExOjQ3LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiAKPj4+IC0tLSBhL2FyY2gveDg2
L2tlcm5lbC9rdm0uYwo+Pj4gKysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4+PiBAQCAtNTgw
LDcgKzU4MCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fYXBmX3RyYXBfaW5pdCh2b2kKPj4+
ICAKPj4+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza192YXJfdCwgX19wdl90bGJfbWFz
ayk7Cj4+PiAgCj4+PiAtc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3Ry
dWN0IGNwdW1hc2sgKmNwdW1hc2ssCj4+PiArc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9tdWx0
aShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywKPj4+ICAJCQljb25zdCBzdHJ1Y3QgZmx1
c2hfdGxiX2luZm8gKmluZm8pCj4+PiAgewo+Pj4gIAl1OCBzdGF0ZTsKPj4+IEBAIC01OTQsNiAr
NTk0LDkgQEAgc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgcwo+Pj4gIAkg
KiBxdWV1ZSBmbHVzaF9vbl9lbnRlciBmb3IgcHJlLWVtcHRlZCB2Q1BVcwo+Pj4gIAkgKi8KPj4+
ICAJZm9yX2VhY2hfY3B1KGNwdSwgZmx1c2htYXNrKSB7Cj4+PiArCQlpZiAoY3B1ID09IHNtcF9w
cm9jZXNzb3JfaWQoKSkKPj4+ICsJCQljb250aW51ZTsKPj4+ICsKPj4KPj4gRXZlbiB0aGlzIHdv
dWxkIGJlIGp1c3QgYW4gb3B0aW1pemF0aW9uOyB0aGUgdkNQVSB5b3UncmUgcnVubmluZyBvbgo+
PiBjYW5ub3QgYmUgcHJlZW1wdGVkLiAgWW91IGNhbiBqdXN0IGNoYW5nZSBvdGhlcnMgdG8gbXVs
dGkuCj4gCj4gWWVhaCwgSSBrbm93LCBidXQgaXQgZmVsdCB3ZWlyZCBzbyBJIGFkZGVkIHRoZSBl
eHBsaWNpdCBza2lwLiBObyBzdHJvbmcKPiBmZWVsaW5ncyB0aG91Z2guCgpOZWl0aGVyIGhlcmUs
IGFuZCBpdCB3b3VsZCBpbmRlZWQgZGVzZXJ2ZSBhIGNvbW1lbnQgaWYgeW91IGxlZnQgdGhlIGlm
IG91dC4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
