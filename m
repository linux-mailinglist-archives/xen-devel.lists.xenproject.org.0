Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC352112D66
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 15:25:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icVXZ-0003kn-9b; Wed, 04 Dec 2019 14:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icVXX-0003ki-Qi
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 14:22:03 +0000
X-Inumbo-ID: 7009d67a-16a1-11ea-aea8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7009d67a-16a1-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 14:22:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78163AE39;
 Wed,  4 Dec 2019 14:22:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204104420.34418-1-roger.pau@citrix.com>
 <a8827921-2d27-de07-8019-e99252dec703@suse.com>
 <20191204115243.GJ980@Air-de-Roger>
 <ecb09829-6ac0-b14b-cc07-2c040bb7c8b1@suse.com>
 <20191204131727.GK980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00dd9810-f7b1-a2ca-fbb0-c32653dd37b5@suse.com>
Date: Wed, 4 Dec 2019 15:22:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204131727.GK980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86: do not enable global pages when
 virtualized on AMD hardware
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNDoxNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBE
ZWMgMDQsIDIwMTkgYXQgMDI6MTU6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA0LjEyLjIwMTkgMTI6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBXZWQsIERl
YyAwNCwgMjAxOSBhdCAxMjowNTozNVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBP
biAwNC4xMi4yMDE5IDExOjQ0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWlu
LmMKPj4+Pj4gQEAgLTExOCwxMSArMTE4LDE4IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vl
c3RfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPj4+Pj4gICAg
ICAgICAgICAgIChtbXVfY3I0X2ZlYXR1cmVzICYgUFZfQ1I0X0dVRVNUX1ZJU0lCTEVfTUFTSykp
Owo+Pj4+PiAgfQo+Pj4+PiAgCj4+Pj4+ICtzdGF0aWMgaW50IG9wdF9nbG9iYWxfcGFnZXMgPSAt
MTsKPj4+Pgo+Pj4+IGludDhfdCBfX3JlYWRfbW9zdGx5Cj4+Pj4KPj4+Pj4gK2Jvb2xlYW5fcnVu
dGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2VzIiwgb3B0X2dsb2JhbF9wYWdlcyk7Cj4+Pj4+ICsKPj4+
Pj4gIHVuc2lnbmVkIGxvbmcgcHZfbWFrZV9jcjQoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4+Pj4+
ICB7Cj4+Pj4+ICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKPj4+Pj4g
ICAgICB1bnNpZ25lZCBsb25nIGNyNCA9IG1tdV9jcjRfZmVhdHVyZXMgJgo+Pj4+PiAgICAgICAg
ICB+KFg4Nl9DUjRfUENJREUgfCBYODZfQ1I0X1BHRSB8IFg4Nl9DUjRfVFNEKTsKPj4+Pj4gKyAg
ICBib29sIHBnZSA9IG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgPyAoIWNwdV9oYXNfaHlwZXJ2aXNv
ciB8fAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290
X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWDg2X1ZFTkRPUl9BTUQpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDogISFvcHRfZ2xvYmFsX3BhZ2VzOwo+Pj4+Cj4+Pj4gTGV0J3Mg
YXZvaWQgcmUtZG9pbmcgdGhpcyBldmFsdWF0aW9uIGVhY2ggdGltZSB3ZSBjb21lIGhlcmUuCj4+
Pj4gUG9zdCBib290IHRoZSB2YWx1ZSBjYW4gb25seSBjaGFuZ2UgdG8gMCBvciAxLiBIZW5jZSBp
biBzb21lCj4+Pj4gX19pbml0IGZ1bmN0aW9uIHlvdSBjYW4gYXBwbHkgdGhlIGRlZmF1bHQgY2Fs
Y3VsYXRpb24gZG9uZQo+Pj4+IGhlcmUuCj4+Pgo+Pj4gSSd2ZSBhc3N1bWVkIHRoYXQgYm9vbGVh
bl9ydW50aW1lX3BhcmFtIGNhbiBiZSBjaGFuZ2VkIGR1cmluZyBydW50aW1lCj4+PiBieSB0aGUg
dXNlciwgYW5kIGhlbmNlIHRoZSB2YWx1ZSBjYWxjdWxhdGVkIGF0IGJvb3QgdGltZSB3b3VsZCBi
ZWNvbWUKPj4+IHN0YWxlIGlmIHRoZSB1c2VyIGNoYW5nZXMgaXQgYWZ0ZXIgYm9vdCwgd2hpY2gg
c2hvdWxkIGJlIGZpbmUgZm9yIHRoaXMKPj4+IG9wdGlvbi4KPj4KPj4gSSdtIGFmcmFpZCBJIGNh
bid0IGRlY2lkZSB3aGV0aGVyIHlvdSBhZ3JlZSBvciBkaXNhZ3JlZSB3aXRoIG15Cj4+IGNvbW1l
bnQuCj4gCj4gT2ggc29ycnkgZnJvIG5vdCBiZWluZyBjbGVhci4gSSB3YXMgbWVhbnQgdG8gZGlz
YWdyZWUsIGNhbGN1bGF0aW5nIGEKPiB2YWx1ZSBhdCBpbml0IHRpbWUgd291bGQgYmUgd3Jvbmcs
IHNpbmNlIG9wdF9nbG9iYWxfcGFnZXMgY2FuIGNoYW5nZQo+IGR1cmluZyBydW50aW1lLgoKQnV0
IHRoYXQncyB3aGF0IEkndmUgZXhwbGFpbmVkIGluIG15IGVhcmxpZXIgcmVwbHk6IEF0IHJ1biB0
aW1lLAp0aGUgdmFsdWUgY2FuIG9ubHkgY2hhbmdlIHRvIDAgb3IgMSwgYnV0IG5vdCB0byAtMS4g
SGVuY2Ugb25jZSBhCnJ1bnRpbWUgdXBkYXRlIG9jY3VycmVkLCB0aGUgZGVmYXVsdCBjYWxjdWxh
dGlvbiB3b24ndCBiZSB1c2VkCmFueW1vcmUgKGFzIG11Y2ggYXMgaXQgd291bGRuJ3QgYmUgdXNl
ZCBpZiB0aGVyZSB3YXMgYSByZXNwZWN0aXZlCmNvbW1hbmQgbGluZSBvcHRpb24pLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
