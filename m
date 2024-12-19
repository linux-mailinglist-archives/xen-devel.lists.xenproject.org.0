Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFAB9F830E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861433.1273401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL56-00084c-FK; Thu, 19 Dec 2024 18:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861433.1273401; Thu, 19 Dec 2024 18:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL56-00083R-By; Thu, 19 Dec 2024 18:17:04 +0000
Received: by outflank-mailman (input) for mailman id 861433;
 Thu, 19 Dec 2024 18:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om7t=TM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOL54-0007Z2-AV
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:17:02 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7139613e-be35-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:17:01 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385d851e7c3so47936f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 10:17:01 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8ac93csm2089713f8f.95.2024.12.19.10.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 10:17:00 -0800 (PST)
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
X-Inumbo-ID: 7139613e-be35-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734632220; x=1735237020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7rrd3s6trX0PM3fTY21ALz1gAXhr7UFRn3XH1zFrF0=;
        b=QquTd7fi2AEqSYwsun0yHQ95ExkeEUxLcckXS82LxIWRTL5BlkNXvoDGnKsTh9SZ7T
         /qb1jc/uIHFk3TGH4dLf1d/iAqs3nwS2GW0fzxnvMfS3LDa5EQI7+1JzL75/ThNAefjn
         UXVk2nJFevY59mLAceqx//u+usbpRtCULp4i1kIN6bnUNzETgnb9YSiSezdU2ttWZmYf
         poE57b6rKzasHtb7Z3wcjmDIR3ZArBzVwpOT+SdyJhkb8/L3wJiKrtlDIvliHOD4MwJO
         w+38OhQBrV5x3apRHXEWv/PXZtnWh9GuhkByFQaVdvSQatIImTwShEyAtmsJn73lwrKX
         Hm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632220; x=1735237020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7rrd3s6trX0PM3fTY21ALz1gAXhr7UFRn3XH1zFrF0=;
        b=IV4HIkry0acxDqatB3rumlAp/Ih6SWbS36G/iVz20Z+TzO5uHJg4vxKLKKAts51HFy
         8aEbKnqnGMHqKsVENHohEceokCTMJzJfzrd+jhiojmt0o4GbH9wgUHOzALebMP9Lpa0e
         oDhjLE8RSZtXIMsEo2TPU2AvYekSrKpJIlISXZuvcDxM3BdgGbBpQ9+ykFbzzbBka1PT
         XSbnhYao5qQUdbc1UB3gjUxDY3AQYwsF6WMz4+YwosfaIw0aUeNk0L5qYObr5ZzPxnHl
         KAmcI+Ctajmhjtguses3+thd2SMjVRn7xMTwFECgYBUTZhsnbTAOKWNUBo6nXdSgTGVd
         oo1Q==
X-Gm-Message-State: AOJu0Yyzp67CnCCnynbomY0lI+Jom+KZ6sgS10CdPhz+/CuDt0A9IX5i
	Y1iXNi9IhmVhKXmGK7+o/TutQzq0Rm0q6pZc+ty3uaxj0GsPYa83fOS0+w==
X-Gm-Gg: ASbGncumK05103qsiWezt3DiQ0wkQiQ0+dgaXxpvbePrjwibcCW1azeaXG9LVYOv4Xc
	6u1K42mcPOHFw2kzMYfbdgLDP/bm9UUw2iFlVj1UG845YYxHnEYLJj2ejEC1PsHl6IK2xGif/DZ
	DRtK0UF/v2i3F7lekwGEe7BsP7Wr8mL5d5R7HSyUvQn09m8qobC1Sj+AwvDvSyA3UKrmbowiXce
	SPTuTeaNbcppnnO3jHITbpBdIYljh2MxHP55F4hi6dRZ5ZGYBZxbBegWZExVde3vtDEFI3N3Mvx
	5cF5NYJ4+RMrFFTUrChqci1PadO8+UtQtBh384Jvh4ibYYD7UgRFB/1m
