Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF67FE3204
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbxx-00052A-Kr; Thu, 24 Oct 2019 12:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbxw-00051w-Dy
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:11:44 +0000
X-Inumbo-ID: 70c7654c-f657-11e9-8aca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 70c7654c-f657-11e9-8aca-bc764e2007e4;
 Thu, 24 Oct 2019 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoVG2BEnXVzgoLr0OSeQwtEbC1Paof07RzXqtGqnOKU=;
 b=C9bcJUN4TJC71eUimMATv1xQrZz6cWwCXXIvQpMlGU/vPa77sGUqcTgkqbBkJ7J4Zdxu8e
 XFIgW3Zw8PrDVJE5HCY4liyH0GqB3YE4oYtredlJx1JmXXLkEuBL6H21j5Yus/TWuWceCx
 L7Z9p6s3LQqk8G725n5tJVpSp+Gn0aQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-f-AfDHaGNvuEBDYN5p3zWQ-1; Thu, 24 Oct 2019 08:11:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5179801E5C;
 Thu, 24 Oct 2019 12:11:34 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D51552D5;
 Thu, 24 Oct 2019 12:11:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:32 +0200
Message-Id: <20191024120938.11237-5-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: f-AfDHaGNvuEBDYN5p3zWQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 04/10] vfio/type1: Prepare
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
TkVfREVWSUNFIG1lbW9yeSkuCgpSZXdyaXRlIGlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKCkgc2lt
aWxhciB0byBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZQpzdXJlIHRoZSBmdW5jdGlvbiBw
cm9kdWNlcyB0aGUgc2FtZSByZXN1bHQgb25jZSB3ZSBzdG9wIHNldHRpbmcgWk9ORV9ERVZJQ0UK
cGFnZXMgUEdfcmVzZXJ2ZWQuCgpDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbT4KQ2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zm
aW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwpp
bmRleCAyYWRhOGU2Y2RiODguLmY4Y2U4YzQwOGJhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy92Zmlv
L3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5j
CkBAIC0yOTksOSArMjk5LDE1IEBAIHN0YXRpYyBpbnQgdmZpb19sb2NrX2FjY3Qoc3RydWN0IHZm
aW9fZG1hICpkbWEsIGxvbmcgbnBhZ2UsIGJvb2wgYXN5bmMpCiAgKi8KIHN0YXRpYyBib29sIGlz
X2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHVuc2lnbmVkIGxvbmcgcGZuKQogewotCWlmIChwZm5fdmFs
aWQocGZuKSkKLQkJcmV0dXJuIFBhZ2VSZXNlcnZlZChwZm5fdG9fcGFnZShwZm4pKTsKKwlzdHJ1
Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwogCisJLyoKKwkgKiBXZSB0
cmVhdCBhbnkgcGFnZXMgdGhhdCBhcmUgbm90IG9ubGluZSAobm90IG1hbmFnZWQgYnkgdGhlIGJ1
ZGR5KQorCSAqIGFzIHJlc2VydmVkIC0gdGhpcyBpbmNsdWRlcyBaT05FX0RFVklDRSBwYWdlcyBh
bmQgcGFnZXMgd2l0aG91dAorCSAqIGEgbWVtbWFwIChlLmcuLCBtYXBwZWQgdmlhIC9kZXYvbWVt
KS4KKwkgKi8KKwlpZiAocGFnZSkKKwkJcmV0dXJuIFBhZ2VSZXNlcnZlZChwYWdlKTsKIAlyZXR1
cm4gdHJ1ZTsKIH0KIAotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
