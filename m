Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC5E46F8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:20:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNvie-0007wB-BX; Fri, 25 Oct 2019 09:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNvic-0007vZ-Os
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:17:14 +0000
X-Inumbo-ID: 2c831668-f708-11e9-a531-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c831668-f708-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r141so1229289wme.4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5mtkW3wpHguw+wyMps6cF9wqpB+EbjhZMYROmJIuZI=;
 b=PrKAcuFcatKubYH6LW/hGrN6AhBmqb863KdvMZ+oVU9L5KAsgr/MdI1nIDHlrc3NbM
 8AAx4OBkOC70lb9f+f8BKBGLvmsbR01JF1Uy3oFh6NsN9+MxBIwELcSsrAZs8/j7FGNE
 4IQDyQHEZlUH7X9GXMdzsoIj83HgnrNk9EojFrbfocMUa5fLGff2IyenXlReQDW7JWix
 ni7M+wxBPXB+wMXiHRf00eCXN81U2LO7jw0SM0qmrwup8xRXMHFuK7PttkYS5bk3/C2g
 LNsDK6Bxt40Sd4gx5lF730Du6RNQPmodz+uHGmbljmlJ86SWsTc/lJx5wCgSgFSWL9ZO
 GJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V5mtkW3wpHguw+wyMps6cF9wqpB+EbjhZMYROmJIuZI=;
 b=XjdVD9AqLZsKolQVjOLkwK4XvdqW52rbpK0+A7PGfxuxnk+2oRZqNkmu8VYeufJ3/m
 Ic9vvaOA8Q87k3OHpwuTU+J1hD8Z+Vm+IrmRWu9uMmGANVhe/+B9iCwsCUg9M627kTTg
 Eic++EqKm7leQfPhRR/t6O8YHgtKw++IkTlP/v3rRwyznau5kAg2VrZEgmhdDT5OkmtB
 DxdC463cgVHmQ0q73ptR52GwKgJyYXoO/p2IzFKtucNW8ZBVBCmyfRomA4/CpSA9cml+
 9aLF1aTCPPU3mBqQm12MAvBgBOyHMQkBuTh0EAK5GNc2AiKG1yAvuf2FUw+LPI+bxB4B
 G/Bw==
X-Gm-Message-State: APjAAAW1iClj+scmgvmDcWx69l/JHrWqJGel1WtihKrmaNhTPj4ADhi8
 cW0WgLmLL5YmKdmQJBlp5LN4xRmGa6A=
X-Google-Smtp-Source: APXvYqwujZ6UmIniBMmFGXl1CHDYKmbV17bB4OtRND/NvnGM+LVw+jq6EXmxS2UcOaQdXqoK9kH4RA==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr2590496wml.170.1571995008549; 
 Fri, 25 Oct 2019 02:16:48 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:48 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:17 +0100
Message-Id: <20191025091618.10153-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025091618.10153-1-liuwe@microsoft.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 6/7] x86/hyperv: provide hyperv_guest
 variable
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

SXQgd2lsbCBiZSB1c2VkIHRvIGdhdGUgSHlwZXItViByZWxhdGVkIGNvZGUgb3V0c2lkZSBvZiB0
aGUgZ3Vlc3QKZGlyZWN0b3J5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMgfCAzICsrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYu
aCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMKaW5kZXggMDQxMTY2ZjM0NC4uZWU2NDk0MjZjZSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0yNCw2ICsyNCw3IEBACiAjaW5jbHVkZSA8YXNtL2d1ZXN0
L2h5cGVydi10bGZzLmg+CiAKIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBtc19oeXBlcnY7Citib29s
IGh5cGVydl9ndWVzdDsKIAogYm9vbCBfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiB7CkBAIC01
MCw2ICs1MSw4IEBAIGJvb2wgX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQogICAgIG1zX2h5cGVy
di5tYXhfdnBfaW5kZXggPSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlEX0lNUExFTUVOVF9MSU1JVFMp
OwogICAgIG1zX2h5cGVydi5tYXhfbHBfaW5kZXggPSBjcHVpZF9lYngoSFlQRVJWX0NQVUlEX0lN
UExFTUVOVF9MSU1JVFMpOwogCisgICAgaHlwZXJ2X2d1ZXN0ID0gdHJ1ZTsKKwogICAgIHJldHVy
biB0cnVlOwogfQogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAppbmRleCAwZjg4MDAwNDBh
Li44NmY1YzI0ZWM2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTM1LDYgKzM1
LDggQEAgc3RydWN0IG1zX2h5cGVydl9pbmZvIHsKIH07CiBleHRlcm4gc3RydWN0IG1zX2h5cGVy
dl9pbmZvIG1zX2h5cGVydjsKIAorZXh0ZXJuIGJvb2wgaHlwZXJ2X2d1ZXN0OworCiBleHRlcm4g
c3RydWN0IGh5cGVydmlzb3Jfb3BzIGh5cGVydl9vcHM7CiAKIGJvb2wgaHlwZXJ2X3Byb2JlKHZv
aWQpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
