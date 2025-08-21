Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31567B2FE44
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088821.1446585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Av-00078q-UV; Thu, 21 Aug 2025 15:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088821.1446585; Thu, 21 Aug 2025 15:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Av-0006yV-MF; Thu, 21 Aug 2025 15:26:01 +0000
Received: by outflank-mailman (input) for mailman id 1088821;
 Thu, 21 Aug 2025 15:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKuh=3B=bounce.vates.tech=bounce-md_30504962.68a73a84.v1-a995d3371d0e467594b68952f829b548@srs-se1.protection.inumbo.net>)
 id 1up7At-0005nU-Q7
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:26:00 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23730422-7ea3-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:25:58 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bS5vfQzBsVD7L
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a995d3371d0e467594b68952f829b548; Thu, 21 Aug 2025 15:25:56 +0000
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
X-Inumbo-ID: 23730422-7ea3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789956; x=1756059956;
	bh=NmIuO1pdpbmW3k7cBEiWCdpAQ2G3SKKK5JzTVol4PfM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hefq1bT3PwkO2n1bV6dWVWcWp0BSnpsmV09jCqOOKrDIbrz96OGjcKPQtpZ5xehZp
	 KD6Dal0mWLu2ZYl4jOdgMEzkLKvodaCjcsMUmEaviXrqOqJnPBprwD4f7eWIsW1IGU
	 irz+0+U3iKwyEkyhBGBrdB7wBp9Kia3fAQ6DUWyJyQ3uj7jifkU9xNkkW657Pfi9ou
	 9zH9/rj4NgPHF0SYdeEjba/v1mr1mxUx+1MU8QQvBvf1qmMYq1S9TQAq+ikYtWajGR
	 hdY01G846+Cgtc3hOrmxIaqtyTjt+lBCMzHXxth9UAdGRXci0v+c8efoiMcGFK4iwW
	 VsUGrrTuBuBbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789956; x=1756050456; i=teddy.astie@vates.tech;
	bh=NmIuO1pdpbmW3k7cBEiWCdpAQ2G3SKKK5JzTVol4PfM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eTE+uSD1oaYojVAl2HYVExe5iaYtwTw0MKMvtrrQ986jgBxuAylwEOaQwVzxwWHV/
	 q1MyAR2OLxTbne6nbB0dlyQ+oBucKDt1qbyH0+kbrFHwHJFWHFkZERtnjDsYNlfjks
	 vEdz8jD0ZcxD5446S2bzqgIWIzwY2zmvwN7POpACFCMqZ9cz9+b6CLCrjDTYyZEAU5
	 eNQi+ab0vkX5zilGG+Z0KxGMvIeSzuLgZp8jpTdmUP6T9fIsEUGLcPgctLznADJbno
	 dPXaZqW/ihoCHxsgHRTS4aVlbjNh+JiALCUGoG0Yuz8vgZX5rE7OHZ4+yw79bYMGRN
	 Vw+9aMaxjs/eQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=207/9]=20x86/hvm:=20Introduce=20FastABI=20implementation?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789955039
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-Id: <9da7d600c7cb6c4334f3e01b7724ad106930bc6e.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a995d3371d0e467594b68952f829b548?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Implement FastABI basing on docs/guest-guide/x86/fastabi.pandoc and defined ABI.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpuid.c               |   3 +
 xen/arch/x86/domain.c              |  71 ++++++++++
 xen/arch/x86/hvm/hvm.c             |  81 +++++++++++-
 xen/arch/x86/hvm/hypercall.c       |  22 ++++
 xen/arch/x86/include/asm/fastabi.h |  17 +++
 xen/common/Kconfig                 |   6 +
 xen/common/Makefile                |   1 +
 xen/common/domain.c                | 179 ++++++++++++++++++++++++++
 xen/common/event_channel.c         | 199 +++++++++++++++++++++++++++++
 xen/common/fastabi.c               |  49 +++++++
 xen/common/grant_table.c           |  44 +++++++
 xen/common/kernel.c                |  33 +++++
 xen/common/memory.c                | 110 ++++++++++++++++
 xen/common/sched/core.c            | 109 +++++++++++++++-
 xen/include/public/event_channel.h |   7 +
 xen/include/public/fastabi.h       |  20 +++
 xen/include/xen/fastabi.h          |  21 +++
 17 files changed, 970 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/fastabi.h
 create mode 100644 xen/common/fastabi.c
 create mode 100644 xen/include/public/fastabi.h
 create mode 100644 xen/include/xen/fastabi.h

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8dc68945f7..b1f90c1d91 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -153,6 +153,9 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          */
         res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
 
