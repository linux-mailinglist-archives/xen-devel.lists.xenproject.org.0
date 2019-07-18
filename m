Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3446CED4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6Me-0000Sg-0P; Thu, 18 Jul 2019 13:22:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho6Mc-0000Sb-JL
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:22:26 +0000
X-Inumbo-ID: 146277ad-a95f-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 146277ad-a95f-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:22:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s19so19195082lfb.9
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7m/GgGbcBwxytEnWBoO17ljV3UJjTksrTTrZgIt0kns=;
 b=VlEVQYtbx43EOqLGXQ/038avDBFhL4+dUHugQGpJad4FAUEdnV+gM5rZ7Ql+8kY7Ck
 yxWMuT6CPpjVMsebjFY/UbwmTZ7hXfEh2F++6lGQqaqNzmvZe1dWejHbOjfvLXg42jpX
 +QsBG+11XEzyuM+Dnq6H7WS1n7ck0tFWPZLGjagnnV0vAyizPb9xAmOAwpwFptUGiDba
 Fut7mvnRsVwVsfGa9RHYKsz3DYfsyobQ+nst5g0od00UaqmGdHUy/+hr1tUza/6YNpkJ
 SIcWFdXl/KIwun2C6TuOTIf9KgklISLdM3+5s4KcHRb884i3xsRbVA1ugHlKm4TKSsPn
 gjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7m/GgGbcBwxytEnWBoO17ljV3UJjTksrTTrZgIt0kns=;
 b=P5Art/9gazaIdZOub9CUooHLKhwCDYnD8rTzuqClWFk/cu+IZLAulv74VjT3oAp0ZJ
 vsIR1OqL3tEHMp8gMI4bm/WwRhD409vpjgcz/zGOKM7mUFys+EUcT4rl4wW6uSdsII1n
 o7TeuuUgWAwqepZaP2Idlsd4a9OtP41C0CqUcTtrOFz5F2IbRD89Gr4noFXjfQRk+TJh
 YdeUneo84F02utSKK3uq81hU+hyZeBOsgvW0IICASLUcSKCA2CS9O+rv8RMoSEb5HskO
 vzGX462xoRlTwaU3+R1/s1tru0wEXqwhpUHh6idxguV8Atgntgh7icTGIGUY8BN8HeSr
 2KOg==
X-Gm-Message-State: APjAAAUxZLboVOAO9eqst1VA33ZNxljsnzrPH8bsH+AbWCOzdezPlcu1
 hEEM7bS5B3xR5QRw9KsGYYw=
X-Google-Smtp-Source: APXvYqxR6L9y8nNjmItHucXOnimmgFwZuKxC14/4Hyx8HY5I2MjsFbAwTsMrNGP9gvOitUvPbMJUKw==
X-Received: by 2002:a19:7607:: with SMTP id c7mr21822391lff.28.1563456143412; 
 Thu, 18 Jul 2019 06:22:23 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id d4sm3966083lfi.91.2019.07.18.06.22.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 18 Jul 2019 06:22:22 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: 
Date: Thu, 18 Jul 2019 16:22:20 +0300
Message-Id: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address before
 unmap
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
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFmdGVyIGNoYW5n
ZXMgaW50cm9kdWNlZCBieSA5Y2MwNjE4IHdlIGFyZSBhYmxlIHRvIHZtYXAvdnVubWFwCnBhZ2Ug
YWxpZ25lZCBhZGRyZXNzZXMgb25seS4KU28gaWYgd2UgYWRkIGEgcGFnZSBhZGRyZXNzIHJlbWFp
bmRlciB0byB0aGUgbWFwcGVkIHZpcnR1YWwgYWRkcmVzcywKd2UgaGF2ZSB0byBtYXNrIGl0IG91
dCBiZWZvcmUgdW5tYXBwaW5nLgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKaW5k
ZXggODkwNDkzOS4uNmY0ODNiMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5j
CisrKyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYwpAQCAtNzUsNyArNzUsNyBAQCBzdGF0aWMg
Ym9vbCBjb3B5X2h5cF92ZWN0X2JwaSh1bnNpZ25lZCBpbnQgc2xvdCwgY29uc3QgY2hhciAqaHlw
X3ZlY19zdGFydCwKICAgICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoZHN0X3JlbWFwcGVkLCBWRUNU
T1JfVEFCTEVfU0laRSk7CiAgICAgaW52YWxpZGF0ZV9pY2FjaGUoKTsKIAotICAgIHZ1bm1hcChk
c3RfcmVtYXBwZWQpOworICAgIHZ1bm1hcCgodm9pZCAqKSgodmFkZHJfdClkc3RfcmVtYXBwZWQg
JiBQQUdFX01BU0spKTsKIAogICAgIHJldHVybiB0cnVlOwogfQotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
