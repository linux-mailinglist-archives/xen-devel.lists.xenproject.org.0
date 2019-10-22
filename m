Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15601E0A6E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxm7-0006lk-B0; Tue, 22 Oct 2019 17:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxm6-0006lB-FO
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:16:50 +0000
X-Inumbo-ID: bbd2f791-f4ef-11e9-946f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bbd2f791-f4ef-11e9-946f-12813bfff9fa;
 Tue, 22 Oct 2019 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90Byu3ETLZBHqIXXrLqjffjh+7RU+7dCwtXpXn0ipgQ=;
 b=hUnRGI+WL7/pgPI9QXkiGT7Bq4O0y1pniFXBSSwjbXxC2Tm3/c2xgf6T0CNHVw5fb4ZKqO
 X0RZmZ6vrDxUi1z9GMrgz1yiOitzbSv3FaFPJ+8lw34sYvsrTa7EYGvu8b9KL06PgMtZYE
 3wXRibwnwcAtd66uycAmPwsDxSB3qeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-zN07TtZJN9uCqMmQ3T4-mg-1; Tue, 22 Oct 2019 13:16:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1D4E1005509;
 Tue, 22 Oct 2019 17:16:41 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBBFC5DA8D;
 Tue, 22 Oct 2019 17:16:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:37 +0200
Message-Id: <20191022171239.21487-11-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zN07TtZJN9uCqMmQ3T4-mg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 10/12] powerpc/mm: Prepare
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KCldlIGNvdWxkIGV4cGxpY2l0bHkgY2hlY2sgZm9yIGlz
X3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkuIEJ1dCBsb29raW5nIGF0CnRoZSBwZm5fdmFsaWQoKSBj
aGVjaywgaXQgc2VlbXMgc2FmZXIgdG8ganVzdCB1c2UgcGZuX3RvX29ubGluZV9wYWdlKCkKaGVy
ZSwgdGhhdCB3aWxsIHNraXAgYWxsIFpPTkVfREVWSUNFIHBhZ2VzIHJpZ2h0IGF3YXkuCgpDYzog
QmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgpDYzogUGF1
bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+CkNjOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMt
cy5mcj4KQ2M6ICJBbmVlc2ggS3VtYXIgSy5WIiA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+
CkNjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNvbkBsb2h1dG9rLm5ldD4KQ2M6IE5pY2hvbGFzIFBp
Z2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5j
b20+Ci0tLQogYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyB8IDEwICsrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMKaW5k
ZXggZTM3NTliNjlmODFiLi42MTNjOThmYTdkYzAgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9t
bS9wZ3RhYmxlLmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwpAQCAtNTUsMTAgKzU1
LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqbWF5YmVfcHRlX3RvX3BhZ2UocHRlX3QgcHRlKQog
CXVuc2lnbmVkIGxvbmcgcGZuID0gcHRlX3BmbihwdGUpOwogCXN0cnVjdCBwYWdlICpwYWdlOwog
Ci0JaWYgKHVubGlrZWx5KCFwZm5fdmFsaWQocGZuKSkpCi0JCXJldHVybiBOVUxMOwotCXBhZ2Ug
PSBwZm5fdG9fcGFnZShwZm4pOwotCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkpCisJLyoKKwkgKiBX
ZSByZWplY3QgYW55IHBhZ2VzIHRoYXQgYXJlIG5vdCBvbmxpbmUgKG5vdCBtYW5hZ2VkIGJ5IHRo
ZSBidWRkeSkuCisJICogVGhpcyBpbmNsdWRlcyBaT05FX0RFVklDRSBwYWdlcy4KKwkgKi8KKwlw
YWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7CisJaWYgKHVubGlrZWx5KCFwYWdlIHx8IFBh
Z2VSZXNlcnZlZChwYWdlKSkpCiAJCXJldHVybiBOVUxMOwogCXJldHVybiBwYWdlOwogfQotLSAK
Mi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
