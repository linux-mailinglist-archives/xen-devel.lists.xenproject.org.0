Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81772F7E34
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68168.121990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q8K-0002K3-Ul; Fri, 15 Jan 2021 14:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68168.121990; Fri, 15 Jan 2021 14:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q8K-0002Je-RL; Fri, 15 Jan 2021 14:31:24 +0000
Received: by outflank-mailman (input) for mailman id 68168;
 Fri, 15 Jan 2021 14:31:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNwb=GS=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1l0Q8J-0002JX-OB
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:31:23 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7c52707-885b-4c97-8623-06fb47785cba;
 Fri, 15 Jan 2021 14:31:22 +0000 (UTC)
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
X-Inumbo-ID: a7c52707-885b-4c97-8623-06fb47785cba
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: [PATCH] x86/vmx: Remove IO bitmap from minimal VMX requirements
Date: Fri, 15 Jan 2021 15:30:50 +0100
Message-Id: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is a result of a downstream bug report[1]. Xen fails to
create a HVM domain while running under VMware Fusion 12.1.0 on
a modern Intel Core i9 CPU:

(XEN) VMX: CPU0 has insufficient CPU-Based Exec Control (b5b9fffe; requires 2299968c)
(XEN) VMX: failed to initialise.

It seems that Apple hypervisor API doesn't support this feature[2].

Move this bit from minimal required features to optional.

[1] https://github.com/CERT-Polska/drakvuf-sandbox/issues/418
[2] https://developer.apple.com/documentation/hypervisor/cpu_based_io_bitmaps

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmcs.c        | 8 +++++---
 xen/include/asm-x86/hvm/vmx/vmcs.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 164535f8f0..bad4d6e206 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -276,10 +276,10 @@ static int vmx_init_vmcs_config(void)
            CPU_BASED_MONITOR_EXITING |
            CPU_BASED_MWAIT_EXITING |
            CPU_BASED_MOV_DR_EXITING |
-           CPU_BASED_ACTIVATE_IO_BITMAP |
            CPU_BASED_USE_TSC_OFFSETING |
            CPU_BASED_RDTSC_EXITING);
     opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
+           CPU_BASED_ACTIVATE_IO_BITMAP |
            CPU_BASED_TPR_SHADOW |
            CPU_BASED_MONITOR_TRAP_FLAG |
            CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
@@ -1168,8 +1168,10 @@ static int construct_vmcs(struct vcpu *v)
     }
 
     /* I/O access bitmap. */
-    __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
-    __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
+    if ( cpu_has_vmx_io_bitmap ) {
+        __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
+        __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
+    }
 
     if ( cpu_has_vmx_virtual_intr_delivery )
     {
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 906810592f..b00830a5b3 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -342,6 +342,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+#define cpu_has_vmx_io_bitmap \
+    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_IO_BITMAP)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
-- 
2.30.0


