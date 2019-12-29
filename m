Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DF12CA76
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:37:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOB-0008OP-Ku; Sun, 29 Dec 2019 18:34:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOA-0008OC-3t
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:06 +0000
X-Inumbo-ID: c5bc2eb6-2a69-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5bc2eb6-2a69-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j42so30877131wrj.12
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+T4GPsHUk9nuxqbVFm0EUaUmXOk2IzXkX+VVh/krqzU=;
 b=OU+4AHjqz/NAKuZI3VYv8fyUs7tnmNWY1e9EXbF6UpTk/q2Kfpj269wnHzHBSi+Ov8
 ROJUPsowviVzxM2Pu3ThoKMOA60tSwm8xz1N5oby3XI3gx5viA4E+2eIYj52kFDDUs+M
 4p8bKS1wStvjFBb/EuIHUI6ozSo7zfsmAu5ULUytySrLLQyAVzzOx1GCBHp5+ONNut7b
 BnmveNOhkmTjWSIOgd17iBaZq9KSEfNXHzld1Pu0yp89owZmjYfLVqoWrbz7C9jxqd8A
 13mGnebQd84Cdeu5pUPBdpusgj+fGPAkcqUE/t4LGqD0/zvX4YXcsrBgrs1+NEjfJyow
 qE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+T4GPsHUk9nuxqbVFm0EUaUmXOk2IzXkX+VVh/krqzU=;
 b=pSEtyzsj/JH181F0SLHoBcV+lLp2bP4IzM7445regXASklLy/MXNAhrV/S+mGRu7BQ
 2pMNehYpEqSPTqWN5zbxJgI/bWxKCvm9jYRfZUpzhW+Xm9QipgyfwXm+XNVZfU7EIMhe
 CZK8oJo3kQSQr4HbIpfBu4uCaElOiXIKlgn8srVi+sWEuewcBFTMWX7R7jk5vwrU9k2A
 4G48jeu1duqZo2T9Sp+U/0rATv/6dK5MRPrbPv+NEo+nTgqICX6Gm9BGXDl8buPKXt8J
 5xdUydTAtM1avrJ70XE6f0dRRCfVTjTUEZWIqyAVscQ+6mzmf7PQJ2NnIpuatUdMknQ/
 xiTA==
X-Gm-Message-State: APjAAAXJTzEZn8pm19vVqGRhVkSJasjKx1/4ujW6TFmUcLrLuhDmM4mj
 PNXnRNM1t4+qAX51ZJ8MEux9cdmtJlQ=
X-Google-Smtp-Source: APXvYqw/YO/cDA3aZjfUEK+TEYTaZtNX+da0gMiZ1nJY681tg54LCSdhDnn212HH0uMckb6WNMu+Iw==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr59664807wri.95.1577644436007; 
 Sun, 29 Dec 2019 10:33:56 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:55 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:35 +0000
Message-Id: <20191229183341.14877-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/8] x86/hyperv: detect absolutely necessary MSRs
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

SWYgdGhleSBhcmUgbm90IGF2YWlsYWJsZSwgZGlzYWJsZSBIeXBlci1WIHJlbGF0ZWQgZmVhdHVy
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAxMSArKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwpp
bmRleCAyZTcwYjRhYTgyLi5jNmEyNmM1NDUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2
LmMKQEAgLTMyLDYgKzMyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBv
cHMgPSB7CiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUo
dm9pZCkKIHsKICAgICB1aW50MzJfdCBlYXgsIGVieCwgZWN4LCBlZHg7CisgICAgdWludDY0X3Qg
cmVxdWlyZWRfbXNycyA9IEhWX1g2NF9NU1JfSFlQRVJDQUxMX0FWQUlMQUJMRSB8CisgICAgICAg
IEhWX1g2NF9NU1JfVlBfSU5ERVhfQVZBSUxBQkxFOwogCiAgICAgY3B1aWQoMHg0MDAwMDAwMCwg
JmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CiAgICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkg
JiYgIC8qICJNaWNyIiAqLwpAQCAtNTcsNiArNTksMTUgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlz
b3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiAgICAgbXNfaHlwZXJ2Lm1heF92cF9p
bmRleCA9IGVheDsKICAgICBtc19oeXBlcnYubWF4X2xwX2luZGV4ID0gZWJ4OwogCisgICAgaWYg
KCAobXNfaHlwZXJ2LmZlYXR1cmVzICYgcmVxdWlyZWRfbXNycykgIT0gcmVxdWlyZWRfbXNycyAp
CisgICAgeworICAgICAgICAvKiBPb3BzLCByZXF1aXJlZCBNU1JzIGFyZSBub3QgYXZhaWxhYmxl
LiBUcmVhdCB0aGlzIGFzCisgICAgICAgICAqICJIeXBlci1WIGlzIG5vdCBhdmFpbGFibGUiLgor
ICAgICAgICAgKi8KKyAgICAgICAgbWVtc2V0KCZtc19oeXBlcnYsIDAsIHNpemVvZihtc19oeXBl
cnYpKTsKKyAgICAgICAgcmV0dXJuIE5VTEw7CisgICAgfQorCiAgICAgcmV0dXJuICZvcHM7CiB9
CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
