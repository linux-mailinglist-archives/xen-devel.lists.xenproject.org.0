Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EF127BFF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:52:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIeo-0000DL-AZ; Fri, 20 Dec 2019 13:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIem-0000D5-F2
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:49:28 +0000
X-Inumbo-ID: 8542cb2e-232f-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8542cb2e-232f-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 13:49:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34926AB92;
 Fri, 20 Dec 2019 13:49:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
Message-ID: <3f78d1dc-720d-6bf3-0911-c19da1a2ddbb@suse.com>
Date: Fri, 20 Dec 2019 14:49:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/3] x86: relax GDT check in
 arch_set_info_guest()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNrIGZyYW1lcyBiZXlvbmQgdGhlIGd1ZXN0IHNwZWNp
ZmllZCBsaW1pdAooaW4gdGhlIG5hdGl2ZSBjYXNlLCBvdGhlciB0aGFuIGluIHRoZSBjb21wYXQg
b25lKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAg
LTg0MCw2ICs4NDAsNyBAQCBpbnQgYXJjaF9zZXRfaW5mb19ndWVzdCgKICNpZmRlZiBDT05GSUdf
UFYKICAgICBtZm5fdCBjcjNfbWZuOwogICAgIHN0cnVjdCBwYWdlX2luZm8gKmNyM19wYWdlID0g
TlVMTDsKKyAgICB1bnNpZ25lZCBpbnQgbnJfZ2R0X2ZyYW1lczsKICAgICBpbnQgcmMgPSAwOwog
I2VuZGlmCiAKQEAgLTk1MSw2ICs5NTIsOCBAQCBpbnQgYXJjaF9zZXRfaW5mb19ndWVzdCgKICAg
ICAvKiBFbnN1cmUgcmVhbCBoYXJkd2FyZSBpbnRlcnJ1cHRzIGFyZSBlbmFibGVkLiAqLwogICAg
IHYtPmFyY2gudXNlcl9yZWdzLmVmbGFncyB8PSBYODZfRUZMQUdTX0lGOwogCisgICAgbnJfZ2R0
X2ZyYW1lcyA9IERJVl9ST1VORF9VUChjKGdkdF9lbnRzKSwgNTEyKTsKKwogICAgIGlmICggIXYt
PmlzX2luaXRpYWxpc2VkICkKICAgICB7CiAgICAgICAgIGlmICggIWNvbXBhdCAmJiAhKGZsYWdz
ICYgVkdDRl9pbl9rZXJuZWwpICYmICFjLm5hdC0+Y3RybHJlZ1sxXSApCkBAIC05ODIsOSArOTg1
LDkgQEAgaW50IGFyY2hfc2V0X2luZm9fZ3Vlc3QoCiAgICAgICAgICAgICBmYWlsID0gY29tcGF0
X3Bmbl90b19jcjMocGZuKSAhPSBjLmNtcC0+Y3RybHJlZ1szXTsKICAgICAgICAgfQogCi0gICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2LT5hcmNoLnB2LmdkdF9mcmFtZXMpOyAr
K2kgKQotICAgICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmdkdF9mcmFtZXNbaV0gIT0gYyhn
ZHRfZnJhbWVzW2ldKTsKICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmdkdF9lbnRzICE9IGMo
Z2R0X2VudHMpOworICAgICAgICBmb3IgKCBpID0gMDsgIWZhaWwgJiYgaSA8IG5yX2dkdF9mcmFt
ZXM7ICsraSApCisgICAgICAgICAgICBmYWlsIHw9IHYtPmFyY2gucHYuZ2R0X2ZyYW1lc1tpXSAh
PSBjKGdkdF9mcmFtZXNbaV0pOwogCiAgICAgICAgIGZhaWwgfD0gdi0+YXJjaC5wdi5sZHRfYmFz
ZSAhPSBjKGxkdF9iYXNlKTsKICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmxkdF9lbnRzICE9
IGMobGR0X2VudHMpOwpAQCAtMTA4OSwxMiArMTA5MiwxMSBAQCBpbnQgYXJjaF9zZXRfaW5mb19n
dWVzdCgKICAgICBlbHNlCiAgICAgewogICAgICAgICB1bnNpZ25lZCBsb25nIGdkdF9mcmFtZXNb
QVJSQVlfU0laRSh2LT5hcmNoLnB2LmdkdF9mcmFtZXMpXTsKLSAgICAgICAgdW5zaWduZWQgaW50
IG5yX2ZyYW1lcyA9IERJVl9ST1VORF9VUChjLmNtcC0+Z2R0X2VudHMsIDUxMik7CiAKLSAgICAg
ICAgaWYgKCBucl9mcmFtZXMgPiBBUlJBWV9TSVpFKHYtPmFyY2gucHYuZ2R0X2ZyYW1lcykgKQor
ICAgICAgICBpZiAoIG5yX2dkdF9mcmFtZXMgPiBBUlJBWV9TSVpFKHYtPmFyY2gucHYuZ2R0X2Zy
YW1lcykgKQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKLSAgICAgICAgZm9yICggaSA9
IDA7IGkgPCBucl9mcmFtZXM7ICsraSApCisgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfZ2R0
X2ZyYW1lczsgKytpICkKICAgICAgICAgICAgIGdkdF9mcmFtZXNbaV0gPSBjLmNtcC0+Z2R0X2Zy
YW1lc1tpXTsKIAogICAgICAgICByYyA9IChpbnQpcHZfc2V0X2dkdCh2LCBnZHRfZnJhbWVzLCBj
LmNtcC0+Z2R0X2VudHMpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
