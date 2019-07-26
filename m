Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB2D763B9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxbg-0006Xt-SI; Fri, 26 Jul 2019 10:37:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqxbf-0006Xi-LC
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:37:47 +0000
X-Inumbo-ID: 678e6ef2-af91-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 678e6ef2-af91-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:37:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i21so51040302ljj.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+Sj40svUpTZp0FXDzpVnnnckBrBiw8PXNGcGLtUyPKE=;
 b=u4em/W6jRqWmOf+CYZ3d1Q3rNyyCnhsP4bkIqS0Bc27rpzcgf1ddnkGGBOtTBz/Kwv
 YnquHzQtRhbVjwZAfe4w6ETGxdR0sS+ZX0tVLMxszwSjoi5z1zAmqH3OOqva8UQBPBbN
 wgrF62Iun2BLLIVhHOCyhXEL0XMR9dMxe9GCaxELUhZsqeXmoigFCX/UvxTvLaCE9W1i
 dqf9QNT2TyATgcbCDEik6WMI8NgjyKGsc+/lO2rYCtE2JTytwtWsYKgQe0sFBNiuKpqY
 dDXVkzC6nE/KeQBVwwT6LXWu+tqPom9mqN6iLSuzagSaIrrmwMGDXZVAg78hpNnx4bJM
 Qwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+Sj40svUpTZp0FXDzpVnnnckBrBiw8PXNGcGLtUyPKE=;
 b=N30fDrQNwMmFHlLGiG3WTYZOtaZ9oGCCdtweAbAzil8/xc92MEEtsqaHOAXZ/bm3mH
 Y/MLqKVymChaQM0cmrEVZstlKXTbZDq4ADzDfRyPBgzaRrR0iRLuTmGTxr/VM631c/B3
 CM3Z1UYqpCKAC00RNUxzZIkRgV5YYAhWgkz4huWE5k41VDDnf5EATAjDYQsPGcKeZ0yn
 dXrCwctcef1DZiIM5VXj0Cr7aVDbOfKWSvwnvL+VfUAOa1yqKL4tYkUnKbfAI4IbAPe3
 uAiPTeocRoj/1AWnr/15KPi3H44A79zmaRb0niCYVHAYxW+pfjGRz+Zbw3+tgWHrUvm3
 4G/A==
X-Gm-Message-State: APjAAAXNMbNUfBfv2+NIVHi2gXjbJg9QevElI0Fa3JzISnJ+WTrGw0bi
 dHXk7EqPh9seDg9ubpFMEaaJWI5Q
X-Google-Smtp-Source: APXvYqwXXNpLzZGEnDDiwwHay0T5FDcaE/mLGYQOy37/tNPPR4fhRzc4ujo6laCsPVMrXFxbagdP8g==
X-Received: by 2002:a2e:9593:: with SMTP id w19mr1850913ljh.69.1564137464536; 
 Fri, 26 Jul 2019 03:37:44 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m4sm9938274ljc.56.2019.07.26.03.37.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 03:37:43 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 13:37:34 +0300
