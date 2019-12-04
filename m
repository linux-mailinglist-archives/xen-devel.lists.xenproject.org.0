Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C2411381C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 00:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icdxa-0001BW-IO; Wed, 04 Dec 2019 23:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icdxZ-0001B3-C2
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 23:21:29 +0000
X-Inumbo-ID: c1a07d22-16ec-11ea-aea8-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1a07d22-16ec-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 23:21:10 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id x1so1625405qkl.12
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 15:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jgWMYHD023tAXPY9yBvY7HlxUi3NtG7yB+YFJsFM+4s=;
 b=GnME/3GQIkWEOnq+HnWtjzDW7KOeACVPsdHQBWSmyQiiOW1JrEqbNdO1yXHOHEGGLa
 uiDQATmlJ+LFhPgQXv8Zf0F4NJElVwhSGKvmCcAUMQv+wEkB+XJDpMyg6iSNtxNh7VMy
 4YRsLqt/0+myzBWoF8xlK6sHJAEmEPWcOsskDtof8qDxEGxli6obH0/ql8HXvOYyNOx0
 E4CqVF/g/r8Y9BXPjdTCfVR8SCXfFoQnrtKWfB6fqzn7mEoF7LZSIahhhG8TlbwvWdi0
 eV1TWGsF+FoGohnl0fwH163lctm1VQfxvAxKHjBKsqfJP8bqMssseBKgpDoDEsAqYzvT
 ACgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgWMYHD023tAXPY9yBvY7HlxUi3NtG7yB+YFJsFM+4s=;
 b=OyIfgJYauUL2HigduwTsnkA7ATKr/Ta+CcZSp/L481yu/w2doFEviF+zzzzgUCiVWg
 hqWM9M6PEqtXYAVaBpoxIyuSqy1/Xkh5pmmv3cv7IGOQissOZqhMMqUdIHWmBGZXyc5I
 IZodEJ7H4UAgLCI4WwjuAQPxua+MrEs9tsBI1GUz+7YwLd0Cd7dCSs648rJQCzjaBb8z
 j6LnWLo3b4+IPmFXrCaWqmjsnhIu3aeP2NXf/stTHhCJB2M9F6M6HWTmjG5Bh7uLJ4mC
 XIxyIplgp2KBN5lwtWoE2Vsj7QDyGpr9rsSQdXz1tUPj4ZgzyAph9E7o3WhbxOEl2J0X
 Slmw==
X-Gm-Message-State: APjAAAVMrE5UR+QgTWpvEQvpj3agGk58MshIk5YPeV8s2bqMTEyLMdoc
 ztBc529Xpd6v3XjklxUvCU6SvA==
