Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC5E331E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:53:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNca7-0000s2-Ai; Thu, 24 Oct 2019 12:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNca5-0000rx-MA
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:51:09 +0000
X-Inumbo-ID: f23efb08-f65c-11e9-beca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f23efb08-f65c-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571921467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqSy8TCDLSQZcjVM8MQ9Z6hcBHgAy+Iy/TvGqZXo7OA=;
 b=f0EQQzY6UKHyu9sYu7Zh7oXZUPG67BXqrqdBMGUjtIiFKGKJX3t/IAaYbDW2BB9rPsUC2F
 jhHQE4C9l6RzyGTHJXyjyTkwlvIL3j8ZiDVRLgRgMhnIkE1Oubs9CLIVUnfrI7SPorfgi4
 QB3UD+oxmAK28q93uraNtY+rA7jz/fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-JiSCvq7dO9yuvbmKAN7FCA-1; Thu, 24 Oct 2019 08:51:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F41D80183D;
 Thu, 24 Oct 2019 12:50:59 +0000 (UTC)
Received: from [10.36.116.141] (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6B315D70E;
 Thu, 24 Oct 2019 12:50:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
Organization: Red Hat GmbH
Message-ID: <db5fbcb4-a67a-125a-3965-66066a4a68bc@redhat.com>
Date: Thu, 24 Oct 2019 14:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JiSCvq7dO9yuvbmKAN7FCA-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 00/12] mm: Don't mark hotplugged
 pages PG_reserved (including ZONE_DEVICE)
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>, Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMDk6MjYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDIyLjEwLjE5
IDIzOjU0LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4+IEhpIERhdmlkLAo+Pgo+PiBUaGFua3MgZm9y
IHRhY2tsaW5nIHRoaXMhCj4gCj4gVGhhbmtzIGZvciBoYXZpbmcgYSBsb29rIDopCj4gCj4gWy4u
Ll0KPiAKPiAKPj4+IEkgYW0gcHJvYmFibHkgYSBsaXR0bGUgYml0IHRvbyBjYXJlZnVsIChidXQg
SSBkb24ndCB3YW50IHRvIGJyZWFrIHRoaW5ncykuCj4+PiBJbiBtb3N0IHBsYWNlcyAoYmVzaWRl
cyBLVk0gYW5kIHZmaW8gdGhhdCBhcmUgbnV0cyksIHRoZQo+Pj4gcGZuX3RvX29ubGluZV9wYWdl
KCkgY2hlY2sgY291bGQgbW9zdCBwcm9iYWJseSBiZSBhdm9pZGVkIGJ5IGEKPj4+IGlzX3pvbmVf
ZGV2aWNlX3BhZ2UoKSBjaGVjay4gSG93ZXZlciwgSSB1c3VhbGx5IGdldCBzdXNwaWNpb3VzIHdo
ZW4gSSBzZWUKPj4+IGEgcGZuX3ZhbGlkKCkgY2hlY2sgKGVzcGVjaWFsbHkgYWZ0ZXIgSSBsZWFy
bmVkIHRoYXQgcGVvcGxlIG1tYXAgcGFydHMgb2YKPj4+IC9kZXYvbWVtIGludG8gdXNlciBzcGFj
ZSwgaW5jbHVkaW5nIG1lbW9yeSB3aXRob3V0IG1lbW1hcHMuIEFsc28sIHBlb3BsZQo+Pj4gY291
bGQgbWVtbWFwIG9mZmxpbmUgbWVtb3J5IGJsb2NrcyB0aGlzIHdheSA6LykuIEFzIGxvbmcgYXMg
dGhpcyBkb2VzIG5vdAo+Pj4gaHVydCBwZXJmb3JtYW5jZSwgSSB0aGluayB3ZSBzaG91bGQgcmF0
aGVyIGRvIGl0IHRoZSBjbGVhbiB3YXkuCj4+Cj4+IEknbSBjb25jZXJuZWQgYWJvdXQgdXNpbmcg
aXNfem9uZV9kZXZpY2VfcGFnZSgpIGluIHBsYWNlcyB0aGF0IGFyZSBub3QKPj4ga25vd24gdG8g
YWxyZWFkeSBoYXZlIGEgcmVmZXJlbmNlIHRvIHRoZSBwYWdlLiBIZXJlJ3MgYW4gYXVkaXQgb2YK
Pj4gY3VycmVudCB1c2FnZXMsIGFuZCB0aGUgb25lcyBJIHRoaW5rIG5lZWQgdG8gY2xlYW5lZCB1
cC4gVGhlICJ1bnNhZmUiCj4+IG9uZXMgZG8gbm90IGFwcGVhciB0byBoYXZlIGFueSBwcm90ZWN0
aW9ucyBhZ2FpbnN0IHRoZSBkZXZpY2UgcGFnZQo+PiBiZWluZyByZW1vdmVkIChnZXRfZGV2X3Bh
Z2VtYXAoKSkuIFllcywgc29tZSBvZiB0aGVzZSB3ZXJlIGFkZGVkIGJ5Cj4+IG1lLiBUaGUgInVu
c2FmZT8gSE1NIiBvbmVzIG5lZWQgSE1NIGV5ZXMgYmVjYXVzZSBITU0gbGVha3MgZGV2aWNlCj4+
IHBhZ2VzIGludG8gYW5vbnltb3VzIG1lbW9yeSBwYXRocyBhbmQgSSdtIG5vdCB1cCB0byBzcGVl
ZCBvbiBob3cgaXQKPj4gZ3VhcmFudGVlcyAnc3RydWN0IHBhZ2UnIHZhbGlkaXR5IHZzIGRldmlj
ZSBzaHV0ZG93biB3aXRob3V0IHVzaW5nCj4+IGdldF9kZXZfcGFnZW1hcCgpLgo+Pgo+PiBzbWFw
c19wbWRfZW50cnkoKTogdW5zYWZlCj4+Cj4+IHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKCk6IHNh
ZmUsIHBhZ2UgcmVmZXJlbmNlIGlzIGhlbGQKPj4KPj4gaXNfZGV2aWNlX3ByaXZhdGVfcGFnZSgp
OiBzYWZlPyBncHUgZHJpdmVyIG1hbmFnZXMgcHJpdmF0ZSBwYWdlIGxpZmV0aW1lCj4+Cj4+IGlz
X3BjaV9wMnBkbWFfcGFnZSgpOiBzYWZlLCBwYWdlIHJlZmVyZW5jZSBpcyBoZWxkCj4+Cj4+IHVu
Y2hhcmdlX3BhZ2UoKTogdW5zYWZlPyBITU0KPj4KPj4gYWRkX3RvX2tpbGwoKTogc2FmZSwgcHJv
dGVjdGVkIGJ5IGdldF9kZXZfcGFnZW1hcCgpIGFuZCBkYXhfbG9ja19wYWdlKCkKPj4KPj4gc29m
dF9vZmZsaW5lX3BhZ2UoKTogdW5zYWZlCj4+Cj4+IHJlbW92ZV9taWdyYXRpb25fcHRlKCk6IHVu
c2FmZT8gSE1NCj4+Cj4+IG1vdmVfdG9fbmV3X3BhZ2UoKTogdW5zYWZlPyBITU0KPj4KPj4gbWln
cmF0ZV92bWFfcGFnZXMoKSBhbmQgaGVscGVyczogdW5zYWZlPyBITU0KPj4KPj4gdHJ5X3RvX3Vu
bWFwX29uZSgpOiB1bnNhZmU/IEhNTQo+Pgo+PiBfX3B1dF9wYWdlKCk6IHNhZmUKPj4KPj4gcmVs
ZWFzZV9wYWdlcygpOiBzYWZlCj4+Cj4+IEknbSBob3BpbmcgYWxsIHRoZSBITU0gb25lcyBjYW4g
YmUgY29udmVydGVkIHRvCj4+IGlzX2RldmljZV9wcml2YXRlX3BhZ2UoKSBkaXJlY3RsbHkgYW5k
IGhhdmUgdGhhdCByb3V0aW5lIGdyb3cgYSBuaWNlCj4+IGNvbW1lbnQgYWJvdXQgaG93IGl0IGtu
b3dzIGl0IGNhbiBhbHdheXMgc2FmZWx5IGRlLXJlZmVyZW5jZSBpdHMgQHBhZ2UKPj4gYXJndW1l
bnQuCj4+Cj4+IEZvciB0aGUgcmVzdCBJJ2QgbGlrZSB0byBwcm9wb3NlIHRoYXQgd2UgYWRkIGEg
ZmFjaWxpdHkgdG8gZGV0ZXJtaW5lCj4+IFpPTkVfREVWSUNFIGJ5IHBmbiByYXRoZXIgdGhhbiBw
YWdlLiBUaGUgbW9zdCBzdHJhaWdodGZvcndhcmQgd2h5IEkKPj4gY2FuIHRoaW5rIG9mIHdvdWxk
IGJlIHRvIGp1c3QgYWRkIGFub3RoZXIgYml0bWFwIHRvIG1lbV9zZWN0aW9uX3VzYWdlCj4+IHRv
IGluZGljYXRlIGlmIGEgc3Vic2VjdGlvbiBpcyBaT05FX0RFVklDRSBvciBub3QuCj4gCj4gKGl0
J3MgYSBzb21ld2hhdCB1bnJlbGF0ZWQgYmlnZ2VyIGRpc2N1c3Npb24sIGJ1dCB3ZSBjYW4gc3Rh
cnQgZGlzY3Vzc2luZyBpdCBpbiB0aGlzIHRocmVhZCkKPiAKPiBJIGRpc2xpa2UgdGhpcyBmb3Ig
dGhyZWUgcmVhc29ucwo+IAo+IGEpIEl0IGRvZXMgbm90IHByb3RlY3QgYWdhaW5zdCBhbnkgcmFj
ZXMsIHJlYWxseSwgaXQgZG9lcyBub3QgaW1wcm92ZSB0aGluZ3MuCj4gYikgV2UgZG8gaGF2ZSB0
aGUgZXhhY3Qgc2FtZSBwcm9ibGVtIHdpdGggcGZuX3RvX29ubGluZV9wYWdlKCkuIEFzIGxvbmcg
YXMgd2UKPiAgICAgZG9uJ3QgaG9sZCB0aGUgbWVtb3J5IGhvdHBsdWcgbG9jaywgbWVtb3J5IGNh
biBnZXQgb2ZmbGluZWQgYW5kIHJlbW92ZSBhbnkgdGltZS4gUmFjeS4KPiBjKSBXZSBtaXggaW4g
Wk9ORSBzcGVjaWZpYyBzdHVmZiBpbnRvIHRoZSBjb3JlLiBJdCBzaG91bGQgYmUgImp1c3QgYW5v
dGhlciB6b25lIgo+IAo+IFdoYXQgSSBwcm9wb3NlIGluc3RlYWQgKGFscmVhZHkgZGlzY3Vzc2Vk
IGluIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzEwLzg3KQo+IAo+IDEuIENvbnZlcnQg
U0VDVElPTl9JU19PTkxJTkUgdG8gU0VDVElPTl9JU19BQ1RJVkUKPiAyLiBDb252ZXJ0IFNFQ1RJ
T05fSVNfQUNUSVZFIHRvIGEgc3Vic2VjdGlvbiBiaXRtYXAKPiAzLiBJbnRyb2R1Y2UgcGZuX2Fj
dGl2ZSgpIHRoYXQgY2hlY2tzIGFnYWluc3QgdGhlIHN1YnNlY3Rpb24gYml0bWFwCj4gNC4gT25j
ZSB0aGUgbWVtbWFwIHdhcyBpbml0aWFsaXplZCAvIHByZXBhcmVkLCBzZXQgdGhlIHN1YnNlY3Rp
b24gYWN0aXZlCj4gICAgIChzaW1pbGFyIHRvIFNFQ1RJT05fSVNfT05MSU5FIGluIHRoZSBidWRk
eSByaWdodCBub3cpCj4gNS4gQmVmb3JlIHRoZSBtZW1tYXAgZ2V0cyBpbnZhbGlkYXRlZCwgc2V0
IHRoZSBzdWJzZWN0aW9uIGluYWN0aXZlCj4gICAgIChzaW1pbGFyIHRvIFNFQ1RJT05fSVNfT05M
SU5FIGluIHRoZSBidWRkeSByaWdodCBub3cpCj4gNS4gcGZuX3RvX29ubGluZV9wYWdlKCkgPSBw
Zm5fYWN0aXZlKCkgJiYgem9uZSAhPSBaT05FX0RFVklDRQo+IDYuIHBmbl90b19kZXZpY2VfcGFn
ZSgpID0gcGZuX2FjdGl2ZSgpICYmIHpvbmUgPT0gWk9ORV9ERVZJQ0UKPiAKCkRhbiwgSSBhbSBz
dXNwZWN0aW5nIHRoYXQgeW91IHdhbnQgYSBwZm5fdG9fem9uZSgpIHRoYXQgd2lsbCBub3QgdG91
Y2ggCnRoZSBtZW1tYXAsIGJlY2F1c2UgaXQgY291bGQgcG90ZW50aWFsbHkgKGFsdG1hcCkgbGll
IG9uIHNsb3cgbWVtb3J5LCByaWdodD8KCkEgbW9kaWZpY2F0aW9uIG1pZ2h0IG1ha2UgdGhpcyBw
b3NzaWJsZSAoYnV0IEkgYW0gbm90IHlldCBzdXJlIGlmIHdlIAp3YW50IGEgbGVzcyBnZW5lcmlj
IE1NIGltcGxlbWVudGF0aW9uIGp1c3QgdG8gZmluZSB0dW5lIHNsb3cgbWVtbWFwIAphY2Nlc3Mg
aGVyZSkKCjEuIEtlZXAgU0VDVElPTl9JU19PTkxJTkUgYXMgaXQgaXMgd2l0aCB0aGUgc2FtZSBz
ZW1hbnRpY3MKMi4gSW50cm9kdWNlIGEgc3Vic2VjdGlvbiBiaXRtYXAgdG8gcmVjb3JkIGFjdGl2
ZSAoImluaXRpYWxpemVkIG1lbW1hcCIpCiAgICBQRk5zLiBFLmcuLCBhbHNvIHNldCBpdCB3aGVu
IHNldHRpbmcgc2VjdGlvbnMgb25saW5lLgozLiBJbnRyb2R1Y2UgcGZuX2FjdGl2ZSgpIHRoYXQg
Y2hlY2tzIGFnYWluc3QgdGhlIHN1YnNlY3Rpb24gYml0bWFwCjQuIE9uY2UgdGhlIG1lbW1hcCB3
YXMgaW5pdGlhbGl6ZWQgLyBwcmVwYXJlZCwgc2V0IHRoZSBzdWJzZWN0aW9uIGFjdGl2ZQogICAg
KHNpbWlsYXIgdG8gU0VDVElPTl9JU19PTkxJTkUgaW4gdGhlIGJ1ZGR5IHJpZ2h0IG5vdykKNS4g
QmVmb3JlIHRoZSBtZW1tYXAgZ2V0cyBpbnZhbGlkYXRlZCwgc2V0IHRoZSBzdWJzZWN0aW9uIGlu
YWN0aXZlCiAgICAoc2ltaWxhciB0byBTRUNUSU9OX0lTX09OTElORSBpbiB0aGUgYnVkZHkgcmln
aHQgbm93KQo1LiBwZm5fdG9fb25saW5lX3BhZ2UoKSA9IHBmbl9hY3RpdmUoKSAmJiBzZWN0aW9u
ID09IFNFQ1RJT05fSVNfT05MSU5FCiAgICAob3Iga2VlcCBpdCBhcyBpcywgZGVwZW5kcyBvbiB0
aGUgUkNVIGxvY2tpbmcgd2UgZXZlbnR1YWxseQogICAgIGltcGxlbWVudCkKNi4gcGZuX3RvX2Rl
dmljZV9wYWdlKCkgPSBwZm5fYWN0aXZlKCkgJiYgc2VjdGlvbiAhPSBTRUNUSU9OX0lTX09OTElO
RQo3LiB1c2UgcGZuX2FjdGl2ZSgpIHdoZW5ldmVyIHdlIGRvbid0IGNhcmUgYWJvdXQgdGhlIHpv
bmUuCgpBZ2Fpbiwgbm90IHJlYWxseSBhIGZyaWVuZCBvZiB0aGF0LCBpdCBoYXJkY29kZXMgWk9O
RV9ERVZJQ0UgdnMuIAohWk9ORV9ERVZJQ0UuIFdoZW4gd2UgZG8gYSByYW5kb20gInBmbl90b19w
YWdlKCkiIChlLmcuLCBhIHBmbiB3YWxrZXIpIAp3ZSByZWFsbHkgd2FudCB0byB0b3VjaCB0aGUg
bWVtbWFwIHJpZ2h0IGF3YXkgZWl0aGVyIHdheS4gU28gd2UgY2FuIGFsc28gCmRpcmVjdGx5IHJl
YWQgdGhlIHpvbmUgZnJvbSBpdC4gSSByZWFsbHkgZG8gcHJlZmVyIHJpZ2h0IG5vdyBhIG1vcmUg
CmdlbmVyaWMgaW1wbGVtZW50YXRpb24uCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
