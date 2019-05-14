Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293411CCC3
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 18:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQa69-0001mN-0J; Tue, 14 May 2019 16:16:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TJPZ=TO=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQa67-0001mG-4s
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:16:11 +0000
X-Inumbo-ID: 94cb8096-7663-11e9-af08-637c6fdaf794
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94cb8096-7663-11e9-af08-637c6fdaf794;
 Tue, 14 May 2019 16:16:08 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EB67D3031EDC; Tue, 14 May 2019 19:16:07 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BAB52306E4AC;
 Tue, 14 May 2019 19:16:07 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>, aisaila@bitdefender.com
References: <20190423142959.12609-1-aisaila@bitdefender.com>
 <5CDAE1D2020000780022ED04@prv1-mh.provo.novell.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ee178e36-bf47-1a1c-cfa0-a8122782ea60@bitdefender.com>
Date: Tue, 14 May 2019 19:16:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDAE1D2020000780022ED04@prv1-mh.provo.novell.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v6] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xNC8xOSA2OjQyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMy4wNC4xOSBh
dCAxNjozMCwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3AybS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiBAQCAtNDc4
LDYgKzQ3OCw0MyBAQCB2b2lkIHAybV91bmxvY2tfYW5kX3RsYl9mbHVzaChzdHJ1Y3QgcDJtX2Rv
bWFpbiAqcDJtKQo+PiAgICAgICAgICAgbW1fd3JpdGVfdW5sb2NrKCZwMm0tPmxvY2spOwo+PiAg
IH0KPj4gICAKPj4gK2ludCBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShzdHJ1Y3QgcDJtX2Rv
bWFpbiAqYXAybSwgZ2ZuX3QgZ2ZuLCBtZm5fdCAqbWZuLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sIHByZXBvcHVsYXRlKQo+PiArewo+PiArICAgICpt
Zm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCB0LCBhLCAwLCBOVUxMLCBOVUxMKTsKPj4g
Kwo+PiArICAgIC8qIENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlkIGVudHJ5IGluIGFsdGVybmF0
ZSAqLwo+PiArICAgIGlmICggIW1mbl92YWxpZCgqbWZuKSAmJiAhcDJtX2lzX2hvc3RwMm0oYXAy
bSkgKQo+PiArICAgIHsKPj4gKyAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmhwMm0gPSBwMm1f
Z2V0X2hvc3RwMm0oYXAybS0+ZG9tYWluKTsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vf
b3JkZXI7Cj4+ICsgICAgICAgIGludCByYzsKPj4gKwo+PiArICAgICAgICAqbWZuID0gX19nZXRf
Z2ZuX3R5cGVfYWNjZXNzKGhwMm0sIGdmbl94KGdmbiksIHQsIGEsCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DIHwgUDJNX1VOU0hBUkUsICZwYWdlX29y
ZGVyLCAwKTsKPj4gKwo+PiArICAgICAgICByYyA9IC1FU1JDSDsKPj4gKyAgICAgICAgaWYgKCAh
bWZuX3ZhbGlkKCptZm4pIHx8ICp0ICE9IHAybV9yYW1fcncgKQo+PiArICAgICAgICAgICAgcmV0
dXJuIHJjOwo+PiArCj4+ICsgICAgICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBhZ2UsIGNvcHkg
dGhhdCBmaXJzdCAqLwo+PiArICAgICAgICBpZiAoIHByZXBvcHVsYXRlICYmIHBhZ2Vfb3JkZXIg
IT0gUEFHRV9PUkRFUl80SyApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbWFzayA9IH4oKDFVTCA8PCBwYWdlX29yZGVyKSAtIDEpOwo+PiArICAgICAgICAgICAg
Z2ZuX3QgZ2ZuX2FsaWduZWQgPSBfZ2ZuKGdmbl94KGdmbikgJiBtYXNrKTsKPj4gKyAgICAgICAg
ICAgIG1mbl90IG1mbl9hbGlnbmVkID0gX21mbihtZm5feCgqbWZuKSAmIG1hc2spOwo+PiArCj4+
ICsgICAgICAgICAgICByYyA9IGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm5fYWxpZ25lZCwgbWZu
X2FsaWduZWQsIHBhZ2Vfb3JkZXIsICp0LCAqYSwgMSk7Cj4+ICsgICAgICAgICAgICBpZiAoIHJj
ICkKPj4gKyAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4+ICsgICAgICAgIH0KPj4gKyAgICB9
Cj4+ICsKPj4gKyAgICByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArCj4+ICAgbWZuX3QgX19nZXRf
Z2ZuX3R5cGVfYWNjZXNzKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHVuc2lnbmVkIGxvbmcgZ2Zu
X2wsCj4+ICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3Qg
KmEsIHAybV9xdWVyeV90IHEsCj4+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
KnBhZ2Vfb3JkZXIsIGJvb2xfdCBsb2NrZWQpCj4gCj4gTWF5IEkgYXNrIGhvdyB0aGUgcGxhY2Vt
ZW50IG9mIHRoaXMgZnVuY3Rpb24gd2FzIGNob3Nlbj8gSXQgbG9va3MKPiBhcyBpZiBhbGwgaXRz
IGNhbGxlcnMgbGl2ZSBpbnNpZGUgI2lmZGVmIENPTkZJR19IVk0gc2VjdGlvbnMsIGp1c3QgdGhp
cwo+IGZ1bmN0aW9uIGRvZXNuJ3QgKHJlcG9ydGVkbHkgY2F1c2luZyBidWlsZCBpc3N1ZXMgdG9n
ZXRoZXIgd2l0aAo+IGxhdGVyIGNoYW5nZXMpLgoKSSBiZWxpZXZlIGl0J3MganVzdCBhbiBvdmVy
c2lnaHQuIEkndmUgc2VudCBvdXQgYSBwYXRjaCB0aGF0IGhvcGVmdWxseSAKZml4ZXMgdGhpcyBp
biBhIHNhdGlzZmFjdG9yeSBtYW5uZXIuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
