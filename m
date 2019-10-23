Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DCCE2098
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJSN-0005Bn-O5; Wed, 23 Oct 2019 16:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ppmg=YQ=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1iNJSL-0005Bc-VH
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:25:54 +0000
X-Inumbo-ID: c835098e-f5b1-11e9-bbab-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c835098e-f5b1-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 16:25:53 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r1so12429279pgj.12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ozmEBacDU37qdWHmaIXZS/t2e/cIQTfwOrpKCFE/tE=;
 b=bCC1XEBzNQHigL0d7R6bPEzxm8alb+W4dTu8itjDoIuQnpvCdh21/KVzmfE+Tgs+ET
 ceWRH1QFAtQCwVmj0wWuvh6QCkQaRgwgCLBTlsOklkfp9LViU9s8B80hK7K0MoC/AGMW
 ZF1fsM40mC3fIPu5YTFXe03NoKjMsALdc4tX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ozmEBacDU37qdWHmaIXZS/t2e/cIQTfwOrpKCFE/tE=;
 b=I2Vgt5kik6MuYQGced+gEN+C+NRRJMBRHYbBwnQ++L+0nDRJ66H+QEA1/Z7vIry8OL
 jLwH9xe1gXEHd9q26HzZKMubqF52Ap+DJkOcUP7FZTyxxzIDIcxY5ALprcb1bmLS+zTs
 K3cvFSAmeu25rT9s6tpwK8ToX5lb8yGTxotBkUim66/Z7bW7jwmAtGOtneU4atnTk3d1
 Cct6ouWmKJTIWdRi+rR/lGj6sCoFG1fhdLhWLFLFdc0H9K7+rwqOxAsvBJNNQF9l0mDp
 PCxvcdVp3aVxDJL9FSFCKeck3lg7TyQcfl1WU43tNoimMS8kXhDN4PGkdK2d1dvfXjKa
 ZpSg==
X-Gm-Message-State: APjAAAWjtGXZdUutbXyZPjAa7ckKPXoynNGtm77N8lLTpDhJrJtVNX2c
 2WzdTnrygDrM/DYEMu0KCmUZ6Q==
X-Google-Smtp-Source: APXvYqw1/SgWscVWVYwNzvC56vf/67s2dhZn0DnFv2vyro2EnV66Rhc87hJA64tPAho0TcM73pujSw==
X-Received: by 2002:a63:1042:: with SMTP id 2mr11383658pgq.59.1571847952291;
 Wed, 23 Oct 2019 09:25:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y8sm27285047pgs.34.2019.10.23.09.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 09:25:51 -0700 (PDT)
Date: Wed, 23 Oct 2019 09:25:49 -0700
From: Kees Cook <keescook@chromium.org>
To: David Hildenbrand <david@redhat.com>
Message-ID: <201910230924.DE879ED80F@keescook>
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-3-david@redhat.com>
 <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8313fb1-50f3-9083-fd07-297ddf86658e@redhat.com>
