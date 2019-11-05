Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21431F0A0A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:06:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS7qj-0006qC-85; Tue, 05 Nov 2019 23:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iS7qh-0006q7-OO
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:02:55 +0000
X-Inumbo-ID: 65123484-0020-11ea-b678-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65123484-0020-11ea-b678-bc764e2007e4;
 Tue, 05 Nov 2019 23:02:52 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c19so3059885otr.11
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 15:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJnp1WzP7FDNOlX+PPW/uXmMFEEBV08ygb44tlD6toQ=;
 b=r71UU1NF3VCvLrng/dY2UGB8Q9lxizmNC3+RQwXfL+BA+gtvyFkbklNt8G0KmWTyI/
 gY4A3WDBq4+OGqDaUA8w6/JZlXbaFXwNHFgMssB0CicQRm2b3ATAUgnMl37fXYM0ybh0
 i2y88ubkRNwE0lnU8UgrhxLS6tlDGagVtCZ85SLH0zGx8HRr1NwsyRQ8m6k8Nk/g7CAE
 2Nz4suTZOTQTGfFBTfBb43ExGodrmtVOXpVaipIEnH/Vb/f5e+doWkdWW+4BoBYRt4W5
 uILcxXLTtVAw+eWccvxT46RuKzmX+sL0p4DT2Mzbni/aVhvov/FERz4vwE5LUVDjdhbI
 W3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJnp1WzP7FDNOlX+PPW/uXmMFEEBV08ygb44tlD6toQ=;
 b=SsGZQFtCMUBdXL/xuLrWxdFZRJNCpy+jJh8BuzSPXdj1xigmTKiQw5WQik9w9T0E1d
 068/m4gV6nixzATf6LeDvFDbw8vsi9j/0a/0sWzo+E94znQ7PcQXthHS95FV7T3tK2VL
 W9B8+X8Fvz2j94GZjvPfHhdrHZXz8Qezs2Zjkm5/MnumMc64l2f4c7XFbEmn4OE0QL4I
 6RCfUt/uJ/0jVCmyhkP3fnJtpkMpNRzZB/dtRaSAvYRyCvANjNE4Zb2bazZlkaV/fXS6
 uHN5Y8JML43rrlNJIIBx39V/uQCtNuMAlSocRKu86JkHDpL9V1GCfJtYjclPCCXFzjNA
 BydA==
X-Gm-Message-State: APjAAAUNE5nJ+RY4KDSQaaxE/NkBSA//Yh7SBZ8bellYiY/HKB1zFC4p
 Ro3tsvZi3FeBgzSjPr/ulHtmCtTc4vWqxnuhjwu2Kg==
X-Google-Smtp-Source: APXvYqwKvRMYh+ESeeQbTjGztzWIU2GaaX6lax5LzmKoFmyMhxApIqS8cluAsJUsUZJOgqRh+PH603pjKculyAMZPiA=
X-Received: by 2002:a9d:30c8:: with SMTP id r8mr7347703otg.363.1572994971715; 
 Tue, 05 Nov 2019 15:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
