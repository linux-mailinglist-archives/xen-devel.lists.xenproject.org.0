Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409B14D1D8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpS-0006VC-U9; Wed, 29 Jan 2020 20:20:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpQ-0006Ue-Vv
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:20:49 +0000
X-Inumbo-ID: d1575e5c-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1575e5c-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so1042967wrt.6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9adkovXBXcrsU2wrP2JH6R+/kChgLQsRH9C97w7ZMwg=;
 b=Be2+uZN/IU3vEeyirsev19HR7abf6wkSb8D0/01Cx5Zw6CEZ5K/p+6P4NNk4vYq1Po
 4GFkfFS8U7ZVJVDvVO+7Uiu0Bdipm7sSlPz2vQYSkyxCPCB2aagp0jZyd0e43Td9kkvM
 R1ly2U2e7BD/mtUxax0XY8zB8c0kNIgK45foJfaRcuOEyZuMvcjUPsVtQgN0xYrqTy8g
 5K3FYhNYZYk3NOcYDk/rd/xkjVI14lsUZAS2/tQ4ZcJrCTfRNKVMf5r6GvPwEG6tQVhJ
 ooou8jBv7RG5xgFkbAVLd/mepxE3w43RjqmjelX9dE1WcnrldrIPSYk2Oi60YEq2OPoh
 3kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9adkovXBXcrsU2wrP2JH6R+/kChgLQsRH9C97w7ZMwg=;
 b=NEbG1rSNlhoKePzYLMBWpB8MpBf0/YO6JOXK8co3o8M/MvYuw8UKY12AQTTDWPh7yW
 ve3CcjoY9o2OjVUt7EOFPFOSi+eZZZiJswT23fPnx8SmjaCH9wunxynMJaJYW80zDOwr
 P+0V92ctf8SEKSm6imepRn1L/91Grobp97LZGCqosx3ShhsBXku7SlAsw1I/XJqpmmWA
 cEy0G+sdM9imCmaCsDGl9B1a7UObnyy6Xk4lms/a49oSXsc2VFu28tZadvCIPYQsvAvz
 SQvL0bBASRMIWrGqKqz2MzcmNqr85T/o7207cmKEo8FybXwLbNY6/++8nLCQUovubQMm
 +RpA==
X-Gm-Message-State: APjAAAWFZur+ZgfCxjTHFGb/y3XyZ1gYfzGs7dqWu0iR0OzT9jR3gafl
 tVtK0GH0aZEW/CFE7PstHePJkJplxII=
X-Google-Smtp-Source: APXvYqxcplD/sL4f1zqvSxzOgdqa8zb6xw3FwUzA0TaA288GWgQuGTGSBlHh5lMXyHkrAYCROMutAw==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr605314wrh.121.1580329239560;
 Wed, 29 Jan 2020 12:20:39 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:39 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:24 +0000
Message-Id: <20200129202034.15052-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 02/12] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1cCBlcnJvciBpbiB0aGUgdXBwZXIg
bGF5ZXIuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgIDYgKysrKy0tCiB4ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8IDExICsrKysrKysrKy0tCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8ICA2ICsrKy0tLQogMyBmaWxlcyBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCmluZGV4IDRmMjdiOTg3NDAuLmU3MmM5MmZmZGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYwpAQCAtNTIsMTAgKzUyLDEyIEBAIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9p
ZCkKICAgICAgICAgb3BzLT5zZXR1cCgpOwogfQogCi12b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAo
dm9pZCkKK2ludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCiB7CiAgICAgaWYgKCBvcHMgJiYg
b3BzLT5hcF9zZXR1cCApCi0gICAgICAgIG9wcy0+YXBfc2V0dXAoKTsKKyAgICAgICAgcmV0dXJu
IG9wcy0+YXBfc2V0dXAoKTsKKworICAgIHJldHVybiAwOwogfQogCiB2b2lkIGh5cGVydmlzb3Jf
cmVzdW1lKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwppbmRleCA2ZGJjNWY5NTNmLi5lZWQ4YTZlZGFl
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMKQEAgLTI1NywxMSArMjU3LDE4IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cCh2b2lkKQogICAgIGluaXRfZXZ0Y2huKCk7CiB9CiAKLXN0YXRpYyB2b2lkIGFw
X3NldHVwKHZvaWQpCitzdGF0aWMgaW50IGFwX3NldHVwKHZvaWQpCiB7CisgICAgaW50IHJjOwor
CiAgICAgc2V0X3ZjcHVfaWQoKTsKLSAgICBtYXBfdmNwdWluZm8oKTsKKyAgICByYyA9IG1hcF92
Y3B1aW5mbygpOworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CisKICAgICBpbml0
X2V2dGNobigpOworCisgICAgcmV0dXJuIDA7CiB9CiAKIGludCB4Z19hbGxvY191bnVzZWRfcGFn
ZShtZm5fdCAqbWZuKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnZpc29yLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAppbmRleCAz
OTJmNGI5MGFlLi5iNTAzODU0YzViIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydmlzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlz
b3IuaApAQCAtMjUsNyArMjUsNyBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgIC8qIE1h
aW4gc2V0dXAgcm91dGluZSAqLwogICAgIHZvaWQgKCpzZXR1cCkodm9pZCk7CiAgICAgLyogQVAg
c2V0dXAgKi8KLSAgICB2b2lkICgqYXBfc2V0dXApKHZvaWQpOworICAgIGludCAoKmFwX3NldHVw
KSh2b2lkKTsKICAgICAvKiBSZXN1bWUgZnJvbSBzdXNwZW5zaW9uICovCiAgICAgdm9pZCAoKnJl
c3VtZSkodm9pZCk7CiB9OwpAQCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
ewogCiBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpOwogdm9pZCBoeXBlcnZpc29y
X3NldHVwKHZvaWQpOwotdm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpOworaW50IGh5cGVy
dmlzb3JfYXBfc2V0dXAodm9pZCk7CiB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwogCiAj
ZWxzZQpAQCAtNDQsNyArNDQsNyBAQCB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOwogCiBz
dGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmh5cGVydmlzb3JfcHJvYmUodm9pZCkgeyByZXR1cm4g
TlVMTDsgfQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkgeyBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsgfQotc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfYXBfc2V0
dXAodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQorc3RhdGljIGlubGluZSBpbnQgaHlw
ZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyByZXR1cm4gMDsg
fQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHsgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7IH0KIAogI2VuZGlmICAvKiBDT05GSUdfR1VFU1QgKi8KLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
