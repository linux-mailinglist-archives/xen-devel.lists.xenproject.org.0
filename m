Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7010C37B6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJIH-0002Q3-E5; Tue, 01 Oct 2019 14:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFJIF-0002Py-MQ
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:38:23 +0000
X-Inumbo-ID: 1e4f1df6-e459-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 1e4f1df6-e459-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 14:38:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5C68AE84;
 Tue,  1 Oct 2019 14:38:21 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
 <20191001113008.dquc2jhxgjenst5a@Air-de-Roger>
 <72ca9492-5204-5f5c-1ee1-2760cf98559a@suse.com>
 <20191001141515.k2ukmwo36kfizx5r@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75773435-0d7b-c803-36a0-07d2a8ec8da7@suse.com>
Date: Tue, 1 Oct 2019 16:38:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001141515.k2ukmwo36kfizx5r@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBP
Y3QgMDEsIDIwMTkgYXQgMDE6NDA6NTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAxLjEwLjIwMTkgMTM6MzAsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVHVlLCBP
Y3QgMDEsIDIwMTkgYXQgMTE6MDc6NTVBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPj4+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYwo+Pj4+IEBAIC0xNDg2LDE1ICsxNDg2LDMzIEBAIHN0YXRpYyBp
bnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICoKPj4+PiAgICAgIGlmICggIWlzX2lvbW11
X2VuYWJsZWQoZCkgKQo+Pj4+ICAgICAgICAgIHJldHVybiAwOwo+Pj4+ICAKPj4+PiAtICAgIC8q
IFByZXZlbnQgZGV2aWNlIGFzc2lnbiBpZiBtZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUg
YmVlbiAKPj4+PiAtICAgICAqIGVuYWJsZWQgZm9yIHRoaXMgZG9tYWluICovCj4+Pj4gLSAgICBp
ZiAoIHVubGlrZWx5KGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKPj4+PiAtICAg
ICAgICAgICAgICAgICAgdm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8
Cj4+Pj4gKyAgICBkb21haW5fbG9jayhkKTsKPj4+PiArCj4+Pj4gKyAgICAvKgo+Pj4+ICsgICAg
ICogUHJldmVudCBkZXZpY2UgYXNzaWdubWVudCBpZiBhbnkgb2YKPj4+PiArICAgICAqIC0gbWVt
IHBhZ2luZwo+Pj4+ICsgICAgICogLSBtZW0gc2hhcmluZwo+Pj4+ICsgICAgICogLSB0aGUgcDJt
X3JhbV9ybyB0eXBlCj4+Pj4gKyAgICAgKiAtIGdsb2JhbCBsb2ctZGlydHkgbW9kZQo+Pj4+ICsg
ICAgICogYXJlIGluIHVzZSBieSB0aGlzIGRvbWFpbi4KPj4+PiArICAgICAqLwo+Pj4+ICsgICAg
aWYgKCB1bmxpa2VseSh2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwK
PiAKPiBXb3VsZCBiZSBuaWNlIHRvIGhhdmUgc29tZSBzeW50YWN0aWMgc3VnYXIgbGlrZSB2bV9l
dmVudF9lbmFibGVkIG9yCj4gc29tZSBzdWNoLgoKSSdsbCBsZWF2ZSB0aGF0IHRvIHRoZSBWTSBl
dmVudCBtYWludGFpbmVycy4KCj4+Pj4gKyNpZmRlZiBDT05GSUdfSFZNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgIChpc19odm1fZG9tYWluKGQpICYmCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAo
ZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCkpIHx8Cj4+Pj4gKyNlbmRpZgo+IAo+IERv
IHlvdSByZWFsbHkgbmVlZCB0aGUgQ09ORklHX0hWTSBndWFyZHM/IGlzX2h2bV9kb21haW4gYWxy
ZWFkeSBoYXMgYQo+IElTX0VOQUJMRUQoQ09ORklHX0hWTSkuCgpTdHJpY3RseSBzcGVha2luZyBh
dCB0aGlzIHBvaW50IGluIHRpbWUgaXQgd291bGRuJ3QgYmUgbmVlZGVkLgpCdXQgZXZlbnR1YWxs
eSBJIHRoaW5rIHdlIHdpbGwgd2FudCBzdWNoLCBhcyB0aGVyZSdzIG5vIHBvaW50CmhhdmluZyBh
IGJpZ2dlciB0aGFuIG5lY2Vzc2FyeSBzdHJ1Y3QgYXJjaF9kb21haW4gKGFuZCBzdHJ1Y3QKYXJj
aF92Y3B1KSBpbiBhICFIVk0gYnVpbGQuIEFjaGlldmluZyB0aGF0IHdvdWxkIGxpa2VseSBpbXBs
eQp0aG91Z2ggdGhhdCB0aGUgZW50aXJlIGQtPmFyY2guaHZtIGRpc2FwcGVhcnMsIGFuZCBoZW5j
ZQp3aXRob3V0IHNvbWUga2luZCBvZiBndWFyZHMgdGhlIGFib3ZlIHdvdWxkIHRoZW4gZmFpbCB0
bwpjb21waWxlLiAoSSBoYXZlIGFjY3VtdWxhdGVkIHF1aXRlIGEgYml0IG9mIHJlbGF0ZWQgd29y
awphbHJlYWR5LCB3aGljaCBpcyBwcm9iYWJseSB3aHkgSSBmZWx0IGxpa2UgYWRkaW5nIHRoZSAj
aWZkZWYtcwpoZXJlLikKCj4+Pj4gICAgICAgICAgICAgICAgICAgIHAybV9nZXRfaG9zdHAybShk
KS0+Z2xvYmFsX2xvZ2RpcnR5KSApCj4+Pgo+Pj4gSXMgc3VjaCBjaGVjayBuZWVkZWQgYW55bW9y
ZT8KPj4+Cj4+PiBXaXRoIHRoZSBlbmFibGluZyBvZiB0aGUgaW9tbXUgcmlnaHQgYXQgZG9tYWlu
IGNyZWF0aW9uIGl0IHNob3VsZG4ndAo+Pj4gYmUgcG9zc2libGUgdG8gZW5hYmxlIGFueSBvZiB0
aGUgYWJvdmUgZmVhdHVyZXMgYXQgYWxsIGFueW1vcmUuCj4+Cj4+IFNlZSBhYm92ZSAtIGFsbCBz
dWNoIGNoZWNrcyBzaG91bGQgbm93IGJlIC8gZ2V0IGNvbnZlcnRlZCB0byBjaGVjawo+PiB3aGV0
aGVyIGRldmljZXMgYXJlIGFzc2lnbmVkLCBub3Qgd2hldGhlciBJT01NVSBwYWdlIHRhYmxlcyBl
eGlzdC4KPj4gQWZ0ZXIgYWxsIHdlIHdhbnQgdG8gcmVmdXNlIHJlcXVlc3RzIG9ubHkgaWYgc3Ry
aWN0bHkgbmVjZXNzYXJ5Lgo+IAo+IE9oIHJpZ2h0LCBJIHdhcyBtaXNzaW5nIHRoZSB3aG9sZSBw
b2ludCB0aGVuLiBTbyB3ZSBzdGlsbCBrZWVwIHRoZQo+IGlvbW11IGVuYWJsZWQgdG9nZXRoZXIg
d2l0aCBpbnRyb3NwZWN0aW9uIG9yIHJhbV9ybyBhcyBsb25nIGFzIHRoZXJlCj4gYXJlIG5vIGRl
dmljZXMgYXNzaWduZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
