Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E1E0A76
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxlA-0006Ul-AC; Tue, 22 Oct 2019 17:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxl9-0006Ua-6T
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:15:51 +0000
X-Inumbo-ID: 987c6010-f4ef-11e9-946f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 987c6010-f4ef-11e9-946f-12813bfff9fa;
 Tue, 22 Oct 2019 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS/04FUnui5sNwBDedSDS4UewrsrxLUrEqpw2KoK/cQ=;
 b=UsIFX9byGDswSlHkMWt9fV04gWYrZdPdY/aFPwaQojTPBDe1Ecg/4zGQ5NuvnKwfwW31c6
 mnEgb/APVd1tkDWHT/SkJat0K7osLSRNhTW+X2STBRRIo1/k0dNTcbjqfH0aMGdIhpf5Pj
 tm6XG5zIMAetJg2KXuExVMAKH5vbuRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-hQ4mXGwAP7eWs8CpMKPvnw-1; Tue, 22 Oct 2019 13:15:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9666107AD31;
 Tue, 22 Oct 2019 17:15:41 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 903AE5DA8D;
 Tue, 22 Oct 2019 17:15:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:34 +0200
Message-Id: <20191022171239.21487-8-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: hQ4mXGwAP7eWs8CpMKPvnw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 07/12] staging: kpc2000: Prepare
 transfer_complete_cb() for PG_reserved changes
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KClRoZSBwYWdlcyBhcmUgb2J0YWluZWQgdmlhIGdldF91
c2VyX3BhZ2VzX2Zhc3QoKS4gSSBhc3N1bWUsIHRoZXNlCmNvdWxkIGJlIFpPTkVfREVWSUNFIHBh
Z2VzLiBMZXQncyBqdXN0IGV4Y2x1ZGUgdGhlbSBhcyB3ZWxsIGV4cGxpY2l0bHkuCgpDYzogR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFZhbmRhbmEg
Qk4gPGJudmFuZGFuYUBnbWFpbC5jb20+CkNjOiAiU2ltb24gU2FuZHN0csO2bSIgPHNpbW9uQG5p
a2Fub3IubnU+CkNjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkNj
OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KQ2M6IE1hZGh1bWl0
aGEgUHJhYmFrYXJhbiA8bWFkaHVtaXRoYWJpd0BnbWFpbC5jb20+CkNjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+CkNjOiBNYXR0IFNpY2tsZXIgPE1hdHQuU2lja2xlckBkYWt0
cm9uaWNzLmNvbT4KQ2M6IEplcmVteSBTb3dkZW4gPGplcmVteUBhemF6ZWwubmV0PgpTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L3N0YWdpbmcva3BjMjAwMC9rcGNfZG1hL2ZpbGVvcHMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
dGFnaW5nL2twYzIwMDAva3BjX2RtYS9maWxlb3BzLmMgYi9kcml2ZXJzL3N0YWdpbmcva3BjMjAw
MC9rcGNfZG1hL2ZpbGVvcHMuYwppbmRleCBjYjUyYmQ5YTZkMmYuLjQ1N2FkY2M4MWZlNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2twYzIwMDAva3BjX2RtYS9maWxlb3BzLmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2twYzIwMDAva3BjX2RtYS9maWxlb3BzLmMKQEAgLTIxMiw3ICsyMTIs
OCBAQCB2b2lkICB0cmFuc2Zlcl9jb21wbGV0ZV9jYihzdHJ1Y3QgYWlvX2NiX2RhdGEgKmFjZCwg
c2l6ZV90IHhmcl9jb3VudCwgdTMyIGZsYWdzKQogCUJVR19PTihhY2QtPmxkZXYtPnBsZGV2ID09
IE5VTEwpOwogCiAJZm9yIChpID0gMCA7IGkgPCBhY2QtPnBhZ2VfY291bnQgOyBpKyspIHsKLQkJ
aWYgKCFQYWdlUmVzZXJ2ZWQoYWNkLT51c2VyX3BhZ2VzW2ldKSkgeworCQlpZiAoIVBhZ2VSZXNl
cnZlZChhY2QtPnVzZXJfcGFnZXNbaV0pICYmCisJCSAgICAhaXNfem9uZV9kZXZpY2VfcGFnZShh
Y2QtPnVzZXJfcGFnZXNbaV0pKSB7CiAJCQlzZXRfcGFnZV9kaXJ0eShhY2QtPnVzZXJfcGFnZXNb
aV0pOwogCQl9CiAJfQotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
