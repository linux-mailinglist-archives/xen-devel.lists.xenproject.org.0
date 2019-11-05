Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBFEF988
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 10:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRvCK-0001iS-Eg; Tue, 05 Nov 2019 09:32:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iRvCJ-0001iL-0i
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 09:32:23 +0000
X-Inumbo-ID: 2a6456c6-ffaf-11e9-9631-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2a6456c6-ffaf-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572946340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCW2yumpyeD0QRpINarfqjy396nJ9BgD2PKUzKr6dO4=;
 b=AXmgNMX2o1KmNaUCrbEKKkL2XGl2fppMYs1YVRfvtnhxWFbSwy550oACW2g3ga8FGhimcL
 pGrG11mUYjOnnfg9CF41kuseW0v2rbQj3GUROyQ4GeJrCJqWO0BcO04E6R9dNb6Bll6xhM
 tbNx3Su9UMPIpYT+tKJmg9u5jlSKIVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-p8eCh0xjOsiLVOoP95CF-Q-1; Tue, 05 Nov 2019 04:32:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D653107ACC2;
 Tue,  5 Nov 2019 09:32:08 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E80C60FC2;
 Tue,  5 Nov 2019 09:31:37 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-2-david@redhat.com>
 <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c52849c0-1185-c0c4-f9f6-2e7d12ed8e8e@redhat.com>
Date: Tue, 5 Nov 2019 10:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: p8eCh0xjOsiLVOoP95CF-Q-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH v1 01/10] mm/memory_hotplug: Don't allow to
 online/offline memory blocks with holes
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

