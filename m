Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE7114EDD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:16:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAci-0002dI-GL; Fri, 06 Dec 2019 10:14:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idAch-0002dD-48
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:14:07 +0000
X-Inumbo-ID: 21ff7162-1811-11ea-824f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21ff7162-1811-11ea-824f-12813bfff9fa;
 Fri, 06 Dec 2019 10:14:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFFE6B227;
 Fri,  6 Dec 2019 10:14:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
Message-ID: <313f5f41-1572-aa0e-1112-d606ad5dee9c@suse.com>
Date: Fri, 6 Dec 2019 11:14:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/3] x86: relax GDT check in
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
ZmllZCBsaW1pdC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWlu
LmMKQEAgLTg0MCw2ICs4NDAsNyBAQCBpbnQgYXJjaF9zZXRfaW5mb19ndWVzdCgKICNpZmRlZiBD
T05GSUdfUFYKICAgICBtZm5fdCBjcjNfbWZuOwogICAgIHN0cnVjdCBwYWdlX2luZm8gKmNyM19w
YWdlID0gTlVMTDsKKyAgICB1bnNpZ25lZCBpbnQgbnJfZ2R0X2ZyYW1lczsKICAgICBpbnQgcmMg
PSAwOwogI2VuZGlmCiAKQEAgLTk1MSw2ICs5NTIsOCBAQCBpbnQgYXJjaF9zZXRfaW5mb19ndWVz
dCgKICAgICAvKiBFbnN1cmUgcmVhbCBoYXJkd2FyZSBpbnRlcnJ1cHRzIGFyZSBlbmFibGVkLiAq
LwogICAgIHYtPmFyY2gudXNlcl9yZWdzLmVmbGFncyB8PSBYODZfRUZMQUdTX0lGOwogCisgICAg
bnJfZ2R0X2ZyYW1lcyA9IERJVl9ST1VORF9VUChjKGdkdF9lbnRzKSwgNTEyKTsKKwogICAgIGlm
ICggIXYtPmlzX2luaXRpYWxpc2VkICkKICAgICB7CiAgICAgICAgIGlmICggIWNvbXBhdCAmJiAh
KGZsYWdzICYgVkdDRl9pbl9rZXJuZWwpICYmICFjLm5hdC0+Y3RybHJlZ1sxXSApCkBAIC05ODIs
OSArOTg1LDkgQEAgaW50IGFyY2hfc2V0X2luZm9fZ3Vlc3QoCiAgICAgICAgICAgICBmYWlsID0g
Y29tcGF0X3Bmbl90b19jcjMocGZuKSAhPSBjLmNtcC0+Y3RybHJlZ1szXTsKICAgICAgICAgfQog
Ci0gICAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2LT5hcmNoLnB2LmdkdF9mcmFt
ZXMpOyArK2kgKQotICAgICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmdkdF9mcmFtZXNbaV0g
IT0gYyhnZHRfZnJhbWVzW2ldKTsKICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmdkdF9lbnRz
ICE9IGMoZ2R0X2VudHMpOworICAgICAgICBmb3IgKCBpID0gMDsgIWZhaWwgJiYgaSA8IG5yX2dk
dF9mcmFtZXM7ICsraSApCisgICAgICAgICAgICBmYWlsIHw9IHYtPmFyY2gucHYuZ2R0X2ZyYW1l
c1tpXSAhPSBjKGdkdF9mcmFtZXNbaV0pOwogCiAgICAgICAgIGZhaWwgfD0gdi0+YXJjaC5wdi5s
ZHRfYmFzZSAhPSBjKGxkdF9iYXNlKTsKICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmxkdF9l
bnRzICE9IGMobGR0X2VudHMpOwpAQCAtMTA4OSwxMiArMTA5MiwxMSBAQCBpbnQgYXJjaF9zZXRf
aW5mb19ndWVzdCgKICAgICBlbHNlCiAgICAgewogICAgICAgICB1bnNpZ25lZCBsb25nIGdkdF9m
cmFtZXNbQVJSQVlfU0laRSh2LT5hcmNoLnB2LmdkdF9mcmFtZXMpXTsKLSAgICAgICAgdW5zaWdu
ZWQgaW50IG5yX2ZyYW1lcyA9IERJVl9ST1VORF9VUChjLmNtcC0+Z2R0X2VudHMsIDUxMik7CiAK
LSAgICAgICAgaWYgKCBucl9mcmFtZXMgPiBBUlJBWV9TSVpFKHYtPmFyY2gucHYuZ2R0X2ZyYW1l
cykgKQorICAgICAgICBpZiAoIG5yX2dkdF9mcmFtZXMgPiBBUlJBWV9TSVpFKHYtPmFyY2gucHYu
Z2R0X2ZyYW1lcykgKQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKLSAgICAgICAgZm9y
ICggaSA9IDA7IGkgPCBucl9mcmFtZXM7ICsraSApCisgICAgICAgIGZvciAoIGkgPSAwOyBpIDwg
bnJfZ2R0X2ZyYW1lczsgKytpICkKICAgICAgICAgICAgIGdkdF9mcmFtZXNbaV0gPSBjLmNtcC0+
Z2R0X2ZyYW1lc1tpXTsKIAogICAgICAgICByYyA9IChpbnQpcHZfc2V0X2dkdCh2LCBnZHRfZnJh
bWVzLCBjLmNtcC0+Z2R0X2VudHMpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
