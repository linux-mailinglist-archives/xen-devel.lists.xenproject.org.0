Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD482F551
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668092.1040074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp5A-0006Dn-OO; Tue, 16 Jan 2024 19:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668092.1040074; Tue, 16 Jan 2024 19:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp5A-0005yS-8C; Tue, 16 Jan 2024 19:26:44 +0000
Received: by outflank-mailman (input) for mailman id 668092;
 Tue, 16 Jan 2024 19:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp56-0003Xv-Qe
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:40 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b05fc8a-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:38 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:38 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com (Postfix)
 with ESMTPS id BDF6140DC0; Tue, 16 Jan 2024 19:26:36 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:34893]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.19.196:2525]
 with esmtp (Farcaster)
 id 13706365-8a25-4c84-8180-7fdab47f7c13; Tue, 16 Jan 2024 19:26:35 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:34 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:34 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:33 +0000
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
X-Inumbo-ID: 2b05fc8a-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433199; x=1736969199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0+DUWALuf12F9Qa/oNJ9iBOAHkUE/QEE53X66ACQhM=;
  b=B0sMpPqNeXJbPpLR0hh0R0YAsdvihp9gAjVjyIfhQ4s3PoNCFVhd79sY
   MmCfXoQ8QVkTkK9Va9bUY8MCfKPv5oiO5oZ864YG8/ja9S13Fu5/YNcr5
   d5Bb03CTUYX3mxX+D5Mrwi+7XMI/bZcQCFpEUpM/6Ce7bjuPqBKF6WwmJ
   Y=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="267191265"
X-Farcaster-Flow-ID: 13706365-8a25-4c84-8180-7fdab47f7c13
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 15/27] xen/x86: Add support for the PMAP
Date: Tue, 16 Jan 2024 19:25:59 +0000
Message-ID: <20240116192611.41112-16-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Julien Grall <jgrall@amazon.com>

PMAP will be used in a follow-up patch to bootstrap map domain
page infrastructure -- we need some way to map pages to setup the
mapcache without a direct map.

The functions pmap_{map, unmap} open code {set, clear}_fixmap to break
the loop.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    The PMAP infrastructure was upstream separately for Arm since
    Hongyan sent the secret-free hypervisor series. So this is a new
    patch to plumb the feature on x86.

    Changes in v2:
        * Declare PMAP entries earlier in fixed_addresses
        * Reword the commit message

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 350f41b832..16b2a32469 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -25,6 +25,7 @@ config X86
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
+	select HAS_PMAP
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c..a7ac365fc6 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -21,6 +21,8 @@
 
 #include <xen/acpi.h>
 #include <xen/pfn.h>
+#include <xen/pmap.h>
+
 #include <asm/apicdef.h>
 #include <asm/msi.h>
 #include <acpi/apei.h>
@@ -53,6 +55,8 @@ enum fixed_addresses {
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
 #endif /* CONFIG_XEN_GUEST */
+    FIX_PMAP_BEGIN,
+    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
     /* Everything else should go further down. */
     FIX_APIC_BASE,
     FIX_IO_APIC_BASE_0,
diff --git a/xen/arch/x86/include/asm/pmap.h b/xen/arch/x86/include/asm/pmap.h
new file mode 100644
index 0000000000..62746e191d
--- /dev/null
+++ b/xen/arch/x86/include/asm/pmap.h
@@ -0,0 +1,25 @@
+#ifndef __ASM_PMAP_H__
+#define __ASM_PMAP_H__
+
+#include <asm/fixmap.h>
+
+static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    unsigned long linear = (unsigned long)fix_to_virt(slot);
+    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
+
+    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
+
+    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    unsigned long linear = (unsigned long)fix_to_virt(slot);
+    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
+
+    l1e_write_atomic(pl1e, l1e_empty());
+    flush_tlb_one_local(linear);
+}
+
+#endif /* __ASM_PMAP_H__ */
-- 
2.40.1


