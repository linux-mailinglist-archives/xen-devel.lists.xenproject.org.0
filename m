Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432F14BD8B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:18:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTWh-0005vI-Gw; Tue, 28 Jan 2020 16:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwTWg-0005uY-1O
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:15:42 +0000
X-Inumbo-ID: 6d0ef432-41e9-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d0ef432-41e9-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 16:15:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0550ACC9;
 Tue, 28 Jan 2020 16:15:39 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-6-liuwe@microsoft.com>
 <e72f37cf-63cb-9c10-00e2-96f946208265@suse.com>
 <20200128155011.xblutfe4titdo5ax@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <53b5eccd-b192-1684-0a5e-f2635fdc9d64@suse.com>
Date: Tue, 28 Jan 2020 17:15:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128155011.xblutfe4titdo5ax@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 5/7] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNjo1MCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAy
MCBhdCAwNDo0NTozOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMDEuMjAy
MCAyMToyMywgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvaHlwZXJ2LmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMK
Pj4+IEBAIC0yNyw3ICsyNywxMCBAQAo+Pj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRs
ZnMuaD4KPj4+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+Pj4gIAo+Pj4gKyNpbmNsdWRl
ICJwcml2YXRlLmgiCj4+PiArCj4+PiAgc3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0
bHkgbXNfaHlwZXJ2Owo+Pj4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZf
cGNwdV9pbnB1dF9hcmcpOwo+Pgo+PiBXb3VsZCBpdCBwZXJoYXBzIGJlIGhlbHBmdWwgdG8gbWFr
ZSByZWNvZ25pemFibGUgdGhhdCB0aGlzIGNhbiBob2xkCj4+IHVwIHRvIGEgcGFnZSdzIHdvcnRo
IG9mIGRhdGEsIGVpdGhlciBieSBpdHMgdHlwZSBvciBieSBhIHNsaWdodGx5Cj4+IGRpZmZlcmVu
dCBuYW1lPwo+IAo+IEkgd2lsbCBjaGFuZ2UgdGhpcyB0byBodl9wY3B1X2lucHV0X2FyZ19wYWdl
IGluc3RlYWQuCgpPciBtYXliZSBodl9wY3B1X2lucHV0X3BhZ2U/Cgo+Pj4gQEAgLTExOSwxNCAr
MTIyLDM2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+
Pj4gICAgICB9Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9w
Y3B1X2FyZyh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgdm9pZCAqbWFwcGluZzsKPj4+ICsKPj4+ICsg
ICAgaWYgKCB0aGlzX2NwdShodl9wY3B1X2lucHV0X2FyZykgKQo+Pj4gKyAgICAgICAgcmV0dXJu
Owo+Pj4gKwo+Pj4gKyAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4+PiArICAg
IGlmICggIW1hcHBpbmcgKQo+Pj4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSBo
eXBlcmNhbGwgaW5wdXQgcGFnZSBmb3IgQ1BVJXVcbiIsCj4+PiArICAgICAgICAgICAgICBzbXBf
cHJvY2Vzc29yX2lkKCkpOwo+Pgo+PiBwYW5pYygpIGlzIGxpa2VseSBmaW5lIGZvciB0aGUgQlNQ
LCBidXQgSSBkb24ndCB0aGluayBhbnkgQVAgc2hvdWxkCj4+IGJlIGFibGUgdG8gYnJpbmcgZG93
biB0aGUgc3lzdGVtIGJlY2F1c2Ugb2YgbWVtb3J5IHNob3J0YWdlLiBTdWNoCj4+IGFuIEFQIHNo
b3VsZCBzaW1wbHkgbm90IGNvbWUgb25saW5lLiAoRXZlbiBmb3IgdGhlIEJTUCB0aGUgcXVlc3Rp
b24KPj4gaXMgd2hldGhlciBYZW4gd291bGQgYmUgYWJsZSB0byBydW4gZGVzcGl0ZSBmYWlsdXJl
IGhlcmUuKQo+IAo+IFRoaXMgaXMgbm8gZGlmZmVyZW50IHRoYW4gd2hhdCBpcyBhbHJlYWR5IGRv
bmUgZm9yIFhlbiBvbiBYZW4sIGkuZS4KPiBmYWlsdXJlIGluIHNldHRpbmcgdXAgQVAgZm9yIGFu
eSByZWFzb24gaXMgZmF0YWwuCj4gCj4gc3RhcnRfc2Vjb25kYXJ5IGRvZXNuJ3QgZXZlbiBoYW5k
bGluZyBhbnkgZmFpbHVyZSBieSBpdHNlbGYgb3IKPiBwcm9wYWdhdGUgZmFpbHVyZSBiYWNrIHRv
IGNhbGxlci4KPiAKPiBSZXdpbmRpbmcgaXMgYSBiaXQgY29tcGxleCwgZ2l2ZW4gdGhhdCB3ZSB3
b3VsZCBlbmFibGUgaHlwZXJ2aXNvcgo+IGZlYXR1cmVzIHZlcnkgZWFybHkuCj4gCj4gVG8gYWNo
aWV2ZSB3aGF0IHlvdSB3YW50IGl0IHdvdWxkIHJlcXVpcmUgcmV3cml0aW5nIG9mIG90aGVyIHBh
cnRzIHRoYXQKPiBhcmUgb3V0c2lkZSBvZiBoeXBlcnZpc29yIGZyYW1ld29yay4KCk5vdCBzdXJl
LiBDb21wYXJpbmcgd2l0aCBzdGFydF9zZWNvbmRhcnkoKSBpcyBwZXJoYXBzIHN1Yi1vcHRpbWFs
LgpUaGUgZnVuY3Rpb24gY2FsbHMgc21wX2NhbGxpbigpLCBhbmQgdGhlcmUgeW91J2xsIGZpbmQg
c29tZSBlcnJvcgpoYW5kbGluZy4gSSB3b3VsZCBzdXBwb3NlIHRoaXMgY291bGQgYmUgZXh0ZW5k
ZWQgKHRoZXJlIG9yIGluCnN0YXJ0X3NlY29uZGFyeSgpIGl0c2VsZiwgaWYgbmVlZCBiZSkgdG8g
ZGVhbCB3aXRoIGNhc2VzIGxpa2UgdGhpcwpvbmUuIEFzIHRvIFhlbi1vbi1YZW4gLSBpaXJjIHRo
YXQgY29kZSB3YXMgcHJldHR5IG11Y2ggcnVzaGVkIGluCmZvciB0aGUgc2hpbSB0byBiZWNvbWUg
dXNhYmxlLCBzbyBJIHdvdWxkbid0IHRha2UgaXRzIGVycm9yCmhhbmRsaW5nIG1vZGVsIGFzIHRo
ZSBjYW5vbmljYWwgcmVmZXJlbmNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
