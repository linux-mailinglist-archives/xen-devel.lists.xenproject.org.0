Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBCA1940D7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:04:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHT3b-0006sU-Fe; Thu, 26 Mar 2020 14:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHT3Z-0006sP-OD
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:00:25 +0000
X-Inumbo-ID: 2285775d-6f6a-11ea-87f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2285775d-6f6a-11ea-87f0-12813bfff9fa;
 Thu, 26 Mar 2020 14:00:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0276FAC5F;
 Thu, 26 Mar 2020 14:00:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f39ca23-4d63-ca73-4916-de64efde1a11@suse.com>
Date: Thu, 26 Mar 2020 15:00:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH] SVM: split _np_enable VMCB field
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The nest paging enable is actually just a single bit within the 64-bit
VMCB field, which is particularly relevant for uses like the one in
nsvm_vcpu_vmentry(). Split the field, adding definitions for a few other
bits at the same time. To be able to generate accessors for bitfields,
VMCB_ACCESSORS() needs the type part broken out, as typeof() can't be
applied to bitfields. Unfortunately this means specification of the same
type in two distinct places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note: For the time being compile tested only.

--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -62,8 +62,8 @@ void svm_vmcb_dump(const char *from, con
            vmcb->exitcode, vmcb->exit_int_info.raw);
     printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
            vmcb->exitinfo1, vmcb->exitinfo2);
-    printk("np_enable = %#"PRIx64" guest_asid = %#x\n",
-           vmcb_get_np_enable(vmcb), vmcb_get_guest_asid(vmcb));
+    printk("np_ctrl = %#"PRIx64" guest_asid = %#x\n",
+           vmcb_get_np_ctrl(vmcb), vmcb_get_guest_asid(vmcb));
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -439,7 +439,17 @@ struct vmcb_struct {
         } ei;
     };
     intinfo_t exit_int_info;    /* offset 0x88 */
-    u64 _np_enable;             /* offset 0x90 - cleanbit 4 */
+    union {                     /* offset 0x90 - cleanbit 4 */
+        struct {
+            bool _np_enable     :1;
+            bool _sev_enable    :1;
+            bool _sev_es_enable :1;
+            bool _gmet          :1;
+            bool                :1;
+            bool _vte           :1;
+        };
+        uint64_t _np_ctrl;
+    };
     u64 res08[2];
     intinfo_t event_inj;        /* offset 0xA8 */
     u64 _h_cr3;                 /* offset 0xB0 - cleanbit 4 */
@@ -569,20 +579,23 @@ void svm_intercept_msr(struct vcpu *v, u
  * VMCB accessor functions.
  */
 
-#define VMCB_ACCESSORS(name, cleanbit)            \
+#define VMCB_ACCESSORS_(name, type, cleanbit)     \
 static inline void                                \
 vmcb_set_ ## name(struct vmcb_struct *vmcb,       \
-                  typeof(vmcb->_ ## name) value)  \
+                  type value)                     \
 {                                                 \
     vmcb->_ ## name = value;                      \
     vmcb->cleanbits.fields.cleanbit = 0;          \
 }                                                 \
-static inline typeof(alloc_vmcb()->_ ## name)     \
+static inline type                                \
 vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
 {                                                 \
     return vmcb->_ ## name;                       \
 }
 
+#define VMCB_ACCESSORS(name, cleanbit) \
+        VMCB_ACCESSORS_(name, typeof(alloc_vmcb()->_ ## name), cleanbit)
+
 VMCB_ACCESSORS(cr_intercepts, intercepts)
 VMCB_ACCESSORS(dr_intercepts, intercepts)
 VMCB_ACCESSORS(exception_intercepts, intercepts)
@@ -595,7 +608,12 @@ VMCB_ACCESSORS(iopm_base_pa, iopm)
 VMCB_ACCESSORS(msrpm_base_pa, iopm)
 VMCB_ACCESSORS(guest_asid, asid)
 VMCB_ACCESSORS(vintr, tpr)
-VMCB_ACCESSORS(np_enable, np)
+VMCB_ACCESSORS(np_ctrl, np)
+VMCB_ACCESSORS_(np_enable, bool, np)
+VMCB_ACCESSORS_(sev_enable, bool, np)
+VMCB_ACCESSORS_(sev_es_enable, bool, np)
+VMCB_ACCESSORS_(gmet, bool, np)
+VMCB_ACCESSORS_(vte, bool, np)
 VMCB_ACCESSORS(h_cr3, np)
 VMCB_ACCESSORS(g_pat, np)
 VMCB_ACCESSORS(cr0, cr)

