Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1977151D6C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0Gp-0001an-Aq; Tue, 04 Feb 2020 15:37:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0Gn-0001ZS-Ag
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:45 +0000
X-Inumbo-ID: 3927529c-4764-11ea-a933-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3927529c-4764-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3777314wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lx6aI7LGswDmSt31XBjw6y0ZT47SzYKNZSKQP2MOBpk=;
 b=bmMq8d43p8nkqHb75gLI5GH2BjLUPh8jv8scZjvRSt8vqcgX1myWTJ7fZLoRqo2HI5
 A3g1zBJhkPsIkOV22xBRoXRojXZ8f0IHTEvihoLPCWbRjbE8A63lNd6G3fh12pnLZD3A
 LSFO1rKz1Sjz3hnqoEGvE3lgJU6MZCQBVDlh7tSai6rPNK/DTvOXgpJ3qEQIP7Bl+tOj
 3cArvOeuBnbkGVkWDfSIRMfWVly8uHPEEYhoAq75pFO47UHwS5qev2YvZDtsO+xDgu3H
 X+3taVF6Z86PntbZAeDKP1ynX85ov6EJVqmks3DwjTI2QQ/arB69b8DO0y+wsXmkBn5L
 IKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lx6aI7LGswDmSt31XBjw6y0ZT47SzYKNZSKQP2MOBpk=;
 b=XVFEAh5kA+ZlnmQt8U1y3gU9cGe4Ia7RKgxZXOoapqdwPZY8QGCZICBEWC+97gHIRv
 FFQQRPnAb6HI6yKWameEJRFRlDQL7rC6QpOQzk2/MH1rWvJNO6v1Dh3uPtcro7JmCJ4J
 t0JLa+7tp0SP8nKW5u41miPTihXuydv3Ta1bW9Uh10mGRrjh8uWTaLpLZnC+TDlsClDo
 6kwzPVi9v6pPNtYRiJwzVPbVnfN4redYGm4QChfPunNKPWEkqKjRdduw91JmqwTBIDDC
 fqsjRAZmGtsKAupabbiv8Q32hEhKJLDiCdOZPSaPq4U+6Ul2CgHBmadfcMkTsVGRZAH8
 h7BQ==
X-Gm-Message-State: APjAAAVk5yPRFhoK4hheq7tZlbU0i3gyccChPRXpSRxOA9SlFieNRUA9
 rDwABz6H2lWka998Y1TD+YMXUYd/Hq4=
X-Google-Smtp-Source: APXvYqy7P9iOFGDC0ujXcqu3X880lt6G3RIgwcwBd7XtZW81RuvWrvtMm3boEfX+Rkd/hGx1QfiNRA==
X-Received: by 2002:a05:600c:2551:: with SMTP id
 e17mr6571784wma.187.1580830636248; 
 Tue, 04 Feb 2020 07:37:16 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:15 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:37:01 +0000
Message-Id: <20200204153704.15934-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 07/10] DO NOT APPLY: x86/hyperv: issue an
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGVzdCBpZiB0aGUgaW5mcmFzdHJ1Y3R1cmUgd29ya3MuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCA4ODhiZGEyNWIwLi4yYTJhZmNi
MzYzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBi
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
