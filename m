Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF11E2364
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 21:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNMTz-00088X-VP; Wed, 23 Oct 2019 19:39:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3a1=YQ=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iNMTx-000880-V8
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 19:39:46 +0000
X-Inumbo-ID: dc4b6c90-f5cc-11e9-beca-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc4b6c90-f5cc-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 19:39:43 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m19so18514733otp.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ApkkYruavPD6VaVfU4QHr5pRzVSLLe/BmCajbyD76I=;
 b=bcYrgPfUve+/e7PA/COpa9cpiotkNE8e14cXEXZpBzSMlJpSompwdbTdWjjkQJddx0
 Uw+3WqPKAUioj4/4XPm7cJ24FTR0IET9Naz1ZwjQyErO2IZvSkGMpp/gew8XlZpggjwU
 urspNOSnz3kU9GTyqmzURLWDOMJHHwAlk9WGjmcgjm+VaVmSdvOU+um4KKw70KPHFsUp
 FTUvgk6gpDTS/o2wCQdq+8Gi3txZF11FZsotj80J3+OxzF3vILzEFTeGcvRDQy1jMFEi
 SRx85TI+B5z5ijy9jfA6ym8yiuLiEhXgUKJRjaghu/8ovT45aTiORONSiCHuKkbYvhPp
 fMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ApkkYruavPD6VaVfU4QHr5pRzVSLLe/BmCajbyD76I=;
 b=MtE9gmZXpS5PvsbTD4n7GosjPRAGPmtUoYHjG7sgUoZ2MUL5vU/CVmrD1Lb5iya7nQ
 bRqpTibTbGplBAi4PmVpu4M9gVO296RNF/sWecr4jOARcUD56fQjblo6admxnaIhnxZ1
 LJ9LgtaXPozhOde7ElSA+J3cQhdLA+2oQurcSOcm089HG7jBGpAHEA5mRogHu1wSpF4E
 HN9IO3JCT/v6qcG3ebZqX6p4EL+KLACVwQxZM9h6Tzpyo79rHeWAW3zrXc2oU3vVqU22
 JsZ1WD3kx7ZlTtAaf9gVC6EPuC8QdtTqm4mXp/Jui7lCW/X0Bri8m1bfGQwZcKkQAhLb
 Wyog==
X-Gm-Message-State: APjAAAXm7SIINnYxhotg5YCjQ7FyJmdQgUY+WqBP31lkvjfFTPRp7JsH
 FCXdraLbt/VRZZmKtUsf5zWcnuNGWGln+qtXv2PwOA==
X-Google-Smtp-Source: APXvYqwijxA4UnPG5Tbj7UXgroNEpqpPtlp/BzJIeWUQUfe3F9HUg3GXu8gWZWfrY7GBmsZ1h9DSM1JTtNPajl0t3Ss=
X-Received: by 2002:a05:6830:617:: with SMTP id
 w23mr8183922oti.247.1571859582403; 
 Wed, 23 Oct 2019 12:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
 <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
 <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
