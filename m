Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E025CE0A70
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxlp-0006gx-0F; Tue, 22 Oct 2019 17:16:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxlm-0006gU-Nk
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:16:30 +0000
X-Inumbo-ID: af8424d2-f4ef-11e9-8aca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id af8424d2-f4ef-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1S4FppofmjyZijjNbIY0XCtcc4HnEIEIXbCi0lPb5Y=;
 b=LeeYjhX3hBVL/oRC2qHu1DVRYcrCfkF+vRZNKX3DygB0PAxAwwAtyx8hGHz/4zR+10k7aK
 jCl77U0PKwONnXN7YCUJXVG3O3WN9ijJ1wRZJDCaYcYqFJwIbGXfqkybM2Pmtvo6B5GJxF
 Kbs8S2wphjxwTCwVZcOA6y1oWq44CGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-fU-qS8_YMIyHrwTYnW1SnA-1; Tue, 22 Oct 2019 13:16:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4E9107AD31;
 Tue, 22 Oct 2019 17:16:21 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C045DA8D;
 Tue, 22 Oct 2019 17:16:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:36 +0200
Message-Id: <20191022171239.21487-10-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: fU-qS8_YMIyHrwTYnW1SnA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 09/12] powerpc/64s: Prepare
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
ZWxsZXJtYW4uaWQuYXU+CkNjOiAiQW5lZXNoIEt1bWFyIEsuViIgPGFuZWVzaC5rdW1hckBsaW51
eC5pYm0uY29tPgpDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+
CkNjOiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgpDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGlu
dXguaWJtLmNvbT4KQ2M6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29r
M3M2NC9oYXNoX3V0aWxzLmMKaW5kZXggNmMxMjM3NjAxNjRlLi5hMTU2NjAzOWU3NDcgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMKKysrIGIvYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYwpAQCAtMTA4NCwxMyArMTA4NCwxNSBAQCB2
b2lkIGhhc2hfX2Vhcmx5X2luaXRfbW11X3NlY29uZGFyeSh2b2lkKQogICovCiB1bnNpZ25lZCBp
bnQgaGFzaF9wYWdlX2RvX2xhenlfaWNhY2hlKHVuc2lnbmVkIGludCBwcCwgcHRlX3QgcHRlLCBp
bnQgdHJhcCkKIHsKLQlzdHJ1Y3QgcGFnZSAqcGFnZTsKKwlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBm
bl90b19vbmxpbmVfcGFnZShwdGVfcGZuKHB0ZSkpOwogCi0JaWYgKCFwZm5fdmFsaWQocHRlX3Bm
bihwdGUpKSkKKwkvKgorCSAqIFdlIGlnbm9yZSBhbnkgcGFnZXMgdGhhdCBhcmUgbm90IG9ubGlu
ZSAobm90IG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KS4KKwkgKiBUaGlzIGluY2x1ZGVzIFpPTkVfREVW
SUNFIHBhZ2VzLgorCSAqLworCWlmICghcGFnZSkKIAkJcmV0dXJuIHBwOwogCi0JcGFnZSA9IHB0
ZV9wYWdlKHB0ZSk7Ci0KIAkvKiBwYWdlIGlzIGRpcnR5ICovCiAJaWYgKCF0ZXN0X2JpdChQR19h
cmNoXzEsICZwYWdlLT5mbGFncykgJiYgIVBhZ2VSZXNlcnZlZChwYWdlKSkgewogCQlpZiAodHJh
cCA9PSAweDQwMCkgewotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
