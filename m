Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28731542E7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:18:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izf8J-0007aq-4e; Thu, 06 Feb 2020 11:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izf8H-0007aJ-5i
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:15:41 +0000
X-Inumbo-ID: 022b576a-48d2-11ea-8952-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 022b576a-48d2-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 11:15:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izf8G-0000u0-0b; Thu, 06 Feb 2020 11:15:40 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izf8F-0008Rx-Nc; Thu, 06 Feb 2020 11:15:39 +0000
Date: Thu, 6 Feb 2020 11:15:36 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200206111536.4tovegbj6xbvp54e@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-3-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/7] x86/hvm: allow ASID flush when v !=
 current
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTBQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaHZtX2FzaWRfZmx1c2hfdmNwdSBp
cyBub3Qgc2FmZSB0byB1c2UKPiB1bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVz
ZWQgb3IgdGhlIGN1cnJlbnRseSBydW5uaW5nIG9uZSwKPiBhcyBpdCBtb2RpZmllcyB0aGUgZ2Vu
ZXJhdGlvbiB3aXRob3V0IGFueSBsb2NraW5nLgo+IAo+IEZpeCB0aGlzIGJ5IHVzaW5nIGF0b21p
YyBvcGVyYXRpb25zIHdoZW4gYWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCj4gZmllbGQsIGJvdGgg
aW4gaHZtX2FzaWRfZmx1c2hfdmNwdV9hc2lkIGFuZCBvdGhlciBBU0lEIGZ1bmN0aW9ucy4gVGhp
cwo+IGFsbG93cyB0byBzYWZlbHkgZmx1c2ggdGhlIGN1cnJlbnQgQVNJRCBnZW5lcmF0aW9uLiBO
b3RlIHRoYXQgZm9yIHRoZQo+IGZsdXNoIHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1
cnJlbnRseSBydW5uaW5nIGEgdm1leGl0IGlzCj4gcmVxdWlyZWQuCj4gCj4gTm90ZSB0aGUgc2Ft
ZSBjb3VsZCBiZSBhY2hpZXZlZCBieSBpbnRyb2R1Y2luZyBhbiBleHRyYSBmaWVsZCB0bwo+IGh2
bV92Y3B1X2FzaWQgdGhhdCBzaWduYWxzIGh2bV9hc2lkX2hhbmRsZV92bWVudGVyIHRoZSBuZWVk
IHRvIGNhbGwKPiBodm1fYXNpZF9mbHVzaF92Y3B1IG9uIHRoZSBnaXZlbiB2Q1BVIGJlZm9yZSB2
bWVudHJ5LCB0aGlzIGhvd2V2ZXIKPiBzZWVtcyB1bm5lY2Vzc2FyeSBhcyBodm1fYXNpZF9mbHVz
aF92Y3B1IGl0c2VsZiBvbmx5IHNldHMgdHdvIHZDUFUKPiBmaWVsZHMgdG8gMCwgc28gdGhlcmUn
cyBubyBuZWVkIHRvIGRlbGF5IHRoaXMgdG8gdGhlIHZtZW50cnkgQVNJRAo+IGhlbHBlci4KPiAK
PiBUaGlzIGlzIG5vdCBhIGJ1Z2ZpeCBhcyBubyBjYWxsZXJzIHRoYXQgd291bGQgdmlvbGF0ZSB0
aGUgYXNzdW1wdGlvbnMKPiBsaXN0ZWQgaW4gdGhlIGZpcnN0IHBhcmFncmFwaCBoYXZlIGJlZW4g
Zm91bmQsIGJ1dCBhIHByZXBhcmF0b3J5Cj4gY2hhbmdlIGluIG9yZGVyIHRvIGFsbG93IHJlbW90
ZSBmbHVzaGluZyBvZiBIVk0gdkNQVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUb29rIG1lIHNvbWUgdGltZSB0byBnbyBvdmVy
IEFTSUQgY29kZSBidXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoaXMKbW9kaWZpY2F0aW9uIGlz
IGNvcnJlY3Q6CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9odm0vYXNpZC5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9hc2lkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2FzaWQuYwo+IGluZGV4IDlkM2M2NzFhNWYu
LjgwYjczZGE4OWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2FzaWQuYwo+IEBAIC04Miw3ICs4Miw3IEBAIHZvaWQgaHZtX2Fz
aWRfaW5pdChpbnQgbmFzaWRzKQo+ICAKPiAgdm9pZCBodm1fYXNpZF9mbHVzaF92Y3B1X2FzaWQo
c3RydWN0IGh2bV92Y3B1X2FzaWQgKmFzaWQpCj4gIHsKPiAtICAgIGFzaWQtPmdlbmVyYXRpb24g
PSAwOwo+ICsgICAgd3JpdGVfYXRvbWljKCZhc2lkLT5nZW5lcmF0aW9uLCAwKTsKPiAgfQo+ICAK
PiAgdm9pZCBodm1fYXNpZF9mbHVzaF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQo+IEBAIC0xMjAsNyAr
MTIwLDcgQEAgYm9vbF90IGh2bV9hc2lkX2hhbmRsZV92bWVudGVyKHN0cnVjdCBodm1fdmNwdV9h
c2lkICphc2lkKQo+ICAgICAgICAgIGdvdG8gZGlzYWJsZWQ7Cj4gIAo+ICAgICAgLyogVGVzdCBp
ZiBWQ1BVIGhhcyB2YWxpZCBBU0lELiAqLwo+IC0gICAgaWYgKCBhc2lkLT5nZW5lcmF0aW9uID09
IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uICkKPiArICAgIGlmICggcmVhZF9hdG9taWMoJmFz
aWQtPmdlbmVyYXRpb24pID09IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uICkKPiAgICAgICAg
ICByZXR1cm4gMDsKPiAgCj4gICAgICAvKiBJZiB0aGVyZSBhcmUgbm8gZnJlZSBBU0lEcywgbmVl
ZCB0byBnbyB0byBhIG5ldyBnZW5lcmF0aW9uICovCj4gQEAgLTEzNCw3ICsxMzQsNyBAQCBib29s
X3QgaHZtX2FzaWRfaGFuZGxlX3ZtZW50ZXIoc3RydWN0IGh2bV92Y3B1X2FzaWQgKmFzaWQpCj4g
IAo+ICAgICAgLyogTm93IGd1YXJhbnRlZWQgdG8gYmUgYSBmcmVlIEFTSUQuICovCj4gICAgICBh
c2lkLT5hc2lkID0gZGF0YS0+bmV4dF9hc2lkKys7Cj4gLSAgICBhc2lkLT5nZW5lcmF0aW9uID0g
ZGF0YS0+Y29yZV9hc2lkX2dlbmVyYXRpb247Cj4gKyAgICB3cml0ZV9hdG9taWMoJmFzaWQtPmdl
bmVyYXRpb24sIGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uKTsKPiAgCj4gICAgICAvKgo+ICAg
ICAgICogV2hlbiB3ZSBhc3NpZ24gQVNJRCAxLCBmbHVzaCBhbGwgVExCIGVudHJpZXMgYXMgd2Ug
YXJlIHN0YXJ0aW5nIGEgbmV3Cj4gLS0gCj4gMi4yNS4wCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
