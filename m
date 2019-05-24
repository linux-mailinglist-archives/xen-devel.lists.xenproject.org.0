Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9329121
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 08:42:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU3qf-0006Ve-NU; Fri, 24 May 2019 06:38:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU3qe-0006VZ-0v
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 06:38:36 +0000
X-Inumbo-ID: 8d5f393d-7dee-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8d5f393d-7dee-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 06:38:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 00:38:33 -0600
Message-Id: <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 00:38:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@prv1-mh.provo.novell.com>
 <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
In-Reply-To: <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
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

Pj4+IE9uIDI0LjA1LjE5IGF0IDA3OjQxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wNS8yMDE5IDEyOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjIuMDUuMTkgYXQg
MTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4gQEAgLTMxODUsMjIg
KzMxODUsNiBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHko
Cj4+PiAgCj4+PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+PiAgCj4+PiAtICAgIC8q
Cj4+PiAtICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2ls
bCBkbyBncmFudC10YWJsZSBvcHMKPj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBHcmFu
dC10YWJsZSBjb2RlIGN1cnJlbnRseSBkb2VzIGNvcHlfdG8vZnJvbV9ndWVzdAo+Pj4gLSAgICAg
KiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4gbG9jaywgd2hpY2ggdGhpcyB0ZXN0
IHdvdWxkIGRpc2FsbG93Lgo+Pj4gLSAgICAgKiBUaGUgdGVzdCBpcyBub3QgbmVlZGVkIHVudGls
IHdlIGltcGxlbWVudCBzbGVlcGluZy1vbi13YWl0cXVldWUgd2hlbgo+Pj4gLSAgICAgKiB3ZSBh
Y2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cuCj4+PiAt
ICAgICAqLwo+Pj4gLSNpZiAwCj4+PiAtICAgIC8qCj4+PiAtICAgICAqIElmIHRoZSByZXF1aXJl
ZCBndWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0LCB0aGlzIGZ1bmN0aW9uIG1heSBzbGVlcC4KPj4+
IC0gICAgICogSGVuY2Ugd2UgYmFpbCBpbW1lZGlhdGVseSBpZiBjYWxsZWQgZnJvbSBhdG9taWMg
Y29udGV4dC4KPj4+IC0gICAgICovCj4+PiAtICAgIGlmICggaW5fYXRvbWljKCkgKQo+Pj4gLSAg
ICAgICAgcmV0dXJuIEhWTVRSQU5TX3VuaGFuZGxlYWJsZTsKPj4+IC0jZW5kaWYKPj4gCj4+IERl
YWxpbmcgd2l0aCB0aGlzIFRPRE8gaXRlbSBpcyBvZiBjb3Vyc2UgbXVjaCBhcHByZWNpYXRlZCwg
YnV0Cj4+IHNob3VsZCBpdCByZWFsbHkgYmUgZGVsZXRlZCBhbHRvZ2V0aGVyPyBUaGUgYmlnLWRv
bWFpbi1sb2NrIGlzc3VlCj4+IGlzIGdvbmUgYWZhaXIsIGluIHdoaWNoIGNhc2UgZHJvcHBpbmcg
dGhlICNpZiAwIHdvdWxkIHNlZW0KPj4gcG9zc2libGUgdG8gbWUsIGV2ZW4gaWYgaXQncyBub3Qg
c3RyaWN0bHkgbmVlZGVkIHdpdGhvdXQgdGhlIHNsZWVwLQo+PiBvbi13YWl0cXVldWUgYmVoYXZp
b3IgbWVudGlvbmVkLgo+IAo+IEkganVzdCBoYWQgYSBsb29rIGFuZCBmb3VuZCB0aGUgZm9sbG93
aW5nIHBhdGg6Cj4gCj4gZG9fZG9tY3RsKCkgKHRha2VzIGRvbWN0bF9sb2NrIGFuZCBoeXBlcmNh
bGxfZGVhZGxvY2tfbXV0ZXgpCj4gICBhcmNoX2RvX2RvbWN0bCgpCj4gICAgIHJhd19jb3B5X2Zy
b21fZ3Vlc3QoKQo+ICAgICAgIGNvcHlfZnJvbV91c2VyX2h2bSgpCj4gICAgICAgICBodm1fY29w
eV9mcm9tX2d1ZXN0X2xpbmVhcigpCj4gICAgICAgICAgIF9faHZtX2NvcHkoKQo+IAo+IFNvIG5v
LCB3ZSBjYW4ndCBkbyB0aGUgaW5fYXRvbWljKCkgdGVzdCBJTU8uCgpPaCwgcmlnaHQgLSB0aGF0
J3MgYSBQVkggY29uc3RyYWludCB0aGF0IGNvdWxkIHByb2JhYmx5IG5vdCBldmVuCmJlIHRob3Vn
aHQgb2YgdGhhdCB0aGUgdGltZSB0aGUgY29tbWVudCB3YXMgd3JpdHRlbi4gSSdtIHN0aWxsCm9m
IHRoZSBvcGluaW9uIHRob3VnaCB0aGF0IGF0IGxlYXN0IHRoZSBzdGlsbCBhcHBsaWNhYmxlIHBh
cnQgb2YKdGhlIGNvbW1lbnQgc2hvdWxkIGJlIGtlcHQgaW4gcGxhY2UuIFdoZXRoZXIgdGhpcyBt
ZWFucyBhbHNvCmtlZXBpbmcgaW5fYXRvbWljKCkgaXRzZWxmIGlzIHRoZW4gYW4gaW5kZXBlbmRl
bnQgcXVlc3Rpb24sIGkuZS4KSSB3b3VsZG4ndCBjb25zaWRlciBpdCBvdmVybHkgYmFkIGlmIHRo
ZXJlIHdhcyBubyBpbXBsZW1lbnRhdGlvbgppbiB0aGUgdHJlZSwgYnV0IHRoZSBhYm92ZSBzdGls
bCBzZXJ2ZWQgYXMgZG9jdW1lbnRhdGlvbiBvZiB3aGF0CndvdWxkIG5lZWQgdG8gYmUgcmUtYWRk
ZWQuIFN0aWxsIG15IHByZWZlcmVuY2Ugd291bGQgYmUgZm9yIGl0CnRvIGJlIGtlcHQuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
