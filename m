Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423D31D7466
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 11:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jacSZ-0005FP-Fv; Mon, 18 May 2020 09:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jacSY-0005FC-28
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 09:53:22 +0000
X-Inumbo-ID: 67fdf1cc-98ed-11ea-9887-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67fdf1cc-98ed-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 09:53:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l19so9134437lje.10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=mgqN/92BYx5OUANjC5x6lp8VHURe4GtJqolrmxqbSTo=;
 b=L2/RqyeZqbYfh4n0vK+d8LjDXWRDN3mJ7TKrKBfO2X8olzl+rGsXSQ4KhLpb5RVJsR
 URGBpOIuoehslCloSrsne3Fs83ZmJu7bhE1Axt1lG+gXz1NXKHrtgFJRhyr6XIUobp1A
 Pa/ymv0M3iFTD5s2F6cAEJYidF8uGh36TA95mWBbUp6L7yIOnose4Drftp+HSYNJwKt4
 yAuAXqUex3YduP3VJ4kwKvBH6gqUN8baNUJ1sJuCCeTxLZoP8APQPwh9Tn0SPh9/vao3
 YZykrykNdQhwohuKuCSwcfuKMP8BsuVmnGXyZMoDyvPpihho0heFAPuO/eoiOVvq7fm9
 A0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mgqN/92BYx5OUANjC5x6lp8VHURe4GtJqolrmxqbSTo=;
 b=RuEUSYbGWSrpiDtRl7DZJUA4jGvRqno7JZIvmHR5g54QQ/UYP3cVRKN1275NRHg880
 2chz6i4ZjExJEqhRAR5QAD624LdneKOsWZkpA3ovK+zh4+xzUKwhJASh5pTa1pg+gr79
 5IxQxY2WGDlImCxM4XTtu3cfhvoPAx/o4+67nz+diMKxOzYTDrguFDJAkONB77UjSP1/
 FJif/l9X6e15meH35T/0n3SbDEUf8AKUXxsFT80JeWBDn16sx50WxA5/3VO6GaQczX2Q
 cP+CPxvPD76u41JCx8uQzLfp3MUR5DjPxE9LI/2jhFgqJ5Jz9+o71hQl678/IkwZqC8T
 bVJA==
X-Gm-Message-State: AOAM530/Ta9v4/oY7IiJS1T9TIGkUiPT2ziBeq+gGa6Y8NA8w9hYJsNU
 8FVm6dizyYsMjAOkJeXwUAty1pOhdC61JA==
X-Google-Smtp-Source: ABdhPJzhi7UgbaxRXZMUkMLtSv1/OAjHY+8i0X8mIM1HrDzfsaMEecUagR5WJE/BeYoieiL6nYhPuw==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr9891908lji.80.1589795600060; 
 Mon, 18 May 2020 02:53:20 -0700 (PDT)
Received: from centos7-pv-guest.localdomain ([5.35.46.227])
 by smtp.gmail.com with ESMTPSA id c11sm2166231lji.17.2020.05.18.02.53.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 02:53:19 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 12:53:13 +0300
Message-Id: <1589795593-1544-1-git-send-email-kda@linux-powerpc.org>
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

For Linux the offset value is going to be passed via xenstore.

Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>

v2:
- added documentation
- fixed padding for netif_extra_info
---
 xen/include/public/io/netif.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
index 9fcf91a..ec56a15 100644
--- a/xen/include/public/io/netif.h
+++ b/xen/include/public/io/netif.h
@@ -161,6 +161,13 @@
  */
 
 /*
+ * "netfront-xdp-headroom" is used to add an extra space before packet data
+ * for XDP processing. The value is passed by the frontend to be consistent
+ * between both ends. If the value is greater than zero that means that
+ * an RX response is going to be passed to an XDP program for processing.
+ */
+
+/*
  * Control ring
  * ============
  *
@@ -985,7 +992,8 @@ typedef struct netif_tx_request netif_tx_request_t;
 #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
-#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
+#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
+#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
 
 /* netif_extra_info_t flags. */
 #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
@@ -1018,6 +1026,10 @@ struct netif_extra_info {
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


