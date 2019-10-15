Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713CD72BA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 12:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKJdj-0003yZ-A4; Tue, 15 Oct 2019 10:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wbPI=YI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iKJdh-0003yU-Pe
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 10:01:13 +0000
X-Inumbo-ID: b7d6df02-ef32-11e9-beca-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7d6df02-ef32-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 10:01:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m13so19526499ljj.11
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3BVhpSuNtR36SkX5drqgZZn7VVZJw5UnhWE0EdaCaJA=;
 b=qnWYIKazEjIQWMPjBFpHqHcDMsy2upYuKitVbVTIScTcJJZIfWCr3LxK4nCoFcJiSU
 h8zrZ5c3Da1nBYIfQww42tXQ4X2OwlayDPI3jSnCJe9CDOGS47AstiytDsI9zqomjR80
 geN3qAn5QQVYFLQf3xkLVfP9pBIWSz6lpy60UNIOkQP+4P+BpgnZq7hKNFssQgc27DCm
 5xACREgWrXuc0ye3hYajubSWGI5Ony7NhmX+TilYvpS4AASzk78GDlT//xQb4K/rJPOF
 fH5Vhph2+bsdU2E5TA70ao2r1MDl4ovaykhxAjWWX3J3aI7nCW5B/ota4Kh9yVeJnW/f
 CxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3BVhpSuNtR36SkX5drqgZZn7VVZJw5UnhWE0EdaCaJA=;
 b=O1m+KRfUdo1qaRfCnFniGQJqMYn9neCgCm7J3lD6GDsh2UvA0w0xcte5ByjmeAh131
 KIIsaIC8jZfZyJoAYm1BlW2E9c+aYjRfNL8tiXFDDy9PtBaLzFfS7Xf2KGtQGF1EHCkN
 WIEzuLKKKvbFBLBS6AV60JLWRF+1iAz6c3O2MosfZkCS799HejbzgdT2fQKX1Gp0eg7k
 5scZF8E79lRKTN9VfuJB6Lkp2O4xbZJejIkCXQeERdeex8y3ZDQai5tfM1yUFZN9NofG
 6qzh2pvjI0ZzLRhq8uMG9r4AvZQXzPXulyiRjCmdOngfB+P2Oo6eAddYaiQRrfaJzbKA
 xYDw==
X-Gm-Message-State: APjAAAWD/8pL4Ru90CN70XRzkjWFrU4lj70gOw5m7vsoYTliCHtgRmDD
 y8suxFFdNEwKFDVS8M0ZzDa9fAJI1Do=
X-Google-Smtp-Source: APXvYqwQZvwniWx4gcCrszNeXj5kgXjsjIVrk62Zl2dgiugyyrCw2UHSCWegsAFPjVLrT6fXwKzkcA==
X-Received: by 2002:a2e:9f4d:: with SMTP id v13mr22202420ljk.226.1571133671280; 
 Tue, 15 Oct 2019 03:01:11 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id y26sm5521974ljj.90.2019.10.15.03.01.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Oct 2019 03:01:09 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 15 Oct 2019 13:01:08 +0300
Message-Id: <1571133668-5875-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] arm/gic: Make sense of assertions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFSTSBDb21waWxl
ciBjb21wbGFpbnMgYWJvdXQgYXNzZXJ0aW9uIGNvbmRpdGlvbnMgYmVpbmcgYWx3YXlzIHRydWUs
CmJlY2F1c2Ugc2dpIGlzIG9mIGVudW0gdHlwZSB3aGF0IGhhcyBhbGwgaXRzIHZhbHVlcyB1bmRl
ciAxNi4KSW4gb3JkZXIgdG8gcHJlc2VydmUgdGhvc2UgYXNzZXJ0cywgc3BlY2lmeSB0aGUgYXZh
aWxhYmxlIFNHSSBudW1iZXIKcmlnaHQgaW4gdGhlIGVudW0gYW5kIHVzZSBpdCBmb3IgdGhlIGFz
c2VydGlvbnMuIFRoaXMgYWxzbyBlbGltaW5hdGVzCm5hc3R5IGhhcmRjb2RlZCB2YWx1ZXMuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0K
IHhlbi9hcmNoL2FybS9naWMuYyAgICAgICAgfCA2ICsrKy0tLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9naWMuaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9n
aWMuYwppbmRleCAxMTM2NTVhLi5iZjM3M2Q3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZ2lj
LmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jCkBAIC0yOTQsNyArMjk0LDcgQEAgdm9pZCBfX2lu
aXQgZ2ljX2luaXQodm9pZCkKIAogdm9pZCBzZW5kX1NHSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAq
Y3B1bWFzaywgZW51bSBnaWNfc2dpIHNnaSkKIHsKLSAgICBBU1NFUlQoc2dpIDwgMTYpOyAvKiBU
aGVyZSBhcmUgb25seSAxNiBTR0lzICovCisgICAgQVNTRVJUKHNnaSA8IE5VTUJFUl9PRl9HSUNf
U0dJUyk7CiAKICAgICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ksIFNHSV9UQVJHRVRfTElTVCwg
Y3B1bWFzayk7CiB9CkBAIC0zMDYsMTQgKzMwNiwxNCBAQCB2b2lkIHNlbmRfU0dJX29uZSh1bnNp
Z25lZCBpbnQgY3B1LCBlbnVtIGdpY19zZ2kgc2dpKQogCiB2b2lkIHNlbmRfU0dJX3NlbGYoZW51
bSBnaWNfc2dpIHNnaSkKIHsKLSAgICBBU1NFUlQoc2dpIDwgMTYpOyAvKiBUaGVyZSBhcmUgb25s
eSAxNiBTR0lzICovCisgICAgQVNTRVJUKHNnaSA8IE5VTUJFUl9PRl9HSUNfU0dJUyk7CiAKICAg
ICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ksIFNHSV9UQVJHRVRfU0VMRiwgTlVMTCk7CiB9CiAK
IHZvaWQgc2VuZF9TR0lfYWxsYnV0c2VsZihlbnVtIGdpY19zZ2kgc2dpKQogewotICAgQVNTRVJU
KHNnaSA8IDE2KTsgLyogVGhlcmUgYXJlIG9ubHkgMTYgU0dJcyAqLworICAgQVNTRVJUKHNnaSA8
IE5VTUJFUl9PRl9HSUNfU0dJUyk7CiAKICAgIGdpY19od19vcHMtPnNlbmRfU0dJKHNnaSwgU0dJ
X1RBUkdFVF9PVEhFUlMsIE5VTEwpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9naWMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKaW5kZXggNzkzZDMyNC4uNWI3MjM4
OCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2dpYy5oCkBAIC0yODAsNiArMjgwLDggQEAgZW51bSBnaWNfc2dpIHsKICAgICBH
SUNfU0dJX0VWRU5UX0NIRUNLID0gMCwKICAgICBHSUNfU0dJX0RVTVBfU1RBVEUgID0gMSwKICAg
ICBHSUNfU0dJX0NBTExfRlVOQ1RJT04gPSAyLAorICAgIC8qIFRoZXJlIGFyZSBvbmx5IDE2IFNH
SXMgKi8KKyAgICBOVU1CRVJfT0ZfR0lDX1NHSVMgPSAxNgogfTsKIAogLyogU0dJIGlycSBtb2Rl
IHR5cGVzICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
