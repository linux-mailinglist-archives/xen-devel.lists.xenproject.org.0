Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1C1C0876
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG3I-0002wh-8N; Thu, 30 Apr 2020 20:45:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG3G-0002w3-Ry
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:58 +0000
X-Inumbo-ID: 6f1a72e6-8b23-11ea-9aaf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f1a72e6-8b23-11ea-9aaf-12813bfff9fa;
 Thu, 30 Apr 2020 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aO60ViVBWEWDKEHryOEaMwDjalPzlWCpuejw56ZNsYY=; b=Dw8P8ANR0KLecQjeUa+KKEQz93
 ch1rbKMtixX5Z80yFeFqneXkG5PjZDPNCPUUdWDfhLW9277bgqsxg5/EBnV7KzRJfbtsD6/QPWNrY
 pN4b74Fx87xXCF1D/JO90ahcNTiVhBF0uAKWn3ow7BAqHu6WTlLRhUcTuOZwXe8irHVg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG36-0004Li-Vm; Thu, 30 Apr 2020 20:44:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG36-0005wj-MQ; Thu, 30 Apr 2020 20:44:48 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 08/16] x86: add Persistent Map (PMAP) infrastructure
Date: Thu, 30 Apr 2020 21:44:17 +0100
Message-Id: <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

The basic idea is like Persistent Kernel Map (PKMAP) in linux. We
pre-populate all the relevant page tables before system is fully set
up.

It is needed to bootstrap map domain page infrastructure -- we need
some way to map pages to set up the mapcache without a direct map.

This infrastructure is not lock-protected therefore can only be used
before smpboot. After smpboot, mapcache has to be used.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/Makefile        |  1 +
 xen/arch/x86/pmap.c          | 87 ++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/fixmap.h |  3 ++
 xen/include/asm-x86/pmap.h   | 10 +++++
 4 files changed, 101 insertions(+)
 create mode 100644 xen/arch/x86/pmap.c
 create mode 100644 xen/include/asm-x86/pmap.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 44137d919b..c8e565867b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -52,6 +52,7 @@ obj-y += pci.o
 obj-y += percpu.o
 obj-y += physdev.o x86_64/physdev.o
 obj-y += platform_hypercall.o x86_64/platform_hypercall.o
+obj-bin-y += pmap.init.o
 obj-y += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
diff --git a/xen/arch/x86/pmap.c b/xen/arch/x86/pmap.c
new file mode 100644
index 0000000000..44d02ece89
--- /dev/null
+++ b/xen/arch/x86/pmap.c
@@ -0,0 +1,87 @@
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/spinlock.h>
+
+#include <asm/bitops.h>
+#include <asm/fixmap.h>
+#include <asm/flushtlb.h>
+
+/*
+ * Simple mapping infrastructure to map / unmap pages in fixed map.
+ * This is used to set up the page table for mapcache, which is used
+ * by map domain page infrastructure.
+ *
+ * This structure is not protected by any locks, so it must not be used after
+ * smp bring-up.
+ */
+
+/* Bitmap to track which slot is used */
+static unsigned long __initdata inuse;
+
+void *__init pmap_map(mfn_t mfn)
+{
+    unsigned long flags;
+    unsigned int idx;
+    void *linear = NULL;
+    enum fixed_addresses slot;
+    l1_pgentry_t *pl1e;
+
+    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_LONG < NUM_FIX_PMAP);
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+
+    local_irq_save(flags);
+
+    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);
+    if ( idx == NUM_FIX_PMAP )
+        panic("Out of PMAP slots\n");
+
+    __set_bit(idx, &inuse);
+
+    slot = idx + FIX_PMAP_BEGIN;
+    ASSERT(slot >= FIX_PMAP_BEGIN && slot <= FIX_PMAP_END);
+
+    linear = fix_to_virt(slot);
+    /*
+     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
+     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
+     * demand, which then calls pmap() again, resulting in a loop. Modify the
+     * PTEs directly instead. The same is true for pmap_unmap().
+     */
+    pl1e = &l1_fixmap[l1_table_offset((unsigned long)linear)];
+    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
+
+    local_irq_restore(flags);
+
+    return linear;
+}
+
+void __init pmap_unmap(void *p)
+{
+    unsigned long flags;
+    unsigned int idx;
+    l1_pgentry_t *pl1e;
+    enum fixed_addresses slot = __virt_to_fix((unsigned long)p);
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+    ASSERT(slot >= FIX_PMAP_BEGIN && slot <= FIX_PMAP_END);
+
+    idx = slot - FIX_PMAP_BEGIN;
+    local_irq_save(flags);
+
+    __clear_bit(idx, &inuse);
+    pl1e = &l1_fixmap[l1_table_offset((unsigned long)p)];
+    l1e_write_atomic(pl1e, l1e_empty());
+    flush_tlb_one_local(p);
+
+    local_irq_restore(flags);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h
index 8330097a74..000f3b3375 100644
--- a/xen/include/asm-x86/fixmap.h
+++ b/xen/include/asm-x86/fixmap.h
@@ -24,6 +24,7 @@
 #include <xen/kexec.h>
 #include <asm/apicdef.h>
 #include <asm/msi.h>
+#include <asm/pmap.h>
 #include <acpi/apei.h>
 
 /*
@@ -49,6 +50,8 @@ enum fixed_addresses {
     FIX_XEN_SHARED_INFO,
 #endif /* CONFIG_XEN_GUEST */
     /* Everything else should go further down. */
+    FIX_PMAP_BEGIN,
+    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1,
     FIX_APIC_BASE,
     FIX_IO_APIC_BASE_0,
     FIX_IO_APIC_BASE_END = FIX_IO_APIC_BASE_0 + MAX_IO_APICS-1,
diff --git a/xen/include/asm-x86/pmap.h b/xen/include/asm-x86/pmap.h
new file mode 100644
index 0000000000..790cd71fb3
--- /dev/null
+++ b/xen/include/asm-x86/pmap.h
@@ -0,0 +1,10 @@
+#ifndef __X86_PMAP_H__
+#define __X86_PMAP_H__
+
+/* Large enough for mapping 5 levels of page tables with some headroom */
+#define NUM_FIX_PMAP 8
+
+void *pmap_map(mfn_t mfn);
+void pmap_unmap(void *p);
+
+#endif	/* __X86_PMAP_H__ */
-- 
2.24.1.AMZN


