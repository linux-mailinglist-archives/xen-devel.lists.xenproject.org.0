Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA0E2B9A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 09:59:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNXyb-0007Hc-8K; Thu, 24 Oct 2019 07:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNXyY-0007H5-R4
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 07:56:07 +0000
X-Inumbo-ID: b62cd8e8-f633-11e9-beca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b62cd8e8-f633-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571903756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2HcAVL2s+NZnk3LL+Y5gUG2TcYxdjN3fXPWT3YMgHw=;
 b=ZmXABiZzP2Awt1hXrQ+dJnuI/N5NVijdpgps+ZSE34PmPZItfaUKGznZdEo4zun32a9KXz
 oPWvuJ8qufzbURQJiXIbwqz3b7kaVUy9gZgq5fvC7YmX8w8Mxi5M2M+dKDAV7u4MurjHFD
 OQ75TLfC1YsI0c3QdWjeFhNuYEXOHDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-0PKzETIIO6qSN3X27vvlnQ-1; Thu, 24 Oct 2019 03:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2063100551D;
 Thu, 24 Oct 2019 07:55:48 +0000 (UTC)
Received: from [10.36.117.225] (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA6E60852;
 Thu, 24 Oct 2019 07:55:26 +0000 (UTC)
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-2-david@redhat.com>
 <4aa3c72b-8991-9e43-80d7-a906ae79160b@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <93858175-0677-e5d6-6ecd-4035d71543b0@redhat.com>
Date: Thu, 24 Oct 2019 09:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4aa3c72b-8991-9e43-80d7-a906ae79160b@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0PKzETIIO6qSN3X27vvlnQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 01/12] mm/memory_hotplug: Don't allow
 to online/offline memory blocks with holes
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

