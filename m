Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4DE2934
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 05:56:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNUBU-0004lo-QI; Thu, 24 Oct 2019 03:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dQCd=YR=arm.com=anshuman.khandual@srs-us1.protection.inumbo.net>)
 id 1iNUBS-0004lj-Eb
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 03:53:10 +0000
X-Inumbo-ID: c844ebe6-f611-11e9-9494-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c844ebe6-f611-11e9-9494-12813bfff9fa;
 Thu, 24 Oct 2019 03:53:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4221FB;
 Wed, 23 Oct 2019 20:53:04 -0700 (PDT)
Received: from [10.162.43.133] (p8cg001049571a15.blr.arm.com [10.162.43.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 33C723F71A; Wed, 23 Oct 2019 20:52:45 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-2-david@redhat.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <4aa3c72b-8991-9e43-80d7-a906ae79160b@arm.com>
Date: Thu, 24 Oct 2019 09:23:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191022171239.21487-2-david@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC v1 01/12] mm/memory_hotplug: Don't allow
 to online/offline memory blocks with holes
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLzIyLzIwMTkgMTA6NDIgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE91ciBv
bmxpbmluZy9vZmZsaW5pbmcgY29kZSBpcyB1bm5lY2Vzc2FyaWx5IGNvbXBsaWNhdGVkLiBPbmx5
IG1lbW9yeQo+IGJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBjYW4gaGF2ZSBob2xlcy4gSG90cGx1
Z2dlZCBtZW1vcnkgbmV2ZXIgaGFzCj4gaG9sZXMuIFRoYXQgbWVtb3J5IGlzIGFscmVhZHkgb25s
aW5lLgoKV2h5IGhvdCBwbHVnZ2VkIG1lbW9yeSBhdCBydW50aW1lIGNhbm5vdCBoYXZlIGhvbGVz
IChlLmcgYSBzZW1pIGJhZCBESU1NKS4KQ3VycmVudGx5LCBkbyB3ZSBqdXN0IGFib3J0IGFkZGlu
ZyB0aGF0IG1lbW9yeSBibG9jayBpZiB0aGVyZSBhcmUgaG9sZXMgPwoKPiAKPiBXaGVuIHdlIHN0
b3AgYWxsb3dpbmcgdG8gb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHdpdGggaG9sZXMsIHdlIGltcGxp
Y2l0bHkKPiBzdG9wIHRvIG9ubGluZSBtZW1vcnkgYmxvY2tzIHdpdGggaG9sZXMuCgpSZWR1Y2lu
ZyBob3RwbHVnIHN1cHBvcnQgZm9yIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcyBqdXN0IHRvIHNp
bXBsaWZ5CnRoZSBjb2RlLiBJcyBpdCB3b3J0aCA/Cgo+IAo+IFRoaXMgYWxsb3dzIHRvIHNpbXBs
aWZ5IHRoZSBjb2RlLiBGb3IgZXhhbXBsZSwgd2Ugbm8gbG9uZ2VyIGhhdmUgdG8KPiB3b3JyeSBh
Ym91dCBtYXJraW5nIHBhZ2VzIHRoYXQgZmFsbCBpbnRvIG1lbW9yeSBob2xlcyBQR19yZXNlcnZl
ZCB3aGVuCj4gb25saW5pbmcgbWVtb3J5LiBXZSBjYW4gc3RvcCBzZXR0aW5nIHBhZ2VzIFBHX3Jl
c2VydmVkLgoKQ291bGQgbm90IHRoZXJlIGJlIGFueSBvdGhlciB3YXkgb2YgdHJhY2tpbmcgdGhl
c2UgaG9sZXMgaWYgbm90IHRoZSBwYWdlCnJlc2VydmVkIGJpdC4gSW4gdGhlIG1lbW9yeSBzZWN0
aW9uIGl0c2VsZiBhbmQgY29ycmVzcG9uZGluZyBzdHJ1Y3QgcGFnZXMKanVzdCByZW1haW5lZCBw
b2lzb25lZCA/IEp1c3Qgd29uZGVyaW5nLCBtaWdodCBiZSBhbGwgd3JvbmcgaGVyZS4KCj4gCj4g
T2ZmbGluaW5nIG1lbW9yeSBibG9ja3MgYWRkZWQgZHVyaW5nIGJvb3QgaXMgdXN1YWxseSBub3Qg
Z3VyYW50ZWVkIHRvIHdvcmsKPiBlaXRoZXIgd2F5LiBTbyBzdG9wcGluZyB0byBkbyB0aGF0IChp
ZiBhbnlib2R5IHJlYWxseSB1c2VkIGFuZCB0ZXN0ZWQKClRoYXQgZ3VhcmFudGVlIGRvZXMgbm90
IGV4aXN0IHJpZ2h0IG5vdyBiZWNhdXNlIGhvdyBib290IG1lbW9yeSBjb3VsZCBoYXZlCmJlZW4g
dXNlZCBhZnRlciBib290IG5vdCBmcm9tIGEgbGltaXRhdGlvbiBvZiB0aGUgbWVtb3J5IGhvdCBy
ZW1vdmUgaXRzZWxmLgoKPiB0aGlzIG92ZXIgdGhlIHllYXJzKSBzaG91bGQgbm90IHJlYWxseSBo
dXJ0LiBGb3IgdGhlIHVzZSBjYXNlIG9mCj4gb2ZmbGluaW5nIG1lbW9yeSB0byB1bnBsdWcgRElN
TXMsIHdlIHNob3VsZCBzZWUgbm8gY2hhbmdlLiAoaG9sZXMgb24KPiBESU1NcyB3b3VsZCBiZSB3
ZWlyZCkKCkhvbGVzIG9uIERJTU0gY291bGQgYmUgZHVlIHRvIEhXIGVycm9ycyBhZmZlY3Rpbmcg
b25seSBwYXJ0cyBvZiBpdC4gQnkgbm90CmFsbG93aW5nIHN1Y2ggRElNTSdzIGhvdCBhZGQgYW5k
IHJlbW92ZSwgd2UgYXJlIGRlZmluaXRlbHkgcmVkdWNpbmcgdGhlCnNjb3BlIG9mIG92ZXJhbGwg
aG90cGx1ZyBmdW5jdGlvbmFsaXR5LiBJcyBjb2RlIHNpbXBsaWZpY2F0aW9uIGluIGl0c2VsZgpp
cyB3b3J0aCB0aGlzIHJlZHVjdGlvbiBpbiBmdW5jdGlvbmFsaXR5ID8KCj4gCj4gQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8
bWhvY2tvQHN1c2UuY29tPgo+IENjOiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1c2UuZGU+
Cj4gQ2M6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgo+IENjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgbW0vbWVtb3J5X2hv
dHBsdWcuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9t
ZW1vcnlfaG90cGx1Zy5jIGIvbW0vbWVtb3J5X2hvdHBsdWcuYwo+IGluZGV4IDU2MTM3MWVhZDM5
YS4uNzIxMGY0Mzc1Mjc5IDEwMDY0NAo+IC0tLSBhL21tL21lbW9yeV9ob3RwbHVnLmMKPiArKysg
Yi9tbS9tZW1vcnlfaG90cGx1Zy5jCj4gQEAgLTE0NDcsMTAgKzE0NDcsMTkgQEAgc3RhdGljIHZv
aWQgbm9kZV9zdGF0ZXNfY2xlYXJfbm9kZShpbnQgbm9kZSwgc3RydWN0IG1lbW9yeV9ub3RpZnkg
KmFyZykKPiAgCQlub2RlX2NsZWFyX3N0YXRlKG5vZGUsIE5fTUVNT1JZKTsKPiAgfQo+ICAKPiAr
c3RhdGljIGludCBjb3VudF9zeXN0ZW1fcmFtX3BhZ2VzX2NiKHVuc2lnbmVkIGxvbmcgc3RhcnRf
cGZuLAo+ICsJCQkJICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCB2b2lkICpkYXRhKQo+ICt7
Cj4gKwl1bnNpZ25lZCBsb25nICpucl9zeXN0ZW1fcmFtX3BhZ2VzID0gZGF0YTsKPiArCj4gKwkq
bnJfc3lzdGVtX3JhbV9wYWdlcyArPSBucl9wYWdlczsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+
ICBzdGF0aWMgaW50IF9fcmVmIF9fb2ZmbGluZV9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0X3Bm
biwKPiAgCQkgIHVuc2lnbmVkIGxvbmcgZW5kX3BmbikKPiAgewo+IC0JdW5zaWduZWQgbG9uZyBw
Zm4sIG5yX3BhZ2VzOwo+ICsJdW5zaWduZWQgbG9uZyBwZm4sIG5yX3BhZ2VzID0gMDsKPiAgCXVu
c2lnbmVkIGxvbmcgb2ZmbGluZWRfcGFnZXMgPSAwOwo+ICAJaW50IHJldCwgbm9kZSwgbnJfaXNv
bGF0ZV9wYWdlYmxvY2s7Cj4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+IEBAIC0xNDYxLDYgKzE0
NzAsMjAgQEAgc3RhdGljIGludCBfX3JlZiBfX29mZmxpbmVfcGFnZXModW5zaWduZWQgbG9uZyBz
dGFydF9wZm4sCj4gIAo+ICAJbWVtX2hvdHBsdWdfYmVnaW4oKTsKPiAgCj4gKwkvKgo+ICsJICog
V2UgZG9uJ3QgYWxsb3cgdG8gb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoYXQgY29udGFpbiBob2xl
cwo+ICsJICogYW5kIGNvbnNlY3VlbnRseSBkb24ndCBhbGxvdyB0byBvbmxpbmUgbWVtb3J5IGJs
b2NrcyB0aGF0IGNvbnRhaW4KPiArCSAqIGhvbGVzLiBUaGlzIGFsbG93cyB0byBzaW1wbGlmeSB0
aGUgY29kZSBxdWl0ZSBhIGxvdCBhbmQgd2UgZG9uJ3QKPiArCSAqIGhhdmUgdG8gbWVzcyB3aXRo
IFBHX3Jlc2VydmVkIHBhZ2VzIGZvciBtZW1vcnkgaG9sZXMuCj4gKwkgKi8KPiArCXdhbGtfc3lz
dGVtX3JhbV9yYW5nZShzdGFydF9wZm4sIGVuZF9wZm4gLSBzdGFydF9wZm4sICZucl9wYWdlcywK
PiArCQkJICAgICAgY291bnRfc3lzdGVtX3JhbV9wYWdlc19jYik7Cj4gKwlpZiAobnJfcGFnZXMg
IT0gZW5kX3BmbiAtIHN0YXJ0X3Bmbikgewo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gKwkJcmVhc29u
ID0gIm1lbW9yeSBob2xlcyI7Cj4gKwkJZ290byBmYWlsZWRfcmVtb3ZhbDsKPiArCX0KPiArCj4g
IAkvKiBUaGlzIG1ha2VzIGhvdHBsdWcgbXVjaCBlYXNpZXIuLi5hbmQgcmVhZGFibGUuCj4gIAkg
ICB3ZSBhc3N1bWUgdGhpcyBmb3Igbm93LiAuKi8KPiAgCWlmICghdGVzdF9wYWdlc19pbl9hX3pv
bmUoc3RhcnRfcGZuLCBlbmRfcGZuLCAmdmFsaWRfc3RhcnQsCj4gQEAgLTE0NzIsNyArMTQ5NSw2
IEBAIHN0YXRpYyBpbnQgX19yZWYgX19vZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRf
cGZuLAo+ICAKPiAgCXpvbmUgPSBwYWdlX3pvbmUocGZuX3RvX3BhZ2UodmFsaWRfc3RhcnQpKTsK
PiAgCW5vZGUgPSB6b25lX3RvX25pZCh6b25lKTsKPiAtCW5yX3BhZ2VzID0gZW5kX3BmbiAtIHN0
YXJ0X3BmbjsKPiAgCj4gIAkvKiBzZXQgYWJvdmUgcmFuZ2UgYXMgaXNvbGF0ZWQgKi8KPiAgCXJl
dCA9IHN0YXJ0X2lzb2xhdGVfcGFnZV9yYW5nZShzdGFydF9wZm4sIGVuZF9wZm4sCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
