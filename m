Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32551BA46
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:42:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQD3X-0001Jf-VY; Mon, 13 May 2019 15:39:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQD3V-0001JY-UM
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:39:57 +0000
X-Inumbo-ID: 5bc50090-7595-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5bc50090-7595-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:39:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:39:55 -0600
Message-Id: <5CD98FC9020000780022E443@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:39:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-4-git-send-email-andrew.cooper3@citrix.com>
 <5CD986B4020000780022E394@prv1-mh.provo.novell.com>
 <6f460a8e-d78d-425b-b7f1-0f667a1b42be@citrix.com>
In-Reply-To: <6f460a8e-d78d-425b-b7f1-0f667a1b42be@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] xen/watchdog: Drop all locked
 operations on the watchdog_inuse_map
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE3OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDUvMjAxOSAxNjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEw
LjA1LjE5IGF0IDIwOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBB
bGwgbW9kaWZpY2F0aW9ucyB0byB0aGUgd2F0Y2hkb2dfaW51c2VfbWFwIGhhcHBlbiB3aXRoIGQt
PndhdGNoZG9nX2xvY2sgaGVsZCwKPj4+IHNvIHRoZXJlIGFyZSBubyBjb25jdXJyZW5jeSBwcm9i
bGVtcyB0byBkZWFsIHdpdGguCj4+IEJ1dCBjb25jdXJyZW5jeSBwcm9ibGVtcyBjYW4gYWxzbyBv
Y2N1ciBmb3IgcmVhZGVycy4gV2hpbGUKPj4gbm90IGEgcHJvYmxlbSBhZmFpY3QsIGR1bXBfZG9t
YWlucygpIGFjdHVhbGx5IGhhcyBzdWNoIGFuCj4+IGV4YW1wbGUgKGFuZCBoZW5jZSBtaWdodCBi
ZSB3b3J0aCBtZW50aW9uaW5nIGhlcmUpLgo+IAo+IEl0cyBvbmx5IGRlYnVnZ2luZywgYW5kIHdv
dWxkIG5lZWQgdG8gdGFrZSB0aGUgc3BpbmxvY2sgYW55d2F5IHRvIGF2b2lkCj4gYSBUT0NUT1Ug
cmFjZSBiZXR3ZWVuIHdhdGNoZG9nX2ludXNlX21hcCBhbmQgZC0+d2F0Y2hkb2dfdGltZXJbaV0u
ZXhwaXJlcwoKUmlnaHQsIGhlbmNlIG15IHN1Z2dlc3Rpb24gdG8ganVzdCBtZW50aW9uIGl0IGhl
cmUuCgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+PiArKysgYi94ZW4vY29tbW9u
L3NjaGVkdWxlLmMKPj4+IEBAIC0xMDY4LDE3ICsxMDY4LDE1IEBAIHN0YXRpYyBsb25nIGRvbWFp
bl93YXRjaGRvZyhzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBpZCwgdWludDMyX3QgdGltZW91
dCkKPj4+ICAgICAgfQo+Pj4gICAgICBlbHNlIC8qIEFsbG9jYXRlIHRoZSBuZXh0IGF2YWlsYWJs
ZSB0aW1lci4gKi8KPj4+ICAgICAgewo+Pj4gLSAgICAgICAgZm9yICggaWQgPSAwOyBpZCA8IE5S
X0RPTUFJTl9XQVRDSERPR19USU1FUlM7IGlkKysgKQo+Pj4gLSAgICAgICAgewo+Pj4gLSAgICAg
ICAgICAgIGlmICggdGVzdF9hbmRfc2V0X2JpdChpZCwgJmQtPndhdGNoZG9nX2ludXNlX21hcCkg
KQo+Pj4gLSAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+IC0gICAgICAgICAgICBicmVhazsK
Pj4+IC0gICAgICAgIH0KPj4+IC0gICAgICAgIGlmICggaWQgPT0gTlJfRE9NQUlOX1dBVENIRE9H
X1RJTUVSUyApCj4+PiArICAgICAgICBpZCA9IGZmcyh+ZC0+d2F0Y2hkb2dfaW51c2VfbWFwKSAt
IDE7Cj4+IEknbSBzdXJwcmlzZWQgd2UgaGF2ZSBubyAodW5pdmVyc2FsbHkgYXZhaWxhYmxlKSBm
ZnooKS4gSSB3b25kZXIKPj4gdGhvdWdoIHdoZXRoZXIgZmluZF9maXJzdF96ZXJvX2JpdCgpIHdv
dWxkbid0IGJlIHRoZSBiZXR0ZXIKPj4gY2hvaWNlIGhlcmUgYW55d2F5LCBhcyB0aGUgcmVzdWx0
IHdvdWxkbid0IGJlIHVuZGVmaW5lZCBpbgo+PiBjYXNlIE5SX0RPTUFJTl9XQVRDSERPR19USU1F
UlMgZ3JldyB0byAzMi4KPiAKPiBTYWRseSBubyAtIGZpbmRfZmlyc3RfemVyb19iaXQoKSB0YWtl
cyB1bnNpZ25lZCBsb25nICosIHNvIGl0cyB1c2UgaGVyZQo+IGEpIHJlcXVpcmVzIGEgKHZvaWQg
KikgY2FzdCB0byBjb21waWxlLCBhbmQgYikgaXMgZGVmaW5pdGVseSBVQi4KCk9oLCByaWdodCwg
aXQgd29ya3Mgd2l0aCBhIHBvaW50ZXIuIFdvdWxkIHlvdSBtaW5kIGFkZGluZyBhCkJVSUxEX0JV
R19PTigpIHRoZW4gdG8gZXhjbHVkZSB0aGUgVUIgY2FzZSBvZiBmZnMoKT8gV2l0aAp0aGF0IHRo
ZW4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
