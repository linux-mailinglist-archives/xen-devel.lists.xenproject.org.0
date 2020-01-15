Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B513C224
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriEA-0001mQ-HD; Wed, 15 Jan 2020 12:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irhzu-0008Ng-Dv
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:42:10 +0000
X-Inumbo-ID: 71d72d22-3794-11ea-ac27-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71d72d22-3794-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 12:42:09 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id n59so7670907pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S3wXxo3Bh9oayGWM8jZCD/Gnpt0hNiPJrwn1QYGnm2M=;
 b=auOyDPgVe8RTFRbA5W4EWOXH32dZQVkLy+zdkE2NamNJ/gwg8H60PNu7Lv559iQMy8
 +Uf1+gYH+3O1bRayk3SvFe+zasRl5E+RgFunTFI3s7zr7bU7UuUa1QBxGBGG0LzjsDze
 bQi12uwfRkAMQ5ouovUAbj1CdKvwlrV11g8viM4XpvGwjw2uUTQyDBK5JpP66aykCgEz
 vY4fGSxWClC5AyfgITKjn2lhV5F/HnF4oPzRneGRvIa3bOxw9iqRyEE2i+Uo3Kw/jc2L
 Y+091uGOMmax/zqpjYMMcGDh7guRcl1dBh8eCVyHEDYj1tDqyt/XpXF5PcMLIDmaHqeV
 6Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S3wXxo3Bh9oayGWM8jZCD/Gnpt0hNiPJrwn1QYGnm2M=;
 b=bGe3/V95J6pBO47CG5RqfsoUy4C1GFjyUhkgjlu9Zvjtm5W2ybVPG+FxRh78Nnk81C
 iblmw+E0K/4xIhz/A2ZTORA0fDQcaLc3dSoIHjWLftjQQIxTX5VcVbw8eCodCuawMWPN
 HKNqXHWsHIvfGhLMMa4Mly2u5xt5nTmKg5qJyJqm4Pqx5RvV/+ZRdAwqAzbHSZrs3b56
 8zsp+QzzJDGta0M57PzV5GANsRhOHE/MiBUIEO0r2UzJffANLRqeFObysU8SfdpOyy2L
 E/k1h97ETSI+8Chw2XgcCJXtcgcEHKMRzNVePha+D+HjJ29bCLl1ENeNAca2nt085cPI
 f/Vg==
X-Gm-Message-State: APjAAAUE4E3xAlHGG2USYIwdc4S/sZH3PjhGxChE343V8DaMC0xttlmN
 a6/9eamXzu+x80r7pQdhXYw=
X-Google-Smtp-Source: APXvYqzyYSD1kqH06PWZT5j+hjPxOJVeYfDpiBoVq5NBAlR42H2eqCY0MexVhcMO00FKLXtnuMtjCw==
X-Received: by 2002:a17:902:bd08:: with SMTP id
 p8mr31051161pls.39.1579092128653; 
 Wed, 15 Jan 2020 04:42:08 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee2:fbb9:75ba:e01f:bdbc:c547])
 by smtp.gmail.com with ESMTPSA id y23sm12638990pjj.3.2020.01.15.04.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:42:08 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: wei.liu@kernel.org,
	paul@xen.org,
	davem@davemloft.net
Date: Wed, 15 Jan 2020 18:11:28 +0530
Message-Id: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 15 Jan 2020 12:56:53 +0000
Subject: [Xen-devel] [PATCH] net: xen-netbank: hash.c: Use built-in RCU list
 checking
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
Cc: paulmck@kernel.org, frextrite@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4K
Cmxpc3RfZm9yX2VhY2hfZW50cnlfcmN1IGhhcyBidWlsdC1pbiBSQ1UgYW5kIGxvY2sgY2hlY2tp
bmcuClBhc3MgY29uZCBhcmd1bWVudCB0byBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdS4KClNpZ25l
ZC1vZmYtYnk6IE1hZGh1cGFybmEgQmhvd21payA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aGFzaC5jCmluZGV4IDEwZDU4MGMzZGVhMy4uMzA3MDliYzlkMTcwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aGFzaC5jCkBAIC01MSw3ICs1MSw4IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9hZGRfaGFzaChzdHJ1
Y3QgeGVudmlmICp2aWYsIGNvbnN0IHU4ICp0YWcsCiAKIAlmb3VuZCA9IGZhbHNlOwogCW9sZGVz
dCA9IE5VTEw7Ci0JbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoZW50cnksICZ2aWYtPmhhc2guY2Fj
aGUubGlzdCwgbGluaykgeworCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGVudHJ5LCAmdmlmLT5o
YXNoLmNhY2hlLmxpc3QsIGxpbmssCisJCQkJCQkJbG9ja2RlcF9pc19oZWxkKCZ2aWYtPmhhc2gu
Y2FjaGUubG9jaykpIHsKIAkJLyogTWFrZSBzdXJlIHdlIGRvbid0IGFkZCBkdXBsaWNhdGUgZW50
cmllcyAqLwogCQlpZiAoZW50cnktPmxlbiA9PSBsZW4gJiYKIAkJICAgIG1lbWNtcChlbnRyeS0+
dGFnLCB0YWcsIGxlbikgPT0gMCkKQEAgLTEwMiw3ICsxMDMsOCBAQCBzdGF0aWMgdm9pZCB4ZW52
aWZfZmx1c2hfaGFzaChzdHJ1Y3QgeGVudmlmICp2aWYpCiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgm
dmlmLT5oYXNoLmNhY2hlLmxvY2ssIGZsYWdzKTsKIAotCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1
KGVudHJ5LCAmdmlmLT5oYXNoLmNhY2hlLmxpc3QsIGxpbmspIHsKKwlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3JjdShlbnRyeSwgJnZpZi0+aGFzaC5jYWNoZS5saXN0LCBsaW5rLAorCQkJCQkJCWxvY2tk
ZXBfaXNfaGVsZCgmdmlmLT5oYXNoLmNhY2hlLmxvY2spKSB7CiAJCWxpc3RfZGVsX3JjdSgmZW50
cnktPmxpbmspOwogCQl2aWYtPmhhc2guY2FjaGUuY291bnQtLTsKIAkJa2ZyZWVfcmN1KGVudHJ5
LCByY3UpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
