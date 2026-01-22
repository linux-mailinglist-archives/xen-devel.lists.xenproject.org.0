Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMvACb5UcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868C6A3DF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211347.1522900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqV-0007iX-TE; Thu, 22 Jan 2026 16:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211347.1522900; Thu, 22 Jan 2026 16:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqV-0007cV-NS; Thu, 22 Jan 2026 16:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1211347;
 Thu, 22 Jan 2026 16:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqU-0007Id-Vj
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 142313d6-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:46 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8838339fc6so177815366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:46 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:44 -0800 (PST)
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
X-Inumbo-ID: 142313d6-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100466; x=1769705266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPAdNKHF5EjavsXAwjuKNGFWuBxYMr4iJeXH7Q9PsSE=;
        b=D4DReNfAPDbKDfXZ9/zF05gQc9KT9hisuLnKY2ogQ3YXLLlpaedpE3RzuwlC0oM/ij
         leONacPy+wcBeT3IMrn6aU6WiSyiZNZl2V6StbWiXJq78sSA3A3mPF8ILfcDIxqgK596
         U5D7/C+sQL3niabL9BaXxFPK5ZtVVTbo4JwlfasICzVlrdBKn3GsduMiSH1RczU9Yf2z
         iMFRIxSmcEFUURSWQ5Wwx4W+jXKoIvnB+/m46mkcPjPCt75MHpBz0Os4EpUFm8ck8me2
         gKZPe5aah3G7rT6axasNVKnBfMLiLLJcD45ySE6KVIEpyEWpI/rTcudja61EeRpgmPL+
         8RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100466; x=1769705266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPAdNKHF5EjavsXAwjuKNGFWuBxYMr4iJeXH7Q9PsSE=;
        b=kDVC/+Ls/xf9Cz3W2N9dIKAgIRnANQI4MCsESBuZAATw2diLaSURtsWcajl+3ix2Dd
         BdJTz6ASnW3PQnTZGRIBlTpcIgoGFL4zf8AGLm/P2gwjo4yPJw3ubtMh5awwr4N52/A2
         /sVYiX3utcz3uZYTdrWFvrX1PV2GwcJSzxaAmkzYH84RiIqtDyV+IUMKK/RUa9LXzgIE
         z5xWo6iE0lo6BGmP0wRuP8Z+Ran5MLmUo/8ROHI1xWn2QUyQ599kOHmaBFHTt/aCX1pd
         HoU7p5ANhE8UjvCyl8qqfNKq1AKuUQ9aL86dwmQ0kYAs5uLBdUCtI6Zr/tM18x0mPXii
         vBtw==
X-Gm-Message-State: AOJu0YwBWNwuBW0KM2OuxK98jgNSRwpYz/TsVcNrfkvegRrYDTTzMI7Z
	5OXrmMv6KWWh21brppvTLTmfCQFfZL3E/lduJOJiu4rrd7Z0WOcN92I35DYxkA==
X-Gm-Gg: AZuq6aLdmR/A2xgQ6qh2HJbQ08E/ZCcy/2SFYtme0iuRsOYXPKiLECXqeY5Fi3Tux23
	xRhxhbOjrvP7Eb1uxn0um2Rlsh+TUWD/DOP6Qe1OifaHYdQSU8tUntZFQ9KQr/JToRwERYjrZOW
	GSj6oDAEsSCzWdJ/ujbZqU1YJvGdTBrBiBnlcgPCJvgkXKtzPcF7LFGOP+cOVfSUyjuengPgqwQ
	Jjcrn9TbAn3uRpiALwSxURmHV3cBwuv134rrNX6lPM47kAXDKUWAldqF4pu0vZdO43IENXrIxs0
	EA7Kx1penMkq2vGZG+32quUw4QmmN80sReod48RfBOYf8oN9uLYzUlccUsdAmWYmWMXfLoGaGAy
	WFO/D7s7E86uqYBq+IR5xnlXr1ED/MKAlfsX27XWKcrJVX6oLa26rQbN+HlpuzwWX5225hpo9sN
	sHFOhCxmOR7Cv61dHHqcx4v6yp61+hQCUtCKuCDnOLshnC1+NzHaxaSrGA8BB5uWCz
X-Received: by 2002:a17:907:9803:b0:b87:7430:d5d7 with SMTP id a640c23a62f3a-b8831b40942mr252088866b.9.1769100465342;
        Thu, 22 Jan 2026 08:47:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 05/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Thu, 22 Jan 2026 17:47:20 +0100
Message-ID: <58a7723ec48d84b91fd4730fe3ae653f55a0fd99.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8868C6A3DF
X-Rspamd-Action: no action

