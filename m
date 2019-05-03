Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144212FB0
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 15:59:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYfa-0002xw-4I; Fri, 03 May 2019 13:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMYfX-0002xr-QE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:56:07 +0000
X-Inumbo-ID: 2df590b6-6dab-11e9-ab9e-8394b1ecab17
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2df590b6-6dab-11e9-ab9e-8394b1ecab17;
 Fri, 03 May 2019 13:55:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 07:55:58 -0600
Message-Id: <5CCC486E020000780022B9E5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 07:55:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
 <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
In-Reply-To: <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDE1OjQ4LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjEyIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Cj4+ID4+PiBPbiAwMy4wNS4xOSBhdCAwMDoxMywgPHRhbWFzQHRrbGVu
Z3llbC5jb20+IHdyb3RlOgo+PiA+IEBAIC0xMDAyLDcgKzk4OSwxMCBAQCBzdGF0aWMgaW50IHNo
YXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gs
Cj4+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLwo+PiA+ICAgICAgaWYodGVzdF9h
bmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmY3BhZ2UtPmNvdW50X2luZm8pKQo+PiA+ICAg
ICAgICAgIHB1dF9wYWdlKGNwYWdlKTsKClRoaXMgc2hvdWxkIGJlIGFmdGVyIC4uLgoKPj4gPiAt
ICAgIHB1dF9wYWdlKGNwYWdlKTsKPj4gPiArCj4+ID4gKyAgICBCVUdfT04oIXB1dF9jb3VudCk7
CgouLi4gdGhpcywgYmVjYXVzZSAuLi4KCj4+ID4gKyAgICB3aGlsZSAoIHB1dF9jb3VudC0tICkK
Pj4gPiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4+Cj4+IFN0cmljdGx5IHNw
ZWFraW5nIEkgdGhpbmsgdGhlIEJVR19PTigpIHNob3VsZCBiZSBtb3ZlZCBhaGVhZCBvZiB0aGUK
Pj4gaWYoKSBpbiBjb250ZXh0LCBzbyB0aGF0IGEgcHJvYmxlbWF0aWMgcHV0X3BhZ2UoKSB3b3Vs
ZCBub3QgZ2V0Cj4+IGV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0aGUgc3lz
dGVtIGlzIHRvIGRpZSBzb29uIGFmdGVyKS4KPiAKPiBJIGRvbid0IGZvbGxvdyAtIHdoZXJlIGlz
IHRoZSBwcm9ibGVtYXRpYyBwdXRfcGFnZSgpPyBBbmQgd2h5IGlzIGl0IAo+IHByb2JsZW1hdGlj
PwoKLi4uIGlmIGluZGVlZCB0aGUgQlVHX09OKCkgdHJpZ2dlcnMsIHRoZW4gaXQgc2hvdWxkIGRv
IHNvIGJlZm9yZQpwb3RlbnRpYWxseSBwdXR0aW5nIHRoZSBsYXN0IHJlZiBvZiBhIHBhZ2Ugd2hp
Y2ggc2hvdWxkbid0IGJlIHB1dAp0aGF0IHdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
