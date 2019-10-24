Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976BE31F9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbxA-0004qe-TS; Thu, 24 Oct 2019 12:10:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbx9-0004pO-16
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:10:55 +0000
X-Inumbo-ID: 52e7b464-f657-11e9-949f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 52e7b464-f657-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUw+4OUStTuaq5ok3fmgq6nv+XIwZUDTl4O246f/KSo=;
 b=Mphi4odUz6rpOo7NfySpzAq1zpgNhKwMBhQoLlCqnbY2G01htLXPEwLdGshy6syP9B2P5U
 jsYZp33qMxwNjyrCNQ9Xhz+t3t4YgMDOGwpirF/Ha+jU+fryTpfjPbfhlC2IlpyhMAt0gM
 iHO6pBUIpg3bFN/yOVzeO/Ow/rmq04w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-KwvfWgdbN8Olk7KAgSZhkg-1; Thu, 24 Oct 2019 08:10:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274885E4;
 Thu, 24 Oct 2019 12:10:43 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C261C93D;
 Thu, 24 Oct 2019 12:10:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:30 +0200
Message-Id: <20191024120938.11237-3-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KwvfWgdbN8Olk7KAgSZhkg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 02/10] KVM: x86/mmu: Prepare
 kvm_is_mmio_pfn() for PG_reserved changes
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KCktWTSBoYXMgdGhpcyB3ZWlyZCB1c2UgY2FzZSB0aGF0
IHlvdSBjYW4gbWFwIGFueXRoaW5nIGZyb20gL2Rldi9tZW0KaW50byB0aGUgZ3Vlc3QuIHBmbl92
YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNoZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAp3YXMgaW5p
dGlhbGl6ZWQgYW5kIGNhbiBiZSB0b3VjaGVkLiBwZm5fdG9fb25saW5lX3BhZ2UoKSBtYWtlcyBz
dXJlCnRoYXQgd2UgaGF2ZSBhbiBpbml0aWFsaXplZCBtZW1tYXAgKGFuZCBkb24ndCBoYXZlIFpP
TkVfREVWSUNFIG1lbW9yeSkuCgpSZXdyaXRlIGt2bV9pc19tbWlvX3BmbigpIHRvIG1ha2Ugc3Vy
ZSB0aGUgZnVuY3Rpb24gcHJvZHVjZXMgdGhlCnNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0
aW5nIFpPTkVfREVWSUNFIHBhZ2VzIFBHX3Jlc2VydmVkLgoKQ2M6IFBhb2xvIEJvbnppbmkgPHBi
b256aW5pQHJlZGhhdC5jb20+CkNjOiAiUmFkaW0gS3LEjW3DocWZIiA8cmtyY21hckByZWRoYXQu
Y29tPgpDYzogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVs
LmNvbT4KQ2M6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+CkNjOiBXYW5w
ZW5nIExpIDx3YW5wZW5nbGlAdGVuY2VudC5jb20+CkNjOiBKaW0gTWF0dHNvbiA8am1hdHRzb25A
Z29vZ2xlLmNvbT4KQ2M6IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogIkguIFBldGVy
IEFudmluIiA8aHBhQHp5dG9yLmNvbT4KQ2M6IEthcmltQWxsYWggQWhtZWQgPGthcmFobWVkQGFt
YXpvbi5kZT4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+CkNjOiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21tdS5jIHwgMjkg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11LmMg
Yi9hcmNoL3g4Ni9rdm0vbW11LmMKaW5kZXggMjRjMjNjNjZiMjI2Li5mMDMwODlhMzM2ZGUgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11LmMKQEAg
LTI5NjIsMjAgKzI5NjIsMjUgQEAgc3RhdGljIGJvb2wgbW11X25lZWRfd3JpdGVfcHJvdGVjdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbiwKIAogc3RhdGljIGJvb2wga3ZtX2lzX21t
aW9fcGZuKGt2bV9wZm5fdCBwZm4pCiB7CisJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fb25s
aW5lX3BhZ2UocGZuKTsKKworCS8qCisJICogWk9ORV9ERVZJQ0UgcGFnZXMgYXJlIG5ldmVyIG9u
bGluZS4gT25saW5lIHBhZ2VzIHRoYXQgYXJlIHJlc2VydmVkCisJICogZWl0aGVyIGluZGljYXRl
IHRoZSB6ZXJvIHBhZ2Ugb3IgTU1JTyBwYWdlcy4KKwkgKi8KKwlpZiAocGFnZSkKKwkJcmV0dXJu
ICFpc196ZXJvX3BmbihwZm4pICYmIFBhZ2VSZXNlcnZlZChwZm5fdG9fcGFnZShwZm4pKTsKKwor
CS8qCisJICogQW55dGhpbmcgd2l0aCBhIHZhbGlkIChidXQgbm90IG9ubGluZSkgbWVtbWFwIGNv
dWxkIGJlIFpPTkVfREVWSUNFLgorCSAqIFRyZWF0IG9ubHkgVUMvVUMtL1dDIHBhZ2VzIGFzIE1N
SU8uCisJICovCiAJaWYgKHBmbl92YWxpZChwZm4pKQotCQlyZXR1cm4gIWlzX3plcm9fcGZuKHBm
bikgJiYgUGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHBmbikpICYmCi0JCQkvKgotCQkJICogU29t
ZSByZXNlcnZlZCBwYWdlcywgc3VjaCBhcyB0aG9zZSBmcm9tIE5WRElNTQotCQkJICogREFYIGRl
dmljZXMsIGFyZSBub3QgZm9yIE1NSU8sIGFuZCBjYW4gYmUgbWFwcGVkCi0JCQkgKiB3aXRoIGNh
Y2hlZCBtZW1vcnkgdHlwZSBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlLgotCQkJICogSG93ZXZlciwg
dGhlIGFib3ZlIGNoZWNrIG1pc2NvbmNlaXZlcyB0aG9zZSBwYWdlcwotCQkJICogYXMgTU1JTywg
YW5kIHJlc3VsdHMgaW4gS1ZNIG1hcHBpbmcgdGhlbSB3aXRoIFVDCi0JCQkgKiBtZW1vcnkgdHlw
ZSwgd2hpY2ggd291bGQgaHVydCB0aGUgcGVyZm9ybWFuY2UuCi0JCQkgKiBUaGVyZWZvcmUsIHdl
IGNoZWNrIHRoZSBob3N0IG1lbW9yeSB0eXBlIGluIGFkZGl0aW9uCi0JCQkgKiBhbmQgb25seSB0
cmVhdCBVQy9VQy0vV0MgcGFnZXMgYXMgTU1JTy4KLQkJCSAqLwotCQkJKCFwYXRfZW5hYmxlZCgp
IHx8IHBhdF9wZm5faW1tdW5lX3RvX3VjX210cnIocGZuKSk7CisJCXJldHVybiAhcGF0X2VuYWJs
ZWQoKSB8fCBwYXRfcGZuX2ltbXVuZV90b191Y19tdHJyKHBmbik7CiAKKwkvKgorCSAqIEFueSBS
QU0gdGhhdCBoYXMgbm8gbWVtbWFwIChlLmcuLCBtYXBwZWQgdmlhIC9kZXYvbWVtKSBpcyBub3Qg
TU1JTy4KKwkgKi8KIAlyZXR1cm4gIWU4MjBfX21hcHBlZF9yYXdfYW55KHBmbl90b19ocGEocGZu
KSwKIAkJCQkgICAgIHBmbl90b19ocGEocGZuICsgMSkgLSAxLAogCQkJCSAgICAgRTgyMF9UWVBF
X1JBTSk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
