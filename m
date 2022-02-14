Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F34B5117
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271708.466344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3X-0007aB-OQ; Mon, 14 Feb 2022 13:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271708.466344; Mon, 14 Feb 2022 13:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3X-0007Qn-Cx; Mon, 14 Feb 2022 13:06:15 +0000
Received: by outflank-mailman (input) for mailman id 271708;
 Mon, 14 Feb 2022 13:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2i-00023t-OI
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c462146e-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:22 +0100 (CET)
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
X-Inumbo-ID: c462146e-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bD8JK36vRGqRDSWFxaOE44j5YN40/rHS1DgBIOAI8XY=;
  b=Qi4Thg3sNKZGSa5toglCZzq0PTNWdHsNuRUIdLRJfOA/Mf4lELxzRoEr
   dGCXYrLb3pG4IrYr3Jj1EkCkxLqOvwZ0GQt4EUS9o0eBF2vQ2+3Yuf56S
   zrY35QhcLk2LYneEAQKV6zkSNTb8+t6/lM0VVsJmVytJMdsR9NdeMbzvz
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JVOdZys/aqxeJl7kRZqeuoSs2gZSKPJXjw27kX5woK0QSW0axl6G1Z3vIYYvJwiJEBAyN1z1s7
 FcFvA8NkPiS0vbBuXYDuvBAuFyrJEkWgU+3/WMs1nUegjsCLrG8oKCH3wH5IgX1mT4NdtwM7YA
 MmciR7r702RXFzCvU5oiipJlD796xb+s1TYESeumuw35BQ5YHz6zWkcWYPTZAeCEBNwvnAz1Js
 kJujOxX9IlYiiWnjhuMZMgE1c3kHLMx2SJ5maSxgz6U0kGPTm7xmb3MmGSk8biovM5aagWW4rK
 g5hBfjI3SOzQi8a0VtQr+9yo
X-SBRS: 5.1
X-MesageID: 64149402
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JZd556CcLajG4RVW/zbkw5YqxClBgxIJ4kV8jS/XYbTApGhzhGAEx
 mZJC2GFa/7eNmDzfdAjbYXi/BsCu8DVmtUyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/khuYkf1uz
 8t0mcb3a0BzFfeLlbsvekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgG5s15wWR54yY
 eIBaiJBchbGXidAZGgXGI8dh+ODjXXwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+THWqr9SmjVCHd4gYC
 QtO0XBpoPcA3Rn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid3VqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYxJjOsb1WVMrX/MBofAnqNOv3j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb7lBj+F7nH1irY4RLLiipymaPXOlTCb9Yd843JGmN4jVNYuI/1fY9
 chxLcyPx0kNWeHyeHCPo4USMUoLPT4wApWv855bceuKIwxHHmA9CqCOneN9KtI9x6kFxP3V+
 nydW1NDzAatj3PwNgjXOGtob6niXMgjoCtjbzAsJ1uhx1MqfZ2rsPUEb5IycLR+rL5jwPd4Q
 uMrYcKFBvgTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK67JJsr
 aeh2wXXRYs4az5jVMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroI4rIvJiKSDo9v7GudyBBMHTWzS7LLwPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtouCatvwII/+8Dr9u1TwQlTFXnWa0imV+F7KX6c0MgT7qBAy9e1Y+dtt
 p5jLjWCBYi0BQ==
IronPort-HdrOrdr: A9a23:2yNHlqlU6HyoEtjAouvxbGok/2fpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149402"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 13/70] xen: CFI hardening for continue_hypercall_on_cpu()
Date: Mon, 14 Feb 2022 12:50:30 +0000
Message-ID: <20220214125127.17985-14-andrew.cooper3@citrix.com>
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
 xen/arch/x86/acpi/power.c          | 2 +-
 xen/arch/x86/cpu/microcode/core.c  | 2 +-
 xen/arch/x86/include/asm/pv/shim.h | 4 ++--
 xen/arch/x86/include/asm/smp.h     | 6 +++---
 xen/arch/x86/platform_hypercall.c  | 4 ++--
 xen/arch/x86/pv/shim.c             | 4 ++--
 xen/arch/x86/smp.c                 | 4 ++--
 xen/arch/x86/sysctl.c              | 2 +-
 xen/common/core_parking.c          | 2 +-
 xen/common/kexec.c                 | 2 +-
 xen/common/sched/cpupool.c         | 2 +-
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 912d4c4d62f4..c4e7e8698920 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -326,7 +326,7 @@ static int enter_state(u32 state)
     return error;
 }
 