T24gMjQuMTAuMTkgMDU6NTMsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IAo+IE9uIDEwLzIy
LzIwMTkgMTA6NDIgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBPdXIgb25saW5pbmcv
b2ZmbGluaW5nIGNvZGUgaXMgdW5uZWNlc3NhcmlseSBjb21wbGljYXRlZC4gT25seSBtZW1vcnkK
Pj4gYmxvY2tzIGFkZGVkIGR1cmluZyBib290IGNhbiBoYXZlIGhvbGVzLiBIb3RwbHVnZ2VkIG1l
bW9yeSBuZXZlciBoYXMKPj4gaG9sZXMuIFRoYXQgbWVtb3J5IGlzIGFscmVhZHkgb25saW5lLgo+
IAo+IFdoeSBob3QgcGx1Z2dlZCBtZW1vcnkgYXQgcnVudGltZSBjYW5ub3QgaGF2ZSBob2xlcyAo
ZS5nIGEgc2VtaSBiYWQgRElNTSkuCgpJbXBvcnRhbnQ6IEhXUG9pc29uICE9IG1lbW9yeSBob2xl
CgpBIG1lbW9yeSBob2xlIGlzIG1lbW9yeSB0aGF0IGlzIG5vdCAiSU9SRVNPVVJDRV9TWVNSQU0i
LiBUaGVzZSBwYWdlcyBhcmUgCmN1cnJlbnRseSBtYXJrZWQgUEdfcmVzZXJ2ZWQuIFN1Y2ggaG9s
ZXMgYXJlIHNvbWV0aW1lcyB1c2VkIGZvciBtYXBwaW5nIApzb21ldGhpbmcgaW50byBrZXJuZWwg
c3BhY2UuIFNvbWUgYXJjaHMgdXNlIHRoZSBQR19yZXNlcnZlZCB0byBkZXRlY3QgCnRoZSBtZW1v
cnkgaG9sZSAoIm5vdCByYW0iKSBhbmQgaWdub3JlIHRoZSBtZW1tYXAuCgpQb2lzb25lZCBwYWdl
cyBhcmUgbWFya2VkIFBHX2h3cG9pc29uLgoKPiBDdXJyZW50bHksIGRvIHdlIGp1c3QgYWJvcnQg
YWRkaW5nIHRoYXQgbWVtb3J5IGJsb2NrIGlmIHRoZXJlIGFyZSBob2xlcyA/CgpUaGVyZSBpcyBu
byBpbnRlcmZhY2UgdG8gZG8gdGhhdC4KCkUuZy4sIGhhdmUgYSBsb29rIGF0IGFkZF9tZW1vcnko
KSBhZGRfbWVtb3J5X3Jlc291cmNlKCkuIFlvdSBjYW4gb25seSAKcGFzcyBvbmUgbWVtb3J5IHJl
c291cmNlICh0aGF0IGlzIGFsbCBJT1JFU09VUkNFX1NZU1JBTSB8IElPUkVTT1VSQ0VfQlVTWSkK
CkhvdHBsdWdnaW5nIG1lbW9yeSB3aXRoIGhvbGVzIGlzIG5vdCBzdXBwb3J0ZWQgKG5vciBjYW4g
SSBpbWFnaW5lIGEgdXNlIApjYXNlIGZvciB0aGF0KS4KCj4+Cj4+IFdoZW4gd2Ugc3RvcCBhbGxv
d2luZyB0byBvZmZsaW5lIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcywgd2UgaW1wbGljaXRseQo+
PiBzdG9wIHRvIG9ubGluZSBtZW1vcnkgYmxvY2tzIHdpdGggaG9sZXMuCj4gCj4gUmVkdWNpbmcg
aG90cGx1ZyBzdXBwb3J0IGZvciBtZW1vcnkgYmxvY2tzIHdpdGggaG9sZXMganVzdCB0byBzaW1w
bGlmeQo+IHRoZSBjb2RlLiBJcyBpdCB3b3J0aCA/CgpNZSBhbmQgTWljaGFsIGFyZSBub3QgYXdh
cmUgb2YgYSB1c2Vycywgbm90IGV2ZW4gYXdhcmUgb2YgYSB1c2UgY2FzZS4gCktlZXBpbmcgY29k
ZSBhcm91bmQgdGhhdCBub2JvZHkgcmVhbGx5IG5lZWRzIHRoYXQgbGltaXRzIGNsZWFudXBzLCBu
byAKdGhhbmtzLiBTaW1pbGFyIHRvIHVzIG5vdCBzdXBwb3J0aW5nIHRvIG9mZmxpbmUgbWVtb3J5
IGJsb2NrcyB0aGF0IHNwYW4gCm11bHRpcGxlIG5vZGVzL3pvbmVzLgoKRS5nLiwgaGF2ZSBhIGxv
b2sgYXQgdGhlIGlzb2xhdGlvbiBjb2RlLiBJdCBpcyBmdWxsIG9mIGNvZGUgdGhhdCBqdW1wcyAK
b3ZlciBtZW1vcnkgaG9sZXMgKHN0YXJ0X2lzb2xhdGVfcGFnZV9yYW5nZSgpIC0+IF9fZmlyc3Rf
dmFsaWRfcGFnZSgpKS4gClRoYXQgbWFkZSBzZW5zZSBmb3Igb3VyIGNvbXBsaWNhdGVkIG1lbW9y
eSBvZmZsaW5pbmcgY29kZSwgYnV0IGl0IGlzIAphY3R1YWxseSBoYXJtZnVsIHdoZW4gZGVhbGlu
ZyB3aXRoIGFsbG9jX2NvbnRpZ19yYW5nZSgpLiBBbGxvY2F0aW9uIApuZXZlciB3YW50cyB0byBq
dW1wIG92ZXIgbWVtb3J5IGhvbGVzLiBBZnRlciB0aGlzIHBhdGNoLCB3ZSBjYW4ganVzdCAKZmFp
bCBoYXJkIG9uIGFueSBtZW1vcnkgaG9sZSB3ZSBkZXRlY3QsIGluc3RlYWQgb2YgaWdub3Jpbmcg
aXQgKG9yIApzcGVjaWFsLWNhc2luZyBpdCkuCgo+IAo+Pgo+PiBUaGlzIGFsbG93cyB0byBzaW1w
bGlmeSB0aGUgY29kZS4gRm9yIGV4YW1wbGUsIHdlIG5vIGxvbmdlciBoYXZlIHRvCj4+IHdvcnJ5
IGFib3V0IG1hcmtpbmcgcGFnZXMgdGhhdCBmYWxsIGludG8gbWVtb3J5IGhvbGVzIFBHX3Jlc2Vy
dmVkIHdoZW4KPj4gb25saW5pbmcgbWVtb3J5LiBXZSBjYW4gc3RvcCBzZXR0aW5nIHBhZ2VzIFBH
X3Jlc2VydmVkLgo+IAo+IENvdWxkIG5vdCB0aGVyZSBiZSBhbnkgb3RoZXIgd2F5IG9mIHRyYWNr
aW5nIHRoZXNlIGhvbGVzIGlmIG5vdCB0aGUgcGFnZQo+IHJlc2VydmVkIGJpdC4gSW4gdGhlIG1l
bW9yeSBzZWN0aW9uIGl0c2VsZiBhbmQgY29ycmVzcG9uZGluZyBzdHJ1Y3QgcGFnZXMKPiBqdXN0
IHJlbWFpbmVkIHBvaXNvbmVkID8gSnVzdCB3b25kZXJpbmcsIG1pZ2h0IGJlIGFsbCB3cm9uZyBo
ZXJlLgoKT2YgY291cnNlIHRoZXJlIGNvdWxkIGJlIHdheXMgKGUuZy4sIHVzaW5nIFBHX29mZmxp
bmUgZXZlbnR1YWxseSksIGJ1dCAKaXQgYm9pbHMgZG93biB0byB1cyBoYXZpbmcgdG8gZGVhbCB3
aXRoIGl0IGluIG9ubGluaW5nL29mZmxpbmluZyBjb2RlLiAKQW5kIHRoYXQgaXMgc29tZSBoYW5k
bGluZyBub2JvZHkgcmVhbGx5IHNlZW1zIHRvIG5lZWQuCgo+IAo+Pgo+PiBPZmZsaW5pbmcgbWVt
b3J5IGJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBpcyB1c3VhbGx5IG5vdCBndXJhbnRlZWQgdG8g
d29yawo+PiBlaXRoZXIgd2F5LiBTbyBzdG9wcGluZyB0byBkbyB0aGF0IChpZiBhbnlib2R5IHJl
YWxseSB1c2VkIGFuZCB0ZXN0ZWQKPiAKPiBUaGF0IGd1YXJhbnRlZSBkb2VzIG5vdCBleGlzdCBy
aWdodCBub3cgYmVjYXVzZSBob3cgYm9vdCBtZW1vcnkgY291bGQgaGF2ZQo+IGJlZW4gdXNlZCBh
ZnRlciBib290IG5vdCBmcm9tIGEgbGltaXRhdGlvbiBvZiB0aGUgbWVtb3J5IGhvdCByZW1vdmUg
aXRzZWxmLgoKWWVwLiBIb3dldmVyLCBNaWNoYWwgYW5kIEkgYXJlIG5vdCBldmVuIGF3YXJlIG9m
IGEgc2V0dXAgdGhhdCB3b3VsZCBtYWRlIAp0aGlzIHdvcmsgYW5kIGd1YXJhbnRlZSB0aGF0IHRo
ZSBleGlzdGluZyBjb2RlIGFjdHVhbGx5IHN0aWxsIGlzIGFibGUgdG8gCmRlYWwgd2l0aCBob2xl
cy4gQXJlIHlvdT8KCj4gCj4+IHRoaXMgb3ZlciB0aGUgeWVhcnMpIHNob3VsZCBub3QgcmVhbGx5
IGh1cnQuIEZvciB0aGUgdXNlIGNhc2Ugb2YKPj4gb2ZmbGluaW5nIG1lbW9yeSB0byB1bnBsdWcg
RElNTXMsIHdlIHNob3VsZCBzZWUgbm8gY2hhbmdlLiAoaG9sZXMgb24KPj4gRElNTXMgd291bGQg
YmUgd2VpcmQpCj4gCj4gSG9sZXMgb24gRElNTSBjb3VsZCBiZSBkdWUgdG8gSFcgZXJyb3JzIGFm
ZmVjdGluZyBvbmx5IHBhcnRzIG9mIGl0LiBCeSBub3QKCkFnYWluLCBIVyBlcnJvcnMgIT0gaG9s
ZXMuIFdlIGhhdmUgUEdfaHdwb2lzb24gZm9yIHRoYXQuCgo+IGFsbG93aW5nIHN1Y2ggRElNTSdz
IGhvdCBhZGQgYW5kIHJlbW92ZSwgd2UgYXJlIGRlZmluaXRlbHkgcmVkdWNpbmcgdGhlCj4gc2Nv
cGUgb2Ygb3ZlcmFsbCBob3RwbHVnIGZ1bmN0aW9uYWxpdHkuIElzIGNvZGUgc2ltcGxpZmljYXRp
b24gaW4gaXRzZWxmCj4gaXMgd29ydGggdGhpcyByZWR1Y3Rpb24gaW4gZnVuY3Rpb25hbGl0eSA/
CgpXaGF0IHlvdSBkZXNjcmliZSBpcyBub3QgYWZmZWN0ZWQuCgpUaGFua3MhCgotLSAKClRoYW5r
cywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
