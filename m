Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A9CDE29
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 11:23:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHPBU-0008Ij-K3; Mon, 07 Oct 2019 09:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHPBT-0008B6-H6
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 09:20:03 +0000
X-Inumbo-ID: a399a7ae-e8e3-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a399a7ae-e8e3-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 09:20:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4AA58AE37;
 Mon,  7 Oct 2019 09:20:00 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191007063519.2912-1-jgross@suse.com>
 <c93415148774c679f415488befffaf31a1affeba.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8542727c-86b1-1d56-3dfe-cc42fae15bc5@suse.com>
Date: Mon, 7 Oct 2019 11:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <c93415148774c679f415488befffaf31a1affeba.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: let credit scheduler control
 its timer all alone
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMTkgMTE6MDUsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0x
MC0wNyBhdCAwODozNSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIGNyZWRpdCBz
Y2hlZHVsZXIgaXMgdGhlIG9ubHkgc2NoZWR1bGVyIHdpdGggdGlja19zdXNwZW5kIGFuZAo+PiB0
aWNrX3Jlc3VtZSBjYWxsYmFja3MuIFRvZGF5IHRob3NlIGNhbGxiYWNrcyBhcmUgaW52b2tlZCB3
aXRob3V0Cj4+IGJlaW5nCj4+IGd1YXJkZWQgYnkgdGhlIHNjaGVkdWxlciBsb2NrIHdoaWNoIGlz
IGNyaXRpY2FsIHdoZW4gYXQgdGhlIHNhbWUgdGhlCj4+IGNwdSB0aG9zZSBjYWxsYmFja3MgYXJl
IGFjdGl2ZSBpcyBiZWluZyBtb3ZlZCB0byBvciBmcm9tIGEgY3B1cG9vbC4KPj4KPj4gQ3Jhc2hl
cyBsaWtlIHRoZSBmb2xsb3dpbmcgYXJlIHBvc3NpYmxlIGR1ZSB0byB0aGF0IHJhY2U6Cj4+Cj4+
IChYRU4pIC0tLS1bIFhlbi00LjEzLjAtOC4wLjEyLWQgIHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0
YWludGVkIF0tLS0tCj4+IChYRU4pIENQVTogICAgNzkKPj4gKFhFTikgUklQOiAgICBlMDA4Ols8
ZmZmZjgyZDA4MDI0NjdkYz5dIHNldF90aW1lcisweDM5LzB4MWY3Cj4+IChYRU4pIFJGTEFHUzog
MDAwMDAwMDAwMDAxMDAwMiAgIENPTlRFWFQ6IGh5cGVydmlzb3IKPj4gPHNuaXA+Cj4+IChYRU4p
IFhlbiBjYWxsIHRyYWNlOgo+PiAoWEVOKSAgICBbPGZmZmY4MmQwODAyNDY3ZGM+XSBzZXRfdGlt
ZXIrMHgzOS8weDFmNwo+PiAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmMxZjQ+XQo+PiBzY2hlZF9j
cmVkaXQuYyNjc2NoZWRfdGlja19yZXN1bWUrMHg1NC8weDU5Cj4+IChYRU4pICAgIFs8ZmZmZjgy
ZDA4MDI0MWRmZT5dIHNjaGVkX3RpY2tfcmVzdW1lKzB4NjcvMHg4Ngo+PiAoWEVOKSAgICBbPGZm
ZmY4MmQwODAyZWRhNTI+XSBtd2FpdC1pZGxlLmMjbXdhaXRfaWRsZSsweDMyYi8weDM1Nwo+PiAo
WEVOKSAgICBbPGZmZmY4MmQwODAyNzkzOWU+XSBkb21haW4uYyNpZGxlX2xvb3ArMHhhNi8weGMy
Cj4+IChYRU4pCj4+IChYRU4pIFBhZ2V0YWJsZSB3YWxrIGZyb20gMDAwMDAwMDAwMDAwMDA0ODoK
Pj4gKFhFTikgIEw0WzB4MDAwXSA9IDAwMDAwMDgyY2ZiOWMwNjMgZmZmZmZmZmZmZmZmZmZmZgo+
PiAoWEVOKSAgTDNbMHgwMDBdID0gMDAwMDAwODJjZmI5YjA2MyBmZmZmZmZmZmZmZmZmZmZmCj4+
IChYRU4pICBMMlsweDAwMF0gPSAwMDAwMDA4MmNmYjlhMDYzIGZmZmZmZmZmZmZmZmZmZmYKPj4g
KFhFTikgIEwxWzB4MDAwXSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZmZmZmZmZmZmZmZmZmZgo+PiAo
WEVOKQo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4+
IChYRU4pIFBhbmljIG9uIENQVSA3OToKPj4gKFhFTikgRkFUQUwgUEFHRSBGQVVMVAo+PiAoWEVO
KSBbZXJyb3JfY29kZT0wMDAwXQo+PiAoWEVOKSBGYXVsdGluZyBsaW5lYXIgYWRkcmVzczogMDAw
MDAwMDAwMDAwMDA0OAo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCj4+Cj4+IFRoZSBjYWxsYmFja3MgYXJlIHVzZWQgd2hlbiB0aGUgY3B1IGlzIGdvaW5n
IHRvIG9yIGNvbWluZyBmcm9tIGlkbGUKPj4gaW4KPj4gb3JkZXIgdG8gYWxsb3cgaGlnaGVyIEMt
c3RhdGVzLgo+Pgo+PiBUaGUgY3JlZGl0IHNjaGVkdWxlciBrbm93cyB3aGVuIGl0IGlzIGdvaW5n
IHRvIHNjaGVkdWxlIGFuIGlkbGUKPj4gc2NoZWR1bGluZyB1bml0IG9yIGFub3RoZXIgb25lIGFm
dGVyIGlkbGUsIHNvIGl0IGNhbiBlYXNpbHkgc3RvcCBvcgo+PiByZXN1bWUgdGhlIHRpbWVyIGl0
c2VsZiByZW1vdmluZyB0aGUgbmVlZCB0byBkbyBzbyB2aWEgdGhlIGNhbGxiYWNrLgo+PiBBcyB0
aGlzIHRpbWVyIGhhbmRsaW5nIGlzIGRvbmUgaW4gdGhlIG1haW4gc2NoZWR1bGluZyBmdW5jdGlv
biB0aGUKPj4gc2NoZWR1bGVyIGxvY2sgaXMgc3RpbGwgaGVsZCwgc28gdGhlIHJhY2Ugd2l0aCBj
cHVwb29sIG9wZXJhdGlvbnMgY2FuCj4+IG5vIGxvbmdlciBvY2N1ci4gTm90ZSB0aGF0IGNhbGxp
bmcgdGhlIGNhbGxiYWNrcyBmcm9tCj4+IHNjaGVkdWxlX2NwdV9ybSgpCj4+IGFuZCBzY2hlZHVs
ZV9jcHVfYWRkKCkgaXMgbm8gbG9uZ2VyIG5lZWRlZCwgYXMgdGhlIHRyYW5zaXRpb25zIHRvIGFu
ZAo+PiBmcm9tIGlkbGUgaW4gdGhlIGNwdXBvb2wgd2l0aCBjcmVkaXQgYWN0aXZlIHdpbGwgYXV0
b21hdGljYWxseSBvY2N1cgo+PiBhbmQgZG8gdGhlIHJpZ2h0IHRoaW5nLgo+Pgo+PiBXaXRoIHRo
ZSBsYXN0IHVzZXIgb2YgdGhlIGNhbGxiYWNrcyBnb25lIHRob3NlIGNhbiBiZSByZW1vdmVkLgo+
Pgo+IFdoaWNoIGlzIGdyZWF0ISA6LTAKPiAKPj4gU3VnZ2VzdGVkLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4KPiBXZWxsLCB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRo
aW5nLCBJIGd1ZXNzIHRoYXQsIGF0IHRoaXMgcG9pbnQ6Cj4gCj4+IC0tLSBhL3hlbi9jb21tb24v
c2NoZWR1bGUuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTMwODIsMzIg
KzMwNzgsMTQgQEAgdm9pZCBzY2hlZHVsZV9kdW1wKHN0cnVjdCBjcHVwb29sICpjKQo+PiAgIAo+
PiAgIHZvaWQgc2NoZWRfdGlja19zdXNwZW5kKHZvaWQpCj4+ICAgewo+PiAtICAgIHN0cnVjdCBz
Y2hlZHVsZXIgKnNjaGVkOwo+PiAtICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29y
X2lkKCk7Cj4+IC0KPj4gLSAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7Cj4+
IC0KPj4gLSAgICBzY2hlZCA9IGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWR1bGVyOwo+PiAtICAg
IHNjaGVkX2RvX3RpY2tfc3VzcGVuZChzY2hlZCwgY3B1KTsKPj4gLSAgICByY3VfaWRsZV9lbnRl
cihjcHUpOwo+PiArICAgIHJjdV9pZGxlX2VudGVyKHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4+ICAg
ICAgIHJjdV9pZGxlX3RpbWVyX3N0YXJ0KCk7Cj4+IC0KPj4gLSAgICByY3VfcmVhZF91bmxvY2so
JnNjaGVkX3Jlc19yY3Vsb2NrKTsKPj4gICB9Cj4+Cj4gc2NoZWRfdGlja19zdXNwZW5kKCkgY291
bGQgZ28gYXdheSBhbmQgcmN1X2lkbGVfZW50ZXIoKSBiZSBjYWxsZWQKPiBkaXJlY3RseSAod2l0
aCByY3VfaWRsZV90aW1lcl9zdGFydCgpIGJlY29taW5nIHN0YXRpYywgYW5kIGNhbGxlZAo+IGRp
cmVjdGx5IGJ5IHJjdV9pZGxlX3RpbWVyX2VudGVyKCkgaXRzZWxmKQo+IAo+IEFuZCB0aGUgc2Ft
ZSBmb3Igc2NoZWRfdGlja19yZXN1bWUoKSwgcmN1X2lkbGVfdGltZXJfc3RvcCgpIGFuZAo+IHJj
dV9pZGxlX2V4aXQoKS4KPiAKPiBJJ2xsIGdpdmUgbXk6Cj4gCj4gUmV2aWV3ZWQtYnk6IERhcmlv
IEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gCj4gVG8gdGhpcyBwYXRjaCwgdGhvdWdo
LCBhcyBJIGFwcHJlY2lhdGUgd2Ugd2FudCBpdCBpbiB0byBiZSBhYmxlIHRvCj4gY29udGludWUg
dGVzdGluZyBjb3JlLXNjaGVkdWxpbmcgZHVyaW5nIDQuMTMgcmMtcGhhc2UuCj4gCj4gSXQnZCBi
ZSBjb29sIGlmIHRoZSBhZGp1c3RtZW50cyBkZXNjcmliZWQgYWJvdmUgKGlmIGFncmVlZCB1cG9u
KSwgY291bGQKPiBjb21lIGFzIGEgZm9sbG93LXVwLgoKTm90ZWQgb24gbXkgInNjaGVkdWxpbmcg
Y2xlYW51cCIgdG9kbyBsaXN0LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
