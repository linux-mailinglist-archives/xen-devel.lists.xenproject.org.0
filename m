Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5DEF88F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 10:22:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRuyr-0000AU-Pg; Tue, 05 Nov 2019 09:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iRuyp-0000AN-U2
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 09:18:28 +0000
X-Inumbo-ID: 38d4f53c-ffad-11e9-a195-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38d4f53c-ffad-11e9-a195-12813bfff9fa;
 Tue, 05 Nov 2019 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572945505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsUg4V2hCRqokDEt6EDiLa/nWjJkgCxKTlTyYOik09s=;
 b=b6DH0v8GS26OpMHXc7M+R6iK1WWnEegVfyYJG/4L8sm+b14ZLK0wnTWOjm237KU+DYsZ/m
 VelgWfhEb9mNBeq1mrYyd1KsrBLpp/y4ZPWReg2b6RWcC+QMOhrwC3n17Dv+AYAWHtpIuE
 AW3FH4I9u5ySBfXd5kxzmj6CkUp7ayM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-wRX3ELHkOxy3Ag2rKnjLCA-1; Tue, 05 Nov 2019 04:18:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90226477;
 Tue,  5 Nov 2019 09:18:16 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1D465D70D;
 Tue,  5 Nov 2019 09:17:55 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
Date: Tue, 5 Nov 2019 10:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: wRX3ELHkOxy3Ag2rKnjLCA-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn()
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
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Adam Borowski <kilobyte@angband.pl>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTEuMTkgMDU6MzgsIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwg
MjAxOSBhdCA1OjExIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90
ZToKPj4KPj4gUmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19y
ZXNlcnZlZC4gV2Ugd2FudCB0bwo+PiBjaGFuZ2UgdGhhdC4KPj4KPj4gS1ZNIGhhcyB0aGlzIHdl
aXJkIHVzZSBjYXNlIHRoYXQgeW91IGNhbiBtYXAgYW55dGhpbmcgZnJvbSAvZGV2L21lbQo+PiBp
bnRvIHRoZSBndWVzdC4gcGZuX3ZhbGlkKCkgaXMgbm90IGEgcmVsaWFibGUgY2hlY2sgd2hldGhl
ciB0aGUgbWVtbWFwCj4+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNoZWQuIHBmbl90
b19vbmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPj4gdGhhdCB3ZSBoYXZlIGFuIGluaXRpYWxpemVk
IG1lbW1hcCAoYW5kIGRvbid0IGhhdmUgWk9ORV9ERVZJQ0UgbWVtb3J5KS4KPj4KPj4gUmV3cml0
ZSBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbiBwcm9kdWNl
cyB0aGUKPj4gc2FtZSByZXN1bHQgb25jZSB3ZSBzdG9wIHNldHRpbmcgWk9ORV9ERVZJQ0UgcGFn
ZXMgUEdfcmVzZXJ2ZWQuCj4+Cj4+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPgo+PiBDYzogIlJhZGltIEtyxI1tw6HFmSIgPHJrcmNtYXJAcmVkaGF0LmNvbT4KPj4gQ2M6
IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+Cj4+IENjOiBEYW4gV2lsbGlhbXMgPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4KPj4gQ2M6IEthcmltQWxsYWggQWhtZWQgPGthcmFobWVk
QGFtYXpvbi5kZT4KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJl
ZGhhdC5jb20+Cj4+IC0tLQo+PiAgIHZpcnQva3ZtL2t2bV9tYWluLmMgfCAxMCArKysrKysrKy0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5j
Cj4+IGluZGV4IGU5ZWI2NjZlYjZlOC4uOWQxOGNjNjdkMTI0IDEwMDY0NAo+PiAtLS0gYS92aXJ0
L2t2bS9rdm1fbWFpbi5jCj4+ICsrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPj4gQEAgLTE1MSw5
ICsxNTEsMTUgQEAgX193ZWFrIGludCBrdm1fYXJjaF9tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9y
YW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4+Cj4+ICAgYm9vbCBrdm1faXNfcmVzZXJ2ZWRfcGZuKGt2
bV9wZm5fdCBwZm4pCj4+ICAgewo+PiAtICAgICAgIGlmIChwZm5fdmFsaWQocGZuKSkKPj4gLSAg
ICAgICAgICAgICAgIHJldHVybiBQYWdlUmVzZXJ2ZWQocGZuX3RvX3BhZ2UocGZuKSk7Cj4+ICsg
ICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fb25saW5lX3BhZ2UocGZuKTsKPj4KPj4g
KyAgICAgICAvKgo+PiArICAgICAgICAqIFdlIHRyZWF0IGFueSBwYWdlcyB0aGF0IGFyZSBub3Qg
b25saW5lIChub3QgbWFuYWdlZCBieSB0aGUgYnVkZHkpCj4+ICsgICAgICAgICogYXMgcmVzZXJ2
ZWQgLSB0aGlzIGluY2x1ZGVzIFpPTkVfREVWSUNFIHBhZ2VzIGFuZCBwYWdlcyB3aXRob3V0Cj4+
ICsgICAgICAgICogYSBtZW1tYXAgKGUuZy4sIG1hcHBlZCB2aWEgL2Rldi9tZW0pLgo+PiArICAg
ICAgICAqLwo+PiArICAgICAgIGlmIChwYWdlKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIFBh
Z2VSZXNlcnZlZChwYWdlKTsKPj4gICAgICAgICAgcmV0dXJuIHRydWU7Cj4+ICAgfQo+IAo+IFNv
IGFmdGVyIHRoaXMgYWxsIHRoZSBwZm5fdmFsaWQoKSB1c2FnZSBpbiBrdm1fbWFpbi5jIGlzIHJl
cGxhY2VkIHdpdGgKPiBwZm5fdG9fb25saW5lX3BhZ2UoKT8gTG9va3MgY29ycmVjdCB0byBtZS4K
PiAKPiBIb3dldmVyLCBJJ20gd29ycmllZCB0aGF0IGt2bSBpcyB0YWtpbmcgcmVmZXJlbmNlIG9u
IFpPTkVfREVWSUNFIHBhZ2VzCj4gdGhyb3VnaCBzb21lIG90aGVyIHBhdGggcmVzdWx0aW5nIGlu
IHRoaXM6Cj4gCj4gICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1udmRpbW0vMjAx
OTA5MTkxNTQ3MDguR0EyNDY1MEBhbmdiYW5kLnBsLwo+IAo+IEknbGwgc2VlIGlmIHRoaXMgcGF0
Y2ggc2V0IG1vZHVsYXRlcyBvciBtYWludGFpbnMgdGhhdCBmYWlsdXJlIG1vZGUuCj4gCgpJJ2Qg
YXNzdW1lIHRoYXQgdGhlIGJlaGF2aW9yIGlzIHVuY2hhbmdlZC4gSXRoaW5rIHdlIGdldCBhIHJl
ZmVyZW5jZSB0byAKdGhlc2UgWk9ORV9ERVZJQ0UgcGFnZXMgdmlhIF9fZ2V0X3VzZXJfcGFnZXNf
ZmFzdCgpIGFuZCBmcmllbmRzIGluIApodmFfdG9fcGZuX2Zhc3QoKSBhbmQgZnJpZW5kcyBpbiB2
aXJ0L2t2bS9rdm1fbWFpbi5jCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
