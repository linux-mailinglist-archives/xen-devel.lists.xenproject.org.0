Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAJlCsUEl2nhtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEDE15EA1E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236219.1538964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3KP-0007Ik-G0; Thu, 19 Feb 2026 12:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236219.1538964; Thu, 19 Feb 2026 12:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3KP-0007Fe-Cy; Thu, 19 Feb 2026 12:40:21 +0000
Received: by outflank-mailman (input) for mailman id 1236219;
 Thu, 19 Feb 2026 12:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwun=AX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vt3KN-0007FF-NB
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 12:40:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 258cd1de-0d90-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 13:40:18 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so816446f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 04:40:18 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abe3b3sm55413183f8f.18.2026.02.19.04.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 04:40:16 -0800 (PST)
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
X-Inumbo-ID: 258cd1de-0d90-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771504817; x=1772109617; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/hnJGsbYECh62D+eq9NM/uLdPm+ckbQThjyfCBxx5I=;
        b=bYeM98bjpZHzjNpMfYZPkO0z2jygO2A3VOqyddyCpiOw+r5i4gjCUM0t3XMvN+JCzl
         toXR4CnMQrnF3p7vH91IS0bJ4iPnpod/d6c0GQm6BVNv7Zq/aQlLOVIYr2sk8rwkV4vl
         kKJoa6vneGql/uR87ZYG6z3WPLKEiB88WiyvHXhioRwMgsqz7R6yF+UPSIJg/paaG0Vc
         PRwkDH4pRX+A39N8kt6qgbN59i8D3Q01vpoaqNyGFFCsAZ/ZhMRDVF2bRSb8zwKkU8/1
         JLHbggJcvPGZSUU2dd+fSqssr79H5NbYhIOYGrbEAsmnvHzxqY9GF+RRMJgaYNhqyx0F
         KAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504817; x=1772109617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/hnJGsbYECh62D+eq9NM/uLdPm+ckbQThjyfCBxx5I=;
        b=POhco86qhjOkmz8A3cAh8Qe7AwFVP2MUZGrNcrf4QImTUpeAECz82AfEUMyuqp4N2U
         SKZSRvs7PT+FXO1tjkThoFv5SpmCVesrDOTJR75p12teigZ9EEuMBcVQvKuYidhESf6G
         Vxtt6+CjykGngpfsGQyiCSzuakfMgWaj5lxgdHfVFQZ3UWhWUnF413vf5yiVsZFq7vKi
         N/HcA3X00O/Zgn8cb8PZgiH2rYbn7+/yRsm+wOXFUoVn1uDWyjrg3rmXMdKOPrE37BmD
         cC1tQfp8J7AhEx7JncZbQ4JskkNOk66YxI9ymLuKueWvMo0sYZ839PZdTu1dXC8OrTBg
         RdRw==
X-Gm-Message-State: AOJu0YyZ7NbBcwFw5DotecTM9xBTC18sckC2PRbD64t0h2MDCjQgl0g+
	EmJMoBlPJPLqGAp1w+7wdHBEVREEeq0HVFOBb8gzf8QK4cBTirmwh+ANVlp2+Q==
X-Gm-Gg: AZuq6aKAF0MLdLzYaA39RDfuIbRCKcZtLeBkQaVd0KwVjXDQVLuxwfhpzzRn9xjJrhI
	cV8+Hudbhavhc5ieY7SkGzl9zVxsfWqEW8RXyEcjR2bHDRNonNHf6cVO74W/1LwHGptHY/C7nQS
	6IcddIKvdOI91XSvV9y3KZqfvjzDNdhycCD5DZBqwJNSPYvrYexqEiWL9NP6To9w0J1nk4mhf7Y
	KWibhRTr8SNAyaqy6zdqC7ZzJE9YaWV16I8Pv9BR9d9GjdwvBfp2wprpi7g3+YwRU8T43V/7BZJ
	w49YBF7IGWOfw+ywBeHPHnVzYgQUf5ND3KEyg98ci/xeKOBxixii+TFso0u4gK4cNXri+1fJdDr
	tJjpfZVYedogbkWG72ZdEQKSUeL8gG/N5YHWFe8P9Ez90WlwvCopaKCtzjZiXIdmWqZ/WKrbURB
	X9Uf58h1Ky5S+j02eVQV+mEzmFQOCBFKAZowv/KTLJyRQpUjf1q7uuHlKLO2pxlhVbmw==
