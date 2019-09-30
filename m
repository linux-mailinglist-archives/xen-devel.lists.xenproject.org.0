Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14902C23D9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:03:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExAb-00064E-SU; Mon, 30 Sep 2019 15:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExAa-00063o-8v
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:01:00 +0000
X-Inumbo-ID: 17890c50-e393-11e9-8628-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by localhost (Halon) with ESMTPS
 id 17890c50-e393-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 15:00:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y21so13130994wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tia3kYMdHxFsxkVNqNvRacsDlGGCJoGWY2kOgcv/rhY=;
 b=ZZE+Smqv8SKx/lDdt5xSTZ490yyZbQ+bFlQ4eXsPSETZB1yTAd43BVEc48ps8ReY4K
 bUPw6ScBu+ZqWpS2lRdSwSJq46Yf3TTgi4bswrWq1Huef42UzMYudEg8ChMePTsVY+eK
 ph+Sv5Fdyc2BI86HNIFwionteFQJwv005TFM27PVlNhi16OpHGXki9uheWZBgQjdDtXG
 fJzJJMofAHlXJp2GyLfiGOHBA/WqGQzchWtEvUPzmA25IleWqmuCVbsYAeOH7jA3OhlX
 R7LDrlycTYBAtUSKTWyoMSHnerQDNNL5HwWyMTQbeixzwEgV0KLhVisjC5G6n1PK9kg/
 pimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tia3kYMdHxFsxkVNqNvRacsDlGGCJoGWY2kOgcv/rhY=;
 b=Qa9iFOhbPB4AmQ8kwYXYXzXEZGfcnzAN3nf4kS1hCvOoJqXvLWZlwIptlBQEBDwimI
 aJ6j+leGWCL1aW9e2BsMz9OTvNh8aVZv+/owH/6bP086Zcn0lD242ibLmvAHNKGV0Ajx
 ST/peyAH5SieRb4diuwy+ojcUqCluKP/bhSpIi70w51nRS4hrDat7AUEIElIvxvDfSxs
 Xx3vjs6GWQyPs+4qyj6LXPG6fRNTY3AqBP1lX3Z6HuWznJVyluo6CMK5xPcutos58Kb5
 4PkknTQarGpD6uefMbgOaPT9CxRntUwz7QL+v587hE4apKmucQt144CIy0VASMVokmno
 30jA==
X-Gm-Message-State: APjAAAUs3SbfwycgC3or/XcgQKf6b2yahr8qmr35q+5SOQSUBLaLhC/v
 mhWfdf3lufNdetLe/s98yGt766MdKKk=
X-Google-Smtp-Source: APXvYqzVQPjIRP7Y+oWe8P+rZLBXPXZStNankz27B3dhmeHqArt0tCCFDM2vFRpX2b6+Bq/oh98ppA==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr18252084wml.52.1569855650185; 
 Mon, 30 Sep 2019 08:00:50 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm32870852wme.40.2019.09.30.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:00:49 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 16:00:36 +0100
Message-Id: <20190930150044.5734-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190930150044.5734-1-liuwe@microsoft.com>
References: <20190930150044.5734-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2 2/9] x86: include asm_defns.h
 directly in hypercall.h
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QVNNX0NBTExfQ09OU1RSQUlOVCBpcyBkZWZpbmVkIHRoZXJlLgoKTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVyY2FsbC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAppbmRleCBk
NTQ4ODE2YjMwLi5jOWRlY2E2ZmZjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVyY2FsbC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJjYWxs
LmgKQEAgLTIzLDYgKzIzLDggQEAKIAogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogCisjaW5jbHVk
ZSA8YXNtL2FzbV9kZWZucy5oPgorCiAjaW5jbHVkZSA8cHVibGljL3hlbi5oPgogI2luY2x1ZGUg
PHB1YmxpYy9zY2hlZC5oPgogI2luY2x1ZGUgPHB1YmxpYy9odm0vaHZtX29wLmg+Ci0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
