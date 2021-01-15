Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480932F8645
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68605.122821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VPP-0000E6-IC; Fri, 15 Jan 2021 20:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68605.122821; Fri, 15 Jan 2021 20:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VPP-0000DU-Eo; Fri, 15 Jan 2021 20:09:23 +0000
Received: by outflank-mailman (input) for mailman id 68605;
 Fri, 15 Jan 2021 20:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1kp=GS=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1l0VPN-0000Aj-6R
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:09:21 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9ac2d1f-d002-46b9-8d10-f98ab607f44b;
 Fri, 15 Jan 2021 20:09:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e15so2246753wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 12:09:18 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id d85sm9187863wmd.2.2021.01.15.12.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:09:16 -0800 (PST)
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
X-Inumbo-ID: f9ac2d1f-d002-46b9-8d10-f98ab607f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aiJUe/D+M6zdYoqU8/tCGnMlqOxFrCNb2GHwWBgB6XE=;
        b=dSqWxy5oJbUPhoGZ0kJkRd2cNEx5u2GKs2BvohoeKfNCcPJhr2Eu60z6vjzxq/40aN
         glgoqChgxqONYcrADHOUNx2SAbmIdyugzHGjcwAfK+IGJbWjyqOFoCOnNrJsRyuZ73GM
         ajB7yxsGQvusQMPlxvi6EQSO7extZO99Jze3AkqqxSQlrR9cBUH7LFx9BHVjWO4NVWZI
         EiRX3iCscVdNpnfjJCMuIQEvt/MdUGmvt9JbNZuSoBP+A2j09IlgIriYQv58JVaXSLpB
         eWTUAgMgNSZG8vtSDnHBneQoIxOiEZXrirrBiXBWfYRfCWc7r1+5ZlnwZDhU1hIS7a/5
         b5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aiJUe/D+M6zdYoqU8/tCGnMlqOxFrCNb2GHwWBgB6XE=;
        b=neq7Gc78jApJKEVkVcXqomoeVcxpWfIkLxF4ps0xRkUspT8dF52Em198RpRXPkTste
         gNbGnn65pHTBrpv1+WXwP8Y0ih5H/0nUx28Jadyw6kU7rEdK2hEB4wwsuajPkFlkeMBZ
         TcMiEFPFVRIfpybSV/rSpP3z4i/H0Kg0saqvYjn0xYDBU4ZW1A4mDtVMq1zHTu93LCGO
         GiQJ9gq6OUZanIkntLiGDMgOJI081E0+SJQD/OPfnDsLua3Oi+65SnCOLikd963jVVNA
         h5UYT4HiuKSqwpwQixDSZxJa/BdeXBSci61Gr18A13ubeI+n5xqoQX9VNRNIY0kxg+fl
         25+A==
X-Gm-Message-State: AOAM533l8zbb3PXvgMk85ALk9OtKRmQrJxj6XGJRHtdnXCWZSDnvrdp8
	dYPLBTaC+AqYQDzn0pfLr3JdDQ==
X-Google-Smtp-Source: ABdhPJz6z8ooRqEJMuEtAZ3z0VQGV3ToTw4T17vOw6fkh1inINUIw2LGxPtLCYYvw9uakPUqYWmMKw==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr10484579wmj.148.1610741357695;
        Fri, 15 Jan 2021 12:09:17 -0800 (PST)
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
	bpf@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 2/7] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
Date: Fri, 15 Jan 2021 20:09:00 +0000
Message-Id: <20210115200905.3470941-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200905.3470941-1-lee.jones@linaro.org>
References: <20210115200905.3470941-1-lee.jones@linaro.org>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/xen-netback/xenbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 6f10e0998f1ce..a5439c130130f 100644
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
@@ -996,7 +996,7 @@ static int netback_remove(struct xenbus_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and switch to InitWait.
  */
-- 
2.25.1


