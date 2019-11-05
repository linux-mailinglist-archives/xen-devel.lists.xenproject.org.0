Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B2F0A60
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:46:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8UC-0002GM-Ug; Tue, 05 Nov 2019 23:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iS8UC-0002GF-95
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:43:44 +0000
X-Inumbo-ID: 189544c4-0026-11ea-9631-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 189544c4-0026-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 23:43:41 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m15so10491247otq.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 15:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqF5WeWUkV8OSvmMn1NqVj3O1bVUGhAU7UxRwoOyQkQ=;
 b=R8Alj67iPtwWeE3roElZW+pYOh4ky6ik6lq6w2YDqxXxftHuL4xvlbGp/AuCb0KSF4
 fF4h2qKN/xAR7aB4QOjGG/Km9vamjGEGd5EWQf2UCkUQ7094fLn60YrhxpB59rWSuuj7
 7nYcFIzc4zA9efWctufgYQhIDnEfkoqphQsH8BEqo2jLW6Hzf3tWn5AOfjrJFaUwi37b
 mD+ZMfV0bhs0NXJ88Ult28HQhN/DXV2PO1Ue8zzlYMbfoUo9D38/0PdeApkFIZBhNMdh
 OAPGecXpyJFc4c5KNcOLo/Tij1p7AqQxiKKMhOsGDsUROf+iLWTtTImhk4GgDWDE2fAg
 1QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqF5WeWUkV8OSvmMn1NqVj3O1bVUGhAU7UxRwoOyQkQ=;
 b=UYmTvkd6E3WYfCgh9zv+W4xUhUeBp/viAUMgnEqWaA8tjk2FxSjsG/Do1CywdRSA89
 MHrcIvvi4fYCfUEq/aVoVerpZ52xDeG2O45B6q0UWuijhva0TFD6jZSc3V+NaOnHBaTf
 LzhXa6wdl/rDpqcr4RoCzuPrDv/bAeFuSahZipFtQDHtmV9OGiUVDp8l8mN04D/uMUC+
 wamLUgwEY21cvjuBgxwcb5PoLx5HHgM3GFqUGOYY3tzUtOzj1ZK+bTmP17j3kzeXtf1V
 P52cYvQNnVfjJEExRf1fd2vyea54Q0zkt4G/ru2sE3cSeCZ5xd+JcZJBTSkc95VsuRF2
 T3Lw==
X-Gm-Message-State: APjAAAVNvJR8VmlyM4Vl5eKfoTPkAp/6UMV9Q3f1wHSrluNWDs90P0KE
 rIpJDYZYtjoynBm5+If3N5squaObW3GXFKDau3JZog==
X-Google-Smtp-Source: APXvYqyIc0AZHvfDAJRxs8BSUdGdJvbmvdIf2oP2r6ZSIdEGqlYbdICndzlbJrs4CN9R6UBYQWP9X3frciT2ip5IH08=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24190398oti.207.1572997420669; 
 Tue, 05 Nov 2019 15:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
