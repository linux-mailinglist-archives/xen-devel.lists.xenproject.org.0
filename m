Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB7E13093A
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:50:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94u-0003nz-Ba; Sun, 05 Jan 2020 16:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94t-0003nm-Hm
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:35 +0000
X-Inumbo-ID: 2c464d4e-2fdb-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c464d4e-2fdb-11ea-a1e1-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so12670468wmb.0
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WF8WbKtTBhS4BHGj5cB1aEH2QagI1ZAGsiQPgtzAOMw=;
 b=Pecq2HSHZroLPuNAiwy0aVovMUhQaNl5eW+t42s/BKtCEhQwadEAeik73V656FJISM
 XLkPanOOEV0CiZb26QWdY0+zcVgcladeC3NK+GaKxAaOxYpzmZEIvKwXtjDU5Dx4uOXy
 o/I5YPPMP/AM2vi8LO13kXcprpnlo8xFd1g78D0P9TB1PaNasF8k1XKihI269+OSsJd8
 93EzXkIdz6hI5jeWPlRJhqpMWsSD+RJr6JxfST2rWEoG8V3skkHeFl2DNCLworzkD8UT
 BUJP0bG0pgtYyWwYtlFQpAJgCy/ksd+oQjOc+Vdc+alZVVIKwSOmANB5YFiCWG5+heH7
 w1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WF8WbKtTBhS4BHGj5cB1aEH2QagI1ZAGsiQPgtzAOMw=;
 b=YCZoyflbz/kdu+vJgzfwUO84iLQJIZq9cxOlPo7yCGhURuogKp7imVtT9fXjPS1lBe
 6aABKWE3U8UQkQB1cPWxwQ+qiTZe34L9Luao4tEETRIX9FwP0eun4f2Dxg3aABHVZM34
 N/uQ77qEwcEEzBmV8Uf6Uuu2EaAd69VriqTJKxEA/mdYXhITDg6YIpsEGRE2EFMM0qii
 qM/UMdp4wFLEl08nJ5d+MutSbgIGqGFg/FQpTadHCGlIczuf4Zm+4puBtZ7EAboAS1Gi
 fws2b/5K2A9oEvGXK3mpbqPgqpWYIx1TX+vS4cVsM0++5L+H18ZS8nx7PCMMDT6VZKaA
 tElg==
X-Gm-Message-State: APjAAAXTah0dU8W6egmB4eu1z6LKf0qDnKJIgexJzZuO3YA8oXOuxz2u
 7Iyp9jRWs5H+w3XmFaY3t/3mYKzL2y4=
X-Google-Smtp-Source: APXvYqx2DIQd26D44159xlchspxu/nXkZ5hTAc6k5+voMv2DpaDhI7uHFedu6PAXTvCWdOovCKxaqA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr32371711wmi.101.1578242897110; 
 Sun, 05 Jan 2020 08:48:17 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:16 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:48:00 +0000
Message-Id: <20200105164801.26278-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200105164801.26278-1-liuwe@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/5] x86/hyperv: retrieve vp_index from
 Hyper-V
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

VGhpcyB3aWxsIGJlIHVzZWZ1bCB3aGVuIGludm9raW5nIGh5cGVyY2FsbCB0aGF0IHRhcmdldHMg
c3BlY2lmaWMKdmNwdShzKS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+Ci0tLQp2MjoKMS4gRm9sZCBpbnRvIHNldHVwX3BjcHVfYXJnIGZ1bmN0aW9uCi0tLQog
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyB8IDUgKysrKysKIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggN2UwNDZkZmMwNC4uZTVm
MjU4Yzk0NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwor
KysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0yOCw2ICsyOCw3IEBA
IHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIAogZXh0ZXJu
IGNoYXIgaHZfaHlwZXJjYWxsX3BhZ2VbXTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZv
aWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5z
aWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgb3BzOwogY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3By
b2JlKHZvaWQpCkBAIC04Nyw2ICs4OCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBl
cmNhbGxfcGFnZSh2b2lkKQogc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZv
aWQpCiB7CiAgICAgdm9pZCAqbWFwcGluZzsKKyAgICB1aW50NjRfdCB2cF9pbmRleF9tc3I7CiAK
ICAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CiAgICAgaWYgKCAhbWFwcGluZyAp
CkBAIC05NCw2ICs5Niw5IEBAIHN0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2
b2lkKQogICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwogCiAgICAgdGhpc19jcHUo
aHZfcGNwdV9pbnB1dF9hcmcpID0gbWFwcGluZzsKKworICAgIHJkbXNybChIVl9YNjRfTVNSX1ZQ
X0lOREVYLCB2cF9pbmRleF9tc3IpOworICAgIHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZwX2lu
ZGV4X21zcjsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnYuaAppbmRleCA2Y2YyZWFiNjJmLi5iYWUwNmM4YTNhIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTY2LDYgKzY2LDcgQEAgc3RydWN0IG1zX2h5cGVydl9p
bmZvIHsKIGV4dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OwogCiBERUNMQVJF
X1BFUl9DUFUodm9pZCAqLCBodl9wY3B1X2lucHV0X2FyZyk7CitERUNMQVJFX1BFUl9DUFUodW5z
aWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAq
aHlwZXJ2X3Byb2JlKHZvaWQpOwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
