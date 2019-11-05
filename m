Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E8F022A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 17:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS1Go-00032C-6w; Tue, 05 Nov 2019 16:01:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YgOY=Y5=intel.com=sean.j.christopherson@srs-us1.protection.inumbo.net>)
 id 1iS1FU-0002m3-SR
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 16:00:04 +0000
X-Inumbo-ID: 533c8b00-ffe5-11e9-a19b-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 533c8b00-ffe5-11e9-a19b-12813bfff9fa;
 Tue, 05 Nov 2019 16:00:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 08:00:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="205019568"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga003.jf.intel.com with ESMTP; 05 Nov 2019 08:00:00 -0800
Date: Tue, 5 Nov 2019 08:00:00 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20191105160000.GC8128@linux.intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 05 Nov 2019 16:01:24 +0000
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MDI6NDZBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDUuMTEuMTkgMTA6NDksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+
ID5PbiAwNS4xMS4xOSAxMDoxNywgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj5PbiAwNS4x
MS4xOSAwNTozOCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4+Pk9uIFRodSwgT2N0IDI0LCAyMDE5
IGF0IDU6MTEgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+
ID4+Pj4KPiA+Pj4+UmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQ
R19yZXNlcnZlZC4gV2Ugd2FudCB0bwo+ID4+Pj5jaGFuZ2UgdGhhdC4KPiA+Pj4+Cj4gPj4+PktW
TSBoYXMgdGhpcyB3ZWlyZCB1c2UgY2FzZSB0aGF0IHlvdSBjYW4gbWFwIGFueXRoaW5nIGZyb20g
L2Rldi9tZW0KPiA+Pj4+aW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlh
YmxlIGNoZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+ID4+Pj53YXMgaW5pdGlhbGl6ZWQgYW5kIGNh
biBiZSB0b3VjaGVkLiBwZm5fdG9fb25saW5lX3BhZ2UoKSBtYWtlcyBzdXJlCj4gPj4+PnRoYXQg
d2UgaGF2ZSBhbiBpbml0aWFsaXplZCBtZW1tYXAgKGFuZCBkb24ndCBoYXZlIFpPTkVfREVWSUNF
IG1lbW9yeSkuCj4gPj4+Pgo+ID4+Pj5SZXdyaXRlIGt2bV9pc19yZXNlcnZlZF9wZm4oKSB0byBt
YWtlIHN1cmUgdGhlIGZ1bmN0aW9uIHByb2R1Y2VzIHRoZQo+ID4+Pj5zYW1lIHJlc3VsdCBvbmNl
IHdlIHN0b3Agc2V0dGluZyBaT05FX0RFVklDRSBwYWdlcyBQR19yZXNlcnZlZC4KPiA+Pj4+Cj4g
Pj4+PkNjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+ID4+Pj5DYzogIlJh
ZGltIEtyxI1tw6HFmSIgPHJrcmNtYXJAcmVkaGF0LmNvbT4KPiA+Pj4+Q2M6IE1pY2hhbCBIb2Nr
byA8bWhvY2tvQGtlcm5lbC5vcmc+Cj4gPj4+PkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KPiA+Pj4+Q2M6IEthcmltQWxsYWggQWhtZWQgPGthcmFobWVkQGFtYXpv
bi5kZT4KPiA+Pj4+U2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+Cj4gPj4+Pi0tLQo+ID4+Pj4gICAgdmlydC9rdm0va3ZtX21haW4uYyB8IDEwICsrKysr
KysrLS0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPj4+Pgo+ID4+Pj5kaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3Zp
cnQva3ZtL2t2bV9tYWluLmMKPiA+Pj4+aW5kZXggZTllYjY2NmViNmU4Li45ZDE4Y2M2N2QxMjQg
MTAwNjQ0Cj4gPj4+Pi0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiA+Pj4+KysrIGIvdmlydC9r
dm0va3ZtX21haW4uYwo+ID4+Pj5AQCAtMTUxLDkgKzE1MSwxNSBAQCBfX3dlYWsgaW50IGt2bV9h
cmNoX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwKPiA+Pj4+
Cj4gPj4+PiAgICBib29sIGt2bV9pc19yZXNlcnZlZF9wZm4oa3ZtX3Bmbl90IHBmbikKPiA+Pj4+
ICAgIHsKPiA+Pj4+LSAgICAgICBpZiAocGZuX3ZhbGlkKHBmbikpCj4gPj4+Pi0gICAgICAgICAg
ICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHBmbikpOwo+ID4+Pj4rICAgICAg
IHN0cnVjdCBwYWdlICpwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7Cj4gPj4+Pgo+ID4+
Pj4rICAgICAgIC8qCj4gPj4+PisgICAgICAgICogV2UgdHJlYXQgYW55IHBhZ2VzIHRoYXQgYXJl
IG5vdCBvbmxpbmUgKG5vdCBtYW5hZ2VkIGJ5IHRoZSBidWRkeSkKPiA+Pj4+KyAgICAgICAgKiBh
cyByZXNlcnZlZCAtIHRoaXMgaW5jbHVkZXMgWk9ORV9ERVZJQ0UgcGFnZXMgYW5kIHBhZ2VzIHdp
dGhvdXQKPiA+Pj4+KyAgICAgICAgKiBhIG1lbW1hcCAoZS5nLiwgbWFwcGVkIHZpYSAvZGV2L21l
bSkuCj4gPj4+PisgICAgICAgICovCj4gPj4+PisgICAgICAgaWYgKHBhZ2UpCj4gPj4+PisgICAg
ICAgICAgICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBhZ2UpOwo+ID4+Pj4gICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ID4+Pj4gICAgfQo+ID4+Pgo+ID4+PlNvIGFmdGVyIHRoaXMgYWxsIHRoZSBw
Zm5fdmFsaWQoKSB1c2FnZSBpbiBrdm1fbWFpbi5jIGlzIHJlcGxhY2VkIHdpdGgKPiA+Pj5wZm5f
dG9fb25saW5lX3BhZ2UoKT8gTG9va3MgY29ycmVjdCB0byBtZS4KPiA+Pj4KPiA+Pj5Ib3dldmVy
LCBJJ20gd29ycmllZCB0aGF0IGt2bSBpcyB0YWtpbmcgcmVmZXJlbmNlIG9uIFpPTkVfREVWSUNF
IHBhZ2VzCj4gPj4+dGhyb3VnaCBzb21lIG90aGVyIHBhdGggcmVzdWx0aW5nIGluIHRoaXM6Cj4g
Pj4+Cj4gPj4+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW52ZGltbS8yMDE5
MDkxOTE1NDcwOC5HQTI0NjUwQGFuZ2JhbmQucGwvCj4gPj4+Cj4gPj4+SSdsbCBzZWUgaWYgdGhp
cyBwYXRjaCBzZXQgbW9kdWxhdGVzIG9yIG1haW50YWlucyB0aGF0IGZhaWx1cmUgbW9kZS4KPiA+
Pj4KPiA+Pgo+ID4+SSdkIGFzc3VtZSB0aGF0IHRoZSBiZWhhdmlvciBpcyB1bmNoYW5nZWQuIEl0
aGluayB3ZSBnZXQgYSByZWZlcmVuY2UgdG8KPiA+PnRoZXNlIFpPTkVfREVWSUNFIHBhZ2VzIHZp
YSBfX2dldF91c2VyX3BhZ2VzX2Zhc3QoKSBhbmQgZnJpZW5kcyBpbgo+ID4+aHZhX3RvX3Bmbl9m
YXN0KCkgYW5kIGZyaWVuZHMgaW4gdmlydC9rdm0va3ZtX21haW4uYwo+ID4+Cj4gPgo+ID5JIHRo
aW5rIEkga25vdyB3aGF0J3MgZ29pbmcgd3Jvbmc6Cj4gPgo+ID5QYWdlcyB0aGF0IGFyZSBwaW5u
ZWQgdmlhIGdmbl90b19wZm4oKSBhbmQgZnJpZW5kcyB0YWtlIGEgcmVmZXJlbmNlcywKPiA+aG93
ZXZlciBhcmUgb2Z0ZW4gcmVsZWFzZWQgdmlhCj4gPmt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpL2t2
bV9yZWxlYXNlX3Bmbl9kaXJ0eSgpL2t2bV9yZWxlYXNlX3BhZ2VfY2xlYW4oKS4uLgo+ID4KPiA+
Cj4gPkUuZy4sIGluIGFyY2gveDg2L2t2bS94ODYuYzpyZWV4ZWN1dGVfaW5zdHJ1Y3Rpb24oKQo+
ID4KPiA+Li4uCj4gPnBmbiA9IGdmbl90b19wZm4odmNwdS0+a3ZtLCBncGFfdG9fZ2ZuKGdwYSkp
Owo+ID4uLi4KPiA+a3ZtX3JlbGVhc2VfcGZuX2NsZWFuKHBmbik7Cj4gPgo+ID4KPiA+Cj4gPnZv
aWQga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKGt2bV9wZm5fdCBwZm4pCj4gPnsKPiA+CWlmICghaXNf
ZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1faXNfcmVzZXJ2ZWRfcGZuKHBmbikpCj4gPgkJ
cHV0X3BhZ2UocGZuX3RvX3BhZ2UocGZuKSk7Cj4gPn0KPiA+Cj4gPlRoaXMgZnVuY3Rpb24gbWFr
ZXMgcGVyZmVjdCBzZW5zZSBhcyB0aGUgY291bnRlcnBhcnQgZm9yIGt2bV9nZXRfcGZuKCk6Cj4g
Pgo+ID52b2lkIGt2bV9nZXRfcGZuKGt2bV9wZm5fdCBwZm4pCj4gPnsKPiA+CWlmICgha3ZtX2lz
X3Jlc2VydmVkX3BmbihwZm4pKQo+ID4JCWdldF9wYWdlKHBmbl90b19wYWdlKHBmbikpOwo+ID59
Cj4gPgo+ID4KPiA+QXMgYWxsIFpPTkVfREVWSUNFIHBhZ2VzIGFyZSBjdXJyZW50bHkgcmVzZXJ2
ZWQsIHBhZ2VzIHBpbm5lZCB2aWEKPiA+Z2ZuX3RvX3BmbigpIGFuZCBmcmllbmRzIHdpbGwgb2Z0
ZW4gbm90IHNlZSBhIHB1dF9wYWdlKCkgQUZBSUtTLgoKQXNzdW1pbmcgZ3VwKCkgdGFrZXMgYSBy
ZWZlcmVuY2UgZm9yIFpPTkVfREVWSUNFIHBhZ2VzLCB5ZXMsIHRoaXMgaXMgYQpLVk0gYnVnLgoK
PiA+Tm93LCBteSBwYXRjaCBkb2VzIG5vdCBjaGFuZ2UgdGhhdCwgdGhlIHJlc3VsdCBvZgo+ID5r
dm1faXNfcmVzZXJ2ZWRfcGZuKHBmbikgd2lsbCBiZSB1bmNoYW5nZWQuIEEgcHJvcGVyIGZpeCBm
b3IgdGhhdCB3b3VsZAo+ID5wcm9iYWJseSBiZQo+ID4KPiA+YSkgVG8gZHJvcCB0aGUgcmVmZXJl
bmNlIHRvIFpPTkVfREVWSUNFIHBhZ2VzIGluIGdmbl90b19wZm4oKSBhbmQKPiA+ZnJpZW5kcywg
YWZ0ZXIgeW91IHN1Y2Nlc3NmdWxseSBwaW5uZWQgdGhlIHBhZ2VzLiAobm90IHN1cmUgaWYgdGhh
dCdzCj4gPnRoZSByaWdodCB0aGluZyB0byBkbyBidXQgeW91J3JlIHRoZSBleHBlcnQpCj4gPgo+
ID5iKSBUbyBub3QgdXNlIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpIGFuZCBmcmllbmRzIG9uIHBh
Z2VzIHRoYXQgd2VyZQo+ID5kZWZpbml0ZWx5IHBpbm5lZC4KClRoaXMgaXMgYWxyZWFkeSBLVk0n
cyBpbnRlbnQsIGkuZS4gdGhlIHB1cnBvc2Ugb2YgdGhlIFBhZ2VSZXNlcnZlZCgpIGNoZWNrCmlz
IHNpbXBseSB0byBhdm9pZCBwdXR0aW5nIGEgbm9uLWV4aXN0ZW50IHJlZmVyZW5jZS4gIFRoZSBw
cm9ibGVtIGlzIHRoYXQKS1ZNIGFzc3VtZXMgcGFnZXMgd2l0aCBQR19yZXNlcnZlZCBzZXQgYXJl
IG5ldmVyIHBpbm5lZCwgd2hpY2ggQUZBSUNUIHdhcwp0cnVlIHdoZW4gdGhlIGNvZGUgd2FzIGZp
cnN0IGFkZGVkLgoKPiAodGFsa2luZyB0byBteXNlbGYsIHNvcnJ5KQo+IAo+IFRoaW5raW5nIGFn
YWluLCBkcm9wcGluZyB0aGlzIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMgY291bGQgZWZmZWN0aXZl
bHkgYWxzbwo+IGZpeCB0aGF0IGlzc3VlLiBFLmcuLCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oKSBh
bmQgZnJpZW5kcyB3b3VsZCBhbHdheXMgZG8gYQo+IHB1dF9wYWdlKCkgaWYgInBmbl92YWxpZCgp
IGFuZCAhUGFnZVJlc2VydmVkKCkiLCBzbyBhZnRlciBwYXRjaCA5IGFsc28gb24KPiBaT05ERV9E
RVZJQ0UgcGFnZXMuCgpZZWFoLCB0aGlzIGFwcGVhcnMgdG8gYmUgdGhlIGNvcnJlY3QgZml4LgoK
PiBCdXQgaXQgd291bGQgaGF2ZSBzaWRlIGVmZmVjdHMgdGhhdCBtaWdodCBub3QgYmUgZGVzaXJl
ZC4gRS5nLiw6Cj4gCj4gMS4ga3ZtX3Bmbl90b19wYWdlKCkgd291bGQgYWxzbyByZXR1cm4gWk9O
RV9ERVZJQ0UgcGFnZXMgKG1pZ2h0IGV2ZW4gYmUgdGhlCj4gcmlnaHQgdGhpbmcgdG8gZG8pLgoK
VGhpcyBzaG91bGQgYmUgb2ssIGF0IGxlYXN0IG9uIHg4Ni4gIFRoZXJlIGFyZSBvbmx5IHRocmVl
IHVzZXJzIG9mCmt2bV9wZm5fdG9fcGFnZSgpLiAgVHdvIG9mIHRob3NlIGFyZSBvbiBhbGxvY2F0
aW9ucyB0aGF0IGFyZSBjb250cm9sbGVkIGJ5CktWTSBhbmQgYXJlIGd1YXJhbnRlZWQgdG8gYmUg
dmFuaWxsYSBNQVBfQU5PTllNT1VTLiAgVGhlIHRoaXJkIGlzIG9uIGd1ZXN0Cm1lbW9yeSB3aGVu
IHJ1bm5pbmcgYSBuZXN0ZWQgZ3Vlc3QsIGFuZCBpbiB0aGF0IGNhc2Ugc3VwcG9ydGluZyBaT05F
X0RFVklDRQptZW1vcnkgaXMgZGVzaXJhYmxlLCBpLmUuIEtWTSBzaG91bGQgcGxheSBuaWNlIHdp
dGggYSBndWVzdCB0aGF0IGlzIGJhY2tlZApieSBaT05FX0RFVklDRSBtZW1vcnkuCgo+IDIuIGt2
bV9zZXRfcGZuX2RpcnR5KCkgd291bGQgYWxzbyBzZXQgWk9ORV9ERVZJQ0UgcGFnZXMgZGlydHkg
KG1pZ2h0IGJlCj4gb2theSkKClRoaXMgaXMgb2sgZnJvbSBhIEtWTSBwZXJzcGVjdGl2ZS4KClRo
ZSBzY2FyaWVyIGNvZGUgKGZvciBtZSkgaXMgdHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkg
YW5kCmt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3NwdGUoKSwgYXMgSSBkb24ndCBhdCBhbGwgdW5k
ZXJzdGFuZCB0aGUKaW50ZXJhY3Rpb24gYmV0d2VlbiBUSFAgYW5kIF9QQUdFX0RFVk1BUC4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
