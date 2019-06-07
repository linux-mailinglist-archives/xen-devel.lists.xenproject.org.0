Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B2396B2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 22:20:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZLIK-0007jE-Rp; Fri, 07 Jun 2019 20:17:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ezar=UG=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hZLIJ-0007j9-W2
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 20:17:00 +0000
X-Inumbo-ID: 33d45f09-8961-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33d45f09-8961-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 20:16:58 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a93so1232564pla.7
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2019 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P+vzjtp1i44txySUhOSs0ClNAsx/SX8KzzDN/ABCcHA=;
 b=Rq4m8h4RliGU0ykVi+KjpYlzFaE5803cX8T9xqTIXcYqk4OZtC59Z/8LXeJ6kye7+q
 HtIFpQEBcVl0vL74ugArv64kgW1BcxaDeyETCidPjwOwuHWMzIU79JpOpM0tiBeM+OlM
 RhLQKpKyN86ZviftTZ8B2n4dcn7HpVX62XRx3yzBVCzwHymUvWqQHbGIO8hCy+kToxWZ
 7ED6NTWaTkhNoDIaGzqMLBX0tiDQcj6A3EbjTVqx7fk8p3D8BwJ3boFfzbYc0utqYYUL
 3tL2pgt1zDMSikLAdTa8Xrgvi/eVA56MWJeZAVDMuaPlJv9ITTzRsBXBqOJ2RpsD01kU
 uWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P+vzjtp1i44txySUhOSs0ClNAsx/SX8KzzDN/ABCcHA=;
 b=g+wJTbuTYA1T9lPOBeDfV2K+JbsuFbdstcoujekuiPnv1IElXQMIj9/oN2n0Mi6Vdy
 LYlSevDQgMHfASkxdzDAPd2x42RbEqUE3PLeMChunWBZgHo+Tc42YG66W39V18iReQ9g
 b90u+dl4DlVSe7Jg3aOasYg+muorZNxjGZGBEX1UNBGWub3qqQBlfOJkbh+6RDcLaWpS
 os6i5WBRTcrXPcrjVN5+ibws2wJrGhxFoZ3JceIrwur5MPMWr2rwR/npyAI26FS0vpw8
 XwwZQP39kdJDZWOGovaeNjs3ko0xyYK9+nNsHToiHeo58/zfnl9RM5nJzQ6pa4YJr3Wr
 /Vmg==
X-Gm-Message-State: APjAAAX/SlmfhsKNFqwGYCuK4ELF79TIiCnxuYMUAzxbaILwnoN5dclD
 ko7HyS6mx+IEMd6TPs4FFR6XDuE4
X-Google-Smtp-Source: APXvYqyhr83QMokrjPqmMVUNglnmoksowai/QwtttTkouYNjXvIXJRSHY9ZfREctTqg38/TBwZe9Qw==
X-Received: by 2002:a17:902:42a5:: with SMTP id
 h34mr20024752pld.16.1559938617704; 
 Fri, 07 Jun 2019 13:16:57 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.237])
 by smtp.gmail.com with ESMTPSA id a12sm4407502pgq.0.2019.06.07.13.16.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 07 Jun 2019 13:16:56 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sat,  8 Jun 2019 01:46:35 +0530
Message-Id: <1559938596-5696-2-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
Subject: [Xen-devel] [RFC PATCH 1/2] xen/arm: Add i.MX8MQ SoCs earlyprintk
 support
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 peng.fan@nxp.com, Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGVhcmx5cHJpbnRrIHN1cHBvcnQgZm9yIGkuTVg4TVEgU29DIGJhc2Vk
CmJvYXJkcy4KCkFzIHdpdGggbW9zdCBvZiBvdGhlciBkZWJ1ZyBjb2RlIGZvciBvdGhlciBwbGF0
Zm9ybXMsIHVhcnQgaXMKaW5pdGlhbGl6ZWQgYnkgYm9vdGxvYWRlcnMoZm9yIGluc3RhbmNlIHUt
Ym9vdFsxXSkuCgpbMV06aHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvYmxvYi9tYXN0
ZXIvZHJpdmVycy9zZXJpYWwvc2VyaWFsX214Yy5jI0wxNDEKClNpZ25lZC1vZmYtYnk6IEFtaXQg
U2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJt
NjQvZGVidWctaW14OG1xLmluYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteDhtcS5pbmMKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtNjQvZGVidWctaW14OG1xLmluYyBiL3hlbi9hcmNoL2FybS9hcm02NC9kZWJ1
Zy1pbXg4bXEuaW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmVjMzMxZGMK
LS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctaW14OG1xLmluYwpA
QCAtMCwwICsxLDU0IEBACisvKgorICogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteDhtcS5p
bmMKKyAqCisgKiBJTVg4TVEgc3BlY2lmaWMgZGVidWcgY29kZS4KKyAqCisgKiBDb3B5cmlnaHQg
KGMpIDIwMTksIEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4uCisgKgor
ICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vcgorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0
IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkg
b2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUgR05VCisgKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3Qs
IHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworI2RlZmluZSBVVFhE
ICAgICAgICAgICAgMHg0MAorI2RlZmluZSBVVFMgICAgICAgICAgICAgMHhiNAorI2RlZmluZSBV
VFNfVFhFTVBUWSAgICAgMzw8MQorCisubWFjcm8gZWFybHlfdWFydF9pbml0IHhiLCBjCisvKiBV
YXJ0IGhhcyBhbHJlYWR5IGJlZW4gaW5pdGlhbGl6ZWQgYnkgYm9vdGxvYWRlciBGaXJtd2FyZSwg
Zm9yIGluc3RhbmNlIGJ5IFRGLUEgKi8KKy5lbmRtCisKKy8qCisgKiBJTVg4TVEgVUFSVCB3YWl0
IFVBUlQgdG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKKyAqIHhiOiByZWdpc3RlciB3aGljaCBjb250
YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKKyAqIGM6IHNjcmF0Y2ggcmVnaXN0ZXIKKyAqLwor
Lm1hY3JvIGVhcmx5X3VhcnRfcmVhZHkgeGIgYworMToKKyAgICAgICAgbGRyICAgIHdcYywgW1x4
YiwgI1VUU10gICAgICAgIC8qIFVBUlQgVGVzdCBSZWdpc3RlciAqLworICAgICAgICB0YnogICAg
d1xjLCAjVVRTX1RYRU1QVFksIDFiICAgICAgIC8qIENoZWNrIFRYRU1QVFkgYml0ICovCisuZW5k
bQorCisvKgorICogSU1YOE1RIFVBUlQgdHJhbnNtaXQgY2hhcmFjdGVyCisgKiB4YjogcmVnaXN0
ZXIgd2hpY2ggY29udGFpbnMgdGhlIFVBUlQgYmFzZSBhZGRyZXNzCisgKiB3dDogcmVnaXN0ZXIg
d2hpY2ggY29udGFpbnMgdGhlIGNoYXJhY3RlciB0byB0cmFuc21pdAorICovCisubWFjcm8gZWFy
bHlfdWFydF90cmFuc21pdCB4YiB3dAorCXN0ciAgICBcd3QsIFtceGIsICNVVFhEXQorLmVuZG0K
KworLyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEFTTQorICogaW5kZW50LXRhYnMt
bW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