This patch is based on Linux kernel 6.16.0.

Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
interrupt tracking introduced in part 1 (for producers). According, to the
design only one consumer is possible, and it is vCPU itself.
vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
to the lack of functionality) before the hypervisor returns control to the
guest.

Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
release semantics). The consumer must not write to irqs_pending and must not
act on bits that are not set in the mask. Otherwise, extra synchronization
should be provided.
The worst thing which could happen with such approach is that a new pending
bit will be set to irqs_pending bitmap during update of hvip variable in
vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
be lost and just be proceded during the next flush.

It is possible a guest could have pending bit not result in the hardware
register without to be marked pending in irq_pending bitmap as:
  According to the RISC-V ISA specification:
    Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
    interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
    is an alias (writable) of the same bit in hvip.
  Additionally:
    When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
    zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
    hie.VSSIE.
This means the guest may modify vsip.SSIP, which implicitly updates
hip.VSSIP and the bit being writable with 1 would also trigger an interrupt
as according to the RISC-V spec:
  These conditions for an interrupt trap to occur must be evaluated in a
  bounded   amount of time from when an interrupt becomes, or ceases to be,
  pending in sip,  and must also be evaluated immediately following the
  execution of an SRET  instruction or an explicit write to a CSR on which
  these interrupt trap conditions expressly depend (including sip, sie and
  sstatus).
What means that IRQ_VS_SOFT must be synchronized separately, what is done
in vcpu_sync_interrupts(). Note, also, that IRQ_PMU_OVF would want to be
synced for the similar reason as IRQ_VS_SOFT, but isn't sync-ed now as
PMU isn't supported now.

For the remaining VS-level interrupt types (IRQ_VS_TIMER and
IRQ_VS_EXT), the specification states they cannot be modified by the guest
and are read-only:
  Bits hip.VSEIP and hie.VSEIE are the interrupt-pending and interrupt-enable
  bits for VS-level external interrupts. VSEIP is read-only in hip, and is
  the logical-OR of these interrupt sources:
    • bit VSEIP of hvip;
    • the bit of hgeip selected by hstatus.VGEIN; and
    • any other platform-specific external interrupt signal directed to
      VS-level.
  Bits hip.VSTIP and hie.VSTIE are the interrupt-pending and interrupt-enable
  bits for VS-level timer interrupts. VSTIP is read-only in hip, and is the
  logical-OR of hvip.VSTIP and any other platform-specific timer interrupt
  signal directed to VS-level.
Thus, for these interrupt types, it is sufficient to use vcpu_set_interrupt()
and vcpu_unset_interrupt(), and flush them during the call of
vcpu_flush_interrupts().

As AIA specs introduced hviph register which would want to be updated when
guest related AIA code will be introduced vcpu_update_hvip() is introduced
instead of just open-code it in vcpu_flush_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c             | 65 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  3 ++
 2 files changed, 68 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 3777888f34ea..c078d595df9c 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -171,3 +171,68 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
 
     return 0;
 }
+
+static void vcpu_update_hvip(struct vcpu *v)
+{
+    csr_write(CSR_HVIP, v->arch.hvip);
+}
+
+void vcpu_flush_interrupts(struct vcpu *v)
+{
+    register_t *hvip = &v->arch.hvip;
+
+    unsigned long mask, val;
+
+    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
+    {
+        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
+        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+    }
+
+    /*
+     * Flush AIA high interrupts.
+     *
+     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
+     * now.
+     */
+#ifdef CONFIG_RISCV_32
+#   error "Update hviph"
+#endif
+
+    vcpu_update_hvip(v);
+}
+
+void vcpu_sync_interrupts(struct vcpu *v)
+{
+    unsigned long hvip;
+
+    /* Read current HVIP and VSIE CSRs */
+    v->arch.vsie = csr_read(CSR_VSIE);
+
+    /* Sync-up HVIP.VSSIP bit changes does by Guest */
+    hvip = csr_read(CSR_HVIP);
+    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
+    {
+        if ( !test_and_set_bit(IRQ_VS_SOFT,
+                               &v->arch.irqs_pending_mask) )
+        {
+            if ( hvip & BIT(IRQ_VS_SOFT, UL) )
+                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+            else
+                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+        }
+    }
+
+    /*
+     * Sync-up AIA high interrupts.
+     *
+     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
+     * now.
+     */
+#ifdef CONFIG_RISCV_32
+#   error "Update vsieh"
+#endif
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index b8178447c68f..fa083094b43e 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -136,6 +136,9 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
+void vcpu_flush_interrupts(struct vcpu *v);
+void vcpu_sync_interrupts(struct vcpu *v);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
-- 
2.52.0


