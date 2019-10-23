Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F23E1325
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 09:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNB2l-0001Ze-B3; Wed, 23 Oct 2019 07:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNB2j-0001ZX-Ou
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 07:26:54 +0000
X-Inumbo-ID: 79454c94-f566-11e9-9475-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 79454c94-f566-11e9-9475-12813bfff9fa;
 Wed, 23 Oct 2019 07:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571815607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqj7mWapMXwFuuq2/mW1H9c11PZgA0AV8N9N9x1ibmk=;
 b=ckoX6bYqXETU7YMu96OyHRl5LFunGPlocmkxCnu+/rZ5j6/0kUk1ai8bTU0SDVJoYyXH/0
 lMcPa1zdUQgAY0Rvbc0iomY2osK73+O42MtVA06sIjjPvd0Dg3jDfuZ8pEWyTNUtp9DhHs
 oAiXnpaRD/Mcx9VYg/2ZqOJvsBOGWQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-6siTvHv7N3OCx9U1X4BmBg-1; Wed, 23 Oct 2019 03:26:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA4580183D;
 Wed, 23 Oct 2019 07:26:39 +0000 (UTC)
Received: from [10.36.117.79] (ovpn-117-79.ams2.redhat.com [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2089C5C219;
 Wed, 23 Oct 2019 07:26:17 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
Date: Wed, 23 Oct 2019 09:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6siTvHv7N3OCx9U1X4BmBg-1
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

T24gMjIuMTAuMTkgMjM6NTQsIERhbiBXaWxsaWFtcyB3cm90ZToKPiBIaSBEYXZpZCwKPiAKPiBU
aGFua3MgZm9yIHRhY2tsaW5nIHRoaXMhCgpUaGFua3MgZm9yIGhhdmluZyBhIGxvb2sgOikKClsu
Li5dCgoKPj4gSSBhbSBwcm9iYWJseSBhIGxpdHRsZSBiaXQgdG9vIGNhcmVmdWwgKGJ1dCBJIGRv
bid0IHdhbnQgdG8gYnJlYWsgdGhpbmdzKS4KPj4gSW4gbW9zdCBwbGFjZXMgKGJlc2lkZXMgS1ZN
IGFuZCB2ZmlvIHRoYXQgYXJlIG51dHMpLCB0aGUKPj4gcGZuX3RvX29ubGluZV9wYWdlKCkgY2hl
Y2sgY291bGQgbW9zdCBwcm9iYWJseSBiZSBhdm9pZGVkIGJ5IGEKPj4gaXNfem9uZV9kZXZpY2Vf
cGFnZSgpIGNoZWNrLiBIb3dldmVyLCBJIHVzdWFsbHkgZ2V0IHN1c3BpY2lvdXMgd2hlbiBJIHNl
ZQo+PiBhIHBmbl92YWxpZCgpIGNoZWNrIChlc3BlY2lhbGx5IGFmdGVyIEkgbGVhcm5lZCB0aGF0
IHBlb3BsZSBtbWFwIHBhcnRzIG9mCj4+IC9kZXYvbWVtIGludG8gdXNlciBzcGFjZSwgaW5jbHVk
aW5nIG1lbW9yeSB3aXRob3V0IG1lbW1hcHMuIEFsc28sIHBlb3BsZQo+PiBjb3VsZCBtZW1tYXAg
b2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoaXMgd2F5IDovKS4gQXMgbG9uZyBhcyB0aGlzIGRvZXMg
bm90Cj4+IGh1cnQgcGVyZm9ybWFuY2UsIEkgdGhpbmsgd2Ugc2hvdWxkIHJhdGhlciBkbyBpdCB0
aGUgY2xlYW4gd2F5Lgo+IAo+IEknbSBjb25jZXJuZWQgYWJvdXQgdXNpbmcgaXNfem9uZV9kZXZp
Y2VfcGFnZSgpIGluIHBsYWNlcyB0aGF0IGFyZSBub3QKPiBrbm93biB0byBhbHJlYWR5IGhhdmUg
YSByZWZlcmVuY2UgdG8gdGhlIHBhZ2UuIEhlcmUncyBhbiBhdWRpdCBvZgo+IGN1cnJlbnQgdXNh
Z2VzLCBhbmQgdGhlIG9uZXMgSSB0aGluayBuZWVkIHRvIGNsZWFuZWQgdXAuIFRoZSAidW5zYWZl
Igo+IG9uZXMgZG8gbm90IGFwcGVhciB0byBoYXZlIGFueSBwcm90ZWN0aW9ucyBhZ2FpbnN0IHRo
ZSBkZXZpY2UgcGFnZQo+IGJlaW5nIHJlbW92ZWQgKGdldF9kZXZfcGFnZW1hcCgpKS4gWWVzLCBz
b21lIG9mIHRoZXNlIHdlcmUgYWRkZWQgYnkKPiBtZS4gVGhlICJ1bnNhZmU/IEhNTSIgb25lcyBu
ZWVkIEhNTSBleWVzIGJlY2F1c2UgSE1NIGxlYWtzIGRldmljZQo+IHBhZ2VzIGludG8gYW5vbnlt
b3VzIG1lbW9yeSBwYXRocyBhbmQgSSdtIG5vdCB1cCB0byBzcGVlZCBvbiBob3cgaXQKPiBndWFy
YW50ZWVzICdzdHJ1Y3QgcGFnZScgdmFsaWRpdHkgdnMgZGV2aWNlIHNodXRkb3duIHdpdGhvdXQg
dXNpbmcKPiBnZXRfZGV2X3BhZ2VtYXAoKS4KPiAKPiBzbWFwc19wbWRfZW50cnkoKTogdW5zYWZl
Cj4gCj4gcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKTogc2FmZSwgcGFnZSByZWZlcmVuY2UgaXMg
aGVsZAo+IAo+IGlzX2RldmljZV9wcml2YXRlX3BhZ2UoKTogc2FmZT8gZ3B1IGRyaXZlciBtYW5h
Z2VzIHByaXZhdGUgcGFnZSBsaWZldGltZQo+IAo+IGlzX3BjaV9wMnBkbWFfcGFnZSgpOiBzYWZl
LCBwYWdlIHJlZmVyZW5jZSBpcyBoZWxkCj4gCj4gdW5jaGFyZ2VfcGFnZSgpOiB1bnNhZmU/IEhN
TQo+IAo+IGFkZF90b19raWxsKCk6IHNhZmUsIHByb3RlY3RlZCBieSBnZXRfZGV2X3BhZ2VtYXAo
KSBhbmQgZGF4X2xvY2tfcGFnZSgpCj4gCj4gc29mdF9vZmZsaW5lX3BhZ2UoKTogdW5zYWZlCj4g
Cj4gcmVtb3ZlX21pZ3JhdGlvbl9wdGUoKTogdW5zYWZlPyBITU0KPiAKPiBtb3ZlX3RvX25ld19w
YWdlKCk6IHVuc2FmZT8gSE1NCj4gCj4gbWlncmF0ZV92bWFfcGFnZXMoKSBhbmQgaGVscGVyczog
dW5zYWZlPyBITU0KPiAKPiB0cnlfdG9fdW5tYXBfb25lKCk6IHVuc2FmZT8gSE1NCj4gCj4gX19w
dXRfcGFnZSgpOiBzYWZlCj4gCj4gcmVsZWFzZV9wYWdlcygpOiBzYWZlCj4gCj4gSSdtIGhvcGlu
ZyBhbGwgdGhlIEhNTSBvbmVzIGNhbiBiZSBjb252ZXJ0ZWQgdG8KPiBpc19kZXZpY2VfcHJpdmF0
ZV9wYWdlKCkgZGlyZWN0bGx5IGFuZCBoYXZlIHRoYXQgcm91dGluZSBncm93IGEgbmljZQo+IGNv
bW1lbnQgYWJvdXQgaG93IGl0IGtub3dzIGl0IGNhbiBhbHdheXMgc2FmZWx5IGRlLXJlZmVyZW5j
ZSBpdHMgQHBhZ2UKPiBhcmd1bWVudC4KPiAKPiBGb3IgdGhlIHJlc3QgSSdkIGxpa2UgdG8gcHJv
cG9zZSB0aGF0IHdlIGFkZCBhIGZhY2lsaXR5IHRvIGRldGVybWluZQo+IFpPTkVfREVWSUNFIGJ5
IHBmbiByYXRoZXIgdGhhbiBwYWdlLiBUaGUgbW9zdCBzdHJhaWdodGZvcndhcmQgd2h5IEkKPiBj
YW4gdGhpbmsgb2Ygd291bGQgYmUgdG8ganVzdCBhZGQgYW5vdGhlciBiaXRtYXAgdG8gbWVtX3Nl
Y3Rpb25fdXNhZ2UKPiB0byBpbmRpY2F0ZSBpZiBhIHN1YnNlY3Rpb24gaXMgWk9ORV9ERVZJQ0Ug
b3Igbm90LgoKKGl0J3MgYSBzb21ld2hhdCB1bnJlbGF0ZWQgYmlnZ2VyIGRpc2N1c3Npb24sIGJ1
dCB3ZSBjYW4gc3RhcnQgZGlzY3Vzc2luZyBpdCBpbiB0aGlzIHRocmVhZCkKCkkgZGlzbGlrZSB0
aGlzIGZvciB0aHJlZSByZWFzb25zCgphKSBJdCBkb2VzIG5vdCBwcm90ZWN0IGFnYWluc3QgYW55
IHJhY2VzLCByZWFsbHksIGl0IGRvZXMgbm90IGltcHJvdmUgdGhpbmdzLgpiKSBXZSBkbyBoYXZl
IHRoZSBleGFjdCBzYW1lIHByb2JsZW0gd2l0aCBwZm5fdG9fb25saW5lX3BhZ2UoKS4gQXMgbG9u
ZyBhcyB3ZQogICBkb24ndCBob2xkIHRoZSBtZW1vcnkgaG90cGx1ZyBsb2NrLCBtZW1vcnkgY2Fu
IGdldCBvZmZsaW5lZCBhbmQgcmVtb3ZlIGFueSB0aW1lLiBSYWN5LgpjKSBXZSBtaXggaW4gWk9O
RSBzcGVjaWZpYyBzdHVmZiBpbnRvIHRoZSBjb3JlLiBJdCBzaG91bGQgYmUgImp1c3QgYW5vdGhl
ciB6b25lIgoKV2hhdCBJIHByb3Bvc2UgaW5zdGVhZCAoYWxyZWFkeSBkaXNjdXNzZWQgaW4gaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAvMTAvODcpCgoxLiBDb252ZXJ0IFNFQ1RJT05fSVNf
T05MSU5FIHRvIFNFQ1RJT05fSVNfQUNUSVZFCjIuIENvbnZlcnQgU0VDVElPTl9JU19BQ1RJVkUg
dG8gYSBzdWJzZWN0aW9uIGJpdG1hcAozLiBJbnRyb2R1Y2UgcGZuX2FjdGl2ZSgpIHRoYXQgY2hl
Y2tzIGFnYWluc3QgdGhlIHN1YnNlY3Rpb24gYml0bWFwCjQuIE9uY2UgdGhlIG1lbW1hcCB3YXMg
aW5pdGlhbGl6ZWQgLyBwcmVwYXJlZCwgc2V0IHRoZSBzdWJzZWN0aW9uIGFjdGl2ZQogICAoc2lt
aWxhciB0byBTRUNUSU9OX0lTX09OTElORSBpbiB0aGUgYnVkZHkgcmlnaHQgbm93KQo1LiBCZWZv
cmUgdGhlIG1lbW1hcCBnZXRzIGludmFsaWRhdGVkLCBzZXQgdGhlIHN1YnNlY3Rpb24gaW5hY3Rp
dmUKICAgKHNpbWlsYXIgdG8gU0VDVElPTl9JU19PTkxJTkUgaW4gdGhlIGJ1ZGR5IHJpZ2h0IG5v
dykKNS4gcGZuX3RvX29ubGluZV9wYWdlKCkgPSBwZm5fYWN0aXZlKCkgJiYgem9uZSAhPSBaT05F
X0RFVklDRQo2LiBwZm5fdG9fZGV2aWNlX3BhZ2UoKSA9IHBmbl9hY3RpdmUoKSAmJiB6b25lID09
IFpPTkVfREVWSUNFCgpFc3BlY2lhbGx5LCBkcml2ZXItcmVzZXJ2ZWQgZGV2aWNlIG1lbW9yeSB3
aWxsIG5vdCBnZXQgc2V0IGFjdGl2ZSBpbgp0aGUgc3Vic2VjdGlvbiBiaXRtYXAuCgpOb3cgdG8g
dGhlIHJhY2UuIFRha2luZyB0aGUgbWVtb3J5IGhvdHBsdWcgbG9jayBhdCByYW5kb20gcGxhY2Vz
IGlzIHVnbHkuIEkgZG8Kd29uZGVyIGlmIHdlIGNhbiB1c2UgUkNVOgoKVGhlIHVzZXIgb2YgcGZu
X2FjdGl2ZSgpL3Bmbl90b19vbmxpbmVfcGFnZSgpL3Bmbl90b19kZXZpY2VfcGFnZSgpOgoKCS8q
IHRoZSBtZW1tYXAgaXMgZ3VhcmFudGVlZCB0byByZW1haW4gYWN0aXZlIHVuZGVyIFJDVSAqLwoJ
cmN1X3JlYWRfbG9jaygpOwoJaWYgKHBmbl9hY3RpdmUocmFuZG9tX3BmbikpIHsKCQlwYWdlID0g
cGZuX3RvX3BhZ2UocmFuZG9tX3Bmbik7CgkJLi4uIHVzZSB0aGUgcGFnZSwgc3RheXMgdmFsaWQK
CX0KCXJjdV91bnJlYWRfbG9jaygpOwoKTWVtb3J5IG9mZmxpbmluZy9tZW1yZW1hcCBjb2RlOgoK
CXNldF9zdWJzZWN0aW9uc19pbmFjdGl2ZShwZm4sIG5yX3BhZ2VzKTsgLyogY2xlYXJzIHRoZSBi
aXQgYXRvbWljYWxseSAqLwoJc3luY2hyb25pemVfcmN1KCk7CgkvKiBhbGwgdXNlcnMgc2F3IHRo
ZSBiaXRtYXAgdXBkYXRlLCB3ZSBjYW4gaW52YWxpZGUgdGhlIG1lbW1hcCAqLwoJcmVtb3ZlX3Bm
bl9yYW5nZV9mcm9tX3pvbmUoem9uZSwgcGZuLCBucl9wYWdlcyk7Cgo+IAo+Pgo+PiBJIG9ubHkg
Z2F2ZSBpdCBhIHF1aWNrIHRlc3Qgd2l0aCBESU1NcyBvbiB4ODYtNjQsIGJ1dCBkaWRuJ3QgdGVz
dCB0aGUKPj4gWk9ORV9ERVZJQ0UgcGFydCBhdCBhbGwgKGFueSB0aXBzIGZvciBhIG5pY2UgUUVN
VSBzZXR1cD8pLiBDb21waWxlLXRlc3RlZAo+PiBvbiB4ODYtNjQgYW5kIFBQQy4KPiAKPiBJJ2xs
IGdpdmUgaXQgYSBzcGluLCBidXQgSSBkb24ndCB0aGluayB0aGUga2VybmVsIHdhbnRzIHRvIGdy
b3cgbW9yZQo+IGlzX3pvbmVfZGV2aWNlX3BhZ2UoKSB1c2Vycy4KCkxldCdzIHJlY2FwLiBJbiB0
aGlzIFJGQywgSSBpbnRyb2R1Y2UgYSB0b3RhbCBvZiA0ICghKSB1c2VycyBvbmx5LgpUaGUgb3Ro
ZXIgcGFydHMgY2FuIHJlbHkgb24gcGZuX3RvX29ubGluZV9wYWdlKCkgb25seS4KCjEuICJzdGFn
aW5nOiBrcGMyMDAwOiBQcmVwYXJlIHRyYW5zZmVyX2NvbXBsZXRlX2NiKCkgZm9yIFBHX3Jlc2Vy
dmVkIGNoYW5nZXMiCi0gQmFzaWNhbGx5IG5ldmVyIHVzZWQgd2l0aCBaT05FX0RFVklDRS4KLSBX
ZSBob2xkIGEgcmVmZXJlbmNlIQotIEFsbCBpdCBwcm90ZWN0cyBpcyBhIFNldFBhZ2VEaXJ0eShw
YWdlKTsKCjIuICJzdGFnaW5nL2dhc2tldDogUHJlcGFyZSBnYXNrZXRfcmVsZWFzZV9wYWdlKCkg
Zm9yIFBHX3Jlc2VydmVkIGNoYW5nZXMiCi0gU2FtZSBhcyAxLgoKMy4gIm1tL3VzZXJjb3B5LmM6
IFByZXBhcmUgY2hlY2tfcGFnZV9zcGFuKCkgZm9yIFBHX3Jlc2VydmVkIGNoYW5nZXMiCi0gV2Ug
Y29tZSB2aWEgdmlydF90b19oZWFkX3BhZ2UoKSAvIHZpcnRfdG9faGVhZF9wYWdlKCksIG5vdCBz
dXJlIGFib3V0IAogIHJlZmVyZW5jZXMgKEkgYXNzdW1lIHRoaXMgc2hvdWxkIGJlIGZpbmUgYXMg
d2UgZG9uJ3QgY29tZSB2aWEgcmFuZG9tIAogIFBGTnMpCi0gV2UgY2hlY2sgdGhhdCB3ZSBkb24n
dCBtaXggUmVzZXJ2ZWQgKGluY2x1ZGluZyBkZXZpY2UgbWVtb3J5KSBhbmQgQ01BIAogIHBhZ2Vz
IHdoZW4gY3Jvc3NpbmcgY29tcG91bmQgcGFnZXMuCgpJIHRoaW5rIHdlIGNhbiBkcm9wIDEuIGFu
ZCAyLiwgcmVzdWx0aW5nIGluIGEgdG90YWwgb2YgMiBuZXcgdXNlcnMgaW4KdGhlIHNhbWUgY29u
dGV4dC4gSSB0aGluayB0aGF0IGlzIHRvdGFsbHkgdG9sZXJhYmxlIHRvIGZpbmFsbHkgY2xlYW4K
dGhpcyB1cC4KCgpIb3dldmVyLCBJIHRoaW5rIHdlIGFsc28gaGF2ZSB0byBjbGFyaWZ5IGlmIHdl
IG5lZWQgdGhlIGNoYW5nZSBpbiAzIGF0IGFsbC4KSXQgY29tZXMgZnJvbQoKY29tbWl0IGY1NTA5
Y2MxOGRhYTdmODJiY2M1NTNiZTcwZGYyMTE3YzhlZWRjMTYKQXV0aG9yOiBLZWVzIENvb2sgPGtl
ZXNjb29rQGNocm9taXVtLm9yZz4KRGF0ZTogICBUdWUgSnVuIDcgMTE6MDU6MzMgMjAxNiAtMDcw
MAoKICAgIG1tOiBIYXJkZW5lZCB1c2VyY29weQogICAgCiAgICBUaGlzIGlzIHRoZSBzdGFydCBv
ZiBwb3J0aW5nIFBBWF9VU0VSQ09QWSBpbnRvIHRoZSBtYWlubGluZSBrZXJuZWwuIFRoaXMKICAg
IGlzIHRoZSBmaXJzdCBzZXQgb2YgZmVhdHVyZXMsIGNvbnRyb2xsZWQgYnkgQ09ORklHX0hBUkRF
TkVEX1VTRVJDT1BZLiBUaGUKICAgIHdvcmsgaXMgYmFzZWQgb24gY29kZSBieSBQYVggVGVhbSBh
bmQgQnJhZCBTcGVuZ2xlciwgYW5kIGFuIGVhcmxpZXIgcG9ydAogICAgZnJvbSBDYXNleSBTY2hh
dWZsZXIuIEFkZGl0aW9uYWwgbm9uLXNsYWIgcGFnZSB0ZXN0cyBhcmUgZnJvbSBSaWsgdmFuIFJp
ZWwuClsuLi5dCiAgICAtIG90aGVyd2lzZSwgb2JqZWN0IG11c3Qgbm90IHNwYW4gcGFnZSBhbGxv
Y2F0aW9ucyAoZXhjZXB0aW5nIFJlc2VydmVkCiAgICAgIGFuZCBDTUEgcmFuZ2VzKQoKTm90IHN1
cmUgaWYgd2UgcmVhbGx5IGhhdmUgdG8gY2FyZSBhYm91dCBaT05FX0RFVklDRSBhdCB0aGlzIHBv
aW50LgoKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
