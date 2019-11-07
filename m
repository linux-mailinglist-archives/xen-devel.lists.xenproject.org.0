Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD71F33A3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjtj-0000an-4x; Thu, 07 Nov 2019 15:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JmXp=Y7=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iSjth-0000ai-0P
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:40:33 +0000
X-Inumbo-ID: ecd37c8e-0174-11ea-9631-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecd37c8e-0174-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 15:40:29 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j7so2344005oib.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2019 07:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q58dgR5BjEdLFCMc/OF3RFMdn955E8grbP7luNA8CNY=;
 b=oKCc36Mb9fip+zU5tGKr6J+l4XlDcFUtvr2mmmCNv6TF0HlwkicRCrTT1sQlx12vxa
 UY8S81D7tBut+V/4ZkpyJtSVYco9A0bQaPWztNxHQubXXDgTxmJGos9WA1uUQELcy96J
 T6Bh3rJMvXgSo4xERJ53HxifVFLgwy/o3viVP+9B0CbTTzJLC88VhXkF2cZ+0Tuobk14
 zVNN5QACqwe5KWkIPC4t1TSKEn6spSMULzAANECJfJo6fn8JsC5HEU9YsPR/FcLvIWCT
 HseWP/zMGzW78EfAwZAkw31fNd4FCq5eyjs4aTOmObHRdvGMJcGjHaaY5l49bbOdcFbv
 BxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q58dgR5BjEdLFCMc/OF3RFMdn955E8grbP7luNA8CNY=;
 b=hXQ+w/ed+M/mDbVzYhrLevBlP11Y2LjnAK15d1dZRpupcvDtkYqz5k3Q2q/5icvofM
 Vi4bSh8yT7hRPcrFOl7WnsipobYbLKZZ5v0JklQ806eLFhKyYjJIZuBkbj/93Z3WANsC
 yqmjoSqgPRSTkGUBRwtKAII+X3MDTOGs+mrZwKKl2BxJlTVMIOLz7GBEQEc6f7PHu6fO
 vMmTcFK5BAR3D6kELzat5FM9lsHOWg1PuuHWAO2fyeIm7KKkmoN4h8bLTfOsav3vyOOi
 ocFKVM1+S4d7dKukvi+RNwyuNC+d0f727phYD908kmtCuEEuXu+1I2uVXta2kF/rMEQb
 59Ug==
X-Gm-Message-State: APjAAAU+JCRdTDTBpvyhPRsSddPcin1CBbLCWR+BQlodKJIyB7ztn34m
 fgTZXujOk1+Oa1d54j4nIcGph813KTwaVSECwDgGZQ==
X-Google-Smtp-Source: APXvYqzlAbNtEQcnOULhGp1Ld3ejpyCy6BqfHWE8h+548I8goxJKdozDEoUnp7xCpHOKMURL2hHkCxlnCDsp6qKvW2g=
X-Received: by 2002:aca:ad52:: with SMTP id w79mr3140190oie.149.1573141228551; 
 Thu, 07 Nov 2019 07:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-5-david@redhat.com>
In-Reply-To: <20191024120938.11237-5-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 7 Nov 2019 07:40:17 -0800
Message-ID: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
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

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgNToxMiBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBSaWdodCBub3csIFpPTkVfREVWSUNFIG1lbW9yeSBpcyBh
bHdheXMgc2V0IFBHX3Jlc2VydmVkLiBXZSB3YW50IHRvCj4gY2hhbmdlIHRoYXQuCj4KPiBLVk0g
aGFzIHRoaXMgd2VpcmQgdXNlIGNhc2UgdGhhdCB5b3UgY2FuIG1hcCBhbnl0aGluZyBmcm9tIC9k
ZXYvbWVtCj4gaW50byB0aGUgZ3Vlc3QuIHBmbl92YWxpZCgpIGlzIG5vdCBhIHJlbGlhYmxlIGNo
ZWNrIHdoZXRoZXIgdGhlIG1lbW1hcAo+IHdhcyBpbml0aWFsaXplZCBhbmQgY2FuIGJlIHRvdWNo
ZWQuIHBmbl90b19vbmxpbmVfcGFnZSgpIG1ha2VzIHN1cmUKPiB0aGF0IHdlIGhhdmUgYW4gaW5p
dGlhbGl6ZWQgbWVtbWFwIChhbmQgZG9uJ3QgaGF2ZSBaT05FX0RFVklDRSBtZW1vcnkpLgo+Cj4g
UmV3cml0ZSBpc19pbnZhbGlkX3Jlc2VydmVkX3BmbigpIHNpbWlsYXIgdG8ga3ZtX2lzX3Jlc2Vy
dmVkX3BmbigpIHRvIG1ha2UKPiBzdXJlIHRoZSBmdW5jdGlvbiBwcm9kdWNlcyB0aGUgc2FtZSBy
ZXN1bHQgb25jZSB3ZSBzdG9wIHNldHRpbmcgWk9ORV9ERVZJQ0UKPiBwYWdlcyBQR19yZXNlcnZl
ZC4KPgo+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+
IENjOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92Zmlv
L3ZmaW9faW9tbXVfdHlwZTEuYyB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zm
aW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+
IGluZGV4IDJhZGE4ZTZjZGI4OC4uZjhjZThjNDA4YmE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90
eXBlMS5jCj4gQEAgLTI5OSw5ICsyOTksMTUgQEAgc3RhdGljIGludCB2ZmlvX2xvY2tfYWNjdChz
dHJ1Y3QgdmZpb19kbWEgKmRtYSwgbG9uZyBucGFnZSwgYm9vbCBhc3luYykKPiAgICovCj4gIHN0
YXRpYyBib29sIGlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHVuc2lnbmVkIGxvbmcgcGZuKQo+ICB7
Cj4gLSAgICAgICBpZiAocGZuX3ZhbGlkKHBmbikpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBQ
YWdlUmVzZXJ2ZWQocGZuX3RvX3BhZ2UocGZuKSk7Cj4gKyAgICAgICBzdHJ1Y3QgcGFnZSAqcGFn
ZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwoKVWdoLCBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBp
cyBub3QgYSBzYWZlIGNvbnZlcnNpb24gdW50aWwKcGZuX3RvX29ubGluZV9wYWdlKCkgaXMgbW92
ZWQgb3ZlciB0byBzdWJzZWN0aW9uIGdyYW51bGFyaXR5LiBBcyBpdApzdGFuZHMgaXQgd2lsbCBy
ZXR1cm4gdHJ1ZSBmb3IgYW55IFpPTkVfREVWSUNFIHBhZ2VzIHRoYXQgc2hhcmUgYQpzZWN0aW9u
IHdpdGggYm9vdCBtZW1vcnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
