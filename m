Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E787EDA7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694896.1084163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy3-0006nS-G9; Mon, 18 Mar 2024 16:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694896.1084163; Mon, 18 Mar 2024 16:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy3-0006h4-93; Mon, 18 Mar 2024 16:36:07 +0000
Received: by outflank-mailman (input) for mailman id 694896;
 Mon, 18 Mar 2024 16:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFy2-0005JN-D3
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ccc7f93-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:36:04 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a4675aaa2e8so530463766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:36:04 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:36:02 -0700 (PDT)
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
X-Inumbo-ID: 9ccc7f93-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779763; x=1711384563; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vrAhsgU6cX18okKuYBRpNmDoptjsZfxbtY0fNi0S6I=;
        b=YJE3oceJHQ3uKQr8hNkLSsp9XV7vs6q0l+zUv5atmkaQD6LWrlbbkbzsUW2+nIfvjj
         ZgcAdL3rOCbuIPBDvT9u2DsTcKFTh79Cnzg2PE27ybun/R5OSK14SCUjDwbBHLZTD5J0
         DFhT0YcGwh86QrNf+vvgcqNM9QxFW1mUZ5SYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779763; x=1711384563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vrAhsgU6cX18okKuYBRpNmDoptjsZfxbtY0fNi0S6I=;
        b=YB6us06KbyjAz3gC3aHbiaOexuypMrDAKzqlkRwe9MOqwLHah5kySWAbpkkJMzh09G
         hNpLpGDTxfOUCEdX/8YXVRGgpor7wAokTvz3+JdH/HsA/L51s5hHcn9HhmVtwQkRsGVU
         iA+09iU24em6CjEgE6FT8WkLLSAT0PGQoN2Z32IpuVg2bFz0WHrSkbVeWpqUquX/PDeB
         bvGWu/99cwIYajWmKIP/FtMJu/o17U6lSq/qjNVmeDisgfM+sdj3tpPgqhaFLAY6wA8f
         CEggbO/faMGWXTKtNol7W3w2S353x7ZyKH+zI9rgY1017tPWq7aex3cGSwvwmbUx9+9k
         lvlw==
X-Gm-Message-State: AOJu0YzC3sEH+DWvDKhRq7UtG0b4gPf1zdSF5cP62c04b9AfrY+z8L1H
	zoYHraJn9cG3fMZqBNwzJ6Vsd86XG4ki72Dg/hRiCE+4gSbc1BfhoeJtjs8FFE/MZyhLwE/tk8o
	R
X-Google-Smtp-Source: AGHT+IEnk6AfX4SLXJGON1k0UkIeAvbg61kD28TZM+u99GXJOtoZvunt1o7QU0IrhGe8s4ngEuX9Tw==
X-Received: by 2002:a17:906:6947:b0:a46:1e16:317c with SMTP id c7-20020a170906694700b00a461e16317cmr7955308ejs.55.1710779762757;
        Mon, 18 Mar 2024 09:36:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 6/7] xen/trace: Update final {__,}trace_var() users to the new API
Date: Mon, 18 Mar 2024 16:35:51 +0000
Message-Id: <20240318163552.3808695-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This logically drops the cycles parameter, as it's now encoded directly in the
event code.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

v3:
 * New
---
 xen/arch/x86/hvm/emulate.c      |  2 +-
 xen/arch/x86/hvm/hvm.c          |  3 +--
 xen/arch/x86/hvm/svm/svm.c      |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
 xen/arch/x86/irq.c              |  2 +-
 xen/arch/x86/mm/p2m-pod.c       |  8 ++++----
 xen/arch/x86/mm/p2m-pt.c        |  2 +-
 xen/arch/x86/mm/shadow/common.c |  6 +++---
 xen/arch/x86/mm/shadow/multi.c  | 10 +++++-----
 xen/arch/x86/pv/trace.c         | 21 +++++++++++----------
 xen/common/memory.c             |  2 +-
 xen/common/trace.c              |  2 +-
 12 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index d8f36206a712..a37525316c6e 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -67,7 +67,7 @@ static void hvmtrace_io_assist(const ioreq_t *p)
         size *= 2;
     }
 
-    trace_var(event, 0/*!cycles*/, size, buffer);
+    trace(event, size, buffer);
 }
 
 static int cf_check null_read(
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e8af42eb499d..bb4eda4ecde2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5136,8 +5136,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -EINVAL;
 
         /* Cycles will be taken at the vmexit and vmenter */
-        trace_var(tr.event | TRC_GUEST, 0 /*!cycles*/,
-                  tr.extra_bytes, tr.extra);
+        trace(tr.event | TRC_GUEST, tr.extra_bytes, tr.extra);
         break;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 09a79d761163..2d0c8762359f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1681,7 +1681,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
         _d.mfn = mfn_x(mfn);
         _d.p2mt = p2mt;
 
-        __trace_var(TRC_HVM_NPF, 0, sizeof(_d), &_d);
+        trace(TRC_HVM_NPF, sizeof(_d), &_d);
     }
 
     switch ( ret )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ac73f58798ed..255c97f18162 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3767,7 +3767,7 @@ static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
         _d.qualification = q.raw;
         _d.mfn = mfn_x(get_gfn_query_unlocked(d, gfn, &_d.p2mt));
 