X-Google-Smtp-Source: APXvYqxYW3lHiAaEktvIv9R2Rs4Q7wh7u41fkOvqH028QUBhjHchCrv3OL1EskvJ6xR8p1wI4qmnmw==
X-Received: by 2002:a05:620a:102e:: with SMTP id
 a14mr5398925qkk.159.1575501670158; 
 Wed, 04 Dec 2019 15:21:10 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t38sm4667864qta.78.2019.12.04.15.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:21:09 -0800 (PST)
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
Date: Wed,  4 Dec 2019 18:20:57 -0500
Message-Id: <20191204232058.2500117-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 5/6] arm64: move ARM64_HAS_CACHE_DIC/_IDC
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
Zmx1c2guaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IGVhNTYz
MzQ0YjRhZC4uNGViMjQ0ZWU3MTU0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2guaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApA
QCAtNzUsOCArNzUsMjIgQEAgZXh0ZXJuIHZvaWQgc3luY19pY2FjaGVfYWxpYXNlcyh2b2lkICpr
YWRkciwgdW5zaWduZWQgbG9uZyBsZW4pOwogc3RhdGljIGlubGluZSB2b2lkIF9fZmx1c2hfY2Fj
aGVfdXNlcl9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAogCQkJCQkgICAgdW5zaWduZWQgbG9u
ZyBlbmQpCiB7CisJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJNNjRfSEFTX0NBQ0hFX0lEQykp
IHsKKwkJZHNiKGlzaHN0KTsKKwkJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJNNjRfSEFTX0NB
Q0hFX0RJQykpIHsKKwkJCWlzYigpOworCQkJcmV0dXJuOworCQl9CisJfQorCiAJdWFjY2Vzc190
dGJyMF9lbmFibGUoKTsKIAlfX2FzbV9mbHVzaF9jYWNoZV91c2VyX3JhbmdlKHN0YXJ0LCBlbmQp
OworCisJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJNNjRfSEFTX0NBQ0hFX0RJQykpCisJCWlz
YigpOworCWVsc2UKKwkJX19hc21faW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGVuZCk7
CisKIAl1YWNjZXNzX3R0YnIwX2Rpc2FibGUoKTsKIH0KIApAQCAtOTAsNiArMTA0LDExIEBAIHN0
YXRpYyBpbmxpbmUgaW50IGludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsCiB7CiAJaW50IHJldDsKIAorCWlmIChjcHVzX2hhdmVfY29uc3RfY2FwKEFSTTY0X0hBU19D
QUNIRV9ESUMpKSB7CisJCWlzYigpOworCQlyZXR1cm4gMDsKKwl9CisKIAl1YWNjZXNzX3R0YnIw
X2VuYWJsZSgpOwogCXJldCA9IF9fYXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBl
bmQpOwogCXVhY2Nlc3NfdHRicjBfZGlzYWJsZSgpOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9t
bS9jYWNoZS5TIGIvYXJjaC9hcm02NC9tbS9jYWNoZS5TCmluZGV4IDE5ODFjYmFmNWQ5Mi4uMDA5
M2JiOWZjZDEyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2NhY2hlLlMKKysrIGIvYXJjaC9h
cm02NC9tbS9jYWNoZS5TCkBAIC0yNSwzMCArMjUsMTggQEAKICAqCS0gZW5kICAgICAtIHZpcnR1
YWwgZW5kIGFkZHJlc3Mgb2YgcmVnaW9uCiAgKi8KIEVOVFJZKF9fYXNtX2ZsdXNoX2NhY2hlX3Vz
ZXJfcmFuZ2UpCi1hbHRlcm5hdGl2ZV9pZiBBUk02NF9IQVNfQ0FDSEVfSURDCi0JZHNiCWlzaHN0
Ci0JYgk3ZgotYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYKIAlkY2FjaGVfbGluZV9zaXplIHgy
LCB4MwogCXN1Ygl4MywgeDIsICMxCiAJYmljCXg0LCB4MCwgeDMKLTE6Ci11c2VyX2FsdCA5Ziwg
ImRjIGN2YXUsIHg0IiwgICJkYyBjaXZhYywgeDQiLCAgQVJNNjRfV09SS0FST1VORF9DTEVBTl9D
QUNIRQorMToJdXNlcl9hbHQgM2YsICJkYyBjdmF1LCB4NCIsICAiZGMgY2l2YWMsIHg0IiwgIEFS
TTY0X1dPUktBUk9VTkRfQ0xFQU5fQ0FDSEUKIAlhZGQJeDQsIHg0LCB4MgogCWNtcAl4NCwgeDEK
IAliLmxvCTFiCiAJZHNiCWlzaAotCi03OgotYWx0ZXJuYXRpdmVfaWYgQVJNNjRfSEFTX0NBQ0hF
X0RJQwotCWlzYgotCWIJOGYKLWFsdGVybmF0aXZlX2Vsc2Vfbm9wX2VuZGlmCi0JaW52YWxpZGF0
ZV9pY2FjaGVfYnlfbGluZSB4MCwgeDEsIHgyLCB4MywgOWYKLTg6CW1vdgl4MCwgIzAKLTE6CXJl
dAotOToJbW92CXgwLCAjLUVGQVVMVAotCWIJMWIKKwltb3YJeDAsICMwCisyOglyZXQKKzM6CW1v
dgl4MCwgIy1FRkFVTFQKKwliCTJiCiBFTkRQUk9DKF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFu
Z2UpCiAKIC8qCkBAIC02MCwxMSArNDgsNiBAQCBFTkRQUk9DKF9fYXNtX2ZsdXNoX2NhY2hlX3Vz
ZXJfcmFuZ2UpCiAgKgktIGVuZCAgICAgLSB2aXJ0dWFsIGVuZCBhZGRyZXNzIG9mIHJlZ2lvbgog
ICovCiBFTlRSWShfX2FzbV9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSkKLWFsdGVybmF0aXZlX2lm
IEFSTTY0X0hBU19DQUNIRV9ESUMKLQltb3YJeDAsIHh6cgotCWlzYgotCXJldAotYWx0ZXJuYXRp
dmVfZWxzZV9ub3BfZW5kaWYKIAlpbnZhbGlkYXRlX2ljYWNoZV9ieV9saW5lIHgwLCB4MSwgeDIs
IHgzLCAyZgogCW1vdgl4MCwgeHpyCiAxOglyZXQKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0v
Zmx1c2guYyBiL2FyY2gvYXJtNjQvbW0vZmx1c2guYwppbmRleCA2MTUyMTI4NWYyN2QuLmFkZmRh
Y2IxNjNhZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9tbS9mbHVzaC5jCisrKyBiL2FyY2gvYXJt
NjQvbW0vZmx1c2guYwpAQCAtNzYsNiArNzYsNyBAQCBFWFBPUlRfU1lNQk9MKGZsdXNoX2RjYWNo
ZV9wYWdlKTsKICAqIEFkZGl0aW9uYWwgZnVuY3Rpb25zIGRlZmluZWQgaW4gYXNzZW1ibHkuCiAg
Ki8KIEVYUE9SVF9TWU1CT0woX19hc21fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZSk7CitFWFBPUlRf
U1lNQk9MKF9fYXNtX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKTsKIAogI2lmZGVmIENPTkZJR19B
UkNIX0hBU19QTUVNX0FQSQogdm9pZCBhcmNoX3diX2NhY2hlX3BtZW0odm9pZCAqYWRkciwgc2l6
ZV90IHNpemUpCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
