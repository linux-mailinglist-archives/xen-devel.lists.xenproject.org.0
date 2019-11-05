Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243D5EFA27
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 10:53:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRvT5-0002tj-5g; Tue, 05 Nov 2019 09:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iRvT3-0002te-9t
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 09:49:41 +0000
X-Inumbo-ID: 95869084-ffb1-11e9-9631-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 95869084-ffb1-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572947379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHZKkj9R7Yfgi4epLzXOt7O5NFLJrXYVRc9BFpKTvw4=;
 b=ays4fire+s7EruRcynGe+zVSxdhaOhcCuSr+Lu055/Gpznrs7yUk2ZG545vM1pm5Nv4V/F
 C4UphstR6FxeIJx8TGRSngpmpkmoVTu8Gu7dFBYDlfurJ2li0njj+Ac8DGa6O9RPWFAZjN
 eUzDG54jz9hdifA3rWuFPe6uIni5Rm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-3-UT9hZ4OuOURxDou1h6oQ-1; Tue, 05 Nov 2019 04:49:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDBA800C73;
 Tue,  5 Nov 2019 09:49:30 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EEEB5C1B2;
 Tue,  5 Nov 2019 09:49:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
Organization: Red Hat GmbH
Message-ID: <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
Date: Tue, 5 Nov 2019 10:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3-UT9hZ4OuOURxDou1h6oQ-1
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