T24gMDUuMTEuMTkgMDI6MzAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwg
MjAxOSBhdCA1OjEwIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90
ZToKPj4KPj4gT3VyIG9ubGluaW5nL29mZmxpbmluZyBjb2RlIGlzIHVubmVjZXNzYXJpbHkgY29t
cGxpY2F0ZWQuIE9ubHkgbWVtb3J5Cj4+IGJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBjYW4gaGF2
ZSBob2xlcyAoYSByYW5nZSB0aGF0IGlzIG5vdAo+PiBJT1JFU09VUkNFX1NZU1RFTV9SQU0pLiBI
b3RwbHVnZ2VkIG1lbW9yeSBuZXZlciBoYXMgaG9sZXMgKGUuZy4sIHNlZQo+PiBhZGRfbWVtb3J5
X3Jlc291cmNlKCkpLiBBbGwgYm9vdCBtZW1vcnkgaXMgYWxyZWFkIG9ubGluZS4KPiAKPiBzL2Fs
cmVhZC9hbHJlYWR5Lwo+IAoKVGhhbmtzLgoKPiAuLi5hbHNvIHBlcmhhcHMgY2xhcmlmeSAiYWxy
ZWFkeSBvbmxpbmUiIGJ5IHdoYXQgcG9pbnQgaW4gdGltZSBhbmQgd2h5Cj4gdGhhdCBpcyByZWxl
dmFudC4gRm9yIGV4YW1wbGUgYSBkZXNjcmlwdGlvbiBvZiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
Cj4gdGhlIFNldFBhZ2VSZXNlcnZlZCgpIGluIHRoZSBib290bWVtIHBhdGggYW5kIHRoZSBvbmUg
aW4gdGhlIGhvdHBsdWcKPiBwYXRoLgoKV2lsbCBhZGQuCgo+IAo+PiBUaGVyZWZvcmUsIHdoZW4g
d2Ugc3RvcCBhbGxvd2luZyB0byBvZmZsaW5lIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcywgd2UK
Pj4gaW1wbGljaXRseSBubyBsb25nZXIgaGF2ZSB0byBkZWFsIHdpdGggb25saW5pbmcgbWVtb3J5
IGJsb2NrcyB3aXRoIGhvbGVzLgo+IAo+IE1heWJlIGFuIGV4cGxpY2l0IHJlZmVyZW5jZSBvZiB0
aGUgY29kZSBhcmVhcyB0aGF0IGRlYWwgd2l0aCBob2xlcwo+IHdvdWxkIGhlbHAgdG8gYmFjayB1
cCB0aGF0IGFzc2VydGlvbi4gQ2VydGFpbmx5IGl0IHdvdWxkIGhhdmUgc2F2ZWQgbWUKPiBzb21l
IHRpbWUgZm9yIHRoZSByZXZpZXcuCgpJIGNhbiBhZGQgYSByZWZlcmVuY2UgdG8gdGhlIG9ubGlu
aW5nIGNvZGUgdGhhdCB3aWxsIG9ubHkgb25saW5lIHBhZ2VzIAp0aGF0IGRvbid0IGZhbGwgaW50
byBtZW1vcnkgaG9sZXMuCgo+IAo+PiBUaGlzIGFsbG93cyB0byBzaW1wbGlmeSB0aGUgY29kZS4g
Rm9yIGV4YW1wbGUsIHdlIG5vIGxvbmdlciBoYXZlIHRvCj4+IHdvcnJ5IGFib3V0IG1hcmtpbmcg
cGFnZXMgdGhhdCBmYWxsIGludG8gbWVtb3J5IGhvbGVzIFBHX3Jlc2VydmVkIHdoZW4KPj4gb25s
aW5pbmcgbWVtb3J5LiBXZSBjYW4gc3RvcCBzZXR0aW5nIHBhZ2VzIFBHX3Jlc2VydmVkLgo+IAo+
IC4uLmJ1dCBub3QgZm9yIGJvb3RtZW0sIHJpZ2h0PwoKWWVzLCBib290bWVtIGlzIG5vdCBjaGFu
Z2VkLiAoZXNwZWNpYWxseSwgZWFybHkgYWxsb2NhdGlvbnMgYW5kIG1lbW9yeSAKaG9sZXMgYXJl
IG1hcmtlZCBQR19yZXNlcnZlZCAtIGJhc2ljYWxseSBldmVyeXRoaW5nIG5vdCBnaXZlbiB0byB0
aGUgCmJ1ZGR5IGFmdGVyIGJvb3QpCgo+IAo+Pgo+PiBPZmZsaW5pbmcgbWVtb3J5IGJsb2NrcyBh
ZGRlZCBkdXJpbmcgYm9vdCBpcyB1c3VhbGx5IG5vdCBndXJhbnRlZWQgdG8gd29yawo+IAo+IHMv
Z3VyYW50ZWVkL2d1YXJhbnRlZWQvCgpUaGFua3MuCgo+IAo+PiBlaXRoZXIgd2F5ICh1bm1vdmFi
bGUgZGF0YSBtaWdodCBoYXZlIGVhc2lseSBlbmRlZCB1cCBvbiB0aGF0IG1lbW9yeSBkdXJpbmcK
Pj4gYm9vdCkuIFNvIHN0b3BwaW5nIHRvIGRvIHRoYXQgc2hvdWxkIG5vdCByZWFsbHkgaHVydCAo
KyBwZW9wbGUgYXJlIG5vdAo+PiBldmVuIGF3YXJlIG9mIGEgc2V0dXAgd2hlcmUgdGhhdCB1c2Vk
IHRvIHdvcmsKPiAKPiBNYXliZSBwdXQgYSAiTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcv
ci8kbXNnX2lkIiB0byB0aGF0IGRpc2N1c3Npb24/Cj4gCj4+IGFuZCB0aGF0IHRoZSBleGlzdGlu
ZyBjb2RlCj4+IHN0aWxsIHdvcmtzIGNvcnJlY3RseSB3aXRoIG1lbW9yeSBob2xlcykuIEZvciB0
aGUgdXNlIGNhc2Ugb2Ygb2ZmbGluaW5nCj4+IG1lbW9yeSB0byB1bnBsdWcgRElNTXMsIHdlIHNo
b3VsZCBzZWUgbm8gY2hhbmdlLiAoaG9sZXMgb24gRElNTXMgd291bGQgYmUKPj4gd2VpcmQpLgo+
IAo+IEhvd2V2ZXIsIGxlc3MgbWVtb3J5IGNhbiBiZSBvZmZsaW5lZCB0aGFuIHdhcyB0aGVvcmV0
aWNhbGx5IGFsbG93ZWQKPiBwcmV2aW91c2x5LCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgdGhlICJ3
ZSBzaG91bGQgc2VlIG5vIGNoYW5nZSIKPiBjb21tZW50LiBJIHN0aWxsIGFncmVlIHRoYXQncyBh
IHByaWNlIHdvcnRoIHBheWluZyB0byBnZXQgdGhlIGNvZGUKPiBjbGVhbnVwcyBhbmQgaWYgc29t
ZW9uZSBzY3JlYW1zIHdlIGNhbiBsb29rIGF0IGFkZGluZyBpdCBiYWNrLCBidXQgdGhlCj4gZmFj
dCB0aGF0IGl0IHdhcyBhbHJlYWR5IGZyYWdpbGUgc2VlbXMgZGVjZW50IGVub3VnaCBwcm90ZWN0
aW9uLgoKSG90cGx1Z2dlZCBESU1NcyAoYWRkX21lbW9yeSgpKSBoYXZlIG5vIGhvbGVzIGFuZCB3
aWxsIHRoZXJlZm9yZSBzZWUgbm8gCmNoYW5nZS4KCj4+Cj4+IFBsZWFzZSBub3RlIHRoYXQgaGFy
ZHdhcmUgZXJyb3JzIChQR19od3BvaXNvbikgYXJlIG5vdCBtZW1vcnkgaG9sZXMgYW5kCj4+IG5v
dCBhZmZlY3RlZCBieSB0aGlzIGNoYW5nZSB3aGVuIG9mZmxpbmluZy4KPj4KPj4gQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+IENjOiBNaWNoYWwgSG9ja28g
PG1ob2Nrb0BzdXNlLmNvbT4KPj4gQ2M6IE9zY2FyIFNhbHZhZG9yIDxvc2FsdmFkb3JAc3VzZS5k
ZT4KPj4gQ2M6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgo+PiBD
YzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4+IENjOiBBbnNodW1h
biBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIG1tL21lbW9y
eV9ob3RwbHVnLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKystLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvbW0vbWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVnLmMKPj4gaW5kZXggNTYx
MzcxZWFkMzlhLi44ZDgxNzMwY2YwMzYgMTAwNjQ0Cj4+IC0tLSBhL21tL21lbW9yeV9ob3RwbHVn
LmMKPj4gKysrIGIvbW0vbWVtb3J5X2hvdHBsdWcuYwo+PiBAQCAtMTQ0NywxMCArMTQ0NywxOSBA
QCBzdGF0aWMgdm9pZCBub2RlX3N0YXRlc19jbGVhcl9ub2RlKGludCBub2RlLCBzdHJ1Y3QgbWVt
b3J5X25vdGlmeSAqYXJnKQo+PiAgICAgICAgICAgICAgICAgIG5vZGVfY2xlYXJfc3RhdGUobm9k
ZSwgTl9NRU1PUlkpOwo+PiAgIH0KPj4KPj4gK3N0YXRpYyBpbnQgY291bnRfc3lzdGVtX3JhbV9w
YWdlc19jYih1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIHZvaWQgKmRhdGEpCj4+ICt7
Cj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyAqbnJfc3lzdGVtX3JhbV9wYWdlcyA9IGRhdGE7Cj4+
ICsKPj4gKyAgICAgICAqbnJfc3lzdGVtX3JhbV9wYWdlcyArPSBucl9wYWdlczsKPj4gKyAgICAg
ICByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgX19yZWYgX19vZmZsaW5lX3Bh
Z2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+PiAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBlbmRfcGZuKQo+PiAgIHsKPj4gLSAgICAgICB1bnNpZ25lZCBsb25nIHBmbiwgbnJf
cGFnZXM7Cj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBwZm4sIG5yX3BhZ2VzID0gMDsKPj4gICAg
ICAgICAgdW5zaWduZWQgbG9uZyBvZmZsaW5lZF9wYWdlcyA9IDA7Cj4+ICAgICAgICAgIGludCBy
ZXQsIG5vZGUsIG5yX2lzb2xhdGVfcGFnZWJsb2NrOwo+PiAgICAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwo+PiBAQCAtMTQ2MSw2ICsxNDcwLDIwIEBAIHN0YXRpYyBpbnQgX19yZWYgX19vZmZs
aW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+Pgo+PiAgICAgICAgICBtZW1faG90
cGx1Z19iZWdpbigpOwo+Pgo+PiArICAgICAgIC8qCj4+ICsgICAgICAgICogRG9uJ3QgYWxsb3cg
dG8gb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoYXQgY29udGFpbiBob2xlcy4KPj4gKyAgICAgICAg
KiBDb25zZWN1ZW50bHksIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcyBjYW4gbmV2ZXIgZ2V0IG9u
bGluZWQKPiAKPiBzL0NvbnNlY3VlbnRseS9Db25zZXF1ZW50bHkvCgpUaGFua3MuCgo+IAo+PiAr
ICAgICAgICAqIChob3RwbHVnZ2VkIG1lbW9yeSBoYXMgbm8gaG9sZXMgYW5kIGFsbCBib290IG1l
bW9yeSBpcyBvbmxpbmUpLgo+PiArICAgICAgICAqIFRoaXMgYWxsb3dzIHRvIHNpbXBsaWZ5IHRo
ZSBvbmxpbmluZy9vZmZsaW5pbmcgY29kZSBxdWl0ZSBhIGxvdC4KPj4gKyAgICAgICAgKi8KPiAK
PiBUaGUgbGFzdCBzZW50ZW5jZSBvZiB0aGlzIGNvbW1lbnQgbWFrZXMgc2Vuc2UgaW4gdGhlIGNv
bnRleHQgb2YgdGhpcwo+IHBhdGNoLCBidXQgSSBkb24ndCB0aGluayBpdCBzdGFuZHMgYnkgaXRz
ZWxmIGluIHRoZSBjb2RlIGJhc2UgYWZ0ZXIKPiB0aGUgZmFjdC4gVGhlIHBlcnNvbiByZWFkaW5n
IHRoZSBjb21tZW50IGNhbid0IHNlZSB0aGUgc2ltcGxpZmljYXRpb25zCj4gYmVjYXVzZSB0aGUg
Y29kZSBpcyBhbHJlYWR5IGdvbmUuIEknZCBjbGFyaWZ5IGl0IHRvIHRhbGsgYWJvdXQgd2h5IGl0
Cj4gaXMgc2FmZSB0byBub3QgbWVzcyBhcm91bmQgd2l0aCBQR19SZXNlcnZlZCBpbiB0aGUgaG90
cGx1ZyBwYXRoCj4gYmVjYXVzZSBvZiB0aGlzIGNoZWNrLgoKSSdsbCB0aGluayBvZiBzb21ldGhp
bmcuIEl0J3Mgbm90IGp1c3QgdGhlIFBHX3Jlc2VydmVkIGhhbmRsaW5nIGJ1dCB0aGUgCndob2xl
IHBmbl92YWxpZCgpL3dhbGtfc3lzdGVtX3JhbV9yYW5nZSgpIGhhbmRsaW5nIHRoYXQgY2FuIGJl
IHNpbXBsaWZpZWQuCgo+IAo+IEFmdGVyIHRob3NlIGNsYXJpZmljYXRpb25zIHlvdSBjYW4gYWRk
Ogo+IAo+IFJldmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KPiAKClRoYW5rcyEKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
