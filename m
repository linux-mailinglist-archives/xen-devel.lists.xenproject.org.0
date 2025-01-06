Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127FA0310F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865908.1277226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJy-00042r-9q; Mon, 06 Jan 2025 20:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865908.1277226; Mon, 06 Jan 2025 20:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJy-0003yK-6P; Mon, 06 Jan 2025 20:03:30 +0000
Received: by outflank-mailman (input) for mailman id 865908;
 Mon, 06 Jan 2025 20:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtJw-0002s4-Va
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b78297d-cc69-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 21:03:28 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43618283d48so106994775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:28 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656af6cbbsm610646205e9.3.2025.01.06.12.03.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:26 -0800 (PST)
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
X-Inumbo-ID: 4b78297d-cc69-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193808; x=1736798608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfaBEiOdRjHzzwUS3kiFtedqZxggxEJ4hucj9YdleWw=;
        b=MIXQ1pKaADARQyYOVuz1GkgifJqEgVR4a03UIQuYi3Y88GMHUCxON0rTzcTyTKA7qc
         ekFXUoqq2XzCX79+rxFhq3PJEHqtgU476Vyn+Yx8bi833Oex+GIM0cr6wJXJxOgbuRKh
         VZaYAWO6hdQkGTOm7SUTZXKRH7IvHgUWUefNbvz2jRNJbHGUAuEVUOKhl5Q54H7llzSd
         4AP2FfRsPUGjB/S0pVWGsJLZul/CdWy4HVZawdps6SDnrhP9rmQYOhNFqmxWFHj3jNZh
         hd1njrEuygFdFat46h31mx2i1RCyMQumguSinYTrIz0ZOwcmOYevIJ1MygR7CsLKZP9m
         oEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193808; x=1736798608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfaBEiOdRjHzzwUS3kiFtedqZxggxEJ4hucj9YdleWw=;
        b=vHzCwfqJ0f6cE8Nqe4+0MP9bnrUTnyBVo32QwxvtKtDKSZnrRi3Wcgd4aYFB61NEx/
         Ct9wYEdhxoL/L1SICDnRQFVazsMhBf7Wb843JOFViRckZYhHi4SjsobGpoBwyqcFunyw
         JBfzaYVISulvx7rAJQpAj2CYCMcrttCNqqlqRSoUBSD39gPxq7FJvEBRvBjLKOLQunyD
         I3/ZGSCAUO5wkc04juBxMIoFO3NKmvDoAnoR8OMTR7fUVcOyhdzy+IhvL1rJVF7pa6tb
         dWbRNjZw4iSvJajMpy4Zn2Ass0h7Tfm8f5atKq9JB0lF2MdUdQ/bRhCvLakc4Kt7i/OK
         RJog==
X-Forwarded-Encrypted: i=1; AJvYcCUXoKfnmuo8udwCkm/b1/gC6QYZG+rVn8xtSxmRYRzH1dHe7/I987li7EJeMu3MJ/OVx9oONobew4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzOfB9xcCWVaaQuVYtJjRXfeEGJ2lFSIMQQDmbfj6q+90D7ucZ
	Epy0TdAc+EhLkq1GDf/7EpiSSl4RQC9Q7o/EEcOGI8QtMBHMzBVgahuedomkSVI=
X-Gm-Gg: ASbGncuVF/s9xaeLkHh70blFvtNIWcOrQTxnQjY6rQRg6ldckAn4zHgx2yUKlvXqtRk
	ngUhcf7kPeAS+1pNCOz3aXp6tXJ8TheKCL3tgOgZGlShGwy9Mp076mZ3LF/x7T5awITEJFZjY9V
	gUcCzoQ6PJX5BdO+vskTgGGCXb/nN/llctSlGIanQ6Hpl98VeH/dhHPvKoSMz5dieR1uES2O+ub
	jfkLS5WJ6VBdVSNraEBi8wQUDruyXNO3b8XQvfviJjYN7+HIcV3iMKXY/pZX7D0LDCW55rWZDc7
	qq9sd7YT/rwylPg0EiVolSshrkxtOyU=
X-Google-Smtp-Source: AGHT+IF3+buEkSMAzhBuTtka5TQV/I34nAgDx1rHh3g80/cDyG64W7K1EH4+aemix37pseTOETajew==
X-Received: by 2002:a05:600c:4f94:b0:434:f871:1b96 with SMTP id 5b1f17b1804b1-43668b7a1dfmr474821135e9.29.1736193807616;
        Mon, 06 Jan 2025 12:03:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 4/7] accel/tcg: Use CPU_FOREACH_TCG()
