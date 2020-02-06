Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C9154854
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:44:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjHP-0007Ip-3I; Thu, 06 Feb 2020 15:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izjHO-0007Ik-4u
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:41:22 +0000
X-Inumbo-ID: 1f69c404-48f7-11ea-afe4-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f69c404-48f7-11ea-afe4-12813bfff9fa;
 Thu, 06 Feb 2020 15:41:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so505270wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 07:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6WsSAKWHEMNimo+aRtpQMsM0oX26fM+2iIzDc9TGohU=;
 b=hz110ZOYYyZ9DpFOT7Usym3TCutE1Qrjdx2EHkoCRUEWqOlkt0dEAiLp0VfG+GmzZ+
 qAh8yCBPb0t3ctfsoMNkNiqrf9Vd5sqmPghIZP1ASxiezt32Xu3kSuMghNW6ZEWzSTBo
 hPQ2eRSe15YmKvuB7T4EyI9oMtCuXqgL7Wk0ZRE8WkGFxouoyOi4oas6OfP/Z6EcBTr3
 x5aMSQK0htooJNIU7x3ROQklZ6toGzsJ9oHf3/mG+/CPi4Kg+/jG7Fn+/tPKud+nm2DQ
 7NUKwabpEE18kc0lKsl3tsgw/Wv7TMG3AbmV/ZmaBpb2K1Z9VtN8vQj1OGzUFjm6KMjG
 FclA==
X-Gm-Message-State: APjAAAUGX4xA9h1X/hijMT1OBgFnaYppFMjquVgGS2CzgbxbC2GsMMJS
 PAvv+eu92iOE6U1V54bRaTB9e49sQgQ=
X-Google-Smtp-Source: APXvYqy2p+FAppOav1iDlbrO5tYs7FvlSVeZ1jo9pinWdP/jHEsRxTLqxaJoH6H0YuT7EYoWl/bfVw==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr5033510wmh.164.1581003680390; 
 Thu, 06 Feb 2020 07:41:20 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id 25sm4044833wmi.32.2020.02.06.07.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 07:41:19 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu,  6 Feb 2020 15:41:18 +0000
Message-Id: <20200206154118.31451-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/include: public: Document the padding in
 struct xen_hvm_param
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClRoZXJlIGlzIGFuIGltcGxp
Y2l0IHBhZGRpbmcgb2YgMiBieXRlcyBpbiBzdHJ1Y3QgeGVuX2h2bV9wYXJhbSBiZXR3ZWVuCnRo
ZSBmaWVsZCBkb21pZCBhbmQgaW5kZXguIE1ha2UgaXQgZXhwbGljaXQgYnkgaW50cm9kdWNlIGEg
cGFkZGluZwpmaWVsZC4gVGhpcyBjYW4gYWxzbyBzZXJ2ZSBhcyBkb2N1bWVudGF0aW9uLgoKTm90
ZSB0aGF0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1hbmRhdGUgaXQgdG8gYmUgemVybyBiZWNhdXNl
IGEgZ3Vlc3QgbWF5Cm5vdCBoYXZlIGluaXRpYWxpemVkIHRoZSBwYWRkaW5nLgoKU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9w
dWJsaWMvaHZtL2h2bV9vcC5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oIGIveGVuL2luY2x1
ZGUvcHVibGljL2h2bS9odm1fb3AuaAppbmRleCA2MTBlMDIwYTYyLi5iNTk5ZDNjYmQwIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCisrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9odm0vaHZtX29wLmgKQEAgLTMyLDYgKzMyLDcgQEAKICNkZWZpbmUgSFZNT1BfZ2V0
X3BhcmFtICAgICAgICAgICAxCiBzdHJ1Y3QgeGVuX2h2bV9wYXJhbSB7CiAgICAgZG9taWRfdCAg
ZG9taWQ7ICAgIC8qIElOICovCisgICAgdWludDE2X3QgcGFkOwogICAgIHVpbnQzMl90IGluZGV4
OyAgICAvKiBJTiAqLwogICAgIHVpbnQ2NF90IHZhbHVlOyAgICAvKiBJTi9PVVQgKi8KIH07Ci0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
