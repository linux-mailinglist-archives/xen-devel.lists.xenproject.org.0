Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07C15C22A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 16:30:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2GPE-0003WJ-JF; Thu, 13 Feb 2020 15:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERpn=4B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j2GPE-0003WE-0p
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 15:27:56 +0000
X-Inumbo-ID: 67f160a0-4e75-11ea-bc8e-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67f160a0-4e75-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 15:27:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so7218263wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 07:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OlhbnVg3VOE3ZbxXtCPHRKktV7Swm2eX7fWEbENo4Fo=;
 b=K2tIfoOufVep0i1MgzPTTU3xfgS+SWJbcNxdUrsqvPeaFBj8CMVOIwfMnfA+YZnuxp
 ORO66Fz64xZO2l7KVH8GXOk0gKNq02C6RXWTi0fyjMhOCieoUcVa9PGZ23yv+sarfJps
 +z8f9G+GDgwcy9FymBvc1H7C2WuoClLlXS8dkWBllEfT9I+YawWKVXtsj30FRae/r7k/
 4pZI5JvwXX1y7cRJgj1ptE7/24YfF5nmiWQ/9yD22GHYatrIAFLj1rcdtb9N++XG3bNw
 Ey1tdXxdGGpQSiUcUR6/m0JmXhIwtmFpF0AJm5HnBQwFqNTTrDGdp2Nwq1vkjFFomW4B
 8xDg==
X-Gm-Message-State: APjAAAUEWFKLeCmi0vJ7QqUDn/DDGNXKAqZDJyiwwBF39p0w1VWZv45z
 6BmbgbeOQA51rFPS5CNyHRCB9eWb1Rg=
X-Google-Smtp-Source: APXvYqz1CZfoDQJGHHCH5uLPSAr4lVDfA9fz6TTsu0MnBftxyjT+7bY3biCQbBOoyZH7KHlQwIW4lQ==
X-Received: by 2002:a1c:988c:: with SMTP id a134mr6119212wme.163.1581607674489; 
 Thu, 13 Feb 2020 07:27:54 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 j65sm3505823wmb.21.2020.02.13.07.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:27:54 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 15:27:51 +0000
Message-Id: <20200213152751.3837-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: fix libxl__cpuid_legacy in
 libxl_nocpuid.c
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXRzIGxhc3QgcGFyYW1ldGVyIHNob3VsZCBiZSBsaWJ4bF9kb21haW5fYnVpbGRfaW5mby4KCkZp
eGVzOiAxYjNjZWM2OSAoInRvb2xzL2xpYnhsOiBDb21iaW5lIGxlZ2FjeSBDUFVJRCBoYW5kbGlu
ZyBsb2dpYyIpClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMv
bGlieGwvbGlieGxfbm9jcHVpZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVp
ZC5jIGIvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jCmluZGV4IDc3NzY1NzRhMGMuLjNmMzBl
MTQ4YmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX25vY3B1aWQuYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9ub2NwdWlkLmMKQEAgLTM1LDcgKzM1LDcgQEAgaW50IGxpYnhsX2NwdWlk
X3BhcnNlX2NvbmZpZ194ZW5kKGxpYnhsX2NwdWlkX3BvbGljeV9saXN0ICpjcHVpZCwKIH0KIAog
dm9pZCBsaWJ4bF9fY3B1aWRfbGVnYWN5KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwK
LSAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZykK
KyAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbykK
IHsKIH0KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
