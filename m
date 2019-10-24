Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990BE3213
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:16:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbzz-0005Rr-4P; Thu, 24 Oct 2019 12:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbzx-0005Re-OO
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:13:49 +0000
X-Inumbo-ID: bc00dd7c-f657-11e9-beca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bc00dd7c-f657-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63dkq1rIK4xjp2ay2ZA3DSxT4H+7TMBFb0GQYgs1fjs=;
 b=XFYiDn3P02tZ5xgoY4Gy52zBgW2X2jvYqWjQoxGuddoDndG4j7Yy87s1AK5fckj4g8c7T8
 bIrF/NiWadvbFrTBsGxEUIW4G7BRMpzDr6gWp9NiYIYaHtTHTXkmvc3QUKyvqWWj40p+nF
 6RuEDnpvUXL4cooyj66rvoGt9jIpIrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-cIgA3mrGO0GO4AgvS2Fldw-1; Thu, 24 Oct 2019 08:13:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC001800D6B;
 Thu, 24 Oct 2019 12:13:39 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEC7D1C93D;
 Thu, 24 Oct 2019 12:13:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:36 +0200
Message-Id: <20191024120938.11237-9-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: cIgA3mrGO0GO4AgvS2Fldw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 08/10] x86/mm: Prepare __ioremap_check_ram()
 for PG_reserved changes
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KClJld3JpdGUgX19pb3JlbWFwX2NoZWNrX3JhbSgpIHRv
IG1ha2Ugc3VyZSB0aGUgZnVuY3Rpb24gcHJvZHVjZXMgdGhlCnNhbWUgcmVzdWx0IG9uY2Ugd2Ug
c3RvcCBzZXR0aW5nIFpPTkVfREVWSUNFIHBhZ2VzIFBHX3Jlc2VydmVkLgoKQ2M6IERhdmUgSGFu
c2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+CkNjOiBBbmR5IEx1dG9taXJza2kgPGx1
dG9Aa2VybmVsLm9yZz4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4K
Q2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIg
PG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KQ2M6
ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhp
bGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgotLS0KIGFyY2gveDg2L21tL2lvcmVtYXAuYyB8
IDEzICsrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL2lvcmVtYXAuYyBiL2FyY2gveDg2
L21tL2lvcmVtYXAuYwppbmRleCBhMzlkY2RiNWFlMzQuLmRiNjkxM2I0OGVkZiAxMDA2NDQKLS0t
IGEvYXJjaC94ODYvbW0vaW9yZW1hcC5jCisrKyBiL2FyY2gveDg2L21tL2lvcmVtYXAuYwpAQCAt
NzcsMTAgKzc3LDE3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19pb3JlbWFwX2NoZWNrX3JhbShz
dHJ1Y3QgcmVzb3VyY2UgKnJlcykKIAlzdGFydF9wZm4gPSAocmVzLT5zdGFydCArIFBBR0VfU0la
RSAtIDEpID4+IFBBR0VfU0hJRlQ7CiAJc3RvcF9wZm4gPSAocmVzLT5lbmQgKyAxKSA+PiBQQUdF
X1NISUZUOwogCWlmIChzdG9wX3BmbiA+IHN0YXJ0X3BmbikgewotCQlmb3IgKGkgPSAwOyBpIDwg
KHN0b3BfcGZuIC0gc3RhcnRfcGZuKTsgKytpKQotCQkJaWYgKHBmbl92YWxpZChzdGFydF9wZm4g
KyBpKSAmJgotCQkJICAgICFQYWdlUmVzZXJ2ZWQocGZuX3RvX3BhZ2Uoc3RhcnRfcGZuICsgaSkp
KQorCQlmb3IgKGkgPSAwOyBpIDwgKHN0b3BfcGZuIC0gc3RhcnRfcGZuKTsgKytpKSB7CisJCQlz
dHJ1Y3QgcGFnZSAqcGFnZTsKKwkJCSAvKgorCQkJICAqIFdlIHRyZWF0IGFueSBwYWdlcyB0aGF0
IGFyZSBub3Qgb25saW5lIChub3QgbWFuYWdlZAorCQkJICAqIGJ5IHRoZSBidWRkeSkgYXMgbm90
IGJlaW5nIFJBTS4gVGhpcyBpbmNsdWRlcworCQkJICAqIFpPTkVfREVWSUNFIHBhZ2VzLgorCQkJ
ICAqLworCQkJcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShzdGFydF9wZm4gKyBpKTsKKwkJCWlm
IChwYWdlICYmICFQYWdlUmVzZXJ2ZWQocGFnZSkpCiAJCQkJcmV0dXJuIElPUkVTX01BUF9TWVNU
RU1fUkFNOworCQl9CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
