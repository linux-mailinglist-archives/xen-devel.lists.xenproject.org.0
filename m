Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE54BF412C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 08:18:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSyUV-0003sP-1L; Fri, 08 Nov 2019 07:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GOmL=ZA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iSyUU-0003sJ-1A
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 07:15:30 +0000
X-Inumbo-ID: 8a482d34-01f7-11ea-9631-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8a482d34-01f7-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573197327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PenExAfVRFXeBme8mP2F3ZJCJQhOeL0zIxQnZAXCsUI=;
 b=WyKjvmaQi0DWrmJoptM/3/AQBbRc2jRhq+jm93Pkzy6H7WLGUmztSEVd3NS7cvqCl6olVK
 VI019Z4UVpBZ7MS/j7ssStWFTEMAsSAfiyovg+zPQBfLCi0iTdvmNWrPagXaVxvAatU5UJ
 VTcsDdgNhUpEXnt1YToYf1oZk243qyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-RVLOufnuOY2lPex8TZ9HIg-1; Fri, 08 Nov 2019 02:15:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864E1800C72;
 Fri,  8 Nov 2019 07:15:18 +0000 (UTC)
Received: from [10.36.116.108] (ovpn-116-108.ams2.redhat.com [10.36.116.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDC1A5DA70;
 Fri,  8 Nov 2019 07:14:57 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
Date: Fri, 8 Nov 2019 08:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: RVLOufnuOY2lPex8TZ9HIg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH v1 04/10] vfio/type1: Prepare
 is_invalid_reserved_pfn() for PG_reserved changes
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
 Alexander Duyck <alexander.duyck@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 David Hildenbrand <dhildenb@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMTkgMDY6MDksIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUaHUsIE5vdiA3LCAy
MDE5IGF0IDI6MDcgUE0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAwNy4xMS4xOSAxOToyMiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pgo+
Pj4KPj4+PiBBbSAwNy4xMS4yMDE5IHVtIDE2OjQwIHNjaHJpZWIgRGFuIFdpbGxpYW1zIDxkYW4u
ai53aWxsaWFtc0BpbnRlbC5jb20+Ogo+Pj4+Cj4+Pj4g77u/T24gVGh1LCBPY3QgMjQsIDIwMTkg
YXQgNToxMiBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
Pj4+Cj4+Pj4+IFJpZ2h0IG5vdywgWk9ORV9ERVZJQ0UgbWVtb3J5IGlzIGFsd2F5cyBzZXQgUEdf
cmVzZXJ2ZWQuIFdlIHdhbnQgdG8KPj4+Pj4gY2hhbmdlIHRoYXQuCj4+Pj4+Cj4+Pj4+IEtWTSBo
YXMgdGhpcyB3ZWlyZCB1c2UgY2FzZSB0aGF0IHlvdSBjYW4gbWFwIGFueXRoaW5nIGZyb20gL2Rl
di9tZW0KPj4+Pj4gaW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxl
IGNoZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+Pj4+PiB3YXMgaW5pdGlhbGl6ZWQgYW5kIGNhbiBi
ZSB0b3VjaGVkLiBwZm5fdG9fb25saW5lX3BhZ2UoKSBtYWtlcyBzdXJlCj4+Pj4+IHRoYXQgd2Ug
aGF2ZSBhbiBpbml0aWFsaXplZCBtZW1tYXAgKGFuZCBkb24ndCBoYXZlIFpPTkVfREVWSUNFIG1l
bW9yeSkuCj4+Pj4+Cj4+Pj4+IFJld3JpdGUgaXNfaW52YWxpZF9yZXNlcnZlZF9wZm4oKSBzaW1p
bGFyIHRvIGt2bV9pc19yZXNlcnZlZF9wZm4oKSB0byBtYWtlCj4+Pj4+IHN1cmUgdGhlIGZ1bmN0
aW9uIHByb2R1Y2VzIHRoZSBzYW1lIHJlc3VsdCBvbmNlIHdlIHN0b3Agc2V0dGluZyBaT05FX0RF
VklDRQo+Pj4+PiBwYWdlcyBQR19yZXNlcnZlZC4KPj4+Pj4KPj4+Pj4gQ2M6IEFsZXggV2lsbGlh
bXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+Cj4+Pj4+IENjOiBDb3JuZWxpYSBIdWNr
IDxjb2h1Y2tAcmVkaGF0LmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJh
bmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBkcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jIHwgMTAgKysrKysrKystLQo+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUx
LmMKPj4+Pj4gaW5kZXggMmFkYThlNmNkYjg4Li5mOGNlOGM0MDhiYTggMTAwNjQ0Cj4+Pj4+IC0t
LSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPj4+Pj4gKysrIGIvZHJpdmVycy92
ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+Pj4+PiBAQCAtMjk5LDkgKzI5OSwxNSBAQCBzdGF0aWMg
aW50IHZmaW9fbG9ja19hY2N0KHN0cnVjdCB2ZmlvX2RtYSAqZG1hLCBsb25nIG5wYWdlLCBib29s
IGFzeW5jKQo+Pj4+PiAgICAqLwo+Pj4+PiBzdGF0aWMgYm9vbCBpc19pbnZhbGlkX3Jlc2VydmVk
X3Bmbih1bnNpZ25lZCBsb25nIHBmbikKPj4+Pj4gewo+Pj4+PiAtICAgICAgIGlmIChwZm5fdmFs
aWQocGZuKSkKPj4+Pj4gLSAgICAgICAgICAgICAgIHJldHVybiBQYWdlUmVzZXJ2ZWQocGZuX3Rv
X3BhZ2UocGZuKSk7Cj4+Pj4+ICsgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fb25s
aW5lX3BhZ2UocGZuKTsKPj4+Pgo+Pj4+IFVnaCwgSSBqdXN0IHJlYWxpemVkIHRoaXMgaXMgbm90
IGEgc2FmZSBjb252ZXJzaW9uIHVudGlsCj4+Pj4gcGZuX3RvX29ubGluZV9wYWdlKCkgaXMgbW92
ZWQgb3ZlciB0byBzdWJzZWN0aW9uIGdyYW51bGFyaXR5LiBBcyBpdAo+Pj4+IHN0YW5kcyBpdCB3
aWxsIHJldHVybiB0cnVlIGZvciBhbnkgWk9ORV9ERVZJQ0UgcGFnZXMgdGhhdCBzaGFyZSBhCj4+
Pj4gc2VjdGlvbiB3aXRoIGJvb3QgbWVtb3J5Lgo+Pj4KPj4+IFRoYXQgc2hvdWxkIG5vdCBoYXBw
ZW4gcmlnaHQgbm93IGFuZCBJIGNvbW1lbnRlZCBiYWNrIHdoZW4geW91IGludHJvZHVjZWQgc3Vi
c2VjdGlvbiBzdXBwb3J0IHRoYXQgSSBkb27igJl0IHdhbnQgdG8gaGF2ZSBaT05FX0RFVklDRSBt
aXhlZCB3aXRoIG9ubGluZSBwYWdlcyBpbiBhIHNlY3Rpb24uIEhhdmluZyBtZW1vcnkgYmxvY2sg
ZGV2aWNlcyB0aGF0IHBhcnRpYWxseSBzcGFuIFpPTkVfREVWSUNFIHdvdWxkIGJlIC4uLiByZWFs
bHkgd2VpcmQuIFdpdGggc29tZXRoaW5nIGxpa2UgcGZuX2FjdGl2ZSgpIC0gYXMgZGlzY3Vzc2Vk
IC0gd2UgY291bGQgYXQgbGVhc3QgbWFrZSB0aGlzIGNoZWNrIHdvcmsgLSBidXQgSSBhbSBub3Qg
c3VyZSBpZiB3ZSByZWFsbHkgd2FudCB0byBnbyBkb3duIHRoYXQgcGF0aC4gSW4gdGhlIHdvcnN0
IGNhc2UsIHNvbWUgTUIgb2YgUkFNIGFyZSBsb3N0IC4uLiBJIGd1ZXNzIHRoaXMgbmVlZHMgbW9y
ZSB0aG91Z2h0Lgo+Pj4KPj4KPj4gSSBqdXN0IHJlYWxpemVkIHRoZSAiYm9vdCBtZW1vcnkiIHBh
cnQuIElzIHRoYXQgYSByZWFsIHRoaW5nPyBJT1csIGNhbgo+PiB3ZSBoYXZlIFpPTkVfREVWSUNF
IGZhbGxpbmcgaW50byBhIG1lbW9yeSBibG9jayAod2l0aCBob2xlcyk/IEkgc29tZXdoYXQKPj4g
aGF2ZSBkb3VidHMgdGhhdCB0aGlzIHdvdWxkIHdvcmsgLi4uCj4gCj4gT25lIG9mIHRoZSByZWFs
IHdvcmxkIGZhaWx1cmUgY2FzZXMgdGhhdCBzdGFydGVkIHRoZSBzdWJzZWN0aW9uIGVmZmVjdAo+
IGlzIHRoYXQgUGVyc2lzdGVudCBNZW1vcnkgY29sbGlkZXMgd2l0aCBTeXN0ZW0gUkFNIG9uIGEg
NjRNQiBib3VuZGFyeQo+IG9uIHNoaXBwaW5nIHBsYXRmb3Jtcy4gU3lzdGVtIFJBTSBlbmRzIG9u
IGEgNjRNQiBib3VuZGFyeSBhbmQgZHVlIHRvIGEKPiBsYWNrIG9mIG1lbW9yeSBjb250cm9sbGVy
IHJlc291cmNlcyBQTUVNIGlzIG1hcHBlZCBjb250aWd1b3VzbHkgYXQgdGhlCj4gZW5kIG9mIHRo
YXQgYm91bmRhcnkuIFNvbWUgbW9yZSBkZXRhaWxzIGluIHRoZSBzdWJzZWN0aW9uIGNvdmVyIGxl
dHRlcgo+IC8gY2hhbmdlbG9ncyBbMV0gWzJdLiBJdCdzIG5vdCBzdWZmaWNpZW50IHRvIGp1c3Qg
bG9zZSBzb21lIG1lbW9yeSwKPiB0aGF0J3MgdGhlIGJyb2tlbiBpbXBsZW1lbnRhdGlvbiB0aGF0
IGxlYWQgdG8gdGhlIHN1YnNlY3Rpb24gd29yawo+IGJlY2F1c2UgdGhlIGxvc3QgbWVtb3J5IG1h
eSBjaGFuZ2UgZnJvbSBvbmUgYm9vdCB0byB0aGUgbmV4dCBhbmQKPiBzb2Z0d2FyZSBjYW4ndCBy
ZWxpYWJseSBpbmplY3QgYSBwYWRkaW5nIHRoYXQgY29uZm9ybXMgdG8gdGhlIHg4Ngo+IDEyOE1C
IHNlY3Rpb24gY29uc3RyYWludC4KClRoYW5rcywgSSB0aG91Z2h0IGl0IHdhcyBtb3N0bHkgZm9y
IHdlaXJkIGFsaWdubWVudCB3aGVyZSBvdGhlciBwYXJ0cyBvZiAKdGhlIHNlY3Rpb24gYXJlIGJh
c2ljYWxseSAiaG9sZXMiIGFuZCBub3QgbWVtb3J5LgoKWWVzLCBpdCBpcyBhIHJlYWwgYnVnIHRo
YXQgWk9ORV9ERVZJQ0UgcGFnZXMgZmFsbCBpbnRvIHNlY3Rpb25zIHRoYXQgYXJlIAptYXJrZWQg
U0VDVElPTl9JU19PTkxJTkUuCgo+IAo+IFN1ZmZpY2UgdG8gc2F5IEkgdGhpbmsgd2UgbmVlZCB5
b3VyIHBmbl9hY3RpdmUoKSB0byBnZXQgc3Vic2VjdGlvbgo+IGdyYW51bGFyaXR5IHBmbl90b19v
bmxpbmVfcGFnZSgpIGJlZm9yZSBQYWdlUmVzZXJ2ZWQoKSBjYW4gYmUgcmVtb3ZlZC4KCkkgYWdy
ZWUgdGhhdCB3ZSBoYXZlIHRvIGZpeCB0aGlzLiBJIGRvbid0IGxpa2UgWk9ORV9ERVZJQ0UgcGFn
ZXMgZmFsbGluZyAKaW50byBtZW1vcnkgZGV2aWNlIGJsb2NrcyAoZS5nLiwgY2Fubm90IGdldCBv
ZmZsaW5lZCksIGJ1dCBJIGd1ZXNzIHRoYXQgCnRyYWluIGlzIGdvbmUgOikgQXMgbG9uZyBhcyBp
dCdzIG5vdCBmb3IgbWVtb3J5IGhvdHBsdWcsIEkgY2FuIG1vc3QgCnByb2JhYmx5IGxpdmUgd2l0
aCB0aGlzLgoKQWxzbywgSSdkIGxpa2UgdG8gZ2V0IE1pY2hhbHMgb3BpbmlvbiBvbiB0aGlzIGFu
ZCB0aGUgcGZuX2FjdGl2ZSgpIAphcHByb2FjaCwgYnV0IEkgY2FuIHVuZGVyc3RhbmQgaGUncyBi
dXN5LgoKVGhpcyBwYXRjaCBzZXQgY2FuIHdhaXQsIEkgd29uJ3QgYmUgd29ya2luZyBuZXh0IHdl
ZWsgYmVzaWRlcyAKcmVhZGluZy93cml0aW5nIG1haWxzIGVpdGhlciB3YXkuCgpJcyBhbnlib2R5
IGxvb2tpbmcgaW50byB0aGUgcGZuX2FjdGl2ZSgpIHRoaW5neT8KCj4gCj4gWzFdOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8xNTYwOTIzNDkzMDAuOTc5OTU5LjE3NjAzNzEwNzEx
OTU3NzM1MTM1LnN0Z2l0QGR3aWxsaWEyLWRlc2szLmFtci5jb3JwLmludGVsLmNvbS8KPiBbMl06
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzE1NjA5MjM1NDM2OC45Nzk5NTkuNjIz
MjQ0MzkyMzQ0MDk1MjM1OS5zdGdpdEBkd2lsbGlhMi1kZXNrMy5hbXIuY29ycC5pbnRlbC5jb20v
Cj4gCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
