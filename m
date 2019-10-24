Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1699E320F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbzL-0005Ie-At; Thu, 24 Oct 2019 12:13:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbzJ-0005IQ-Cp
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:13:09 +0000
X-Inumbo-ID: a3e6c120-f657-11e9-a531-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a3e6c120-f657-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LRGcEG74kR2LEgOmaMjJgXKKQcoIUakiEQOjfGHgANM=;
 b=hSFwfwV9npnJGYIFMNIMIOIwZtuCNtXLMiFhvOj1OE2FnVeGL+OumNw5N/41KTf5v8wRq0
 tRrMQQmhwn6SUNjNd5RZSrD0ogoECw4NShBFhW0BTyU+IcI8SXol8SR8aGIOQVvirIxa9I
 juYyp6q1W/O2hMw7gCWiec7e6oIbbaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Nt3QL1jGMwSMlYksEV1tZg-1; Thu, 24 Oct 2019 08:13:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA6D107AD33;
 Thu, 24 Oct 2019 12:13:00 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C43225F74;
 Thu, 24 Oct 2019 12:12:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:34 +0200
Message-Id: <20191024120938.11237-7-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Nt3QL1jGMwSMlYksEV1tZg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 06/10] powerpc/64s: Prepare
 hash_page_do_lazy_icache() for PG_reserved changes
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
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4g
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KClJld3JpdGUgaGFzaF9wYWdlX2RvX2xhenlfaWNhY2hl
KCkgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbiBwcm9kdWNlcyB0aGUKc2FtZSByZXN1bHQgb25j
ZSB3ZSBzdG9wIHNldHRpbmcgWk9ORV9ERVZJQ0UgcGFnZXMgUEdfcmVzZXJ2ZWQuCgpDYzogQmVu
amFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgpDYzogUGF1bCBN
YWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxs
ZXJtYW4uaWQuYXU+CkNjOiAiQW5lZXNoIEt1bWFyIEsuViIgPGFuZWVzaC5rdW1hckBsaW51eC5p
Ym0uY29tPgpDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+CkNj
OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgpDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXgu
aWJtLmNvbT4KQ2M6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9oYXNoX3V0aWxzLmMKaW5kZXggNmMxMjM3NjAxNjRlLi5hMTU2NjAzOWU3NDcgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMKKysrIGIvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYwpAQCAtMTA4NCwxMyArMTA4NCwxNSBAQCB2b2lk
IGhhc2hfX2Vhcmx5X2luaXRfbW11X3NlY29uZGFyeSh2b2lkKQogICovCiB1bnNpZ25lZCBpbnQg
aGFzaF9wYWdlX2RvX2xhenlfaWNhY2hlKHVuc2lnbmVkIGludCBwcCwgcHRlX3QgcHRlLCBpbnQg
dHJhcCkKIHsKLQlzdHJ1Y3QgcGFnZSAqcGFnZTsKKwlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90
b19vbmxpbmVfcGFnZShwdGVfcGZuKHB0ZSkpOwogCi0JaWYgKCFwZm5fdmFsaWQocHRlX3Bmbihw
dGUpKSkKKwkvKgorCSAqIFdlIGlnbm9yZSBhbnkgcGFnZXMgdGhhdCBhcmUgbm90IG9ubGluZSAo
bm90IG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KS4KKwkgKiBUaGlzIGluY2x1ZGVzIFpPTkVfREVWSUNF
IHBhZ2VzLgorCSAqLworCWlmICghcGFnZSkKIAkJcmV0dXJuIHBwOwogCi0JcGFnZSA9IHB0ZV9w
YWdlKHB0ZSk7Ci0KIAkvKiBwYWdlIGlzIGRpcnR5ICovCiAJaWYgKCF0ZXN0X2JpdChQR19hcmNo
XzEsICZwYWdlLT5mbGFncykgJiYgIVBhZ2VSZXNlcnZlZChwYWdlKSkgewogCQlpZiAodHJhcCA9
PSAweDQwMCkgewotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
