Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B4F1AD5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:11:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNrz-0000bX-Jf; Wed, 06 Nov 2019 16:09:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9gKF=Y6=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iSNry-0000bS-Iz
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:09:18 +0000
X-Inumbo-ID: c81bf292-00af-11ea-a1ae-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c81bf292-00af-11ea-a1ae-12813bfff9fa;
 Wed, 06 Nov 2019 16:09:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 08:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="200752952"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by fmsmga008.fm.intel.com with ESMTP; 06 Nov 2019 08:09:13 -0800
Date: Wed, 6 Nov 2019 08:09:13 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20191106160913.GD16249@linux.intel.com>
References: <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
 <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
 <20191106000315.GI23297@linux.intel.com>
 <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
 <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDc6NTY6MzRBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDYuMTEuMTkgMDE6MDgsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+T24g
VHVlLCBOb3YgNSwgMjAxOSBhdCA0OjAzIFBNIFNlYW4gQ2hyaXN0b3BoZXJzb24KPiA+PkJ1dCBE
YXZpZCdzIHByb3Bvc2VkIGZpeCBmb3IgdGhlIGFib3ZlIHJlZmNvdW50IGJ1ZyBpcyB0byBvbWl0
IHRoZSBwYXRjaAo+ID4+c28gdGhhdCBLVk0gbm8gbG9uZ2VyIHRyZWF0cyBaT05FX0RFVklDRSBw
YWdlcyBhcyByZXNlcnZlZC4gIFRoYXQgc2VlbXMKPiA+Pmxpa2UgdGhlIHJpZ2h0IHRoaW5nIHRv
IGRvLCBpbmNsdWRpbmcgZm9yIHRocF9hZGp1c3QoKSwgZS5nLiBpdCB3b3VsZAo+ID4+bmF0dXJh
bGx5IGxldCBLVk0gdXNlIDJtYiBwYWdlcyBmb3IgdGhlIGd1ZXN0IHdoZW4gYSBaT05FX0RFVklD
RSBwYWdlIGlzCj4gPj5tYXBwZWQgd2l0aCBhIGh1Z2UgcGFnZSAoMm1iIG9yIGFib3ZlKSBpbiB0
aGUgaG9zdC4gIFRoZSBvbmx5IGhpY2N1cCBpcwo+ID4+ZmlndXJpbmcgb3V0IGhvdyB0byBjb3Jy
ZWN0bHkgdHJhbnNmZXIgdGhlIHJlZmVyZW5jZS4KPiA+Cj4gPlRoYXQgbWlnaHQgbm90IGJlIHRo
ZSBvbmx5IGhpY2N1cC4gVGhlcmUncyBjdXJyZW50bHkgbm8gc3VjaCB0aGluZyBhcwo+ID5odWdl
IHBhZ2VzIGZvciBaT05FX0RFVklDRSwgdGhlcmUgYXJlIGh1Z2UgKm1hcHBpbmdzKiAocG1kIGFu
ZCBwdWQpLAo+ID5idXQgdGhlIHJlc3VsdCBvZiBwZm5fdG9fcGFnZSgpIG9uIHN1Y2ggYSBtYXBw
aW5nIGRvZXMgbm90IHlpZWxkIGEKPiA+aHVnZSAnc3RydWN0IHBhZ2UnLiBJdCBzZWVtcyB0aGVy
ZSBhcmUgb3RoZXIgcGF0aHMgaW4gS1ZNIHRoYXQgYXNzdW1lCj4gPnRoYXQgbW9yZSB0eXBpY2Fs
IHBhZ2UgbWFjaGluZXJ5IGlzIGFjdGl2ZSBsaWtlIFNldFBhZ2VEaXJ0eSgpIGJhc2VkCj4gPm9u
IGt2bV9pc19yZXNlcnZlZF9wZm4oKS4gV2hpbGUgSSB0b2xkIERhdmlkIHRoYXQgSSBkaWQgbm90
IHdhbnQgdG8KPiA+c2VlIG1vcmUgdXNhZ2Ugb2YgaXNfem9uZV9kZXZpY2VfcGFnZSgpLCB0aGlz
IHBhdGNoIGJlbG93ICh1bnRlc3RlZCkKPiA+c2VlbXMgYSBjbGVhbmVyIHBhdGggd2l0aCBsZXNz
IHN1cnByaXNlczoKPiA+Cj4gPmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmly
dC9rdm0va3ZtX21haW4uYwo+ID5pbmRleCA0ZGYwYWE2YjhlNWMuLmZiZWExN2MxODEwYyAxMDA2
NDQKPiA+LS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwo+ID4rKysgYi92aXJ0L2t2bS9rdm1fbWFp
bi5jCj4gPkBAIC0xODMxLDcgKzE4MzEsOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcmVsZWFz
ZV9wYWdlX2NsZWFuKTsKPiA+Cj4gPiAgdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oa3ZtX3Bm
bl90IHBmbikKPiA+ICB7Cj4gPi0gICAgICAgaWYgKCFpc19lcnJvcl9ub3Nsb3RfcGZuKHBmbikg
JiYgIWt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSkKPiA+KyAgICAgICBpZiAoKCFpc19lcnJvcl9u
b3Nsb3RfcGZuKHBmbikgJiYgIWt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSkgfHwKClRoZSBpc19l
cnJvcl9ub3Nsb3RfcGZuKCkgY2hlY2sgc2hvdWxkbid0IGJlIG92ZXJyaWRlbiBieSB6b25lX2Rl
dmljZS4KCj4gPisgICAgICAgICAgIChwZm5fdmFsaWQocGZuKSAmJiBpc196b25lX2RldmljZV9w
YWdlKHBmbl90b19wYWdlKHBmbikpKSkKCkJ1dCByYXRoZXIgdGhhbiBzcGVjaWFsIGNhc2Uga3Zt
X3JlbGVhc2VfcGZuX2NsZWFuKCksIEknZCByYXRoZXIgS1ZNCmV4cGxpY2l0bHkgaGFuZGxlIFpP
TkVfREVWSUNFIHBhZ2VzLCB0aGVyZSBhcmUgb3RoZXIgZmxvd3Mgd2hlcmUgS1ZNCnJlYWxseSBz
aG91bGQgYmUgYXdhcmUgb2YgWk9ORV9ERVZJQ0UgcGFnZXMsIGUuZy4gZm9yIHNhbml0eSBjaGVj
a3MgYW5kCndoYXRub3QuICBUaGVyZSBhcmUgc3VycHJpc2luZ2x5IGZldyBjYWxsZXJzIG9mIGt2
bV9pc19yZXNlcnZlZF9wZm4oKSwgc28KaXQncyBhY3R1YWxseSBub3QgdG9vIGJpZyBvZiBhIGNo
YW5nZS4gCgo+ID4gICAgICAgICAgICAgICAgIHB1dF9wYWdlKHBmbl90b19wYWdlKHBmbikpOwo+
ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcmVsZWFzZV9wZm5fY2xlYW4pOwo+IAo+
IEkgaGFkIHRoZSBzYW1lIHRob3VnaHQsIGJ1dCBJIGRvIHdvbmRlciBhYm91dCB0aGUga3ZtX2dl
dF9wZm4oKSB1c2VycywKPiBlLmcuLDoKPiAKPiBodmFfdG9fcGZuX3JlbWFwcGVkKCk6Cj4gCXIg
PSBmb2xsb3dfcGZuKHZtYSwgYWRkciwgJnBmbik7Cj4gCS4uLgo+IAlrdm1fZ2V0X3BmbihwZm4p
Owo+IAkuLi4KPiAKPiBXZSB3b3VsZCBub3QgdGFrZSBhIHJlZmVyZW5jZSBmb3IgWk9ORV9ERVZJ
Q0UsIGJ1dCBsYXRlciBkcm9wIG9uZSByZWZlcmVuY2UKPiB2aWEga3ZtX3JlbGVhc2VfcGZuX2Ns
ZWFuKCkuIElPVywga3ZtX2dldF9wZm4oKSBnZXRzICpyZWFsbHkqIGRhbmdlcm91cyB0bwo+IHVz
ZS4gSSBjYW4ndCB0ZWxsIGlmIHRoaXMgY2FuIGhhcHBlbiByaWdodCBub3cuCj4gCj4gV2UgZG8g
aGF2ZSAzIHVzZXJzIG9mIGt2bV9nZXRfcGZuKCkgdGhhdCB3ZSBoYXZlIHRvIGF1ZGl0IGJlZm9y
ZSB0aGlzCj4gY2hhbmdlLiBBbHNvLCB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCB0byBrdm1fZ2V0
X3BmbigpIHRoYXQgaXQgc2hvdWxkIG5ldmVyCj4gYmUgdXNlZCB3aXRoIHBvc3NpYmxlIFpPTkVf
REVWSUNFIHBhZ2VzLgo+IAo+IEFsc28sIHdlIHNob3VsZCBhZGQgYSBjb21tZW50IHRvIGt2bV9y
ZWxlYXNlX3Bmbl9jbGVhbigpLCBkZXNjcmliaW5nIHdoeSB3ZQo+IHRyZWF0IFpPTkVfREVWSUNF
IGluIGEgc3BlY2lhbCB3YXkgaGVyZS4KPiAKPiAKPiBXZSBjYW4gdGhlbiBwcm9ncmVzcyBsaWtl
IHRoaXMKPiAKPiAxLiBHZXQgdGhpcyBmaXggdXBzdHJlYW0sIGl0J3Mgc29tZXdoYXQgdW5yZWxh
dGVkIHRvIHRoaXMgc2VyaWVzLgo+IDIuIFRoaXMgcGF0Y2ggaGVyZSByZW1haW5zIGFzIGlzIGlu
IHRoaXMgc2VyaWVzICgrLy0gZG9jdW1lbnRhdGlvbiB1cGRhdGUpCj4gMy4gTG9uZyB0ZXJtLCBy
ZXdvcmsgS1ZNIHRvIG5vdCBoYXZlIHRvIG5vdCB0cmVhdCBaT05FX0RFVklDRSBsaWtlIHJlc2Vy
dmVkCj4gcGFnZXMuIEUuZy4sIGdldCByaWQgb2Yga3ZtX2dldF9wZm4oKS4gVGhlbiwgdGhpcyBz
cGVjaWFsIHpvbmUgY2hlY2sgY2FuIGdvLgoKRHJvcHBpbmcga3ZtX2dldF9wZm4oKSBpcyBsZXNz
IHRoYW4gaWRlYWwsIGFuZCBhdCB0aGlzIHBvaW50IHVubmVjZXNzYXJ5LgpJJ20gOTklIHN1cmUg
dGhlIGV4aXN0aW5nIGNhbGwgc2l0ZXMgZm9yIGt2bV9nZXRfcGZuKCkgY2FuIG5ldmVyIGJlCnJl
YWNoZWQgd2l0aCBaT05FX0RFVklDRSBwYWdlcy4gIEkgdGhpbmsgd2UgY2FuIGRvOgoKICAxLiBH
ZXQgYSBmaXggdXBzdHJlYW0gdG8gaGF2ZSBLVk0gc3RvcCB0cmVhdGluZyBaT05FX0RFVklDRSBw
YWdlcyBhcwogICAgIHJlc2VydmVkIFBGTnMsIGkuZS4gZXhlbXB0IHRoZW0gaW4ga3ZtX2lzX3Jl
c2VydmVkX3BmbigpIGFuZCBjaGFuZ2UKICAgICB0aGUgY2FsbGVycyBvZiBrdm1faXNfcmVzZXJ2
ZWRfcGZuKCkgdG8gaGFuZGxlIFpPTkVfREVWSUNFIHBhZ2VzLgogIDIuIERyb3AgdGhpcyBwYXRj
aCBmcm9tIHRoZSBzZXJpZXMsIGFuZCBpbnN0ZWFkIHJlbW92ZSB0aGUgc3BlY2lhbAogICAgIHRy
ZWF0bWVudCBvZiBaT05FX0RFVklDRSBwYWdlcyBmcm9tIGt2bV9pc19yZXNlcnZlZF9wZm4oKS4K
CkdpdmUgbWUgYSBmZXcgbWludXRlcyB0byBwcmVwIGEgcGF0Y2guCgo+IAo+IC0tIAo+IAo+IFRo
YW5rcywKPiAKPiBEYXZpZCAvIGRoaWxkZW5iCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
