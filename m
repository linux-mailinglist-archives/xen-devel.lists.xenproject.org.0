Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55F113E31
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:38:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnVs-0000df-Ak; Thu, 05 Dec 2019 09:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnVq-0000dZ-Ua
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:33:30 +0000
X-Inumbo-ID: 4bd24d4a-1742-11ea-99dd-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bd24d4a-1742-11ea-99dd-bc764e2007e4;
 Thu, 05 Dec 2019 09:33:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 51645AEC6;
 Thu,  5 Dec 2019 09:33:29 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02ce4cc5-6da9-3383-df9e-39890f622177@suse.com>
Date: Thu, 5 Dec 2019 10:33:44 +0100
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
LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGgg
Li4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiArKysgYi94ZW4vYXJjaC94ODYv
c21wYm9vdC5jCj4gQEAgLTEzMTcsNiArMTMxNywxMyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQg
aW50IGNwdSkKPiAgICAgIGlmICggKGFwaWNpZCA9IHg4Nl9jcHVfdG9fYXBpY2lkW2NwdV0pID09
IEJBRF9BUElDSUQgKQo+ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICAKPiArICAgIGlmICgg
KCF4MmFwaWNfZW5hYmxlZCB8fCAhaW9tbXVfaW50cmVtYXApICYmIChhcGljaWQgPj4gOCkgKQo+
ICsgICAgewo+ICsgICAgICAgIHByaW50aygiVW5zdXBwb3J0ZWQ6IEFQSUMgSUQgJSN4IGluIHhB
UElDIG1vZGUgdy9vIGludGVycnVwdCByZW1hcHBpbmciLAo+ICsgICAgICAgICAgICAgICBhcGlj
aWQpOwoKLi4uIHRoZSBsb3N0IG5ld2xpbmUgYWRkZWQgYmFjayAoY2FuIGJlIGRvbmUgd2hpbGUg
Y29tbWl0aW5nKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
