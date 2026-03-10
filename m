Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDd9LVBQsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1102554BC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250398.1547962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aH-0004fk-Ec; Tue, 10 Mar 2026 17:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250398.1547962; Tue, 10 Mar 2026 17:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aG-0004W0-RM; Tue, 10 Mar 2026 17:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1250398;
 Tue, 10 Mar 2026 17:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aE-0001Q4-Ae
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e415608c-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:25 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso107423915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:25 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:24 -0700 (PDT)
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
X-Inumbo-ID: e415608c-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162565; x=1773767365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nBjOwOkgmV3ao9VaFguk8mStyy/ASZb20xOrZJU8TM=;
        b=QvpJqg/cMsyPNKSuJbij6IINo/Kl94JU5kX2IhQPKpO7cshbYtN5OdAQO4lmMn+OXf
         GaBaD9zT+46iZ8gQxAJ2MUeeE3+GcAqyRY50ZK1HauL2jCPIuZnsBbm+CHCKIJCRwgVs
         I+7WygMG+89wXoEC02keUhO9DuzpvA3+7VSsHUDFUQVoQKF9rz0A9ETPTP/QYudI/4JZ
         tRqIJtxIfDxhwYbF5r1x5soRo0Y96sBr3roACC/XmBAA0gXw7fj/lpQbC+VW8+9+V7Dq
         8kX0tKl7za/w8HqGHwKuSFtOHvcCMLxbRt4ydPAkrZ45ImS0n639yIoIfoXs+4v4XwYe
         0hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162565; x=1773767365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nBjOwOkgmV3ao9VaFguk8mStyy/ASZb20xOrZJU8TM=;
        b=JQzc6+NZU4eU2Tdmgdo668Os1n9nhJ8H2IW2YG6G2+q/rQNcEc9PkgvX98ZB/9HAbU
         G9crJsRS6/BuHCQyrr+T0135QuPwxstmzcw5vHg6f/5RpdZYAN34dTfo5O6ZgPaLXBPH
         B2vwSRxjzuXJ3pENAruZAN5rNj02RDuBE3XxCsYjjx1TLAzdpoUQ+7MumTw4rpqlzDV8
         e4VdeFUM4ec1db6W2ejQ33F46krlJUHYH4V4NgFkfk7tbpJVQldr/ao+pUPFSL9NG3Kx
         TwRzswFQJ15HdwRfUF5SjAoedImNsfE+W/LQj1/TH7gjP39yGo4zXzlr7lpaQ0Odx5Pq
         rNOw==
X-Gm-Message-State: AOJu0YwVwg1PrEcoll3jkzhlXYh5w5DfP2Wcm/5hKpQvQX2FtmyPBhWI
	RFyzD7h8c7mhI8XbmMIsN6nyDNurx/95QI5AxAU2yi24rLHtyTAE54eDwf2ddFrA
X-Gm-Gg: ATEYQzx3RWRxtzB2wofTcjnq0zqD3TcB9O6kKIE/ZTcGScoduZnQA1dBZf+PO07U1oN
	Egrs9QcAuHxF3pfufIejb6PDWyF3xCuJyEKWxXSz/YPyFo7HMUSHtsnrcACj05VEFQNRTc4Lk5k
	HJhP+UKGZmXSFkDbFcknyHZgCyS/y1t342l4A0PexlVpJWO1Ubpe5Hfv6Y/QqJ9LE29M8No+uXW
	Zwsw61M8fX116cxxLG/dovb/XqKmplZfxJEK188TcoXGOhN157cajq5/9g/sekgeVCwjo35c3eP
	TLjLQPmDozrFGnLRkxb89LcJPBjqZ0iu6esDXlDHMRk6aM90kMUGsAzhaSV66+bbvxEEIjad3DO
	iq+ZxLeKHbcMhD07mhpPlzuL7Oc2KlP3w/yEcLHunkUR9NRHMKTBXW5dscyCanDQSOklFIPJD3N
	224pcQ/GEK01tiv4sYHxuy7MHNdLxRNKBzGeaI2VEAN+hxnqkaK9hLCXX9WcSvMczAX28Z+pSbA
	Xtb
X-Received: by 2002:a05:600c:4ed1:b0:485:3a03:ced1 with SMTP id 5b1f17b1804b1-4853a03d7eamr152562415e9.28.1773162564912;
        Tue, 10 Mar 2026 10:09:24 -0700 (PDT)
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
Subject: [PATCH v1 13/27] xen/riscv: add basic VGEIN management for AIA guests
Date: Tue, 10 Mar 2026 18:08:46 +0100
Message-ID: <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6F1102554BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

AIA provides a hardware-accelerated mechanism for delivering external
interrupts to domains via "guest interrupt files" located in IMSIC.
A single physical hart can implement multiple such files (up to GEILEN),
allowing several virtual harts to receive interrupts directly from hardware

Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
for systems implementing AIA specification. Each CPU maintains
a bitmap describing which guest interrupt files are currently in use.