X-Received: by 2002:a05:6000:601:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-43958e02bcdmr8913730f8f.21.1771504817136;
        Thu, 19 Feb 2026 04:40:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4] xen/riscv: add p2m context switch handling for VSATP and HGATP
Date: Thu, 19 Feb 2026 13:40:06 +0100
Message-ID: <5756356294dc066d835269334d0f3347fe24cec4.1771504676.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DEDE15EA1E
X-Rspamd-Action: no action

Introduce helpers to manage VS-stage and G-stage translation state during
vCPU context switches.

As VSATP and HGATP cannot be updated atomically, clear VSATP on context
switch-out to prevent speculative VS-stage translations from being associated
with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
required order.

Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
only when required (e.g. on VMID reuse or generation change).

This provides the necessary infrastructure for correct p2m context switching
on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - in p2m_handle_vmenter():
   - Drop call of flush_tlb_guest_local() as it isn't necessary.
   - use 'unsigned short' for old_vmid and new_vmid.
   - Rename local variable c to curr.
   - Update the comments inside the function.
 - Update the comment above p2m_ctxt_swithch_from() as we don't care about
   the order while *_ctxt_switch_from happens as CSR_* registers aren't being
   updated and only stored. (Only CSR_VSATP is set to 0 to prevent speculation
   when *_ctxt_switch_to() functions will be called) We only care that
   p2m_ctxt_switch_from() is called before CRSs restoring is started.
 - Update the comment inside p2m_ctxt_switch_from().
 - p2m_ctxt_switch_to() updates:
   - Update the comment above.
   - Add call of flush_tlb_guest_local() after setting of VSATP to avoid usage
     of stale translations for new vCPU.
 - Rebase on top of staging, so check_for_pcpu_work() is introduced here
   instead of vtimer patch series.
---
Changes in v3:
 - Add comment above p2m_ctxt_switch_{to, from}().
 - Code style fixes.
 - Refactor p2m_ctxt_switch_to().
 - Update the comment at the end of p2m_ctxt_switch_from().
 - Refactor the code of p2m_handle_vmenter().
---
Changes in v2:
 - Add vsatp field declaration to arch_vcpu.
 - s/p2m_ctx_switch_{from,to}/p2m_ctxt_switch_{from,to}.
 - Introduce p2m_handle_vmenter() for proper handling of VMID,
   hgatp and vsatp updates.
 - Introduce is_p2m_switch_finished and init it inisde
   p2m_ctx_switch_to() for furhter handling in p2m_handle_vmenter().
 - Code style fixes.
 - Add is_idle_vcpu() check in p2m_ctxt_switch_from().
 - use csr_swap() in p2m_ctxt_switch_from().
 - move flush_tlb_guest_local() to the end if p2m_handle_vmenter() and
   drop unnessary anymore comments.
 - Correct printk()'s arguments in p2m_handle_vmenter().
---
 xen/arch/riscv/include/asm/domain.h |   2 +
 xen/arch/riscv/include/asm/p2m.h    |   4 ++
 xen/arch/riscv/p2m.c                | 100 ++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c              |   8 +++
 4 files changed, 114 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index f78f145258d6..5aec627a7adb 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -48,6 +48,8 @@ struct arch_vcpu {
     } xen_saved_context;
 
     struct cpu_info *cpu_info;
+
+    register_t vsatp;
 };
 
 struct paging_domain {
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index f63b5dec99b1..60f27f9b347e 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -255,6 +255,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
 struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                         p2m_type_t *t);
 
