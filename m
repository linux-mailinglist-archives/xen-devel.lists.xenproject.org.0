Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAdDOMv2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540E4F7FFD
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303805.1577161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR6-0002pX-Dk; Fri, 08 May 2026 14:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303805.1577161; Fri, 08 May 2026 14:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR4-0002Wz-LO; Fri, 08 May 2026 14:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1303805;
 Fri, 08 May 2026 14:44:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQz-0001g9-9w
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQy-007XaD-LF
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a0-2eae-0a2a0a5409dd-0a2a450197ec-16
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:08 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b8-c1f2-0a2a45010019-d155da35b4a7-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:08 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-bc1f3a393c0so315224166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:08 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251448; x=1778856248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypGqeSMIpsEAtUnq5oo0oPjqpPE9yld9wwOBLOaULws=;
        b=RZVmaaXSsI1eouCkJO+DfP8NVU1jHQbBU+v6wpGdRMAut6BMS9BHFC/tVzbAao7lEc
         GXEwlZ3FMr8R3yxZtJzdAdiaIHnbfqtXNAC8IXp2XnkJ4Q4kuwshJAC4MtofjhnhxlIE
         MPCb+SnqjO3MicnCugnecqX50Z9hwZzOxoMW6TxX1qNNqbvJCr40/qZaUglipmUwG7SX
         W+iJ5sY6BTvEBAVuxkDI6+S95m6LSfwsiWxiGCgOnLN+CCfEAAg9ykyyh+pAJHS9IXpL
         ET6jfqIm87Uw52eyucnShjqtqJVrYJRDtM9JQgpKRfSc8RqDCc5N1Yv0TotTQys+W+5p
         U3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251448; x=1778856248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypGqeSMIpsEAtUnq5oo0oPjqpPE9yld9wwOBLOaULws=;
        b=l+mYpHLUbgH7JRTGurJSgPd9ZBqrXLd0JGLSxbK2uFc8y782lLcxnO94bwmwpq4RLA
         3FetMk/pb4l9D8OgmQAipwi4fSYiADkmov55sc9dn1blRGSClCjp2bMnMxR/PG65zyGi
         hjDydiAsJLzC7yrD/5rSEvfQyE98lzjQQalxvxFGW34DIYmhhPn/0bo7P0YW038LJSSi
         UZe8l+ub7OwlmxO9dDb2l3/RqQyjrs6aVYJ+gjoBmdwMdPqTFB4FBDqmZJOxsxO8NKVm
         Nwgew8FWCvyr4+a2wb9oIQFldx/DgTizv8KAOw9ry9GMOhtCuMzbRHuSDXc+Y79flwjo
         lzIg==
X-Gm-Message-State: AOJu0YyuntDJYNxbR6ZPW5eYhBESVDDkQQ9NlxbkbYI81tT8GNkRAB1B
	fv0sycMLZMUG7KRT6O8rMCyQf22MyWF8tMuxZcKZJnUeqZbvfv4lcJpQReuR0w==
X-Gm-Gg: AeBDietpzsnQFEtwELna2yTA+s1YlqtzSP5O+MqNRXkbNtI4sLxxelT8wM7tRlCxojv
	bc4pCQ5urvqnmeJJEzLE/MRd66+6J5P9A6DD8ef8FVJNH0qsoOcDC0+Dy9vFi0RWcRTm5Olw8nY
	N47jFQpQ0VnkstsDbs2t0wUF5KC38zPu+J9SnGL4C1ptvwu9Kp/37H6PYTUeYuP9NGT1pebOa2x
	NIWpnLbfDjsXQnOIJ6e5BhN6QdqaDn3S2dlJyG+wmJHLOwPS/SHL2Dxo4rCEbCbHsg3WtDk9mMb
	Ra2N8UP28jO9M1X3CHiF4/sourFEQVYQNVy+JwH+uj7feH+0P2LUd1mVMXWo9hPJFGMtLCtJdUa
	wXaZ4GZL3VzLMe+ABYx0ofaUOWbXLyStFKkuObqh49hmSRskQ8XVTZskNJFOeEBa8lbvFXUNfik
	3x/EXPcm+KiP5Ks/HkxGRne/BWEdK9wPYNCy/LchdiYIB+9q0YiUQk0A9EmQEfzBkUMg==
