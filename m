Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A22B195
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVCDx-0004QL-Ls; Mon, 27 May 2019 09:47:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+4ww=T3=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hVCDv-0004QG-Mo
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:47:19 +0000
X-Inumbo-ID: 69f66cc0-8064-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69f66cc0-8064-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ksp3G9sH2zzACmF2AeSPcK5YcZQtsXat2Vj9aWQQG+U=; b=P48Ta44XCwnjYxzE2Szf95Vt9
 DEITVVm+74m8Bb8Gl3NWJwk4TRSHiqzI4me8sM/R8LN7Si+alfGfxq5Ygp+/unzlAUHOEAMaXGUUk
 HuL4VHeNUavV/GmCXeXB52W+sv/19DgYqb/qYohVl88jHxI3npQnEgYu3MKj6swbywgxOS6yN9Lk2
 ggd42AjgHwC1KtcbR/M+53ID/oVEZrZVSEO+zbA7krglgq0y/Y2vjIIbdMnDHz61fPgKs2Kwz9flF
 pKEVmgKQJoY1Duv4IfUKMWiH98YTo0yL5G35fvQZCvb64DP0UzpuggBmHVFsYvhrFV2pbQAE053Kx
 AIvf7QlvQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVCDo-0006TR-FB; Mon, 27 May 2019 09:47:12 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B475202BF402; Mon, 27 May 2019 11:47:10 +0200 (CEST)
Date: Mon, 27 May 2019 11:47:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190527094710.GU2623@hirez.programming.kicks-ass.net>
References: <20190525082203.6531-1-namit@vmware.com>
 <20190525082203.6531-6-namit@vmware.com>
 <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Stephen Hemminger <sthemmin@microsoft.com>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgMTA6NTQ6NTBBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyNS8wNS8yMDE5IDEwOjIyLCBOYWRhdiBBbWl0IHdyb3RlOgoKPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaAo+ID4gaW5kZXggOTQ2ZjhmMWYxZWZjLi4zYTE1
