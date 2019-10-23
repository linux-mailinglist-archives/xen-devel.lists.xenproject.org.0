Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71787E20AE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJZ8-00066f-Gf; Wed, 23 Oct 2019 16:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNJZ7-00066a-0r
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:32:53 +0000
X-Inumbo-ID: c145afd8-f5b2-11e9-a531-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c145afd8-f5b2-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571848370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mbnDiYdefAFfgTrlR4xeKkhINck51cpeXllEsDYT4Ro=;
 b=Rr5NlLjTT1CcAaSbGgCVJ30iQJEbMdj6OvVx3ZbtT+aMqNyOiLbeoDwrpt4t9/xBIhI90z
 cpa3drE4jUREOMfcxpPFdLppnTO1xH/Ts7tNk3BNX3243XhDLhHbd2pKjhdNvzvSUduB0E
 5ceOEyiz5njRxd0ZL2kv/GL6SIBYy+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-Ns7P4WWKOXK9foAUYV7jag-1; Wed, 23 Oct 2019 12:32:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384FD80183E;
 Wed, 23 Oct 2019 16:32:42 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746E560852;
 Wed, 23 Oct 2019 16:32:21 +0000 (UTC)
To: Kees Cook <keescook@chromium.org>
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-3-david@redhat.com>
 <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
 <201910230924.DE879ED80F@keescook>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <499de13c-8296-7f61-d63a-2801409c6b93@redhat.com>
Date: Wed, 23 Oct 2019 18:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <201910230924.DE879ED80F@keescook>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Ns7P4WWKOXK9foAUYV7jag-1
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
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
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
 Jeremy Sowden <jeremy@azazel.net>, Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTg6MjUsIEtlZXMgQ29vayB3cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAx
OSBhdCAxMDoyMDoxNEFNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjIu
MTAuMTkgMTk6MTIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gUmlnaHQgbm93LCBaT05F
X0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4gV2Ugd2FudCB0bwo+Pj4g
Y2hhbmdlIHRoYXQuCj4+Pgo+Pj4gTGV0J3MgbWFrZSBzdXJlIHRoYXQgdGhlIGxvZ2ljIGluIHRo
ZSBmdW5jdGlvbiB3b24ndCBjaGFuZ2UuIE9uY2Ugd2Ugbm8KPj4+IGxvbmdlciBzZXQgdGhlc2Ug
cGFnZXMgdG8gcmVzZXJ2ZWQsIHdlIGNhbiByZXdvcmsgdGhpcyBmdW5jdGlvbiB0bwo+Pj4gcGVy
Zm9ybSBzZXBhcmF0ZSBjaGVja3MgZm9yIFpPTkVfREVWSUNFIChzcGxpdCBmcm9tIFBHX3Jlc2Vy
dmVkIGNoZWNrcykuCj4+Pgo+Pj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3Jn
Pgo+Pj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+PiBD
YzogS2F0ZSBTdGV3YXJ0IDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnPgo+Pj4gQ2M6IEFs
bGlzb24gUmFuZGFsIDxhbGxpc29uQGxvaHV0b2submV0Pgo+Pj4gQ2M6ICJJc2FhYyBKLiBNYW5q
YXJyZXMiIDxpc2FhY21AY29kZWF1cm9yYS5vcmc+Cj4+PiBDYzogUWlhbiBDYWkgPGNhaUBsY2Eu
cHc+Cj4+PiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+
Pj4gICBtbS91c2VyY29weS5jIHwgNSArKystLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9tbS91c2VyY29w
eS5jIGIvbW0vdXNlcmNvcHkuYwo+Pj4gaW5kZXggNjYwNzE3YTFlYTVjLi5hM2FjNGJlMzVjZGUg
MTAwNjQ0Cj4+PiAtLS0gYS9tbS91c2VyY29weS5jCj4+PiArKysgYi9tbS91c2VyY29weS5jCj4+
PiBAQCAtMjAzLDE0ICsyMDMsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIGNoZWNrX3BhZ2Vfc3Bh
bihjb25zdCB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgbiwKPj4+ICAgCSAqIGRldmljZSBtZW1v
cnkpLCBvciBDTUEuIE90aGVyd2lzZSwgcmVqZWN0IHNpbmNlIHRoZSBvYmplY3Qgc3BhbnMKPj4+
ICAgCSAqIHNldmVyYWwgaW5kZXBlbmRlbnRseSBhbGxvY2F0ZWQgcGFnZXMuCj4+PiAgIAkgKi8K
Pj4+IC0JaXNfcmVzZXJ2ZWQgPSBQYWdlUmVzZXJ2ZWQocGFnZSk7Cj4+PiArCWlzX3Jlc2VydmVk
ID0gUGFnZVJlc2VydmVkKHBhZ2UpIHx8IGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSk7Cj4+PiAg
IAlpc19jbWEgPSBpc19taWdyYXRlX2NtYV9wYWdlKHBhZ2UpOwo+Pj4gICAJaWYgKCFpc19yZXNl
cnZlZCAmJiAhaXNfY21hKQo+Pj4gICAJCXVzZXJjb3B5X2Fib3J0KCJzcGFucyBtdWx0aXBsZSBw
YWdlcyIsIE5VTEwsIHRvX3VzZXIsIDAsIG4pOwo+Pj4gICAJZm9yIChwdHIgKz0gUEFHRV9TSVpF
OyBwdHIgPD0gZW5kOyBwdHIgKz0gUEFHRV9TSVpFKSB7Cj4+PiAgIAkJcGFnZSA9IHZpcnRfdG9f
aGVhZF9wYWdlKHB0cik7Cj4+PiAtCQlpZiAoaXNfcmVzZXJ2ZWQgJiYgIVBhZ2VSZXNlcnZlZChw
YWdlKSkKPj4+ICsJCWlmIChpc19yZXNlcnZlZCAmJiAhKFBhZ2VSZXNlcnZlZChwYWdlKSB8fAo+
Pj4gKwkJCQkgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkpKQo+Pj4gICAJCQl1c2VyY29w
eV9hYm9ydCgic3BhbnMgUmVzZXJ2ZWQgYW5kIG5vbi1SZXNlcnZlZCBwYWdlcyIsCj4+PiAgIAkJ
CQkgICAgICAgTlVMTCwgdG9fdXNlciwgMCwgbik7Cj4+PiAgIAkJaWYgKGlzX2NtYSAmJiAhaXNf
bWlncmF0ZV9jbWFfcGFnZShwYWdlKSkKPj4+Cj4+Cj4+IEBLZWVzLCB3b3VsZCBpdCBiZSBva2F5
IHRvIHN0b3AgY2hlY2tpbmcgYWdhaW5zdCBaT05FX0RFVklDRSBwYWdlcyBoZXJlIG9yCj4+IGlz
IHRoZXJlIGEgZ29vZCByYXRpb25hbGUgYmVoaW5kIHRoaXM/Cj4+Cj4+IChJIHdvdWxkIHR1cm4g
dGhpcyBwYXRjaCBpbnRvIGEgc2ltcGxlIHVwZGF0ZSBvZiB0aGUgY29tbWVudCBpZiB3ZSBhZ3Jl
ZQo+PiB0aGF0IHdlIGRvbid0IGNhcmUpCj4gCj4gVGhlcmUgaGFzIGJlZW4gd29yayB0byBhY3R1
YWxseSByZW1vdmUgdGhlIHBhZ2Ugc3BhbiBjaGVja3MgZW50aXJlbHksCj4gYnV0IHRoZXJlIHdh
c24ndCBjb25zZW5zdXMgb24gd2hhdCB0aGUgcmlnaHQgd2F5IGZvcndhcmQgd2FzLiBJIGNvbnRp
bnVlCj4gdG8gbGVhbmluZyB0b3dhcmQganVzdCBkcm9wcGluZyBpdCBlbnRpcmVseSwgYnV0IE1h
dHRoZXcgV2lsY294IGhhcyBzb21lCj4gYWx0ZXJuYXRpdmUgaWRlYXMgdGhhdCBjb3VsZCB1c2Ug
c29tZSBmdXJ0aGVyIHRob3VnaHQvdGVzdGluZy4KClRoYW5rcyBmb3IgeW91ciByZXBseSEKClNv
LCB0aGUgd29yc3QgdGhpbmcgdGhhdCBjb3VsZCBoYXBwZW4gcmlnaHQgbm93LCB3aGVuIGRyb3Bw
aW5nIHRoaXMKcGF0Y2gsIGlzIHRoYXQgd2Ugd291bGQgcmVqZWN0IHNvbWUgcmFuZ2VzIHdoZW4g
aGFyZGVuaW5nIGlzIG9uLApjb3JyZWN0PyAoc291bmRzIGxpa2UgdGhhdCBjYW4gZWFzaWx5IGJl
IGZvdW5kIGJ5IHRlc3RpbmcgaWYgaXQgaXMKYWN0dWFsbHkgcmVsZXZhbnQpCgpEbyB5b3UgcmVt
ZW1iZXIgaWYgdGhlcmUgd2VyZSByZWFsIFpPTkVfREVWSUNFIHVzZWNhc2VzIHRoYXQgcmVxdWly
ZWQKdGhpcyBmaWx0ZXIgdG8gYmUgaW4gcGxhY2UgZm9yIFBHX3Jlc2VydmVkIHBhZ2VzPwoKLS0g
CgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