X-Received: by 2002:a17:906:7944:b0:bb7:be3b:ba3e with SMTP id a640c23a62f3a-bc56e01902emr696376966b.45.1778251447589;
        Fri, 08 May 2026 07:44:07 -0700 (PDT)
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
Subject: [PATCH v2 21/26] xen/riscv: implement virtual APLIC MMIO emulation
Date: Fri,  8 May 2026 16:43:23 +0200
Message-ID: <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778251448-B5D41FF4-6A9FE513/10/73395122804
X-purgate-type: spam
X-purgate-size: 16474
X-Rspamd-Queue-Id: 3540E4F7FFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email,domaincfg.ie:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Guests running under Xen program interrupt routing by writing to APLIC
MMIO registers. Xen must intercept these accesses to enforce interrupt
isolation between domains and to translate guest routing intent into the
underlying physical MSI topology.

Writes are gated by the domain's authorised interrupt bitmap so that a
guest cannot affect interrupts it does not own. TARGET register writes
additionally require translation of the hart and IMSIC guest-file
indices from virtual to physical, as the APLIC uses these fields
directly to compute the MSI delivery address.

Delegation (APLIC_SOURCECFG_D) is not yet supported.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Merge the following patches into one:
    xen/riscv: add vaplic access check:
      - Add check that address is properly aligned.
      - Check vaplic range intead of APLIC one.
      - Return bool from vaplic_is_access instead of int.
    xen/riscv: emulate guest writes to virtual APLIC MMIO
      - Drop CALC_REG_VALUE.
      - Use unsigned int instead of uin32_t for offset.
      - s/.../subtracting in the comment.
      - start one line comments from the upper case.
      - Check the value before being written to sourcecfg register.
      - 'unsigned int' for loop index.
      - Omit unneessary braces.
      - s/vaplic_update_target/aplic_msi_target_gen.
      - Use IMSIC_MMIO_PAGE_SHIFT instead of 12 in aplic_msi_target_gen().
      - Drop explicit usage of APLIC register in store function.
      - Drop APLIC_REG_{GET,SET} macros and introudce APLIC specific funtcions.
      - Ignore write to SOURCECFG_BASE when value is out-of-range.
      - Drop ASSERT(!target_vcpu) inside handler of targer register setting,
        just avoid such writings + debug message.
      - domain_crash() instead of panic() in the case of default case.
      - Drop ASSERT() in APLIC_SOURCE_CFG_BASE case and use domain_crash()
        instead.
    xen/riscv: emulate guest reads from virtual APLIC MMIO:
      - s/regval_to_irqn/regindx_to_irqn.
      - pass to to_vaplic() a domain instead of vintc.
      - add check that load access is aligned.
      - instead of panic() just crash a domain().
      - use 'unsigned int' for local variable offset.
      - Return 0 in the case APLIC_CLRIE_BASE ...APLIC_CLRIE_LAST reading to
        follow AIA spec.
      - Drop explicit usage of physical APLIC registers.
---
 xen/arch/riscv/aplic.c              |  25 +++
 xen/arch/riscv/include/asm/aplic.h  |   9 +
 xen/arch/riscv/include/asm/intc.h   |  10 +-
 xen/arch/riscv/include/asm/vaplic.h |   3 +
 xen/arch/riscv/vaplic.c             | 289 +++++++++++++++++++++++++++-
 5 files changed, 333 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 1c8fd0145eb2..1976733dfbaa 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -40,6 +40,31 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
+{
+    unsigned long flags;
+    uint32_t val;
+
+    ASSERT(offset < aplic.size);
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    val = readl((void __iomem *)((uintptr_t)aplic.regs + offset)) & mask;
+    spin_unlock_irqrestore(&aplic.lock, flags);
+
+    return val;
+}
+
+void aplic_hw_write_reg(unsigned int offset, uint32_t value)
+{
+    unsigned long flags;
+
+    ASSERT(offset < aplic.size);
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    writel(value, (void __iomem *)((uintptr_t)aplic.regs + offset));
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index e418fc53433b..7905db9876d4 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,8 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_NUM_REGS 32
+
 #define APLIC_REG_OFFSET_MASK   0x3fff
 #define APLIC_TARGET_IPRIO_MASK 0xff
 #define APLIC_TARGET_GUEST_IDX_SHIFT 12
@@ -24,6 +26,8 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
+#define APLIC_SOURCECFG_D       BIT(10, U)
+
 #define APLIC_SOURCECFG_SM_INACTIVE     0x0
 #define APLIC_SOURCECFG_SM_DETACH       0x1
 #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
@@ -71,6 +75,8 @@
 #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
                                  APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
 
+#define APLIC_SETCLR_OFFSET_MASK  ((32 * sizeof(uint32_t)) - 1)
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
@@ -114,4 +120,7 @@ struct aplic_regs {
     uint32_t target[1023];      /* 0x3008 */
 };
 
+uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask);
+void aplic_hw_write_reg(unsigned int offset, uint32_t value);
+
 #endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 1ff992b6c20b..641c83125a5b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -64,7 +64,15 @@ struct vintc_ops {
     int (*vcpu_init)(struct vcpu *v);
 
     /* Check if a address is virtual interrupt controller MMIO */
