Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE662417CF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEY-0003tk-IZ; Tue, 11 Aug 2020 08:02:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEX-0003tc-7o
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:09 +0000
X-Inumbo-ID: 24a6a5c4-9476-4a0d-bc69-354df03b0b8f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24a6a5c4-9476-4a0d-bc69-354df03b0b8f;
 Tue, 11 Aug 2020 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zLawH4FvOFWl21OKR3+ucyTpJY4mEJwrzwh5lh6ZTTM=; b=3zpUIDAnftjjPCSyjPccOSSNuY
 N7FS8KaWcFTUtzNJGrDqUyyZsCNVcP+qON9Ez4E01DcQMgcpZp+V8Adk75AkUFSG9y1gPmjRhPkzx
 ysZj/AHAueajNN/YwscPZxvGDbfYMbqVvip5iPfnGDQI9UKza8vfjcVymSLfvQhXUQEo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEV-0003uZ-Cm; Tue, 11 Aug 2020 08:02:07 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEV-0000k5-4z; Tue, 11 Aug 2020 08:02:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/8] public/io/netif: specify MTU override node
Date: Tue, 11 Aug 2020 09:01:55 +0100
Message-Id: <20200811080202.31163-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200811080202.31163-1-paul@xen.org>
References: <20200811080202.31163-1-paul@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
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
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v2:
 - Add a note in xenstore-paths highlighting the new xenstore node
---
 docs/misc/xenstore-paths.pandoc |  3 +++
 xen/include/public/io/netif.h   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 766e8008dc..5cd5c8a3b9 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -298,6 +298,9 @@ A virtual keyboard device frontend. Described by
 A virtual network device frontend. Described by
 [xen/include/public/io/netif.h][NETIF]
 
+NOTE: ~/device/vif/$DEVID/mtu can be used to inform the frontend of an
+      increased MTU. (The default MTU is 1500 octets).
+
 #### ~/device/vscsi/$DEVID/* []
 
 A virtual scsi device frontend. Described by
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


