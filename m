Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC073BA9B3
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149551.276645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBZ-0001gg-AA; Sat, 03 Jul 2021 17:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149551.276645; Sat, 03 Jul 2021 17:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBZ-0001e6-4H; Sat, 03 Jul 2021 17:12:09 +0000
Received: by outflank-mailman (input) for mailman id 149551;
 Sat, 03 Jul 2021 17:12:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjBX-0001Wu-HV
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:12:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBW-0007ce-5b; Sat, 03 Jul 2021 17:12:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBV-0005vs-TO; Sat, 03 Jul 2021 17:12:06 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=aIWtWhcuPOkNdbKN38vfGnv+lqziWSfdZNPE+Udjlj8=; b=Vf9Vm+yQSPcRJdNGq9MMtxp0c
	OwQStU5yFNCZGF9m4yO8Pu6lx/vbibpnPWFR9QnVeKuAkEiUFDn6XVxdISUM3N4mXJ4NHvMMt04dy
	sE4oKpjcoW3XIFTKfFmtGH+k0h9mh0kWm9Zj3Ax4nVGFt6J66u2ZlfhKRuclXqXTypGnc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 4/4] xen/mm: Provide dummy M2P-related helpers when the M2P is not supported
Date: Sat,  3 Jul 2021 18:11:52 +0100
Message-Id: <20210703171152.15874-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703171152.15874-1-julien@xen.org>
References: <20210703171152.15874-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment, Arm is providing a dummy implementation for the M2P
helpers used in common code. However, they are quite isolated and could
be used by other architecture in the future. So move the helpers
necessary for compilation in xen/mm.h and gate them with a new config
!HAS_M2P. The other M2P related helpers are removed.

Take the opportunity to encode that CONFIG_MEM_SHARING requires
the M2P. It is done in the header rather than the Kconfig because
the option is not defined in the common Kconfig.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    INVALID_M2P_ENTRY needs to be defined because it is a parameter
    of set_gpfn_from_mfn(). The alternative would be to not
    evaluate the parameter 'pfn' (e.g. leave the helper as a macro)
    however this is a bit risky.

    Changes in v5:
        - Check that MEM_SHARING is not enabled without the M2P.

    Changes in v4:
        - The tags were dropped as the previous version was sent a long
        time ago.

    Changes in v3:
        - Add Stefano's reviewed-by
        - Add George's acked-by

    Changes in v2:
        - Patch added
---
 xen/arch/x86/Kconfig     |  1 +
 xen/include/asm-arm/mm.h | 11 -----------
 xen/include/xen/mm.h     | 17 +++++++++++++++++
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db64187..a083d8194680 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -16,6 +16,7 @@ config X86
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
 	select HAS_KEXEC
+	select HAS_M2P
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 07c24654a0b6..beff43786bda 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -318,17 +318,6 @@ static inline void *page_to_virt(const struct page_info *pg)
 struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
                                     unsigned long flags);
 
-/*
- * Arm does not have an M2P, but common code expects a handful of
- * M2P-related defines and functions. Provide dummy versions of these.
- */
-#define INVALID_M2P_ENTRY        (~0UL)
-#define SHARED_M2P_ENTRY         (~0UL - 1UL)
-#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
-
-/* We don't have a M2P on Arm */
-#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83a4..b98a1a7f423f 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -612,4 +612,21 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
+/*
+ * Dummy implementation of M2P-related helpers for common code when
+ * the architecture doesn't have an M2P.
+ */
+#ifndef CONFIG_HAS_M2P
+
+#ifdef CONFIG_MEM_SHARING
+# error "Memory sharing depends on the M2P"
+#endif
+
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P(_e)           ((void)(_e), false)
+
+static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn) {}
+
+#endif
+
 #endif /* __XEN_MM_H__ */
-- 
2.17.1


