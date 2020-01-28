Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9014BD2B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:43:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSzb-0002EY-4Y; Tue, 28 Jan 2020 15:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwSza-0002ET-2h
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:41:30 +0000
X-Inumbo-ID: a6697cde-41e4-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6697cde-41e4-11ea-a933-bc764e2007e4;
 Tue, 28 Jan 2020 15:41:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90D9EAEC1;
 Tue, 28 Jan 2020 15:41:28 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
 <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
 <20200128153037.i4jmifa2rk7y2egm@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a223d04-7a59-7dbb-1c94-ea6cb476ed2c@suse.com>
Date: Tue, 28 Jan 2020 16:41:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128153037.i4jmifa2rk7y2egm@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNjozMCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAy
MCBhdCAxMjoxODo0MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMDEuMjAy
MCAyMToyMywgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPj4+IEBAIC0zNiw2ICszNiwyMiBAQCBib29sZWFu
X3BhcmFtKCJlODIwLXZlcmJvc2UiLCBlODIwX3ZlcmJvc2UpOwo+Pj4gIHN0cnVjdCBlODIwbWFw
IGU4MjA7Cj4+PiAgc3RydWN0IGU4MjBtYXAgX19pbml0ZGF0YSBlODIwX3JhdzsKPj4+ICAKPj4+
ICtzdGF0aWMgdW5zaWduZWQgaW50IGZpbmRfcGh5c19hZGRyX2JpdHModm9pZCkKPj4+ICt7Cj4+
PiArICAgIHVpbnQzMl90IGVheDsKPj4+ICsgICAgdW5zaWduZWQgaW50IHBoeXNfYml0cyA9IDM2
Owo+Pj4gKwo+Pj4gKyAgICBlYXggPSBjcHVpZF9lYXgoMHg4MDAwMDAwMCk7Cj4+PiArICAgIGlm
ICggKGVheCA+PiAxNikgPT0gMHg4MDAwICYmIGVheCA+PSAweDgwMDAwMDA4ICkKPj4+ICsgICAg
ewo+Pj4gKyAgICAgICAgcGh5c19iaXRzID0gKHVpbnQ4X3QpY3B1aWRfZWF4KDB4ODAwMDAwMDgp
Owo+Pj4gKyAgICAgICAgaWYgKCBwaHlzX2JpdHMgPiBQQUREUl9CSVRTICkKPj4+ICsgICAgICAg
ICAgICBwaHlzX2JpdHMgPSBQQUREUl9CSVRTOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIHJl
dHVybiBwaHlzX2JpdHM7Cj4+PiArfQo+Pgo+PiBJbnN0ZWFkIG9mIHRoaXMsIGhvdyBhYm91dCBw
dWxsaW5nIGZ1cnRoZXIgYWhlYWQgdGhlIGNhbGwgdG8KPj4gZWFybHlfY3B1X2luaXQoKSBpbiBz
ZXR1cC5jPyAoT3RoZXJ3aXNlIHRoZSBmdW5jdGlvbiB3YW50cyB0bwo+PiBiZSBfX2luaXQgYXQg
bGVhc3QuKQo+IAo+IEkgY2FuIGNlcnRhaW5seSB0cnkgdGhhdCwgYnV0IHRoYXQgd291bGQgcmVx
dWlyZSBtb2RpZnlpbmcgZTgyMC5jCj4gbm9uZXRoZWxlc3MgYmVjYXVzZSB3ZSBjYW4gZHJvcCB0
aGUgY3B1aWQgaW52b2NhdGlvbiBoZXJlIGlmIHRoZSBtb3ZlIGlzCj4gc3VjY2Vzc2Z1bC4KClJp
Z2h0LCBidXQgdGhpcyBjb3VsZCB0aGVuIGJlIGEgc2VwYXJhdGUsIGZvbGxvdy1vbiBjbGVhbnVw
CnBhdGNoIGFpdWkuCgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
Ywo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+Pj4gQEAgLTE4
LDE3ICsxOCwyNyBAQAo+IFsuLi5dCj4+PiBAQCAtNzIsNiArODIsNDMgQEAgY29uc3Qgc3RydWN0
IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4+PiAgICAgIHJldHVy
biAmb3BzOwo+Pj4gIH0KPj4+ICAKPj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJj
YWxsX3BhZ2Uodm9pZCkKPj4+ICt7Cj4+PiArICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxs
X2NvbnRlbnRzIGh5cGVyY2FsbF9tc3I7Cj4+PiArICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGd1
ZXN0X2lkOwo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIG1mbjsKPj4+ICsKPj4+ICsgICAgcmRtc3Js
KEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4+PiArICAgIGlmICggIWd1
ZXN0X2lkLnJhdyApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIGd1ZXN0X2lkLnJhdyA9IGdlbmVy
YXRlX2d1ZXN0X2lkKCk7Cj4+PiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9HVUVTVF9PU19J
RCwgZ3Vlc3RfaWQucmF3KTsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICByZG1zcmwoSFZfWDY0
X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPj4+ICsgICAgaWYgKCAh
aHlwZXJjYWxsX21zci5lbmFibGUgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBtZm4gPSAoKDF1
bGwgPDwgcGFkZHJfYml0cykgLSAxKSA+PiBIVl9IWVBfUEFHRV9TSElGVDsKPj4KPj4gQWxvbmcg
dGhlIGxpbmVzIG9mIHRoZSBhYnN0cmFjdGluZy1hd2F5IHJlcXVlc3QgYWJvdmU6IEhvdyBpcwo+
PiBhbnlvbmUgdG8gbm90aWNlIHdoYXQgZWxzZSBuZWVkcyBjaGFuZ2luZyBpZiBpdCBpcyBkZWNp
ZGVkCj4+IHRoYXQgdGhpcyBwYWdlIGdldHMgbW92ZWQgZWxzZXdoZXJlPwo+IAo+IEkgZG9uJ3Qg
aGF2ZSBhIGdvb2QgYW5zd2VyIHRvIHRoaXMgb3RoZXIgdGhhbiBkb2N1bWVudGluZy4gSXQgaXMK
PiBwcm9iYWJseSBhcyBmcmFnaWxlIGFzIGxpdmVwYXRjaCBvciBwY3B1IHN0dWIuCgpBdCBsZWFz
dCBtYWNyby1pemUgaXQgdGhlbiwgc28gdGhhdCBhbGwgdXNlIHNpdGVzIGNhbiBiZSBlYXNpbHkK
aWRlbnRpZmllZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
