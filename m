Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01D1D8D6A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarVU-0001Ak-BT; Tue, 19 May 2020 01:57:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarVS-00019O-NQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:57:22 +0000
X-Inumbo-ID: f47caa90-9973-11ea-9887-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f47caa90-9973-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 01:56:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x12so9906678qts.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lx2s1mvPB2z7P0TCofZ4ZdaYHQdnvDFnijuTkR+OyI=;
 b=DQA/lDYikmIzpyMpAWL2Ah5GnWBzNAHqJQmCFJLRMgO19L1i6DmfI8Sfarert7aqF+
 YJp+hF5fIZ6nCcfx9JwziCSXHP837ryCwPcafLU9RNqq5Cu0S64EOPWg6qd3EhV//SoD
 qxvB3d6fF/rb81+GioysD7qWJ3/nHLu5lO1WIkx+Ijyqpb0Bwr+T5541GMwMsdO7StDr
 dwbKcwkKg7nkoSNXRM6EkQ8Qt8CUU1aNjiXhaPAPZcBsRRxnLvLDR51h7TpvZtBfYVSd
 GyDCBb11ezV4FBFARzm2aM4gvyk+6XTqx1LqxUBO1ri9b6FB1ediTL0cemyaxDy9EX+/
 q/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lx2s1mvPB2z7P0TCofZ4ZdaYHQdnvDFnijuTkR+OyI=;
 b=OEit5RLGrWOiD74QYWZuObZb0rHnaXsASa9sRK4kgOauaAUv/rKZ5kLX1RkEDVx2j0
 AIDz0zQ6wYk6u5hPoRgNNyP5ndDjiNDYVsyOT/0qDsNqWFb1TSCS1b1IDN+fyYoVQ9xv
 lLquNrBfYzzxjh24YL0IAX94flbH7qA9ttG/iiZ1+vLrNzt/RBv0No9QHjgy1F6SK7x8
 XPwLvepEbdPq3uKpYvqR39NR0EuOLd1MNyve7BEi2YKupUi+bcj3iFt6s/0UY2g6pMgZ
 hhO4BBg1fUyhaM7AbFeJy/9xMIUrbBna6zrJ+sUy3pnTto4NVRrkBIHDog4A9JV72WkL
 LDzw==
X-Gm-Message-State: AOAM532x/B5+h3C9kpxFlJvVjwpRey+ZJOumgZRKJM4RI0tMTq55zMeS
 jbkNRV2Fx+3/aeC3+3wUEmpgqY9U
X-Google-Smtp-Source: ABdhPJw5yZkFl9IpXV431nEJj85p8N0Z6g2agmpa0BQy0bXY2sJpEBqPeZOKzx+Y+vo9oz0spg//vw==
X-Received: by 2002:ac8:6d3a:: with SMTP id r26mr19493770qtu.65.1589853388518; 
 Mon, 18 May 2020 18:56:28 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:27 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 19/19] libxl: Check stubdomain kernel & ramdisk presence
Date: Mon, 18 May 2020 21:55:03 -0400
Message-Id: <20200519015503.115236-20-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just out of context is the following comment for libxl__domain_make:
/* fixme: this function can leak the stubdom if it fails */

When the stubdomain kernel or ramdisk is not present, the domid and
stubdomain name will indeed be leaked.  Avoid the leak by checking the
file presence and erroring out when absent.  It doesn't fix all cases,
but it avoids a big one when using a linux device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 454a2815ed..f2dc5696b9 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2327,6 +2327,22 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         dm_config->num_vkbs = 1;
     }
 
+    if (guest_config->b_info.stubdomain_kernel &&
+        access(guest_config->b_info.stubdomain_kernel, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain kernel %s",
+              guest_config->b_info.stubdomain_kernel);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
+    if (guest_config->b_info.stubdomain_ramdisk &&
+        access(guest_config->b_info.stubdomain_ramdisk, R_OK) != 0) {
+        LOGED(ERROR, guest_domid, "could not access stubdomain ramdisk %s",
+              guest_config->b_info.stubdomain_ramdisk);
+        ret = ERROR_INVAL;
+        goto out;
+    }
+
     stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
     stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
 
-- 
2.25.1


