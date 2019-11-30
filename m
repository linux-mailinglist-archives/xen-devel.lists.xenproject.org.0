Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797310DD86
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 12:59:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1Ng-0004in-A8; Sat, 30 Nov 2019 11:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1Ne-0004ii-MV
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:57:42 +0000
X-Inumbo-ID: 9ce85824-1368-11ea-83b8-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce85824-1368-11ea-83b8-bc764e2007e4;
 Sat, 30 Nov 2019 11:57:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so4861863wmi.3
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/stZRTrBJWatCpyjrTLK9IFgbC8jyUYHayzXXJg7yU=;
 b=jUOOiYzymtgWYtQTwYL0wQMm172hF4Gh19VMBbiugW9Uma8ILqlElaP0EY5kGGrA05
 9HttucKbZZzFg5geNzxKQrcSwSxIq4VuI+VlMmORnSisg9j8R6O41QmayXOO5N0DF+bI
 j7rCo9fC0UEfdh1PJ9fr1ovOI0gM0iUkRVlfKOy8CuxD5r4YVGnELv2OPEmSZRl2Aole
 fZTsO0LUnjk+A9ClNT7iJtTh7MJPhMW3nxRvPn/kG9cNzfCcQTzle+mrZpUAz7j7+Wij
 caqsFH90cxutIsMLmYMqfYrRs2KCGS4w+J5SFYF7ViODbniQdX5nDQd7+aHdaHUN8ZD/
 wYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l/stZRTrBJWatCpyjrTLK9IFgbC8jyUYHayzXXJg7yU=;
 b=nbEn2YYNqbnBDMV7vON44S3rl8klKJima0A9kSmxtJZ9nfU9NfmhTXCcMTN/bnhHxK
 9jbegl6Co4MMSXy/K5yL9lZD0JF15/+ValfmaqS9S3qvGvOjF2fmiIJzyUYMcFhAP/Dg
 YUOJkNmjaerhJhZK4tgTY4kvaMDjf338AqJKno5pu+iOkb5JZstRliLMdCAk4rzCJ355
 hoYAnx0oDYMX+XSg2y0sAuGsLF3cafgIKsce9g8hfqhaDxzSVXYPKuV4e8mCxx4vqzGF
 5s/TdjaOtxWmCw4OugTvM0c1YqNNCG2mP0k/L/vsswLjCE6nNG0GXpVmL0lyv7NWwfLO
 ewrw==
X-Gm-Message-State: APjAAAX6bgCCJQxabHAdNAklbmINQO9a7rWTcScLMjnNiR34GvyrIEY3
 wU454YoNiajy9zkyPJgCv3XMZV8aWoU=
X-Google-Smtp-Source: APXvYqylAS9TK5bJ+8UEZNcuJ7PWOt4eecfLIwj9a3b7m8popHV5I1PFwr1Ba1a1lAMr59a/yD63/Q==
X-Received: by 2002:a1c:ba89:: with SMTP id
 k131mr13281264wmf.108.1575115061299; 
 Sat, 30 Nov 2019 03:57:41 -0800 (PST)
Received: from debian.mshome.net (122.163.200.146.dyn.plus.net.
 [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z11sm2227769wrt.82.2019.11.30.03.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:57:40 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 30 Nov 2019 11:57:29 +0000
Message-Id: <20191130115737.15752-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/8] Port Xen to Hyper-V
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

UGxlYXNlIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGNoYW5nZXMKCkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCkNjOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIApDYzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+ICAgICAgCgpXZWkg
TGl1ICg4KToKICB4ODY6IGludHJvZHVjZSBDT05GSUdfR1VFU1QgYW5kIG1vdmUgY29kZQogIHg4
NjogYWRkIG1pc3NpbmcgaGVhZGVycyBpbiBoeXBlcmNhbGwuaAogIHg4NjogZHJvcCBoeXBlcnZp
c29yX2NwdWlkX2Jhc2UKICB4ODY6IGludHJvZHVjZSBoeXBlcnZpc29yIGZyYW1ld29yawogIHg4
NjogcmVuYW1lIGh5cGVydmlzb3Jfe2FsbG9jLGZyZWV9X3VudXNlZF9wYWdlCiAgeDg2OiBzd2l0
Y2ggeGVuIGd1ZXN0IGltcGxlbWVudGF0aW9uIHRvIHVzZSBoeXBlcnZpc29yIGZyYW1ld29yawog
IHg4NjogYmUgbW9yZSB2ZXJib3NlIHdoZW4gcnVubmluZyBvbiBhIGh5cGVydmlzb3IKICB4ODY6
IGludHJvZHVjZSBDT05GSUdfSFlQRVJWIGFuZCBkZXRlY3Rpb24gY29kZQoKIHhlbi9hcmNoL3g4
Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKy0KIHhlbi9hcmNoL3g4
Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgNiArLQogeGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9NYWtlZmlsZSAgICAgICAgICAgIHwgIDEgKwogeGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYyAgICAgICAgICAgIHwgNTQgKysrKysrKysrKysrKwogeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgICAgICAgIHwgNzggKysrKysrKysrKysrKysr
KysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDQg
KwogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TIHwgIDAKIHhl
bi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vcHZoLWJvb3QuYyAgICAgICB8ICAyICstCiB4ZW4v
YXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCA2MCArKysrKysrLS0t
LS0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYg
Ky0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgICAgICAgICAgICAgfCAgMiArCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oICAgICAgICAgfCAgNCArCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oICAgICAgICAgICAgfCA0MyArKysrKysrKysr
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCAgICAgICAgfCA2MiArKysr
KysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggICAgICAgICAgICAg
ICB8IDIzICsrLS0tLQogMTcgZmlsZXMgY2hhbmdlZCwgMzEyIGluc2VydGlvbnMoKyksIDU3IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
TWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVydi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3Iu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKIHJl
bmFtZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgKDEwMCUp
CiByZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5jICg5OSUpCiBy
ZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoOTQlKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAoKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
