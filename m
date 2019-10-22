Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD19E0A6D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:18:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxlS-0006bF-Ls; Tue, 22 Oct 2019 17:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxlQ-0006aw-Vj
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:16:09 +0000
X-Inumbo-ID: a320752e-f4ef-11e9-946f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a320752e-f4ef-11e9-946f-12813bfff9fa;
 Tue, 22 Oct 2019 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FajnFySKW/A5xDPqu9rw0Ua4hR3TkmQD80jFnqfnPxM=;
 b=TTZiZ2nbO0dIXZiQ8wAPpXiom5n2Of1nHQRsPLJwXOA2JvA3X/7mPBac2ILG1Q5xrB1UKN
 RU0DgvzpmPDiteQpty3/Hq9O/8yxQik43bOoUeDPvVVudeVAtrsMXm325dCWlJ2AhISsYk
 muu7DgsiPyy4SK/wgGlfSGQ75GTl2nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-nIyOmixtOyKHdiiLzBpxAg-1; Tue, 22 Oct 2019 13:16:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1C24800D53;
 Tue, 22 Oct 2019 17:16:00 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF84612AB;
 Tue, 22 Oct 2019 17:15:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:35 +0200
Message-Id: <20191022171239.21487-9-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: nIyOmixtOyKHdiiLzBpxAg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 08/12] powerpc/book3s: Prepare
 kvmppc_book3s_instantiate_page() for PG_reserved changes
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
 =?UTF-8?q?Simon=20Sandstr=C3=B6m?= <simon@nikanor.nu>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4g
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KCktWTSBoYXMgdGhpcyB3ZWlyZCB1c2UgY2FzZSB0aGF0
IHlvdSBjYW4gbWFwIGFueXRoaW5nIGZyb20gL2Rldi9tZW0KaW50byB0aGUgZ3Vlc3QuIHBmbl92
YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNoZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAp3YXMgaW5p
dGlhbGl6ZWQgYW5kIGNhbiBiZSB0b3VjaGVkLiBwZm5fdG9fb25saW5lX3BhZ2UoKSBtYWtlcyBz
dXJlCnRoYXQgd2UgaGF2ZSBhbiBpbml0aWFsaXplZCBtZW1tYXAuIE5vdGUgdGhhdCBaT05FX0RF
VklDRSBtZW1vcnkgaXMKbmV2ZXIgb25saW5lIChJT1csIG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KS4K
ClN3aXRjaGluZyB0byBwZm5fdG9fb25saW5lX3BhZ2UoKSBrZWVwcyB0aGUgZXhpc3RpbmcgYmVo
YXZpb3IgZm9yClBGTnMgd2l0aG91dCBhIG1lbW1hcCBhbmQgZm9yIFpPTkVfREVWSUNFIG1lbW9y
eS4KCkNjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQG96bGFicy5vcmc+CkNjOiBCZW5qYW1pbiBI
ZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+CkNjOiBNaWNoYWVsIEVsbGVy
bWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPgotLS0KIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9y
YWRpeC5jIHwgMTQgKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Nf
NjRfbW11X3JhZGl4LmMgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYwpp
bmRleCAyZDQxNWMzNmE2MWQuLjA1Mzk3YzA1NjFmYyAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBj
L2t2bS9ib29rM3NfNjRfbW11X3JhZGl4LmMKKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Nf
NjRfbW11X3JhZGl4LmMKQEAgLTgwMSwxMiArODAxLDE0IEBAIGludCBrdm1wcGNfYm9vazNzX2lu
c3RhbnRpYXRlX3BhZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCQkgICB3cml0aW5nLCB1
cGdyYWRlX3ApOwogCQlpZiAoaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pKQogCQkJcmV0dXJuIC1F
RkFVTFQ7Ci0JCXBhZ2UgPSBOVUxMOwotCQlpZiAocGZuX3ZhbGlkKHBmbikpIHsKLQkJCXBhZ2Ug
PSBwZm5fdG9fcGFnZShwZm4pOwotCQkJaWYgKFBhZ2VSZXNlcnZlZChwYWdlKSkKLQkJCQlwYWdl
ID0gTlVMTDsKLQkJfQorCQkvKgorCQkgKiBXZSB0cmVhdCBhbnkgcGFnZXMgdGhhdCBhcmUgbm90
IG9ubGluZSAobm90IG1hbmFnZWQgYnkgdGhlCisJCSAqIGJ1ZGR5KSBhcyByZXNlcnZlZCAtIHRo
aXMgaW5jbHVkZXMgWk9ORV9ERVZJQ0UgcGFnZXMgYW5kCisJCSAqIHBhZ2VzIHdpdGhvdXQgYSBt
ZW1tYXAgKGUuZy4sIG1hcHBlZCB2aWEgL2Rldi9tZW0pLgorCQkgKi8KKwkJcGFnZSA9IHBmbl90
b19vbmxpbmVfcGFnZShwZm4pOworCQlpZiAocGFnZSAmJiBQYWdlUmVzZXJ2ZWQocGFnZSkpCisJ
CQlwYWdlID0gTlVMTDsKIAl9CiAKIAkvKgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
