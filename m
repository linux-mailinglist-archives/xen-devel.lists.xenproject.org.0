Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21614D1E2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtq2-0006pS-1k; Wed, 29 Jan 2020 20:21:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtq0-0006oA-0m
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:21:24 +0000
X-Inumbo-ID: d5796732-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5796732-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so1066204wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gVgi6YBrthYt44Wqrj9O7ZKyhRLbqO7Cs1SR/Wr9UuA=;
 b=A8Tfm+9SGhaeBy2/SnmLj6UDr3Y91pGgh7YUe3IMyvLJYnHRpFpTJMmhHrgkwL3/D2
 rOh9XImEmIG8hcuymgaaIqVW5Ahwpzt9bUc3pnNee0XmYJ42niCp1Xoe8XDXJAZNjFZJ
 Hj8Yl1zTdVzfwo6KetJ0lS/PyGkgpNI9+iUGfk7o4jQ2W38VcpYy1f97COhK1iFIe2WS
 +bB6renOG4UskqdPt8hFPse5K3BroBWUhOAv1V4WfisdWLMRPLR3AEpRqpbpp/195BVp
 AdsCjNWJppoCmU5H5SHU8bzA3/lG4FRJpXOU6Pa2L5ewvY/TfdOi89OCxZY7UWMYuqUk
 tFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gVgi6YBrthYt44Wqrj9O7ZKyhRLbqO7Cs1SR/Wr9UuA=;
 b=goNOJDUZzqpik+LVOzLMlNZ/HxZ2akJR32S204bisdumLfR3ojEqDISWWrOpYIiKJT
 F3PX1ZiUiWpayMpO/F/cPx36ei7f/jW7KcIbaZQMMQJTLL/02DAePRd3rPPJtwaY0TJB
 xuiygvvOsXxUFlHJ/eKro6LlqBIciDfwWqzc91yI2b7jdxUs7SvrZ06rpM2tBTVfDZxM
 od9nS/lOSqdnf0Ys0qLPUroYgQi56wUAfs9Wa9NXEfGffDSqywwv2nCtKr6cOcZVPWs6
 1o7eTB46MwINR17fQbHAbw2AS5/C9HtS/h89g5xxTB/wS+ulDYJyQnKE/ZNjVGC5JJfD
 MtbQ==
X-Gm-Message-State: APjAAAUo46M23jcCt0skH16FVh7sfvf7oDm3bON7WXobKlJ83aGINeAq
 lheH19AyNoI4PezlBJnrW8I8ITabiJ4=
X-Google-Smtp-Source: APXvYqwPinvoLOIfW/IKtHyR6DxnZ7vKLwYyuQVmGE7asoN63UT7xuLBWNx/d5x66D6VXBU3smP/fQ==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr635351wrv.108.1580329246460;
 Wed, 29 Jan 2020 12:20:46 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:46 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:31 +0000
Message-Id: <20200129202034.15052-10-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 09/12] DO NOT APPLY: x86/hyperv: issue an
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
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCA5MzJhNjQ4ZmY3Li40Mzg3YjY1
NDFlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTIzLDYgKzIzLDcgQEAKIAog
I2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KKyNpbmNsdWRl
IDxhc20vZ3Vlc3QvaHlwZXJ2LWhjYWxsLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10
bGZzLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogCkBAIC0xMTEsNiArMTEyLDE5IEBA
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
