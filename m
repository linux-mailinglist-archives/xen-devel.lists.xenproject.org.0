Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F1125226
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfDA-0008NX-1F; Wed, 18 Dec 2019 19:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfD8-0008MH-8a
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:42:18 +0000
X-Inumbo-ID: 5dec2f46-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dec2f46-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196369"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:20 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:51 -0800
Message-Id: <e6a7c3561cdf2037b6d314a621e5ce3911a14105.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 14/20] x86/mem_sharing: Enable mem_sharing on
 first memop
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgd2FzdGVmdWwgdG8gcmVxdWlyZSBzZXBhcmF0ZSBoeXBlcmNhbGxzIHRvIGVuYWJsZSBz
aGFyaW5nIG9uIGJvdGggdGhlCnBhcmVudCBhbmQgdGhlIGNsaWVudCBkb21haW4gZHVyaW5nIFZN
IGZvcmtpbmcuIFRvIHNwZWVkIHRoaW5ncyB1cCB3ZSBlbmFibGUKc2hhcmluZyBvbiB0aGUgZmly
c3QgbWVtb3AgaW4gY2FzZSBpdCB3YXNuJ3QgYWxyZWFkeSBlbmFibGVkLgoKU2lnbmVkLW9mZi1i
eTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBlNWMxNDI0ZjliLi40ODgwOWE1MzQ5IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYwpAQCAtMTQwMiw2ICsxNDAyLDI0IEBAIHN0YXRpYyBpbnQgcmFuZ2Vfc2hh
cmUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QsCiAgICAgcmV0dXJuIHJjOwog
fQogCitzdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ19jb250cm9sKHN0cnVjdCBkb21haW4g
KmQsIGJvb2wgZW5hYmxlKQoreworICAgIGlmICggZW5hYmxlICkKKyAgICB7CisgICAgICAgIGlm
ICggdW5saWtlbHkoIWlzX2h2bV9kb21haW4oZCkpICkKKyAgICAgICAgICAgIHJldHVybiAtRU5P
U1lTOworCisgICAgICAgIGlmICggdW5saWtlbHkoIWhhcF9lbmFibGVkKGQpKSApCisgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKKworICAgICAgICBpZiAoIHVubGlrZWx5KGlzX2lvbW11X2Vu
YWJsZWQoZCkpICkKKyAgICAgICAgICAgIHJldHVybiAtRVhERVY7CisgICAgfQorCisgICAgZC0+
YXJjaC5odm0ubWVtX3NoYXJpbmcuZW5hYmxlZCA9IGVuYWJsZTsKKyAgICByZXR1cm4gMDsKK30K
KwogaW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9z
aGFyaW5nX29wX3QpIGFyZykKIHsKICAgICBpbnQgcmM7CkBAIC0xNDIzLDEwICsxNDQxLDggQEAg
aW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFy
aW5nX29wX3QpIGFyZykKICAgICBpZiAoIHJjICkKICAgICAgICAgZ290byBvdXQ7CiAKLSAgICAv
KiBPbmx5IEhBUCBpcyBzdXBwb3J0ZWQgKi8KLSAgICByYyA9IC1FTk9ERVY7Ci0gICAgaWYgKCAh
bWVtX3NoYXJpbmdfZW5hYmxlZChkKSApCi0gICAgICAgIGdvdG8gb3V0OworICAgIGlmICggIW1l
bV9zaGFyaW5nX2VuYWJsZWQoZCkgJiYgKHJjID0gbWVtX3NoYXJpbmdfY29udHJvbChkLCB0cnVl
KSkgKQorICAgICAgICByZXR1cm4gcmM7CiAKICAgICBzd2l0Y2ggKCBtc28ub3AgKQogICAgIHsK
QEAgLTE2NzUsMjQgKzE2OTEsMTUgQEAgaW50IG1lbV9zaGFyaW5nX2RvbWN0bChzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF9tZW1fc2hhcmluZ19vcCAqbWVjKQogewogICAgIGlu
dCByYzsKIAotICAgIC8qIE9ubHkgSEFQIGlzIHN1cHBvcnRlZCAqLwotICAgIGlmICggIWhhcF9l
bmFibGVkKGQpICkKLSAgICAgICAgIHJldHVybiAtRU5PREVWOwotCiAgICAgc3dpdGNoKG1lYy0+
b3ApCiAgICAgewogICAgICAgICBjYXNlIFhFTl9ET01DVExfTUVNX1NIQVJJTkdfQ09OVFJPTDoK
LSAgICAgICAgewotICAgICAgICAgICAgcmMgPSAwOwotICAgICAgICAgICAgaWYgKCB1bmxpa2Vs
eShpc19pb21tdV9lbmFibGVkKGQpICYmIG1lYy0+dS5lbmFibGUpICkKLSAgICAgICAgICAgICAg
ICByYyA9IC1FWERFVjsKLSAgICAgICAgICAgIGVsc2UKLSAgICAgICAgICAgICAgICBkLT5hcmNo
Lmh2bS5tZW1fc2hhcmluZy5lbmFibGVkID0gbWVjLT51LmVuYWJsZTsKLSAgICAgICAgfQotICAg
ICAgICBicmVhazsKKyAgICAgICAgICAgIHJjID0gbWVtX3NoYXJpbmdfY29udHJvbChkLCBtZWMt
PnUuZW5hYmxlKTsKKyAgICAgICAgICAgIGJyZWFrOwogCiAgICAgICAgIGRlZmF1bHQ6CiAgICAg
ICAgICAgICByYyA9IC1FTk9TWVM7CisgICAgICAgICAgICBicmVhazsKICAgICB9CiAKICAgICBy
ZXR1cm4gcmM7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
