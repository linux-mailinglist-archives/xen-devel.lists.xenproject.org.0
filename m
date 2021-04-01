Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB7351541
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104460.199797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWy-0005is-SW; Thu, 01 Apr 2021 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104460.199797; Thu, 01 Apr 2021 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWy-0005hs-Mf; Thu, 01 Apr 2021 13:38:40 +0000
Received: by outflank-mailman (input) for mailman id 104460;
 Thu, 01 Apr 2021 13:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxWx-0005gw-9M
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ebeda8f-f861-421f-9bee-65818108e557;
 Thu, 01 Apr 2021 13:38:38 +0000 (UTC)
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
X-Inumbo-ID: 1ebeda8f-f861-421f-9bee-65818108e557
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ELcf/BsHGsdjVKKgU0twdyS5n3PZCQDzd1s9Mf5xBZo=;
  b=YAb2Dp8zFe9QChW0VLhQ5V6kH9vTBhGrUPj/P/BU26ZEhbMf1yxDcM8l
   muP+dZiK7VkKYNl12pZT47JwR8ElKd6EtuHArE1z/9SqFeA9+xRvaL+oy
   eNkQlYPWh191tm9oCGajRSirulpxqtHN63CFIorRad7kwGZcTW83CZUEy
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EByghpkyZ0qje9sG3P+qAgA3a8me0upou0kNG0fCwc2NpYHBoNrV7B1kQsPwVplUs0C739mSDe
 KkBtUjXcIOq2qLg0Nwh6H8ipZLnmyH/bVu/5X3uehQkO+ADxKnMBOqyE9oeZZ6tPhKSSaMzHOU
 TWwIJLVibcxGU6QSYRMyN6e1krwwSczqpymV97ziYvQuu7OJRPRxRoXVVpGjz7/ceVctALKT2R
 2TZegb90QAV3RPyIRz4YGGsEMnOJ95N6qW/6WmfrojzRkyGrHTn2Jxc/tQkE2DCOztalXtH0EB
 cP4=
X-SBRS: 5.1
X-MesageID: 40837413
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gQR/Ca7JVoBHbaA1sgPXwADXdLJzesId70hD6mlaTxtJfsuE0/
 2/hfhz73DJoRsYRX1Io729EYaaR3e0z/5IyK0wGZvnYwX8omuvK+hZh7fK5zH7ASXx+qp8+M
 5bH5RWM9H7AVhkgcuS2mDReOoI+9Wf9bDtuOG29QYPcShRd6pi4w1lYzz7LmRKQmB9dPgEPa
 vZ39FGoSGhZGR/VKqGOkU=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40837413"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<ian.jackson@citrix.com>
Subject: [PATCH for-4.15 7/7] CHANGELOG.md: irq-max-guests
Date: Thu, 1 Apr 2021 14:38:27 +0100
Message-ID: <20210401133827.362216-7-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9c272a0113..7237b0a020 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Some additional affordances in various xl subcommands.
  - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522
  - On detecting a host crash, some debug key handlers can automatically triggered to aid in debugging
+ - Increase the maximum number of guests which can share a single IRQ from 7 to 16, and make this configurable with irq-max-guests
 
 ### Removed / support downgraded
 
-- 
2.30.2


