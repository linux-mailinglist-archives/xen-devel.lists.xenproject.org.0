Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C112FA1B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:11:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPW2-0005e1-Kl; Fri, 03 Jan 2020 16:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPW0-0005cS-Lv
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:32 +0000
X-Inumbo-ID: 5ce7faea-2e43-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ce7faea-2e43-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id f129so9033350wmf.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMFPYGrcm7BM/XK1EMrwljwKrMIeS9V+k4JmcGsTosc=;
 b=M7QorUtbzSu5vyn70UvJR7qvQ3056ecP9mQDPqnTvieFdUEipkc8BzYae6CM5fMgYR
 r0rx2pqX7OgDWHxukofI48aJt/s29s2AluJP8hJcD1EjOuT/y+qcDc6ubE3JsGARF0ks
 j3QxPAvsmUt624E4sCjyGtQkX/YhrzEooJCL/eh/l9ZO0y79N5e7DR4MGUTf3fiHu9ko
 ZHkfpK1HWLw+2dhziymQ5IYIAkeAHXfCKKYAsE/c/1lUWLGV8EeStwsmc2YAZCNA9quz
 1/3LQMcW8KwzzeagqTasNnvyVpJ/kNhL0QCS+izN3bs0UU63N9vfmCspVZFPa65wlKQz
 LBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LMFPYGrcm7BM/XK1EMrwljwKrMIeS9V+k4JmcGsTosc=;
 b=fWgRel29kGTN9UfN20Qo8/xPWcYmyXc4FIwFDBO3w74hs8F/KsmN3woc/LiKO1rHcd
 ur+hAD+tSmZNJe2kx/KWpLok3cTqZ27Ejn8/YVNMi/kRphnkr7bB/ZIE2MxKw3G9vMlU
 4yZ7GICTBcBL1KLIgCHSijPyAK9YZw6vQXBgqh557ojg3ZfrY3Y8qT7E0Yt4mfzdIIFs
 IjZzf2FiTo75GDcsP0O3uP4gd6Hf3BTO59iLCqsN+zGhL5XNm21/tSvkEHxoKTx55JcP
 n5BRT+uuI4UUbnzCy2Wwo83zd98ynijpk0hAJ4ks/EiH6Mu0r/tpskRXKzKZ0Aan4z1I
 Wyng==
X-Gm-Message-State: APjAAAVuauRXuOoNV2ufgaoLqd9u3puowECvC3S++Z9xtt+yWUNResUS
 0HGjpBKLDDiKrS1Sddq4ZcBFAj+3+KL02g==
X-Google-Smtp-Source: APXvYqwbmx3bwNOOo/1sV5t8b4Apt1cPAv+VYMDE0eRYPgCRC1vooxFDz8tYUy6sNtuRw7ttVlMrMw==
X-Received: by 2002:a05:600c:23c9:: with SMTP id
 p9mr20631914wmb.160.1578067744026; 
 Fri, 03 Jan 2020 08:09:04 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:09:02 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:24 +0000
Message-Id: <20200103160825.19377-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 7/8] x86/hyperv: retrieve vp_index from
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
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggMDMwMjdiZDQ1My4uNWM1
YWVkNDZjYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwor
KysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0yOCw2ICsyOCw3IEBA
IHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIAogZXh0ZXJu
IGNoYXIgaHZfaHlwZXJjYWxsX3BhZ2VbXTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0
cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0X2FyZyk7CitERUZJTkVfUEVSX0NQ
VV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHM7CiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
Kl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKQEAgLTg5LDYgKzkwLDcgQEAgc3RhdGljIHZvaWQg
c2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7
CiAgICAgdm9pZCAqbWFwcGluZzsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nv
cl9pZCgpOworICAgIHVpbnQ2NF90IHZwX2luZGV4X21zcjsKIAogICAgIHBnID0gYWxsb2NfZG9t
aGVhcF9wYWdlKE5VTEwsIDApOwogICAgIGlmICggIXBnICkKQEAgLTEwMCw2ICsxMDIsOSBAQCBz
dGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKIAogICAgIHRoaXNfY3B1
KGh2X3BjcHVfaW5wdXRfYXJnKS5tYWRkciA9IHBhZ2VfdG9fbWFkZHIocGcpOwogICAgIHRoaXNf
Y3B1KGh2X3BjcHVfaW5wdXRfYXJnKS5tYXBwaW5nID0gbWFwcGluZzsKKworICAgIHJkbXNybChI
Vl9YNjRfTVNSX1ZQX0lOREVYLCB2cF9pbmRleF9tc3IpOworICAgIHRoaXNfY3B1KGh2X3ZwX2lu
ZGV4KSA9IHZwX2luZGV4X21zcjsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQp
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAppbmRleCA4M2YyOTc0NjhmLi40YjYzNTgyOWYz
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTcwLDYgKzcwLDcgQEAgc3RydWN0
IGh5cGVydl9wY3B1X3BhZ2UgewogICAgIHZvaWQgKm1hcHBpbmc7CiB9OwogREVDTEFSRV9QRVJf
Q1BVKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0X2FyZyk7CitERUNMQVJF
X1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIGNvbnN0IHN0cnVjdCBoeXBl
cnZpc29yX29wcyAqaHlwZXJ2X3Byb2JlKHZvaWQpOwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
