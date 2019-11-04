Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA371EE418
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:44:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iReU4-0000vq-6G; Mon, 04 Nov 2019 15:41:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iReU2-0000vk-VX
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:41:34 +0000
X-Inumbo-ID: 93ecf26a-ff19-11e9-a181-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93ecf26a-ff19-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:41:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D5E64B202;
 Mon,  4 Nov 2019 15:41:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-3-andrew.cooper3@citrix.com>
 <6eedb8a2-4c12-c615-edf5-abbe19c278f1@suse.com>
 <c5ce9c59-e608-459c-5c1b-19f5f0225d21@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b1d4c6b-2406-6cb5-5462-874d55be3e0d@suse.com>
Date: Mon, 4 Nov 2019 16:41:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c5ce9c59-e608-459c-5c1b-19f5f0225d21@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/boot: Cache cpu_has_hypervisor very
 early on boot
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAxNjozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDEzOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTEuMjAxOSAyMToyNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCj4+PiBAQCAtNjMwLDYgKzYzMCwxMCBAQCB0cmFt
cG9saW5lX3NldHVwOgo+Pj4gIAo+Pj4gIDE6Cj4+PiAgICAgICAgICAvKiBJbnRlcnJvZ2F0ZSBD
UFUgZXh0ZW5kZWQgZmVhdHVyZXMgdmlhIENQVUlELiAqLwo+Pj4gKyAgICAgICAgbW92ICAgICAk
MSwgJWVheAo+Pj4gKyAgICAgICAgY3B1aWQKPj4+ICsgICAgICAgIG1vdiAgICAgJWVjeCwgc3lt
X2ZzKGJvb3RfY3B1X2RhdGEpICsgQ1BVSU5GT19GRUFUVVJFX09GRlNFVChYODZfRkVBVFVSRV9I
WVBFUlZJU09SKQo+PiBJIHVuZGVyc3RhbmQgdGhlIEVDWCBvdXRwdXQgaXMgYWxsIHdlIG5lZWQg
cmlnaHQgbm93LiBCdXQgd291bGRuJ3QKPj4gaXQgYmUgYmV0dGVyIHRvIHRoZW4gc3RvcmUgRURY
IGFzIHdlbGwgKGFuZCBzaW1pbGFybHkgRUNYIG9mCj4+IDB4ODAwMDAwMDEgb3V0cHV0KT8KPiAK
PiBObyAtIEkgZG9uJ3QgdGhpbmsgc28uCj4gCj4gSSBkaWQgZGViYXRlIGFwcGx5aW5nIGFuIGFu
ZCBtYXNrIGZvciB0aGUgZmVhdHVyZXMgd2Ugb25seSBpbnRlbmQgdG8gYmUKPiB1c2FibGUgdGhp
cyBlYXJseSwgdG8gYXZvaWQgZ2V0dGluZyBidWdneSBjb2RlIHdoaWNoIGNoZWNrcyBmb3IKPiB1
bmV4cGVjdGVkIGZlYXR1cmVzIHRoaXMgZWFybHkuCgpJbmRlZWQgZG9pbmcgc28gd291bGQgc2Vl
bSBhIGdvb2QgcmVhc29uIHRvIG5vdCBhbHNvIHN0b3JlIHRoZSBFRFgKdmFsdWUgaGVyZS4KCj4+
IEFsc28sIGFsb25nIHRoZSBsaW5lcyBvZiBhIHF1ZXN0aW9uIGJhY2sgdG8gU2VyZ2V5IG9uIGhp
cwo+PiBzdGFuZGFsb25lIHBhdGNoLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gdGFrZSB0aGUg
b3Bwb3J0dW5pdHkKPj4gYW5kIGNoZWNrIGhlcmUgdGhhdCBDUFVJRCBsZWFmIDEgaXMgYWN0dWFs
bHkgdmFsaWQ/Cj4gCj4gVGhlcmUgaXMgbm8gc3VjaCB0aGluZyBhcyBhIDY0LWJpdCBjYXBhYmxl
IENQVSB3aXRob3V0IGxlYWYgMS4KCkFib3V0IGFueXRoaW5nIGNhbiBiZSBjb25zdHJ1Y3RlZCB1
bmRlciBhIGh5cGVydmlzb3IuIEJ1dCB3ZWxsLCBJCmd1ZXNzIEknbGwgc3RvcCBtdW1ibGluZyBv
biB0aGlzIGFzcGVjdC4KCj4+IE9mIGNvdXJzZSB0aGUgcXVlc3Rpb24gb24gdGhlIChpbnRlbmRl
ZCkgZWZmZWN0IG9mCj4+ICJjcHVpZD1uby1oeXBlcnZpc29yIiBhbHNvIHJlbWFpbnMuIEFzIHNh
aWQgYmVmb3JlLCBJIHRoaW5rIHRoaXMKPj4gc2hvdWxkIGJlIGhvbm9yZWQgYnkgYWxsIG9mIG91
ciBjb2RlIHRoYXQgcG9zc2libHkgY2FuIChpLmUuIGF0Cj4+IGxlYXN0IGV2ZXJ5dGhpbmcgZm9s
bG93aW5nIGNvbW1hbmQgbGluZSBwYXJzaW5nKS4KPiAKPiBUaGVyZSBpcyBubyBjaGFuY2Ugb2Yg
bWFraW5nIHRoYXQgd29yayBpbiBhIHNhbmUgd2F5IC0gd2UgdXNlCj4gY3B1X2hhc19oeXBlcnZp
c29yIGZvciBxdWl0ZSBhIGZldyB0aGluZ3MgYmVmb3JlIHRoZSBjb21tYW5kIGxpbmUgZ2V0cwo+
IHBhcnNlZC4KCllvdSBzYWlkIHNvIHRoZSBvdGhlciBkYXksIGJ1dCBpaXJjIHdoZW4gY2hlY2tp
bmcgSSB3YXNuJ3QgYWJsZSB0bwppZGVudGlmeSBhbnkgc3VjaCBjYXNlLCBsZXQgYWxvbmUgInF1
aXRlIGEgZmV3Ii4KCkFueXdheSwgZmVlbCBmcmVlIHRvIGFkZApBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
