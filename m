Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6ACF0A5A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:45:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8Sl-0002BO-Hy; Tue, 05 Nov 2019 23:42:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YgOY=Y5=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iS8Sk-0002BJ-3Y
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:42:14 +0000
X-Inumbo-ID: e32be1ee-0025-11ea-a1a5-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e32be1ee-0025-11ea-a1a5-12813bfff9fa;
 Tue, 05 Nov 2019 23:42:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 15:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="200541599"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2019 15:42:08 -0800
Date: Tue, 5 Nov 2019 15:42:08 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20191105234208.GH23297@linux.intel.com>
References: <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6MzA6MDBQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMzoxMyBQTSBTZWFuIENocmlzdG9waGVyc29u
Cj4gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgTm92IDA1LCAyMDE5IGF0IDAzOjAyOjQwUE0gLTA4MDAsIERhbiBXaWxsaWFtcyB3cm90ZToK
PiA+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMjozMSBQTSBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBUaGUgc2NhcmllciBjb2RlIChmb3Ig
bWUpIGlzIHRyYW5zcGFyZW50X2h1Z2VwYWdlX2FkanVzdCgpIGFuZAo+ID4gPiA+ID4ga3ZtX21t
dV96YXBfY29sbGFwc2libGVfc3B0ZSgpLCBhcyBJIGRvbid0IGF0IGFsbCB1bmRlcnN0YW5kIHRo
ZQo+ID4gPiA+ID4gaW50ZXJhY3Rpb24gYmV0d2VlbiBUSFAgYW5kIF9QQUdFX0RFVk1BUC4KPiA+
ID4gPgo+ID4gPiA+IFRoZSB4ODYgS1ZNIE1NVSBjb2RlIGlzIG9uZSBvZiB0aGUgdWdsaWVzdCBj
b2RlIEkga25vdyAoc29ycnksIGJ1dCBpdAo+ID4gPiA+IGhhZCB0byBiZSBzYWlkIDovICkuIEx1
Y2tpbHksIHRoaXMgc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIHRoZQo+ID4gPiA+IFBHX3Jlc2Vy
dmVkIHRoaW5neSBBRkFJS3MuCj4gPiA+Cj4gPiA+IEJvdGggdHJhbnNwYXJlbnRfaHVnZXBhZ2Vf
YWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3NwdGUoKQo+ID4gPiBhcmUgaG9u
b3Jpbmcga3ZtX2lzX3Jlc2VydmVkX3BmbigpLCBzbyBhZ2FpbiBJJ20gbWlzc2luZyB3aGVyZSB0
aGUKPiA+ID4gcGFnZSBjb3VudCBnZXRzIG1pc21hbmFnZWQgYW5kIGxlYWRzIHRvIHRoZSByZXBv
cnRlZCBoYW5nLgo+ID4KPiA+IFdoZW4gbWFwcGluZyBwYWdlcyBpbnRvIHRoZSBndWVzdCwgS1ZN
IGdldHMgdGhlIHBhZ2UgdmlhIGd1cCgpLCB3aGljaAo+ID4gaW5jcmVtZW50cyB0aGUgcGFnZSBj
b3VudCBmb3IgWk9ORV9ERVZJQ0UgcGFnZXMuICBCdXQgS1ZNIHB1dHMgdGhlIHBhZ2UKPiA+IHVz
aW5nIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpLCB3aGljaCBza2lwcyBwdXRfcGFnZSgpIGlmIFBh
Z2VSZXNlcnZlZCgpCj4gPiBhbmQgc28gbmV2ZXIgcHV0cyBpdHMgcmVmZXJlbmNlIHRvIFpPTkVf
REVWSUNFIHBhZ2VzLgo+IAo+IE9oLCB5ZWFoLCB0aGF0J3MgYnVzdGVkLgo+IAo+ID4gTXkgdHJh
bnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3Nw
dGUoKQo+ID4gY29tbWVudHMgd2VyZSBmb3IgYSBwb3N0LXBhdGNoL3NlcmllcyBzY2VuYXJpbyB3
aGVyZW4gUGFnZVJlc2VydmVkKCkgaXMKPiA+IG5vIGxvbmdlciB0cnVlIGZvciBaT05FX0RFVklD
RSBwYWdlcy4KPiAKPiBBaCwgb2ssIGZvciB0aGF0IERhdmlkIGlzIHByZXNlcnZpbmcga3ZtX2lz
X3Jlc2VydmVkX3BmbigpIHJldHVybmluZwo+IHRydWUgZm9yIFpPTkVfREVWSUNFIGJlY2F1c2Ug
cGZuX3RvX29ubGluZV9wYWdlKCkgd2lsbCBmYWlsIGZvcgo+IFpPTkVfREVWSUNFLgoKQnV0IERh
dmlkJ3MgcHJvcG9zZWQgZml4IGZvciB0aGUgYWJvdmUgcmVmY291bnQgYnVnIGlzIHRvIG9taXQg
dGhlIHBhdGNoCnNvIHRoYXQgS1ZNIG5vIGxvbmdlciB0cmVhdHMgWk9ORV9ERVZJQ0UgcGFnZXMg
YXMgcmVzZXJ2ZWQuICBUaGF0IHNlZW1zCmxpa2UgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBpbmNs
dWRpbmcgZm9yIHRocF9hZGp1c3QoKSwgZS5nLiBpdCB3b3VsZApuYXR1cmFsbHkgbGV0IEtWTSB1
c2UgMm1iIHBhZ2VzIGZvciB0aGUgZ3Vlc3Qgd2hlbiBhIFpPTkVfREVWSUNFIHBhZ2UgaXMKbWFw
cGVkIHdpdGggYSBodWdlIHBhZ2UgKDJtYiBvciBhYm92ZSkgaW4gdGhlIGhvc3QuICBUaGUgb25s
eSBoaWNjdXAgaXMKZmlndXJpbmcgb3V0IGhvdyB0byBjb3JyZWN0bHkgdHJhbnNmZXIgdGhlIHJl
ZmVyZW5jZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
