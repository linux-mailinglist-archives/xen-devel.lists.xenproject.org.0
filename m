Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A2F538A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:32:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT90c-0005Ec-Kb; Fri, 08 Nov 2019 18:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zf4M=ZA=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iT90a-0005EX-US
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:29:20 +0000
X-Inumbo-ID: ac674a2c-0255-11ea-9631-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac674a2c-0255-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 18:29:17 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m193so6117110oig.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 10:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yngiQYr/7F6QKuY7vN6LC1DaelX21SW6WtIezPVX1cs=;
 b=1d0D3cRq9YmW+1yK/RE0DJ/UkPslFK9ZAtUlZvAmKEittn+5P29MLqMMstbFi6jxrj
 Ns+iC+3lEfqovG/2PeSjS3wVktY00J2VZo7ibdEFMbFztKpI1VGkrK4Z6kX7z5EzrUom
 bSTVU2MgPfHTpWNd+xSEyU8xK4V1kffBbeLvkwqwFJj8qpE4mYF7AJRg+qxJndVPhMij
 YrZFUYzgb9mQnIKiWG8Byr1keTk4OMIwDas2SXSrk7iFZyyCWOQnqkn+P1k9XRe9xeBr
 mL6RRd4GY0O+nfHuYs60Bo8b9/FTK1kKLaz6x7EetX7XNninU7M5eC1ph48V7wcf59eX
 ybUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yngiQYr/7F6QKuY7vN6LC1DaelX21SW6WtIezPVX1cs=;
 b=SAaLSl7GKN4LpPw4zIl7+KAXDOEqJ4whHWNk9zsIvln19nzd5whi83zQtY+68D4lo7
 NsoAO1bomSzNi0sdw/DLAKYen8AmuNVbSYTejk5HVAZOfLx0dCEtmnRbfcGsbYs5XnIL
 afEdJhIWzvu390j5RjPYMIyfjRMon205bqTjar0YL+Un3pgqOw+/Djei1IBC1vlxerEy
 DCO8LRgndftcGm86HjOG2O+8GLrEnfwhJOnuFYAkIGTRsXdjY3nwgL2awsL9oVDIk1oO
 tlUdU1Y6IOmreNGGT+1GldTHnoYLAWYMu7EUA9KcRj03eowLfwBAf1XeOaZg9twM4rXz
 6mEg==
X-Gm-Message-State: APjAAAUNbcydHBG6jxQnD9eDL3ZykFZme8s/9XAUSmDchwEZKwkSNxFB
 HOUkUtTqsNeJNJcQS5cXWQ9B5wRAO+hwGKzsr3SCQg==
X-Google-Smtp-Source: APXvYqyW1emHhRBKHxxXAScz16mwYUdha6EWMf/eNJ6eW2bb1Fqoly3wylgSEbuygHP3+YkWg3AvDZQxJt18zmA6EEU=
X-Received: by 2002:aca:1910:: with SMTP id l16mr10558260oii.73.1573237757087; 
 Fri, 08 Nov 2019 10:29:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
 <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
 <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
