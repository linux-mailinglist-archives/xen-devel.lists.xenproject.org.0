Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001AA4BFC83
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276858.473221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4Y-0007Fr-0X; Tue, 22 Feb 2022 15:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276858.473221; Tue, 22 Feb 2022 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4X-00079y-GE; Tue, 22 Feb 2022 15:27:25 +0000
Received: by outflank-mailman (input) for mailman id 276858;
 Tue, 22 Feb 2022 15:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4V-0006OK-Eb
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed31e790-93f3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:27:22 +0100 (CET)
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
X-Inumbo-ID: ed31e790-93f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=7NU2F5oou3wTFQiiPS+nvCzwPrVqGrwa293dW8VmdiU=;
  b=BUr7H2GcEymCyhcxcz+3PODXhavp2cHwyCCN5W2o1cjYiuBWEFnKer+A
   2RbOG/lAKZKxhQqz7KjuCDf+ZgXHef+1bG5cwFFaLHETMka4Fo9KMcy5K
   i+Bz3BLIFSg7AGfbdd+Ejfh5kg9hFyzkF2K6wdPMdtF66rmUg47ppXEvB
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66981791
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UpBYq6q74B7Zeqn7/MZsGuoFWeJeBmJ8ZRIvgKrLsJaIsI4StFCzt
 garIBmOPqmMajSmKtxyaoWx805X78XUm9c1TQRv/3ozFnsW+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBAvfpsdoRdyZjGTwuEpBj+J6XE1+mrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMkWQOkIeYz/7Dro0ucuq1nvhWQFCg3aev4UvwzPazVF+he2F3N39JYXRGJQ9clyjj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZXbEa7nzJJTkdMDB3i/Kf/2hXWt89jx
 1I8xnALhJY+0HOQRMStcCCdoF/UjDkFRI8FewEl0z2lxq3R6gefI2ELSD9dddAr3PMLqSwWO
 kyhxI2wW2E22FGBYTfEr+rP82vuUcQABTJaPUc5oR05D84PSW3ZpjbGVZ5dHaG8lbUZ8hmgk
 mnR/EDSa1j+5PPnNplXH3ia21pARbCTF2bZAzk7uEr/tWuVg6b/OuSVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuarYbGON3AM1Q8B5n9hIx5JFVdoLiN2ZDB00WvvohBezO
 BOD0e+vzMU70ISWgV9fPNvqVpVCIVnIHtX5TPHEBueikbAqHDJrCBpGPBbKt0i0yRBEufhmZ
 f+zLJb9ZV5HWP8P5GfnGI8gPUoDm3lWKZX7HsugkXxKENO2ORaodFvyGAHQNrtgtPvc+m04M
 b93bqO39vmWa8WmCgG/zGLZBQtiwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:TF1Qn6kfkm7FaKieXPBbBf8n9knpDfIo3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE8Ar5N0tQ+uxoVJPufZqYz+8Q3WBzB8baYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IObuEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66981791"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 12/70] xen: CFI hardening for continue_hypercall_on_cpu()
Date: Tue, 22 Feb 2022 15:26:36 +0000
Message-ID: <20220222152645.8844-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
 * Fix !CONFIG_PV_SHIM build.  Annotate pv_shim_cpu_{up,down}() stubs.
---
 xen/arch/x86/acpi/power.c          | 2 +-
 xen/arch/x86/cpu/microcode/core.c  | 2 +-
 xen/arch/x86/include/asm/pv/shim.h | 8 ++++----
 xen/arch/x86/include/asm/smp.h     | 6 +++---
 xen/arch/x86/platform_hypercall.c  | 4 ++--
 xen/arch/x86/pv/shim.c             | 4 ++--
 xen/arch/x86/smp.c                 | 4 ++--
 xen/arch/x86/sysctl.c              | 2 +-
 xen/common/core_parking.c          | 2 +-
 xen/common/kexec.c                 | 2 +-
 xen/common/sched/cpupool.c         | 2 +-
 11 files changed, 19 insertions(+), 19 deletions(-)

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
index 6415f8068e5c..a43c3689b48a 100644
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
@@ -69,12 +69,12 @@ static inline void pv_shim_inject_evtchn(unsigned int port)
 {
     ASSERT_UNREACHABLE();
 }
-static inline long pv_shim_cpu_up(void *data)
+static inline long cf_check pv_shim_cpu_up(void *data)
 {
     ASSERT_UNREACHABLE();
     return 0;
 }
-static inline long pv_shim_cpu_down(void *data)
+static inline long cf_check pv_shim_cpu_down(void *data)
 {
     ASSERT_UNREACHABLE();
     return 0;
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


