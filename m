Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7AADF246
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 18:00:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa3r-0008AV-C3; Mon, 21 Oct 2019 15:57:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa3p-0008AE-RV
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:33 +0000
X-Inumbo-ID: 78e19b6e-f41b-11e9-beca-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78e19b6e-f41b-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q70so6756329wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tia3kYMdHxFsxkVNqNvRacsDlGGCJoGWY2kOgcv/rhY=;
 b=RgUlxrsaouBV1/zOw/oU8WQUPmKTkkz0GSxhjtDrHHKigzUYK/vXkcczo1zgiCYZiq
 ftKdrABaJSdoEib7Oyw+yeKxS9GBKQLYwJfgTCgEAqJQBH2kIEibUbfWMnpH5c1V0QFc
 1YzP7A3K0vTPnCBMVjKjyxsV+GAl4MFcIzTzBSYdXy3Kn6VFuRqH4wgbdpZYGsFEsCiw
 vdQDXne40Tb5pFeA83OK1DLEPG5VuqR9BUbfBFRONClLep4Bb53UdZLewISt5kPxvJN0
 cN79uBTqrTCezFbMWBtT1y690ZkRno/n6JRWTPjtVHMGEGk5xcCgCh7XB/LlvbkKSKMS
 6WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tia3kYMdHxFsxkVNqNvRacsDlGGCJoGWY2kOgcv/rhY=;
 b=sPpL1y3Rf4nWsZOogu6qryFjPbc22LFvZQGGgi6YTm6Bg/sdZaIl8nfsf3FoTlSW4d
 JjJrlkS+KhCjfyInUwVLKII3HrwELWnoMOC/Sks0klt9Xp8Ki2Pk1hBztAQDH7NFazy5
 B6vXC2n0am7r3fOhp8UuDNuasY8M4kRGk2K85v36OllmTxSlYDhGZmf3VGMnCKfVvQIT
 ys98NMBDOIb0szm955gA/xvmG68mqW7CTccfyMQoBQ6y/In5l4gLmNeQ/+7G61VmoKWv
 kdsI1s8S+zw4qFZdjM+pFm9gt4qIiOztjpUm9RTCkOBWlF3Q9X1umURSbVTFM90mG1BG
 rCLg==
X-Gm-Message-State: APjAAAXB97kKDH5IkJqPtwnO4jyN0B7cN4F325Sa8MKVhOdrr33a8Or6
 NXJ3I2Gw2rzwLRl+oJSwYgvoFYFCoq0=
X-Google-Smtp-Source: APXvYqzlOafkrkZa7u8z2vDCCyGrxTdYBi4FGl9yCddG0R2z+lZdDw6knnKCDA6wfwvWiLgbkngz4w==
X-Received: by 2002:a1c:6885:: with SMTP id d127mr14663510wmc.64.1571673443676; 
 Mon, 21 Oct 2019 08:57:23 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:23 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:11 +0100
Message-Id: <20191021155718.28653-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 2/9] x86: include asm_defns.h
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
