Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8EBB17E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKfz-00031e-G6; Mon, 23 Sep 2019 09:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCKfx-00031V-Hg
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:30:33 +0000
X-Inumbo-ID: ca3ee7e8-dde4-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ca3ee7e8-dde4-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 09:30:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C4871000;
 Mon, 23 Sep 2019 02:30:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0F553F59C;
 Mon, 23 Sep 2019 02:30:31 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a9e5bca0-bc29-b82a-d9fc-0037ecc7939e@arm.com>
Date: Mon, 23 Sep 2019 10:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-3-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/6] xen/arm: optee: check for preemption
 while freeing shared buffers
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

SGkgVm9sb2R5bXlyLAoKT24gMTgvMDkvMjAxOSAxOTo1MCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gV2UgY2FuIGNoZWNrIGZvciBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGluIHRoZSBs
b29wIGluc2lkZQo+IG9wdGVlX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgdG8gaW5jcmVhc2UgaHlw
ZXJ2aXNvciByZXNwb25zaXZlbmVzcyBpbgo+IGNhc2UgaWYgcHJlZW1wdGlvbiBpcyByZXF1aXJl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNo
dWtAZXBhbS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KCkNoZWVycywKCj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBmcm9tIHYxOgo+ICAgLSBSZW1vdmVk
IGV4dHJhIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkKPiAgIC0gVXBkYXRlZCB0aGUgY29tbWl0
IG1lc3NhZ2UKPiAtLS0KPiAgIHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyB8IDEzICsrKysrLS0t
LS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyBiL3hlbi9hcmNoL2Fy
bS90ZWUvb3B0ZWUuYwo+IGluZGV4IGQ2NGU5YzNiODUuLjU1ZDExYjkxYTkgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRl
ZS5jCj4gQEAgLTYzMywxNyArNjMzLDE0IEBAIHN0YXRpYyBpbnQgb3B0ZWVfcmVsaW5xdWlzaF9y
ZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoIHNobV9ycGMsIHNobV9ycGNfdG1wLCAmY3R4LT5zaG1fcnBjX2xpc3QsIGxpc3QgKQo+ICAg
ICAgICAgICBmcmVlX3NobV9ycGMoY3R4LCBzaG1fcnBjLT5jb29raWUpOwo+ICAgCj4gLSAgICBp
ZiAoIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgKQo+IC0gICAgICAgIHJldHVybiAtRVJFU1RB
UlQ7Cj4gLQo+IC0gICAgLyoKPiAtICAgICAqIFRPRE86IEd1ZXN0IGNhbiBwaW4gdXAgdG8gTUFY
X1RPVEFMX1NNSF9CVUZfUEcgcGFnZXMgYW5kIGFsbCBvZgo+IC0gICAgICogdGhlbSB3aWxsIGJl
IHB1dCBpbiB0aGlzIGxvb3AuIEl0IGlzIHdvcnRoIGNvbnNpZGVyaW5nIHRvCj4gLSAgICAgKiBj
aGVjayBmb3IgcHJlZW1wdGlvbiBpbnNpZGUgdGhlIGxvb3AuCj4gLSAgICAgKi8KPiAgICAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoIG9wdGVlX3NobV9idWYsIG9wdGVlX3NobV9idWZfdG1w
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0eC0+b3B0ZWVfc2htX2J1Zl9s
aXN0LCBsaXN0ICkKPiArICAgIHsKPiArICAgICAgICBpZiAoIGh5cGVyY2FsbF9wcmVlbXB0X2No
ZWNrKCkgKQo+ICsgICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwo+ICsKPiAgICAgICAgICAg
ZnJlZV9vcHRlZV9zaG1fYnVmKGN0eCwgb3B0ZWVfc2htX2J1Zi0+Y29va2llKTsKPiArICAgIH0K
PiAgIAo+ICAgICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCj4gICAgICAgICAg
IHJldHVybiAtRVJFU1RBUlQ7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
