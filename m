Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECC12CA75
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:37:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOL-0008R9-7r; Sun, 29 Dec 2019 18:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOK-0008Qq-43
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:16 +0000
X-Inumbo-ID: c6ba7d36-2a69-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6ba7d36-2a69-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so12582604wmi.5
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUTd1JvE33R5YeeJoO6ibJUr87M2fq2cnap5F1T4Coo=;
 b=Wm0uGfM6hWk8ZafajtIAZFnjIh6xQ1k4yOyITXMZLz1rWcp7VujvIHAiyj+Zlvh8PA
 x8um2YQWFzgbKiQsD89HIdzqWuRYu+2mLkwMNPmt8u74DbLJcyVYVtV+aRuy5PPHPyYX
 xDjts14mKc2dtohOz5TRSyvcpc+oIu1mCqSaLpu7CCxzMqiWk6iaGxs7c4paIc+2iIZS
 OoEOqYF7C+qg8Py2/GHARXGErInL+YJroGTmL3xBZVwuMnBqn2bWPejpVMMtEEhsXLBg
 FZYh4QlPZF6Eucdo0yC5AFTAGKTnJGp+K8Zcd5bTUIj0WNsgEivwlU1JzTj6FsxCfB56
 uv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yUTd1JvE33R5YeeJoO6ibJUr87M2fq2cnap5F1T4Coo=;
 b=TBrwjfdt/BC4APCbb9Gs1xYxF2AUhklSQNA+u2FBKWbHymjHMQLGbNvdd1AW095txT
 lF2aw5uMMMqvYPEULoAWAlQKLm87m8D93T5hvO7QqdGtI/Zqadu3Faal0kVPaoJtxEOi
 bwQSf1icDMNGoZ/1YX7REBuCmtxZ3+T1P3g6wvUY7osmvCm7Qnzv7T/08OqDbYrDxp9d
 Oag0HalVAUPg4YYTiNrkienQjlEhO6HMf4R2zwRSorEbSVTBSM0D5Nkoc5eju61TYJGQ
 Vnz7aiTRN4OFbviNdgRkYbXSU0BuqzSUadz0TpLSyJpFwEo1iiBhLXBBgCSXuGW+7Kiv
 zSfg==
X-Gm-Message-State: APjAAAXkgwt1xpTXRzwatB2RcIsmdC6OES0BPpReL77Pm61fOZ8KYl/w
 rwKvBJdJ6J5CHKBr7y/Ov7s222JCCH0=
X-Google-Smtp-Source: APXvYqxvZHLSgFp1w4L8h63Ft9w6NohjU7jzmD9SL+fwvxhj1RPLSp7MME6k71NQVXZLFxYklWeFpQ==
X-Received: by 2002:a1c:3189:: with SMTP id x131mr28988125wmx.59.1577644437764; 
 Sun, 29 Dec 2019 10:33:57 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:57 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:37 +0000
Message-Id: <20191229183341.14877-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/8] x86/hyperv: setup hypercall page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCBjNmEyNmM1NDUzLi40Mzg5MTBjOGNi
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTE5LDE2ICsxOSwxNyBAQAogICog
Q29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KICAqLwogI2luY2x1ZGUgPHhlbi9pbml0Lmg+
CisjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+CiAKICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4K
ICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KIAogc3RydWN0IG1zX2h5cGVydl9p
bmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3Jfb3BzIG9wcyA9IHsKLSAgICAubmFtZSA9ICJIeXBlci1WIiwKLX07Cit2b2lkICpodl9o
eXBlcmNhbGw7CitzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqaHZfaHlwZXJjYWxsX3BhZ2U7CiAK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwogY29uc3Qgc3RydWN0IGh5
cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiB7CiAgICAgdWludDMyX3Qg
ZWF4LCBlYngsIGVjeCwgZWR4OwpAQCAtNzEsNiArNzIsNDAgQEAgY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiAgICAgcmV0dXJuICZvcHM7CiB9
CiAKK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQoreworICAg
IHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2NvbnRlbnRzIGh5cGVyY2FsbF9tc3I7CisKKyAg
ICAvKiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzbid0IGEgcmVhbGx5IGdvb2Qgd2F5IHRvIHVud2lu
ZCBYZW4gdG8KKyAgICAgKiBub3QgdXNlIEh5cGVyLVYgaG9va3MsIHNvIHBhbmljIGlmIGFueXRo
aW5nIGdvZXMgd3JvbmcuCisgICAgICoKKyAgICAgKiBJbiBwcmFjdGljZSBpZiBwYWdlIGFsbG9j
YXRpb24gZmFpbHMgdGhpcyBlYXJseSBvbiBpdCBpcworICAgICAqIHVubGlrZWx5IHdlIGNhbiBn
ZXQgYSB3b3JraW5nIHN5c3RlbSBsYXRlci4KKyAgICAgKi8KKyAgICBodl9oeXBlcmNhbGxfcGFn
ZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsKKyAgICBpZiAoICFodl9oeXBlcmNhbGxf
cGFnZSApCisgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgSHlwZXItViBoeXBlcmNh
bGwgcGFnZVxuIik7CisKKyAgICBodl9oeXBlcmNhbGwgPSBfX21hcF9kb21haW5fcGFnZV9nbG9i
YWwoaHZfaHlwZXJjYWxsX3BhZ2UpOworICAgIGlmICggIWh2X2h5cGVyY2FsbCApCisgICAgICAg
IHBhbmljKCJGYWlsZWQgdG8gbWFwIEh5cGVyLVYgaHlwZXJjYWxsIHBhZ2VcbiIpOworCisgICAg
cmRtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cisg
ICAgaHlwZXJjYWxsX21zci5lbmFibGUgPSAxOworICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5
c2ljYWxfYWRkcmVzcyA9IHBhZ2VfdG9fbWFkZHIoaHZfaHlwZXJjYWxsX3BhZ2UpOworICAgIHdy
bXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOworfQor
CitzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKK3sKKyAgICBzZXR1cF9oeXBlcmNhbGxf
cGFnZSgpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsK
KyAgICAubmFtZSA9ICJIeXBlci1WIiwKKyAgICAuc2V0dXAgPSBzZXR1cCwKK307CisKIC8qCiAg
KiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
