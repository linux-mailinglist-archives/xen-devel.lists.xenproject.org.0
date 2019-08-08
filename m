Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1CB863C5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvitu-0002x7-Fm; Thu, 08 Aug 2019 13:56:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DVTU=WE=gmail.com=hslester96@srs-us1.protection.inumbo.net>)
 id 1hviCB-00087n-BU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:11:07 +0000
X-Inumbo-ID: faf9b5c9-b9dd-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id faf9b5c9-b9dd-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:11:06 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n4so2326032pgv.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghbafTZeER7tFVSxKR0FoUNjQNOkuIPxO4zFms6fLUg=;
 b=HDAKTHGLr1vPMQY+1M6UtNpZ4aeffhDs6Ljt9HwWSKX66NP7I8ulEYeU3JHSfA7U4z
 L/lmA+ZPFy8xEfhQY/9tgoRPhcm17M29Hl/cbelWsrzDEtrazQlmLSLHuphKSBes3abF
 5z2hjaD7/BicGKOen58Qi1gnUe69nFMu8mt0alEWPQX8TofJMEePz2LvW7hKz3UQUsfi
 KovTVAtUDnU/If8ePS/euYbFvhO9+A2GThccvjadlmLbouIyYRAgpgnvZTE6zrJSXhjg
 OhZtipnGYL6SJ5EDdw5Urtq4sD/HX8IOppoXkyXh8vlEEwzO6ZQCa2bv5r7x6b+C5sk/
 EcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghbafTZeER7tFVSxKR0FoUNjQNOkuIPxO4zFms6fLUg=;
 b=rPL2qGeGH+q7Gr56+l6S/dI2rdYmRawRZf9BJvKE/MygH0FcOUo0VNAbxdJcw9uiuD
 FDwCZk7lxAtU2X3nhGBl9Juh6muAPJ6J1dcz2Eb7uYjbPzC+VMiCTwq5gXgBbD99Qdci
 sk1eVcOUgQe9w65WikKJMbsfX8q6YNIhN3k9Q3pubzCuJ9U4m5hkbl+phchl1AKQ0tQ9
 0k0qkqFwvLd3obtiB9SHeTAjtLk2YbslgCklbs9scXlMSiTNdlZnh+Ko6TOZ+iqR15vX
 FfCmGaMIzzaVMbOBihnecDK8KmhS4ch2oXbJ7rwbv3S6Pb/hbadRcxgUykeG1TvAT6hS
 wQrA==
X-Gm-Message-State: APjAAAVmvqNFdIcYaZCRjRlsIxTTyltWXfIMZt3WnFn3Sxft5OeQscJ2
 qN3698Hdydix1+52wea8ma0=
X-Google-Smtp-Source: APXvYqyXuh6uMII74oJqQCwpZfDp6HK/LdI9I13SlK2HkQifbdw6zcUTOtC0or/jJO1UDnoNYWLCLg==
X-Received: by 2002:a62:5252:: with SMTP id g79mr15208485pfb.18.1565269865807; 
 Thu, 08 Aug 2019 06:11:05 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id p67sm118773185pfg.124.2019.08.08.06.11.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 06:11:05 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Thu,  8 Aug 2019 21:11:00 +0800
