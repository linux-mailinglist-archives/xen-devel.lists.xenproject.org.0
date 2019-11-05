Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31592EF2E8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 02:40:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRnmw-0005Iy-02; Tue, 05 Nov 2019 01:37:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iRnmu-0005It-T9
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 01:37:40 +0000
X-Inumbo-ID: d99d61e8-ff6c-11e9-adbe-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d99d61e8-ff6c-11e9-adbe-bc764e2007e4;
 Tue, 05 Nov 2019 01:37:38 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l24so8764406qtp.10
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2019 17:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W2L5Wt9vAPwi2DADGCrJo4/gpgrXJ/vHj0hp5uT1/6w=;
 b=qw3wPwnJQEPIsA7f/w0mDIf51WQSqHZtNBtHkQ+a6qdpUzMOEXt/OAxm9io3JhbfP6
 vTne7iEDoazWXW5xBbihS1O0cnamLcICRUtMB42yA1LqBFurawpARa+pI/loQ7TZozCS
 muNK+/gOteA/6DrrAtwCv6qzAGFDNLrT4lxpVufIgKeSiYXHaqk5RVXbSWJ1ueKtHuiv
 oOY+F9gg4Xa4vW+/ls61g41NWotER0Buor3x0J0NDaC4S7Hry/ZYzIQIeOoT7pjyK/9n
 KejzKKo5jxtmx28oPc0/OrVyt4Yy1MBj0AZXomNXumyf6TV3OJA/dy91Qa7O4iQ+cyCX
 +Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W2L5Wt9vAPwi2DADGCrJo4/gpgrXJ/vHj0hp5uT1/6w=;
 b=V1xCmpM4arRJ6lFEJIyLGYzeiWozQN7R115ZBQe2zv03F/is7r61+EeBYAI0laucya
 fI/ls91FIw/TtJ/vlIu2y3RSrrv878Deh9bnK1H/kZ4Y3JwOOSD2MHuSB2IymtFqSlIe
 wsHqDTmVktaC5xpTdIlVLgP8JcVe4iLbYFhYPEON9sjg1O7oPirG9Bdtl0YDw7GoAKMg
 5cYEu5UZQicIv2R3+roWR8+CAPjexeWG1PFVbT7/E6p97psP/N19fe2Q9L/YkPFefk7p
 1CELDDixIjFSnz8EY6sHlp+RfBdD9HRy0lxfR1sfE6fdH+Y3GCbYS2NN2rXrToP9dP1a
 JZ4A==
X-Gm-Message-State: APjAAAUELrwYkxvr/BbK5v34eoXXiyon14Zpg2VnftPQA1Ydu4zVTDEG
 clSv+wcrfUAoMlcJckOvz7OGuNVHNxdvix+XZURfEA==
X-Google-Smtp-Source: APXvYqxf5b5k2/XEh51ut95Lrfer14ii/6Y4WgnKt5ObxWvYMWg+IxU5wRUlwhcOOGIDRGfOdEah46THNJk1jv52R/0=
X-Received: by 2002:a0c:a910:: with SMTP id y16mr12413788qva.89.1572917858090; 
 Mon, 04 Nov 2019 17:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-3-david@redhat.com>
