Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDF9C3F56
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833733.1248969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDF-0000If-Dd; Mon, 11 Nov 2024 13:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833733.1248969; Mon, 11 Nov 2024 13:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDF-0000Ey-5l; Mon, 11 Nov 2024 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 833733;
 Mon, 11 Nov 2024 13:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDD-0008Hn-MF
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:11 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d64118a-a02e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:12:08 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:05 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:15388]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.82:2525]
 with esmtp (Farcaster)
 id 70aaaccd-ef43-4a1b-a739-83266d2e097f; Mon, 11 Nov 2024 13:12:04 +0000 (UTC)
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:04 +0000
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19D008UEC001.ant.amazon.com (10.252.135.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:04 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:04 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 092EE42116; Mon, 11 Nov 2024 13:12:02 +0000 (UTC)
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
X-Inumbo-ID: 8d64118a-a02e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijk5Ljc4LjE5Ny4yMTgiLCJoZWxvIjoic210cC1mdy04MDAwNy5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhkNjQxMThhLWEwMmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMwNzI5LjIxMDAzOCwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330728; x=1762866728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rRDr0Ku/NT89j0Zb14EJxFG+AgV87TQZSexrBkDV4vs=;
  b=RP7cwyjYu8Vb7xaDjxDeS1ssPA48ONUWDTBMIS0rATwDTZ+bWg7uFFFU
   tzL5ZbwPGVXlZtM/XUm30y4PSVhL8QUOqkRsmuX/JffJr/kobzuErvzjw
   t8Xgw6q6CJIFB0AL+Bru7woRMUyUejZxkKhJPgDZpx3IlFN8MT/E5OGpN
   4=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="351236453"
X-Farcaster-Flow-ID: 70aaaccd-ef43-4a1b-a739-83266d2e097f
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V4 06/15] xen/x86: Add support for the PMAP
Date: Mon, 11 Nov 2024 13:11:39 +0000
Message-ID: <20241111131148.52568-7-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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

    Changes in v4:
        * Select PMAP KConfig option iff ONDEMAND_DIRECTMAP is used

    Changes in v2:
        * Declare PMAP entries earlier in fixed_addresses
        * Reword the commit message

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c95..80b7b74fd816 100644
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
@@ -53,6 +55,10 @@ enum fixed_addresses {
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
 #endif /* CONFIG_XEN_GUEST */
+#ifdef CONFIG_HAS_PMAP
+    FIX_PMAP_BEGIN,
+    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
+#endif
     /* Everything else should go further down. */
     FIX_APIC_BASE,
     FIX_IO_APIC_BASE_0,
diff --git a/xen/arch/x86/include/asm/pmap.h b/xen/arch/x86/include/asm/pmap.h
new file mode 100644
index 000000000000..1b3b729b90b2
--- /dev/null
+++ b/xen/arch/x86/include/asm/pmap.h
@@ -0,0 +1,35 @@
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
+    BUILD_BUG_ON(FIX_APIC_BASE - 1 > L1_PAGETABLE_ENTRIES - 1);
+    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
+
+    l1e_write(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    unsigned long linear = (unsigned long)fix_to_virt(slot);
+    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
+
+    l1e_write(pl1e, l1e_empty());
+    flush_tlb_one_local(linear);
+}
+
+#endif /* __ASM_PMAP_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 72094c491756..2a6c33493927 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -421,6 +421,7 @@ config CRYPTO
 config ONDEMAND_DIRECTMAP
     bool "On-Demand Directmap"
     depends on HAS_ONDEMAND_DIRECTMAP
+    select HAS_PMAP
     help
 		The directmap contains mapping for most of the RAM, making domain
 		memory easily accessible. While this can improve performance, it also
-- 
2.40.1


