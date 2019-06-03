Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBFD32FAC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:31:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm5K-0003CC-6O; Mon, 03 Jun 2019 12:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXm5J-0003Bx-0o
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:29:05 +0000
X-Inumbo-ID: 2c6f9f4e-85fb-11e9-a371-37b75626542c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2c6f9f4e-85fb-11e9-a371-37b75626542c;
 Mon, 03 Jun 2019 12:29:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA7E15A2;
 Mon,  3 Jun 2019 05:29:03 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8B13F5AF;
 Mon,  3 Jun 2019 05:29:02 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-8-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9526dbfc-ca51-9d39-0d67-ce1009dba3a5@arm.com>
Date: Mon, 3 Jun 2019 13:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-8-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 07/10] xen/arm: optee: add support for
 arbitrary shared memory
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gKyAgICB3aGlsZSAoIHBnX2NvdW50ICkKPiArICAgIHsKPiArICAgICAgICBzdHJ1Y3Qg
cGFnZV9pbmZvICpwYWdlOwo+ICsKPiArICAgICAgICBpZiAoIGlkeCA9PSAwICkKPiArICAgICAg
ICB7Cj4gKyAgICAgICAgICAgIGd1ZXN0X3BnID0gZ2V0X2RvbWFpbl9yYW1fcGFnZShnZm4pOwo+
ICsgICAgICAgICAgICBpZiAoICFndWVzdF9wZyApCj4gKyAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiArCj4gKyAgICAgICAgICAgIGd1ZXN0X2RhdGEgPSBfX21hcF9kb21haW5fcGFn
ZShndWVzdF9wZyk7Cj4gKyAgICAgICAgICAgIHhlbl9kYXRhID0gX19tYXBfZG9tYWluX3BhZ2Uo
eGVuX3Bncyk7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFRP
RE86IFRoYXQgZnVuY3Rpb24gY2FuIHBpbiB1cCB0byA2NE1CIG9mIGd1ZXN0IG1lbW9yeSBieQo+
ICsgICAgICAgICAqIGNhbGxpbmcgbG9va3VwX2FuZF9waW5fZ3Vlc3RfcmFtX2FkZHIoKSAxNjM4
NCB0aW1lcy4KCkkgY2FuJ3QgZmluZCB0aGUgQlVJTERfQlVHX09OKFBBR0VfU0laRSAhPSA0MDk2
KSBhcyBJIHJlcXVlc3RlZCBiZWZvcmUuCgo+ICsgICAgICAgICAqIFRoaXMgaXMgY29uc2lkZXJl
ZCBpbnNlY3VyZSBhbmQgc2hvdWxkIGJlIGZpeGVkIGluIHRoZSBmdXR1cmUuCgpXZWxsLCBpdCBp
cyBub3QgImNvbnNpZGVyZWQiLCBpdCBpcyBpbnNlY3VyZSBhcyB0aGUgZ3Vlc3Qgd291bGQgYmUg
YWJsZSB0byBkZWxheSAKcHJvY2Vzc2luZyBvdGhlciBndWVzdCBmb3Igc29tZSB0aW1lcy4KClNv
IGhvdyBhYm91dDoKCiJUaGlzIHNob3VsZCBiZSBhZGRyZXNzZWQgYmVmb3JlIGRlY2xhcmluZyBP
UC1URUUgc2VjdXJpdHkgc3VwcG9ydGVkIi4KCldpdGggdGhhdDoKCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiArICAgICAgICAgKi8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
