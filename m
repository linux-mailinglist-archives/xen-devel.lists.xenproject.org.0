Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FEA145D17
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:27:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMY4-0006RO-Q5; Wed, 22 Jan 2020 20:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKfK=3L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iuMY3-0006Ql-1G
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:24:23 +0000
X-Inumbo-ID: 1bd0d312-3d55-11ea-8e9a-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bd0d312-3d55-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 20:23:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so517542wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 12:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljuvtGQ8FLfUz4xqMnHKyZjGxy69y+jnVAsAFm6RVds=;
 b=gtWqCrbHnArBT6pIE/e3Y59E1lIcOgMjtNLGL1C7YC42YtP68AF5M4BX6OCuElrzDZ
 Hrf/QYX18PFyL/bWd8GgoXfky6CXRkPqGZbmXgJ8kx7K5FH0i3aXpi3BYSAwW6+QdqDB
 eRQhsk/PYzUzkbEEV/TLKOHi10fDaCrESQDdJncT5TgyMIX4Ke2ZcV9gIZ5oLb5FUfYv
 yBtK0iMqxC10cyTQu8CsBulBx4JtLodzGHUJE20mN6iWDAUYzb7U9mk+LAZJqLZWXdWU
 Ba71w9stZVz5OJ5HtYKNqF16AoJIWLkgADxtW92ZoDBA70lFwfNkX6RIVv0PLJswqF1H
 OHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ljuvtGQ8FLfUz4xqMnHKyZjGxy69y+jnVAsAFm6RVds=;
 b=EcaGVcGtkZWB8BA2wyKtOIQ7ancTGx8X+nSTNiE32ASY17EUFYG4esB0gWjIPL31ax
 CwbjlYM6WibuQGpPf/hQ0GW1gSDZe5DxetjnIWtdGR3OyHhHd9qT/YeJqB87GZpugmUW
 NVkmgZTPJT9c2S+161ilGZLvx7s/E+weXGZZrVQgi3nGUdCF+vjjIDtBB9oO1dTS+TOd
 6o8ZUItXmK9MqQ6KjW/pjd/9kYinX36fH8Ykkrpw7h1olc8QcgShc0qIwyGwYZHMezdM
 QA3x8FrjsSKgZb22BAtu7ziEuUX3R2hDffyr4QhCV8LZHtA5BRZvpiFkDPQy/OBF5G96
 tdHQ==
X-Gm-Message-State: APjAAAX3xPia5PziEnOksEpIvn3Fa+/0TFaSwfKUE7gg3M/yWr2qqvzX
 cFFMVRCAQTaL0kI4YLs54futBWWn7MPifQ==
X-Google-Smtp-Source: APXvYqxPFih+zc1HHE4XDSBA6Wgr59+EAa8ucv5Qi9jgZF14d9ZZt7xwP2/sOF8TCZ+dbKmIGZUe2w==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr12536429wrm.48.1579724633088; 
 Wed, 22 Jan 2020 12:23:53 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 r6sm60267992wrq.92.2020.01.22.12.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:23:52 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 20:23:43 +0000
Message-Id: <20200122202343.5703-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122202343.5703-1-liuwe@microsoft.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 7/7] x86/hyperv: setup VP assist page
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
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4gaXQKZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KdjQ6CjEuIFVzZSBw
cml2YXRlLmgKMi4gUHJldmVudCBsZWFrCgp2MzoKMS4gVXNlIHhlbmhlYXAgcGFnZQoyLiBEcm9w
IHNldF92cF9hc3Npc3QKCnYyOgoxLiBVc2UgSFZfSFlQX1BBR0VfU0hJRlQgaW5zdGVhZAotLS0K
IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgIDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKaW5kZXggMDg1ZTY0NmRjNi4uODlhOGYzMTZiMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L2h5cGVydi5jCkBAIC0zMiw2ICszMiw3IEBACiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFk
X21vc3RseSBtc19oeXBlcnY7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2
X3BjcHVfaW5wdXRfYXJnKTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGlu
dCwgaHZfdnBfaW5kZXgpOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92
cF9hc3Npc3QpOwogCiBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKIHsK
QEAgLTE0MiwxNSArMTQzLDQwIEBAIHN0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2Fy
Zyh2b2lkKQogICAgIHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZwX2luZGV4X21zcjsKIH0KIAor
c3RhdGljIHZvaWQgc2V0dXBfdnBfYXNzaXN0KHZvaWQpCit7CisgICAgdm9pZCAqbWFwcGluZzsK
KyAgICB1aW50NjRfdCB2YWw7CisKKyAgICBtYXBwaW5nID0gdGhpc19jcHUoaHZfdnBfYXNzaXN0
KTsKKworICAgIGlmICggIW1hcHBpbmcgKQorICAgIHsKKyAgICAgICAgbWFwcGluZyA9IGFsbG9j
X3hlbmhlYXBfcGFnZSgpOworICAgICAgICBpZiAoICFtYXBwaW5nICkKKyAgICAgICAgICAgIHBh
bmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgdnBfYXNzaXN0IHBhZ2UgZm9yIENQVSV1XG4iLAorICAg
ICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKworICAgICAgICBjbGVhcl9wYWdl
KG1hcHBpbmcpOworICAgICAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpID0gbWFwcGluZzsKKyAg
ICB9CisKKyAgICB2YWwgPSAodmlydF90b19tZm4obWFwcGluZykgPDwgSFZfSFlQX1BBR0VfU0hJ
RlQpCisgICAgICAgIHwgSFZfWDY0X01TUl9WUF9BU1NJU1RfUEFHRV9FTkFCTEU7CisgICAgd3Jt
c3JsKEhWX1g2NF9NU1JfVlBfQVNTSVNUX1BBR0UsIHZhbCk7Cit9CisKIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cCh2b2lkKQogewogICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7CiAgICAgc2V0
dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7CisgICAgc2V0dXBfdnBfYXNzaXN0KCk7CiB9CiAKIHN0
YXRpYyB2b2lkIGFwX3NldHVwKHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJn
KCk7CisgICAgc2V0dXBfdnBfYXNzaXN0KCk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgb3BzID0gewpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9wcml2YXRlLmggYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAppbmRleCBk
YTcwOTkwNDAxLi5hZjQxOWU5ZDRiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaApA
QCAtMjYsNSArMjYsNiBAQAogCiBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl9wY3B1X2lucHV0
X2FyZyk7CiBERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7CitERUNM
QVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Npc3QpOwogCiAjZW5kaWYgLyogX19YRU5fSFlQ
RVJWX1BSSVZJQVRFX0hfXyAgKi8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
