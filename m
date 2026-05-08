Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG/vK7b2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D974F7FA5
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303756.1577095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQp-00082g-Jn; Fri, 08 May 2026 14:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303756.1577095; Fri, 08 May 2026 14:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQp-0007sk-0x; Fri, 08 May 2026 14:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1303756;
 Fri, 08 May 2026 14:43:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQm-0007TQ-H3
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQk-00EpjT-Bx
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf689-5cb7-0a2a0a5109dd-0a2a4506c6fc-34
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:55 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6ab-7371-0a2a45060019-d155da2da8ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:55 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-bc1f0830f44so590084566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:55 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251435; x=1778856235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJo88tDYRHxEoMYk1G+kL6a6Xp9nCz03PcEHLeEJrNI=;
        b=DGVXB8rf+bzvO7Y0vPrF96kXYNhOwQnp73HsI4cmT0jg8uxG5RDx273cAkM9EM6TXz
         9Ih0gq11Tz1P/di2M5LVx9+PbhdJuaBvhGjTUdRFx8WbDFdvUt4kZkUq+KdSdZLF9CcO
         b3DVaMC4QDu7qYL7lDwvKXRapX/u9gG0HjBG24QFyKk5MJLGPdINBxq7okDuVpc5ilnY
         IGSEOr2zK7NU33Te2eR8i8oxZu5LD6zCIcKwmzKfDnwpB3zJBOoEOqAMp0w2ROXcMFGd
         M6kvQkgwxhoiE+poscz0TI6KXOzsoemgw0/4dLitQVFgMqc5XWeAT4z8Wd6pW14/JSjr
         wgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251435; x=1778856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJo88tDYRHxEoMYk1G+kL6a6Xp9nCz03PcEHLeEJrNI=;
        b=XYlOL95aAHlY05yvp8oSGQq/Yu9Zv2XLEQsj/I2J2pVS0ylTG+EU+KPvMkKSpGiT9Y
         BnH5fxZZ16XKaTxtZTUOGfrJCeqg9Tqdrbuu8NdlR4gT90ZnMesqzCCDTWTaTTmFSSYv
         P9119/AtzbSoHJaBAf2RDrpxgwPwomSJFs6mxKeyFzgrPplgAgd5kL5yOnnoFdejRx4C
         t/nzAxvo/L4sQOhw32FB5qT6mVLjc0QGz+xWMupEYXCpX29FWV3PcPhht683/gMyud3G
         DhWy8WPR3cswMQbHj/5Fyd3t7krVtSBeljjBtZimWW08iYrO1rYSoqhmyqVHUFN1cFq4
         lftg==
X-Gm-Message-State: AOJu0YyNt3epYB+Ojwo3Ii+gu+PaLHiA8lokAHW+P7sFl6OA9ziEld1P
	/r5q8QusXR8Fbap3fUS8PcwsQWMLBiNjx0yJxQrNSCJxcqwybPHZtFmVl/b5ew==
X-Gm-Gg: Acq92OFCJTYkM9yU0IG2c1J97t0Ur0r5YLmzawv75dDhEmi2ygVKQmtjy6NGko7P74n
	czUaW+1XX2e7CIBaAnjS9iGB1W6PkONNjIDmRcDt/o2bwBRMMn6MNkSmJYwf2Rm8gfXWMCy0xpj
	Hb4lUbBDacxP3liipw446lQqP/QKAatFvX+5DBaoYJ5ZT9HXOvKQ76aKDW6Iz6G0SpOffabLOOF
	rbEXE+EnG9HOOeIH7wEUkG6dsWYhJTeSLv7OGEDg2wNOcg/VWPjpVYbUF6bIWxdAHOkFJOcnLYF
	lLzZpMSsHIOVyVgX2Q4p3hvMAS4q2DirUK2MuUn4nT+tyIfncDT4ijSDhn1kSifl2AXSxTP8MIi
	9Q24jvINxSY4FT7iW6Ck/knepenuh/P8NfUTWtnJy2p8tSG809v+oxgvBqXeNLrcpvlHo3szFRn
	QrzcHGme3N+MJ0DvNDatw8Ta9Q9c+oZD1zMBR4B/0OEyswPrOb0Eis3SeNAI3FysEMeQ==
X-Received: by 2002:a17:906:fd87:b0:bc3:a0e9:e0c with SMTP id a640c23a62f3a-bc85c2b4e75mr424411766b.13.1778251435016;
        Fri, 08 May 2026 07:43:55 -0700 (PDT)
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
Subject: [PATCH v2 12/26] xen/riscv: add basic VGEIN management for AIA guests
Date: Fri,  8 May 2026 16:43:14 +0200
Message-ID: <61291bec7664e780f122ccf438091dfc1aba99e3.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778251435-84F63D75-58623B76/10/73395122804
X-purgate-type: spam
X-purgate-size: 8137
X-Rspamd-Queue-Id: 65D974F7FA5
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

It was decided to add support for IMSIC from the start instead of having APLIC
operate in direct delivery mode, as it requires a trap-and-emulation approach,
which is not optimal from a performance standpoint.

