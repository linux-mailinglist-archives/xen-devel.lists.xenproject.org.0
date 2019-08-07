Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857A847D8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:46:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHYm-0004B8-H0; Wed, 07 Aug 2019 08:44:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvHYl-0004B3-ER
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:44:39 +0000
X-Inumbo-ID: 965d4e76-b8ef-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 965d4e76-b8ef-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:44:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95266AD46;
 Wed,  7 Aug 2019 08:44:36 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-17-git-send-email-chao.gao@intel.com>
 <8f6d506f-ee05-ab43-ef5f-8301f3845d4d@suse.com>
 <20190807075957.GA23889@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae1e6aeb-8f99-a025-6ba3-2b2d2b7b6cdd@suse.com>
Date: Wed, 7 Aug 2019 10:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807075957.GA23889@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 16/16] microcode: block #NMI handling
 when loading an ucode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAwOTo1OSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gTW9uLCBBdWcgMDUsIDIw
MTkgYXQgMTI6MTE6MDFQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAxLjA4LjIw
MTkgMTI6MjIsIENoYW8gR2FvIHdyb3RlOgo+Pj4gQEAgLTQzOSwxMiArNDQwLDM3IEBAIHN0YXRp
YyBpbnQgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPj4+ICAgICAgICByZXR1cm4g
cmV0Owo+Pj4gICAgfQo+Pj4gICAgCj4+PiArc3RhdGljIGludCBtaWNyb2NvZGVfbm1pX2NhbGxi
YWNrKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQgY3B1KQo+Pj4gK3sKPj4+
ICsgICAgYm9vbCBwcmludCA9IGZhbHNlOwo+Pj4gKwo+Pj4gKyAgICAvKiBUaGUgZmlyc3QgdGhy
ZWFkIG9mIGEgY29yZSBpcyB0byBsb2FkIGFuIHVwZGF0ZS4gRG9uJ3QgYmxvY2sgaXQuICovCj4+
PiArICAgIGlmICggY3B1ID09IGNwdW1hc2tfZmlyc3QocGVyX2NwdShjcHVfc2libGluZ19tYXNr
LCBjcHUpKSApCj4+PiArICAgICAgICByZXR1cm4gMDsKPj4+ICsKPj4+ICsgICAgaWYgKCBsb2Fk
aW5nX3N0YXRlID09IExPQURJTkdfRU5URVJFRCApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIGNw
dW1hc2tfc2V0X2NwdShjcHUsICZjcHVfY2FsbGluX21hcCk7Cj4+PiArICAgICAgICBwcmludGso
WEVOTE9HX0RFQlVHICJDUFUldSBlbnRlcnMgJXNcbiIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgX19m
dW5jX18pOwo+Pgo+PiBIZXJlICBhbmQgLi4uCj4+Cj4+PiArICAgICAgICBwcmludCA9IHRydWU7
Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgd2hpbGUgKCBsb2FkaW5nX3N0YXRlID09IExPQURJ
TkdfRU5URVJFRCApCj4+PiArICAgICAgICByZXBfbm9wKCk7Cj4+PiArCj4+PiArICAgIGlmICgg
cHJpbnQgKQo+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiQ1BVJXUgZXhpdHMgJXNc
biIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgX19mdW5jX18pOwo+Pgo+PiAuLi4gaGVyZSAtIHdoeSBz
bXBfcHJvY2Vzc29yX2lkKCkgd2hlbiB5b3UgY2FuIHVzZSAiY3B1Ij8gQW5kIHdoYXQKPj4gdXNl
IGlzIF9fZnVuY19fIGhlcmU/Cj4+Cj4+IFRoZSByZXBfbm9wKCkgYWJvdmUgYWxzbyBwcmVzdW1h
Ymx5IHdhbnRzIHRvIGJlIGNwdV9yZWxheCgpIGFnYWluLgo+Pgo+PiBCdXQgb24gdGhlIHdob2xl
IEkgd2FzIHJlYWxseSBob3BpbmcgZm9yIG1vcmUgYWdncmVzc2l2ZSBkaXNhYmxpbmcKPj4gb2Yg
Tk1JIGhhbmRsaW5nLCBtb3JlIGxpa2UgKGJ1dCBvZiBjb3Vyc2Ugbm90IHF1aXRlIGFzIGhlYXZ5
IGFzKQo+PiB0aGUgY3Jhc2ggcGF0aCB3aXJpbmcgdGhlIElEVCBlbnRyeSB0byB0cmFwX25vcCgp
Lgo+IAo+IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBpdCBzaG91bGQgYmUgbW9yZSBhZ2dyZXNzaXZl
LiBUaGlzIHBhdGNoIGlzCj4gcHJvYmxlbWF0aWMgY29uc2lkZXJpbmcgdGhlcmUgaXMgYSBsb3Qg
b2YgY29kZSBiZWZvcmUgcmVhY2hpbmcgdGhpcwo+IGNhbGxiYWNrIChlc3BlY2lhbGx5LCBTUEVD
X0NUUkxfRU5UUllfRlJPTV9JTlRSX0lTVCB3aGljaCBtYXkgd3JpdGUKPiBNU1JfU1BFQ19DVFJM
KS4KPiAKPiBJbiBteSBtaW5kLCB3ZSBoYXZlIHR3byBvcHRpb25zIHRvIHNvbHZlIHRoZSBpc3N1
ZToKPiAxLiBXaXJlIHRoZSBJRFQgZW50cnkgdG8gdHJhcF9ub3AoKSBsaWtlIHRoZSBjcmFzaCBw
YXRoLgoKQXMgc2FpZCwgdGhpcyBpcyBub3QgZGlyZWN0bHkgYW4gb3B0aW9uIC0gYXQgdGhlIHZl
cnkgbGVhc3QgYSB0aHJlYWQKc2hvdWxkIHJlY29yZCB0aGUgZmFjdCB0aGF0IHRoZXJlIHdhcyBh
biBOTUksIHN1Y2ggdGhhdCBpdCBjYW4KaGFuZGxlIGl0IGFmdGVyIHRoZSB1Y29kZSB1cGRhdGUg
aGFzIGNvbXBsZXRlZC4KCj4gMi4gRW5oYW5jZSB0aGlzIHBhdGNoOiBBIHRocmVhZCB3aGljaCBp
cyBub3QgZ29pbmcgdG8gbG9hZCBhbiB1cGRhdGUKPiBpcyBmb3JjZWQgdG8gc2VuZCBhbiAjTk1J
IHRvIGl0c2VsZiB0byBlbnRlciB0aGUgY2FsbGJhY2ssIGRvCj4gYnVzeS1sb29wIHVudGlsIGNv
bXBsZXRpb24gb2YgbG9hZGluZyB1Y29kZSBvbiBhbGwgY29yZXMuCj4gV2l0aCB0aGlzIG1ldGhv
ZCwgbm8gI05NSSBkZWxpdmVyeSwgb3IgTVNSIHdyaXRlIHdvdWxkIGhhcHBlbiBvbiB0aGlzCj4g
dGhyZWFkcyBkdXJpbmcgbWljcm9jb2RlIHVwZGF0ZS4KClRoaXMgc291bmRzIGRvYWJsZSBhdCB0
aGUgZmlyc3QgZ2xhbmNlOyBpaXJjIHRoZSBDUFUgd291bGQgbGF0Y2gKYW5vdGhlciBOTUkgd2hp
bGUgTk1JcyBhcmUgYmxvY2tlZCBkdWUgdG8gdGhlcmUgbm90IGhhdmluZyBiZWVuIGFuCklSRVQg
eWV0IGFmdGVyIHRoZSBsYXN0IG9uZSB3YXMgcmFpc2VkLiBUaGVyZSB3b3VsZCBzdGlsbCBiZSBz
b21lCmFtYmlndWl0eSBpbiBjYXNlIHRoZSBzZWxmLU5NSSBhbmQgYW4gYWN0dWFsIG9uZSBhcnJp
dmVkIGF0IGFib3V0CnRoZSBzYW1lIHRpbWUsIGJ1dCBJIGd1ZXNzIHdlIG5lZWQgdG8gbGl2ZSB3
aXRoIHRoaXMgc21hbGwgd2luZG93LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
