Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C512FA25
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:12:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVc-0005Rk-Rt; Fri, 03 Jan 2020 16:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVb-0005RW-KW
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:07 +0000
X-Inumbo-ID: 5939d5d0-2e43-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5939d5d0-2e43-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:08:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y17so42927624wrh.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOdhYFEVelSK6Ytux96+pcbc6B3h71rDSrm39/P7N80=;
 b=RQoC+pso/dCEYUaDHg9flDKa37SjRprUJMgemtpKRxCsPrvxs9iJkn7WeC7HPW0Ylv
 ctfJD4pZLNqk8J7cnwGjzIhrTxkvNvkpCI6qfv3noYM21lC3ah0jlh9Pu8LzgaEo9OCI
 R4fV0hlpTKt07b58i16PSq/+49RFYSIBEhZgjwW/45syTKuV/Uj0O60/HLaOpTYxY8Nl
 ZaNl66pPGp+mdqB4o9WMNzEIQZXuEnuKjTfV6hOTTAQddUrTvg75IueLOlm22Yqkte1F
 rZvrmpjoC+fm4z0BkHdj66WPLdYU/LEpPwYOMzElxnsLyht8XbA4d3xAQlarb6O9QSx7
 kJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lOdhYFEVelSK6Ytux96+pcbc6B3h71rDSrm39/P7N80=;
 b=IzKTxuluHu1IaPwIfVz5S0B0OLlh17gULalhXUtTbp7BKyLhI/aEyTbVaG+V1+8QUG
 pdVJ50UStmUB9qjXIe4IJona4lnZ5WAuhhxiWbOo+VSzIUQcR75rdSnryBNypzfyDQvj
 +7TkqA63e4OYcuDNtnY5vS+k5ebpdyrqVYR3qMeAKFct2GQ+tnZIdMARmb2zOI07ow3j
 WrsSiT5u3qC85/JcUMXH6DEEtxmSbytYAOWF9tYBMOK4qGO62mk4aqCJLRPHGpnwPQCv
 GhrzFDk0zS8H+RjeYgY0HcB5t1j/hrAy3t4ZV3LAiGQg3Ox+WJw3tCc7JXzGnfUT2bjr
 ByzA==
X-Gm-Message-State: APjAAAXe085P6ZdNT/jZsM0zglcuhjsWOcAwJh5jclWmTzImnquXVxGA
 0fMmLTcIhhkGf1H5FErP0IFD2zVIERIRFQ==
X-Google-Smtp-Source: APXvYqwdsSwb9hd2N7DiC6+ZLYhBc1aNVFNbCK+TvaRkPAFWFvi8P4cLv1psIRtr5DGKdEpmHEKg5w==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr87620646wrl.190.1578067737706; 
 Fri, 03 Jan 2020 08:08:57 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:08:57 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:19 +0000
Message-Id: <20200103160825.19377-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/8] x86/hyperv: detect absolutely necessary
 MSRs
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
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KdjI6
CjEuIEZpeCBjb21tZW50IHN0eWxlCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCAyZTcwYjRhYTgyLi44ZDM4MzEzZDdh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTMyLDYgKzMyLDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKIHsKICAgICB1aW50MzJfdCBlYXgs
IGVieCwgZWN4LCBlZHg7CisgICAgdWludDY0X3QgcmVxdWlyZWRfbXNycyA9IEhWX1g2NF9NU1Jf
SFlQRVJDQUxMX0FWQUlMQUJMRSB8CisgICAgICAgIEhWX1g2NF9NU1JfVlBfSU5ERVhfQVZBSUxB
QkxFOwogCiAgICAgY3B1aWQoMHg0MDAwMDAwMCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CiAg
ICAgaWYgKCAhKChlYnggPT0gMHg3MjYzNjk0ZCkgJiYgIC8qICJNaWNyIiAqLwpAQCAtNTcsNiAr
NTksMTYgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2Jl
KHZvaWQpCiAgICAgbXNfaHlwZXJ2Lm1heF92cF9pbmRleCA9IGVheDsKICAgICBtc19oeXBlcnYu
bWF4X2xwX2luZGV4ID0gZWJ4OwogCisgICAgaWYgKCAobXNfaHlwZXJ2LmZlYXR1cmVzICYgcmVx
dWlyZWRfbXNycykgIT0gcmVxdWlyZWRfbXNycyApCisgICAgeworICAgICAgICAvKgorICAgICAg
ICAgKiBPb3BzLCByZXF1aXJlZCBNU1JzIGFyZSBub3QgYXZhaWxhYmxlLiBUcmVhdCB0aGlzIGFz
CisgICAgICAgICAqICJIeXBlci1WIGlzIG5vdCBhdmFpbGFibGUiLgorICAgICAgICAgKi8KKyAg
ICAgICAgbWVtc2V0KCZtc19oeXBlcnYsIDAsIHNpemVvZihtc19oeXBlcnYpKTsKKyAgICAgICAg
cmV0dXJuIE5VTEw7CisgICAgfQorCiAgICAgcmV0dXJuICZvcHM7CiB9CiAKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
