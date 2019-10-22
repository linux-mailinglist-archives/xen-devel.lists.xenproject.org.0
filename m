Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB6E0A6C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxkR-0006IE-H5; Tue, 22 Oct 2019 17:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxkP-0006Hp-AW
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:15:05 +0000
X-Inumbo-ID: 7cfe5ad2-f4ef-11e9-8aca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7cfe5ad2-f4ef-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE4LVhifWdhxYyHhzJkYl/3tgDX3L2GHdaIdArSMoio=;
 b=hiaH9oarstddvZbnyK3sVT3D3oPdu47WGdtsUe6nvwLGC76+40GGzUHPcZPUyWzpNwcFBj
 oQu87zXv+5hJm8JfJ1/E/LYYHYtOj8bxV7s2BhEzTrLTpZoVeBcSJV6j0B5qP8JdlwcbU3
 Oor9L7C4zCXm+m/++Mp5cNA7qpC593U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-YJOMV_QcOSaZIfSzPrmgMA-1; Tue, 22 Oct 2019 13:15:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B09B7107AD33;
 Tue, 22 Oct 2019 17:14:56 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8885ED21;
 Tue, 22 Oct 2019 17:14:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:32 +0200
Message-Id: <20191022171239.21487-6-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: YJOMV_QcOSaZIfSzPrmgMA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 05/12] vfio/type1: Prepare
 is_invalid_reserved_pfn() for PG_reserved changes
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
eS4gVGhleSBhcmUgdHJlYXRlZCBhcwpyZXNlcnZlZCBhbmQgdGhlIHBhZ2UgaXMgbm90IHRvdWNo
ZWQgKGUuZy4sIHRvIHNldCBpdCBkaXJ0eSBvciBhY2Nlc3NlZCkuCgpDYzogQWxleCBXaWxsaWFt
c29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQ2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVj
a0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgMTAgKysrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92Zmlv
L3ZmaW9faW9tbXVfdHlwZTEuYwppbmRleCAyYWRhOGU2Y2RiODguLmY4Y2U4YzQwOGJhOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3Zm
aW8vdmZpb19pb21tdV90eXBlMS5jCkBAIC0yOTksOSArMjk5LDE1IEBAIHN0YXRpYyBpbnQgdmZp
b19sb2NrX2FjY3Qoc3RydWN0IHZmaW9fZG1hICpkbWEsIGxvbmcgbnBhZ2UsIGJvb2wgYXN5bmMp
CiAgKi8KIHN0YXRpYyBib29sIGlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHVuc2lnbmVkIGxvbmcg
cGZuKQogewotCWlmIChwZm5fdmFsaWQocGZuKSkKLQkJcmV0dXJuIFBhZ2VSZXNlcnZlZChwZm5f
dG9fcGFnZShwZm4pKTsKKwlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShw
Zm4pOwogCisJLyoKKwkgKiBXZSB0cmVhdCBhbnkgcGFnZXMgdGhhdCBhcmUgbm90IG9ubGluZSAo
bm90IG1hbmFnZWQgYnkgdGhlIGJ1ZGR5KQorCSAqIGFzIHJlc2VydmVkIC0gdGhpcyBpbmNsdWRl
cyBaT05FX0RFVklDRSBwYWdlcyBhbmQgcGFnZXMgd2l0aG91dAorCSAqIGEgbWVtbWFwIChlLmcu
LCBtYXBwZWQgdmlhIC9kZXYvbWVtKS4KKwkgKi8KKwlpZiAocGFnZSkKKwkJcmV0dXJuIFBhZ2VS
ZXNlcnZlZChwYWdlKTsKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
