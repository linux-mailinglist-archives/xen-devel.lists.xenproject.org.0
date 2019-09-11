Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888AAFABD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i805j-00029l-JG; Wed, 11 Sep 2019 10:43:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i805i-00029e-10
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:43:14 +0000
X-Inumbo-ID: f38c6d04-d480-11e9-ac28-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f38c6d04-d480-11e9-ac28-12813bfff9fa;
 Wed, 11 Sep 2019 10:43:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 667ABAD95;
 Wed, 11 Sep 2019 10:43:11 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-32-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f76aba47-e3c7-b8c6-03ac-b6862106d01c@suse.com>
Date: Wed, 11 Sep 2019 12:43:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-32-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 31/48] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBWMToKPiAtIGFkZCBz
cGVjaWFsIGhhbmRsaW5nIGZvciBpZGxlIHVuaXQgaW4gdW5pdF9ydW5uYWJsZSgpIGFuZAo+ICAg
dW5pdF9ydW5uYWJsZV9zdGF0ZSgpCgpXaHkgd2FzIHRoaXMgZG9uZT8gSXNuJ3QgdmNwdV9ydW5u
YWJsZSgpIGdvaW5nIHRvIGFsd2F5cyByZXR1cm4KdHJ1ZSBmb3IgaWRsZSB2Q1BVLXM/Cgo+IC0t
LSBhL3hlbi9jb21tb24vZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAg
LTEyNTUsNyArMTI1NSwxMCBAQCBpbnQgdmNwdV9yZXNldChzdHJ1Y3QgdmNwdSAqdikKPiAgICAg
IHYtPmFzeW5jX2V4Y2VwdGlvbl9tYXNrID0gMDsKPiAgICAgIG1lbXNldCh2LT5hc3luY19leGNl
cHRpb25fc3RhdGUsIDAsIHNpemVvZih2LT5hc3luY19leGNlcHRpb25fc3RhdGUpKTsKPiAgI2Vu
ZGlmCj4gLSAgICB2LT5hZmZpbml0eV9icm9rZW4gPSAwOwo+ICsgICAgaWYgKCB2LT5hZmZpbml0
eV9icm9rZW4gJiBWQ1BVX0FGRklOSVRZX09WRVJSSURFICkKPiArICAgICAgICB2Y3B1X3RlbXBv
cmFyeV9hZmZpbml0eSh2LCBOUl9DUFVTLCBWQ1BVX0FGRklOSVRZX09WRVJSSURFKTsKPiArICAg
IGlmICggdi0+YWZmaW5pdHlfYnJva2VuICYgVkNQVV9BRkZJTklUWV9XQUlUICkKPiArICAgICAg
ICB2Y3B1X3RlbXBvcmFyeV9hZmZpbml0eSh2LCBOUl9DUFVTLCBWQ1BVX0FGRklOSVRZX1dBSVQp
OwoKU2hvdWxkbid0IHRoaXMgbGl2ZSBpbiBhbiBlYXJsaWVyIHBhdGNoPyBJIGd1ZXNzIHRoZSBz
YW1lIHF1ZXN0aW9uCmlzIGFwcGxpY2FibGUgdG8gYWxtb3N0IGV2ZXJ5dGhpbmcgaGVyZSwgYXMg
YWxzbyBhbHJlYWR5IG1lbnRpb25lZAplLmcuIGluIHRoZSBwcmV2aW91cyBwYXRjaC4KCj4gIHN0
YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9zZXRfcmVzKHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
KnJlcykKPiAgewo+IC0gICAgdW5pdC0+dmNwdV9saXN0LT5wcm9jZXNzb3IgPSByZXMtPnByb2Nl
c3NvcjsKPiArICAgIGludCBjcHUgPSBjcHVtYXNrX2ZpcnN0KHJlcy0+Y3B1cyk7Cgp1bnNpZ25l
ZCBpbnQKCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9zZXRfcGF1c2VfZmxhZ3NfYXRvbWlj
KHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYml0KQo+ICB7Cj4gLSAgICBzZXRfYml0
KGJpdCwgJnVuaXQtPnZjcHVfbGlzdC0+cGF1c2VfZmxhZ3MpOwo+ICsgICAgc3RydWN0IHZjcHUg
KnY7Cj4gKwo+ICsgICAgZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdiApCj4gKyAg
ICAgICAgc2V0X2JpdChiaXQsICZ2LT5wYXVzZV9mbGFncyk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBp
bmxpbmUgdm9pZCBzY2hlZF9jbGVhcl9wYXVzZV9mbGFnc19hdG9taWMoc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGJpdCkKPiAgewo+IC0gICAgY2xlYXJfYml0KGJpdCwgJnVuaXQt
PnZjcHVfbGlzdC0+cGF1c2VfZmxhZ3MpOwo+ICsgICAgc3RydWN0IHZjcHUgKnY7Cj4gKwo+ICsg
ICAgZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdiApCj4gKyAgICAgICAgY2xlYXJf
Yml0KGJpdCwgJnYtPnBhdXNlX2ZsYWdzKTsKPiAgfQoKVGhlIGF0b21pY2l0eSBpcyAobmVjZXNz
YXJpbHkpIGxpbWl0ZWQgaGVyZSAtIGl0J3MgYXRvbWljIGZvciBhbgppbmRpdmlkdWFsIHZDUFUs
IGJ1dCBub3QgYXRvbWljIGZvciBhIHVuaXQgYXMgYSB3aG9sZS4gSWYgdGhpcwppcyBpbmRlZWQg
YSB1c2VmdWwgaHlicmlkLCB0aGVuIEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSBpZiB0aGVyZQp3
YXMgYSBjb21tZW50IG5leHQgdG8gdGhlc2UgZnVuY3Rpb25zIGNsYXJpZnlpbmcgdW5kZXIgd2hh
dApjb25kaXRpb25zIHVzZSBvZiB0aGVtIGlzIGNvcnJlY3Qgd2l0aG91dCBpdCBhbHNvIGJlaW5n
IGNvcnJlY3QKdG8gdXNlIHRoZWlyIG5vbi1hdG9taWMgY291bnRlcnBhcnRzIChlLmcuIGR1ZSB0
byB1c2Ugb2YgYW4KZXh0ZXJuYWwgbG9jaykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
