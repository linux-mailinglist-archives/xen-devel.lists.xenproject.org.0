Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E940A152972
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:51:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIF1-0007Mj-2U; Wed, 05 Feb 2020 10:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izIEz-0007MZ-N1
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:49:05 +0000
X-Inumbo-ID: 20204866-4805-11ea-90c6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20204866-4805-11ea-90c6-12813bfff9fa;
 Wed, 05 Feb 2020 10:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3CFE0ACE3;
 Wed,  5 Feb 2020 10:49:03 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
 <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
 <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
 <eff7962d-c6e8-c185-43b6-5c851423cddd@suse.com>
 <59013bb7dbf9b79daa6dd280c4448418aa1fc56b.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df6f5f23-ee65-f289-7dc4-5a42da931bf9@suse.com>
Date: Wed, 5 Feb 2020 11:49:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <59013bb7dbf9b79daa6dd280c4448418aa1fc56b.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMToyNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFdlZCwgMjAy
MC0wMi0wNSBhdCAxMTowMiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiArICAgIC8qIFBh
Z2VzIGZyb20gdGhlIGJvb3QgYWxsb2NhdG9yIG5lZWQgdG8gcGFzcyB0aHJvdWdoIGluaXRfaGVh
cF9wYWdlcygpICovCj4+PiArICAgIGlmICggdW5saWtlbHkoIXBnLT5jb3VudF9pbmZvKSApCj4+
Cj4+IC4uLiB3aGlsZSBJIHRoaW5rIHRoaXMgY2hlY2sgbWF5IGJlIGZpbmUgaGVyZSwgbm8gc2lt
aWxhciBvbmUKPj4gY2FuIGJlIHVzZWQgaW4gZnJlZV9kb21oZWFwX3BhZ2VzKCksIHlldCBwYWdl
cyBnZXR0aW5nIGhhbmRlZAo+PiB0aGVyZSBpc24ndCBsZXNzIGxpa2VseSB0aGFuIG9uZXMgZ2V0
dGluZyBoYW5kZWQgdG8KPj4gZnJlZV94ZW5oZWFwX3BhZ2VzKCkgKGlmIHdlIGFscmVhZHkgZmVh
ciBtaXNtYXRjaCkuCj4gCj4gRG8gd2UgY2FyZSBhYm91dCB0aGF0Pwo+IAo+IElDQlcgYnV0IEkg
ZG9uJ3QgdGhpbmsgSSd2ZSBzZWVuIGEgY2FzZSB3aGVyZSBib290LWFsbG9jYXRlZCBwYWdlcyBn
ZXQKPiBoYW5kZWQgdG8gZnJlZV9kb21oZWFwX3BhZ2VzKCkgbGF0ZXIuIEkndmUgb25seSBzZWVu
IHRoZW0gaGFuZGVkIHRvCj4gZnJlZV94ZW5oZWFwX3BhZ2VzKCkuIFRoZXNlIGFyZSBwYWdlcyB3
aGljaCBhcmUgbWFwcGVkIHRvIFhlbiwgbm90Cj4gZG9taGVhcCBwYWdlcy4KPiAKPiBZb3UgYXJl
IGFscmVhZHkgZXhwZWN0ZWQgKm5vdCogdG8gY29uZmxhdGUgZnJlZV94ZW5oZWFwX3BhZ2VzKCkg
YW5kCj4gZnJlZV9kb21oZWFwX3BhZ2VzKCkuCgpUaGF0J3MgdGhlIGNhc2Ugbm93LCBidXQgd2l0
aCB1cyB3YW50aW5nIHRvIGdldCByaWQgb2YgdGhlIGRpcmVjdCBtYXAsCnRvIHNvbGUgZGlmZmVy
ZW5jZSB3aWxsIGJlIHdoZXRoZXIgYSBtYXBwaW5nIGdldHMgZXN0YWJsaXNoZWQuClRoZXJlJ2xs
IGxpa2VseSBiZSBubyBuZWVkIGZvciBhIFBHQ194ZW5faGVhcCBmbGFnIGFueW1vcmUsIGFzIHdl
CmRvbid0IG5lZWQgdG8gdGVsbCBhcGFydCB0aGUgdW5kZXJseWluZyBwYWdlcyAoYXQgbGVhc3Qg
YXMgZmFyIGFzIHRoZQphbGxvY2F0b3IgaXMgY29uY2VybmVkKS4KCj4gSSB0aGluayBpdCBzaG91
bGQgYmUgT0sgdG8gZGVjbGFyZSB0aGF0IGZyZWVpbmcgYm9vdC1hbGxvY2F0ZWQgcGFnZXMKPiB3
aXRoIGZyZWVfeGVuaGVhcF9wYWdlcygpIGlzIHBlcm1pdHRlZCwgYnV0IGZyZWVpbmcgdGhlbSB3
aXRoCj4gZnJlZV9kb21oZWFwX3BhZ2VzKCkgaXNuJ3QuCgpJIGRvbid0IHRoaW5rIHRoaXMgaXMg
Z29pbmcgdG8gYmUgYSBnb29kIGlkZWEuIGZyZWVfeGVuaGVhcF9wYWdlcygpCnJpZ2h0IG5vdyBl
eHBlY3RzIGFuIGFkZHJlc3Mgd2l0aGluIHRoZSBkaXJlY3QgbWFwIHRvIGJlIHBhc3NlZC4KYWxs
b2NfYm9vdF9wYWdlcygpLCBob3dldmVyLCByZXR1cm5zIGFuIE1GTiwgd2hpY2ggbWF5IGdldCBt
YXBwZWQKdG8gYXJiaXRyYXJ5IGxpbmVhciBhZGRyZXNzZXMgKG9yIG5vbmUgYXQgYWxsKS4gVGhl
cmUncyBxdWl0ZSBhIGJpdAptb3JlIHNpbWlsYXJpdHkgdG8gYWxsb2NfZG9taGVhcF9wYWdlcygp
LCBhcyB0aGF0IHJldHVybnMKc3RydWN0IHBhZ2VfaW5mbyAqLCB3aGljaCBpbiB0dXJuIGhhcyBh
IHJlbGlhYmxlIHRyYW5zbGF0aW9uCnRvL2Zyb20gTUZOLiBZZXQsIGFzIHlvdSBzYXkgZWxzZXdo
ZXJlLCB3aGV0aGVyIGFuIE1GTiBoYXMgYW4KZW50cnkgaW4gZnJhbWVfdGFibGVbXSBpcyBlbnRp
cmVseSB1bmNsZWFyLCBzbyBwZXJtaXR0aW5nIGJvb3QtCmFsbG9jYXRvciBwYWdlcyB0byBiZSBm
cmVlZCB2aWEgYWxsb2NfZG9taGVhcF9wYWdlcygpIG5ldmVydGhlbGVzcwpzdGlsbCBkb2Vzbid0
IGxvb2sgYW55IGJldHRlciBhbiBpZGVhIHRvIG1lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
