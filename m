Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BFD6C7441
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 00:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514106.796077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfUdo-0005ql-AU; Thu, 23 Mar 2023 23:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514106.796077; Thu, 23 Mar 2023 23:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfUdo-0005p3-7i; Thu, 23 Mar 2023 23:46:44 +0000
Received: by outflank-mailman (input) for mailman id 514106;
 Thu, 23 Mar 2023 23:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfUdm-0005ox-B9
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 23:46:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f346c116-c9d4-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 00:46:40 +0100 (CET)
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
X-Inumbo-ID: f346c116-c9d4-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679615200;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MnU/WGWktkDUHHsW9r8YWjgsy8o+oR4Jpo7vpNNYvzs=;
  b=Obg4E+xmYh1b1yfgKL3q2gx7v6UGR6LutzNXkCb9QwJnq/Mz7sbJjxJG
   4ZhwyRV6chOLt6BNNBPPUJr6DKB632+P9T6/tu0liT9lx7z7CU42dcNSq
   /OmIuhHdhnXjZ3zYfXM0Vnhp6yKhAZZJQc7qT3Lo77654FKmeSIGP92/j
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104524112
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:slKeCKMowQ2L7JLvrR3Zl8FynXyQoLVcMsEvi/4bfWQNrUor3zBRy
 mZNDGzSbvqIMzamLot/bIu+9h9QuZKBztVmSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t9MK0QR6
 PtbETkIQwmzq+mU5LmdZuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGZgPwh/B/
 Aoq+UzhBikrJuag8ACr7yutgrXDozvmet8NQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAsFkUnOjIDDjIM5vT6kK04rDbEaPpsRfvdYsLOJd3g/
 9ybhHFg2ORI05Nbjv7TEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEoMt/gVZlylPa+SbwJs8w4ifIQCqWdiSfdpH0+DaJu9zmFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9ogPUsQ7nlmnwv7HMmrpylLJJLCPBZ5v59ZagrRBg34hYvYyDjoH
 yF3bpXbm0sCCryuMkE6M+c7dDg3EJTyPriuw+Q/SwJJClMO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:iv9aVqHePZSWuoAdpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,286,1673931600"; 
   d="scan'208";a="104524112"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/shadow: Fix build with no PG_log_dirty
Date: Thu, 23 Mar 2023 23:46:21 +0000
Message-ID: <20230323234621.2591154-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Gitlab Randconfig found:

  arch/x86/mm/shadow/common.c: In function 'shadow_prealloc':
  arch/x86/mm/shadow/common.c:1023:18: error: implicit declaration of function
      'paging_logdirty_levels'; did you mean 'paging_log_dirty_init'? [-Werror=implicit-function-declaration]
   1023 |         count += paging_logdirty_levels();
        |                  ^~~~~~~~~~~~~~~~~~~~~~
        |                  paging_log_dirty_init
  arch/x86/mm/shadow/common.c:1023:18: error: nested extern declaration of 'paging_logdirty_levels' [-Werror=nested-externs]

Move the declaration outside of #if PG_log_dirty.

Fixes: 33fb3a661223 ("x86/shadow: account for log-dirty mode when pre-allocating")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

An alternative would be to double paging_logdirty_levels() up in the else
case, returning 0.  The underlying logc in shadow_prealloc() succumbs to DCE
either way.
---
 xen/arch/x86/include/asm/paging.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 38bec8af2ed1..2ca22f20adff 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -149,6 +149,10 @@ struct paging_mode {
 /*****************************************************************************
  * Log dirty code */
 
+#define paging_logdirty_levels() \
+    (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
+                  PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
+
 #if PG_log_dirty
 
 /* get the dirty bitmap for a specific range of pfns */
@@ -187,10 +191,6 @@ bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn);
 #define L4_LOGDIRTY_IDX(pfn) ((pfn_x(pfn) >> (PAGE_SHIFT + 3 + PAGETABLE_ORDER * 2)) & \
                               (LOGDIRTY_NODE_ENTRIES-1))
 
-#define paging_logdirty_levels() \
-    (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
-                  PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
-
 #ifdef CONFIG_HVM
 /* VRAM dirty tracking support */
 struct sh_dirty_vram {
-- 
2.30.2


