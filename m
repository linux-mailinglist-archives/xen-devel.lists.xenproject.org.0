Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62094D68FF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 20:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289232.490742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkgK-0003O9-Vv; Fri, 11 Mar 2022 19:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289232.490742; Fri, 11 Mar 2022 19:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkgK-0003M8-Sz; Fri, 11 Mar 2022 19:12:08 +0000
Received: by outflank-mailman (input) for mailman id 289232;
 Fri, 11 Mar 2022 19:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT2a=TW=amazon.de=prvs=062ebc15f=doebel@srs-se1.protection.inumbo.net>)
 id 1nSkgH-0003Lt-7b
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 19:12:06 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 211fac9e-a16f-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 20:12:03 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 11 Mar 2022 19:11:46 +0000
Received: from EX13D03EUC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com (Postfix) with
 ESMTPS id D6698C084A; Fri, 11 Mar 2022 19:11:45 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Fri, 11 Mar 2022 11:11:44 -0800
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Fri, 11 Mar 2022 19:11:44 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id EDE544EE0; Fri, 11 Mar 2022 19:11:43 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 211fac9e-a16f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1647025924; x=1678561924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=deZpx3l+nb5S0Sc70c5ZJFYtuVpFzmwCko4kD9WJYoI=;
  b=bM0VAqArHHRXgfQYhmAGMHJDBgNI9PBrIikk8rLei6kZedAipRjEGB26
   /sJxVbBvrS0/KPp7oLI9z5svPki6VjcaSm2QDyFUGgFugl6q9zjpkrPiw
   v9NNlTAjQD/aAe1p9NI2TabrxbnoLQHCXXoDPo1Wrc9TeTp/RkZkvH8Rj
   k=;
X-IronPort-AV: E=Sophos;i="5.90,174,1643673600"; 
   d="scan'208";a="70265491"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] Livepatch: fix typos
Date: Fri, 11 Mar 2022 19:11:37 +0000
Message-ID: <032faef0d56d1de17b9dd229b33bd755c402b978.1647025870.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix a couple of typos in livepatch code.

Signed-off-by: Bjoern Doebel <doebel@amazon.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/livepatch.c |  2 +-
 xen/common/livepatch.c   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 81c48fda7f..c4a19f3169 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -28,7 +28,7 @@ static bool has_active_waitqueue(const struct vm_event_domain *ved)
 }
 
 /*
- * x86's implementation of waitqueue violates the livepatching safey principle
+ * x86's implementation of waitqueue violates the livepatching safety principle
  * of having unwound every CPUs stack before modifying live content.
  *
  * Search through every domain and check that no vCPUs have an active
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index be2cf75c2d..edf56a357f 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -40,7 +40,7 @@ static LIST_HEAD(payload_list);
 
 /*
  * Patches which have been applied. Need RCU in case we crash (and then
- * traps code would iterate via applied_list) when adding entries onthe list.
+ * traps code would iterate via applied_list) when adding entries on the list.
  */
 static DEFINE_RCU_READ_LOCK(rcu_applied_lock);
 static LIST_HEAD(applied_list);
@@ -326,8 +326,8 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
 
     /*
      * Total of all three regions - RX, RW, and RO. We have to have
-     * keep them in seperate pages so we PAGE_ALIGN the RX and RW to have
-     * them on seperate pages. The last one will by default fall on its
+     * keep them in separate pages so we PAGE_ALIGN the RX and RW to have
+     * them on separate pages. The last one will by default fall on its
      * own page.
      */
     size = PAGE_ALIGN(payload->text_size) + PAGE_ALIGN(payload->rw_size) +
@@ -882,7 +882,7 @@ static bool_t is_payload_symbol(const struct livepatch_elf *elf,
         return 0;
 
     /*
-     * The payload is not a final image as we dynmically link against it.
+     * The payload is not a final image as we dynamically link against it.
      * As such the linker has left symbols we don't care about and which
      * binutils would have removed had it be a final image. Hence we:
      * - For SHF_ALLOC - ignore symbols referring to sections that are not
@@ -1523,7 +1523,7 @@ static bool_t is_work_scheduled(const struct payload *data)
 
 /*
  * Check if payload has any of the vetoing, non-atomic hooks assigned.
- * A vetoing, non-atmic hook may perform an operation that changes the
+ * A vetoing, non-atomic hook may perform an operation that changes the
  * hypervisor state and may not be guaranteed to succeed. Result of
  * such operation may be returned and may change the livepatch workflow.
  * Such hooks may require additional cleanup actions performed by other
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




