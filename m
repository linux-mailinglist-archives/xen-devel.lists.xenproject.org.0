Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36D517B2B
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hON4Q-00043y-Fo; Wed, 08 May 2019 13:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hON4O-00043s-Ve
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:57:17 +0000
X-Inumbo-ID: 2e6b2c58-7199-11e9-ae51-4fe6690db208
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e6b2c58-7199-11e9-ae51-4fe6690db208;
 Wed, 08 May 2019 13:57:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:57:12 -0600
Message-Id: <5CD2E037020000780022CE2D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:57:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
 <32a5db38-530f-1e6b-cbbd-f21ad687b149@citrix.com>
In-Reply-To: <32a5db38-530f-1e6b-cbbd-f21ad687b149@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE4OjE1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzIvMTkgNzo1OCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgaXMgd2hh
dCBib3RoIGNhbGxlcnMgb2YgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpIGluIG1lbW9yeS5jIHdh
bnQKPj4gKGZvciB0aGUgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIGNhc2UpLCBhbmQgaXQgaXMg
YWxzbyB3aGF0IGJvdGgKPj4gY2FsbGVycyBpbiBnbnR0YWJfdHJhbnNmZXIoKSBuZWVkIChidXQg
aGF2ZSBiZWVuIGxhY2tpbmcpLiBUaGUgb3RoZXIKPj4gKHg4Ni1zcGVjaWZpYykgY2FsbGVycyBh
cmUgYWxsIEhWTS1vbmx5LCBhbmQgaGVuY2UgdW5hZmZlY3RlZCBieSB0aGlzCj4+IGNoYW5nZS4K
PiAKPiBTb3JyeSwgd2hhdCdzIGdvaW5nIG9uIGhlcmU/CgpJIGd1ZXNzIHRoYXQncyBhIEphbi13
cm90ZS1hbi11bnBhcnNhYmxlLWRlc2NyaXB0aW9uLW9uY2UtYWdhaW4KcXVlc3Rpb24/CgoxKSBU
aGUgdHdvIGNhbGxlcnMgaW4gY29tbW9uL21lbW9yeS5jIGN1cnJlbnRseSBjYWxsIHNldF9ncGZu
X2Zyb21fbWZuKCkKdGhlbXNlbHZlcywgc28gbW92aW5nIHRoZSBjYWxsIGludG8gZ3Vlc3RfcGh5
c21hcF9hZGRfcGFnZSgpIGhlbHBzCnRpZHkgdGhlaXIgY29kZS4KCjIpIFRoZSB0d28gY2FsbGVy
cyBpbiBjb21tb24vZ3JhbnRfdGFibGUuYyBmYWlsIHRvIG1ha2UgdGhhdCBjYWxsIGFsb25nc2lk
ZQp0aGUgb25lIHRvIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSwgc28gd2lsbCBhY3R1YWxseSBn
ZXQgZml4ZWQgYnkgdGhlCmNoYW5nZS4KCjMpIE90aGVyIGNhbGxlcnMgYXJlIEhWTSBvbmx5IGFu
ZCBhcmUgaGVuY2UgdW5hZmZlY3RlZCBieSBhIGNoYW5nZSB0bwp0aGUgZnVuY3Rpb24ncyAhcGFn
aW5nX21vZGVfdHJhbnNsYXRlKCkgcGFydC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
