Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF92F0A1C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:16:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS80y-0007ms-CB; Tue, 05 Nov 2019 23:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YgOY=Y5=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iS80x-0007mn-1l
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:13:31 +0000
X-Inumbo-ID: e0a42822-0021-11ea-a1a5-12813bfff9fa
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0a42822-0021-11ea-a1a5-12813bfff9fa;
 Tue, 05 Nov 2019 23:13:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 15:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="403533470"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2019 15:13:16 -0800
Date: Tue, 5 Nov 2019 15:13:16 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20191105231316.GE23297@linux.intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6MDI6NDBQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMTI6MzEgUE0gRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiBUaGUgc2NhcmllciBjb2RlIChmb3IgbWUp
IGlzIHRyYW5zcGFyZW50X2h1Z2VwYWdlX2FkanVzdCgpIGFuZAo+ID4gPiBrdm1fbW11X3phcF9j
b2xsYXBzaWJsZV9zcHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPiA+
IGludGVyYWN0aW9uIGJldHdlZW4gVEhQIGFuZCBfUEFHRV9ERVZNQVAuCj4gPgo+ID4gVGhlIHg4
NiBLVk0gTU1VIGNvZGUgaXMgb25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUgSSBrbm93IChzb3JyeSwg
YnV0IGl0Cj4gPiBoYWQgdG8gYmUgc2FpZCA6LyApLiBMdWNraWx5LCB0aGlzIHNob3VsZCBiZSBp
bmRlcGVuZGVudCBvZiB0aGUKPiA+IFBHX3Jlc2VydmVkIHRoaW5neSBBRkFJS3MuCj4gCj4gQm90
aCB0cmFuc3BhcmVudF9odWdlcGFnZV9hZGp1c3QoKSBhbmQga3ZtX21tdV96YXBfY29sbGFwc2li
bGVfc3B0ZSgpCj4gYXJlIGhvbm9yaW5nIGt2bV9pc19yZXNlcnZlZF9wZm4oKSwgc28gYWdhaW4g
SSdtIG1pc3Npbmcgd2hlcmUgdGhlCj4gcGFnZSBjb3VudCBnZXRzIG1pc21hbmFnZWQgYW5kIGxl
YWRzIHRvIHRoZSByZXBvcnRlZCBoYW5nLgoKV2hlbiBtYXBwaW5nIHBhZ2VzIGludG8gdGhlIGd1
ZXN0LCBLVk0gZ2V0cyB0aGUgcGFnZSB2aWEgZ3VwKCksIHdoaWNoCmluY3JlbWVudHMgdGhlIHBh
Z2UgY291bnQgZm9yIFpPTkVfREVWSUNFIHBhZ2VzLiAgQnV0IEtWTSBwdXRzIHRoZSBwYWdlCnVz
aW5nIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpLCB3aGljaCBza2lwcyBwdXRfcGFnZSgpIGlmIFBh
Z2VSZXNlcnZlZCgpCmFuZCBzbyBuZXZlciBwdXRzIGl0cyByZWZlcmVuY2UgdG8gWk9ORV9ERVZJ
Q0UgcGFnZXMuCgpNeSB0cmFuc3BhcmVudF9odWdlcGFnZV9hZGp1c3QoKSBhbmQga3ZtX21tdV96
YXBfY29sbGFwc2libGVfc3B0ZSgpCmNvbW1lbnRzIHdlcmUgZm9yIGEgcG9zdC1wYXRjaC9zZXJp
ZXMgc2NlbmFyaW8gd2hlcmVuIFBhZ2VSZXNlcnZlZCgpIGlzCm5vIGxvbmdlciB0cnVlIGZvciBa
T05FX0RFVklDRSBwYWdlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
