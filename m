Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14B187C6
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 11:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOfKV-0000qD-Is; Thu, 09 May 2019 09:27:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOfKU-0000q8-J0
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 09:27:06 +0000
X-Inumbo-ID: 9bd63e21-723c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9bd63e21-723c-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 09:27:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 03:27:04 -0600
Message-Id: <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 03:27:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,<andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
In-Reply-To: <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE3OjQwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIzLzA0LzIwMTkgMDk6MTAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+IEBA
IC0xNjMsMTUgKzE2MywyMyBAQCBzdHJ1Y3QgdmNwdQo+PiAgICAgICB2b2lkICAgICAgICAgICAg
KnNjaGVkX3ByaXY7ICAgIC8qIHNjaGVkdWxlci1zcGVjaWZpYyBkYXRhICovCj4+ICAgCj4+ICAg
ICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVuc3RhdGU7Cj4+ICsKPj4gKyAgICBzcGlu
bG9ja190ICAgICAgbWFwcGVkX3J1bnN0YXRlX2xvY2s7Cj4+ICsKPj4gICAjaWZuZGVmIENPTkZJ
R19DT01QQVQKPj4gICAjIGRlZmluZSBydW5zdGF0ZV9ndWVzdCh2KSAoKHYpLT5ydW5zdGF0ZV9n
dWVzdCkKPj4gICAgICAgWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X3J1bnN0YXRlX2luZm9fdCkgcnVu
c3RhdGVfZ3Vlc3Q7IC8qIGd1ZXN0IGFkZHJlc3MgKi8KPj4gKyAgICB2Y3B1X3J1bnN0YXRlX2lu
Zm9fdCAqbWFwcGVkX3J1bnN0YXRlOwo+PiAgICNlbHNlCj4+ICAgIyBkZWZpbmUgcnVuc3RhdGVf
Z3Vlc3QodikgKCh2KS0+cnVuc3RhdGVfZ3Vlc3QubmF0aXZlKQo+PiAgICAgICB1bmlvbiB7Cj4+
ICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb190KSBuYXRpdmU7
Cj4+ICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb19jb21wYXRf
dCkgY29tcGF0Owo+PiAgICAgICB9IHJ1bnN0YXRlX2d1ZXN0OyAvKiBndWVzdCBhZGRyZXNzICov
Cj4+ICsgICAgdW5pb24gewo+PiArICAgICAgICB2Y3B1X3J1bnN0YXRlX2luZm9fdCogbmF0aXZl
Owo+PiArICAgICAgICB2Y3B1X3J1bnN0YXRlX2luZm9fY29tcGF0X3QqIGNvbXBhdDsKPj4gKyAg
ICB9IG1hcHBlZF9ydW5zdGF0ZTsgLyogZ3Vlc3QgYWRkcmVzcyAqLwo+IAo+IFRoZSBjb21iaW5h
dGlvbiBvZiBtYXBwZWRfcnVuc3RhdGUgYW5kIHJ1bnN0YXRlX2d1ZXN0IGlzIGEgYml0IGNvbmZ1
c2luZy4gSSAKPiB0aGluayB5b3Ugd2FudCB0byByZXdvcmsgdGhlIGludGVyZmFjZSB0byBzaG93
IHRoYXQgb25seSBvbmUgaXMgcG9zc2libGUgYXQgdGhlIAo+IHRpbWUgYW5kIG1ha2UgY2xlYXIg
d2hpY2ggb25lIGlzIHVzZWQgYnkgd2hvLiBNYXliZToKPiAKPiB1bmlvbgo+IHsKPiAgICAgLyog
TGVnYWN5IGludGVyZmFjZSB0byBiZSB1c2VkIHdoZW4gdGhlIGd1ZXN0IHByb3ZpZGVzIGEgdmly
dHVhbCBhZGRyZXNzICovCj4gICAgIHVuaW9uIHsKPiAgICAgICAgWEVOX0dVRVNUX0hBTkRMRSh2
Y3B1X3J1bnN0YXRlX2luZm9fdCkgbmF0aXZlOwo+ICAgICAgICAuLi4KPiAgICAgfSB2aXJ0Owo+
IAo+ICAgICAvKiBJbnRlcmZhY2UgdXNlZCB3aGVuIHRoZSBndWVzdCBwcm92aWRlcyBhIHBoeXNp
Y2FsIGFkZHJlc3MgKi8KPiAgICAgdW5pb24gewo+ICAgICB9IHBoeXM7Cj4gfSBydW5zdGF0ZV9n
dWVzdC4KPiAKPiBydW5zdGF0ZV9ndWVzdF90eXBlIC8qIGNvdWxkIGJlIGEgYm9vbCBvciBlbnVt
ICovCj4gCj4gSmFuIHdoYXQgZG8geW91IHRoaW5rPwoKSSBmdWxseSBhZ3JlZSAtIG5vIG1peGlu
ZyBvZiBhcHByb2FjaGVzIGhlcmUsIGlmIHBvc3NpYmxlLiBIb3dldmVyLApjYXJlIG5lZWRzIHRv
IGJlIHRha2VuIHRoYXQgYWZ0ZXIgYSBkb21haW4gcmVzZXQgdGhlIG5ldyBrZXJuZWwKY2FuIGNo
b3NlIHRoZSBvcHBvc2l0ZSBtb2RlbC4gUXVlc3Rpb24gaXMgd2hldGhlciB0aGVyZSBhcmUgZXZl
bgpvdGhlciBjYXNlcyB3aGVyZSBpbmRlcGVuZGVudCBjb21wb25lbnRzIChzYXkgYm9vdCBsb2Fk
ZXIgYW5kCk9TKSBtYXkgbmVlZCB0byBiZSBwZXJtaXR0ZWQgdG8gY2hvc2UgbW9kZWxzIGluZGVw
ZW5kZW50bHkgb2YKb25lIGFub3RoZXIuCgpBcyBhIHNpZGUgbm90ZSwgQW5kcmlpIC0gd291bGQg
eW91IHBsZWFzZSBhdm9pZCBzZW5kaW5nIGRvdWJsZSBtYWlsCnRvIHhlbi1kZXZlbCAoYWRkcmVz
c2VzIGRpZmZlcmluZyBqdXN0IGJ5IGRvbWFpbiB1c2VkKT8KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