T24gMDUuMTEuMTkgMTA6MTcsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDA1LjExLjE5
IDA1OjM4LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4+IE9uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDU6
MTEgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4KPj4+
IFJpZ2h0IG5vdywgWk9ORV9ERVZJQ0UgbWVtb3J5IGlzIGFsd2F5cyBzZXQgUEdfcmVzZXJ2ZWQu
IFdlIHdhbnQgdG8KPj4+IGNoYW5nZSB0aGF0Lgo+Pj4KPj4+IEtWTSBoYXMgdGhpcyB3ZWlyZCB1
c2UgY2FzZSB0aGF0IHlvdSBjYW4gbWFwIGFueXRoaW5nIGZyb20gL2Rldi9tZW0KPj4+IGludG8g
dGhlIGd1ZXN0LiBwZm5fdmFsaWQoKSBpcyBub3QgYSByZWxpYWJsZSBjaGVjayB3aGV0aGVyIHRo
ZSBtZW1tYXAKPj4+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNoZWQuIHBmbl90b19v
bmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPj4+IHRoYXQgd2UgaGF2ZSBhbiBpbml0aWFsaXplZCBt
ZW1tYXAgKGFuZCBkb24ndCBoYXZlIFpPTkVfREVWSUNFIG1lbW9yeSkuCj4+Pgo+Pj4gUmV3cml0
ZSBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbiBwcm9kdWNl
cyB0aGUKPj4+IHNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0aW5nIFpPTkVfREVWSUNFIHBh
Z2VzIFBHX3Jlc2VydmVkLgo+Pj4KPj4+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPgo+Pj4gQ2M6ICJSYWRpbSBLcsSNbcOhxZkiIDxya3JjbWFyQHJlZGhhdC5jb20+Cj4+
PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9yZz4KPj4+IENjOiBEYW4gV2lsbGlh
bXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPj4+IENjOiBLYXJpbUFsbGFoIEFobWVkIDxr
YXJhaG1lZEBhbWF6b24uZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICAgdmlydC9rdm0va3ZtX21haW4uYyB8IDEw
ICsrKysrKysrLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0
L2t2bS9rdm1fbWFpbi5jCj4+PiBpbmRleCBlOWViNjY2ZWI2ZTguLjlkMThjYzY3ZDEyNCAxMDA2
NDQKPj4+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPj4+ICsrKyBiL3ZpcnQva3ZtL2t2bV9t
YWluLmMKPj4+IEBAIC0xNTEsOSArMTUxLDE1IEBAIF9fd2VhayBpbnQga3ZtX2FyY2hfbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLAo+Pj4KPj4+ICAgIGJvb2wg
a3ZtX2lzX3Jlc2VydmVkX3Bmbihrdm1fcGZuX3QgcGZuKQo+Pj4gICAgewo+Pj4gLSAgICAgICBp
ZiAocGZuX3ZhbGlkKHBmbikpCj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuIFBhZ2VSZXNlcnZl
ZChwZm5fdG9fcGFnZShwZm4pKTsKPj4+ICsgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5f
dG9fb25saW5lX3BhZ2UocGZuKTsKPj4+Cj4+PiArICAgICAgIC8qCj4+PiArICAgICAgICAqIFdl
IHRyZWF0IGFueSBwYWdlcyB0aGF0IGFyZSBub3Qgb25saW5lIChub3QgbWFuYWdlZCBieSB0aGUg
YnVkZHkpCj4+PiArICAgICAgICAqIGFzIHJlc2VydmVkIC0gdGhpcyBpbmNsdWRlcyBaT05FX0RF
VklDRSBwYWdlcyBhbmQgcGFnZXMgd2l0aG91dAo+Pj4gKyAgICAgICAgKiBhIG1lbW1hcCAoZS5n
LiwgbWFwcGVkIHZpYSAvZGV2L21lbSkuCj4+PiArICAgICAgICAqLwo+Pj4gKyAgICAgICBpZiAo
cGFnZSkKPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gUGFnZVJlc2VydmVkKHBhZ2UpOwo+Pj4g
ICAgICAgICAgIHJldHVybiB0cnVlOwo+Pj4gICAgfQo+Pgo+PiBTbyBhZnRlciB0aGlzIGFsbCB0
aGUgcGZuX3ZhbGlkKCkgdXNhZ2UgaW4ga3ZtX21haW4uYyBpcyByZXBsYWNlZCB3aXRoCj4+IHBm
bl90b19vbmxpbmVfcGFnZSgpPyBMb29rcyBjb3JyZWN0IHRvIG1lLgo+Pgo+PiBIb3dldmVyLCBJ
J20gd29ycmllZCB0aGF0IGt2bSBpcyB0YWtpbmcgcmVmZXJlbmNlIG9uIFpPTkVfREVWSUNFIHBh
Z2VzCj4+IHRocm91Z2ggc29tZSBvdGhlciBwYXRoIHJlc3VsdGluZyBpbiB0aGlzOgo+Pgo+PiAg
ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1udmRpbW0vMjAxOTA5MTkxNTQ3MDgu
R0EyNDY1MEBhbmdiYW5kLnBsLwo+Pgo+PiBJJ2xsIHNlZSBpZiB0aGlzIHBhdGNoIHNldCBtb2R1
bGF0ZXMgb3IgbWFpbnRhaW5zIHRoYXQgZmFpbHVyZSBtb2RlLgo+Pgo+IAo+IEknZCBhc3N1bWUg
dGhhdCB0aGUgYmVoYXZpb3IgaXMgdW5jaGFuZ2VkLiBJdGhpbmsgd2UgZ2V0IGEgcmVmZXJlbmNl
IHRvCj4gdGhlc2UgWk9ORV9ERVZJQ0UgcGFnZXMgdmlhIF9fZ2V0X3VzZXJfcGFnZXNfZmFzdCgp
IGFuZCBmcmllbmRzIGluCj4gaHZhX3RvX3Bmbl9mYXN0KCkgYW5kIGZyaWVuZHMgaW4gdmlydC9r
dm0va3ZtX21haW4uYwo+IAoKSSB0aGluayBJIGtub3cgd2hhdCdzIGdvaW5nIHdyb25nOgoKUGFn
ZXMgdGhhdCBhcmUgcGlubmVkIHZpYSBnZm5fdG9fcGZuKCkgYW5kIGZyaWVuZHMgdGFrZSBhIHJl
ZmVyZW5jZXMsIApob3dldmVyIGFyZSBvZnRlbiByZWxlYXNlZCB2aWEgCmt2bV9yZWxlYXNlX3Bm
bl9jbGVhbigpL2t2bV9yZWxlYXNlX3Bmbl9kaXJ0eSgpL2t2bV9yZWxlYXNlX3BhZ2VfY2xlYW4o
KS4uLgoKCkUuZy4sIGluIGFyY2gveDg2L2t2bS94ODYuYzpyZWV4ZWN1dGVfaW5zdHJ1Y3Rpb24o
KQoKLi4uCnBmbiA9IGdmbl90b19wZm4odmNwdS0+a3ZtLCBncGFfdG9fZ2ZuKGdwYSkpOwouLi4K
a3ZtX3JlbGVhc2VfcGZuX2NsZWFuKHBmbik7CgoKCnZvaWQga3ZtX3JlbGVhc2VfcGZuX2NsZWFu
KGt2bV9wZm5fdCBwZm4pCnsKCWlmICghaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1f
aXNfcmVzZXJ2ZWRfcGZuKHBmbikpCgkJcHV0X3BhZ2UocGZuX3RvX3BhZ2UocGZuKSk7Cn0KClRo
aXMgZnVuY3Rpb24gbWFrZXMgcGVyZmVjdCBzZW5zZSBhcyB0aGUgY291bnRlcnBhcnQgZm9yIGt2
bV9nZXRfcGZuKCk6Cgp2b2lkIGt2bV9nZXRfcGZuKGt2bV9wZm5fdCBwZm4pCnsKCWlmICgha3Zt
X2lzX3Jlc2VydmVkX3BmbihwZm4pKQoJCWdldF9wYWdlKHBmbl90b19wYWdlKHBmbikpOwp9CgoK
QXMgYWxsIFpPTkVfREVWSUNFIHBhZ2VzIGFyZSBjdXJyZW50bHkgcmVzZXJ2ZWQsIHBhZ2VzIHBp
bm5lZCB2aWEgCmdmbl90b19wZm4oKSBhbmQgZnJpZW5kcyB3aWxsIG9mdGVuIG5vdCBzZWUgYSBw
dXRfcGFnZSgpIEFGQUlLUy4KCk5vdywgbXkgcGF0Y2ggZG9lcyBub3QgY2hhbmdlIHRoYXQsIHRo
ZSByZXN1bHQgb2YgCmt2bV9pc19yZXNlcnZlZF9wZm4ocGZuKSB3aWxsIGJlIHVuY2hhbmdlZC4g
QSBwcm9wZXIgZml4IGZvciB0aGF0IHdvdWxkIApwcm9iYWJseSBiZQoKYSkgVG8gZHJvcCB0aGUg
cmVmZXJlbmNlIHRvIFpPTkVfREVWSUNFIHBhZ2VzIGluIGdmbl90b19wZm4oKSBhbmQgCmZyaWVu
ZHMsIGFmdGVyIHlvdSBzdWNjZXNzZnVsbHkgcGlubmVkIHRoZSBwYWdlcy4gKG5vdCBzdXJlIGlm
IHRoYXQncyAKdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGJ1dCB5b3UncmUgdGhlIGV4cGVydCkKCmIp
IFRvIG5vdCB1c2Uga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKCkgYW5kIGZyaWVuZHMgb24gcGFnZXMg
dGhhdCB3ZXJlIApkZWZpbml0ZWx5IHBpbm5lZC4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGls
ZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
