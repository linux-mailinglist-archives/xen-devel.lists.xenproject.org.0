Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70659BDEC4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:17:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD77L-0000Ov-IJ; Wed, 25 Sep 2019 13:14:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD77J-0000Oo-EE
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:14:01 +0000
X-Inumbo-ID: 569dcc2e-df96-11e9-9630-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 569dcc2e-df96-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 13:14:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C76C0AD8E;
 Wed, 25 Sep 2019 13:13:59 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-38-jgross@suse.com>
 <1184754b-fbc3-dfb6-6476-e9305e8e1421@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <09dcab9b-7482-8636-204e-dedb477baef2@suse.com>
Date: Wed, 25 Sep 2019 15:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1184754b-fbc3-dfb6-6476-e9305e8e1421@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 37/47] xen/sched: move per-cpu variable
 scheduler to struct sched_resource
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTQ6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0
LmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwo+PiBAQCAtMzUyLDkgKzM1Miwx
MCBAQCBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGxhc3RfdGlja2xlX2NwdSk7Cj4+ICAg
c3RhdGljIGlubGluZSB2b2lkIF9fcnVucV90aWNrbGUoc3RydWN0IGNzY2hlZF91bml0ICpuZXcp
Cj4+ICAgewo+PiAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc2NoZWRfdW5pdF9jcHUobmV3LT51
bml0KTsKPj4gKyAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3Jlcyhj
cHUpOwo+PiAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCA9IG5ldy0+dW5pdDsKPj4gICAg
ICAgc3RydWN0IGNzY2hlZF91bml0ICogY29uc3QgY3VyID0gQ1NDSEVEX1VOSVQoY3Vycl9vbl9j
cHUoY3B1KSk7Cj4+IC0gICAgc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYgPSBDU0NIRURfUFJJ
VihwZXJfY3B1KHNjaGVkdWxlciwgY3B1KSk7Cj4+ICsgICAgc3RydWN0IGNzY2hlZF9wcml2YXRl
ICpwcnYgPSBDU0NIRURfUFJJVihzZC0+c2NoZWR1bGVyKTsKPiAKPiBJcyB0aGUgc2luZ2xlIHVz
ZSAic2QiIChhbmQsIGFzIG1lbnRpb25lZCBlbHNld2hlcmUsIG1pcy1uYW1lZCkKPiByZWFsbHkg
d29ydGggaXQ/IChBcHBsaWNhYmxlIGZ1cnRoZXIgZG93biBhcyB3ZWxsLikKPiAKPj4gQEAgLTkz
MSw3ICs5MzIsOCBAQCBjc2NoZWRfdW5pdF9hY2N0KHN0cnVjdCBjc2NoZWRfcHJpdmF0ZSAqcHJ2
LCB1bnNpZ25lZCBpbnQgY3B1KQo+PiAgIHsKPj4gICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKmN1
cnJ1bml0ID0gY3VycmVudC0+c2NoZWRfdW5pdDsKPj4gICAgICAgc3RydWN0IGNzY2hlZF91bml0
ICogY29uc3Qgc3ZjID0gQ1NDSEVEX1VOSVQoY3VycnVuaXQpOwo+PiAtICAgIGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcyA9IHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpOwo+PiArICAgIHN0cnVj
dCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBnZXRfc2NoZWRfcmVzKGNwdSk7Cj4+ICsgICAgY29uc3Qg
c3RydWN0IHNjaGVkdWxlciAqb3BzID0gc2QtPnNjaGVkdWxlcjsKPj4gICAKPj4gICAgICAgQVNT
RVJUKCBzY2hlZF91bml0X2NwdShjdXJydW5pdCkgPT0gY3B1ICk7Cj4+ICAgICAgIEFTU0VSVCgg
c3ZjLT5zZG9tICE9IE5VTEwgKTsKPj4gQEAgLTk4Nyw4ICs5ODksNyBAQCBjc2NoZWRfdW5pdF9h
Y2N0KHN0cnVjdCBjc2NoZWRfcHJpdmF0ZSAqcHJ2LCB1bnNpZ25lZCBpbnQgY3B1KQo+PiAgICAg
ICAgICAgICAgICAqIGlkbGVycy4gQnV0LCBpZiB3ZSBhcmUgaGVyZSwgaXQgbWVhbnMgdGhlcmUg
aXMgc29tZW9uZSBydW5uaW5nCj4+ICAgICAgICAgICAgICAgICogb24gaXQsIGFuZCBoZW5jZSB0
aGUgYml0IG11c3QgYmUgemVybyBhbHJlYWR5Lgo+PiAgICAgICAgICAgICAgICAqLwo+PiAtICAg
ICAgICAgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDU0NIRURfUFJJVihwZXJfY3B1KHNjaGVkdWxlciwgY3B1
KSktPmlkbGVycykpOwo+PiArICAgICAgICAgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNw
dSwgQ1NDSEVEX1BSSVYoc2QtPnNjaGVkdWxlciktPmlkbGVycykpOwo+IAo+IFdoaWxlIGF0IHRo
ZSBmaXJzdCBnbGFuY2UgInNkIiBpcyB1c2VkIHR3aWNlIGhlcmUsIHRoaXMgMm5kIHVzZSBpcwo+
IGFjdHVhbGx5IHVubmVjZXNzYXJ5IC0gImNwdSIgaGFzbid0IGNoYW5nZWQgZnJvbSB0aGUgYmVn
aW5uaW5nIG9mCj4gdGhlIGZ1bmN0aW9uIGFmYWljcywgYW5kIGhlbmNlICJvcHMiIGNvdWxkIGJl
IHVzZWQgaGVyZS4KCiJzZCIgaXMgbm93ICJzciIgZXZlcnl3aGVyZS4KCkFuZCB5ZXMsIHVzaW5n
IG9wcyBoZXJlIHNlZW1zIG9rYXkuCgo+IAo+IFByZWZlcmFibHkgd2l0aCB0aGUgc3VnZ2VzdGVk
IGFkanVzdG1lbnRzIChidXQgZmluYWwganVkZ2VtZW50IGlzCj4gd2l0aCB0aGUgc2NoZWR1bGVy
IG1haW50YWluZXJzIGFueXdheSkKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKVGhhbmtzLAoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
