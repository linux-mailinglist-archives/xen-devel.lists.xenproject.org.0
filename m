Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C50896C8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 07:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx2oQ-00018V-Fq; Mon, 12 Aug 2019 05:24:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VQly=WH=gmail.com=wenwenict@srs-us1.protection.inumbo.net>)
 id 1hwrZG-00030Q-Jd
 for xen-devel@lists.xenproject.org; Sun, 11 Aug 2019 17:23:42 +0000
X-Inumbo-ID: c2f2122a-bc5c-11e9-b16e-af4f2310b143
Received: from mail-yw1-f67.google.com (unknown [209.85.161.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f2122a-bc5c-11e9-b16e-af4f2310b143;
 Sun, 11 Aug 2019 17:23:40 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i18so2873454ywa.3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Aug 2019 10:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tn6nhjNQ7pdIDBNVvjNcCirLgHTb4d9vEhC1PgN0dmg=;
 b=HPA+aNecUagpqHodqC6t8wJRN++XWJHFKv++Q/cxtOHjNZnC++jugA0K+rRrTKoiy8
 XXZ0iVhii9lgd6HG9MLSYop/CRmjw7urPzLQ5zvt8ImFPrAyoiaSXq1edO9fxN9CivUt
 UDrLLV7k5AEZnwA7l0fHWISldeKUq99B5nEdQ1zjMa4AVsJ5IfuX+CxFN9iOi5amieX5
 XFb8ZeIZfohu01Vdq1KWTqhMhfEsCHr9p0GwDqGXWC1r8ic82VXw5GVvLqabpCkx8Voc
 0HKWM0UudSnspN4swTW+DZGZfcmofQNoX4rx2ERRIqh01ApwutpEU9nuNoNbzrqZIxde
 JBwQ==
X-Gm-Message-State: APjAAAVvtoelr21c1MHipbriM0GkTNB6i/MGQBlLHA/CMCXYB6gOKhDE
 b+kDNKh5+BCbdTJ+2cSrNP0=
X-Google-Smtp-Source: APXvYqyQ0YGPfGErlB97Ql1pCAIUrzC/nGiwLC0F+lrA2nquYsm718zy1jqHZRJ/vG2HIjgexdP3cQ==
X-Received: by 2002:a81:50c:: with SMTP id 12mr22280201ywf.380.1565544220073; 
 Sun, 11 Aug 2019 10:23:40 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id l4sm1027236ywd.0.2019.08.11.10.23.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 10:23:39 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Sun, 11 Aug 2019 12:23:22 -0500
Message-Id: <1565544202-3927-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 12 Aug 2019 05:24:04 +0000
Subject: [Xen-devel] [PATCH] xen/blkback: fix memory leaks
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 "moderated list:XEN BLOCK SUBSYSTEM" <xen-devel@lists.xenproject.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gcmVhZF9wZXJfcmluZ19yZWZzKCksIGFmdGVyICdyZXEnIGFuZCByZWxhdGVkIG1lbW9yeSBy
ZWdpb25zIGFyZQphbGxvY2F0ZWQsIHhlbl9ibGtpZl9tYXAoKSBpcyBpbnZva2VkIHRvIG1hcCB0
aGUgc2hhcmVkIGZyYW1lLCBpcnEsIGFuZApldGMuIEhvd2V2ZXIsIGlmIHRoaXMgbWFwcGluZyBw
cm9jZXNzIGZhaWxzLCBubyBjbGVhbnVwIGlzIHBlcmZvcm1lZCwKbGVhZGluZyB0byBtZW1vcnkg
bGVha3MuIFRvIGZpeCB0aGlzIGlzc3VlLCBpbnZva2UgdGhlIGNsZWFudXAgYmVmb3JlCnJldHVy
bmluZyB0aGUgZXJyb3IuCgpTaWduZWQtb2ZmLWJ5OiBXZW53ZW4gV2FuZyA8d2Vud2VuQGNzLnVn
YS5lZHU+Ci0tLQogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyB8IDYgKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmluZGV4IDNhYzZhNWQuLmI5MGRiY2QgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKKysrIGIvZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay94ZW5idXMuYwpAQCAtOTY1LDYgKzk2NSw3IEBAIHN0YXRpYyBpbnQgcmVhZF9w
ZXJfcmluZ19yZWZzKHN0cnVjdCB4ZW5fYmxraWZfcmluZyAqcmluZywgY29uc3QgY2hhciAqZGly
KQogCQl9CiAJfQogCisJZXJyID0gLUVOT01FTTsKIAlmb3IgKGkgPSAwOyBpIDwgbnJfZ3JlZnMg
KiBYRU5fQkxLSUZfUkVRU19QRVJfUEFHRTsgaSsrKSB7CiAJCXJlcSA9IGt6YWxsb2Moc2l6ZW9m
KCpyZXEpLCBHRlBfS0VSTkVMKTsKIAkJaWYgKCFyZXEpCkBAIC05ODcsNyArOTg4LDcgQEAgc3Rh
dGljIGludCByZWFkX3Blcl9yaW5nX3JlZnMoc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nLCBj
b25zdCBjaGFyICpkaXIpCiAJZXJyID0geGVuX2Jsa2lmX21hcChyaW5nLCByaW5nX3JlZiwgbnJf
Z3JlZnMsIGV2dGNobik7CiAJaWYgKGVycikgewogCQl4ZW5idXNfZGV2X2ZhdGFsKGRldiwgZXJy
LCAibWFwcGluZyByaW5nLXJlZiBwb3J0ICV1IiwgZXZ0Y2huKTsKLQkJcmV0dXJuIGVycjsKKwkJ
Z290byBmYWlsOwogCX0KIAogCXJldHVybiAwOwpAQCAtMTAwNyw4ICsxMDA4LDcgQEAgc3RhdGlj
IGludCByZWFkX3Blcl9yaW5nX3JlZnMoc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nLCBjb25z
dCBjaGFyICpkaXIpCiAJCX0KIAkJa2ZyZWUocmVxKTsKIAl9Ci0JcmV0dXJuIC1FTk9NRU07Ci0K
KwlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMgaW50IGNvbm5lY3RfcmluZyhzdHJ1Y3QgYmFja2Vu
ZF9pbmZvICpiZSkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
