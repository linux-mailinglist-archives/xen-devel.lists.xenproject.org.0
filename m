Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD39F3F92
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 06:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSwdd-0001n0-Kq; Fri, 08 Nov 2019 05:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xILX=Y7=redhat.com=dhildenb@srs-us1.protection.inumbo.net>)
 id 1iSmQO-00076I-Cb
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 18:22:28 +0000
X-Inumbo-ID: 8cb67326-018b-11ea-adbe-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8cb67326-018b-11ea-adbe-bc764e2007e4;
 Thu, 07 Nov 2019 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573150945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iLLDW7QM1xnQc7BXIS/h4Apa1ZBB2zXuGDVuVIx4/w=;
 b=dbzlCADzLQ6zcUGD4Zr0iGdtUqAaxIWBqBYJ9Lka9L5psELp3mNfDQlujN836VzT04SiDI
 Sq1WbSANqP4WMCk32YnLWCNXDBtZfohylUtZptemKbHpm/GKFajh5MfYbudEcbX0I/OeLx
 Duqme091/saTuuOotKjYOkERGMcBbOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-fKdDWJsqPc21aH5FVitopg-1; Thu, 07 Nov 2019 13:22:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480271005502;
 Thu,  7 Nov 2019 18:22:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2CD4AF;
 Thu,  7 Nov 2019 18:22:15 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E1C518095FF;
 Thu,  7 Nov 2019 18:22:12 +0000 (UTC)
From: David Hildenbrand <dhildenb@redhat.com>
MIME-Version: 1.0
Date: Thu, 7 Nov 2019 13:22:12 -0500 (EST)
Message-Id: <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
In-Reply-To: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
Thread-Topic: vfio/type1: Prepare is_invalid_reserved_pfn() for PG_reserved
 changes
Thread-Index: +s2g58aTrOooMxUTMjHg25AUP3zIIA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fKdDWJsqPc21aH5FVitopg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Fri, 08 Nov 2019 05:16:47 +0000
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
 =?utf-8?Q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
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
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gQW0gMDcuMTEuMjAxOSB1bSAxNjo0MCBzY2hyaWViIERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPjoNCj4gDQo+IO+7v09uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDU6
MTIgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4gDQo+
PiBSaWdodCBub3csIFpPTkVfREVWSUNFIG1lbW9yeSBpcyBhbHdheXMgc2V0IFBHX3Jlc2VydmVk
LiBXZSB3YW50IHRvDQo+PiBjaGFuZ2UgdGhhdC4NCj4+IA0KPj4gS1ZNIGhhcyB0aGlzIHdlaXJk
IHVzZSBjYXNlIHRoYXQgeW91IGNhbiBtYXAgYW55dGhpbmcgZnJvbSAvZGV2L21lbQ0KPj4gaW50
byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNoZWNrIHdoZXRoZXIg
dGhlIG1lbW1hcA0KPj4gd2FzIGluaXRpYWxpemVkIGFuZCBjYW4gYmUgdG91Y2hlZC4gcGZuX3Rv
X29ubGluZV9wYWdlKCkgbWFrZXMgc3VyZQ0KPj4gdGhhdCB3ZSBoYXZlIGFuIGluaXRpYWxpemVk
IG1lbW1hcCAoYW5kIGRvbid0IGhhdmUgWk9ORV9ERVZJQ0UgbWVtb3J5KS4NCj4+IA0KPj4gUmV3
cml0ZSBpc19pbnZhbGlkX3Jlc2VydmVkX3BmbigpIHNpbWlsYXIgdG8ga3ZtX2lzX3Jlc2VydmVk
X3BmbigpIHRvIG1ha2UNCj4+IHN1cmUgdGhlIGZ1bmN0aW9uIHByb2R1Y2VzIHRoZSBzYW1lIHJl
c3VsdCBvbmNlIHdlIHN0b3Agc2V0dGluZyBaT05FX0RFVklDRQ0KPj4gcGFnZXMgUEdfcmVzZXJ2
ZWQuDQo+PiANCj4+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQu
Y29tPg0KPj4gQ2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+
IGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAxMCArKysrKysrKy0tDQo+PiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92
ZmlvX2lvbW11X3R5cGUxLmMNCj4+IGluZGV4IDJhZGE4ZTZjZGI4OC4uZjhjZThjNDA4YmE4IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYw0KPj4gKysrIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYw0KPj4gQEAgLTI5OSw5ICsyOTksMTUgQEAg
c3RhdGljIGludCB2ZmlvX2xvY2tfYWNjdChzdHJ1Y3QgdmZpb19kbWEgKmRtYSwgbG9uZyBucGFn
ZSwgYm9vbCBhc3luYykNCj4+ICAqLw0KPj4gc3RhdGljIGJvb2wgaXNfaW52YWxpZF9yZXNlcnZl
ZF9wZm4odW5zaWduZWQgbG9uZyBwZm4pDQo+PiB7DQo+PiAtICAgICAgIGlmIChwZm5fdmFsaWQo
cGZuKSkNCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBmbl90b19wYWdl
KHBmbikpOw0KPj4gKyAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19vbmxpbmVfcGFn
ZShwZm4pOw0KPiANCj4gVWdoLCBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBpcyBub3QgYSBzYWZlIGNv
bnZlcnNpb24gdW50aWwNCj4gcGZuX3RvX29ubGluZV9wYWdlKCkgaXMgbW92ZWQgb3ZlciB0byBz
dWJzZWN0aW9uIGdyYW51bGFyaXR5LiBBcyBpdA0KPiBzdGFuZHMgaXQgd2lsbCByZXR1cm4gdHJ1
ZSBmb3IgYW55IFpPTkVfREVWSUNFIHBhZ2VzIHRoYXQgc2hhcmUgYQ0KPiBzZWN0aW9uIHdpdGgg
Ym9vdCBtZW1vcnkuDQoNClRoYXQgc2hvdWxkIG5vdCBoYXBwZW4gcmlnaHQgbm93IGFuZCBJIGNv
bW1lbnRlZCBiYWNrIHdoZW4geW91IGludHJvZHVjZWQgc3Vic2VjdGlvbiBzdXBwb3J0IHRoYXQg
SSBkb27igJl0IHdhbnQgdG8gaGF2ZSBaT05FX0RFVklDRSBtaXhlZCB3aXRoIG9ubGluZSBwYWdl
cyBpbiBhIHNlY3Rpb24uIEhhdmluZyBtZW1vcnkgYmxvY2sgZGV2aWNlcyB0aGF0IHBhcnRpYWxs
eSBzcGFuIFpPTkVfREVWSUNFIHdvdWxkIGJlIC4uLiByZWFsbHkgd2VpcmQuIFdpdGggc29tZXRo
aW5nIGxpa2UgcGZuX2FjdGl2ZSgpIC0gYXMgZGlzY3Vzc2VkIC0gd2UgY291bGQgYXQgbGVhc3Qg
bWFrZSB0aGlzIGNoZWNrIHdvcmsgLSBidXQgSSBhbSBub3Qgc3VyZSBpZiB3ZSByZWFsbHkgd2Fu
dCB0byBnbyBkb3duIHRoYXQgcGF0aC4gSW4gdGhlIHdvcnN0IGNhc2UsIHNvbWUgTUIgb2YgUkFN
IGFyZSBsb3N0IC4uLiBJIGd1ZXNzIHRoaXMgbmVlZHMgbW9yZSB0aG91Z2h0LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