-        __trace_var(TRC_HVM_NPF, 0, sizeof(_d), &_d);
+        trace(TRC_HVM_NPF, sizeof(_d), &_d);
     }
 
     if ( q.gla_valid )
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 2c1f858d3e64..45a74c6a0256 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -135,7 +135,7 @@ static void _trace_irq_mask(uint32_t event, int irq, int vector,
 
     memcpy(d.mask, mask,
            min(sizeof(d.mask), BITS_TO_LONGS(nr_cpu_ids) * sizeof(long)));
-    trace_var(event, 1, sizeof(d), &d);
+    trace_time(event, sizeof(d), &d);
 }
 
 static void trace_irq_mask(uint32_t event, int irq, int vector,
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 65d31e552305..79a016682f1d 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -854,7 +854,7 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn)
         t.d = d->domain_id;
         t.order = 9;
 
-        __trace_var(TRC_MEM_POD_ZERO_RECLAIM, 0, sizeof(t), &t);
+        trace(TRC_MEM_POD_ZERO_RECLAIM, sizeof(t), &t);
     }
 
     /*
@@ -1022,7 +1022,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
                 t.d = d->domain_id;
                 t.order = 0;
 
-                __trace_var(TRC_MEM_POD_ZERO_RECLAIM, 0, sizeof(t), &t);
+                trace(TRC_MEM_POD_ZERO_RECLAIM, sizeof(t), &t);
             }
 
             /* Add to cache, and account for the new p2m PoD entry */
@@ -1262,7 +1262,7 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
         t.d = d->domain_id;
         t.order = order;
 
-        __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
+        trace(TRC_MEM_POD_POPULATE, sizeof(t), &t);
     }
 
     pod_unlock_and_flush(p2m);
@@ -1307,7 +1307,7 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
         t.d = d->domain_id;
         t.order = order;
 
-        __trace_var(TRC_MEM_POD_SUPERPAGE_SPLINTER, 0, sizeof(t), &t);
+        trace(TRC_MEM_POD_SUPERPAGE_SPLINTER, sizeof(t), &t);
     }
 
     return true;
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 348130d0dd3b..666abd46be16 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -608,7 +608,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
         t.d = d->domain_id;
         t.order = page_order;
 
-        __trace_var(TRC_MEM_SET_P2M_ENTRY, 0, sizeof(t), &t);
+        trace(TRC_MEM_SET_P2M_ENTRY, sizeof(t), &t);
     }
 
     /* Carry out any eventually pending earlier changes first. */
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 8aa7b698f879..1303aec85918 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -433,7 +433,7 @@ static inline void trace_resync(int event, mfn_t gmfn)
         /* Convert gmfn to gfn */
         gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
 
-        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
+        trace(event, sizeof(gfn), &gfn);
     }
 }
 
@@ -910,7 +910,7 @@ static inline void trace_shadow_prealloc_unpin(struct domain *d, mfn_t smfn)
 
         ASSERT(mfn_valid(smfn));
         gfn = mfn_to_gfn(d, backpointer(mfn_to_page(smfn)));
-        __trace_var(TRC_SHADOW_PREALLOC_UNPIN, 0/*!tsc*/, sizeof(gfn), &gfn);
+        trace(TRC_SHADOW_PREALLOC_UNPIN, sizeof(gfn), &gfn);
     }
 }
 
@@ -1808,7 +1808,7 @@ static inline void trace_shadow_wrmap_bf(mfn_t gmfn)
         /* Convert gmfn to gfn */
         gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
 
-        __trace_var(TRC_SHADOW_WRMAP_BF, 0/*!tsc*/, sizeof(gfn), &gfn);
+        trace(TRC_SHADOW_WRMAP_BF, sizeof(gfn), &gfn);
     }
 }
 
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 90cf0ceaa367..bcd02b2d0037 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1979,7 +1979,7 @@ static inline void trace_shadow_gen(u32 event, guest_va_t va)
     if ( tb_init_done )
     {
         event |= (GUEST_PAGING_LEVELS-2)<<8;
-        __trace_var(event, 0/*!tsc*/, sizeof(va), &va);
+        trace(event, sizeof(va), &va);
     }
 }
 
@@ -2003,7 +2003,7 @@ static inline void trace_shadow_fixup(guest_l1e_t gl1e,
         d.va = va;
         d.flags = this_cpu(trace_shadow_path_flags);
 
-        __trace_var(event, 0/*!tsc*/, sizeof(d), &d);
+        trace(event, sizeof(d), &d);
     }
 }
 
@@ -2027,7 +2027,7 @@ static inline void trace_not_shadow_fault(guest_l1e_t gl1e,
         d.va = va;
         d.flags = this_cpu(trace_shadow_path_flags);
 
-        __trace_var(event, 0/*!tsc*/, sizeof(d), &d);
+        trace(event, sizeof(d), &d);
     }
 }
 