Add helpers to initialize the bitmap based on the number of available
guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
when no longer needed. When assigning a VGEIN, the corresponding value
is written to the VGEIN field of the guest hstatus register so that
VS-level external interrupts are delivered from the selected interrupt
file.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aia.c             | 112 ++++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/aia.h |  18 +++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 5e3f190e8e2c..7bd66d1e37c6 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,11 +1,24 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bitmap.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/sections.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
+#include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/current.h>
+
+/*
+ * Bitmap for each physical cpus to detect which VS (guest)
+ * interrupt file id was used.
+ */
+DEFINE_PER_CPU(struct vgein_bmp, vgein_bmp);
 
 static bool __ro_after_init is_aia_available;
 
@@ -14,12 +27,109 @@ bool aia_available(void)
     return is_aia_available;
 }
 
+int __init vgein_init(unsigned int cpu)
+{
+    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
+
+    csr_write(CSR_HGEIE, -1UL);
+    vgein->geilen = flsl(csr_read(CSR_HGEIE));
+    csr_write(CSR_HGEIE, 0);
+    if ( vgein->geilen )
+        vgein->geilen--;
+
+    BUG_ON(!vgein->geilen);
+
+    printk("cpu%d.geilen=%d\n", cpu, vgein->geilen);
+
+    if ( !vgein->bmp )
+    {
+        vgein->bmp = xvzalloc_array(unsigned long, BITS_TO_LONGS(vgein->geilen));
+        if ( !vgein->bmp )
+            return -ENOMEM;
+    }
+
+    spin_lock_init(&vgein->lock);
+
+    return 0;
+}
+
 int __init aia_init(void)
 {
+    int rc = 0;
+
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
         return -ENODEV;
 
+    if ( (rc = vgein_init(0)) )
+        return rc;
+
     is_aia_available = true;
 
-    return 0;
+    return rc;
+}
+
+unsigned int vgein_assign(struct vcpu *v)
+{
+    unsigned int vgein_id;
+
+    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
+    unsigned long *bmp = vgein_bmp->bmp;
+    unsigned long flags;
+
+    spin_lock_irqsave(&vgein_bmp->lock, flags);
+    vgein_id = bitmap_weight(bmp, vgein_bmp->geilen);
+
+    /*
+     * All vCPU guest interrupt files are used and we don't support a case
+     * when number of vCPU on 1 pCPU is bigger then geilen.
+     */
+    ASSERT(vgein_id < vgein_bmp->geilen);
+
+    bitmap_set(bmp, vgein_id, 1);
+    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
+
+    /*
+     * The vgein_id shouldn't be zero, as it will indicate that no guest
+     * external interrupt source is selected for VS-level external interrupts
+     * according to RISC-V priviliged spec:
+     *   8.2.1 Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
+     *
+     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
+     *   a guest external interrupt source for VS-level external interrupts.
+     *   VGEIN is a WLRL field that must be able to hold values between zero
+     *   and the maximum guest external interrupt number (known as GEILEN),
+     *   inclusive.
+     *   When VGEIN=0, no guest external interrupt source is selected for
+     *   VS-level external interrupts.
+     */
+    vgein_id++;
+
+#ifdef VGEIN_DEBUG
+    printk("%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
+           __func__, v, vgein_id, v->processor, *bmp);
+#endif
+
+    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
+    vcpu_guest_cpu_user_regs(v)->hstatus |=
+        MASK_INSR(vgein_id, HSTATUS_VGEIN);
+
+    return vgein_id;
+}
+
+void vgein_release(struct vcpu *v, unsigned int vgen_id)
+{
+    unsigned long flags;
+
+    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
+
+    spin_lock_irqsave(&vgein_bmp->lock, flags);
+    bitmap_clear(vgein_bmp->bmp, vgen_id - 1, 1);
+    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    printk("%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
+           __func__, vgen_id, v->processor, *vgein_bmp->bmp);
+#endif
+
+    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index 039607faf685..c2717504cbea 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -3,8 +3,26 @@
 #ifndef ASM__RISCV__AIA_H
 #define ASM__RISCV__AIA_H
 
+#include <xen/percpu.h>
+#include <xen/spinlock.h>
+
+struct vcpu;
+
+struct vgein_bmp {
+    unsigned long *bmp;
+    spinlock_t lock;
+    struct vcpu *owners[BITS_PER_LONG];
+    unsigned int geilen;
+};
+
+DECLARE_PER_CPU(struct vgein_bmp, vgein_bmp);
+
 bool aia_available(void);
 
 int aia_init(void);
 
+int vgein_init(unsigned int cpu);
+unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgen_id);
+
 #endif /* ASM__RISCV__ACPI_H */
-- 
2.53.0


