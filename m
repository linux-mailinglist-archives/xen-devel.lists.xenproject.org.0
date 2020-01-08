Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8C134907
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:17:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEvL-0000yd-Ab; Wed, 08 Jan 2020 17:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEvJ-0000xU-R2
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:15:13 +0000
X-Inumbo-ID: 5d238150-323a-11ea-b85f-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d238150-323a-11ea-b85f-12813bfff9fa;
 Wed, 08 Jan 2020 17:14:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806119"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:42 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:14:09 -0800
Message-Id: <4e285f09f6c68deccf009b16c86898a78e349997.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 12/18] x86/mem_sharing: Enable mem_sharing on
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
aC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCAzZjM2Y2Q2YmJjLi5iOGE5MjI4ZWNmIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYwpAQCAtMTQxMiw2ICsxNDEyLDI0IEBAIHN0YXRpYyBpbnQgcmFuZ2Vfc2hh
cmUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QsCiAgICAgcmV0dXJuIHJjOwog
fQogCitzdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ19jb250cm9sKHN0cnVjdCBkb21haW4g
KmQsIGJvb2wgZW5hYmxlKQoreworICAgIGlmICggZW5hYmxlICkKKyAgICB7CisgICAgICAgIGlm
ICggdW5saWtlbHkoIWlzX2h2bV9kb21haW4oZCkpICkKKyAgICAgICAgICAgIHJldHVybiAtRU5P
U1lTOworCisgICAgICAgIGlmICggdW5saWtlbHkoIWhhcF9lbmFibGVkKGQpKSApCisgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKKworICAgICAgICBpZiAoIHVubGlrZWx5KGlzX2lvbW11X2Vu
YWJsZWQoZCkpICkKKyAgICAgICAgICAgIHJldHVybiAtRVhERVY7CisgICAgfQorCisgICAgZC0+
YXJjaC5odm0ubWVtX3NoYXJpbmcuZW5hYmxlZCA9IGVuYWJsZTsKKyAgICByZXR1cm4gMDsKK30K
KwogaW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9z
aGFyaW5nX29wX3QpIGFyZykKIHsKICAgICBpbnQgcmM7CkBAIC0xNDMzLDEwICsxNDUxLDggQEAg
aW50IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFy
aW5nX29wX3QpIGFyZykKICAgICBpZiAoIHJjICkKICAgICAgICAgZ290byBvdXQ7CiAKLSAgICAv
KiBPbmx5IEhBUCBpcyBzdXBwb3J0ZWQgKi8KLSAgICByYyA9IC1FTk9ERVY7Ci0gICAgaWYgKCAh
bWVtX3NoYXJpbmdfZW5hYmxlZChkKSApCi0gICAgICAgIGdvdG8gb3V0OworICAgIGlmICggIW1l
bV9zaGFyaW5nX2VuYWJsZWQoZCkgJiYgKHJjID0gbWVtX3NoYXJpbmdfY29udHJvbChkLCB0cnVl
KSkgKQorICAgICAgICByZXR1cm4gcmM7CiAKICAgICBzd2l0Y2ggKCBtc28ub3AgKQogICAgIHsK
QEAgLTE3MDMsMTggKzE3MTksMTAgQEAgaW50IG1lbV9zaGFyaW5nX2RvbWN0bChzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF9tZW1fc2hhcmluZ19vcCAqbWVjKQogewogICAgIGlu
dCByYzsKIAotICAgIC8qIE9ubHkgSEFQIGlzIHN1cHBvcnRlZCAqLwotICAgIGlmICggIWhhcF9l
bmFibGVkKGQpICkKLSAgICAgICAgcmV0dXJuIC1FTk9ERVY7Ci0KLSAgICBzd2l0Y2ggKCBtZWMt
Pm9wICkKKyAgICBzd2l0Y2goIG1lYy0+b3AgKQogICAgIHsKICAgICBjYXNlIFhFTl9ET01DVExf
TUVNX1NIQVJJTkdfQ09OVFJPTDoKLSAgICAgICAgcmMgPSAwOwotICAgICAgICBpZiAoIHVubGlr
ZWx5KGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgbWVjLT51LmVuYWJsZSkgKQotICAgICAgICAgICAg
cmMgPSAtRVhERVY7Ci0gICAgICAgIGVsc2UKLSAgICAgICAgICAgIGQtPmFyY2guaHZtLm1lbV9z
aGFyaW5nX2VuYWJsZWQgPSBtZWMtPnUuZW5hYmxlOworICAgICAgICByYyA9IG1lbV9zaGFyaW5n
X2NvbnRyb2woZCwgbWVjLT51LmVuYWJsZSk7CiAgICAgICAgIGJyZWFrOwogCiAgICAgZGVmYXVs
dDoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
