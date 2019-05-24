Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC132934C
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 10:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU5jt-00084S-C4; Fri, 24 May 2019 08:39:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU5jr-00084N-Hi
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 08:39:43 +0000
X-Inumbo-ID: 795d8470-7dff-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 795d8470-7dff-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 08:39:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 02:39:41 -0600
Message-Id: <5CE7ADCA0200007800231E77@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 02:39:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@prv1-mh.provo.novell.com>
 <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
 <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
 <2a816b64-ae01-23e6-d287-1622e55bc295@suse.com>
In-Reply-To: <2a816b64-ae01-23e6-d287-1622e55bc295@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDEwOjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
NC8wNS8yMDE5IDA4OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjQuMDUuMTkgYXQg
MDc6NDEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMjIvMDUvMjAxOSAxMjoxMCwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMjIuMDUuMTkgYXQgMTE6NDUsIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+Pj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4+Pj4gQEAgLTMxODUsMjIgKzMxODUsNiBA
QCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoCj4+Pj4+ICAK
Pj4+Pj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+Pj4+PiAgCj4+Pj4+IC0gICAgLyoK
Pj4+Pj4gLSAgICAgKiBYWFggRGlzYWJsZSBmb3IgNC4xLjA6IFBWLW9uLUhWTSBkcml2ZXJzIHdp
bGwgZG8gZ3JhbnQtdGFibGUgb3BzCj4+Pj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBH
cmFudC10YWJsZSBjb2RlIGN1cnJlbnRseSBkb2VzIGNvcHlfdG8vZnJvbV9ndWVzdAo+Pj4+PiAt
ICAgICAqIGFjY2Vzc2VzIHVuZGVyIHRoZSBiaWcgcGVyLWRvbWFpbiBsb2NrLCB3aGljaCB0aGlz
IHRlc3Qgd291bGQgZGlzYWxsb3cuCj4+Pj4+IC0gICAgICogVGhlIHRlc3QgaXMgbm90IG5lZWRl
ZCB1bnRpbCB3ZSBpbXBsZW1lbnQgc2xlZXBpbmctb24td2FpdHF1ZXVlIHdoZW4KPj4+Pj4gLSAg
ICAgKiB3ZSBhY2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBu
b3cuCj4+Pj4+IC0gICAgICovCj4+Pj4+IC0jaWYgMAo+Pj4+PiAtICAgIC8qCj4+Pj4+IC0gICAg
ICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9yeSBpcyBwYWdlZCBvdXQsIHRoaXMgZnVuY3Rp
b24gbWF5IHNsZWVwLgo+Pj4+PiAtICAgICAqIEhlbmNlIHdlIGJhaWwgaW1tZWRpYXRlbHkgaWYg
Y2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQuCj4+Pj4+IC0gICAgICovCj4+Pj4+IC0gICAgaWYg
KCBpbl9hdG9taWMoKSApCj4+Pj4+IC0gICAgICAgIHJldHVybiBIVk1UUkFOU191bmhhbmRsZWFi
bGU7Cj4+Pj4+IC0jZW5kaWYKPj4+Pgo+Pj4+IERlYWxpbmcgd2l0aCB0aGlzIFRPRE8gaXRlbSBp
cyBvZiBjb3Vyc2UgbXVjaCBhcHByZWNpYXRlZCwgYnV0Cj4+Pj4gc2hvdWxkIGl0IHJlYWxseSBi
ZSBkZWxldGVkIGFsdG9nZXRoZXI/IFRoZSBiaWctZG9tYWluLWxvY2sgaXNzdWUKPj4+PiBpcyBn
b25lIGFmYWlyLCBpbiB3aGljaCBjYXNlIGRyb3BwaW5nIHRoZSAjaWYgMCB3b3VsZCBzZWVtCj4+
Pj4gcG9zc2libGUgdG8gbWUsIGV2ZW4gaWYgaXQncyBub3Qgc3RyaWN0bHkgbmVlZGVkIHdpdGhv
dXQgdGhlIHNsZWVwLQo+Pj4+IG9uLXdhaXRxdWV1ZSBiZWhhdmlvciBtZW50aW9uZWQuCj4+Pgo+
Pj4gSSBqdXN0IGhhZCBhIGxvb2sgYW5kIGZvdW5kIHRoZSBmb2xsb3dpbmcgcGF0aDoKPj4+Cj4+
PiBkb19kb21jdGwoKSAodGFrZXMgZG9tY3RsX2xvY2sgYW5kIGh5cGVyY2FsbF9kZWFkbG9ja19t
dXRleCkKPj4+ICAgYXJjaF9kb19kb21jdGwoKQo+Pj4gICAgIHJhd19jb3B5X2Zyb21fZ3Vlc3Qo
KQo+Pj4gICAgICAgY29weV9mcm9tX3VzZXJfaHZtKCkKPj4+ICAgICAgICAgaHZtX2NvcHlfZnJv
bV9ndWVzdF9saW5lYXIoKQo+Pj4gICAgICAgICAgIF9faHZtX2NvcHkoKQo+Pj4KPj4+IFNvIG5v
LCB3ZSBjYW4ndCBkbyB0aGUgaW5fYXRvbWljKCkgdGVzdCBJTU8uCj4+IAo+PiBPaCwgcmlnaHQg
LSB0aGF0J3MgYSBQVkggY29uc3RyYWludCB0aGF0IGNvdWxkIHByb2JhYmx5IG5vdCBldmVuCj4+
IGJlIHRob3VnaHQgb2YgdGhhdCB0aGUgdGltZSB0aGUgY29tbWVudCB3YXMgd3JpdHRlbi4gSSdt
IHN0aWxsCj4+IG9mIHRoZSBvcGluaW9uIHRob3VnaCB0aGF0IGF0IGxlYXN0IHRoZSBzdGlsbCBh
cHBsaWNhYmxlIHBhcnQgb2YKPj4gdGhlIGNvbW1lbnQgc2hvdWxkIGJlIGtlcHQgaW4gcGxhY2Uu
IFdoZXRoZXIgdGhpcyBtZWFucyBhbHNvCj4+IGtlZXBpbmcgaW5fYXRvbWljKCkgaXRzZWxmIGlz
IHRoZW4gYW4gaW5kZXBlbmRlbnQgcXVlc3Rpb24sIGkuZS4KPj4gSSB3b3VsZG4ndCBjb25zaWRl
ciBpdCBvdmVybHkgYmFkIGlmIHRoZXJlIHdhcyBubyBpbXBsZW1lbnRhdGlvbgo+PiBpbiB0aGUg
dHJlZSwgYnV0IHRoZSBhYm92ZSBzdGlsbCBzZXJ2ZWQgYXMgZG9jdW1lbnRhdGlvbiBvZiB3aGF0
Cj4+IHdvdWxkIG5lZWQgdG8gYmUgcmUtYWRkZWQuIFN0aWxsIG15IHByZWZlcmVuY2Ugd291bGQg
YmUgZm9yIGl0Cj4+IHRvIGJlIGtlcHQuCj4gCj4gV291bGQgeW91IGJlIG9rYXkgd2l0aCByZXBs
YWNpbmcgdGhlIHJlbW92ZWQgc3R1ZmYgYWJvdmUgd2l0aDoKPiAKPiAvKgo+ICAqIElmIHRoZSBy
ZXF1aXJlZCBndWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0IHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVw
Lgo+ICAqIFNvIGluIHRoZW9yeSB3ZSBzaG91bGQgYmFpbCBvdXQgaWYgY2FsbGVkIGluIGF0b21p
YyBjb250ZXh0Lgo+ICAqIFVuZm9ydHVuYXRlbHkgdGhpcyBpcyB0cnVlIGZvciBQVkggZG9tMCBk
b2luZyBkb21jdGwgY2FsbHMgd2hpY2gKCi4uLiB0aGlzIGlzIHRydWUgYXQgbGVhc3QgZm9yIC4u
LgoKPiAgKiBob2xkcyB0aGUgZG9tY3RsIGxvY2sgd2hlbiBhY2Nlc3NpbmcgZG9tMCBtZW1vcnku
IE9UT0ggZG9tMCBtZW1vcnkKPiAgKiBzaG91bGQgbmV2ZXIgYmUgcGFnZWQgb3V0LCBzbyB3ZSBh
cmUgZmluZSB3aXRob3V0IHRlc3RpbmcgZm9yCj4gICogYXRvbWljIGNvbnRleHQuCj4gICovCgpO
b3Qgc3VyZSBhYm91dCB0aGlzIERvbTAtc3BlY2lmaWMgcmVtYXJrOiBBcmUgd2UgY2VydGFpbiB0
aGVyZSBhcmUKbm8gb3RoZXIgcGF0aHMsIHNpbWlsYXIgdG8gdGhlIGdudHRhYiBvbmUgaGF2aW5n
IGJlZW4gbWVudGlvbmVkIHRpbGwKbm93PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