@@ -2053,7 +2053,7 @@ static inline void trace_shadow_emulate_other(u32 event,
         d.gfn=gfn_x(gfn);
         d.va = va;
 
-        __trace_var(event, 0/*!tsc*/, sizeof(d), &d);
+        trace(event, sizeof(d), &d);
     }
 }
 
@@ -2106,7 +2106,7 @@ static inline void trace_shadow_emulate(guest_l1e_t gl1e, unsigned long va)
 #endif
         d.flags = this_cpu(trace_shadow_path_flags);
 
-        __trace_var(event, 0/*!tsc*/, sizeof(d), &d);
+        trace(event, sizeof(d), &d);
     }
 }
 #endif /* CONFIG_HVM */
diff --git a/xen/arch/x86/pv/trace.c b/xen/arch/x86/pv/trace.c
index cf3897061e1f..70f426f2095c 100644
--- a/xen/arch/x86/pv/trace.c
+++ b/xen/arch/x86/pv/trace.c
@@ -19,7 +19,7 @@ void __trace_pv_trap(int trapnr, unsigned long eip,
             .error_code     = error_code,
         };
 
-        __trace_var(TRC_PV_TRAP, 1, sizeof(d), &d);
+        trace_time(TRC_PV_TRAP, sizeof(d), &d);
     }
     else
     {
@@ -35,7 +35,7 @@ void __trace_pv_trap(int trapnr, unsigned long eip,
             .error_code     = error_code,
         };
 
-        __trace_var(TRC_PV_TRAP | TRC_64_FLAG, 1, sizeof(d), &d);
+        trace_time(TRC_PV_TRAP | TRC_64_FLAG, sizeof(d), &d);
     }
 }
 
@@ -53,7 +53,7 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
             .error_code = error_code,
         };
 
-        __trace_var(TRC_PV_PAGE_FAULT, 1, sizeof(d), &d);
+        trace_time(TRC_PV_PAGE_FAULT, sizeof(d), &d);
     }
     else
     {
@@ -66,7 +66,7 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
             .error_code = error_code,
         };
 
-        __trace_var(TRC_PV_PAGE_FAULT | TRC_64_FLAG, 1, sizeof(d), &d);
+        trace_time(TRC_PV_PAGE_FAULT | TRC_64_FLAG, sizeof(d), &d);
     }
 }
 
@@ -75,10 +75,11 @@ void __trace_trap_one_addr(unsigned event, unsigned long va)
     if ( is_pv_32bit_vcpu(current) )
     {
         u32 d = va;
-        __trace_var(event, 1, sizeof(d), &d);
+
+        trace_time(event, sizeof(d), &d);
     }
     else
-        __trace_var(event | TRC_64_FLAG, 1, sizeof(va), &va);
+        trace_time(event | TRC_64_FLAG, sizeof(va), &va);
 }
 
 void __trace_trap_two_addr(unsigned event, unsigned long va1,
@@ -93,7 +94,7 @@ void __trace_trap_two_addr(unsigned event, unsigned long va1,
             .va2 = va2,
         };
 
-        __trace_var(event, 1, sizeof(d), &d);
+        trace_time(event, sizeof(d), &d);
     }
     else
     {
@@ -104,7 +105,7 @@ void __trace_trap_two_addr(unsigned event, unsigned long va1,
             .va2 = va2,
         };
 
-        __trace_var(event | TRC_64_FLAG, 1, sizeof(d), &d);
+        trace_time(event | TRC_64_FLAG, sizeof(d), &d);
     }
 }
 
@@ -123,7 +124,7 @@ void __trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
             .eip  = eip,
         };
 
-        __trace_var(TRC_PV_PTWR_EMULATION_PAE, 1, sizeof(d), &d);
+        trace_time(TRC_PV_PTWR_EMULATION_PAE, sizeof(d), &d);
     }
     else
     {
@@ -136,6 +137,6 @@ void __trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
             .rip  = eip,
         };
 
-        __trace_var(TRC_PV_PTWR_EMULATION | TRC_64_FLAG, 1, sizeof(d), &d);
+        trace_time(TRC_PV_PTWR_EMULATION | TRC_64_FLAG, sizeof(d), &d);
     }
 }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b3b05c2ec090..3cecfdee9518 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -483,7 +483,7 @@ static void decrease_reservation(struct memop_args *a)
             t.d = a->domain->domain_id;
             t.order = a->extent_order;
         
-            __trace_var(TRC_MEM_DECREASE_RESERVATION, 0, sizeof(t), &t);
+            trace(TRC_MEM_DECREASE_RESERVATION, sizeof(t), &t);
         }
 
         /* See if populate-on-demand wants to handle this */
diff --git a/xen/common/trace.c b/xen/common/trace.c
index c94ce1f7dc90..27c8a19f0549 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -868,7 +868,7 @@ void __trace_hypercall(uint32_t event, unsigned long op,
         break;
     }
 
-    __trace_var(event, 1, sizeof(uint32_t) * (1 + (a - d.args)), &d);
+    trace_time(event, sizeof(uint32_t) * (1 + (a - d.args)), &d);
 }
 
 /*
-- 
2.30.2


