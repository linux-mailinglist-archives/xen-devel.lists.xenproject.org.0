Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25923E2541
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 23:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNO77-0008WQ-TM; Wed, 23 Oct 2019 21:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mf0J=YQ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNO75-0008WL-QX
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 21:24:16 +0000
X-Inumbo-ID: 7535e3c8-f5db-11e9-beca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7535e3c8-f5db-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571865852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vzd2ocPNksWw3U66mjSSBhc4b11MB7MzKL2ivISGmQA=;
 b=DEmlnIzAHW9EAqnNoK61a3Z22ueWDW6BaZpPVDV909i0gAKxEnySYnDJ+mEU4VefhBwMP+
 7plqVPZ5b1cWwBT7ylMT56njHyGf3YrEt8MeE1w8ARxlws7IaKkCr1OJPcx8ICej6UP2Fy
 gfan6NxmffwMAsRvc3LxWh4aDoeWzzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-C2Ek62ONPfGRjsaXZc-0RA-1; Wed, 23 Oct 2019 17:24:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3312B1800D6B;
 Wed, 23 Oct 2019 21:22:45 +0000 (UTC)
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF05A600CC;
 Wed, 23 Oct 2019 21:22:24 +0000 (UTC)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
 <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
 <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
 <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a1f53724-2a7b-048d-0790-a17c8b79c65a@redhat.com>
