Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30426118D09
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:51:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkq-0003OR-Br; Tue, 10 Dec 2019 15:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehko-0003NL-SF
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:50 +0000
X-Inumbo-ID: 74232154-1b64-11ea-88e7-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74232154-1b64-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:04 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id t5so4353960qvs.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfSXRpgw3eVeA7YwpoTkHPmcDjBPWceRwH/SOucJAAQ=;
 b=FBccXHBTUri+KAyO6xTjfajMJ39Yj0OBmAysXJTLpemtmDEzFQQPvYI39haJ4rDoF6
 ZYHeB4MglGIXgCgFXyVK7d1l9zLNLmfcaYk2GHvd+YJ9oneLussrUPY1nhHepkIKy4jR
 ldpTbhMQjxHYfTlaN8WpHMunrb5CQ90SlTYU7RAqPBWqvhRQSX6zvQNpChZTZooyT9mt
 mXFeD0+ZEQlA1PJdlnYeCa0kG3NOwgkN3XcEQmrcH96PvppAtcygP/Vv5Lqd1T49OHzQ
 VAPJCc+zgSuo9qSEctUaMYsoj0GgAmc3PpXzVNw0gWCGIH4b3O+r83m2BcbT4M0Nnsoy
 +Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfSXRpgw3eVeA7YwpoTkHPmcDjBPWceRwH/SOucJAAQ=;
 b=oPPgTsrTqyktKRJyAX3fZfSmy+/tc1sZFX8ygKW+wAQKzl8O8ZDvKF29id9J/312S/
 pJzyXnPBSxrjYXfXtqHJ6nhbpEzNUUDIcOXMvTFAN9Lg8RFniLaZ2fXBbv3ld2SfayKQ
 XaYpyafB6oCWkIqd76DTaOi380eTep3BQItBEa6XFawOklpFQgwRuYmNMdnSDztgPpJE
 ukd7VMFS8P1QcMa16ZbfeDE+Ybje3nnYo4h6RSJVq0tgf0f4vGtb3KQfziRZ8dBL5dLT
 C1XVPKneR63TakMX0Nwo+pSdFc73/+xkJh/acn6oXc8Eo7gsqdtd4SBW4nKvwVi1QTbC
 ISqg==
X-Gm-Message-State: APjAAAX7glVfjlxVdCri9YOCkq78mu7SksE1l0ygTzLsnHJZTS3QP3/2
 PvxmDeztKSoIhreHZknkrVFSKSGA
X-Google-Smtp-Source: APXvYqzuBusz/PYk0k4PcYgSBjqOXeyAI1CC2tDIejBw2FAwwmgPdy8r4De3xiCWU4U1V/zORgsnuw==
X-Received: by 2002:a0c:ef0f:: with SMTP id t15mr27304967qvr.123.1575992884039; 
 Tue, 10 Dec 2019 07:48:04 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:48:03 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:27 -0500
