Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8239F0ADC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 01:06:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8nD-0004qB-7E; Wed, 06 Nov 2019 00:03:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9gKF=Y6=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iS8nB-0004q6-6p
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 00:03:21 +0000
X-Inumbo-ID: d6488c0e-0028-11ea-a1a5-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6488c0e-0028-11ea-a1a5-12813bfff9fa;
 Wed, 06 Nov 2019 00:03:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 16:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="200547335"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2019 16:03:15 -0800
Date: Tue, 5 Nov 2019 16:03:15 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20191106000315.GI23297@linux.intel.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6NDM6MjlQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMzozMCBQTSBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBh
dCAzOjEzIFBNIFNlYW4gQ2hyaXN0b3BoZXJzb24KPiA+IDxzZWFuLmouY2hyaXN0b3BoZXJzb25A
aW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6
MDI6NDBQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgTm92IDUs
IDIwMTkgYXQgMTI6MzEgUE0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdy
b3RlOgo+ID4gPiA+ID4gPiBUaGUgc2NhcmllciBjb2RlIChmb3IgbWUpIGlzIHRyYW5zcGFyZW50
X2h1Z2VwYWdlX2FkanVzdCgpIGFuZAo+ID4gPiA+ID4gPiBrdm1fbW11X3phcF9jb2xsYXBzaWJs
ZV9zcHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPiA+ID4gPiA+IGlu
dGVyYWN0aW9uIGJldHdlZW4gVEhQIGFuZCBfUEFHRV9ERVZNQVAuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhlIHg4NiBLVk0gTU1VIGNvZGUgaXMgb25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUgSSBrbm93
IChzb3JyeSwgYnV0IGl0Cj4gPiA+ID4gPiBoYWQgdG8gYmUgc2FpZCA6LyApLiBMdWNraWx5LCB0
aGlzIHNob3VsZCBiZSBpbmRlcGVuZGVudCBvZiB0aGUKPiA+ID4gPiA+IFBHX3Jlc2VydmVkIHRo
aW5neSBBRkFJS3MuCj4gPiA+ID4KPiA+ID4gPiBCb3RoIHRyYW5zcGFyZW50X2h1Z2VwYWdlX2Fk
anVzdCgpIGFuZCBrdm1fbW11X3phcF9jb2xsYXBzaWJsZV9zcHRlKCkKPiA+ID4gPiBhcmUgaG9u
b3Jpbmcga3ZtX2lzX3Jlc2VydmVkX3BmbigpLCBzbyBhZ2FpbiBJJ20gbWlzc2luZyB3aGVyZSB0
aGUKPiA+ID4gPiBwYWdlIGNvdW50IGdldHMgbWlzbWFuYWdlZCBhbmQgbGVhZHMgdG8gdGhlIHJl
cG9ydGVkIGhhbmcuCj4gPiA+Cj4gPiA+IFdoZW4gbWFwcGluZyBwYWdlcyBpbnRvIHRoZSBndWVz
dCwgS1ZNIGdldHMgdGhlIHBhZ2UgdmlhIGd1cCgpLCB3aGljaAo+ID4gPiBpbmNyZW1lbnRzIHRo
ZSBwYWdlIGNvdW50IGZvciBaT05FX0RFVklDRSBwYWdlcy4gIEJ1dCBLVk0gcHV0cyB0aGUgcGFn
ZQo+ID4gPiB1c2luZyBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oKSwgd2hpY2ggc2tpcHMgcHV0X3Bh
Z2UoKSBpZiBQYWdlUmVzZXJ2ZWQoKQo+ID4gPiBhbmQgc28gbmV2ZXIgcHV0cyBpdHMgcmVmZXJl
bmNlIHRvIFpPTkVfREVWSUNFIHBhZ2VzLgo+ID4KPiA+IE9oLCB5ZWFoLCB0aGF0J3MgYnVzdGVk
Lgo+IAo+IFVnaCwgaXQncyBleHRyYSBidXN0ZWQgYmVjYXVzZSBldmVyeSBvdGhlciBndXAgdXNl
ciBpbiB0aGUga2VybmVsCj4gdHJhY2tzIHRoZSBwYWdlcyByZXN1bHRpbmcgZnJvbSBndXAgYW5k
IHB1dHMgdGhlbSAocHV0X3BhZ2UoKSkgd2hlbgo+IHRoZXkgYXJlIGRvbmUuIEtWTSB3YW50cyB0
byBmb3JnZXQgYWJvdXQgd2hldGhlciBpdCBkaWQgYSBndXAgdG8gZ2V0Cj4gdGhlIHBhZ2UgYW5k
IG9wdGlvbmFsbHkgdHJpZ2dlciBwdXRfcGFnZSgpIGJhc2VkIHB1cmVseSBvbiB0aGUgcGZuLgo+
IE91dHNpZGUgb2YgVkZJTyBkZXZpY2UgYXNzaWdubWVudCB0aGF0IG5lZWRzIHBhZ2VzIHBpbm5l
ZCBmb3IgRE1BLCB3aHkKPiBkb2VzIEtWTSBpdHNlbGYgbmVlZCB0byBwaW4gcGFnZXM/IElmIHBh
Z2VzIGFyZSBwaW5uZWQgb3ZlciBhIHJldHVybgo+IHRvIHVzZXJzcGFjZSB0aGF0IG5lZWRzIHRv
IGJlIGEgRk9MTF9MT05HVEVSTSBndXAuCgpTaG9ydCBhbnN3ZXIsIEtWTSBwaW5zIHRoZSBwYWdl
IHRvIGVuc3VyZSBjb3JyZWN0bmVzcyB3aXRoIHJlc3BlY3QgdG8gdGhlCnByaW1hcnkgTU1VIGlu
dmFsaWRhdGluZyB0aGUgYXNzb2NpYXRlZCBob3N0IHZpcnR1YWwgYWRkcmVzcywgZS5nLiB3aGVu
CnRoZSBwYWdlIGlzIGJlaW5nIG1pZ3JhdGVkIG9yIHVubWFwcGVkIGZyb20gaG9zdCB1c2Vyc3Bh
Y2UuCgpUaGUgbWFpbiB1c2Ugb2YgZ3VwKCkgaXMgdG8gaGFuZGxlIGd1ZXN0IHBhZ2UgZmF1bHRz
IGFuZCBtYXAgcGFnZXMgaW50bwp0aGUgZ3Vlc3QsIGkuZS4gaW50byBLVk0ncyBzZWNvbmRhcnkg
TU1VLiAgS1ZNIHVzZXMgZ3VwKCkgdG8gYm90aCBnZXQgdGhlClBGTiBhbmQgdG8gdGVtcG9yYXJp
bHkgcGluIHRoZSBwYWdlLiAgVGhlIHBpbiBpcyBoZWxkIGp1c3QgbG9uZyBlbm91Z2ggdG8KZ3Vh
cmFudGVlZCB0aGF0IGFueSBpbnZhbGlkYXRpb24gdmlhIHRoZSBtbXVfbm90aWZpZXIgd2lsbCBi
ZSBzdGFsbGVkCnVudGlsIGFmdGVyIEtWTSBmaW5pc2hlcyBpbnN0YWxsaW5nIHRoZSBwYWdlIGlu
dG8gdGhlIHNlY29uZGFyeSBNTVUsIGkuZS4KdGhlIHBpbiBpcyBzaG9ydC10ZXJtIGFuZCBub3Qg
aGVsZCBhY3Jvc3MgYSByZXR1cm4gdG8gdXNlcnNwYWNlIG9yIGVudHJ5CmludG8gdGhlIGd1ZXN0
LiAgV2hlbiBhIHN1YnNlcXVlbnQgbW11X25vdGlmaWVyIGludmFsaWRhdGlvbiBvY2N1cnMsIEtW
TQpwdWxscyB0aGUgUEZOIGZyb20gdGhlIHNlY29uZGFyeSBNTVUgYW5kIHVzZXMgdGhhdCB0byB1
cGRhdGUgYWNjZXNzZWQKYW5kIGRpcnR5IGJpdHMgaW4gdGhlIGhvc3QuCgpUaGVyZSBhcmUgYSBm
ZXcgb3RoZXIgS1ZNIGZsb3dzIHRoYXQgZXZlbnR1YWxseSBjYWxsIGludG8gZ3VwKCksIGJ1dCB0
aG9zZQphcmUgInRyYWRpdGlvbmFsIiBzaG9ydC10ZXJtIHBpbnMgYW5kIHVzZSBwdXRfcGFnZSgp
IGRpcmVjdGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
