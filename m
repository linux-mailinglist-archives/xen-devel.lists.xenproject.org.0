Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594067D949
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:21:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8Al-0001hW-QK; Thu, 01 Aug 2019 10:18:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8Ak-0001h3-7v
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:18:58 +0000
X-Inumbo-ID: c51c9332-b445-11e9-8980-bc764e045a96
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c51c9332-b445-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 10:18:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207884"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:18:54 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:39 +0800
Message-Id: <1564654971-31328-5-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 04/16] microcode/amd: fix memory leak
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHdvIGJ1ZmZlcnMsICctPmVxdWl2X2NwdV90YWJsZScgYW5kICctPm1wYicsICBpbnNpZGUgJ21j
X2FtZCcgbWlnaHQgYmUKYWxsb2NhdGVkIGFuZCBpbiB0aGUgZXJyb3ItaGFuZGluZyBwYXRoIHRo
ZXkgYXJlIG5vdCBmcmVlZCBwcm9wZXJseS4KClNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFv
Lmdhb0BpbnRlbC5jb20+Ci0tLQpjaGFuZ2VzIGluIHY4OgogLSBuZXcKIC0gaXQgaXMgZm91bmQg
YnkgcmVhZGluZyBjb2RlLiBObyB0ZXN0IGlzIGRvbmUuCi0tLQogeGVuL2FyY2gveDg2L21pY3Jv
Y29kZV9hbWQuYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9j
b2RlX2FtZC5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYwppbmRleCA3YTg1NGMwLi5h
ZmNhNTFmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKQEAgLTQzMyw2ICs0MzMsOSBAQCBzdGF0aWMgaW50
IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1LCBjb25zdCB2b2lkICpidWYs
CiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAorICAgIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxl
X3NpemUgPSAwOworICAgIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlID0gTlVMTDsKKwogICAgIC8q
CiAgICAgICogTXVsdGlwbGUgY29udGFpbmVyIGZpbGUgc3VwcG9ydDoKICAgICAgKiAxLiBjaGVj
ayBpZiB0aGlzIGNvbnRhaW5lciBmaWxlIGhhcyBlcXVpdl9jcHVfaWQgbWF0Y2gKQEAgLTQ3OSw2
ICs0ODIsOCBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQg
Y3B1LCBjb25zdCB2b2lkICpidWYsCiAKICAgICBpZiAoIGVycm9yICkKICAgICB7CisgICAgICAg
IGlmICggbWNfYW1kLT5lcXVpdl9jcHVfdGFibGVfc2l6ZSApCisgICAgICAgICAgICB4ZnJlZSht
Y19hbWQtPmVxdWl2X2NwdV90YWJsZSk7CiAgICAgICAgIHhmcmVlKG1jX2FtZCk7CiAgICAgICAg
IGdvdG8gb3V0OwogICAgIH0KQEAgLTU0OSwxMSArNTU0LDE0IEBAIHN0YXRpYyBpbnQgY3B1X3Jl
cXVlc3RfbWljcm9jb2RlKHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKmJ1ZiwKIAogICAg
IGlmICggc2F2ZV9lcnJvciApCiAgICAgewotICAgICAgICB4ZnJlZShtY19hbWQpOwogICAgICAg
ICB1Y2ktPm1jLm1jX2FtZCA9IG1jX29sZDsKKyAgICAgICAgbWNfb2xkID0gbWNfYW1kOwogICAg
IH0KLSAgICBlbHNlCi0gICAgICAgIHhmcmVlKG1jX29sZCk7CisKKyAgICBpZiAoIG1jX29sZC0+
bXBiX3NpemUgKQorICAgICAgICB4ZnJlZShtY19vbGQtPm1wYik7CisgICAgeGZyZWUobWNfb2xk
LT5lcXVpdl9jcHVfdGFibGUpOworICAgIHhmcmVlKG1jX29sZCk7CiAKICAgb3V0OgogI2lmIENP
TkZJR19IVk0KLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
