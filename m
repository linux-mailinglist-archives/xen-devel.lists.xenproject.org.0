Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHwrBbZei2msUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA211D522
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226686.1533207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjR-0001MK-IW; Tue, 10 Feb 2026 16:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226686.1533207; Tue, 10 Feb 2026 16:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjR-0001I3-D7; Tue, 10 Feb 2026 16:36:57 +0000
Received: by outflank-mailman (input) for mailman id 1226686;
 Tue, 10 Feb 2026 16:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUYk=AO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpqjQ-00012i-IX
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:36:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5af66a5-069e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:36:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso55972545e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:36:54 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm64803255e9.4.2026.02.10.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:36:53 -0800 (PST)
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
X-Inumbo-ID: b5af66a5-069e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741414; x=1771346214; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjEc9mDWav/qoIa1ZW+EtUPB2mySUlmztw5R2P/dXKI=;
        b=OZjnZeza4HclH6dSK8itrSbvark5ZCYAJEJJOxF7lZv12mum2VdoesyoGR0vy4Wgwg
         cCBAr118XDvw7oHFIJaEjmRBX2QWxg9zabHyfqmz1adxB9W0/AYZkCIZIWbDGA/OCCAd
         90nGEhe/BY9Lf3oDYKYNucJkCjuDshzaBLPT7dltyNmTKKqGnr99rd21Cx1QLTKgyv2/
         3B5W2VHXDEpoFJ+hBduntz5n7QBgTG0Ekmt5d340Ggf24Rt5t9WdlXB0rG2cwE/R8HFv
         6mhvehcZoWxOFPA659wN4SXbf4VsjzjW8xDOVWdCzd8cl+pTkcLX+fdyYNoR8Q+nqwTr
         UZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741414; x=1771346214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjEc9mDWav/qoIa1ZW+EtUPB2mySUlmztw5R2P/dXKI=;
        b=m5EVdcLIa+FI5rmVct/35lM3h1/n5A3wd4N9TqIDb0OzT9k2s/9GiCcavnPLi7AMPb
         5u1G1Sdcr+4zQUDXDFv3pX89X329gGqzWFS1FeOVwJss4gU9h8cQcasnLMtM1eDYPRAd
         u2OrXaileiqApFalb9J0kl8hZ7CyQbwiOztvyY6qgPmlBC+n5IFSzT7sdan5TZqQdGu9
         bUxmJO/cNLQPb6hNpavT0ZDhnPHuOCbU6k2vem9h+AHi7RmS5kLuj9kz4dMETJFSONN2
         DMwYimlvZBzaFRX+rMG8A+S02GJPJ/LYR3WIBLQi5z8vfzY9dAyC4gB6vHelPR5WFsZF
         4sXA==
X-Gm-Message-State: AOJu0YypVuxhTOOLSobodaeMW3D4ycrtC+p7b22BpBv4P6kbNHyD/0Jw
	tQXW3kAg+WJTWs3EJHHsXKb/HWeZLzhrLucmg/tjx8yPPjlGEK8R+QfpsirXjK6l
X-Gm-Gg: AZuq6aIARFjmvZX/iL/5sjAWDrMPjSCQhcR3/xz4kT+KReXHeCs0AVSpMGPIGerH4Le
	J5rtV+ak8oPA5X8b9pQdLw3DVc41DQMxFn/djYaSTXQGiGl9/8DPMyqeNK9SpmWMAMgOZ5NxR1B
	e54iZa3jIhvbl6otFHt+rNR5JwXbBIiU26JLDHKPOAWrFjbzLFQZOKgqbCaQqwGFOJGUUTpsDyV
	9Rz9tMYvR+Ck9e4xEWNfQ4FlCEWHeosxu/MyF/ecbaWaeokvO1f48y5EHQJJzyZfpRmew2r2LGf
	fNdSu8ze6GuIhSxY5WR9QNuG+p3FBgDt8nOlZNHZIpouATJDfdvk6PVqxdUHew+iTaYzBIp+URJ
	0tCBUpILP/ULvh3K2gLIIz1/duhYYvbH2skqCpB2jfoAXtG1F2ewqAS6IIcFn5m8P8VvlTN81yR
	jL5/Tco4ar5764BqeoxqdukG4usVHAi3Ttrab3G+06GRGTXyyAaPKBx4RDHw17uWQUb0wCgQ==
X-Received: by 2002:a05:600c:a59b:b0:471:793:e795 with SMTP id 5b1f17b1804b1-4834f38ff19mr24116555e9.0.1770741413865;
        Tue, 10 Feb 2026 08:36:53 -0800 (PST)
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
Subject: [PATCH v2 2/2] xen/riscv: add p2m context switch handling for VSATP and HGATP
Date: Tue, 10 Feb 2026 17:36:41 +0100
Message-ID: <0e6f450d64ce17f504d73c3429c8e8a9ced0cf06.1770739000.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770739000.git.oleksii.kurochko@gmail.com>
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B4DA211D522
X-Rspamd-Action: no action

Add helpers to safely update VS-stage and G-stage translation registers
during vCPU context switches.

Because VSATP and HGATP cannot be updated atomically, VSATP is cleared on
switch-out to prevent speculative VS-stage translations being cached under
an incorrect VMID. On VM entry, HGATP is reconstructed, VMID handling is
performed, and VSATP is restored.

