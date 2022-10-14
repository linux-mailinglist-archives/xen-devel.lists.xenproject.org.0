Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3F5FEFA1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 16:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422890.669237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLH9-0008Ab-DP; Fri, 14 Oct 2022 14:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422890.669237; Fri, 14 Oct 2022 14:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojLH9-00087r-AW; Fri, 14 Oct 2022 14:02:59 +0000
Received: by outflank-mailman (input) for mailman id 422890;
 Fri, 14 Oct 2022 14:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojLH7-00087l-Li
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 14:02:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d077f5-4bc8-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 16:02:55 +0200 (CEST)
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
X-Inumbo-ID: e5d077f5-4bc8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665756175;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=HWk1ODYaHW4RCEOZ2LKRRBh8e1VmfzBj+8lRtugVTC4=;
  b=ZuNXc9UYESBHi1kpATnD4m2uI9E406yUmd8eVXJC90DWY7wz+cSWSaR3
   skupHYqHsQkwd6ReEQuBIsYMnvOWfoikB3udUEIH8gRmPdORjRTscd/M3
   wrOR/Vs+f7jt1YPdJ7dlH9b9Il6SCsHIWvMuCggQc/Ad/3wx8BsvsW9D/
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82735017
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jo/s06K6QYRDr6m/FE+R9ZUlxSXFcZb7ZxGr2PjKsXjdYENS1WZTz
 2MYWTuDM/yONzP8KdEnb9y18RwFvMeBx9YyGQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4W9A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbMp6OtyI01lz
 vM/BAIMRR+ut9mp/IvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEn4RBIgzg6GDgX7nficDgFmUubA28y7YywkZPL3FYICKIYHSHJo9ckCw+
 Wb48k/8EhgmKcWU8hSJ0mOivtbSpHauMG4VPOLhraM76LGJ/UQYCAcXTke8ufm0kAihHdlbI
 lYX0iUrpKk2skesS7HVXRS+rGSVox00VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iL8CnB/KbPpIK6GSou/0Mj7d8
 wuVkBFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21PzNMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhZxz/FhZ
 c7ALJv0ZZr/NUiA5GPsL9rxLJdxnnxurY8tbcqTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDjoH
 yJkH5LSkX13CbSmCgGOqN57ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt4K9A7wfoKzb2Tl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:4YA7bq+6hezIds8hRRpuk+DQI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re+sjzuiWE6wr5NEtOpTniAtjmfZq/z+8W3WB5B97LN2OK1FdARLsSibcKqAeBJ8SRzIBgPN
 9bAs1DNOE=
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82735017"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH] argo: Fixes to argo_dprintk()
Date: Fri, 14 Oct 2022 15:02:21 +0100
Message-ID: <20221014140221.31966-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Rewrite argo_dprintk() so printk() format typechecking can always be
performed.  This also fixes the evaluation of parameters.  Emit the messages
at XENLOG_DEBUG.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>
---
 xen/common/argo.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 9ad2ecaa1e42..f29fa720fc48 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -313,14 +313,12 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
     ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
      LOCKING_Write_L1)
 
-/* Change this to #define ARGO_DEBUG here to enable more debug messages */
-#undef ARGO_DEBUG
-
-#ifdef ARGO_DEBUG
-#define argo_dprintk(format, args...) printk("argo: " format, ## args )
-#else
-#define argo_dprintk(format, ... ) ((void)0)
-#endif
+#define ARGO_DEBUG 0
+#define argo_dprintk(fmt, args...)                      \
+    do {                                                \
+        if ( ARGO_DEBUG )                               \
+            printk(XENLOG_DEBUG "argo: " fmt, ##args);  \
+    } while ( 0 )
 
 /*
  * This hash function is used to distribute rings within the per-domain
-- 
2.11.0


