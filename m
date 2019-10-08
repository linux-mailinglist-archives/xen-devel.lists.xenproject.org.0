Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0AACFEC3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 18:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHs4Z-0000Z4-K9; Tue, 08 Oct 2019 16:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHs4Y-0000Yz-Gy
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 16:10:50 +0000
X-Inumbo-ID: 30ee2b90-e9e6-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ee2b90-e9e6-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 16:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B424B19D;
 Tue,  8 Oct 2019 16:10:47 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
Date: Tue, 8 Oct 2019 18:10:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCk5vdyB0aGF0IHhs
LmNmZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkgZW5hYmxlIElPTU1VIG1hcHBpbmdzIGZv
ciBhCmRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUgdG8gdGhl
IGNoZWNrIG9mCmlzX2lvbW11X2VuYWJsZWQoKSBpbiBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZSgp
LgpUaGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRvIHByZXZlbnQgbG9nZGlydHkgZnJvbSBiZWlu
ZyBlbmFibGVkIHVubGVzcwpkZXZpY2VzIGFyZSBhc3NpZ25lZCB0byBhIGRvbWFpbi4KCk5PVEU6
IFdoaWxlIGluIHRoZSBuZWlnaGJvdXJob29kLCB0aGUgYm9vbF90IHBhcmFtZXRlciB0eXBlIGlu
CiAgICAgIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkgaXMgcmVwbGFjZWQgd2l0aCBhIGJvb2wg
YW5kIHRoZSBmb3JtYXQKICAgICAgb2YgdGhlIGNvbW1lbnQgaW4gYXNzaWduX2RldmljZSgpIGlz
IGZpeGVkLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQp2MzoKIC0g
cmVkdWNlIHRvIGlvbW11X3VzZV9oYXBfcHQoKS1sZXNzIHZhcmlhbnQKdjI6CiAtIGV4cGFuZCBj
b21taXQgY29tbWVudAoKLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vaGFwL2hhcC5jCkBAIC03MSw3ICs3MSw3IEBAIGludCBoYXBfdHJhY2tfZGly
dHlfdnJhbShzdHJ1Y3QgZG9tYWluICoKIAogICAgICAgICBpZiAoICFwYWdpbmdfbW9kZV9sb2df
ZGlydHkoZCkgKQogICAgICAgICB7Ci0gICAgICAgICAgICByYyA9IHBhZ2luZ19sb2dfZGlydHlf
ZW5hYmxlKGQsIDApOworICAgICAgICAgICAgcmMgPSBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZShk
LCBmYWxzZSk7CiAgICAgICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKICAgICAgICAgfQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tL3BhZ2luZy5jCkBAIC0yMDksMTUgKzIwOSwxNSBAQCBzdGF0aWMgaW50IHBhZ2lu
Z19mcmVlX2xvZ19kaXJ0eV9iaXRtYXAoCiAgICAgcmV0dXJuIHJjOwogfQogCi1pbnQgcGFnaW5n
X2xvZ19kaXJ0eV9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IGxvZ19nbG9iYWwpCitp
bnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBsb2dfZ2xv
YmFsKQogewogICAgIGludCByZXQ7CiAKLSAgICBpZiAoIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYg
bG9nX2dsb2JhbCApCisgICAgaWYgKCBoYXNfYXJjaF9wZGV2cyhkKSAmJiBsb2dfZ2xvYmFsICkK
ICAgICB7CiAgICAgICAgIC8qCiAgICAgICAgICAqIFJlZnVzZSB0byB0dXJuIG9uIGdsb2JhbCBs
b2ctZGlydHkgbW9kZQotICAgICAgICAgKiBpZiB0aGUgZG9tYWluIGlzIHVzaW5nIHRoZSBJT01N
VS4KKyAgICAgICAgICogaWYgdGhlIGRvbWFpbiBpcyBzaGFyaW5nIHRoZSBQMk0gd2l0aCB0aGUg
SU9NTVUuCiAgICAgICAgICAqLwogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CkBAIC03
MjcsNyArNzI3LDcgQEAgaW50IHBhZ2luZ19kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwgc3RydQog
ICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIC8qIEVsc2UgZmFsbCB0aHJvdWdoLi4uICovCiAg
ICAgY2FzZSBYRU5fRE9NQ1RMX1NIQURPV19PUF9FTkFCTEVfTE9HRElSVFk6Ci0gICAgICAgIHJl
dHVybiBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZShkLCAxKTsKKyAgICAgICAgcmV0dXJuIHBhZ2lu
Z19sb2dfZGlydHlfZW5hYmxlKGQsIHRydWUpOwogCiAgICAgY2FzZSBYRU5fRE9NQ1RMX1NIQURP
V19PUF9PRkY6CiAgICAgICAgIGlmICggKHJjID0gcGFnaW5nX2xvZ19kaXJ0eV9kaXNhYmxlKGQs
IHJlc3VtaW5nKSkgIT0gMCApCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcGFnaW5nLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaApAQCAtMTU3LDcgKzE1Nyw3IEBAIHZvaWQg
cGFnaW5nX2xvZ19kaXJ0eV9yYW5nZShzdHJ1Y3QgZG9tYWkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50OF90ICpkaXJ0eV9iaXRtYXApOwogCiAvKiBlbmFibGUgbG9nIGRpcnR5ICov
Ci1pbnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IGxv
Z19nbG9iYWwpOworaW50IHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKHN0cnVjdCBkb21haW4gKmQs
IGJvb2wgbG9nX2dsb2JhbCk7CiAKIC8qIGxvZyBkaXJ0eSBpbml0aWFsaXphdGlvbiAqLwogdm9p
ZCBwYWdpbmdfbG9nX2RpcnR5X2luaXQoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGxv
Z19kaXJ0eV9vcHMgKm9wcyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
