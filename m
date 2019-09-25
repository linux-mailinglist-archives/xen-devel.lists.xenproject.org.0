Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FECBE1A9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:51:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Y9-0000zg-Mr; Wed, 25 Sep 2019 15:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Y7-0000yP-NH
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:49:51 +0000
X-Inumbo-ID: 11b601b0-dfac-11e9-bf31-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 11b601b0-dfac-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812652"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:30 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:44 -0700
Message-Id: <bc3ba2d3208e315bf06fa363fd009cac1da71d9a.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 06/18] x86/mem_sharing: drop flags
 from mem_sharing_unshare_page
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGNhbGxlcnMgcGFzcyAwIGluLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAg
ICAgICAgfCAyICstCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICAgfCA1ICsrLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCA4ICsrKy0tLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCBkNzFk
MmFkNWQ3Li43YzI1NTcyOGMyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTE4NzksNyArMTg3OSw3IEBAIGludCBodm1f
aGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKICAg
ICBpZiAoIG5wZmVjLndyaXRlX2FjY2VzcyAmJiAocDJtdCA9PSBwMm1fcmFtX3NoYXJlZCkgKQog
ICAgIHsKICAgICAgICAgQVNTRVJUKHAybV9pc19ob3N0cDJtKHAybSkpOwotICAgICAgICBzaGFy
aW5nX2Vub21lbSA9IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShjdXJyZCwgZ2ZuLCAwKTsKKyAg
ICAgICAgc2hhcmluZ19lbm9tZW0gPSBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoY3VycmQsIGdm
bik7CiAgICAgICAgIHJjID0gMTsKICAgICAgICAgZ290byBvdXRfcHV0X2dmbjsKICAgICB9CmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
aW5kZXggNzE0MTU4ZDJhNi4uM2QyN2M2YzkxYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21t
L3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtNTEwLDcgKzUxMCw3IEBAIG1m
bl90IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25l
ZCBsb25nIGdmbl9sLAogICAgICAgICAgKiBUcnkgdG8gdW5zaGFyZS4gSWYgd2UgZmFpbCwgY29t
bXVuaWNhdGUgRU5PTUVNIHdpdGhvdXQKICAgICAgICAgICogc2xlZXBpbmcuCiAgICAgICAgICAq
LwotICAgICAgICBpZiAoIG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShwMm0tPmRvbWFpbiwgZ2Zu
X2wsIDApIDwgMCApCisgICAgICAgIGlmICggbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHAybS0+
ZG9tYWluLCBnZm5fbCkgPCAwICkKICAgICAgICAgICAgIG1lbV9zaGFyaW5nX25vdGlmeV9lbm9t
ZW0ocDJtLT5kb21haW4sIGdmbl9sLCBmYWxzZSk7CiAgICAgICAgIG1mbiA9IHAybS0+Z2V0X2Vu
dHJ5KHAybSwgZ2ZuLCB0LCBhLCBxLCBwYWdlX29yZGVyLCBOVUxMKTsKICAgICB9CkBAIC04OTEs
OCArODkxLDcgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgZ2Zu
X3QgZ2ZuLCBtZm5fdCBtZm4sCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIERvIGFuIHVuc2hh
cmUgdG8gY2xlYW5seSB0YWtlIGNhcmUgb2YgYWxsIGNvcm5lciBjYXNlcy4gKi8KICAgICAgICAg
ICAgIGludCByYzsKLSAgICAgICAgICAgIHJjID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHAy
bS0+ZG9tYWluLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Zu
X3goZ2ZuX2FkZChnZm4sIGkpKSwgMCk7CisgICAgICAgICAgICByYyA9IG1lbV9zaGFyaW5nX3Vu
c2hhcmVfcGFnZShwMm0tPmRvbWFpbiwgZ2ZuX3goZ2ZuX2FkZChnZm4sIGkpKSk7CiAgICAgICAg
ICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBwMm1fdW5sb2Nr
KHAybSk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKaW5kZXggMTI4MDgzMGE4NS4uOGRlYjBj
ZWVlNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaApAQCAtNzAsMTAgKzcwLDkgQEAgaW50
IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAKIHN0YXRpYyBp
bmxpbmUKIGludCBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4sCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzKQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGdmbikKIHsKLSAgICBpbnQgcmMgPSBfX21lbV9zaGFyaW5n
X3Vuc2hhcmVfcGFnZShkLCBnZm4sIGZsYWdzKTsKKyAgICBpbnQgcmMgPSBfX21lbV9zaGFyaW5n
X3Vuc2hhcmVfcGFnZShkLCBnZm4sIDApOwogICAgIEJVR19PTiggcmMgJiYgKHJjICE9IC1FTk9N
RU0pICk7CiAgICAgcmV0dXJuIHJjOwogfQpAQCAtMTE3LDggKzExNiw3IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgaW50IG1lbV9zaGFyaW5nX2dldF9ucl9zaGFyZWRfbWZucyh2b2lkKQogfQog
CiBzdGF0aWMgaW5saW5lCi1pbnQgbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MTZfdCBmbGFncykKK2ludCBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRvbWFp
biAqZCwgdW5zaWduZWQgbG9uZyBnZm4pCiB7CiAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CiAg
ICAgcmV0dXJuIC1FT1BOT1RTVVBQOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
