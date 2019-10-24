Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82830E31F4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:13:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbwp-0004n4-JA; Thu, 24 Oct 2019 12:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbwo-0004mx-F7
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:10:34 +0000
X-Inumbo-ID: 47189400-f657-11e9-a531-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 47189400-f657-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ci8rTmGAQWvcufbTawC9IhJzwFepcNIlGotHVYhTC24=;
 b=ZsNhtg6+dHzPcwSVwjXIgwuRpJm6zYtwBax/d+6eoWSCur2yTWxbtJPLhhHmNn8DDxOdG/
 FCV9fGARW7QmrSToNDPYny63UzkQ58We2FTFTsqO8pkYNPZaLTHaQ14kBMl/z67w471myj
 TbflBaG/0ZYtQfEUDZQeeIqqCd8W/nM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-OyS-w0OOPfCXkYu6xkkqOg-1; Thu, 24 Oct 2019 08:10:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17898800D49;
 Thu, 24 Oct 2019 12:10:23 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9159B52D1;
 Thu, 24 Oct 2019 12:10:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:29 +0200
Message-Id: <20191024120938.11237-2-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OyS-w0OOPfCXkYu6xkkqOg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 01/10] mm/memory_hotplug: Don't allow to
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

T3VyIG9ubGluaW5nL29mZmxpbmluZyBjb2RlIGlzIHVubmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQu
IE9ubHkgbWVtb3J5CmJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBjYW4gaGF2ZSBob2xlcyAoYSBy
YW5nZSB0aGF0IGlzIG5vdApJT1JFU09VUkNFX1NZU1RFTV9SQU0pLiBIb3RwbHVnZ2VkIG1lbW9y
eSBuZXZlciBoYXMgaG9sZXMgKGUuZy4sIHNlZQphZGRfbWVtb3J5X3Jlc291cmNlKCkpLiBBbGwg
Ym9vdCBtZW1vcnkgaXMgYWxyZWFkIG9ubGluZS4KClRoZXJlZm9yZSwgd2hlbiB3ZSBzdG9wIGFs
bG93aW5nIHRvIG9mZmxpbmUgbWVtb3J5IGJsb2NrcyB3aXRoIGhvbGVzLCB3ZQppbXBsaWNpdGx5
IG5vIGxvbmdlciBoYXZlIHRvIGRlYWwgd2l0aCBvbmxpbmluZyBtZW1vcnkgYmxvY2tzIHdpdGgg
aG9sZXMuCgpUaGlzIGFsbG93cyB0byBzaW1wbGlmeSB0aGUgY29kZS4gRm9yIGV4YW1wbGUsIHdl
IG5vIGxvbmdlciBoYXZlIHRvCndvcnJ5IGFib3V0IG1hcmtpbmcgcGFnZXMgdGhhdCBmYWxsIGlu
dG8gbWVtb3J5IGhvbGVzIFBHX3Jlc2VydmVkIHdoZW4Kb25saW5pbmcgbWVtb3J5LiBXZSBjYW4g
c3RvcCBzZXR0aW5nIHBhZ2VzIFBHX3Jlc2VydmVkLgoKT2ZmbGluaW5nIG1lbW9yeSBibG9ja3Mg
YWRkZWQgZHVyaW5nIGJvb3QgaXMgdXN1YWxseSBub3QgZ3VyYW50ZWVkIHRvIHdvcmsKZWl0aGVy
IHdheSAodW5tb3ZhYmxlIGRhdGEgbWlnaHQgaGF2ZSBlYXNpbHkgZW5kZWQgdXAgb24gdGhhdCBt
ZW1vcnkgZHVyaW5nCmJvb3QpLiBTbyBzdG9wcGluZyB0byBkbyB0aGF0IHNob3VsZCBub3QgcmVh
bGx5IGh1cnQgKCsgcGVvcGxlIGFyZSBub3QKZXZlbiBhd2FyZSBvZiBhIHNldHVwIHdoZXJlIHRo
YXQgdXNlZCB0byB3b3JrIGFuZCB0aGF0IHRoZSBleGlzdGluZyBjb2RlCnN0aWxsIHdvcmtzIGNv
cnJlY3RseSB3aXRoIG1lbW9yeSBob2xlcykuIEZvciB0aGUgdXNlIGNhc2Ugb2Ygb2ZmbGluaW5n
Cm1lbW9yeSB0byB1bnBsdWcgRElNTXMsIHdlIHNob3VsZCBzZWUgbm8gY2hhbmdlLiAoaG9sZXMg
b24gRElNTXMgd291bGQgYmUKd2VpcmQpLgoKUGxlYXNlIG5vdGUgdGhhdCBoYXJkd2FyZSBlcnJv
cnMgKFBHX2h3cG9pc29uKSBhcmUgbm90IG1lbW9yeSBob2xlcyBhbmQKbm90IGFmZmVjdGVkIGJ5
IHRoaXMgY2hhbmdlIHdoZW4gb2ZmbGluaW5nLgoKQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6
IE9zY2FyIFNhbHZhZG9yIDxvc2FsdmFkb3JAc3VzZS5kZT4KQ2M6IFBhdmVsIFRhdGFzaGluIDxw
YXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+CkNjOiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJt
LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+
Ci0tLQogbW0vbWVtb3J5X2hvdHBsdWcuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9tbS9tZW1vcnlfaG90cGx1Zy5jIGIvbW0vbWVtb3J5X2hvdHBsdWcuYwppbmRleCA1
NjEzNzFlYWQzOWEuLjhkODE3MzBjZjAzNiAxMDA2NDQKLS0tIGEvbW0vbWVtb3J5X2hvdHBsdWcu
YworKysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCkBAIC0xNDQ3LDEwICsxNDQ3LDE5IEBAIHN0YXRp
YyB2b2lkIG5vZGVfc3RhdGVzX2NsZWFyX25vZGUoaW50IG5vZGUsIHN0cnVjdCBtZW1vcnlfbm90
aWZ5ICphcmcpCiAJCW5vZGVfY2xlYXJfc3RhdGUobm9kZSwgTl9NRU1PUlkpOwogfQogCitzdGF0
aWMgaW50IGNvdW50X3N5c3RlbV9yYW1fcGFnZXNfY2IodW5zaWduZWQgbG9uZyBzdGFydF9wZm4s
CisJCQkJICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCB2b2lkICpkYXRhKQoreworCXVuc2ln
bmVkIGxvbmcgKm5yX3N5c3RlbV9yYW1fcGFnZXMgPSBkYXRhOworCisJKm5yX3N5c3RlbV9yYW1f
cGFnZXMgKz0gbnJfcGFnZXM7CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgX19yZWYgX19v
ZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAogCQkgIHVuc2lnbmVkIGxvbmcg
ZW5kX3BmbikKIHsKLQl1bnNpZ25lZCBsb25nIHBmbiwgbnJfcGFnZXM7CisJdW5zaWduZWQgbG9u
ZyBwZm4sIG5yX3BhZ2VzID0gMDsKIAl1bnNpZ25lZCBsb25nIG9mZmxpbmVkX3BhZ2VzID0gMDsK
IAlpbnQgcmV0LCBub2RlLCBucl9pc29sYXRlX3BhZ2VibG9jazsKIAl1bnNpZ25lZCBsb25nIGZs
YWdzOwpAQCAtMTQ2MSw2ICsxNDcwLDIwIEBAIHN0YXRpYyBpbnQgX19yZWYgX19vZmZsaW5lX3Bh
Z2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAogCiAJbWVtX2hvdHBsdWdfYmVnaW4oKTsKIAor
CS8qCisJICogRG9uJ3QgYWxsb3cgdG8gb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoYXQgY29udGFp
biBob2xlcy4KKwkgKiBDb25zZWN1ZW50bHksIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcyBjYW4g
bmV2ZXIgZ2V0IG9ubGluZWQKKwkgKiAoaG90cGx1Z2dlZCBtZW1vcnkgaGFzIG5vIGhvbGVzIGFu
ZCBhbGwgYm9vdCBtZW1vcnkgaXMgb25saW5lKS4KKwkgKiBUaGlzIGFsbG93cyB0byBzaW1wbGlm
eSB0aGUgb25saW5pbmcvb2ZmbGluaW5nIGNvZGUgcXVpdGUgYSBsb3QuCisJICovCisJd2Fsa19z
eXN0ZW1fcmFtX3JhbmdlKHN0YXJ0X3BmbiwgZW5kX3BmbiAtIHN0YXJ0X3BmbiwgJm5yX3BhZ2Vz
LAorCQkJICAgICAgY291bnRfc3lzdGVtX3JhbV9wYWdlc19jYik7CisJaWYgKG5yX3BhZ2VzICE9
IGVuZF9wZm4gLSBzdGFydF9wZm4pIHsKKwkJcmV0ID0gLUVJTlZBTDsKKwkJcmVhc29uID0gIm1l
bW9yeSBob2xlcyI7CisJCWdvdG8gZmFpbGVkX3JlbW92YWw7CisJfQorCiAJLyogVGhpcyBtYWtl
cyBob3RwbHVnIG11Y2ggZWFzaWVyLi4uYW5kIHJlYWRhYmxlLgogCSAgIHdlIGFzc3VtZSB0aGlz
IGZvciBub3cuIC4qLwogCWlmICghdGVzdF9wYWdlc19pbl9hX3pvbmUoc3RhcnRfcGZuLCBlbmRf
cGZuLCAmdmFsaWRfc3RhcnQsCkBAIC0xNDcyLDcgKzE0OTUsNiBAQCBzdGF0aWMgaW50IF9fcmVm
IF9fb2ZmbGluZV9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKIAogCXpvbmUgPSBwYWdl
X3pvbmUocGZuX3RvX3BhZ2UodmFsaWRfc3RhcnQpKTsKIAlub2RlID0gem9uZV90b19uaWQoem9u
ZSk7Ci0JbnJfcGFnZXMgPSBlbmRfcGZuIC0gc3RhcnRfcGZuOwogCiAJLyogc2V0IGFib3ZlIHJh
bmdlIGFzIGlzb2xhdGVkICovCiAJcmV0ID0gc3RhcnRfaXNvbGF0ZV9wYWdlX3JhbmdlKHN0YXJ0
X3BmbiwgZW5kX3BmbiwKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
