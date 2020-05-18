Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66F1D79C4
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:26:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafmH-00082x-Q6; Mon, 18 May 2020 13:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jafmG-00082s-CL
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:25:56 +0000
X-Inumbo-ID: 1a06211a-990b-11ea-b9cf-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a06211a-990b-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 13:25:55 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g1so9826500ljk.7
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=oD7uBg2txWw1buup5dqXIpdnCiWGkgpK8zE5/uRvEwE=;
 b=ezGbIJQAfRx8928jC+cxdXYjth9HudpYFjWKUt4Z+S1tlIHOEW6b0n/X3VyKttQaxi
 kxRt208N22OpoWYK1EPvdWvLRIRwLwIPk8A0s48nMBDMxaD+J4/d//LaNusGpggXeIs5
 OTjw7rJ5Cvfvd06DxQDidXFKgDyoOeIEfhggbWkGv4jDDIqIh2W7vwMSk8GFhZAalv9j
 SW/7US57rbnFNfe9ah3U1G1vosR5iqJVxbWYvanceeDFgZ5qxhFwj9b9Y0PEG+4F2bY4
 0LGzLRBFogXBpr/UAV/lKxREd1ghKZqWitegkILOiLDjvKj8EwAIfyVlldUgSuhXky1o
 aFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oD7uBg2txWw1buup5dqXIpdnCiWGkgpK8zE5/uRvEwE=;
 b=TQAYFwaua/WR6uZuRI+LcIDN5DGNJuOrn0bJoo+cI5/Wo00lnNg4mzP9KYcXdQUkZw
 snxeYJs1269LTgPvP/lMnXiVRp+b+svsA0AHqqcXOBdyNC1/PeG4VEqA1ueroC8RpcSo
 v5stxGUqtYyUFuj/DOHuTNfjcQ/i/Rdi8m7oJDWAFDBkPdZyhWD9dNo9VkZCcyo8JwhH
 Lmw3NVkoreJ6XzjIZ/lAMRBMJTcCSJ/Uk/pUxLl9s6YUz35L6N3oR/sX7kdOkQecd5YA
 wK/XJJkTuFCmPITdpoTeOdX7KlCazes1zqQqkG9xoGPwiRxTDNCmnFuTzEqy2goo/wJh
 K9NA==
X-Gm-Message-State: AOAM53299HdoyijC8RY86iqwGnD/d46hsesgkh0tVu2ZwW/UyZ8w+OeO
 gAp/O250cTyi0JNpqLD3K/MUmK9G1Y/dpQ==
X-Google-Smtp-Source: ABdhPJwgmPvVIaKaHrdzHdyIkysHoQ6rTNQ5uTcrxb9pduG2EXVnpyx/jV2XpvFdWzs8R4imez8c1w==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr10430252ljm.140.1589808354123; 
 Mon, 18 May 2020 06:25:54 -0700 (PDT)
Received: from centos7-pv-guest.localdomain ([5.35.46.227])
 by smtp.gmail.com with ESMTPSA id u8sm7078694lff.38.2020.05.18.06.25.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 06:25:53 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 16:25:44 +0300
Message-Id: <1589808344-1687-1-git-send-email-kda@linux-powerpc.org>
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
v3:
- updated the commit message

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


