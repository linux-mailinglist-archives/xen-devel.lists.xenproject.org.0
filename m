Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573EAB053B3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043653.1413660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRr-00089n-56; Tue, 15 Jul 2025 07:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043653.1413660; Tue, 15 Jul 2025 07:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRr-00086m-22; Tue, 15 Jul 2025 07:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1043653;
 Tue, 15 Jul 2025 07:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tvk=Z4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubaNG-0003TX-01
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:46:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcbc02c2-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:46:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so25626705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:46:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45626cde7aasm8506585e9.1.2025.07.15.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 00:46:46 -0700 (PDT)
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
X-Inumbo-ID: dcbc02c2-614f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752565607; x=1753170407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV7BcCJ9wDrvWJMr9zxpPwmj+MXGvNAcQNyzCrRDmCI=;
        b=wB7W08P0nYQ53Nb5vyEbX7By1GqxQdyenFRS9R0Upxwy1uxNnCI0vMOyyiQ0SleWjF
         9gERectBYXDDz9hc7ZYZ+hwAIo2Uvi4CwLIIjWsw6WkquUhbi3s79POpaNjDSjzNEv6A
         cVxsPxYiWgjXMRF3Q9zTBzWj4i1sCVtfpWyGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565607; x=1753170407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV7BcCJ9wDrvWJMr9zxpPwmj+MXGvNAcQNyzCrRDmCI=;
        b=bko7j3cHNk3+Lp0NWjrvCPWDkEaRCn7YuCRP3s0oy50xrE4LfoIsWVUvgC/yspxQcp
         VY7N0kdr7SNZ3rRAOwMaVQrC2IdQF9Uvd+DGMznzrtiNQlor6d6p/5sOB/Ehw8nFBewz
         NgAy7OCii8QkV1+tbGX1Jwq5dUrK5XSmdkFpGu/c/NuMScMikW+I55frC5A1Y5GozOO0
         CzRgnpl88YHy+Pt4mTlIRAClIfLc2yPJed26aKQgFk0UK84mumSPXQ2YHsCuIc7hHVOz
         5Ld59YGI00daqiKusE9o2+qNJk/XKOGiXqcOcrZrRz+6UUpuOMoIDc6mpTmzmZ6IhOEz
         hLqg==
X-Gm-Message-State: AOJu0YxvTTZOjclPw335DM1c/OInqHnR5o68xHAemBq0B6htnCb7mQfu
	3RutDUs/Y/DIiwwwV2cuSZbKbkAbFijB0lfMSg/cbBkQfCdCQCXkPPuafc+nEsedFk0aEIPJ0/b
	58PyI
X-Gm-Gg: ASbGncutxVchYLwZEX+s3tciK6HbQ2hDt7BNYOyJOF1AdEHX9C7xToavBizh7/aqaAu
	2LvqfLHyZ8v7zvU9St9sc7vsk1OvzgIW7EENvz2+MYbWi4dTRX441ybLByjxDqLUNyty3H0wvpn
	lZiQjgcW+vpxS8Ove7HqY+5JC0XnwVYxHIWRKn+KICdeddjzOkybRdkMp0MnehPRjBTOGkRril5
	oMjUmEtb6s4oQSBBB4hsYQ6N/Vq23dDw9Mgen3bRXtDBCXlbvX77BKXWa3Vga/Rpdlo2HWghUBD
	Sxr10qMRYtldPgDq1KP5pRIIh3yq2zyNx343porHAGfwmiwv7hqGY0S281F1k9XsbYNSOmHsMpq
	wakLC9RUnWIyxrcL22hgHAuxazpXMOwql8wcB3ONKJ1qjGgvmMsdT/7VP6m65jVFclg==
X-Google-Smtp-Source: AGHT+IH5EcAU8Xp3bvqSfzl5CT3VTj4iOZqoMA/qbYzTVyWqamtS209CjPdSl1H8IVPqtv6+9XxFYw==
X-Received: by 2002:a05:600c:5246:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-454f42599b3mr164132595e9.16.1752565607378;
        Tue, 15 Jul 2025 00:46:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/ept: move vmx_domain_flush_pml_buffers() to p2m-ept.c
