Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9745EDFD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232668.403468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRU-00029X-TO; Fri, 26 Nov 2021 12:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232668.403468; Fri, 26 Nov 2021 12:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRU-00024E-N1; Fri, 26 Nov 2021 12:35:04 +0000
Received: by outflank-mailman (input) for mailman id 232668;
 Fri, 26 Nov 2021 12:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRS-0001V1-I3
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44a49d7c-4eb5-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 13:35:00 +0100 (CET)
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
X-Inumbo-ID: 44a49d7c-4eb5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qgn5PSV9toabG8yFC4pdYZE+HLsve0cHhkGJ4oxeMt0=;
  b=IyTI4mm882ye1Afo+OJGCfAUevffp5219E0e0qDxNlymhdDJ800J6UYC
   u/syTskDOYKM18gYTkVx/i6rRWV+1WQrELsncK5kE79IJZ/ZkoR1+SOUl
   0gUo2kJ9X3C5L7y/VwIET9Gw8P0Wkmi7zi6VNTsmnvYDSerFglDQ3Q7ub
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C44HcGRNmC3vEaJB0gXgj+JIfu8isG7iXQMgaBHAr5McDWPs2uK9Zjhv6HW4D6Xxs2DvHCrx26
 o5NCuGfeUdqNfIEHGKSwTSogj1WjVzWyJbDEHCzcOgv7rqdj82464aVDo2PwygKNQftGTnQPlY
 uRwJClZgIpmlIvVsbkDNaGKxgRKp+yE9WS75ffQAVEh8//2njLBni8HUAvWLdyhrubcgtOBSQX
 VihxjB6YVy9HNYrK8lv7w62VNjU8eLe1S0vkMUVEdyHGeE3P9cGyP23kDZ9BXHy5UkG2Eo8d0n
 Ua0CZDoL/bfD1WFaYpE+SJSe
X-SBRS: 5.1
X-MesageID: 58192117
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yDR/m6nTW3io9q271Y3/6CDo5gx0IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWmuPbqyIZ2GgKtskOti+phwBsMLWmoAyHgBlpCE0RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ohg766STCAxApLRxPQ5DUFbMREvOLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaHN
 pBAMGUHgBLoXCdLY0hULq8Fte7ygXryeT5DlQmfqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7HxUbOdq32TeDtHW2iYfnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9dF/HxJWRiiuOBjVJPUtcPSwmfVoA/Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlohPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03QEH83oJrW3FF5ufkWZ4u2oWyKBBaJtsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QVPcgvKVDWoH8yPiZ8OlwBdmB3ysnT3
 r/BLK6R4YsyU/w7nFJauc9BuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSHoOY7cAFRRVBmVM+eliCiXrPaSuaQMDp6UKG5LHJIU9ENopm5Yc+Up
 CzgAREBlwKk7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZj5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:wFxig6ucoXZIyqTuQjaiR0H47skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58192117"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/65] xen: Annotate fnptr targets from continue_hypercall_on_cpu()
Date: Fri, 26 Nov 2021 12:33:50 +0000
Message-ID: <20211126123446.32324-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/power.c         | 2 +-
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 xen/arch/x86/platform_hypercall.c | 4 ++--
 xen/arch/x86/pv/shim.c            | 4 ++--
 xen/arch/x86/smp.c                | 4 ++--
 xen/arch/x86/sysctl.c             | 2 +-
 xen/common/core_parking.c         | 2 +-
 xen/common/kexec.c                | 2 +-
 xen/common/sched/cpupool.c        | 2 +-
 xen/include/asm-x86/pv/shim.h     | 4 ++--
 xen/include/asm-x86/smp.h         | 6 +++---
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 0f2c87c096c7..90328bae1ebe 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -323,7 +323,7 @@ static int enter_state(u32 state)
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
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index f5457565a560..5e3208862c2f 100644
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
diff --git a/xen/include/asm-x86/pv/shim.h b/xen/include/asm-x86/pv/shim.h
index 6415f8068e5c..be4ae4e60bb8 100644
--- a/xen/include/asm-x86/pv/shim.h
+++ b/xen/include/asm-x86/pv/shim.h
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
diff --git a/xen/include/asm-x86/smp.h b/xen/include/asm-x86/smp.h
index f7485f602efa..1747772d232e 100644
--- a/xen/include/asm-x86/smp.h
+++ b/xen/include/asm-x86/smp.h
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
 
-- 
2.11.0


