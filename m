Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DA2A601F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18910.44028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEkV-00065p-FE; Wed, 04 Nov 2020 09:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18910.44028; Wed, 04 Nov 2020 09:06:35 +0000
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
	id 1kaEkV-00065D-Bf; Wed, 04 Nov 2020 09:06:35 +0000
Received: by outflank-mailman (input) for mailman id 18910;
 Wed, 04 Nov 2020 09:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okXs=EK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kaEkU-00060O-Qw
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:34 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee51d789-2cc9-4a37-83c3-5fba1d2b78c6;
 Wed, 04 Nov 2020 09:06:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x7so21205841wrl.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:30 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:29 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=okXs=EK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
	id 1kaEkU-00060O-Qw
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:34 +0000
X-Inumbo-ID: ee51d789-2cc9-4a37-83c3-5fba1d2b78c6
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee51d789-2cc9-4a37-83c3-5fba1d2b78c6;
	Wed, 04 Nov 2020 09:06:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x7so21205841wrl.3
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvDQ8jiSdggfocg7QevhSStHyCThX2E8vELTACyHnVM=;
        b=O+gghJDvfp86xHKWNgfCUbwJBZer6plfg8irRb7mhXGvdo7nvbxcHUd63h6bvqOdkS
         tSUboDCoCYlt9DCY7qiK941vY9cWWcrT5dhUFhaoj+IwczKKPvBRX+IcCuLvSThGRsjC
         D58ezTytuMvEmOQY2bTv2oJzSy7M8A1Ra31v/4WhDJ/gdw2Ed9Acb+z0jHdgaSO/RfzF
         aUbBPxkvtygM9zIr6Vg1dDhySOxbbryxrnmEFSg9EURVG1o51j2usPgmkNmwHgmn7/fp
         pBtT9CLc2nU/2WTyzWyLqGfkFnDvqMLpQf/WYFc17TlKpg2vLmamvONRa7oY8mjJW1dG
         wp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvDQ8jiSdggfocg7QevhSStHyCThX2E8vELTACyHnVM=;
        b=Mlm/QNeibY56rRST5gEBt26H2PqzvCEguOAB3sBSsvoTva3kzD/WKdEFsKmOpCPnGw
         L3z+uzxxRxDDgN1h6d6nKgCC8DMoj9nuJvRzDoKyiz912V4VzVr44XONmKO+d40ry6qo
         V1Z+A3CowaKmbTd5/m5bNhON20YahMmkQf7kntzU00/Oyvex/eoxYhAZNXktPDJaUB3/
         pQBd4OXSZYBYEWBSuqoKVBKlV8uh3GA4TVrr4uNySzxNl5YVlHGT2ROkvUz/G2MnWy+G
         jmC9hf0cgVF2Av8c4hnm3QDiWzF2op//4LlZfp+jlVFNKIhDMH0puDt5yukCfV5q0TJD
         vxyQ==
X-Gm-Message-State: AOAM531kpivMTCTeLo+AAZZ37yNYVqe+RTmXYXxfAgFQrqMHsFDz7cpM
	WQnyWkz4TPltLVjuTtXQ54TNAQ==
X-Google-Smtp-Source: ABdhPJxJr4EKzyziM/kfu7bfvSRJog/0BPh5wKW3PHtRCRM2FSGZw1LpbirvmDeO5VkFIi4ChKf8FQ==
X-Received: by 2002:a5d:490a:: with SMTP id x10mr30228709wrq.289.1604480789629;
        Wed, 04 Nov 2020 01:06:29 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 01:06:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 05/12] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
Date: Wed,  4 Nov 2020 09:06:03 +0000
Message-Id: <20201104090610.1446616-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104090610.1446616-1-lee.jones@linaro.org>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
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