Date: Tue, 15 Jul 2025 09:45:58 +0200
Message-ID: <20250715074559.73197-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715074559.73197-1-roger.pau@citrix.com>
References: <20250715074559.73197-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c             | 59 +------------------------
 xen/arch/x86/hvm/vmx/vmx.c              |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  1 -
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  1 +
 xen/arch/x86/mm/p2m-ept.c               | 56 +++++++++++++++++++++++
 5 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e7fca4bf33db..ab8b1c87ec0f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1670,7 +1670,7 @@ void vmx_vcpu_disable_pml(struct vcpu *v)
         return;
 
     /* Make sure we don't lose any logged GPAs. */
-    vmx_vcpu_flush_pml_buffer(v);
+    ept_vcpu_flush_pml_buffer(v);
 
     vmx_vmcs_enter(v);
 
@@ -1684,61 +1684,6 @@ void vmx_vcpu_disable_pml(struct vcpu *v)
     v->arch.hvm.vmx.pml_pg = NULL;
 }
 
-void vmx_vcpu_flush_pml_buffer(struct vcpu *v)
-{
-    uint64_t *pml_buf;
-    unsigned long pml_idx;
-
-    ASSERT((v == current) || (!vcpu_runnable(v) && !v->is_running));
-    ASSERT(vmx_vcpu_pml_enabled(v));
-
-    vmx_vmcs_enter(v);
-
-    __vmread(GUEST_PML_INDEX, &pml_idx);
-
-    /* Do nothing if PML buffer is empty. */
-    if ( pml_idx == (NR_PML_ENTRIES - 1) )
-        goto out;
-
-    pml_buf = __map_domain_page(v->arch.hvm.vmx.pml_pg);
-
-    /*
-     * PML index can be either 2^16-1 (buffer is full), or 0 ~ NR_PML_ENTRIES-1
-     * (buffer is not full), and in latter case PML index always points to next
-     * available entity.
-     */
-    if ( pml_idx >= NR_PML_ENTRIES )
-        pml_idx = 0;
-    else
-        pml_idx++;
-
-    for ( ; pml_idx < NR_PML_ENTRIES; pml_idx++ )
-    {
-        unsigned long gfn = pml_buf[pml_idx] >> PAGE_SHIFT;
-
-        /*
-         * Need to change type from log-dirty to normal memory for logged GFN.
-         * hap_track_dirty_vram depends on it to work. And we mark all logged
-         * GFNs to be dirty, as we cannot be sure whether it's safe to ignore
-         * GFNs on which p2m_change_type_one returns failure. The failure cases
-         * are very rare, and additional cost is negligible, but a missing mark
-         * is extremely difficult to debug.
-         */
-        p2m_change_type_one(v->domain, gfn, p2m_ram_logdirty, p2m_ram_rw);
-
-        /* HVM guest: pfn == gfn */
-        paging_mark_pfn_dirty(v->domain, _pfn(gfn));
-    }
-
-    unmap_domain_page(pml_buf);
-
-    /* Reset PML index */
-    __vmwrite(GUEST_PML_INDEX, NR_PML_ENTRIES - 1);
-
- out:
-    vmx_vmcs_exit(v);
-}
-
 bool vmx_domain_pml_enabled(const struct domain *d)
 {
     return d->arch.hvm.vmx.status & VMX_DOMAIN_PML_ENABLED;
@@ -1812,7 +1757,7 @@ void vmx_domain_flush_pml_buffers(struct domain *d)
         return;
 
     for_each_vcpu ( d, v )
-        vmx_vcpu_flush_pml_buffer(v);
+        ept_vcpu_flush_pml_buffer(v);
 }
 
 static void vmx_vcpu_update_eptp(struct vcpu *v, u64 eptp)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 218cb2c1af84..ce538668c737 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4787,7 +4787,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
              !(idtv_info & INTR_INFO_VALID_MASK) )
             undo_nmis_unblocked_by_iret();
 
