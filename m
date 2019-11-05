Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C9EF490
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 05:43:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRqcb-0002qM-RA; Tue, 05 Nov 2019 04:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iRqcZ-0002qH-Vt
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 04:39:12 +0000
X-Inumbo-ID: 341c4fe4-ff86-11e9-9631-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 341c4fe4-ff86-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 04:39:07 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e17so7985960otk.6
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2019 20:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LQ/3CY3Z/pwD7vktjhd0l5Hf+cHLJkYRKb4mMFAX40w=;
 b=yhHHwHpstkv84TevZIhs/Wm18KmjQCTMD7QlgnCZ3d31OxhoY6s6I3rfk8ud7Ml9XW
 NzkBxxxgjNUnDFVFhwgBwUgJux1TVnbKP5vdJwRFwQ+/giMyREG6ohSNQy9TeoSZJP8T
 SPIO/dUqQUV+56+4q+tqGSp5zgkTlc1mY6zJa37wVenBzWpatnn2O1AzlEI006uGn0Ia
 +fAj7hOgp2UmAGxqae4eaNY8IDMTTdkrkZFK6SjUqy87+8sumJ4XhFeiC35vbDkoayxx
 uGfCGRfgl5zfXbcSzaVw9hv/WN8gLBd6EeLAtnBu48QoPLD4qlg6djtdWgKDg7cH2aI4
 CIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LQ/3CY3Z/pwD7vktjhd0l5Hf+cHLJkYRKb4mMFAX40w=;
 b=hn0QBjyPIXHEIGYdkUEQ11HdsIXgvvLiuR184nEfUCKkxwo2Yh8WelAIEsTlYevL9y
 O0jMBhko2l0sjUHqncm83ZbRRDXWelzJHnHt7zIjBBLS+9qxw9Qiw8CSNugmdfK4+fax
 3ZYj6IKmqP6tlvv9wR+7VzxX+kEmUhks8ihHqsBx1XGxtMx9yAE5sHDHyIedNr54elXA
 FNVfnnJFgjcVoaEAIyvNJLN6kHwwVAusA8G3acJX4Aew0T/SnJF5yCu4W9ZBsx56f6VW
 oreOpgh2YAAN9RtKQgWbjsQvZQNx8+bsQyKBgeJsKfx6xtSONy4kaxQ+82ATFpT9x7cs
 +8sA==
X-Gm-Message-State: APjAAAWQ+E1UAHcH4w95DJ615G/deuMPYzITj4bgEJ3M5X44I/kjuifH
 baTaPVkBeIVXMHSGGPqw5QUJIVvR7MdqVZKosN/UCg==
X-Google-Smtp-Source: APXvYqw5MaEjuPSBWubL0ieUUp4Y5rryBa4JzAq8q4R6lrgIw09Afe+NdZFy6gkARWQQx7v95Lg8Rh1zBTQaSC9BU+U=
X-Received: by 2002:a9d:30c8:: with SMTP id r8mr3863066otg.363.1572928747302; 
 Mon, 04 Nov 2019 20:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
