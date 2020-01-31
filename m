Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6614F1AB
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:53:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaR6-0006x7-69; Fri, 31 Jan 2020 17:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaR4-0006wI-KN
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:50:30 +0000
X-Inumbo-ID: 12b1f2da-4452-11ea-8396-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12b1f2da-4452-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so8902714wmc.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vy9AWRylVtxfszYTddrOD3+jUXhfGQub8qRdwfYuTdM=;
 b=rR5jsUWmwjjsnF9BNLaWUKX9rigXWx5G6apWUExUc1FFOEz+NbysHxMHVBvS04pyqj
 iy1TGgAAOAVoGyPVZytDm8WIYLxeq/tvpP0NwiI7p095uTbJe9MAAmgqpPVhvclNxHAW
 FOsp4lLK/0UkqxNT9Zq8llT6h8qD946dLN0Vcb24hJufQF/8KGDY/g/0RGk8P1z+XNcK
 IwSwi4wsX+TFwzOVHMJuM7WhjM9lFMU5R+pRnreAa1nhzOb+j9fh+znZq0Gb6HIH/r3y
 A/GJJ4wRCFxxK4ALrl7Q2Xl9pEanz9ISC8hCLL1at1mcObtf22Er5ZjgmLKMT1328ezP
 WNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vy9AWRylVtxfszYTddrOD3+jUXhfGQub8qRdwfYuTdM=;
 b=Uw+f9DnsYdet20yrHIV9yY68b98/pdUV7ZiiU1o96+YzJqYkTsa9kUuc5+lXYB47Yq
 exlmCo7JwOIwif6j2Q8WVP4J2O6bk5DX1w0LXrdCXrppCuOP6JuwyFXNkgT9ui6HSU67
 Mc+75AJSWH3Ve1GIOH67POMiwyBK1iRNVLAveetXA12yqatj8Hhj4dlZaaBTdeVuisGz
 hl/Waxj4dXCcL7L9Zz5KaHHVyFWaSlaBagGBOq9RgNYiO7p1U0tyc81NwN67l2usmYZq
 Uutho7ZLlSFgI6wxjT+CWf3arIgq78WogNId2f+3/qZaiMSMCdtq9F/ebt3Viy7VxnXj
 KypA==
X-Gm-Message-State: APjAAAUkh3zZ8G1gy7hg7dnebtlCAjq5MPS2mVokBpEBRiE4cHjYFByL
 4k6/80hrtvV+GWPCZErGyoV5gzX93W8=
X-Google-Smtp-Source: APXvYqxGy1QlNh80bg5rvDBThIbT7nsdaNrtcc1XbDnG/4Eejrnx40obUHcs1xRJKJDbZvNYv/+p2g==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr13588770wmk.34.1580492986996; 
 Fri, 31 Jan 2020 09:49:46 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:46 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:30 +0000