This provides the necessary infrastructure for correct p2m context
switching on RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/domain.h |   1 +
 xen/arch/riscv/include/asm/p2m.h    |  11 +++
 xen/arch/riscv/p2m.c                | 123 ++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c              |   2 +
 4 files changed, 137 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index b5a8a9f711ac..c029e50b96fe 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -59,6 +59,7 @@ struct arch_vcpu {
     register_t hstateen0;
     register_t hvip;
 
+    register_t vsatp;
     register_t vsie;
 
     /*
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index f63b5dec99b1..0cdd3dc44683 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -90,6 +90,13 @@ struct p2m_domain {
      */
     bool clean_dcache;
 
+    /*
+     * Inidicate that context switch is fully finished. It is needed to
+     * detect in p2m_handle_vmenter() to undestand what to write to
+     * CSR_VSATP register.
+     */
+    bool is_ctxt_switch_finished;
+
     /* Highest guest frame that's ever been mapped in the p2m */
     gfn_t max_mapped_gfn;
 
@@ -255,6 +262,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
 struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                         p2m_type_t *t);
 
+void p2m_ctxt_switch_from(struct vcpu *p);
+void p2m_ctxt_switch_to(struct vcpu *n);
+void p2m_handle_vmenter(void);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 0abeb374c110..275c38020ae2 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
     return get_page(page, p2m->domain) ? page : NULL;
 }
+
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
+     * p2m_handle_vmenter().
+     */
+    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
+
+    /*
+     * Nothing to do with HGATP as it is constructed each time when
+     * p2m_handle_vmenter() is called.
+     */
+}
+
+void p2m_ctxt_switch_to(struct vcpu *n)
+{
+    if ( is_idle_vcpu(n) )
+        return;
+
+    n->domain->arch.p2m.is_ctxt_switch_finished = false;
+
+    /*
+     * Nothing to do with HGATP or VSATP, they will be set in
+     * p2_handle_vmenter()
+     */
+}
+
+void p2m_handle_vmenter(void)
+{
+    struct p2m_domain *p2m = &current->domain->arch.p2m;
+    struct vcpu_vmid *p_vmid = &current->arch.vmid;
+    uint16_t old_vmid, new_vmid;
+    bool need_flush;
+    register_t vsatp_old = 0;
+
+    BUG_ON(is_idle_vcpu(current));
+
+    /*
+     * No mechanism is provided to atomically change vsatp and hgatp
+     * together. Hence, to prevent speculative execution causing one
+     * guest’s VS-stage translations to be cached under another guest’s
+     * VMID, world-switch code should zero vsatp, then swap hgatp, then
+     * finally write the new vsatp value
+     *
+     * CSR_VSATP is already set to 0 in p2m_ctxt_switch_from() in the
+     * case when n->arch.is_p2m_switch_finished = false. Also, there is
+     * BUG_ON() below to verify that.
+     */
+    if ( p2m->is_ctxt_switch_finished )
+        vsatp_old = csr_swap(CSR_VSATP, 0);
+
+    old_vmid = p_vmid->vmid;
+    need_flush = vmid_handle_vmenter(p_vmid);
+    new_vmid = p_vmid->vmid;
+
+#ifdef P2M_DEBUG
+    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
+           current, old_vmid, new_vmid, need_flush);
+#endif
+
+    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
+              new_vmid));
+
+    if ( unlikely(need_flush) )
+        local_hfence_gvma_all();
+
+    if ( p2m->is_ctxt_switch_finished )
+        csr_swap(CSR_VSATP, vsatp_old);
+        /*
+         * We are not coming from a context switch here, so the VSATP value is
+         * the same as it was before csr_swap() was executed at the start of
+         * this function. Since VSATP was set to 0, no speculation could occur,
+         * and the VS-stage TLB cannot be polluted.
+         * Therefore, no additional VS TLB flush is required.
+         */
+    else
+    {
+        vsatp_old = csr_swap(CSR_VSATP, current->arch.vsatp);
+
+        /*
+         * vsatp_old should be zero as in the case of context switch it was
+         * set to 0 in p2m_ctxt_switch_from().
+         */
+        BUG_ON(vsatp_old);
+
+        p2m->is_ctxt_switch_finished = true;
+
+        /*
+         * TODO: further investigation is needed here.
+         *
+         *       In my opinion, a VS-stage TLB flush is not always strictly
+         *       necessary.
+         *       If a context switch occurs and VSATP is set to 0 before any
+         *       context-switch-related operations begin, no speculation can
+         *       occur. Therefore, at the time this function executes, the
+         *       VS-stage TLB should not be polluted with incorrect entries
+         *       belonging to a previously running vCPU. Another one reason is
+         *       that about SATP register is mentioned the following in RISC-V
+         *       spec:
+         *         Changing satp.MODE from Bare to other modes and vice versa
+         *         also takes effect immediately, without the need to execute
+         *         an SFENCE.VMA instruction. Likewise, changes to satp.ASID
+         *         take effect immediately.
+         *       I expect the same for VSATP (as it is VS copy of SATP) but it
+         *       isn't mentioned explicitly in the spec.
+         *
+         *       The only case where a VS-stage TLB flush seems necessary is
+         *       when the VASID remains unchanged but VSATP is updated to point
+         *       to a different VS page table. In that case, flushing
+         *       guarantees that the guest observes a clean context switch
+         *       without any possibility of using stale TLB entries.
+         */
+        flush_tlb_guest_local();
+    }
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e8d9ca902d9c..d6543eac1390 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -175,6 +175,8 @@ static void check_for_pcpu_work(void)
     vcpu_sync_interrupts(current);
 
     vcpu_flush_interrupts(current);
+
+    p2m_handle_vmenter();
 }
 
 static void timer_interrupt(void)
-- 
2.52.0


