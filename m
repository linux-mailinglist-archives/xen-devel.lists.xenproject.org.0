Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE95A128B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 09:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Ekh-0004U7-J1; Thu, 29 Aug 2019 07:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Ekg-0004U2-2x
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 07:21:50 +0000
X-Inumbo-ID: a96df632-ca2d-11e9-ae5e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a96df632-ca2d-11e9-ae5e-12813bfff9fa;
 Thu, 29 Aug 2019 07:21:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3FDBB624;
 Thu, 29 Aug 2019 07:21:46 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
 <e67b882b-64ff-9735-9006-b0c4592a3995@suse.com>
 <4c7a381c-6f9c-3fd1-82e2-76f6b829d4ef@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b09510d-6961-3071-493e-53bba9536aa1@suse.com>
Date: Thu, 29 Aug 2019 09:21:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4c7a381c-6f9c-3fd1-82e2-76f6b829d4ef@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 4/8] xen/common: Introduce
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
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAyMDoyMywgT2xla3NhbmRyIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi94bWFsbG9jLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4gQEAgLTM1
LDYgKzM1LDE4IEBACj4gIMKgI2RlZmluZSB4emFsbG9jX2FycmF5KF90eXBlLCBfbnVtKSBcCj4g
IMKgwqDCoMKgICgoX3R5cGUgKilfeHphbGxvY19hcnJheShzaXplb2YoX3R5cGUpLCBfX2FsaWdu
b2ZfXyhfdHlwZSksIF9udW0pKQo+IAo+ICsvKiBBbGxvY2F0ZSBzcGFjZSBmb3IgYSBzdHJ1Y3R1
cmUgd2l0aCBhIGZsZXhpYmxlIGFycmF5IG9mIHR5cGVkIAo+IG9iamVjdHMuICovCj4gKyNkZWZp
bmUgeG1hbGxvY19mbGV4X3N0cnVjdCh0eXBlLCBmaWVsZCwgbnIpIFwKPiArwqDCoMKgICgodHlw
ZSAqKV94bWFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25vZl9fKHR5cGUp
KSkKPiArCj4gKy8qIFJlLWFsbG9jYXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxl
eGlibGUgYXJyYXkgb2YgdHlwZWQgCj4gb2JqZWN0cy4gKi8KPiArI2RlZmluZSB4cmVhbGxvY19m
bGV4X3N0cnVjdChwdHIsIHR5cGUsIGZpZWxkLCBucikgCj4gKHvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiArwqDCoMKgIHR5cGVvZigqKHB0cikpICpw
dHJfID0gCj4gKHB0cik7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ICvCoMKgwqAg
LyogVHlwZSBjaGVja2luZzogbWFrZSBzdXJlIHRoYXQgaW5jb21pbmcgcG9pbnRlciBpcyBvZiBj
b3JyZWN0IAo+IHR5cGUgKi/CoCBcCj4gK8KgwqDCoCAodm9pZCkoKHB0cikgPT0gKHR5cGUgCj4g
KikwKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ICvCoMKgwqAgKHR5cGUg
KilfeHJlYWxsb2MocHRyXywgb2Zmc2V0b2YodHlwZSwgZmllbGRbbnJdKSwgCj4gX19hbGlnbm9m
X18odHlwZSkpO8KgwqAgXAo+ICt9KQo+ICsKCldoYXQgYWJvdXQKCiNkZWZpbmUgeHJlYWxsb2Nf
ZmxleF9zdHJ1Y3QocHRyLCBmaWVsZCwgbnIpICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICh0eXBlb2YocHRyKSlfeHJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBlb2YoKihwdHIpKSwgZmll
bGRbbnJdKSwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICBfX2FsaWdub2ZfXyh0eXBlb2Yo
KihwdHIpKSkpCgo/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
