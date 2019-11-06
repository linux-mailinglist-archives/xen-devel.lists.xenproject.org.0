Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04ECF0AED
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 01:11:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8sS-00058m-1J; Wed, 06 Nov 2019 00:08:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wLks=Y6=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iS8sR-00058h-7e
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 00:08:47 +0000
X-Inumbo-ID: 98c7c876-0029-11ea-b678-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98c7c876-0029-11ea-b678-bc764e2007e4;
 Wed, 06 Nov 2019 00:08:44 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m15so10535309otq.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 16:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBnxU3butVFZM7AnAXfHT8dkMjtUFYfyCvUDW61SXV0=;
 b=e+Di3mlc5nguC0AjBP91KU4QLtXyLv60VHL8bcA2yTFqSx8GzUT3JPnO2SUvw9dJ3e
 x892tG+naCnJ7xx1/XyJqFBd5BAvIkbzvc8Hm+iANPYt1TTQlO54TnNTT2/Vr/wnnHwU
 cWH/uHsxgeOfe757EoaxLRwaf5ARnH5aT0zdOmRUm2qEb9I99F92KkPxOUH4REMi83wk
 kEyAkGq3/W1xKyxTMdH0KRUk/WXIRl4YbdL49pTFBgS4yeLctZvOTpoL9B1muQPVqJmY
 p3ipEL1tac4Bnfpc8lK1KzxSavaLkdb1VqqzcOJA3HvnvhhzQSrRj7AaXeANHjyy47rG
 tLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBnxU3butVFZM7AnAXfHT8dkMjtUFYfyCvUDW61SXV0=;
 b=j/PitPgU1rYuc6bU9aBEPj+VK/exRYsXN+bMkMzxThcxq3/BHHMFUBWgEDFgFc40Rd
 Rx9SpBgNekvbWqAwi9oq4gUWKna0TDV7usQ3D+JZcXulri3iqU0TaCwgVKCmzy00q+U/
 lMeWtR5awThNsa+DPhuBBXossWAEfmta8o7xL+EaNvXCqCgN5PmmQysapy6uDmuCDoNX
 bBC1y2bjKppTsBdxf3+CQZiGKjQc8QzOyjWFjJsbjNr9+F+niGUJAeE9QxOqkVFAzx2+
 PQ3zUWIvvF2A4GdogqX9qRuz+VGg8JBNOg1SjT7CzS4P2qLHWeMOgOIG9zMiXKmAAea6
 mITA==
X-Gm-Message-State: APjAAAWuqT80emVyKxT2WV7ernOWc1HDwId2Gl0bHR4yRQA/82EoecLC
 jGlYCMPeRJ+FqsUvDgmXT4AsgoTQGAgE0TWiBaq6uA==
X-Google-Smtp-Source: APXvYqy6XKydDtiqLti7hhnEPqaloEXe8khYaaQC8o7B44In3kaSUL1URuHERGnTYAOJPrixGMDMzxSCyGGCNLsXEME=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24252119oti.207.1572998924064; 
 Tue, 05 Nov 2019 16:08:44 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
 <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
 <20191106000315.GI23297@linux.intel.com>
