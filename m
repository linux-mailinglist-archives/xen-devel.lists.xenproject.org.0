Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C707A127F2D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:21:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiK22-0003OT-PW; Fri, 20 Dec 2019 15:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiK21-0003OO-P8
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 15:17:33 +0000
X-Inumbo-ID: d38204d8-233b-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d38204d8-233b-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 15:17:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2507DABC4;
 Fri, 20 Dec 2019 15:17:24 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <493b2077-7075-65c7-4eac-a995a722dfec@suse.com>
Date: Fri, 20 Dec 2019 16:17:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204162025.37510-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/smp: check APIC ID on AP bringup
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENoZWNrIHRoYXQg
dGhlIHByb2Nlc3NvciB0byBiZSB3b2tlbiB1cCBBUElDIElEIGlzIGFkZHJlc3NhYmxlIGluIHRo
ZQo+IGN1cnJlbnQgQVBJQyBtb2RlLgo+IAo+IE5vdGUgdGhhdCBpbiBwcmFjdGljZSBzeXN0ZW1z
IHdpdGggQVBJQyBJRHMgPiAyNTUgc2hvdWxkIGFscmVhZHkgaGF2ZQo+IHgyQVBJQyBlbmFibGVk
IGJ5IHRoZSBmaXJtd2FyZSwgYW5kIGhlbmNlIHRoaXMgaXMgbW9zdGx5IGEgc2FmZXR5Cj4gYmVs
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIFJld29yZCBlcnJvciBtZXNzYWdl
Lgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Nt
cGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiBpbmRleCBmYTY5MWI2YmEwLi44Y2Ji
NzE3M2E0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiArKysgYi94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCj4gQEAgLTEzMTcsNiArMTMxNywxMyBAQCBpbnQgX19jcHVfdXAo
dW5zaWduZWQgaW50IGNwdSkKPiAgICAgIGlmICggKGFwaWNpZCA9IHg4Nl9jcHVfdG9fYXBpY2lk
W2NwdV0pID09IEJBRF9BUElDSUQgKQo+ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICAKPiAr
ICAgIGlmICggKCF4MmFwaWNfZW5hYmxlZCB8fCAhaW9tbXVfaW50cmVtYXApICYmIChhcGljaWQg
Pj4gOCkgKQoKQnR3LCBJJ2xsIGNoYW5nZSB0aGUgcmlnaHQgc2lkZSB0byAiYXBpY2lkID49IDB4
ZmYiLCBhcyB0aGF0IElEIGlzCnNwZWNpYWwuIE9yIHBlcmhhcHMgdGhpcyBzaG91bGQgcmVhbGx5
IGJlCgogICAgaWYgKCAoIXgyYXBpY19lbmFibGVkICYmIGFwaWNpZCA+PSBBUElDX0FMTF9DUFVT
KSB8fAogICAgICAgICAoIWlvbW11X2ludHJlbWFwICYmIChhcGljaWQgPj4gOCkpICkKClRob3Vn
aHRzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
