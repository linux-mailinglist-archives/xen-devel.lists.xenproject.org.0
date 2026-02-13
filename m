Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK0UBGtTj2lUQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C761383A5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231444.1536645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwAx-0006dB-EU; Fri, 13 Feb 2026 16:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231444.1536645; Fri, 13 Feb 2026 16:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwAx-0006a7-B3; Fri, 13 Feb 2026 16:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1231444;
 Fri, 13 Feb 2026 16:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw3M-0005Wn-8K
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:30:00 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ccbb68f-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso6978215e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:58 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0deeasm189438325e9.12.2026.02.13.08.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:57 -0800 (PST)
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
X-Inumbo-ID: 3ccbb68f-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000198; x=1771604998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLmM/PlB9z/B4eiJQnmz92BO4QQBKRzX8FQ6b7JAWPA=;
        b=Xrkn4xyLvNsIQUXyAWxYn6dNTJEDMZRecE94YrQ6VZTIaViCcsoA36HD0q6tjz/zWh
         9+BaIUOd1PghNoZzNq2JZsp+/Mnc9vC3aMohslBZxZwPqhPEY5AUlCxVwPvEmCWHhtAh
         DCTHbC5+5N6itV6aoau3SzqR3z9LPaKIePkSKs1jJ5Cj/PBWM8WJ29l2f0oY+k6+jLvn
         dUrsUvTAEH5NP+qULOX+2sYEBUkobCh11lsIloUg7e+noz174mQGNVF5PieRle1Fd0px
         Db7LuDNEZddCGUtpLdQHZzfmMzsSa6vh2+EpAE6vM7uYK5F38ePWJADaDon8jWM3dJW7
         VcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000198; x=1771604998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLmM/PlB9z/B4eiJQnmz92BO4QQBKRzX8FQ6b7JAWPA=;
        b=PW5xqTZ7VE8Xrenmp45VurPvXVxuykWiK0U3LXqEC91R1hoAvo33b3sgYU21x/kJzZ
         +7G4C+0tZpaSHNCP//D/iSn+iPFCqMHJHzNimL8xQLoKMyXcGwk7UQ7dGU8mreSAcab6
         bnidy4I1HezMnMXCch/BktPWSibifDwg9zA2B5g4Kd332QwJB6hpUo23z5gLsK/md1S1
         Fz8fnuYpk0TEVKOUpIP0jWpnUIPeE5Ht5QFNrG8JKu6Yb4z/ch6kqT/hBfo/ZUZ6FFoG
         VZmTAQEA7hPh8wvu2CEFLjhk5T7427E1GS9cRbKOffkEEn+ByK4m6wjJTRAX16z/S6xg
         5ahw==
X-Gm-Message-State: AOJu0Yx/2hQA3A6GsIPV2+gyAIKt8Hv/cZTHA26tkdYxE9lGVoFsb0e2
	fxQD5R+im5rpc0gjvOYp6FSSVHccryh753bDrv703jWFcJqyZ+8JFaHzp0jccei9
X-Gm-Gg: AZuq6aI8t2GneaaOElB2oR95JAI518wKyp7qX5TGusY0lpNHq0OvumTaegugRpL9bHE
	kM65LoRf8qvaOQ26mx1rwrFDsa45got1hIeWPM4831OvI109eZ9Fyi5X7f51vzsM3rAn07qputi
	GaYn6d+rF31PUUG4Y1rP+o2Z96uINaJxhLEwzmxrgZTq9AEQQuGBtmiEmfG7tTgNHK/EetE3jLx
	pZXZsldktYFxY1wV1i9HsbwXIK+L9x26Q2CGz3nSNTx2UKhA5ktGCPcOubnl6HndK5tBx9KuVZS
	u4LZQDVJkGSSloQZWL/95WHJZvTO3cYwP13AEBAjXBEQVCusniOfRsnj/bPk68MzHHVBs6/kAgl
	uLIYvqEqt7IghP+8nXyA0WEtYsg1sgqiIzaB0Onp6tyRGmLCgyTuroZ7ktMGVQWcWNJDin0MIM3
	/BHBZ/84qdm3141FuxdDcUSCjdPwQfW02c2ON3uBTkCZC/o4zIIu81hYMI+5PfVSm0tLOM5JkiP
	faU
X-Received: by 2002:a05:600c:8285:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-48378daa075mr11488265e9.16.1771000197631;
        Fri, 13 Feb 2026 08:29:57 -0800 (PST)
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
Subject: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP and HGATP
Date: Fri, 13 Feb 2026 17:29:45 +0100
Message-ID: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: 82C761383A5
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
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/include/asm/p2m.h    |  4 ++
 xen/arch/riscv/p2m.c                | 79 +++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c              |  2 +
 4 files changed, 86 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 3da2387cb197..42bb678fcbf9 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -59,6 +59,7 @@ struct arch_vcpu {
     register_t hstateen0;
     register_t hvip;
 
+    register_t vsatp;
     register_t vsie;
 
     /*
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
index 0abeb374c110..7ae854707174 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
     return get_page(page, p2m->domain) ? page : NULL;
 }
+
+/* Should be called before other CSRs are stored to avoid speculation */
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
+     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
+     * or/and in p2m_handle_vmenter().
+     */
+}
+
+/* Should be called after other CSRs are restored to avoid speculation */
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
+    /*
+     * As at the start of context switch VSATP were set to 0, so no speculation
+     * could happen thereby there is no need for VS TLB flush here.
+     */
+}
+
+void p2m_handle_vmenter(void)
+{
+    struct vcpu *c = current;
+    struct p2m_domain *p2m = p2m_get_hostp2m(c->domain);
+    struct vcpu_vmid *p_vmid = &c->arch.vmid;
+    uint16_t old_vmid, new_vmid;
+    bool need_flush;
+
+    BUG_ON(is_idle_vcpu(current));
+
+    old_vmid = p_vmid->vmid;
+    need_flush = vmid_handle_vmenter(p_vmid);
+    new_vmid = p_vmid->vmid;
+
+#ifdef P2M_DEBUG
+    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
+           c, old_vmid, new_vmid, need_flush);
+#endif
+
+    if ( old_vmid != new_vmid )
+        csr_write(CSR_HGATP, construct_hgatp(p2m, p_vmid->vmid));
+
+    if ( unlikely(need_flush) )
+    {
+        local_hfence_gvma_all();
+        flush_tlb_guest_local();
+    }
+
+    /*
+     * There is no need to set VSATP to 0 to stop speculation before updating
+     * HGATP, as VSATP is not modified here. There is also no need to flush
+     * the VS-stage TLB: even if speculation occurs, it will use the old VMID,
+     * which will not be reused until need_flush is set to true.
+     */
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ce8d346a14d2..7ef089809734 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -177,6 +177,8 @@ static void check_for_pcpu_work(void)
     vcpu_sync_interrupts(c);
 
     vcpu_flush_interrupts(c);
+
+    p2m_handle_vmenter();
 }
 
 static void timer_interrupt(void)
-- 
2.52.0


