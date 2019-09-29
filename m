Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAAC1ADE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo3B-00018d-O1; Mon, 30 Sep 2019 05:16:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jOUw=XZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iEo3A-00018V-H0
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:16:44 +0000
X-Inumbo-ID: 7c103fba-e341-11e9-97fb-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by localhost (Halon) with ESMTPS
 id 7c103fba-e341-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 05:16:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2019 22:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; d="scan'208";a="220535688"
Received: from knl-rvp-beta.sh.intel.com ([10.239.48.66])
 by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2019 22:16:38 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org,
	chao.gao@intel.com
Date: Mon, 30 Sep 2019 05:24:31 +0800
Message-Id: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Xen-devel] [PATCH for Xen 4.13] x86/msi: Don't panic if msix
 capability is missing
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCwgWGVuIGlzbid0IGF3YXJlIG9mIGRldmljZSByZXNldCAoaW5pdGlhdGVkIGJ5IGRv
bTApLiBYZW4gbWF5CmFjY2VzcyB0aGUgZGV2aWNlIHdoaWxlIGRldmljZSBjYW5ub3QgcmVzcG9u
ZCB0byBjb25maWcgcmVxdWVzdHMKbm9ybWFsbHkgKGUuZy4gIGFmdGVyIGRldmljZSByZXNldCwg
ZGV2aWNlIG1heSByZXNwb25kIHRvIGNvbmZpZwpyZXF1ZXN0cyB3aXRoIENSUyBjb21wbGV0aW9u
cyB0byBpbmRpY2F0ZSBpdCBuZWVkcyBtb3JlIHRpbWUgdG8KY29tcGxldGUgYSByZXNldCwgcmVm
ZXIgdG8gcGNpX2Rldl93YWl0KCkgaW4gbGludXgga2VybmVsIGZvciBtb3JlCmRldGFpbCkuIEhl
cmUsIGRvbid0IGFzc3VtZSBtc2l4IGNhcGFiaWxpdHkgaXMgYWx3YXlzIHZpc2libGUgYW5kCnJl
dHVybiAtRUFHQUlOIHRvIHRoZSBjYWxsZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hh
by5nYW9AaW50ZWwuY29tPgotLS0KSSBkaWRuJ3QgZmluZCBhIHdheSB0byB0cmlnZ2VyIHRoZSBh
c3NlcnRpb24gaW4gbm9ybWFsIHVzYWdlcy4KSXQgaXMgZm91bmQgYnkgYW4gaW50ZXJuYWwgdGVz
dDogZWNobyAxIHRvIC9zeXMvYnVzL3BjaS88c2JkZj4vcmVzZXQKd2hlbiB0aGUgZGV2aWNlIGlz
IGJlaW5nIHVzZWQgYnkgYSBndWVzdC4gQWx0aG91Z2ggdGhlIHRlc3QgaXMgYQpsaXR0bGUgaW5z
YW5lLCBpdCBpcyBiZXR0ZXIgdG8gYXZvaWQgY3Jhc2hpbmcgWGVuIGV2ZW4gZm9yIHRoaXMgY2Fz
ZS4KLS0tCiB4ZW4vYXJjaC94ODYvbXNpLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21zaS5jIGIveGVuL2FyY2gveDg2L21zaS5jCmluZGV4IDc2ZDQwMzQuLmUyZjNjNmMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tc2kuYworKysgYi94ZW4vYXJjaC94ODYvbXNpLmMKQEAgLTEy
NjUsNyArMTI2NSwxMyBAQCBpbnQgcGNpX21zaV9jb25mX3dyaXRlX2ludGVyY2VwdChzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywKICAgICAgICAgcG9zID0gZW50cnkgPyBl
bnRyeS0+bXNpX2F0dHJpYi5wb3MKICAgICAgICAgICAgICAgICAgICAgOiBwY2lfZmluZF9jYXBf
b2Zmc2V0KHNlZywgYnVzLCBzbG90LCBmdW5jLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUENJX0NBUF9JRF9NU0lYKTsKLSAgICAgICAgQVNTRVJUKHBvcyk7Cisg
ICAgICAgIGlmICggdW5saWtlbHkoIXBvcykgKQorICAgICAgICB7CisgICAgICAgICAgICBwcmlu
dGtfb25jZShYRU5MT0dfV0FSTklORworICAgICAgICAgICAgICAgICAgICAgICAgIiUwNHg6JTAy
eDolMDJ4LiV1IE1TSS1YIGNhcGFiaWxpdHkgaXMgbWlzc2luZ1xuIiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgIHNlZywgYnVzLCBzbG90LCBmdW5jKTsKKyAgICAgICAgICAgIHJldHVybiAtRUFH
QUlOOworICAgICAgICB9CiAKICAgICAgICAgaWYgKCByZWcgPj0gcG9zICYmIHJlZyA8IG1zaXhf
cGJhX29mZnNldF9yZWcocG9zKSArIDQgKQogICAgICAgICB7Ci0tIAoxLjguMy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
