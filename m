Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDCE0A77
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxmU-0006sq-N6; Tue, 22 Oct 2019 17:17:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxmT-0006sU-Hk
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:17:13 +0000
X-Inumbo-ID: c97a04c4-f4ef-11e9-8aca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c97a04c4-f4ef-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ebLBevf330CluAPhSIYPFu99JZqQugza0x0NobdnZM=;
 b=HGRjq8IsSetp88yQ8T0UtO6Lj3sFT/29qZ8Ig4+kx//sOZREbTUr0TleeU3R6P9PQfMtxK
 l7QZrTdddg0h5GtZC6BYQNexHOnaOMHm7Rdt2gUj31GU/DRSpkRP4hXD+JDPXxLqK2ODLv
 xx6iVxPGfOIA1ieabNF2xOuVgpPO7Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-lsyVhhPJN4WnEPnfH0Ri8A-1; Tue, 22 Oct 2019 13:17:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 603B61800D6A;
 Tue, 22 Oct 2019 17:17:05 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A8AA5DC18;
 Tue, 22 Oct 2019 17:16:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:38 +0200
Message-Id: <20191022171239.21487-12-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: lsyVhhPJN4WnEPnfH0Ri8A-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 11/12] x86/mm: Prepare
 __ioremap_check_ram() for PG_reserved changes
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
RGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4KQ2M6IEFuZHkgTHV0b21p
cnNraSA8bHV0b0BrZXJuZWwub3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRl
YWQub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44
LmRlPgpDYzogIkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4KU2lnbmVkLW9mZi1ieTog
RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogYXJjaC94ODYvbW0vaW9y
ZW1hcC5jIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vaW9yZW1hcC5jIGIv
YXJjaC94ODYvbW0vaW9yZW1hcC5jCmluZGV4IGEzOWRjZGI1YWUzNC4uZGI2OTEzYjQ4ZWRmIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC94ODYvbW0vaW9yZW1h
cC5jCkBAIC03NywxMCArNzcsMTcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2lvcmVtYXBfY2hl
Y2tfcmFtKHN0cnVjdCByZXNvdXJjZSAqcmVzKQogCXN0YXJ0X3BmbiA9IChyZXMtPnN0YXJ0ICsg
UEFHRV9TSVpFIC0gMSkgPj4gUEFHRV9TSElGVDsKIAlzdG9wX3BmbiA9IChyZXMtPmVuZCArIDEp
ID4+IFBBR0VfU0hJRlQ7CiAJaWYgKHN0b3BfcGZuID4gc3RhcnRfcGZuKSB7Ci0JCWZvciAoaSA9
IDA7IGkgPCAoc3RvcF9wZm4gLSBzdGFydF9wZm4pOyArK2kpCi0JCQlpZiAocGZuX3ZhbGlkKHN0
YXJ0X3BmbiArIGkpICYmCi0JCQkgICAgIVBhZ2VSZXNlcnZlZChwZm5fdG9fcGFnZShzdGFydF9w
Zm4gKyBpKSkpCisJCWZvciAoaSA9IDA7IGkgPCAoc3RvcF9wZm4gLSBzdGFydF9wZm4pOyArK2kp
IHsKKwkJCXN0cnVjdCBwYWdlICpwYWdlOworCQkJIC8qCisJCQkgICogV2UgdHJlYXQgYW55IHBh
Z2VzIHRoYXQgYXJlIG5vdCBvbmxpbmUgKG5vdCBtYW5hZ2VkCisJCQkgICogYnkgdGhlIGJ1ZGR5
KSBhcyBub3QgYmVpbmcgUkFNLiBUaGlzIGluY2x1ZGVzCisJCQkgICogWk9ORV9ERVZJQ0UgcGFn
ZXMuCisJCQkgICovCisJCQlwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHN0YXJ0X3BmbiArIGkp
OworCQkJaWYgKHBhZ2UgJiYgIVBhZ2VSZXNlcnZlZChwYWdlKSkKIAkJCQlyZXR1cm4gSU9SRVNf
TUFQX1NZU1RFTV9SQU07CisJCX0KIAl9CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