+        if ( IS_ENABLED(CONFIG_FASTABI) && is_hvm_vcpu(v) )
+            res->a |= XEN_HVM_CPUID_FASTABI;
+
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..44416869a3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -71,6 +71,10 @@
 #include <public/sysctl.h>
 #include <public/hvm/hvm_vcpu.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_COMPAT
 #include <compat/vcpu.h>
 #endif
@@ -1695,6 +1699,73 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+void do_vcpu_fast_op(struct cpu_user_regs *regs)
+{
+    long rc = 0;
+    struct domain *d = current->domain;
+    struct vcpu *v;
+
+    unsigned long cmd = fastabi_value_n(regs, 1);
+    unsigned long vcpuid = fastabi_value_n(regs, 2);
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+    {
+        fastabi_value_n(regs, 0) = -ENOENT;
+        return;
+    }
+
+    switch ( cmd )
+    {
+    case VCPUOP_send_nmi:
+        if ( !test_and_set_bool(v->arch.nmi_pending) )
+            vcpu_kick(v);
+        break;
+
+
+    case VCPUOP_register_vcpu_time_phys_area:
+    {
+        struct vcpu_register_time_memory_area area = {
+            .addr.p = fastabi_value_n(regs, 3)
+        };
+
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_vcpu_time_phys_area setting */ )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(vcpu_time_info_t),
+                            &v->arch.time_guest_area,
+                            time_area_populate);
+        break;
+    }
+
+    case VCPUOP_get_physid:
+    {
+        rc = -EINVAL;
+        if ( !is_hwdom_pinned_vcpu(v) )
+            break;
+
+        fastabi_value_n(regs, 3) =
+            (uint64_t)x86_cpu_to_apicid[v->vcpu_id] |
+            ((uint64_t)acpi_get_processor_id(v->vcpu_id) << 32);
+
+        rc = 0;
+        break;
+    }
+
+    default:
+        rc = common_vcpu_fast_op(regs, cmd, v);
+        break;
+    }
+
+    if ( rc == -ERESTART )
+        fastabi_make_continuation();
+    else
+        fastabi_value_n(regs, 0) = rc;
+}
+#endif
+
 /*
  * Notes on PV segment handling:
  *  - 32bit: All data from the GDT/LDT.
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8bf59c63fe..eca052e109 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -68,6 +68,10 @@
 
 #include <compat/hvm/hvm_op.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 bool __read_mostly hvm_enabled;
 
 #ifdef DBG_LEVEL_0
@@ -4548,7 +4552,7 @@ static int hvmop_get_param(struct xen_hvm_param *op)
 
     rc = -EINVAL;
     if ( is_hvm_domain(d) && !(rc = hvm_get_param(d, op->index, &op->value)) )
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u = %"PRIx64, a.index, a.value);
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u = %"PRIx64, op->index, op->value);
 
     rcu_unlock_domain(d);
     return rc;
@@ -5224,6 +5228,81 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+void do_hvm_fast_op(struct cpu_user_regs *regs)
+{
+    long rc = 0;
+    unsigned long op = fastabi_value_n(regs, 1);
+
+    switch ( op )
+    {
+    case HVMOP_set_evtchn_upcall_vector:
+    {
+        struct xen_hvm_evtchn_upcall_vector op = {
+            .vcpu = fastabi_value_n(regs, 2),
+            .vector = fastabi_value_n(regs, 3),
+        };
+
+        rc = hvmop_set_evtchn_upcall_vector(op);
+        break;
+    }
+
+    case HVMOP_set_param:
+    {
+        struct xen_hvm_param op = {
+            .domid = fastabi_value_n(regs, 2),
+            .index = fastabi_value_n(regs, 3),
+            .value = fastabi_value_n(regs, 4),
+        };
+
+        rc = hvmop_set_param(op);
+        break;
+    }
+
+    case HVMOP_get_param:
+    {
+        struct xen_hvm_param op = {
+            .domid = fastabi_value_n(regs, 2),
+            .index = fastabi_value_n(regs, 3),
+        };
+
+        rc = hvmop_get_param(&op);
+        if ( !rc )
+            fastabi_value_n(regs, 4) = op.value;
+        break;
+    }
+
+    case HVMOP_flush_tlbs:
+        rc = hvmop_flush_tlb_all();
+        break;
+
+    case HVMOP_get_time:
+        fastabi_value_n(regs, 2) = NOW();
+        break;
+    
+    case HVMOP_get_mem_type:
+    {
+        struct xen_hvm_get_mem_type op = {
+            .domid = fastabi_value_n(regs, 2),
+            .pfn = fastabi_value_n(regs, 3),
+        };
+
+        rc = hvmop_get_mem_type(&op);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = op.mem_type;
+        break;
+    }
+
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = rc;
+}
+#endif
+
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6f8dfdff4a..3759a1aa58 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -19,6 +19,10 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
@@ -155,6 +159,24 @@ int hvm_hypercall(struct cpu_user_regs *regs)
 
     curr->hcall_preempted = false;
 
+    #ifdef CONFIG_FASTABI
+    if ( eax & 0x40000000U && is_hvm_domain(currd) && mode == X86_MODE_64BIT )
+    {
+        unsigned long index = eax & ~0x40000000U;
+        HVM_DBG_LOG(DBG_LEVEL_HCALL,
+                    "fasthcall%lu(%lx, %lx, %lx, %lx, %lx, %lx, %lx)",
+                    index, fastabi_value_n(regs, 1), fastabi_value_n(regs, 2),
+                    fastabi_value_n(regs, 3), fastabi_value_n(regs, 4),
+                    fastabi_value_n(regs, 5), fastabi_value_n(regs, 6),
+                    fastabi_value_n(regs, 7));
+
+        fastabi_dispatch(index, regs);
+
+        hvmemul_cache_restore(curr, token);
+        return HVM_HCALL_completed;
+    }
+    #endif
+
     if ( mode == 8 )
     {
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
diff --git a/xen/arch/x86/include/asm/fastabi.h b/xen/arch/x86/include/asm/fastabi.h
new file mode 100644
index 0000000000..914504c63d
--- /dev/null
+++ b/xen/arch/x86/include/asm/fastabi.h
@@ -0,0 +1,17 @@
+#ifndef XEN_ASM_FASTABI_H
+#define XEN_ASM_FASTABI_H
+
+#include <asm/current.h>
+
+#define fastabi_param_reg0 rax
+#define fastabi_param_reg1 rdi
+#define fastabi_param_reg2 rsi
+#define fastabi_param_reg3 r8
+#define fastabi_param_reg4 r9
+#define fastabi_param_reg5 r10
+#define fastabi_param_reg6 r11
+#define fastabi_param_reg7 r12
+
+#define fastabi_value_n(regs, n) (regs)->fastabi_param_reg##n
+
+#endif /* XEN_ASM_FASTABI_H */
\ No newline at end of file
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 65f07289dd..71bb4e4f2d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -636,4 +636,10 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+config FASTABI
+	depends on X86 && HVM
+	bool "Fast HVM ABI (unsupported)"
+	help
+		Add support for a alternative fast HVM ABI.
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..362e8f61d7 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -62,6 +62,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-$(CONFIG_XENOPROF) += xenoprof.o
 obj-y += xmalloc_tlsf.o
