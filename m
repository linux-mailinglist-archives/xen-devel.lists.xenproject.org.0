Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA893BE1BE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Yh-00027m-TB; Wed, 25 Sep 2019 15:50:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Yg-00026y-Nt
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:50:26 +0000
X-Inumbo-ID: 13f17c02-dfac-11e9-bf31-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 13f17c02-dfac-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812693"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:36 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:52 -0700
Message-Id: <31f87866d0f24657ce12e6ca32c8a552639cb34d.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 14/18] x86/mem_sharing: Enable
 mem_sharing on first memop
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
ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCA5OWYyNGZjZjZjLi42NWFhNjRiZTk5IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYwpAQCAtMTQwMiw2ICsxNDAyLDI0IEBAIHN0YXRpYyBpbnQgcmFuZ2Vfc2hh
cmUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QsCiAgICAgcmV0dXJuIHJjOwog
fQogCitzdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ19jb250cm9sKHN0cnVjdCBkb21haW4g
KmQsIGJvb2wgZW5hYmxlKQoreworICAgIGlmICggZW5hYmxlICkKKyAgICB7CisgICAgICAgIGlm
ICggdW5saWtlbHkoIWlzX2h2bV9kb21haW4oZCkpICkKKyAgICAgICAgICAgIHJldHVybiAtRU5P
U1lTOworCisgICAgICAgIGlmICggdW5saWtlbHkoIWhhcF9lbmFibGVkKGQpKSApCisgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKKworICAgICAgICBpZiAoIHVubGlrZWx5KGhhc19pb21tdV9w
dChkKSkgKQorICAgICAgICAgICAgcmV0dXJuIC1FWERFVjsKKyAgICB9CisKKyAgICBkLT5hcmNo
Lmh2bS5tZW1fc2hhcmluZy5lbmFibGVkID0gZW5hYmxlOworICAgIHJldHVybiAwOworfQorCiBp
bnQgbWVtX3NoYXJpbmdfbWVtb3AoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fbWVtX3NoYXJp
bmdfb3BfdCkgYXJnKQogewogICAgIGludCByYzsKQEAgLTE0MjMsMTAgKzE0NDEsOCBAQCBpbnQg
bWVtX3NoYXJpbmdfbWVtb3AoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fbWVtX3NoYXJpbmdf
b3BfdCkgYXJnKQogICAgIGlmICggcmMgKQogICAgICAgICBnb3RvIG91dDsKIAotICAgIC8qIE9u
bHkgSEFQIGlzIHN1cHBvcnRlZCAqLwotICAgIHJjID0gLUVOT0RFVjsKLSAgICBpZiAoICFtZW1f
c2hhcmluZ19lbmFibGVkKGQpICkKLSAgICAgICAgZ290byBvdXQ7CisgICAgaWYgKCAhbWVtX3No
YXJpbmdfZW5hYmxlZChkKSAmJiAocmMgPSBtZW1fc2hhcmluZ19jb250cm9sKGQsIHRydWUpKSAp
CisgICAgICAgIHJldHVybiByYzsKIAogICAgIHN3aXRjaCAoIG1zby5vcCApCiAgICAgewpAQCAt
MTY3NSwyNCArMTY5MSwxNSBAQCBpbnQgbWVtX3NoYXJpbmdfZG9tY3RsKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCB4ZW5fZG9tY3RsX21lbV9zaGFyaW5nX29wICptZWMpCiB7CiAgICAgaW50IHJj
OwogCi0gICAgLyogT25seSBIQVAgaXMgc3VwcG9ydGVkICovCi0gICAgaWYgKCAhaGFwX2VuYWJs
ZWQoZCkgKQotICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Ci0KICAgICBzd2l0Y2gobWVjLT5vcCkK
ICAgICB7CiAgICAgICAgIGNhc2UgWEVOX0RPTUNUTF9NRU1fU0hBUklOR19DT05UUk9MOgotICAg
ICAgICB7Ci0gICAgICAgICAgICByYyA9IDA7Ci0gICAgICAgICAgICBpZiAoIHVubGlrZWx5KGhh
c19pb21tdV9wdChkKSAmJiBtZWMtPnUuZW5hYmxlKSApCi0gICAgICAgICAgICAgICAgcmMgPSAt
RVhERVY7Ci0gICAgICAgICAgICBlbHNlCi0gICAgICAgICAgICAgICAgZC0+YXJjaC5odm0ubWVt
X3NoYXJpbmcuZW5hYmxlZCA9IG1lYy0+dS5lbmFibGU7Ci0gICAgICAgIH0KLSAgICAgICAgYnJl
YWs7CisgICAgICAgICAgICByYyA9IG1lbV9zaGFyaW5nX2NvbnRyb2woZCwgbWVjLT51LmVuYWJs
ZSk7CisgICAgICAgICAgICBicmVhazsKIAogICAgICAgICBkZWZhdWx0OgogICAgICAgICAgICAg
cmMgPSAtRU5PU1lTOworICAgICAgICAgICAgYnJlYWs7CiAgICAgfQogCiAgICAgcmV0dXJuIHJj
OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
