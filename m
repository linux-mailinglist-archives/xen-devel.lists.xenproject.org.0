Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E711E31F8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbwS-0004lI-9P; Thu, 24 Oct 2019 12:10:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VKnL=YR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iNbwR-0004lD-65
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:10:11 +0000
X-Inumbo-ID: 390e963e-f657-11e9-bbab-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 390e963e-f657-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TooFwxaibKWioSMXkjdsd9KqTbD0P4TIgojllh09QfQ=;
 b=MV95PON9VMAJOC6c8dsscFeKqUiGlv6uvdFCLmGF2Wic3u0gcAskpmCqHLztGEIt3CJ+TM
 ch8U/EiehGGNZvheJW7dvWMgY5HaIfEsqQ6iM0+KoTZKAaWLPZRoS1RHFl8FoeW+F8as5t
 WYEue9EOkftDM7dwFbQQi7QqrFUOVgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Mt5vh3dPMhmZKGgS4b6ZRA-1; Thu, 24 Oct 2019 08:10:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410A4801E5C;
 Thu, 24 Oct 2019 12:10:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 314413CCA;
 Thu, 24 Oct 2019 12:09:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2019 14:09:28 +0200
Message-Id: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Mt5vh3dPMhmZKGgS4b6ZRA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v1 00/10] mm: Don't mark hotplugged pages
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

