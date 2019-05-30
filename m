Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0EA2FB70
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 14:08:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWJlV-0001BX-Vd; Thu, 30 May 2019 12:02:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWJlU-0001BS-7I
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 12:02:36 +0000
X-Inumbo-ID: ce7945b6-82d2-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce7945b6-82d2-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 12:02:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z5so5755975lji.10
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yimbX/waU4vBtbed2XD5duM6pcFCvwAOvSV/8eaI0TE=;
 b=t5fRxok8YAs7LqQbcscXsR9DmwDagC4w6ITcPyrmeZjgJf03k7FbrT9BH/MFJ8B5ZQ
 LLfaLpxhW3zeB1F6KN+F1kH5VE24c3BzKrp/2eTXWxJ9ADPhRULDPP3FFVYRMkZQLsSg
 cTr0FwBPi8wQzKs4Bs4FC9gnDy5MjZX/+hBU5eePLjXc6fUyEx1sqUxtzZLF7ezngtlH
 vBO1n4Wgh/W1cLNzTnXXcDKxSJIrWF8wrWxreO30h6EP0NGBSJls8kqkmRMg2/3neWj1
 Wz/Y52z7HlL4kBeLQIAjOd7dlIHk0QHm+esOtuz6/GPDj8wbjklBTT4G+n5AzhESMsN4
 3GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yimbX/waU4vBtbed2XD5duM6pcFCvwAOvSV/8eaI0TE=;
 b=oqE+UxqqjcXadnnsedbn+m7JYXYxW/QwrPQK7JfwybUc1VY41UHl5Z041i5Jsn/9N1
 ulbVZhUpmKLqsuqzCnmK8MUH6mdjSQ1biVA1TUoDA9EfcrXDBCaUDOTUdQdxEKpH2C3d
 o2qFIkwGbZTKPsf2HOYmHbUwZqLyA6YVu4hOa2KOChiBLAYgD0gjqgHtsKjoLwO3jCep
 AkU8ZRTmwQeOx0x/h7URMjBte7pLJSK7r+fEX0HIuA/ZGymzBRXO/GQpN/pQks2WyhSP
 x6mMmLe2+Qds70ckLga3peRF4/y2dY94z5NzjGXYn80B+bsyZn3Ag+/gEB6XHEHOpKH8
 CdJA==
X-Gm-Message-State: APjAAAXys6PScsnd/98194DvGg0t0CTsjR4n9eFecl6BRweu1wjhJcWP
 IhogoC0ivwyEb7Aiejkjhq1VAiHQgkI=
X-Google-Smtp-Source: APXvYqxdUd2zF0XRMOAGXCa1CmYeiIzB1HE+nlXwSek0jtzMfxUCqUnlQTmRL5kVPJ9o3jDvHtkw2Q==
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr1960876lji.189.1559217751846; 
 Thu, 30 May 2019 05:02:31 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u10sm504526lfu.18.2019.05.30.05.02.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 30 May 2019 05:02:30 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 May 2019 15:02:28 +0300
Message-Id: <1559217748-25426-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] iommu/arm: add missing return
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSW4gY2FzZSBpb21tdV9vcHMgaGF2ZSBiZWVuIGFscmVhZHkgc2V0LCB3ZSBzaG91bGQgbm90
IHVwZGF0ZSBpdC4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5k
cmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCgpUaGlzIHBhdGNoIGlzIGV4dHJhY3RlZCBmcm9tIFsx
XSwgYXMgYWdyZWVkIGhlcmUgWzJdLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wMS9tc2cwMTY1OC5odG1sClsyXSBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDEvbXNn
MDE4NTkuaHRtbAoKLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaW9tbXUuYwppbmRleCAzMjU5OTdiLi4yMTM1MjMzIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaW9tbXUuYwpAQCAtMzIsNyArMzIsMTAgQEAgdm9pZCBfX2luaXQgaW9tbXVfc2V0X29wcyhj
b25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMpCiAgICAgQlVHX09OKG9wcyA9PSBOVUxMKTsKIAog
ICAgIGlmICggaW9tbXVfb3BzICYmIGlvbW11X29wcyAhPSBvcHMgKQorICAgIHsKICAgICAgICAg
cHJpbnRrKCJXQVJOSU5HOiBDYW5ub3Qgc2V0IElPTU1VIG9wcywgYWxyZWFkeSBzZXQgdG8gYSBk
aWZmZXJlbnQgdmFsdWVcbiIpOworICAgICAgICByZXR1cm47CisgICAgfQogCiAgICAgaW9tbXVf
b3BzID0gb3BzOwogfQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
