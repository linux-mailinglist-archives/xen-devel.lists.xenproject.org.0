Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EB324CD8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 10:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89652.169029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFCyy-0001ix-Gq; Thu, 25 Feb 2021 09:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89652.169029; Thu, 25 Feb 2021 09:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFCyy-0001iY-Dk; Thu, 25 Feb 2021 09:30:52 +0000
Received: by outflank-mailman (input) for mailman id 89652;
 Thu, 25 Feb 2021 09:30:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFCyw-0001iT-NS
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 09:30:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 668af6fa-de4b-468b-8874-511155fb9473;
 Thu, 25 Feb 2021 09:30:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD387AC1D;
 Thu, 25 Feb 2021 09:30:48 +0000 (UTC)
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
X-Inumbo-ID: 668af6fa-de4b-468b-8874-511155fb9473
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614245449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k5zZu7hjg52cgojELw71rkpoVSlk7KP4+FpJe/naTbE=;
	b=BO1GKhddZRGNlok9epDuUTki4R+GcGUaS5IGt+lGtcvMU3Kd8u4XHtnOBxAajscA4n7eQN
	i07pclDiNBlaGVZqUspJ1uZSNhDiy+hy06xPJk79wvsjh9KMvlzTKQ9/+kuEeYhQ5vqIqk
	w21els91RR3fiacJsf3nSZsoM1/QVDE=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Message-ID: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
Date: Thu, 25 Feb 2021 10:30:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

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
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
v3: Use address range in lower half of address space.
v2: Rename PERDOMAIN2_VIRT_START to PERDOMAIN_ALT_VIRT_START.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1691,6 +1691,13 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
         l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 
+    /* Slot 4: Per-domain mappings mirror. */
+    BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
+                 !l4_table_offset(PERDOMAIN_ALT_VIRT_START));
+    if ( !is_pv_64bit_domain(d) )
+        l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =
+            l4t[l4_table_offset(PERDOMAIN_VIRT_START)];
+
     /* Slot 261-: text/data/bss, RW M2P, vmap, frametable, directmap. */
 #ifndef NDEBUG
     if ( short_directmap &&
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -170,7 +170,11 @@ extern unsigned char boot_edid_info[128]
  *    Guest-defined use.
  *  0x00000000f5800000 - 0x00000000ffffffff [168MB,             PML4:0]
  *    Read-only machine-to-phys translation table (GUEST ACCESSIBLE).
- *  0x0000000100000000 - 0x00007fffffffffff [128TB-4GB,         PML4:0-255]
+ *  0x0000000100000000 - 0x000001ffffffffff [2TB-4GB,           PML4:0-3]
+ *    Unused / Reserved for future use.
+ *  0x0000020000000000 - 0x0000027fffffffff [512GB, 2^39 bytes, PML4:4]
+ *    Mirror of per-domain mappings (for argument translation area; also HVM).
+ *  0x0000028000000000 - 0x00007fffffffffff [125.5TB,           PML4:5-255]
  *    Unused / Reserved for future use.
  */
 
@@ -207,6 +211,8 @@ extern unsigned char boot_edid_info[128]
 #define PERDOMAIN_SLOTS         3
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
+/* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
+#define PERDOMAIN_ALT_VIRT_START PML4_ADDR(260 % 256)
 /* Slot 261: machine-to-phys conversion table (256GB). */
 #define RDWR_MPT_VIRT_START     (PML4_ADDR(261))
 #define RDWR_MPT_VIRT_END       (RDWR_MPT_VIRT_START + MPT_VIRT_SIZE)
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

