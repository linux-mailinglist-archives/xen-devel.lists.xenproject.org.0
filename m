Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA76E4480
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521898.810898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLcv-0006Ni-QN; Mon, 17 Apr 2023 09:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521898.810898; Mon, 17 Apr 2023 09:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLcv-0006LZ-NO; Mon, 17 Apr 2023 09:58:25 +0000
Received: by outflank-mailman (input) for mailman id 521898;
 Mon, 17 Apr 2023 09:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poLcu-0006LT-IT
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:58:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623d5702-dd06-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:58:22 +0200 (CEST)
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
X-Inumbo-ID: 623d5702-dd06-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681725502;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=83FgYJEDQqw0aagJvbVPk/UjZa2pVWCfrH0XPjUsAL0=;
  b=ardyeLF7c8BajflSRoCvWhKCZc3p6eEm6C2x428f8gXAC/3jg9vc2kLZ
   4xDFU7+5t6snIx0pZJujc0kbZA0efqyNwu7DKUyS6cyouhaYUqcMuoXjy
   Nsoo3urrsUI3LS2jE5s/IJO8muB79QlN1f3keTt7mhFkH6vzv3vEAEvRr
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104565129
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aDRYa6gmYDsG0OduAYAKIzocX161FhAKZh0ujC45NGQN5FlHY01je
 htvXG7Ub6mDYzegftt/bYq380pXsZPXmtAwSQpvpXo9Hykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxFhQzZx6S3Nuw/67lWrBu2cMHE5LSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 j6boTmgWEBy2Nq35SvYyVnvmcj2wWDEQYgoBYaXrPdAuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+497huExuzL4gKaLm8eRzVFZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwA8E0s8bCEVFjID3MW9sNgx0RXrcY1aRfvdYsLOJd3g/
 9ybhHFg1+xP1p9WhvnTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnOtzuU5x3kPe4SbwJs8w4ifIXO/BMmPKvpnkyNSZ8IUi2+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5fTkEgAALWjOHG/HEx6BQliEEXXzKve86R/HtNv6CI8cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:8mFkC6wrZSAnQ1SntbnEKrPw871zdoMgy1knxilNoHxuH/Bw8P
 re+MjztCWE7Qr5PUtLpTnuAsa9qB/nm6KdgrNhX4tKPjOHhILAFugLgbcKqweKJ8SUzJ8/6U
 4PSclD4N2bNykBsS75ijPIburJw7O8gdyVbf+19QYLcenzAZsQlDuQDGygYytLrFkvP+tBKH
 KEjPA33wadRQ==
X-Talos-CUID: 9a23:rx39Q2GZzsaB6m6oqmJOymoqE840KUTb82uOMxa6VmFNd+asHAo=
X-Talos-MUID: 9a23:jpannwq059LNjv/m38Yezx1zafxDoLuJMRxOrowMgdi/GnZ5EQ7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="104565129"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/livepatch: Fix secure_payload() in non-debug builds
Date: Mon, 17 Apr 2023 10:58:15 +0100
Message-ID: <20230417095815.3734434-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The ro_pages + rw_pages + text_pages != payload->pages check is not something
which is reasonable to skip at runtime.  Rewrite it to not be an ASSERT().

As the code is being shuffled anyway, rework the logic calling
arch_livepatch_secure() to reduce its verbosity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/livepatch.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d385f882c65c..c10ab1f374e0 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -405,32 +405,27 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
 
 static int secure_payload(struct payload *payload, struct livepatch_elf *elf)
 {
-    int rc = 0;
-    unsigned int text_pages, rw_pages, ro_pages;
+    unsigned int text_pages = PFN_UP(payload->text_size);
+    unsigned int rw_pages   = PFN_UP(payload->rw_size);
+    unsigned int ro_pages   = PFN_UP(payload->ro_size);
+    int rc;
 
-    text_pages = PFN_UP(payload->text_size);
+    if ( ro_pages + rw_pages + text_pages != payload->pages )
+        return -EINVAL;
 
-    if ( text_pages )
-    {
-        rc = arch_livepatch_secure(payload->text_addr, text_pages, LIVEPATCH_VA_RX);
-        if ( rc )
-            return rc;
-    }
-    rw_pages = PFN_UP(payload->rw_size);
-    if ( rw_pages )
-    {
-        rc = arch_livepatch_secure(payload->rw_addr, rw_pages, LIVEPATCH_VA_RW);
-        if ( rc )
-            return rc;
-    }
+    if ( text_pages &&
+         (rc = arch_livepatch_secure(payload->text_addr, text_pages, LIVEPATCH_VA_RX)) )
+        return rc;
 
-    ro_pages = PFN_UP(payload->ro_size);
-    if ( ro_pages )
-        rc = arch_livepatch_secure(payload->ro_addr, ro_pages, LIVEPATCH_VA_RO);
+    if ( rw_pages &&
+         (rc = arch_livepatch_secure(payload->rw_addr, rw_pages, LIVEPATCH_VA_RW)) )
+        return rc;
 
-    ASSERT(ro_pages + rw_pages + text_pages == payload->pages);
+    if ( ro_pages &&
+         (rc = arch_livepatch_secure(payload->ro_addr, ro_pages, LIVEPATCH_VA_RO)) )
+        return rc;
 
-    return rc;
+    return 0;
 }
 
 static bool section_ok(const struct livepatch_elf *elf,
-- 
2.30.2


