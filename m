Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6F12EB28
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 22:17:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in7nY-0001DP-Aa; Thu, 02 Jan 2020 21:14:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XNPw=2X=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1in7nW-0001Cl-Nn
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 21:14:26 +0000
X-Inumbo-ID: d11c6dfa-2da4-11ea-b6f1-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d11c6dfa-2da4-11ea-b6f1-bc764e2007e4;
 Thu, 02 Jan 2020 21:14:09 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d5so35583769qto.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=bK4p0uPVg9F/zZFyAk0NT01Djfe92ua8x9zSOEpgX0c=;
 b=XMSSOxhTUK43GOVMljv5Cr5RwtQATimoiWSKuX7QZwiSG8p+nVz0KElLQ3KYQppki3
 0nADKJW7oyFzaH1xdSee260L/7vjgMZdEHP2KYpS7xKLygmPvS8VddrKfiLWXq0XQ1tP
 mTMSHtbTPyMWMaifPK5FVD6QfHcv0NRPdCdtM5ui6/cDUzO06+YMIzcHoowYKWU1aFgg
 wkQawwqKyctGRtTYSl7BQk4ajl6X6Q5HvRqqFG+B7KtWTo7blSz7k8hIsDBLPlkkOCga
 LAh4lkeONzIjNUh1xzjZu+zRc9CbIjC0AgHidY3wCZKO3lbJyAT7kdCN5KazAfL2M+Fx
 8tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=bK4p0uPVg9F/zZFyAk0NT01Djfe92ua8x9zSOEpgX0c=;
 b=moNiZQ+IlOOl4smNMohBws4eNNaTHUPrygCMDQNwM0Z2kmNIAmhYTrPZd42eip3jhb
 WuK48gWJKQeEwX0E1ov73umkfD4Xug39CUvhETFM0jIZnqTJU9cMvmnaEmPmlP9jm1hb
 Ncnf/QUnLVLdmx3KUjEoGc7QpXDOuX8xdESfwiwUs9dU+QoSJLVpowtk2kO1pSyLSGCN
 8g3ax3xv3WrDhCV1/ceYjQAmtMYHCSeW0QnXKveBrqpp+/Svmv3LDhYz1vH02yJdLnPq
 BfDJQz4X8BK5Wq6Pot9OEIJkY6ZRXwliSPTQOFqZl/luaPW/S8CjAd7mNE5CtEh0Pvu3
 ISOg==
X-Gm-Message-State: APjAAAWiNvzF/jgdxucqWG8av3D4VXkCi5HVAVX6Oe4vNsme2RYM7jZg
 jnopiODYW7bbbCKuTIPDZfgClw==
X-Google-Smtp-Source: APXvYqzDcF3N2y5hK5g2wp8jkF8WiIMA7CVV2LBb1kzom8ECtZ3Q8uEzKO01/KlbgewDQgLy3pJe1g==
X-Received: by 2002:ac8:7b4f:: with SMTP id m15mr62174264qtu.48.1577999649205; 
 Thu, 02 Jan 2020 13:14:09 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id f97sm17384185qtb.18.2020.01.02.13.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 13:14:08 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org, maz@kernel.org,
 james.morse@arm.com, vladimir.murzin@arm.com, mark.rutland@arm.com,
 tglx@linutronix.de, gregkh@linuxfoundation.org, allison@lohutok.net,
 info@metux.net, alexios.zavras@intel.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, stefan@agner.ch,
 yamada.masahiro@socionext.com, xen-devel@lists.xenproject.org,
 linux@armlinux.org.uk, andrew.cooper3@citrix.com, julien@xen.org
