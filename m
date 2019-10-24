Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B7E320D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:15:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbze-0005N8-KN; Thu, 24 Oct 2019 12:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbzc-0005Mi-N3
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:13:28 +0000
X-Inumbo-ID: af8ddb3a-f657-11e9-beca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id af8ddb3a-f657-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uytp7CiQUykRNdQZX1bgaVZ4SH8DD/y5BnwPHrsxaAw=;
 b=AQP2lSzLyc9ZIev+fBOfCEqDRCN08aPf+CHQFSwrro7MP58ZEboHhWJNL4oXcAnUDhKzpG
 bpc2igJwFCIovpTbSDk4cMfJn3EnLh68YKdBEeK5NRY4+O7y3Mrd2WDB/xKtMDbVN+JtPY
 HL/x+VYafBryY4U0zkTD95UeroQB3mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-uD3eMwCPNuyUH4oElpkK2Q-1; Thu, 24 Oct 2019 08:13:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F6B1005500;
 Thu, 24 Oct 2019 12:13:20 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42A9952E0;
 Thu, 24 Oct 2019 12:13:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:35 +0200
Message-Id: <20191024120938.11237-8-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: uD3eMwCPNuyUH4oElpkK2Q-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 07/10] powerpc/mm: Prepare
 maybe_pte_to_page() for PG_reserved changes
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KClJld3JpdGUgbWF5YmVfcHRlX3RvX3BhZ2UoKSB0byBt
YWtlIHN1cmUgdGhlIGZ1bmN0aW9uIHByb2R1Y2VzIHRoZQpzYW1lIHJlc3VsdCBvbmNlIHdlIHN0
b3Agc2V0dGluZyBaT05FX0RFVklDRSBwYWdlcyBQR19yZXNlcnZlZC4KCkNjOiBCZW5qYW1pbiBI
ZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+CkNjOiBQYXVsIE1hY2tlcnJh
cyA8cGF1bHVzQHNhbWJhLm9yZz4KQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5p
ZC5hdT4KQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgpDYzog
IkFuZWVzaCBLdW1hciBLLlYiIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KQ2M6IEFsbGlz
b24gUmFuZGFsIDxhbGxpc29uQGxvaHV0b2submV0PgpDYzogTmljaG9sYXMgUGlnZ2luIDxucGln
Z2luQGdtYWlsLmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBh
cmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvbW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwppbmRleCBlMzc1OWI2
OWY4MWIuLjYxM2M5OGZhN2RjMCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUu
YworKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jCkBAIC01NSwxMCArNTUsMTIgQEAgc3Rh
dGljIHN0cnVjdCBwYWdlICptYXliZV9wdGVfdG9fcGFnZShwdGVfdCBwdGUpCiAJdW5zaWduZWQg
bG9uZyBwZm4gPSBwdGVfcGZuKHB0ZSk7CiAJc3RydWN0IHBhZ2UgKnBhZ2U7CiAKLQlpZiAodW5s
aWtlbHkoIXBmbl92YWxpZChwZm4pKSkKLQkJcmV0dXJuIE5VTEw7Ci0JcGFnZSA9IHBmbl90b19w
YWdlKHBmbik7Ci0JaWYgKFBhZ2VSZXNlcnZlZChwYWdlKSkKKwkvKgorCSAqIFdlIHJlamVjdCBh
bnkgcGFnZXMgdGhhdCBhcmUgbm90IG9ubGluZSAobm90IG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KS4K
KwkgKiBUaGlzIGluY2x1ZGVzIFpPTkVfREVWSUNFIHBhZ2VzLgorCSAqLworCXBhZ2UgPSBwZm5f
dG9fb25saW5lX3BhZ2UocGZuKTsKKwlpZiAodW5saWtlbHkoIXBhZ2UgfHwgUGFnZVJlc2VydmVk
KHBhZ2UpKSkKIAkJcmV0dXJuIE5VTEw7CiAJcmV0dXJuIHBhZ2U7CiB9Ci0tIAoyLjIxLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
