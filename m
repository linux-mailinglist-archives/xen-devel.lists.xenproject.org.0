Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88812F92C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:26:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNsh-0003Gf-ST; Fri, 03 Jan 2020 14:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inNsg-0003GX-Sf
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:24:50 +0000
X-Inumbo-ID: c7f97e4e-2e34-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7f97e4e-2e34-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 14:24:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35222ABD0;
 Fri,  3 Jan 2020 14:24:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a954c0a2-7ef0-4cf8-2a67-3972e7368d7e@suse.com>
Date: Fri, 3 Jan 2020 15:25:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217201550.15864-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
 Wei Liu <wl@xen.org>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAyMToxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS90b29scy9s
aWJ4Yy9pbmNsdWRlL3hjX2RvbS5oCj4gKysrIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94Y19kb20u
aAo+IEBAIC0xMjMsMTYgKzEyMywxMiBAQCBzdHJ1Y3QgeGNfZG9tX2ltYWdlIHsKPiAgCj4gICAg
ICAvKiBvdGhlciBzdGF0ZSBpbmZvICovCj4gICAgICB1aW50MzJfdCBmX2FjdGl2ZVtYRU5GRUFU
X05SX1NVQk1BUFNdOwo+ICsKPiAgICAgIC8qCj4gLSAgICAgKiBwMm1faG9zdCBtYXBzIGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3NlcyBhbiBvZmZzZXQgZnJvbQo+IC0gICAgICogcmFtYmFzZV9wZm4g
KHNlZSBiZWxvdykgaW50byBnZm5zLgoKVGhlIHJlbW92YWwgb2YgdGhpcyBwYXJ0IG9mIHRoZSBj
b21tZW50IGFuZCAuLi4KCj4gLSAgICAgKiBGb3IgYSBwdXJlIFBWIGd1ZXN0IHRoaXMgbWVhbnMg
dGhhdCBpdCBtYXBzIEdQRk5zIGludG8gTUZOcyBmb3IKPiAtICAgICAqIGEgaHlicmlkIGd1ZXN0
IHRoaXMgbWVhbnMgdGhhdCBpdCBtYXBzIEdQRk5zIHRvIEdQRk5TLgo+IC0gICAgICoKPiAtICAg
ICAqIE5vdGUgdGhhdCB0aGUgaW5wdXQgaXMgb2Zmc2V0IGJ5IHJhbWJhc2UuCj4gKyAgICAgKiBw
dl9wMm0gaXMgc3BlY2lmaWMgdG8geDg2IFBWIGd1ZXN0cywgYW5kIG1hcHMgR0ZOcyB0byBNRk5z
LiAgSXQgaXMKPiArICAgICAqIGV2ZW50dWFsbHkgY29waWVkIGludG8gZ3Vlc3QgY29udGV4dC4K
PiAgICAgICAqLwo+IC0gICAgeGVuX3Bmbl90ICpwMm1faG9zdDsKPiArICAgIHhlbl9wZm5fdCAq
cHZfcDJtOwo+ICAKPiAgICAgIC8qIHBoeXNpY2FsIG1lbW9yeQo+ICAgICAgICoKPiBAQCAtNDMz
LDkgKzQyOSwxMiBAQCBzdGF0aWMgaW5saW5lIHhlbl9wZm5fdCB4Y19kb21fcDJtKHN0cnVjdCB4
Y19kb21faW1hZ2UgKmRvbSwgeGVuX3Bmbl90IHBmbikKPiAgewo+ICAgICAgaWYgKCB4Y19kb21f
dHJhbnNsYXRlZChkb20pICkKPiAgICAgICAgICByZXR1cm4gcGZuOwo+IC0gICAgaWYgKHBmbiA8
IGRvbS0+cmFtYmFzZV9wZm4gfHwgcGZuID49IGRvbS0+cmFtYmFzZV9wZm4gKyBkb20tPnRvdGFs
X3BhZ2VzKQo+ICsKPiArICAgIC8qIHg4NiBQViBvbmx5IG5vdy4gKi8KPiArICAgIGlmICggcGZu
ID49IGRvbS0+dG90YWxfcGFnZXMgKQo+ICAgICAgICAgIHJldHVybiBJTlZBTElEX01GTjsKPiAt
ICAgIHJldHVybiBkb20tPnAybV9ob3N0W3BmbiAtIGRvbS0+cmFtYmFzZV9wZm5dOwo+ICsKPiAr
ICAgIHJldHVybiBkb20tPnB2X3AybVtwZm5dOwo+ICB9CgouLi4gdGhlIGRyb3BwaW5nIG9mIGFs
bCB1c2VzIG9mIHJhbWJhc2VfcGZuIGhlcmUgbWFrZSBpdCBsb29rCmxpa2UgeW91J3JlIGRvaW5n
IGF3YXkgd2l0aCB0aGF0IGNvbmNlcHQgYWx0b2dldGhlci4gSXMgdGhpcwpyZWFsbHkgY29ycmVj
dD8gSWYgc28sIEkgZ3Vlc3MgeW91IHdhbnQgdG8KLSBzYXkgYSB3b3JkIGluIHRoaXMgcmVnYXJk
IGluIHRoZSBkZXNjcmlwdGlvbiwgdGhlIG1vcmUgdGhhdAogIHlvdSBkb24ndCBmdWxseSBnZXQg
cmlkIG9mIHRoaXMgKHRoZSBzdHJ1Y3R1cmUgZmllbGQgYW5kCiAgc29tZSB1c2VzIGVsc2V3aGVy
ZSByZW1haW4pLAotIGRyb3AvYWRqdXN0IHRoZSByZXNwZWN0aXZlIGNvbW1lbnQgZnJhZ21lbnQg
bmV4dCB0byB0aGUKICBmaWVsZCBhIGxpdHRsZSBmdXJ0aGVyIGRvd24gaW4gdGhlIHN0cnVjdHVy
ZS4KCj4gQEAgLTEyNDUsMTEgKzEyNDUsMTEgQEAgc3RhdGljIGludCBtZW1pbml0X3B2KHN0cnVj
dCB4Y19kb21faW1hZ2UgKmRvbSkKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgIH0K
PiAgCj4gLSAgICBkb20tPnAybV9ob3N0ID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5f
cGZuX3QpICogZG9tLT5wMm1fc2l6ZSk7Cj4gLSAgICBpZiAoIGRvbS0+cDJtX2hvc3QgPT0gTlVM
TCApCj4gKyAgICBkb20tPnB2X3AybSA9IHhjX2RvbV9tYWxsb2MoZG9tLCBzaXplb2YoeGVuX3Bm
bl90KSAqIGRvbS0+cDJtX3NpemUpOwoKU2luY2UgeW91J3JlIHRvdWNoaW5nIHRoZSBsaW5lIGFu
eXdheSwgcGVyaGFwcyBiZXR0ZXIKc2l6ZW9mKCpkb20tPnB2X3AybSk/CgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