AIA provides a hardware-accelerated mechanism for delivering external
interrupts to domains via "guest interrupt files" located in IMSIC.
A single physical hart can implement multiple such files (up to GEILEN),
allowing several virtual harts to receive interrupts directly from hardware.

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
Changes in v2:
 - add static for defintion of vgein_bmp;
 - Drop declarartion of vgein_bmp from aia.h.
 - Move declaration of 'struct vgein_bmp' from aia.h to aia.c as all the
   management is inside aia.c.
 - Instead of decrement of vgein->geilen just update the wait how it is
   initialized.
 - Return -EOPNOTSUPP in vgein_init() instead of BUG_ON().
 - Use %u to print unsigned int.
 - make bmp field in vgein_bmp not a pointer.
 - allocate owners dynamically.
 - Drop unnessary blank lines.
 - use find_first_zero_bit() instead of bitmap_weight() to find a free slot
   for vgein number.
 - Drop the section number for the comment.
 - Start to search from bitnum 1 for free vgein_id, as bitnum 0 is reserved to
   tell that no guest extrenal interrupt number is used. Thereby drop vgein_id++
   at the end of vgein_assign().
 - s/bitmap_set/__set_bit.
 - s/bitmap_clear/__clear_bit.
 - as vgein_init() is needed to be invoked once per CPU being brought up, drop
   __init for it.
 - Return vgein_id == 0 if vgein_id is higher then maximun supported by h/w
   VGEIN.
 - Add check in vgein_relase() that vgein is 0 and if it is there is nothing
   is needed to do.
 - Use gdprintk instead of printk() in vgein_{assign,release}.
 - Add the claryfing comment above geilen field.
 - Drop ASSERT in vgein_assign() and return just vgein_id = 0 in the case when
   there is no aviablable h/w VGEINs.
 - Make vgein_init() static.
---
 xen/arch/riscv/aia.c             | 144 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h |   8 ++
 2 files changed, 152 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index f67f422c5a45..f7f44961e0f5 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,11 +1,33 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bitmap.h>
+#include <xen/cpu.h>
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
+struct vgein_ctrl {
+    unsigned long bmp;
+    spinlock_t lock;
+    struct vcpu **owners;
+    /* The least-significant bits are implemented first, apart from bit 0 */
+    unsigned int geilen;
+};
+
+/*
+ * Bitmap for each physical cpus to detect which VS (guest)
+ * interrupt file id was used.
+ */
+static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
 
 static bool __ro_after_init is_aia_usable;
 
@@ -14,10 +36,132 @@ bool aia_usable(void)
     return is_aia_usable;
 }
 
+static int vgein_init(unsigned int cpu)
+{
+    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
+
+    csr_write(CSR_HGEIE, -1UL);
+    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
+    csr_write(CSR_HGEIE, 0);
+
+    printk("cpu%d.geilen=%u\n", cpu, vgein->geilen);
+
+    if ( !vgein->geilen )
+        return -EOPNOTSUPP;
+
+    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
+    if ( !vgein->owners )
+        return -ENOMEM;
+
+    spin_lock_init(&vgein->lock);
+
+    return 0;
+}
+
+static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_STARTING:
+        rc = vgein_init(cpu);
+        if ( rc )
+            printk("AIA: failed to init vgein for CPU%un", cpu);
+        break;
+    }
+
+    return notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 void __init aia_init(void)
 {
+    int rc;
+
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+    {
+        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
+        return;
+    }
+
+    if ( (rc = vgein_init(0)) )
+    {
+        dprintk(XENLOG_ERR, "vgein_init() failed with rc(%d)\n", rc);
         return;
+    }
 
     is_aia_usable = true;
+
+    register_cpu_notifier(&cpu_nfb);
+}
+
+unsigned int vgein_assign(struct vcpu *v)
+{
+    unsigned int vgein_id;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+    unsigned long *bmp = &vgein->bmp;
+    unsigned long flags;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    /*
+     * The vgein_id shouldn't be zero, as it will indicate that no guest
+     * external interrupt source is selected for VS-level external interrupts
+     * according to RISC-V priviliged spec:
+     *   Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
+     *
+     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
+     *   a guest external interrupt source for VS-level external interrupts.
+     *   VGEIN is a WLRL field that must be able to hold values between zero
+     *   and the maximum guest external interrupt number (known as GEILEN),
+     *   inclusive.
+     *   When VGEIN=0, no guest external interrupt source is selected for
+     *   VS-level external interrupts.
+     *
+     * So start to search from bit number 1.
+     */
+    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
+
+    if ( vgein_id > vgein->geilen )
+        vgein_id = 0;
+    else
+        __set_bit(vgein_id, bmp);
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
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
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+
+    if ( !vgen_id )
+        return;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+     __clear_bit(vgen_id, &vgein->bmp);
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
+           __func__, vgen_id, v->processor, vgein->bmp);
+#endif
+
+    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index ca42c3086126..6073c89774bb 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -3,8 +3,16 @@
 #ifndef ASM__RISCV__AIA_H
 #define ASM__RISCV__AIA_H
 
+#include <xen/percpu.h>
+#include <xen/spinlock.h>
+
+struct vcpu;
+
 bool aia_usable(void);
 
 void aia_init(void);
 
+unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgen_id);
+
 #endif /* ASM__RISCV__ACPI_H */
-- 
2.54.0


