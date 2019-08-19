Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558AA91AAD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 03:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzWMX-00013j-D4; Mon, 19 Aug 2019 01:21:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JIwN=WP=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hzWMW-00013W-4K
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 01:21:32 +0000
X-Inumbo-ID: ad189712-c21f-11e9-8be3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad189712-c21f-11e9-8be3-12813bfff9fa;
 Mon, 19 Aug 2019 01:21:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 18:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="261683837"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2019 18:21:29 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 09:25:15 +0800
Message-Id: <1566177928-19114-3-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v9 02/15] microcode/amd: fix memory leak
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
Lmdhb0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQpDaGFuZ2VzIGluIHY5OgogLSB1c2UgeHphbGxvYygpIHRvIGdldCByaWQgb2YgZXhw
bGljaXRseSBpbml0aWFsaXppbmcgc29tZSBmaWVsZHMKIHRvIE5VTEwvMC4KCmNoYW5nZXMgaW4g
djg6CiAtIG5ldwogLSBpdCBpcyBmb3VuZCBieSByZWFkaW5nIGNvZGUuIE5vIHRlc3QgaXMgZG9u
ZS4KLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jIHwgMTMgKysrKysrKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jIGIveGVuL2FyY2gveDg2L21pY3JvY29k
ZV9hbWQuYwppbmRleCA3YTg1NGMwLi4zMDY5Nzg0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKQEAgLTQy
NSw3ICs0MjUsNyBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBp
bnQgY3B1LCBjb25zdCB2b2lkICpidWYsCiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAg
IG1jX2FtZCA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29kZV9hbWQpOworICAgIG1jX2FtZCA9IHh6
YWxsb2Moc3RydWN0IG1pY3JvY29kZV9hbWQpOwogICAgIGlmICggIW1jX2FtZCApCiAgICAgewog
ICAgICAgICBwcmludGsoS0VSTl9FUlIgIm1pY3JvY29kZTogQ2Fubm90IGFsbG9jYXRlIG1lbW9y
eSBmb3IgbWljcm9jb2RlIHBhdGNoXG4iKTsKQEAgLTQ3OSw2ICs0NzksNyBAQCBzdGF0aWMgaW50
IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1LCBjb25zdCB2b2lkICpidWYs
CiAKICAgICBpZiAoIGVycm9yICkKICAgICB7CisgICAgICAgIHhmcmVlKG1jX2FtZC0+ZXF1aXZf
Y3B1X3RhYmxlKTsKICAgICAgICAgeGZyZWUobWNfYW1kKTsKICAgICAgICAgZ290byBvdXQ7CiAg
ICAgfQpAQCAtNDkxLDggKzQ5Miw2IEBAIHN0YXRpYyBpbnQgY3B1X3JlcXVlc3RfbWljcm9jb2Rl
KHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKmJ1ZiwKICAgICAgKiBJdCdzIHBvc3NpYmxl
IHRoZSBkYXRhIGZpbGUgaGFzIG11bHRpcGxlIG1hdGNoaW5nIHVjb2RlLAogICAgICAqIGxldHMg
a2VlcCBzZWFyY2hpbmcgdGlsbCB0aGUgbGF0ZXN0IHZlcnNpb24KICAgICAgKi8KLSAgICBtY19h
bWQtPm1wYiA9IE5VTEw7Ci0gICAgbWNfYW1kLT5tcGJfc2l6ZSA9IDA7CiAgICAgbGFzdF9vZmZz
ZXQgPSBvZmZzZXQ7CiAgICAgd2hpbGUgKCAoZXJyb3IgPSBnZXRfdWNvZGVfZnJvbV9idWZmZXJf
YW1kKG1jX2FtZCwgYnVmLCBidWZzaXplLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmb2Zmc2V0KSkgPT0gMCApCkBAIC01NDksMTEgKzU0OCwxMyBAQCBz
dGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1LCBjb25zdCB2
b2lkICpidWYsCiAKICAgICBpZiAoIHNhdmVfZXJyb3IgKQogICAgIHsKLSAgICAgICAgeGZyZWUo
bWNfYW1kKTsKICAgICAgICAgdWNpLT5tYy5tY19hbWQgPSBtY19vbGQ7CisgICAgICAgIG1jX29s
ZCA9IG1jX2FtZDsKICAgICB9Ci0gICAgZWxzZQotICAgICAgICB4ZnJlZShtY19vbGQpOworCisg
ICAgeGZyZWUobWNfb2xkLT5tcGIpOworICAgIHhmcmVlKG1jX29sZC0+ZXF1aXZfY3B1X3RhYmxl
KTsKKyAgICB4ZnJlZShtY19vbGQpOwogCiAgIG91dDoKICNpZiBDT05GSUdfSFZNCi0tIAoxLjgu
My4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
