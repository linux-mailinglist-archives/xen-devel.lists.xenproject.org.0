Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2AEFA69
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 11:05:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRvgH-0004f7-QW; Tue, 05 Nov 2019 10:03:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iRvgF-0004f1-VH
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 10:03:19 +0000
X-Inumbo-ID: 7c77949e-ffb3-11e9-a195-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7c77949e-ffb3-11e9-a195-12813bfff9fa;
 Tue, 05 Nov 2019 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572948197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PeXIW5o4X0824gIsT37rM/mFNG9YQ7RC4BU3rblgDI=;
 b=b7TEzV1ymzLRJiolwYCMSMuM/UAJriCr+NPEMIHvIzablH9jMz1ui3H8ajGAdbjFOU2Rr7
 Ztrfdl824aB88bShxLaQ+TISW5Kp2IxVmRHsAwmEdS0UTJUJxrToShR8g6ClSB2WMZls0P
 OFFz+VFO4Mu+1uUiz8zBE1BpTUVioyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-IrNamL1SM8-MPLUk2gNZug-1; Tue, 05 Nov 2019 05:03:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1B3800054;
 Tue,  5 Nov 2019 10:03:08 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF2C5C553;
 Tue,  5 Nov 2019 10:02:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
Organization: Red Hat GmbH
Message-ID: <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
Date: Tue, 5 Nov 2019 11:02:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: IrNamL1SM8-MPLUk2gNZug-1
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
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTEuMTkgMTA6NDksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDA1LjExLjE5
IDEwOjE3LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMDUuMTEuMTkgMDU6MzgsIERh
biBXaWxsaWFtcyB3cm90ZToKPj4+IE9uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDU6MTEgQU0gRGF2
aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gUmlnaHQg
bm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4gV2Ugd2Fu
dCB0bwo+Pj4+IGNoYW5nZSB0aGF0Lgo+Pj4+Cj4+Pj4gS1ZNIGhhcyB0aGlzIHdlaXJkIHVzZSBj
YXNlIHRoYXQgeW91IGNhbiBtYXAgYW55dGhpbmcgZnJvbSAvZGV2L21lbQo+Pj4+IGludG8gdGhl
IGd1ZXN0LiBwZm5fdmFsaWQoKSBpcyBub3QgYSByZWxpYWJsZSBjaGVjayB3aGV0aGVyIHRoZSBt
ZW1tYXAKPj4+PiB3YXMgaW5pdGlhbGl6ZWQgYW5kIGNhbiBiZSB0b3VjaGVkLiBwZm5fdG9fb25s
aW5lX3BhZ2UoKSBtYWtlcyBzdXJlCj4+Pj4gdGhhdCB3ZSBoYXZlIGFuIGluaXRpYWxpemVkIG1l
bW1hcCAoYW5kIGRvbid0IGhhdmUgWk9ORV9ERVZJQ0UgbWVtb3J5KS4KPj4+Pgo+Pj4+IFJld3Jp
dGUga3ZtX2lzX3Jlc2VydmVkX3BmbigpIHRvIG1ha2Ugc3VyZSB0aGUgZnVuY3Rpb24gcHJvZHVj
ZXMgdGhlCj4+Pj4gc2FtZSByZXN1bHQgb25jZSB3ZSBzdG9wIHNldHRpbmcgWk9ORV9ERVZJQ0Ug
cGFnZXMgUEdfcmVzZXJ2ZWQuCj4+Pj4KPj4+PiBDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4KPj4+PiBDYzogIlJhZGltIEtyxI1tw6HFmSIgPHJrcmNtYXJAcmVkaGF0LmNv
bT4KPj4+PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9yZz4KPj4+PiBDYzogRGFu
IFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4+Pj4gQ2M6IEthcmltQWxsYWgg
QWhtZWQgPGthcmFobWVkQGFtYXpvbi5kZT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxk
ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+PiAtLS0KPj4+PiAgICAgdmlydC9rdm0va3Zt
X21haW4uYyB8IDEwICsrKysrKysrLS0KPj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9r
dm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwo+Pj4+IGluZGV4IGU5ZWI2NjZlYjZlOC4u
OWQxOGNjNjdkMTI0IDEwMDY0NAo+Pj4+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPj4+PiAr
KysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4+Pj4gQEAgLTE1MSw5ICsxNTEsMTUgQEAgX193ZWFr
IGludCBrdm1fYXJjaF9tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZShzdHJ1Y3Qga3ZtICpr
dm0sCj4+Pj4KPj4+PiAgICAgYm9vbCBrdm1faXNfcmVzZXJ2ZWRfcGZuKGt2bV9wZm5fdCBwZm4p
Cj4+Pj4gICAgIHsKPj4+PiAtICAgICAgIGlmIChwZm5fdmFsaWQocGZuKSkKPj4+PiAtICAgICAg
ICAgICAgICAgcmV0dXJuIFBhZ2VSZXNlcnZlZChwZm5fdG9fcGFnZShwZm4pKTsKPj4+PiArICAg
ICAgIHN0cnVjdCBwYWdlICpwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7Cj4+Pj4KPj4+
PiArICAgICAgIC8qCj4+Pj4gKyAgICAgICAgKiBXZSB0cmVhdCBhbnkgcGFnZXMgdGhhdCBhcmUg
bm90IG9ubGluZSAobm90IG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KQo+Pj4+ICsgICAgICAgICogYXMg
cmVzZXJ2ZWQgLSB0aGlzIGluY2x1ZGVzIFpPTkVfREVWSUNFIHBhZ2VzIGFuZCBwYWdlcyB3aXRo
b3V0Cj4+Pj4gKyAgICAgICAgKiBhIG1lbW1hcCAoZS5nLiwgbWFwcGVkIHZpYSAvZGV2L21lbSku
Cj4+Pj4gKyAgICAgICAgKi8KPj4+PiArICAgICAgIGlmIChwYWdlKQo+Pj4+ICsgICAgICAgICAg
ICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBhZ2UpOwo+Pj4+ICAgICAgICAgICAgcmV0dXJuIHRy
dWU7Cj4+Pj4gICAgIH0KPj4+Cj4+PiBTbyBhZnRlciB0aGlzIGFsbCB0aGUgcGZuX3ZhbGlkKCkg
dXNhZ2UgaW4ga3ZtX21haW4uYyBpcyByZXBsYWNlZCB3aXRoCj4+PiBwZm5fdG9fb25saW5lX3Bh
Z2UoKT8gTG9va3MgY29ycmVjdCB0byBtZS4KPj4+Cj4+PiBIb3dldmVyLCBJJ20gd29ycmllZCB0
aGF0IGt2bSBpcyB0YWtpbmcgcmVmZXJlbmNlIG9uIFpPTkVfREVWSUNFIHBhZ2VzCj4+PiB0aHJv
dWdoIHNvbWUgb3RoZXIgcGF0aCByZXN1bHRpbmcgaW4gdGhpczoKPj4+Cj4+PiAgICAgICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbnZkaW1tLzIwMTkwOTE5MTU0NzA4LkdBMjQ2NTBA
YW5nYmFuZC5wbC8KPj4+Cj4+PiBJJ2xsIHNlZSBpZiB0aGlzIHBhdGNoIHNldCBtb2R1bGF0ZXMg
b3IgbWFpbnRhaW5zIHRoYXQgZmFpbHVyZSBtb2RlLgo+Pj4KPj4KPj4gSSdkIGFzc3VtZSB0aGF0
IHRoZSBiZWhhdmlvciBpcyB1bmNoYW5nZWQuIEl0aGluayB3ZSBnZXQgYSByZWZlcmVuY2UgdG8K
Pj4gdGhlc2UgWk9ORV9ERVZJQ0UgcGFnZXMgdmlhIF9fZ2V0X3VzZXJfcGFnZXNfZmFzdCgpIGFu
ZCBmcmllbmRzIGluCj4+IGh2YV90b19wZm5fZmFzdCgpIGFuZCBmcmllbmRzIGluIHZpcnQva3Zt
L2t2bV9tYWluLmMKPj4KPiAKPiBJIHRoaW5rIEkga25vdyB3aGF0J3MgZ29pbmcgd3Jvbmc6Cj4g
Cj4gUGFnZXMgdGhhdCBhcmUgcGlubmVkIHZpYSBnZm5fdG9fcGZuKCkgYW5kIGZyaWVuZHMgdGFr
ZSBhIHJlZmVyZW5jZXMsCj4gaG93ZXZlciBhcmUgb2Z0ZW4gcmVsZWFzZWQgdmlhCj4ga3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKCkva3ZtX3JlbGVhc2VfcGZuX2RpcnR5KCkva3ZtX3JlbGVhc2VfcGFn
ZV9jbGVhbigpLi4uCj4gCj4gCj4gRS5nLiwgaW4gYXJjaC94ODYva3ZtL3g4Ni5jOnJlZXhlY3V0
ZV9pbnN0cnVjdGlvbigpCj4gCj4gLi4uCj4gcGZuID0gZ2ZuX3RvX3Bmbih2Y3B1LT5rdm0sIGdw
YV90b19nZm4oZ3BhKSk7Cj4gLi4uCj4ga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKHBmbik7Cj4gCj4g
Cj4gCj4gdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oa3ZtX3Bmbl90IHBmbikKPiB7Cj4gCWlm
ICghaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1faXNfcmVzZXJ2ZWRfcGZuKHBmbikp
Cj4gCQlwdXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKPiB9Cj4gCj4gVGhpcyBmdW5jdGlvbiBt
YWtlcyBwZXJmZWN0IHNlbnNlIGFzIHRoZSBjb3VudGVycGFydCBmb3Iga3ZtX2dldF9wZm4oKToK
PiAKPiB2b2lkIGt2bV9nZXRfcGZuKGt2bV9wZm5fdCBwZm4pCj4gewo+IAlpZiAoIWt2bV9pc19y
ZXNlcnZlZF9wZm4ocGZuKSkKPiAJCWdldF9wYWdlKHBmbl90b19wYWdlKHBmbikpOwo+IH0KPiAK
PiAKPiBBcyBhbGwgWk9ORV9ERVZJQ0UgcGFnZXMgYXJlIGN1cnJlbnRseSByZXNlcnZlZCwgcGFn
ZXMgcGlubmVkIHZpYQo+IGdmbl90b19wZm4oKSBhbmQgZnJpZW5kcyB3aWxsIG9mdGVuIG5vdCBz
ZWUgYSBwdXRfcGFnZSgpIEFGQUlLUy4KPiAKPiBOb3csIG15IHBhdGNoIGRvZXMgbm90IGNoYW5n
ZSB0aGF0LCB0aGUgcmVzdWx0IG9mCj4ga3ZtX2lzX3Jlc2VydmVkX3BmbihwZm4pIHdpbGwgYmUg
dW5jaGFuZ2VkLiBBIHByb3BlciBmaXggZm9yIHRoYXQgd291bGQKPiBwcm9iYWJseSBiZQo+IAo+
IGEpIFRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0byBaT05FX0RFVklDRSBwYWdlcyBpbiBnZm5fdG9f
cGZuKCkgYW5kCj4gZnJpZW5kcywgYWZ0ZXIgeW91IHN1Y2Nlc3NmdWxseSBwaW5uZWQgdGhlIHBh
Z2VzLiAobm90IHN1cmUgaWYgdGhhdCdzCj4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGJ1dCB5b3Un
cmUgdGhlIGV4cGVydCkKPiAKPiBiKSBUbyBub3QgdXNlIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigp
IGFuZCBmcmllbmRzIG9uIHBhZ2VzIHRoYXQgd2VyZQo+IGRlZmluaXRlbHkgcGlubmVkLgo+IAoK
KHRhbGtpbmcgdG8gbXlzZWxmLCBzb3JyeSkKClRoaW5raW5nIGFnYWluLCBkcm9wcGluZyB0aGlz
IHBhdGNoIGZyb20gdGhpcyBzZXJpZXMgY291bGQgZWZmZWN0aXZlbHkgCmFsc28gZml4IHRoYXQg
aXNzdWUuIEUuZy4sIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpIGFuZCBmcmllbmRzIHdvdWxkIAph
bHdheXMgZG8gYSBwdXRfcGFnZSgpIGlmICJwZm5fdmFsaWQoKSBhbmQgIVBhZ2VSZXNlcnZlZCgp
Iiwgc28gYWZ0ZXIgCnBhdGNoIDkgYWxzbyBvbiBaT05ERV9ERVZJQ0UgcGFnZXMuCgpCdXQgaXQg
d291bGQgaGF2ZSBzaWRlIGVmZmVjdHMgdGhhdCBtaWdodCBub3QgYmUgZGVzaXJlZC4gRS5nLiw6
CgoxLiBrdm1fcGZuX3RvX3BhZ2UoKSB3b3VsZCBhbHNvIHJldHVybiBaT05FX0RFVklDRSBwYWdl
cyAobWlnaHQgZXZlbiBiZSAKdGhlIHJpZ2h0IHRoaW5nIHRvIGRvKS4KCjIuIGt2bV9zZXRfcGZu
X2RpcnR5KCkgd291bGQgYWxzbyBzZXQgWk9ORV9ERVZJQ0UgcGFnZXMgZGlydHkgKG1pZ2h0IGJl
IApva2F5KQoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
