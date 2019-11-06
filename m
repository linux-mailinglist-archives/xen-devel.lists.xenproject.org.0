Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CBF0F60
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 07:58:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSFFc-00037L-6Q; Wed, 06 Nov 2019 06:57:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dytv=Y6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iSFFa-00036k-Oc
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 06:57:07 +0000
X-Inumbo-ID: a3a19b31-0062-11ea-a1a6-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a3a19b31-0062-11ea-a1a6-12813bfff9fa;
 Wed, 06 Nov 2019 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573023423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHhiVRGjTg2z5h3dRfpoqGRkrXa+G8taPvqq9+5Ox4o=;
 b=K8UBhX1JtFZMs594Ypt3noWNFA7EDgGOzgTZeoLrecZiYBc0z9aQ1ftUT60ADHOM/4fKea
 S4RheFJRLPHeZXXsdxGjj1lj/DBLQ6j6EczxwIps2sdVeLlU8ExvD/QiqqB572Rk55bS6J
 wibfYYo3txGWC+O//e5qvLzZuGhvknc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-W8IUVLyUMSC0rC0dumrlPQ-1; Wed, 06 Nov 2019 01:57:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7029E8017E0;
 Wed,  6 Nov 2019 06:56:55 +0000 (UTC)
Received: from [10.36.116.143] (ovpn-116-143.ams2.redhat.com [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB0E15D70E;
 Wed,  6 Nov 2019 06:56:35 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
References: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
 <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
 <20191106000315.GI23297@linux.intel.com>
 <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
Date: Wed, 6 Nov 2019 07:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: W8IUVLyUMSC0rC0dumrlPQ-1
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
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMTkgMDE6MDgsIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUdWUsIE5vdiA1LCAy
MDE5IGF0IDQ6MDMgUE0gU2VhbiBDaHJpc3RvcGhlcnNvbgo+IDxzZWFuLmouY2hyaXN0b3BoZXJz
b25AaW50ZWwuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDM6NDM6
MjlQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+Pj4gT24gVHVlLCBOb3YgNSwgMjAxOSBh
dCAzOjMwIFBNIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPiB3cm90ZToK
Pj4+Pgo+Pj4+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMzoxMyBQTSBTZWFuIENocmlzdG9waGVy
c29uCj4+Pj4gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdyb3RlOgo+Pj4+Pgo+
Pj4+PiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwMzowMjo0MFBNIC0wODAwLCBEYW4gV2lsbGlh
bXMgd3JvdGU6Cj4+Pj4+PiBPbiBUdWUsIE5vdiA1LCAyMDE5IGF0IDEyOjMxIFBNIERhdmlkIEhp
bGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4+Pj4gVGhlIHNjYXJpZXIg
Y29kZSAoZm9yIG1lKSBpcyB0cmFuc3BhcmVudF9odWdlcGFnZV9hZGp1c3QoKSBhbmQKPj4+Pj4+
Pj4ga3ZtX21tdV96YXBfY29sbGFwc2libGVfc3B0ZSgpLCBhcyBJIGRvbid0IGF0IGFsbCB1bmRl
cnN0YW5kIHRoZQo+Pj4+Pj4+PiBpbnRlcmFjdGlvbiBiZXR3ZWVuIFRIUCBhbmQgX1BBR0VfREVW
TUFQLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIHg4NiBLVk0gTU1VIGNvZGUgaXMgb25lIG9mIHRoZSB1
Z2xpZXN0IGNvZGUgSSBrbm93IChzb3JyeSwgYnV0IGl0Cj4+Pj4+Pj4gaGFkIHRvIGJlIHNhaWQg
Oi8gKS4gTHVja2lseSwgdGhpcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgdGhlCj4+Pj4+Pj4g
UEdfcmVzZXJ2ZWQgdGhpbmd5IEFGQUlLcy4KPj4+Pj4+Cj4+Pj4+PiBCb3RoIHRyYW5zcGFyZW50
X2h1Z2VwYWdlX2FkanVzdCgpIGFuZCBrdm1fbW11X3phcF9jb2xsYXBzaWJsZV9zcHRlKCkKPj4+
Pj4+IGFyZSBob25vcmluZyBrdm1faXNfcmVzZXJ2ZWRfcGZuKCksIHNvIGFnYWluIEknbSBtaXNz
aW5nIHdoZXJlIHRoZQo+Pj4+Pj4gcGFnZSBjb3VudCBnZXRzIG1pc21hbmFnZWQgYW5kIGxlYWRz
IHRvIHRoZSByZXBvcnRlZCBoYW5nLgo+Pj4+Pgo+Pj4+PiBXaGVuIG1hcHBpbmcgcGFnZXMgaW50
byB0aGUgZ3Vlc3QsIEtWTSBnZXRzIHRoZSBwYWdlIHZpYSBndXAoKSwgd2hpY2gKPj4+Pj4gaW5j
cmVtZW50cyB0aGUgcGFnZSBjb3VudCBmb3IgWk9ORV9ERVZJQ0UgcGFnZXMuICBCdXQgS1ZNIHB1
dHMgdGhlIHBhZ2UKPj4+Pj4gdXNpbmcga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKCksIHdoaWNoIHNr
aXBzIHB1dF9wYWdlKCkgaWYgUGFnZVJlc2VydmVkKCkKPj4+Pj4gYW5kIHNvIG5ldmVyIHB1dHMg
aXRzIHJlZmVyZW5jZSB0byBaT05FX0RFVklDRSBwYWdlcy4KPj4+Pgo+Pj4+IE9oLCB5ZWFoLCB0
aGF0J3MgYnVzdGVkLgo+Pj4KPj4+IFVnaCwgaXQncyBleHRyYSBidXN0ZWQgYmVjYXVzZSBldmVy
eSBvdGhlciBndXAgdXNlciBpbiB0aGUga2VybmVsCj4+PiB0cmFja3MgdGhlIHBhZ2VzIHJlc3Vs
dGluZyBmcm9tIGd1cCBhbmQgcHV0cyB0aGVtIChwdXRfcGFnZSgpKSB3aGVuCj4+PiB0aGV5IGFy
ZSBkb25lLiBLVk0gd2FudHMgdG8gZm9yZ2V0IGFib3V0IHdoZXRoZXIgaXQgZGlkIGEgZ3VwIHRv
IGdldAo+Pj4gdGhlIHBhZ2UgYW5kIG9wdGlvbmFsbHkgdHJpZ2dlciBwdXRfcGFnZSgpIGJhc2Vk
IHB1cmVseSBvbiB0aGUgcGZuLgo+Pj4gT3V0c2lkZSBvZiBWRklPIGRldmljZSBhc3NpZ25tZW50
IHRoYXQgbmVlZHMgcGFnZXMgcGlubmVkIGZvciBETUEsIHdoeQo+Pj4gZG9lcyBLVk0gaXRzZWxm
IG5lZWQgdG8gcGluIHBhZ2VzPyBJZiBwYWdlcyBhcmUgcGlubmVkIG92ZXIgYSByZXR1cm4KPj4+
IHRvIHVzZXJzcGFjZSB0aGF0IG5lZWRzIHRvIGJlIGEgRk9MTF9MT05HVEVSTSBndXAuCj4+Cj4+
IFNob3J0IGFuc3dlciwgS1ZNIHBpbnMgdGhlIHBhZ2UgdG8gZW5zdXJlIGNvcnJlY3RuZXNzIHdp
dGggcmVzcGVjdCB0byB0aGUKPj4gcHJpbWFyeSBNTVUgaW52YWxpZGF0aW5nIHRoZSBhc3NvY2lh
dGVkIGhvc3QgdmlydHVhbCBhZGRyZXNzLCBlLmcuIHdoZW4KPj4gdGhlIHBhZ2UgaXMgYmVpbmcg
bWlncmF0ZWQgb3IgdW5tYXBwZWQgZnJvbSBob3N0IHVzZXJzcGFjZS4KPj4KPj4gVGhlIG1haW4g
dXNlIG9mIGd1cCgpIGlzIHRvIGhhbmRsZSBndWVzdCBwYWdlIGZhdWx0cyBhbmQgbWFwIHBhZ2Vz
IGludG8KPj4gdGhlIGd1ZXN0LCBpLmUuIGludG8gS1ZNJ3Mgc2Vjb25kYXJ5IE1NVS4gIEtWTSB1
c2VzIGd1cCgpIHRvIGJvdGggZ2V0IHRoZQo+PiBQRk4gYW5kIHRvIHRlbXBvcmFyaWx5IHBpbiB0
aGUgcGFnZS4gIFRoZSBwaW4gaXMgaGVsZCBqdXN0IGxvbmcgZW5vdWdoIHRvCj4+IGd1YXJhbnRl
ZWQgdGhhdCBhbnkgaW52YWxpZGF0aW9uIHZpYSB0aGUgbW11X25vdGlmaWVyIHdpbGwgYmUgc3Rh
bGxlZAo+PiB1bnRpbCBhZnRlciBLVk0gZmluaXNoZXMgaW5zdGFsbGluZyB0aGUgcGFnZSBpbnRv
IHRoZSBzZWNvbmRhcnkgTU1VLCBpLmUuCj4+IHRoZSBwaW4gaXMgc2hvcnQtdGVybSBhbmQgbm90
IGhlbGQgYWNyb3NzIGEgcmV0dXJuIHRvIHVzZXJzcGFjZSBvciBlbnRyeQo+PiBpbnRvIHRoZSBn
dWVzdC4gIFdoZW4gYSBzdWJzZXF1ZW50IG1tdV9ub3RpZmllciBpbnZhbGlkYXRpb24gb2NjdXJz
LCBLVk0KPj4gcHVsbHMgdGhlIFBGTiBmcm9tIHRoZSBzZWNvbmRhcnkgTU1VIGFuZCB1c2VzIHRo
YXQgdG8gdXBkYXRlIGFjY2Vzc2VkCj4+IGFuZCBkaXJ0eSBiaXRzIGluIHRoZSBob3N0Lgo+Pgo+
PiBUaGVyZSBhcmUgYSBmZXcgb3RoZXIgS1ZNIGZsb3dzIHRoYXQgZXZlbnR1YWxseSBjYWxsIGlu
dG8gZ3VwKCksIGJ1dCB0aG9zZQo+PiBhcmUgInRyYWRpdGlvbmFsIiBzaG9ydC10ZXJtIHBpbnMg
YW5kIHVzZSBwdXRfcGFnZSgpIGRpcmVjdGx5Lgo+IAo+IE9rLCBJIHdhcyBtaXNpbnRlcnByZXRp
bmcgdGhlIGVmZmVjdCBvZiB0aGUgYnVnIHdpdGggd2hhdCBLVk0gaXMgdXNpbmcKPiB0aGUgcmVm
ZXJlbmNlIHRvIGRvLgo+IAo+IFRvIHlvdXIgb3RoZXIgcG9pbnQ6Cj4gCj4+IEJ1dCBEYXZpZCdz
IHByb3Bvc2VkIGZpeCBmb3IgdGhlIGFib3ZlIHJlZmNvdW50IGJ1ZyBpcyB0byBvbWl0IHRoZSBw
YXRjaAo+PiBzbyB0aGF0IEtWTSBubyBsb25nZXIgdHJlYXRzIFpPTkVfREVWSUNFIHBhZ2VzIGFz
IHJlc2VydmVkLiAgVGhhdCBzZWVtcwo+PiBsaWtlIHRoZSByaWdodCB0aGluZyB0byBkbywgaW5j
bHVkaW5nIGZvciB0aHBfYWRqdXN0KCksIGUuZy4gaXQgd291bGQKPj4gbmF0dXJhbGx5IGxldCBL
Vk0gdXNlIDJtYiBwYWdlcyBmb3IgdGhlIGd1ZXN0IHdoZW4gYSBaT05FX0RFVklDRSBwYWdlIGlz
Cj4+IG1hcHBlZCB3aXRoIGEgaHVnZSBwYWdlICgybWIgb3IgYWJvdmUpIGluIHRoZSBob3N0LiAg
VGhlIG9ubHkgaGljY3VwIGlzCj4+IGZpZ3VyaW5nIG91dCBob3cgdG8gY29ycmVjdGx5IHRyYW5z
ZmVyIHRoZSByZWZlcmVuY2UuCj4gCj4gVGhhdCBtaWdodCBub3QgYmUgdGhlIG9ubHkgaGljY3Vw
LiBUaGVyZSdzIGN1cnJlbnRseSBubyBzdWNoIHRoaW5nIGFzCj4gaHVnZSBwYWdlcyBmb3IgWk9O
RV9ERVZJQ0UsIHRoZXJlIGFyZSBodWdlICptYXBwaW5ncyogKHBtZCBhbmQgcHVkKSwKPiBidXQg
dGhlIHJlc3VsdCBvZiBwZm5fdG9fcGFnZSgpIG9uIHN1Y2ggYSBtYXBwaW5nIGRvZXMgbm90IHlp
ZWxkIGEKPiBodWdlICdzdHJ1Y3QgcGFnZScuIEl0IHNlZW1zIHRoZXJlIGFyZSBvdGhlciBwYXRo
cyBpbiBLVk0gdGhhdCBhc3N1bWUKPiB0aGF0IG1vcmUgdHlwaWNhbCBwYWdlIG1hY2hpbmVyeSBp
cyBhY3RpdmUgbGlrZSBTZXRQYWdlRGlydHkoKSBiYXNlZAo+IG9uIGt2bV9pc19yZXNlcnZlZF9w
Zm4oKS4gV2hpbGUgSSB0b2xkIERhdmlkIHRoYXQgSSBkaWQgbm90IHdhbnQgdG8KPiBzZWUgbW9y
ZSB1c2FnZSBvZiBpc196b25lX2RldmljZV9wYWdlKCksIHRoaXMgcGF0Y2ggYmVsb3cgKHVudGVz
dGVkKQo+IHNlZW1zIGEgY2xlYW5lciBwYXRoIHdpdGggbGVzcyBzdXJwcmlzZXM6Cj4gCj4gZGlm
ZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gaW5k
ZXggNGRmMGFhNmI4ZTVjLi5mYmVhMTdjMTgxMGMgMTAwNjQ0Cj4gLS0tIGEvdmlydC9rdm0va3Zt
X21haW4uYwo+ICsrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBAQCAtMTgzMSw3ICsxODMxLDgg
QEAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbik7Cj4gCj4gICB2b2lk
IGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihrdm1fcGZuX3QgcGZuKQo+ICAgewo+IC0gICAgICAgaWYg
KCFpc19lcnJvcl9ub3Nsb3RfcGZuKHBmbikgJiYgIWt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSkK
PiArICAgICAgIGlmICgoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3ZtX2lzX3Jlc2Vy
dmVkX3BmbihwZm4pKSB8fAo+ICsgICAgICAgICAgIChwZm5fdmFsaWQocGZuKSAmJiBpc196b25l
X2RldmljZV9wYWdlKHBmbl90b19wYWdlKHBmbikpKSkKPiAgICAgICAgICAgICAgICAgIHB1dF9w
YWdlKHBmbl90b19wYWdlKHBmbikpOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKTsKCkkgaGFkIHRoZSBzYW1lIHRob3VnaHQsIGJ1dCBJIGRvIHdvbmRl
ciBhYm91dCB0aGUga3ZtX2dldF9wZm4oKSB1c2VycywgCmUuZy4sOgoKaHZhX3RvX3Bmbl9yZW1h
cHBlZCgpOgoJciA9IGZvbGxvd19wZm4odm1hLCBhZGRyLCAmcGZuKTsKCS4uLgoJa3ZtX2dldF9w
Zm4ocGZuKTsKCS4uLgoKV2Ugd291bGQgbm90IHRha2UgYSByZWZlcmVuY2UgZm9yIFpPTkVfREVW
SUNFLCBidXQgbGF0ZXIgZHJvcCBvbmUgCnJlZmVyZW5jZSB2aWEga3ZtX3JlbGVhc2VfcGZuX2Ns
ZWFuKCkuIElPVywga3ZtX2dldF9wZm4oKSBnZXRzICpyZWFsbHkqIApkYW5nZXJvdXMgdG8gdXNl
LiBJIGNhbid0IHRlbGwgaWYgdGhpcyBjYW4gaGFwcGVuIHJpZ2h0IG5vdy4KCldlIGRvIGhhdmUg
MyB1c2VycyBvZiBrdm1fZ2V0X3BmbigpIHRoYXQgd2UgaGF2ZSB0byBhdWRpdCBiZWZvcmUgdGhp
cyAKY2hhbmdlLiBBbHNvLCB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCB0byBrdm1fZ2V0X3Bmbigp
IHRoYXQgaXQgc2hvdWxkIApuZXZlciBiZSB1c2VkIHdpdGggcG9zc2libGUgWk9ORV9ERVZJQ0Ug
cGFnZXMuCgpBbHNvLCB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCB0byBrdm1fcmVsZWFzZV9wZm5f
Y2xlYW4oKSwgZGVzY3JpYmluZyB3aHkgCndlIHRyZWF0IFpPTkVfREVWSUNFIGluIGEgc3BlY2lh
bCB3YXkgaGVyZS4KCgpXZSBjYW4gdGhlbiBwcm9ncmVzcyBsaWtlIHRoaXMKCjEuIEdldCB0aGlz
IGZpeCB1cHN0cmVhbSwgaXQncyBzb21ld2hhdCB1bnJlbGF0ZWQgdG8gdGhpcyBzZXJpZXMuCjIu
IFRoaXMgcGF0Y2ggaGVyZSByZW1haW5zIGFzIGlzIGluIHRoaXMgc2VyaWVzICgrLy0gZG9jdW1l
bnRhdGlvbiB1cGRhdGUpCjMuIExvbmcgdGVybSwgcmV3b3JrIEtWTSB0byBub3QgaGF2ZSB0byBu
b3QgdHJlYXQgWk9ORV9ERVZJQ0UgbGlrZSAKcmVzZXJ2ZWQgcGFnZXMuIEUuZy4sIGdldCByaWQg
b2Yga3ZtX2dldF9wZm4oKS4gVGhlbiwgdGhpcyBzcGVjaWFsIHpvbmUgCmNoZWNrIGNhbiBnby4K
Ci0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
