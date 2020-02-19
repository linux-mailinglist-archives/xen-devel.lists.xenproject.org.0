Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3F1645E4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:45:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Pd0-0008HR-Dz; Wed, 19 Feb 2020 13:43:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Pcy-0008HM-DN
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:43:00 +0000
X-Inumbo-ID: bdd73772-531d-11ea-8366-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd73772-531d-11ea-8366-12813bfff9fa;
 Wed, 19 Feb 2020 13:42:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C62B9B214;
 Wed, 19 Feb 2020 13:42:58 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <d1ab3bc4-5b9e-25c7-130d-c64e91f7705c@suse.com>
 <20200219131908.GA4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80960f9e-790d-cd3e-aa99-b45c585a6f8a@suse.com>
Date: Wed, 19 Feb 2020 14:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219131908.GA4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxNDoxOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCAwMTo1NjowMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gIHZvaWQgX19pbml0
IHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQo+Pj4gIHsK
Pj4+IC0gICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKSApCj4+PiAr
ICAgIGlmICggIXdyaXRlX3RyeWxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2spICkKPj4+ICAgICAg
ICAgIEJVRygpOyAvKiBTaG91bGQgbmV2ZXIgZmFpbCBhcyB3ZSBhcmUgY2FsbGVkIG9ubHkgZHVy
aW5nIGJvb3QuICovCj4+PiAgICAgIG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCZjcHVfY2hhaW4s
IG5iKTsKPj4+IC0gICAgc3Bpbl91bmxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2spOwo+Pj4gKyAg
ICB3cml0ZV91bmxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2spOwo+Pj4gIH0KPj4KPj4gU28gd2h5
IGEgd3JpdGUgbG9jayBoZXJlPwo+IAo+IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyIGNhbGxzIGNh
bm5vdCBiZSBtYWRlIGluIHBhcmFsbGVsLCBhcyB0aGV5Cj4gbW9kaWZ5IHRoZSB1bmRlcmx5aW5n
IG5vdGlmaWVyIGxpc3Qgd2l0aG91dCB0YWtpbmcgYW55IGFkZGl0aW9uYWwKPiBsb2Nrcy4KCkku
ZS4gdGhlIGxvY2sgaXMgYmVpbmcgKGFiKXVzZWQgdG8gYWxzbyBwcm90ZWN0IHRoZSBub3RpZmll
ciBsaXN0LAp3aGljaCBpcyBjZXJ0YWlubHkgbm90IGl0cyBwdXJwb3NlLiAoVGhlIGxvY2tpbmcg
c2VlbXMgcXVpdGUKcG9pbnRsZXNzIGhlcmUgYW55d2F5IGNvbnNpZGVyaW5nIHRoZSBfX2luaXQg
dG9nZXRoZXIgd2l0aCB0aGUKbmF0dXJlIG9mIHRoZSBmdW5jdGlvbi4pCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
