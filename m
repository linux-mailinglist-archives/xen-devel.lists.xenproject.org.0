Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014514F1A7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:53:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQm-0006eQ-BZ; Fri, 31 Jan 2020 17:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQk-0006dl-IU
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:50:10 +0000
X-Inumbo-ID: 1020cb22-4452-11ea-ad98-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1020cb22-4452-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m10so9333793wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hM+7wdfsP27XGM9zHGwtCWANDp7Dbi20PNshZg97aIU=;
 b=r2oD2trUuSgbnkg7qk4IJlNrxpS81WnqL0azadH/eEfIsmL+7hkva3aD7uYiLjZs5D
 ceZr6pv7g07JNibFKF3lSxe3D/6bWdFaKTpQgZ7qqvc5RYk+T6ZhIluBJqRJOatVGLim
 VKBTeMFor1RWl6S1W0cHnMdqby4xWAU0r2aNRqXxvlQJ8oEFrID61KHiuGiGRxD/bRN6
 wFW/7KjtOvJHhgAvrVP8o/UOoRdGhwb7mYjQfw6TMAsugWIF//Gp71HxrH56bfgQi0uM
 4MPGBQW5TtMdIdT64zGhJ5kQAJ/wzV0bqg5KdULjvkyTdz5+NOVlg4DX6Sxs7ZqTXbC8
 9G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hM+7wdfsP27XGM9zHGwtCWANDp7Dbi20PNshZg97aIU=;
 b=TuieQ3n3Vw9NvZPjOk5MSLYEIb45+J4Snt+Pwx9/2r/PkTkxb35m8rgVs1ojPFqjKK
 kHcwRmWclp9d8aI4MS66/8yrGu77TFzpSG96r19ceGGgAuCtsFssGvtsZkwJaL5GdtPL
 F9Y2Gf211yQetClsCnOg4YeynPvbmLdw6AseCaMqliQs2cv+yasnUtVkfg+IR+qnETuT
 n45+dOBA1nhQ9YF03ljaA6oogj8Xn65Lpd7x1Zyc1kIFIqRMAvDSiprcAFAgN40e3Cl/
 joThctL7xxnJsJ6S0k0YJYAnPkTY3wRos5WF5NQ5HpHNtfSUFeEzJ+vw94f1q7TUx7QZ
 +d5Q==
X-Gm-Message-State: APjAAAXiSMXfiVUAy6tv9RpcRbJcCe4tsMtDkE86xVJeVUbB1u0zzeaa
 Mek8ppOzZLGQuF+mXnfnGHCmfNqQGUA=
X-Google-Smtp-Source: APXvYqxeM0hGplB6XELd/R2c0b+0F9jwFuSU2Z3Tp4chVSLJOj461fFocFPKIM98ECOsTS+0+WlaNA==
X-Received: by 2002:a1c:7d93:: with SMTP id
 y141mr13097735wmc.111.1580492983157; 
 Fri, 31 Jan 2020 09:49:43 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:42 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:26 +0000
Message-Id: <20200131174930.31045-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 07/11] DO NOT APPLY: x86/hyperv: issue an
 hypercall
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

VGVzdCBpZiB0aGUgaW5mcmFzdHJ1Y3R1cmUgd29ya3MuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCA3YzJhOTZkNzBlLi4wNTJiMDUz
MTYwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTIzLDYgKzIzLDcgQEAKIAog
I2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KKyNpbmNsdWRl
IDxhc20vZ3Vlc3QvaHlwZXJ2LWhjYWxsLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10
bGZzLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogCkBAIC0xMTQsNiArMTE1LDE5IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQogICAgIEJVR19P
TighaHlwZXJjYWxsX21zci5lbmFibGUpOwogCiAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVS
Vl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOworCisgICAgLyogWFhYIFdlaTogSXNzdWUgYW4g
aHlwZXJjYWxsIGhlcmUgdG8gbWFrZSBzdXJlIHRoaW5ncyBhcmUgc2V0IHVwCisgICAgICogY29y
cmVjdGx5LiAgV2hlbiB0aGVyZSBpcyBhY3R1YWwgdXNlIG9mIHRoZSBoeXBlcmNhbGwgZmFjaWxp
dHksCisgICAgICogdGhpcyBjYW4gYmUgcmVtb3ZlZC4KKyAgICAgKi8KKyAgICB7CisgICAgICAg
IHVpbnQxNl90IHIgPSBodl9kb19oeXBlcmNhbGwoMHhmZmZmLCAwLCAwKTsKKyAgICAgICAgQlVH
X09OKHIgIT0gSFZfU1RBVFVTX0lOVkFMSURfSFlQRVJDQUxMX0NPREUpOworICAgICAgICByID0g
aHZfZG9fZmFzdF9oeXBlcmNhbGwoMHhmZmZmLCAwLCAwKTsKKyAgICAgICAgQlVHX09OKHIgIT0g
SFZfU1RBVFVTX0lOVkFMSURfSFlQRVJDQUxMX0NPREUpOworCisgICAgICAgIHByaW50aygiU3Vj
Y2Vzc2Z1bGx5IGlzc3VlZCBIeXBlci1WIGh5cGVyY2FsbHNcbiIpOworICAgIH0KIH0KIAogc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
