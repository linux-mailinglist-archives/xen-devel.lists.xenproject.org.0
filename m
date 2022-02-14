Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1339E4B50A8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271507.466025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapo-0005kF-6p; Mon, 14 Feb 2022 12:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271507.466025; Mon, 14 Feb 2022 12:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapn-0005dd-Pt; Mon, 14 Feb 2022 12:52:03 +0000
Received: by outflank-mailman (input) for mailman id 271507;
 Mon, 14 Feb 2022 12:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapl-0003jk-Kh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:52:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4ac43fb-8d94-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:51:58 +0100 (CET)
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
X-Inumbo-ID: e4ac43fb-8d94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LDFys9qkWZQwimW2LVFGkIq2g5umxCHwhtWsKzFzSd8=;
  b=GTe66ceLkHNYQ6GDecdgKbd7CynQeAaI4UA35WnamC2l2rs9wH8uPM40
   9pzUloFcuBN+rhdJKy6qacNQzfOvXLssz0FFHVSawxGn0Rf0gWeq6Ycx7
   tWS4k0jwDtfYzeRYg1XZ1HAvbEf3RHcRlWiogMw5Y4eZWbVRTml2Il5R8
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oPRjvKs0pPrCMLv66khxI8jrMLdUSvMEhCYgCdFBfWfwtzmJlUVZnGGr5MPCtIjwqdh+e/snZO
 pozZIg8KlLawPZMHZ4/Y3naBq795WABEYAAYdGwVwlVZGAhbibsIuGZnUrYSrq+UAwFHoTeFNu
 +8Wz2REqp7obneg1RjfW4+L8MHLz4ybD0Texd+/5SVWgXXK7uWrUViR2drHMJ/Cg3PnogzXP8V
 9SBQK3yI1dH/SjstRp8zFTdfvI02QS1/FYc+eMFCWcVv9S+qaH5YXTwfZjlvZewG2jUj+lRIJm
 CNGcx8dJbScEfDZSkQuwJwND
X-SBRS: 5.1
X-MesageID: 64048979
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0RL5e6+cYBGhNKtWBEapDrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 2ZMXzuHPv+JZTagf9okbd7g800D6JXVyodqTVA+qnw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhql
 utSl7GaGDsFN/zvwac7ehdDHwxHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SRaqON
 pVIAdZpRAj/aFoUO2gqNJ4Roe7ypFL0bmdorl3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9Gi1HChef91e
 nA483sN9OsU3UKwQvTECkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxvmzOLHcqjp/lluJLHDEOopX4+GAPmRogEAGms+m05K
 v5TaJmHzQtxSur7bnWF+IIfNwlSf3M6GYr3u4pccevaelhqH2QoCvnwx7I9etM6w/QJx7mQp
 nztCFVFzFffhGHcLVnYYH5Ud76yD410qmg2PHJwMA/wiWQje4um8IwWa4AzIes87OVmwPMtF
 6sFdsyMD+5hUDPC/zhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +Wtj1qJT4ACSgJuCNftRMiul17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK2J89WpHu95EhYIFmXX9+/rZyzT/27lyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPJs/cbrqp9b0h9gTSfCYFmcA799JmWLgJtUvapXy74F4Qa7V
 ypjIDWB1Wll7C89LGMsGQ==
