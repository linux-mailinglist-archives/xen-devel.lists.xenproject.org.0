Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC86124A0D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:47:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaXd-0004Z9-GQ; Wed, 18 Dec 2019 14:43:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihaXb-0004YR-Qd
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:43:07 +0000
X-Inumbo-ID: a4d68d2c-21a4-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4d68d2c-21a4-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 14:42:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m24so2097142wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPQxGbYWCz/cDrvGjrtCt3X0aC5XW0YsyQfUDvPNuVA=;
 b=OcgOCgxFGYca3uDJ6ajjb51HjPU2jYLzYXm26zTldWgmYC5dxl2fTkDg13c3iZYmhg
 WxieShw19YHzqgPta9RX3LEdSDnyF9NGhPcQFjSRrRicr1EazrVJytdWMavGVlmJl02A
 +iOaSopGHQkZ0rf2lHtuQpvUI+0NMZjneB6Sn5HI5ivgeuH8IohE8cmBqyhEDTEoe+nB
 e/xlnd6tlIbCxTQb2CQi6pWqrLVWsbGafsCm2m66hhj6O1Ue6RIG5wgBZusbS3wWjEyH
 JWsALqkFJcAMpL6/Q2km06tUvFpxu7DozmSddqRZHokJFJBz3LCL2ybmN/LwWz/jTT4e
 sZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BPQxGbYWCz/cDrvGjrtCt3X0aC5XW0YsyQfUDvPNuVA=;
 b=knAbfbakrUyXzQTgAQgkvobMVew63aARDEpqGMSivUFFssg1Y0y8LQpsQdC8Sth10K
 Le9q8A5yCW47kwpSd6RQ8H9bbn45OzeEtvPfPDv3FbvRDeMNB/zJZkpswTxGkgQu0MmT
 GwEGqMNGk+Cx4jKp6zBM8cr2kGznQaIEyrJkgjMFvyiqFWfy3Gjqb0v3QsdSzk3Er4/v
 udkJiQSD6jbQ30cO7/C7ZbYqX2/MaYNpaRH6h1a2YXEs3Ybok6DT2F0q2zbhPRPFx1SX
 h49ApqVCPTzgAAhcpaxdMYpO1kRdC/woGPfLBxC+OoEGgcWOvcCsu5rZnyELzBppbPJ/
 ErUQ==
X-Gm-Message-State: APjAAAXfzLdSd/g4w/v+SuWHffvYKmUhNlHodqCfrzW6clxmYhrr5SKe
 sAgYJNh70yaTTg5vFBjdALK7hJq3
X-Google-Smtp-Source: APXvYqyjO7SfPknIFIm91rNcXZ4zuJx78QNgVB54GQEsV6IoxMJRWOKf/pDolK7ViAL7HnjumeVHRg==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr3743069wmd.44.1576680160761; 
 Wed, 18 Dec 2019 06:42:40 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p17sm2724894wmk.30.2019.12.18.06.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:42:40 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 14:42:32 +0000
Message-Id: <20191218144233.15372-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218144233.15372-1-liuwe@microsoft.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/6] x86/hyperv: extract more information
 from Hyper-V
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhIHN0cnVjdHVyZSB0byBzdG9yZSB0aGF0IGluZm9ybWF0aW9uLiBUaGUgc3RydWN0
dXJlIHdpbGwgYmUKYWNjZXNzZWQgZnJvbSBvdGhlciBwbGFjZXMgbGF0ZXIgc28gbWFrZSBpdCBw
dWJsaWMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAxNyArKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8IDEyICsrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggYjgy
YWUzODMzZi4uMmU3MGI0YWE4MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0y
MSw2ICsyMSw5IEBACiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KIAogI2luY2x1ZGUgPGFzbS9ndWVz
dC5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5oPgorCitzdHJ1Y3QgbXNfaHlw
ZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aHlwZXJ2aXNvcl9vcHMgb3BzID0gewogICAgIC5uYW1lID0gIkh5cGVyLVYiLApAQCAtNDAsNiAr
NDMsMjAgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2Jl
KHZvaWQpCiAgICAgaWYgKCBlYXggIT0gMHgzMTIzNzY0OCApICAgIC8qIEh2IzEgKi8KICAgICAg
ICAgcmV0dXJuIE5VTEw7CiAKKyAgICAvKiBFeHRyYWN0IG1vcmUgaW5mb3JtYXRpb24gZnJvbSBI
eXBlci1WICovCisgICAgY3B1aWQoSFlQRVJWX0NQVUlEX0ZFQVRVUkVTLCAmZWF4LCAmZWJ4LCAm
ZWN4LCAmZWR4KTsKKyAgICBtc19oeXBlcnYuZmVhdHVyZXMgPSBlYXg7CisgICAgbXNfaHlwZXJ2
Lm1pc2NfZmVhdHVyZXMgPSBlZHg7CisKKyAgICBtc19oeXBlcnYuaGludHMgPSBjcHVpZF9lYXgo
SFlQRVJWX0NQVUlEX0VOTElHSFRNRU5UX0lORk8pOworCisgICAgaWYgKCBtc19oeXBlcnYuaGlu
dHMgJiBIVl9YNjRfRU5MSUdIVEVORURfVk1DU19SRUNPTU1FTkRFRCApCisgICAgICAgIG1zX2h5
cGVydi5uZXN0ZWRfZmVhdHVyZXMgPSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlEX05FU1RFRF9GRUFU
VVJFUyk7CisKKyAgICBjcHVpZChIWVBFUlZfQ1BVSURfSU1QTEVNRU5UX0xJTUlUUywgJmVheCwg
JmVieCwgJmVjeCwgJmVkeCk7CisgICAgbXNfaHlwZXJ2Lm1heF92cF9pbmRleCA9IGVheDsKKyAg
ICBtc19oeXBlcnYubWF4X2xwX2luZGV4ID0gZWJ4OworCiAgICAgcmV0dXJuICZvcHM7CiB9CiAK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCmluZGV4IDNmODhiOTRjNzcuLmNjMjFiOWFiZmMg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaApAQCAtMjEsOCArMjEsMjAgQEAKIAogI2lm
ZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKIAorI2luY2x1ZGUgPHhlbi90eXBlcy5oPgorCiAjaW5j
bHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KIAorc3RydWN0IG1zX2h5cGVydl9pbmZvIHsK
KyAgICB1aW50MzJfdCBmZWF0dXJlczsKKyAgICB1aW50MzJfdCBtaXNjX2ZlYXR1cmVzOworICAg
IHVpbnQzMl90IGhpbnRzOworICAgIHVpbnQzMl90IG5lc3RlZF9mZWF0dXJlczsKKyAgICB1aW50
MzJfdCBtYXhfdnBfaW5kZXg7CisgICAgdWludDMyX3QgbWF4X2xwX2luZGV4OworfTsKK2V4dGVy
biBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OworCiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl9vcHMgKmh5cGVydl9wcm9iZSh2b2lkKTsKIAogI2Vsc2UKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
