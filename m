Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G/7MLZqJmGlsJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB216940E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237336.1539722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDy-0001M0-Vd; Fri, 20 Feb 2026 16:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237336.1539722; Fri, 20 Feb 2026 16:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDy-0001Jq-QM; Fri, 20 Feb 2026 16:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1237336;
 Fri, 20 Feb 2026 16:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTDw-0000Q4-SQ
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaea89bd-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:23 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48370174e18so13579565e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:23 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:21 -0800 (PST)
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
X-Inumbo-ID: eaea89bd-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604362; x=1772209162; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kLRmTM6oplx9Q9iY0GyvVxh5tBWM0eKNh9+e6RhQFU=;
        b=X9lulydD7EabLKOHfTb70CevckIMbgjL3X4pAEZGc0M8MfBXpTCnN7o78WHSE7NqrE
         vEyPtIEc4FdxZjYLVj+rHe3EIMz5+WC7km0qaifH10AvAM6IAVhzzdQaQmgshzscylom
         mrHJkIly/w+xf4mvVynt0ASm0+ICE6JHWEX0m71pkRGU9rie6wypobKPFqeHTyTAjvHa
         Yka8MHlW/7TuopLY5eV26rJ5jbDUvOfYsMvSNxyZ+ZwKFc0B7veAtEGOmLUDvd+bVhvf
         7lL8jec44eRqlPkL1Uas3wrHd6GlThncXANA/qfj1V1YqebFZkTySZ1rzerHiwEAogPr
         VMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604362; x=1772209162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9kLRmTM6oplx9Q9iY0GyvVxh5tBWM0eKNh9+e6RhQFU=;
        b=LgYZX7hXYdz3UjvhJo8xW/K5kQaSpwLBWzw6/sPcKgz1sXN+igi3fkajRX1WwJPgMZ
         qK6ZaTeIvYcFmVm+7Vbzlur28RDGJ0SwaJsdlI+pZfwpRnwP4P0No9lTEqP/3gkgu5Ku
         OeWBjuVz8DblozgX9b00xVtcvdy62FYHWM59pqQgDy7IJaWwWFcsM1eCebiIcWSjLAL6
         0dDBF/sx8MqY0X2KmXM4mExFT0W5EPYuPmoBmom6eUlpgR7paiCeHO4+M5AcUmOR5600
         LCEnAfxeynLq/2ydiRcZQrhdXe6ZpCBi5TTYD52sIvQnUihYtRI/fWGoN5+d52V9giiO
         Rd+g==
X-Gm-Message-State: AOJu0YzfI4iJQzO8RmAXWDyWFinjRNJ9wnsot0HAE3FdrwVbuOqrz3sY
	ZpEB7+BVu46G2GsCMfPM8aR/KjM4BoTwCdAf4TKKIb8VnaEERfW4jQAubjIKgQ==
X-Gm-Gg: AZuq6aIoU+Ok082Nwo5s0qtcTMugg1BdiTJyuAxv2lhVw8adXGY6D3lIlwAjxYwxEdq
	R7DHp+rhujVed2qscszZfdFT0Zry+zoqIsyvS0C8l9fMSzcN/NPGAAEY1HEZPHKF+OhgjhlW2R8
	BzlhLlpWBKES9FyokUEVAAQgPoZeQRov3JPqwuvPfoCBmi3TGp52d2fADMShAfGyZN5G3uCZiiI
	ZMdynb6tTWZvW+c0pLTS3jrKVjN7EY0pkNKlcT7hB2TqWRFVcCUWjQ/fm9lmovxAGkr4Crm/UfM
	KcJDhXeNtfr3IEGXMWS1Dv222iJKxdblNcdzTTuViBGr1D+UHNZmrNjcaj8frdgvIIsa9AJ5DWZ
	KFI/6hOlD+Gu5XGYikrgGboO8roSFRm5/+9zbzYu8PzqXy/iEzheUoYZsvjM1glxxlXiq1IonSj
	xvIxfnCPxIlsCUpLbJDEw/JjtX8AgJCA3UNj24Jc9F7/KxMppiRlzDeWeS3qALdBc9BA==
X-Received: by 2002:a05:600c:6296:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-483a95c6774mr1480155e9.9.1771604362296;
        Fri, 20 Feb 2026 08:19:22 -0800 (PST)
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
Subject: [PATCH v5 04/14] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Fri, 20 Feb 2026 17:18:59 +0100
Message-ID: <0d8d0f2240806a4bfaee4c5f395d6220ded00c18.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: EBCB216940E
X-Rspamd-Action: no action

This patch is based on Linux kernel 6.16.0.

Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
interrupt tracking introduced in part 1 (for producers). According, to the
design only one consumer is possible, and it is vCPU itself.
vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
to the lack of functionality) before the hypervisor returns control to the
guest.

Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
irqs_pending_mask is performed only by the consumer via xchg() (with aquire
semantics). The consumer must not write to irqs_pending and must not act on
bits that are not set in the mask. Otherwise, extra synchronization should
be provided.
The worst thing which could happen with such approach is that a new pending
bit will be set to irqs_pending bitmap during update of hvip variable in
vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
be lost and just be proceded during the next flush.

As AIA specs introduced hviph register which would want to be updated when
guest related AIA code vcpu_update_hvip() is introduced instead of just
open-code it in vcpu_flush_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Reorder the defintions of local variables (mask, val, hvip) in
   vcpu_flush_interrupts(). Also, drop a blank line between them.
 - Move #ifdef CONFIG_RISCV_32 above the comment in vcpu_flush_interrupts()
   and align the comment properly.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Move defintion of hvip local variable to narrower space in
   vcpu_flush_interrupts().
 - Use initializers for mask and val variables.
 - Use local variable c as an argument of vcpu_flush_interrupts() in
   check_for_pcpu_work().
---
Changes in v3:
 - Update the error message in case of RV32 from "hviph" to v->arch.hviph.
 - Make const argument of vcpu_update_hvip.
 - Move local variables mask and val inside if() in vcpu_flush_interrupts().
 - Call vcpu_flush_interrupts() in check_pcpu_work().
 - Move vcpu_update_hvip() inside if() in vcpu_flush_interrupts().
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c             | 30 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 335c41f3e5a1..636349c8c7e8 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -215,6 +215,36 @@ void vcpu_sync_interrupts(struct vcpu *v)
 #endif
 }
 
+static void vcpu_update_hvip(const struct vcpu *v)
+{
+    csr_write(CSR_HVIP, v->arch.hvip);
+}
+
+void vcpu_flush_interrupts(struct vcpu *v)
+{
+    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
+    {
+        unsigned long mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
+        unsigned long val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
+        register_t *hvip = &v->arch.hvip;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+
+        vcpu_update_hvip(v);
+    }
+
+#ifdef CONFIG_RISCV_32
+    /*
+     * Flush AIA high interrupts.
+     *
+     * It is necessary to do only for CONFIG_RISCV_32 which isn't
+     * supported now.
+     */
+#   error "Update v->arch.hviph"
+#endif
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index b7241f2a79b1..2a454bfc083c 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -116,6 +116,7 @@ int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
 void vcpu_sync_interrupts(struct vcpu *v);
+void vcpu_flush_interrupts(struct vcpu *v);
 
 #endif /* ASM__RISCV__DOMAIN_H */
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 551f886e3a69..244264c92a79 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -175,6 +175,8 @@ static void check_for_pcpu_work(void)
 
     vcpu_sync_interrupts(curr);
 
+    vcpu_flush_interrupts(curr);
+
     p2m_handle_vmenter();
 }
 
-- 
2.53.0


