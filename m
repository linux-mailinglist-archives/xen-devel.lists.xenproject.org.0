Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D0E0A65
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxj5-00061f-0h; Tue, 22 Oct 2019 17:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxj3-00061U-04
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:13:41 +0000
X-Inumbo-ID: 4a92d35d-f4ef-11e9-946f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4a92d35d-f4ef-11e9-946f-12813bfff9fa;
 Tue, 22 Oct 2019 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZH06pjD8CJbFdhi6tvHbczu1qJrML9IKvQHQzytrv0=;
 b=HjwTHavssJir/f35aIosF2GH9mBMREjy/yTEf/2cBJgw3Y/CJvc2mVC4q2udJV7TUDP+aD
 SEiVBUQOI9SFhqcpzzZm+gSBxu0Q3t3/FeWm20V5+CJ4/qjz6FOvJJDLb/STPXKPoqDK2Z
 BPmhDQ/SbjKrZq1zmNNMzrRT2TAvWsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-GNMLLVycPz2hWyHgrsFHmQ-1; Tue, 22 Oct 2019 13:13:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03CD81800D6A;
 Tue, 22 Oct 2019 17:13:31 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C74C05DA8D;
 Tue, 22 Oct 2019 17:13:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:28 +0200
Message-Id: <20191022171239.21487-2-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: GNMLLVycPz2hWyHgrsFHmQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 01/12] mm/memory_hotplug: Don't allow to
 online/offline memory blocks with holes
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