Message-Id: <20200131174930.31045-12-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 11/11] x86/hyperv: setup VP assist page
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4gaXQKZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KdjY6CjEuIFVzZSBo
dl92cF9hc3Npc3RfcGFnZV9tc3IKMi4gTWFrZSBjb2RlIHNob3J0ZXIKMy4gUHJlc2VydmUgcnN2
ZFAgZmllbGRzCgp2NToKMS4gRGVhbCB3aXRoIGVycm9yIHByb3Blcmx5IGluc3RlYWQgb2YgYWx3
YXlzIHBhbmlja2luZwoyLiBTd2FwIHBlcmNwdSB2YXJpYWJsZXMgZGVjbGFyYXRpb25zJyBsb2Nh
dGlvbgoKdjQ6CjEuIFVzZSBwcml2YXRlLmgKMi4gUHJldmVudCBsZWFrCgp2MzoKMS4gVXNlIHhl
bmhlYXAgcGFnZQoyLiBEcm9wIHNldF92cF9hc3Npc3QKCnYyOgoxLiBVc2UgSFZfSFlQX1BBR0Vf
U0hJRlQgaW5zdGVhZAotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwg
MzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvcHJpdmF0ZS5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggNmRhYzNiZmNl
Yi4uNzVmYjMyOWQ0ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0zMSw2ICsz
MSw3IEBACiAKIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsK
IERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfaW5wdXRfcGFnZSk7CitERUZJ
TkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7CiBERUZJTkVfUEVS
X0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogc3RhdGljIHVp
bnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCkBAIC0xNTUsMTcgKzE1Niw1MSBAQCBzdGF0
aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQogICAgIHJldHVybiAwOwogfQog
CitzdGF0aWMgaW50IHNldHVwX3ZwX2Fzc2lzdCh2b2lkKQoreworICAgIHVuaW9uIGh2X3ZwX2Fz
c2lzdF9wYWdlX21zciBtc3I7CisKKyAgICBpZiAoICF0aGlzX2NwdShodl92cF9hc3Npc3QpICkK
KyAgICB7CisgICAgICAgIHRoaXNfY3B1KGh2X3ZwX2Fzc2lzdCkgPSBhbGxvY194ZW5oZWFwX3Bh
Z2UoKTsKKyAgICAgICAgaWYgKCAhdGhpc19jcHUoaHZfdnBfYXNzaXN0KSApCisgICAgICAgIHsK
KyAgICAgICAgICAgIHByaW50aygiQ1BVJXU6IEZhaWxlZCB0byBhbGxvY2F0ZSB2cF9hc3Npc3Qg
cGFnZVxuIiwKKyAgICAgICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOworICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgIH0KKworICAgICAgICBjbGVhcl9wYWdlKHRo
aXNfY3B1KGh2X3ZwX2Fzc2lzdCkpOworICAgIH0KKworICAgIHJkbXNybChIVl9YNjRfTVNSX1ZQ
X0FTU0lTVF9QQUdFLCBtc3IucmF3KTsKKyAgICBtc3IucGZuID0gdmlydF90b19tZm4odGhpc19j
cHUoaHZfdnBfYXNzaXN0KSk7CisgICAgbXNyLmVuYWJsZWQgPSAxOworICAgIHdybXNybChIVl9Y
NjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCBtc3IucmF3KTsKKworICAgIHJldHVybiAwOworfQorCiBz
dGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKIHsKICAgICBzZXR1cF9oeXBlcmNhbGxfcGFn
ZSgpOwogCiAgICAgaWYgKCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKSApCiAgICAgICAgIHBh
bmljKCJIeXBlci1WIGh5cGVyY2FsbCBwZXJjcHUgYXJnIHNldHVwIGZhaWxlZFxuIik7CisKKyAg
ICBpZiAoIHNldHVwX3ZwX2Fzc2lzdCgpICkKKyAgICAgICAgcGFuaWMoIlZQIGFzc2lzdCBwYWdl
IHNldHVwIGZhaWxlZFxuIik7CiB9CiAKIHN0YXRpYyBpbnQgYXBfc2V0dXAodm9pZCkKIHsKLSAg
ICByZXR1cm4gc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7CisgICAgaW50IHJjOworCisgICAg
cmMgPSBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKKyAgICBpZiAoIHJjICkKKyAgICAgICAg
cmV0dXJuIHJjOworCisgICAgcmV0dXJuIHNldHVwX3ZwX2Fzc2lzdCgpOwogfQogCiBzdGF0aWMg
dm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9wcml2YXRlLmgKaW5kZXggZDE3NjVkNGYyMy4uOTU2ZWZmODMxZiAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlIDx4ZW4v
cGVyY3B1Lmg+CiAKIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOworREVD
TEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKIERFQ0xBUkVfUEVSX0NQVSh1bnNp
Z25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogI2VuZGlmIC8qIF9fWEVOX0hZUEVSVl9QUklWSUFU
RV9IX18gICovCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
