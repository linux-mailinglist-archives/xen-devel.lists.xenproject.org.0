Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE2100548
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 13:05:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWfjH-0000vO-4d; Mon, 18 Nov 2019 12:02:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWfjG-0000vJ-7N
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 12:02:02 +0000
X-Inumbo-ID: 39ed9d7d-09fb-11ea-a2d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ed9d7d-09fb-11ea-a2d8-12813bfff9fa;
 Mon, 18 Nov 2019 12:02:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC5FAAF42;
 Mon, 18 Nov 2019 12:01:59 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
Date: Mon, 18 Nov 2019 13:01:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118101600.94645-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxMToxNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
cG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBwb3NzaWJsZSB0aGF0IHRo
ZQo+IHZDUFUgcmVzdW1lcyBleGVjdXRpb24gd2l0aCBhIHN0YWxlIGxvY2FsIEFQSUMgSVJSIHJl
Z2lzdGVyIGJlY2F1c2UKPiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMgdG8gYmUgaW5qZWN0
ZWQgdmxhcGljX2hhc19wZW5kaW5nX2lycQo+IG1pZ2h0IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVz
IFBJUiB3b24ndCBiZSBzeW5jZWQgaW50byBJUlIuCj4gCj4gRml4IHRoaXMgYnkgbWFraW5nIHN1
cmUgUElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluIHZteF9pbnRyX2Fzc2lzdAo+IHJlZ2Fy
ZGxlc3Mgb2Ygd2hhdCBpbnRlcnJ1cHRzIGFyZSBwZW5kaW5nLgoKRm9yIHRoaXMgcGFydCwgZGlk
IHlvdSBjb25zaWRlciBwdWxsaW5nIGFoZWFkIHRvIHRoZSBiZWdpbm5pbmcKb2YgaHZtX3ZjcHVf
aGFzX3BlbmRpbmdfaXJxKCkgaXRzIGNhbGwgdG8gdmxhcGljX2hhc19wZW5kaW5nX2lycSgpPwpJ
IGFzayBiZWNhdXNlIC4uLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMKPiBAQCAtMjMyLDYgKzIzMiwxNCBAQCB2
b2lkIHZteF9pbnRyX2Fzc2lzdCh2b2lkKQo+ICAgICAgZW51bSBodm1faW50YmxrIGludGJsazsK
PiAgICAgIGludCBwdF92ZWN0b3I7Cj4gIAo+ICsgICAgaWYgKCBjcHVfaGFzX3ZteF9wb3N0ZWRf
aW50cl9wcm9jZXNzaW5nICkKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIEFsd2F5cyBmb3Jj
ZSBQSVIgdG8gYmUgc3luY2VkIHRvIElSUiBiZWZvcmUgdm1lbnRyeSwgdGhpcyBpcyBhbHNvCj4g
KyAgICAgICAgICogZG9uZSBieSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIGJ1dCBpdCdzIHBvc3Np
YmxlIG90aGVyIHBlbmRpbmcKPiArICAgICAgICAgKiBpbnRlcnJ1cHRzIHByZXZlbnQgdGhlIGV4
ZWN1dGlvbiBvZiB0aGF0IGZ1bmN0aW9uLgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIHZteF9z
eW5jX3Bpcl90b19pcnIodik7CgouLi4gdGhpcyBhZGRpdGlvbiBsb29rcyBtb3JlIGxpa2UgcGFw
ZXJpbmcgb3ZlciBzb21lIGlzc3VlIHRoYW4KYWN0dWFsbHkgdGFraW5nIGNhcmUgb2YgaXQuCgpU
aGVuIGFnYWluIEkgd29uZGVyIHdoZXRoZXIgdGhlIFBJUi0+SVJSIHN5bmMgaXMgYWN0dWFsbHkK
bGVnaXRpbWF0ZSB0byBwZXJmb3JtIHdoZW4gdiAhPSBjdXJyZW50LiBJZiBpdCdzIG5vdCwgdGhl
biB0aGVyZQptaWdodCBiZSBhIHdpZGVyIHNldCBvZiBwcm9ibGVtcyAoc2VlIGUuZy4KaHZtX2xv
Y2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KCkpLiBCdXQgb2YgY291cnNlIHRoZSBhZGp1c3RtZW50
CnRvIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycSgpIGNvdWxkIGFsc28gYmUgdG8gbWFrZSB0aGUg
Y2FsbAplYXJseSBvbmx5IHdoZW4gdiA9PSBjdXJyZW50LgoKQSBsYXN0IHF1ZXN0aW9uIGlzIHRo
YXQgb24gdGhlIGNvbnNlcXVlbmNlcyBvZiBvdmVybHkgYWdncmVzc2l2ZQpzeW5jLWluZyAtIHRo
YXQnbGwgaGFybSBwZXJmb3JtYW5jZSwgYnV0IHNob3VsZG4ndCBhZmZlY3QKY29ycmVjdG5lc3Mg
aWYgSSdtIG5vdCBtaXN0YWtlbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