In-Reply-To: <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 23 Oct 2019 12:39:31 -0700
Message-ID: <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
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
 =?UTF-8?Q?Simon_Sandstr=C3=B6m?= <simon@nikanor.nu>,
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

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6MjggQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gPj4gSSBkaXNsaWtlIHRoaXMgZm9yIHRocmVlIHJlYXNv
bnMKPiA+Pgo+ID4+IGEpIEl0IGRvZXMgbm90IHByb3RlY3QgYWdhaW5zdCBhbnkgcmFjZXMsIHJl
YWxseSwgaXQgZG9lcyBub3QgaW1wcm92ZSB0aGluZ3MuCj4gPj4gYikgV2UgZG8gaGF2ZSB0aGUg
ZXhhY3Qgc2FtZSBwcm9ibGVtIHdpdGggcGZuX3RvX29ubGluZV9wYWdlKCkuIEFzIGxvbmcgYXMg
d2UKPiA+PiAgICBkb24ndCBob2xkIHRoZSBtZW1vcnkgaG90cGx1ZyBsb2NrLCBtZW1vcnkgY2Fu
IGdldCBvZmZsaW5lZCBhbmQgcmVtb3ZlIGFueSB0aW1lLiBSYWN5Lgo+ID4KPiA+IFRydWUsIHdl
IG5lZWQgdG8gc29sdmUgdGhhdCBwcm9ibGVtIHRvby4gVGhhdCBzZWVtcyB0byB3YW50IHNvbWV0
aGluZwo+ID4gbGlnaHRlciB3ZWlnaHQgdGhhbiB0aGUgaG90cGx1ZyBsb2NrIHRoYXQgY2FuIGJl
IGhlbGQgb3ZlciBwZm4gbG9va3Vwcwo+ID4gKyAgdXNlIHJhdGhlciB0aGFuIHJlcXVpcmluZyBh
IHBhZ2UgbG9va3VwIGluIHBhdGhzIHdoZXJlIGl0J3Mgbm90Cj4gPiBjbGVhciB0aGF0IGEgcGFn
ZSByZWZlcmVuY2Ugd291bGQgcHJldmVudCB1bnBsdWcuCj4gPgo+ID4+IGMpIFdlIG1peCBpbiBa
T05FIHNwZWNpZmljIHN0dWZmIGludG8gdGhlIGNvcmUuIEl0IHNob3VsZCBiZSAianVzdCBhbm90
aGVyIHpvbmUiCj4gPgo+ID4gTm90IHN1cmUgSSBncm9rIHRoaXMgd2hlbiB0aGUgUkZDIGlzIHNw
cmlua2xpbmcgem9uZS1zcGVjaWZpYwo+ID4gaXNfem9uZV9kZXZpY2VfcGFnZSgpIHRocm91Z2hv
dXQgdGhlIGNvcmU/Cj4KPiBNb3N0IHVzZXJzIHNob3VsZCBub3QgY2FyZSBhYm91dCB0aGUgem9u
ZS4gcGZuX2FjdGl2ZSgpIHdvdWxkIGJlIGVub3VnaAo+IGluIG1vc3Qgc2l0dWF0aW9ucywgZXNw
ZWNpYWxseSBtb3N0IFBGTiB3YWxrZXJzIC0gInRoaXMgbWVtbWFwIGlzIHZhbGlkCj4gYW5kIGUu
Zy4sIGNvbnRhaW5zIGEgdmFsaWQgem9uZSAuLi4iLgoKT2gsIEkgc2VlLCB5b3UncmUgc2F5aW5n
IGNvbnZlcnQgbW9zdCB1c2VycyB0byBwZm5fYWN0aXZlKCkgKGFuZCBzb21lClRCRCByY3UgbG9j
a2luZyksIGJ1dCBvbmx5IHBmbl90b19vbmxpbmVfcGFnZSgpIHVzZXJzIHdvdWxkIG5lZWQgdGhl
CnpvbmUgbG9va3VwPyBJIGNhbiBnZXQgb24gYm9hcmQgd2l0aCB0aGF0LgoKPgo+ID4KPiA+Pgo+
ID4+IFdoYXQgSSBwcm9wb3NlIGluc3RlYWQgKGFscmVhZHkgZGlzY3Vzc2VkIGluIGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE5LzEwLzEwLzg3KQo+ID4KPiA+IFNvcnJ5IEkgbWlzc2VkIHRoaXMg
ZWFybGllci4uLgo+ID4KPiA+Pgo+ID4+IDEuIENvbnZlcnQgU0VDVElPTl9JU19PTkxJTkUgdG8g
U0VDVElPTl9JU19BQ1RJVkUKPiA+PiAyLiBDb252ZXJ0IFNFQ1RJT05fSVNfQUNUSVZFIHRvIGEg
c3Vic2VjdGlvbiBiaXRtYXAKPiA+PiAzLiBJbnRyb2R1Y2UgcGZuX2FjdGl2ZSgpIHRoYXQgY2hl
Y2tzIGFnYWluc3QgdGhlIHN1YnNlY3Rpb24gYml0bWFwCj4gPj4gNC4gT25jZSB0aGUgbWVtbWFw
IHdhcyBpbml0aWFsaXplZCAvIHByZXBhcmVkLCBzZXQgdGhlIHN1YnNlY3Rpb24gYWN0aXZlCj4g
Pj4gICAgKHNpbWlsYXIgdG8gU0VDVElPTl9JU19PTkxJTkUgaW4gdGhlIGJ1ZGR5IHJpZ2h0IG5v
dykKPiA+PiA1LiBCZWZvcmUgdGhlIG1lbW1hcCBnZXRzIGludmFsaWRhdGVkLCBzZXQgdGhlIHN1
YnNlY3Rpb24gaW5hY3RpdmUKPiA+PiAgICAoc2ltaWxhciB0byBTRUNUSU9OX0lTX09OTElORSBp
biB0aGUgYnVkZHkgcmlnaHQgbm93KQo+ID4+IDUuIHBmbl90b19vbmxpbmVfcGFnZSgpID0gcGZu
X2FjdGl2ZSgpICYmIHpvbmUgIT0gWk9ORV9ERVZJQ0UKPiA+PiA2LiBwZm5fdG9fZGV2aWNlX3Bh
Z2UoKSA9IHBmbl9hY3RpdmUoKSAmJiB6b25lID09IFpPTkVfREVWSUNFCj4gPgo+ID4gVGhpcyBk
b2VzIG5vdCBzZWVtIHRvIHJlZHVjZSBhbnkgY29tcGxleGl0eSBiZWNhdXNlIGl0IHN0aWxsIHJl
cXVpcmVzCj4gPiBhIHBmbiB0byB6b25lIGxvb2t1cCBhdCB0aGUgZW5kIG9mIHRoZSBwcm9jZXNz
Lgo+ID4KPiA+IEkuZS4gY29udmVydGluZyBwZm5fdG9fb25saW5lX3BhZ2UoKSB0byB1c2UgYSBu
ZXcgcGZuX2FjdGl2ZSgpCj4gPiBzdWJzZWN0aW9uIG1hcCBwbHVzIGxvb2tpbmcgdXAgdGhlIHpv
bmUgZnJvbSBwZm5fdG9fcGFnZSgpIGlzIG1vcmUKPiA+IHN0ZXBzIHRoYW4ganVzdCBkb2luZyBh
IGRpcmVjdCBwZm4gdG8gem9uZSBsb29rdXAuIFdoYXQgYW0gSSBtaXNzaW5nPwo+Cj4gVGhhdCBh
IHJlYWwgInBmbiB0byB6b25lIiBsb29rdXAgd2l0aG91dCBnb2luZyB2aWEgdGhlIHN0cnVjdCBw
YWdlIHdpbGwKPiByZXF1aXJlIHRvIGhhdmUgbW9yZSB0aGFuIGp1c3QgYSBzaW5nbGUgYml0bWFw
LiBJTUhPLCBrZWVwaW5nIHRoZQo+IGluZm9ybWF0aW9uIGF0IGEgc2luZ2xlIHBsYWNlIChtZW1t
YXApIGlzIHRoZSBjbGVhbiB0aGluZyB0byBkbyAobm90Cj4gcmVwbGljYXRpbmcgaXQgc29tZXdo
ZXJlIGVsc2UpLiBHb2luZyB2aWEgdGhlIG1lbW1hcCBtaWdodCBub3QgYmUgYXMKPiBmYXN0IGFz
IGEgZGlyZWN0IGxvb2t1cCwgYnV0IGRvIHdlIGFjdHVhbGx5IGNhcmU/IFdlIGFyZSBhbHJlYWR5
IGxvb2tpbmcKPiBhdCAicmFuZG9tIFBGTnMgd2UgYXJlIG5vdCBzdXJlIGlmIHRoZXJlIGlzIGEg
dmFsaWQgbWVtbWFwIi4KClRydWUsIHdlIG9ubHkgY2FyZSBhYm91dCB0aGUgdmFsaWRpdHkgb2Yg
dGhlIGNoZWNrLCBhbmQgYXMgeW91IHBvaW50ZWQKb3V0IG1vdmluZyB0aGUgY2hlY2sgdG8gdGhl
IHBmbiBsZXZlbCBkb2VzIG5vdCBzb2x2ZSB0aGUgdmFsaWRpdHkKcmFjZS4gSXQgbmVlZHMgYSBs
b2NrLgoKPgo+ID4+Cj4gPj4gRXNwZWNpYWxseSwgZHJpdmVyLXJlc2VydmVkIGRldmljZSBtZW1v
cnkgd2lsbCBub3QgZ2V0IHNldCBhY3RpdmUgaW4KPiA+PiB0aGUgc3Vic2VjdGlvbiBiaXRtYXAu
Cj4gPj4KPiA+PiBOb3cgdG8gdGhlIHJhY2UuIFRha2luZyB0aGUgbWVtb3J5IGhvdHBsdWcgbG9j
ayBhdCByYW5kb20gcGxhY2VzIGlzIHVnbHkuIEkgZG8KPiA+PiB3b25kZXIgaWYgd2UgY2FuIHVz
ZSBSQ1U6Cj4gPgo+ID4gQWgsIHllcywgZXhhY3RseSB3aGF0IEkgd2FzIHRoaW5raW5nIGFib3Zl
Lgo+ID4KPiA+Pgo+ID4+IFRoZSB1c2VyIG9mIHBmbl9hY3RpdmUoKS9wZm5fdG9fb25saW5lX3Bh
Z2UoKS9wZm5fdG9fZGV2aWNlX3BhZ2UoKToKPiA+Pgo+ID4+ICAgICAgICAgLyogdGhlIG1lbW1h
cCBpcyBndWFyYW50ZWVkIHRvIHJlbWFpbiBhY3RpdmUgdW5kZXIgUkNVICovCj4gPj4gICAgICAg
ICByY3VfcmVhZF9sb2NrKCk7Cj4gPj4gICAgICAgICBpZiAocGZuX2FjdGl2ZShyYW5kb21fcGZu
KSkgewo+ID4+ICAgICAgICAgICAgICAgICBwYWdlID0gcGZuX3RvX3BhZ2UocmFuZG9tX3Bmbik7
Cj4gPj4gICAgICAgICAgICAgICAgIC4uLiB1c2UgdGhlIHBhZ2UsIHN0YXlzIHZhbGlkCj4gPj4g
ICAgICAgICB9Cj4gPj4gICAgICAgICByY3VfdW5yZWFkX2xvY2soKTsKPiA+Pgo+ID4+IE1lbW9y
eSBvZmZsaW5pbmcvbWVtcmVtYXAgY29kZToKPiA+Pgo+ID4+ICAgICAgICAgc2V0X3N1YnNlY3Rp
b25zX2luYWN0aXZlKHBmbiwgbnJfcGFnZXMpOyAvKiBjbGVhcnMgdGhlIGJpdCBhdG9taWNhbGx5
ICovCj4gPj4gICAgICAgICBzeW5jaHJvbml6ZV9yY3UoKTsKPiA+PiAgICAgICAgIC8qIGFsbCB1
c2VycyBzYXcgdGhlIGJpdG1hcCB1cGRhdGUsIHdlIGNhbiBpbnZhbGlkZSB0aGUgbWVtbWFwICov
Cj4gPj4gICAgICAgICByZW1vdmVfcGZuX3JhbmdlX2Zyb21fem9uZSh6b25lLCBwZm4sIG5yX3Bh
Z2VzKTsKPiA+Cj4gPiBMb29rcyBnb29kIHRvIG1lLgo+ID4KPiA+Pgo+ID4+Pgo+ID4+Pj4KPiA+
Pj4+IEkgb25seSBnYXZlIGl0IGEgcXVpY2sgdGVzdCB3aXRoIERJTU1zIG9uIHg4Ni02NCwgYnV0
IGRpZG4ndCB0ZXN0IHRoZQo+ID4+Pj4gWk9ORV9ERVZJQ0UgcGFydCBhdCBhbGwgKGFueSB0aXBz
IGZvciBhIG5pY2UgUUVNVSBzZXR1cD8pLiBDb21waWxlLXRlc3RlZAo+ID4+Pj4gb24geDg2LTY0
IGFuZCBQUEMuCj4gPj4+Cj4gPj4+IEknbGwgZ2l2ZSBpdCBhIHNwaW4sIGJ1dCBJIGRvbid0IHRo
aW5rIHRoZSBrZXJuZWwgd2FudHMgdG8gZ3JvdyBtb3JlCj4gPj4+IGlzX3pvbmVfZGV2aWNlX3Bh
Z2UoKSB1c2Vycy4KPiA+Pgo+ID4+IExldCdzIHJlY2FwLiBJbiB0aGlzIFJGQywgSSBpbnRyb2R1
Y2UgYSB0b3RhbCBvZiA0ICghKSB1c2VycyBvbmx5Lgo+ID4+IFRoZSBvdGhlciBwYXJ0cyBjYW4g
cmVseSBvbiBwZm5fdG9fb25saW5lX3BhZ2UoKSBvbmx5Lgo+ID4+Cj4gPj4gMS4gInN0YWdpbmc6
IGtwYzIwMDA6IFByZXBhcmUgdHJhbnNmZXJfY29tcGxldGVfY2IoKSBmb3IgUEdfcmVzZXJ2ZWQg
Y2hhbmdlcyIKPiA+PiAtIEJhc2ljYWxseSBuZXZlciB1c2VkIHdpdGggWk9ORV9ERVZJQ0UuCj4g
Pj4gLSBXZSBob2xkIGEgcmVmZXJlbmNlIQo+ID4+IC0gQWxsIGl0IHByb3RlY3RzIGlzIGEgU2V0
UGFnZURpcnR5KHBhZ2UpOwo+ID4+Cj4gPj4gMi4gInN0YWdpbmcvZ2Fza2V0OiBQcmVwYXJlIGdh
c2tldF9yZWxlYXNlX3BhZ2UoKSBmb3IgUEdfcmVzZXJ2ZWQgY2hhbmdlcyIKPiA+PiAtIFNhbWUg
YXMgMS4KPiA+Pgo+ID4+IDMuICJtbS91c2VyY29weS5jOiBQcmVwYXJlIGNoZWNrX3BhZ2Vfc3Bh
bigpIGZvciBQR19yZXNlcnZlZCBjaGFuZ2VzIgo+ID4+IC0gV2UgY29tZSB2aWEgdmlydF90b19o
ZWFkX3BhZ2UoKSAvIHZpcnRfdG9faGVhZF9wYWdlKCksIG5vdCBzdXJlIGFib3V0Cj4gPj4gICBy
ZWZlcmVuY2VzIChJIGFzc3VtZSB0aGlzIHNob3VsZCBiZSBmaW5lIGFzIHdlIGRvbid0IGNvbWUg
dmlhIHJhbmRvbQo+ID4+ICAgUEZOcykKPiA+PiAtIFdlIGNoZWNrIHRoYXQgd2UgZG9uJ3QgbWl4
IFJlc2VydmVkIChpbmNsdWRpbmcgZGV2aWNlIG1lbW9yeSkgYW5kIENNQQo+ID4+ICAgcGFnZXMg
d2hlbiBjcm9zc2luZyBjb21wb3VuZCBwYWdlcy4KPiA+Pgo+ID4+IEkgdGhpbmsgd2UgY2FuIGRy
b3AgMS4gYW5kIDIuLCByZXN1bHRpbmcgaW4gYSB0b3RhbCBvZiAyIG5ldyB1c2VycyBpbgo+ID4+
IHRoZSBzYW1lIGNvbnRleHQuIEkgdGhpbmsgdGhhdCBpcyB0b3RhbGx5IHRvbGVyYWJsZSB0byBm
aW5hbGx5IGNsZWFuCj4gPj4gdGhpcyB1cC4KPiA+Cj4gPiAuLi5idXQgbW9yZSBpc196b25lX2Rl
dmljZV9wYWdlKCkgZG9lc24ndCAiZmluYWxseSBjbGVhbiB0aGlzIHVwIi4KPiA+IExpa2Ugd2Ug
ZGlzY3Vzc2VkIGFib3ZlIGl0J3MgdGhlIG1pc3NpbmcgbG9ja2luZyB0aGF0J3MgdGhlIHJlYWwK
PiA+IGNsZWFudXAsIHRoZSBwZm5fdG9fb25saW5lX3BhZ2UoKSBpbnRlcm5hbHMgYXJlIHNlY29u
ZGFyeS4KPgo+IEl0J3MgYSBkaWZmZXJlbnQgY2xlYW51cCBJTUhPLiBXZSBjYW4ndCBkbyBldmVy
eXRoaW5nIGluIG9uZSBzaG90LiBCdXQKPiBtYXliZSBJIGNhbiBkcm9wIHRoZSBpc196b25lX2Rl
dmljZV9wYWdlKCkgcGFydHMgZnJvbSB0aGlzIHBhdGNoIGFuZAo+IGNvbXBsZXRlbHkgcmVseSBv
biBwZm5fdG9fb25saW5lX3BhZ2UoKS4gWWVzLCB0aGF0IG5lZWRzIGZpeGluZyB0bywgYnV0Cj4g
aXQncyBhIGRpZmZlcmVudCBzdG9yeS4KPgo+IFRoZSBpbXBvcnRhbnQgcGFydCBvZiB0aGlzIHBh
dGNoOgo+Cj4gV2hpbGUgcGZuX3RvX29ubGluZV9wYWdlKCkgd2lsbCBhbHdheXMgZXhjbHVkZSBa
T05FX0RFVklDRSBwYWdlcywKPiBjaGVja2luZyBQR19yZXNlcnZlZCBvbiBaT05FX0RFVklDRSBw
YWdlcyAod2hhdCB3ZSBkbyByaWdodCBub3chKSBpcwo+IHJhY3kgYXMgaGVsbCAoZXNwZWNpYWxs
eSB3aGVuIGNvbmN1cnJlbnRseSBpbml0aWFsaXppbmcgdGhlIG1lbW1hcCkuCj4KPiBUaGlzIGRv
ZXMgaW1wcm92ZSB0aGUgc2l0dWF0aW9uLgoKVHJ1ZSB0aGF0J3MgYSByYWNlIGEgdmVjdG9yIEkg
d2FzIG5vdCBjb25zaWRlcmluZy4KCj4KPiA+Pgo+ID4+IEhvd2V2ZXIsIEkgdGhpbmsgd2UgYWxz
byBoYXZlIHRvIGNsYXJpZnkgaWYgd2UgbmVlZCB0aGUgY2hhbmdlIGluIDMgYXQgYWxsLgo+ID4+
IEl0IGNvbWVzIGZyb20KPiA+Pgo+ID4+IGNvbW1pdCBmNTUwOWNjMThkYWE3ZjgyYmNjNTUzYmU3
MGRmMjExN2M4ZWVkYzE2Cj4gPj4gQXV0aG9yOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KPiA+PiBEYXRlOiAgIFR1ZSBKdW4gNyAxMTowNTozMyAyMDE2IC0wNzAwCj4gPj4KPiA+
PiAgICAgbW06IEhhcmRlbmVkIHVzZXJjb3B5Cj4gPj4KPiA+PiAgICAgVGhpcyBpcyB0aGUgc3Rh
cnQgb2YgcG9ydGluZyBQQVhfVVNFUkNPUFkgaW50byB0aGUgbWFpbmxpbmUga2VybmVsLiBUaGlz
Cj4gPj4gICAgIGlzIHRoZSBmaXJzdCBzZXQgb2YgZmVhdHVyZXMsIGNvbnRyb2xsZWQgYnkgQ09O
RklHX0hBUkRFTkVEX1VTRVJDT1BZLiBUaGUKPiA+PiAgICAgd29yayBpcyBiYXNlZCBvbiBjb2Rl
IGJ5IFBhWCBUZWFtIGFuZCBCcmFkIFNwZW5nbGVyLCBhbmQgYW4gZWFybGllciBwb3J0Cj4gPj4g
ICAgIGZyb20gQ2FzZXkgU2NoYXVmbGVyLiBBZGRpdGlvbmFsIG5vbi1zbGFiIHBhZ2UgdGVzdHMg
YXJlIGZyb20gUmlrIHZhbiBSaWVsLgo+ID4+IFsuLi5dCj4gPj4gICAgIC0gb3RoZXJ3aXNlLCBv
YmplY3QgbXVzdCBub3Qgc3BhbiBwYWdlIGFsbG9jYXRpb25zIChleGNlcHRpbmcgUmVzZXJ2ZWQK
PiA+PiAgICAgICBhbmQgQ01BIHJhbmdlcykKPiA+Pgo+ID4+IE5vdCBzdXJlIGlmIHdlIHJlYWxs
eSBoYXZlIHRvIGNhcmUgYWJvdXQgWk9ORV9ERVZJQ0UgYXQgdGhpcyBwb2ludC4KPiA+Cj4gPiBU
aGF0IGNoZWNrIG5lZWRzIHRvIGJlIGNhcmVmdWwgdG8gaWdub3JlIFpPTkVfREVWSUNFIHBhZ2Vz
LiBUaGVyZSdzCj4gPiBub3RoaW5nIHdyb25nIHdpdGggYSBjb3B5IHNwYW5uaW5nIFpPTkVfREVW
SUNFIGFuZCB0eXBpY2FsIHBhZ2VzLgo+Cj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgY3VycmVudCBj
aGVjayB3b3VsZCAqZm9yYmlkKiB0aGlzIChBRkFJS3MgZm9yIGEKPiBzaW5nbGUgaGVhcCBvYmpl
Y3QpLiBBcyBkaXNjdXNzZWQgaW4gdGhlIHJlbGV2YW50IHBhdGNoLCB3ZSBtaWdodCBiZQo+IGFi
bGUgdG8ganVzdCBzdG9wIGRvaW5nIHRoYXQgYW5kIGxpbWl0IGl0IHRvIHJlYWwgUEdfcmVzZXJ2
ZWQgcGFnZXMKPiAod2l0aG91dCBaT05FX0RFVklDRSkuIEknZCBiZSBoYXBweSB0byBub3QgaW50
cm9kdWNlIG5ldwo+IGlzX3pvbmVfZGV2aWNlX3BhZ2UoKSB1c2Vycy4KCkF0IGxlYXN0IGZvciBu
b24tSE1NIFpPTkVfREVWSUNFIHVzYWdlLCBpLmUuIHRoZSBkYXggKyBwbWVtIHN0dWZmLCBpcwpl
eGNsdWRlZCBmcm9tIHRoaXMgcGF0aCBieToKCjUyZjQ3NmEzMjNmOSBsaWJudmRpbW0vcG1lbTog
QnlwYXNzIENPTkZJR19IQVJERU5FRF9VU0VSQ09QWSBvdmVyaGVhZAoKU28gdGhpcyBjYXNlIGlz
IG9uZSBtb3JlIHRvIGFkZCB0byB0aGUgcGlsZSBvZiBITU0gYXVkaXRpbmcuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
