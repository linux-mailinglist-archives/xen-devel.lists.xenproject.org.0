Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D93E0A64
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:17:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxkl-0006Nq-Qb; Tue, 22 Oct 2019 17:15:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxkj-0006NO-RI
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:15:25 +0000
X-Inumbo-ID: 8945c62c-f4ef-11e9-a531-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8945c62c-f4ef-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzLCMm+xQ4R90TU2Qdv5H9QyOFSrGxYrIpM4gzVWQEQ=;
 b=fyTQ1MpL4P+GB0pZ4xHVZiSsbwDGuwz7BJ/pnkEYYG29KApqpadv3+Mvt+EE3bB8SAVSw7
 magVGCa95IOCSQYmZFWFuOI/Sj38no45NTNAAd6UWNdWKbHWnv1YofL/DSpSK/E5ZmtRnw
 vTzhtkjqCWFb9Nww1mI7fM0NMQBHmHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-N1DsqZ8gPdiNLANKsu8dcA-1; Tue, 22 Oct 2019 13:15:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 441A147B;
 Tue, 22 Oct 2019 17:15:17 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 026E85ED23;
 Tue, 22 Oct 2019 17:14:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:33 +0200
Message-Id: <20191022171239.21487-7-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: N1DsqZ8gPdiNLANKsu8dcA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 06/12] staging/gasket: Prepare
 gasket_release_page() for PG_reserved changes
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
Z2VzLiBMZXQncyBqdXN0IGV4Y2x1ZGUgdGhlbSBhcyB3ZWxsIGV4cGxpY2l0bHkuCgpDYzogUm9i
IFNwcmluZ2VyIDxyc3ByaW5nZXJAZ29vZ2xlLmNvbT4KQ2M6IFRvZGQgUG95bm9yIDx0b2RkcG95
bm9yQGdvb2dsZS5jb20+CkNjOiBCZW4gQ2hhbiA8YmVuY2hhbkBjaHJvbWl1bS5vcmc+CkNjOiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3N0
YWdpbmcvZ2Fza2V0L2dhc2tldF9wYWdlX3RhYmxlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ2Fza2V0L2dhc2tldF9wYWdlX3RhYmxlLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ2Fza2V0L2dh
c2tldF9wYWdlX3RhYmxlLmMKaW5kZXggZjZkNzE1Nzg3ZGE4Li5kNDNmZWQ1OGJmNjUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9nYXNrZXQvZ2Fza2V0X3BhZ2VfdGFibGUuYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ2Fza2V0L2dhc2tldF9wYWdlX3RhYmxlLmMKQEAgLTQ0Nyw3ICs0NDcs
NyBAQCBzdGF0aWMgYm9vbCBnYXNrZXRfcmVsZWFzZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQog
CWlmICghcGFnZSkKIAkJcmV0dXJuIGZhbHNlOwogCi0JaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkp
CisJaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkgJiYgIWlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkp
CiAJCVNldFBhZ2VEaXJ0eShwYWdlKTsKIAlwdXRfcGFnZShwYWdlKTsKIAotLSAKMi4yMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
