Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D168AFD3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:19:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQ78-0005sc-0X; Tue, 13 Aug 2019 06:16:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/QrK=WJ=gmail.com=hslester96@srs-us1.protection.inumbo.net>)
 id 1hxQ77-0005sX-4f
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:16:57 +0000
X-Inumbo-ID: f301eee7-bd91-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f301eee7-bd91-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 06:16:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c2so48831655plz.13
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2019 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lB2W34FFRFhSU+6xsPtiaBhXXvBNBgq1m83tH9jQCgk=;
 b=lR0mpVGl7S5m6GiFXrWKwRq9XC7qJOtZEOUALc7cmgel+BKbdeD2iiqbSm6eSQvJMy
 nOuO40CVTkMbqWBy/vbyR1IBBGNQFVd/w+pb6qlW5FYWdsIqviQBhejEhP/0xveynMmI
 vYEX5DvPhD6WtMhiBVmS6NoNE8EpTDP2nprVIoqp1dD4M8iwW/ZIbzIrdvUnnxOlfiwW
 3X2olAWRnWo5GuLkRTzNn2959BE6SlZ5JD72dOEX0yCVy9I8Ty+6ERxWw4yJSBnqZNq2
 WH47O9SfGx1ufW3OOF+gpMj4koZoFQX2Ejw6wNAJrtnGzpt+Z5JDDBMandk4lOtnQLVE
 SzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lB2W34FFRFhSU+6xsPtiaBhXXvBNBgq1m83tH9jQCgk=;
 b=Ybjpj4AbgeWEHWT9W1hvm0cGfed20u5XLLlyxo9EA1+54dp3/qkI5ScJ4Wp/Dyn6Tk
 8IMP51O0Q993RBJ0xp1kfZ4i1+zDVHWm/NPL7OLvyqUR3/kPjRU1zkdY/G88TeQmknc4
 vecAvRCvguUQSj8eIdYSOURto+JR4xqcsng2fH1brH+48Xupsf/ohxQ1a9WeCN1UukAT
 XYeCKZkB29hbbUqyIp0vtdJVYXNrY8Y3dW6oG//6vAf3QE9NMPthwY7YYojFISoB5D0o
 Ctu5xmW6yv3c6hQVeSgOWlxrA/O0XCMa3gWNz2slO1w1SOE8Xmy6+ExrNbWSw2evhOw0
 /hzA==
X-Gm-Message-State: APjAAAVnv6nCbLt/VAzg6/3S4j4DzruC7MlbGULyo1dIbD3mWAVX04gg
 kZAXkfC+GJa1/iWZOl3VQO8=
X-Google-Smtp-Source: APXvYqy02phZk28jrMxAd/3ZbPtBeJasaqaq1E4b04hPXcUojIzejAySe0BILM0w/izcaXiRSARIRg==
X-Received: by 2002:a17:902:7202:: with SMTP id
 ba2mr37151447plb.266.1565677015327; 
 Mon, 12 Aug 2019 23:16:55 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id j15sm140141434pfn.150.2019.08.12.23.16.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:16:54 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Tue, 13 Aug 2019 14:16:50 +0800