In-Reply-To: <20191024120938.11237-3-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 17:37:27 -0800
Message-ID: <CAPcyv4iFJgtcx56g+Le2DccgvoncvVZuaEBRSOyv-=52YNqJug@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH v1 02/10] KVM: x86/mmu: Prepare
 kvm_is_mmio_pfn() for PG_reserved changes
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
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNToxMCBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBSaWdodCBub3csIFpPTkVfREVWSUNFIG1lbW9yeSBpcyBh
bHdheXMgc2V0IFBHX3Jlc2VydmVkLiBXZSB3YW50IHRvCj4gY2hhbmdlIHRoYXQuCj4KPiBLVk0g
aGFzIHRoaXMgd2VpcmQgdXNlIGNhc2UgdGhhdCB5b3UgY2FuIG1hcCBhbnl0aGluZyBmcm9tIC9k
ZXYvbWVtCj4gaW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNo
ZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNo
ZWQuIHBmbl90b19vbmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPiB0aGF0IHdlIGhhdmUgYW4gaW5p
dGlhbGl6ZWQgbWVtbWFwIChhbmQgZG9uJ3QgaGF2ZSBaT05FX0RFVklDRSBtZW1vcnkpLgo+Cj4g
UmV3cml0ZSBrdm1faXNfbW1pb19wZm4oKSB0byBtYWtlIHN1cmUgdGhlIGZ1bmN0aW9uIHByb2R1
Y2VzIHRoZQo+IHNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0aW5nIFpPTkVfREVWSUNFIHBh
Z2VzIFBHX3Jlc2VydmVkLgo+Cj4gQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+Cj4gQ2M6ICJSYWRpbSBLcsSNbcOhxZkiIDxya3JjbWFyQHJlZGhhdC5jb20+Cj4gQ2M6IFNl
YW4gQ2hyaXN0b3BoZXJzb24gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+Cj4gQ2M6
IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+Cj4gQ2M6IFdhbnBlbmcgTGkg
PHdhbnBlbmdsaUB0ZW5jZW50LmNvbT4KPiBDYzogSmltIE1hdHRzb24gPGptYXR0c29uQGdvb2ds
ZS5jb20+Cj4gQ2M6IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPgo+IENjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+Cj4gQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgo+IENjOiAiSC4g
UGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPgo+IENjOiBLYXJpbUFsbGFoIEFobWVkIDxrYXJh
aG1lZEBhbWF6b24uZGU+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+Cj4g
Q2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IC0tLQo+ICBhcmNoL3g4
Ni9rdm0vbW11LmMgfCAyOSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS5jCj4gaW5kZXggMjRjMjNj
NjZiMjI2Li5mMDMwODlhMzM2ZGUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL21tdS5jCj4g
KysrIGIvYXJjaC94ODYva3ZtL21tdS5jCj4gQEAgLTI5NjIsMjAgKzI5NjIsMjUgQEAgc3RhdGlj
IGJvb2wgbW11X25lZWRfd3JpdGVfcHJvdGVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90
IGdmbiwKPgo+ICBzdGF0aWMgYm9vbCBrdm1faXNfbW1pb19wZm4oa3ZtX3Bmbl90IHBmbikKPiAg
ewo+ICsgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fb25saW5lX3BhZ2UocGZuKTsK
PiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogWk9ORV9ERVZJQ0UgcGFnZXMgYXJlIG5ldmVy
IG9ubGluZS4gT25saW5lIHBhZ2VzIHRoYXQgYXJlIHJlc2VydmVkCj4gKyAgICAgICAgKiBlaXRo
ZXIgaW5kaWNhdGUgdGhlIHplcm8gcGFnZSBvciBNTUlPIHBhZ2VzLgo+ICsgICAgICAgICovCj4g
KyAgICAgICBpZiAocGFnZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuICFpc196ZXJvX3Bmbihw
Zm4pICYmIFBhZ2VSZXNlcnZlZChwZm5fdG9fcGFnZShwZm4pKTsKPiArCj4gKyAgICAgICAvKgo+
ICsgICAgICAgICogQW55dGhpbmcgd2l0aCBhIHZhbGlkIChidXQgbm90IG9ubGluZSkgbWVtbWFw
IGNvdWxkIGJlIFpPTkVfREVWSUNFLgo+ICsgICAgICAgICogVHJlYXQgb25seSBVQy9VQy0vV0Mg
cGFnZXMgYXMgTU1JTy4KCllvdSBtaWdodCBjbGFyaWZ5IHRoYXQgWk9ORV9ERVZJQ0UgcGFnZXMg
dGhhdCBiZWxvbmcgdG8gV0IgY2FjaGVhYmxlCnBtZW0gaGF2ZSB0aGUgY29ycmVjdCBtZW10eXBl
IGVzdGFibGlzaGVkIGJ5IGRldm1fbWVtcmVtYXBfcGFnZXMoKS4KCk90aGVyIHRoYW4gdGhhdCwg
ZmVlbCBmcmVlIHRvIGFkZDoKClJldmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