In-Reply-To: <20191024120938.11237-4-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 20:38:56 -0800
Message-ID: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn()
 for PG_reserved changes
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Adam Borowski <kilobyte@angband.pl>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNToxMSBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBSaWdodCBub3csIFpPTkVfREVWSUNFIG1lbW9yeSBpcyBh
bHdheXMgc2V0IFBHX3Jlc2VydmVkLiBXZSB3YW50IHRvCj4gY2hhbmdlIHRoYXQuCj4KPiBLVk0g
aGFzIHRoaXMgd2VpcmQgdXNlIGNhc2UgdGhhdCB5b3UgY2FuIG1hcCBhbnl0aGluZyBmcm9tIC9k
ZXYvbWVtCj4gaW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNo
ZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNo
ZWQuIHBmbl90b19vbmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPiB0aGF0IHdlIGhhdmUgYW4gaW5p
dGlhbGl6ZWQgbWVtbWFwIChhbmQgZG9uJ3QgaGF2ZSBaT05FX0RFVklDRSBtZW1vcnkpLgo+Cj4g
UmV3cml0ZSBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbiBw
cm9kdWNlcyB0aGUKPiBzYW1lIHJlc3VsdCBvbmNlIHdlIHN0b3Agc2V0dGluZyBaT05FX0RFVklD
RSBwYWdlcyBQR19yZXNlcnZlZC4KPgo+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPgo+IENjOiAiUmFkaW0gS3LEjW3DocWZIiA8cmtyY21hckByZWRoYXQuY29tPgo+IENj
OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3JnPgo+IENjOiBEYW4gV2lsbGlhbXMgPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogS2FyaW1BbGxhaCBBaG1lZCA8a2FyYWhtZWRA
YW1hem9uLmRlPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRo
YXQuY29tPgo+IC0tLQo+ICB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgMTAgKysrKysrKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gaW5kZXgg
ZTllYjY2NmViNmU4Li45ZDE4Y2M2N2QxMjQgMTAwNjQ0Cj4gLS0tIGEvdmlydC9rdm0va3ZtX21h
aW4uYwo+ICsrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBAQCAtMTUxLDkgKzE1MSwxNSBAQCBf
X3dlYWsgaW50IGt2bV9hcmNoX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlKHN0cnVjdCBr
dm0gKmt2bSwKPgo+ICBib29sIGt2bV9pc19yZXNlcnZlZF9wZm4oa3ZtX3Bmbl90IHBmbikKPiAg
ewo+IC0gICAgICAgaWYgKHBmbl92YWxpZChwZm4pKQo+IC0gICAgICAgICAgICAgICByZXR1cm4g
UGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHBmbikpOwo+ICsgICAgICAgc3RydWN0IHBhZ2UgKnBh
Z2UgPSBwZm5fdG9fb25saW5lX3BhZ2UocGZuKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IFdlIHRyZWF0IGFueSBwYWdlcyB0aGF0IGFyZSBub3Qgb25saW5lIChub3QgbWFuYWdlZCBieSB0
aGUgYnVkZHkpCj4gKyAgICAgICAgKiBhcyByZXNlcnZlZCAtIHRoaXMgaW5jbHVkZXMgWk9ORV9E
RVZJQ0UgcGFnZXMgYW5kIHBhZ2VzIHdpdGhvdXQKPiArICAgICAgICAqIGEgbWVtbWFwIChlLmcu
LCBtYXBwZWQgdmlhIC9kZXYvbWVtKS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHBhZ2Up
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQYWdlUmVzZXJ2ZWQocGFnZSk7Cj4gICAgICAgICBy
ZXR1cm4gdHJ1ZTsKPiAgfQoKU28gYWZ0ZXIgdGhpcyBhbGwgdGhlIHBmbl92YWxpZCgpIHVzYWdl
IGluIGt2bV9tYWluLmMgaXMgcmVwbGFjZWQgd2l0aApwZm5fdG9fb25saW5lX3BhZ2UoKT8gTG9v
a3MgY29ycmVjdCB0byBtZS4KCkhvd2V2ZXIsIEknbSB3b3JyaWVkIHRoYXQga3ZtIGlzIHRha2lu
ZyByZWZlcmVuY2Ugb24gWk9ORV9ERVZJQ0UgcGFnZXMKdGhyb3VnaCBzb21lIG90aGVyIHBhdGgg
cmVzdWx0aW5nIGluIHRoaXM6CgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbnZk
aW1tLzIwMTkwOTE5MTU0NzA4LkdBMjQ2NTBAYW5nYmFuZC5wbC8KCkknbGwgc2VlIGlmIHRoaXMg
cGF0Y2ggc2V0IG1vZHVsYXRlcyBvciBtYWludGFpbnMgdGhhdCBmYWlsdXJlIG1vZGUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