+void p2m_ctxt_switch_from(struct vcpu *p);
+void p2m_ctxt_switch_to(struct vcpu *n);
+void p2m_handle_vmenter(void);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 0abeb374c110..89e5db606fc8 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1434,3 +1434,103 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
     return get_page(page, p2m->domain) ? page : NULL;
 }
+
+/*
+ * Must be called before restoring CSRs to avoid potential speculation using
+ * an incorrect set of page tables during updates of VSATP and HGATP.
+ */
+void p2m_ctxt_switch_from(struct vcpu *p)
+{
+    if ( is_idle_vcpu(p) )
+        return;
+
+    /*
+     * No mechanism is provided to atomically change vsatp and hgatp
+     * together. Hence, to prevent speculative execution causing one
+     * guest’s VS-stage translations to be cached under another guest’s
+     * VMID, world-switch code should zero vsatp, then swap hgatp, then
+     * finally write the new vsatp value what will be done in
+     * p2m_ctxt_switch_to().
+     * Note, that also HGATP update could happen in p2m_handle_vmenter().
+     */
+    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
+
+    /*
+     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
+     * or/and in p2m_handle_vmenter().
+     */
+}
+
+/*
+ * As speculation may occur at any time, an incorrect set of page tables could
+ * be used. Therefore, this function must be called only after all other guest
+ * CSRs have been restored. Otherwise, VS-stage translations could be populated
+ * using stale control state (e.g. SEPC still referring to the previous guest)
+ * while VSATP and HGATP already point to the new guest.
+ */
+void p2m_ctxt_switch_to(struct vcpu *n)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
+
+    if ( is_idle_vcpu(n) )
+        return;
+
+    csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
+    /*
+     * As VMID is unique per vCPU and just re-used here thereby there is no
+     * need for G-stage TLB flush here.
+     */
+
+    csr_write(CSR_VSATP, n->arch.vsatp);
+
+    /*
+     * Since n->arch.vsatp.ASID may equal p->arch.vsatp.ASID,
+     * flush the VS-stage TLB to prevent the new guest from
+     * using stale (not belongs to it) translations.
+     * ASID equality is not the only potential issue here.
+     *
+     * TODO: This could be optimized by making the flush
+     *       conditional.
+     */
+    flush_tlb_guest_local();
+}
+
+void p2m_handle_vmenter(void)
+{
+    struct vcpu *curr = current;
+    struct p2m_domain *p2m = p2m_get_hostp2m(curr->domain);
+    struct vcpu_vmid *p_vmid = &curr->arch.vmid;
+    unsigned short old_vmid, new_vmid;
+    bool need_flush;
+
+    BUG_ON(is_idle_vcpu(curr));
+
+    old_vmid = p_vmid->vmid;
+    need_flush = vmid_handle_vmenter(p_vmid);
+    new_vmid = p_vmid->vmid;
+
+#ifdef P2M_DEBUG
+    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
+           curr, old_vmid, new_vmid, need_flush);
+#endif
+
+    /*
+     * There is no need to set VSATP to 0 to stop speculation before updating
+     * HGATP, as VSATP is not modified here.
+     */
+    if ( old_vmid != new_vmid )
+        csr_write(CSR_HGATP, construct_hgatp(p2m, p_vmid->vmid));
+
+    /*
+     * There is also no need to flush G-stage TLB unconditionally as old VMID
+     * won't be reused until need_flush is set to true.
+     */
+    if ( unlikely(need_flush) )
+        local_hfence_gvma_all();
+
+    /*
+     * There is also no need to flush the VS-stage TLB: even if speculation
+     * occurs (VSATP + old HGATP were used), it will use the old VMID, which
+     * won't be reused until need_flush is set to true.
+     */
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index c81a4f79a0d2..9fca941526f6 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -169,6 +169,11 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+static void check_for_pcpu_work(void)
+{
+    p2m_handle_vmenter();
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -222,6 +227,9 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         do_unexpected_trap(cpu_regs);
         break;
     }
+
+    if ( cpu_regs->hstatus & HSTATUS_SPV )
+        check_for_pcpu_work();
 }
 
 void vcpu_show_execution_state(struct vcpu *v)
-- 
2.53.0


