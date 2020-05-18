Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57161D72ED
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 10:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jab7V-000610-7t; Mon, 18 May 2020 08:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jab5A-0005xo-Sh
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 08:25:09 +0000
X-Inumbo-ID: 14a6caa0-98e1-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14a6caa0-98e1-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 08:25:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c21so7256235lfb.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=62dBjwAqFx42J0m7dvvwDYjAwTZ2hCNIWZwjeYro/gg=;
 b=f4AneL6nEMxZSczyq6KZSI1VTA5SndsiS8Iq6rYHRldr4TMOgI9EilEs/JbiTo0liB
 O44NFkD7fInDweSj0w89baGKMusGXCN+pilefCaYustNxyjrG6HYPdKZ+CVroH9Ux2Il
 Zd0ZCgMovIePLK2i+yLoT8e6UNFOFXp7TEPz1t6ppOo94HNFbnVwVAIWeMOu7y26wKf+
 NyVxL9208wqBYtEQIS1KBWb3ihlss1kgA29uyrCydbKHUydlPgnMDnOKUvBxCyDZaL39
 5Xr36kr0PXQeCfPS8RluyeKxk+PWf492N3ADht1x63ze3hjpfpArh6IeIZ362EIeYPjA
 vSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=62dBjwAqFx42J0m7dvvwDYjAwTZ2hCNIWZwjeYro/gg=;
 b=KWgviQgY/0AEBYYyKyR2FLUTIx3ZAJaKG4AGidP0KZkOaK3i7SWz+Ijq0EfpV3Fgxr
 /Sv0rWCgQ18241RkS++CgjHeZVmZznJfilVy7DoPsV3eMRWF7uuwduSdbAJV1zZvr3dz
 rficw7CeNmRoIfcIA5kms4kdGGGFvBSLv2OBmtBZzXUx3QjzaCDSiRffJa6fQRQYUMzF
 rIY/zprDjS4Kka1FCAVTFrbA5D6/YUV3YkXf4igC7ihj+S/ZP9B0MaC6rT+tX+/bIlI3
 YvbyPCj7wNLsPxncWZRTrgT4MQ1KDTm+JdCQEh+/cfYl4yCU5hVQpRYZTj2SG/Qx6pbT
 xgnA==
X-Gm-Message-State: AOAM5330AmrsKVMd0b2OJ8VyMhx4C7wDx2rJTWe7idNBTd2L+O6dvUy9
 Uc7DTIujI7mUQ+3j7rNskP2QuCkvymVZ5g==
X-Google-Smtp-Source: ABdhPJzA9c6bRJ1VHIs6AJSFgy2kPYrjodljBmKY4nDsIXV4imqGSahSJk1tj7h1h2RImhCxDQmXFQ==
X-Received: by 2002:a19:4895:: with SMTP id v143mr6566918lfa.193.1589790306189; 
 Mon, 18 May 2020 01:25:06 -0700 (PDT)
Received: from centos7-pv-guest.localdomain ([5.35.46.227])
 by smtp.gmail.com with ESMTPSA id h84sm6485290lfd.88.2020.05.18.01.25.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:25:05 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 11:24:45 +0300
Message-Id: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 18 May 2020 08:27:31 +0000
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
---
 xen/include/public/io/netif.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
index 9fcf91a..759c88a 100644
--- a/xen/include/public/io/netif.h
+++ b/xen/include/public/io/netif.h
@@ -985,7 +985,8 @@ typedef struct netif_tx_request netif_tx_request_t;
 #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
 #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
-#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
+#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
+#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
 
 /* netif_extra_info_t flags. */
 #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
@@ -1018,6 +1019,10 @@ struct netif_extra_info {
             uint8_t algorithm;
             uint8_t value[4];
         } hash;
+        struct {
+            uint16_t headroom;
+            uint32_t pad;
+        } xdp;
         uint16_t pad[3];
     } u;
 };
-- 
1.8.3.1


