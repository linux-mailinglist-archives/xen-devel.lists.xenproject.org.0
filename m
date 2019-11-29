Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815310D2A6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 09:51:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iabxK-0000MY-3v; Fri, 29 Nov 2019 08:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iabxI-0000MT-Px
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 08:48:48 +0000
X-Inumbo-ID: 0ee5ba8c-1285-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ee5ba8c-1285-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 08:48:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 848B0ABB1;
 Fri, 29 Nov 2019 08:48:47 +0000 (UTC)
To: Yi Sun <yi.y.sun@linux.intel.com>
References: <1574936284-5139-1-git-send-email-yi.y.sun@linux.intel.com>
 <fdb27512-4ebc-8f80-7ef2-36d83c369326@suse.com>
 <20191129014149.GU18465@yi.y.sun>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <840c28c8-8327-f440-f72b-7afcbde57508@suse.com>
Date: Fri, 29 Nov 2019 09:48:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129014149.GU18465@yi.y.sun>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] psr: fix bug which may cause crash
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAwMjo0MSwgWWkgU3VuIHdyb3RlOgo+IE9uIDE5LTExLTI4IDEyOjI1OjQ0
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMTEuMjAxOSAxMToxOCwgWWkgU3VuIHdyb3Rl
Ogo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3Bzci5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHNy
LmMKPj4+IEBAIC0xMjcxLDcgKzEyNzEsOCBAQCBzdGF0aWMgdm9pZCBkb193cml0ZV9wc3JfbXNy
cyh2b2lkICpkYXRhKQo+Pj4gIAo+Pj4gICAgICAgICAgZm9yICggaiA9IDA7IGogPCBjb3NfbnVt
OyBqKyssIGluZGV4KysgKQo+Pj4gICAgICAgICAgewo+Pj4gLSAgICAgICAgICAgIGlmICggZmVh
dC0+Y29zX3JlZ192YWxbY29zICogY29zX251bSArIGpdICE9IGluZm8tPnZhbFtpbmRleF0gKQo+
Pj4gKyAgICAgICAgICAgIGlmICggY29zIDw9IGZlYXQtPmNvc19tYXggJiYKPj4+ICsgICAgICAg
ICAgICAgICAgIGZlYXQtPmNvc19yZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSAhPSBpbmZvLT52
YWxbaW5kZXhdICkKPj4KPj4gVGhlIGRlc2NyaXB0aW9uIGlzIGluZGVlZCBtdWNoIGJldHRlciBu
b3csIHRoYW5rcy4gSG93ZXZlciwKPj4gYXMgaW5kaWNhdGVkIGluIHJlcGx5IHRvIHYxLCB0aGlz
IGV4dHJhIChhbmQgYXQgdGhlIGZpcnN0IGdsYW5jZQo+PiB1bm1vdGl2YXRlZCkgYm91bmRzIGNo
ZWNrIHdhbnRzIHRvIGJlIGFjY29tcGFuaWVkIGJ5IGEgYnJpZWYgYnV0Cj4gCj4gSSB3aWxsIGFk
ZCB0aGUgY29tbWVudC4KPiAKPj4gcHJlY2lzZSBjb21tZW50LiBGdXJ0aGVybW9yZSB3aXRoIHRo
ZSBsb29wIGJvdW5kZWQgYnkgYSBsb2NhbAo+PiB2YXJpYWJsZSwgd2h5IG5vdAo+Pgo+PiAgICAg
ICAgIGNvc19udW0gPSBtaW4ocHJvcHMtPmNvc19udW0sIGZlYXQtPmNvc19tYXggKyAxKTsKPj4K
Pj4gYSBmZXcgbGluZXMgdXAgZnJvbSBoZXJlIChhZ2FpbiBzdWl0YWJsZSBjb21tZW50ZWQpPwo+
Pgo+IGNvc19udW0gaXMgYSBkaWZmZXJlbnQgdGhpbmcgd2l0aCB0aGUgbnVtYmVyIG9mIENPUyBy
ZWdpc3RlcnMuIFRoZQo+IG1lYW5pbmcgb2YgaXQgaXMgIkNPUyByZWdpc3RlcnMgbnVtYmVyIHRo
YXQgZmVhdHVyZSB1c2VzIGZvciBvbmUgQ09TCj4gSUQiLiBFLmcuIE1CQS9DQVQgY29zX251bSBp
cyBhbHdheXMgMS4gQnV0IENEUCBjb3NfbnVtIGlzIDIgYmVjYXVzZSBpdAo+IHVzZXMgMiBDT1Mg
cmVnaXN0ZXJzIGZvciBvbmUgQ09TIElELgoKT2gsIHJpZ2h0LCBJIGdvdCBjb25mdXNlZC4gVGhl
IGNvcyA8PSBmZWF0LT5jb3NfbWF4IGlzIGVudGlyZWx5Cmxvb3AgaW52YXJpYW50LiBIZW5jZSB0
aGUgbG9vcCBzaG91bGRuJ3QgZXZlbiBiZSBlbnRlcmVkLCBpLmUuCnlvdSB3YW50IHRvIGFkZCBh
IGNvbmRpdGlvbmFsIGFoZWFkIG9mIGl0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
