Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNYlC05SsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1B2555F0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250520.1548020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iR-0003LE-Vq; Tue, 10 Mar 2026 17:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250520.1548020; Tue, 10 Mar 2026 17:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iR-0003J6-Qu; Tue, 10 Mar 2026 17:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1250520;
 Tue, 10 Mar 2026 17:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aM-0001Q4-HC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e86f8024-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so30678765e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:33 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:31 -0700 (PDT)
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
X-Inumbo-ID: e86f8024-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162572; x=1773767372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dla2ZfjKuAdtGf39njgNy8xyCVJufRaAAQSeRsdKKdA=;
        b=RIb/tv4cYnIPfFle98vInh+ohr451UXDC/EyxAOwEMmzdq2mKFZeiAqiXpHz1I7l5A
         N4T/ncLVrATIdFPF+KY6pzb0aYbWzoe6GaXioto//Ofiv9AP5M/Fk+lpfIZRx46l1OXO
         /Jb36T0qPXvwryMlZc5z1yb4Ol2uJ+IQZxHdWccwVL5jCaO2INmKkLTJhzBkAJB+ziHF
         6w4vWW7qgN4uceQ86Zc5/8CAXWrgXNzmXdXmB7cZgHR/TaAJd8GpozNgbe98GrtyiQOW
         LQ3+YKnewLEGxXBx2q47yL5AqX16ohdT5T5cGS+AWOw7UhnbNCkmzp0N9gE8vFUOj/rt
         1EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162572; x=1773767372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dla2ZfjKuAdtGf39njgNy8xyCVJufRaAAQSeRsdKKdA=;
        b=lRN+lRlSQ67kytKB7gVJSz/Tx4zZCawruhHr6LgV0t1uSsMtVKu+OByQRA9FOy+To+
         EorKqrA2rbPGTKJ/pqIBoHzSLVxURsjpAvBPkYTpQhLg5JbUqnTRm3SUxRopYMbxo3dz
         JqlUp01WJEfMqxSzdn+ggsge90JJ2yBnQkP0xenUWHCe2avRpgv/s0PqgZYwoazORlBA
         YUhqF57NyJHDbkW3Svgw8rpsCyqIDN09yXlYCfeDyMRojGXhoWIWzJEkmKbw7FmstwwM
         GKwlU37rs1YCZWh8j58npqM6jYGxNgk9u7p1HuW1ETmMaafF+iEcVNNbnmNxNAxJUJkY
         DzSw==
X-Gm-Message-State: AOJu0YxYNN4ctG4lCMHCbzmJp3aEyvA9Ky+iu67+G+qG3+qvR2Ib9zl5
	xzVrng4Qf5kVAAvXgyj8+HPM8S/6JaRKlUkr98De8nAKhAcctt6PdPefMRIRNMMh
X-Gm-Gg: ATEYQzy2J2cgC/xJ68DXEViZb6l6TESe3/fjBpj/y+JAJ6j2Rjm8ByZ5ux8Gif8KoX+
	XtwDb1LOZcnz5agsb87JAJso1CEe13YOCJtWxH48j74sbAQKS39LxGlP9/3uMM27g7eQUW2h6XR
	lPNBhGgxVdR1R0fRdVy736D0nzDZbVi2yJ7f7a4bxeSm6mj/beHLSr1wSO6V0Mf9xzuIBraJGo+
	DbAyrDUoN3mZde4ltqrYaGu2oLK74rim8fRh2hDYSdb2ptjWROUZCqqLcLsbGQeU+X6ghonlSUL
	XJk9EKGPI5zQkgPlfVFwqj6pCwgyIStoy03ySFguhlyqHVECarzliRS+/g17FNNGXsWmhvZitSs
	dhHtqXgRzGYamh+GYVjXZGTbosvTieldk3d1Dt29V8mrAoPV4rEx3mEa9gnoQPX6Vvn3qhlhq35
	sfR9WHQBPx06QGRuuYTbSEbMiN0AM2mTfH+URL36i6O9LtwNInu8oOchFXqEX0gC1obg==
X-Received: by 2002:a05:600c:46c4:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-485304a5a00mr211584565e9.4.1773162571955;
        Tue, 10 Mar 2026 10:09:31 -0700 (PDT)
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
Subject: [PATCH v1 19/27] xen/riscv: emulate guest writes to virtual APLIC MMIO
Date: Tue, 10 Mar 2026 18:08:52 +0100
Message-ID: <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9AC1B2555F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,microchip.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

RISC-V guests program interrupt routing by writing to APLIC registers.
When APLIC is virtualised, Xen must intercept these MMIO writes and
translate them into updates of the virtual interrupt controller state.

Introduce vaplic_emulate_store() to validate guest APLIC accesses and
apply only those changes that are permitted by the domain’s authorised
interrupt bitmap. Writes targeting unauthorised interrupts are ignored,
ensuring that guests cannot affect interrupts they do not own.

