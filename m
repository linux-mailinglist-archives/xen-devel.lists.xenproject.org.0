Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A8116DE1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:25:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieIzP-00022w-Km; Mon, 09 Dec 2019 13:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieIzN-00022r-KU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:22:13 +0000
X-Inumbo-ID: e8df0492-1a86-11ea-87cd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8df0492-1a86-11ea-87cd-12813bfff9fa;
 Mon, 09 Dec 2019 13:22:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC8BBB1B8;
 Mon,  9 Dec 2019 13:22:11 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
 <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aaa3dcb9-8022-c169-ec9e-bb5d3cbdde01@suse.com>
Date: Mon, 9 Dec 2019 14:22:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTIuMjAxOSAxOToyMCwgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0x
Mi0wNiBhdCAxNzo1MCArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMTIvMjAx
OSAxNTo1MywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+PiArLyogU2hhdHRlciBhbiBsMyBlbnRyeSBh
bmQgcG9wdWxhdGUgbDIuIElmIHZpcnQgaXMgcGFzc2VkIGluLCBhbHNvCj4+PiBkbyBmbHVzaC4g
Ki8KPj4+ICtzdGF0aWMgdm9pZCBzaGF0dGVyX2wzZShsM19wZ2VudHJ5X3QgKnBsM2UsIGwyX3Bn
ZW50cnlfdCAqbDJ0LAo+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tp
bmcpCj4+PiArewo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPj4+ICsgICAgbDNfcGdlbnRyeV90
IG9sM2UgPSAqcGwzZTsKPj4+ICsKPj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFC
TEVfRU5UUklFUzsgaSsrICkKPj4+ICsgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgIGwyZV9mcm9tX3BmbihsM2VfZ2V0X3BmbihvbDNlKSArCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpIDw8IFBBR0VUQUJMRV9PUkRFUiksCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGwzZV9nZXRfZmxhZ3Mob2wzZSkpKTsKPj4K
Pj4gVGhlIFBURSBtYWNyb3MgYXJlIGVzcGVjaWFsbHkgcG9vciBmb3IgZ2VuZXJhdGVkIGFzbSwg
YW5kIGluIGNhc2VzCj4+IGxpa2UKPj4gdGhpcywgSSdkIGxpa2UgdG8gaW1wcm92ZSB0aGluZ3Mu
Cj4+Cj4+IEluIHBhcnRpY3VsYXIsIEkgYmVsaWV2ZSB0aGUgZm9sbG93aW5nIGNvZGUgaGFzIGlk
ZW50aWNhbCBiZWhhdmlvdXI6Cj4+Cj4+IGwyX3BnZW50cnlfdCBubDJlID0gbDJlX2Zyb21faW50
cHRlKGwzZV9nZXRfaW50cHRlKG9sM2UpKTsKPj4KPj4gZm9yICggaSA9IDA7IGkgPCBMMl9QQUdF
VEFCTEVfRU5UUklFUzsgaSsrLCBubDJlLmwyICs9Cj4+IFBBR0VUQUJMRV9PUkRFUiApCj4+ICAg
ICBsMmVfd3JpdGUobDJ0ICsgaSwgbmwyZSk7Cj4+Cj4+IChhbHRob3VnaCBzb21lb25lIHBsZWFz
ZSBkb3VibGUgY2hlY2sgbXkgbG9naWMpIGFuZCByYXRoZXIgYmV0dGVyIGFzbQo+PiBnZW5lcmF0
aW9uLiAgKEkgYWxzbyBleHBlY3QgdGhlcmUgdG8gYmUgc29tZSBkaXNjdXNzaW9uIG9uIHdoZXRo
ZXIKPj4gdXNpbmcKPj4gbjJsZS5sMiBkaXJlY3RseSBpcyBzb21ldGhpbmcgd2UnZCB3YW50IHRv
IHN0YXJ0IGRvaW5nLikKPj4KPiAKPiBJIGJlbGlldmUgaXQgc2hvdWxkIGJlIG5sMmUubDIgKz0g
MTw8KFBBR0VUQUJMRV9PUkRFUitQQUdFX1NISUZUKSA/CgpJbmRlZWQuCgo+IEFsdGhvdWdoIHRo
ZSBjb2RlIHJhcmVseSB0b3VjaGVzIHRoZSBmaWVsZCAoLmwyKSBkaXJlY3RseSwgc28gbWF5YmUg
dXNlCj4gdGhlIG1hY3JvcyAoZ2V0X2ludHB0ZSAtPiBhZGQgLT4gZnJvbV9pbnRwdGUpIGZvciBj
b25zaXN0ZW5jeT8gVGhleQo+IHNob3VsZCBwcm9kdWNlIHRoZSBzYW1lIGNvZGUgaWYgdGhlIGNv
bXBpbGVyIGlzIG5vdCB0b28gc3R1cGlkLgoKSSB0aGluayB0aGUgdG8vZnJvbSBpbnRwdGUgdHJh
bnNmb3JtYXRpb25zIHNob3VsZCBiZSB1c2VkIHNwYXJpbmdseQp0b28gKGFzIGJlaW5nIGRhbmdl
cm91cykuIEhvdyBhYm91dCB3ZSBtYWtlIFBURXMgcHJvcGVyIHVuaW9ucywgd2l0aAphIGZ1bGwt
ZmllbGQgaW50cHRlX3QgYXMgd2UgaGF2ZSBpdCBub3cgY29tYmluZWQgd2l0aCBhIHNldCBvZiBi
aXQKZmllbGRzPyBUaGlzIHdvdWxkIGF0IGxlYXN0IGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgdXNp
bmcgUEFHRV9TSElGVAppbiBjb25zdHJ1Y3RzIGxpa2UgdGhlIGFib3ZlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
