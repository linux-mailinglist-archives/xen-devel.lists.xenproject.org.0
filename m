Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C68C421D
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720928.1124007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvW-0004C8-Rq; Mon, 13 May 2024 13:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720928.1124007; Mon, 13 May 2024 13:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvW-00047x-Kt; Mon, 13 May 2024 13:41:14 +0000
Received: by outflank-mailman (input) for mailman id 720928;
 Mon, 13 May 2024 13:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvV-0002zP-4g
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:13 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75519601-112e-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 15:41:12 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:08 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.29.78:3835]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.82.155:2525]
 with esmtp (Farcaster)
 id a4c1d04a-7ebb-419c-a634-05a07b3358b1; Mon, 13 May 2024 13:41:07 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:06 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:06 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:04 +0000
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
X-Inumbo-ID: 75519601-112e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607672; x=1747143672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZJrhmMV/WsLJjJ2b/S8Feij3BU9bNlhqRg9vQL1/RK0=;
  b=Qktw8LKQR3PNzly8tz8uCw92FwhbmOZT3J/eSTpxJImBYjSe4gZ3WcwR
   xO1E1edyvCtkPUxjkpvUloDLxQasoSXDZyil3V8SOhDNahjtbbrXzjZVi
   Cw4C6/USj9tfWJvjO1Bo818ZABgM+c2RdMjNyhTekYlKUUlyCXcY1FRoe
   A=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="294692541"
X-Farcaster-Flow-ID: a4c1d04a-7ebb-419c-a634-05a07b3358b1
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Date: Mon, 13 May 2024 13:40:34 +0000
Message-ID: <20240513134046.82605-8-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
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

    Changes in v2:
        * Declare PMAP entries earlier in fixed_addresses
        * Reword the commit message

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b4ec0e582e..56feb0c564 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -27,6 +27,7 @@ config X86
 	select HAS_PCI
 	select HAS_PCI_MSI
 	select HAS_PIRQ
+	select HAS_PMAP
 	select HAS_SCHED_GRANULARITY
 	select HAS_SECRET_HIDING
 	select HAS_UBSAN
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


