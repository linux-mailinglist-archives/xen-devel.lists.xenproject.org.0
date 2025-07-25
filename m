Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65691B12096
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058065.1425811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK15-0004Vc-GU; Fri, 25 Jul 2025 15:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058065.1425811; Fri, 25 Jul 2025 15:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK15-0004Ol-3v; Fri, 25 Jul 2025 15:07:23 +0000
Received: by outflank-mailman (input) for mailman id 1058065;
 Fri, 25 Jul 2025 15:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK12-0002MQ-UY
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f0b6679-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:19 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so4925254a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:19 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:18 -0700 (PDT)
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
X-Inumbo-ID: 0f0b6679-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456039; x=1754060839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYnUasTV+zm9xSwC+rnNPtEif5Y37T5yyWBhUxrNmT8=;
        b=Cu2wZGheDi6f4FMrEZ/V37AauQOumI62Ave2fXouj04woWNDej8K5NpN4n2v6ExEr0
         hq4goRgAAcgu/dj7xJG1opTC6+wG45iu/Oy8jvNYx9Y3ASVDcsyn3bh+gSEqtkk9Tf+4
         GITw9xrUXwOeECpUNU58nkntVqWhyjyxCLAQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456039; x=1754060839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYnUasTV+zm9xSwC+rnNPtEif5Y37T5yyWBhUxrNmT8=;
        b=bAoNxvl0D1GeFpq7UKz80vNU5d+zZoA/cnAuhENuaaVvrwLcaassRknb/xnUa43/xa
         eQ/l8TcbxRH198hgd0IAei3ZbzoWfkGeRztpSCFTXMAkb2agC5UlglEIGIU6ffHNBh/U
         whvb6/ZiJfe1390DOF35RFMX/jVn/OyPeosZEdt1dsLE0nN7dTiVYzaVRKrlp9TTfOLp
         QN/AGiDJSH7nA0Qr1fL/T8acEcDCoT2gGpEhu9dtJROSVkiQGfgXG9UdtmgQrpX4ErXo
         hLk6k1aiGyo2lvEQIoZD7qjInQIuFCdEIgEe41DdkPGviU36i+/givxfHYWOZHkq8G+p
         Mj3w==
X-Gm-Message-State: AOJu0Ywu+I8O/JrGghMpCuD/TUte4TbZx3+PaYa4lWMcAkaD13673wvo
	VsEz0uOEZpP0ye0ZY/D1IdJzlw6ag9iW7BP679eGJVayTBKfnHVxU0a1S7em31s1og5mFDpKSst
	cUUhzfoA=
X-Gm-Gg: ASbGnctE3MfD8BB7tbx3TR+lTJ+VVVqR/uONTZrvJgqWJxU35TNB79bs8XlCAkHnyiy
	icIQatyACzpU3H5JFxLiKpnSdaSIyHT2oVU08uJZKpf8ZCLuNGHXmCIU3MizLHCWSpBRLMOwKgF
	aOdWkegK6c80LB8S1Vy6iXZKDjkRSMtzxptnJwv30EP0JI7yxvv7SAhpqOJS4b9HzXbndATNSOJ
	ZqfbAADHF5519+CKlz8NZ06lorHFul519+nMtj5zkMCeRP9wFxIlWahjXiErbu5z4HKqe0dpuvt
	9M0dcPA++cIBYWnva9aYGSB9YTJzWqLprl52kjR8DtidIrU0/FB/9EhyQbqStDB4AyGwYwE+a1O
	eoi0S8CqS1ioYx8Kw6E/VEacOONMZswv3QdFvcKpDGk/l6gM=
X-Google-Smtp-Source: AGHT+IF0fD1fZ1Kqp6yAx992EiFvQyLihF4nuLIh9Le7Zvu5Ge5vBP/ssk+x4md1HyxOI5uZpm+i9A==
X-Received: by 2002:a50:a44b:0:b0:60c:3ecd:5140 with SMTP id 4fb4d7f45d1cf-614d130ccc0mr4264934a12.0.1753456038794;
        Fri, 25 Jul 2025 08:07:18 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 09/10] vpmu.c hypervisor stacktrace support in vPMU
