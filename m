Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B464F2B212
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 12:24:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVClb-0007U5-Rd; Mon, 27 May 2019 10:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdqI=T3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hVCla-0007TJ-Se
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 10:22:06 +0000
X-Inumbo-ID: 443812c4-8069-11e9-8380-ffe1ba16a71d
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 443812c4-8069-11e9-8380-ffe1ba16a71d;
 Mon, 27 May 2019 10:22:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f8so16403572wrt.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 03:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b21qaBk7xgBLkh/tR0jiPGLO6jWcDKAw7epKgIMYkgI=;
 b=fZgMKd2c8irae7rmSzBJ2ZEApaonsNaoH0l+EyTBY7fpuarm+VdcXr5m/EaLX1JK3p
 +Fyia1zJVbEa7p6iNwz1RYR0BukCaEYps61scfZ5SNOF3/3yJyHvn9uugr7xJ3MDa2p6
 LMnz0aazGGv9qou7sk5tzXlIRNwHibKh5ONw6veaDu/zucSxn8rShQjm5wR45Ra0Ay/R
 zVVuNt8msd2UL0ycNH1uol/w+j5CR6uMBid8evO7GUMGvzBi1Qai6klYBB7Eb1QgKxPH
 vd3VddSDSg/HqMsB7TiUB77qN3AnExrtcN6Yx+tRWNOwCqrvuBO2nYKJRrWjzYxba5kD
 ii5Q==
X-Gm-Message-State: APjAAAWJA8pHSXgky3DHkWLWosEnW+KzDASZB+8dGZJuUN7vz0tGGvOO
 vFmFMKywTXC5pRAf8TLX9srBH0pi4CM=
X-Google-Smtp-Source: APXvYqyHBiTtlTwjGNSoRY9mSrO2K+MXLJKpJDqJEZ9a29tUYpcW0gYHSxIWv7TusW+bveIx9CmIaw==
X-Received: by 2002:adf:db87:: with SMTP id u7mr25167674wri.245.1558952521069; 
 Mon, 27 May 2019 03:22:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c43e:46a8:e962:cee8?
 ([2001:b07:6468:f312:c43e:46a8:e962:cee8])
 by smtp.gmail.com with ESMTPSA id a17sm8328827wrr.80.2019.05.27.03.21.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 03:22:00 -0700 (PDT)
To: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
 <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
 <20190527094710.GU2623@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
Date: Mon, 27 May 2019 12:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527094710.GU2623@hirez.programming.kicks-ass.net>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
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