APLIC TARGET writes are rewritten to reflect the effective interrupt
delivery configuration, depending on whether the domain operates in
direct (isn't supported by Xen) or MSI mode. This ensures that
guest-visible routing requests are correctly mapped onto the underlying
virtual interrupt topology.

Unexpected or unsupported register accesses are treated as fatal, as
they indicate a emulation bug.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/intc.h |   4 +
 xen/arch/riscv/vaplic.c           | 169 ++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index e6b6c179415a..92a74eede4a0 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -56,6 +56,10 @@ struct vintc_ops {
     /* Initialize some vINTC-related stuff for a vCPU */
     int (*vcpu_init)(struct vcpu *vcpu);
 
+    /* Emulate store to virtual interrupt controller MMIOs */
+    int (*emulate_store)(const struct vcpu *vcpu, unsigned long addr,
+                         uint32_t in);
+
     /* Check if a register is virtual interrupt controller MMIO */
     int (*is_access)(const struct vcpu *vcpu, const unsigned long addr);
 
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 82e74a609ee6..5540b4884179 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -20,6 +20,16 @@
 
 #include "aplic-priv.h"
 
+#define APLIC_REG_GET(addr, offset) \
+    readl((void *)((vaddr_t)(addr) + offset))
+#define APLIC_REG_SET(addr, offset, value) \
+    writel(value, (void *)((vaddr_t)(addr) + offset))
+
+#define AUTH_IRQ_BIT(irqnum) (auth_irq_bmp[(irqnum) / APLIC_NUM_REGS] & \
+                              BIT((irqnum) % APLIC_NUM_REGS, U))
+
+#define regval_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
+
 struct vaplic_priv {
     /* Contains a legal interrupts for a domain */
     uint32_t auth_irq_bmp[APLIC_NUM_REGS];
@@ -127,6 +137,164 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
     return 0;
 }
 
+static void vaplic_dm_update_target(const unsigned long hart_id, uint32_t *iprio)
+{
+    *iprio &= APLIC_TARGET_IPRIO_MASK;
+    *iprio |= (hart_id << APLIC_TARGET_HART_IDX_SHIFT);
+}
+
+static void vaplic_update_target(const struct imsic_config *imsic,
+                                 const int guest_id,
+                                 const unsigned long hart_id, uint32_t *value)
+{
+    unsigned long group_index;
+    unsigned int hhxw = imsic->group_index_bits;
+    unsigned int lhxw = imsic->hart_index_bits;
+    unsigned int hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
+
+    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
+
+    *value &= APLIC_TARGET_EIID_MASK;
+    *value |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
+    *value |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
+    *value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
+}
+
+#define CALC_REG_VALUE(base) \
+{ \
+    uint32_t index; \
+    uint32_t tmp_val; \
+    index = regval_to_irqn(offset - base); \
+    tmp_val = APLIC_REG_GET(priv->regs, aplic_addr) & ~auth_irq_bmp[index]; \
+    value &= auth_irq_bmp[index]; \
+    value |= tmp_val; \
+}
+
+static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
+                                         unsigned long addr, uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
+    struct aplic_priv *priv = vaplic->base.info->private;
+    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;
+    unsigned long aplic_addr = addr - priv->paddr_start;
+    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
+
+    switch ( offset )
+    {
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+        CALC_REG_VALUE(APLIC_SETIP_BASE);
+        break;
+
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+        CALC_REG_VALUE(APLIC_CLRIP_BASE);
+        break;
+
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        CALC_REG_VALUE(APLIC_SETIE_BASE);
+        break;
+
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+        CALC_REG_VALUE(APLIC_CLRIE_BASE);
+        break;
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        /* We don't suppert delagation, so bit10 if sourcecfg should be 0 */
+        ASSERT(!(value & BIT(10, U)));
+
+        /*
+         * As sourcecfg register starts from 1:
+         *   0x0000 domaincfg
+         *   0x0004 sourcecfg[1]
+         *   0x0008 sourcecfg[2]
+         *    ...
+         *   0x0FFC sourcecfg[1023]
+         * It is necessary to calculate an interrupt number by substracting
+         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
+         */
+        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
+            /* interrupt not enabled, ignore it */
+            return 0;
+
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+        struct vcpu *target_vcpu = NULL;
+
+        /*
+         * Look at vaplic_emulate_load() for explanation why
+         * APLIC_GENMSI is substracted.
+         */
+        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
+            /* interrupt not enabled, ignore it */
+            return 0;
+
+        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )
+        {
+            struct vcpu *v = vcpu->domain->vcpu[i];
+
+            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
+            {
+                target_vcpu = v;
+                break;
+            }
+        }
+
+        ASSERT(target_vcpu);
+
+        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
+        {
+            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
+                                    &value);
+        }
+        else
+            vaplic_update_target(priv->imsic_cfg,
+                                 vcpu_guest_file_id(target_vcpu),
+                                 cpuid_to_hartid(target_vcpu->processor),
+                                 &value);
+
+        break;
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+        if ( AUTH_IRQ_BIT(value) )
+            break;
+
+        return 0;
+
+    case APLIC_DOMAINCFG:
+        /*
+         * TODO:
+         * The domaincfg register has this format:
+         * bits 31:24 read-only 0x80
+         * bit 8      IE
+         * bit 7      read-only 0
+         * bit 2      DM (WARL)
+         * bit 0      BE (WARL)
+         *
+         * The most interesting bit for us is IE(Interrupt Enable) bit.
+         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
+         * disable interrupts globally, but if one day someone will use it
+         * then extra actions should be done.
+         */
+
+        printk_once("%s: Nothing to do, domaincfg is set by aplic during "
+                    "initialization in Xen\n", __func__);
+
+        return 0;
+
+    default:
+        panic("%s: unsupported register offset: %#x\n", __func__, offset);
+    }
+
+    APLIC_REG_SET(priv->regs, aplic_addr, value);
+
+    return 0;
+}
+
 static int cf_check vaplic_is_access(const struct vcpu *vcpu,
                                      const unsigned long addr)
 {
@@ -158,6 +326,7 @@ static const struct vintc_ops vaplic_ops = {
     .vcpu_init = vcpu_vaplic_init,
     .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
     .is_access = vaplic_is_access,
+    .emulate_store = vaplic_emulate_store,
 };
 
 static struct vintc * __init vaplic_alloc(void)
-- 
2.53.0


