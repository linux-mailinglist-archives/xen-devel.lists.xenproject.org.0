Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BED321BD8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 16:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88182.165698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDTW-0002do-Qz; Mon, 22 Feb 2021 15:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88182.165698; Mon, 22 Feb 2021 15:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDTW-0002dP-NP; Mon, 22 Feb 2021 15:50:18 +0000
Received: by outflank-mailman (input) for mailman id 88182;
 Mon, 22 Feb 2021 15:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEDTV-0002dE-AC
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 15:50:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f4ea680-e786-4910-8402-d092a0ce4e55;
 Mon, 22 Feb 2021 15:50:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F37F5AE14;
 Mon, 22 Feb 2021 15:50:14 +0000 (UTC)
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
X-Inumbo-ID: 9f4ea680-e786-4910-8402-d092a0ce4e55
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614009015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cX6HFlC6yMX9jwte7+WnLwTbx9zMa27UEshtsdOdOPQ=;
	b=jyETjackKs54X5vX6w5mfNXWqcVuW9em9Zs2PN26JyzvtXzj/bRPzUxVOf8qKE8ghvBqBc
	Zl19bGxFNJmGiRL6H9Ew6nlQYUGnrCD7nwt5WBs07Gysrmi7mDLWsNqLmPTJ90AWgo/RFu
	+C7gpcDYy21B7gz0XoF1ELLVyQvq6qM=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Message-ID: <2357b6ef-a452-13c8-8656-e42642e80d99@suse.com>
Date: Mon, 22 Feb 2021 16:50:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Now that we guard the entire Xen VA space against speculative abuse
through hypervisor accesses to guest memory, the argument translation
area's VA also needs to live outside this range, at least for 32-bit PV
guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
uniformly.

While this could be conditionalized upon CONFIG_PV32 &&
CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
keeps the code more legible imo.

Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
v2: Rename PERDOMAIN2_VIRT_START to PERDOMAIN_ALT_VIRT_START.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
                (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
                 l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
     }
+
+    /* Slot 511: Per-domain mappings mirror. */
+    if ( !is_pv_64bit_domain(d) )
+        l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =
+            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 }
 
 bool fill_ro_mpt(mfn_t mfn)
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -159,11 +159,11 @@ extern unsigned char boot_edid_info[128]
  *    1:1 direct mapping of all physical memory.
 #endif
  *  0xffff880000000000 - 0xffffffffffffffff [120TB,             PML4:272-511]
- *    PV: Guest-defined use.
+ *    PV (64-bit): Guest-defined use.
  *  0xffff880000000000 - 0xffffff7fffffffff [119.5TB,           PML4:272-510]
  *    HVM/idle: continuation of 1:1 mapping
  *  0xffffff8000000000 - 0xffffffffffffffff [512GB, 2^39 bytes  PML4:511]
- *    HVM/idle: unused
+ *    HVM / 32-bit PV: Secondary per-domain mappings.
  *
  * Compatibility guest area layout:
  *  0x0000000000000000 - 0x00000000f57fffff [3928MB,            PML4:0]
@@ -242,6 +242,9 @@ extern unsigned char boot_edid_info[128]
 #endif
 #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)
 
+/* Slot 511: secondary per-domain mappings (for compat xlat area accesses). */
+#define PERDOMAIN_ALT_VIRT_START PML4_ADDR(511)
+
 #ifndef __ASSEMBLY__
 
 #ifdef CONFIG_PV32
--- a/xen/include/asm-x86/x86_64/uaccess.h
+++ b/xen/include/asm-x86/x86_64/uaccess.h
@@ -1,7 +1,17 @@
 #ifndef __X86_64_UACCESS_H
 #define __X86_64_UACCESS_H
 
-#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current))
+/*
+ * With CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS (apparent) PV guest accesses
+ * are prohibited to touch the Xen private VA range.  The compat argument
+ * translation area, therefore, can't live within this range.  Domains
+ * (potentially) in need of argument translation (32-bit PV, possibly HVM) get
+ * a secondary mapping installed, which needs to be used for such accesses in
+ * the PV case, and will also be used for HVM to avoid extra conditionals.
+ */
+#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
+                                   (PERDOMAIN_ALT_VIRT_START - \
+                                    PERDOMAIN_VIRT_START))
 #define COMPAT_ARG_XLAT_SIZE      (2*PAGE_SIZE)
 struct vcpu;
 int setup_compat_arg_xlat(struct vcpu *v);

