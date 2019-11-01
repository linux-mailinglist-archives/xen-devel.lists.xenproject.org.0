Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69AEC911
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 20:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQcYN-0003tP-Lf; Fri, 01 Nov 2019 19:25:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N/vj=YZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iQcYL-0003tK-Ay
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 19:25:45 +0000
X-Inumbo-ID: 65111770-fcdd-11e9-93da-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65111770-fcdd-11e9-93da-bc764e2007e4;
 Fri, 01 Nov 2019 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572636342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjjm7Uw5loPShvkS5aQcZzMu+cIOGO3TF0cBurKv6Fo=;
 b=i91fxb65U20wDM49AREOf4wsO8m8hfrqqxzziZJvGhlYtTQH0wkgsO6vxD95t04SemmDgG
 o7yNDadbsVz7ls498AbRemsG/Hm6ezbCwaBlukpDXbwUdML9BhAaJ3aCHFj57n1cgeNfXu
 R0teStx8MWv/Bd9jTvz+3tKfx4pUM44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-GxUhE1sJOai6Nmi9ZYzjFA-1; Fri, 01 Nov 2019 15:25:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC95111;
 Fri,  1 Nov 2019 19:25:30 +0000 (UTC)
Received: from [10.36.116.26] (ovpn-116-26.ams2.redhat.com [10.36.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D01719C58;
 Fri,  1 Nov 2019 19:24:44 +0000 (UTC)
To: linux-kernel@vger.kernel.org
References: <20191024120938.11237-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8564fdc7-9a82-6455-50a8-6943cfd6b885@redhat.com>
Date: Fri, 1 Nov 2019 20:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: GxUhE1sJOai6Nmi9ZYzjFA-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH v1 00/10] mm: Don't mark hotplugged pages
 PG_reserved (including ZONE_DEVICE)
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
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTQ6MDksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IFRoaXMgaXMgdGhl
IHJlc3VsdCBvZiBhIHJlY2VudCBkaXNjdXNzaW9uIHdpdGggTWljaGFsIChbMV0sIFsyXSkuIFJp
Z2h0Cj4gbm93IHdlIHNldCBhbGwgcGFnZXMgUEdfcmVzZXJ2ZWQgd2hlbiBpbml0aWFsaXppbmcg
aG90cGx1Z2dlZCBtZW1tYXBzLiBUaGlzCj4gaW5jbHVkZXMgWk9ORV9ERVZJQ0UgbWVtb3J5LiBJ
biBjYXNlIG9mIHN5c3RlbSBtZW1vcnksIFBHX3Jlc2VydmVkIGlzCj4gY2xlYXJlZCBhZ2FpbiB3
aGVuIG9ubGluaW5nIHRoZSBtZW1vcnksIGluIGNhc2Ugb2YgWk9ORV9ERVZJQ0UgbWVtb3J5Cj4g
bmV2ZXIuCj4gCj4gSW4gYW5jaWVudCB0aW1lcywgd2UgbmVlZGVkIFBHX3Jlc2VydmVkLCBiZWNh
dXNlIHRoZXJlIHdhcyBubyB3YXkgdG8gdGVsbAo+IHdoZXRoZXIgdGhlIG1lbW1hcCB3YXMgYWxy
ZWFkeSBwcm9wZXJseSBpbml0aWFsaXplZC4gV2Ugbm93IGhhdmUKPiBTRUNUSU9OX0lTX09OTElO
RSBmb3IgdGhhdCBpbiB0aGUgY2FzZSBvZiAhWk9ORV9ERVZJQ0UgbWVtb3J5LiBaT05FX0RFVklD
RQo+IG1lbW9yeSBpcyBhbHJlYWR5IGluaXRpYWxpemVkIGRlZmVycmVkLCBhbmQgdGhlcmUgc2hv
dWxkbid0IGJlIGEgdmlzaWJsZQo+IGNoYW5nZSBpbiB0aGF0IHJlZ2FyZC4KPiAKPiBPbmUgb2Yg
dGhlIGJpZ2dlc3QgZmVhcnMgd2VyZSBzaWRlIGVmZmVjdHMuIEkgd2VudCBhaGVhZCBhbmQgYXVk
aXRlZCBhbGwKPiB1c2VycyBvZiBQYWdlUmVzZXJ2ZWQoKS4gVGhlIGRldGFpbHMgY2FuIGJlIGZv
dW5kIGluICJtbS9tZW1vcnlfaG90cGx1ZzoKPiBEb24ndCBtYXJrIHBhZ2VzIFBHX3Jlc2VydmVk
IHdoZW4gaW5pdGlhbGl6aW5nIHRoZSBtZW1tYXAiLgo+IAo+IFRoaXMgcGF0Y2ggc2V0IGFkYXB0
cyBhbGwgcmVsZXZhbnQgdXNlcnMgb2YgUGFnZVJlc2VydmVkKCkgdG8ga2VlcCB0aGUKPiBleGlz
dGluZyBiZWhhdmlvciBpbiByZXNwZWN0IHRvIFpPTkVfREVWSUNFIHBhZ2VzLiBUaGUgYmlnZ2Vz
dCBwYXJ0IHBhcnQKPiB0aGF0IG5lZWRzIGNoYW5nZXMgaXMgS1ZNLCB0byBrZWVwIHRoZSBleGlz
dGluZyBiZWhhdmlvciAodGhhdCdzIGFsbCBJCj4gY2FyZSBhYm91dCBpbiB0aGlzIHNlcmllcyku
Cj4gCj4gTm90ZSB0aGF0IHRoaXMgc2VyaWVzIGlzIGFibGUgdG8gcmVseSBjb21wbGV0ZWx5IG9u
IHBmbl90b19vbmxpbmVfcGFnZSgpLgo+IE5vIG5ldyBpc196b25lX2RldmljZV9wYWdlKCkgY2Fs
bGVzIGFyZSBpbnRyb2R1Y2VkIChhcyByZXF1ZXN0ZWQgYnkgRGFuKS4KPiBXZSBhcmUgY3VycmVu
dGx5IGRpc2N1c3NpbmcgYSB3YXkgdG8gbWFyayBhbHNvIFpPTkVfREVWSUNFIG1lbW1hcHMgYXMK
PiBhY3RpdmUvaW5pdGlhbGl6ZWQgLSBwZm5fYWN0aXZlKCkgLSBhbmQgbGlnaHR3ZWlnaHQgbG9j
a2luZyB0byBtYWtlIHN1cmUKPiBtZW1tYXBzIHJlbWFpbiBhY3RpdmUgKGUuZy4sIHVzaW5nIFJD
VSkuIFdlIG1pZ2h0IGxhdGVyIGJlIGFibGUgdG8gY29udmVydAo+IHNvbWUgc3VlcnMgb2YgcGZu
X3RvX29ubGluZV9wYWdlKCkgdG8gcGZuX2FjdGl2ZSgpLiBEZXRhaWxzIGNhbiBiZSBmb3VuZAo+
IGluIFszXSwgaG93ZXZlciwgdGhpcyByZXByZXNlbnRzIHlldCBhbm90aGVyIGNsZWFudXAvZml4
IHdlJ2xsIHBlcmZvcm0KPiBvbiB0b3Agb2YgdGhpcyBjbGVhbnVwLgo+IAo+IEkgb25seSBnYXZl
IGl0IGEgcXVpY2sgdGVzdCB3aXRoIERJTU1zIG9uIHg4Ni02NCwgYnV0IGRpZG4ndCB0ZXN0IHRo
ZQo+IFpPTkVfREVWSUNFIHBhcnQgYXQgYWxsIChhbnkgdGlwcyBmb3IgYSBuaWNlIFFFTVUgc2V0
dXA/KS4gQWxzbywgSSBkaWRuJ3QKPiB0ZXN0IHRoZSBLVk0gcGFydHMgKGVzcGVjaWFsbHkgd2l0
aCBaT05FX0RFVklDRSBwYWdlcyBvciBubyBtZW1tYXAgYXQgYWxsKS4KPiBDb21waWxlLXRlc3Rl
ZCBvbiB4ODYtNjQgYW5kIFBQQy4KPiAKCkplZmYgTW95ZXIgcmFuIHNvbWUgTlZESU1NIHRlc3Qg
Y2FzZXMgZm9yIG1lICh0aGFua3MhISEpLCBpbmNsdWRpbmcgCnhmc3Rlc3RzLCBwbWRrLCBhbmQg
bmRjdGwuIE5vIHJlZ3Jlc3Npb25zIGZvdW5kLgoKSSB3aWxsIHJ1biBzb21lIEtWTSB0ZXN0cywg
ZXNwZWNpYWxseSBORElNTSBwYXNzdGhyb3VnaCwgYnV0IHdpbGwgaGF2ZSAKdG8gc2V0dXAgYSB0
ZXN0IGVudmlyb25tZW50IGZpcnN0LgoKSSB3b3VsZCBhcHByZWNpYXRlIHNvbWUgcmV2aWV3IGlu
IHRoZSBtZWFudGltZS4gOikKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
