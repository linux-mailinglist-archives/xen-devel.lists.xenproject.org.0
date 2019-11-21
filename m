Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71128105A01
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:54:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrXm-00077v-JZ; Thu, 21 Nov 2019 18:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXk-00077T-Gt
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:51:04 +0000
X-Inumbo-ID: d92cbae4-0c8f-11ea-984a-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d92cbae4-0c8f-11ea-984a-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z19so4949797wmk.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVP+NJX1jO0Cy8PowYlfCy2l9JmfmeIKdgyamebmLNw=;
 b=aAHIi/e5LtMoayj7tGilDgpdBQr4RlCktll+EQR43dc4AV4yygEVRZN6hkf9MWvf/j
 AzuSv3LbZ+i669P0aEvJ5hi23S1rkKUuLrlTQFNto+36213XX7J0d9gmsVqoj2kAjmGy
 WB58MYUmXmLDK4ToGP9mXxskvqQJ1pABDwoM+SrJOm2tfz/hg3yIVhuk7ZG/2cSdoDoc
 fRaEboUlycB0nuflMMaBBO3wRyjNZQq6fpBIKLwX5WQ+f4uDhqCOuo/3nczgb7A+lWuh
 7EkCdF+2J39iWza3y+wDceXQQe0tBmU74miU5pCeZMUTpvGXpKJxqm9rll3jMsckv3hD
 sAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AVP+NJX1jO0Cy8PowYlfCy2l9JmfmeIKdgyamebmLNw=;
 b=Jo9rKn1z7TA+9wHDzwbhX3fgDdCQ0UCdqUNsdLgAjK+ww0sJG7Dx7lzS4rLKGVq8df
 gIBEMo2Lof9UXMlQXGGjsmC4i7rhkUhCSq43xSeiLWhSj1meXKfCKiR1StTvSX8FsGto
 1kj/mFv5/Kcez9Eo/RxJnlZxkC5zOMMQ34xHNS1uuFASKPoHK82f5ACDTrpiUzohsRG7
 jh1em5orPS04xwM/OTC9QPwbXXZyDY+slzl6J1Mt4afevm0TVFCx47mAS+YzV7a1CLx+
 xPHapRqUQEQ9UroJwbka1EE3rZLIGBqJyKvzC7157A6KMIaU9jd8JD2o7yJK2+MySQ0u
 zgbw==
X-Gm-Message-State: APjAAAU1H9YKpgw8LnMVSHtZ9+d++4ScvErJYCQBMMcEW6c/K2j5sHUN
 s6E2mxB4yqidb41XnCPkh3YUGcojC73XJQ==
X-Google-Smtp-Source: APXvYqzCeoi4LGaaxplQwDkcNx2KLl9bSrOW3C4CPXLXFkT2mpp1d53NoMf88EclnsNVBawgA+L66w==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr11865344wml.102.1574362254710; 
 Thu, 21 Nov 2019 10:50:54 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:54 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:43 +0000
Message-Id: <20191121185049.16666-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/8] x86: add missing headers in hypercall.h
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBhc21fZGVmbnMuaCBiZWNhdXNlIEFTTV9DQUxMX0NPTlNUUkFJTlQgaXMgZGVmaW5l
ZCB0aGVyZS4KCkluY2x1ZGUgeGVuL2xpYi5oIGJlY2F1c2Ugd2UgbmVlZCBBU1NFUlRfVU5SRUFD
SEFCTEUuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxp
dXdlQG1pY3Jvc29mdC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
LS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJj
YWxsLmgKaW5kZXggZDU0ODgxNmIzMC4uZDBkMmY1MDIyZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVyY2FsbC5oCkBAIC0yMyw2ICsyMyw4IEBACiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMu
aD4KIAorI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KKwogI2luY2x1ZGUgPHB1YmxpYy94ZW4u
aD4KICNpbmNsdWRlIDxwdWJsaWMvc2NoZWQuaD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL2h2bV9v
cC5oPgpAQCAtMTgwLDYgKzE4Miw4IEBAIHN0YXRpYyBpbmxpbmUgbG9uZyB4ZW5faHlwZXJjYWxs
X3NldF9ldnRjaG5fdXBjYWxsX3ZlY3RvcigKIAogI2Vsc2UgLyogQ09ORklHX1hFTl9HVUVTVCAq
LwogCisjaW5jbHVkZSA8eGVuL2xpYi5oPgorCiAjaW5jbHVkZSA8cHVibGljL3NjaGVkLmg+CiAK
IHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5faHlwZXJjYWxsX2NvbnNvbGVfd3JpdGUoCi0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
