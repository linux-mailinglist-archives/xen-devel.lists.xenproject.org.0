Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD25E31F6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbxT-0004ud-BI; Thu, 24 Oct 2019 12:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbxS-0004uX-MS
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:11:14 +0000
X-Inumbo-ID: 5f562dd4-f657-11e9-a531-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5f562dd4-f657-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Snv/eN2JSs1CKovdcEZrKtv3120OMPYnvMUKCAi50+E=;
 b=J8XNYJWRWQRNddlk0fbrEmhxGj3H4TXpUcBXAKchMcMV+JKZssNgeZKUmjwpQLK6IYldCJ
 4ZK1cMzkkOgBP3D2tOT2X7BfQkCoddlrrR2/aWO+9ifPLDrufbu632xjVW3Nj9IZCftGQi
 hVrMoh/avbCjWD389HmGFY8CPBv16jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-XqXphJdGOZKQf4BuJSlwgQ-1; Thu, 24 Oct 2019 08:11:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 040841005500;
 Thu, 24 Oct 2019 12:11:04 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E74A166A0;
 Thu, 24 Oct 2019 12:10:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:31 +0200
Message-Id: <20191024120938.11237-4-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: XqXphJdGOZKQf4BuJSlwgQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
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
TkVfREVWSUNFIG1lbW9yeSkuCgpSZXdyaXRlIGt2bV9pc19yZXNlcnZlZF9wZm4oKSB0byBtYWtl
IHN1cmUgdGhlIGZ1bmN0aW9uIHByb2R1Y2VzIHRoZQpzYW1lIHJlc3VsdCBvbmNlIHdlIHN0b3Ag
c2V0dGluZyBaT05FX0RFVklDRSBwYWdlcyBQR19yZXNlcnZlZC4KCkNjOiBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPgpDYzogIlJhZGltIEtyxI1tw6HFmSIgPHJrcmNtYXJAcmVk
aGF0LmNvbT4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+CkNjOiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEthcmltQWxsYWggQWhtZWQgPGth
cmFobWVkQGFtYXpvbi5kZT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20+Ci0tLQogdmlydC9rdm0va3ZtX21haW4uYyB8IDEwICsrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggZTllYjY2
NmViNmU4Li45ZDE4Y2M2N2QxMjQgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysr
IGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMTUxLDkgKzE1MSwxNSBAQCBfX3dlYWsgaW50IGt2
bV9hcmNoX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwKIAog
Ym9vbCBrdm1faXNfcmVzZXJ2ZWRfcGZuKGt2bV9wZm5fdCBwZm4pCiB7Ci0JaWYgKHBmbl92YWxp
ZChwZm4pKQotCQlyZXR1cm4gUGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHBmbikpOworCXN0cnVj
dCBwYWdlICpwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7CiAKKwkvKgorCSAqIFdlIHRy
ZWF0IGFueSBwYWdlcyB0aGF0IGFyZSBub3Qgb25saW5lIChub3QgbWFuYWdlZCBieSB0aGUgYnVk
ZHkpCisJICogYXMgcmVzZXJ2ZWQgLSB0aGlzIGluY2x1ZGVzIFpPTkVfREVWSUNFIHBhZ2VzIGFu
ZCBwYWdlcyB3aXRob3V0CisJICogYSBtZW1tYXAgKGUuZy4sIG1hcHBlZCB2aWEgL2Rldi9tZW0p
LgorCSAqLworCWlmIChwYWdlKQorCQlyZXR1cm4gUGFnZVJlc2VydmVkKHBhZ2UpOwogCXJldHVy
biB0cnVlOwogfQogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