X-Google-Smtp-Source: AGHT+IG6sGvgaupsPXBbHAqlSjnaWCcGO41VPto1cfnUSpDsBERruG5IodVRx03AcjtikwrKPSh/TA==
X-Received: by 2002:a05:6000:71b:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-38a221f780bmr34159f8f.7.1734632220360;
        Thu, 19 Dec 2024 10:17:00 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86: Add Support for Paging-Write Feature
Date: Thu, 19 Dec 2024 18:16:52 +0000
Message-Id: <95580d02390056ea10eb80439f9d3ef9d2297ecc.1734631969.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734631969.git.w1benny@gmail.com>
References: <cover.1734631969.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.

This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.

This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.

Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:

- Sets an "invisible breakpoint" in the altp2m view for a function F
- Monitors guest page-table updates to track whether the page containing F is paged out
- Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint

In the current implementation:

- If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
- If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.

With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.
---
 xen/arch/arm/mem_access.c               | 4 ++++
 xen/arch/arm/mmu/p2m.c                  | 1 +
 xen/arch/x86/hvm/hvm.c                  | 1 +
 xen/arch/x86/hvm/monitor.c              | 1 +
 xen/arch/x86/hvm/vmx/vmcs.c             | 4 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 3 +++
 xen/arch/x86/include/asm/p2m.h          | 1 +
 xen/arch/x86/mm/hap/nested_hap.c        | 3 +++
 xen/arch/x86/mm/mem_access.c            | 3 +++
 xen/arch/x86/mm/p2m-ept.c               | 4 ++++
 xen/include/public/memory.h             | 9 +++++++++
 xen/include/xen/mem_access.h            | 6 ++++++
 12 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 0ec3462364..2af92bb402 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -32,6 +32,7 @@ static int __p2m_get_mem_access(struct domain *d, gfn_t gfn,
             ACCESS(rwx),
             ACCESS(rx2rw),
             ACCESS(n2rwx),
+            ACCESS(r_pw),
 #undef ACCESS
     };
 
@@ -172,6 +173,7 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
             break;
         else
             goto err;
+    case XENMEM_access_r_pw:
     case XENMEM_access_rx2rw:
     case XENMEM_access_rx:
     case XENMEM_access_r:
@@ -253,6 +255,7 @@ bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
         violation = npfec.read_access || npfec.insn_fetch;
         break;
     case XENMEM_access_r:
+    case XENMEM_access_r_pw:
         violation = npfec.write_access || npfec.insn_fetch;
         break;
     default:
@@ -361,6 +364,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
         ACCESS(rwx),
         ACCESS(rx2rw),
         ACCESS(n2rwx),
+        ACCESS(r_pw),
 #undef ACCESS
     };
 
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 28df6e5d03..7642dbc7c5 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -597,6 +597,7 @@ static void p2m_set_permission(lpae_t *e, p2m_type_t t, p2m_access_t a)
         e->p2m.read = 0;
         break;
     case p2m_access_r:
+    case p2m_access_r_pw:
         e->p2m.write = 0;
         e->p2m.xn = 1;
         break;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74e58c653e..495c8290ca 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1897,6 +1897,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
             violation = npfec.read_access || npfec.write_access || npfec.insn_fetch;
             break;
         case p2m_access_r:
+        case p2m_access_r_pw:
             violation = npfec.write_access || npfec.insn_fetch;
             break;
         case p2m_access_w:
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 74621000b2..523586ca98 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -295,6 +295,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
 
     case XENMEM_access_r:
     case XENMEM_access_n:
+    case XENMEM_access_r_pw:
         if ( pfec & PFEC_write_access )
             req.u.mem_access.flags |= MEM_ACCESS_R | MEM_ACCESS_W;
         if ( pfec & PFEC_insn_fetch )
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 147e998371..8c0ea789c1 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -203,6 +203,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
     P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
     P(cpu_has_vmx_virt_spec_ctrl, "Virtualize SPEC_CTRL");
+    P(cpu_has_vmx_ept_paging_write, "EPT Paging-Write");
 #undef P
 
     if ( !printed )
