Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5FB378A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9ncR-00050P-PB; Mon, 16 Sep 2019 09:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9ncP-00050D-PL
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:48:25 +0000
X-Inumbo-ID: 2004b226-d867-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2004b226-d867-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 09:48:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB881AD7F;
 Mon, 16 Sep 2019 09:48:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Message-ID: <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
Date: Mon, 16 Sep 2019 11:48:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WEVEIGNvbW1pdCAxYjJmZDk0NDI1ICgiVXBkYXRlIE1PVlNYRCB0byBtb2Rlcm4gYmVoYXZpb3Ii
KSBwb2ludHMgb3V0CnRoYXQgYXMgb2YgU0RNIHJldiAwNjQgTU9WU1hEIGlzIHNwZWNpZmllZCB0
byByZWFkIG9ubHkgMTYgYml0cyBmcm9tCm1lbW9yeSAob3IgcmVnaXN0ZXIpIHdoZW4gdXNlZCB3
aXRob3V0IFJFWC5XIGFuZCB3aXRoIG9wZXJhbmQgc2l6ZQpvdmVycmlkZS4gU2luY2UgdGhlIHVw
cGVyIDE2IGJpdHMgb2YgdGhlIHZhbHVlIHJlYWQgd29uJ3QgYmUgdXNlZAphbnl3YXkgaW4gdGhp
cyBjYXNlLCBtYWtlIHRoZSBlbXVsYXRpb24gdW5pZm9ybWx5IGZvbGxvdyB0aGlzIG1vcmUKY29t
cGF0aWJsZSBiZWhhdmlvciB3aGVuIG5vdCBlbXVsYXRpbmcgYW4gQU1ELWxpa2UgQ1BVLCBhdCB0
aGUgcmlzawpvZiBtaXNzaW5nIGFuIGV4Y2VwdGlvbiB3aGVuIGVtdWxhdGluZyBvbi9mb3Igb2xk
ZXIgaGFyZHdhcmUgKHRoZQpib3VuZGFyeSBhdCBTYW5keUJyaWRnZSBub3RlZCBpbiBzYWlkIGNv
bW1pdCBsb29rcyBxdWVzdGlvbmFibGUgLSBJJ3ZlCm9ic2VydmVkIHRoZSAibmV3IiBiZWhhdmlv
ciBhbHNvIG9uIFdlc3RtZXJlKS4KCldoaWxlIHRvdWNoaW5nIHRoaXMgY29kZSBJIGFsc28gbm90
aWNlZCB0aGF0ICNVRCBvdXRzaWRlIG9mIHByb3RlY3RlZAptb2RlIGdldHMgcmFpc2VkIGZvciBB
UlBMIG9ubHkgYWZ0ZXIgaGF2aW5nIHJlYWQgdGhlIG1lbW9yeSBvcGVyYW5kIC0KY29ycmVjdCB0
aGlzIGF0dGhlIHNhbWUgdGltZSBieSBtb3ZpbmcgdXAgdGhlIHJlc3BlY3RpdmUgY29uc3RydWN0
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTQwNDgsOCArNDA0OCwxMiBAQCB4ODZfZW11
bGF0ZSgKICAgICAgICAgICAgIC8qIG1vdnN4ZCAqLwogICAgICAgICAgICAgaWYgKCBlYS50eXBl
ID09IE9QX1JFRyApCiAgICAgICAgICAgICAgICAgc3JjLnZhbCA9ICplYS5yZWc7Ci0gICAgICAg
ICAgICBlbHNlIGlmICggKHJjID0gcmVhZF91bG9uZyhlYS5tZW0uc2VnLCBlYS5tZW0ub2ZmLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNyYy52YWwsIDQsIGN0eHQs
IG9wcykpICkKKyAgICAgICAgICAgIGVsc2UgaWYgKCAocmMgPSByZWFkX3Vsb25nKGVhLm1lbS5z
ZWcsIGVhLm1lbS5vZmYsICZzcmMudmFsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKG9wX2J5dGVzID09IDIgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAhKGN0eHQtPmNwdWlkLT54ODZfdmVuZG9yICYKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlH
T04pKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gMiA6IDQpLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4dCwgb3BzKSkgKQogICAg
ICAgICAgICAgICAgIGdvdG8gZG9uZTsKICAgICAgICAgICAgIGRzdC52YWwgPSAoaW50MzJfdClz
cmMudmFsOwogICAgICAgICB9CkBAIC00MDU4LDYgKzQwNjIsOCBAQCB4ODZfZW11bGF0ZSgKICAg
ICAgICAgICAgIC8qIGFycGwgKi8KICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzcmNfcnBsID0g
ZHN0LnZhbCAmIDM7CiAKKyAgICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighaW5fcHJv
dG1vZGUoY3R4dCwgb3BzKSwgRVhDX1VEKTsKKwogICAgICAgICAgICAgZHN0ID0gZWE7CiAgICAg
ICAgICAgICBkc3QuYnl0ZXMgPSAyOwogICAgICAgICAgICAgaWYgKCBkc3QudHlwZSA9PSBPUF9S
RUcgKQpAQCAtNDA3NSw3ICs0MDgxLDYgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgICAgICAgICAg
X3JlZ3MuZWZsYWdzICY9IH5YODZfRUZMQUdTX1pGOwogICAgICAgICAgICAgICAgIGRzdC50eXBl
ID0gT1BfTk9ORTsKICAgICAgICAgICAgIH0KLSAgICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlv
bl9pZighaW5fcHJvdG1vZGUoY3R4dCwgb3BzKSwgRVhDX1VEKTsKICAgICAgICAgfQogICAgICAg
ICBicmVhazsKIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
