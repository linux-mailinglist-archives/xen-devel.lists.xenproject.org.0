Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1B11B980
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 18:01:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if5L2-00027F-0q; Wed, 11 Dec 2019 16:59:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1if5L0-000277-DK
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:59:46 +0000
X-Inumbo-ID: a1ec7120-1c37-11ea-8ba6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1ec7120-1c37-11ea-8ba6-12813bfff9fa;
 Wed, 11 Dec 2019 16:59:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1F5D5ACD6;
 Wed, 11 Dec 2019 16:59:45 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
 <b2472504-72f0-dd95-a804-1353f1ece6a4@suse.com>
 <458627277d5ced08e8ae12513c81e9c8c897240a.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5550c409-de54-f370-8eca-b88c654ed254@suse.com>
Date: Wed, 11 Dec 2019 18:00:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <458627277d5ced08e8ae12513c81e9c8c897240a.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAxNzozNCwgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0x
Mi0xMSBhdCAxNjoyOSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiArICAgIH0KPj4+ICsK
Pj4+ICsgICAgaWYgKCBsb2NraW5nICkKPj4+ICsgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGly
X2xvY2spOwo+Pj4gKyAgICBpZiAoIChsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNF
TlQpICYmCj4+PiArICAgICAgICAgKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSAp
Cj4+PiArICAgIHsKPj4+ICsgICAgICAgIGwzZV93cml0ZV9hdG9taWMocGwzZSwKPj4+ICsgICAg
ICAgICAgICBsM2VfZnJvbV9wYWRkcigocGFkZHJfdCl2aXJ0X3RvX21hZGRyKGwydCksCj4+PiBf
X1BBR0VfSFlQRVJWSVNPUikpOwo+Pgo+PiBXaHkgdGhlIGNhc3Q/IChJJ20gc29ycnkgaWYgdGhp
cyB3YXMgdGhlcmUgb24gdjMgYWxyZWFkeSBhbmQgSQo+PiBkaWRuJ3Qgc3BvdCBpdC4gQW5kIGlm
IHRoaXMgcmVtYWlucyB0aGUgb25seSB0aGluZyB0byBhZGp1c3QsCj4+IHRoZW4gSSBndWVzcyB0
aGlzIGNvdWxkIGJlIHRha2VuIGNhcmUgb2Ygd2hpbGUgY29tbWl0dGluZy4pCj4gCj4gU2FkbHkg
dGhlcmUgaXMgbm8gbDNlX2Zyb21fbWFkZHIgb3IgdmlydF90b19wYWRkciB0byBjYWxsIGRpcmVj
dGx5LiBPZgo+IGNvdXJzZSwgcGFkZHJfdCBhbmQgbWFkZHIgaGF2ZSB0aGUgc2FtZSB1bmRlcmx5
aW5nIHR5cGUgKHVuc2lnbmVkCj4gbG9uZyksIHNvIGl0IHdvcmtzIHdpdGhvdXQgYSBjYXN0LiBJ
IGp1c3QgYWRkZWQgdGhlIGNhc3QgdG8gbWFrZSBpdAo+IGV4cGxpY2l0IHRoYXQgdGhlc2UgdHdv
IGFyZSBub3QgZXhhY3RseSB0aGUgc2FtZS4KClllcywgdGhlcmUgY29udGludWVzIHRvIGJlIGEg
bmFtaW5nIGRpc2Nvbm5lY3QuIEJ1dCBubywgdGhpcyBpcwpub3QgYSByZWFzb24gdG8gYWRkIGEg
Y2FzdC4gQ2FzdHMgc2hvdWxkIGJlIHVzZWQgYXMgc3BhcmluZ2x5CmFzIHBvc3NpYmxlLCBzaW5j
ZSB0aGV5IHRlbmQgdG8gaGlkZSBwcm9ibGVtcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
