Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8114ADB87
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:54:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7L0C-0004E0-7M; Mon, 09 Sep 2019 14:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7L0A-0004Dv-Rp
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:50:46 +0000
X-Inumbo-ID: 3433325a-d311-11e9-ac0d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3433325a-d311-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:50:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09DBFADEF;
 Mon,  9 Sep 2019 14:50:45 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909143134.15379-1-jgross@suse.com>
 <20190909143134.15379-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afda8925-136b-e241-10a5-97b031b90de9@suse.com>
Date: Mon, 9 Sep 2019 16:50:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909143134.15379-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCj4g
QEAgLTUsMTUgKzUsMjQgQEAKPiAgI2luY2x1ZGUgPGFzbS9zcGlubG9jay5oPgo+ICAjaW5jbHVk
ZSA8YXNtL3R5cGVzLmg+Cj4gIAo+ICsjZGVmaW5lIFNQSU5MT0NLX0NQVV9CSVRTICAxMgo+ICsK
PiAgI2lmbmRlZiBOREVCVUcKPiAtc3RydWN0IGxvY2tfZGVidWcgewo+IC0gICAgczE2IGlycV9z
YWZlOyAvKiArMTogSVJRLXNhZmU7IDA6IG5vdCBJUlEtc2FmZTsgLTE6IGRvbid0IGtub3cgeWV0
ICovCj4gK3VuaW9uIGxvY2tfZGVidWcgewo+ICsgICAgdWludDE2X3QgdmFsOwo+ICsjZGVmaW5l
IExPQ0tfREVCVUdfSU5JVFZBTCAweGZmZmYKPiArICAgIHN0cnVjdCB7Cj4gKyAgICAgICAgdWlu
dDE2X3QgY3B1OlNQSU5MT0NLX0NQVV9CSVRTOwo+ICsgICAgICAgIHVpbnQxNl90IDooMTQgLSBT
UElOTE9DS19DUFVfQklUUyk7CgpJJ20gc29ycnkgdGhhdCBJIHJlYWxpemUgdGhpcyBvbmx5IG5v
dyB0aGF0IEkgc2VlIHRoaXMgYW5kIC4uLgoKPiArICAgICAgICBib29sIGlycV9zYWZlOjE7Cj4g
KyAgICAgICAgYm9vbCB1bnNlZW46MTsKPiArICAgIH07Cj4gIH07Cj4gLSNkZWZpbmUgX0xPQ0tf
REVCVUcgeyAtMSB9Cj4gKyNkZWZpbmUgX0xPQ0tfREVCVUcgeyBMT0NLX0RFQlVHX0lOSVRWQUwg
fQo+ICB2b2lkIHNwaW5fZGVidWdfZW5hYmxlKHZvaWQpOwo+ICB2b2lkIHNwaW5fZGVidWdfZGlz
YWJsZSh2b2lkKTsKPiAgI2Vsc2UKPiAtc3RydWN0IGxvY2tfZGVidWcgeyB9Owo+ICt1bmlvbiBs
b2NrX2RlYnVnIHsgfTsKPiAgI2RlZmluZSBfTE9DS19ERUJVRyB7IH0KPiAgI2RlZmluZSBzcGlu
X2RlYnVnX2VuYWJsZSgpICgodm9pZCkwKQo+ICAjZGVmaW5lIHNwaW5fZGVidWdfZGlzYWJsZSgp
ICgodm9pZCkwKQo+IEBAIC0xMzgsMTEgKzE0NywxMiBAQCB0eXBlZGVmIHVuaW9uIHsKPiAgCj4g
IHR5cGVkZWYgc3RydWN0IHNwaW5sb2NrIHsKPiAgICAgIHNwaW5sb2NrX3RpY2tldHNfdCB0aWNr
ZXRzOwo+IC0gICAgdTE2IHJlY3Vyc2VfY3B1OjEyOwo+IC0jZGVmaW5lIFNQSU5MT0NLX05PX0NQ
VSAweGZmZnUKPiAtICAgIHUxNiByZWN1cnNlX2NudDo0Owo+IC0jZGVmaW5lIFNQSU5MT0NLX01B
WF9SRUNVUlNFIDB4ZnUKPiAtICAgIHN0cnVjdCBsb2NrX2RlYnVnIGRlYnVnOwo+ICsgICAgdTE2
IHJlY3Vyc2VfY3B1OlNQSU5MT0NLX0NQVV9CSVRTOwo+ICsjZGVmaW5lIFNQSU5MT0NLX05PX0NQ
VSAgICAgICAgKCgxdSA8PCBTUElOTE9DS19DUFVfQklUUykgLSAxKQo+ICsjZGVmaW5lIFNQSU5M
T0NLX1JFQ1VSU0VfQklUUyAgKDE2IC0gU1BJTkxPQ0tfQ1BVX0JJVFMpCj4gKyAgICB1MTYgcmVj
dXJzZV9jbnQ6U1BJTkxPQ0tfUkVDVVJTRV9CSVRTOwo+ICsjZGVmaW5lIFNQSU5MT0NLX01BWF9S
RUNVUlNFICAgKCgxdSA8PCBTUElOTE9DS19SRUNVUlNFX0JJVFMpIC0gMSkKCi4uLiB0aGlzOiBU
aGVzZSBzdWJ0cmFjdGlvbnMgYXJlIHByb25lIHRvIHlpZWxkIGRlLWdlbmVyYXRlCmJpdGZpZWxk
cyB3aGVuIHRoZSBkaWZmZXJlbmNlIGVuZHMgdXAgemVybyAobGVhZGluZyB0bwpwcmVzdW1hYmx5
IHZlcnkgc3RyYW5nZSBicmVha2FnZSwgYWxiZWl0IG9uZSB3b3VsZCBob3BlIHRoYXQKaXQgYWxz
byB3b3VsZCBiZSB2ZXJ5IG9idmlvdXMgdGhhdCBfc29tZXRoaW5nXyBpcyBicm9rZW4pLiBJCnRo
aW5rIHdlIG5lZWQgQlVJTERfQlVHX09OKClzIGNoZWNraW5nIHRoYXQgbmVpdGhlcgpkaWZmZXJl
bmNlIGFjdHVhbGx5IGlzIHplcm8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
