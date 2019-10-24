Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD4E31FF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:14:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbyM-00057G-W9; Thu, 24 Oct 2019 12:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbyL-00056w-I9
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:12:09 +0000
X-Inumbo-ID: 804d19e5-f657-11e9-949f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 804d19e5-f657-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYC6fNIGttIcUtgmCXmgJGRK+sWEvXrn/dTQBLMCSac=;
 b=dCSeCeM60hZGHiIn1XBNI7Y27vKvoCH3cd3+5v/mmyvfFOuV4I8zBYx2iIvDgPredrCUUe
 bq9miludVrpD6w2bbMzmeHKTGwO9zBJpTpQM1qElzNpJ+yCj7ZtUPUstxSJj45VHnNWg9C
 2V5LvzoZRUqAWwRFN370VgSl6X5azf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-4jB-26J_NR2cHntMTRc7Nw-1; Thu, 24 Oct 2019 08:12:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C86801E5C;
 Thu, 24 Oct 2019 12:12:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10391196B2;
 Thu, 24 Oct 2019 12:11:34 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:33 +0200
Message-Id: <20191024120938.11237-6-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4jB-26J_NR2cHntMTRc7Nw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 05/10] powerpc/book3s: Prepare
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
TkVfREVWSUNFIG1lbW9yeSkuCgpSZXdyaXRlIGt2bXBwY19ib29rM3NfaW5zdGFudGlhdGVfcGFn
ZSgpIHNpbWlsYXIgdG8ga3ZtX2lzX3Jlc2VydmVkX3BmbigpCnRvIG1ha2Ugc3VyZSB0aGUgZnVu
Y3Rpb24gcHJvZHVjZXMgdGhlIHNhbWUgcmVzdWx0IG9uY2Ugd2Ugc3RvcCBzZXR0aW5nClpPTkVf
REVWSUNFIHBhZ2VzIFBHX3Jlc2VydmVkLgoKQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAb3ps
YWJzLm9yZz4KQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5n
Lm9yZz4KQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KU2lnbmVkLW9m
Zi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC9wb3dl
cnBjL2t2bS9ib29rM3NfNjRfbW11X3JhZGl4LmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYyBiL2FyY2gvcG93ZXJwYy9rdm0v
Ym9vazNzXzY0X21tdV9yYWRpeC5jCmluZGV4IDJkNDE1YzM2YTYxZC4uMDUzOTdjMDU2MWZjIDEw
MDY0NAotLS0gYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYworKysgYi9h
cmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYwpAQCAtODAxLDEyICs4MDEsMTQg
QEAgaW50IGt2bXBwY19ib29rM3NfaW5zdGFudGlhdGVfcGFnZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCiAJCQkJCSAgIHdyaXRpbmcsIHVwZ3JhZGVfcCk7CiAJCWlmIChpc19lcnJvcl9ub3Nsb3Rf
cGZuKHBmbikpCiAJCQlyZXR1cm4gLUVGQVVMVDsKLQkJcGFnZSA9IE5VTEw7Ci0JCWlmIChwZm5f
dmFsaWQocGZuKSkgewotCQkJcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0JCQlpZiAoUGFnZVJl
c2VydmVkKHBhZ2UpKQotCQkJCXBhZ2UgPSBOVUxMOwotCQl9CisJCS8qCisJCSAqIFdlIHRyZWF0
IGFueSBwYWdlcyB0aGF0IGFyZSBub3Qgb25saW5lIChub3QgbWFuYWdlZCBieSB0aGUKKwkJICog
YnVkZHkpIGFzIHJlc2VydmVkIC0gdGhpcyBpbmNsdWRlcyBaT05FX0RFVklDRSBwYWdlcyBhbmQK
KwkJICogcGFnZXMgd2l0aG91dCBhIG1lbW1hcCAoZS5nLiwgbWFwcGVkIHZpYSAvZGV2L21lbSku
CisJCSAqLworCQlwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7CisJCWlmIChwYWdlICYm
IFBhZ2VSZXNlcnZlZChwYWdlKSkKKwkJCXBhZ2UgPSBOVUxMOwogCX0KIAogCS8qCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
