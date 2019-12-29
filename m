Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6E12CA6C
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOa-000093-Bs; Sun, 29 Dec 2019 18:34:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOZ-00008S-58
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:31 +0000
X-Inumbo-ID: c84d13c0-2a69-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84d13c0-2a69-11ea-88e7-bc764e2007e4;
 Sun, 29 Dec 2019 18:34:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so30942958wrh.5
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PyVSClYu6+fDv7K0LaZ45jC77EsJu0qmCTArhICeFU=;
 b=mzo4iLLTUYldPFh730/DhrNjr8B9qAMIcr8unfvwQoC13MrSgRZ7ZFLrfQN6tJY2nw
 0wQLBgjuCYNzsIruWTDKu1wjy2UZ539FSM0YbXhKEcOC7bGlEBQz8iZVX84LxrrBMcqp
 5bpcFhpfbf1Lz4LrptPZQrcP+E1Ih2oQOaUR2gsIcxPJm7MkK6vI8LoAAaV5/oIa6TsD
 IoKA0+wkJmTXgbs0i39HYnQMGBKZVwlH/f3vkvIFiM6QXTnIvYm9OpWHn+vg5/cl/GkO
 fI86jdThY9wE7V8INb7BzkdvnWnljJLtf6BTAIVcN09kxqv80xDPmo6D6h0hXw+0ZJ1J
 ivpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1PyVSClYu6+fDv7K0LaZ45jC77EsJu0qmCTArhICeFU=;
 b=rV8LeepV+DkN13PSCQSKiCUnzqbtte+YrbYxzZFGc/X5aKEuSoIOwk7CxYCs8zEDeo
 UVvvPd7cbqdZ9kEKfUQdRTUjDvcSIEk9ZExsqVNc94zNbFb9x4xHLS/cGUfkmNDfGQ9f
 FDRrgaqtQUDbknSWkn4bT1FVbY7JFD7GtdVOrcC9a5vADPfDJ7UCoHFb0dXtp7HJzawC
 BHP2A+dNc2LfDmBZInu5W7JoV0koEG17OYIJTs9P8GOnHtfLGqAQBRHRKPxndyTdwSmy
 WrHEAVDZWp1bBzhpazFsVnG7IIifMTEFLJxkkksTbIlG7ubg2EBDkiSFf9Yw7Wjc2Fgm
 XbNw==
X-Gm-Message-State: APjAAAXqiMm6oks3cDemvS/Pp/KP2/N4mK/5pvkGE65CG9khWuAGTZvt
 jmbdVHF5iSsduG92O2nemxQPufa/xSs=
X-Google-Smtp-Source: APXvYqxjqzOJIVTIL9UaC91HvisLkiqlLpmaBAk4pcOLatt0n4Ua8s+HZiiNR8fBGNysQNzDiRfVIw==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr1352933wrv.250.1577644440417; 
 Sun, 29 Dec 2019 10:34:00 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:34:00 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:40 +0000
Message-Id: <20191229183341.14877-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 7/8] x86/hyperv: retrieve vp_index from Hyper-V
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
dC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyB8IDEyICsrKysr
KysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8ICAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
CmluZGV4IDY3NjY3OTM2ZTkuLmRhM2E4Y2Q4NWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYwpAQCAtMjksNiArMjksNyBAQCBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3Rs
eSBtc19oeXBlcnY7CiB2b2lkICpodl9oeXBlcmNhbGw7CiBzdGF0aWMgc3RydWN0IHBhZ2VfaW5m
byAqaHZfaHlwZXJjYWxsX3BhZ2U7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShzdHJ1Y3Qg
aHlwZXJ2X3BjcHVfcGFnZSwgaHZfcGNwdV9pbnB1dF9hcmcpOworREVGSU5FX1BFUl9DUFVfUkVB
RF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwogY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2lu
aXQgaHlwZXJ2X3Byb2JlKHZvaWQpCkBAIC0xMTUsMTUgKzExNiwyNiBAQCBzdGF0aWMgdm9pZCBz
ZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKICAgICB0aGlzX2NwdShodl9wY3B1X2lucHV0
X2FyZykubWFwcGluZyA9IG1hcHBpbmc7CiB9CiAKK3N0YXRpYyB2b2lkIHNldHVwX3ZwX2luZGV4
KHZvaWQpCit7CisgICAgdWludDY0X3QgdnBfaW5kZXhfbXNyOworCisgICAgcmRtc3JsKEhWX1g2
NF9NU1JfVlBfSU5ERVgsIHZwX2luZGV4X21zcik7CisKKyAgICB0aGlzX2NwdShodl92cF9pbmRl
eCkgPSB2cF9pbmRleF9tc3I7Cit9CisKIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQog
ewogICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKCk7CisgICAgc2V0dXBfdnBfaW5kZXgoKTsKIH0KIAogc3RhdGljIHZvaWQgYXBfc2V0dXAo
dm9pZCkKIHsKICAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKKyAgICBzZXR1cF92cF9p
bmRleCgpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCmluZGV4IDgzZjI5NzQ2OGYuLjRiNjM1ODI5ZjMg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaApAQCAtNzAsNiArNzAsNyBAQCBzdHJ1Y3Qg
aHlwZXJ2X3BjcHVfcGFnZSB7CiAgICAgdm9pZCAqbWFwcGluZzsKIH07CiBERUNMQVJFX1BFUl9D
UFUoc3RydWN0IGh5cGVydl9wY3B1X3BhZ2UsIGh2X3BjcHVfaW5wdXRfYXJnKTsKK0RFQ0xBUkVf
UEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3Jfb3BzICpoeXBlcnZfcHJvYmUodm9pZCk7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