Message-Id: <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoaXMgbWFrZXMgZnVu
Y3Rpb24gZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKCkgYmVpbmcgZXhlY3V0ZWQgd2l0aAppcnFzIGxv
Y2tlZC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CltBbmRyaWk6IGFkZCBhIGp1c3RpZmljYXRpb24gY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gv
YXJtL2FybTY0L2VudHJ5LlMgfCAxMSArKysrKy0tLS0tLQogeGVuL2FyY2gvYXJtL3RyYXBzLmMg
ICAgICAgfCAgNiArKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyBiL3hl
bi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCmluZGV4IDk3YjA1ZjUuLjhmMjg3ODkgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9l
bnRyeS5TCkBAIC0xOTUsNyArMTk1LDYgQEAgaHlwX2Vycm9yX2ludmFsaWQ6CiAKIGh5cF9lcnJv
cjoKICAgICAgICAgZW50cnkgICBoeXA9MQotICAgICAgICBtc3IgICAgIGRhaWZjbHIsICMyCiAg
ICAgICAgIG1vdiAgICAgeDAsIHNwCiAgICAgICAgIGJsICAgICAgZG9fdHJhcF9oeXBfc2Vycm9y
CiAgICAgICAgIGV4aXQgICAgaHlwPTEKQEAgLTIwMyw3ICsyMDIsNyBAQCBoeXBfZXJyb3I6CiAv
KiBUcmFwcyB0YWtlbiBpbiBDdXJyZW50IEVMIHdpdGggU1BfRUx4ICovCiBoeXBfc3luYzoKICAg
ICAgICAgZW50cnkgICBoeXA9MQotICAgICAgICBtc3IgICAgIGRhaWZjbHIsICM2CisgICAgICAg
IG1zciAgICAgZGFpZmNsciwgIzQKICAgICAgICAgbW92ICAgICB4MCwgc3AKICAgICAgICAgYmwg
ICAgICBkb190cmFwX2h5cF9zeW5jCiAgICAgICAgIGV4aXQgICAgaHlwPTEKQEAgLTMwNCw3ICsz
MDMsNyBAQCBndWVzdF9zeW5jX3Nsb3dwYXRoOgogICAgICAgICBBTFRFUk5BVElWRSgiYmwgY2hl
Y2tfcGVuZGluZ192c2Vycm9yOyBjYm56IHgwLCAxZiIsCiAgICAgICAgICAgICAgICAgICAgICJu
b3A7IG5vcCIsCiAgICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VO
VFJZX0VYSVQpCi0gICAgICAgIG1zciAgICAgZGFpZmNsciwgIzYKKyAgICAgICAgbXNyICAgICBk
YWlmY2xyLCAjNAogICAgICAgICBtb3YgICAgIHgwLCBzcAogICAgICAgICBibCAgICAgIGRvX3Ry
YXBfZ3Vlc3Rfc3luYwogMToKQEAgLTMzMiw3ICszMzEsNyBAQCBndWVzdF9maXFfaW52YWxpZDoK
IAogZ3Vlc3RfZXJyb3I6CiAgICAgICAgIGVudHJ5ICAgaHlwPTAsIGNvbXBhdD0wCi0gICAgICAg
IG1zciAgICAgZGFpZmNsciwgIzYKKyAgICAgICAgbXNyICAgICBkYWlmY2xyLCAjNAogICAgICAg
ICBtb3YgICAgIHgwLCBzcAogICAgICAgICBibCAgICAgIGRvX3RyYXBfZ3Vlc3Rfc2Vycm9yCiAg
ICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD0wCkBAIC0zNDcsNyArMzQ2LDcgQEAgZ3Vlc3Rf
c3luY19jb21wYXQ6CiAgICAgICAgIEFMVEVSTkFUSVZFKCJibCBjaGVja19wZW5kaW5nX3ZzZXJy
b3I7IGNibnogeDAsIDFmIiwKICAgICAgICAgICAgICAgICAgICAgIm5vcDsgbm9wIiwKICAgICAg
ICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVCkKLSAgICAg
ICAgbXNyICAgICBkYWlmY2xyLCAjNgorICAgICAgICBtc3IgICAgIGRhaWZjbHIsICM0CiAgICAg
ICAgIG1vdiAgICAgeDAsIHNwCiAgICAgICAgIGJsICAgICAgZG9fdHJhcF9ndWVzdF9zeW5jCiAx
OgpAQCAtMzc1LDcgKzM3NCw3IEBAIGd1ZXN0X2ZpcV9pbnZhbGlkX2NvbXBhdDoKIAogZ3Vlc3Rf
ZXJyb3JfY29tcGF0OgogICAgICAgICBlbnRyeSAgIGh5cD0wLCBjb21wYXQ9MQotICAgICAgICBt
c3IgICAgIGRhaWZjbHIsICM2CisgICAgICAgIG1zciAgICAgZGFpZmNsciwgIzQKICAgICAgICAg
bW92ICAgICB4MCwgc3AKICAgICAgICAgYmwgICAgICBkb190cmFwX2d1ZXN0X3NlcnJvcgogICAg
ICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9MQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Ry
YXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwppbmRleCAzMTAzNjIwLi41YTlkYzY2IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYworKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwpA
QCAtMjAxNyw2ICsyMDE3LDggQEAgc3RhdGljIHZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQogICAgIHsKICAgICAgICAgc3RydWN0IHZjcHUgKnYg
PSBjdXJyZW50OwogCisgICAgICAgIEFTU0VSVCghbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7CisK
ICAgICAgICAgLyogSWYgdGhlIGd1ZXN0IGhhcyBkaXNhYmxlZCB0aGUgd29ya2Fyb3VuZCwgYnJp
bmcgaXQgYmFjayBvbi4gKi8KICAgICAgICAgaWYgKCBuZWVkc19zc2JkX2ZsaXAodikgKQogICAg
ICAgICAgICAgYXJtX3NtY2NjXzFfMV9zbWMoQVJNX1NNQ0NDX0FSQ0hfV09SS0FST1VORF8yX0ZJ
RCwgMSwgTlVMTCk7CkBAIC0yMDUxLDYgKzIwNTMsNyBAQCB2b2lkIGRvX3RyYXBfZ3Vlc3Rfc3lu
YyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICBjb25zdCB1bmlvbiBoc3IgaHNyID0g
eyAuYml0cyA9IHJlZ3MtPmhzciB9OwogCiAgICAgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHJlZ3Mp
OworICAgIGxvY2FsX2lycV9lbmFibGUoKTsKIAogICAgIHN3aXRjaCAoIGhzci5lYyApCiAgICAg
ewpAQCAtMjE4Niw2ICsyMTg5LDcgQEAgdm9pZCBkb190cmFwX2h5cF9zeW5jKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQogICAgIGNvbnN0IHVuaW9uIGhzciBoc3IgPSB7IC5iaXRzID0gcmVn
cy0+aHNyIH07CiAKICAgICBlbnRlcl9oeXBlcnZpc29yX2hlYWQocmVncyk7CisgICAgbG9jYWxf
aXJxX2VuYWJsZSgpOwogCiAgICAgc3dpdGNoICggaHNyLmVjICkKICAgICB7CkBAIC0yMjI0LDYg
KzIyMjgsNyBAQCB2b2lkIGRvX3RyYXBfaHlwX3N5bmMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCiB2b2lkIGRvX3RyYXBfaHlwX3NlcnJvcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykK
IHsKICAgICBlbnRlcl9oeXBlcnZpc29yX2hlYWQocmVncyk7CisgICAgbG9jYWxfaXJxX2VuYWJs
ZSgpOwogCiAgICAgX19kb190cmFwX3NlcnJvcihyZWdzLCBWQUJPUlRfR0VOX0JZX0dVRVNUKHJl
Z3MpKTsKIH0KQEAgLTIyMzEsNiArMjIzNiw3IEBAIHZvaWQgZG9fdHJhcF9oeXBfc2Vycm9yKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQogdm9pZCBkb190cmFwX2d1ZXN0X3NlcnJvcihzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIHsKICAgICBlbnRlcl9oeXBlcnZpc29yX2hlYWQocmVn
cyk7CisgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwogCiAgICAgX19kb190cmFwX3NlcnJvcihyZWdz
LCB0cnVlKTsKIH0KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
