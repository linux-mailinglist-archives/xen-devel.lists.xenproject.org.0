Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA81D7C52
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:05:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahKk-0001jk-H8; Mon, 18 May 2020 15:05:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jahKj-0001ja-4u
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:05:37 +0000
X-Inumbo-ID: 06e66b40-9919-11ea-ae69-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06e66b40-9919-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 15:05:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so10246248ljd.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=5ZQonOkXHgWeke396MyrCrje/s40Q6/pN3g2SkH/8Xw=;
 b=tX18kMH5bs5YknKTJ3HuUOoTtLZo58+zr1cAemX1Tmh6VYaMCONXwi2FkFWtm0DlgN
 dni5gZar6g/Do1i+EoBfEdsg8IDw3AmYsM86Xj4swEcazOD95NBOPFpt4ZAyJTZgLUYc
 o4NH4JFcPIWUOhpE2hgKG3zSRjAYTJyjB8qSadvrQROr2vOTP7bLZFoo2h2oFwdPGUf6
 b//lGKi5TKTNO95ZGEczYABPNDFwgaVrlC3pUKkLDKfJKwtuf8m8lkMepr3bMhhwmfcs
 tmc0zsd24wUuMscSYNu+HK3r6UAy0ljyBvptY35zrdm1S2NvXdQFeVlPoP7zf5vS+LVj
 3HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5ZQonOkXHgWeke396MyrCrje/s40Q6/pN3g2SkH/8Xw=;
 b=ulwOldVH/PbdrBdy8g0jlmW5EwbxKrCrwMSMHfFNEcXOC/uS+yzd9ARpeCvTeZNO4L
 a7BGdOQVL+YWScPalKXcQNyTeWnvOG/0O1ctwDNpOW7jUrdwwJPIZCAGgnbUAuyof/3O
 vnNeGo+COeoofExMzn5u6I/MQsxlVio4c1hXvwCM3vI0cCgdNEZJPQ8I3rnZuv7mqtLa
 lPcr1XyNdKQBPLpvZbqGRHgMihyUmCMxQJAjdDqeMXtSm5c+opatpBBLRW/2K5IFHm6x
 +UgV+ccJAkszvwepLwtAVElgtJBMvnbcmm3hVQWiGOWCCFDBPJsDJXnePTRZCiyXOKrE
 bYjg==
X-Gm-Message-State: AOAM532E4t+qgMBx7dTM07kS57B1lrdmcs8/PZaW5QstiQyqnix01KTm
 B9YIS3L3A/FaCuWHGCdT8zG8lwsoEBzOmQ==
X-Google-Smtp-Source: ABdhPJyL9pGeWSaL7kl5ehK87kkKc+Del+rsWDEA2yvMomHnsOqt2/WC4Ll84GtxbzpIwGfLtHTnQg==
X-Received: by 2002:a2e:8703:: with SMTP id m3mr10548371lji.286.1589814334809; 
 Mon, 18 May 2020 08:05:34 -0700 (PDT)
Received: from centos7-pv-guest.localdomain ([5.35.46.227])
 by smtp.gmail.com with ESMTPSA id 130sm7296306lfl.37.2020.05.18.08.05.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 08:05:34 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 18:04:52 +0300
Message-Id: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
X-Mailer: git-send-email 1.8.3.1
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
Cc: jgross@suse.com, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The patch adds a new extra type to be able to diffirentiate
between RX responses on xen-netfront side with the adjusted offset
required for XDP processing.

The offset value from a guest is passed via xenstore.

Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
---
v4:
- updated the commit and documenation

v3:
- updated the commit message

v2:
- added documentation
- fixed padding for netif_extra_info
---
---
 xen/include/public/io/netif.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
index 9fcf91a..a92bf04 100644
--- a/xen/include/public/io/netif.h
+++ b/xen/include/public/io/netif.h
@@ -161,6 +161,17 @@
  */
 
 /*
+ * "xdp-headroom" is used to request that extra space is added
+ * for XDP processing.  The value is measured in bytes and passed by
+ * the frontend to be consistent between both ends.
+ * If the value is greater than zero that means that
+ * an RX response is going to be passed to an XDP program for processing.
+ *
+ * "feature-xdp-headroom" is set to "1" by the netback side like other features
+ * so a guest can check if an XDP program can be processed.
+ */
+
+/*
  * Control ring
  * ============
  *
@@ -985,7 +996,8 @@ typedef struct netif_tx_request netif_tx_request_t;
 #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
-#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
+#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
+#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
 
 /* netif_extra_info_t flags. */
 #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
@@ -1018,6 +1030,10 @@ struct netif_extra_info {
             uint8_t algorithm;
             uint8_t value[4];
         } hash;
+        struct {
+            uint16_t headroom;
+            uint16_t pad[2]
+        } xdp;
         uint16_t pad[3];
     } u;
 };
-- 
1.8.3.1


