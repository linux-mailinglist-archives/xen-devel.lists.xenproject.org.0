Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F80105F91
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:21:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Jv-0006EM-Iw; Fri, 22 Nov 2019 05:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Q5S=ZO=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXycS-0001H1-ER
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 02:24:24 +0000
X-Inumbo-ID: 2cb4dd42-0ccf-11ea-adbe-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cb4dd42-0ccf-11ea-adbe-bc764e2007e4;
 Fri, 22 Nov 2019 02:24:13 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i19so5021128qki.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vc6oPAqmMqVCIczgKwZs+8hK0w4omxkwGTKIqDEJ73U=;
 b=kwnVkpxGQoCtsJNASNIZDVDRzn/vp16uisiSxJCrDZMvkgMG+MsqKetS8v4OgzSilK
 4JvYSVEyU7KrZTJYLt+1IrdKcb1VCPHZQhGChvWCXi8Ukw1Xkjv0RenuU3sCy7l5LbeK
 nxdquDRZNLmOq9URwEGMSpS+E+mDwSF7nrgFHyzxNMWBosn1GMIP0ztA8BRYlCJA/Wgl
 cZ7QPRe0j6941FI0Yi8wSCtbC3KYyf//tsPi5eBL7gUPWkir5axoF1VQX2NXzWTfgmDX
 TOuRq+q5Jp6n3+ZZs4yMyiG4KSPUHgNWiBcCY2ydi7yle4vEaHPGt4M0l6PbpaiY3sMZ
 SkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vc6oPAqmMqVCIczgKwZs+8hK0w4omxkwGTKIqDEJ73U=;
 b=EP0sDPdqdh22ekqwDXYa8vlfCUAjWg/7mPQ6BYQ8tRYlYL8z4+puX70hr8pTaXhvw2
 E6vQrqyU9SSIqZPvzVoz5MFcU9ktYEaQarlkIzKPUj998e9+3VjeTSOVp7/RnWMOqGX/
 PNJU9D7SK7XahnFna2CznbT/kQEXVpLQphAC/+dc0gGcdufhSVL6y1T4txsY+pXgHNJR
 moClIusEhM0xl8AHMn57l8AQ7nhRcI43ASK37waxlkm81mPIzq8S6R9f5sivVpcdqais
 z+qxq+jVnoBc2xow7pk2HslbjluMj+3xi7VVFZVX0xCn8zefjyMHim9rhUgxZbwU2uyP
 XBNA==
X-Gm-Message-State: APjAAAWhC/sCcNLFBzxxjNYjD7/3hoLyPgp7KCMzHev725eT7qRJ1Ufa
 thH/7SsJO3VCD65cO3QOFlg8ZQ==
X-Google-Smtp-Source: APXvYqzJF3qnLMfzHgSwlWYs/UJk7GCvCnhv4oTIwSXg5D3daIPC/puS357rga4cHnfLQ3u54qVatw==
X-Received: by 2002:a05:620a:219b:: with SMTP id
 g27mr2734759qka.137.1574389453243; 
 Thu, 21 Nov 2019 18:24:13 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id z5sm2609801qtm.9.2019.11.21.18.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 18:24:12 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk
Date: Thu, 21 Nov 2019 21:24:06 -0500
Message-Id: <20191122022406.590141-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122022406.590141-1-pasha.tatashin@soleen.com>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: [Xen-devel] [PATCH v2 3/3] arm64: remove the rest of asm-uaccess.h
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

