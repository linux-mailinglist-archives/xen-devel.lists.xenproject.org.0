Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776A1173DDE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:04:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7j1X-0002Lt-2z; Fri, 28 Feb 2020 17:02:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7j1V-0002Lm-Sa
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 17:02:01 +0000
X-Inumbo-ID: 091ed75a-5a4c-11ea-ad76-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 091ed75a-5a4c-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 17:02:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2124DB2D5;
 Fri, 28 Feb 2020 17:02:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-4-roger.pau@citrix.com>
 <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
 <20200228163135.GD24458@Air-de-Roger.citrite.net>
 <c390bcde-f0c6-fd53-ac17-2e2791b1087a@suse.com>
 <20200228165754.GG24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a82eba0-d6bc-91da-4728-184d8933dfa4@suse.com>
Date: Fri, 28 Feb 2020 18:02:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228165754.GG24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNzo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwNTo0NDo1N1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDIuMjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDI4LCAyMDIwIGF0IDAyOjU4OjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQEAgLTcwNSwy
MCArNzAxLDIyIEBAIGJvb2wgaGFwX2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAq
Y3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+Pj4+PiAgICAgICAgICBpZiAoICFmbHVzaF92Y3B1KGN0
eHQsIHYpICkKPj4+Pj4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4+PiAgCj4+Pj4+IC0gICAg
ICAgIHBhZ2luZ191cGRhdGVfY3IzKHYsIGZhbHNlKTsKPj4+Pj4gKyAgICAgICAgaHZtX2FzaWRf
Zmx1c2hfdmNwdSh2KTsKPj4+Pj4gIAo+Pj4+PiAgICAgICAgICBjcHUgPSByZWFkX2F0b21pYygm
di0+ZGlydHlfY3B1KTsKPj4+Pj4gLSAgICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2NwdShjcHUp
ICkKPj4+Pj4gKyAgICAgICAgaWYgKCBjcHUgIT0gdGhpc19jcHUgJiYgaXNfdmNwdV9kaXJ0eV9j
cHUoY3B1KSApCj4+Pj4+ICAgICAgICAgICAgICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsIG1hc2sp
Owo+Pj4+PiAgICAgIH0KPj4+Pj4gIAo+Pj4+PiAtICAgIC8qIEZsdXNoIFRMQnMgb24gYWxsIENQ
VXMgd2l0aCBkaXJ0eSB2Y3B1IHN0YXRlLiAqLwo+Pj4+PiAtICAgIGZsdXNoX3RsYl9tYXNrKG1h
c2spOwo+Pj4+PiAtCj4+Pj4+IC0gICAgLyogRG9uZS4gKi8KPj4+Pj4gLSAgICBmb3JfZWFjaF92
Y3B1ICggZCwgdiApCj4+Pj4+IC0gICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3Zj
cHUoY3R4dCwgdikgKQo+Pj4+PiAtICAgICAgICAgICAgdmNwdV91bnBhdXNlKHYpOwo+Pj4+PiAr
ICAgIC8qCj4+Pj4+ICsgICAgICogVHJpZ2dlciBhIHZtZXhpdCBvbiBhbGwgcENQVXMgd2l0aCBk
aXJ0eSB2Q1BVIHN0YXRlIGluIG9yZGVyIHRvIGZvcmNlIGFuCj4+Pj4+ICsgICAgICogQVNJRC9W
UElEIGNoYW5nZSBhbmQgaGVuY2UgYWNjb21wbGlzaCBhIGd1ZXN0IFRMQiBmbHVzaC4gTm90ZSB0
aGF0IHZDUFVzCj4+Pj4+ICsgICAgICogbm90IGN1cnJlbnRseSBydW5uaW5nIHdpbGwgYWxyZWFk
eSBiZSBmbHVzaGVkIHdoZW4gc2NoZWR1bGVkIGJlY2F1c2Ugb2YKPj4+Pj4gKyAgICAgKiB0aGUg
QVNJRCB0aWNrbGUgZG9uZSBpbiB0aGUgbG9vcCBhYm92ZS4KPj4+Pj4gKyAgICAgKi8KPj4+Pj4g
KyAgICBvbl9zZWxlY3RlZF9jcHVzKG1hc2ssIGhhbmRsZV9mbHVzaCwgbWFzaywgMCk7Cj4+Pj4+
ICsgICAgd2hpbGUgKCAhY3B1bWFza19lbXB0eShtYXNrKSApCj4+Pj4+ICsgICAgICAgIGNwdV9y
ZWxheCgpOwo+Pj4+Cj4+Pj4gV2h5IGRvIHlvdSBwYXNzIDAgYXMgbGFzdCBhcmd1bWVudD8gSWYg
eW91IHBhc3NlZCAxLCB5b3Ugd291bGRuJ3QKPj4+PiBuZWVkIHRoZSB3aGlsZSgpIGhlcmUsIGhh
bmRsZV9mbHVzaCgpIGNvdWxkIGJlIGVtcHR5LCBhbmQgeW91J2QKPj4+PiBzYXZlIGEgcGVyaGFw
cyBsYXJnZSBhbW91bnQgb2YgQ1BVcyB0byBhbGwgdHJ5IHRvIG1vZGlmeSB0d28KPj4+PiBjYWNo
ZSBsaW5lcyAodGhlIG9uZSB1c2VkIGJ5IG9uX3NlbGVjdGVkX2NwdXMoKSBpdHNlbGYgYW5kIHRo
ZQo+Pj4+IG9uZSBoZXJlKSBpbnN0ZWFkIG9mIGp1c3Qgb25lLiBZZXMsIGxhdGVuY3kgZnJvbSB0
aGUgbGFzdCBDUFUKPj4+PiBjbGVhcmluZyBpdHMgYml0IHRvIHlvdSBiZWluZyBhYmxlIHRvIGV4
aXQgZnJvbSBoZXJlIG1heSBiZSBhCj4+Pj4gbGl0dGxlIGxhcmdlciB0aGlzIHdheSwgYnV0IG92
ZXJhbGwgbGF0ZW5jeSBtYXkgc2hyaW5rIHdpdGggdGhlCj4+Pj4gY3V0IGJ5IGhhbGYgYW1vdW50
IG9mIGF0b21pYyBvcHMgaXNzdWVkIHRvIHRoZSBidXMuCj4+Pgo+Pj4gSW4gZmFjdCBJIHRoaW5r
IHBhc3NpbmcgMCBhcyB0aGUgbGFzdCBhcmd1bWVudCBpcyBmaW5lLCBhbmQKPj4+IGhhbmRsZV9m
bHVzaCBjYW4gYmUgZW1wdHkgaW4gdGhhdCBjYXNlIGFueXdheS4gV2UgZG9uJ3QgcmVhbGx5IGNh
cmUKPj4+IHdoZXRoZXIgb25fc2VsZWN0ZWRfY3B1cyByZXR1cm5zIGJlZm9yZSBhbGwgQ1BVcyBo
YXZlIGV4ZWN1dGVkIHRoZQo+Pj4gZHVtbXkgZnVuY3Rpb24sIGFzIGxvbmcgYXMgYWxsIG9mIHRo
ZW0gaGF2ZSB0YWtlbiBhIHZtZXhpdC4gVXNpbmcgMAo+Pj4gYWxyZWFkeSBndWFyYW50ZWVzIHRo
YXQgQUZBSUNULgo+Pgo+PiBJc24ndCBpdCB0aGF0IHRoZSBjYWxsZXIgYW50cyB0byBiZSBndWFy
YW50ZWVkIHRoYXQgdGhlIGZsdXNoCj4+IGhhcyBhY3R1YWxseSBvY2N1cnJlZCAob3IgYXQgbGVh
c3QgdGhhdCBubyBmdXJ0aGVyIGluc25zIGNhbgo+PiBiZSBleGVjdXRlZCBwcmlvciB0byB0aGUg
Zmx1c2ggaGFwcGVuaW5nLCBpLmUuIGF0IGxlYXN0IHRoZSBWTQo+PiBleGl0IGhhdmluZyBvY2N1
cnJlZCk/Cj4gCj4gWWVzLCBidXQgdGhhdCB3b3VsZCBoYXBwZW4gd2l0aCAwIGFzIHRoZSBsYXN0
IGFyZ3VtZW50IGFscmVhZHksIHNlZQo+IHRoZSBjb2RlIGluIHNtcF9jYWxsX2Z1bmN0aW9uX2lu
dGVycnVwdDoKPiAKPiAgICAgaWYgKCBjYWxsX2RhdGEud2FpdCApCj4gICAgIHsKPiAgICAgICAg
ICgqZnVuYykoaW5mbyk7Cj4gICAgICAgICBzbXBfbWIoKTsKPiAgICAgICAgIGNwdW1hc2tfY2xl
YXJfY3B1KGNwdSwgJmNhbGxfZGF0YS5zZWxlY3RlZCk7Cj4gICAgIH0KPiAgICAgZWxzZQo+ICAg
ICB7Cj4gICAgICAgICBzbXBfbWIoKTsKPiAgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwg
JmNhbGxfZGF0YS5zZWxlY3RlZCk7Cj4gICAgICAgICAoKmZ1bmMpKGluZm8pOwo+ICAgICB9Cj4g
Cj4gVGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB3aGV0aGVyIG9uX3NlbGVjdGVkX2NwdXMgY2FuIHJl
dHVybiBiZWZvcmUgYWxsCj4gdGhlIGZ1bmN0aW9ucyBoYXZlIGJlZW4gZXhlY3V0ZWQgb24gYWxs
IENQVXMsIG9yIHdoZXRoZXIgYWxsIENQVXMgaGF2ZQo+IHRha2VuIGEgdm1leGl0LiBUaGUgbGF0
ZXIgaXMgZmluZSBmb3Igb3VyIHVzZS1jYXNlLgoKT2gsIHllcyAtIHJpZ2h0IHlvdSBhcmUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
