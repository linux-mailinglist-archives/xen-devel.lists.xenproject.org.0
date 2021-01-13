Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3D2F5029
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 17:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66623.118399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjDD-0006iW-Qa; Wed, 13 Jan 2021 16:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66623.118399; Wed, 13 Jan 2021 16:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjDD-0006hu-NH; Wed, 13 Jan 2021 16:41:35 +0000
Received: by outflank-mailman (input) for mailman id 66623;
 Wed, 13 Jan 2021 16:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmDu=GQ=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kzjDC-0006fy-Is
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 16:41:34 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0d64739-1bac-4325-a27d-6af3040d105c;
 Wed, 13 Jan 2021 16:41:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g10so2197521wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 08:41:31 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t16sm3836510wmi.3.2021.01.13.08.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 08:41:30 -0800 (PST)
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
X-Inumbo-ID: b0d64739-1bac-4325-a27d-6af3040d105c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aiJUe/D+M6zdYoqU8/tCGnMlqOxFrCNb2GHwWBgB6XE=;
        b=I2+vBPUo2gCDgiYWasmO1sHtcTTH3xkuV7X1/PG1lVWzqDGzxS+DPTM7vtbs/a3vlF
         AjP4BoPGp2d7XG4o/5xlRDfGl2c4kbqcbY66emR7gtkYV/xFH+50jXYNtemN3ebZfjcq
         C9LGwyAVyxeTnqbX9lnb9cJjm4RAFRmDQF76tFG+luN9mMjhywtY2R4FmhpXQzgTXNoO
         rrPcPeUqUM0jRe0vKlhamn5MjnNtd5wkhyaAtm29D3+T8MDPbUpOk5iY17WAaEEiApX8
         P5iDLC4rQF1wYGOR6WegCf3/XUW87F5Ufdli3BgjXMUMpuKARuTpwoc/H1uxOexECHeG
         xXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aiJUe/D+M6zdYoqU8/tCGnMlqOxFrCNb2GHwWBgB6XE=;
        b=cswMf2/X6i8rTzU3ri9fxhSU+x2aUvapjngD2HD5g78+r6bmGiRJWwr7F4MQC/gBuG
         M8+z4VIX+cXhoaGc1A7FgurhtM4qI7xCYu+Cwfj37c9eLV5ydh3LylGvQpqfWfMKgas/
         rkYe0i8k+dlR8/zZ52deij/QwayVGAWn2AX612EcKDlN7T76knbIP+RC2D2GBSYDV4+A
         WdIIUe+4h0AQJ3fTb/FEeZGqLI5TWVCqAUsi6gh6WRQXw0oJQa+jeig5gZb3dbBEKSIV
         nqZ21x3U1TjenOrYjCDL9w/U79ZutU8VhQEzTyC3XHf48WgdzpiLRqYbrusnM3WY8tf0
         70Vg==
X-Gm-Message-State: AOAM530PixO2YwrXL46iDF/owUcBio40fg7FQIQre2gDWoUUjKqfcltq
	bbBeLiGoMSpCJJqHac/VeDUJSQ==
X-Google-Smtp-Source: ABdhPJzZKsF+KFl6JetQF9891E8WXoNT3YtrK5nhBf3OfzOmajMtez683HLPz3xwrwa6JkZW4uFwjw==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr135849wma.112.1610556090778;
        Wed, 13 Jan 2021 08:41:30 -0800 (PST)
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
Date: Wed, 13 Jan 2021 16:41:18 +0000
Message-Id: <20210113164123.1334116-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113164123.1334116-1-lee.jones@linaro.org>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
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