Message-Id: <20190813061650.5483-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/3] xen/blkback: Use refcount_t for refcount
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
U2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCkNo
YW5nZXMgaW4gdjI6CiAgLSBBbHNvIGNvbnZlcnQgcGVuZGluZ19yZXE6OnBlbmRjbnQgdG8gcmVm
Y291bnRfdC4KCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYyB8IDYgKysrLS0t
CiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oICB8IDkgKysrKystLS0tCiBkcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2svYmxrYmFjay5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGti
YWNrLmMKaW5kZXggZmQxZTE5ZjFhNDlmLi5iMjRiYjBhZWEzNWYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJs
a2JhY2svYmxrYmFjay5jCkBAIC0xMDk4LDcgKzEwOTgsNyBAQCBzdGF0aWMgdm9pZCBfX2VuZF9i
bG9ja19pb19vcChzdHJ1Y3QgcGVuZGluZ19yZXEgKnBlbmRpbmdfcmVxLAogCSAqIHRoZSBncmFu
dCByZWZlcmVuY2VzIGFzc29jaWF0ZWQgd2l0aCAncmVxdWVzdCcgYW5kIHByb3ZpZGUKIAkgKiB0
aGUgcHJvcGVyIHJlc3BvbnNlIG9uIHRoZSByaW5nLgogCSAqLwotCWlmIChhdG9taWNfZGVjX2Fu
ZF90ZXN0KCZwZW5kaW5nX3JlcS0+cGVuZGNudCkpCisJaWYgKHJlZmNvdW50X2RlY19hbmRfdGVz
dCgmcGVuZGluZ19yZXEtPnBlbmRjbnQpKQogCQl4ZW5fYmxrYmtfdW5tYXBfYW5kX3Jlc3BvbmQo
cGVuZGluZ19yZXEpOwogfQogCkBAIC0xMzk1LDcgKzEzOTUsNyBAQCBzdGF0aWMgaW50IGRpc3Bh
dGNoX3J3X2Jsb2NrX2lvKHN0cnVjdCB4ZW5fYmxraWZfcmluZyAqcmluZywKIAkJYmlvX3NldF9v
cF9hdHRycyhiaW8sIG9wZXJhdGlvbiwgb3BlcmF0aW9uX2ZsYWdzKTsKIAl9CiAKLQlhdG9taWNf
c2V0KCZwZW5kaW5nX3JlcS0+cGVuZGNudCwgbmJpbyk7CisJcmVmY291bnRfc2V0KCZwZW5kaW5n
X3JlcS0+cGVuZGNudCwgbmJpbyk7CiAJYmxrX3N0YXJ0X3BsdWcoJnBsdWcpOwogCiAJZm9yIChp
ID0gMDsgaSA8IG5iaW87IGkrKykKQEAgLTE0MjQsNyArMTQyNCw3IEBAIHN0YXRpYyBpbnQgZGlz
cGF0Y2hfcndfYmxvY2tfaW8oc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nLAogIGZhaWxfcHV0
X2JpbzoKIAlmb3IgKGkgPSAwOyBpIDwgbmJpbzsgaSsrKQogCQliaW9fcHV0KGJpb2xpc3RbaV0p
OwotCWF0b21pY19zZXQoJnBlbmRpbmdfcmVxLT5wZW5kY250LCAxKTsKKwlyZWZjb3VudF9zZXQo
JnBlbmRpbmdfcmVxLT5wZW5kY250LCAxKTsKIAlfX2VuZF9ibG9ja19pb19vcChwZW5kaW5nX3Jl
cSwgQkxLX1NUU19SRVNPVVJDRSk7CiAJbXNsZWVwKDEpOyAvKiBiYWNrIG9mZiBhIGJpdCAqLwog
CXJldHVybiAtRUlPOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21t
b24uaCBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKaW5kZXggMWQzMDAyZDc3
M2Y3Li44MjRkNjRhODMzOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
Y29tbW9uLmgKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaApAQCAtMzUs
NiArMzUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KICNpbmNsdWRlIDxsaW51eC9pby5o
PgogI2luY2x1ZGUgPGxpbnV4L3JidHJlZS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZmNvdW50Lmg+
CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAjaW5jbHVkZSA8YXNtL3BnYWxsb2MuaD4KICNpbmNs
dWRlIDxhc20vaHlwZXJ2aXNvci5oPgpAQCAtMzA5LDcgKzMxMCw3IEBAIHN0cnVjdCB4ZW5fYmxr
aWYgewogCXN0cnVjdCB4ZW5fdmJkCQl2YmQ7CiAJLyogQmFjayBwb2ludGVyIHRvIHRoZSBiYWNr
ZW5kX2luZm8uICovCiAJc3RydWN0IGJhY2tlbmRfaW5mbwkqYmU7Ci0JYXRvbWljX3QJCXJlZmNu
dDsKKwlyZWZjb3VudF90CQlyZWZjbnQ7CiAJLyogZm9yIGJhcnJpZXIgKGRyYWluKSByZXF1ZXN0
cyAqLwogCXN0cnVjdCBjb21wbGV0aW9uCWRyYWluX2NvbXBsZXRlOwogCWF0b21pY190CQlkcmFp
bjsKQEAgLTM0Myw3ICszNDQsNyBAQCBzdHJ1Y3QgcGVuZGluZ19yZXEgewogCXN0cnVjdCB4ZW5f
YmxraWZfcmluZyAgICpyaW5nOwogCXU2NAkJCWlkOwogCWludAkJCW5yX3NlZ3M7Ci0JYXRvbWlj
X3QJCXBlbmRjbnQ7CisJcmVmY291bnRfdAkJcGVuZGNudDsKIAl1bnNpZ25lZCBzaG9ydAkJb3Bl
cmF0aW9uOwogCWludAkJCXN0YXR1czsKIAlzdHJ1Y3QgbGlzdF9oZWFkCWZyZWVfbGlzdDsKQEAg
LTM2MiwxMCArMzYzLDEwIEBAIHN0cnVjdCBwZW5kaW5nX3JlcSB7CiAJCQkgKF92KS0+YmRldi0+
YmRfcGFydC0+bnJfc2VjdHMgOiBcCiAJCQkgIGdldF9jYXBhY2l0eSgoX3YpLT5iZGV2LT5iZF9k
aXNrKSkKIAotI2RlZmluZSB4ZW5fYmxraWZfZ2V0KF9iKSAoYXRvbWljX2luYygmKF9iKS0+cmVm
Y250KSkKKyNkZWZpbmUgeGVuX2Jsa2lmX2dldChfYikgKHJlZmNvdW50X2luYygmKF9iKS0+cmVm
Y250KSkKICNkZWZpbmUgeGVuX2Jsa2lmX3B1dChfYikJCQkJXAogCWRvIHsJCQkJCQlcCi0JCWlm
IChhdG9taWNfZGVjX2FuZF90ZXN0KCYoX2IpLT5yZWZjbnQpKQlcCisJCWlmIChyZWZjb3VudF9k
ZWNfYW5kX3Rlc3QoJihfYiktPnJlZmNudCkpCVwKIAkJCXNjaGVkdWxlX3dvcmsoJihfYiktPmZy
ZWVfd29yayk7XAogCX0gd2hpbGUgKDApCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmlu
ZGV4IDNhYzZhNWQxODA3MS4uZWNjNWY5YzViZjNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVu
YnVzLmMKQEAgLTE2OSw3ICsxNjksNyBAQCBzdGF0aWMgc3RydWN0IHhlbl9ibGtpZiAqeGVuX2Js
a2lmX2FsbG9jKGRvbWlkX3QgZG9taWQpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJ
YmxraWYtPmRvbWlkID0gZG9taWQ7Ci0JYXRvbWljX3NldCgmYmxraWYtPnJlZmNudCwgMSk7CisJ
cmVmY291bnRfc2V0KCZibGtpZi0+cmVmY250LCAxKTsKIAlpbml0X2NvbXBsZXRpb24oJmJsa2lm
LT5kcmFpbl9jb21wbGV0ZSk7CiAJSU5JVF9XT1JLKCZibGtpZi0+ZnJlZV93b3JrLCB4ZW5fYmxr
aWZfZGVmZXJyZWRfZnJlZSk7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