In-Reply-To: <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:43:29 -0800
Message-ID: <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
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

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAzOjMwIFBNIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlh
bXNAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMzoxMyBQTSBT
ZWFuIENocmlzdG9waGVyc29uCj4gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdy
b3RlOgo+ID4KPiA+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDAzOjAyOjQwUE0gLTA4MDAsIERh
biBXaWxsaWFtcyB3cm90ZToKPiA+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMjozMSBQTSBE
YXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBUaGUg
c2NhcmllciBjb2RlIChmb3IgbWUpIGlzIHRyYW5zcGFyZW50X2h1Z2VwYWdlX2FkanVzdCgpIGFu
ZAo+ID4gPiA+ID4ga3ZtX21tdV96YXBfY29sbGFwc2libGVfc3B0ZSgpLCBhcyBJIGRvbid0IGF0
IGFsbCB1bmRlcnN0YW5kIHRoZQo+ID4gPiA+ID4gaW50ZXJhY3Rpb24gYmV0d2VlbiBUSFAgYW5k
IF9QQUdFX0RFVk1BUC4KPiA+ID4gPgo+ID4gPiA+IFRoZSB4ODYgS1ZNIE1NVSBjb2RlIGlzIG9u
ZSBvZiB0aGUgdWdsaWVzdCBjb2RlIEkga25vdyAoc29ycnksIGJ1dCBpdAo+ID4gPiA+IGhhZCB0
byBiZSBzYWlkIDovICkuIEx1Y2tpbHksIHRoaXMgc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIHRo
ZQo+ID4gPiA+IFBHX3Jlc2VydmVkIHRoaW5neSBBRkFJS3MuCj4gPiA+Cj4gPiA+IEJvdGggdHJh
bnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3Nw
dGUoKQo+ID4gPiBhcmUgaG9ub3Jpbmcga3ZtX2lzX3Jlc2VydmVkX3BmbigpLCBzbyBhZ2FpbiBJ
J20gbWlzc2luZyB3aGVyZSB0aGUKPiA+ID4gcGFnZSBjb3VudCBnZXRzIG1pc21hbmFnZWQgYW5k
IGxlYWRzIHRvIHRoZSByZXBvcnRlZCBoYW5nLgo+ID4KPiA+IFdoZW4gbWFwcGluZyBwYWdlcyBp
bnRvIHRoZSBndWVzdCwgS1ZNIGdldHMgdGhlIHBhZ2UgdmlhIGd1cCgpLCB3aGljaAo+ID4gaW5j
cmVtZW50cyB0aGUgcGFnZSBjb3VudCBmb3IgWk9ORV9ERVZJQ0UgcGFnZXMuICBCdXQgS1ZNIHB1
dHMgdGhlIHBhZ2UKPiA+IHVzaW5nIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpLCB3aGljaCBza2lw
cyBwdXRfcGFnZSgpIGlmIFBhZ2VSZXNlcnZlZCgpCj4gPiBhbmQgc28gbmV2ZXIgcHV0cyBpdHMg
cmVmZXJlbmNlIHRvIFpPTkVfREVWSUNFIHBhZ2VzLgo+Cj4gT2gsIHllYWgsIHRoYXQncyBidXN0
ZWQuCgpVZ2gsIGl0J3MgZXh0cmEgYnVzdGVkIGJlY2F1c2UgZXZlcnkgb3RoZXIgZ3VwIHVzZXIg
aW4gdGhlIGtlcm5lbAp0cmFja3MgdGhlIHBhZ2VzIHJlc3VsdGluZyBmcm9tIGd1cCBhbmQgcHV0
cyB0aGVtIChwdXRfcGFnZSgpKSB3aGVuCnRoZXkgYXJlIGRvbmUuIEtWTSB3YW50cyB0byBmb3Jn
ZXQgYWJvdXQgd2hldGhlciBpdCBkaWQgYSBndXAgdG8gZ2V0CnRoZSBwYWdlIGFuZCBvcHRpb25h
bGx5IHRyaWdnZXIgcHV0X3BhZ2UoKSBiYXNlZCBwdXJlbHkgb24gdGhlIHBmbi4KT3V0c2lkZSBv
ZiBWRklPIGRldmljZSBhc3NpZ25tZW50IHRoYXQgbmVlZHMgcGFnZXMgcGlubmVkIGZvciBETUEs
IHdoeQpkb2VzIEtWTSBpdHNlbGYgbmVlZCB0byBwaW4gcGFnZXM/IElmIHBhZ2VzIGFyZSBwaW5u
ZWQgb3ZlciBhIHJldHVybgp0byB1c2Vyc3BhY2UgdGhhdCBuZWVkcyB0byBiZSBhIEZPTExfTE9O
R1RFUk0gZ3VwLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