-    int (*is_access)(const struct vcpu *v, unsigned long addr);
+    bool (*is_access)(const struct vcpu *v, unsigned long addr);
+
+    /* Emulate load to virtual interrupt controller MMIOs */
+    int (*emulate_load)(const struct vcpu *vcpu, unsigned long addr,
+                        uint32_t *out);
+
+    /* Emulate store to virtual interrupt controller MMIOs */
+    int (*emulate_store)(const struct vcpu *vcpu, unsigned long addr,
+                         uint32_t in);
 };
 
 struct vintc {
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 630ca14657f2..0fa690fcb2d7 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -26,6 +26,9 @@ struct vaplic_regs {
 struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
+
+    paddr_t regs_start;
+    paddr_t regs_size;
 };
 
 int domain_vaplic_init(struct domain *d);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 3f967464335a..57c3433ba03b 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -26,6 +26,283 @@
 
 #define FDT_VAPLIC_INT_CELLS 2
 
+#define AUTH_IRQ_BIT(d, irqn) ( \
+    ((irqn) <= (d)->arch.vintc->irq_nums) && \
+    test_bit(irqn, (d)->arch.vintc->allocated_irqs) )
+
+#define regindx_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
+
+static inline uint32_t generate_auth_mask(const struct domain *d,
+                                          unsigned int irqsn)
+{
+    if ( irqsn >= DIV_ROUND_UP(d->arch.vintc->irq_nums,
+                               sizeof(uint32_t) * BITS_PER_BYTE) )
+    {
+        dprintk(XENLOG_DEBUG, "incorrect irqsn(%d) is passed\n", irqsn);
+
+        return 0U;
+    }
+
+    return *((uint32_t *)d->arch.vintc->allocated_irqs + irqsn);
+}
+
+static int vaplic_emulate_load(const struct vcpu *vcpu,
+                               const unsigned long addr, uint32_t *out)
+{
+    const struct domain *d = vcpu->domain;
+    const struct vaplic *vaplic = to_vaplic(d);
+    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
+    uint32_t auth_mask;
+    unsigned int i;
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        *out = vaplic->regs.domaincfg;
+
+        return 0;
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+        /*
+         * Based on the RISC-V AIA spec a read of these registers
+         * always returns zero
+         */
+        *out = 0;
+
+        return 0;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        i = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
+        auth_mask = generate_auth_mask(d, i);
+
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
+        i = regindx_to_irqn(offset - APLIC_GENMSI);
+
+        if ( !AUTH_IRQ_BIT(d, i) )
+        {
+            *out = 0;
+
+            return 0;
+        }
+
+        auth_mask = ~0U;
+
+        break;
+
+    default:
+        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
+                 offset);
+
+        domain_crash(vcpu->domain);
+
+        return -EINVAL;
+    }
+
+    *out = aplic_hw_read_reg(offset, auth_mask);
+
+    return 0;
+}
+
+static uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
+                                     uint32_t base_val)
+{
+    const struct imsic_config *imsic = imsic_get_config();
+    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
+    unsigned long hart_id = cpuid_to_hartid(target_vcpu->processor);
+    unsigned long group_index;
+    unsigned int hhxw = imsic->group_index_bits;
+    unsigned int lhxw = imsic->hart_index_bits;
+    unsigned int hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
+
+    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) & (BIT(hhxw, UL) - 1);
+
+    base_val &= APLIC_TARGET_EIID_MASK;
+    base_val |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
+    base_val |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
+    base_val |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
+
+    return base_val;
+}
+
+static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
+                                         unsigned long addr, uint32_t value)
+{
+    int rc = -EINVAL;
+    const struct domain *d = vcpu->domain;
+    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
+
+    switch ( offset )
+    {
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+    {
+        unsigned int irqn = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
+        value &= generate_auth_mask(d, irqn);
+
+        break;
+    }
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        if ( value & APLIC_SOURCECFG_D )
+        {
+            rc = -EOPNOTSUPP;
+
+            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
+
+            goto fail;
+        }
+
+        /*
+         * As sourcecfg register starts from 1:
+         *   0x0000 domaincfg
+         *   0x0004 sourcecfg[1]
+         *   0x0008 sourcecfg[2]
+         *    ...
+         *   0x0FFC sourcecfg[1023]
+         * It is necessary to calculate an interrupt number by subtracting
+         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
+         */
+        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_DOMAINCFG)) )
+            /* Interrupt not enabled, ignore it */
+            return 0;
+
+        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
+        {
+            gdprintk(XENLOG_ERR,
+                     "value(%u) is incorrect for sourcecfg register\n", value);
+
+            return 0;
+        }
+
+        break;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+    {
+        struct vcpu *target_vcpu = NULL;
+
+        /*
+         * Look at vaplic_emulate_load() for explanation why
+         * APLIC_GENMSI is subtracted.
+         */
+        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_GENMSI)) )
+            /* Interrupt not enabled, ignore it */
+            return 0;
+
+        for ( unsigned int i = 0; i < vcpu->domain->max_vcpus; i++ )
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
+        if ( !target_vcpu )
+        {
+            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
+
+            /* Ignore such writings */
+            return 0;
+        }
+
+        value = aplic_msi_target_gen(target_vcpu, value);
+
+        break;
+    }
+
+    case APLIC_SETIPNUM:
+    case APLIC_SETIPNUM_LE:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+        if ( !value || !AUTH_IRQ_BIT(d, value) )
+            return 0;
+
+        break;
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
+        printk_once("%s: Ignore writes to domaincfg as it is set by aplic "
+                    " during initialization in Xen\n", __func__);
+
+        return 0;
+
+    default:
+        goto fail;
+    }
+
+    aplic_hw_write_reg(offset, value);
+
+    return 0;
+
+ fail:
+    domain_crash(vcpu->domain,
+                 "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
+                 value);
+
+    return rc;
+}
+
+static bool cf_check vaplic_is_access(const struct vcpu *vcpu,
+                                      unsigned long addr)
+{
+    const struct vaplic *vaplic = to_vaplic(vcpu->domain);
+    paddr_t start = vaplic->regs_start;
+    paddr_t end = vaplic->regs_start + vaplic->regs_size;
+
+    if ( addr & 0x3 )
+    {
+        dprintk(XENLOG_DEBUG,
+                "APLIC MMIO address should be properly aligned\n");
+
+        return false;
+    }
+
+    /* check if it is an APLIC access */
+    if ( start <= addr && addr < end )
+        return true;
+
+    return false;
+}
+
 static int cf_check vcpu_vaplic_init(struct vcpu *v)
 {
     int rc = 0;
@@ -54,19 +331,24 @@ static int cf_check vcpu_vaplic_init(struct vcpu *v)
 
 static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
 {
+    struct domain *d = kinfo->bd.d;
     int res = 0;
     void *fdt = kinfo->fdt;
     unsigned int msi_parent_phandle;
     char vaplic_name[128];
     paddr_t aplic_addr = GUEST_APLIC_S_BASE;
-    paddr_t aplic_size = APLIC_SIZE(kinfo->bd.d->max_vcpus);
+    paddr_t aplic_size = APLIC_SIZE(d->max_vcpus);
     const __be32 reg[] = {
         cpu_to_be32(aplic_addr >> 32),
         cpu_to_be32(aplic_addr),
         cpu_to_be32(aplic_size >> 32),
         cpu_to_be32(aplic_size),
     };
-    struct vintc *vintc = kinfo->bd.d->arch.vintc;
+    struct vintc *vintc = d->arch.vintc;
+    struct vaplic *vaplic = to_vaplic(d);
+
+    vaplic->regs_start = GUEST_APLIC_S_BASE;
+    vaplic->regs_size = aplic_size;
 
     res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%x",
                    GUEST_APLIC_S_BASE);
@@ -121,6 +403,9 @@ static const struct vintc_init_ops __initdata init_ops = {
 
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_vaplic_init,
+    .is_access = vaplic_is_access,
+    .emulate_store = vaplic_emulate_store,
+    .emulate_load = vaplic_emulate_load,
 };
 
 int __init domain_vaplic_init(struct domain *d)
-- 
2.54.0


