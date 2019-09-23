Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683EBAFFA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 10:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCK0w-0007cK-6G; Mon, 23 Sep 2019 08:48:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UAjl=XS=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1iCK0v-0007cF-1Y
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 08:48:09 +0000
X-Inumbo-ID: dcc7bce2-ddde-11e9-95f6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcc7bce2-ddde-11e9-95f6-12813bfff9fa;
 Mon, 23 Sep 2019 08:48:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D2A4AAB2;
 Mon, 23 Sep 2019 08:48:06 +0000 (UTC)
To: Ben Hutchings <ben@decadent.org.uk>, stable@vger.kernel.org
References: <20190802160614.8089-1-vbabka@suse.cz>
 <d3bb280b405d6acf0bc4176d63639201ff62853f.camel@decadent.org.uk>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <78bbba27-81ed-40db-eb6e-5add997b2027@suse.cz>
Date: Mon, 23 Sep 2019 10:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d3bb280b405d6acf0bc4176d63639201ff62853f.camel@decadent.org.uk>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH STABLE 4.9] x86, mm,
 gup: prevent get_page() race with munmap in paravirt guest
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
Cc: Juergen Gross <jgross@suse.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xOS8xOSA4OjI2IFBNLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0w
OC0xOSBhdCAxODo1OCArMDEwMCwgVmxhc3RpbWlsIEJhYmthIHdyb3RlOgo+IFsuLi5dCj4+IEhp
LCBJJ20gc2VuZGluZyB0aGlzIHN0YWJsZS1vbmx5IHBhdGNoIGZvciBjb25zaWRlcmF0aW9uIGJl
Y2F1c2UgaXQncyBwcm9iYWJseQo+PiB1bnJlYWxpc3RpYyB0byBiYWNrcG9ydCB0aGUgNC4xMyBz
d2l0Y2ggdG8gZ2VuZXJpYyBHVVAuIEkgY2FuIGxvb2sgYXQgNC40IGFuZAo+PiAzLjE2IGlmIGFj
Y2VwdGVkLiBUaGUgUkNVIHBhZ2UgdGFibGUgZnJlZWluZyBjb3VsZCBiZSBhbHNvIGNvbnNpZGVy
ZWQuCj4gCj4gSSB3b3VsZCBiZSBpbnRlcmVzdGVkIGluIGJhY2twb3J0cyBmb3IgMy4xNiBhbmQg
NC40Lgo+IAo+PiBOb3RlIHRoZSBwYXRjaCBhbHNvIGluY2x1ZGVzIHBhZ2UgcmVmY291bnQgcHJv
dGVjdGlvbi4gSSBmb3VuZCBvdXQgdGhhdAo+PiA4ZmRlMTJjYTc5YWYgKCJtbTogcHJldmVudCBn
ZXRfdXNlcl9wYWdlcygpIGZyb20gb3ZlcmZsb3dpbmcgcGFnZSByZWZjb3VudCIpCj4+IGJhY2tw
b3J0IHRvIDQuOSBtaXNzZWQgdGhlIGFyY2gtc3BlY2lmaWMgZ3VwIGltcGxlbWVudGF0aW9uczoK
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82NjUwMzIzZi1kYmM5LWYwNjktMDAwYi1m
NmIwZjk0MWEwNjVAc3VzZS5jei8KPiBbLi4uXQo+IAo+IEkgc3VwcG9zZSB0aGF0IHN0aWxsIG5l
ZWRzIHRvIGJlIGFkZHJlc3NlZCBmb3IgNC45LCByaWdodD8KClllYWgsIEknbGwgdGFrZSBhIGxv
b2ssIHRoYW5rcyBmb3IgcmVtaW5kaW5nLgoKPiBCZW4uCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
