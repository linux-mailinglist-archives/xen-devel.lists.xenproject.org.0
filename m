Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13DB385C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oNw-0001zm-4I; Mon, 16 Sep 2019 10:37:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9oNu-0001zh-KF
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:37:30 +0000
X-Inumbo-ID: facfa1a8-d86d-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id facfa1a8-d86d-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 10:37:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F405EB654;
 Mon, 16 Sep 2019 10:37:25 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e27f519a-465f-58b9-b517-67c23cb85444@suse.com>
Date: Mon, 16 Sep 2019 12:37:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9j
LmgKPiBAQCAtMzUsNiArMzUsMTUgQEAKPiAgI2RlZmluZSB4emFsbG9jX2FycmF5KF90eXBlLCBf
bnVtKSBcCj4gICAgICAoKF90eXBlICopX3h6YWxsb2NfYXJyYXkoc2l6ZW9mKF90eXBlKSwgX19h
bGlnbm9mX18oX3R5cGUpLCBfbnVtKSkKPiAgCj4gKy8qIEFsbG9jYXRlIHNwYWNlIGZvciBhIHN0
cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlwZWQgb2JqZWN0cy4gKi8KPiArI2Rl
ZmluZSB4bWFsbG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBucikgXAo+ICsgICAgKHR5cGUg
KilfeG1hbGxvYyhvZmZzZXRvZih0eXBlLCBmaWVsZFtucl0pLCBfX2FsaWdub2ZfXyh0eXBlKSkK
PiArCj4gKy8qIFJlLWFsbG9jYXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGli
bGUgYXJyYXkgb2YgdHlwZWQgb2JqZWN0cy4gKi8KPiArI2RlZmluZSB4cmVhbGxvY19mbGV4X3N0
cnVjdChwdHIsIGZpZWxkLCBucikgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICh0
eXBlb2YocHRyKSlfeHJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBlb2YoKihwdHIpKSwgZmllbGRb
bnJdKSwgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgX19hbGlnbm9mX18odHlwZW9m
KCoocHRyKSkpKQoKV2l0aCB0aGUgbWlzc2luZyBwYXJlbnRoZXNlcyBhcm91bmQgdGhlIGVudGly
ZSBjb25zdHJ1Y3RzIGFkZGVkClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpJJ2QgbGlrZSB0byBub3RlIHRob3VnaCB0aGF0IGl0IHNvcnQgb2YgZmVlbHMgYXMg
aWYgdGhpcyBub3RhdGlvbgppc24ndCBnb2luZyB0byBwcm92aWRlIG1heGltdW0gZmxleGliaWxp
dHkuIEkgdGhlcmVmb3JlIHdvbmRlcgp3aGV0aGVyIHRoZSBsYXN0IHR3byBwYXJhbWV0ZXJzIHNo
b3VsZG4ndCBiZSBjb21iaW5lZCwgcmVzdWx0aW5nCmluIGFuIGludm9jYXRpb24gbGlrZQoKICAg
IHB0ciA9IHhtYWxsb2NfZmxleF9zdHJ1Y3Qoc3RydWN0IHMsIGZpZWxkWzVdKTsKCkJ1dCBJIHJl
YWxpemUgdGhpcyB3b3VsZCBhbGxvdyBmb3IgKG1vcmU7IEknbGwgcmVwbHkgdG8gcGF0Y2ggNgpp
biBhIG1pbnV0ZSkgYWJ1c2UsIHNvIHRoaXMgd291bGRuJ3QgYmUgYSBjbGVhciB3aW4uCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
