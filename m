Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24879F5B9B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2019 00:04:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTDGf-00045b-LQ; Fri, 08 Nov 2019 23:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GOmL=ZA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iTDGe-00045W-OJ
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 23:02:12 +0000
X-Inumbo-ID: cb753e08-027b-11ea-adbe-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cb753e08-027b-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573254130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2NCDVuV0/kQDSAATePRuSEbIDA12CWhvMclhMdQSdE=;
 b=eNJUQUoY4S0Gx1y2hxY0Ge3q3BMba3jiuC85aQnckle56Cmtla8mypw9mLxViNcH+5Rw8L
 BLs2MluwGOnyZQQUtd56cOhWXqLydruk+iFCIQqCQUWH9/Y5OrxWhQJIRvcq77RrABSR0b
 /2UhvAe0hJ+JVIIGK2doqXugb29V9TY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-9VDzBxTDMAmNaGguUgi4aw-1; Fri, 08 Nov 2019 18:02:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3651005500;
 Fri,  8 Nov 2019 23:02:01 +0000 (UTC)
Received: from [10.36.116.65] (ovpn-116-65.ams2.redhat.com [10.36.116.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA3A100EBA4;
 Fri,  8 Nov 2019 23:01:41 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
 <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
 <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
 <CAPcyv4ivq=EPUePXiX2ErcVyF7+dV9Yv215Oue7X_Y2X_Jfw8Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5413f9c3-dc6a-d8ba-3777-41e99714af3d@redhat.com>
Date: Sat, 9 Nov 2019 00:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4ivq=EPUePXiX2ErcVyF7+dV9Yv215Oue7X_Y2X_Jfw8Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9VDzBxTDMAmNaGguUgi4aw-1
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

T24gMDguMTEuMTkgMTk6MjksIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBGcmksIE5vdiA4LCAy
MDE5IGF0IDI6MjIgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAwOC4xMS4xOSAwODoxNCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBP
biAwOC4xMS4xOSAwNjowOSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+Pj4+IE9uIFRodSwgTm92IDcs
IDIwMTkgYXQgMjowNyBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Pj4+Cj4+Pj4+IE9uIDA3LjExLjE5IDE5OjIyLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IEFtIDA3LjExLjIwMTkgdW0gMTY6NDAgc2NocmllYiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT46Cj4+Pj4+Pj4KPj4+Pj4+PiDv
u79PbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCA1OjEyIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gUmlnaHQgbm93LCBaT05FX0RF
VklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4gV2Ugd2FudCB0bwo+Pj4+Pj4+
PiBjaGFuZ2UgdGhhdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gS1ZNIGhhcyB0aGlzIHdlaXJkIHVzZSBj
YXNlIHRoYXQgeW91IGNhbiBtYXAgYW55dGhpbmcgZnJvbSAvZGV2L21lbQo+Pj4+Pj4+PiBpbnRv
IHRoZSBndWVzdC4gcGZuX3ZhbGlkKCkgaXMgbm90IGEgcmVsaWFibGUgY2hlY2sgd2hldGhlciB0
aGUgbWVtbWFwCj4+Pj4+Pj4+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNoZWQuIHBm
bl90b19vbmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPj4+Pj4+Pj4gdGhhdCB3ZSBoYXZlIGFuIGlu
aXRpYWxpemVkIG1lbW1hcCAoYW5kIGRvbid0IGhhdmUgWk9ORV9ERVZJQ0UgbWVtb3J5KS4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gUmV3cml0ZSBpc19pbnZhbGlkX3Jlc2VydmVkX3BmbigpIHNpbWlsYXIg
dG8ga3ZtX2lzX3Jlc2VydmVkX3BmbigpIHRvIG1ha2UKPj4+Pj4+Pj4gc3VyZSB0aGUgZnVuY3Rp
b24gcHJvZHVjZXMgdGhlIHNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0aW5nIFpPTkVfREVW
SUNFCj4+Pj4+Pj4+IHBhZ2VzIFBHX3Jlc2VydmVkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDYzogQWxl
eCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPj4+Pj4+Pj4gQ2M6IENv
cm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+
IGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAxMCArKysrKysrKy0tCj4+Pj4+Pj4+
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+Pj4+Pj4+PiBpbmRleCAyYWRhOGU2Y2Ri
ODguLmY4Y2U4YzQwOGJhOCAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9f
aW9tbXVfdHlwZTEuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBl
MS5jCj4+Pj4+Pj4+IEBAIC0yOTksOSArMjk5LDE1IEBAIHN0YXRpYyBpbnQgdmZpb19sb2NrX2Fj
Y3Qoc3RydWN0IHZmaW9fZG1hICpkbWEsIGxvbmcgbnBhZ2UsIGJvb2wgYXN5bmMpCj4+Pj4+Pj4+
ICAgICAgKi8KPj4+Pj4+Pj4gc3RhdGljIGJvb2wgaXNfaW52YWxpZF9yZXNlcnZlZF9wZm4odW5z
aWduZWQgbG9uZyBwZm4pCj4+Pj4+Pj4+IHsKPj4+Pj4+Pj4gLSAgICAgICBpZiAocGZuX3ZhbGlk
KHBmbikpCj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBmbl90
b19wYWdlKHBmbikpOwo+Pj4+Pj4+PiArICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0gcGZuX3Rv
X29ubGluZV9wYWdlKHBmbik7Cj4+Pj4+Pj4KPj4+Pj4+PiBVZ2gsIEkganVzdCByZWFsaXplZCB0
aGlzIGlzIG5vdCBhIHNhZmUgY29udmVyc2lvbiB1bnRpbAo+Pj4+Pj4+IHBmbl90b19vbmxpbmVf
cGFnZSgpIGlzIG1vdmVkIG92ZXIgdG8gc3Vic2VjdGlvbiBncmFudWxhcml0eS4gQXMgaXQKPj4+
Pj4+PiBzdGFuZHMgaXQgd2lsbCByZXR1cm4gdHJ1ZSBmb3IgYW55IFpPTkVfREVWSUNFIHBhZ2Vz
IHRoYXQgc2hhcmUgYQo+Pj4+Pj4+IHNlY3Rpb24gd2l0aCBib290IG1lbW9yeS4KPj4+Pj4+Cj4+
Pj4+PiBUaGF0IHNob3VsZCBub3QgaGFwcGVuIHJpZ2h0IG5vdyBhbmQgSSBjb21tZW50ZWQgYmFj
ayB3aGVuIHlvdSBpbnRyb2R1Y2VkIHN1YnNlY3Rpb24gc3VwcG9ydCB0aGF0IEkgZG9u4oCZdCB3
YW50IHRvIGhhdmUgWk9ORV9ERVZJQ0UgbWl4ZWQgd2l0aCBvbmxpbmUgcGFnZXMgaW4gYSBzZWN0
aW9uLiBIYXZpbmcgbWVtb3J5IGJsb2NrIGRldmljZXMgdGhhdCBwYXJ0aWFsbHkgc3BhbiBaT05F
X0RFVklDRSB3b3VsZCBiZSAuLi4gcmVhbGx5IHdlaXJkLiBXaXRoIHNvbWV0aGluZyBsaWtlIHBm
bl9hY3RpdmUoKSAtIGFzIGRpc2N1c3NlZCAtIHdlIGNvdWxkIGF0IGxlYXN0IG1ha2UgdGhpcyBj
aGVjayB3b3JrIC0gYnV0IEkgYW0gbm90IHN1cmUgaWYgd2UgcmVhbGx5IHdhbnQgdG8gZ28gZG93
biB0aGF0IHBhdGguIEluIHRoZSB3b3JzdCBjYXNlLCBzb21lIE1CIG9mIFJBTSBhcmUgbG9zdCAu
Li4gSSBndWVzcyB0aGlzIG5lZWRzIG1vcmUgdGhvdWdodC4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEkg
anVzdCByZWFsaXplZCB0aGUgImJvb3QgbWVtb3J5IiBwYXJ0LiBJcyB0aGF0IGEgcmVhbCB0aGlu
Zz8gSU9XLCBjYW4KPj4+Pj4gd2UgaGF2ZSBaT05FX0RFVklDRSBmYWxsaW5nIGludG8gYSBtZW1v
cnkgYmxvY2sgKHdpdGggaG9sZXMpPyBJIHNvbWV3aGF0Cj4+Pj4+IGhhdmUgZG91YnRzIHRoYXQg
dGhpcyB3b3VsZCB3b3JrIC4uLgo+Pj4+Cj4+Pj4gT25lIG9mIHRoZSByZWFsIHdvcmxkIGZhaWx1
cmUgY2FzZXMgdGhhdCBzdGFydGVkIHRoZSBzdWJzZWN0aW9uIGVmZmVjdAo+Pj4+IGlzIHRoYXQg
UGVyc2lzdGVudCBNZW1vcnkgY29sbGlkZXMgd2l0aCBTeXN0ZW0gUkFNIG9uIGEgNjRNQiBib3Vu
ZGFyeQo+Pj4+IG9uIHNoaXBwaW5nIHBsYXRmb3Jtcy4gU3lzdGVtIFJBTSBlbmRzIG9uIGEgNjRN
QiBib3VuZGFyeSBhbmQgZHVlIHRvIGEKPj4+PiBsYWNrIG9mIG1lbW9yeSBjb250cm9sbGVyIHJl
c291cmNlcyBQTUVNIGlzIG1hcHBlZCBjb250aWd1b3VzbHkgYXQgdGhlCj4+Pj4gZW5kIG9mIHRo
YXQgYm91bmRhcnkuIFNvbWUgbW9yZSBkZXRhaWxzIGluIHRoZSBzdWJzZWN0aW9uIGNvdmVyIGxl
dHRlcgo+Pj4+IC8gY2hhbmdlbG9ncyBbMV0gWzJdLiBJdCdzIG5vdCBzdWZmaWNpZW50IHRvIGp1
c3QgbG9zZSBzb21lIG1lbW9yeSwKPj4+PiB0aGF0J3MgdGhlIGJyb2tlbiBpbXBsZW1lbnRhdGlv
biB0aGF0IGxlYWQgdG8gdGhlIHN1YnNlY3Rpb24gd29yawo+Pj4+IGJlY2F1c2UgdGhlIGxvc3Qg
bWVtb3J5IG1heSBjaGFuZ2UgZnJvbSBvbmUgYm9vdCB0byB0aGUgbmV4dCBhbmQKPj4+PiBzb2Z0
d2FyZSBjYW4ndCByZWxpYWJseSBpbmplY3QgYSBwYWRkaW5nIHRoYXQgY29uZm9ybXMgdG8gdGhl
IHg4Ngo+Pj4+IDEyOE1CIHNlY3Rpb24gY29uc3RyYWludC4KPj4+Cj4+PiBUaGFua3MsIEkgdGhv
dWdodCBpdCB3YXMgbW9zdGx5IGZvciB3ZWlyZCBhbGlnbm1lbnQgd2hlcmUgb3RoZXIgcGFydHMg
b2YKPj4+IHRoZSBzZWN0aW9uIGFyZSBiYXNpY2FsbHkgImhvbGVzIiBhbmQgbm90IG1lbW9yeS4K
Pj4+Cj4+PiBZZXMsIGl0IGlzIGEgcmVhbCBidWcgdGhhdCBaT05FX0RFVklDRSBwYWdlcyBmYWxs
IGludG8gc2VjdGlvbnMgdGhhdCBhcmUKPj4+IG1hcmtlZCBTRUNUSU9OX0lTX09OTElORS4KPj4+
Cj4+Pj4KPj4+PiBTdWZmaWNlIHRvIHNheSBJIHRoaW5rIHdlIG5lZWQgeW91ciBwZm5fYWN0aXZl
KCkgdG8gZ2V0IHN1YnNlY3Rpb24KPj4+PiBncmFudWxhcml0eSBwZm5fdG9fb25saW5lX3BhZ2Uo
KSBiZWZvcmUgUGFnZVJlc2VydmVkKCkgY2FuIGJlIHJlbW92ZWQuCj4+Pgo+Pj4gSSBhZ3JlZSB0
aGF0IHdlIGhhdmUgdG8gZml4IHRoaXMuIEkgZG9uJ3QgbGlrZSBaT05FX0RFVklDRSBwYWdlcyBm
YWxsaW5nCj4+PiBpbnRvIG1lbW9yeSBkZXZpY2UgYmxvY2tzIChlLmcuLCBjYW5ub3QgZ2V0IG9m
ZmxpbmVkKSwgYnV0IEkgZ3Vlc3MgdGhhdAo+Pj4gdHJhaW4gaXMgZ29uZSA6KSBBcyBsb25nIGFz
IGl0J3Mgbm90IGZvciBtZW1vcnkgaG90cGx1ZywgSSBjYW4gbW9zdAo+Pj4gcHJvYmFibHkgbGl2
ZSB3aXRoIHRoaXMuCj4+Pgo+Pj4gQWxzbywgSSdkIGxpa2UgdG8gZ2V0IE1pY2hhbHMgb3Bpbmlv
biBvbiB0aGlzIGFuZCB0aGUgcGZuX2FjdGl2ZSgpCj4+PiBhcHByb2FjaCwgYnV0IEkgY2FuIHVu
ZGVyc3RhbmQgaGUncyBidXN5Lgo+Pj4KPj4+IFRoaXMgcGF0Y2ggc2V0IGNhbiB3YWl0LCBJIHdv
bid0IGJlIHdvcmtpbmcgbmV4dCB3ZWVrIGJlc2lkZXMKPj4+IHJlYWRpbmcvd3JpdGluZyBtYWls
cyBlaXRoZXIgd2F5Lgo+Pj4KPj4+IElzIGFueWJvZHkgbG9va2luZyBpbnRvIHRoZSBwZm5fYWN0
aXZlKCkgdGhpbmd5Pwo+Pj4KPj4KPj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRvIHNvbWV0aGlu
ZyBsaWtlIHRoaXMgcmlnaHQgbm93IHRvIGZpeCB0aGlzCj4+IChleGNsdWRlIHRoZSBmYWxzZSBw
b3NpdGl2ZSBaT05FX0RFVklDRSBwYWdlcyB3ZSBjb3VsZCBoYXZlIHdpdGhpbiBhbgo+PiBvbmxp
bmUgc2VjdGlvbiwgd2hpY2ggd2FzIG5vdCBwb3NzaWJsZSBiZWZvcmUgc3Vic2VjdGlvbiBob3Rw
bHVnKToKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaCBi
L2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaAo+PiBpbmRleCAzODRmZmIzZDY5YWIuLjQ5
MGE5ZTkzNThiMyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tZW1vcnlfaG90cGx1Zy5o
Cj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaAo+PiBAQCAtMzAsNiArMzAs
OCBAQCBzdHJ1Y3Qgdm1lbV9hbHRtYXA7Cj4+ICAgICAgICAgICBpZiAoX19fbnIgPCBOUl9NRU1f
U0VDVElPTlMgJiYgb25saW5lX3NlY3Rpb25fbnIoX19fbnIpICYmIFwKPj4gICAgICAgICAgICAg
ICBwZm5fdmFsaWRfd2l0aGluKF9fX3BmbikpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+PiAgICAgICAgICAgICAgICAgICBfX19wYWdlID0gcGZuX3RvX3BhZ2UoX19fcGZuKTsgICAg
ICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgaWYgKHVubGlrZWx5KF9fX3BhZ2UgJiYgaXNf
em9uZV9kZXZpY2VfcGFnZShfX19wYWdlKSkpICAgICBcCj4+ICsgICAgICAgICAgICAgICBfX19w
YWdlID0gTlVMTDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICAgICAg
ICAgICBfX19wYWdlOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4gICAgfSkKPj4KPj4KPj4gWWVhaCwgaXQncyBhbm90aGVyIGlzX3pvbmVfZGV2
aWNlX3BhZ2UoKSwgYnV0IGl0IHNob3VsZCBub3QgYmUgcmFjeQo+PiBoZXJlLCBhcyB3ZSB3YW50
IHRvIGV4Y2x1ZGUsIG5vdCBpbmNsdWRlIFpPTkVfREVWSUNFLgo+Pgo+PiBJIGRvbid0IGhhdmUg
dGltZSB0byBsb29rIGludG8gdGhpcyByaWdodCBub3csIHVuZm9ydHVuYXRlbHkuCj4gCj4gSSBk
b24ndCB3YW50IHRvIGJhbmQtYWlkIHdpdGhvdXQgYW4gYWN0dWFsIGJ1ZyByZXBvcnQuIEknbGwg
dGFrZSBhCj4gbG9vayBhdCBhIHN1YnNlY3Rpb24tbWFwIGZvciB0aGUgb25saW5lIHN0YXRlLgo+
IAoKRmFpciBlbm91Z2gsIGJ1dCBhdCBsZWFzdCBpbiB3aGF0IEkgcHJvcG9zZWQgZm9yIHBmbl9h
Y3RpdmUoKSwgdGhpcyAKY2hlY2sgd291bGQgZXhpc3QgaW4gcGZuX3RvX29ubGluZV9wYWdlKCkg
aW4gYSBzaW1pbGFyIHdheSAtIGFuZCBpdCBpcyAKY2VydGFpbmx5IGVhc2llciB0byBiYWNrcG9y
dC4gQnV0IHllYWgsIHRyaWdnZXJpbmcgdGhpcyBtaWdodCBub3QgYmUgZWFzeS4KCi0tIAoKVGhh
bmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
