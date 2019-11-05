Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E1EF2D3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 02:33:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRng9-0004yl-V3; Tue, 05 Nov 2019 01:30:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iRng8-0004yg-5m
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 01:30:40 +0000
X-Inumbo-ID: de9e216a-ff6b-11e9-b678-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de9e216a-ff6b-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 01:30:37 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h2so13783989qto.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2019 17:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aR+2eBnDheAMkwOXsNXJUEiyYXIkOGnGgWNkPzd4tdQ=;
 b=qktoZDnmGaINw22JlCwMcZG1PDeQczipLlMB42AGNsv72JUru4Yl1D6oIEjBA38dzh
 ZS2PnoJ0nLiGYI/i2K3YUYXaOLydyfU1Nh9OJDcQC7tLDTMa0R1lDv4ems+WcI//b7L2
 wR2dAsnPnZxJaxO7jVkMEQp5o3ksMp8LZBvOc6NF8jCZcTkkpEBzr7Bf+awpNyVVG6Ua
 qooyd6G9st5lQ4zbkKWFjUk8VEjPyKkcrE3NKGhOt3BMQgdbeqhbp+AtPIgHxyLjREHU
 SGLgLVGJs/nQldloF34in/meweNbuplR476f3VH7ViKAcI+PvQUy3TCespjZxP2iYT+N
 0/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aR+2eBnDheAMkwOXsNXJUEiyYXIkOGnGgWNkPzd4tdQ=;
 b=cDGmPbctzA7ySCPOGJ4PR5aWipRfiE7GsgtSA4LW41iuOdY46HPytRFFzT7hQKSpXw
 PgShYPzUwc7cDOj5etvuuVqEPKpLlGw5Cp5fK+iCd0DJ2A65aC+tiFwLxWNyL2Dz3Mwo
 R1izvo/s9zQoDiwFo8L+NlZ6tGzo7surhWQRpQkGwfiOGOltft5MU/OSmlW0GK9twa6h
 wKnM0K0I450NiIE6J5j6bE69wOpHUUARxeqO/J7b3W4j+Pr7mBaty5sHdpp82j6Azdbn
 ihY/wkk8xrYzd2vm/U8gCwSIJI1xACIg6T6BT+5CPpG16SNYdOScPVcj3LQS+EYAMUKn
 KI9g==
X-Gm-Message-State: APjAAAWoqy9vL2scLjhFxGXxbWIxQ+C9zTYL4O2+ZlkgYuE8F5PuyOyX
 kBeh6/ep+ynuoNHTtV8C5E9h3Dz0wV0P1rtsFe3DxA==
X-Google-Smtp-Source: APXvYqz7Bk4kRduwfrclstPYyEuP//nuwTqg9TTsoV0HtiW5xPO5/4utgjFzQW53c0oeh/hiUJTxgAj86G8lI66LWNo=
X-Received: by 2002:ac8:424d:: with SMTP id r13mr15689594qtm.111.1572917436967; 
 Mon, 04 Nov 2019 17:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-2-david@redhat.com>
