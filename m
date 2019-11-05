Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A309F0A36
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 00:32:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8H8-00015L-UV; Tue, 05 Nov 2019 23:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qREJ=Y5=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1iS8H7-00015G-VP
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:30:13 +0000
X-Inumbo-ID: 36038e96-0024-11ea-9631-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36038e96-0024-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 23:30:11 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id v24so13938781otp.5
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 15:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3DmgtbuDvl/nfkrniY8Ba73gr9pACG77rpNCqLOyTA=;
 b=ax5HR98WH4xqZvWHcyzuHRNGmZvT7I9m7xhGJ1uY8PDybcgBe1VmfyCLXrE48zy0BX
 vWcIHu6UYoH8HknqTIdU6Y+LYlECfapFpwLBsIAucTcvwTRYHtKiZpX6HfdTzXXEPEnk
 HWjqS+gQejFktk2XITcuM0n+yeF5sQPBkc+kK/6meBz8x9VvLBJ24hrRrJof+Z2QZCIS
 ZvRSXKB24+uJoWcJtAJmQHL6SW1XP2EN8QixZwZsl13dmEYE2GJMvXzgHqy355aGvDQ3
 F0zrp/0LqNIWlZiKW6TlpU1rB2bmBt1brju1GqeiJ5NinFlVYYEE2UC84COw1zeJ61L+
 MXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3DmgtbuDvl/nfkrniY8Ba73gr9pACG77rpNCqLOyTA=;
 b=tJYTdVQ7rfzHGPT6QeSHKfZrqVX6BHwaBJiScLbHp17VHr9W7Jrs/xrF0GW6Kd4aWo
 MOysiLTZpI1f8sE22kxiSvii0xtxKQsSEIGqnKjVnZRh3QTLTT07lbF0PRPAtDOAyXbz
 XI4ZuwYBRHBqbZPZU1Ynziv7Z3/sFj28I+bAORrmXewrHkP9Dq3STdO90v7Tq0FSFDcQ
 TqJltboJF+aU3KIZqUpGxGlbkgqoD+9OE6NvLkzoexuDZgA8gXGJhP7Gh5fo0eBynO39
 EiC7ZNEE9vm/qZTBYIomXeXMWtYPh+N4+PiQgCatzqJ4H5hmLz/ePIkgFi8gXzJfmgf1
 WKSw==
X-Gm-Message-State: APjAAAUBs3ep9847EjHXO5j3OmOqE1Mg5UkB2r9rQE9OYAF6IXVRKLpK
 nhuQt4ys46UPl437nmH45Z1ZUJCaC6u/SHsMQzPHMA==
X-Google-Smtp-Source: APXvYqyxc+DmPQQN5aSk0dtRzKoWLg9GygXu/1AciWksnhJhFNdAydFP0T3vz9JQ5vwewxa4ElAmJqPI0FG8eQ5kblQ=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24157383oti.207.1572996611041; 
 Tue, 05 Nov 2019 15:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
In-Reply-To: <20191105231316.GE23297@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:30:00 -0800
Message-ID: <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [Xen-devel] [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn()
 for PG_reserved changes
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
 KVM list <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
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
 Mel Gorman <mgorman@techsingularity.net>, Adam Borowski <kilobyte@angband.pl>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAzOjEzIFBNIFNlYW4gQ2hyaXN0b3BoZXJzb24KPHNlYW4u
ai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMDUsIDIw
MTkgYXQgMDM6MDI6NDBQTSAtMDgwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVHVlLCBO
b3YgNSwgMjAxOSBhdCAxMjozMSBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gPiA+ID4gVGhlIHNjYXJpZXIgY29kZSAoZm9yIG1lKSBpcyB0cmFuc3BhcmVu
dF9odWdlcGFnZV9hZGp1c3QoKSBhbmQKPiA+ID4gPiBrdm1fbW11X3phcF9jb2xsYXBzaWJsZV9z
cHRlKCksIGFzIEkgZG9uJ3QgYXQgYWxsIHVuZGVyc3RhbmQgdGhlCj4gPiA+ID4gaW50ZXJhY3Rp
b24gYmV0d2VlbiBUSFAgYW5kIF9QQUdFX0RFVk1BUC4KPiA+ID4KPiA+ID4gVGhlIHg4NiBLVk0g
TU1VIGNvZGUgaXMgb25lIG9mIHRoZSB1Z2xpZXN0IGNvZGUgSSBrbm93IChzb3JyeSwgYnV0IGl0
Cj4gPiA+IGhhZCB0byBiZSBzYWlkIDovICkuIEx1Y2tpbHksIHRoaXMgc2hvdWxkIGJlIGluZGVw
ZW5kZW50IG9mIHRoZQo+ID4gPiBQR19yZXNlcnZlZCB0aGluZ3kgQUZBSUtzLgo+ID4KPiA+IEJv
dGggdHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkgYW5kIGt2bV9tbXVfemFwX2NvbGxhcHNp
YmxlX3NwdGUoKQo+ID4gYXJlIGhvbm9yaW5nIGt2bV9pc19yZXNlcnZlZF9wZm4oKSwgc28gYWdh
aW4gSSdtIG1pc3Npbmcgd2hlcmUgdGhlCj4gPiBwYWdlIGNvdW50IGdldHMgbWlzbWFuYWdlZCBh
bmQgbGVhZHMgdG8gdGhlIHJlcG9ydGVkIGhhbmcuCj4KPiBXaGVuIG1hcHBpbmcgcGFnZXMgaW50
byB0aGUgZ3Vlc3QsIEtWTSBnZXRzIHRoZSBwYWdlIHZpYSBndXAoKSwgd2hpY2gKPiBpbmNyZW1l
bnRzIHRoZSBwYWdlIGNvdW50IGZvciBaT05FX0RFVklDRSBwYWdlcy4gIEJ1dCBLVk0gcHV0cyB0
aGUgcGFnZQo+IHVzaW5nIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpLCB3aGljaCBza2lwcyBwdXRf
cGFnZSgpIGlmIFBhZ2VSZXNlcnZlZCgpCj4gYW5kIHNvIG5ldmVyIHB1dHMgaXRzIHJlZmVyZW5j
ZSB0byBaT05FX0RFVklDRSBwYWdlcy4KCk9oLCB5ZWFoLCB0aGF0J3MgYnVzdGVkLgoKPiBNeSB0
cmFuc3BhcmVudF9odWdlcGFnZV9hZGp1c3QoKSBhbmQga3ZtX21tdV96YXBfY29sbGFwc2libGVf
c3B0ZSgpCj4gY29tbWVudHMgd2VyZSBmb3IgYSBwb3N0LXBhdGNoL3NlcmllcyBzY2VuYXJpbyB3
aGVyZW4gUGFnZVJlc2VydmVkKCkgaXMKPiBubyBsb25nZXIgdHJ1ZSBmb3IgWk9ORV9ERVZJQ0Ug
cGFnZXMuCgpBaCwgb2ssIGZvciB0aGF0IERhdmlkIGlzIHByZXNlcnZpbmcga3ZtX2lzX3Jlc2Vy
dmVkX3BmbigpIHJldHVybmluZwp0cnVlIGZvciBaT05FX0RFVklDRSBiZWNhdXNlIHBmbl90b19v
bmxpbmVfcGFnZSgpIHdpbGwgZmFpbCBmb3IKWk9ORV9ERVZJQ0UuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
