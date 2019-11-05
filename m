Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E742FF0942
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 23:24:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS7DG-0003MK-WF; Tue, 05 Nov 2019 22:22:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YgOY=Y5=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iS7DF-0003MF-QH
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 22:22:09 +0000
X-Inumbo-ID: b3de9752-001a-11ea-a1a5-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3de9752-001a-11ea-a1a5-12813bfff9fa;
 Tue, 05 Nov 2019 22:22:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 14:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="376846147"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga005.jf.intel.com with ESMTP; 05 Nov 2019 14:22:05 -0800
Date: Tue, 5 Nov 2019 14:22:05 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20191105222205.GA23297@linux.intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
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
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 Dan Williams <dan.j.williams@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Adam Borowski <kilobyte@angband.pl>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDk6MzA6NTNQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gPj4+SSB0aGluayBJIGtub3cgd2hhdCdzIGdvaW5nIHdyb25nOgo+ID4+Pgo+
ID4+PlBhZ2VzIHRoYXQgYXJlIHBpbm5lZCB2aWEgZ2ZuX3RvX3BmbigpIGFuZCBmcmllbmRzIHRh
a2UgYSByZWZlcmVuY2VzLAo+ID4+Pmhvd2V2ZXIgYXJlIG9mdGVuIHJlbGVhc2VkIHZpYQo+ID4+
Pmt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpL2t2bV9yZWxlYXNlX3Bmbl9kaXJ0eSgpL2t2bV9yZWxl
YXNlX3BhZ2VfY2xlYW4oKS4uLgo+ID4+Pgo+ID4+Pgo+ID4+PkUuZy4sIGluIGFyY2gveDg2L2t2
bS94ODYuYzpyZWV4ZWN1dGVfaW5zdHJ1Y3Rpb24oKQo+ID4+Pgo+ID4+Pi4uLgo+ID4+PnBmbiA9
IGdmbl90b19wZm4odmNwdS0+a3ZtLCBncGFfdG9fZ2ZuKGdwYSkpOwo+ID4+Pi4uLgo+ID4+Pmt2
bV9yZWxlYXNlX3Bmbl9jbGVhbihwZm4pOwo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PnZvaWQga3Zt
X3JlbGVhc2VfcGZuX2NsZWFuKGt2bV9wZm5fdCBwZm4pCj4gPj4+ewo+ID4+PglpZiAoIWlzX2Vy
cm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3ZtX2lzX3Jlc2VydmVkX3BmbihwZm4pKQo+ID4+PgkJ
cHV0X3BhZ2UocGZuX3RvX3BhZ2UocGZuKSk7Cj4gPj4+fQo+ID4+Pgo+ID4+PlRoaXMgZnVuY3Rp
b24gbWFrZXMgcGVyZmVjdCBzZW5zZSBhcyB0aGUgY291bnRlcnBhcnQgZm9yIGt2bV9nZXRfcGZu
KCk6Cj4gPj4+Cj4gPj4+dm9pZCBrdm1fZ2V0X3Bmbihrdm1fcGZuX3QgcGZuKQo+ID4+PnsKPiA+
Pj4JaWYgKCFrdm1faXNfcmVzZXJ2ZWRfcGZuKHBmbikpCj4gPj4+CQlnZXRfcGFnZShwZm5fdG9f
cGFnZShwZm4pKTsKPiA+Pj59Cj4gPj4+Cj4gPj4+Cj4gPj4+QXMgYWxsIFpPTkVfREVWSUNFIHBh
Z2VzIGFyZSBjdXJyZW50bHkgcmVzZXJ2ZWQsIHBhZ2VzIHBpbm5lZCB2aWEKPiA+Pj5nZm5fdG9f
cGZuKCkgYW5kIGZyaWVuZHMgd2lsbCBvZnRlbiBub3Qgc2VlIGEgcHV0X3BhZ2UoKSBBRkFJS1Mu
Cj4gPgo+ID5Bc3N1bWluZyBndXAoKSB0YWtlcyBhIHJlZmVyZW5jZSBmb3IgWk9ORV9ERVZJQ0Ug
cGFnZXMsIHllcywgdGhpcyBpcyBhCj4gPktWTSBidWcuCj4gCj4gWWVzLCBpdCBkb2VzIHRha2Ug
YSByZWZlcmVuY2UgQUZBSUtzLiBFLmcuLAo+IAo+IG1tL2d1cC5jOmd1cF9wdGVfcmFuZ2UoKToK
PiAuLi4KPiAJCWlmIChwdGVfZGV2bWFwKHB0ZSkpIHsKPiAJCQlpZiAodW5saWtlbHkoZmxhZ3Mg
JiBGT0xMX0xPTkdURVJNKSkKPiAJCQkJZ290byBwdGVfdW5tYXA7Cj4gCj4gCQkJcGdtYXAgPSBn
ZXRfZGV2X3BhZ2VtYXAocHRlX3BmbihwdGUpLCBwZ21hcCk7Cj4gCQkJaWYgKHVubGlrZWx5KCFw
Z21hcCkpIHsKPiAJCQkJdW5kb19kZXZfcGFnZW1hcChuciwgbnJfc3RhcnQsIHBhZ2VzKTsKPiAJ
CQkJZ290byBwdGVfdW5tYXA7Cj4gCQkJfQo+IAkJfSBlbHNlIGlmIChwdGVfc3BlY2lhbChwdGUp
KQo+IAkJCWdvdG8gcHRlX3VubWFwOwo+IAo+IAkJVk1fQlVHX09OKCFwZm5fdmFsaWQocHRlX3Bm
bihwdGUpKSk7Cj4gCQlwYWdlID0gcHRlX3BhZ2UocHRlKTsKPiAKPiAJCWhlYWQgPSB0cnlfZ2V0
X2NvbXBvdW5kX2hlYWQocGFnZSwgMSk7Cj4gCj4gdHJ5X2dldF9jb21wb3VuZF9oZWFkKCkgd2ls
bCBpbmNyZW1lbnQgdGhlIHJlZmVyZW5jZSBjb3VudC4KCkRvaCwgSSBsb29rZWQgcmlnaHQgYXQg
dGhhdCBjb2RlIGFuZCBzb21laG93IGRpZG4ndCBjb25uZWN0IHRoZSBkb3RzLgpUaGFua3MhCgo+
ID4+Pk5vdywgbXkgcGF0Y2ggZG9lcyBub3QgY2hhbmdlIHRoYXQsIHRoZSByZXN1bHQgb2YKPiA+
Pj5rdm1faXNfcmVzZXJ2ZWRfcGZuKHBmbikgd2lsbCBiZSB1bmNoYW5nZWQuIEEgcHJvcGVyIGZp
eCBmb3IgdGhhdCB3b3VsZAo+ID4+PnByb2JhYmx5IGJlCj4gPj4+Cj4gPj4+YSkgVG8gZHJvcCB0
aGUgcmVmZXJlbmNlIHRvIFpPTkVfREVWSUNFIHBhZ2VzIGluIGdmbl90b19wZm4oKSBhbmQKPiA+
Pj5mcmllbmRzLCBhZnRlciB5b3Ugc3VjY2Vzc2Z1bGx5IHBpbm5lZCB0aGUgcGFnZXMuIChub3Qg
c3VyZSBpZiB0aGF0J3MKPiA+Pj50aGUgcmlnaHQgdGhpbmcgdG8gZG8gYnV0IHlvdSdyZSB0aGUg
ZXhwZXJ0KQo+ID4+Pgo+ID4+PmIpIFRvIG5vdCB1c2Uga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKCkg
YW5kIGZyaWVuZHMgb24gcGFnZXMgdGhhdCB3ZXJlCj4gPj4+ZGVmaW5pdGVseSBwaW5uZWQuCj4g
Pgo+ID5UaGlzIGlzIGFscmVhZHkgS1ZNJ3MgaW50ZW50LCBpLmUuIHRoZSBwdXJwb3NlIG9mIHRo
ZSBQYWdlUmVzZXJ2ZWQoKSBjaGVjawo+ID5pcyBzaW1wbHkgdG8gYXZvaWQgcHV0dGluZyBhIG5v
bi1leGlzdGVudCByZWZlcmVuY2UuICBUaGUgcHJvYmxlbSBpcyB0aGF0Cj4gPktWTSBhc3N1bWVz
IHBhZ2VzIHdpdGggUEdfcmVzZXJ2ZWQgc2V0IGFyZSBuZXZlciBwaW5uZWQsIHdoaWNoIEFGQUlD
VCB3YXMKPiA+dHJ1ZSB3aGVuIHRoZSBjb2RlIHdhcyBmaXJzdCBhZGRlZC4KPiA+Cj4gPj4odGFs
a2luZyB0byBteXNlbGYsIHNvcnJ5KQo+ID4+Cj4gPj5UaGlua2luZyBhZ2FpbiwgZHJvcHBpbmcg
dGhpcyBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzIGNvdWxkIGVmZmVjdGl2ZWx5IGFsc28KPiA+PmZp
eCB0aGF0IGlzc3VlLiBFLmcuLCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oKSBhbmQgZnJpZW5kcyB3
b3VsZCBhbHdheXMgZG8gYQo+ID4+cHV0X3BhZ2UoKSBpZiAicGZuX3ZhbGlkKCkgYW5kICFQYWdl
UmVzZXJ2ZWQoKSIsIHNvIGFmdGVyIHBhdGNoIDkgYWxzbyBvbgo+ID4+Wk9OREVfREVWSUNFIHBh
Z2VzLgo+ID4KPiA+WWVhaCwgdGhpcyBhcHBlYXJzIHRvIGJlIHRoZSBjb3JyZWN0IGZpeC4KPiA+
Cj4gPj5CdXQgaXQgd291bGQgaGF2ZSBzaWRlIGVmZmVjdHMgdGhhdCBtaWdodCBub3QgYmUgZGVz
aXJlZC4gRS5nLiw6Cj4gPj4KPiA+PjEuIGt2bV9wZm5fdG9fcGFnZSgpIHdvdWxkIGFsc28gcmV0
dXJuIFpPTkVfREVWSUNFIHBhZ2VzIChtaWdodCBldmVuIGJlIHRoZQo+ID4+cmlnaHQgdGhpbmcg
dG8gZG8pLgo+ID4KPiA+VGhpcyBzaG91bGQgYmUgb2ssIGF0IGxlYXN0IG9uIHg4Ni4gIFRoZXJl
IGFyZSBvbmx5IHRocmVlIHVzZXJzIG9mCj4gPmt2bV9wZm5fdG9fcGFnZSgpLiAgVHdvIG9mIHRo
b3NlIGFyZSBvbiBhbGxvY2F0aW9ucyB0aGF0IGFyZSBjb250cm9sbGVkIGJ5Cj4gPktWTSBhbmQg
YXJlIGd1YXJhbnRlZWQgdG8gYmUgdmFuaWxsYSBNQVBfQU5PTllNT1VTLiAgVGhlIHRoaXJkIGlz
IG9uIGd1ZXN0Cj4gPm1lbW9yeSB3aGVuIHJ1bm5pbmcgYSBuZXN0ZWQgZ3Vlc3QsIGFuZCBpbiB0
aGF0IGNhc2Ugc3VwcG9ydGluZyBaT05FX0RFVklDRQo+ID5tZW1vcnkgaXMgZGVzaXJhYmxlLCBp
LmUuIEtWTSBzaG91bGQgcGxheSBuaWNlIHdpdGggYSBndWVzdCB0aGF0IGlzIGJhY2tlZAo+ID5i
eSBaT05FX0RFVklDRSBtZW1vcnkuCj4gPgo+ID4+Mi4ga3ZtX3NldF9wZm5fZGlydHkoKSB3b3Vs
ZCBhbHNvIHNldCBaT05FX0RFVklDRSBwYWdlcyBkaXJ0eSAobWlnaHQgYmUKPiA+Pm9rYXkpCj4g
Pgo+ID5UaGlzIGlzIG9rIGZyb20gYSBLVk0gcGVyc3BlY3RpdmUuCj4gCj4gV2hhdCBhYm91dAo+
IAo+IHZvaWQga3ZtX2dldF9wZm4oa3ZtX3Bmbl90IHBmbikKPiB7Cj4gCWlmICgha3ZtX2lzX3Jl
c2VydmVkX3BmbihwZm4pKQo+IAkJZ2V0X3BhZ2UocGZuX3RvX3BhZ2UocGZuKSk7Cj4gfQo+IAo+
IElzIGEgcHVyZSBnZXRfcGFnZSgpIHN1ZmZpY2llbnQgaW4gY2FzZSBvZiBaT05FX0RFVklDRT8K
PiAoYXNraW5nIGJlY2F1c2Ugb2YgdGhlIGxpdmUgcmVmZXJlbmNlcyBvYnRhaW5lZCB2aWEKPiBn
ZXRfZGV2X3BhZ2VtYXAocHRlX3BmbihwdGUpLCBwZ21hcCkgaW4gbW0vZ3VwLmM6Z3VwX3B0ZV9y
YW5nZSgpIHNvbWV3aGF0Cj4gY29uZnVzZSBtZSA6KSApCgpUaGlzIHRpZXMgaW50byBteSBjb25j
ZXJuIHdpdGggdGhwX2FkanVzdCgpLiAgT24geDg2LCBrdm1fZ2V0X3BmbigpIGlzCm9ubHkgdXNl
ZCBpbiB0d28gZmxvd3MsIHRvIG1hbnVhbGx5IGdldCBhIHJlZiBmb3IgVk1fSU8vVk1fUEZOTUFQ
IHBhZ2VzCmFuZCB0byBzd2l0Y2ggdGhlIHJlZiB3aGVuIG1hcHBpbmcgYSBub24taHVnZXRsYmZz
IGNvbXBvdW5kIHBhZ2UsIGkuZS4gYQpUSFAuCgpJIGFzc3VtZSBWTV9JTyBhbmQgUEZOTUFQIGNh
bid0IGFwcGx5IHRvIFpPTkVfREVWSUNFIHBhZ2VzLgoKSW4gdGhlIHRocF9hZGp1c3QoKSBjYXNl
LCB3aGVuIGEgVEhQIGlzIGVuY291bnRlcmVkIGFuZCB0aGUgb3JpZ2luYWwgUEZOCmlzIGZvciBh
IG5vbi1QR19oZWFkIHBhZ2UsIEtWTSB0cmFuc2ZlcnMgdGhlIHJlZmVyZW5jZSB0byB0aGUgYXNz
b2NpYXRlZApQR19oZWFkIHBhZ2VbKl0gYW5kIG1hcHMgdGhlIGFzc29jaWF0ZWQgMm1iIGNodW5r
L3BhZ2UuICBUaGlzIGlzIHdoZXJlIEtWTQp1c2VzIGt2bV9nZXRfcGZuKCkgYW5kIGNvdWxkIHJ1
biBhZm91bCBvZiB0aGUgZ2V0X2Rldl9wYWdlbWFwKCkgcmVmY291bnRzLgoKClsqXSBUZWNobmlj
YWxseSBJIGRvbid0IHRoaW5rIGl0J3MgZ3VhcmFudGVlZCB0byBiZSBhIFBHX2hlYWQsIGUuZy4g
aWYgdGhlCiAgICBUSFAgaXMgYSAxZ2IgcGFnZSwgYXMgS1ZNIGN1cnJlbnRseSBvbmx5IG1hcHMg
VEhQIGFzIDJtYiBwYWdlcy4gIEJ1dAogICAgdGhlIGlkZWEgaXMgdGhlIHNhbWUsIHRyYW5zZmVy
IHRoZSByZWZjb3VudCB0aGUgUEZOIHRoYXQncyBhY3R1YWxseQogICAgZ29pbmcgaW50byBLVk0n
cyBwYWdlIHRhYmxlcy4KCj4gPgo+ID5UaGUgc2NhcmllciBjb2RlIChmb3IgbWUpIGlzIHRyYW5z
cGFyZW50X2h1Z2VwYWdlX2FkanVzdCgpIGFuZAo+ID5rdm1fbW11X3phcF9jb2xsYXBzaWJsZV9z
cHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPmludGVyYWN0aW9uIGJl
dHdlZW4gVEhQIGFuZCBfUEFHRV9ERVZNQVAuCj4gCj4gVGhlIHg4NiBLVk0gTU1VIGNvZGUgaXMg
b25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUgSSBrbm93IChzb3JyeSwgYnV0IGl0IGhhZCB0bwo+IGJl
IHNhaWQgOi8gKS4gTHVja2lseSwgdGhpcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgdGhlIFBH
X3Jlc2VydmVkIHRoaW5neQo+IEFGQUlLcy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