Date: Wed, 23 Oct 2019 23:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: C2Ek62ONPfGRjsaXZc-0RA-1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMjE6MzksIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBXZWQsIE9jdCAyMywg
MjAxOSBhdCAxMDoyOCBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+Pj4gSSBkaXNsaWtlIHRoaXMgZm9yIHRocmVlIHJlYXNvbnMKPj4+Pgo+Pj4+IGEp
IEl0IGRvZXMgbm90IHByb3RlY3QgYWdhaW5zdCBhbnkgcmFjZXMsIHJlYWxseSwgaXQgZG9lcyBu
b3QgaW1wcm92ZSB0aGluZ3MuCj4+Pj4gYikgV2UgZG8gaGF2ZSB0aGUgZXhhY3Qgc2FtZSBwcm9i
bGVtIHdpdGggcGZuX3RvX29ubGluZV9wYWdlKCkuIEFzIGxvbmcgYXMgd2UKPj4+PiAgICBkb24n
dCBob2xkIHRoZSBtZW1vcnkgaG90cGx1ZyBsb2NrLCBtZW1vcnkgY2FuIGdldCBvZmZsaW5lZCBh
bmQgcmVtb3ZlIGFueSB0aW1lLiBSYWN5Lgo+Pj4KPj4+IFRydWUsIHdlIG5lZWQgdG8gc29sdmUg
dGhhdCBwcm9ibGVtIHRvby4gVGhhdCBzZWVtcyB0byB3YW50IHNvbWV0aGluZwo+Pj4gbGlnaHRl
ciB3ZWlnaHQgdGhhbiB0aGUgaG90cGx1ZyBsb2NrIHRoYXQgY2FuIGJlIGhlbGQgb3ZlciBwZm4g
bG9va3Vwcwo+Pj4gKyAgdXNlIHJhdGhlciB0aGFuIHJlcXVpcmluZyBhIHBhZ2UgbG9va3VwIGlu
IHBhdGhzIHdoZXJlIGl0J3Mgbm90Cj4+PiBjbGVhciB0aGF0IGEgcGFnZSByZWZlcmVuY2Ugd291
bGQgcHJldmVudCB1bnBsdWcuCj4+Pgo+Pj4+IGMpIFdlIG1peCBpbiBaT05FIHNwZWNpZmljIHN0
dWZmIGludG8gdGhlIGNvcmUuIEl0IHNob3VsZCBiZSAianVzdCBhbm90aGVyIHpvbmUiCj4+Pgo+
Pj4gTm90IHN1cmUgSSBncm9rIHRoaXMgd2hlbiB0aGUgUkZDIGlzIHNwcmlua2xpbmcgem9uZS1z
cGVjaWZpYwo+Pj4gaXNfem9uZV9kZXZpY2VfcGFnZSgpIHRocm91Z2hvdXQgdGhlIGNvcmU/Cj4+
Cj4+IE1vc3QgdXNlcnMgc2hvdWxkIG5vdCBjYXJlIGFib3V0IHRoZSB6b25lLiBwZm5fYWN0aXZl
KCkgd291bGQgYmUgZW5vdWdoCj4+IGluIG1vc3Qgc2l0dWF0aW9ucywgZXNwZWNpYWxseSBtb3N0
IFBGTiB3YWxrZXJzIC0gInRoaXMgbWVtbWFwIGlzIHZhbGlkCj4+IGFuZCBlLmcuLCBjb250YWlu
cyBhIHZhbGlkIHpvbmUgLi4uIi4KPiAKPiBPaCwgSSBzZWUsIHlvdSdyZSBzYXlpbmcgY29udmVy
dCBtb3N0IHVzZXJzIHRvIHBmbl9hY3RpdmUoKSAoYW5kIHNvbWUKPiBUQkQgcmN1IGxvY2tpbmcp
LCBidXQgb25seSBwZm5fdG9fb25saW5lX3BhZ2UoKSB1c2VycyB3b3VsZCBuZWVkIHRoZQo+IHpv
bmUgbG9va3VwPyBJIGNhbiBnZXQgb24gYm9hcmQgd2l0aCB0aGF0LgoKSSBndWVzcyBteSBhbnN3
ZXIgdG8gdGhhdCBpcyBzaW1wbGU6IElmIHdlIG9ubHkgY2FyZSBhYm91dCAiaXMgdGhpcwptZW1t
YXAgc2FmZSB0byB0b3VjaCIsIHVzZSBwZm5fYWN0aXZlKCkKCih3ZWxsLCB3aXRoIHBmbl92YWxp
ZF93aXRoaW4oKSBzaW1pbGFyIGFzIGRvbmUgaW4gcGZuX3RvX29ubGluZV9wYWdlKCkKZHVlIHRv
IG1lbW9yeSBob2xlcywgYnV0IHRoZXNlIGFyZSBkZXRhaWxzIC0gZS5nLiwgcGZuX2FjdGl2ZSgp
IGNhbgpjaGVjayBhZ2FpbnN0IHBmbl92YWxpZF93aXRoaW4oKSByaWdodCBhd2F5IGludGVybmFs
bHkpLiAoK2xvY2tpbmcgVEJECnRvIG1ha2Ugc3VyZSBpdCByZW1haW5zIGFjdGl2ZSkKCkhvd2V2
ZXIsIGlmIHdlIHdhbnQgdG8gc3BlY2lhbCBjYXNlIGluIGFkZGl0aW9uIG9uIHpvbmVzICghWk9O
RV9ERVZJQ0UKKGEuay5hLiwgb25saW5lZCB2aWEgbWVtb3J5IGJsb2NrcywgbWFuYWdlZCBieSB0
aGUgYnVkZHkpLCBaT05FX0RFVklDRSwKd2hhdGV2ZXIgbWlnaHQgY29tZSBpbiB0aGUgZnV0dXJl
LCAuLi4pLCBhbHNvIGFjY2VzcyB0aGUgem9uZSBzdG9yZWQgaW4KdGhlIG1lbW1hcC4gRS5nLiwg
YnkgdXNpbmcgcGZuX3RvX29ubGluZV9wYWdlKCkuCgo+IAo+Pgo+Pj4KPj4+Pgo+Pj4+IFdoYXQg
SSBwcm9wb3NlIGluc3RlYWQgKGFscmVhZHkgZGlzY3Vzc2VkIGluIGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE5LzEwLzEwLzg3KQo+Pj4KPj4+IFNvcnJ5IEkgbWlzc2VkIHRoaXMgZWFybGllci4u
Lgo+Pj4KPj4+Pgo+Pj4+IDEuIENvbnZlcnQgU0VDVElPTl9JU19PTkxJTkUgdG8gU0VDVElPTl9J
U19BQ1RJVkUKPj4+PiAyLiBDb252ZXJ0IFNFQ1RJT05fSVNfQUNUSVZFIHRvIGEgc3Vic2VjdGlv
biBiaXRtYXAKPj4+PiAzLiBJbnRyb2R1Y2UgcGZuX2FjdGl2ZSgpIHRoYXQgY2hlY2tzIGFnYWlu
c3QgdGhlIHN1YnNlY3Rpb24gYml0bWFwCj4+Pj4gNC4gT25jZSB0aGUgbWVtbWFwIHdhcyBpbml0
aWFsaXplZCAvIHByZXBhcmVkLCBzZXQgdGhlIHN1YnNlY3Rpb24gYWN0aXZlCj4+Pj4gICAgKHNp
bWlsYXIgdG8gU0VDVElPTl9JU19PTkxJTkUgaW4gdGhlIGJ1ZGR5IHJpZ2h0IG5vdykKPj4+PiA1
LiBCZWZvcmUgdGhlIG1lbW1hcCBnZXRzIGludmFsaWRhdGVkLCBzZXQgdGhlIHN1YnNlY3Rpb24g
aW5hY3RpdmUKPj4+PiAgICAoc2ltaWxhciB0byBTRUNUSU9OX0lTX09OTElORSBpbiB0aGUgYnVk
ZHkgcmlnaHQgbm93KQo+Pj4+IDUuIHBmbl90b19vbmxpbmVfcGFnZSgpID0gcGZuX2FjdGl2ZSgp
ICYmIHpvbmUgIT0gWk9ORV9ERVZJQ0UKPj4+PiA2LiBwZm5fdG9fZGV2aWNlX3BhZ2UoKSA9IHBm
bl9hY3RpdmUoKSAmJiB6b25lID09IFpPTkVfREVWSUNFCj4+Pgo+Pj4gVGhpcyBkb2VzIG5vdCBz
ZWVtIHRvIHJlZHVjZSBhbnkgY29tcGxleGl0eSBiZWNhdXNlIGl0IHN0aWxsIHJlcXVpcmVzCj4+
PiBhIHBmbiB0byB6b25lIGxvb2t1cCBhdCB0aGUgZW5kIG9mIHRoZSBwcm9jZXNzLgo+Pj4KPj4+
IEkuZS4gY29udmVydGluZyBwZm5fdG9fb25saW5lX3BhZ2UoKSB0byB1c2UgYSBuZXcgcGZuX2Fj
dGl2ZSgpCj4+PiBzdWJzZWN0aW9uIG1hcCBwbHVzIGxvb2tpbmcgdXAgdGhlIHpvbmUgZnJvbSBw
Zm5fdG9fcGFnZSgpIGlzIG1vcmUKPj4+IHN0ZXBzIHRoYW4ganVzdCBkb2luZyBhIGRpcmVjdCBw
Zm4gdG8gem9uZSBsb29rdXAuIFdoYXQgYW0gSSBtaXNzaW5nPwo+Pgo+PiBUaGF0IGEgcmVhbCAi
cGZuIHRvIHpvbmUiIGxvb2t1cCB3aXRob3V0IGdvaW5nIHZpYSB0aGUgc3RydWN0IHBhZ2Ugd2ls
bAo+PiByZXF1aXJlIHRvIGhhdmUgbW9yZSB0aGFuIGp1c3QgYSBzaW5nbGUgYml0bWFwLiBJTUhP
LCBrZWVwaW5nIHRoZQo+PiBpbmZvcm1hdGlvbiBhdCBhIHNpbmdsZSBwbGFjZSAobWVtbWFwKSBp
cyB0aGUgY2xlYW4gdGhpbmcgdG8gZG8gKG5vdAo+PiByZXBsaWNhdGluZyBpdCBzb21ld2hlcmUg
ZWxzZSkuIEdvaW5nIHZpYSB0aGUgbWVtbWFwIG1pZ2h0IG5vdCBiZSBhcwo+PiBmYXN0IGFzIGEg
ZGlyZWN0IGxvb2t1cCwgYnV0IGRvIHdlIGFjdHVhbGx5IGNhcmU/IFdlIGFyZSBhbHJlYWR5IGxv
b2tpbmcKPj4gYXQgInJhbmRvbSBQRk5zIHdlIGFyZSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhIHZh
bGlkIG1lbW1hcCIuCj4gCj4gVHJ1ZSwgd2Ugb25seSBjYXJlIGFib3V0IHRoZSB2YWxpZGl0eSBv
ZiB0aGUgY2hlY2ssIGFuZCBhcyB5b3UgcG9pbnRlZAo+IG91dCBtb3ZpbmcgdGhlIGNoZWNrIHRv
IHRoZSBwZm4gbGV2ZWwgZG9lcyBub3Qgc29sdmUgdGhlIHZhbGlkaXR5Cj4gcmFjZS4gSXQgbmVl
ZHMgYSBsb2NrLgoKTGV0J3MgY2FsbCBwZm5fYWN0aXZlKCkgImEgcGZuIHRoYXQgaXMgYWN0aXZl
IGluIHRoZSBzeXN0ZW0gYW5kIGhhcyBhbgppbml0aWFsaXplZCBtZW1tYXAsIHdoaWNoIGNvbnRh
aW5zIHNhbmUgdmFsdWVzIiAodmFsaWQgbWVtbWFwIHNvdW5kcwpsaWtlIHBmbl92YWxpZCgpLCB3
aGljaCBpcyBhY3R1YWxseSAidGhlcmUgaXMgYSBtZW1tYXAgd2hpY2ggbWlnaHQKY29udGFpbiBn
YXJiYWdlIikuIFllcyB3ZSBuZWVkIHNvbWUgc29ydCBvZiBsaWdodHdlaWdodCBsb2NraW5nIGFz
CmRpc2N1c3NlZC4KClsuLi5dCgo+Pj4+IEhvd2V2ZXIsIEkgdGhpbmsgd2UgYWxzbyBoYXZlIHRv
IGNsYXJpZnkgaWYgd2UgbmVlZCB0aGUgY2hhbmdlIGluIDMgYXQgYWxsLgo+Pj4+IEl0IGNvbWVz
IGZyb20KPj4+Pgo+Pj4+IGNvbW1pdCBmNTUwOWNjMThkYWE3ZjgyYmNjNTUzYmU3MGRmMjExN2M4
ZWVkYzE2Cj4+Pj4gQXV0aG9yOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPj4+
PiBEYXRlOiAgIFR1ZSBKdW4gNyAxMTowNTozMyAyMDE2IC0wNzAwCj4+Pj4KPj4+PiAgICAgbW06
IEhhcmRlbmVkIHVzZXJjb3B5Cj4+Pj4KPj4+PiAgICAgVGhpcyBpcyB0aGUgc3RhcnQgb2YgcG9y
dGluZyBQQVhfVVNFUkNPUFkgaW50byB0aGUgbWFpbmxpbmUga2VybmVsLiBUaGlzCj4+Pj4gICAg
IGlzIHRoZSBmaXJzdCBzZXQgb2YgZmVhdHVyZXMsIGNvbnRyb2xsZWQgYnkgQ09ORklHX0hBUkRF
TkVEX1VTRVJDT1BZLiBUaGUKPj4+PiAgICAgd29yayBpcyBiYXNlZCBvbiBjb2RlIGJ5IFBhWCBU
ZWFtIGFuZCBCcmFkIFNwZW5nbGVyLCBhbmQgYW4gZWFybGllciBwb3J0Cj4+Pj4gICAgIGZyb20g
Q2FzZXkgU2NoYXVmbGVyLiBBZGRpdGlvbmFsIG5vbi1zbGFiIHBhZ2UgdGVzdHMgYXJlIGZyb20g
UmlrIHZhbiBSaWVsLgo+Pj4+IFsuLi5dCj4+Pj4gICAgIC0gb3RoZXJ3aXNlLCBvYmplY3QgbXVz
dCBub3Qgc3BhbiBwYWdlIGFsbG9jYXRpb25zIChleGNlcHRpbmcgUmVzZXJ2ZWQKPj4+PiAgICAg
ICBhbmQgQ01BIHJhbmdlcykKPj4+Pgo+Pj4+IE5vdCBzdXJlIGlmIHdlIHJlYWxseSBoYXZlIHRv
IGNhcmUgYWJvdXQgWk9ORV9ERVZJQ0UgYXQgdGhpcyBwb2ludC4KPj4+Cj4+PiBUaGF0IGNoZWNr
IG5lZWRzIHRvIGJlIGNhcmVmdWwgdG8gaWdub3JlIFpPTkVfREVWSUNFIHBhZ2VzLiBUaGVyZSdz
Cj4+PiBub3RoaW5nIHdyb25nIHdpdGggYSBjb3B5IHNwYW5uaW5nIFpPTkVfREVWSUNFIGFuZCB0
eXBpY2FsIHBhZ2VzLgo+Pgo+PiBQbGVhc2Ugbm90ZSB0aGF0IHRoZSBjdXJyZW50IGNoZWNrIHdv
dWxkICpmb3JiaWQqIHRoaXMgKEFGQUlLcyBmb3IgYQo+PiBzaW5nbGUgaGVhcCBvYmplY3QpLiBB
cyBkaXNjdXNzZWQgaW4gdGhlIHJlbGV2YW50IHBhdGNoLCB3ZSBtaWdodCBiZQo+PiBhYmxlIHRv
IGp1c3Qgc3RvcCBkb2luZyB0aGF0IGFuZCBsaW1pdCBpdCB0byByZWFsIFBHX3Jlc2VydmVkIHBh
Z2VzCj4+ICh3aXRob3V0IFpPTkVfREVWSUNFKS4gSSdkIGJlIGhhcHB5IHRvIG5vdCBpbnRyb2R1
Y2UgbmV3Cj4+IGlzX3pvbmVfZGV2aWNlX3BhZ2UoKSB1c2Vycy4KPiAKPiBBdCBsZWFzdCBmb3Ig
bm9uLUhNTSBaT05FX0RFVklDRSB1c2FnZSwgaS5lLiB0aGUgZGF4ICsgcG1lbSBzdHVmZiwgaXMK
PiBleGNsdWRlZCBmcm9tIHRoaXMgcGF0aCBieToKPiAKPiA1MmY0NzZhMzIzZjkgbGlibnZkaW1t
L3BtZW06IEJ5cGFzcyBDT05GSUdfSEFSREVORURfVVNFUkNPUFkgb3ZlcmhlYWQKCkludGVyZXN0
aW5nLCBhbmQgdmVyeSB2YWx1YWJsZSBpbmZvcm1hdGlvbi4gU28gdGhpcyBzb3VuZHMgbGlrZSBw
YXRjaCAjMgpjYW4gZ28gKG9yIGNvbnZlcnQgaXQgdG8gYSBkb2N1bWVudGF0aW9uIHVwZGF0ZSku
Cgo+IAo+IFNvIHRoaXMgY2FzZSBpcyBvbmUgbW9yZSB0byBhZGQgdG8gdGhlIHBpbGUgb2YgSE1N
IGF1ZGl0aW5nLgoKU291bmRzIGxpa2UgSE1NIGlzIHNvbWUgZGFuZ2Vyb3VzIHBpZWNlIG9mIHNv
ZnR3YXJlIHdlIGhhdmUuIFRoaXMgbmVlZHMKYXVkaXRpbmcsIGZpeGluZywgYW5kIGRvY3VtZW50
YXRpb24uCgpCVFcsIGRvIHlvdSBoYXZlIGEgZ29vZCBzb3VyY2Ugb2YgZGV0YWlscyBhYm91dCBI
TU0/IEVzcGVjaWFsbHkgYWJvdXQKdGhlc2Ugb2RkaXRpZXMgeW91IG1lbnRpb25lZD8KCkFsc28s
IGNhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgcGF0Y2ggIzIgNy84IGFuZCBjb25maXJtIHRoYXQgZG9p
bmcgYQpTZXRQYWdlRGlydHkoKSBvbiBhIFpPTkVfREVWSUNFIHBhZ2UgaXMgb2theSAoYWx0aG91
Z2ggbm90IHVzZWZ1bCk/IFRoYW5rcyEKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