In-Reply-To: <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 8 Nov 2019 10:29:06 -0800
Message-ID: <CAPcyv4ivq=EPUePXiX2ErcVyF7+dV9Yv215Oue7X_Y2X_Jfw8Q@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH v1 04/10] vfio/type1: Prepare
 is_invalid_reserved_pfn() for PG_reserved changes
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
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAyOjIyIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDA4LjExLjE5IDA4OjE0LCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToKPiA+IE9uIDA4LjExLjE5IDA2OjA5LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPj4g
T24gVGh1LCBOb3YgNywgMjAxOSBhdCAyOjA3IFBNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gMDcuMTEuMTkgMTk6MjIsIERhdmlkIEhp
bGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+Pj4gQW0gMDcuMTEuMjAxOSB1bSAx
Njo0MCBzY2hyaWViIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPjoKPiA+
Pj4+Pgo+ID4+Pj4+IO+7v09uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDU6MTIgQU0gRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBSaWdo
dCBub3csIFpPTkVfREVWSUNFIG1lbW9yeSBpcyBhbHdheXMgc2V0IFBHX3Jlc2VydmVkLiBXZSB3
YW50IHRvCj4gPj4+Pj4+IGNoYW5nZSB0aGF0Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBLVk0gaGFzIHRo
aXMgd2VpcmQgdXNlIGNhc2UgdGhhdCB5b3UgY2FuIG1hcCBhbnl0aGluZyBmcm9tIC9kZXYvbWVt
Cj4gPj4+Pj4+IGludG8gdGhlIGd1ZXN0LiBwZm5fdmFsaWQoKSBpcyBub3QgYSByZWxpYWJsZSBj
aGVjayB3aGV0aGVyIHRoZSBtZW1tYXAKPiA+Pj4+Pj4gd2FzIGluaXRpYWxpemVkIGFuZCBjYW4g
YmUgdG91Y2hlZC4gcGZuX3RvX29ubGluZV9wYWdlKCkgbWFrZXMgc3VyZQo+ID4+Pj4+PiB0aGF0
IHdlIGhhdmUgYW4gaW5pdGlhbGl6ZWQgbWVtbWFwIChhbmQgZG9uJ3QgaGF2ZSBaT05FX0RFVklD
RSBtZW1vcnkpLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBSZXdyaXRlIGlzX2ludmFsaWRfcmVzZXJ2ZWRf
cGZuKCkgc2ltaWxhciB0byBrdm1faXNfcmVzZXJ2ZWRfcGZuKCkgdG8gbWFrZQo+ID4+Pj4+PiBz
dXJlIHRoZSBmdW5jdGlvbiBwcm9kdWNlcyB0aGUgc2FtZSByZXN1bHQgb25jZSB3ZSBzdG9wIHNl
dHRpbmcgWk9ORV9ERVZJQ0UKPiA+Pj4+Pj4gcGFnZXMgUEdfcmVzZXJ2ZWQuCj4gPj4+Pj4+Cj4g
Pj4+Pj4+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+
ID4+Pj4+PiBDYzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4gPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+ID4+Pj4+
PiAtLS0KPiA+Pj4+Pj4gZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8IDEwICsrKysr
KysrLS0KPiA+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gPj4+Pj4+IGlu
ZGV4IDJhZGE4ZTZjZGI4OC4uZjhjZThjNDA4YmE4IDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9kcml2
ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmZpby92
ZmlvX2lvbW11X3R5cGUxLmMKPiA+Pj4+Pj4gQEAgLTI5OSw5ICsyOTksMTUgQEAgc3RhdGljIGlu
dCB2ZmlvX2xvY2tfYWNjdChzdHJ1Y3QgdmZpb19kbWEgKmRtYSwgbG9uZyBucGFnZSwgYm9vbCBh
c3luYykKPiA+Pj4+Pj4gICAgICovCj4gPj4+Pj4+IHN0YXRpYyBib29sIGlzX2ludmFsaWRfcmVz
ZXJ2ZWRfcGZuKHVuc2lnbmVkIGxvbmcgcGZuKQo+ID4+Pj4+PiB7Cj4gPj4+Pj4+IC0gICAgICAg
aWYgKHBmbl92YWxpZChwZm4pKQo+ID4+Pj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuIFBhZ2VS
ZXNlcnZlZChwZm5fdG9fcGFnZShwZm4pKTsKPiA+Pj4+Pj4gKyAgICAgICBzdHJ1Y3QgcGFnZSAq
cGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwo+ID4+Pj4+Cj4gPj4+Pj4gVWdoLCBJIGp1
c3QgcmVhbGl6ZWQgdGhpcyBpcyBub3QgYSBzYWZlIGNvbnZlcnNpb24gdW50aWwKPiA+Pj4+PiBw
Zm5fdG9fb25saW5lX3BhZ2UoKSBpcyBtb3ZlZCBvdmVyIHRvIHN1YnNlY3Rpb24gZ3JhbnVsYXJp
dHkuIEFzIGl0Cj4gPj4+Pj4gc3RhbmRzIGl0IHdpbGwgcmV0dXJuIHRydWUgZm9yIGFueSBaT05F
X0RFVklDRSBwYWdlcyB0aGF0IHNoYXJlIGEKPiA+Pj4+PiBzZWN0aW9uIHdpdGggYm9vdCBtZW1v
cnkuCj4gPj4+Pgo+ID4+Pj4gVGhhdCBzaG91bGQgbm90IGhhcHBlbiByaWdodCBub3cgYW5kIEkg
Y29tbWVudGVkIGJhY2sgd2hlbiB5b3UgaW50cm9kdWNlZCBzdWJzZWN0aW9uIHN1cHBvcnQgdGhh
dCBJIGRvbuKAmXQgd2FudCB0byBoYXZlIFpPTkVfREVWSUNFIG1peGVkIHdpdGggb25saW5lIHBh
Z2VzIGluIGEgc2VjdGlvbi4gSGF2aW5nIG1lbW9yeSBibG9jayBkZXZpY2VzIHRoYXQgcGFydGlh
bGx5IHNwYW4gWk9ORV9ERVZJQ0Ugd291bGQgYmUgLi4uIHJlYWxseSB3ZWlyZC4gV2l0aCBzb21l
dGhpbmcgbGlrZSBwZm5fYWN0aXZlKCkgLSBhcyBkaXNjdXNzZWQgLSB3ZSBjb3VsZCBhdCBsZWFz
dCBtYWtlIHRoaXMgY2hlY2sgd29yayAtIGJ1dCBJIGFtIG5vdCBzdXJlIGlmIHdlIHJlYWxseSB3
YW50IHRvIGdvIGRvd24gdGhhdCBwYXRoLiBJbiB0aGUgd29yc3QgY2FzZSwgc29tZSBNQiBvZiBS
QU0gYXJlIGxvc3QgLi4uIEkgZ3Vlc3MgdGhpcyBuZWVkcyBtb3JlIHRob3VnaHQuCj4gPj4+Pgo+
ID4+Pgo+ID4+PiBJIGp1c3QgcmVhbGl6ZWQgdGhlICJib290IG1lbW9yeSIgcGFydC4gSXMgdGhh
dCBhIHJlYWwgdGhpbmc/IElPVywgY2FuCj4gPj4+IHdlIGhhdmUgWk9ORV9ERVZJQ0UgZmFsbGlu
ZyBpbnRvIGEgbWVtb3J5IGJsb2NrICh3aXRoIGhvbGVzKT8gSSBzb21ld2hhdAo+ID4+PiBoYXZl
IGRvdWJ0cyB0aGF0IHRoaXMgd291bGQgd29yayAuLi4KPiA+Pgo+ID4+IE9uZSBvZiB0aGUgcmVh
bCB3b3JsZCBmYWlsdXJlIGNhc2VzIHRoYXQgc3RhcnRlZCB0aGUgc3Vic2VjdGlvbiBlZmZlY3QK
PiA+PiBpcyB0aGF0IFBlcnNpc3RlbnQgTWVtb3J5IGNvbGxpZGVzIHdpdGggU3lzdGVtIFJBTSBv
biBhIDY0TUIgYm91bmRhcnkKPiA+PiBvbiBzaGlwcGluZyBwbGF0Zm9ybXMuIFN5c3RlbSBSQU0g
ZW5kcyBvbiBhIDY0TUIgYm91bmRhcnkgYW5kIGR1ZSB0byBhCj4gPj4gbGFjayBvZiBtZW1vcnkg
Y29udHJvbGxlciByZXNvdXJjZXMgUE1FTSBpcyBtYXBwZWQgY29udGlndW91c2x5IGF0IHRoZQo+
ID4+IGVuZCBvZiB0aGF0IGJvdW5kYXJ5LiBTb21lIG1vcmUgZGV0YWlscyBpbiB0aGUgc3Vic2Vj
dGlvbiBjb3ZlciBsZXR0ZXIKPiA+PiAvIGNoYW5nZWxvZ3MgWzFdIFsyXS4gSXQncyBub3Qgc3Vm
ZmljaWVudCB0byBqdXN0IGxvc2Ugc29tZSBtZW1vcnksCj4gPj4gdGhhdCdzIHRoZSBicm9rZW4g
aW1wbGVtZW50YXRpb24gdGhhdCBsZWFkIHRvIHRoZSBzdWJzZWN0aW9uIHdvcmsKPiA+PiBiZWNh
dXNlIHRoZSBsb3N0IG1lbW9yeSBtYXkgY2hhbmdlIGZyb20gb25lIGJvb3QgdG8gdGhlIG5leHQg
YW5kCj4gPj4gc29mdHdhcmUgY2FuJ3QgcmVsaWFibHkgaW5qZWN0IGEgcGFkZGluZyB0aGF0IGNv
bmZvcm1zIHRvIHRoZSB4ODYKPiA+PiAxMjhNQiBzZWN0aW9uIGNvbnN0cmFpbnQuCj4gPgo+ID4g
VGhhbmtzLCBJIHRob3VnaHQgaXQgd2FzIG1vc3RseSBmb3Igd2VpcmQgYWxpZ25tZW50IHdoZXJl
IG90aGVyIHBhcnRzIG9mCj4gPiB0aGUgc2VjdGlvbiBhcmUgYmFzaWNhbGx5ICJob2xlcyIgYW5k
IG5vdCBtZW1vcnkuCj4gPgo+ID4gWWVzLCBpdCBpcyBhIHJlYWwgYnVnIHRoYXQgWk9ORV9ERVZJ
Q0UgcGFnZXMgZmFsbCBpbnRvIHNlY3Rpb25zIHRoYXQgYXJlCj4gPiBtYXJrZWQgU0VDVElPTl9J
U19PTkxJTkUuCj4gPgo+ID4+Cj4gPj4gU3VmZmljZSB0byBzYXkgSSB0aGluayB3ZSBuZWVkIHlv
dXIgcGZuX2FjdGl2ZSgpIHRvIGdldCBzdWJzZWN0aW9uCj4gPj4gZ3JhbnVsYXJpdHkgcGZuX3Rv
X29ubGluZV9wYWdlKCkgYmVmb3JlIFBhZ2VSZXNlcnZlZCgpIGNhbiBiZSByZW1vdmVkLgo+ID4K
PiA+IEkgYWdyZWUgdGhhdCB3ZSBoYXZlIHRvIGZpeCB0aGlzLiBJIGRvbid0IGxpa2UgWk9ORV9E
RVZJQ0UgcGFnZXMgZmFsbGluZwo+ID4gaW50byBtZW1vcnkgZGV2aWNlIGJsb2NrcyAoZS5nLiwg
Y2Fubm90IGdldCBvZmZsaW5lZCksIGJ1dCBJIGd1ZXNzIHRoYXQKPiA+IHRyYWluIGlzIGdvbmUg
OikgQXMgbG9uZyBhcyBpdCdzIG5vdCBmb3IgbWVtb3J5IGhvdHBsdWcsIEkgY2FuIG1vc3QKPiA+
IHByb2JhYmx5IGxpdmUgd2l0aCB0aGlzLgo+ID4KPiA+IEFsc28sIEknZCBsaWtlIHRvIGdldCBN
aWNoYWxzIG9waW5pb24gb24gdGhpcyBhbmQgdGhlIHBmbl9hY3RpdmUoKQo+ID4gYXBwcm9hY2gs
IGJ1dCBJIGNhbiB1bmRlcnN0YW5kIGhlJ3MgYnVzeS4KPiA+Cj4gPiBUaGlzIHBhdGNoIHNldCBj
YW4gd2FpdCwgSSB3b24ndCBiZSB3b3JraW5nIG5leHQgd2VlayBiZXNpZGVzCj4gPiByZWFkaW5n
L3dyaXRpbmcgbWFpbHMgZWl0aGVyIHdheS4KPiA+Cj4gPiBJcyBhbnlib2R5IGxvb2tpbmcgaW50
byB0aGUgcGZuX2FjdGl2ZSgpIHRoaW5neT8KPiA+Cj4KPiBJIHdvbmRlciBpZiB3ZSBzaG91bGQg
ZG8gc29tZXRoaW5nIGxpa2UgdGhpcyByaWdodCBub3cgdG8gZml4IHRoaXMKPiAoZXhjbHVkZSB0
aGUgZmFsc2UgcG9zaXRpdmUgWk9ORV9ERVZJQ0UgcGFnZXMgd2UgY291bGQgaGF2ZSB3aXRoaW4g
YW4KPiBvbmxpbmUgc2VjdGlvbiwgd2hpY2ggd2FzIG5vdCBwb3NzaWJsZSBiZWZvcmUgc3Vic2Vj
dGlvbiBob3RwbHVnKToKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3Rw
bHVnLmggYi9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmgKPiBpbmRleCAzODRmZmIzZDY5
YWIuLjQ5MGE5ZTkzNThiMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3Rw
bHVnLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmgKPiBAQCAtMzAsNiAr
MzAsOCBAQCBzdHJ1Y3Qgdm1lbV9hbHRtYXA7Cj4gICAgICAgICAgaWYgKF9fX25yIDwgTlJfTUVN
X1NFQ1RJT05TICYmIG9ubGluZV9zZWN0aW9uX25yKF9fX25yKSAmJiBcCj4gICAgICAgICAgICAg
IHBmbl92YWxpZF93aXRoaW4oX19fcGZuKSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gICAgICAgICAgICAgICAgICBfX19wYWdlID0gcGZuX3RvX3BhZ2UoX19fcGZuKTsgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICBpZiAodW5saWtlbHkoX19fcGFnZSAmJiBpc196b25l
X2RldmljZV9wYWdlKF9fX3BhZ2UpKSkgICAgIFwKPiArICAgICAgICAgICAgICAgX19fcGFnZSA9
IE5VTEw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIF9f
X3BhZ2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICAgfSkKPgo+Cj4gWWVhaCwgaXQncyBhbm90aGVyIGlzX3pvbmVfZGV2aWNlX3BhZ2UoKSwg
YnV0IGl0IHNob3VsZCBub3QgYmUgcmFjeQo+IGhlcmUsIGFzIHdlIHdhbnQgdG8gZXhjbHVkZSwg
bm90IGluY2x1ZGUgWk9ORV9ERVZJQ0UuCj4KPiBJIGRvbid0IGhhdmUgdGltZSB0byBsb29rIGlu
dG8gdGhpcyByaWdodCBub3csIHVuZm9ydHVuYXRlbHkuCgpJIGRvbid0IHdhbnQgdG8gYmFuZC1h
aWQgd2l0aG91dCBhbiBhY3R1YWwgYnVnIHJlcG9ydC4gSSdsbCB0YWtlIGEKbG9vayBhdCBhIHN1
YnNlY3Rpb24tbWFwIGZvciB0aGUgb25saW5lIHN0YXRlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