VGhpcyBpcyB0aGUgcmVzdWx0IG9mIGEgcmVjZW50IGRpc2N1c3Npb24gd2l0aCBNaWNoYWwgKFsx
XSwgWzJdKS4gUmlnaHQKbm93IHdlIHNldCBhbGwgcGFnZXMgUEdfcmVzZXJ2ZWQgd2hlbiBpbml0
aWFsaXppbmcgaG90cGx1Z2dlZCBtZW1tYXBzLiBUaGlzCmluY2x1ZGVzIFpPTkVfREVWSUNFIG1l
bW9yeS4gSW4gY2FzZSBvZiBzeXN0ZW0gbWVtb3J5LCBQR19yZXNlcnZlZCBpcwpjbGVhcmVkIGFn
YWluIHdoZW4gb25saW5pbmcgdGhlIG1lbW9yeSwgaW4gY2FzZSBvZiBaT05FX0RFVklDRSBtZW1v
cnkKbmV2ZXIuCgpJbiBhbmNpZW50IHRpbWVzLCB3ZSBuZWVkZWQgUEdfcmVzZXJ2ZWQsIGJlY2F1
c2UgdGhlcmUgd2FzIG5vIHdheSB0byB0ZWxsCndoZXRoZXIgdGhlIG1lbW1hcCB3YXMgYWxyZWFk
eSBwcm9wZXJseSBpbml0aWFsaXplZC4gV2Ugbm93IGhhdmUKU0VDVElPTl9JU19PTkxJTkUgZm9y
IHRoYXQgaW4gdGhlIGNhc2Ugb2YgIVpPTkVfREVWSUNFIG1lbW9yeS4gWk9ORV9ERVZJQ0UKbWVt
b3J5IGlzIGFscmVhZHkgaW5pdGlhbGl6ZWQgZGVmZXJyZWQsIGFuZCB0aGVyZSBzaG91bGRuJ3Qg
YmUgYSB2aXNpYmxlCmNoYW5nZSBpbiB0aGF0IHJlZ2FyZC4KCk9uZSBvZiB0aGUgYmlnZ2VzdCBm
ZWFycyB3ZXJlIHNpZGUgZWZmZWN0cy4gSSB3ZW50IGFoZWFkIGFuZCBhdWRpdGVkIGFsbAp1c2Vy
cyBvZiBQYWdlUmVzZXJ2ZWQoKS4gVGhlIGRldGFpbHMgY2FuIGJlIGZvdW5kIGluICJtbS9tZW1v
cnlfaG90cGx1ZzoKRG9uJ3QgbWFyayBwYWdlcyBQR19yZXNlcnZlZCB3aGVuIGluaXRpYWxpemlu
ZyB0aGUgbWVtbWFwIi4KClRoaXMgcGF0Y2ggc2V0IGFkYXB0cyBhbGwgcmVsZXZhbnQgdXNlcnMg
b2YgUGFnZVJlc2VydmVkKCkgdG8ga2VlcCB0aGUKZXhpc3RpbmcgYmVoYXZpb3IgaW4gcmVzcGVj
dCB0byBaT05FX0RFVklDRSBwYWdlcy4gVGhlIGJpZ2dlc3QgcGFydCBwYXJ0CnRoYXQgbmVlZHMg
Y2hhbmdlcyBpcyBLVk0sIHRvIGtlZXAgdGhlIGV4aXN0aW5nIGJlaGF2aW9yICh0aGF0J3MgYWxs
IEkKY2FyZSBhYm91dCBpbiB0aGlzIHNlcmllcykuCgpOb3RlIHRoYXQgdGhpcyBzZXJpZXMgaXMg
YWJsZSB0byByZWx5IGNvbXBsZXRlbHkgb24gcGZuX3RvX29ubGluZV9wYWdlKCkuCk5vIG5ldyBp
c196b25lX2RldmljZV9wYWdlKCkgY2FsbGVzIGFyZSBpbnRyb2R1Y2VkIChhcyByZXF1ZXN0ZWQg
YnkgRGFuKS4KV2UgYXJlIGN1cnJlbnRseSBkaXNjdXNzaW5nIGEgd2F5IHRvIG1hcmsgYWxzbyBa
T05FX0RFVklDRSBtZW1tYXBzIGFzCmFjdGl2ZS9pbml0aWFsaXplZCAtIHBmbl9hY3RpdmUoKSAt
IGFuZCBsaWdodHdlaWdodCBsb2NraW5nIHRvIG1ha2Ugc3VyZQptZW1tYXBzIHJlbWFpbiBhY3Rp
dmUgKGUuZy4sIHVzaW5nIFJDVSkuIFdlIG1pZ2h0IGxhdGVyIGJlIGFibGUgdG8gY29udmVydApz
b21lIHN1ZXJzIG9mIHBmbl90b19vbmxpbmVfcGFnZSgpIHRvIHBmbl9hY3RpdmUoKS4gRGV0YWls
cyBjYW4gYmUgZm91bmQKaW4gWzNdLCBob3dldmVyLCB0aGlzIHJlcHJlc2VudHMgeWV0IGFub3Ro
ZXIgY2xlYW51cC9maXggd2UnbGwgcGVyZm9ybQpvbiB0b3Agb2YgdGhpcyBjbGVhbnVwLgoKSSBv
bmx5IGdhdmUgaXQgYSBxdWljayB0ZXN0IHdpdGggRElNTXMgb24geDg2LTY0LCBidXQgZGlkbid0
IHRlc3QgdGhlClpPTkVfREVWSUNFIHBhcnQgYXQgYWxsIChhbnkgdGlwcyBmb3IgYSBuaWNlIFFF
TVUgc2V0dXA/KS4gQWxzbywgSSBkaWRuJ3QKdGVzdCB0aGUgS1ZNIHBhcnRzIChlc3BlY2lhbGx5
IHdpdGggWk9ORV9ERVZJQ0UgcGFnZXMgb3Igbm8gbWVtbWFwIGF0IGFsbCkuCkNvbXBpbGUtdGVz
dGVkIG9uIHg4Ni02NCBhbmQgUFBDLgoKQmFzZWQgb24gbmV4dC9tYXN0ZXIuIFRoZSBjdXJyZW50
IHZlcnNpb24gKGtlcHQgdXBkYXRlZCkgY2FuIGJlIGZvdW5kIGF0OgogICAgaHR0cHM6Ly9naXRo
dWIuY29tL2RhdmlkaGlsZGVuYnJhbmQvbGludXguZ2l0IG9ubGluZV9yZXNlcnZlZF9jbGVhbnVw
CgpSRkMgLT4gdjE6Ci0gRHJvcHBlZCAic3RhZ2luZy9nYXNrZXQ6IFByZXBhcmUgZ2Fza2V0X3Jl
bGVhc2VfcGFnZSgpIGZvciBQR19yZXNlcnZlZAogIGNoYW5nZXMiCi0gRHJvcHBlZCAic3RhZ2lu
Zzoga3BjMjAwMDogUHJlcGFyZSB0cmFuc2Zlcl9jb21wbGV0ZV9jYigpIGZvciBQR19yZXNlcnZl
ZAogIGNoYW5nZXMiCi0gQ29udmVydGVkICJtbS91c2VyY29weS5jOiBQcmVwYXJlIGNoZWNrX3Bh
Z2Vfc3BhbigpIGZvciBQR19yZXNlcnZlZAogIGNoYW5nZXMiIHRvICJtbS91c2VyY29weS5jOiBV
cGRhdGUgY29tbWVudCBpbiBjaGVja19wYWdlX3NwYW4oKQogIHJlZ2FyZGluZyBaT05FX0RFVklD
RSIKLSBObyBuZXcgdXNlcnMgb2YgaXNfem9uZV9kZXZpY2VfcGFnZSgpIGFyZSBpbnRyb2R1Y2Vk
LgotIFJlcGhyYXNlZCBjb21tZW50cyBhbmQgcGF0Y2ggZGVzY3JpcHRpb25zLgoKWzFdIGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzIxLzczNgpbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvMTAvMjEvMTAzNApbM10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgt
bW0vbXNnMTk0MTEyLmh0bWwKCkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3JnPgpD
YzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20KQ2M6IEFuZHJldyBNb3J0
b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBrdm0tcHBjQHZnZXIua2VybmVsLm9y
ZwpDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKQ2M6IGt2bUB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRldmVsQGRyaXZlcmRldi5v
c3Vvc2wub3JnCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IHg4NkBrZXJu
ZWwub3JnCkNjOiBBbGV4YW5kZXIgRHV5Y2sgPGFsZXhhbmRlci5kdXlja0BnbWFpbC5jb20+CgpE
YXZpZCBIaWxkZW5icmFuZCAoMTApOgogIG1tL21lbW9yeV9ob3RwbHVnOiBEb24ndCBhbGxvdyB0
byBvbmxpbmUvb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHdpdGgKICAgIGhvbGVzCiAgS1ZNOiB4ODYv
bW11OiBQcmVwYXJlIGt2bV9pc19tbWlvX3BmbigpIGZvciBQR19yZXNlcnZlZCBjaGFuZ2VzCiAg
S1ZNOiBQcmVwYXJlIGt2bV9pc19yZXNlcnZlZF9wZm4oKSBmb3IgUEdfcmVzZXJ2ZWQgY2hhbmdl
cwogIHZmaW8vdHlwZTE6IFByZXBhcmUgaXNfaW52YWxpZF9yZXNlcnZlZF9wZm4oKSBmb3IgUEdf
cmVzZXJ2ZWQgY2hhbmdlcwogIHBvd2VycGMvYm9vazNzOiBQcmVwYXJlIGt2bXBwY19ib29rM3Nf
aW5zdGFudGlhdGVfcGFnZSgpIGZvcgogICAgUEdfcmVzZXJ2ZWQgY2hhbmdlcwogIHBvd2VycGMv
NjRzOiBQcmVwYXJlIGhhc2hfcGFnZV9kb19sYXp5X2ljYWNoZSgpIGZvciBQR19yZXNlcnZlZAog
ICAgY2hhbmdlcwogIHBvd2VycGMvbW06IFByZXBhcmUgbWF5YmVfcHRlX3RvX3BhZ2UoKSBmb3Ig
UEdfcmVzZXJ2ZWQgY2hhbmdlcwogIHg4Ni9tbTogUHJlcGFyZSBfX2lvcmVtYXBfY2hlY2tfcmFt
KCkgZm9yIFBHX3Jlc2VydmVkIGNoYW5nZXMKICBtbS9tZW1vcnlfaG90cGx1ZzogRG9uJ3QgbWFy
ayBwYWdlcyBQR19yZXNlcnZlZCB3aGVuIGluaXRpYWxpemluZyB0aGUKICAgIG1lbW1hcAogIG1t
L3VzZXJjb3B5LmM6IFVwZGF0ZSBjb21tZW50IGluIGNoZWNrX3BhZ2Vfc3BhbigpIHJlZ2FyZGlu
ZwogICAgWk9ORV9ERVZJQ0UKCiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXgu
YyB8IDE0ICsrKysrLS0tLQogYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyAg
fCAxMCArKystLS0KIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgIHwgMTAg
KysrLS0tCiBhcmNoL3g4Ni9rdm0vbW11LmMgICAgICAgICAgICAgICAgICAgICB8IDI5ICsrKysr
KysrKystLS0tLS0tCiBhcmNoL3g4Ni9tbS9pb3JlbWFwLmMgICAgICAgICAgICAgICAgICB8IDEz
ICsrKysrKy0tCiBkcml2ZXJzL2h2L2h2X2JhbGxvb24uYyAgICAgICAgICAgICAgICB8ICA2ICsr
KysKIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgICAgICAgIHwgMTAgKysrKy0tCiBk
cml2ZXJzL3hlbi9iYWxsb29uLmMgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrCiBpbmNsdWRl
L2xpbnV4L3BhZ2UtZmxhZ3MuaCAgICAgICAgICAgICB8ICA4ICstLS0tCiBtbS9tZW1vcnlfaG90
cGx1Zy5jICAgICAgICAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKystLS0tLS0t
CiBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDExIC0tLS0tLS0KIG1t
L3VzZXJjb3B5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLQogdmlydC9rdm0v
a3ZtX21haW4uYyAgICAgICAgICAgICAgICAgICAgfCAxMCArKysrLS0KIDEzIGZpbGVzIGNoYW5n
ZWQsIDExMSBpbnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