Message-Id: <20190808131100.24751-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 08 Aug 2019 13:56:16 +0000
Subject: [Xen-devel] [PATCH 3/3] xen/blkback: Use refcount_t for refcount
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVmZXJlbmNlIGNvdW50ZXJzIGFyZSBwcmVmZXJyZWQgdG8gdXNlIHJlZmNvdW50X3QgaW5zdGVh
ZCBvZgphdG9taWNfdC4KVGhpcyBpcyBiZWNhdXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByZWZj
b3VudF90IGNhbiBwcmV2ZW50Cm92ZXJmbG93cyBhbmQgZGV0ZWN0IHBvc3NpYmxlIHVzZS1hZnRl
ci1mcmVlLgpTbyBjb252ZXJ0IGF0b21pY190IHJlZiBjb3VudGVycyB0byByZWZjb3VudF90LgoK
U2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oIHwgNyArKysrLS0tCiBkcml2ZXJzL2Js
b2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay9jb21tb24uaCBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKaW5k
ZXggMWQzMDAyZDc3M2Y3Li45ZGI1ZjM1ODZmYjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svY29tbW9uLmgKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21t
b24uaApAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KICNpbmNsdWRl
IDxsaW51eC9pby5oPgogI2luY2x1ZGUgPGxpbnV4L3JidHJlZS5oPgorI2luY2x1ZGUgPGxpbnV4
L3JlZmNvdW50Lmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAjaW5jbHVkZSA8YXNtL3BnYWxs
b2MuaD4KICNpbmNsdWRlIDxhc20vaHlwZXJ2aXNvci5oPgpAQCAtMzA5LDcgKzMxMCw3IEBAIHN0
cnVjdCB4ZW5fYmxraWYgewogCXN0cnVjdCB4ZW5fdmJkCQl2YmQ7CiAJLyogQmFjayBwb2ludGVy
IHRvIHRoZSBiYWNrZW5kX2luZm8uICovCiAJc3RydWN0IGJhY2tlbmRfaW5mbwkqYmU7Ci0JYXRv
bWljX3QJCXJlZmNudDsKKwlyZWZjb3VudF90CQlyZWZjbnQ7CiAJLyogZm9yIGJhcnJpZXIgKGRy
YWluKSByZXF1ZXN0cyAqLwogCXN0cnVjdCBjb21wbGV0aW9uCWRyYWluX2NvbXBsZXRlOwogCWF0
b21pY190CQlkcmFpbjsKQEAgLTM2MiwxMCArMzYzLDEwIEBAIHN0cnVjdCBwZW5kaW5nX3JlcSB7
CiAJCQkgKF92KS0+YmRldi0+YmRfcGFydC0+bnJfc2VjdHMgOiBcCiAJCQkgIGdldF9jYXBhY2l0
eSgoX3YpLT5iZGV2LT5iZF9kaXNrKSkKIAotI2RlZmluZSB4ZW5fYmxraWZfZ2V0KF9iKSAoYXRv
bWljX2luYygmKF9iKS0+cmVmY250KSkKKyNkZWZpbmUgeGVuX2Jsa2lmX2dldChfYikgKHJlZmNv
dW50X2luYygmKF9iKS0+cmVmY250KSkKICNkZWZpbmUgeGVuX2Jsa2lmX3B1dChfYikJCQkJXAog
CWRvIHsJCQkJCQlcCi0JCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCYoX2IpLT5yZWZjbnQpKQlc
CisJCWlmIChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJihfYiktPnJlZmNudCkpCVwKIAkJCXNjaGVk
dWxlX3dvcmsoJihfYiktPmZyZWVfd29yayk7XAogCX0gd2hpbGUgKDApCiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL3hlbmJ1cy5jCmluZGV4IDNhYzZhNWQxODA3MS4uZWNjNWY5YzViZjNmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2sveGVuYnVzLmMKQEAgLTE2OSw3ICsxNjksNyBAQCBzdGF0aWMgc3RydWN0
IHhlbl9ibGtpZiAqeGVuX2Jsa2lmX2FsbG9jKGRvbWlkX3QgZG9taWQpCiAJCXJldHVybiBFUlJf
UFRSKC1FTk9NRU0pOwogCiAJYmxraWYtPmRvbWlkID0gZG9taWQ7Ci0JYXRvbWljX3NldCgmYmxr
aWYtPnJlZmNudCwgMSk7CisJcmVmY291bnRfc2V0KCZibGtpZi0+cmVmY250LCAxKTsKIAlpbml0
X2NvbXBsZXRpb24oJmJsa2lmLT5kcmFpbl9jb21wbGV0ZSk7CiAJSU5JVF9XT1JLKCZibGtpZi0+
ZnJlZV93b3JrLCB4ZW5fYmxraWZfZGVmZXJyZWRfZnJlZSk7CiAKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