T3VyIG9ubGluaW5nL29mZmxpbmluZyBjb2RlIGlzIHVubmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQu
IE9ubHkgbWVtb3J5CmJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBjYW4gaGF2ZSBob2xlcy4gSG90
cGx1Z2dlZCBtZW1vcnkgbmV2ZXIgaGFzCmhvbGVzLiBUaGF0IG1lbW9yeSBpcyBhbHJlYWR5IG9u
bGluZS4KCldoZW4gd2Ugc3RvcCBhbGxvd2luZyB0byBvZmZsaW5lIG1lbW9yeSBibG9ja3Mgd2l0
aCBob2xlcywgd2UgaW1wbGljaXRseQpzdG9wIHRvIG9ubGluZSBtZW1vcnkgYmxvY2tzIHdpdGgg
aG9sZXMuCgpUaGlzIGFsbG93cyB0byBzaW1wbGlmeSB0aGUgY29kZS4gRm9yIGV4YW1wbGUsIHdl
IG5vIGxvbmdlciBoYXZlIHRvCndvcnJ5IGFib3V0IG1hcmtpbmcgcGFnZXMgdGhhdCBmYWxsIGlu
dG8gbWVtb3J5IGhvbGVzIFBHX3Jlc2VydmVkIHdoZW4Kb25saW5pbmcgbWVtb3J5LiBXZSBjYW4g
c3RvcCBzZXR0aW5nIHBhZ2VzIFBHX3Jlc2VydmVkLgoKT2ZmbGluaW5nIG1lbW9yeSBibG9ja3Mg
YWRkZWQgZHVyaW5nIGJvb3QgaXMgdXN1YWxseSBub3QgZ3VyYW50ZWVkIHRvIHdvcmsKZWl0aGVy
IHdheS4gU28gc3RvcHBpbmcgdG8gZG8gdGhhdCAoaWYgYW55Ym9keSByZWFsbHkgdXNlZCBhbmQg
dGVzdGVkCnRoaXMgb3ZlciB0aGUgeWVhcnMpIHNob3VsZCBub3QgcmVhbGx5IGh1cnQuIEZvciB0
aGUgdXNlIGNhc2Ugb2YKb2ZmbGluaW5nIG1lbW9yeSB0byB1bnBsdWcgRElNTXMsIHdlIHNob3Vs
ZCBzZWUgbm8gY2hhbmdlLiAoaG9sZXMgb24KRElNTXMgd291bGQgYmUgd2VpcmQpCgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8
bWhvY2tvQHN1c2UuY29tPgpDYzogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPgpD
YzogUGF2ZWwgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+CkNjOiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogbW0vbWVtb3J5X2hvdHBsdWcuYyB8IDI2
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1vcnlfaG90cGx1Zy5jIGIv
bW0vbWVtb3J5X2hvdHBsdWcuYwppbmRleCA1NjEzNzFlYWQzOWEuLjcyMTBmNDM3NTI3OSAxMDA2
NDQKLS0tIGEvbW0vbWVtb3J5X2hvdHBsdWcuYworKysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCkBA
IC0xNDQ3LDEwICsxNDQ3LDE5IEBAIHN0YXRpYyB2b2lkIG5vZGVfc3RhdGVzX2NsZWFyX25vZGUo
aW50IG5vZGUsIHN0cnVjdCBtZW1vcnlfbm90aWZ5ICphcmcpCiAJCW5vZGVfY2xlYXJfc3RhdGUo
bm9kZSwgTl9NRU1PUlkpOwogfQogCitzdGF0aWMgaW50IGNvdW50X3N5c3RlbV9yYW1fcGFnZXNf
Y2IodW5zaWduZWQgbG9uZyBzdGFydF9wZm4sCisJCQkJICAgICB1bnNpZ25lZCBsb25nIG5yX3Bh
Z2VzLCB2b2lkICpkYXRhKQoreworCXVuc2lnbmVkIGxvbmcgKm5yX3N5c3RlbV9yYW1fcGFnZXMg
PSBkYXRhOworCisJKm5yX3N5c3RlbV9yYW1fcGFnZXMgKz0gbnJfcGFnZXM7CisJcmV0dXJuIDA7
Cit9CisKIHN0YXRpYyBpbnQgX19yZWYgX19vZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3Rh
cnRfcGZuLAogCQkgIHVuc2lnbmVkIGxvbmcgZW5kX3BmbikKIHsKLQl1bnNpZ25lZCBsb25nIHBm
biwgbnJfcGFnZXM7CisJdW5zaWduZWQgbG9uZyBwZm4sIG5yX3BhZ2VzID0gMDsKIAl1bnNpZ25l
ZCBsb25nIG9mZmxpbmVkX3BhZ2VzID0gMDsKIAlpbnQgcmV0LCBub2RlLCBucl9pc29sYXRlX3Bh
Z2VibG9jazsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwpAQCAtMTQ2MSw2ICsxNDcwLDIwIEBAIHN0
YXRpYyBpbnQgX19yZWYgX19vZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAog
CiAJbWVtX2hvdHBsdWdfYmVnaW4oKTsKIAorCS8qCisJICogV2UgZG9uJ3QgYWxsb3cgdG8gb2Zm
bGluZSBtZW1vcnkgYmxvY2tzIHRoYXQgY29udGFpbiBob2xlcworCSAqIGFuZCBjb25zZWN1ZW50
bHkgZG9uJ3QgYWxsb3cgdG8gb25saW5lIG1lbW9yeSBibG9ja3MgdGhhdCBjb250YWluCisJICog
aG9sZXMuIFRoaXMgYWxsb3dzIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIHF1aXRlIGEgbG90IGFuZCB3
ZSBkb24ndAorCSAqIGhhdmUgdG8gbWVzcyB3aXRoIFBHX3Jlc2VydmVkIHBhZ2VzIGZvciBtZW1v
cnkgaG9sZXMuCisJICovCisJd2Fsa19zeXN0ZW1fcmFtX3JhbmdlKHN0YXJ0X3BmbiwgZW5kX3Bm
biAtIHN0YXJ0X3BmbiwgJm5yX3BhZ2VzLAorCQkJICAgICAgY291bnRfc3lzdGVtX3JhbV9wYWdl
c19jYik7CisJaWYgKG5yX3BhZ2VzICE9IGVuZF9wZm4gLSBzdGFydF9wZm4pIHsKKwkJcmV0ID0g
LUVJTlZBTDsKKwkJcmVhc29uID0gIm1lbW9yeSBob2xlcyI7CisJCWdvdG8gZmFpbGVkX3JlbW92
YWw7CisJfQorCiAJLyogVGhpcyBtYWtlcyBob3RwbHVnIG11Y2ggZWFzaWVyLi4uYW5kIHJlYWRh
YmxlLgogCSAgIHdlIGFzc3VtZSB0aGlzIGZvciBub3cuIC4qLwogCWlmICghdGVzdF9wYWdlc19p
bl9hX3pvbmUoc3RhcnRfcGZuLCBlbmRfcGZuLCAmdmFsaWRfc3RhcnQsCkBAIC0xNDcyLDcgKzE0
OTUsNiBAQCBzdGF0aWMgaW50IF9fcmVmIF9fb2ZmbGluZV9wYWdlcyh1bnNpZ25lZCBsb25nIHN0
YXJ0X3BmbiwKIAogCXpvbmUgPSBwYWdlX3pvbmUocGZuX3RvX3BhZ2UodmFsaWRfc3RhcnQpKTsK
IAlub2RlID0gem9uZV90b19uaWQoem9uZSk7Ci0JbnJfcGFnZXMgPSBlbmRfcGZuIC0gc3RhcnRf
cGZuOwogCiAJLyogc2V0IGFib3ZlIHJhbmdlIGFzIGlzb2xhdGVkICovCiAJcmV0ID0gc3RhcnRf
aXNvbGF0ZV9wYWdlX3JhbmdlKHN0YXJ0X3BmbiwgZW5kX3BmbiwKLS0gCjIuMjEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
