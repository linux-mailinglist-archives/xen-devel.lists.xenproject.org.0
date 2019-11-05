Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06AF06F4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 21:34:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS5U8-00026m-0K; Tue, 05 Nov 2019 20:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iS5U6-00026h-Gt
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 20:31:26 +0000
X-Inumbo-ID: 3be72192-000b-11ea-9631-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3be72192-000b-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 20:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572985883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBpsVnOm2Iw9vk68TEBuezjUdaQ9ObuSYB51z2SdbAc=;
 b=avVVbuWKuWyvx+yal7SAP6oh+VGhL5N0goZq0Sf+fiZd9aX4ikQ87BpENVB7cXFXahUMKD
 0GYmGYsh9HkkBelHUznw1Njcq98f6em2pgTyWGWK1xvyo8I70rVMzvFQy8y0sGQatcQU9X
 ukeEZENDs3M3Df14i+BpncwZWKuxajw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-zTK-3plmNT2sFf3o-zKI6g-1; Tue, 05 Nov 2019 15:31:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09A18064D1;
 Tue,  5 Nov 2019 20:31:12 +0000 (UTC)
Received: from [10.36.116.98] (ovpn-116-98.ams2.redhat.com [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564CE3CC6;
 Tue,  5 Nov 2019 20:30:54 +0000 (UTC)
To: Sean Christopherson <sean.j.christopherson@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
Date: Tue, 5 Nov 2019 21:30:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105160000.GC8128@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zTK-3plmNT2sFf3o-zKI6g-1
X-Mimecast-Spam-Score: 0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IEkgdGhpbmsgSSBrbm93IHdoYXQncyBnb2luZyB3cm9uZzoKPj4+Cj4+PiBQYWdlcyB0aGF0
IGFyZSBwaW5uZWQgdmlhIGdmbl90b19wZm4oKSBhbmQgZnJpZW5kcyB0YWtlIGEgcmVmZXJlbmNl
cywKPj4+IGhvd2V2ZXIgYXJlIG9mdGVuIHJlbGVhc2VkIHZpYQo+Pj4ga3ZtX3JlbGVhc2VfcGZu
X2NsZWFuKCkva3ZtX3JlbGVhc2VfcGZuX2RpcnR5KCkva3ZtX3JlbGVhc2VfcGFnZV9jbGVhbigp
Li4uCj4+Pgo+Pj4KPj4+IEUuZy4sIGluIGFyY2gveDg2L2t2bS94ODYuYzpyZWV4ZWN1dGVfaW5z
dHJ1Y3Rpb24oKQo+Pj4KPj4+IC4uLgo+Pj4gcGZuID0gZ2ZuX3RvX3Bmbih2Y3B1LT5rdm0sIGdw
YV90b19nZm4oZ3BhKSk7Cj4+PiAuLi4KPj4+IGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihwZm4pOwo+
Pj4KPj4+Cj4+Pgo+Pj4gdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oa3ZtX3Bmbl90IHBmbikK
Pj4+IHsKPj4+IAlpZiAoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3ZtX2lzX3Jlc2Vy
dmVkX3BmbihwZm4pKQo+Pj4gCQlwdXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKPj4+IH0KPj4+
Cj4+PiBUaGlzIGZ1bmN0aW9uIG1ha2VzIHBlcmZlY3Qgc2Vuc2UgYXMgdGhlIGNvdW50ZXJwYXJ0
IGZvciBrdm1fZ2V0X3BmbigpOgo+Pj4KPj4+IHZvaWQga3ZtX2dldF9wZm4oa3ZtX3Bmbl90IHBm
bikKPj4+IHsKPj4+IAlpZiAoIWt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSkKPj4+IAkJZ2V0X3Bh
Z2UocGZuX3RvX3BhZ2UocGZuKSk7Cj4+PiB9Cj4+Pgo+Pj4KPj4+IEFzIGFsbCBaT05FX0RFVklD
RSBwYWdlcyBhcmUgY3VycmVudGx5IHJlc2VydmVkLCBwYWdlcyBwaW5uZWQgdmlhCj4+PiBnZm5f
dG9fcGZuKCkgYW5kIGZyaWVuZHMgd2lsbCBvZnRlbiBub3Qgc2VlIGEgcHV0X3BhZ2UoKSBBRkFJ
S1MuCj4gCj4gQXNzdW1pbmcgZ3VwKCkgdGFrZXMgYSByZWZlcmVuY2UgZm9yIFpPTkVfREVWSUNF
IHBhZ2VzLCB5ZXMsIHRoaXMgaXMgYQo+IEtWTSBidWcuCgpZZXMsIGl0IGRvZXMgdGFrZSBhIHJl
ZmVyZW5jZSBBRkFJS3MuIEUuZy4sCgptbS9ndXAuYzpndXBfcHRlX3JhbmdlKCk6Ci4uLgoJCWlm
IChwdGVfZGV2bWFwKHB0ZSkpIHsKCQkJaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVS
TSkpCgkJCQlnb3RvIHB0ZV91bm1hcDsKCgkJCXBnbWFwID0gZ2V0X2Rldl9wYWdlbWFwKHB0ZV9w
Zm4ocHRlKSwgcGdtYXApOwoJCQlpZiAodW5saWtlbHkoIXBnbWFwKSkgewoJCQkJdW5kb19kZXZf
cGFnZW1hcChuciwgbnJfc3RhcnQsIHBhZ2VzKTsKCQkJCWdvdG8gcHRlX3VubWFwOwoJCQl9CgkJ
fSBlbHNlIGlmIChwdGVfc3BlY2lhbChwdGUpKQoJCQlnb3RvIHB0ZV91bm1hcDsKCgkJVk1fQlVH
X09OKCFwZm5fdmFsaWQocHRlX3BmbihwdGUpKSk7CgkJcGFnZSA9IHB0ZV9wYWdlKHB0ZSk7CgoJ
CWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGFnZSwgMSk7Cgp0cnlfZ2V0X2NvbXBvdW5k
X2hlYWQoKSB3aWxsIGluY3JlbWVudCB0aGUgcmVmZXJlbmNlIGNvdW50LgoKPiAKPj4+IE5vdywg
bXkgcGF0Y2ggZG9lcyBub3QgY2hhbmdlIHRoYXQsIHRoZSByZXN1bHQgb2YKPj4+IGt2bV9pc19y
ZXNlcnZlZF9wZm4ocGZuKSB3aWxsIGJlIHVuY2hhbmdlZC4gQSBwcm9wZXIgZml4IGZvciB0aGF0
IHdvdWxkCj4+PiBwcm9iYWJseSBiZQo+Pj4KPj4+IGEpIFRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0
byBaT05FX0RFVklDRSBwYWdlcyBpbiBnZm5fdG9fcGZuKCkgYW5kCj4+PiBmcmllbmRzLCBhZnRl
ciB5b3Ugc3VjY2Vzc2Z1bGx5IHBpbm5lZCB0aGUgcGFnZXMuIChub3Qgc3VyZSBpZiB0aGF0J3MK
Pj4+IHRoZSByaWdodCB0aGluZyB0byBkbyBidXQgeW91J3JlIHRoZSBleHBlcnQpCj4+Pgo+Pj4g
YikgVG8gbm90IHVzZSBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oKSBhbmQgZnJpZW5kcyBvbiBwYWdl
cyB0aGF0IHdlcmUKPj4+IGRlZmluaXRlbHkgcGlubmVkLgo+IAo+IFRoaXMgaXMgYWxyZWFkeSBL
Vk0ncyBpbnRlbnQsIGkuZS4gdGhlIHB1cnBvc2Ugb2YgdGhlIFBhZ2VSZXNlcnZlZCgpIGNoZWNr
Cj4gaXMgc2ltcGx5IHRvIGF2b2lkIHB1dHRpbmcgYSBub24tZXhpc3RlbnQgcmVmZXJlbmNlLiAg
VGhlIHByb2JsZW0gaXMgdGhhdAo+IEtWTSBhc3N1bWVzIHBhZ2VzIHdpdGggUEdfcmVzZXJ2ZWQg
c2V0IGFyZSBuZXZlciBwaW5uZWQsIHdoaWNoIEFGQUlDVCB3YXMKPiB0cnVlIHdoZW4gdGhlIGNv
ZGUgd2FzIGZpcnN0IGFkZGVkLgo+IAo+PiAodGFsa2luZyB0byBteXNlbGYsIHNvcnJ5KQo+Pgo+
PiBUaGlua2luZyBhZ2FpbiwgZHJvcHBpbmcgdGhpcyBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzIGNv
dWxkIGVmZmVjdGl2ZWx5IGFsc28KPj4gZml4IHRoYXQgaXNzdWUuIEUuZy4sIGt2bV9yZWxlYXNl
X3Bmbl9jbGVhbigpIGFuZCBmcmllbmRzIHdvdWxkIGFsd2F5cyBkbyBhCj4+IHB1dF9wYWdlKCkg
aWYgInBmbl92YWxpZCgpIGFuZCAhUGFnZVJlc2VydmVkKCkiLCBzbyBhZnRlciBwYXRjaCA5IGFs
c28gb24KPj4gWk9OREVfREVWSUNFIHBhZ2VzLgo+IAo+IFllYWgsIHRoaXMgYXBwZWFycyB0byBi
ZSB0aGUgY29ycmVjdCBmaXguCj4gCj4+IEJ1dCBpdCB3b3VsZCBoYXZlIHNpZGUgZWZmZWN0cyB0
aGF0IG1pZ2h0IG5vdCBiZSBkZXNpcmVkLiBFLmcuLDoKPj4KPj4gMS4ga3ZtX3Bmbl90b19wYWdl
KCkgd291bGQgYWxzbyByZXR1cm4gWk9ORV9ERVZJQ0UgcGFnZXMgKG1pZ2h0IGV2ZW4gYmUgdGhl
Cj4+IHJpZ2h0IHRoaW5nIHRvIGRvKS4KPiAKPiBUaGlzIHNob3VsZCBiZSBvaywgYXQgbGVhc3Qg
b24geDg2LiAgVGhlcmUgYXJlIG9ubHkgdGhyZWUgdXNlcnMgb2YKPiBrdm1fcGZuX3RvX3BhZ2Uo
KS4gIFR3byBvZiB0aG9zZSBhcmUgb24gYWxsb2NhdGlvbnMgdGhhdCBhcmUgY29udHJvbGxlZCBi
eQo+IEtWTSBhbmQgYXJlIGd1YXJhbnRlZWQgdG8gYmUgdmFuaWxsYSBNQVBfQU5PTllNT1VTLiAg
VGhlIHRoaXJkIGlzIG9uIGd1ZXN0Cj4gbWVtb3J5IHdoZW4gcnVubmluZyBhIG5lc3RlZCBndWVz
dCwgYW5kIGluIHRoYXQgY2FzZSBzdXBwb3J0aW5nIFpPTkVfREVWSUNFCj4gbWVtb3J5IGlzIGRl
c2lyYWJsZSwgaS5lLiBLVk0gc2hvdWxkIHBsYXkgbmljZSB3aXRoIGEgZ3Vlc3QgdGhhdCBpcyBi
YWNrZWQKPiBieSBaT05FX0RFVklDRSBtZW1vcnkuCj4gCj4+IDIuIGt2bV9zZXRfcGZuX2RpcnR5
KCkgd291bGQgYWxzbyBzZXQgWk9ORV9ERVZJQ0UgcGFnZXMgZGlydHkgKG1pZ2h0IGJlCj4+IG9r
YXkpCj4gCj4gVGhpcyBpcyBvayBmcm9tIGEgS1ZNIHBlcnNwZWN0aXZlLgoKV2hhdCBhYm91dAoK
dm9pZCBrdm1fZ2V0X3Bmbihrdm1fcGZuX3QgcGZuKQp7CglpZiAoIWt2bV9pc19yZXNlcnZlZF9w
Zm4ocGZuKSkKCQlnZXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKfQoKSXMgYSBwdXJlIGdldF9w
YWdlKCkgc3VmZmljaWVudCBpbiBjYXNlIG9mIFpPTkVfREVWSUNFPwooYXNraW5nIGJlY2F1c2Ug
b2YgdGhlIGxpdmUgcmVmZXJlbmNlcyBvYnRhaW5lZCB2aWEgCmdldF9kZXZfcGFnZW1hcChwdGVf
cGZuKHB0ZSksIHBnbWFwKSBpbiBtbS9ndXAuYzpndXBfcHRlX3JhbmdlKCkgCnNvbWV3aGF0IGNv
bmZ1c2UgbWUgOikgKQoKCj4gCj4gVGhlIHNjYXJpZXIgY29kZSAoZm9yIG1lKSBpcyB0cmFuc3Bh
cmVudF9odWdlcGFnZV9hZGp1c3QoKSBhbmQKPiBrdm1fbW11X3phcF9jb2xsYXBzaWJsZV9zcHRl
KCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gaW50ZXJhY3Rpb24gYmV0d2Vl
biBUSFAgYW5kIF9QQUdFX0RFVk1BUC4KClRoZSB4ODYgS1ZNIE1NVSBjb2RlIGlzIG9uZSBvZiB0
aGUgdWdsaWVzdCBjb2RlIEkga25vdyAoc29ycnksIGJ1dCBpdCAKaGFkIHRvIGJlIHNhaWQgOi8g
KS4gTHVja2lseSwgdGhpcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgdGhlIApQR19yZXNlcnZl
ZCB0aGluZ3kgQUZBSUtzLgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
