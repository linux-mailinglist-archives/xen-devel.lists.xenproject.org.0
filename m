Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E778F4473
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:26:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1PG-0003qA-GC; Fri, 08 Nov 2019 10:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GOmL=ZA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iT1PE-0003py-Nd
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:22:16 +0000
X-Inumbo-ID: a1038f9a-0211-11ea-984a-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a1038f9a-0211-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573208532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8c0VTRmCawSF5K7eSuvn9Mi8pTr7P/+JcoJZ1YT/zIE=;
 b=Ea/1wKF2XjN6l7PmuGSmTug+cTr79bxnNS7M69vfh5fv+ec2rHGMPyJnoJKtSFdAIW+jTN
 2KOjhLyvxqyq9xz1KdjmZDV1PjfSLd7FRhMQQuDh1H0h2vVHWY3EpoUzhdlU8V/fJZ8LDJ
 1+CW59G2G11h/QH38+Z57IV8xFXCJPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-zKa64Xy6OHuvUiIRCqevXA-1; Fri, 08 Nov 2019 05:22:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B93B477;
 Fri,  8 Nov 2019 10:22:03 +0000 (UTC)
Received: from [10.36.118.2] (unknown [10.36.118.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66C0B60F8B;
 Fri,  8 Nov 2019 10:21:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
 <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
Organization: Red Hat GmbH
Message-ID: <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
Date: Fri, 8 Nov 2019 11:21:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zKa64Xy6OHuvUiIRCqevXA-1
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
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMTkgMDg6MTQsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDA4LjExLjE5
IDA2OjA5LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4+IE9uIFRodSwgTm92IDcsIDIwMTkgYXQgMjow
NyBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4g
T24gMDcuMTEuMTkgMTk6MjIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+
Pj4gQW0gMDcuMTEuMjAxOSB1bSAxNjo0MCBzY2hyaWViIERhbiBXaWxsaWFtcyA8ZGFuLmoud2ls
bGlhbXNAaW50ZWwuY29tPjoKPj4+Pj4KPj4+Pj4g77u/T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQg
NToxMiBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4+
Pgo+Pj4+Pj4gUmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19y
ZXNlcnZlZC4gV2Ugd2FudCB0bwo+Pj4+Pj4gY2hhbmdlIHRoYXQuCj4+Pj4+Pgo+Pj4+Pj4gS1ZN
IGhhcyB0aGlzIHdlaXJkIHVzZSBjYXNlIHRoYXQgeW91IGNhbiBtYXAgYW55dGhpbmcgZnJvbSAv
ZGV2L21lbQo+Pj4+Pj4gaW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlh
YmxlIGNoZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+Pj4+Pj4gd2FzIGluaXRpYWxpemVkIGFuZCBj
YW4gYmUgdG91Y2hlZC4gcGZuX3RvX29ubGluZV9wYWdlKCkgbWFrZXMgc3VyZQo+Pj4+Pj4gdGhh
dCB3ZSBoYXZlIGFuIGluaXRpYWxpemVkIG1lbW1hcCAoYW5kIGRvbid0IGhhdmUgWk9ORV9ERVZJ
Q0UgbWVtb3J5KS4KPj4+Pj4+Cj4+Pj4+PiBSZXdyaXRlIGlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZu
KCkgc2ltaWxhciB0byBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZQo+Pj4+Pj4gc3VyZSB0
aGUgZnVuY3Rpb24gcHJvZHVjZXMgdGhlIHNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0aW5n
IFpPTkVfREVWSUNFCj4+Pj4+PiBwYWdlcyBQR19yZXNlcnZlZC4KPj4+Pj4+Cj4+Pj4+PiBDYzog
QWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPj4+Pj4+IENjOiBD
b3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBkcml2
ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgMTAgKysrKysrKystLQo+Pj4+Pj4gMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZp
by92ZmlvX2lvbW11X3R5cGUxLmMKPj4+Pj4+IGluZGV4IDJhZGE4ZTZjZGI4OC4uZjhjZThjNDA4
YmE4IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+
Pj4+Pj4gKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+Pj4+Pj4gQEAgLTI5
OSw5ICsyOTksMTUgQEAgc3RhdGljIGludCB2ZmlvX2xvY2tfYWNjdChzdHJ1Y3QgdmZpb19kbWEg
KmRtYSwgbG9uZyBucGFnZSwgYm9vbCBhc3luYykKPj4+Pj4+ICAgICAqLwo+Pj4+Pj4gc3RhdGlj
IGJvb2wgaXNfaW52YWxpZF9yZXNlcnZlZF9wZm4odW5zaWduZWQgbG9uZyBwZm4pCj4+Pj4+PiB7
Cj4+Pj4+PiAtICAgICAgIGlmIChwZm5fdmFsaWQocGZuKSkKPj4+Pj4+IC0gICAgICAgICAgICAg
ICByZXR1cm4gUGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHBmbikpOwo+Pj4+Pj4gKyAgICAgICBz
dHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwo+Pj4+Pgo+Pj4+PiBV
Z2gsIEkganVzdCByZWFsaXplZCB0aGlzIGlzIG5vdCBhIHNhZmUgY29udmVyc2lvbiB1bnRpbAo+
Pj4+PiBwZm5fdG9fb25saW5lX3BhZ2UoKSBpcyBtb3ZlZCBvdmVyIHRvIHN1YnNlY3Rpb24gZ3Jh
bnVsYXJpdHkuIEFzIGl0Cj4+Pj4+IHN0YW5kcyBpdCB3aWxsIHJldHVybiB0cnVlIGZvciBhbnkg
Wk9ORV9ERVZJQ0UgcGFnZXMgdGhhdCBzaGFyZSBhCj4+Pj4+IHNlY3Rpb24gd2l0aCBib290IG1l
bW9yeS4KPj4+Pgo+Pj4+IFRoYXQgc2hvdWxkIG5vdCBoYXBwZW4gcmlnaHQgbm93IGFuZCBJIGNv
bW1lbnRlZCBiYWNrIHdoZW4geW91IGludHJvZHVjZWQgc3Vic2VjdGlvbiBzdXBwb3J0IHRoYXQg
SSBkb27igJl0IHdhbnQgdG8gaGF2ZSBaT05FX0RFVklDRSBtaXhlZCB3aXRoIG9ubGluZSBwYWdl
cyBpbiBhIHNlY3Rpb24uIEhhdmluZyBtZW1vcnkgYmxvY2sgZGV2aWNlcyB0aGF0IHBhcnRpYWxs
eSBzcGFuIFpPTkVfREVWSUNFIHdvdWxkIGJlIC4uLiByZWFsbHkgd2VpcmQuIFdpdGggc29tZXRo
aW5nIGxpa2UgcGZuX2FjdGl2ZSgpIC0gYXMgZGlzY3Vzc2VkIC0gd2UgY291bGQgYXQgbGVhc3Qg
bWFrZSB0aGlzIGNoZWNrIHdvcmsgLSBidXQgSSBhbSBub3Qgc3VyZSBpZiB3ZSByZWFsbHkgd2Fu
dCB0byBnbyBkb3duIHRoYXQgcGF0aC4gSW4gdGhlIHdvcnN0IGNhc2UsIHNvbWUgTUIgb2YgUkFN
IGFyZSBsb3N0IC4uLiBJIGd1ZXNzIHRoaXMgbmVlZHMgbW9yZSB0aG91Z2h0Lgo+Pj4+Cj4+Pgo+
Pj4gSSBqdXN0IHJlYWxpemVkIHRoZSAiYm9vdCBtZW1vcnkiIHBhcnQuIElzIHRoYXQgYSByZWFs
IHRoaW5nPyBJT1csIGNhbgo+Pj4gd2UgaGF2ZSBaT05FX0RFVklDRSBmYWxsaW5nIGludG8gYSBt
ZW1vcnkgYmxvY2sgKHdpdGggaG9sZXMpPyBJIHNvbWV3aGF0Cj4+PiBoYXZlIGRvdWJ0cyB0aGF0
IHRoaXMgd291bGQgd29yayAuLi4KPj4KPj4gT25lIG9mIHRoZSByZWFsIHdvcmxkIGZhaWx1cmUg
Y2FzZXMgdGhhdCBzdGFydGVkIHRoZSBzdWJzZWN0aW9uIGVmZmVjdAo+PiBpcyB0aGF0IFBlcnNp
c3RlbnQgTWVtb3J5IGNvbGxpZGVzIHdpdGggU3lzdGVtIFJBTSBvbiBhIDY0TUIgYm91bmRhcnkK
Pj4gb24gc2hpcHBpbmcgcGxhdGZvcm1zLiBTeXN0ZW0gUkFNIGVuZHMgb24gYSA2NE1CIGJvdW5k
YXJ5IGFuZCBkdWUgdG8gYQo+PiBsYWNrIG9mIG1lbW9yeSBjb250cm9sbGVyIHJlc291cmNlcyBQ
TUVNIGlzIG1hcHBlZCBjb250aWd1b3VzbHkgYXQgdGhlCj4+IGVuZCBvZiB0aGF0IGJvdW5kYXJ5
LiBTb21lIG1vcmUgZGV0YWlscyBpbiB0aGUgc3Vic2VjdGlvbiBjb3ZlciBsZXR0ZXIKPj4gLyBj
aGFuZ2Vsb2dzIFsxXSBbMl0uIEl0J3Mgbm90IHN1ZmZpY2llbnQgdG8ganVzdCBsb3NlIHNvbWUg
bWVtb3J5LAo+PiB0aGF0J3MgdGhlIGJyb2tlbiBpbXBsZW1lbnRhdGlvbiB0aGF0IGxlYWQgdG8g
dGhlIHN1YnNlY3Rpb24gd29yawo+PiBiZWNhdXNlIHRoZSBsb3N0IG1lbW9yeSBtYXkgY2hhbmdl
IGZyb20gb25lIGJvb3QgdG8gdGhlIG5leHQgYW5kCj4+IHNvZnR3YXJlIGNhbid0IHJlbGlhYmx5
IGluamVjdCBhIHBhZGRpbmcgdGhhdCBjb25mb3JtcyB0byB0aGUgeDg2Cj4+IDEyOE1CIHNlY3Rp
b24gY29uc3RyYWludC4KPiAKPiBUaGFua3MsIEkgdGhvdWdodCBpdCB3YXMgbW9zdGx5IGZvciB3
ZWlyZCBhbGlnbm1lbnQgd2hlcmUgb3RoZXIgcGFydHMgb2YKPiB0aGUgc2VjdGlvbiBhcmUgYmFz
aWNhbGx5ICJob2xlcyIgYW5kIG5vdCBtZW1vcnkuCj4gCj4gWWVzLCBpdCBpcyBhIHJlYWwgYnVn
IHRoYXQgWk9ORV9ERVZJQ0UgcGFnZXMgZmFsbCBpbnRvIHNlY3Rpb25zIHRoYXQgYXJlCj4gbWFy
a2VkIFNFQ1RJT05fSVNfT05MSU5FLgo+IAo+Pgo+PiBTdWZmaWNlIHRvIHNheSBJIHRoaW5rIHdl
IG5lZWQgeW91ciBwZm5fYWN0aXZlKCkgdG8gZ2V0IHN1YnNlY3Rpb24KPj4gZ3JhbnVsYXJpdHkg
cGZuX3RvX29ubGluZV9wYWdlKCkgYmVmb3JlIFBhZ2VSZXNlcnZlZCgpIGNhbiBiZSByZW1vdmVk
Lgo+IAo+IEkgYWdyZWUgdGhhdCB3ZSBoYXZlIHRvIGZpeCB0aGlzLiBJIGRvbid0IGxpa2UgWk9O
RV9ERVZJQ0UgcGFnZXMgZmFsbGluZwo+IGludG8gbWVtb3J5IGRldmljZSBibG9ja3MgKGUuZy4s
IGNhbm5vdCBnZXQgb2ZmbGluZWQpLCBidXQgSSBndWVzcyB0aGF0Cj4gdHJhaW4gaXMgZ29uZSA6
KSBBcyBsb25nIGFzIGl0J3Mgbm90IGZvciBtZW1vcnkgaG90cGx1ZywgSSBjYW4gbW9zdAo+IHBy
b2JhYmx5IGxpdmUgd2l0aCB0aGlzLgo+IAo+IEFsc28sIEknZCBsaWtlIHRvIGdldCBNaWNoYWxz
IG9waW5pb24gb24gdGhpcyBhbmQgdGhlIHBmbl9hY3RpdmUoKQo+IGFwcHJvYWNoLCBidXQgSSBj
YW4gdW5kZXJzdGFuZCBoZSdzIGJ1c3kuCj4gCj4gVGhpcyBwYXRjaCBzZXQgY2FuIHdhaXQsIEkg
d29uJ3QgYmUgd29ya2luZyBuZXh0IHdlZWsgYmVzaWRlcwo+IHJlYWRpbmcvd3JpdGluZyBtYWls
cyBlaXRoZXIgd2F5Lgo+IAo+IElzIGFueWJvZHkgbG9va2luZyBpbnRvIHRoZSBwZm5fYWN0aXZl
KCkgdGhpbmd5Pwo+IAoKSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyBsaWtlIHRo
aXMgcmlnaHQgbm93IHRvIGZpeCB0aGlzIAooZXhjbHVkZSB0aGUgZmFsc2UgcG9zaXRpdmUgWk9O
RV9ERVZJQ0UgcGFnZXMgd2UgY291bGQgaGF2ZSB3aXRoaW4gYW4gCm9ubGluZSBzZWN0aW9uLCB3
aGljaCB3YXMgbm90IHBvc3NpYmxlIGJlZm9yZSBzdWJzZWN0aW9uIGhvdHBsdWcpOgoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaCBiL2luY2x1ZGUvbGludXgvbWVt
b3J5X2hvdHBsdWcuaAppbmRleCAzODRmZmIzZDY5YWIuLjQ5MGE5ZTkzNThiMyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9tZW1vcnlfaG90cGx1Zy5oCisrKyBiL2luY2x1ZGUvbGludXgvbWVt
b3J5X2hvdHBsdWcuaApAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3Qgdm1lbV9hbHRtYXA7CiAgICAg
ICAgIGlmIChfX19uciA8IE5SX01FTV9TRUNUSU9OUyAmJiBvbmxpbmVfc2VjdGlvbl9ucihfX19u
cikgJiYgXAogICAgICAgICAgICAgcGZuX3ZhbGlkX3dpdGhpbihfX19wZm4pKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICBfX19wYWdlID0gcGZuX3RvX3Bh
Z2UoX19fcGZuKTsgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgaWYgKHVubGlrZWx5KF9f
X3BhZ2UgJiYgaXNfem9uZV9kZXZpY2VfcGFnZShfX19wYWdlKSkpICAgICBcCisgICAgICAgICAg
ICAgICBfX19wYWdlID0gTlVMTDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgICAgIF9fX3BhZ2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAogIH0pCgoKWWVhaCwgaXQncyBhbm90aGVyIGlzX3pvbmVfZGV2aWNlX3Bh
Z2UoKSwgYnV0IGl0IHNob3VsZCBub3QgYmUgcmFjeSAKaGVyZSwgYXMgd2Ugd2FudCB0byBleGNs
dWRlLCBub3QgaW5jbHVkZSBaT05FX0RFVklDRS4KCkkgZG9uJ3QgaGF2ZSB0aW1lIHRvIGxvb2sg
aW50byB0aGlzIHJpZ2h0IG5vdywgdW5mb3J0dW5hdGVseS4KCi0tIAoKVGhhbmtzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