+obj-$(CONFIG_FASTABI) += fastabi.o
 
 obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..5a641403b9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -45,6 +45,10 @@
 #include <xen/trace.h>
 #include <asm/setup.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
@@ -2266,6 +2270,181 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+long common_vcpu_fast_op(struct cpu_user_regs *regs, int cmd, struct vcpu *v)
+{
+    long rc = 0;
+    struct domain *d = v->domain;
+    unsigned int vcpuid = v->vcpu_id;
+
+    switch ( cmd )
+    {
+    case VCPUOP_initialise:
+        rc = arch_initialise_vcpu(v, (XEN_GUEST_HANDLE(void)) { 
+            (void *)fastabi_value_n(regs, 2) });
+        break;
+
+    case VCPUOP_up:
+    {
+        bool wake = false;
+
+        domain_lock(d);
+        if ( !v->is_initialised )
+            rc = -EINVAL;
+        else
+            wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
+        domain_unlock(d);
+        if ( wake )
+            vcpu_wake(v);
+    }
+
+        break;
+
+    case VCPUOP_down:
+        for_each_vcpu ( d, v )
+            if ( !test_bit(_VPF_down, &v->pause_flags) )
+            {
+               rc = 1;
+               break;
+            }
+
+        if ( !rc ) /* Last vcpu going down? */
+        {
+            domain_shutdown(d, SHUTDOWN_poweroff);
+            break;
+        }
+
+        rc = 0;
+        v = d->vcpu[vcpuid];
+
+        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
+            vcpu_sleep_nosync(v);
+
+        break;
+
+    case VCPUOP_is_up:
+        rc = !(v->pause_flags & VPF_down);
+        break;
+
+    case VCPUOP_get_runstate_info:
+    {
+        struct vcpu_runstate_info runstate;
+        vcpu_runstate_get(v, &runstate);
+
+        fastabi_value_n(regs, 2) = runstate.state;
+        fastabi_value_n(regs, 3) = runstate.state_entry_time;
+        fastabi_value_n(regs, 4) = runstate.time[0];
+        fastabi_value_n(regs, 5) = runstate.time[1];
+        fastabi_value_n(regs, 6) = runstate.time[2];
+        fastabi_value_n(regs, 7) = runstate.time[3];
+        break;
+    }
+
+    case VCPUOP_set_periodic_timer:
+    {
+        uint64_t period_ns = fastabi_value_n(regs, 3);
+
+        if ( period_ns < MILLISECS(1) )
+            return -EINVAL;
+
+        if ( period_ns > STIME_DELTA_MAX )
+            return -EINVAL;
+
+        vcpu_set_periodic_timer(v, period_ns);
+
+        break;
+    }
+
+    case VCPUOP_stop_periodic_timer:
+        vcpu_set_periodic_timer(v, 0);
+        break;
+
+    case VCPUOP_set_singleshot_timer:
+    {
+        struct vcpu_set_singleshot_timer set = {
+            .timeout_abs_ns = fastabi_value_n(regs, 3),
+            .flags = fastabi_value_n(regs, 4),
+        };
+
+        if ( v != current )
+            return -EINVAL;
+
+        if ( set.timeout_abs_ns < NOW() )
+        {
+            /*
+             * Simplify the logic if the timeout has already expired and just
+             * inject the event.
+             */
+            stop_timer(&v->singleshot_timer);
+            send_timer_event(v);
+            break;
+        }
+
+        migrate_timer(&v->singleshot_timer, smp_processor_id());
+        set_timer(&v->singleshot_timer, set.timeout_abs_ns);
+
+        break;
+    }
+
+    case VCPUOP_stop_singleshot_timer:
+        if ( v != current )
+            return -EINVAL;
+
+        stop_timer(&v->singleshot_timer);
+
+        break;
+
+    case VCPUOP_register_vcpu_info:
+    {
+        struct vcpu_register_vcpu_info info = {
+            .mfn = fastabi_value_n(regs, 3),
+            .offset = fastabi_value_n(regs, 4)
+        };
+        paddr_t gaddr;
+
+        rc = -EINVAL;
+        gaddr = gfn_to_gaddr(_gfn(info.mfn)) + info.offset;
+        if ( !~gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) != info.mfn )
+            break;
+
+        /* Preliminary check only; see map_guest_area(). */
+        rc = -EBUSY;
+        if ( v->vcpu_info_area.pg )
+            break;
+
+        /* See the BUILD_BUG_ON() in vcpu_info_populate(). */
+        rc = map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        break;
+    }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct vcpu_register_runstate_memory_area area = {
+            .addr.p = fastabi_value_n(regs, 3)
+        };
+
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        break;
+    }
+
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    return rc;
+}
+#endif
+
 #ifdef arch_vm_assist_valid_mask
 long do_vm_assist(unsigned int cmd, unsigned int type)
 {
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c8c1bfa615..9c8bc0f354 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -34,6 +34,10 @@
 #include <public/event_channel.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_PV_SHIM
 #include <asm/guest.h>
 #endif
@@ -1507,6 +1511,201 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+void do_event_channel_fast_op(struct cpu_user_regs *regs)
+{
+    long rc;
+    uint64_t cmd = fastabi_value_n(regs, 1);
+
+    switch ( cmd )
+    {
+    case EVTCHNOP_alloc_unbound: {
+        struct evtchn_alloc_unbound alloc_unbound = {
+            .dom = fastabi_value_n(regs, 2),
+            .remote_dom = fastabi_value_n(regs, 3),
+            .port = 0,
+        };
+        rc = evtchn_alloc_unbound(&alloc_unbound, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = alloc_unbound.port;
+        break;
+    }
+
+    case EVTCHNOP_bind_interdomain: {
+        struct evtchn_bind_interdomain bind_interdomain = {
+            .remote_dom = fastabi_value_n(regs, 2),
+            .remote_port = fastabi_value_n(regs, 3),
+            .local_port = 0,
+        };
+        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = bind_interdomain.local_port;
+        break;
+    }
+
+    case EVTCHNOP_bind_virq: {
+        struct evtchn_bind_virq bind_virq = {
+            .virq = fastabi_value_n(regs, 2),
+            .vcpu = fastabi_value_n(regs, 3),
+            .port = 0,
+        };
+        rc = evtchn_bind_virq(&bind_virq, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = bind_virq.port;
+        break;
+    }
+
+    case EVTCHNOP_bind_ipi: {
+        struct evtchn_bind_ipi bind_ipi = {
+            .vcpu = fastabi_value_n(regs, 2),
+            .port = 0,
+        };
+        rc = evtchn_bind_ipi(&bind_ipi);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = bind_ipi.port;
+        break;
+    }
+
+    case EVTCHNOP_bind_pirq: {
+        struct evtchn_bind_pirq bind_pirq = {
+            .pirq = fastabi_value_n(regs, 2),
+            .flags = fastabi_value_n(regs, 3),
+        };
+        rc = evtchn_bind_pirq(&bind_pirq);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) = bind_pirq.port;
+        break;
+    }
+
+    case EVTCHNOP_close: {
+        struct evtchn_close close = { .port = fastabi_value_n(regs, 2) };
+        rc = evtchn_close(current->domain, close.port, 1);
+        break;
+    }
+
+    case EVTCHNOP_send: {
+        struct evtchn_send send = { .port = fastabi_value_n(regs, 2) };
+        rc = evtchn_send(current->domain, send.port);
+        break;
+    }
+
+    case EVTCHNOP_status: {
+        struct evtchn_status status = {
+            .dom = fastabi_value_n(regs, 2),
+            .port = fastabi_value_n(regs, 3),
+        };
+        rc = evtchn_status(&status);
+
+        if ( !rc )
+        {
+            fastabi_value_n(regs, 4) = status.status;
+            fastabi_value_n(regs, 5) = status.vcpu;
+
+            switch (status.status)
+            {
+            case EVTCHNSTAT_unbound:
+                fastabi_value_n(regs, 6) = status.u.unbound.dom;
+                break;
+            case EVTCHNSTAT_interdomain:
+                fastabi_value_n(regs, 6) = status.u.interdomain.dom;
+                fastabi_value_n(regs, 7) = status.u.interdomain.port;
+                break;
+            case EVTCHNSTAT_pirq:
+                fastabi_value_n(regs, 6) = status.u.pirq;
+                break;
+            case EVTCHNSTAT_virq:
+                fastabi_value_n(regs, 6) = status.u.virq;
+                break;
+            default:
+                break;
+            }
+        }
+        break;
+    }
+
+    case EVTCHNOP_bind_vcpu: {
+        struct evtchn_bind_vcpu bind_vcpu = {
+            .vcpu = fastabi_value_n(regs, 2),
+            .port = fastabi_value_n(regs, 3)
+        };
+        rc = evtchn_bind_vcpu(bind_vcpu.port, bind_vcpu.vcpu);
+        break;
+    }
+
+    case EVTCHNOP_unmask: {
+        struct evtchn_unmask unmask = { .port = fastabi_value_n(regs, 2) };
+        rc = evtchn_unmask(unmask.port);
+        break;
+    }
+
+    case EVTCHNOP_reset:
+    case EVTCHNOP_reset_cont: {
+        struct evtchn_reset reset = { .dom = fastabi_value_n(regs, 2) };
+        struct domain *d;
+
+        d = rcu_lock_domain_by_any_id(reset.dom);
+        if ( d == NULL )
+        {
+            rc = -ESRCH;
+            break;
+        }
+
+        rc = xsm_evtchn_reset(XSM_TARGET, current->domain, d);
+        if ( !rc )
+            rc = evtchn_reset(d, cmd == EVTCHNOP_reset_cont);
+
+        rcu_unlock_domain(d);
+
+        if ( rc == -ERESTART )
+        {
+            fastabi_value_n(regs, 1) = EVTCHNOP_reset_cont;
+            fastabi_make_continuation();
+            return;
+        }
+        break;
+    }
+
+    case EVTCHNOP_init_control: {
+        struct evtchn_init_control init_control = {
+            .control_gfn = fastabi_value_n(regs, 2),
+            .offset = fastabi_value_n(regs, 3),
+            .vcpu = fastabi_value_n(regs, 4)
+        };
+        rc = evtchn_fifo_init_control(&init_control);
+
+        if ( !rc )
+            fastabi_value_n(regs, 5) = init_control.link_bits;
+        break;
+    }
+
+    case EVTCHNOP_expand_array: {
+        struct evtchn_expand_array expand_array = { .array_gfn = fastabi_value_n(regs, 2) };
+        rc = evtchn_fifo_expand_array(&expand_array);
+        break;
+    }
+
+    case EVTCHNOP_set_priority: {
+        struct evtchn_set_priority set_priority = {
+            .port = fastabi_value_n(regs, 2),
+            .priority = fastabi_value_n(regs, 3),
+        };
+        rc = evtchn_set_priority(&set_priority);
+        break;
+    }
+
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = rc;
+}
+#endif
 
 int alloc_unbound_xen_event_channel(
     struct domain *ld, unsigned int lvcpu, domid_t remote_domid,
diff --git a/xen/common/fastabi.c b/xen/common/fastabi.c
new file mode 100644
index 0000000000..96a3b05ee7
--- /dev/null
+++ b/xen/common/fastabi.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/fastabi.h>
+#include <xen/sched.h>
+
+#include <public/xen.h>
+
+void fastabi_make_continuation(void)
+{
+    current->hcall_preempted = true;
+}
+
+void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs)
+{
+    switch (index) {
+    case __HYPERVISOR_memory_op:
+        do_memory_fast_op(regs);
+        break;
+
+    case __HYPERVISOR_xen_version:
+        do_xen_version_fast_op(regs);
+        break;
+    
+    case __HYPERVISOR_grant_table_op:
+        do_grant_table_fast_op(regs);
+        break;
+
+    case __HYPERVISOR_vcpu_op:
+        do_vcpu_fast_op(regs);
+        break;
+
+    case __HYPERVISOR_sched_op:
+        do_sched_fast_op(regs);
+        break;
+
+    case __HYPERVISOR_event_channel_op:
+        do_event_channel_fast_op(regs);
+        break;
+
+    case __HYPERVISOR_hvm_op:
+        do_hvm_fast_op(regs);
+        break;
+
+    default:
+        fastabi_value_n(regs, 0) = -ENOSYS;
+        break;
+    }
+}
\ No newline at end of file
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 3c3bbca2fc..1476e5e5ca 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -45,6 +45,10 @@
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_PV_SHIM
 #include <asm/guest.h>
 #endif
@@ -3826,6 +3830,46 @@ long do_grant_table_op(
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+void do_grant_table_fast_op(struct cpu_user_regs *regs)
+{
+    long rc = 0;
+    unsigned int cmd = fastabi_value_n(regs, 1);
+
+    switch (cmd)
+    {
+    case GNTTABOP_query_size:
+    {
+        struct grant_table *gt = current->domain->grant_table;
+
+        grant_read_lock(gt);
+        fastabi_value_n(regs, 2) = nr_grant_frames(gt);
+        fastabi_value_n(regs, 3) = gt->max_grant_frames;
+        grant_read_unlock(gt);
+        break;
+    }
+    case GNTTABOP_get_version:
+    {
+        struct grant_table *gt = current->domain->grant_table;
+
+        fastabi_value_n(regs, 2) = gt->gt_version;
+        break;
+    }
+    case GNTTABOP_set_version:
+    {
+        gnttab_set_version_t op = { .version = fastabi_value_n(regs, 2) };
+        rc = gnttab_set_version(&op);
+        break;
+    }
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = rc;
+}
+#endif
+
 #ifdef CONFIG_COMPAT
 #include "compat/grant_table.c"
 #endif
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index eff6db6c8f..2230ccdcaf 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -18,6 +18,10 @@
 #include <asm/current.h>
 #include <public/version.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_COMPAT
 #include <compat/version.h>
 
@@ -772,6 +776,35 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return -ENOSYS;
 }
 
+#ifdef CONFIG_FASTABI
+void do_xen_version_fast_op(struct cpu_user_regs *regs)
+{
+    long cmd = fastabi_value_n(regs, 1);
+    long rc = 0;
+
+    switch ( cmd ) {
+    case XENVER_version:
+        rc = (xen_major_version() << 16) | xen_minor_version();
+        break;
+    case XENVER_get_features:
+    {
+        uint32_t submap = 0, submap_idx = fastabi_value_n(regs, 2);
+
+        rc = xenver_get_features(current->domain, submap_idx, &submap);
+
+        if ( !rc )
+            fastabi_value_n(regs, 3) = submap;
+        break;
+    }
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = rc;
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd50..689218390e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -35,6 +35,10 @@
 #include <public/memory.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
@@ -1864,6 +1868,112 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_FASTABI
+void do_memory_fast_op(struct cpu_user_regs *regs)
+{
+    unsigned long cmd = fastabi_value_n(regs, 1);
+    unsigned long start_extent = cmd >> MEMOP_EXTENT_SHIFT;
+    long rc;
+    int op = cmd & MEMOP_CMD_MASK;
+
+    switch ( op ) {
+    case XENMEM_add_to_physmap:
+    {
+        struct xen_add_to_physmap xatp = {
+            .size = fastabi_value_n(regs, 2),
+            .space = fastabi_value_n(regs, 3),
+            .idx = fastabi_value_n(regs, 4),
+            .gpfn = fastabi_value_n(regs, 5)
+        };
+
+        BUILD_BUG_ON((typeof(xatp.size))-1 > (UINT_MAX >> MEMOP_EXTENT_SHIFT));
+
+        /* Check for malicious or buggy input. */
+        if ( start_extent != (typeof(xatp.size))start_extent )
+        {
+            rc = -EDOM;
+            break;
+        }
+
+        /* Foreign mapping is only possible via add_to_physmap_batch. */
+        if ( xatp.space == XENMAPSPACE_gmfn_foreign )
+        {
+            rc = -ENOSYS;
+            break;
+        }
+
+        rc = xatp_permission_check(current->domain, xatp.space);
+        if ( rc )
+            break;
+
+        rc = xenmem_add_to_physmap(current->domain, &xatp, start_extent);
+
+        if ( xatp.space == XENMAPSPACE_gmfn_range && rc > 0 )
+            panic("TODO");
+            //rc = hypercall_create_continuation(
+            //         __HYPERVISOR_memory_op, "lh",
+            //         op | (rc << MEMOP_EXTENT_SHIFT), arg);
+        break;
+    }
+    
+    case XENMEM_remove_from_physmap:
+    {
+        unsigned long gpfn = fastabi_value_n(regs, 5);
+        struct page_info *page;
+
+        if ( unlikely(start_extent) )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        if ( !paging_mode_translate(current->domain) )
+        {
+            rc = -EACCES;
+            break;
+        }
+
+        page = get_page_from_gfn(current->domain, gpfn, NULL, P2M_ALLOC);
+        if ( page )
+        {
+            rc = guest_physmap_remove_page(current->domain, _gfn(gpfn),
+                                           page_to_mfn(page), 0);
+            put_page(page);
+        }
+        else
+            rc = -ENOENT;
+
+        break;
+    }
+    
+    case XENMEM_memory_map:
+    {
+        struct domain *d = current->domain;
+        unsigned long nr_entries = fastabi_value_n(regs, 2);
+        paddr_t buffer_addr = fastabi_value_n(regs, 3);
+
+        spin_lock(&d->arch.e820_lock);
+
+        if ( nr_entries > d->arch.nr_e820 )
+            nr_entries = d->arch.nr_e820;
+
+        if ( hvm_copy_to_guest_phys(buffer_addr, d->arch.e820,
+                                    nr_entries * sizeof(struct e820entry), current) )
+            rc = -EFAULT;
+
+        spin_unlock(&d->arch.e820_lock);
+        break;
+    }
+
+    default:
+        rc = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = rc;
+}
+#endif
+
 void clear_domain_page(mfn_t mfn)
 {
     void *ptr = map_domain_page(mfn);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index b2c784c60e..51b2fbc00a 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -41,6 +41,10 @@
 
 #include "private.h"
 
+#ifdef CONFIG_FASTABI
+#include <xen/fastabi.h>
+#endif
+
 #ifdef CONFIG_XEN_GUEST
 #include <asm/guest.h>
 #else
@@ -1896,6 +1900,110 @@ void domain_update_node_aff(struct domain *d, struct affinity_masks *affinity)
 
 typedef long ret_t;
 
+#ifdef CONFIG_FASTABI
+void do_sched_fast_op(struct cpu_user_regs *regs)
+{
+    long ret = 0;
+    unsigned long cmd = fastabi_value_n(regs, 1);
+
+    switch ( cmd )
+    {
+    case SCHEDOP_yield:
+    {
+        ret = vcpu_yield();
+        break;
+    }
+
+    case SCHEDOP_block:
+    {
+        vcpu_block_enable_events();
+        break;
+    }
+
+    case SCHEDOP_shutdown:
+    {
+        struct sched_shutdown sched_shutdown = {
+            .reason = fastabi_value_n(regs, 2)
+        };
+
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
+                   current->vcpu_id, sched_shutdown.reason);
+        ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
+
+        break;
+    }
+
+    case SCHEDOP_shutdown_code:
+    {
+        struct sched_shutdown sched_shutdown = {
+            .reason = fastabi_value_n(regs, 2)
+        };
+        struct domain *d = current->domain;
+
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id,
+                   sched_shutdown.reason);
+
+        spin_lock(&d->shutdown_lock);
+        if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
+            d->shutdown_code = (u8)sched_shutdown.reason;
+        spin_unlock(&d->shutdown_lock);
+
+        ret = 0;
+        break;
+    }
+
+    case SCHEDOP_poll:
+    {
+        uint64_t timeout = fastabi_value_n(regs, 2);
+        evtchn_port_t port = fastabi_value_n(regs, 3);
+
+        ret = vcpu_poll(1, timeout, &port);
+
+        break;
+    }
+
+    case SCHEDOP_watchdog:
+    {
+        struct sched_watchdog sched_watchdog = {
+            .id = fastabi_value_n(regs, 2),
+            .timeout = fastabi_value_n(regs, 3)
+        };
+
+        ret = domain_watchdog(
+            current->domain, sched_watchdog.id, sched_watchdog.timeout);
+        break;
+    }
+
+    case SCHEDOP_pin_override:
+    {
+        struct sched_pin_override sched_pin_override = {
+            .pcpu = fastabi_value_n(regs, 2),
+        };
+        unsigned int cpu;
+
+        ret = -EPERM;
+        if ( !is_hardware_domain(current->domain) )
+            break;
+
+        ret = -EINVAL;
+        if ( sched_pin_override.pcpu >= NR_CPUS )
+           break;
+
+        cpu = sched_pin_override.pcpu < 0 ? NR_CPUS : sched_pin_override.pcpu;
+        ret = vcpu_temporary_affinity(current, cpu, VCPU_AFFINITY_OVERRIDE);
+
+        break;
+    }
+
+    default:
+        ret = -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) = ret;
+}
+#endif
+
 #endif /* !COMPAT */
 
 ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
@@ -1961,7 +2069,6 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             break;
 
         ret = do_poll(&sched_poll);
-
         break;
     }
 
diff --git a/xen/include/public/event_channel.h b/xen/include/public/event_channel.h
index c5548d206c..969c9ec264 100644
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -208,10 +208,17 @@ struct evtchn_status {
         } unbound;                 /* EVTCHNSTAT_unbound */
         struct {
             domid_t dom;
+            uint16_t _pad;
             evtchn_port_t port;
         } interdomain;             /* EVTCHNSTAT_interdomain */
         uint32_t pirq;             /* EVTCHNSTAT_pirq        */
         uint32_t virq;             /* EVTCHNSTAT_virq        */
+#ifndef __XEN__
+        struct {
+            uint32_t _output1;
+            uint32_t _output2;
+        };
+#endif
     } u;
 };
 typedef struct evtchn_status evtchn_status_t;
diff --git a/xen/include/public/fastabi.h b/xen/include/public/fastabi.h
new file mode 100644
index 0000000000..51f5085ce6
--- /dev/null
+++ b/xen/include/public/fastabi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __XEN_PUBLIC_FASTABI_H__
+#define __XEN_PUBLIC_FASTABI_H__
+
+#if defined(__x86_64__)
+#define __HYPERVISOR_FASTABI_MASK 0x40000000U
+
+enum xen_hypercall_vendor {
+    Intel,
+    Amd
+};
+#else
+#define __HYPERVISOR_FASTABI_MASK 0
+
+enum xen_hypercall_vendor {
+    Native
+};
+#endif
+
+#endif
diff --git a/xen/include/xen/fastabi.h b/xen/include/xen/fastabi.h
new file mode 100644
index 0000000000..83ede943e0
--- /dev/null
+++ b/xen/include/xen/fastabi.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_FASTABI_H
+#define XEN_FASTABI_H
+
+#include <asm/fastabi.h>
+
+void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs);
+void fastabi_make_continuation(void);
+
+void do_event_channel_fast_op(struct cpu_user_regs *regs);
+
+long common_vcpu_fast_op(struct cpu_user_regs *regs, int cmd, struct vcpu *v);
+void do_vcpu_fast_op(struct cpu_user_regs *regs);
+void do_hvm_fast_op(struct cpu_user_regs *regs);
+void do_memory_fast_op(struct cpu_user_regs *regs);
+void do_grant_table_fast_op(struct cpu_user_regs *regs);
+void do_sched_fast_op(struct cpu_user_regs *regs);
+void do_xen_version_fast_op(struct cpu_user_regs *regs);
+
+#endif /* XEN_FASTABI_H */
\ No newline at end of file
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


