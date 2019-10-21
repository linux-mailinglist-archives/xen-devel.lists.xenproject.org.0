Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC694DF240
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa42-0008EX-59; Mon, 21 Oct 2019 15:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa3z-0008Dt-SO
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:43 +0000
X-Inumbo-ID: 79d23934-f41b-11e9-bbab-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d23934-f41b-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v9so3356474wrq.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4kqMtXKr2VI6xhju+2HY7aOkc8zfZUqqp0CH2GZ8kc=;
 b=el+It4BiEwx+dhiQlehX+3tMT8XfCZVwMtJvjBchGJzOm4dGe57t7lpbF3YzixAzL8
 gGadBC/BZOiH8wP2UizfpkDMzMCjL40fwkObRQCE3zdyaalTDwUmQzeQXKxk6QKkTiPZ
 S+73WKEtn7S0TJewHf6Ge/uLHGcTPxLIwQ8zf65UrbOdrihZy6Mzj4CDO6Rt0vT0SrBD
 hdTWoyp0vgloXY7XKQRhyp7fM4TBy8E5Hhompnr+xsuThTIk9ZvB5czQNCzE7q8H+WHO
 BAp0e/+y7ISgxxM7ZlICw0NGOT3hsmbyEquzHEIGEAc6042KL4XSgllPLtY7iL/yOWo+
 DD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N4kqMtXKr2VI6xhju+2HY7aOkc8zfZUqqp0CH2GZ8kc=;
 b=r9DSfa8a5L9NPb5hnmJpqhFUZVZCOWscnooFBq8XHBz7viOheR9WmK/yXTM7cMZtO2
 kXfm/i232wAxgcYPSkAZL5WX5/P1jfemBUrCdV06hS9lWCwz1iZDsOAmxOjzECtiZiOA
 PjZk2ZuHHjCfAIT9JmJUEP0qqutv3cMorps1vP1vqkwgGnQsJW0SFMbf2VMYUsOFNH66
 eXcONVCekGJnzdi936Q9Imk2bomZIgxffAqyzf/rPMvNwHpynbw3lKwJs4bgiKHHrF00
 7LXSh58HyLjLuoLcvJeFx2cuCQ9ryEq17psAragOoE+KEOCDB8Hp/wONFOA6L5flKl7v
 D7gw==
X-Gm-Message-State: APjAAAUQDQwgM6uBSI0u+Ap0RKQPhuDxrC5Kmse6EOKtezZRh+FdpmXc
 annqH6436HdlREsyYqETW87yPiamm8U=
X-Google-Smtp-Source: APXvYqzwrIPVWBtBGwvNDvcP+QiFfxITf+dHZITn8MCV8YvrsbPHAGKXjlux5EHhW5YqOJTKhLjTLA==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr12892447wrw.247.1571673445284; 
 Mon, 21 Oct 2019 08:57:25 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:24 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:13 +0100
Message-Id: <20191021155718.28653-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 4/9] x86: include xen/lib.h in
 guest/hypercall.h
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

V2UgbmVlZCBBU1NFUlRfVU5SRUFDSEFCTEUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcmNhbGwuaAppbmRleCBjOWRlY2E2ZmZjLi5kMGQyZjUwMjJkIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJjYWxsLmgKQEAgLTE4Miw2ICsxODIsOCBAQCBzdGF0aWMgaW5s
aW5lIGxvbmcgeGVuX2h5cGVyY2FsbF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IoCiAKICNlbHNl
IC8qIENPTkZJR19YRU5fR1VFU1QgKi8KIAorI2luY2x1ZGUgPHhlbi9saWIuaD4KKwogI2luY2x1
ZGUgPHB1YmxpYy9zY2hlZC5oPgogCiBzdGF0aWMgaW5saW5lIHZvaWQgeGVuX2h5cGVyY2FsbF9j
b25zb2xlX3dyaXRlKAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
