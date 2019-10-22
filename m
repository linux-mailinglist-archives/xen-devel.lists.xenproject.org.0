Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49FE0A4E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 19:16:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMxil-000609-Mk; Tue, 22 Oct 2019 17:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iMxik-000603-Kz
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 17:13:22 +0000
X-Inumbo-ID: 3e892016-f4ef-11e9-bbab-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3e892016-f4ef-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lOu6AQP2dyv/4LtgwGlaMv6HFBAdtkUQmm1EyLtCFNM=;
 b=AKXKGYz40SwBaJnfOTKdjQKuO4UjeTEvm5sphoNdDojZ34kFYKXstB8l1qTF2y2X39X8Mr
 SBTUwr/STXCIDfsSSdC+6YWCr5eJn+Y3Nj8/wzKGGlzSmh9lApYxlUigcSxWvA5tan1j2y
 XjtHy4ScFtpo1fc9x1IJLN6bUwkdodc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-9EHfARfbNLK-zZYBJq1aBA-1; Tue, 22 Oct 2019 13:13:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7918A47B;
 Tue, 22 Oct 2019 17:13:07 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B8BC5DD79;
 Tue, 22 Oct 2019 17:12:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 19:12:27 +0200
Message-Id: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9EHfARfbNLK-zZYBJq1aBA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH RFC v1 00/12] mm: Don't mark hotplugged pages
 PG_reserved (including ZONE_DEVICE)
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

VGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gWzJdLCB3aGljaCBzaG91bGQgcG9wIHVwIGluIGxpbnV4
L25leHQgc29vbjoKCWh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzIxLzEwMzQKClRoaXMg
aXMgdGhlIHJlc3VsdCBvZiBhIHJlY2VudCBkaXNjdXNzaW9uIHdpdGggTWljaGFsIChbMV0sIFsy
XSkuIFJpZ2h0Cm5vdyB3ZSBzZXQgYWxsIHBhZ2VzIFBHX3Jlc2VydmVkIHdoZW4gaW5pdGlhbGl6
aW5nIGhvdHBsdWdnZWQgbWVtbWFwcy4gVGhpcwppbmNsdWRlcyBaT05FX0RFVklDRSBtZW1vcnku
IEluIGNhc2Ugb2Ygc3lzdGVtIG1lbW9yeSwgUEdfcmVzZXJ2ZWQgaXMKY2xlYXJlZCBhZ2FpbiB3
aGVuIG9ubGluaW5nIHRoZSBtZW1vcnksIGluIGNhc2Ugb2YgWk9ORV9ERVZJQ0UgbWVtb3J5Cm5l
dmVyLiBJbiBhbmNpZW50IHRpbWVzLCB3ZSBuZWVkZWQgUEdfcmVzZXJ2ZWQsIGJlY2F1c2UgdGhl
cmUgd2FzIG5vIHdheQp0byB0ZWxsIHdoZXRoZXIgdGhlIG1lbW1hcCB3YXMgYWxyZWFkeSBwcm9w
ZXJseSBpbml0aWFsaXplZC4gV2Ugbm93IGhhdmUKU0VDVElPTl9JU19PTkxJTkUgZm9yIHRoYXQg
aW4gdGhlIGNhc2Ugb2YgIVpPTkVfREVWSUNFIG1lbW9yeS4gWk9ORV9ERVZJQ0UKbWVtb3J5IGlz
IGFscmVhZHkgaW5pdGlhbGl6ZWQgZGVmZXJyZWQsIGFuZCB0aGVyZSBzaG91bGRuJ3QgYmUgYSB2
aXNpYmxlCmNoYW5nZSBpbiB0aGF0IHJlZ2FyZC4KCkkgcmVtZW1iZXIgdGhhdCBzb21lIHRpbWUg
YWdvLCB3ZSBhbHJlYWR5IHRhbGtlZCBhYm91dCBzdG9wcGluZyB0byBzZXQKWk9ORV9ERVZJQ0Ug
cGFnZXMgUEdfcmVzZXJ2ZWQgb24gdGhlIGxpc3QsIGJ1dCBJIG5ldmVyIHNhdyBhbnkgcGF0Y2hl
cy4KQWxzbywgSSBmb3Jnb3Qgd2hvIHdhcyBwYXJ0IG9mIHRoZSBkaXNjdXNzaW9uIDopCgpPbmUg
b2YgdGhlIGJpZ2dlc3QgZmVhciB3ZXJlIHNpZGUgZWZmZWN0cy4gSSB3ZW50IGFoZWFkIGFuZCBh
dWRpdGVkIGFsbAp1c2VycyBvZiBQYWdlUmVzZXJ2ZWQoKS4gVGhlIG9uZXMgdGhhdCBkb24ndCBu
ZWVkIGFueSBjYXJlIChwYXRjaGVzKQpjYW4gYmUgZm91bmQgYmVsb3cuIEkgd2lsbCBkb3VibGUg
Y2hlY2sgYW5kIGhvcGUgSSBhbSBub3QgbWlzc2luZyBzb21ldGhpbmcKaW1wb3J0YW50LgoKSSBh
bSBwcm9iYWJseSBhIGxpdHRsZSBiaXQgdG9vIGNhcmVmdWwgKGJ1dCBJIGRvbid0IHdhbnQgdG8g
YnJlYWsgdGhpbmdzKS4KSW4gbW9zdCBwbGFjZXMgKGJlc2lkZXMgS1ZNIGFuZCB2ZmlvIHRoYXQg
YXJlIG51dHMpLCB0aGUKcGZuX3RvX29ubGluZV9wYWdlKCkgY2hlY2sgY291bGQgbW9zdCBwcm9i
YWJseSBiZSBhdm9pZGVkIGJ5IGEKaXNfem9uZV9kZXZpY2VfcGFnZSgpIGNoZWNrLiBIb3dldmVy
LCBJIHVzdWFsbHkgZ2V0IHN1c3BpY2lvdXMgd2hlbiBJIHNlZQphIHBmbl92YWxpZCgpIGNoZWNr
IChlc3BlY2lhbGx5IGFmdGVyIEkgbGVhcm5lZCB0aGF0IHBlb3BsZSBtbWFwIHBhcnRzIG9mCi9k
ZXYvbWVtIGludG8gdXNlciBzcGFjZSwgaW5jbHVkaW5nIG1lbW9yeSB3aXRob3V0IG1lbW1hcHMu
IEFsc28sIHBlb3BsZQpjb3VsZCBtZW1tYXAgb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoaXMgd2F5
IDovKS4gQXMgbG9uZyBhcyB0aGlzIGRvZXMgbm90Cmh1cnQgcGVyZm9ybWFuY2UsIEkgdGhpbmsg
d2Ugc2hvdWxkIHJhdGhlciBkbyBpdCB0aGUgY2xlYW4gd2F5LgoKSSBvbmx5IGdhdmUgaXQgYSBx
dWljayB0ZXN0IHdpdGggRElNTXMgb24geDg2LTY0LCBidXQgZGlkbid0IHRlc3QgdGhlClpPTkVf
REVWSUNFIHBhcnQgYXQgYWxsIChhbnkgdGlwcyBmb3IgYSBuaWNlIFFFTVUgc2V0dXA/KS4gQ29t
cGlsZS10ZXN0ZWQKb24geDg2LTY0IGFuZCBQUEMuCgpPdGhlciB1c2VycyBvZiBQYWdlUmVzZXJ2
ZWQoKSB0aGF0IHNob3VsZCBiZSBmaW5lOgotIG1tL3BhZ2Vfb3duZXIuYzpwYWdldHlwZWluZm9f
c2hvd21peGVkY291bnRfcHJpbnQoKQogIC0+IE5ldmVyIGNhbGxlZCBmb3IgWk9ORV9ERVZJQ0Us
ICgrIHBmbl90b19vbmxpbmVfcGFnZShwZm4pKQotIG1tL3BhZ2Vfb3duZXIuYzppbml0X3BhZ2Vz
X2luX3pvbmUoKQogIC0+IE5ldmVyIGNhbGxlZCBmb3IgWk9ORV9ERVZJQ0UgKCFwb3B1bGF0ZWRf
em9uZSh6b25lKSkKLSBtbS9wYWdlX2V4dC5jOmZyZWVfcGFnZV9leHQoKQogIC0+IE9ubHkgYSBC
VUdfT04oUGFnZVJlc2VydmVkKHBhZ2UpKSwgbm90IHJlbGV2YW50Ci0gbW0vcGFnZV9leHQuYzpo
YXNfdW5tb3ZhYmxlX3BhZ2VzKCkKICAtPiBOb3QgcmVsZXZlYW50IGZvciBaT05FX0RFVklDRQot
IG1tL3BhZ2VfZXh0LmM6cGZuX3JhbmdlX3ZhbGlkX2NvbnRpZygpCiAgLT4gcGZuX3RvX29ubGlu
ZV9wYWdlKCkgYWxyZWFkeSBndWFyZHMgdXMKLSBtbS9tZW1wb2xpY3kuYzpxdWV1ZV9wYWdlc19w
dGVfcmFuZ2UoKQogIC0+IHZtX25vcm1hbF9wYWdlKCkgY2hlY2tzIGFnYWluc3QgcHRlX2Rldm1h
cCgpCi0gbW0vbWVtb3J5LWZhaWx1cmUuYzpod3BvaXNvbl91c2VyX21hcHBpbmdzKCkKICAtPiBO
b3QgcmVhY2hlZCB2aWEgbWVtb3J5X2ZhaWx1cmUoKSBkdWUgdG8gcGZuX3RvX29ubGluZV9wYWdl
KCkKICAtPiBBbHNvIG5vdCByZWFjaGVkIGluZGlyZWN0bHkgdmlhIG1lbW9yeV9mYWlsdXJlX2h1
Z2V0bGIoKQotIG1tL2h1Z2V0bGIuYzpnYXRoZXJfYm9vdG1lbV9wcmVhbGxvYygpCiAgLT4gT25s
eSBhIFdBUk5fT04oUGFnZVJlc2VydmVkKHBhZ2UpKSwgbm90IHJlbGV2YW50Ci0ga2VybmVsL3Bv
d2VyL3NuYXBzaG90LmM6c2F2ZWFibGVfaGlnaG1lbV9wYWdlKCkKICAtPiBwZm5fdG9fb25saW5l
X3BhZ2UoKSBhbHJlYWR5IGd1YXJkcyB1cwotIGtlcm5lbC9wb3dlci9zbmFwc2hvdC5jOnNhdmVh
YmxlX3BhZ2UoKQogIC0+IHBmbl90b19vbmxpbmVfcGFnZSgpIGFscmVhZHkgZ3VhcmRzIHVzCi0g
ZnMvcHJvYy90YXNrX21tdS5jOmNhbl9nYXRoZXJfbnVtYV9zdGF0cygpCiAgLT4gdm1fbm9ybWFs
X3BhZ2UoKSBjaGVja3MgYWdhaW5zdCBwdGVfZGV2bWFwKCkKLSBmcy9wcm9jL3Rhc2tfbW11LmM6
Y2FuX2dhdGhlcl9udW1hX3N0YXRzX3BtZAogIC0+IHZtX25vcm1hbF9wYWdlX3BtZCgpIGNoZWNr
cyBhZ2FpbnN0IHB0ZV9kZXZtYXAoKQotIGZzL3Byb2MvcGFnZS5jOnN0YWJsZV9wYWdlX2ZsYWdz
KCkKICAtPiBUaGUgcmVzZXJ2ZWQgYml0IGlzIHNpbXBseSBjb3BpZWQsIGlycmVsZXZhbnQKLSBk
cml2ZXJzL2Zpcm13YXJlL21lbW1hcC5jOnJlbGVhc2VfZmlybXdhcmVfbWFwX2VudHJ5KCkKICAt
PiByZWFsbHkgb25seSBhIGNoZWNrIHRvIGRldGVjdCBib290bWVtLiBOb3QgcmVsZXZhbnQgZm9y
IFpPTkVfREVWSUNFCi0gYXJjaC9pYTY0L2tlcm5lbC9tY2FfZHJ2LmMKLSBhcmNoL21pcHMvbW0v
aW5pdC5jCi0gYXJjaC9taXBzL21tL2lvcmVtYXAuYwotIGFyY2gvbmlvczIvbW0vaW9yZW1hcC5j
Ci0gYXJjaC9wYXJpc2MvbW0vaW9yZW1hcC5jCi0gYXJjaC9zcGFyYy9tbS90bGIuYwotIGFyY2gv
eHRlbnNhL21tL2NhY2hlLmMKICAtPiBObyBaT05FX0RFVklDRSBzdXBwb3J0Ci0gYXJjaC9wb3dl
cnBjL21tL2luaXRfNjQuYzp2bWVtbWFwX2ZyZWUoKQogIC0+IFNwZWNpYWwtY2FzZXMgbWVtbWFw
IG9uIGFsdG1hcAogIC0+IE9ubHkgYSBjaGVjayBmb3IgYm9vdG1lbQotIGFyY2gveDg2L2tlcm5l
bC9hbHRlcm5hdGl2ZS5jOl9fdGV4dF9wb2tlKCkKICAtPiBPbmx5IGEgV0FSTl9PTighUGFnZVJl
c2VydmVkKHBhZ2VzWzBdKSkgdG8gdmVyaWZ5IGl0IGlzIGJvb3RtZW0KLSBhcmNoL3g4Ni9tbS9p
bml0XzY0LmMKICAtPiBPbmx5IGEgY2hlY2sgZm9yIGJvb3RtZW0KClsxXSBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS8xMC8yMS83MzYKWzJdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEw
LzIxLzEwMzQKCkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3JnPgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1A
bGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBrdm0tcHBjQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKQ2M6IGt2bUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxp
bnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3Jn
CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IHg4NkBrZXJuZWwub3JnCkNj
OiBBbGV4YW5kZXIgRHV5Y2sgPGFsZXhhbmRlci5kdXlja0BnbWFpbC5jb20+CgpEYXZpZCBIaWxk
ZW5icmFuZCAoMTIpOgogIG1tL21lbW9yeV9ob3RwbHVnOiBEb24ndCBhbGxvdyB0byBvbmxpbmUv
b2ZmbGluZSBtZW1vcnkgYmxvY2tzIHdpdGgKICAgIGhvbGVzCiAgbW0vdXNlcmNvcHkuYzogUHJl
cGFyZSBjaGVja19wYWdlX3NwYW4oKSBmb3IgUEdfcmVzZXJ2ZWQgY2hhbmdlcwogIEtWTTogeDg2
L21tdTogUHJlcGFyZSBrdm1faXNfbW1pb19wZm4oKSBmb3IgUEdfcmVzZXJ2ZWQgY2hhbmdlcwog
IEtWTTogUHJlcGFyZSBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgZm9yIFBHX3Jlc2VydmVkIGNoYW5n
ZXMKICB2ZmlvL3R5cGUxOiBQcmVwYXJlIGlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKCkgZm9yIFBH
X3Jlc2VydmVkIGNoYW5nZXMKICBzdGFnaW5nL2dhc2tldDogUHJlcGFyZSBnYXNrZXRfcmVsZWFz
ZV9wYWdlKCkgZm9yIFBHX3Jlc2VydmVkIGNoYW5nZXMKICBzdGFnaW5nOiBrcGMyMDAwOiBQcmVw
YXJlIHRyYW5zZmVyX2NvbXBsZXRlX2NiKCkgZm9yIFBHX3Jlc2VydmVkCiAgICBjaGFuZ2VzCiAg
cG93ZXJwYy9ib29rM3M6IFByZXBhcmUga3ZtcHBjX2Jvb2szc19pbnN0YW50aWF0ZV9wYWdlKCkg
Zm9yCiAgICBQR19yZXNlcnZlZCBjaGFuZ2VzCiAgcG93ZXJwYy82NHM6IFByZXBhcmUgaGFzaF9w
YWdlX2RvX2xhenlfaWNhY2hlKCkgZm9yIFBHX3Jlc2VydmVkCiAgICBjaGFuZ2VzCiAgcG93ZXJw
Yy9tbTogUHJlcGFyZSBtYXliZV9wdGVfdG9fcGFnZSgpIGZvciBQR19yZXNlcnZlZCBjaGFuZ2Vz
CiAgeDg2L21tOiBQcmVwYXJlIF9faW9yZW1hcF9jaGVja19yYW0oKSBmb3IgUEdfcmVzZXJ2ZWQg
Y2hhbmdlcwogIG1tL21lbW9yeV9ob3RwbHVnOiBEb24ndCBtYXJrIHBhZ2VzIFBHX3Jlc2VydmVk
IHdoZW4gaW5pdGlhbGl6aW5nIHRoZQogICAgbWVtbWFwCgogYXJjaC9wb3dlcnBjL2t2bS9ib29r
M3NfNjRfbW11X3JhZGl4LmMgICAgIHwgMTQgKysrKy0tLQogYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L2hhc2hfdXRpbHMuYyAgICAgIHwgMTAgKysrLS0KIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxl
LmMgICAgICAgICAgICAgICAgICB8IDEwICsrKy0tCiBhcmNoL3g4Ni9rdm0vbW11LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAzMCArKysrKysrKystLS0tLS0KIGFyY2gveDg2L21tL2lvcmVt
YXAuYyAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrLS0KIGRyaXZlcnMvaHYvaHZfYmFs
bG9vbi5jICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKwogZHJpdmVycy9zdGFnaW5nL2dhc2tl
dC9nYXNrZXRfcGFnZV90YWJsZS5jIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9rcGMyMDAwL2tw
Y19kbWEvZmlsZW9wcy5jICB8ICAzICstCiBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5j
ICAgICAgICAgICAgfCAxMCArKysrLQogZHJpdmVycy94ZW4vYmFsbG9vbi5jICAgICAgICAgICAg
ICAgICAgICAgIHwgIDcgKysrKwogaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmggICAgICAgICAg
ICAgICAgIHwgIDggKy0tLQogbW0vbWVtb3J5X2hvdHBsdWcuYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNDMgKysrKysrKysrKysrKysrKy0tLS0tLQogbW0vcGFnZV9hbGxvYy5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTEgLS0tLS0tCiBtbS91c2VyY29weS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNSArKy0KIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEwICsrKystCiAxNSBmaWxlcyBjaGFuZ2VkLCAxMTUgaW5zZXJ0aW9u
cygrKSwgNjcgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
