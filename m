Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B45BF137
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRpz-0008Vy-NV; Thu, 26 Sep 2019 11:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDRpx-0008VA-V9
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:21:29 +0000
X-Inumbo-ID: b7b75ade-e04f-11e9-8628-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id b7b75ade-e04f-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 11:21:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 7so1750888ljw.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 04:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PP/VjCirtf62JuUXAIgxc4DAqvRxb7TJRTNxqLi+RKw=;
 b=gHEK4qTRrBL9iJoDvHHIsBU79+gxfhQEstsdh08qeERe+0Zb0paZdUa4TEfbrIGgDl
 6vvLCn9PkMyEfYDmOX6R+8PObE2q7EjSHalL/++uGgXjObPF6tL1inOs13bhCfte0s6S
 t4XC2RNQt2VmGnsFiBkzOIi28wp10kOdaNjRdu8iKMHPO+uVWzVtRhE9LZZir0TQV5tj
 +8CePFDMqccYTzGoW9ScLgV11iQzqENZRev+bQegNAs1y80eMk0Jv6CXgi4kX0G/yPtS
 SJEPfB2uDabAuFZOKCGcfsRifFmDzBAQoS+L00DkBESsO5k1J0NqWJTHcoG3iYZQ1Xnr
 DGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PP/VjCirtf62JuUXAIgxc4DAqvRxb7TJRTNxqLi+RKw=;
 b=fzcyWVpZRfmEExdE1D9XM1qtulwl2JVinGNMdLBJq7qUyFJ5ntFNelpFhzSJoyC1Da
 5yOHUEdYMnRPsWVZhLw8ZOowwSLbQA35IEUnKywJ8KOXXmdoO+J9jF0rN9y/Udybutw2
 Qz7C3husbMHxvo5FEAnwtL1GbIWktMQxGG8TTwuD2/6vu1y9447iKRW3fjiDW7e5cfmD
 duD1YVQ7VJhbDbFSoYMKZJ16NfVxQToTeDERCbh5L9zWnd3nCJ44eg8aSfLgvCb9FzLa
 0QKFXJdz6/A3Vg1n3fYzI6eYOCNoGvhViuJ792EAVN/ncku72dSiSadr+36kyhq6ZDJI
 A77A==
X-Gm-Message-State: APjAAAXfo3b2hRaG0lahAAAb/2MxTTUWYpN50lGOnH9TQ/u2CtOHt4X7
 qWYX/8mGcb6ySVFNycCQ10K47cA+kAI=
X-Google-Smtp-Source: APXvYqz558FAI0odJXtBBprOAYGnm59YfY4e7NUgz0pW4r/Tty6ZmJyaPWCP7E1rDh9Z/xTZwBtRgQ==
X-Received: by 2002:a2e:3e07:: with SMTP id l7mr2235257lja.180.1569496859588; 
 Thu, 26 Sep 2019 04:20:59 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n4sm526810lfi.63.2019.09.26.04.20.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 26 Sep 2019 04:20:59 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 14:20:32 +0300
Message-Id: <1569496834-7796-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V6 6/8] iommu: Order the headers alphabetically
 in device_tree.c
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ2xlYW4gdXAgdGhlIGNvZGUgYSBiaXQgYnkgcHV0dGluZyB0aGUgaGVhZGVycyBpbiBhbHBo
YWJldGljYWwgb3JkZXIuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKLS0tCkNoYW5nZXMgbmV3IC0+IFY2OgogICAgLSBhZGRlZCBKdWxp
ZW4ncyBBLWIKLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jIHwgNiAr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMKaW5kZXggZWE5ZmQ1NC4uOTIxYTZlNSAx
MDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYworKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCkBAIC0xNSwxMSArMTUsMTEgQEAK
ICAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAgKi8KIAot
I2luY2x1ZGUgPHhlbi9saWIuaD4KLSNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4
ZW4vZGV2aWNlX3RyZWUuaD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+CiAjaW5jbHVk
ZSA8eGVuL2lvbW11Lmg+Ci0jaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+CisjaW5jbHVkZSA8
eGVuL2xpYi5oPgorI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogI2luY2x1ZGUgPHhzbS94c20uaD4K
IAogc3RhdGljIHNwaW5sb2NrX3QgZHRkZXZzX2xvY2sgPSBTUElOX0xPQ0tfVU5MT0NLRUQ7Ci0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
