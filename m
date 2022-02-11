Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF104B1F45
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 08:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270153.464358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIQHf-0006Hg-PL; Fri, 11 Feb 2022 07:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270153.464358; Fri, 11 Feb 2022 07:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIQHf-0006Fc-MG; Fri, 11 Feb 2022 07:23:59 +0000
Received: by outflank-mailman (input) for mailman id 270153;
 Fri, 11 Feb 2022 07:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJSo=S2=amazon.de=prvs=034f27e45=nmanthey@srs-se1.protection.inumbo.net>)
 id 1nIQHe-0006FW-64
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 07:23:58 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90f0f512-8b0b-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 08:23:56 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-28e6dbd8.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 11 Feb 2022 07:23:38 +0000
Received: from EX13D02EUC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-28e6dbd8.us-east-1.amazon.com (Postfix) with
 ESMTPS id 8CA8C85CF3; Fri, 11 Feb 2022 07:23:36 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D02EUC001.ant.amazon.com (10.43.164.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 11 Feb 2022 07:23:35 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.14) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Fri, 11 Feb 2022 07:23:32 +0000
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
X-Inumbo-ID: 90f0f512-8b0b-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1644564237; x=1676100237;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=zl2hAijnvF/MJAtZnQoIh1zN4LcKIlxC/r+GBagwz5g=;
  b=kjGB1t6gJSb4sF0WTJbT3IxbhOHmhXPVGKliaREZHDNamIAmHWehpHvg
   YevS1aYWA54UBPra+k4FhvUTcnC2/xCun+2+tAfrX74iDGiAxAK+OaWX1
   +pfTpJDW4Nl0E+MeoaBFtUggWRUTYPkW/JUNavJ7Hni/M8WaK1PvzzxKY
   M=;
X-IronPort-AV: E=Sophos;i="5.88,359,1635206400"; 
   d="scan'208";a="175404920"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Date: Fri, 11 Feb 2022 08:23:27 +0100
Message-ID: <20220211072327.1213-1-nmanthey@amazon.de>
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
+    struct cpuinfo_x86 c = boot_cpu_data;
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