-        vmx_vcpu_flush_pml_buffer(v);
+        ept_vcpu_flush_pml_buffer(v);
         break;
 
     case EXIT_REASON_XSAVES:
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index ff5dd66b0ad9..ecd91389302c 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -734,7 +734,6 @@ DECLARE_PER_CPU(bool, vmxon);
 bool vmx_vcpu_pml_enabled(const struct vcpu *v);
 int vmx_vcpu_enable_pml(struct vcpu *v);
 void vmx_vcpu_disable_pml(struct vcpu *v);
-void vmx_vcpu_flush_pml_buffer(struct vcpu *v);
 bool vmx_domain_pml_enabled(const struct domain *d);
 int vmx_domain_enable_pml(struct domain *d);
 void vmx_domain_disable_pml(struct domain *d);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 56bea252cc5a..da04752e1752 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -491,6 +491,7 @@ void ept_walk_table(struct domain *d, unsigned long gfn);
 bool ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order, bool *ipat, p2m_type_t type);
+void ept_vcpu_flush_pml_buffer(struct vcpu *v);
 void setup_ept_dump(void);
 /* Locate an alternate p2m by its EPTP */
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp);
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 0cf6818c13f0..015911ba6c80 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1373,6 +1373,62 @@ static void cf_check ept_flush_pml_buffers(struct p2m_domain *p2m)
     vmx_domain_flush_pml_buffers(p2m->domain);
 }
 
+void ept_vcpu_flush_pml_buffer(struct vcpu *v)
+{
+    uint64_t *pml_buf;
+    unsigned long pml_idx;
+
+    ASSERT((v == current) || (!vcpu_runnable(v) && !v->is_running));
+    ASSERT(vmx_vcpu_pml_enabled(v));
+
+    vmx_vmcs_enter(v);
+
+    __vmread(GUEST_PML_INDEX, &pml_idx);
+
+    /* Do nothing if PML buffer is empty. */
+    if ( pml_idx == (NR_PML_ENTRIES - 1) )
+        goto out;
+
+    pml_buf = __map_domain_page(v->arch.hvm.vmx.pml_pg);
+
+    /*
+     * PML index can be either 2^16-1 (buffer is full), or 0 ~ NR_PML_ENTRIES-1
+     * (buffer is not full), and in latter case PML index always points to next
+     * available entity.
+     */
+    if ( pml_idx >= NR_PML_ENTRIES )
+        pml_idx = 0;
+    else
+        pml_idx++;
+
+    for ( ; pml_idx < NR_PML_ENTRIES; pml_idx++ )
+    {
+        unsigned long gfn = pml_buf[pml_idx] >> PAGE_SHIFT;
+
+        /*
+         * Need to change type from log-dirty to normal memory for logged GFN.
+         * hap_track_dirty_vram depends on it to work. And we mark all loqgged
+         * GFNs to be dirty, as we cannot be sure whether it's safe to ignore
+         * GFNs on which p2m_change_type_one returns failure. The failure cases
+         * are very rare, and additional cost is negligible, but a missing mark
+         * is extremely difficult to debug.
+         */
+        p2m_change_type_one(v->domain, gfn, p2m_ram_logdirty, p2m_ram_rw);
+
+        /* HVM guest: pfn == gfn */
+        paging_mark_pfn_dirty(v->domain, _pfn(gfn));
+    }
+
+    unmap_domain_page(pml_buf);
+
+    /* Reset PML index */
+    __vmwrite(GUEST_PML_INDEX, NR_PML_ENTRIES - 1);
+
+ out:
+    vmx_vmcs_exit(v);
+
+}
+
 int ept_p2m_init(struct p2m_domain *p2m)
 {
     struct ept_data *ept = &p2m->ept;
-- 
2.49.0