-static long enter_state_helper(void *data)
+static long cf_check enter_state_helper(void *data)
 {
     struct acpi_sleep_info *sinfo = (struct acpi_sleep_info *)data;
     return enter_state(sinfo->sleep_state);
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 46f55fe7f191..9631042190ab 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -558,7 +558,7 @@ struct ucode_buf {
     char buffer[];
 };
 
-static long microcode_update_helper(void *data)
+static long cf_check microcode_update_helper(void *data)
 {
     int ret;
     struct ucode_buf *buffer = data;
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 6415f8068e5c..be4ae4e60bb8 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -38,8 +38,8 @@ void pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
                        start_info_t *si);
 int pv_shim_shutdown(uint8_t reason);
 void pv_shim_inject_evtchn(unsigned int port);
-long pv_shim_cpu_up(void *data);
-long pv_shim_cpu_down(void *data);
+long cf_check pv_shim_cpu_up(void *data);
+long cf_check pv_shim_cpu_down(void *data);
 void pv_shim_online_memory(unsigned int nr, unsigned int order);
 void pv_shim_offline_memory(unsigned int nr, unsigned int order);
 domid_t get_initial_domain_id(void);
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index f7485f602efa..1747772d232e 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -57,10 +57,10 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
 
 void __stop_this_cpu(void);
 
-long cpu_up_helper(void *data);
-long cpu_down_helper(void *data);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
 
-long core_parking_helper(void *data);
+long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 84566bbfaa3d..f5d7adc1e802 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -45,7 +45,7 @@ struct resource_access {
     xenpf_resource_entry_t *entries;
 };
 
-long cpu_frequency_change_helper(void *);
+long cf_check cpu_frequency_change_helper(void *);
 void check_resource_access(struct resource_access *);
 void resource_access(void *);
 
@@ -59,7 +59,7 @@ DEFINE_SPINLOCK(xenpf_lock);
 # undef guest_from_compat_handle
 # define guest_from_compat_handle(x,y) ((x)=(y))
 
-long cpu_frequency_change_helper(void *data)
+long cf_check cpu_frequency_change_helper(void *data)
 {
     return cpu_frequency_change((uint64_t)data);
 }
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ae4d8913faa1..2ee290a3920d 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -845,7 +845,7 @@ int cf_check compat_grant_table_op(
 #endif
 #endif
 
-long pv_shim_cpu_up(void *data)
+long cf_check pv_shim_cpu_up(void *data)
 {
     struct vcpu *v = data;
     struct domain *d = v->domain;
@@ -883,7 +883,7 @@ long pv_shim_cpu_up(void *data)
     return 0;
 }
 
-long pv_shim_cpu_down(void *data)
+long cf_check pv_shim_cpu_down(void *data)
 {
     struct vcpu *v = data;
     long rc;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index eef0f9c6cbf4..f4952a6bf9a5 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -399,7 +399,7 @@ void call_function_interrupt(struct cpu_user_regs *regs)
     smp_call_function_interrupt();
 }
 
-long cpu_up_helper(void *data)
+long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu = (unsigned long)data;
     int ret = cpu_up(cpu);
@@ -422,7 +422,7 @@ long cpu_up_helper(void *data)
     return ret;
 }
 
-long cpu_down_helper(void *data)
+long cf_check cpu_down_helper(void *data)
 {
     int cpu = (unsigned long)data;
     int ret = cpu_down(cpu);
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f373..1772f51f8f6e 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -79,7 +79,7 @@ static void l3_cache_get(void *arg)
         l3_info->size = info.size / 1024; /* in KB unit */
 }
 
-static long smt_up_down_helper(void *data)
+static long cf_check smt_up_down_helper(void *data)
 {
     bool up = (bool)data;
     unsigned int cpu, sibling_mask = boot_cpu_data.x86_num_siblings - 1;
diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index 44a907abfd7f..4afad04f2f68 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -169,7 +169,7 @@ static unsigned int core_parking_power(unsigned int event)
     return cpu;
 }
 
-long core_parking_helper(void *data)
+long cf_check core_parking_helper(void *data)
 {
     uint32_t idle_nums = (unsigned long)data;
     unsigned int cpu;
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 3b223cd03d75..b222a5fd782e 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -395,7 +395,7 @@ void kexec_crash(enum crash_reason reason)
     BUG();
 }
 
-static long kexec_reboot(void *_image)
+static long cf_check kexec_reboot(void *_image)
 {
     struct kexec_image *image = _image;
 
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index e5cfb03b857e..b9d4babd0d8a 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -544,7 +544,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
-static long cpupool_unassign_cpu_helper(void *info)
+static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
     long ret;
-- 
2.11.0