@@ -366,7 +367,8 @@ static int vmx_init_vmcs_config(bool bsp)
 
     if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
     {
-        uint64_t opt = TERTIARY_EXEC_VIRT_SPEC_CTRL;
+        uint64_t opt = (TERTIARY_EXEC_VIRT_SPEC_CTRL |
+                        TERTIARY_EXEC_EPT_PAGING_WRITE);
 
         _vmx_tertiary_exec_control = adjust_vmx_controls2(
             "Tertiary Exec Control", 0, opt,
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 939b87eb50..e1d3398141 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -273,6 +273,9 @@ extern uint64_t vmx_tertiary_exec_control;
 #define cpu_has_vmx_virt_spec_ctrl \
      (vmx_tertiary_exec_control & TERTIARY_EXEC_VIRT_SPEC_CTRL)
 
+#define cpu_has_vmx_ept_paging_write \
+     (vmx_tertiary_exec_control & TERTIARY_EXEC_EPT_PAGING_WRITE)
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index e6de37f108..aa1bf7c9d0 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -980,6 +980,7 @@ static inline unsigned int p2m_access_to_iommu_flags(p2m_access_t p2ma)
     case p2m_access_r:
     case p2m_access_rx:
     case p2m_access_rx2rw:
+    case p2m_access_r_pw:
         return IOMMUF_readable;
 
     case p2m_access_w:
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index cc7bc6e5ea..255fba7e1c 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -213,6 +213,9 @@ int nestedhvm_hap_nested_page_fault(
     case p2m_access_n2rwx:
         p2ma_10 = p2m_access_n;
         break;
+    case p2m_access_r_pw:
+        p2ma_10 = p2m_access_r;
+        break;
     default:
         p2ma_10 = p2m_access_n;
         /* For safety, remove all permissions. */
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 60a0cce68a..21b5b7ecda 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -45,6 +45,7 @@ static int _p2m_get_mem_access(struct p2m_domain *p2m, gfn_t gfn,
             ACCESS(rwx),
             ACCESS(rx2rw),
             ACCESS(n2rwx),
+            ACCESS(r_pw),
 #undef ACCESS
     };
 
@@ -94,6 +95,7 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
             break;
 
         case XENMEM_access_r:
+        case XENMEM_access_r_pw:
             violation = data->flags & MEM_ACCESS_WX;
             break;
 
@@ -312,6 +314,7 @@ bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
         ACCESS(rwx),
         ACCESS(rx2rw),
         ACCESS(n2rwx),
+        ACCESS(r_pw),
 #undef ACCESS
     };
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 21728397f9..5ad78ae4b5 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -176,6 +176,10 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
             break;           
         case p2m_access_rwx:
             break;
+        case p2m_access_r_pw:
+            entry->w = entry->x = 0;
+            entry->pw = !!cpu_has_vmx_ept_paging_write;
+            break;
     }
     
     /*
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..bd9fc37b52 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -426,6 +426,15 @@ typedef enum {
      * pausing the vcpu
      */
     XENMEM_access_n2rwx,
+
+    /*
+     * Same as XENMEM_access_r, but on processors with
+     * the TERTIARY_EXEC_EPT_PAGING_WRITE support,
+     * CPU-initiated page-table walks can still
+     * write to it (e.g., update A/D bits)
+     */
+    XENMEM_access_r_pw,
+
     /* Take the domain default */
     XENMEM_access_default
 } xenmem_access_t;
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 87d93b31f6..2231341b5d 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -64,6 +64,12 @@ typedef enum {
                            * generates an event but does not pause the
                            * vcpu */
 
+    p2m_access_r_pw = 10, /* Special: same as R, but on processors with
+                           * the TERTIARY_EXEC_EPT_PAGING_WRITE support,
+                           * CPU-initiated page-table walks can still
+                           * write to it (e.g., update A/D bits)
+                           */
+
     /* NOTE: Assumed to be only 4 bits right now on x86. */
 } p2m_access_t;
 
-- 
2.34.1


