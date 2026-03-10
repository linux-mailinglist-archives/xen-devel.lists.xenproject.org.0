Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA2mI0JSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0B2555DA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250510.1548011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iI-0002oa-Hw; Tue, 10 Mar 2026 17:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250510.1548011; Tue, 10 Mar 2026 17:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00iI-0002n8-EE; Tue, 10 Mar 2026 17:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1250510;
 Tue, 10 Mar 2026 17:17:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aN-0001Q4-HD
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e916d655-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:34 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso22522015e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:34 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:32 -0700 (PDT)
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
X-Inumbo-ID: e916d655-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162573; x=1773767373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vggNX4iy/s3rYe31fA6JCPRN0nqiyw41a2u9JUGJC2M=;
        b=A2A7GGJ0CAL4ikMnK2xD81wYIzdXp39h5Zq/4vsUGRd5AAbzcp2wfPNKv4aCeFr04B
         C4IbuMfaJg+/kwf7iFC7ERmKa2lyb/rL60QRuKtcY+M5bQ0kRLhYbvE82t5yai5yh3rf
         /avseKkvQXMffFCmcBc/FeMTFbjpP9WW61twM2zGhRBwzJVbBl9DaB5SHGLr+XVJ2J26
         uGpNrwjofjMFzPFKjfSnCPe278/WhkG0LOvCONnmF5/7++mAxzgQu/CrYLHjzobcuMXp
         xeJacLC+YzLuSdchQgjCPfOWsDtUDr0prU6K+szRuJKjE4jxzn0q3asWrKyvDMvK5Tzy
         HQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162573; x=1773767373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vggNX4iy/s3rYe31fA6JCPRN0nqiyw41a2u9JUGJC2M=;
        b=Ig6dVDQ+LcTI/hW/gNALG5n4zaBY5wgNasgTTkJ4IEcQLvm+1Wq8658V+Q84j7rO14
         eXVqsgEVi4uWTXQO68mFpKgebN3sHw+E4sFBiYbyngX6A7x4xC2n8bXfMCYvsuDVqN21
         sdCoDBrqOmzzb6Vg/Rpii8HVBfOq4W560EjSnPvAS+nrarQ1LTapvErbtHJm387d43JX
         Jzx+0HwnfNIJ/fRIBwBa5D7sQGaXmj4eTdEsBsuhPuDH1mUt9efG6fG0xabWX5YbgenC
         tIuKWGqPoBykdjwjASKL7Df5f8v/Lq5dnWG89zK3Ix2jkzVekOXHdgAT5PTs6RPeGDql
         CIzA==
X-Gm-Message-State: AOJu0YxHYzbxq5VrgemTmpLf7h5FhkmIfrK8Fi9ObWdSLz2wOJuE5pHv
	FFdfmOHZFv0QrMiXQwwGs51QLEOF+ev2K3HAH9iK6BiHqV+3CRgK9FlwB9lZOYo1
X-Gm-Gg: ATEYQzxt0YRSDIoNzbT7YtZ4xE66nEdsGPuZf1CMrlnU2egtqfIJaukap7FwDAhJVMG
	Bv3IAXfyZTAorslb5BBZgUumzuIqXiSoI7tYB++k1faqAVA+vsyqKYwGGz3ne2QlTncm8WpleKS
	rOtAewu+pwtW6TnTBYz6GYH9DDeZAu3B8wapYPhB59y7CrPR6R8EczrceWT3CAuzZyStowGC+5m
	DiKGicdCJuU/SXmH3aFf23LhCYlN+ca2ecqI8n8BA3vzcwm7GMp6PIFCqDs7j1MZTEEom/4nZNE
	9P/EnKbLGT7MyHlDbxye5MhdoFzSjdvQsJj4+YhfpX1Y4Ef95C33LJdgmCDVVAjRlVTi0hiNC3x
	HWIOKZB0mzZ7jfAqBFcZpIHtDx2Y6yRHNU4EYIYqDi2j61xrRJC/cGY3LT0xFCOHKp6mRiLwZMg
	5fu30+Oej0zHO7+t75TBUU2+4yRdP9lfxIcpNHL1GqYp6J/O8Fnf/gN+dWy0z1hylL5g==
