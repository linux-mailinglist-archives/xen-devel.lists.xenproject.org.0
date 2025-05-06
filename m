Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCDAABD56
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976754.1363966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlS-000694-WA; Tue, 06 May 2025 08:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976754.1363966; Tue, 06 May 2025 08:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlS-00064s-MU; Tue, 06 May 2025 08:34:58 +0000
Received: by outflank-mailman (input) for mailman id 976754;
 Tue, 06 May 2025 08:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlQ-00041m-Uj
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc93c8b4-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:55 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso43079535e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b22bd6a3sm331993f8f.27.2025.05.06.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:53 -0700 (PDT)
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
X-Inumbo-ID: fc93c8b4-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520494; x=1747125294; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lijm60qofSbPzMh7l1KwxnIJENLBQ/io7X5j2PqNzlk=;
        b=AtKFX+MQFOcCQWM9fQd7PQXiqiL2U6M/PUjGh06wEsr61dipb9Csc8QY+ZY/eZ44qQ
         7T7sKaYBPUe/JuqDVucugtejy0b3Dn1Ndt0LljIEmf6z83cG+xGXeYt9ZiTsKU+sr1Gu
         omFpRdWVps1rBxo56yS/PbnjpHnykLM0Te1uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520494; x=1747125294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lijm60qofSbPzMh7l1KwxnIJENLBQ/io7X5j2PqNzlk=;
        b=oivJv41yuEulwrySmzfjbv9ToxdLoyMfcgH9r89YUsbJBtjAKNW7gpmiZyRHz7r8EJ
         45Uu+gwuswN2GCMPfmVAt6JdDA65JKA+YxjPqRUgqpvwnYPJkYATFiRMvgGvJ781wiYe
         mEslfaadItYc49NUr+lsl8wREV0GotXGaSYXISywDJmsQGhpkMDutBUx6bYTVr+ogNeg
         OpqANPTTwltvXK4rBtygo9InCMYz0yxxIAaT8dR2TCHQqeiqHPeaEo5KYvXX5kegc3Vn
         5mQvebesp/lZLl+3nOZpLDU57mjy6uEOOGrcnrQ11nSzL5dWLzzb3ueqHU432XuFeNXs
         6uiA==
X-Gm-Message-State: AOJu0YxpYerPeQINb6uG1G/O/q1vG/9J1NuwYSLUZalIgBtcyQDDxCST
	c0Lsw0zNrDla5IQOPyRmz4b/bQ5PhFAEDvNluKQt1hk8ejL9LeqjBIyfPbci8w8VxAimmd7wZW0
	K
X-Gm-Gg: ASbGncvj3IL0rIHWFM5GOXRdNKsTg8TvKwYRw5h3uJqN8qQmgRmAvZJuWeR55n6zEuk
	ZSXHvzNbt4CHRu0ken4BCQ6FvA65v08U0N93R4OX6smD33hOfftdx3tHSSEW2HMFJxIBKEtNFDk
	+WqNvjyNn3+6XhRSh1zwcU+HtjE12oHZq4Ag937asShRLhn9XcgUszzbKmL8+fKzXRvVSaDeqT0
	HyTynnlPvCs+BSXGoB49PBHEfdD+y/s8GGeZ92tqhTob2ABR95lLTbF5sNEiFS0NxpHi7zeMUiI
	y6Z4pr/1i8MMlJTIR0jUMpLHiZSV1R99c7veeRjnQkwN7g==
X-Google-Smtp-Source: AGHT+IGGh8zKa04McfL2H41nAuyZq30mLgV+7e5ifR/aNO8hMNZAOt0rGoSXkMlVgW4esZ4GKIMiaw==
X-Received: by 2002:a05:6000:3113:b0:39c:e0e:bb46 with SMTP id ffacd0b85a97d-3a0ac0cb00fmr1421475f8f.4.1746520494283;
        Tue, 06 May 2025 01:34:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
Date: Tue,  6 May 2025 10:31:48 +0200
Message-ID: <20250506083148.34963-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a guest is allowed access to cache control operations such tracking
prevents having to issue a system-wide cache flush, and rather just flush
the pCPUs where the vCPU has been scheduled since the last flush.

Note that domain-wide flushes accumulate the dirty caches from all the
vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
will result in redundant flushes in further calls.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c             | 43 +++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/hvm/mtrr.c           |  2 +-
 xen/arch/x86/hvm/svm/svm.c        |  6 +++--
 xen/arch/x86/hvm/vmx/vmx.c        |  6 +++--
 xen/arch/x86/include/asm/domain.h |  9 +++++++
 xen/arch/x86/mm.c                 | 25 +++++++-----------
 xen/arch/x86/pv/emul-priv-op.c    |  8 ++----
 8 files changed, 73 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f197dad4c0cd..3d08b829d2db 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -579,6 +579,13 @@ int arch_vcpu_create(struct vcpu *v)
 
         if ( (rc = init_vcpu_msr_policy(v)) )
             goto fail;
+
+        if ( cache_flush_permitted(d) &&
+             !cond_zalloc_cpumask_var(&v->arch.dirty_cache) )
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
     }
     else if ( (rc = xstate_alloc_save_area(v)) != 0 )
         return rc;
@@ -614,6 +621,7 @@ int arch_vcpu_create(struct vcpu *v)
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
+    FREE_CPUMASK_VAR(v->arch.dirty_cache);
 
     return rc;
 }
@@ -628,6 +636,8 @@ void arch_vcpu_destroy(struct vcpu *v)
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
 
+    FREE_CPUMASK_VAR(v->arch.dirty_cache);
+
     if ( is_hvm_vcpu(v) )
         hvm_vcpu_destroy(v);
     else