Date: Thu,  2 Jan 2020 16:13:56 -0500
Message-Id: <20200102211357.8042-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102211357.8042-1-pasha.tatashin@soleen.com>
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
Subject: [Xen-devel] [PATCH v5 5/6] arm64: move ARM64_HAS_CACHE_DIC/_IDC
 from asm to C
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFzc21ibHkgZnVuY3Rpb25zIF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFuZ2UgYW5kCl9f
YXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlIGhhdmUgYWx0ZXJuYXRpdmVzOgoKYWx0ZXJuYXRp
dmVfaWYgQVJNNjRfSEFTX0NBQ0hFX0RJQwouLi4KCmFsdGVybmF0aXZlX2lmIEFSTTY0X0hBU19D
QUNIRV9JREMKLi4uCgpCdXQsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aG9zZSBhbHRlcm5hdGl2
ZXMgaXMgdHJpdmlhbCBhbmQgdGhlcmVmb3JlCmNhbiBiZSBkb25lIGluIHRoZSBDIGlubGluZSB3
cmFwcGVycy4KClNpZ25lZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBz
b2xlZW4uY29tPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMTkg
KysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm02NC9tbS9jYWNoZS5TICAgICAgICAgICAgICAg
fCAyNyArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtNjQvbW0vZmx1c2guYyAg
ICAgICAgICAgICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IDA0N2Fm
MzM4YmExNS4uZmM1MjE3YTE4Mzk4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2guaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApA
QCAtNzcsOCArNzcsMjIgQEAgc3RhdGljIGlubGluZSBsb25nIF9fZmx1c2hfY2FjaGVfdXNlcl9y
YW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAogewogCWludCByZXQ7CiAKKwlpZiAoY3B1c19oYXZl
X2NvbnN0X2NhcChBUk02NF9IQVNfQ0FDSEVfSURDKSkgeworCQlkc2IoaXNoc3QpOworCQlpZiAo
Y3B1c19oYXZlX2NvbnN0X2NhcChBUk02NF9IQVNfQ0FDSEVfRElDKSkgeworCQkJaXNiKCk7CisJ
CQlyZXR1cm4gMDsKKwkJfQorCX0KKwogCXVhY2Nlc3NfdHRicjBfZW5hYmxlKCk7CiAJcmV0ID0g
X19hc21fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZShzdGFydCwgZW5kKTsKKworCWlmIChjcHVzX2hh
dmVfY29uc3RfY2FwKEFSTTY0X0hBU19DQUNIRV9ESUMpKQorCQlpc2IoKTsKKwllbHNlCisJCV9f
YXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpOworCiAJdWFjY2Vzc190dGJy
MF9kaXNhYmxlKCk7CiAKIAlyZXR1cm4gcmV0OwpAQCAtOTQsNiArMTA4LDExIEBAIHN0YXRpYyBp
bmxpbmUgaW50IGludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCiB7
CiAJaW50IHJldDsKIAorCWlmIChjcHVzX2hhdmVfY29uc3RfY2FwKEFSTTY0X0hBU19DQUNIRV9E
SUMpKSB7CisJCWlzYigpOworCQlyZXR1cm4gMDsKKwl9CisKIAl1YWNjZXNzX3R0YnIwX2VuYWJs
ZSgpOwogCXJldCA9IF9fYXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpOwog
CXVhY2Nlc3NfdHRicjBfZGlzYWJsZSgpOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9jYWNo
ZS5TIGIvYXJjaC9hcm02NC9tbS9jYWNoZS5TCmluZGV4IDE5ODFjYmFmNWQ5Mi4uMDA5M2JiOWZj
ZDEyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2NhY2hlLlMKKysrIGIvYXJjaC9hcm02NC9t
bS9jYWNoZS5TCkBAIC0yNSwzMCArMjUsMTggQEAKICAqCS0gZW5kICAgICAtIHZpcnR1YWwgZW5k
IGFkZHJlc3Mgb2YgcmVnaW9uCiAgKi8KIEVOVFJZKF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFu
Z2UpCi1hbHRlcm5hdGl2ZV9pZiBBUk02NF9IQVNfQ0FDSEVfSURDCi0JZHNiCWlzaHN0Ci0JYgk3
ZgotYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYKIAlkY2FjaGVfbGluZV9zaXplIHgyLCB4Mwog
CXN1Ygl4MywgeDIsICMxCiAJYmljCXg0LCB4MCwgeDMKLTE6Ci11c2VyX2FsdCA5ZiwgImRjIGN2
YXUsIHg0IiwgICJkYyBjaXZhYywgeDQiLCAgQVJNNjRfV09SS0FST1VORF9DTEVBTl9DQUNIRQor
MToJdXNlcl9hbHQgM2YsICJkYyBjdmF1LCB4NCIsICAiZGMgY2l2YWMsIHg0IiwgIEFSTTY0X1dP
UktBUk9VTkRfQ0xFQU5fQ0FDSEUKIAlhZGQJeDQsIHg0LCB4MgogCWNtcAl4NCwgeDEKIAliLmxv
CTFiCiAJZHNiCWlzaAotCi03OgotYWx0ZXJuYXRpdmVfaWYgQVJNNjRfSEFTX0NBQ0hFX0RJQwot
CWlzYgotCWIJOGYKLWFsdGVybmF0aXZlX2Vsc2Vfbm9wX2VuZGlmCi0JaW52YWxpZGF0ZV9pY2Fj
aGVfYnlfbGluZSB4MCwgeDEsIHgyLCB4MywgOWYKLTg6CW1vdgl4MCwgIzAKLTE6CXJldAotOToJ
bW92CXgwLCAjLUVGQVVMVAotCWIJMWIKKwltb3YJeDAsICMwCisyOglyZXQKKzM6CW1vdgl4MCwg
Iy1FRkFVTFQKKwliCTJiCiBFTkRQUk9DKF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFuZ2UpCiAK
IC8qCkBAIC02MCwxMSArNDgsNiBAQCBFTkRQUk9DKF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFu
Z2UpCiAgKgktIGVuZCAgICAgLSB2aXJ0dWFsIGVuZCBhZGRyZXNzIG9mIHJlZ2lvbgogICovCiBF
TlRSWShfX2FzbV9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSkKLWFsdGVybmF0aXZlX2lmIEFSTTY0
X0hBU19DQUNIRV9ESUMKLQltb3YJeDAsIHh6cgotCWlzYgotCXJldAotYWx0ZXJuYXRpdmVfZWxz
ZV9ub3BfZW5kaWYKIAlpbnZhbGlkYXRlX2ljYWNoZV9ieV9saW5lIHgwLCB4MSwgeDIsIHgzLCAy
ZgogCW1vdgl4MCwgeHpyCiAxOglyZXQKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vZmx1c2gu
YyBiL2FyY2gvYXJtNjQvbW0vZmx1c2guYwppbmRleCA2MTUyMTI4NWYyN2QuLmFkZmRhY2IxNjNh
ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9tbS9mbHVzaC5jCisrKyBiL2FyY2gvYXJtNjQvbW0v
Zmx1c2guYwpAQCAtNzYsNiArNzYsNyBAQCBFWFBPUlRfU1lNQk9MKGZsdXNoX2RjYWNoZV9wYWdl
KTsKICAqIEFkZGl0aW9uYWwgZnVuY3Rpb25zIGRlZmluZWQgaW4gYXNzZW1ibHkuCiAgKi8KIEVY
UE9SVF9TWU1CT0woX19hc21fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZSk7CitFWFBPUlRfU1lNQk9M
KF9fYXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKTsKIAogI2lmZGVmIENPTkZJR19BUkNIX0hB
U19QTUVNX0FQSQogdm9pZCBhcmNoX3diX2NhY2hlX3BtZW0odm9pZCAqYWRkciwgc2l6ZV90IHNp
emUpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