Date: Fri, 25 Jul 2025 16:06:45 +0100
Message-ID: <385774cdae27518e9f8e907e3e8b0c64ee701735.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/arch/x86/cpu/vpmu.c | 53 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 770f63f95a..ad02ab9dd8 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -160,9 +160,51 @@ static inline struct vcpu *choose_hwdom_vcpu(void)
     return hardware_domain->vcpu[idx];
 }
 
+static inline void vpmu_hypervisor_stacktrace(struct xen_pmu_hv_stacktrace *xenpmu_stack, uint64_t rsp, uint64_t rbp)
+{
+#ifdef CONFIG_FRAME_POINTER
+    /* Based on _show_trace in ../traps.c,
+     * TODO: there should be an iterator to share this code
+     * */
+    unsigned long *frame, addr;
+    uint64_t low = rsp, high = get_stack_trace_bottom(rsp), next = rbp;
+
+    while(xenpmu_stack->stacktrace_nr < sizeof(xenpmu_stack->stacktrace) / sizeof(xenpmu_stack->stacktrace[0])) {
+        /* Valid frame pointer? */
+        if ( (next < low) || (next >= high) )
+        {
+            /*
+             * Exception stack frames have a different layout, denoted by an
+             * inverted frame pointer.
+             */
+            next = ~next;
+            if ( (next < low) || (next >= high) )
+                break;
+            frame = (unsigned long *)next;
+            next  = frame[0];
+            addr  = frame[(offsetof(struct cpu_user_regs, rip) -
+                           offsetof(struct cpu_user_regs, rbp))
+                         / BYTES_PER_LONG];
+        }
+        else
+        {
+            /* Ordinary stack frame. */
+            frame = (unsigned long *)next;
+            next  = frame[0];
+            addr  = frame[1];
+        }
+
+        xenpmu_stack->stacktrace[PMU_MAX_STACKTRACE - 1 - xenpmu_stack->stacktrace_nr++] = addr;
+
+        low = (unsigned long)&frame[2];
+    }
+#endif
+}
+
 static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t *flags,
                                      struct vcpu *sampled,
-                                     const struct cpu_user_regs *cur_regs) {
+                                     const struct cpu_user_regs *cur_regs)
+{
   r->ip = cur_regs->rip;
   r->sp = cur_regs->rsp;
   r->flags = cur_regs->rflags;
@@ -246,6 +288,7 @@ void vpmu_do_interrupt(void)
 
             /* avoid stale values when domid != DOMID_XEN */
             vpmu->xenpmu_hv_stacktrace->guest.r.regs.ip = 0;
+            vpmu->xenpmu_hv_stacktrace->stacktrace_nr = 0;
         }
 
         /* Store appropriate registers in xenpmu_data */
@@ -287,6 +330,11 @@ void vpmu_do_interrupt(void)
                 {
                     vpmu_convert_regs(&vpmu->xenpmu_hv_stacktrace->guest.r.regs,
                                       NULL, sampled, guest_cpu_user_regs());
+
+                    /* can only call this when domid == DOMID_XEN */
+                    if (vpmu_features & XENPMU_FEATURE_HV_STACKTRACE)
+                      vpmu_hypervisor_stacktrace(vpmu->xenpmu_hv_stacktrace,
+                                                 regs->rsp, regs->rbp);
                 }
                 domid = DOMID_XEN;
             }
@@ -747,7 +795,8 @@ long do_xenpmu_op(
     case XENPMU_feature_set:
         if ( pmu_params.val & ~(XENPMU_FEATURE_INTEL_BTS |
                                 XENPMU_FEATURE_IPC_ONLY |
-                                XENPMU_FEATURE_ARCH_ONLY))
+                                XENPMU_FEATURE_ARCH_ONLY |
+                                XENPMU_FEATURE_HV_STACKTRACE))
             return -EINVAL;
 
         spin_lock(&vpmu_lock);
-- 
2.47.1


