Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5559E21C2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:31:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNKR0-00050W-SM; Wed, 23 Oct 2019 17:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNKQz-00050R-An
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:28:33 +0000
X-Inumbo-ID: 88258ed3-f5ba-11e9-9488-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 88258ed3-f5ba-11e9-9488-12813bfff9fa;
 Wed, 23 Oct 2019 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571851711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=J6HNws0xA/AsXkHjQ/pdjHOK025O6pzwFGFItFlERTw=;
 b=M10U18zgRCj7n0smMLJ/d3iOwQ+qJx3hIPV1bELgFfCR9pEHreg7T/ADnopxf10GrKSSUb
 9NkagzWfQ7aFcpLGp0voUOX58fuyHmi7v7dc5tG4MAWIDcJ8CJpT4RMFI5lNhjzppU7fe0
 qH8gOB9vyi8unLff3yNqqlYg7cSHl9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-JMvG9S55OleyWzOwpAMXPQ-1; Wed, 23 Oct 2019 13:28:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A4C1005509;
 Wed, 23 Oct 2019 17:28:17 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F5D60166;
 Wed, 23 Oct 2019 17:27:58 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
 <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
Date: Wed, 23 Oct 2019 19:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JMvG9S55OleyWzOwpAMXPQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 00/12] mm: Don't mark hotplugged
 pages PG_reserved (including ZONE_DEVICE)
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>, Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4gSSBkaXNsaWtlIHRoaXMgZm9yIHRocmVlIHJlYXNvbnMKPj4KPj4gYSkgSXQgZG9lcyBub3Qg
cHJvdGVjdCBhZ2FpbnN0IGFueSByYWNlcywgcmVhbGx5LCBpdCBkb2VzIG5vdCBpbXByb3ZlIHRo
aW5ncy4KPj4gYikgV2UgZG8gaGF2ZSB0aGUgZXhhY3Qgc2FtZSBwcm9ibGVtIHdpdGggcGZuX3Rv
X29ubGluZV9wYWdlKCkuIEFzIGxvbmcgYXMgd2UKPj4gICAgZG9uJ3QgaG9sZCB0aGUgbWVtb3J5
IGhvdHBsdWcgbG9jaywgbWVtb3J5IGNhbiBnZXQgb2ZmbGluZWQgYW5kIHJlbW92ZSBhbnkgdGlt
ZS4gUmFjeS4KPiAKPiBUcnVlLCB3ZSBuZWVkIHRvIHNvbHZlIHRoYXQgcHJvYmxlbSB0b28uIFRo
YXQgc2VlbXMgdG8gd2FudCBzb21ldGhpbmcKPiBsaWdodGVyIHdlaWdodCB0aGFuIHRoZSBob3Rw
bHVnIGxvY2sgdGhhdCBjYW4gYmUgaGVsZCBvdmVyIHBmbiBsb29rdXBzCj4gKyAgdXNlIHJhdGhl
ciB0aGFuIHJlcXVpcmluZyBhIHBhZ2UgbG9va3VwIGluIHBhdGhzIHdoZXJlIGl0J3Mgbm90Cj4g
Y2xlYXIgdGhhdCBhIHBhZ2UgcmVmZXJlbmNlIHdvdWxkIHByZXZlbnQgdW5wbHVnLgo+IAo+PiBj
KSBXZSBtaXggaW4gWk9ORSBzcGVjaWZpYyBzdHVmZiBpbnRvIHRoZSBjb3JlLiBJdCBzaG91bGQg
YmUgImp1c3QgYW5vdGhlciB6b25lIgo+IAo+IE5vdCBzdXJlIEkgZ3JvayB0aGlzIHdoZW4gdGhl
IFJGQyBpcyBzcHJpbmtsaW5nIHpvbmUtc3BlY2lmaWMKPiBpc196b25lX2RldmljZV9wYWdlKCkg
dGhyb3VnaG91dCB0aGUgY29yZT8KCk1vc3QgdXNlcnMgc2hvdWxkIG5vdCBjYXJlIGFib3V0IHRo
ZSB6b25lLiBwZm5fYWN0aXZlKCkgd291bGQgYmUgZW5vdWdoCmluIG1vc3Qgc2l0dWF0aW9ucywg
ZXNwZWNpYWxseSBtb3N0IFBGTiB3YWxrZXJzIC0gInRoaXMgbWVtbWFwIGlzIHZhbGlkCmFuZCBl
LmcuLCBjb250YWlucyBhIHZhbGlkIHpvbmUgLi4uIi4KCj4gCj4+Cj4+IFdoYXQgSSBwcm9wb3Nl
IGluc3RlYWQgKGFscmVhZHkgZGlzY3Vzc2VkIGluIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5
LzEwLzEwLzg3KQo+IAo+IFNvcnJ5IEkgbWlzc2VkIHRoaXMgZWFybGllci4uLgo+IAo+Pgo+PiAx
LiBDb252ZXJ0IFNFQ1RJT05fSVNfT05MSU5FIHRvIFNFQ1RJT05fSVNfQUNUSVZFCj4+IDIuIENv
bnZlcnQgU0VDVElPTl9JU19BQ1RJVkUgdG8gYSBzdWJzZWN0aW9uIGJpdG1hcAo+PiAzLiBJbnRy
b2R1Y2UgcGZuX2FjdGl2ZSgpIHRoYXQgY2hlY2tzIGFnYWluc3QgdGhlIHN1YnNlY3Rpb24gYml0
bWFwCj4+IDQuIE9uY2UgdGhlIG1lbW1hcCB3YXMgaW5pdGlhbGl6ZWQgLyBwcmVwYXJlZCwgc2V0
IHRoZSBzdWJzZWN0aW9uIGFjdGl2ZQo+PiAgICAoc2ltaWxhciB0byBTRUNUSU9OX0lTX09OTElO
RSBpbiB0aGUgYnVkZHkgcmlnaHQgbm93KQo+PiA1LiBCZWZvcmUgdGhlIG1lbW1hcCBnZXRzIGlu
dmFsaWRhdGVkLCBzZXQgdGhlIHN1YnNlY3Rpb24gaW5hY3RpdmUKPj4gICAgKHNpbWlsYXIgdG8g
U0VDVElPTl9JU19PTkxJTkUgaW4gdGhlIGJ1ZGR5IHJpZ2h0IG5vdykKPj4gNS4gcGZuX3RvX29u
bGluZV9wYWdlKCkgPSBwZm5fYWN0aXZlKCkgJiYgem9uZSAhPSBaT05FX0RFVklDRQo+PiA2LiBw
Zm5fdG9fZGV2aWNlX3BhZ2UoKSA9IHBmbl9hY3RpdmUoKSAmJiB6b25lID09IFpPTkVfREVWSUNF
Cj4gCj4gVGhpcyBkb2VzIG5vdCBzZWVtIHRvIHJlZHVjZSBhbnkgY29tcGxleGl0eSBiZWNhdXNl
IGl0IHN0aWxsIHJlcXVpcmVzCj4gYSBwZm4gdG8gem9uZSBsb29rdXAgYXQgdGhlIGVuZCBvZiB0
aGUgcHJvY2Vzcy4KPiAKPiBJLmUuIGNvbnZlcnRpbmcgcGZuX3RvX29ubGluZV9wYWdlKCkgdG8g
dXNlIGEgbmV3IHBmbl9hY3RpdmUoKQo+IHN1YnNlY3Rpb24gbWFwIHBsdXMgbG9va2luZyB1cCB0
aGUgem9uZSBmcm9tIHBmbl90b19wYWdlKCkgaXMgbW9yZQo+IHN0ZXBzIHRoYW4ganVzdCBkb2lu
ZyBhIGRpcmVjdCBwZm4gdG8gem9uZSBsb29rdXAuIFdoYXQgYW0gSSBtaXNzaW5nPwoKVGhhdCBh
IHJlYWwgInBmbiB0byB6b25lIiBsb29rdXAgd2l0aG91dCBnb2luZyB2aWEgdGhlIHN0cnVjdCBw
YWdlIHdpbGwKcmVxdWlyZSB0byBoYXZlIG1vcmUgdGhhbiBqdXN0IGEgc2luZ2xlIGJpdG1hcC4g
SU1ITywga2VlcGluZyB0aGUKaW5mb3JtYXRpb24gYXQgYSBzaW5nbGUgcGxhY2UgKG1lbW1hcCkg
aXMgdGhlIGNsZWFuIHRoaW5nIHRvIGRvIChub3QKcmVwbGljYXRpbmcgaXQgc29tZXdoZXJlIGVs
c2UpLiBHb2luZyB2aWEgdGhlIG1lbW1hcCBtaWdodCBub3QgYmUgYXMKZmFzdCBhcyBhIGRpcmVj
dCBsb29rdXAsIGJ1dCBkbyB3ZSBhY3R1YWxseSBjYXJlPyBXZSBhcmUgYWxyZWFkeSBsb29raW5n
CmF0ICJyYW5kb20gUEZOcyB3ZSBhcmUgbm90IHN1cmUgaWYgdGhlcmUgaXMgYSB2YWxpZCBtZW1t
YXAiLgoKPj4KPj4gRXNwZWNpYWxseSwgZHJpdmVyLXJlc2VydmVkIGRldmljZSBtZW1vcnkgd2ls
bCBub3QgZ2V0IHNldCBhY3RpdmUgaW4KPj4gdGhlIHN1YnNlY3Rpb24gYml0bWFwLgo+Pgo+PiBO
b3cgdG8gdGhlIHJhY2UuIFRha2luZyB0aGUgbWVtb3J5IGhvdHBsdWcgbG9jayBhdCByYW5kb20g
cGxhY2VzIGlzIHVnbHkuIEkgZG8KPj4gd29uZGVyIGlmIHdlIGNhbiB1c2UgUkNVOgo+IAo+IEFo
LCB5ZXMsIGV4YWN0bHkgd2hhdCBJIHdhcyB0aGlua2luZyBhYm92ZS4KPiAKPj4KPj4gVGhlIHVz
ZXIgb2YgcGZuX2FjdGl2ZSgpL3Bmbl90b19vbmxpbmVfcGFnZSgpL3Bmbl90b19kZXZpY2VfcGFn
ZSgpOgo+Pgo+PiAgICAgICAgIC8qIHRoZSBtZW1tYXAgaXMgZ3VhcmFudGVlZCB0byByZW1haW4g
YWN0aXZlIHVuZGVyIFJDVSAqLwo+PiAgICAgICAgIHJjdV9yZWFkX2xvY2soKTsKPj4gICAgICAg
ICBpZiAocGZuX2FjdGl2ZShyYW5kb21fcGZuKSkgewo+PiAgICAgICAgICAgICAgICAgcGFnZSA9
IHBmbl90b19wYWdlKHJhbmRvbV9wZm4pOwo+PiAgICAgICAgICAgICAgICAgLi4uIHVzZSB0aGUg
cGFnZSwgc3RheXMgdmFsaWQKPj4gICAgICAgICB9Cj4+ICAgICAgICAgcmN1X3VucmVhZF9sb2Nr
KCk7Cj4+Cj4+IE1lbW9yeSBvZmZsaW5pbmcvbWVtcmVtYXAgY29kZToKPj4KPj4gICAgICAgICBz
ZXRfc3Vic2VjdGlvbnNfaW5hY3RpdmUocGZuLCBucl9wYWdlcyk7IC8qIGNsZWFycyB0aGUgYml0
IGF0b21pY2FsbHkgKi8KPj4gICAgICAgICBzeW5jaHJvbml6ZV9yY3UoKTsKPj4gICAgICAgICAv
KiBhbGwgdXNlcnMgc2F3IHRoZSBiaXRtYXAgdXBkYXRlLCB3ZSBjYW4gaW52YWxpZGUgdGhlIG1l
bW1hcCAqLwo+PiAgICAgICAgIHJlbW92ZV9wZm5fcmFuZ2VfZnJvbV96b25lKHpvbmUsIHBmbiwg
bnJfcGFnZXMpOwo+IAo+IExvb2tzIGdvb2QgdG8gbWUuCj4gCj4+Cj4+Pgo+Pj4+Cj4+Pj4gSSBv
bmx5IGdhdmUgaXQgYSBxdWljayB0ZXN0IHdpdGggRElNTXMgb24geDg2LTY0LCBidXQgZGlkbid0
IHRlc3QgdGhlCj4+Pj4gWk9ORV9ERVZJQ0UgcGFydCBhdCBhbGwgKGFueSB0aXBzIGZvciBhIG5p
Y2UgUUVNVSBzZXR1cD8pLiBDb21waWxlLXRlc3RlZAo+Pj4+IG9uIHg4Ni02NCBhbmQgUFBDLgo+
Pj4KPj4+IEknbGwgZ2l2ZSBpdCBhIHNwaW4sIGJ1dCBJIGRvbid0IHRoaW5rIHRoZSBrZXJuZWwg
d2FudHMgdG8gZ3JvdyBtb3JlCj4+PiBpc196b25lX2RldmljZV9wYWdlKCkgdXNlcnMuCj4+Cj4+
IExldCdzIHJlY2FwLiBJbiB0aGlzIFJGQywgSSBpbnRyb2R1Y2UgYSB0b3RhbCBvZiA0ICghKSB1
c2VycyBvbmx5Lgo+PiBUaGUgb3RoZXIgcGFydHMgY2FuIHJlbHkgb24gcGZuX3RvX29ubGluZV9w
YWdlKCkgb25seS4KPj4KPj4gMS4gInN0YWdpbmc6IGtwYzIwMDA6IFByZXBhcmUgdHJhbnNmZXJf
Y29tcGxldGVfY2IoKSBmb3IgUEdfcmVzZXJ2ZWQgY2hhbmdlcyIKPj4gLSBCYXNpY2FsbHkgbmV2
ZXIgdXNlZCB3aXRoIFpPTkVfREVWSUNFLgo+PiAtIFdlIGhvbGQgYSByZWZlcmVuY2UhCj4+IC0g
QWxsIGl0IHByb3RlY3RzIGlzIGEgU2V0UGFnZURpcnR5KHBhZ2UpOwo+Pgo+PiAyLiAic3RhZ2lu
Zy9nYXNrZXQ6IFByZXBhcmUgZ2Fza2V0X3JlbGVhc2VfcGFnZSgpIGZvciBQR19yZXNlcnZlZCBj
aGFuZ2VzIgo+PiAtIFNhbWUgYXMgMS4KPj4KPj4gMy4gIm1tL3VzZXJjb3B5LmM6IFByZXBhcmUg
Y2hlY2tfcGFnZV9zcGFuKCkgZm9yIFBHX3Jlc2VydmVkIGNoYW5nZXMiCj4+IC0gV2UgY29tZSB2
aWEgdmlydF90b19oZWFkX3BhZ2UoKSAvIHZpcnRfdG9faGVhZF9wYWdlKCksIG5vdCBzdXJlIGFi
b3V0Cj4+ICAgcmVmZXJlbmNlcyAoSSBhc3N1bWUgdGhpcyBzaG91bGQgYmUgZmluZSBhcyB3ZSBk
b24ndCBjb21lIHZpYSByYW5kb20KPj4gICBQRk5zKQo+PiAtIFdlIGNoZWNrIHRoYXQgd2UgZG9u
J3QgbWl4IFJlc2VydmVkIChpbmNsdWRpbmcgZGV2aWNlIG1lbW9yeSkgYW5kIENNQQo+PiAgIHBh
Z2VzIHdoZW4gY3Jvc3NpbmcgY29tcG91bmQgcGFnZXMuCj4+Cj4+IEkgdGhpbmsgd2UgY2FuIGRy
b3AgMS4gYW5kIDIuLCByZXN1bHRpbmcgaW4gYSB0b3RhbCBvZiAyIG5ldyB1c2VycyBpbgo+PiB0
aGUgc2FtZSBjb250ZXh0LiBJIHRoaW5rIHRoYXQgaXMgdG90YWxseSB0b2xlcmFibGUgdG8gZmlu
YWxseSBjbGVhbgo+PiB0aGlzIHVwLgo+IAo+IC4uLmJ1dCBtb3JlIGlzX3pvbmVfZGV2aWNlX3Bh
Z2UoKSBkb2Vzbid0ICJmaW5hbGx5IGNsZWFuIHRoaXMgdXAiLgo+IExpa2Ugd2UgZGlzY3Vzc2Vk
IGFib3ZlIGl0J3MgdGhlIG1pc3NpbmcgbG9ja2luZyB0aGF0J3MgdGhlIHJlYWwKPiBjbGVhbnVw
LCB0aGUgcGZuX3RvX29ubGluZV9wYWdlKCkgaW50ZXJuYWxzIGFyZSBzZWNvbmRhcnkuCgpJdCdz
IGEgZGlmZmVyZW50IGNsZWFudXAgSU1ITy4gV2UgY2FuJ3QgZG8gZXZlcnl0aGluZyBpbiBvbmUg
c2hvdC4gQnV0Cm1heWJlIEkgY2FuIGRyb3AgdGhlIGlzX3pvbmVfZGV2aWNlX3BhZ2UoKSBwYXJ0
cyBmcm9tIHRoaXMgcGF0Y2ggYW5kCmNvbXBsZXRlbHkgcmVseSBvbiBwZm5fdG9fb25saW5lX3Bh
Z2UoKS4gWWVzLCB0aGF0IG5lZWRzIGZpeGluZyB0bywgYnV0Cml0J3MgYSBkaWZmZXJlbnQgc3Rv
cnkuCgpUaGUgaW1wb3J0YW50IHBhcnQgb2YgdGhpcyBwYXRjaDoKCldoaWxlIHBmbl90b19vbmxp
bmVfcGFnZSgpIHdpbGwgYWx3YXlzIGV4Y2x1ZGUgWk9ORV9ERVZJQ0UgcGFnZXMsCmNoZWNraW5n
IFBHX3Jlc2VydmVkIG9uIFpPTkVfREVWSUNFIHBhZ2VzICh3aGF0IHdlIGRvIHJpZ2h0IG5vdyEp
IGlzCnJhY3kgYXMgaGVsbCAoZXNwZWNpYWxseSB3aGVuIGNvbmN1cnJlbnRseSBpbml0aWFsaXpp
bmcgdGhlIG1lbW1hcCkuCgpUaGlzIGRvZXMgaW1wcm92ZSB0aGUgc2l0dWF0aW9uLgoKPj4KPj4g
SG93ZXZlciwgSSB0aGluayB3ZSBhbHNvIGhhdmUgdG8gY2xhcmlmeSBpZiB3ZSBuZWVkIHRoZSBj
aGFuZ2UgaW4gMyBhdCBhbGwuCj4+IEl0IGNvbWVzIGZyb20KPj4KPj4gY29tbWl0IGY1NTA5Y2Mx
OGRhYTdmODJiY2M1NTNiZTcwZGYyMTE3YzhlZWRjMTYKPj4gQXV0aG9yOiBLZWVzIENvb2sgPGtl
ZXNjb29rQGNocm9taXVtLm9yZz4KPj4gRGF0ZTogICBUdWUgSnVuIDcgMTE6MDU6MzMgMjAxNiAt
MDcwMAo+Pgo+PiAgICAgbW06IEhhcmRlbmVkIHVzZXJjb3B5Cj4+Cj4+ICAgICBUaGlzIGlzIHRo
ZSBzdGFydCBvZiBwb3J0aW5nIFBBWF9VU0VSQ09QWSBpbnRvIHRoZSBtYWlubGluZSBrZXJuZWwu
IFRoaXMKPj4gICAgIGlzIHRoZSBmaXJzdCBzZXQgb2YgZmVhdHVyZXMsIGNvbnRyb2xsZWQgYnkg
Q09ORklHX0hBUkRFTkVEX1VTRVJDT1BZLiBUaGUKPj4gICAgIHdvcmsgaXMgYmFzZWQgb24gY29k
ZSBieSBQYVggVGVhbSBhbmQgQnJhZCBTcGVuZ2xlciwgYW5kIGFuIGVhcmxpZXIgcG9ydAo+PiAg
ICAgZnJvbSBDYXNleSBTY2hhdWZsZXIuIEFkZGl0aW9uYWwgbm9uLXNsYWIgcGFnZSB0ZXN0cyBh
cmUgZnJvbSBSaWsgdmFuIFJpZWwuCj4+IFsuLi5dCj4+ICAgICAtIG90aGVyd2lzZSwgb2JqZWN0
IG11c3Qgbm90IHNwYW4gcGFnZSBhbGxvY2F0aW9ucyAoZXhjZXB0aW5nIFJlc2VydmVkCj4+ICAg
ICAgIGFuZCBDTUEgcmFuZ2VzKQo+Pgo+PiBOb3Qgc3VyZSBpZiB3ZSByZWFsbHkgaGF2ZSB0byBj
YXJlIGFib3V0IFpPTkVfREVWSUNFIGF0IHRoaXMgcG9pbnQuCj4gCj4gVGhhdCBjaGVjayBuZWVk
cyB0byBiZSBjYXJlZnVsIHRvIGlnbm9yZSBaT05FX0RFVklDRSBwYWdlcy4gVGhlcmUncwo+IG5v
dGhpbmcgd3Jvbmcgd2l0aCBhIGNvcHkgc3Bhbm5pbmcgWk9ORV9ERVZJQ0UgYW5kIHR5cGljYWwg
cGFnZXMuCgpQbGVhc2Ugbm90ZSB0aGF0IHRoZSBjdXJyZW50IGNoZWNrIHdvdWxkICpmb3JiaWQq
IHRoaXMgKEFGQUlLcyBmb3IgYQpzaW5nbGUgaGVhcCBvYmplY3QpLiBBcyBkaXNjdXNzZWQgaW4g
dGhlIHJlbGV2YW50IHBhdGNoLCB3ZSBtaWdodCBiZQphYmxlIHRvIGp1c3Qgc3RvcCBkb2luZyB0
aGF0IGFuZCBsaW1pdCBpdCB0byByZWFsIFBHX3Jlc2VydmVkIHBhZ2VzCih3aXRob3V0IFpPTkVf
REVWSUNFKS4gSSdkIGJlIGhhcHB5IHRvIG5vdCBpbnRyb2R1Y2UgbmV3CmlzX3pvbmVfZGV2aWNl
X3BhZ2UoKSB1c2Vycy4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
