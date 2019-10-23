Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142FE13FE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 10:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNBqY-0008Jp-J1; Wed, 23 Oct 2019 08:18:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNBqX-0008Ja-3J
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:18:21 +0000
X-Inumbo-ID: aab67cbb-f56d-11e9-9476-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aab67cbb-f56d-11e9-9476-12813bfff9fa;
 Wed, 23 Oct 2019 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571818697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hL0fM/kxnOlP0E/afPU3/KpnFlOZXpcmHWviuaI95cw=;
 b=acIt97G9BK7HG6zpo1xcMHP+kigxNY2jgQu8Me5CyqwBe/RRdza1uNdnXL/LJrnQ4F7SK5
 PPwqJVoAx0dvX6/E1CMqbvv+EFdXQqxhkXLpE0ahydRL6oYFE3vp8hkpaGwwirWr5q2ohX
 0wEe3DBAGSge+kV5DxSj9UVzi8kr0Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-rRYwBwEuMACK3CdbHnbBiQ-1; Wed, 23 Oct 2019 04:18:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BEA5107AD31;
 Wed, 23 Oct 2019 08:18:08 +0000 (UTC)
Received: from [10.36.117.79] (ovpn-117-79.ams2.redhat.com [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3BF19C70;
 Wed, 23 Oct 2019 08:17:45 +0000 (UTC)
To: linux-kernel@vger.kernel.org
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-7-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <bd00455c-d030-94f4-f0ae-a160818a75de@redhat.com>
Date: Wed, 23 Oct 2019 10:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022171239.21487-7-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rRYwBwEuMACK3CdbHnbBiQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 06/12] staging/gasket: Prepare
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
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
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
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTAuMTkgMTk6MTIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IFJpZ2h0IG5vdywg
Wk9ORV9ERVZJQ0UgbWVtb3J5IGlzIGFsd2F5cyBzZXQgUEdfcmVzZXJ2ZWQuIFdlIHdhbnQgdG8K
PiBjaGFuZ2UgdGhhdC4KPiAKPiBUaGUgcGFnZXMgYXJlIG9idGFpbmVkIHZpYSBnZXRfdXNlcl9w
YWdlc19mYXN0KCkuIEkgYXNzdW1lLCB0aGVzZQo+IGNvdWxkIGJlIFpPTkVfREVWSUNFIHBhZ2Vz
LiBMZXQncyBqdXN0IGV4Y2x1ZGUgdGhlbSBhcyB3ZWxsIGV4cGxpY2l0bHkuCj4gCj4gQ2M6IFJv
YiBTcHJpbmdlciA8cnNwcmluZ2VyQGdvb2dsZS5jb20+Cj4gQ2M6IFRvZGQgUG95bm9yIDx0b2Rk
cG95bm9yQGdvb2dsZS5jb20+Cj4gQ2M6IEJlbiBDaGFuIDxiZW5jaGFuQGNocm9taXVtLm9yZz4K
PiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvc3RhZ2luZy9nYXNrZXQvZ2Fza2V0X3BhZ2VfdGFibGUuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ2Fza2V0L2dhc2tldF9wYWdlX3RhYmxlLmMgYi9kcml2
ZXJzL3N0YWdpbmcvZ2Fza2V0L2dhc2tldF9wYWdlX3RhYmxlLmMKPiBpbmRleCBmNmQ3MTU3ODdk
YTguLmQ0M2ZlZDU4YmY2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ2Fza2V0L2dh
c2tldF9wYWdlX3RhYmxlLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ2Fza2V0L2dhc2tldF9w
YWdlX3RhYmxlLmMKPiBAQCAtNDQ3LDcgKzQ0Nyw3IEBAIHN0YXRpYyBib29sIGdhc2tldF9yZWxl
YXNlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICAJaWYgKCFwYWdlKQo+ICAgCQlyZXR1cm4g
ZmFsc2U7Cj4gICAKPiAtCWlmICghUGFnZVJlc2VydmVkKHBhZ2UpKQo+ICsJaWYgKCFQYWdlUmVz
ZXJ2ZWQocGFnZSkgJiYgIWlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkpCj4gICAJCVNldFBhZ2VE
aXJ0eShwYWdlKTsKPiAgIAlwdXRfcGFnZShwYWdlKTsKPiAgIAo+IAoKCkBEYW4sIGlzIFNldFBh
Z2VEaXJ0eSgpIG9uIFpPTkVfREVWSUNFIHBhZ2VzIGJhZCBvciBkbyB3ZSBzaW1wbHkgbm90IApj
YXJlPyBJIHRoaW5rIHRoYXQgZW5kaW5nIHVwIHdpdGggWk9ORV9ERVZJQ0UgcGFnZXMgaGVyZSBp
cyB2ZXJ5IAp1bmxpa2VseS4gSSdkIGxpa2UgdG8gZHJvcCB0aGlzIChhbmQgdGhlIG5leHQpIHBh
dGNoIGFuZCBkb2N1bWVudCB3aHkgaXQgCmlzIG9rYXkgdG8gZG8gc28uCgotLSAKClRoYW5rcywK
CkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
