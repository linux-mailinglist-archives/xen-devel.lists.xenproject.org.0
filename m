Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67662E0A63
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxjP-00064y-AH; Tue, 22 Oct 2019 17:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxjN-00064m-NT
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:14:01 +0000
X-Inumbo-ID: 5694f5b8-f4ef-11e9-beca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5694f5b8-f4ef-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGQAc5VmCetr7C7c8aFEmIaobGzhiGLNzJdeTackaIM=;
 b=GM7WBWGanO2YELPYe2+w7yq9uXndEn8XdD7qiZeWiAo5kkslxy195tG2UJQ1o3Az3JubV9
 JLETtGblJpHcJ+FrpUGMnXBpHkB7qdAhBI843Wc1MNw6Mwi30AcFSeJMnCldH+DWvrPeBG
 eLTBsP/F2A5wXejD/Sz/vE491h+bMac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-qLpykW4SPYy_CRKVfRekMA-1; Tue, 22 Oct 2019 13:13:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 356831800D6A;
 Tue, 22 Oct 2019 17:13:53 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54CE05ED21;
 Tue, 22 Oct 2019 17:13:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:29 +0200
Message-Id: <20191022171239.21487-3-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: qLpykW4SPYy_CRKVfRekMA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 02/12] mm/usercopy.c: Prepare
 check_page_span() for PG_reserved changes
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
V2Ugd2FudCB0bwpjaGFuZ2UgdGhhdC4KCkxldCdzIG1ha2Ugc3VyZSB0aGF0IHRoZSBsb2dpYyBp
biB0aGUgZnVuY3Rpb24gd29uJ3QgY2hhbmdlLiBPbmNlIHdlIG5vCmxvbmdlciBzZXQgdGhlc2Ug
cGFnZXMgdG8gcmVzZXJ2ZWQsIHdlIGNhbiByZXdvcmsgdGhpcyBmdW5jdGlvbiB0bwpwZXJmb3Jt
IHNlcGFyYXRlIGNoZWNrcyBmb3IgWk9ORV9ERVZJQ0UgKHNwbGl0IGZyb20gUEdfcmVzZXJ2ZWQg
Y2hlY2tzKS4KCkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBLYXRlIFN0ZXdhcnQgPGtz
dGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNvbkBs
b2h1dG9rLm5ldD4KQ2M6ICJJc2FhYyBKLiBNYW5qYXJyZXMiIDxpc2FhY21AY29kZWF1cm9yYS5v
cmc+CkNjOiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4KLS0tCiBtbS91c2VyY29weS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS91c2VyY29weS5j
IGIvbW0vdXNlcmNvcHkuYwppbmRleCA2NjA3MTdhMWVhNWMuLmEzYWM0YmUzNWNkZSAxMDA2NDQK
LS0tIGEvbW0vdXNlcmNvcHkuYworKysgYi9tbS91c2VyY29weS5jCkBAIC0yMDMsMTQgKzIwMywx
NSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2hlY2tfcGFnZV9zcGFuKGNvbnN0IHZvaWQgKnB0ciwg
dW5zaWduZWQgbG9uZyBuLAogCSAqIGRldmljZSBtZW1vcnkpLCBvciBDTUEuIE90aGVyd2lzZSwg
cmVqZWN0IHNpbmNlIHRoZSBvYmplY3Qgc3BhbnMKIAkgKiBzZXZlcmFsIGluZGVwZW5kZW50bHkg
YWxsb2NhdGVkIHBhZ2VzLgogCSAqLwotCWlzX3Jlc2VydmVkID0gUGFnZVJlc2VydmVkKHBhZ2Up
OworCWlzX3Jlc2VydmVkID0gUGFnZVJlc2VydmVkKHBhZ2UpIHx8IGlzX3pvbmVfZGV2aWNlX3Bh
Z2UocGFnZSk7CiAJaXNfY21hID0gaXNfbWlncmF0ZV9jbWFfcGFnZShwYWdlKTsKIAlpZiAoIWlz
X3Jlc2VydmVkICYmICFpc19jbWEpCiAJCXVzZXJjb3B5X2Fib3J0KCJzcGFucyBtdWx0aXBsZSBw
YWdlcyIsIE5VTEwsIHRvX3VzZXIsIDAsIG4pOwogCiAJZm9yIChwdHIgKz0gUEFHRV9TSVpFOyBw
dHIgPD0gZW5kOyBwdHIgKz0gUEFHRV9TSVpFKSB7CiAJCXBhZ2UgPSB2aXJ0X3RvX2hlYWRfcGFn
ZShwdHIpOwotCQlpZiAoaXNfcmVzZXJ2ZWQgJiYgIVBhZ2VSZXNlcnZlZChwYWdlKSkKKwkJaWYg
KGlzX3Jlc2VydmVkICYmICEoUGFnZVJlc2VydmVkKHBhZ2UpIHx8CisJCQkJICAgICBpc196b25l
X2RldmljZV9wYWdlKHBhZ2UpKSkKIAkJCXVzZXJjb3B5X2Fib3J0KCJzcGFucyBSZXNlcnZlZCBh
bmQgbm9uLVJlc2VydmVkIHBhZ2VzIiwKIAkJCQkgICAgICAgTlVMTCwgdG9fdXNlciwgMCwgbik7
CiAJCWlmIChpc19jbWEgJiYgIWlzX21pZ3JhdGVfY21hX3BhZ2UocGFnZSkpCi0tIAoyLjIxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