Message-Id: <7a789af7e2a0595132cf898a80ea6707537d31c2.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 12/22] golang/xenlight: re-factor Hwcap type
 implementation
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlLWRlZmluZSBI
d2NhcCBhcyBbOF11aW50MzIsIGFuZCBpbXBsZW1lbnQgdG9DIGZ1bmN0aW9uLiBBbHNvLCByZS1u
YW1lIGFuZAptb2RpZnkgc2lnbmF0dXJlIG9mIHRvR28gZnVuY3Rpb24gdG8gZnJvbUMuCgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgpSZXZpZXdl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjoKLSBGaXggY29tbWVudCBpbiBmcm9tQyBzaW5jZSBhbiBhcnJheSBpcyBiZWluZyB1
c2VkIG5vdywgbm90IGEgc2xpY2UuCi0gVXNlIGEgY29uY2lzZSB2YXJpYWJsZSBuYW1lIGluc3Rl
YWQgb2YgbWFwc2xpY2UgZm9yIHRoZSBDIGFycmF5LgpDaGFuZ2VzIGluIHYzOgotIEluIGZyb21D
LCBpdGVyYXRlIG92ZXIgdGhlIGluZGlyZWN0IG9mIGh3Y2FwIGluc3RlYWQgb2YgY3JlYXRpbmcK
ICBhIHNsaWNlIGZyb20gdGhlIEMgdHlwZS4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28gfCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9n
b2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28KaW5kZXggZjljMmY4NGM4MS4uYjM5NTk2MzUxMiAxMDA2NDQKLS0tIGEvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbwpAQCAtMzA2LDIwICszMDYsMjUgQEAgdHlwZSBDb250ZXh0IHN0cnVjdCB7CiAJbG9n
Z2VyICpDLnhlbnRvb2xsb2dfbG9nZ2VyX3N0ZGlvc3RyZWFtCiB9CiAKLXR5cGUgSHdjYXAgW11D
LnVpbnQzMl90CisvLyBId2NhcCByZXByZXNlbnRzIGEgbGlieGxfaHdjYXAuCit0eXBlIEh3Y2Fw
IFs4XXVpbnQzMgogCi1mdW5jIChjaHdjYXAgQy5saWJ4bF9od2NhcCkgdG9HbygpIChnaHdjYXAg
SHdjYXApIHsKLQkvLyBBbGxvYyBhIEdvIHNsaWNlIGZvciB0aGUgYnl0ZXMKLQlzaXplIDo9IDgK
LQlnaHdjYXAgPSBtYWtlKFtdQy51aW50MzJfdCwgc2l6ZSkKK2Z1bmMgKGh3Y2FwICpId2NhcCkg
ZnJvbUMoY2h3Y2FwICpDLmxpYnhsX2h3Y2FwKSBlcnJvciB7CisJZm9yIGkgOj0gcmFuZ2UgKmh3
Y2FwIHsKKwkJaHdjYXBbaV0gPSB1aW50MzIoY2h3Y2FwW2ldKQorCX0KIAotCS8vIE1ha2UgYSBz
bGljZSBwb2ludGluZyB0byB0aGUgQyBhcnJheQotCW1hcHNsaWNlIDo9ICgqWzEgPDwgMzBdQy51
aW50MzJfdCkodW5zYWZlLlBvaW50ZXIoJmNod2NhcFswXSkpWzpzaXplOnNpemVdCisJcmV0dXJu
IG5pbAorfQogCi0JLy8gQW5kIGNvcHkgdGhlIEMgYXJyYXkgaW50byB0aGUgR28gYXJyYXkKLQlj
b3B5KGdod2NhcCwgbWFwc2xpY2UpCitmdW5jIChod2NhcCAqSHdjYXApIHRvQygpIChDLmxpYnhs
X2h3Y2FwLCBlcnJvcikgeworCXZhciBjaHdjYXAgQy5saWJ4bF9od2NhcAogCi0JcmV0dXJuCisJ
Zm9yIGksIHYgOj0gcmFuZ2UgaHdjYXAgeworCQljaHdjYXBbaV0gPSBDLnVpbnQzMl90KHYpCisJ
fQorCisJcmV0dXJuIGNod2NhcCwgbmlsCiB9CiAKIC8vIEtleVZhbHVlTGlzdCByZXByZXNlbnRz
IGEgbGlieGxfa2V5X3ZhbHVlX2xpc3QuCkBAIC00NDIsNyArNDQ3LDcgQEAgZnVuYyAoY3BoeXMg
KkMubGlieGxfcGh5c2luZm8pIHRvR28oKSAocGh5c2luZm8gKlBoeXNpbmZvKSB7CiAJcGh5c2lu
Zm8uU2hhcmluZ0ZyZWVkUGFnZXMgPSB1aW50NjQoY3BoeXMuc2hhcmluZ19mcmVlZF9wYWdlcykK
IAlwaHlzaW5mby5TaGFyaW5nVXNlZEZyYW1lcyA9IHVpbnQ2NChjcGh5cy5zaGFyaW5nX3VzZWRf
ZnJhbWVzKQogCXBoeXNpbmZvLk5yTm9kZXMgPSB1aW50MzIoY3BoeXMubnJfbm9kZXMpCi0JcGh5
c2luZm8uSHdDYXAgPSBjcGh5cy5od19jYXAudG9HbygpCisJcGh5c2luZm8uSHdDYXAuZnJvbUMo
JmNwaHlzLmh3X2NhcCkKIAlwaHlzaW5mby5DYXBIdm0gPSBib29sKGNwaHlzLmNhcF9odm0pCiAJ
cGh5c2luZm8uQ2FwSHZtRGlyZWN0aW8gPSBib29sKGNwaHlzLmNhcF9odm1fZGlyZWN0aW8pCiAK
LS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