In-Reply-To: <20191024120938.11237-2-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 17:30:25 -0800
Message-ID: <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [Xen-devel] [PATCH v1 01/10] mm/memory_hotplug: Don't allow to
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

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNToxMCBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPdXIgb25saW5pbmcvb2ZmbGluaW5nIGNvZGUgaXMgdW5u
ZWNlc3NhcmlseSBjb21wbGljYXRlZC4gT25seSBtZW1vcnkKPiBibG9ja3MgYWRkZWQgZHVyaW5n
IGJvb3QgY2FuIGhhdmUgaG9sZXMgKGEgcmFuZ2UgdGhhdCBpcyBub3QKPiBJT1JFU09VUkNFX1NZ
U1RFTV9SQU0pLiBIb3RwbHVnZ2VkIG1lbW9yeSBuZXZlciBoYXMgaG9sZXMgKGUuZy4sIHNlZQo+
IGFkZF9tZW1vcnlfcmVzb3VyY2UoKSkuIEFsbCBib290IG1lbW9yeSBpcyBhbHJlYWQgb25saW5l
LgoKcy9hbHJlYWQvYWxyZWFkeS8KCi4uLmFsc28gcGVyaGFwcyBjbGFyaWZ5ICJhbHJlYWR5IG9u
bGluZSIgYnkgd2hhdCBwb2ludCBpbiB0aW1lIGFuZCB3aHkKdGhhdCBpcyByZWxldmFudC4gRm9y
IGV4YW1wbGUgYSBkZXNjcmlwdGlvbiBvZiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuCnRoZSBTZXRQ
YWdlUmVzZXJ2ZWQoKSBpbiB0aGUgYm9vdG1lbSBwYXRoIGFuZCB0aGUgb25lIGluIHRoZSBob3Rw
bHVnCnBhdGguCgo+IFRoZXJlZm9yZSwgd2hlbiB3ZSBzdG9wIGFsbG93aW5nIHRvIG9mZmxpbmUg
bWVtb3J5IGJsb2NrcyB3aXRoIGhvbGVzLCB3ZQo+IGltcGxpY2l0bHkgbm8gbG9uZ2VyIGhhdmUg
dG8gZGVhbCB3aXRoIG9ubGluaW5nIG1lbW9yeSBibG9ja3Mgd2l0aCBob2xlcy4KCk1heWJlIGFu
IGV4cGxpY2l0IHJlZmVyZW5jZSBvZiB0aGUgY29kZSBhcmVhcyB0aGF0IGRlYWwgd2l0aCBob2xl
cwp3b3VsZCBoZWxwIHRvIGJhY2sgdXAgdGhhdCBhc3NlcnRpb24uIENlcnRhaW5seSBpdCB3b3Vs
ZCBoYXZlIHNhdmVkIG1lCnNvbWUgdGltZSBmb3IgdGhlIHJldmlldy4KCj4gVGhpcyBhbGxvd3Mg
dG8gc2ltcGxpZnkgdGhlIGNvZGUuIEZvciBleGFtcGxlLCB3ZSBubyBsb25nZXIgaGF2ZSB0bwo+
IHdvcnJ5IGFib3V0IG1hcmtpbmcgcGFnZXMgdGhhdCBmYWxsIGludG8gbWVtb3J5IGhvbGVzIFBH
X3Jlc2VydmVkIHdoZW4KPiBvbmxpbmluZyBtZW1vcnkuIFdlIGNhbiBzdG9wIHNldHRpbmcgcGFn
ZXMgUEdfcmVzZXJ2ZWQuCgouLi5idXQgbm90IGZvciBib290bWVtLCByaWdodD8KCj4KPiBPZmZs
aW5pbmcgbWVtb3J5IGJsb2NrcyBhZGRlZCBkdXJpbmcgYm9vdCBpcyB1c3VhbGx5IG5vdCBndXJh
bnRlZWQgdG8gd29yawoKcy9ndXJhbnRlZWQvZ3VhcmFudGVlZC8KCj4gZWl0aGVyIHdheSAodW5t
b3ZhYmxlIGRhdGEgbWlnaHQgaGF2ZSBlYXNpbHkgZW5kZWQgdXAgb24gdGhhdCBtZW1vcnkgZHVy
aW5nCj4gYm9vdCkuIFNvIHN0b3BwaW5nIHRvIGRvIHRoYXQgc2hvdWxkIG5vdCByZWFsbHkgaHVy
dCAoKyBwZW9wbGUgYXJlIG5vdAo+IGV2ZW4gYXdhcmUgb2YgYSBzZXR1cCB3aGVyZSB0aGF0IHVz
ZWQgdG8gd29yawoKTWF5YmUgcHV0IGEgIkxpbms6IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3Iv
JG1zZ19pZCIgdG8gdGhhdCBkaXNjdXNzaW9uPwoKPiBhbmQgdGhhdCB0aGUgZXhpc3RpbmcgY29k
ZQo+IHN0aWxsIHdvcmtzIGNvcnJlY3RseSB3aXRoIG1lbW9yeSBob2xlcykuIEZvciB0aGUgdXNl
IGNhc2Ugb2Ygb2ZmbGluaW5nCj4gbWVtb3J5IHRvIHVucGx1ZyBESU1Ncywgd2Ugc2hvdWxkIHNl
ZSBubyBjaGFuZ2UuIChob2xlcyBvbiBESU1NcyB3b3VsZCBiZQo+IHdlaXJkKS4KCkhvd2V2ZXIs
IGxlc3MgbWVtb3J5IGNhbiBiZSBvZmZsaW5lZCB0aGFuIHdhcyB0aGVvcmV0aWNhbGx5IGFsbG93
ZWQKcHJldmlvdXNseSwgc28gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSAid2Ugc2hvdWxkIHNlZSBu
byBjaGFuZ2UiCmNvbW1lbnQuIEkgc3RpbGwgYWdyZWUgdGhhdCdzIGEgcHJpY2Ugd29ydGggcGF5
aW5nIHRvIGdldCB0aGUgY29kZQpjbGVhbnVwcyBhbmQgaWYgc29tZW9uZSBzY3JlYW1zIHdlIGNh
biBsb29rIGF0IGFkZGluZyBpdCBiYWNrLCBidXQgdGhlCmZhY3QgdGhhdCBpdCB3YXMgYWxyZWFk
eSBmcmFnaWxlIHNlZW1zIGRlY2VudCBlbm91Z2ggcHJvdGVjdGlvbi4KCj4KPiBQbGVhc2Ugbm90
ZSB0aGF0IGhhcmR3YXJlIGVycm9ycyAoUEdfaHdwb2lzb24pIGFyZSBub3QgbWVtb3J5IGhvbGVz
IGFuZAo+IG5vdCBhZmZlY3RlZCBieSB0aGlzIGNoYW5nZSB3aGVuIG9mZmxpbmluZy4KPgo+IENj
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWNoYWwg
SG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBDYzogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBz
dXNlLmRlPgo+IENjOiBQYXZlbCBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4K
PiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IEFuc2h1
bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IC0tLQo+ICBtbS9tZW1vcnlf
aG90cGx1Zy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbW0v
bWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVnLmMKPiBpbmRleCA1NjEzNzFlYWQz
OWEuLjhkODE3MzBjZjAzNiAxMDA2NDQKPiAtLS0gYS9tbS9tZW1vcnlfaG90cGx1Zy5jCj4gKysr
IGIvbW0vbWVtb3J5X2hvdHBsdWcuYwo+IEBAIC0xNDQ3LDEwICsxNDQ3LDE5IEBAIHN0YXRpYyB2
b2lkIG5vZGVfc3RhdGVzX2NsZWFyX25vZGUoaW50IG5vZGUsIHN0cnVjdCBtZW1vcnlfbm90aWZ5
ICphcmcpCj4gICAgICAgICAgICAgICAgIG5vZGVfY2xlYXJfc3RhdGUobm9kZSwgTl9NRU1PUlkp
Owo+ICB9Cj4KPiArc3RhdGljIGludCBjb3VudF9zeXN0ZW1fcmFtX3BhZ2VzX2NiKHVuc2lnbmVk
IGxvbmcgc3RhcnRfcGZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCB2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25l
ZCBsb25nICpucl9zeXN0ZW1fcmFtX3BhZ2VzID0gZGF0YTsKPiArCj4gKyAgICAgICAqbnJfc3lz
dGVtX3JhbV9wYWdlcyArPSBucl9wYWdlczsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+
ICBzdGF0aWMgaW50IF9fcmVmIF9fb2ZmbGluZV9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0X3Bm
biwKPiAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm4pCj4gIHsKPiAtICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGZuLCBucl9wYWdlczsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
cGZuLCBucl9wYWdlcyA9IDA7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG9mZmxpbmVkX3BhZ2Vz
ID0gMDsKPiAgICAgICAgIGludCByZXQsIG5vZGUsIG5yX2lzb2xhdGVfcGFnZWJsb2NrOwo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiBAQCAtMTQ2MSw2ICsxNDcwLDIwIEBAIHN0YXRp
YyBpbnQgX19yZWYgX19vZmZsaW5lX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLAo+Cj4g
ICAgICAgICBtZW1faG90cGx1Z19iZWdpbigpOwo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
RG9uJ3QgYWxsb3cgdG8gb2ZmbGluZSBtZW1vcnkgYmxvY2tzIHRoYXQgY29udGFpbiBob2xlcy4K
PiArICAgICAgICAqIENvbnNlY3VlbnRseSwgbWVtb3J5IGJsb2NrcyB3aXRoIGhvbGVzIGNhbiBu
ZXZlciBnZXQgb25saW5lZAoKcy9Db25zZWN1ZW50bHkvQ29uc2VxdWVudGx5LwoKPiArICAgICAg
ICAqIChob3RwbHVnZ2VkIG1lbW9yeSBoYXMgbm8gaG9sZXMgYW5kIGFsbCBib290IG1lbW9yeSBp
cyBvbmxpbmUpLgo+ICsgICAgICAgICogVGhpcyBhbGxvd3MgdG8gc2ltcGxpZnkgdGhlIG9ubGlu
aW5nL29mZmxpbmluZyBjb2RlIHF1aXRlIGEgbG90Lgo+ICsgICAgICAgICovCgpUaGUgbGFzdCBz
ZW50ZW5jZSBvZiB0aGlzIGNvbW1lbnQgbWFrZXMgc2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdGhp
cwpwYXRjaCwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgc3RhbmRzIGJ5IGl0c2VsZiBpbiB0aGUgY29k
ZSBiYXNlIGFmdGVyCnRoZSBmYWN0LiBUaGUgcGVyc29uIHJlYWRpbmcgdGhlIGNvbW1lbnQgY2Fu
J3Qgc2VlIHRoZSBzaW1wbGlmaWNhdGlvbnMKYmVjYXVzZSB0aGUgY29kZSBpcyBhbHJlYWR5IGdv
bmUuIEknZCBjbGFyaWZ5IGl0IHRvIHRhbGsgYWJvdXQgd2h5IGl0CmlzIHNhZmUgdG8gbm90IG1l
c3MgYXJvdW5kIHdpdGggUEdfUmVzZXJ2ZWQgaW4gdGhlIGhvdHBsdWcgcGF0aApiZWNhdXNlIG9m
IHRoaXMgY2hlY2suCgpBZnRlciB0aG9zZSBjbGFyaWZpY2F0aW9ucyB5b3UgY2FuIGFkZDoKClJl
dmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