IronPort-HdrOrdr: A9a23:ky84r66UKIx0ubM9kQPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64048979"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 08/70] xen: CFI hardening for x86 hypercalls
Date: Mon, 14 Feb 2022 12:50:25 +0000
Message-ID: <20220214125127.17985-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/compat.c                |  7 ++--
 xen/arch/x86/cpu/mcheck/mce.c        |  2 +-
 xen/arch/x86/cpu/vpmu.c              |  3 +-
 xen/arch/x86/hvm/dm.c                |  5 ++-
 xen/arch/x86/hvm/hvm.c               |  2 +-
 xen/arch/x86/hvm/hypercall.c         |  5 +--
 xen/arch/x86/include/asm/hypercall.h | 69 +++++++++++++++++++-----------------
 xen/arch/x86/include/asm/paging.h    |  2 +-
 xen/arch/x86/mm.c                    | 23 ++++++------
 xen/arch/x86/mm/paging.c             |  3 +-
 xen/arch/x86/physdev.c               |  2 +-
 xen/arch/x86/platform_hypercall.c    |  3 +-
 xen/arch/x86/pv/callback.c           | 25 +++++++------
 xen/arch/x86/pv/descriptor-tables.c  | 14 ++++----
 xen/arch/x86/pv/iret.c               |  4 +--
 xen/arch/x86/pv/misc-hypercalls.c    | 10 +++---
 xen/arch/x86/pv/shim.c               |  8 ++---
 xen/arch/x86/x86_64/compat/mm.c      |  7 ++--
 xen/common/argo.c                    |  4 +--
 xen/common/compat/domain.c           |  3 +-
 xen/common/compat/grant_table.c      |  5 ++-
 xen/common/compat/kernel.c           |  2 +-
 xen/common/compat/memory.c           |  3 +-
 xen/common/dm.c                      |  6 ++--
 xen/common/domain.c                  |  5 +--
 xen/common/domctl.c                  |  2 +-
 xen/common/event_channel.c           |  2 +-
 xen/common/grant_table.c             |  2 +-
 xen/common/hypfs.c                   |  6 ++--
 xen/common/kernel.c                  |  2 +-
 xen/common/kexec.c                   |  4 +--
 xen/common/memory.c                  |  2 +-
 xen/common/multicall.c               |  2 +-
 xen/common/sched/compat.c            |  2 +-
 xen/common/sched/core.c              |  4 +--
 xen/common/sysctl.c                  |  2 +-
 xen/common/xenoprof.c                |  2 +-
 xen/drivers/char/console.c           |  4 +--
 xen/include/xen/hypercall.h          | 69 ++++++++++++++++++------------------
 xen/xsm/xsm_core.c                   |  4 +--
 40 files changed, 169 insertions(+), 162 deletions(-)

diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index 939b449dec29..28281a262a3c 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -15,7 +15,7 @@ typedef long ret_t;
 #endif
 
 /* Legacy hypercall (as of 0x00030202). */
-ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
+ret_t cf_check do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 {
     struct physdev_op op;
 
@@ -28,7 +28,7 @@ ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 #ifndef COMPAT
 
 /* Legacy hypercall (as of 0x00030101). */
-long do_sched_op_compat(int cmd, unsigned long arg)
+long cf_check do_sched_op_compat(int cmd, unsigned long arg)
 {
     switch ( cmd )
     {
@@ -50,7 +50,8 @@ long do_sched_op_compat(int cmd, unsigned long arg)
 }
 
 /* Legacy hypercall (as of 0x00030202). */
-long do_event_channel_op_compat(XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
+long cf_check do_event_channel_op_compat(
+    XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
 {
     struct evtchn_op op;
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 7f433343bca3..eae08caa07cd 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1351,7 +1351,7 @@ CHECK_mcinfo_recovery;
 # endif /* CONFIG_COMPAT */
 
 /* Machine Check Architecture Hypercall */
-long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
+long cf_check do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
 {
     long ret = 0;
     struct xen_mc curop, *op = &curop;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 8ec4547bedf4..598291f4ece9 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -671,7 +671,8 @@ void vpmu_dump(struct vcpu *v)
         alternative_vcall(vpmu_ops.arch_vpmu_dump, v);
 }
 
-long do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
+long cf_check do_xenpmu_op(
+    unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
 {
     int ret;
     struct vcpu *curr;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index b60b9f3364a8..d80975efcf45 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -654,9 +654,8 @@ CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
 CHECK_dm_op_nr_vcpus;
 
-int compat_dm_op(domid_t domid,
-                 unsigned int nr_bufs,
-                 XEN_GUEST_HANDLE_PARAM(void) bufs)
+int cf_check compat_dm_op(
+    domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) bufs)
 {
     struct dmop_args args;
     unsigned int i;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c4ddb8607d9c..4e685c1b0c1b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5015,7 +5015,7 @@ static int hvmop_get_mem_type(
     return rc;
 }
 
-long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
 
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 384724ec41a3..030243810e48 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,7 +31,8 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
-static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+static long cf_check hvm_memory_op(
+    unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
@@ -51,7 +52,7 @@ static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef CONFIG_GRANT_TABLE
-static long hvm_grant_table_op(
+static long cf_check hvm_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     switch ( cmd )
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index eb3aed3bf70e..16d8418b5774 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -38,97 +38,97 @@ void pv_ring3_init_hypercall_page(void *ptr);
  */
 #define MMU_UPDATE_PREEMPTED          (~(~0U>>1))
 
-extern long
+extern long cf_check
 do_event_channel_op_compat(
     XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop);
 
 /* Legacy hypercall (as of 0x00030202). */
-extern long do_physdev_op_compat(
+extern long cf_check do_physdev_op_compat(
     XEN_GUEST_HANDLE(physdev_op_t) uop);
 
 /* Legacy hypercall (as of 0x00030101). */
-extern long do_sched_op_compat(
+extern long cf_check do_sched_op_compat(
     int cmd, unsigned long arg);
 
-extern long
+extern long cf_check
 do_set_trap_table(
     XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps);
 
-extern long
+extern long cf_check
 do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
-extern long
+extern long cf_check
 do_set_gdt(
     XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list,
     unsigned int entries);
 
-extern long
+extern long cf_check
 do_stack_switch(
     unsigned long ss,
     unsigned long esp);
 
-extern long
+extern long cf_check
 do_fpu_taskswitch(
     int set);
 
-extern long
+extern long cf_check
 do_set_debugreg(
     int reg,
     unsigned long value);
 
-extern unsigned long
+extern unsigned long cf_check
 do_get_debugreg(
     int reg);
 
-extern long
+extern long cf_check
 do_update_descriptor(
     uint64_t gaddr, seg_desc_t desc);
 
-extern long
+extern long cf_check
 do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
 
-extern long
+extern long cf_check
 do_update_va_mapping(
     unsigned long va,
     u64 val64,
     unsigned long flags);
 
-extern long
+extern long cf_check
 do_physdev_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_update_va_mapping_otherdomain(
     unsigned long va,
     u64 val64,
     unsigned long flags,
     domid_t domid);
 
-extern long
+extern long cf_check
 do_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
-extern long do_callback_op(
+extern long cf_check do_callback_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
 
-extern unsigned long
+extern unsigned long cf_check
 do_iret(
     void);
 
-extern long
+extern long cf_check
 do_set_callbacks(
     unsigned long event_address,
     unsigned long failsafe_address,
     unsigned long syscall_address);
 
-extern long
+extern long cf_check
 do_set_segment_base(
     unsigned int which,
     unsigned long base);
@@ -139,7 +139,7 @@ do_set_segment_base(
 #include <compat/physdev.h>
 #include <compat/platform.h>
 
-extern int
+extern int cf_check
 compat_physdev_op(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
@@ -148,44 +148,47 @@ extern int
 arch_compat_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int compat_mmuext_op(
+extern int cf_check compat_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(void) arg,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
 DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
-extern int compat_platform_op(
+extern int cf_check compat_platform_op(
     XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
 
-extern long compat_callback_op(
+extern long cf_check compat_callback_op(
     int cmd, XEN_GUEST_HANDLE(void) arg);
 
-extern int compat_update_va_mapping(
+extern int cf_check compat_update_va_mapping(
     unsigned int va, u32 lo, u32 hi, unsigned int flags);
 
-extern int compat_update_va_mapping_otherdomain(
+extern int cf_check compat_update_va_mapping_otherdomain(
     unsigned int va, u32 lo, u32 hi, unsigned int flags, domid_t domid);
 
 DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
-extern int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps);
+extern int cf_check compat_set_trap_table(
+    XEN_GUEST_HANDLE(trap_info_compat_t) traps);
 
-extern int compat_set_gdt(
+extern int cf_check compat_set_gdt(
     XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries);
 
-extern int compat_update_descriptor(
+extern int cf_check compat_update_descriptor(
     u32 pa_lo, u32 pa_hi, u32 desc_lo, u32 desc_hi);
 
-extern unsigned int compat_iret(void);
+extern unsigned int cf_check compat_iret(void);
 
-extern int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+extern int cf_check compat_nmi_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long compat_set_callbacks(
+extern long cf_check compat_set_callbacks(
     unsigned long event_selector, unsigned long event_address,
     unsigned long failsafe_selector, unsigned long failsafe_address);
 
 DEFINE_XEN_GUEST_HANDLE(physdev_op_compat_t);
-extern int compat_physdev_op_compat(XEN_GUEST_HANDLE(physdev_op_compat_t) uop);
+extern int cf_check compat_physdev_op_compat(
+    XEN_GUEST_HANDLE(physdev_op_compat_t) uop);
 
 #endif /* CONFIG_COMPAT */
 
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 2ddcfb022c7b..f0b4efc66e2d 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -235,7 +235,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   bool_t resuming);
 
 /* Helper hypercall for dealing with continuations. */
-long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
+long cf_check paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
 /* Call when destroying a vcpu/domain */
 void paging_vcpu_teardown(struct vcpu *v);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b80e4ab9c564..6484c3b97bbc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3377,7 +3377,7 @@ static int vcpumask_to_pcpumask(
     }
 }
 
-long do_mmuext_op(
+long cf_check do_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
@@ -3916,7 +3916,7 @@ long do_mmuext_op(
     return rc;
 }
 
-long do_mmu_update(
+long cf_check do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
@@ -4501,8 +4501,8 @@ static int __do_update_va_mapping(
     return rc;
 }
 
-long do_update_va_mapping(unsigned long va, u64 val64,
-                          unsigned long flags)
+long cf_check do_update_va_mapping(
+    unsigned long va, u64 val64, unsigned long flags)
 {
     int rc = __do_update_va_mapping(va, val64, flags, current->domain);
 
@@ -4513,9 +4513,8 @@ long do_update_va_mapping(unsigned long va, u64 val64,
     return rc;
 }
 
-long do_update_va_mapping_otherdomain(unsigned long va, u64 val64,
-                                      unsigned long flags,
-                                      domid_t domid)
+long cf_check do_update_va_mapping_otherdomain(
+    unsigned long va, u64 val64, unsigned long flags, domid_t domid)
 {
     struct domain *pg_owner;
     int rc;
@@ -4537,8 +4536,8 @@ long do_update_va_mapping_otherdomain(unsigned long va, u64 val64,
 #endif /* CONFIG_PV */
 
 #ifdef CONFIG_PV32
-int compat_update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi,
-                             unsigned int flags)
+int cf_check compat_update_va_mapping(
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
 {
     int rc = __do_update_va_mapping(va, ((uint64_t)hi << 32) | lo,
                                     flags, current->domain);
@@ -4550,9 +4549,9 @@ int compat_update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi,
     return rc;
 }
 
-int compat_update_va_mapping_otherdomain(unsigned int va,
-                                         uint32_t lo, uint32_t hi,
-                                         unsigned int flags, domid_t domid)
+int cf_check compat_update_va_mapping_otherdomain(
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags,
+    domid_t domid)
 {
     struct domain *pg_owner;
     int rc;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index dc3a4a0b4bb1..1f0b94ad212a 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -759,7 +759,8 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return shadow_domctl(d, sc, u_domctl);
 }
 
-long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+long cf_check paging_domctl_continuation(
+    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     struct xen_domctl op;
     struct domain *d;
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index ea38be8b797a..2ddcf44f33a4 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
 }
 #endif /* COMPAT */
 
-ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t cf_check do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int irq;
     ret_t ret;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index bf4090c94201..84566bbfaa3d 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -213,7 +213,8 @@ void resource_access(void *info)
 }
 #endif
 
-ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
+ret_t cf_check do_platform_op(
+    XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
 {
     ret_t ret;
     struct xen_platform_op curop, *op = &curop;
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 42a6aa0831b7..55148c7f9e50 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -140,7 +140,7 @@ static long unregister_guest_callback(struct callback_unregister *unreg)
     return ret;
 }
 
-long do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
+long cf_check do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
 {
     long ret;
 
@@ -178,9 +178,9 @@ long do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
     return ret;
 }
 
-long do_set_callbacks(unsigned long event_address,
-                      unsigned long failsafe_address,
-                      unsigned long syscall_address)
+long cf_check do_set_callbacks(
+    unsigned long event_address, unsigned long failsafe_address,
+    unsigned long syscall_address)
 {
     struct callback_register event = {
         .type = CALLBACKTYPE_event,
@@ -283,7 +283,7 @@ static long compat_unregister_guest_callback(
     return ret;
 }
 
-long compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
+long cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
 {
     long ret;
 
@@ -321,10 +321,9 @@ long compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
     return ret;
 }
 
-long compat_set_callbacks(unsigned long event_selector,
-                          unsigned long event_address,
-                          unsigned long failsafe_selector,
-                          unsigned long failsafe_address)
+long cf_check compat_set_callbacks(
+    unsigned long event_selector, unsigned long event_address,
+    unsigned long failsafe_selector, unsigned long failsafe_address)
 {
     struct compat_callback_register event = {
         .type = CALLBACKTYPE_event,
@@ -349,7 +348,7 @@ long compat_set_callbacks(unsigned long event_selector,
 
 #endif /* CONFIG_PV32 */
 
-long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
+long cf_check do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
 {
     struct trap_info cur;
     struct vcpu *curr = current;
@@ -395,7 +394,7 @@ long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
 }
 
 #ifdef CONFIG_PV32
-int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
+int cf_check compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
 {
     struct vcpu *curr = current;
     struct compat_trap_info cur;
@@ -438,7 +437,7 @@ int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
 }
 #endif
 
-long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xennmi_callback cb;
     long rc = 0;
@@ -464,7 +463,7 @@ long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef CONFIG_PV32
-int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+int cf_check compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct compat_nmi_callback cb;
     int rc = 0;
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 5e847044009b..653a61d0b518 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -124,8 +124,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
     return -EINVAL;
 }
 
-long do_set_gdt(XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list,
-                unsigned int entries)
+long cf_check do_set_gdt(
+    XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list, unsigned int entries)
 {
     unsigned int nr_frames = DIV_ROUND_UP(entries, 512);
     unsigned long frames[16];
@@ -151,8 +151,8 @@ long do_set_gdt(XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list,
 
 #ifdef CONFIG_PV32
 
-int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint) frame_list,
-                   unsigned int entries)
+int cf_check compat_set_gdt(
+    XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries)
 {
     struct vcpu *curr = current;
     unsigned int i, nr_frames = DIV_ROUND_UP(entries, 512);
@@ -187,8 +187,8 @@ int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint) frame_list,
     return ret;
 }
 
-int compat_update_descriptor(uint32_t pa_lo, uint32_t pa_hi,
-                             uint32_t desc_lo, uint32_t desc_hi)
+int cf_check compat_update_descriptor(
+    uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi)
 {
     seg_desc_t d;
 
@@ -299,7 +299,7 @@ int validate_segdesc_page(struct page_info *page)
     return i == 512 ? 0 : -EINVAL;
 }
 
-long do_update_descriptor(uint64_t gaddr, seg_desc_t d)
+long cf_check do_update_descriptor(uint64_t gaddr, seg_desc_t d)
 {
     struct domain *currd = current->domain;
     gfn_t gfn = gaddr_to_gfn(gaddr);
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 29a2f7cc452b..dd2965d8f08d 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -48,7 +48,7 @@ static void async_exception_cleanup(struct vcpu *curr)
         curr->arch.async_exception_state(trap).old_mask;
 }
 
-unsigned long do_iret(void)
+unsigned long cf_check do_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct iret_context iret_saved;
@@ -105,7 +105,7 @@ unsigned long do_iret(void)
 }
 
 #ifdef CONFIG_PV32
-unsigned int compat_iret(void)
+unsigned int cf_check compat_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 5dade2472687..5649aaab4436 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -23,12 +23,12 @@
 
 #include <asm/debugreg.h>
 
-long do_set_debugreg(int reg, unsigned long value)
+long cf_check do_set_debugreg(int reg, unsigned long value)
 {
     return set_debugreg(current, reg, value);
 }
 
-unsigned long do_get_debugreg(int reg)
+unsigned long cf_check do_get_debugreg(int reg)
 {
     unsigned long val;
     int res = x86emul_read_dr(reg, &val, NULL);
@@ -36,7 +36,7 @@ unsigned long do_get_debugreg(int reg)
     return res == X86EMUL_OKAY ? val : -ENODEV;
 }
 
-long do_fpu_taskswitch(int set)
+long cf_check do_fpu_taskswitch(int set)
 {
     struct vcpu *v = current;
 
@@ -171,7 +171,7 @@ long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
     return 0;
 }
 
-long do_stack_switch(unsigned long ss, unsigned long esp)
+long cf_check do_stack_switch(unsigned long ss, unsigned long esp)
 {
     fixup_guest_stack_selector(current->domain, ss);
     current->arch.pv.kernel_ss = ss;
@@ -180,7 +180,7 @@ long do_stack_switch(unsigned long ss, unsigned long esp)
     return 0;
 }
 
-long do_set_segment_base(unsigned int which, unsigned long base)
+long cf_check do_set_segment_base(unsigned int which, unsigned long base)
 {
     struct vcpu *v = current;
     long ret = 0;
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 7e891fe2f7a4..4c710ad8913f 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -824,8 +824,8 @@ long pv_shim_grant_table_op(unsigned int cmd,
 
 #ifndef CONFIG_GRANT_TABLE
 /* Thin wrapper(s) needed. */
-long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
-                       unsigned int count)
+long cf_check do_grant_table_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
         return -ENOSYS;
@@ -834,8 +834,8 @@ long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
 }
 
 #ifdef CONFIG_PV32
-int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
-                          unsigned int count)
+int cf_check compat_grant_table_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
         return -ENOSYS;
diff --git a/xen/arch/x86/x86_64/compat/mm.c b/xen/arch/x86/x86_64/compat/mm.c
index 215e96aba032..b3da8fafbb0c 100644
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -176,10 +176,9 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifdef CONFIG_PV
 DEFINE_XEN_GUEST_HANDLE(mmuext_op_compat_t);
 
-int compat_mmuext_op(XEN_GUEST_HANDLE_PARAM(void) arg,
-                     unsigned int count,
-                     XEN_GUEST_HANDLE_PARAM(uint) pdone,
-                     unsigned int foreigndom)
+int cf_check compat_mmuext_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg, unsigned int count,
+    XEN_GUEST_HANDLE_PARAM(uint) pdone, unsigned int foreigndom)
 {
     unsigned int i, preempt_mask;
     int rc = 0;
diff --git a/xen/common/argo.c b/xen/common/argo.c
index eaea7ba8885a..1448faf65731 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2069,7 +2069,7 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
     return ( ret < 0 ) ? ret : len;
 }
 
-long
+long cf_check
 do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
            XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long raw_arg3,
            unsigned long raw_arg4)
@@ -2207,7 +2207,7 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
 }
 
 #ifdef CONFIG_COMPAT
-long
+long cf_check
 compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
                XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
                unsigned long arg4)
diff --git a/xen/common/compat/domain.c b/xen/common/compat/domain.c
index 98b8c15cea7f..afae27eeba02 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -38,7 +38,8 @@ CHECK_vcpu_hvm_context;
 
 #endif
 
-int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
+int cf_check compat_vcpu_op(
+    int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d = current->domain;
     struct vcpu *v;
diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index ff1d678f01c7..c6199e89188d 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -55,9 +55,8 @@ CHECK_gnttab_swap_grant_ref;
 CHECK_gnttab_cache_flush;
 #undef xen_gnttab_cache_flush
 
-int compat_grant_table_op(unsigned int cmd,
-                          XEN_GUEST_HANDLE_PARAM(void) cmp_uop,
-                          unsigned int count)
+int cf_check compat_grant_table_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) cmp_uop, unsigned int count)
 {
     int rc = 0;
     unsigned int i, cmd_op;
diff --git a/xen/common/compat/kernel.c b/xen/common/compat/kernel.c
index 804b919bdc72..8e8c413bf1d0 100644
--- a/xen/common/compat/kernel.c
+++ b/xen/common/compat/kernel.c
@@ -37,7 +37,7 @@ CHECK_TYPE(capabilities_info);
 
 CHECK_TYPE(domain_handle);
 
-#define DO(fn) int compat_##fn
+#define DO(fn) int cf_check compat_##fn
 #define COMPAT
 
 #include "../kernel.c"
diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index c43fa97cf15f..ec8ba54bb66e 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -53,7 +53,8 @@ static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
 }
 #endif
 
-int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
+int cf_check compat_memory_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
diff --git a/xen/common/dm.c b/xen/common/dm.c
index 2d1d98ca583e..fcb3a1aa0557 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -19,9 +19,9 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 
-long do_dm_op(domid_t domid,
-              unsigned int nr_bufs,
-              XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
+long cf_check do_dm_op(
+    domid_t domid, unsigned int nr_bufs,
+    XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
 {
     struct dmop_args args;
     int rc;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 571ef4fe615e..e58c0bd4ddc4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1603,7 +1603,8 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
-long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_vcpu_op(
+    int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d = current->domain;
     struct vcpu *v;
@@ -1790,7 +1791,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef arch_vm_assist_valid_mask
-long do_vm_assist(unsigned int cmd, unsigned int type)
+long cf_check do_vm_assist(unsigned int cmd, unsigned int type)
 {
     struct domain *currd = current->domain;
     const unsigned long valid = arch_vm_assist_valid_mask(currd);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 879a2adcbeb0..9606fa4f1aed 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -274,7 +274,7 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
     return ERR_PTR(ret);
 }
 
-long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
     bool_t copyback = 0;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c9912122d1e5..a5ee8b8ebf76 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1189,7 +1189,7 @@ static int evtchn_set_priority(const struct evtchn_set_priority *set_priority)
     return ret;
 }
 
-long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 925ed7d6bee2..153332b7bfbe 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3558,7 +3558,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
     return 0;
 }
 
-long
+long cf_check
 do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index e71f7df47958..1526bcc52810 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -671,9 +671,9 @@ static int hypfs_write(struct hypfs_entry *entry,
     return entry->funcs->write(l, uaddr, ulen);
 }
 
-long do_hypfs_op(unsigned int cmd,
-                 XEN_GUEST_HANDLE_PARAM(const_char) arg1, unsigned long arg2,
-                 XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long arg4)
+long cf_check do_hypfs_op(
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(const_char) arg1,
+    unsigned long arg2, XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long arg4)
 {
     int ret;
     struct hypfs_entry *entry;
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e119e5401f9d..752c2e0dae44 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -451,7 +451,7 @@ static int __init param_init(void)
 __initcall(param_init);
 #endif
 
-# define DO(fn) long do_##fn
+# define DO(fn) long cf_check do_##fn
 
 #endif
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index c63db618a707..8471590aeea2 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1265,13 +1265,13 @@ static int do_kexec_op_internal(unsigned long op,
     return ret;
 }
 
-long do_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+long cf_check do_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 0);
 }
 
 #ifdef CONFIG_COMPAT
-int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+int cf_check compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 1);
 }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 0d7c413df820..38732dde6fd7 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1367,7 +1367,7 @@ static int acquire_resource(
     return rc;
 }
 
-long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d, *curr_d = current->domain;
     long rc;
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 794638392b40..e48f46dbe011 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -32,7 +32,7 @@ static void trace_multicall_call(multicall_entry_t *call)
     __trace_multicall_call(call);
 }
 
-ret_t
+ret_t cf_check
 do_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, uint32_t nr_calls)
 {
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index 040b4caca2c4..66ba0fe88f2e 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -39,7 +39,7 @@ static int compat_poll(struct compat_sched_poll *compat)
 
 #include "core.c"
 
-int compat_set_timer_op(u32 lo, s32 hi)
+int cf_check compat_set_timer_op(u32 lo, s32 hi)
 {
     return do_set_timer_op(((s64)hi << 32) | lo);
 }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d1c..0f527024ba2e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1862,7 +1862,7 @@ typedef long ret_t;
 
 #endif /* !COMPAT */
 
-ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t cf_check do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     ret_t ret = 0;
 
@@ -1999,7 +1999,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifndef COMPAT
 
 /* Per-vcpu oneshot-timer hypercall. */
-long do_set_timer_op(s_time_t timeout)
+long cf_check do_set_timer_op(s_time_t timeout)
 {
     struct vcpu *v = current;
     s_time_t offset = timeout - NOW();
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 1ad3c29351db..fc4a0b31d6f0 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -29,7 +29,7 @@
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
 
-long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     long ret = 0;
     int copyback = -1;
diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
index 1926a92fe481..af617f1d0b83 100644
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -721,7 +721,7 @@ static int xenoprof_op_get_buffer(XEN_GUEST_HANDLE_PARAM(void) arg)
                       || (op == XENOPROF_disable_virq)  \
                       || (op == XENOPROF_get_buffer))
  
-ret_t do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t cf_check do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int ret = 0;
     
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7d0a603d0311..a043e9521afd 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -675,8 +675,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     return 0;
 }
 
-long do_console_io(unsigned int cmd, unsigned int count,
-                   XEN_GUEST_HANDLE_PARAM(char) buffer)
+long cf_check do_console_io(
+    unsigned int cmd, unsigned int count, XEN_GUEST_HANDLE_PARAM(char) buffer)
 {
     long rc;
     unsigned int idx, len;
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 07b10ec2303b..4dfd64cf716c 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -18,12 +18,12 @@
 #include <asm/hypercall.h>
 #include <xsm/xsm.h>
 
-extern long
+extern long cf_check
 do_sched_op(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_domctl(
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
@@ -32,7 +32,7 @@ arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
-extern long
+extern long cf_check
 do_sysctl(
     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
 
@@ -41,7 +41,7 @@ arch_do_sysctl(
     struct xen_sysctl *sysctl,
     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
 
-extern long
+extern long cf_check
 do_platform_op(
     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
 
@@ -62,47 +62,47 @@ pci_physdev_op(
 #define MEMOP_EXTENT_SHIFT 6 /* cmd[:6] == start_extent */
 #define MEMOP_CMD_MASK     ((1 << MEMOP_EXTENT_SHIFT) - 1)
 
-extern long
+extern long cf_check
 do_memory_op(
     unsigned long cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list,
     unsigned int nr_calls);
 
-extern long
+extern long cf_check
 do_set_timer_op(
     s_time_t timeout);
 
-extern long
+extern long cf_check
 do_event_channel_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_xen_version(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_console_io(
     unsigned int cmd,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(char) buffer);
 
-extern long
+extern long cf_check
 do_grant_table_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) uop,
     unsigned int count);
 
-extern long
+extern long cf_check
 do_vm_assist(
     unsigned int cmd,
     unsigned int type);
 
-extern long
+extern long cf_check
 do_vcpu_op(
     int cmd,
     unsigned int vcpuid,
@@ -114,27 +114,27 @@ arch_do_vcpu_op(int cmd,
     struct vcpu *v,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_nmi_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_hvm_op(
     unsigned long op,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_kexec_op(
     unsigned long op,
     XEN_GUEST_HANDLE_PARAM(void) uarg);
 
-extern long
+extern long cf_check
 do_xsm_op(
     XEN_GUEST_HANDLE_PARAM(void) u_xsm_op);
 
 #ifdef CONFIG_ARGO
-extern long do_argo_op(
+extern long cf_check do_argo_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg1,
     XEN_GUEST_HANDLE_PARAM(void) arg2,
@@ -142,20 +142,20 @@ extern long do_argo_op(
     unsigned long arg4);
 #endif
 
-extern long
+extern long cf_check
 do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
+extern long cf_check
 do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
 
-extern long
+extern long cf_check
 do_dm_op(
     domid_t domid,
     unsigned int nr_bufs,
     XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
 
 #ifdef CONFIG_HYPFS
-extern long
+extern long cf_check
 do_hypfs_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(const_char) arg1,
@@ -166,53 +166,54 @@ do_hypfs_op(
 
 #ifdef CONFIG_COMPAT
 
-extern int
+extern int cf_check
 compat_memory_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int
+extern int cf_check
 compat_grant_table_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) uop,
     unsigned int count);
 
-extern int
+extern int cf_check
 compat_vcpu_op(
     int cmd,
     unsigned int vcpuid,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int
+extern int cf_check
 compat_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int
+extern int cf_check
 compat_xen_version(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int
+extern int cf_check
 compat_sched_op(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int
+extern int cf_check
 compat_set_timer_op(
     u32 lo,
     s32 hi);
 
-extern int compat_xsm_op(
+extern int cf_check compat_xsm_op(
     XEN_GUEST_HANDLE_PARAM(void) op);
 
-extern int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
+extern int cf_check compat_kexec_op(
+    unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
 
 DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
-extern int compat_multicall(
+extern int cf_check compat_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
     uint32_t nr_calls);
 
 #ifdef CONFIG_ARGO
-extern long compat_argo_op(
+extern long cf_check compat_argo_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg1,
     XEN_GUEST_HANDLE_PARAM(void) arg2,
@@ -220,7 +221,7 @@ extern long compat_argo_op(
     unsigned long arg4);
 #endif
 
-extern int
+extern int cf_check
 compat_dm_op(
     domid_t domid,
     unsigned int nr_bufs,
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 14d98f1f725f..5fc3a5f75478 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -219,13 +219,13 @@ bool __init has_xsm_magic(paddr_t start)
 
 #endif
 
-long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+long cf_check do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
-int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+int cf_check compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_compat_op(op);
 }
-- 
2.11.0


