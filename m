Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74CE3217
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNc0a-0005gc-Eu; Thu, 24 Oct 2019 12:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNc0Z-0005gH-EM
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:14:27 +0000
X-Inumbo-ID: d0f2c718-f657-11e9-949f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d0f2c718-f657-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YxG8LTmp2DdNmR96mx6EPMKm57sikpokfCgsqoqhbU=;
 b=Rfmec48jCcWV7+GY49SOXEBc6DNBXOvXSnbZwRzbqkwCsodsJafWLlRB/k6eGKCDuCcrkg
 VQCBo+I9ACRnOSaAyGY5byukiM6W7n5TEe1cU7IpGAFNfRqqd0D3vnvDhsUCJkEwu5iryB
 VdZXS8Q6d8x/UqEnLm6B2ra7Uy1OZK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-37WSCG0IOc2aalj4O1vt1g-1; Thu, 24 Oct 2019 08:14:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D798B800D49;
 Thu, 24 Oct 2019 12:14:16 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F37C196B2;
 Thu, 24 Oct 2019 12:13:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:38 +0200
Message-Id: <20191024120938.11237-11-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 37WSCG0IOc2aalj4O1vt1g-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 10/10] mm/usercopy.c: Update comment in
 check_page_span() regarding ZONE_DEVICE
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

Wk9ORV9ERVZJQ0UgKGEuay5hLiBkZXZpY2UgbWVtb3J5KSBpcyBubyBsb25nZXIgbWFya2VkIFBH
X3Jlc2VydmVkLiBVcGRhdGUKdGhlIGNvbW1lbnQuCgpXaGlsZSBhdCBpdCwgbWFrZSBpdCBtYXRj
aCB3aGF0IHRoZSBjb2RlIGlzIGFjdXRhbGx5IGRvaW5nIChyZWplY3QgdnMuCmFjY2VwdCkuCgpD
YzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogIklzYWFjIEouIE1hbmphcnJlcyIgPGlzYWFj
bUBjb2RlYXVyb3JhLm9yZz4KQ2M6ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KQ2M6IFRob21hcyBHbGVpeG5l
ciA8dGdseEBsaW51dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBtbS91c2VyY29weS5jIHwgNiArKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0v
dXNlcmNvcHkuYyBiL21tL3VzZXJjb3B5LmMKaW5kZXggNjYwNzE3YTFlYTVjLi44MGYyNTQwMjRj
OTcgMTAwNjQ0Ci0tLSBhL21tL3VzZXJjb3B5LmMKKysrIGIvbW0vdXNlcmNvcHkuYwpAQCAtMTk5
LDkgKzE5OSw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjaGVja19wYWdlX3NwYW4oY29uc3Qgdm9p
ZCAqcHRyLCB1bnNpZ25lZCBsb25nIG4sCiAJCXJldHVybjsKIAogCS8qCi0JICogUmVqZWN0IGlm
IHJhbmdlIGlzIGVudGlyZWx5IGVpdGhlciBSZXNlcnZlZCAoaS5lLiBzcGVjaWFsIG9yCi0JICog
ZGV2aWNlIG1lbW9yeSksIG9yIENNQS4gT3RoZXJ3aXNlLCByZWplY3Qgc2luY2UgdGhlIG9iamVj
dCBzcGFucwotCSAqIHNldmVyYWwgaW5kZXBlbmRlbnRseSBhbGxvY2F0ZWQgcGFnZXMuCisJICog
QWNjZXB0IGlmIHRoZSByYW5nZSBpcyBlbnRpcmVseSBlaXRoZXIgUmVzZXJ2ZWQgKCJzcGVjaWFs
Iikgb3IKKwkgKiBDTUEuIE90aGVyd2lzZSwgcmVqZWN0IHNpbmNlIHRoZSBvYmplY3Qgc3BhbnMg
c2V2ZXJhbCBpbmRlcGVuZGVudGx5CisJICogYWxsb2NhdGVkIHBhZ2VzLgogCSAqLwogCWlzX3Jl
c2VydmVkID0gUGFnZVJlc2VydmVkKHBhZ2UpOwogCWlzX2NtYSA9IGlzX21pZ3JhdGVfY21hX3Bh
Z2UocGFnZSk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