Subject: Re: [Xen-devel] [PATCH RFC v1 02/12] mm/usercopy.c: Prepare
 check_page_span() for PG_reserved changes
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
 Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
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
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Simon =?iso-8859-1?Q?Sandstr=F6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>, Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6MjA6MTRBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMjIuMTAuMTkgMTk6MTIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+
ID4gUmlnaHQgbm93LCBaT05FX0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZl
ZC4gV2Ugd2FudCB0bwo+ID4gY2hhbmdlIHRoYXQuCj4gPiAKPiA+IExldCdzIG1ha2Ugc3VyZSB0
aGF0IHRoZSBsb2dpYyBpbiB0aGUgZnVuY3Rpb24gd29uJ3QgY2hhbmdlLiBPbmNlIHdlIG5vCj4g
PiBsb25nZXIgc2V0IHRoZXNlIHBhZ2VzIHRvIHJlc2VydmVkLCB3ZSBjYW4gcmV3b3JrIHRoaXMg
ZnVuY3Rpb24gdG8KPiA+IHBlcmZvcm0gc2VwYXJhdGUgY2hlY2tzIGZvciBaT05FX0RFVklDRSAo
c3BsaXQgZnJvbSBQR19yZXNlcnZlZCBjaGVja3MpLgo+ID4gCj4gPiBDYzogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPiA+IENjOiBLYXRlIFN0ZXdhcnQgPGtzdGV3YXJ0QGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gPiBDYzogQWxsaXNvbiBSYW5kYWwgPGFsbGlzb25AbG9odXRvay5uZXQ+Cj4g
PiBDYzogIklzYWFjIEouIE1hbmphcnJlcyIgPGlzYWFjbUBjb2RlYXVyb3JhLm9yZz4KPiA+IENj
OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiA+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIG1tL3VzZXJjb3B5LmMgfCA1ICsrKy0tCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9tbS91c2VyY29weS5jIGIvbW0vdXNlcmNvcHkuYwo+ID4gaW5kZXggNjYwNzE3
YTFlYTVjLi5hM2FjNGJlMzVjZGUgMTAwNjQ0Cj4gPiAtLS0gYS9tbS91c2VyY29weS5jCj4gPiAr
KysgYi9tbS91c2VyY29weS5jCj4gPiBAQCAtMjAzLDE0ICsyMDMsMTUgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGNoZWNrX3BhZ2Vfc3Bhbihjb25zdCB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgbiwK
PiA+ICAgCSAqIGRldmljZSBtZW1vcnkpLCBvciBDTUEuIE90aGVyd2lzZSwgcmVqZWN0IHNpbmNl
IHRoZSBvYmplY3Qgc3BhbnMKPiA+ICAgCSAqIHNldmVyYWwgaW5kZXBlbmRlbnRseSBhbGxvY2F0
ZWQgcGFnZXMuCj4gPiAgIAkgKi8KPiA+IC0JaXNfcmVzZXJ2ZWQgPSBQYWdlUmVzZXJ2ZWQocGFn
ZSk7Cj4gPiArCWlzX3Jlc2VydmVkID0gUGFnZVJlc2VydmVkKHBhZ2UpIHx8IGlzX3pvbmVfZGV2
aWNlX3BhZ2UocGFnZSk7Cj4gPiAgIAlpc19jbWEgPSBpc19taWdyYXRlX2NtYV9wYWdlKHBhZ2Up
Owo+ID4gICAJaWYgKCFpc19yZXNlcnZlZCAmJiAhaXNfY21hKQo+ID4gICAJCXVzZXJjb3B5X2Fi
b3J0KCJzcGFucyBtdWx0aXBsZSBwYWdlcyIsIE5VTEwsIHRvX3VzZXIsIDAsIG4pOwo+ID4gICAJ
Zm9yIChwdHIgKz0gUEFHRV9TSVpFOyBwdHIgPD0gZW5kOyBwdHIgKz0gUEFHRV9TSVpFKSB7Cj4g
PiAgIAkJcGFnZSA9IHZpcnRfdG9faGVhZF9wYWdlKHB0cik7Cj4gPiAtCQlpZiAoaXNfcmVzZXJ2
ZWQgJiYgIVBhZ2VSZXNlcnZlZChwYWdlKSkKPiA+ICsJCWlmIChpc19yZXNlcnZlZCAmJiAhKFBh
Z2VSZXNlcnZlZChwYWdlKSB8fAo+ID4gKwkJCQkgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFn
ZSkpKQo+ID4gICAJCQl1c2VyY29weV9hYm9ydCgic3BhbnMgUmVzZXJ2ZWQgYW5kIG5vbi1SZXNl
cnZlZCBwYWdlcyIsCj4gPiAgIAkJCQkgICAgICAgTlVMTCwgdG9fdXNlciwgMCwgbik7Cj4gPiAg
IAkJaWYgKGlzX2NtYSAmJiAhaXNfbWlncmF0ZV9jbWFfcGFnZShwYWdlKSkKPiA+IAo+IAo+IEBL
ZWVzLCB3b3VsZCBpdCBiZSBva2F5IHRvIHN0b3AgY2hlY2tpbmcgYWdhaW5zdCBaT05FX0RFVklD
RSBwYWdlcyBoZXJlIG9yCj4gaXMgdGhlcmUgYSBnb29kIHJhdGlvbmFsZSBiZWhpbmQgdGhpcz8K
PiAKPiAoSSB3b3VsZCB0dXJuIHRoaXMgcGF0Y2ggaW50byBhIHNpbXBsZSB1cGRhdGUgb2YgdGhl
IGNvbW1lbnQgaWYgd2UgYWdyZWUKPiB0aGF0IHdlIGRvbid0IGNhcmUpCgpUaGVyZSBoYXMgYmVl
biB3b3JrIHRvIGFjdHVhbGx5IHJlbW92ZSB0aGUgcGFnZSBzcGFuIGNoZWNrcyBlbnRpcmVseSwK
YnV0IHRoZXJlIHdhc24ndCBjb25zZW5zdXMgb24gd2hhdCB0aGUgcmlnaHQgd2F5IGZvcndhcmQg
d2FzLiBJIGNvbnRpbnVlCnRvIGxlYW5pbmcgdG93YXJkIGp1c3QgZHJvcHBpbmcgaXQgZW50aXJl
bHksIGJ1dCBNYXR0aGV3IFdpbGNveCBoYXMgc29tZQphbHRlcm5hdGl2ZSBpZGVhcyB0aGF0IGNv
dWxkIHVzZSBzb21lIGZ1cnRoZXIgdGhvdWdodC90ZXN0aW5nLgoKLS0gCktlZXMgQ29vawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
