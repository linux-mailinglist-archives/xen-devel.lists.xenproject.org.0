Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3D120C6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 19:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMF4Y-00020J-Mv; Thu, 02 May 2019 17:00:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f+J5=TC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hMF4X-0001zp-61
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:00:37 +0000
X-Inumbo-ID: cdbdba25-6cfb-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cdbdba25-6cfb-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:00:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id o16so2416143lfl.7
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q6GomBEQElMWf1Og+4zLHwzVXgNb3k6k7PmdnX3q3Vs=;
 b=APJs+rwTRmAy/uShLJ10RqnbiQ8vf/ls9nIf+lO6FgdRa7XdSCusZFiupm00GxzGZ8
 YrC0O/8Jfm9FeNCVU/xXre0Ph3dwJaFYuf/Hcd3Qu/ImhMkBQ+I8p2a9uzJ1DobX2Yt1
 9gepUuY9Qu3Z1AEwFIlIIfrxOwzYG/ZZMqcpcfLiRlIlDwRsK9qy9cqm4iW8zVZ2vI0e
 MpVmY+Lf2BsKR35HurR/HW5JIfjY+ozsctg+21022W7ONoG2ZB+hYikYKVteC5Gcm074
 DDrDFhTWnxLmp8T+Jiz9GV96n3i/0/gj+w0k6Aq2S4DgzOj2fNAtEcWenWaNXmqnUC3v
 XC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q6GomBEQElMWf1Og+4zLHwzVXgNb3k6k7PmdnX3q3Vs=;
 b=aZNAix3B8CGva4mF2c1mpWvBD/oid+4mUa1KM9zHPz8I48da8QfnL+tBlnLyY0Sa9W
 cekz6pBnw3jhlc+SzmG7YG3020brci4Dw6+OwE9y/9bmERvheqUwz/SWKuF0k7a3aTwI
 IWNWu/w2RNf7zqb7/KGtlX+v1pG89mY4pqfHPYQiZU1yc07QhnZQbE7SJUjivf92MvWP
 IiRk8p7etI/2CJ9sBRUPZ6ajOreq764reJBWzDYIhmyWWlZiFIBOzTUe8HWbdHe9rzW2
 KkcHSSkXJTLEHnTwBNOQRjcHDXfyncMFULJJ12cpVsJlgEgAMS4YKWc2/hoiSGZX6scG
 lXtA==
X-Gm-Message-State: APjAAAV7CWxzhHWzoLotvYv1PP0qLSc666Fb2bUzrUG7iCAru9WdlBfS
 J7ZRkc6ILm0yla3tkG05/2LrKT3XL+Y=
X-Google-Smtp-Source: APXvYqy1WbgcZIzZMT9N9BIuc09OJjwOSVdhD0wjUxqaNcu1RCYbyxB5zQNsI7JNKBprEDuSmjLHQg==
X-Received: by 2002:a19:7402:: with SMTP id v2mr2580582lfe.53.1556816434890;
 Thu, 02 May 2019 10:00:34 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id k21sm2659652ljb.3.2019.05.02.10.00.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 May 2019 10:00:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 20:00:22 +0300
Message-Id: <1556816422-25185-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V5 4/4] xen/arm: Add early printk support for
 SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3RpbmcgZWFybHkgcHJpbmsg
Y29kZQpmb3IgUmVuZXNhcyAiU3RvdXQiIGJvYXJkIGJhc2VkIG9uIFItQ2FyIEgyIFNvQyAoU0NJ
RkEpLgoKVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgZm9yIHRoYXQgYm9hcmQgc2hvdWxkIGJl
ICdBJzoKQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZjNDAwMDAsQQoKU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MzoKICAgICAgICAtIEl0IHdhcyBkZWNpZGVkIG5vdCB0byBpbnRyb2R1Y2UgbmV3IGRlYnVn
LXNjaWZhLmluYwogICAgICAgICAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRv
IGV4dGVuZCBleGlzdGluZwogICAgICAgICAgZGVidWctc2NpZi5pbmMgZm9yIGhhbmRsaW5nIGJv
dGggaW50ZXJmYWNlcy4KICAgICAgICAgIFRoaXMgcGF0Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0
aW5nIGFuIGluaXRpYWwgcGF0Y2gKICAgICAgICAgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBz
dXBwb3J0IGZvciBlYXJseSBwcmludGsiCiAgICAgICAgICBhbmQgb25seSBhZGRzIGEgc3VwcG9y
dC4KCiAgICBDaGFuZ2VzIGluIHY0OgogICAgICAgIC0gRHJvcCBTQ0lGKEEpIGZyb20gY29tbWVu
dHMKCiAgICBDaGFuZ2VzIGluIHY1OgogICAgICAgIC0gQ29zbWV0aWMgZml4ZXMgKGNvbW1lbnRz
IGluIGNvZGUpCi0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jIHwgNSArKysr
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyBiL3hlbi9hcmNoL2FybS9h
cm0zMi9kZWJ1Zy1zY2lmLmluYwppbmRleCA2ZjYwZTAxLi4zZjAxYzkwIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMy
L2RlYnVnLXNjaWYuaW5jCkBAIC0xLDcgKzEsNyBAQAogLyoKICAqIHhlbi9hcmNoL2FybS9hcm0z
Mi9kZWJ1Zy1zY2lmLmluYwogICoKLSAqIFNDSUYgc3BlY2lmaWMgZGVidWcgY29kZQorICogU0NJ
RihBKSBzcGVjaWZpYyBkZWJ1ZyBjb2RlCiAgKgogICogT2xla3NhbmRyIFR5c2hjaGVua28gPG9s
ZWtzYW5kci50eXNoY2hlbmtvQGdsb2JhbGxvZ2ljLmNvbT4KICAqIENvcHlyaWdodCAoQykgMjAx
NCwgR2xvYmFsbG9naWMuCkBAIC0yMiw2ICsyMiw5IEBACiAjaWZkZWYgRUFSTFlfUFJJTlRLX1ZF
UlNJT05fTk9ORQogI2RlZmluZSBTVEFUVVNfUkVHICAgIFNDSUZfU0NGU1IKICNkZWZpbmUgVFhf
RklGT19SRUcgICBTQ0lGX1NDRlREUgorI2VsaWYgRUFSTFlfUFJJTlRLX1ZFUlNJT05fQQorI2Rl
ZmluZSBTVEFUVVNfUkVHICAgIFNDSUZBX1NDQVNTUgorI2RlZmluZSBUWF9GSUZPX1JFRyAgIFND
SUZBX1NDQUZURFIKICNlbmRpZgogCiAvKgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