X-Received: by 2002:a05:600c:a08b:b0:485:42ba:fc8 with SMTP id 5b1f17b1804b1-48542ba105dmr58826615e9.4.1773162573184;
        Tue, 10 Mar 2026 10:09:33 -0700 (PDT)
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
Subject: [PATCH v1 20/27] xen/riscv: emulate guest reads from virtual APLIC MMIO
Date: Tue, 10 Mar 2026 18:08:53 +0100
Message-ID: <626d0874c2c7ec858725860bc3857691f0f829ad.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04C0B2555DA
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

Guests may read back APLIC registers to inspect interrupt state and
routing configuration. When virtualising APLIC, Xen must intercept
these MMIO reads and present a consistent, restricted view of the
virtual interrupt controller state. Note that at the moment only
MSI mode is supported.

Introduce vaplic_emulate_load() to handle guest loads from virtual
APLIC registers. Readback is filtered through the domain’s authorised
interrupt bitmap so that guests can observe state only for interrupts
they are permitted to control.

Registers defined by the AIA specification to read as zero are handled
accordingly, while other registers return masked values derived from
the underlying virtual APLIC state. Unsupported accesses are treated
as fatal, as they indicate a emulation error.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/intc.h |  4 ++
 xen/arch/riscv/vaplic.c           | 69 +++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 92a74eede4a0..45d41e191e30 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -56,6 +56,10 @@ struct vintc_ops {
     /* Initialize some vINTC-related stuff for a vCPU */
     int (*vcpu_init)(struct vcpu *vcpu);
 
+    /* Emulate load to virtual interrupt controller MMIOs */
+    int (*emulate_load)(const struct vcpu *vcpu, unsigned long addr,
+                        uint32_t *out);
+
     /* Emulate store to virtual interrupt controller MMIOs */
     int (*emulate_store)(const struct vcpu *vcpu, unsigned long addr,
                          uint32_t in);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 5540b4884179..293729ad0ad4 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -137,6 +137,74 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
     return 0;
 }
 
+static int vaplic_emulate_load(const struct vcpu *vcpu,
+                               const unsigned long addr, uint32_t *out)
+{
+    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
+    struct aplic_priv *priv = vaplic->base.info->private;
+    const unsigned long offset = addr & APLIC_REG_OFFSET_MASK;
+    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
+    bool auth_bit;
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        *out = vaplic->regs.domaincfg;
+        break;
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+        /*
+         * Based on the RISC-V AIA sepc a read of these registers
+         * always returns zero
+         */
+        *out = 0;
+        break;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+        auth_bit = auth_irq_bmp[regval_to_irqn(offset - APLIC_SETIP_BASE)];
+        *out = APLIC_REG_GET(priv->regs, addr - priv->paddr_start) & auth_bit;
+        break;
+
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+        auth_bit = auth_irq_bmp[regval_to_irqn(offset - APLIC_CLRIP_BASE)];
+        *out = APLIC_REG_GET(priv->regs, addr - priv->paddr_start) & auth_bit;
+        break;
+
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        auth_bit = auth_irq_bmp[regval_to_irqn(offset - APLIC_CLRIP_BASE)];
+        *out = APLIC_REG_GET(priv->regs, addr - priv->paddr_start) & auth_bit;
+        break;
+
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+        auth_bit = auth_irq_bmp[regval_to_irqn(offset - APLIC_CLRIE_BASE)];
+        *out = APLIC_REG_GET(priv->regs, addr - priv->paddr_start) & auth_bit;
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+        /*
+         * As target registers start for 1:
+         *  0x3000 genmsi
+         *  0x3004 target[1]
+         *  0x3008 target[2]
+         *   ...
+         *  0x3FFC target[1023]
+         * It is necessary to calculate an interrupt number by substracting
+         * of APLIC_GENMSI instead of APLIC_TARGET_BASE.
+         */
+        auth_bit = auth_irq_bmp[regval_to_irqn(offset - APLIC_GENMSI)];
+        *out = APLIC_REG_GET(priv->regs, addr - priv->paddr_start) & auth_bit;
+        break;
+
+    default:
+        panic("%s: unsupported register offset: %#lx", __func__, offset);
+    }
+
+    return 0;
+}
+
 static void vaplic_dm_update_target(const unsigned long hart_id, uint32_t *iprio)
 {
     *iprio &= APLIC_TARGET_IPRIO_MASK;
@@ -327,6 +395,7 @@ static const struct vintc_ops vaplic_ops = {
     .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
     .is_access = vaplic_is_access,
     .emulate_store = vaplic_emulate_store,
+    .emulate_load = vaplic_emulate_load,
 };
 
 static struct vintc * __init vaplic_alloc(void)
-- 
2.53.0


