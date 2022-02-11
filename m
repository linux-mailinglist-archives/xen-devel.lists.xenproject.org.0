Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7714B2910
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270550.464875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXof-0001pX-PO; Fri, 11 Feb 2022 15:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270550.464875; Fri, 11 Feb 2022 15:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXof-0001hm-LW; Fri, 11 Feb 2022 15:26:33 +0000
Received: by outflank-mailman (input) for mailman id 270550;
 Fri, 11 Feb 2022 15:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJSo=S2=amazon.de=prvs=034f27e45=nmanthey@srs-se1.protection.inumbo.net>)
 id 1nIXoc-0001fo-WA
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:26:31 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa00943-8b4e-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 16:26:29 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 11 Feb 2022 15:26:12 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com (Postfix) with
 ESMTPS id 1811141887; Fri, 11 Feb 2022 15:26:12 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 11 Feb 2022 15:26:09 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.14) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Fri, 11 Feb 2022 15:26:08 +0000
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
X-Inumbo-ID: faa00943-8b4e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1644593189; x=1676129189;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=TT+qw2jJTN+YB51Wk3Q538yOVcAVuWNCzpcJJfEh1m0=;
  b=ft1j6k2N2FSCn8qZVPC5uxad4fk713vSA1IWAp5hhEhjQZCCgsAdNp9I
   GYcASWFiFgLu/1pjR5hHSma5JKtQtyxnCfnAFMfsEX/g3L1kXPUqbVNlg
   pij95dQt4HyGJy4orQ7fUHmtg1qIP4xDc29EMAcgiRGAkuTqrVPzWV/PZ
   g=;
X-IronPort-AV: E=Sophos;i="5.88,361,1635206400"; 
   d="scan'208";a="991414143"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH CPU v2] cpuid: initialize cpuinfo with boot_cpu_data
Date: Fri, 11 Feb 2022 16:25:59 +0100
Message-ID: <20220211152559.27862-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

When re-identifying CPU data, we might use uninitialized data when
checking for the cache line property to adapt the cache
alignment. The data that depends on this uninitialized read is
currently not forwarded.

To avoid problems in the future, initialize the data cpuinfo
structure before re-identifying the CPU again.

The trace to hit the uninitialized read reported by Coverity is:

bool recheck_cpu_features(unsigned int cpu)
...
    struct cpuinfo_x86 c;
    ...
    identify_cpu(&c);

void identify_cpu(struct cpuinfo_x86 *c)
...
    generic_identify(c)

static void generic_identify(struct cpuinfo_x86 *c)
...
        if (this_cpu->c_early_init)
                this_cpu->c_early_init(c); // which is early_init_intel

static void early_init_intel(struct cpuinfo_x86 *c)
...
    if (c->x86 == 15 && c->x86_cache_alignment == 64)
        c->x86_cache_alignment = 128;

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>

---
 xen/arch/x86/cpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -609,7 +609,7 @@ void __init init_guest_cpuid(void)
 bool recheck_cpu_features(unsigned int cpu)
 {
     bool okay = true;
-    struct cpuinfo_x86 c;
+    struct cpuinfo_x86 c = {0};
     const struct cpuinfo_x86 *bsp = &boot_cpu_data;
     unsigned int i;
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




