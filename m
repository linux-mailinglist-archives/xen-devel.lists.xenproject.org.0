Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926339FFCA3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864356.1275577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlP-0006bW-KX; Thu, 02 Jan 2025 17:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864356.1275577; Thu, 02 Jan 2025 17:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlP-0006Z1-Ht; Thu, 02 Jan 2025 17:13:39 +0000
Received: by outflank-mailman (input) for mailman id 864356;
 Thu, 02 Jan 2025 17:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6K=T2=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tTOlN-00065f-96
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:13:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e67f25ec-c92c-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 18:13:35 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so18815985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 09:13:35 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm37802386f8f.102.2025.01.02.09.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 09:13:34 -0800 (PST)
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
X-Inumbo-ID: e67f25ec-c92c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735838015; x=1736442815; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZmapqMoGLloUwPRwoQur8mb/AeXVr22gKUne+UpgLE=;
        b=kD0GD4wD5uc+ZI0uuOQXuYI+kft3IYCx+ZRFXaUfwYVg/9ZciS0+yEfW7dobgZYcvC
         P5o7h0YrBMLAJU43GXXwXyHGQ0V0Cq9Vu+fgsh5zW6jnddZVO1c+eJ1f16QQ8Odzkiur
         yB054zaz5evqb48AFkz94Y76KJNbgKVDK0EPlhtHC9fXStXBw9N1St5NTAfdq4gvZMht
         Xps0i+ZZYblGSW5OxYQKLRlQzvJLuN+RC/RZ+5D4SA9DaKhEnsVGX/jSyBBNcO0F6ZdZ
         CrADL056VSwZk/Pm6eySwIT/t9w1nKWxgc94waWSra5NFhhNeGybOSz1oRc8I5fYG7AG
         644w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735838015; x=1736442815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZmapqMoGLloUwPRwoQur8mb/AeXVr22gKUne+UpgLE=;
        b=QGjoIIA3ck1bZ+FcEYd1aIOe1gRiiLpZpEtw0N1N+A+jy6i2PLecoIDSrIRV+VkDWe
         HzhjhONXz8hGDHIzu3GbLfMifrLZan4sA0tTNlwoQSzmzJj0x+nRmDUn7vDj5Wo5PgVS
         8XviM3ovzJTiIUTJlo+9NzTm4hkzk/tEb/DyqY5TlaFzDxMc8HspVNNNGh8xiFHRDMkU
         kLiDi3JFCUdir/SJYQw0goGnlRZ5SKdlovce7e+lFT/rEE+Ek1EPCD5yXaduzWMMIZgb
         n/c7CPrvDYfEoZih35vcjbPrzgxRjo2C1Q3Epq/8z7ka86w4Q0SQQCEqsr40PGaGNO+B
         gOZQ==
X-Gm-Message-State: AOJu0YyNW5OvZp+eqCTJI1P4ch7IOhybSsS2Bz5aM7xr7YX1FgAGWeUR
	siY6R2W4IIdE8/Ww4xKhKTS1rCsKfOkS/NnSzP7rdJ7O6nF9zAv1V4ildw==
X-Gm-Gg: ASbGncvvTAlheCaeXvJjKPMXbLK67scPrZmylzFt4KyTOcILTs5YqB6/MGzXs3uiQtg
	GMg4uB41ybK/Ful8Ld4TtGFZVsYnA5+8R0TuUzgw1AltoRT23/en0AK4aN4fSj80Oubeje9jfBz
	heaV9og8+iWXNIlMFxVx4q+VgQPfGCyIBFqk9izlUR2O8UC6n7Y6BIRUZ8iHApQaER7tm3dLHDp
	mcfNMgpoEUZ7FweTLZ+a9ftl5+h8ldnKFH9zgJPYAkB1Y16Nlti/3HMQTDIGh6d1Dx9ldwkyJfq
	/Q5aQ7YGFUV5BQSfiFH4rcDu5Y2oWtJqAgVe934yNh1mMFmuZAweXL7K
X-Google-Smtp-Source: AGHT+IEyxKl68tY70kJNfiYI4dF55u9PI6OOX0+Kb8GQNZuhXHV3Wvm2yf9RxblVe5S78pL4PXwy2g==
X-Received: by 2002:a5d:6487:0:b0:386:1cd3:8a06 with SMTP id ffacd0b85a97d-38a22206907mr16222366f8f.9.1735838014467;
        Thu, 02 Jan 2025 09:13:34 -0800 (PST)
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
Subject: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
Date: Thu,  2 Jan 2025 17:13:28 +0000
Message-Id: <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1735837806.git.w1benny@gmail.com>
References: <cover.1735837806.git.w1benny@gmail.com>
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

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/arm/mem_access.c               |  4 ++++
 xen/arch/arm/mmu/p2m.c                  |  1 +
 xen/arch/x86/hvm/hvm.c                  |  1 +
 xen/arch/x86/hvm/monitor.c              |  1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/p2m.h          |  1 +
 xen/arch/x86/mm/hap/nested_hap.c        |  3 +++
 xen/arch/x86/mm/mem_access.c            |  3 +++
 xen/arch/x86/mm/p2m-ept.c               | 12 ++++++++++++
 xen/include/public/memory.h             |  9 +++++++++
 xen/include/xen/mem_access.h            |  6 ++++++
 12 files changed, 47 insertions(+), 1 deletion(-)

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
index 21728397f9..7ce8f3a1ca 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -154,27 +154,39 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
         case p2m_access_n:
         case p2m_access_n2rwx:
             entry->r = entry->w = entry->x = 0;
+            entry->pw = 0;
             break;
         case p2m_access_r:
             entry->w = entry->x = 0;
+            entry->pw = 0;
             break;
         case p2m_access_w:
             entry->r = entry->x = 0;
+            entry->pw = 0;
             break;
         case p2m_access_x:
             entry->r = entry->w = 0;
+            entry->pw = 0;
             break;
         case p2m_access_rx:
         case p2m_access_rx2rw:
             entry->w = 0;
+            entry->pw = 0;
             break;
         case p2m_access_wx:
             entry->r = 0;
+            entry->pw = 0;
             break;
         case p2m_access_rw:
             entry->x = 0;
+            entry->pw = 0;
             break;           
         case p2m_access_rwx:
+            entry->pw = 0;
+            break;
+        case p2m_access_r_pw:
+            entry->w = entry->x = 0;
+            entry->pw = !!cpu_has_vmx_ept_paging_write;
             break;
     }
     
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


