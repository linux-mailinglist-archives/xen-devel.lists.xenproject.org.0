Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417410B2D2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:57:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzfM-0002g1-Tu; Wed, 27 Nov 2019 15:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzfM-0002fw-9S
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:55:44 +0000
X-Inumbo-ID: 5dec6c28-112e-11ea-a3b8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dec6c28-112e-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:55:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B17AB2D3;
 Wed, 27 Nov 2019 15:55:42 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
Date: Wed, 27 Nov 2019 16:55:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127143711.4377-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNTozNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L2FybS9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBAQCAtNzg5LDcgKzc4
OSw3IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZz
ZXQsCj4gICAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfaHZtIHwgWEVOX0RPTUNUTF9D
REZfaGFwLAo+ICAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwKPiAgICAgICAgICAubWF4
X2dyYW50X2ZyYW1lcyA9IGdudHRhYl9kb20wX2ZyYW1lcygpLAo+IC0gICAgICAgIC5tYXhfbWFw
dHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0cmFja19mcmFtZXMsCj4gKyAgICAgICAgLm1heF9t
YXB0cmFja19mcmFtZXMgPSAtMSwKPiAgICAgIH07Cj4gICAgICBpbnQgcmM7Cj4gIAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiBAQCAt
Njk3LDggKzY5Nyw4IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgbWJpX3ApCj4gICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9j
ZmcgPSB7Cj4gICAgICAgICAgLmZsYWdzID0gSVNfRU5BQkxFRChDT05GSUdfVEJPT1QpID8gWEVO
X0RPTUNUTF9DREZfczNfaW50ZWdyaXR5IDogMCwKPiAgICAgICAgICAubWF4X2V2dGNobl9wb3J0
ID0gLTEsCj4gLSAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSBvcHRfbWF4X2dyYW50X2ZyYW1l
cywKPiAtICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJh
bWVzLAo+ICsgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gLTEsCj4gKyAgICAgICAgLm1heF9t
YXB0cmFja19mcmFtZXMgPSAtMSwKPiAgICAgIH07CgpXaXRoIHRoZXNlIHRoZXJlJ3Mgbm8gbmVl
ZCBhbnltb3JlIGZvciBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lcyB0bwpiZSBub24tc3RhdGljLiBT
YWRseSBBcm0gc3RpbGwgd2FudHMgb3B0X21heF9ncmFudF9mcmFtZXMKYWNjZXNzaWJsZSBpbiBn
bnR0YWJfZG9tMF9mcmFtZXMoKS4KCj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4g
KysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4gQEAgLTE4MzcsMTIgKzE4MzcsMTggQEAg
YWN0aXZlX2FsbG9jX2ZhaWxlZDoKPiAgICAgIHJldHVybiAtRU5PTUVNOwo+ICB9Cj4gIAo+IC1p
bnQgZ3JhbnRfdGFibGVfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWF4X2dy
YW50X2ZyYW1lcywKPiAtICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1heF9tYXB0
cmFja19mcmFtZXMpCj4gK2ludCBncmFudF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsIGlu
dCBtYXhfZ3JhbnRfZnJhbWVzLAo+ICsgICAgICAgICAgICAgICAgICAgICBpbnQgbWF4X21hcHRy
YWNrX2ZyYW1lcykKPiAgewo+ICAgICAgc3RydWN0IGdyYW50X3RhYmxlICpndDsKPiAgICAgIGlu
dCByZXQgPSAtRU5PTUVNOwo+ICAKPiArICAgIC8qIERlZmF1bHQgdG8gbWF4aW11bSB2YWx1ZSBp
ZiBubyB2YWx1ZSB3YXMgc3BlY2lmaWVkICovCj4gKyAgICBpZiAoIG1heF9ncmFudF9mcmFtZXMg
PCAwICkKPiArICAgICAgICBtYXhfZ3JhbnRfZnJhbWVzID0gb3B0X21heF9ncmFudF9mcmFtZXM7
Cj4gKyAgICBpZiAoIG1heF9tYXB0cmFja19mcmFtZXMgPCAwICkKPiArICAgICAgICBtYXhfbWFw
dHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0cmFja19mcmFtZXM7Cj4gKwo+ICAgICAgaWYgKCBt
YXhfZ3JhbnRfZnJhbWVzIDwgSU5JVElBTF9OUl9HUkFOVF9GUkFNRVMgfHwKCkkgdGFrZSBpdCB3
ZSBkb24ndCBleHBlY3QgcGVvcGxlIHRvIHNwZWNpZnkgMl5eMzEgb3IgbW9yZQpmcmFtZXMgZm9y
IGVpdGhlciBvcHRpb24uIEl0IGxvb2tzIGxpa2UgYWxtb3N0IGV2ZXJ5dGhpbmcKaGVyZSB3b3Vs
ZCBjb3BlLCBleGNlcHQgZm9yIHRoaXMgdmVyeSBjb21wYXJpc29uLiBOZXZlcnRoZWxlc3MKSSB3
b25kZXIgd2hldGhlciB5b3Ugd291bGRuJ3QgYmV0dGVyIGNvbmZpbmUgYm90aCB2YWx1ZXMgdG8K
WzAsIElOVF9NQVhdIG5vdywgaW5jbHVkaW5nIHdoZW4gYWRqdXN0ZWQgYXQgcnVudGltZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
