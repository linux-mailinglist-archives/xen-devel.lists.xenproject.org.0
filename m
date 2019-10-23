Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AEFE1406
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 10:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNBsp-0000iq-Ab; Wed, 23 Oct 2019 08:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNBsn-0000iK-PO
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:20:41 +0000
X-Inumbo-ID: 003b0fe8-f56e-11e9-9476-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 003b0fe8-f56e-11e9-9476-12813bfff9fa;
 Wed, 23 Oct 2019 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571818840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYwRT87GkK/iKD1IC7yG62REkwJqyJxXRU8O7sH7WsI=;
 b=XseFJxHLQVzFmrOvPVNELeRYAB/zQWx8lYVv2LlZvZycG8KTPa/ym2JDMxSVxQWiDdNSm4
 faUxyQN9t4S3ln6De95Q3vHX/q0o1k2Afi+LUE/I2JBoDkSsgvRVWiScA6B84rVDY8rs3A
 DW/epqiYHp7JF0Xd+XxFIqehJkdQ3mo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-HevUVdjDPbOvQMNsP_rCWQ-1; Wed, 23 Oct 2019 04:20:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CFB800D54;
 Wed, 23 Oct 2019 08:20:30 +0000 (UTC)
Received: from [10.36.117.79] (ovpn-117-79.ams2.redhat.com [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CEFA5C219;
 Wed, 23 Oct 2019 08:20:14 +0000 (UTC)
To: linux-kernel@vger.kernel.org
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-3-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
Date: Wed, 23 Oct 2019 10:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022171239.21487-3-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: HevUVdjDPbOvQMNsP_rCWQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 02/12] mm/usercopy.c: Prepare
 check_page_span() for PG_reserved changes
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTAuMTkgMTk6MTIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IFJpZ2h0IG5vdywg
Wk9ORV9ERVZJQ0UgbWVtb3J5IGlzIGFsd2F5cyBzZXQgUEdfcmVzZXJ2ZWQuIFdlIHdhbnQgdG8K
PiBjaGFuZ2UgdGhhdC4KPiAKPiBMZXQncyBtYWtlIHN1cmUgdGhhdCB0aGUgbG9naWMgaW4gdGhl
IGZ1bmN0aW9uIHdvbid0IGNoYW5nZS4gT25jZSB3ZSBubwo+IGxvbmdlciBzZXQgdGhlc2UgcGFn
ZXMgdG8gcmVzZXJ2ZWQsIHdlIGNhbiByZXdvcmsgdGhpcyBmdW5jdGlvbiB0bwo+IHBlcmZvcm0g
c2VwYXJhdGUgY2hlY2tzIGZvciBaT05FX0RFVklDRSAoc3BsaXQgZnJvbSBQR19yZXNlcnZlZCBj
aGVja3MpLgo+IAo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogS2F0ZSBTdGV3
YXJ0IDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBBbGxpc29uIFJhbmRhbCA8
YWxsaXNvbkBsb2h1dG9rLm5ldD4KPiBDYzogIklzYWFjIEouIE1hbmphcnJlcyIgPGlzYWFjbUBj
b2RlYXVyb3JhLm9yZz4KPiBDYzogUWlhbiBDYWkgPGNhaUBsY2EucHc+Cj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRl
bmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IC0tLQo+ICAgbW0vdXNlcmNvcHkuYyB8IDUgKysr
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL21tL3VzZXJjb3B5LmMgYi9tbS91c2VyY29weS5jCj4gaW5kZXggNjYw
NzE3YTFlYTVjLi5hM2FjNGJlMzVjZGUgMTAwNjQ0Cj4gLS0tIGEvbW0vdXNlcmNvcHkuYwo+ICsr
KyBiL21tL3VzZXJjb3B5LmMKPiBAQCAtMjAzLDE0ICsyMDMsMTUgQEAgc3RhdGljIGlubGluZSB2
b2lkIGNoZWNrX3BhZ2Vfc3Bhbihjb25zdCB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgbiwKPiAg
IAkgKiBkZXZpY2UgbWVtb3J5KSwgb3IgQ01BLiBPdGhlcndpc2UsIHJlamVjdCBzaW5jZSB0aGUg
b2JqZWN0IHNwYW5zCj4gICAJICogc2V2ZXJhbCBpbmRlcGVuZGVudGx5IGFsbG9jYXRlZCBwYWdl
cy4KPiAgIAkgKi8KPiAtCWlzX3Jlc2VydmVkID0gUGFnZVJlc2VydmVkKHBhZ2UpOwo+ICsJaXNf
cmVzZXJ2ZWQgPSBQYWdlUmVzZXJ2ZWQocGFnZSkgfHwgaXNfem9uZV9kZXZpY2VfcGFnZShwYWdl
KTsKPiAgIAlpc19jbWEgPSBpc19taWdyYXRlX2NtYV9wYWdlKHBhZ2UpOwo+ICAgCWlmICghaXNf
cmVzZXJ2ZWQgJiYgIWlzX2NtYSkKPiAgIAkJdXNlcmNvcHlfYWJvcnQoInNwYW5zIG11bHRpcGxl
IHBhZ2VzIiwgTlVMTCwgdG9fdXNlciwgMCwgbik7Cj4gICAKPiAgIAlmb3IgKHB0ciArPSBQQUdF
X1NJWkU7IHB0ciA8PSBlbmQ7IHB0ciArPSBQQUdFX1NJWkUpIHsKPiAgIAkJcGFnZSA9IHZpcnRf
dG9faGVhZF9wYWdlKHB0cik7Cj4gLQkJaWYgKGlzX3Jlc2VydmVkICYmICFQYWdlUmVzZXJ2ZWQo
cGFnZSkpCj4gKwkJaWYgKGlzX3Jlc2VydmVkICYmICEoUGFnZVJlc2VydmVkKHBhZ2UpIHx8Cj4g
KwkJCQkgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkpKQo+ICAgCQkJdXNlcmNvcHlfYWJv
cnQoInNwYW5zIFJlc2VydmVkIGFuZCBub24tUmVzZXJ2ZWQgcGFnZXMiLAo+ICAgCQkJCSAgICAg
ICBOVUxMLCB0b191c2VyLCAwLCBuKTsKPiAgIAkJaWYgKGlzX2NtYSAmJiAhaXNfbWlncmF0ZV9j
bWFfcGFnZShwYWdlKSkKPiAKCkBLZWVzLCB3b3VsZCBpdCBiZSBva2F5IHRvIHN0b3AgY2hlY2tp
bmcgYWdhaW5zdCBaT05FX0RFVklDRSBwYWdlcyBoZXJlIApvciBpcyB0aGVyZSBhIGdvb2QgcmF0
aW9uYWxlIGJlaGluZCB0aGlzPwoKKEkgd291bGQgdHVybiB0aGlzIHBhdGNoIGludG8gYSBzaW1w
bGUgdXBkYXRlIG9mIHRoZSBjb21tZW50IGlmIHdlIGFncmVlIAp0aGF0IHdlIGRvbid0IGNhcmUp
CgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
