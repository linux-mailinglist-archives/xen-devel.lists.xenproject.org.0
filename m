Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8449FAB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCam-0003tM-4A; Tue, 18 Jun 2019 11:48:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdCal-0003tH-AS
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:47:59 +0000
X-Inumbo-ID: eab37112-91be-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eab37112-91be-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:47:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 05:47:57 -0600
Message-Id: <5D08CF6702000078002393B9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 05:47:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
 <88756ee5-0f45-097a-3565-c15ebb9c815a@citrix.com>
In-Reply-To: <88756ee5-0f45-097a-3565-c15ebb9c815a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/9] AMD/IOMMU: use bit field for IRTE
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDEzOjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEF0IHRoZSBz
YW1lIHRpbWUgcmVzdHJpY3QgaXRzIHNjb3BlIHRvIGp1c3QgdGhlIHNpbmdsZSBzb3VyY2UgZmls
ZQo+PiBhY3R1YWxseSB1c2luZyBpdCwgYW5kIGFic3RyYWN0IGFjY2Vzc2VzIGJ5IGludHJvZHVj
aW5nIGEgdW5pb24gb2YKPj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUg
ZW50cmllcyBpcyBub3QgdXNlZCB0byBtYWtlIGl0Cj4+IGltcG9zc2libGUgdG8gW3dyb25nbHks
IG9uY2UgdGhlIDEyOC1iaXQgZm9ybSBnZXRzIGFkZGVkXSBwZXJmb3JtCj4+IHBvaW50ZXIgYXJp
dGhtZXRpYyAvIGFycmF5IGFjY2Vzc2VzIG9uIGRlcml2ZWQgdHlwZXMuKQo+Pgo+PiBBbHNvIG1v
dmUgYXdheSBmcm9tIHVwZGF0aW5nIHRoZSBlbnRyaWVzIHBpZWNlbWVhbDogQ29uc3RydWN0IGEg
ZnVsbCBuZXcKPj4gZW50cnksIGFuZCB3cml0ZSBpdCBvdXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IEl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlIHRvIHVzZSB3cml0ZV9hdG9taWMoKSBvciBBQ0NFU1NfT05DRSgpIGZvciB0aGUK
Pj4gYWN0dWFsIHdyaXRlcywgYnV0IGJvdGggY2FzdCB0aGUgdmFsdWUgdG8gYSBzY2FsYXIgb25l
LCB3aGljaCBkb2Vzbid0Cj4+IHN1aXQgdXMgaGVyZSAoYW5kIEkgYWxzbyBkaWRuJ3Qgd2FudCB0
byBtYWtlIHRoZSBjb21wb3VuZCB0eXBlIGEgdW5pb24KPj4gd2l0aCBhIHJhdyBtZW1iZXIganVz
dCBmb3IgdGhpcykuCj4gCj4gQWN0dWFsbHksIGhhdmluZyBsb29rZWQgYXQgdGhlIGZvbGxvd2lu
ZyBwYXRjaCwgSSB0aGluayBpdCB3b3VsZCBiZQo+IGJldHRlciB0byB1bmlvbiB3aXRoIGEgdWlu
dDMyX3QgcmF3LCBzbyB0aGF0IHdlIGNhbiB1c2UuLi4KCldlbGwsIEkgZGlkIGluIGZhY3QgaGF2
ZSBpdCB0aGF0IHdheSBmaXJzdCwgdW50aWwgLi4uCgo+PiArc3RhdGljIHZvaWQgdXBkYXRlX2lu
dHJlbWFwX2VudHJ5KHVuaW9uIGlydGVfcHRyIGVudHJ5LCB1bnNpZ25lZCBpbnQgdmVjdG9yLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpbnRfdHlw
ZSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZGVz
dF9tb2RlLCB1bnNpZ25lZCBpbnQgZGVzdCkKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgaXJ0ZV9iYXNp
YyBiYXNpYyA9IHsKPj4gKyAgICAgICAgLnJlbWFwX2VuID0gMSwKPj4gKyAgICAgICAgLnN1cF9p
b19wZiA9IDAsCj4+ICsgICAgICAgIC5pbnRfdHlwZSA9IGludF90eXBlLAo+PiArICAgICAgICAu
cnFfZW9pID0gMCwKPj4gKyAgICAgICAgLmRtID0gZGVzdF9tb2RlLAo+PiArICAgICAgICAuZGVz
dCA9IGRlc3QsCj4+ICsgICAgICAgIC52ZWN0b3IgPSB2ZWN0b3IsCj4+ICsgICAgfTsKCi4uLiBJ
IGZpZ3VyZWQgdGhhdCB0aGlzIGluaXRpYWxpemVyIHRoZW4gd2lsbCByZXF1aXJlIHRoZSBiaXRm
aWVsZHMgcGFydCBvZgp0aGUgdW5pb24gdG8gYWxzbyBnZXQgbmFtZWQsIGxpa2UgZm9yIHVuaW9u
IGFtZF9pb21tdV9leHRfZmVhdHVyZXMKaW4gcGF0Y2ggMS4KCj4+ICsgICAgKmVudHJ5LmJhc2lj
ID0gYmFzaWM7Cj4gCj4gQUNDRVNTX09OQ0UoKmVudHJ5LmJhc2ljLnJhdykgPSBiYXNpYy5yYXcu
Cj4gCj4gVGhlIHByb2JsZW0gaXMgaW4gYW4gdW5vcHRpbWlzZWQgY2FzZSwgc3RydWN0dXJlIGFz
c2lnbm1lbnQgaW4KPiBpbXBsZW1lbnRlZCB3aXRoIG1lbWNweSgpLCB3aGljaCBtYXkgYmUgaW1w
bGVtZW50ZWQgYXMgYHJlcCBzdG9zYmAgd2hpY2gKPiBtYXkgcmVzdWx0IGluIGEgc3BsaWNlZCB3
cml0ZSB3aXRoIHRoZSBlbmFibGUgYml0IHNldCBmaXJzdC4KPiAKPiBVc2luZyBhIHVuaW9uIHdp
dGggcmF3IGFsbG93cyBmb3IgdGhlIHVzZSBvZiBBQ0NFU1NfT05DRSgpLCB3aGljaCBmb3JjZXMK
PiB0aGUgY29tcGlsZXIgdG8gaW1wbGVtZW50IHRoZW0gYXMgMzJiaXQgc2luZ2xlIG1vdidzLgoK
SWYgd2UgYXJlIHdvcnJpZWQgYWJvdXQgdGhpcywgd3JpdGluZyBvZiAzMi1iaXQgZW50cmllcyBj
b3VsZCBiZSBkb25lCihhcyBhbiBhbHRlcm5hdGl2ZSB0byB3aGF0IHlvdSBzdWdnZXN0KSBqdXN0
IGxpa2UgdGhhdCBvZiAxMjgtYml0Cm9uZXMgYnkgdGhlIGxhc3QgcGF0Y2ggaW4gdGhlIHNlcmll
cy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