In-Reply-To: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:02:40 -0800
Message-ID: <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
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
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMjozMSBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gSSB0aGluayBJIGtub3cgd2hhdCdzIGdvaW5nIHdy
b25nOgo+ID4+Pgo+ID4+PiBQYWdlcyB0aGF0IGFyZSBwaW5uZWQgdmlhIGdmbl90b19wZm4oKSBh
bmQgZnJpZW5kcyB0YWtlIGEgcmVmZXJlbmNlcywKPiA+Pj4gaG93ZXZlciBhcmUgb2Z0ZW4gcmVs
ZWFzZWQgdmlhCj4gPj4+IGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpL2t2bV9yZWxlYXNlX3Bmbl9k
aXJ0eSgpL2t2bV9yZWxlYXNlX3BhZ2VfY2xlYW4oKS4uLgo+ID4+Pgo+ID4+Pgo+ID4+PiBFLmcu
LCBpbiBhcmNoL3g4Ni9rdm0veDg2LmM6cmVleGVjdXRlX2luc3RydWN0aW9uKCkKPiA+Pj4KPiA+
Pj4gLi4uCj4gPj4+IHBmbiA9IGdmbl90b19wZm4odmNwdS0+a3ZtLCBncGFfdG9fZ2ZuKGdwYSkp
Owo+ID4+PiAuLi4KPiA+Pj4ga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKHBmbik7Cj4gPj4+Cj4gPj4+
Cj4gPj4+Cj4gPj4+IHZvaWQga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKGt2bV9wZm5fdCBwZm4pCj4g
Pj4+IHsKPiA+Pj4gICAgIGlmICghaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1faXNf
cmVzZXJ2ZWRfcGZuKHBmbikpCj4gPj4+ICAgICAgICAgICAgIHB1dF9wYWdlKHBmbl90b19wYWdl
KHBmbikpOwo+ID4+PiB9Cj4gPj4+Cj4gPj4+IFRoaXMgZnVuY3Rpb24gbWFrZXMgcGVyZmVjdCBz
ZW5zZSBhcyB0aGUgY291bnRlcnBhcnQgZm9yIGt2bV9nZXRfcGZuKCk6Cj4gPj4+Cj4gPj4+IHZv
aWQga3ZtX2dldF9wZm4oa3ZtX3Bmbl90IHBmbikKPiA+Pj4gewo+ID4+PiAgICAgaWYgKCFrdm1f
aXNfcmVzZXJ2ZWRfcGZuKHBmbikpCj4gPj4+ICAgICAgICAgICAgIGdldF9wYWdlKHBmbl90b19w
YWdlKHBmbikpOwo+ID4+PiB9Cj4gPj4+Cj4gPj4+Cj4gPj4+IEFzIGFsbCBaT05FX0RFVklDRSBw
YWdlcyBhcmUgY3VycmVudGx5IHJlc2VydmVkLCBwYWdlcyBwaW5uZWQgdmlhCj4gPj4+IGdmbl90
b19wZm4oKSBhbmQgZnJpZW5kcyB3aWxsIG9mdGVuIG5vdCBzZWUgYSBwdXRfcGFnZSgpIEFGQUlL
Uy4KPiA+Cj4gPiBBc3N1bWluZyBndXAoKSB0YWtlcyBhIHJlZmVyZW5jZSBmb3IgWk9ORV9ERVZJ
Q0UgcGFnZXMsIHllcywgdGhpcyBpcyBhCj4gPiBLVk0gYnVnLgo+Cj4gWWVzLCBpdCBkb2VzIHRh
a2UgYSByZWZlcmVuY2UgQUZBSUtzLiBFLmcuLAo+Cj4gbW0vZ3VwLmM6Z3VwX3B0ZV9yYW5nZSgp
Ogo+IC4uLgo+ICAgICAgICAgICAgICAgICBpZiAocHRlX2Rldm1hcChwdGUpKSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVSTSkpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHB0ZV91bm1hcDsKPgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHBnbWFwID0gZ2V0X2Rldl9wYWdlbWFwKHB0ZV9wZm4ocHRlKSwg
cGdtYXApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghcGdtYXApKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bmRvX2Rldl9wYWdlbWFwKG5yLCBu
cl9zdGFydCwgcGFnZXMpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBw
dGVfdW5tYXA7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKHB0ZV9zcGVjaWFsKHB0ZSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290
byBwdGVfdW5tYXA7Cj4KPiAgICAgICAgICAgICAgICAgVk1fQlVHX09OKCFwZm5fdmFsaWQocHRl
X3BmbihwdGUpKSk7Cj4gICAgICAgICAgICAgICAgIHBhZ2UgPSBwdGVfcGFnZShwdGUpOwo+Cj4g
ICAgICAgICAgICAgICAgIGhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGFnZSwgMSk7Cj4K
PiB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoKSB3aWxsIGluY3JlbWVudCB0aGUgcmVmZXJlbmNlIGNv
dW50Lgo+Cj4gPgo+ID4+PiBOb3csIG15IHBhdGNoIGRvZXMgbm90IGNoYW5nZSB0aGF0LCB0aGUg
cmVzdWx0IG9mCj4gPj4+IGt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSB3aWxsIGJlIHVuY2hhbmdl
ZC4gQSBwcm9wZXIgZml4IGZvciB0aGF0IHdvdWxkCj4gPj4+IHByb2JhYmx5IGJlCj4gPj4+Cj4g
Pj4+IGEpIFRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0byBaT05FX0RFVklDRSBwYWdlcyBpbiBnZm5f
dG9fcGZuKCkgYW5kCj4gPj4+IGZyaWVuZHMsIGFmdGVyIHlvdSBzdWNjZXNzZnVsbHkgcGlubmVk
IHRoZSBwYWdlcy4gKG5vdCBzdXJlIGlmIHRoYXQncwo+ID4+PiB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8gYnV0IHlvdSdyZSB0aGUgZXhwZXJ0KQo+ID4+Pgo+ID4+PiBiKSBUbyBub3QgdXNlIGt2bV9y
ZWxlYXNlX3Bmbl9jbGVhbigpIGFuZCBmcmllbmRzIG9uIHBhZ2VzIHRoYXQgd2VyZQo+ID4+PiBk
ZWZpbml0ZWx5IHBpbm5lZC4KPiA+Cj4gPiBUaGlzIGlzIGFscmVhZHkgS1ZNJ3MgaW50ZW50LCBp
LmUuIHRoZSBwdXJwb3NlIG9mIHRoZSBQYWdlUmVzZXJ2ZWQoKSBjaGVjawo+ID4gaXMgc2ltcGx5
IHRvIGF2b2lkIHB1dHRpbmcgYSBub24tZXhpc3RlbnQgcmVmZXJlbmNlLiAgVGhlIHByb2JsZW0g
aXMgdGhhdAo+ID4gS1ZNIGFzc3VtZXMgcGFnZXMgd2l0aCBQR19yZXNlcnZlZCBzZXQgYXJlIG5l
dmVyIHBpbm5lZCwgd2hpY2ggQUZBSUNUIHdhcwo+ID4gdHJ1ZSB3aGVuIHRoZSBjb2RlIHdhcyBm
aXJzdCBhZGRlZC4KPiA+Cj4gPj4gKHRhbGtpbmcgdG8gbXlzZWxmLCBzb3JyeSkKPiA+Pgo+ID4+
IFRoaW5raW5nIGFnYWluLCBkcm9wcGluZyB0aGlzIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMgY291
bGQgZWZmZWN0aXZlbHkgYWxzbwo+ID4+IGZpeCB0aGF0IGlzc3VlLiBFLmcuLCBrdm1fcmVsZWFz
ZV9wZm5fY2xlYW4oKSBhbmQgZnJpZW5kcyB3b3VsZCBhbHdheXMgZG8gYQo+ID4+IHB1dF9wYWdl
KCkgaWYgInBmbl92YWxpZCgpIGFuZCAhUGFnZVJlc2VydmVkKCkiLCBzbyBhZnRlciBwYXRjaCA5
IGFsc28gb24KPiA+PiBaT05ERV9ERVZJQ0UgcGFnZXMuCj4gPgo+ID4gWWVhaCwgdGhpcyBhcHBl
YXJzIHRvIGJlIHRoZSBjb3JyZWN0IGZpeC4KPiA+Cj4gPj4gQnV0IGl0IHdvdWxkIGhhdmUgc2lk
ZSBlZmZlY3RzIHRoYXQgbWlnaHQgbm90IGJlIGRlc2lyZWQuIEUuZy4sOgo+ID4+Cj4gPj4gMS4g
a3ZtX3Bmbl90b19wYWdlKCkgd291bGQgYWxzbyByZXR1cm4gWk9ORV9ERVZJQ0UgcGFnZXMgKG1p
Z2h0IGV2ZW4gYmUgdGhlCj4gPj4gcmlnaHQgdGhpbmcgdG8gZG8pLgo+ID4KPiA+IFRoaXMgc2hv
dWxkIGJlIG9rLCBhdCBsZWFzdCBvbiB4ODYuICBUaGVyZSBhcmUgb25seSB0aHJlZSB1c2VycyBv
Zgo+ID4ga3ZtX3Bmbl90b19wYWdlKCkuICBUd28gb2YgdGhvc2UgYXJlIG9uIGFsbG9jYXRpb25z
IHRoYXQgYXJlIGNvbnRyb2xsZWQgYnkKPiA+IEtWTSBhbmQgYXJlIGd1YXJhbnRlZWQgdG8gYmUg
dmFuaWxsYSBNQVBfQU5PTllNT1VTLiAgVGhlIHRoaXJkIGlzIG9uIGd1ZXN0Cj4gPiBtZW1vcnkg
d2hlbiBydW5uaW5nIGEgbmVzdGVkIGd1ZXN0LCBhbmQgaW4gdGhhdCBjYXNlIHN1cHBvcnRpbmcg
Wk9ORV9ERVZJQ0UKPiA+IG1lbW9yeSBpcyBkZXNpcmFibGUsIGkuZS4gS1ZNIHNob3VsZCBwbGF5
IG5pY2Ugd2l0aCBhIGd1ZXN0IHRoYXQgaXMgYmFja2VkCj4gPiBieSBaT05FX0RFVklDRSBtZW1v
cnkuCj4gPgo+ID4+IDIuIGt2bV9zZXRfcGZuX2RpcnR5KCkgd291bGQgYWxzbyBzZXQgWk9ORV9E
RVZJQ0UgcGFnZXMgZGlydHkgKG1pZ2h0IGJlCj4gPj4gb2theSkKPiA+Cj4gPiBUaGlzIGlzIG9r
IGZyb20gYSBLVk0gcGVyc3BlY3RpdmUuCj4KPiBXaGF0IGFib3V0Cj4KPiB2b2lkIGt2bV9nZXRf
cGZuKGt2bV9wZm5fdCBwZm4pCj4gewo+ICAgICAgICAgaWYgKCFrdm1faXNfcmVzZXJ2ZWRfcGZu
KHBmbikpCj4gICAgICAgICAgICAgICAgIGdldF9wYWdlKHBmbl90b19wYWdlKHBmbikpOwo+IH0K
Pgo+IElzIGEgcHVyZSBnZXRfcGFnZSgpIHN1ZmZpY2llbnQgaW4gY2FzZSBvZiBaT05FX0RFVklD
RT8KPiAoYXNraW5nIGJlY2F1c2Ugb2YgdGhlIGxpdmUgcmVmZXJlbmNlcyBvYnRhaW5lZCB2aWEK
PiBnZXRfZGV2X3BhZ2VtYXAocHRlX3BmbihwdGUpLCBwZ21hcCkgaW4gbW0vZ3VwLmM6Z3VwX3B0
ZV9yYW5nZSgpCj4gc29tZXdoYXQgY29uZnVzZSBtZSA6KSApCgpJdCBpcyBub3Qgc3VmZmljaWVu
dC4gUFRFX0RFVk1BUCBpcyB0aGVyZSB0byB0ZWxsIHRoZSBndXAgcGF0aCAiYmUKY2FyZWZ1bCwg
dGhpcyBwZm4gaGFzIGRldmljZS1saWZldGltZSwgbWFrZSBzdXJlIHRoZSBkZXZpY2UgaXMgcGlu
bmVkCmFuZCBub3QgYWN0aXZlbHkgaW4gdGhlIHByb2Nlc3Mgb2YgZHlpbmcgYmVmb3JlIHBpbm5p
bmcgYW55IHBhZ2VzCmFzc29jaWF0ZWQgd2l0aCB0aGlzIGRldmljZSIuCgpIb3dldmVyLCBpZiBr
dm1fZ2V0X3BmbigpIGlzIGhvbm9yaW5nIGt2bV9pc19yZXNlcnZlZF9wZm4oKSB0aGF0CnJldHVy
bnMgdHJ1ZSBmb3IgWk9ORV9ERVZJQ0UsIEknbSBtaXNzaW5nIGhvdyBpdCBpcyBtZXNzaW5nIHVw
IHRoZQpyZWZlcmVuY2UgY291bnRzLgoKPiA+IFRoZSBzY2FyaWVyIGNvZGUgKGZvciBtZSkgaXMg
dHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkgYW5kCj4gPiBrdm1fbW11X3phcF9jb2xsYXBz
aWJsZV9zcHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPiBpbnRlcmFj
dGlvbiBiZXR3ZWVuIFRIUCBhbmQgX1BBR0VfREVWTUFQLgo+Cj4gVGhlIHg4NiBLVk0gTU1VIGNv
ZGUgaXMgb25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUgSSBrbm93IChzb3JyeSwgYnV0IGl0Cj4gaGFk
IHRvIGJlIHNhaWQgOi8gKS4gTHVja2lseSwgdGhpcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2Yg
dGhlCj4gUEdfcmVzZXJ2ZWQgdGhpbmd5IEFGQUlLcy4KCkJvdGggdHJhbnNwYXJlbnRfaHVnZXBh
Z2VfYWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNpYmxlX3NwdGUoKQphcmUgaG9ub3Jp
bmcga3ZtX2lzX3Jlc2VydmVkX3BmbigpLCBzbyBhZ2FpbiBJJ20gbWlzc2luZyB3aGVyZSB0aGUK
cGFnZSBjb3VudCBnZXRzIG1pc21hbmFnZWQgYW5kIGxlYWRzIHRvIHRoZSByZXBvcnRlZCBoYW5n
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