In-Reply-To: <20191106000315.GI23297@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 16:08:32 -0800
Message-ID: <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
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
 KVM list <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
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
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCA0OjAzIFBNIFNlYW4gQ2hyaXN0b3BoZXJzb24KPHNlYW4u
ai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMDUsIDIw
MTkgYXQgMDM6NDM6MjlQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVHVlLCBO
b3YgNSwgMjAxOSBhdCAzOjMwIFBNIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAzOjEzIFBNIFNl
YW4gQ2hyaXN0b3BoZXJzb24KPiA+ID4gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6MDI6NDBQ
TSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCBOb3YgNSwgMjAx
OSBhdCAxMjozMSBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gVGhlIHNjYXJpZXIgY29kZSAoZm9yIG1lKSBpcyB0cmFuc3BhcmVudF9o
dWdlcGFnZV9hZGp1c3QoKSBhbmQKPiA+ID4gPiA+ID4gPiBrdm1fbW11X3phcF9jb2xsYXBzaWJs
ZV9zcHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPiA+ID4gPiA+ID4g
aW50ZXJhY3Rpb24gYmV0d2VlbiBUSFAgYW5kIF9QQUdFX0RFVk1BUC4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gVGhlIHg4NiBLVk0gTU1VIGNvZGUgaXMgb25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUg
SSBrbm93IChzb3JyeSwgYnV0IGl0Cj4gPiA+ID4gPiA+IGhhZCB0byBiZSBzYWlkIDovICkuIEx1
Y2tpbHksIHRoaXMgc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIHRoZQo+ID4gPiA+ID4gPiBQR19y
ZXNlcnZlZCB0aGluZ3kgQUZBSUtzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJvdGggdHJhbnNwYXJl
bnRfaHVnZXBhZ2VfYWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3NwdGUoKQo+
ID4gPiA+ID4gYXJlIGhvbm9yaW5nIGt2bV9pc19yZXNlcnZlZF9wZm4oKSwgc28gYWdhaW4gSSdt
IG1pc3Npbmcgd2hlcmUgdGhlCj4gPiA+ID4gPiBwYWdlIGNvdW50IGdldHMgbWlzbWFuYWdlZCBh
bmQgbGVhZHMgdG8gdGhlIHJlcG9ydGVkIGhhbmcuCj4gPiA+ID4KPiA+ID4gPiBXaGVuIG1hcHBp
bmcgcGFnZXMgaW50byB0aGUgZ3Vlc3QsIEtWTSBnZXRzIHRoZSBwYWdlIHZpYSBndXAoKSwgd2hp
Y2gKPiA+ID4gPiBpbmNyZW1lbnRzIHRoZSBwYWdlIGNvdW50IGZvciBaT05FX0RFVklDRSBwYWdl
cy4gIEJ1dCBLVk0gcHV0cyB0aGUgcGFnZQo+ID4gPiA+IHVzaW5nIGt2bV9yZWxlYXNlX3Bmbl9j
bGVhbigpLCB3aGljaCBza2lwcyBwdXRfcGFnZSgpIGlmIFBhZ2VSZXNlcnZlZCgpCj4gPiA+ID4g
YW5kIHNvIG5ldmVyIHB1dHMgaXRzIHJlZmVyZW5jZSB0byBaT05FX0RFVklDRSBwYWdlcy4KPiA+
ID4KPiA+ID4gT2gsIHllYWgsIHRoYXQncyBidXN0ZWQuCj4gPgo+ID4gVWdoLCBpdCdzIGV4dHJh
IGJ1c3RlZCBiZWNhdXNlIGV2ZXJ5IG90aGVyIGd1cCB1c2VyIGluIHRoZSBrZXJuZWwKPiA+IHRy
YWNrcyB0aGUgcGFnZXMgcmVzdWx0aW5nIGZyb20gZ3VwIGFuZCBwdXRzIHRoZW0gKHB1dF9wYWdl
KCkpIHdoZW4KPiA+IHRoZXkgYXJlIGRvbmUuIEtWTSB3YW50cyB0byBmb3JnZXQgYWJvdXQgd2hl
dGhlciBpdCBkaWQgYSBndXAgdG8gZ2V0Cj4gPiB0aGUgcGFnZSBhbmQgb3B0aW9uYWxseSB0cmln
Z2VyIHB1dF9wYWdlKCkgYmFzZWQgcHVyZWx5IG9uIHRoZSBwZm4uCj4gPiBPdXRzaWRlIG9mIFZG
SU8gZGV2aWNlIGFzc2lnbm1lbnQgdGhhdCBuZWVkcyBwYWdlcyBwaW5uZWQgZm9yIERNQSwgd2h5
Cj4gPiBkb2VzIEtWTSBpdHNlbGYgbmVlZCB0byBwaW4gcGFnZXM/IElmIHBhZ2VzIGFyZSBwaW5u
ZWQgb3ZlciBhIHJldHVybgo+ID4gdG8gdXNlcnNwYWNlIHRoYXQgbmVlZHMgdG8gYmUgYSBGT0xM
X0xPTkdURVJNIGd1cC4KPgo+IFNob3J0IGFuc3dlciwgS1ZNIHBpbnMgdGhlIHBhZ2UgdG8gZW5z
dXJlIGNvcnJlY3RuZXNzIHdpdGggcmVzcGVjdCB0byB0aGUKPiBwcmltYXJ5IE1NVSBpbnZhbGlk
YXRpbmcgdGhlIGFzc29jaWF0ZWQgaG9zdCB2aXJ0dWFsIGFkZHJlc3MsIGUuZy4gd2hlbgo+IHRo
ZSBwYWdlIGlzIGJlaW5nIG1pZ3JhdGVkIG9yIHVubWFwcGVkIGZyb20gaG9zdCB1c2Vyc3BhY2Uu
Cj4KPiBUaGUgbWFpbiB1c2Ugb2YgZ3VwKCkgaXMgdG8gaGFuZGxlIGd1ZXN0IHBhZ2UgZmF1bHRz
IGFuZCBtYXAgcGFnZXMgaW50bwo+IHRoZSBndWVzdCwgaS5lLiBpbnRvIEtWTSdzIHNlY29uZGFy
eSBNTVUuICBLVk0gdXNlcyBndXAoKSB0byBib3RoIGdldCB0aGUKPiBQRk4gYW5kIHRvIHRlbXBv
cmFyaWx5IHBpbiB0aGUgcGFnZS4gIFRoZSBwaW4gaXMgaGVsZCBqdXN0IGxvbmcgZW5vdWdoIHRv
Cj4gZ3VhcmFudGVlZCB0aGF0IGFueSBpbnZhbGlkYXRpb24gdmlhIHRoZSBtbXVfbm90aWZpZXIg
d2lsbCBiZSBzdGFsbGVkCj4gdW50aWwgYWZ0ZXIgS1ZNIGZpbmlzaGVzIGluc3RhbGxpbmcgdGhl
IHBhZ2UgaW50byB0aGUgc2Vjb25kYXJ5IE1NVSwgaS5lLgo+IHRoZSBwaW4gaXMgc2hvcnQtdGVy
bSBhbmQgbm90IGhlbGQgYWNyb3NzIGEgcmV0dXJuIHRvIHVzZXJzcGFjZSBvciBlbnRyeQo+IGlu
dG8gdGhlIGd1ZXN0LiAgV2hlbiBhIHN1YnNlcXVlbnQgbW11X25vdGlmaWVyIGludmFsaWRhdGlv
biBvY2N1cnMsIEtWTQo+IHB1bGxzIHRoZSBQRk4gZnJvbSB0aGUgc2Vjb25kYXJ5IE1NVSBhbmQg
dXNlcyB0aGF0IHRvIHVwZGF0ZSBhY2Nlc3NlZAo+IGFuZCBkaXJ0eSBiaXRzIGluIHRoZSBob3N0
Lgo+Cj4gVGhlcmUgYXJlIGEgZmV3IG90aGVyIEtWTSBmbG93cyB0aGF0IGV2ZW50dWFsbHkgY2Fs
bCBpbnRvIGd1cCgpLCBidXQgdGhvc2UKPiBhcmUgInRyYWRpdGlvbmFsIiBzaG9ydC10ZXJtIHBp
bnMgYW5kIHVzZSBwdXRfcGFnZSgpIGRpcmVjdGx5LgoKT2ssIEkgd2FzIG1pc2ludGVycHJldGlu
ZyB0aGUgZWZmZWN0IG9mIHRoZSBidWcgd2l0aCB3aGF0IEtWTSBpcyB1c2luZwp0aGUgcmVmZXJl
bmNlIHRvIGRvLgoKVG8geW91ciBvdGhlciBwb2ludDoKCj4gQnV0IERhdmlkJ3MgcHJvcG9zZWQg
Zml4IGZvciB0aGUgYWJvdmUgcmVmY291bnQgYnVnIGlzIHRvIG9taXQgdGhlIHBhdGNoCj4gc28g
dGhhdCBLVk0gbm8gbG9uZ2VyIHRyZWF0cyBaT05FX0RFVklDRSBwYWdlcyBhcyByZXNlcnZlZC4g
IFRoYXQgc2VlbXMKPiBsaWtlIHRoZSByaWdodCB0aGluZyB0byBkbywgaW5jbHVkaW5nIGZvciB0
aHBfYWRqdXN0KCksIGUuZy4gaXQgd291bGQKPiBuYXR1cmFsbHkgbGV0IEtWTSB1c2UgMm1iIHBh
Z2VzIGZvciB0aGUgZ3Vlc3Qgd2hlbiBhIFpPTkVfREVWSUNFIHBhZ2UgaXMKPiBtYXBwZWQgd2l0
aCBhIGh1Z2UgcGFnZSAoMm1iIG9yIGFib3ZlKSBpbiB0aGUgaG9zdC4gIFRoZSBvbmx5IGhpY2N1
cCBpcwo+IGZpZ3VyaW5nIG91dCBob3cgdG8gY29ycmVjdGx5IHRyYW5zZmVyIHRoZSByZWZlcmVu
Y2UuCgpUaGF0IG1pZ2h0IG5vdCBiZSB0aGUgb25seSBoaWNjdXAuIFRoZXJlJ3MgY3VycmVudGx5
IG5vIHN1Y2ggdGhpbmcgYXMKaHVnZSBwYWdlcyBmb3IgWk9ORV9ERVZJQ0UsIHRoZXJlIGFyZSBo
dWdlICptYXBwaW5ncyogKHBtZCBhbmQgcHVkKSwKYnV0IHRoZSByZXN1bHQgb2YgcGZuX3RvX3Bh
Z2UoKSBvbiBzdWNoIGEgbWFwcGluZyBkb2VzIG5vdCB5aWVsZCBhCmh1Z2UgJ3N0cnVjdCBwYWdl
Jy4gSXQgc2VlbXMgdGhlcmUgYXJlIG90aGVyIHBhdGhzIGluIEtWTSB0aGF0IGFzc3VtZQp0aGF0
IG1vcmUgdHlwaWNhbCBwYWdlIG1hY2hpbmVyeSBpcyBhY3RpdmUgbGlrZSBTZXRQYWdlRGlydHko
KSBiYXNlZApvbiBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkuIFdoaWxlIEkgdG9sZCBEYXZpZCB0aGF0
IEkgZGlkIG5vdCB3YW50IHRvCnNlZSBtb3JlIHVzYWdlIG9mIGlzX3pvbmVfZGV2aWNlX3BhZ2Uo
KSwgdGhpcyBwYXRjaCBiZWxvdyAodW50ZXN0ZWQpCnNlZW1zIGEgY2xlYW5lciBwYXRoIHdpdGgg
bGVzcyBzdXJwcmlzZXM6CgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKaW5kZXggNGRmMGFhNmI4ZTVjLi5mYmVhMTdjMTgxMGMgMTAwNjQ0Ci0t
LSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMTgz
MSw3ICsxODMxLDggQEAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbik7
Cgogdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oa3ZtX3Bmbl90IHBmbikKIHsKLSAgICAgICBp
ZiAoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3ZtX2lzX3Jlc2VydmVkX3BmbihwZm4p
KQorICAgICAgIGlmICgoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3ZtX2lzX3Jlc2Vy
dmVkX3BmbihwZm4pKSB8fAorICAgICAgICAgICAocGZuX3ZhbGlkKHBmbikgJiYgaXNfem9uZV9k
ZXZpY2VfcGFnZShwZm5fdG9fcGFnZShwZm4pKSkpCiAgICAgICAgICAgICAgICBwdXRfcGFnZShw
Zm5fdG9fcGFnZShwZm4pKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9yZWxlYXNlX3Bmbl9j
bGVhbik7CgpUaGlzIGlzIHNhZmUgYmVjYXVzZSB0aGUgcmVmZXJlbmNlIHRoYXQgS1ZNIHRvb2sg
ZWFybGllciBwcm90ZWN0cyB0aGUKaXNfem9uZV9kZXZpY2VfcGFnZSgpIGxvb2t1cCBmcm9tIHJh
Y2luZyBkZXZpY2UgdGVhcmRvd24uIE90aGVyd2lzZSwKaWYgS1ZNIGRvZXMgbm90IGhhdmUgYSBy
ZWZlcmVuY2UgaXQncyB1bnNhZmUsIGJ1dCB0aGF0J3MgYWxyZWFkeSBldmVuCm1vcmUgYnJva2Vu
IGJlY2F1c2UgS1ZNIHdvdWxkIGJlIHJlbGVhc2luZyBhIHBhZ2UgdGhhdCBpdCBuZXZlcgpyZWZl
cmVuY2VkLiBFdmVyeSBvdGhlciBLVk0gb3BlcmF0aW9uIHRoYXQgYXNzdW1lcyBwYWdlIGFsbG9j
YXRvcgpwYWdlcyB3b3VsZCBjb250aW51ZSB0byBob25vciBrdm1faXNfcmVzZXJ2ZWRfcGZuKCku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
