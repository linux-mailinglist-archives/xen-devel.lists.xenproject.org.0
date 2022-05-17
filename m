Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47C52A7F5
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331261.554750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr074-0005Ze-49; Tue, 17 May 2022 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331261.554750; Tue, 17 May 2022 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr074-0005WF-0V; Tue, 17 May 2022 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 331261;
 Tue, 17 May 2022 16:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBie=VZ=amazon.de=prvs=129122aa7=mheyne@srs-se1.protection.inumbo.net>)
 id 1nr071-0005Ee-Tp
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:31:56 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe3f5b8-d5fe-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 18:31:54 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-718d0906.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 17 May 2022 16:24:43 +0000
Received: from EX13D08EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-718d0906.us-west-2.amazon.com (Postfix) with
 ESMTPS id 2584E3E00E4; Tue, 17 May 2022 16:24:43 +0000 (UTC)
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08EUC002.ant.amazon.com (10.43.164.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Tue, 17 May 2022 16:24:41 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.32 via Frontend Transport; Tue, 17 May 2022 16:24:40 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id DC06A41146; Tue, 17 May 2022 16:24:40 +0000 (UTC)
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
X-Inumbo-ID: dbe3f5b8-d5fe-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1652805114; x=1684341114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IteN9ICL3vHHQMXeE78rzjKCW/+s+R1bzkPHD4BhrHE=;
  b=r0j9UaflDNMhTAhfz6UReLXYA9FR/Ts003RsaUOrJ2fyLmzyuyWkd54Y
   Ql2+hqQ5CxaLBZnXsja/J4mAk6bhRHYcvJLoirb6IO+tWYB8GosO6ZkLe
   wPR176wVQ77zwodsmaqyD4lZdK+iEOgUW58orEZ6O8xfycAQieUC88CqY
   k=;
X-IronPort-AV: E=Sophos;i="5.91,233,1647302400"; 
   d="scan'208";a="89313648"
From: Maximilian Heyne <mheyne@amazon.de>
To: 
CC: Maximilian Heyne <mheyne@amazon.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86: xen: remove STACK_FRAME_NON_STANDARD from xen_cpuid
Date: Tue, 17 May 2022 16:24:25 +0000
Message-ID: <20220517162425.100567-1-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit 4d65adfcd119 ("x86: xen: insn: Decode Xen and KVM
emulate-prefix signature"), objtool is able to correctly parse the
prefixed instruction in xen_cpuid and emit correct orc unwind
information. Hence, marking the function as STACKFRAME_NON_STANDARD is
no longer needed.

This commit is basically a revert of commit 983bb6d254c7 ("x86/xen: Mark
xen_cpuid() stack frame as non-standard").

Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
CC: Josh Poimboeuf <jpoimboe@kernel.org>

cr: https://code.amazon.com/reviews/CR-69645080
---
 arch/x86/xen/enlighten_pv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5038edb79ad5..ca85d1409917 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -30,7 +30,6 @@
 #include <linux/pci.h>
 #include <linux/gfp.h>
 #include <linux/edd.h>
-#include <linux/objtool.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -165,7 +164,6 @@ static void xen_cpuid(unsigned int *ax, unsigned int *bx,
 
 	*bx &= maskebx;
 }
-STACK_FRAME_NON_STANDARD(xen_cpuid); /* XEN_EMULATE_PREFIX */
 
 static bool __init xen_check_mwait(void)
 {
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




