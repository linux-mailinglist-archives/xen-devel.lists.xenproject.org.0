Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF2897EA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 09:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx4p2-00025u-7e; Mon, 12 Aug 2019 07:32:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hx4p0-00025p-Jx
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 07:32:50 +0000
X-Inumbo-ID: 6280ee13-bcd3-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6280ee13-bcd3-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 07:32:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87E07AF11;
 Mon, 12 Aug 2019 07:32:48 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
Message-ID: <3b2ad6fb-d39f-e5b5-b35a-fc4ebfc695f3@suse.com>
Date: Mon, 12 Aug 2019 09:32:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUgaXMgcGxlbnR5
IG1vcmUgY2xlYW51cCB3aGljaCBjYW4gYmUgZG9uZSBpbiB0aGUgZnV0dXJlLsKgIEFzIHdlIGFy
ZQo+IDY0LWJpdCwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgbG9hZF9UUigpIHRvIGtlZXAgdGhlIFRT
UyBpbiBzeW5jIGJldHdlZW4gdGhlIHR3bwo+IEdEVHMsIHdoaWNoIG1lYW5zIGl0IGNhbiBkcm9w
IGFsbCBzZ2R0L2xnZHQgaW5zdHJ1Y3Rpb25zLgoKSSdtIHRyeWluZyB0byBmaWd1cmUgd2hhdCBl
eGFjdGx5IHlvdSBtZWFuIGhlcmUuIEFyZSB5b3Ugc3VnZ2VzdGluZwp3ZSBydW4gd2l0aCBhIFRT
UyBzZWxlY3RvciBsb2FkZWQgd2hvc2UgZGVzY3JpcHRvcidzIGJ1c3kgYml0IGlzCmNsZWFyPyBJ
IGFncmVlIHRoaXMgc2hvdWxkbid0IGNhdXNlIGlzc3VlcyBpbiB0aGUgNjQtYml0IHdvcmxkLCBi
dXQKaXQgd291bGQgc3RpbGwgbm90IGZlZWwgcmlnaHQuIFF1ZXN0aW9uIGlzIHdoeSB0aGV5J3Zl
IHJldGFpbmVkIHRoZQphdmFpbC9idXN5IGRpc3RpbmN0aW9uIGluIHRoZSBmaXJzdCBwbGFjZS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
