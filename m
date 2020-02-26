Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA016FE7B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vIZ-0005TP-Ht; Wed, 26 Feb 2020 11:56:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6vIY-0005TK-At
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:56:18 +0000
X-Inumbo-ID: fe6f01ea-588e-11ea-9401-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe6f01ea-588e-11ea-9401-12813bfff9fa;
 Wed, 26 Feb 2020 11:56:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E44D7AE48;
 Wed, 26 Feb 2020 11:56:15 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <27c7736ec643dd0dd3cf469e6dc57f9d36379dcb.1582281718.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87299f70-95dc-d16b-43c5-6b57d53dfbcd@suse.com>
Date: Wed, 26 Feb 2020 12:56:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <27c7736ec643dd0dd3cf469e6dc57f9d36379dcb.1582281718.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mm: switch to new APIs in
 arch_init_memory
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxMTo0MiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBTaW5jZSB3ZSBub3cgbWFwIGFuZCB1bm1hcCBYZW4g
UFRFIHBhZ2VzLCB3ZSB3b3VsZCBsaWtlIHRvIHRyYWNrIHRoZQo+IGxpZmV0aW1lIG9mIG1hcHBp
bmdzIHNvIHRoYXQgMSkgd2UgZG8gbm90IGRlcmVmZXJlbmNlIG1lbW9yeSB0aHJvdWdoIGEKPiB2
YXJpYWJsZSBhZnRlciBpdCBpcyB1bm1hcHBlZCwgMikgd2UgZG8gbm90IHVubWFwIG1vcmUgdGhh
biBvbmNlLgo+IFRoZXJlZm9yZSwgd2UgaW50cm9kdWNlIHRoZSBVTk1BUF9ET01BSU5fUEFHRSBt
YWNybyB0byBudWxsaWZ5IHRoZQo+IHZhcmlhYmxlIGFmdGVyIHVubWFwcGluZywgYW5kIGlnbm9y
ZSBOVUxMIGluIHVubWFwX2RvbWFpbl9wYWdlLgoKVG8gbWUgdGhpcyByZWFkcyBhcyBpZiBpdCB3
YXMgYSAybmQgcGFyYWdyYXBoIGV4cGxhaW5pbmcgd2hhdCBuZWVkcwpkb2luZyBpbiBvcmRlciB0
byBhY2hpZXZlIHRoZSBtYWluIGdvYWwgb2YgdGhlIHBhdGNoIChzdXBwb3NlZGx5CmRlc2NyaWJl
ZCBpbiBhIDFzdCBwYXJhZ3JhcGgpLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2Uu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCj4gQEAgLTE4MSw3ICsxODEsNyBA
QCB2b2lkIHVubWFwX2RvbWFpbl9wYWdlKGNvbnN0IHZvaWQgKnB0cikKPiAgICAgIHVuc2lnbmVk
IGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZylwdHIsIG1mbiwgZmxhZ3M7Cj4gICAgICBzdHJ1Y3Qg
dmNwdV9tYXBoYXNoX2VudHJ5ICpoYXNoZW50Owo+ICAKPiAtICAgIGlmICggdmEgPj0gRElSRUNU
TUFQX1ZJUlRfU1RBUlQgKQo+ICsgICAgaWYgKCAhdmEgfHwgdmEgPj0gRElSRUNUTUFQX1ZJUlRf
U1RBUlQgKQo+ICAgICAgICAgIHJldHVybjsKCklmIHdlIGFyZSB0byBnbyB3aXRoIHRoaXMsIHRo
ZW4gSSBhZ3JlZSB3aXRoIEp1bGllbiB0aGF0IHRoaXMgbmVlZHMKbWlycm9yaW5nIHRvIEFybSwg
YWxsb3dpbmcgY29tbW9uIGNvZGUgdG8gYXNzdW1lIHRoaXMgYmVoYXZpb3IuCkhvd2V2ZXIsIGFu
IGFsdGVybmF0aXZlIHRvIHRoaXMgaXMgdG8gbWFrZSAuLi4KCj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2RvbWFpbl9wYWdlLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAo+
IEBAIC03Miw0ICs3Miw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1bm1hcF9kb21haW5fcGFnZV9n
bG9iYWwoY29uc3Qgdm9pZCAqdmEpIHt9Owo+ICAKPiAgI2VuZGlmIC8qICFDT05GSUdfRE9NQUlO
X1BBR0UgKi8KPiAgCj4gKyNkZWZpbmUgVU5NQVBfRE9NQUlOX1BBR0UocCkgZG8geyAgIFwKPiAr
ICAgIHVubWFwX2RvbWFpbl9wYWdlKHApOyAgICAgICAgICAgXAo+ICsgICAgKHApID0gTlVMTDsg
ICAgICAgICAgICAgICAgICAgICBcCj4gK30gd2hpbGUgKCBmYWxzZSApCgouLi4gdGhpcyBhdm9p
ZCB0aGUgY2FsbCwgbGVhdmluZyB0aGUgZnVuY3Rpb24gaXRzZWxmIHVudG91Y2hlZC4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
