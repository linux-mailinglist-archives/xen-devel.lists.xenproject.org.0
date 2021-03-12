Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C017A338AA5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 11:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96986.184028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfSO-0002I7-R7; Fri, 12 Mar 2021 10:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96986.184028; Fri, 12 Mar 2021 10:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfSO-0002Hg-Na; Fri, 12 Mar 2021 10:55:48 +0000
Received: by outflank-mailman (input) for mailman id 96986;
 Fri, 12 Mar 2021 10:55:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO+b=IK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lKfSN-0002HH-9y
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:55:47 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2feb718-2784-4f6b-9116-1a65313704b9;
 Fri, 12 Mar 2021 10:55:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so15516163wmy.5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 02:55:46 -0800 (PST)
Received: from dell.default ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id q15sm7264962wrr.58.2021.03.12.02.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:55:45 -0800 (PST)
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
X-Inumbo-ID: e2feb718-2784-4f6b-9116-1a65313704b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xA52xjDJnHJLgzflByk0CYC2xv7fgNWSlI8xs2AjI2I=;
        b=yBhGkoCBvWZlTxApi3aQJCnXm6iZzfXW4lQ1f6lbu63T/UR1hwscaZQgi6mFsVg64a
         oiA/rWoXUQKQGJ5nth3GW+1+N6Q9vQ+LsOSskFQvM5+FfVpyUsxa1oVrzuO7bgSsVet+
         1LCEz6xdgaUNJ0NNVGWeHhf6ln0L/JSLz2qMsYBqA3fk6Yl2JEUPxgAQyQB+GlNOero6
         ZpeDtbIKY2N+DkzL73rgHW+TRdFtjfwk7QEw69eurO+gkMsQEIQpbkTgDWbcfs1q/+t5
         Bx5XTPDeM450Q5ULCtVDlRXPeZuf8JJp9FGJSRNnul8wY2tmaHUSIYbYczvw3aGjkxBJ
         9yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xA52xjDJnHJLgzflByk0CYC2xv7fgNWSlI8xs2AjI2I=;
        b=OrpPU0zF0OA0BC1kA7f9IxAylP5h0EKdN8DbuLnYMDMw9JqKrJDeEwdmNP1U3c2orl
         7V4aSF7iL5HKiFcbzXIYGLc8CI/IbOq9HKECu/DM9Ey9m4ljPPfoCRTQ5NCTQDZsQeAr
         7PRwSyzIfzccc5Fh69XwDks6NNow0WLFERTnHibNcdTk1JeNBAtsoAjaqqtW+nhCwqic
         ni0aClv7jTe9VU1Q8GyhmUtQeHqgCf3cCZx0fS96rVf4bMfEdR7iwMVoQsxaf+JnynTI
         w3N1Ka2OTzAHOmEmuC3pRKUnNgBC5bvmE2ibmTUxW2+54Auq/i0OO4uQhfZ4TVnK+DPo
         k8rQ==
X-Gm-Message-State: AOAM533CMLdCiDDM9SuW3QnfSfa0/HhW4VmWieCUDs2jgZBgvSb90k++
	ZTdljtBQnc30tELoaxFiJK6cQg==
X-Google-Smtp-Source: ABdhPJyuSwTDyvh7rCaXNW786qrIPBHDymlJenX8Hl8exjSrhayuRqjYskb8CzXmWzlIWfVNFKDDdw==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr12656107wme.34.1615546545649;
        Fri, 12 Mar 2021 02:55:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 10/11] block: xen-blkfront: Demote kernel-doc abuses
Date: Fri, 12 Mar 2021 10:55:29 +0000
Message-Id: <20210312105530.2219008-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/block/xen-blkfront.c:1960: warning: Function parameter or member 'dev' not described in 'blkfront_probe'
 drivers/block/xen-blkfront.c:1960: warning: Function parameter or member 'id' not described in 'blkfront_probe'
 drivers/block/xen-blkfront.c:1960: warning: expecting prototype for Allocate the basic(). Prototype was for blkfront_probe() instead
 drivers/block/xen-blkfront.c:2085: warning: Function parameter or member 'dev' not described in 'blkfront_resume'
 drivers/block/xen-blkfront.c:2085: warning: expecting prototype for or a backend(). Prototype was for blkfront_resume() instead
 drivers/block/xen-blkfront.c:2444: warning: wrong kernel-doc identifier on line:

Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org
Cc: linux-block@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/block/xen-blkfront.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index e1c6798889f48..e57e3cd354fb8 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1949,7 +1949,7 @@ module_param(feature_persistent, bool, 0644);
 MODULE_PARM_DESC(feature_persistent,
 		"Enables the persistent grants feature");
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffer for communication with the backend, and
  * inform the backend of the appropriate details for those.  Switch to
@@ -2075,7 +2075,7 @@ static int blkif_recover(struct blkfront_info *info)
 	return 0;
 }
 
-/**
+/*
  * We are reconnecting to the backend, due to a suspend/resume, or a backend
  * driver restart.  We tear down our blkif structure and recreate it, but
  * leave the device-layer structures intact so that this is transparent to the
@@ -2440,7 +2440,7 @@ static void blkfront_connect(struct blkfront_info *info)
 	return;
 }
 
-/**
+/*
  * Callback received when the backend's state changes.
  */
 static void blkback_changed(struct xenbus_device *dev,
-- 
2.27.0


