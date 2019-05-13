Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944911B969
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:04:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCS5-0005oL-07; Mon, 13 May 2019 15:01:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCS3-0005o8-Im
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:01:15 +0000
X-Inumbo-ID: f3960f41-758f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3960f41-758f-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:01:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:01:13 -0600
Message-Id: <5CD986B4020000780022E394@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:01:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-4-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1557512884-32395-4-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDIwOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQWxsIG1vZGlmaWNhdGlvbnMgdG8gdGhlIHdhdGNoZG9nX2ludXNlX21hcCBoYXBwZW4g
d2l0aCBkLT53YXRjaGRvZ19sb2NrIGhlbGQsCj4gc28gdGhlcmUgYXJlIG5vIGNvbmN1cnJlbmN5
IHByb2JsZW1zIHRvIGRlYWwgd2l0aC4KCkJ1dCBjb25jdXJyZW5jeSBwcm9ibGVtcyBjYW4gYWxz
byBvY2N1ciBmb3IgcmVhZGVycy4gV2hpbGUKbm90IGEgcHJvYmxlbSBhZmFpY3QsIGR1bXBfZG9t
YWlucygpIGFjdHVhbGx5IGhhcyBzdWNoIGFuCmV4YW1wbGUgKGFuZCBoZW5jZSBtaWdodCBiZSB3
b3J0aCBtZW50aW9uaW5nIGhlcmUpLgoKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiAr
KysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMTA2OCwxNyArMTA2OCwxNSBAQCBzdGF0
aWMgbG9uZyBkb21haW5fd2F0Y2hkb2coc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgaWQsIHVp
bnQzMl90IHRpbWVvdXQpCj4gICAgICB9Cj4gICAgICBlbHNlIC8qIEFsbG9jYXRlIHRoZSBuZXh0
IGF2YWlsYWJsZSB0aW1lci4gKi8KPiAgICAgIHsKPiAtICAgICAgICBmb3IgKCBpZCA9IDA7IGlk
IDwgTlJfRE9NQUlOX1dBVENIRE9HX1RJTUVSUzsgaWQrKyApCj4gLSAgICAgICAgewo+IC0gICAg
ICAgICAgICBpZiAoIHRlc3RfYW5kX3NldF9iaXQoaWQsICZkLT53YXRjaGRvZ19pbnVzZV9tYXAp
ICkKPiAtICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0gICAgICAgICAgICBicmVhazsKPiAt
ICAgICAgICB9Cj4gLSAgICAgICAgaWYgKCBpZCA9PSBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJT
ICkKPiArICAgICAgICBpZCA9IGZmcyh+ZC0+d2F0Y2hkb2dfaW51c2VfbWFwKSAtIDE7CgpJJ20g
c3VycHJpc2VkIHdlIGhhdmUgbm8gKHVuaXZlcnNhbGx5IGF2YWlsYWJsZSkgZmZ6KCkuIEkgd29u
ZGVyCnRob3VnaCB3aGV0aGVyIGZpbmRfZmlyc3RfemVyb19iaXQoKSB3b3VsZG4ndCBiZSB0aGUg
YmV0dGVyCmNob2ljZSBoZXJlIGFueXdheSwgYXMgdGhlIHJlc3VsdCB3b3VsZG4ndCBiZSB1bmRl
ZmluZWQgaW4KY2FzZSBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTIGdyZXcgdG8gMzIuCgpBbHNv
IHdoaWxlIHRoaXMgbG9va3MgdG8gYmUgbG9naWNhbGx5IGluZGVwZW5kZW50IG9mIHBhdGNoIDIs
IGl0CmRvZXNuJ3QgbG9vayBsaWtlIGl0IHdvdWxkIGFwcGx5IG9uIGl0cyBvd24uCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
