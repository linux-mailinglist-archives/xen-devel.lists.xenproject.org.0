Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33092C55DC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 14:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38553.71311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiHUH-0007Tr-Dm; Thu, 26 Nov 2020 13:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38553.71311; Thu, 26 Nov 2020 13:39:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiHUH-0007TL-AM; Thu, 26 Nov 2020 13:39:05 +0000
Received: by outflank-mailman (input) for mailman id 38553;
 Thu, 26 Nov 2020 13:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnMB=FA=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kiHUG-0007RG-1I
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:39:04 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 050c9ea9-0c14-4648-b2c1-25c7fdaf621a;
 Thu, 26 Nov 2020 13:39:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g14so2148226wrm.13
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:39:00 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:38:59 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tnMB=FA=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
	id 1kiHUG-0007RG-1I
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:39:04 +0000
X-Inumbo-ID: 050c9ea9-0c14-4648-b2c1-25c7fdaf621a
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 050c9ea9-0c14-4648-b2c1-25c7fdaf621a;
	Thu, 26 Nov 2020 13:39:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g14so2148226wrm.13
        for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvDQ8jiSdggfocg7QevhSStHyCThX2E8vELTACyHnVM=;
        b=hfIUxVh9cOOEk1+Xnm9Js0JYx8f+4mDVffWLE+RpCmxL0UzygV22nLn5ImHdR94WtJ
         V84dJowMWFbBc/vOV5VcNtNwABoiSipolRFrT0sotRub7aAlqP7agQXikgVrvCdA2QhE
         1XMvyzZ2DaV11usuc9FgvVwCcGCAeKOuUfuG2YhlvYZaw/Cosi3dFUAOofTHESywFkhR
         lXBStbyPFd9fMWdFbVbWSRWZUoZaIwrvHuPNfaOuddOq/VwH+UM2FYbBPeQvNclUYX3v
         bWqIk2ZR8IZOZymlbf8n4zvsR+avPkwgP+ylWMDUOng9/e7F1EqjwxWl5IwWm0RAijtc
         4L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvDQ8jiSdggfocg7QevhSStHyCThX2E8vELTACyHnVM=;
        b=Tj90SPS8lhBioxVfRh/k1B/KWNUyFyMtx7KmO+2BseQliEFJjf9iUfX7Lci1aZwqWK
         hu13F/T0Nlx47KIZ9MPWS86JXSx6lvd4edkQAVafBg0d3zXw5Jyejn7I0BBNLHI9hY+i
         B5DzNCMyr2zEXYWGovjFs0CZ7rN5hLaChqTa91VqUDyjnHl39d1qKexGlX0GYBZ3A1cu
         S1Q5LpybLqsZf+XA5ClCQs0CDu4HOCDl84E/BBOJ4u5biJ71RcKvn+UqGLvPsWczylqG
         6aPmV0XN7mtShoTWigp0Tj2ZX1ssSRASgvQwvLLisUZi3mIuIRdHfXGSkFPl9pdxO3US
         liaA==
X-Gm-Message-State: AOAM533EgWbwykP0X++omyU2iQMdT8a+iJDqFL/P6MVAQQgfzMGKq8q4
	YAbYJEfIfv8foiRm88P4yIvh8Q==
X-Google-Smtp-Source: ABdhPJxxuDr0CFihwvoh9qXdvCtCohE03uRRltH7bO3tWEys9Iub2oFH9hIvPdZDltlla0WbomeVaw==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr3939773wro.5.1606397940009;
        Thu, 26 Nov 2020 05:39:00 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:38:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 2/8] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
Date: Thu, 26 Nov 2020 13:38:47 +0000
Message-Id: <20201126133853.3213268-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126133853.3213268-1-lee.jones@linaro.org>
References: <20201126133853.3213268-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'dev' not described in 'frontend_changed'
 drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'frontend_state' not described in 'frontend_changed'
 drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'dev' not described in 'netback_probe'
 drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'id' not described in 'netback_probe'

Cc: Wei Liu <wei.liu@kernel.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/xen-netback/xenbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index f1c1624cec8f5..de1b5471d929b 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -411,7 +411,7 @@ static void read_xenbus_frontend_xdp(struct backend_info *be,
 	vif->xdp_headroom = headroom;
 }
 
-/**
+/*
  * Callback received when the frontend's state changes.
  */
 static void frontend_changed(struct xenbus_device *dev,
@@ -992,7 +992,7 @@ static int netback_remove(struct xenbus_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and switch to InitWait.
  */
-- 
2.25.1


