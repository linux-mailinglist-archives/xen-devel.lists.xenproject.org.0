Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF9145D12
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:26:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMXp-0006IZ-Gu; Wed, 22 Jan 2020 20:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKfK=3L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iuMXo-0006IE-0D
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:24:08 +0000
X-Inumbo-ID: 1a1ce4a2-3d55-11ea-8e9a-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a1ce4a2-3d55-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 20:23:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so522272wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9zRpSrWMsfBPDPq03Nj1xHSfrX+WJI3r1UMf9GF7YQ=;
 b=N9Q7YDS0x/c/guYVRx2kGbAn/h/Pbo6Jiv0t0FJLdzwLBOi+9CpCC4J/SOzge5vrLc
 B9mj71yjWd5l2/n9VGkjXuxin5p+cW+4OTWeYOW+wg3GMUot7Fed6CQ9mKx1r77g7Aeb
 /X/H/RGtPa3KGC/UxG+SDaAbQvnA7lAK3B76EMJCy+XicZfGW1PpKyi8jy3IRDTrJJOv
 wrPXnxGBj9nJ9HncI2M5xabmJNcLbDOme0lUZXGb96siCCfTjqDLUSsiGUrMYtiont5G
 CtCXIuEYeVHue0xOhNozmcvr6x9bpi9eG2u3RgqW/+sBkDJAORU8pb8Kk3YzP2rRuqGJ
 Pt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z9zRpSrWMsfBPDPq03Nj1xHSfrX+WJI3r1UMf9GF7YQ=;
 b=shHTfq/sKLpXnnCIwCqQJ0ZCLtqi++FwRR6BONM7HE0XV6IPmERJbuT7V2baRYQo4F
 MUP2walT/buQ5iWv7aiVRB5BmIqpkGJOywvd280DowBTojWl6bMSlFtLDk7oynVduRKq
 sOUG3LWD9/flZY+cG0xgjlbDuLIPUCIlJ4f3mg7agQJ7EJAIob/dPhmKhm40yLQO4z0l
 ZxHz4seTBGdKZVSOUYpVaEEmftqIl/F6eEdpMdHSkH47qR2V9s1g+FRZuH5kfn34ReFO
 raonm0iwPTM1RZ8L2uMSuTsF+DF5y78nJX9AFVtd1450TuplYjLJa4WIEpu83SjmwswZ
 WO4Q==
X-Gm-Message-State: APjAAAW6unBPTXqmJY03VH4WmCuQAOx2dQ/zQuYP5/fZfu177C5OKS4C
 sR7RVVIxLjfIkw4jhqXrNyAfcgoj6rFVgA==
X-Google-Smtp-Source: APXvYqyRApyQg39fOlK6nmLBQ8KU1JvzwV787HjUBhXybIlNpcsN9K7+r8WM13eeUyG5E0BaBMeNVw==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr13723290wrp.12.1579724630249; 
 Wed, 22 Jan 2020 12:23:50 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 r6sm60267992wrq.92.2020.01.22.12.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:23:49 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 20:23:40 +0000
Message-Id: <20200122202343.5703-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122202343.5703-1-liuwe@microsoft.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 4/7] DO NOT APPLY: x86/hyperv: issue an
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGVzdCBpZiB0aGUgaW5mcmFzdHJ1Y3R1cmUgd29ya3MuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCmluZGV4IGY5ODZjMWE4MDUuLjUzNmNlMGQwZGQg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwpAQCAtMjMsNiArMjMsNyBAQAogCiAjaW5j
bHVkZSA8YXNtL2ZpeG1hcC5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgorI2luY2x1ZGUgPGFz
bS9ndWVzdC9oeXBlcnYtaGNhbGwuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMu
aD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAKQEAgLTEwNyw2ICsxMDgsMTUgQEAgc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAgICAgfQogCiAgICAg
c2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOworCisg
ICAgLyogWFhYIFdlaTogSXNzdWUgYW4gaHlwZXJjYWxsIGhlcmUgdG8gbWFrZSBzdXJlIHRoaW5n
cyBhcmUgc2V0IHVwCisgICAgICogY29ycmVjdGx5LiAgV2hlbiB0aGVyZSBpcyBhY3R1YWwgdXNl
IG9mIHRoZSBoeXBlcmNhbGwgZmFjaWxpdHksCisgICAgICogdGhpcyBjYW4gYmUgcmVtb3ZlZC4K
KyAgICAgKi8KKyAgICB7CisgICAgICAgIHVpbnQxNl90IHIgPSBodl9kb19oeXBlcmNhbGwoMHhm
ZmZmLCAwLCAwKTsKKyAgICAgICAgQlVHX09OKHIgIT0gSFZfU1RBVFVTX0lOVkFMSURfSFlQRVJD
QUxMX0NPREUpOworICAgIH0KIH0KIAogc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