@@ -2018,6 +2028,9 @@ static void __context_switch(void)
         cpumask_set_cpu(cpu, nd->dirty_cpumask);
     write_atomic(&n->dirty_cpu, cpu);
 
+    if ( cache_flush_permitted(nd) )
+        __cpumask_set_cpu(cpu, n->arch.dirty_cache);
+
     if ( !is_idle_domain(nd) )
     {
         memcpy(stack_regs, &n->arch.user_regs, CTXT_SWITCH_STACK_BYTES);
@@ -2606,6 +2619,36 @@ unsigned int domain_max_paddr_bits(const struct domain *d)
     return bits;
 }
 
+void vcpu_flush_cache(struct vcpu *curr)
+{
+    ASSERT(curr == current);
+    ASSERT(cache_flush_permitted(curr->domain));
+
+    flush_mask(curr->arch.dirty_cache, FLUSH_CACHE);
+    cpumask_clear(curr->arch.dirty_cache);
+    __cpumask_set_cpu(smp_processor_id(), curr->arch.dirty_cache);
+}
+
+void domain_flush_cache(const struct domain *d)
+{
+    const struct vcpu *v;
+    cpumask_t *mask = this_cpu(scratch_cpumask);
+
+    ASSERT(cache_flush_permitted(d));
+
+    cpumask_clear(mask);
+    for_each_vcpu( d, v )
+        cpumask_or(mask, mask, v->arch.dirty_cache);
+
+    flush_mask(mask, FLUSH_CACHE);
+    /*
+     * Clearing the mask of vCPUs in the domain would be racy unless all vCPUs
+     * are paused, so just leave them as-is, at the cost of possibly doing
+     * redundant flushes in later calls.  It's still better than doing a
+     * host-wide cache flush.
+     */
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046d1..aed582a215a0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2277,7 +2277,7 @@ void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
             domain_pause_nosync(v->domain);
 
             /* Flush physical caches. */
-            flush_all(FLUSH_CACHE);
+            domain_flush_cache(v->domain);
             hvm_set_uc_mode(v, 1);
 
             domain_unpause(v->domain);
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 887994d2b984..cfe0d44459c2 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -769,7 +769,7 @@ void memory_type_changed(struct domain *d)
     if ( cache_flush_permitted(d) &&
          d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) )
     {
-        flush_all(FLUSH_CACHE);
+        domain_flush_cache(d);
     }
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e33a38c1e446..5d1777ace335 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2315,8 +2315,10 @@ static void svm_vmexit_mce_intercept(
 
 static void cf_check svm_wbinvd_intercept(void)
 {
-    if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE);
+    struct vcpu *curr = current;
+
+    if ( cache_flush_permitted(curr->domain) )
+        vcpu_flush_cache(curr);
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 639882ceb216..9273607d576c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3840,11 +3840,13 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
 
 static void cf_check vmx_wbinvd_intercept(void)
 {
-    if ( !cache_flush_permitted(current->domain) )
+    struct vcpu *curr = current;
+
+    if ( !cache_flush_permitted(curr->domain) )
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
+        vcpu_flush_cache(curr);
     else
         wbinvd();
 }
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8c0dea12a526..064b51889dc2 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -668,6 +668,12 @@ struct arch_vcpu
 
     struct vcpu_msrs *msrs;
 
+    /*
+     * When vCPU is allowed cache control track the pCPUs the vCPU has run on
+     * since the last flush.
+     */
+    cpumask_var_t dirty_cache;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
@@ -790,6 +796,9 @@ unsigned int domain_max_paddr_bits(const struct domain *d);
 #define arch_init_idle_domain arch_init_idle_domain
 void arch_init_idle_domain(struct domain *d);
 
+void vcpu_flush_cache(struct vcpu *curr);
+void domain_flush_cache(const struct domain *d);
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 59b60b1e62a7..11b59398a2c4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3804,26 +3804,19 @@ long do_mmuext_op(
             break;
 
         case MMUEXT_FLUSH_CACHE:
-            /*
-             * Dirty pCPU caches where the current vCPU has been scheduled are
-             * not tracked, and hence we need to resort to a global cache
-             * flush for correctness.
-             */
+            if ( unlikely(currd != pg_owner) )
+                rc = -EPERM;
+            else if ( likely(cache_flush_permitted(currd)) )
+                vcpu_flush_cache(curr);
+            else
+                rc = -EINVAL;
+            break;
+
         case MMUEXT_FLUSH_CACHE_GLOBAL:
             if ( unlikely(currd != pg_owner) )
                 rc = -EPERM;
             else if ( likely(cache_flush_permitted(currd)) )
-            {
-                unsigned int cpu;
-                cpumask_t *mask = this_cpu(scratch_cpumask);
-
-                cpumask_clear(mask);
-                for_each_online_cpu(cpu)
-                    if ( !cpumask_intersects(mask,
-                                             per_cpu(cpu_sibling_mask, cpu)) )
-                        __cpumask_set_cpu(cpu, mask);
-                flush_mask(mask, FLUSH_CACHE);
-            }
+                domain_flush_cache(currd);
             else
                 rc = -EINVAL;
             break;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 089d4cb4d905..076ce8f00457 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1199,12 +1199,8 @@ static int cf_check cache_op(
      * newer linux uses this in some start-of-day timing loops.
      */
     if ( cache_flush_permitted(current->domain) )
-        /*
-         * Handle wbnoinvd as wbinvd, at the expense of higher cost.  Broadcast
-         * the flush to all pCPUs, Xen doesn't track where the vCPU has ran
-         * previously.
-         */
-        flush_all(FLUSH_CACHE);
+        /* Handle wbnoinvd as wbinvd, at the expense of higher cost. */
+        vcpu_flush_cache(current);
 
     return X86EMUL_OKAY;
 }
-- 
2.48.1


