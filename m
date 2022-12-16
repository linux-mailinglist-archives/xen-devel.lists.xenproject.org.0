Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCC64EB47
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464571.723060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eq-0000Kk-1s; Fri, 16 Dec 2022 12:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464571.723060; Fri, 16 Dec 2022 12:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69ep-0008Rs-Bj; Fri, 16 Dec 2022 12:17:43 +0000
Received: by outflank-mailman (input) for mailman id 464571;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ek-0007Ln-0x
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ek-00034r-00
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DG-0004sN-W3; Fri, 16 Dec 2022 11:49:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=2F2AKkVZIKUNaII54+BMfbbp6bI/EbvUjX6WZTvPuCA=; b=pte1Z/1XDpQMQlfRUwiXYayWq2
	HF0IzSsuxpL3838A0DBY5yXDlB/7Mb8IGw4Wef/ufOHj4AQyRKjLmrroZDbS0eg2DKFb4gBde7toe
	OXPktBAdS5mp7+oJDanXCl/uSJsdwxvTDSFzyQ8EIDOq/zTqJQZMLNUSg8f6etE/OSY0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 13/22] xen/x86: Add support for the PMAP
Date: Fri, 16 Dec 2022 11:48:44 +0000
Message-Id: <20221216114853.8227-14-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

PMAP will be used in a follow-up patch to bootstap map domain
page infrastructure -- we need some way to map pages to setup the
mapcache without a direct map.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    The PMAP infrastructure was upstream separately for Arm since
    Hongyan sent the secret-free hypervisor series. So this is a new
    patch to plumb the feature on x86.
---
 xen/arch/x86/Kconfig              |  1 +
 xen/arch/x86/include/asm/fixmap.h |  4 ++++
 xen/arch/x86/include/asm/pmap.h   | 25 +++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/pmap.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba3c..47b120f18497 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,6 +24,7 @@ config X86
 	select HAS_PCI
 	select HAS_PCI_MSI
 	select HAS_PDX
+	select HAS_PMAP
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c95..38f079873418 100644
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
@@ -54,6 +56,8 @@ enum fixed_addresses {
     FIX_XEN_SHARED_INFO,
 #endif /* CONFIG_XEN_GUEST */
     /* Everything else should go further down. */
+    FIX_PMAP_BEGIN,
+    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
     FIX_APIC_BASE,
     FIX_IO_APIC_BASE_0,
     FIX_IO_APIC_BASE_END = FIX_IO_APIC_BASE_0 + MAX_IO_APICS-1,
diff --git a/xen/arch/x86/include/asm/pmap.h b/xen/arch/x86/include/asm/pmap.h
new file mode 100644
index 000000000000..62746e191d03
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
2.38.1