T24gMjcvMDUvMTkgMTE6NDcsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIFNhdCwgTWF5IDI1
LCAyMDE5IGF0IDEwOjU0OjUwQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI1
LzA1LzIwMTkgMTA6MjIsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gCj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BhcmF2aXJ0X3R5cGVzLmgKPj4+IGluZGV4IDk0NmY4ZjFmMWVmYy4uM2ExNTZlNjNjNTdkIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+Pj4g
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+Pj4gQEAgLTIxMSw2
ICsyMTEsMTIgQEAgc3RydWN0IHB2X21tdV9vcHMgewo+Pj4gIAl2b2lkICgqZmx1c2hfdGxiX3Vz
ZXIpKHZvaWQpOwo+Pj4gIAl2b2lkICgqZmx1c2hfdGxiX2tlcm5lbCkodm9pZCk7Cj4+PiAgCXZv
aWQgKCpmbHVzaF90bGJfb25lX3VzZXIpKHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4+PiArCS8qCj4+
PiArCSAqIGZsdXNoX3RsYl9tdWx0aSgpIGlzIHRoZSBwcmVmZXJyZWQgaW50ZXJmYWNlLiBXaGVu
IGl0IGlzIHVzZWQsCj4+PiArCSAqIGZsdXNoX3RsYl9vdGhlcnMoKSBzaG91bGQgcmV0dXJuIGZh
bHNlLgo+Pgo+PiBUaGlzIGNvbW1lbnQgZG9lcyBub3QgbWFrZSBzZW5zZS4gZmx1c2hfdGxiX290
aGVycygpIHJldHVybiB0eXBlIGlzCj4+IHZvaWQuCj4gCj4gSSBzdXNwZWN0IHRoYXQgaXMgYW4g
YXJ0aWZhY3QgZnJvbSBiZWZvcmUgdGhlIHN0YXRpY19rZXk7IGFuIGF0dGVtcHQgdG8KPiBtYWtl
IHRoZSBwdiBpbnRlcmZhY2UgbGVzcyBhd2t3YXJkLgo+IAo+IFNvbWV0aGluZyBsaWtlIHRoZSBi
ZWxvdyB3b3VsZCB3b3JrIGZvciBLVk0gSSBzdXNwZWN0LCB0aGUgb3RoZXJzCj4gKEh5cGVyLVYg
YW5kIFhlbiBhcmUgbW9yZSAnaW50ZXJlc3RpbmcnKS4KPiAKPiAtLS0KPiAtLS0gYS9hcmNoL3g4
Ni9rZXJuZWwva3ZtLmMKPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPiBAQCAtNTgwLDcg
KzU4MCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fYXBmX3RyYXBfaW5pdCh2b2kKPiAgCj4g
IHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBfX3B2X3RsYl9tYXNrKTsKPiAg
Cj4gLXN0YXRpYyB2b2lkIGt2bV9mbHVzaF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNr
ICpjcHVtYXNrLAo+ICtzdGF0aWMgdm9pZCBrdm1fZmx1c2hfdGxiX211bHRpKGNvbnN0IHN0cnVj
dCBjcHVtYXNrICpjcHVtYXNrLAo+ICAJCQljb25zdCBzdHJ1Y3QgZmx1c2hfdGxiX2luZm8gKmlu
Zm8pCj4gIHsKPiAgCXU4IHN0YXRlOwo+IEBAIC01OTQsNiArNTk0LDkgQEAgc3RhdGljIHZvaWQg
a3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgcwo+ICAJICogcXVldWUgZmx1c2hfb25fZW50ZXIg
Zm9yIHByZS1lbXB0ZWQgdkNQVXMKPiAgCSAqLwo+ICAJZm9yX2VhY2hfY3B1KGNwdSwgZmx1c2ht
YXNrKSB7Cj4gKwkJaWYgKGNwdSA9PSBzbXBfcHJvY2Vzc29yX2lkKCkpCj4gKwkJCWNvbnRpbnVl
Owo+ICsKCkV2ZW4gdGhpcyB3b3VsZCBiZSBqdXN0IGFuIG9wdGltaXphdGlvbjsgdGhlIHZDUFUg
eW91J3JlIHJ1bm5pbmcgb24KY2Fubm90IGJlIHByZWVtcHRlZC4gIFlvdSBjYW4ganVzdCBjaGFu
Z2Ugb3RoZXJzIHRvIG11bHRpLgoKUGFvbG8KCj4gIAkJc3JjID0gJnBlcl9jcHUoc3RlYWxfdGlt
ZSwgY3B1KTsKPiAgCQlzdGF0ZSA9IFJFQURfT05DRShzcmMtPnByZWVtcHRlZCk7Cj4gIAkJaWYg
KChzdGF0ZSAmIEtWTV9WQ1BVX1BSRUVNUFRFRCkpIHsKPiBAQCAtNjAzLDcgKzYwNiw3IEBAIHN0
YXRpYyB2b2lkIGt2bV9mbHVzaF90bGJfb3RoZXJzKGNvbnN0IHMKPiAgCQl9Cj4gIAl9Cj4gIAo+
IC0JbmF0aXZlX2ZsdXNoX3RsYl9vdGhlcnMoZmx1c2htYXNrLCBpbmZvKTsKPiArCW5hdGl2ZV9m
bHVzaF90bGJfbXVsdGkoZmx1c2htYXNrLCBpbmZvKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQg
X19pbml0IGt2bV9ndWVzdF9pbml0KHZvaWQpCj4gQEAgLTYyOCw5ICs2MzEsOCBAQCBzdGF0aWMg
dm9pZCBfX2luaXQga3ZtX2d1ZXN0X2luaXQodm9pZCkKPiAgCWlmIChrdm1fcGFyYV9oYXNfZmVh
dHVyZShLVk1fRkVBVFVSRV9QVl9UTEJfRkxVU0gpICYmCj4gIAkgICAgIWt2bV9wYXJhX2hhc19o
aW50KEtWTV9ISU5UU19SRUFMVElNRSkgJiYKPiAgCSAgICBrdm1fcGFyYV9oYXNfZmVhdHVyZShL
Vk1fRkVBVFVSRV9TVEVBTF9USU1FKSkgewo+IC0JCXB2X29wcy5tbXUuZmx1c2hfdGxiX290aGVy
cyA9IGt2bV9mbHVzaF90bGJfb3RoZXJzOwo+ICsJCXB2X29wcy5tbXUuZmx1c2hfdGxiX211bHRp
ID0ga3ZtX2ZsdXNoX3RsYl9tdWx0aTsKPiAgCQlwdl9vcHMubW11LnRsYl9yZW1vdmVfdGFibGUg
PSB0bGJfcmVtb3ZlX3RhYmxlOwo+IC0JCXN0YXRpY19rZXlfZGlzYWJsZSgmZmx1c2hfdGxiX211
bHRpX2VuYWJsZWQua2V5KTsKPiAgCX0KPiAgCj4gIAlpZiAoa3ZtX3BhcmFfaGFzX2ZlYXR1cmUo
S1ZNX0ZFQVRVUkVfUFZfRU9JKSkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
