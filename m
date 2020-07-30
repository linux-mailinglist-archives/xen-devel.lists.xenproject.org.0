Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34CA233948
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EY5-0003pV-Ug; Thu, 30 Jul 2020 19:49:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1EY4-0003pM-Qz
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:49:04 +0000
X-Inumbo-ID: b8789c8a-d29d-11ea-ab18-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8789c8a-d29d-11ea-ab18-12813bfff9fa;
 Thu, 30 Jul 2020 19:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UnD14dYKCdyYi6YratGsYxZMEOmXUkZTQOXSnNy2ec=; b=qM1rwFgsvkvmFrUxckN5wRBlEU
 QVo9/7xQDlBETj2ZmEZsV/Ic5WufQEBs9w+8R4Bbt9P7YB1vwzGubUznHt6Od+KtzNnj5PnaeTOrj
 m/tNYypKBGzS8akFZFj43vmBx7YehsJ0s1+PygG/KASXi980e4mTT4iEwORXYL4m+KqQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY3-0001L1-9z; Thu, 30 Jul 2020 19:49:03 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY3-0004CS-2s; Thu, 30 Jul 2020 19:49:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] public/io/netif: specify MTU override node
Date: Thu, 30 Jul 2020 20:48:57 +0100
Message-Id: <20200730194858.28523-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730194858.28523-1-paul@xen.org>
References: <20200730194858.28523-1-paul@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

There is currently no documentation to state what MTU a frontend should
adertise to its network stack. It has however long been assumed that the
default value of 1500 is correct.

This patch specifies a mechanism to allow the tools to set the MTU via a
xenstore node in the frontend area and states that the absence of that node
means the frontend should assume an MTU of 1500 octets.

NOTE: The Windows PV frontend has used an MTU sampled from the xenstore
      node specified in this patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/netif.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
index 9fcf91a2fe..00dd258712 100644
--- a/xen/include/public/io/netif.h
+++ b/xen/include/public/io/netif.h
@@ -204,6 +204,18 @@
  * present).
  */
 
+/*
+ * MTU
+ * ===
+ *
+ * The toolstack may set a value of MTU for the frontend by setting the
+ * /local/domain/<domid>/device/vif/<vif>/mtu node with the MTU value in
+ * octets. If this node is absent the frontend should assume an MTU value
+ * of 1500 octets. A frontend is also at liberty to ignore this value so
+ * it is only suitable for informing the frontend that a packet payload
+ * >1500 octets is permitted.
+ */
+
 /*
  * Hash types
  * ==========
-- 
2.20.1