VGhlIF9fdWFjY2Vzc190dGJyMF9kaXNhYmxlIGFuZCBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlLAph
cmUgdGhlIGxhc3QgdHdvIG1hY3JvcyBkZWZpbmVkIGluIGFzbS11YWNjZXNzLmguCgpSZXBsYWNl
IHRoZW0gd2l0aCBDIHdyYXBwZXJzIGFuZCBjYWxsIEMgZnVuY3Rpb25zIGZyb20Ka2VybmVsX2Vu
dHJ5IGFuZCBrZXJuZWxfZXhpdC4KClNpZ25lZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNo
YS50YXRhc2hpbkBzb2xlZW4uY29tPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYXNtLXVh
Y2Nlc3MuaCB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtNjQva2Vy
bmVsL2VudHJ5LlMgICAgICAgICAgICB8ICA2ICsrLS0tCiBhcmNoL2FybTY0L2xpYi9jbGVhcl91
c2VyLlMgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm02NC9saWIvY29weV9mcm9tX3VzZXIuUyAg
ICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvbGliL2NvcHlfaW5fdXNlci5TICAgICAgICB8ICAyICst
CiBhcmNoL2FybTY0L2xpYi9jb3B5X3RvX3VzZXIuUyAgICAgICAgfCAgMiArLQogYXJjaC9hcm02
NC9tbS9jYWNoZS5TICAgICAgICAgICAgICAgIHwgIDEgLQogYXJjaC9hcm02NC9tbS9jb250ZXh0
LmMgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
aW5jbHVkZS9hc20vYXNtLXVhY2Nlc3MuaAoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vYXNtLXVhY2Nlc3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYXNtLXVhY2Nlc3Mu
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOGY3NjNlNWI0MWIxLi4wMDAwMDAwMDAw
MDAKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hc20tdWFjY2Vzcy5oCisrKyAvZGV2L251
bGwKQEAgLTEsMzggKzAsMCBAQAotLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8KLSNpZm5kZWYgX19BU01fQVNNX1VBQ0NFU1NfSAotI2RlZmluZSBfX0FTTV9BU01fVUFDQ0VT
U19ICi0KLSNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KLSNpbmNsdWRlIDxhc20va2VybmVs
LXBndGFibGUuaD4KLSNpbmNsdWRlIDxhc20vbW11Lmg+Ci0jaW5jbHVkZSA8YXNtL3N5c3JlZy5o
PgotI2luY2x1ZGUgPGFzbS9hc3NlbWJsZXIuaD4KLQotLyoKLSAqIFVzZXIgYWNjZXNzIGVuYWJs
aW5nL2Rpc2FibGluZyBtYWNyb3MuCi0gKi8KLSNpZmRlZiBDT05GSUdfQVJNNjRfU1dfVFRCUjBf
UEFOCi0JLm1hY3JvCV9fdWFjY2Vzc190dGJyMF9kaXNhYmxlLCB0bXAxCi0JbXJzCVx0bXAxLCB0
dGJyMV9lbDEJCQkvLyBzd2FwcGVyX3BnX2RpcgotCWJpYwlcdG1wMSwgXHRtcDEsICNUVEJSX0FT
SURfTUFTSwotCXN1YglcdG1wMSwgXHRtcDEsICNSRVNFUlZFRF9UVEJSMF9TSVpFCS8vIHJlc2Vy
dmVkX3R0YnIwIGp1c3QgYmVmb3JlIHN3YXBwZXJfcGdfZGlyCi0JbXNyCXR0YnIwX2VsMSwgXHRt
cDEJCQkvLyBzZXQgcmVzZXJ2ZWQgVFRCUjBfRUwxCi0JaXNiCi0JYWRkCVx0bXAxLCBcdG1wMSwg
I1JFU0VSVkVEX1RUQlIwX1NJWkUKLQltc3IJdHRicjFfZWwxLCBcdG1wMQkJLy8gc2V0IHJlc2Vy
dmVkIEFTSUQKLQlpc2IKLQkuZW5kbQotCi0JLm1hY3JvCV9fdWFjY2Vzc190dGJyMF9lbmFibGUs
IHRtcDEsIHRtcDIKLQlnZXRfY3VycmVudF90YXNrIFx0bXAxCi0JbGRyCVx0bXAxLCBbXHRtcDEs
ICNUU0tfVElfVFRCUjBdCS8vIGxvYWQgc2F2ZWQgVFRCUjBfRUwxCi0JbXJzCVx0bXAyLCB0dGJy
MV9lbDEKLQlleHRyICAgIFx0bXAyLCBcdG1wMiwgXHRtcDEsICM0OAotCXJvciAgICAgXHRtcDIs
IFx0bXAyLCAjMTYKLQltc3IJdHRicjFfZWwxLCBcdG1wMgkJLy8gc2V0IHRoZSBhY3RpdmUgQVNJ
RAotCWlzYgotCW1zcgl0dGJyMF9lbDEsIFx0bXAxCQkvLyBzZXQgdGhlIG5vbi1QQU4gVFRCUjBf
RUwxCi0JaXNiCi0JLmVuZG0KLSNlbmRpZgotI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUwppbmRleCA1ODNmNzFh
YmJlOTguLmM3YjU3MWU2ZDBmMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvZW50cnku
UworKysgYi9hcmNoL2FybTY0L2tlcm5lbC9lbnRyeS5TCkBAIC0yMiw4ICsyMiw4IEBACiAjaW5j
bHVkZSA8YXNtL21tdS5oPgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxh
c20vcHRyYWNlLmg+CisjaW5jbHVkZSA8YXNtL2tlcm5lbC1wZ3RhYmxlLmg+CiAjaW5jbHVkZSA8
YXNtL3RocmVhZF9pbmZvLmg+Ci0jaW5jbHVkZSA8YXNtL2FzbS11YWNjZXNzLmg+CiAjaW5jbHVk
ZSA8YXNtL3VuaXN0ZC5oPgogCiAvKgpAQCAtMjE5LDcgKzIxOSw3IEBAIGFsdGVybmF0aXZlX2Vs
c2Vfbm9wX2VuZGlmCiAJYW5kCXgyMywgeDIzLCAjflBTUl9QQU5fQklUCQkvLyBDbGVhciB0aGUg
ZW11bGF0ZWQgUEFOIGluIHRoZSBzYXZlZCBTUFNSCiAJLmVuZGlmCiAKLQlfX3VhY2Nlc3NfdHRi
cjBfZGlzYWJsZSB4MjEKKwlibCBfX3VhY2Nlc3NfdHRicjBfZGlzYWJsZV9jCiAxOgogI2VuZGlm
CiAKQEAgLTI5Myw3ICsyOTMsNyBAQCBhbHRlcm5hdGl2ZV9lbHNlX25vcF9lbmRpZgogCXRibnoJ
eDIyLCAjMjIsIDFmCQkJLy8gU2tpcCByZS1lbmFibGluZyBUVEJSMCBhY2Nlc3MgaWYgdGhlIFBT
Ul9QQU5fQklUIGlzIHNldAogCS5lbmRpZgogCi0JX191YWNjZXNzX3R0YnIwX2VuYWJsZSB4MCwg
eDEKKwlibAlfX3VhY2Nlc3NfdHRicjBfZW5hYmxlX2MKIAogCS5pZglcZWwgPT0gMAogCS8qCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2xpYi9jbGVhcl91c2VyLlMgYi9hcmNoL2FybTY0L2xpYi9j
bGVhcl91c2VyLlMKaW5kZXggYWVhZmMwM2U5NjFhLi5iMGI0YTg2YTA5ZTIgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvbGliL2NsZWFyX3VzZXIuUworKysgYi9hcmNoL2FybTY0L2xpYi9jbGVhcl91
c2VyLlMKQEAgLTYsNyArNiw3IEBACiAgKi8KICNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+CiAK
LSNpbmNsdWRlIDxhc20vYXNtLXVhY2Nlc3MuaD4KKyNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUu
aD4KICNpbmNsdWRlIDxhc20vYXNzZW1ibGVyLmg+CiAKIAkudGV4dApkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9saWIvY29weV9mcm9tX3VzZXIuUyBiL2FyY2gvYXJtNjQvbGliL2NvcHlfZnJvbV91
c2VyLlMKaW5kZXggZWJiM2MwNmNiYjVkLi4xNDJiYzc1MDU1MTggMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvbGliL2NvcHlfZnJvbV91c2VyLlMKKysrIGIvYXJjaC9hcm02NC9saWIvY29weV9mcm9t
X3VzZXIuUwpAQCAtNSw3ICs1LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2UuaD4KIAot
I2luY2x1ZGUgPGFzbS9hc20tdWFjY2Vzcy5oPgorI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5o
PgogI2luY2x1ZGUgPGFzbS9hc3NlbWJsZXIuaD4KICNpbmNsdWRlIDxhc20vY2FjaGUuaD4KIApk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9saWIvY29weV9pbl91c2VyLlMgYi9hcmNoL2FybTY0L2xp
Yi9jb3B5X2luX3VzZXIuUwppbmRleCAzZDgxNTNhMWViY2UuLjA0ZGM0OGNhMjZmNyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9saWIvY29weV9pbl91c2VyLlMKKysrIGIvYXJjaC9hcm02NC9saWIv
Y29weV9pbl91c2VyLlMKQEAgLTcsNyArNyw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9saW5rYWdl
Lmg+CiAKLSNpbmNsdWRlIDxhc20vYXNtLXVhY2Nlc3MuaD4KKyNpbmNsdWRlIDxhc20vYWx0ZXJu
YXRpdmUuaD4KICNpbmNsdWRlIDxhc20vYXNzZW1ibGVyLmg+CiAjaW5jbHVkZSA8YXNtL2NhY2hl
Lmg+CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbGliL2NvcHlfdG9fdXNlci5TIGIvYXJjaC9h
cm02NC9saWIvY29weV90b191c2VyLlMKaW5kZXggMzU3ZWFlMmMxOGViLi44ZjMyMThhZTg4YWIg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbGliL2NvcHlfdG9fdXNlci5TCisrKyBiL2FyY2gvYXJt
NjQvbGliL2NvcHlfdG9fdXNlci5TCkBAIC01LDcgKzUsNyBAQAogCiAjaW5jbHVkZSA8bGludXgv
bGlua2FnZS5oPgogCi0jaW5jbHVkZSA8YXNtL2FzbS11YWNjZXNzLmg+CisjaW5jbHVkZSA8YXNt
L2FsdGVybmF0aXZlLmg+CiAjaW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgogI2luY2x1ZGUgPGFz
bS9jYWNoZS5oPgogCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2NhY2hlLlMgYi9hcmNoL2Fy
bTY0L21tL2NhY2hlLlMKaW5kZXggNDA4ZDMxN2E0N2QyLi43OTQwZDZlZjVkYTUgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQvbW0vY2FjaGUuUworKysgYi9hcmNoL2FybTY0L21tL2NhY2hlLlMKQEAg
LTEyLDcgKzEyLDYgQEAKICNpbmNsdWRlIDxhc20vYXNzZW1ibGVyLmg+CiAjaW5jbHVkZSA8YXNt
L2NwdWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KLSNpbmNsdWRlIDxh
c20vYXNtLXVhY2Nlc3MuaD4KIAogLyoKICAqCV9fYXJjaF9mbHVzaF9pY2FjaGVfcmFuZ2Uoc3Rh
cnQsZW5kKQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9jb250ZXh0LmMgYi9hcmNoL2FybTY0
L21tL2NvbnRleHQuYwppbmRleCBiNWUzMjlmZGUyZGQuLjRmYzMyYzUwNGRlYSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9tbS9jb250ZXh0LmMKKysrIGIvYXJjaC9hcm02NC9tbS9jb250ZXh0LmMK
QEAgLTIzNyw2ICsyMzcsMTggQEAgdm9pZCBjaGVja19hbmRfc3dpdGNoX2NvbnRleHQoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGludCBjcHUpCiAJCWNwdV9zd2l0Y2hfbW0obW0tPnBn
ZCwgbW0pOwogfQogCisjaWZkZWYgQ09ORklHX0FSTTY0X1NXX1RUQlIwX1BBTgorYXNtbGlua2Fn
ZSB2b2lkIF9fdWFjY2Vzc190dGJyMF9lbmFibGVfYyh2b2lkKQoreworCV9fdWFjY2Vzc190dGJy
MF9lbmFibGUoKTsKK30KKworYXNtbGlua2FnZSB2b2lkIF9fdWFjY2Vzc190dGJyMF9kaXNhYmxl
X2Modm9pZCkKK3sKKwlfX3VhY2Nlc3NfdHRicjBfZGlzYWJsZSgpOworfQorI2VuZGlmCisKIC8q
IEVycmF0YSB3b3JrYXJvdW5kIHBvc3QgVFRCUnhfRUwxIHVwZGF0ZS4gKi8KIGFzbWxpbmthZ2Ug
dm9pZCBwb3N0X3R0YnJfdXBkYXRlX3dvcmthcm91bmQodm9pZCkKIHsKLS0gCjIuMjQuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