Date: Mon,  6 Jan 2025 21:02:55 +0100
Message-ID: <20250106200258.37008-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only iterate over TCG vCPUs when running TCG specific code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c           |  7 ++++---
 accel/tcg/monitor.c          |  3 ++-
 accel/tcg/tb-maint.c         |  7 ++++---
 accel/tcg/tcg-accel-ops-rr.c | 10 +++++-----
 accel/tcg/tcg-accel-ops.c    |  8 ++++----
 5 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b4ccf0cdcb7..06f34df808b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -48,6 +48,7 @@
 #endif
 #include "tcg/tcg-ldst.h"
 #include "tcg/oversized-guest.h"
+#include "tcg-accel-ops.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
@@ -368,7 +369,7 @@ static void flush_all_helper(CPUState *src, run_on_cpu_func fn,
 {
     CPUState *cpu;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         if (cpu != src) {
             async_run_on_cpu(cpu, fn, d);
         }
@@ -646,7 +647,7 @@ void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
         TLBFlushPageByMMUIdxData *d;
 
         /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
+        CPU_FOREACH_TCG(dst_cpu) {
             if (dst_cpu != src_cpu) {
                 d = g_new(TLBFlushPageByMMUIdxData, 1);
                 d->addr = addr;
@@ -839,7 +840,7 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     d.bits = bits;
 
     /* Allocate a separate data block for each destination cpu.  */
-    CPU_FOREACH(dst_cpu) {
+    CPU_FOREACH_TCG(dst_cpu) {
         if (dst_cpu != src_cpu) {
             p = g_memdup(&d, sizeof(d));
             async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index ae1dbeb79f8..98bd937ae20 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -19,6 +19,7 @@
 #include "tcg/tcg.h"
 #include "internal-common.h"
 #include "tb-context.h"
+#include "tcg-accel-ops.h"
 
 
 static void dump_drift_info(GString *buf)
@@ -131,7 +132,7 @@ static void tlb_flush_counts(size_t *pfull, size_t *ppart, size_t *pelide)
     CPUState *cpu;
     size_t full = 0, part = 0, elide = 0;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         full += qatomic_read(&cpu->neg.tlb.c.full_flush_count);
         part += qatomic_read(&cpu->neg.tlb.c.part_flush_count);
         elide += qatomic_read(&cpu->neg.tlb.c.elide_flush_count);
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 3f1bebf6ab5..8598c59654f 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -36,6 +36,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
+#include "tcg-accel-ops.h"
 
 
 /* List iterators for lists of tagged pointers in TranslationBlock. */
@@ -771,7 +772,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
     did_flush = true;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         tcg_flush_jmp_cache(cpu);
     }
 
@@ -885,13 +886,13 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
 
     if (tb_cflags(tb) & CF_PCREL) {
         /* A TB may be at any virtual address */
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             tcg_flush_jmp_cache(cpu);
         }
     } else {
         uint32_t h = tb_jmp_cache_hash_func(tb->pc);
 
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             CPUJumpCache *jc = cpu->tb_jmp_cache;
 
             if (qatomic_read(&jc->array[h].tb) == tb) {
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 028b385af9a..e5ce285efb9 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -42,7 +42,7 @@ void rr_kick_vcpu_thread(CPUState *unused)
 {
     CPUState *cpu;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         cpu_exit(cpu);
     };
 }
@@ -116,7 +116,7 @@ static void rr_wait_io_event(void)
 
     rr_start_kick_timer();
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         qemu_wait_io_event_common(cpu);
     }
 }
@@ -129,7 +129,7 @@ static void rr_deal_with_unplugged_cpus(void)
 {
     CPUState *cpu;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_TCG(cpu) {
         if (cpu->unplug && !cpu_can_run(cpu)) {
             tcg_cpu_destroy(cpu);
             break;
@@ -160,7 +160,7 @@ static int rr_cpu_count(void)
 
     if (cpu_list_generation_id_get() != last_gen_id) {
         cpu_count = 0;
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             ++cpu_count;
         }
         last_gen_id = cpu_list_generation_id_get();
@@ -201,7 +201,7 @@ static void *rr_cpu_thread_fn(void *arg)
         qemu_cond_wait_bql(first_cpu->halt_cond);
 
         /* process any pending work */
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             current_cpu = cpu;
             qemu_wait_io_event_common(cpu);
         }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1fb077f7b38..371bbaa0307 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -144,7 +144,7 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     switch (type) {
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
             if (err) {
                 break;
@@ -154,7 +154,7 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             err = cpu_watchpoint_insert(cpu, addr, len,
                                         xlat_gdb_type(cpu, type), NULL);
             if (err) {
@@ -175,7 +175,7 @@ static int tcg_remove_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     switch (type) {
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             err = cpu_breakpoint_remove(cpu, addr, BP_GDB);
             if (err) {
                 break;
@@ -185,7 +185,7 @@ static int tcg_remove_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_TCG(cpu) {
             err = cpu_watchpoint_remove(cpu, addr, len,
                                         xlat_gdb_type(cpu, type));
             if (err) {
-- 
2.47.1


