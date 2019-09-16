Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05321B3E18
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9tD5-0001rP-VZ; Mon, 16 Sep 2019 15:46:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9tD4-0001rK-Jf
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:46:38 +0000
X-Inumbo-ID: 2a9ad148-d899-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a9ad148-d899-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 15:46:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67C18AFA8;
 Mon, 16 Sep 2019 15:46:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-3-andrew.cooper3@citrix.com>
 <527f33ad-3de1-15c7-eb4b-603eaf65f3c5@suse.com>
 <65f18521-15c5-72a9-29f6-cd5d621e1283@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba924285-8a78-6b70-0591-05629317ee29@suse.com>
Date: Mon, 16 Sep 2019 17:46:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <65f18521-15c5-72a9-29f6-cd5d621e1283@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/10] libx86: Proactively initialise
 error pointers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxNzoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNi8wOS8yMDE5
IDExOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUt
cG9saWN5LmMKPj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUtcG9saWN5
LmMKPj4+IEBAIC0yODMsNyArMjgzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jcHVpZF9kZXNlcmlh
bGlzZV9mYWlsdXJlKHZvaWQpCj4+PiAgICAgIGZvciAoIHNpemVfdCBpID0gMDsgaSA8IEFSUkFZ
X1NJWkUodGVzdHMpOyArK2kgKQo+Pj4gICAgICB7Cj4+PiAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
dGVzdCAqdCA9ICZ0ZXN0c1tpXTsKPj4+IC0gICAgICAgIHVpbnQzMl90IGVycl9sZWFmID0gfjB1
LCBlcnJfc3VibGVhZiA9IH4wdTsKPj4+ICsgICAgICAgIHVpbnQzMl90IGVycl9sZWFmLCBlcnJf
c3VibGVhZjsKPj4+ICAgICAgICAgIGludCByYzsKPj4+ICAKPj4+ICAgICAgICAgIC8qIE5vIHdy
aXRlcyBzaG91bGQgb2NjdXIuICBVc2UgTlVMTCB0byBjYXRjaCBlcnJvcnMuICovCj4+PiBAQCAt
MzM2LDcgKzMzNiw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfbXNyX2Rlc2VyaWFsaXNlX2ZhaWx1cmUo
dm9pZCkKPj4+ICAgICAgZm9yICggc2l6ZV90IGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0ZXN0cyk7
ICsraSApCj4+PiAgICAgIHsKPj4+ICAgICAgICAgIGNvbnN0IHN0cnVjdCB0ZXN0ICp0ID0gJnRl
c3RzW2ldOwo+Pj4gLSAgICAgICAgdWludDMyX3QgZXJyX21zciA9IH4wdTsKPj4+ICsgICAgICAg
IHVpbnQzMl90IGVycl9tc3I7Cj4+IEkgY29udGludWUgdG8gYmUgY3VyaW91cyBhYm91dCB0aGUg
fjB1ID0+IC4uLgo+Pgo+Pj4gLS0tIGEveGVuL2xpYi94ODYvY3B1aWQuYwo+Pj4gKysrIGIveGVu
L2xpYi94ODYvY3B1aWQuYwo+Pj4gQEAgLTM4MSw2ICszODEsMTEgQEAgaW50IHg4Nl9jcHVpZF9j
b3B5X2Zyb21fYnVmZmVyKHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAsCj4+PiAgICAgIHVuc2lnbmVk
IGludCBpOwo+Pj4gICAgICB4ZW5fY3B1aWRfbGVhZl90IGRhdGE7Cj4+PiAgCj4+PiArICAgIGlm
ICggZXJyX2xlYWYgKQo+Pj4gKyAgICAgICAgKmVycl9sZWFmID0gLTE7Cj4+PiArICAgIGlmICgg
ZXJyX3N1YmxlYWYgKQo+Pj4gKyAgICAgICAgKmVycl9zdWJsZWFmID0gLTE7Cj4+PiArCj4+PiAg
ICAgIC8qCj4+PiAgICAgICAqIEEgd2VsbCBmb3JtZWQgY2FsbGVyIGlzIGV4cGVjdGVkIHRvIHBh
c3MgYW4gYXJyYXkgd2l0aCBsZWF2ZXMgaW4gb3JkZXIsCj4+PiAgICAgICAqIGFuZCB3aXRob3V0
IGFueSByZXBldGl0aW9ucy4gIEhvd2V2ZXIsIGR1ZSB0byBwZXItdmVuZG9yIGRpZmZlcmVuY2Vz
LAo+Pj4gLS0tIGEveGVuL2xpYi94ODYvbXNyLmMKPj4+ICsrKyBiL3hlbi9saWIveDg2L21zci5j
Cj4+PiBAQCAtNTUsNiArNTUsOSBAQCBpbnQgeDg2X21zcl9jb3B5X2Zyb21fYnVmZmVyKHN0cnVj
dCBtc3JfcG9saWN5ICpwLAo+Pj4gICAgICB4ZW5fbXNyX2VudHJ5X3QgZGF0YTsKPj4+ICAgICAg
aW50IHJjOwo+Pj4gIAo+Pj4gKyAgICBpZiAoIGVycl9tc3IgKQo+Pj4gKyAgICAgICAgKmVycl9t
c3IgPSAtMTsKPj4gLi4uID0+IC0xIHN3aXRjaC4KPiAKPiBJdHMgc2hvcnRlciB0byB3cml0ZSwg
YW5kIGxlc3MgYnVnZ3kgd2hlbiB0aGUgdHlwZSBjaGFuZ2VzLgo+IAo+IEFueSByZWFzb24gd2h5
IHRoaXMgZW1haWwgaXMgaW4gcHJpdmF0ZT8KCk5vbmUgYXQgYWxsIC0gSSBoYXZlIG5vIGlkZWEg
aG93IHhlbi1kZXZlbCBtYW5hZ2VkIHRvIGRpc2FwcGVhcgpmcm9tIHRoZSByZWNpcGllbnRzIGxp
c3QgKEkndmUgcmUtYWRkZWQgaXQgbm93KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
