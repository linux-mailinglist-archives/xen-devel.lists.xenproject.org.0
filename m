Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1341879A
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 11:18:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOf9y-0008OJ-Kj; Thu, 09 May 2019 09:16:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOf9w-0008OE-Oi
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 09:16:12 +0000
X-Inumbo-ID: 157d1daf-723b-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 157d1daf-723b-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 09:16:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 03:16:09 -0600
Message-Id: <5CD3EFD5020000780022D0D8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 03:16:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-3-sstabellini@kernel.org>
In-Reply-To: <20190508224727.11549-3-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>,
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

Pj4+IE9uIDA5LjA1LjE5IGF0IDAwOjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2NvbW1vbi9wZHguYwo+ICsrKyBiL3hlbi9jb21tb24vcGR4LmMKPiBAQCAt
NTAsOSArNTAsMTMgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9tYXNrKHU2NCBtYXNrKQo+ICAg
ICAgcmV0dXJuIG1hc2s7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIFdlIGFsd2F5cyBtYXAgdGhlIGZp
cnN0IDE8PE1BWF9PUkRFUiBwYWdlcyBvZiBSQU0sIGhlbmNlLCB0aGV5Cj4gKyAqIGFyZSBsZWZ0
IHVuY29tcHJlc3NlZC4KPiArICovCj4gIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFz
ZV9hZGRyKQo+ICB7Cj4gLSAgICByZXR1cm4gZmlsbF9tYXNrKGJhc2VfYWRkciAtIDEpOwo+ICsg
ICAgcmV0dXJuIGZpbGxfbWFzayhtYXgoYmFzZV9hZGRyLCAodTY0KTEgPDwgKE1BWF9PUkRFUiAr
IFBBR0VfU0hJRlQpKSAtIDEpOwoKUGVyc29uYWxseSBJIHRoaW5rIHRoYXQgZGVzcGl0ZSB0aGUg
c3Vycm91bmRpbmcgdTY0IHRoaXMgc2hvdWxkIGJlCnVpbnQ2NF90LiBZb3UgY291bGQgYXZvaWQg
dGhpcyBhbHRvZ2V0aGVyIGJ5IHVzaW5nIDFVTEwuCgo+IEBAIC04MCw2ICs4NCw4IEBAIHZvaWQg
X19pbml0IHBmbl9wZHhfaG9sZV9zZXR1cCh1bnNpZ25lZCBsb25nIG1hc2spCj4gICAgICAgKiBU
aGlzIGd1YXJhbnRlZXMgdGhhdCBwYWdlLXBvaW50ZXIgYXJpdGhtZXRpYyByZW1haW5zIHZhbGlk
IHdpdGhpbgo+ICAgICAgICogY29udGlndW91cyBhbGlnbmVkIHJhbmdlcyBvZiAyXk1BWF9PUkRF
UiBwYWdlcy4gQW1vbmcgb3RoZXJzLCBvdXIKPiAgICAgICAqIGJ1ZGR5IGFsbG9jYXRvciByZWxp
ZXMgb24gdGhpcyBhc3N1bXB0aW9uLgo+ICsgICAgICoKPiArICAgICAqIElmIHRoZSBsb2dpYyBj
aGFuZ2VzIGhlcmUsIHdlIG1pZ2h0IGhhdmUgdG8gdXBkYXRlIGluaXRfcGR4IHRvby4KPiAgICAg
ICAqLwo+ICAgICAgZm9yICggaiA9IE1BWF9PUkRFUi0xOyA7ICkKPiAgICAgIHsKCkF0IGZpcnN0
IEkgd2FzIHB1enpsZWQgYnkgYSByZWZlcmVuY2UgdG8gc29tZXRoaW5nIHRoYXQgSSBkaWRuJ3QK
dGhpbmsgd291bGQgZXhpc3QsIGFuZCBJIHdhcyB0aGVuIGFzc3VtaW5nIHlvdSBtZWFuCnBkeF9p
bml0X21hc2soKS4gQnV0IHRoZW4gSSB0aG91Z2h0IEknZCB1c2UgZ3JlcCBuZXZlcnRoZWxlc3Ms
CmFuZCBmb3VuZCB0aGUgQXJtIGluc3RhbmNlIG9mIGl0ICh3aGljaCB0aGlzIHBhdGNoIGFjdHVh
bGx5CmNoYW5nZXMsIGJ1dCBJJ20gcmFyZWx5IGxvb2tpbmcgYXQgdGhlICJkaWZmIC1wIiBzeW1i
b2xzIHdoZW4KY29udGV4dCBpcyBvdGhlcndpc2Ugb2J2aW91cykuIElmIHlvdSBtYWtlIHN1Y2gg
YSByZWZlcmVuY2UgaW4KY29tbW9uIGNvZGUgKEkgdGhpbmsgSSdkIHByZWZlciBpZiBpdCB3YXMg
c2ltcGx5IG9taXR0ZWQpLCB0aGVuCnBsZWFzZSBuYW1lIHRoZSBzcGVjaWZpYyBhcmNoaXRlY3R1
cmUgYXMgd2VsbCwgb3IgbWFrZSBvdGhlcndpc2UKY2xlYXIgdGhhdCB0aGlzIGlzbid0IGEgc3lt
Ym9sIHRoYXQncyBjb21tb24gb3IgcmVxdWlyZWQgdG8gYmUKc3VwcGxpZWQgYnkgZWFjaCBhcmNo
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
