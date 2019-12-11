Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E042611A712
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 10:29:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieyGg-0005Rd-FS; Wed, 11 Dec 2019 09:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieyGe-0005RY-S0
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 09:26:48 +0000
X-Inumbo-ID: 5a304e9a-1bf8-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a304e9a-1bf8-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 09:26:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27A94AE4B;
 Wed, 11 Dec 2019 09:26:46 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83dd739a-8170-e135-51c4-c9716f47d3d6@suse.com>
Date: Wed, 11 Dec 2019 10:27:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86emul: correct segment override decode for
 64-bit mode
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

VGhlIGxlZ2FjeSAvIGNvbXBhdGliaWxpdHkgbW9kZSBFUywgQ1MsIFNTLCBhbmQgRFMgb3ZlcnJp
ZGVzIGFyZSBudWxsCnByZWZpeGVzIGluIDY0LWJpdCBtb2RlLCBpLmUuIHRoZXkgaW4gcGFydGlj
dWxhciBkb24ndCBjYW5jZWwgYW4KZWFybGllciBGUyBvciBHUyBvbmUuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2
X2VtdWxhdGUuYwpAQCAtMjgzMCwxNCArMjgzMCwxNyBAQCB4ODZfZGVjb2RlKAogICAgICAgICBj
YXNlIDB4Njc6IC8qIGFkZHJlc3Mtc2l6ZSBvdmVycmlkZSAqLwogICAgICAgICAgICAgYWRfYnl0
ZXMgPSBkZWZfYWRfYnl0ZXMgXiAobW9kZV82NGJpdCgpID8gMTIgOiA2KTsKICAgICAgICAgICAg
IGJyZWFrOwotICAgICAgICBjYXNlIDB4MmU6IC8qIENTIG92ZXJyaWRlICovCi0gICAgICAgICAg
ICBvdmVycmlkZV9zZWcgPSB4ODZfc2VnX2NzOworICAgICAgICBjYXNlIDB4MmU6IC8qIENTIG92
ZXJyaWRlIC8gbnVsbCBwcmVmaXggaW4gNjQtYml0IG1vZGUgKi8KKyAgICAgICAgICAgIGlmICgg
IW1vZGVfNjRiaXQoKSApCisgICAgICAgICAgICAgICAgb3ZlcnJpZGVfc2VnID0geDg2X3NlZ19j
czsKICAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBjYXNlIDB4M2U6IC8qIERTIG92ZXJyaWRl
ICovCi0gICAgICAgICAgICBvdmVycmlkZV9zZWcgPSB4ODZfc2VnX2RzOworICAgICAgICBjYXNl
IDB4M2U6IC8qIERTIG92ZXJyaWRlIC8gbnVsbCBwcmVmaXggaW4gNjQtYml0IG1vZGUgKi8KKyAg
ICAgICAgICAgIGlmICggIW1vZGVfNjRiaXQoKSApCisgICAgICAgICAgICAgICAgb3ZlcnJpZGVf
c2VnID0geDg2X3NlZ19kczsKICAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBjYXNlIDB4MjY6
IC8qIEVTIG92ZXJyaWRlICovCi0gICAgICAgICAgICBvdmVycmlkZV9zZWcgPSB4ODZfc2VnX2Vz
OworICAgICAgICBjYXNlIDB4MjY6IC8qIEVTIG92ZXJyaWRlIC8gbnVsbCBwcmVmaXggaW4gNjQt
Yml0IG1vZGUgKi8KKyAgICAgICAgICAgIGlmICggIW1vZGVfNjRiaXQoKSApCisgICAgICAgICAg
ICAgICAgb3ZlcnJpZGVfc2VnID0geDg2X3NlZ19lczsKICAgICAgICAgICAgIGJyZWFrOwogICAg
ICAgICBjYXNlIDB4NjQ6IC8qIEZTIG92ZXJyaWRlICovCiAgICAgICAgICAgICBvdmVycmlkZV9z
ZWcgPSB4ODZfc2VnX2ZzOwpAQCAtMjg0NSw4ICsyODQ4LDkgQEAgeDg2X2RlY29kZSgKICAgICAg
ICAgY2FzZSAweDY1OiAvKiBHUyBvdmVycmlkZSAqLwogICAgICAgICAgICAgb3ZlcnJpZGVfc2Vn
ID0geDg2X3NlZ19nczsKICAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBjYXNlIDB4MzY6IC8q
IFNTIG92ZXJyaWRlICovCi0gICAgICAgICAgICBvdmVycmlkZV9zZWcgPSB4ODZfc2VnX3NzOwor
ICAgICAgICBjYXNlIDB4MzY6IC8qIFNTIG92ZXJyaWRlIC8gbnVsbCBwcmVmaXggaW4gNjQtYml0
IG1vZGUgKi8KKyAgICAgICAgICAgIGlmICggIW1vZGVfNjRiaXQoKSApCisgICAgICAgICAgICAg
ICAgb3ZlcnJpZGVfc2VnID0geDg2X3NlZ19zczsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAg
ICBjYXNlIDB4ZjA6IC8qIExPQ0sgKi8KICAgICAgICAgICAgIGxvY2tfcHJlZml4ID0gMTsKQEAg
LTI4NzEsMTAgKzI4NzUsNiBAQCB4ODZfZGVjb2RlKAogICAgIH0KICBkb25lX3ByZWZpeGVzOgog
Ci0gICAgLyogJXtlLGMscyxkfXMgb3ZlcnJpZGVzIGFyZSBpZ25vcmVkIGluIDY0Yml0IG1vZGUu
ICovCi0gICAgaWYgKCBtb2RlXzY0Yml0KCkgJiYgb3ZlcnJpZGVfc2VnIDwgeDg2X3NlZ19mcyAp
Ci0gICAgICAgIG92ZXJyaWRlX3NlZyA9IHg4Nl9zZWdfbm9uZTsKLQogICAgIGlmICggcmV4X3By
ZWZpeCAmIFJFWF9XICkKICAgICAgICAgb3BfYnl0ZXMgPSA4OwogCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
