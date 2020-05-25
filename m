Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0211E04FB
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Gm-0005KM-RW; Mon, 25 May 2020 02:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Gl-0005KG-7m
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:55:15 +0000
X-Inumbo-ID: 2880af94-9e33-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2880af94-9e33-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 02:55:14 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m44so12933066qtm.8
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OuwE3uDSMnd3YhVaR0Jjj0ukVHHDRwTxTijFqTevWsY=;
 b=UiYVTOOJjuzzNGsN7JOkvx2OzXqdzXXosyG3cYLmbduVd8NThatlQshr9l0nCfJA2R
 fsOHu8CSa6plajp7QUa5NSFfApBmxBNq+8zWsYfbzad773SlG/nPEJaaNp0q4wOezUpB
 SwIMtX4SKwFxukM7aBov4UZEYn+PXx1KqJtK/YCvqnmuWW//+18poNR8U4KDWg991nXx
 60dCPu6xtCiYwjME1PASk1KLySeRVoVX8E2v2uoMVpMsFvyjgqOrgmsN3YSSKNW/Hth8
 qfxnazovfWRBHX7IDpyAashDiW3l9lS1H2gOy4k5aTLDN+Zr6Ab0yRkTa/1ghOMvv2mA
 Q+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OuwE3uDSMnd3YhVaR0Jjj0ukVHHDRwTxTijFqTevWsY=;
 b=Y3QGUX8Wu/ig6/f0UdItsCWt+V3PrOgf2Kc55nOaAGQpExhxv7s9uTfnmaJfF908Aj
 mO/gWpEUfeuQQ570b3/Zp5HEiMNW/ctSHGmlzQaX650ZoE4XoKJSu40Q7wGVhKEgedGE
 5nWBqCzFL2aql/76b+bO8rtEN3wgfuL4T4Zwlp+59r5z3lnMu6ig90xhfFHK6/+qtDSq
 VdCAjNT9zRhPt/x+M4YOc7QiwDdTl6pGkARFC5mFZmjHflslKJ5ZuqWbOeKCG8BxVMh5
 tnyAaFQ7mZBMf3qdwTk5kJMMwqoL9AWSVPAss9uZWPHbjFSCcAooyJ5+aWJCk6gtNGmP
 NN1w==
X-Gm-Message-State: AOAM533+UI0MOCaMKlNB1u9HzTMGBIThR1hqGaSAPw3YgmKLeOp73bP6
 rRR/2kNYs/Hkf27oR2H8L1soR3Xi
X-Google-Smtp-Source: ABdhPJzdVpB3atFyil/XFxkZ4T9UIE0QW8WSS0kMYpTZ1Q9tdAuBDATICxxxs4ULkcHQ3QKuq0X5Zw==
X-Received: by 2002:ac8:8f7:: with SMTP id y52mr26765599qth.104.1590375314321; 
 Sun, 24 May 2020 19:55:14 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id n13sm2739984qtb.20.2020.05.24.19.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:55:13 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
Date: Sun, 24 May 2020 22:55:06 -0400
Message-Id: <20200525025506.225959-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add qemu-xen linux device model stubdomain to the Toolstack section as a
Tech Preview.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 SUPPORT.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index e3a366fd56..25becc9192 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -153,6 +153,12 @@ Go (golang) bindings for libxl
 
     Status: Experimental
 
+### Linux device model stubdomains
+
+Support for running qemu-xen device model in a linux stubdomain.
+
+    Status: Tech Preview
+
 ## Toolstack/3rd party
 
 ### libvirt driver for xl
-- 
2.25.1