NmU2M2M1N2QgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90
eXBlcy5oCj4gPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oCj4g
PiBAQCAtMjExLDYgKzIxMSwxMiBAQCBzdHJ1Y3QgcHZfbW11X29wcyB7Cj4gPiAgCXZvaWQgKCpm
bHVzaF90bGJfdXNlcikodm9pZCk7Cj4gPiAgCXZvaWQgKCpmbHVzaF90bGJfa2VybmVsKSh2b2lk
KTsKPiA+ICAJdm9pZCAoKmZsdXNoX3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRyKTsK
PiA+ICsJLyoKPiA+ICsJICogZmx1c2hfdGxiX211bHRpKCkgaXMgdGhlIHByZWZlcnJlZCBpbnRl
cmZhY2UuIFdoZW4gaXQgaXMgdXNlZCwKPiA+ICsJICogZmx1c2hfdGxiX290aGVycygpIHNob3Vs
ZCByZXR1cm4gZmFsc2UuCj4gCj4gVGhpcyBjb21tZW50IGRvZXMgbm90IG1ha2Ugc2Vuc2UuIGZs
dXNoX3RsYl9vdGhlcnMoKSByZXR1cm4gdHlwZSBpcwo+IHZvaWQuCgpJIHN1c3BlY3QgdGhhdCBp
cyBhbiBhcnRpZmFjdCBmcm9tIGJlZm9yZSB0aGUgc3RhdGljX2tleTsgYW4gYXR0ZW1wdCB0bwpt
YWtlIHRoZSBwdiBpbnRlcmZhY2UgbGVzcyBhd2t3YXJkLgoKU29tZXRoaW5nIGxpa2UgdGhlIGJl
bG93IHdvdWxkIHdvcmsgZm9yIEtWTSBJIHN1c3BlY3QsIHRoZSBvdGhlcnMKKEh5cGVyLVYgYW5k
IFhlbiBhcmUgbW9yZSAnaW50ZXJlc3RpbmcnKS4KCi0tLQotLS0gYS9hcmNoL3g4Ni9rZXJuZWwv
a3ZtLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCkBAIC01ODAsNyArNTgwLDcgQEAgc3Rh
dGljIHZvaWQgX19pbml0IGt2bV9hcGZfdHJhcF9pbml0KHZvaQogCiBzdGF0aWMgREVGSU5FX1BF
Ul9DUFUoY3B1bWFza192YXJfdCwgX19wdl90bGJfbWFzayk7CiAKLXN0YXRpYyB2b2lkIGt2bV9m
bHVzaF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAorc3RhdGljIHZv
aWQga3ZtX2ZsdXNoX3RsYl9tdWx0aShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywKIAkJ
CWNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbykKIHsKIAl1OCBzdGF0ZTsKQEAgLTU5
NCw2ICs1OTQsOSBAQCBzdGF0aWMgdm9pZCBrdm1fZmx1c2hfdGxiX290aGVycyhjb25zdCBzCiAJ
ICogcXVldWUgZmx1c2hfb25fZW50ZXIgZm9yIHByZS1lbXB0ZWQgdkNQVXMKIAkgKi8KIAlmb3Jf
ZWFjaF9jcHUoY3B1LCBmbHVzaG1hc2spIHsKKwkJaWYgKGNwdSA9PSBzbXBfcHJvY2Vzc29yX2lk
KCkpCisJCQljb250aW51ZTsKKwogCQlzcmMgPSAmcGVyX2NwdShzdGVhbF90aW1lLCBjcHUpOwog
CQlzdGF0ZSA9IFJFQURfT05DRShzcmMtPnByZWVtcHRlZCk7CiAJCWlmICgoc3RhdGUgJiBLVk1f
VkNQVV9QUkVFTVBURUQpKSB7CkBAIC02MDMsNyArNjA2LDcgQEAgc3RhdGljIHZvaWQga3ZtX2Zs
dXNoX3RsYl9vdGhlcnMoY29uc3QgcwogCQl9CiAJfQogCi0JbmF0aXZlX2ZsdXNoX3RsYl9vdGhl
cnMoZmx1c2htYXNrLCBpbmZvKTsKKwluYXRpdmVfZmx1c2hfdGxiX211bHRpKGZsdXNobWFzaywg
aW5mbyk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fZ3Vlc3RfaW5pdCh2b2lkKQpAQCAt
NjI4LDkgKzYzMSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fZ3Vlc3RfaW5pdCh2b2lkKQog
CWlmIChrdm1fcGFyYV9oYXNfZmVhdHVyZShLVk1fRkVBVFVSRV9QVl9UTEJfRkxVU0gpICYmCiAJ
ICAgICFrdm1fcGFyYV9oYXNfaGludChLVk1fSElOVFNfUkVBTFRJTUUpICYmCiAJICAgIGt2bV9w
YXJhX2hhc19mZWF0dXJlKEtWTV9GRUFUVVJFX1NURUFMX1RJTUUpKSB7Ci0JCXB2X29wcy5tbXUu
Zmx1c2hfdGxiX290aGVycyA9IGt2bV9mbHVzaF90bGJfb3RoZXJzOworCQlwdl9vcHMubW11LmZs
dXNoX3RsYl9tdWx0aSA9IGt2bV9mbHVzaF90bGJfbXVsdGk7CiAJCXB2X29wcy5tbXUudGxiX3Jl
bW92ZV90YWJsZSA9IHRsYl9yZW1vdmVfdGFibGU7Ci0JCXN0YXRpY19rZXlfZGlzYWJsZSgmZmx1
c2hfdGxiX211bHRpX2VuYWJsZWQua2V5KTsKIAl9CiAKIAlpZiAoa3ZtX3BhcmFfaGFzX2ZlYXR1
cmUoS1ZNX0ZFQVRVUkVfUFZfRU9JKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
